Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892DBC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 02:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zb9SWCuOync1aPIWmtKNWNjb9GK29sORKjr5cg36ujU=; b=xPoFb99RZDNYVi
	aHUXkyb7VQkO/s8YfaxJtLPqMEUxi5A91FMQ7xvhCcGN27kIG/qOWtuFUobG/KzNdQ+xA7Sqs0ZHA
	kqhAnfcu+QX6npU2IdBLaRhJHM9w1P/vcZFgBNPdhbrMyoaUKrAujW1KjNahG6nQL9yG/EYRT/5+X
	0oKXfitH9hraboIM6QJjYwN1LNk6AAFUJcv7xdPi/8Q7mbY4x1upgDuhbGUusYootEF5dkBETQKWX
	lFyHGNXcnFRvghU3rCp3c1j6istm1DZzhH3VeWem5jaBA08hi0fg8V0jWsf47c3jP+EIDuSHBB2cL
	rZS4TL8DRKn/LLlKhonA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9Uz-0000000A0Ni-43UE;
	Thu, 03 Jul 2025 02:16:29 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX9Ux-0000000A0Mv-2U5i
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 02:16:28 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b321bd36a41so4516057a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 19:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508987; x=1752113787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=XBlSB4Kc4LA7973jaMHCK5UZ0O7QH8eOqgDrnU48SvRe8A8VzbYk+P89vVKdzTK5Gb
         x9sW4IBNApHvwacRFlihrH/ToM+Z2vCxjuBmMrpA5UFVia8mf6Fr68V49605CSnzmq4J
         B4xAPB9HuLj88R7/7xCCVXv5uE9MzmVSeJxiZh5RA5NlAda8ymGuyq4i2Dfq3KCd2KOB
         +hIZYqJ783A1qAb7At48QpEkW5PeoA9A1nROrv+HjvDNL/M6C2lKIVPghmYsrsB73RVU
         Tk6vGLhdzwolH2s5CHPf1TZ2vIjgDlH374XpzQvF4sRiFoV2kUgeNCy/wTaqOF62Wyge
         95WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508987; x=1752113787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2YnPV5R9z5TbfIfu+epngB5XBVjG855v9YBWyemiuo=;
        b=ZFebcZiUrkT7vpjkkLMAvals7ht4mQEmtMc0cZCWHdg3cy2LmFTf8hUeRg1fgDJdy1
         O6gReSI6mi+ILggoo31N5fmF9D5d0urvgFY/c4BnbV5ISivrFDyXmf3ivCx0ekQwVwG7
         5J0YM+PDkH41jDsF0f8jwMeU/ZgwrMt2dIMzjLiRdHo3uBc37X6TMJvvSUFNeLW8GHd2
         SnTfkYwsHxnhQZyAeICj7I1jaM5Kh6gYDsI65k+ISjc3DN1tk00HgOAMBFvA6vXH7FYK
         5bxZoWaAEACCENCVKZaZKVvDP4NlPp/DYntLdCi8+b/HBYVbVfmTOrbjQxcVV00H19Aj
         VQpw==
X-Forwarded-Encrypted: i=1; AJvYcCXSSE/fVTKx2puRfnh9tHppcMY4TcvCMz5A2jeYWJ+us2S17t3oTadtL/Ek4ROFYGhFwKRJOCaRr/xkgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX3YKam5lUm0DGC1EjQAh5p5qPy6EDN2XERFNL6R4Kx9ArOpSJ
	TLU/ClPqZjl3/NCwGEBUNa9OYO7cPuEdZRWKMCJvBrC2tNzg1P69ev6V
X-Gm-Gg: ASbGnctj5HZ1t/R2OANRobqZRBER79jHQQeh/mzATzQMHX+p0ysYVq+rSU+eid0j09g
	y+h0O6rA06kwkdGf5hNihQu/teeKo4e4/zbOwXXzkFqxKd31DoAjwf1mHZvOcp3ubLtO++nQeQG
	JQISCYtblRs2nwTEJGSQi6MKdwpvINwKYw4shcR+3kixtJVTCGp6V+EGBpJ7AZmRrQDZDtDhFNe
	7eLE1Z4CV9q5leAj7CtIe4EX86W0rwCOESXqD/ZMyoeD/JOVrzTZ5SkXtptr9dctYMzxQAytsoo
	dJVBDovTBsqA42ETdGdkGKHrlfzVQpkyPvrgDOppNAUfWBw6jbz451gMCjaGuB2X789MPOE9
X-Google-Smtp-Source: AGHT+IHSEMW9eiJM2jAiH3yvHUFxCLUuLck/E/k8l3c6BfFYTR43saftR5J6mphdwx+U28fhcLnfZA==
X-Received: by 2002:a17:90b:4a4a:b0:313:db0b:75d7 with SMTP id 98e67ed59e1d1-31a90befeb3mr6810465a91.27.1751508986742;
        Wed, 02 Jul 2025 19:16:26 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31a9ccf86b3sm928863a91.30.2025.07.02.19.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:26 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Thu,  3 Jul 2025 10:15:57 +0800
Message-ID: <20250703021600.125550-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703021600.125550-1-inochiama@gmail.com>
References: <20250703021600.125550-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_191627_625858_9940F0E7 
X-CRM114-Status: UNSURE (   8.36  )
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

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..3a82cc40ea1a 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -31,6 +31,33 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};
 
+		mdio: mdio@3009800 {
+			compatible = "mdio-mux-mmioreg", "mdio-mux";
+			reg = <0x3009800 0x4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mdio-parent-bus = <&gmac0_mdio>;
+			mux-mask = <0x80>;
+			status = "disabled";
+
+			internal_mdio: mdio@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				internal_ephy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <1>;
+				};
+			};
+
+			external_mdio: mdio@80 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x80>;
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
@@ -196,6 +223,8 @@ gmac0: ethernet@4070000 {
 			clock-names = "stmmaceth", "ptp_ref";
 			interrupts = <SOC_PERIPHERAL_IRQ(15) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
+			phy-handle = <&internal_ephy>;
+			phy-mode = "internal";
 			resets = <&rst RST_ETH0>;
 			reset-names = "stmmaceth";
 			rx-fifo-depth = <8192>;
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
