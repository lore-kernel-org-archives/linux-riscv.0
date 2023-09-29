Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C3DE743D5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 00:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrlEzvAJCd51Dgl/G1uZg4XBJZyY+kC4Wqe4UKM/RcM=; b=wVA+TA7p18ocVy
	x6s1OF1UnaobOftGtJPPzdDqwzqowwvKhLm++ijrdsjzI/nAzOwOxU32IxdKlwCTHsavWWRL7z/mp
	oEHd2Jbun2YgKMWMkoY2R718LuY1PVD+flzdEDN3RR/7Fm9ZmFqZXH1YGyKhymAVctzz8gjlfnDOZ
	EwgW89fOYWqzdGjBO/35ZxuLqB2Pn/VNUyvjQv/hacewYxpgejAEqm1d1qQYF6yN9qAvusRX1zdFC
	QlVf0epzOSA2pdg8ymg+ckPYc2MRUweoDdRWCBOhiLnIGpFsIXkuENVRZVi1zeOWDH8lIfeG/tZdk
	mCqukl45xBq61/C0Fqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12n-006tmu-03;
	Fri, 29 Sep 2023 00:07:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm12j-006tl0-2y
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 00:07:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40651a72807so13284595e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695946059; x=1696550859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg6m2EjjbiYtqCsw8AOrTuHGKcD7Fqnb3Sq4Z2r1iXQ=;
        b=iPLuXFURtxQVfZFD+51KoLRiNjKyoJNsQ4QjcaVj3y78i3Z04UkCWiTMwnlvAzercH
         u1G1GUmfsoYDGryVsUZn5LPue5r/Bm+OpTkzzlM6e3UV3mS+zKMwo2BznNUCZiEijo89
         QGdjrbeAjHRQj9NCDosq3mXHTGA6NxARu8tCDWrWnB6JtrhrrFCjnF0Ein61MW6rvv1/
         cO4dyUql8HusnUWAeNa4uQPJcRdVfjQ+rHa5gQ9fZVtqW8o6dZkSjhHD5emRlmeFAQM8
         gROUui3NtELNLonU1pfHo/jwkF+tFDHcYfN9YYAkKXDyRGnokHJgeN4ujtVP8t5knlEU
         Eq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695946059; x=1696550859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jg6m2EjjbiYtqCsw8AOrTuHGKcD7Fqnb3Sq4Z2r1iXQ=;
        b=r7b4to5gkaI8JdHj41FHFcVeYkV4ujMAHi1AdV0hb+aZ0E+YMAjLuZjj4nUPvpaT3F
         H/Iry0RLX9VESBgNQtfIT+2Vgmb7uMoOj9GCK6VqL+ofcijwgGXdQDLbqCoq5XGIG2By
         Y6he223tBM1NU0d7NLTd7K8zIzAAk0NiFFv0ATisZ+bnhzGkH6XCCb4oqxdHPuJJILdN
         TA/ax2+0xb++PyNAmTwUYv5t0fZ2un3Rocm4kNY6TpLm4sXjPldg5Y4zkW6AzOvFXmbb
         3wfjEYwqrCkv5FU+ZQ8cFFRc/9bd6ldKDPqDXBYSP6oKNIAEIBxhUCg+geDB41Ljs8CB
         ZWCw==
X-Gm-Message-State: AOJu0YxL5aERQaRxVFWZle4F1KEbtWM+WyRGDVbsJij/xI5ZdOxsUiqv
	yOp4r2vupEtyo/O0RoKARv0=
X-Google-Smtp-Source: AGHT+IEGAB6L//kDZLyguasSEjhI9XkPX5IsinA20g0k8iBjOCXCgphovzf/UhPDNxE5yXRjG9y0JQ==
X-Received: by 2002:a05:600c:2242:b0:401:bf87:9898 with SMTP id a2-20020a05600c224200b00401bf879898mr2654028wmm.25.1695946058991;
        Thu, 28 Sep 2023 17:07:38 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:fe98:5e2c:1821:4cb6])
        by smtp.gmail.com with ESMTPSA id y20-20020a7bcd94000000b004030e8ff964sm245667wmj.34.2023.09.28.17.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 17:07:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] riscv: dts: renesas: r9a07g043f: Add L2 cache node
Date: Fri, 29 Sep 2023 01:07:00 +0100
Message-Id: <20230929000704.53217-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_170741_960735_F534C049 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add L2 cache node for RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index 6ec1c6f9a403..c8d63a8f7d86 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -29,6 +29,7 @@ cpu0: cpu@0 {
 			i-cache-line-size = <0x40>;
 			d-cache-size = <0x8000>;
 			d-cache-line-size = <0x40>;
+			next-level-cache = <&l2cache>;
 			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
 			operating-points-v2 = <&cluster0_opp>;
 
@@ -56,4 +57,15 @@ plic: interrupt-controller@12c00000 {
 		resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
 		interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
 	};
+
+	l2cache: cache-controller@13400000 {
+		compatible = "andestech,ax45mp-cache", "cache";
+		reg = <0x0 0x13400000 0x0 0x100000>;
+		interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
+		cache-size = <0x40000>;
+		cache-line-size = <64>;
+		cache-sets = <1024>;
+		cache-unified;
+		cache-level = <2>;
+	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
