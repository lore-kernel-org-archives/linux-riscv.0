Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE630C369AA
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 21:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LG3slYx6eIb6mSZEGcawHjFcIRNEM2L5xjTR1TYQYdY=; b=XOd+BWoSP09Ynw
	yuYgjeKcIVY8o+K8waPNzVvTQLfH5/CGP7HYiFWkNv49CYGDBxpZfYFYekSR7DUgeHCU4LhuvycPF
	efaJDuNUCX8kFWcduMVWAlMnIbGz4I7aAO6IL0Tz+Qd0KeVmMX6HiwvfUuB0ftQn0UykP0OMOp/cu
	PPOR9eZr0l69n0KbU+nx/LokQMDL4Q7rZeJpE3/RhVjVUEIzggGJMFt7nOsNmrrTXW22Pxh/VPTtU
	as6cqIdULR5hAP3M76pucJlUD+ei6uoEn9VF82r8rB6NWDkrbl0U5iCb3An87UX9taFYHKY3Ahve5
	3Dkc8e+mXY4Oa7fBm6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dNY-00000008dru-41dz;
	Wed, 09 Apr 2025 21:54:40 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2cnz-00000008YdH-2Ejh
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 21:17:56 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-85ea482e3adso40882939f.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 14:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233474; x=1744838274; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=cMZm3rSykKqIy9fv2z9sytLiiZIBG58Hz/iw2ika8okT+H66KgDl3S5/FmgNRYonDW
         gO95xx0LZcIKCdVForrcjUfJfDjaRE52kNdrhAu7Oth8idgV6bm1omZ3KRVUQTf5Nh30
         tFgufzTWLWE9teWVw81vr3aThyLOmjJo3/P0XpRROIdE2oTv28SEXuu4nS43izvF5iKf
         RkvBsYkJO5w7+DelG+cFSQ0cI67OlunOoxaBQR3XuwWPe1dkTwoENqu69ZnjViVXS9eB
         7aLINBw+zi250FJEvVKRDrbgNdigBeA4JEhvaKfm77AHM7fqbRA5i5Q2kQnVDWB6Uy1q
         IhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233474; x=1744838274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoPF+bCrpMBavT+34w02cPZ0ktfHw7A1w/wlErW18/c=;
        b=BiRwdUK5fCFi7fmkVC2ynccZnZ1Yps316XoZwNV+hg1G2vWdhUT8rNYYdddXjKzCk7
         vHMApb659NU50dk0omNBjUBden68Vwns+r4evOCN9PSqVBxb2FrcmxWtAWQY1JmLZSVc
         PzlGFzrzhro5q4ABC4zJOKMyX6SEPqc01XTzpo4pLI4VIzODhhx+mhNgJGJXdl9RkbMm
         SdARn+IsHmF4YxYSqMezobxt4+ybRlyMfEi9TGz0WTnn8z+e9+7+PCjasMZ0Belb9Knx
         33lYIn5yrmgl36vlllROk2/AgVVg5pCogsXRnjRjPgn8w+Fj+R8Eh+wnY1TOtaYWam+O
         yetQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmO2RM8FlnwQsIVIkJUAOY66ggiO3H3mBvLiz3PFJLvUv4rYGORwSci5dEBmmwdbIASUrjDQbWfpHz9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwflPZVLUMHUD1wPHsPiq2WrVYmCH08MNmNx+OVfDW4DO9NHh1L
	/g+CBELbaHbLLcIs50N2TW4JTLngWxoFGCUM1Mosw64MpjYN5Kru4LOuwBTQvCw=
X-Gm-Gg: ASbGncvxG6Xa3+Ga9OJ5it441sb1H0LQueLUYAHaxGAsVXMEPYiWjYsqXToOpU3Z48o
	w0Xv6fPYUMEFfgpBRYtzgakt3B2oB21sWY5e06aA+BlTv4YX7OVehqc67QQ66aZA5ibrDe4aLYb
	CJSCkntKbyKekBnAkdtT1G2dr5768ZuoYnTbrjaZ3pUXE1qIduAIoLdUgZPCtAaktKFaP7AxVPf
	KTDOePTtkScb08+9saxFMs5kAzAEUFZwsQNI28/wJoqGGtxU3Ol3O0ydo18kTlUSWcF1zlpHfx8
	wS4hxzyiIVlq8jk8vWK6BCiOstNiZXYmoTEUzmBxjVFBccXZuGQ6BIFu4pR8Z2oSM71B1yPEyVg
	pjd3Pv/J2ec/CZw==
X-Google-Smtp-Source: AGHT+IE2EFUaAUGzZqdq2RH+minAxPrbtolq6/W/NBIYcCuS8He5fK97oLjQC2cX1JOUkUtoZzh2cA==
X-Received: by 2002:a05:6602:6e8e:b0:85e:16e9:5e8d with SMTP id ca18e2360f4ac-8616f206ec2mr29618639f.7.1744233474607;
        Wed, 09 Apr 2025 14:17:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Wed,  9 Apr 2025 16:17:40 -0500
Message-ID: <20250409211741.1171584-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_141755_569043_20163CF5 
X-CRM114-Status: UNSURE (   9.15  )
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

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 584f0dbc60f5b..491ab891788b8 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -514,6 +526,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
