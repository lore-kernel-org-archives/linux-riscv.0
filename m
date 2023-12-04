Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC7CC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEj+bmLMTTPzePFsGGkNDDSVWydirN/80b1oEcyUeA8=; b=PAflbSEGYQwFuK
	b4NDnH2jx0tECpSXfWO41HXhRUGIEsicySASvg75nJG5ELL9EUfqy8xJ3cPfHy6kSsN40W4PEGbY6
	MKH580i79gZsmco2e6zQLPRBjrmzQocJ/XPQPxlQh6yBiQ0IUKiKVyFWYs0CnVQjbu9cagzXXPg3Y
	FrLPZ88ffAN9NBcIjhkiSMZNTvhuDXc5G1A+3SBaMFZ71vWZDxrPRthLDYQ/ra3cL32BuCPGmiTdD
	dj5ifwxeqRDEzyeOjxK7ln66le35HGCCQp1zzSW5iAKuM9ojhVKgg80NN1d4kR1v2O0KOdUlEX3ow
	w/7sRDWanhoZDHNHeqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8Te-004Gt6-1D;
	Mon, 04 Dec 2023 12:55:10 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA8Ta-004GnY-2m
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 12:55:08 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3b8b463c7c6so1050631b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701694504; x=1702299304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp1QQy4nHJOCAUXp1K0aSSWLaVTSFOXyfLRKjezIxlk=;
        b=bPL4eJZDiex4u+waIB5uyEfrseG43PECD645DDz2NsHeJaNK/m/Cz4Vgf3T/rlL0sA
         5ZWWdiNs5gicR4KNPBBpR/zcV8fi89IxwnqoCtA3PBh7oaH32JID1NXX8Jd9HBpxA38c
         wTMmer1q1YzCV4NO5+uFRDPIjHD6LrWs8/UonrbyeK1mCK9AHDNjKRcOrbUZYQcmXXQb
         1RZIzIZ0VqDO/Abzr9Zq4jtLgFJC4zOVt+ocOLEUMYHR3UNu9YyN8b5iPGV0leVdUVtH
         1njPZZEB4SGP1l5XUMqLwae298hKYSmh+L7iuuBpV+CTZu1Hj47QULEOPvHTjrkvUP0w
         L87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694504; x=1702299304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fp1QQy4nHJOCAUXp1K0aSSWLaVTSFOXyfLRKjezIxlk=;
        b=ixM3dGmX1reOmrUjftD6XpZdVTzeea4Mx9klApcLmMLMeSD5WYaw0YXErPJWdereei
         nUQIy1/m3untWENxETxiV3Ho1PmFMfrEFZqMxXFotfbnj1iTSuqNP6u8CadTJ0KNeiYO
         ixdK751LBCAdVSxITPOb7ROJaTsat99BnwnuZPHEwwR6kFx4Sllb8x1uK0WTAoqR/czA
         DwkknhYGS8mxI0xowq4CbJCCZoyfxYRVF+IoDnWw4Y6Gth3Uq+4h7eJwt0/g/PIIob3D
         Ha7XKAiJXGRGtQLthBtK2u1sD0/g4CDyEOnIXjArKFBP3tBRzD8ingavzYhNREqtmPlR
         f67g==
X-Gm-Message-State: AOJu0Yx+sflOip0v+liCVpo4hJCXixDI0FEP3WMpPIFQzWgiwLbM9ZN9
	IQ26+Q2m723fhjXgxFbGmik=
X-Google-Smtp-Source: AGHT+IFVm0R8UCnK8yzexeBkJRvv9sySXLrOfNZKlioVDEQH8/yrXtP/d5bGH9S4SS1NjKQjEdbLIA==
X-Received: by 2002:a05:6808:914:b0:3b8:643e:f09b with SMTP id w20-20020a056808091400b003b8643ef09bmr3855506oih.54.1701694503712;
        Mon, 04 Dec 2023 04:55:03 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 13-20020aca280d000000b003b8b262a347sm1089986oix.7.2023.12.04.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:55:03 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v3 1/4] dt-bindings: soc: sophgo: Add Sophgo system control module
Date: Mon,  4 Dec 2023 20:54:53 +0800
Message-Id: <14616bce163d689a4e640ab7b372421ca8306a92.1701691923.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701691923.git.unicorn_wang@outlook.com>
References: <cover.1701691923.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_045506_898962_40C36E50 
X-CRM114-Status: GOOD (  12.22  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add documentation to describe Sophgo System Controller for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
new file mode 100644
index 000000000000..cf4b4b5a6300
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 SoC system controller
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+description:
+  The Sophgo SG2042 SoC system controller provides register information such
+  as offset, mask and shift that can be used by other modules, such as clocks.
+
+properties:
+  compatible:
+    items:
+      - const: sophgo,sg2042-sysctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    system-controller@30010000 {
+        compatible = "sophgo,sg2042-sysctl";
+        reg = <0x30010000 0x1000>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
