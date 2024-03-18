Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A814CC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZTJ8gm7+SvtMbWdj5FipBM/3otlkgk7Nt3Uh6bg3fw=; b=tnMfPGoAd/reI1
	WewmI8GQCXB8D/edH602HOFm4TrCTT4nQYAmHThaJ1+zf8oes7ln3sN8CSbagha4sTJKeIrtW8Rhx
	ptymWa8baJn2RW3w2piEMuUnLgE7CxoiKrKxysHHKW62Hif47cyzlgujN7GbQrax2dI9AqC9cV/zd
	yQENLuEE4LP5KEHvaKwWas3YrCrVPiHDcOxe17bIZzT1sHmCS+HUQ+lP7EvdHotceseliU1XZb1e5
	yxL1uOmUSypfvR8zGQO0QBKyo4rXx0MUa+e6shC8caKz741nM5e/6Wao2GFvf+At5CjJtgyQj3bni
	2a38/qeT2lAo/HexFnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPm-00000008B41-27eJ;
	Mon, 18 Mar 2024 10:40:22 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPi-00000008B1P-3dbF
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 10:40:21 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e703e0e5deso1444961b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758417; x=1711363217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=fkHLMj/LwCWyh/Z/TwaXEKt5XkfNcoELU1PIOSaj7UrzoRjPB1kwfaqhenuk5+KPb1
         6Cs7hodNYxhQfHjownps5kR5SXzYn9jsvT8JIhMqbah1ExUfHeqxLhfF2LNzR3RvPA3U
         QqkmGRbIYct9axTz1leZ9oDsGaQDslfJO4g0lIY/5NSSYDLlZvFd3MiKPxX+ELcRC/+I
         8FMrCpz1URngla+5HdI0PiVF4I8UJzQ8FF0sOVt1VJ6R5FRdzwKuOL6ZKwty8879u7MS
         LUl6l+4Qfh62Uv7z43TE73WhY5qj4SElqAFAlu5bMiNODbZvBK399jTn3HIYEjHWufJC
         Dalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758417; x=1711363217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmjJM7prKhSJUQ/iHjZSKFVAIwCvyZorqbvL8NpufQk=;
        b=cs6CPm/4C1o5h2mB8T8QYdNJdC01O67ppGgx3L8KLazD+3/2urPrdwG8sbOTMk838y
         lxMZpOiM0jPGw+p/WlzEt646gip0YvO5KI0/KXaEGUQgfqt74Irzeia2vQwhA2LOpS1p
         cLZKeCVY8+gBTxpTFpB5BMFkp7fxYVvNaHrCEf7VrkH6ALO7HvDk0vGKO1bXBf61jjrs
         JWl0q7d632wabyN0JmrPAFYefa34VUALOOW7CF1b12GbSLa9YgYXMOPCawU/zOsgnPFz
         y55Ci8pOlwD+o1kwRR1NjJgE1VQLDfq8gq8GNLYH7gJfNhc9BaOjYgxrvuDz/SIS6e8M
         Yg5Q==
X-Gm-Message-State: AOJu0YzCZKShEFpol0bqiT1bzUbBkcYIRWQB/pLFLpDv/z1rneFwXtjT
	K0F8S8Cj13gHHySMMLjT1LFD+ypTvuVaIJ+nW6GvAz2flFefIBuMH9hpC4Vozo8=
X-Google-Smtp-Source: AGHT+IGA7ENajAXygIvHMDvo3jrNxFzvmQ16iQc/gXb9EOfl1njFlKoIYWJx4IXelaDE1hz5NLCwCA==
X-Received: by 2002:a05:6a00:1491:b0:6e6:a3b3:923c with SMTP id v17-20020a056a00149100b006e6a3b3923cmr12692171pfu.6.1710758417599;
        Mon, 18 Mar 2024 03:40:17 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:17 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:39:58 +0800
Subject: [PATCH v3 5/7] dt-bindings: riscv: add Zve32[xf] Zve64[xfd] ISA
 extension description
MIME-Version: 1.0
Message-Id: <20240318-zve-detection-v3-5-e12d42107fa8@sifive.com>
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034018_971074_A631A933 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add description for Zve32x Zve32f Zve64x Zve64f Zve64d ISA extensions.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v3:
 - Correct extension names and their order (Stefan)
Changelog v2:
 - new patch since v2
---
 .../devicetree/bindings/riscv/extensions.yaml      | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..cfed80ad5540 100644
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
+            The standard Zve32x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64d
+          description:
+            The standard Zve64d extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64f
+          description:
+            The standard Zve64f extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
+        - const: zve64x
+          description:
+            The standard Zve64x extension for embedded processors, as ratified
+            in commit 6f702a2 ("Vector extensions are now ratified") of
+            riscv-v-spec.
+
         - const: zvfh
           description:
             The standard Zvfh extension for vectored half-precision

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
