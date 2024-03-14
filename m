Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D02AC54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM/LWfN/4GadEYBxZYwVkstqCNSPq+m5WhAaVuCSwqQ=; b=bw06+mBBElcRXM
	T6HOtzcwIIgkslysW6JicFCtioU1WkWiQMONXv/zHW5voMnZd7Gwh6zNgnKo3gW0yQLpyGblR5Bo/
	5g8zixU0UhtFCa1P6l/DSq/Qs0GN/kxu8UDnX0TiMbT5Sx47uUucnMBjwdsMWVBEE1wdnJ4xP714c
	hIeOY4sSFQx2Crtfv1/tVyvcGveXg2MIyQ4dXK5crCB+T/pjV7LIZg2qGOrThQ1RQia9fLqUA++F2
	AVT3VNAUA5L4hEweV4HJvVf6NQzzl6tpR2WuJE637mmk+xcNBX9w7RicvABcf2Nhh8YonY4DRIzNv
	/QjQpudGHw5a+7g2lK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2Q-0000000Ed30-0Fq0;
	Thu, 14 Mar 2024 14:26:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2M-0000000Ed1R-2Qfz
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e6c0098328so915697b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426386; x=1711031186; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D6zQGUHGb6OgG29XkSi+43X7HgvpNT6gbd04TVUsURU=;
        b=XdqO6nqRC8GDrRMNRcItFNw7AkUVua1j+5gyz11dxPJ4rPd6+zl6megNzeZhneFy9o
         rlG6sH7sO5ghMEjO/t054fq8pdBwgK7fFofcEUCySMxRpkoTrOdGcSFFwA+w6iBpyZBh
         8sYaI4axobTo0VgmZ2gA7OfBA6IcAew8ZTf23jvyMgDPcfIR0fB7MTVyC5U8bX0I5XHs
         SsHjAV9XgkAetf+LolAjpJ1ov/xLxvDzo+Hsu/UdgLAUV0qw5BQDIeyHt+0vPqt7zbR3
         SzPEmATEf537yr9VToPyH0m0pV6MoT1OjFM+EBESDcKM4RBbc5aKHyJo0o9Oi86AhjCf
         MiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426386; x=1711031186;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D6zQGUHGb6OgG29XkSi+43X7HgvpNT6gbd04TVUsURU=;
        b=vx1PnirRWvrrvjU5JDMi5BCeeWYjV+XyrlUlr18psbQiLywj8jtF0i8vhSwmX7iE01
         qs9rUspEuLRcwGBWmg4V9Ih4WW5o/DZaUSNbU4jl36pdX5Dk//FtZnGU33yLr2fvA3Je
         1pHGlsS3xvt9oy+hnZi67RRIKyi1WziCoTFyoHPskq5h+dSEwFY8W6cK+j6EDEakKg0F
         EGc6wQNKnVu361xONAphlwB9BtjelPGSvRzw3axiyx5kwQ0YB9nmrXI7myvFiCqVvDJd
         wGLiktCGbuAt/QntWIVSJJRkX52cMA/z68fByC1b9ii04MvPCSTTh+ICaiONA8imzuYz
         yRVQ==
X-Gm-Message-State: AOJu0YztURP1fG8+rLcQVwiCPUcoqedZ+H8inehwxcn4xJ6iXzsXEQZN
	hmcIW+u3PsqoAf+HYyYdLlPaB+4KkWpcYJgRx0LKUzQlJ+oXJwhezB5fE+FmwaDpw/ZHeEewo7a
	fqOFmL9PV9xqkQKHwkr9hAbTv644CYHfvVMPFcnccODzmGXeRjwTvqR8dxMHMuzqMMTcSQBKQVu
	jmm9pImwiJhAAPs2vz2/YkLwNsdqTfxqgGVqzFPPR6IKK9vl+XYVtK
X-Google-Smtp-Source: AGHT+IG7LB6vjAPBerHSf0idujsqC2aOLNuXPsbOQ4/Wn7iVblmIEv3fWorEe9ipp8ol9f9hijfawQ==
X-Received: by 2002:a05:6a20:94cd:b0:1a1:8c6c:2b91 with SMTP id ht13-20020a056a2094cd00b001a18c6c2b91mr2320470pzb.27.1710426385477;
        Thu, 14 Mar 2024 07:26:25 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:25 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v2, 5/7] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA extension description
Date: Thu, 14 Mar 2024 22:25:40 +0800
Message-Id: <20240314142542.19957-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240314142542.19957-1-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072626_696182_AE8CD356 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add description for Zve32x Zve32f Zve64x Zve64f Zve64d ISA extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v2:
 - new patch since v2
---
 .../devicetree/bindings/riscv/extensions.yaml | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 63d81dc895e5..6ae50d1227d1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -381,6 +381,36 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zve32f
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve32x
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64x
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64f
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64d
+          description:
+            The standard Zve32f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
         - const: zvfh
           description:
             The standard Zvfh extension for vectored half-precision
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
