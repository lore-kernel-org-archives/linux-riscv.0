Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2432C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 22:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ThSFgZ8gDo27toJztmjyxmuOulDiOA5vYabA66tWxDU=; b=t3x6D9uACld1Kp
	O6ngvixm2/PowXHr7ZStosvfoubGu54q4X7GKO0JHmTHb16rCNC95KvBPFEoQS6j+8ISw4SzbFQNI
	rLmxH433zUfqdk2DIt9NN8Cnspk0FwYh4CTml7TV0y0mBero38Z0IoNLrX3Mp/6dGdSdiMVmm6sdc
	RsBEc8MYaKibBO23nYbzvSN9SzySybInvc05Vf7jMZXR0iNIctsW/NiDlBTOWZa/+RghmqN03LAt/
	n8Mh+EXKyMDDA/3oe1n9cxMsd8AqHGtfH+FsDBazcxUBWtgmNCYJuHK/k+uJMb/3/BhYt9kAfmHdB
	bNq/r/LzBNLT9EupFykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqjJ-0000000EngO-2qYv;
	Thu, 12 Jun 2025 22:49:05 +0000
Received: from mail-io1-f53.google.com ([209.85.166.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPqjG-0000000Eng1-3TZi
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 22:49:04 +0000
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-8733548c627so49594039f.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 15:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749768540; x=1750373340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEGtecxN4SBo9EmL2yEIxP+cEfCEUHwfF20h5d02P8o=;
        b=D8MqyryhZKgIfBUr1b4SAxruAj+Ff3LZnj7m67L9u20gc8Q+l/nM+sN9I/Q67m8coE
         dUY7B1GeT+FJD3Gt1PsdH3VbsA866nQGPqj+ir9l2zdCtsOd448U3Oer9G0UOcrQn/EU
         nU5OF+8QyR0HNXQzONWT31Cw3wA+LgmC3Gyz5pKaRcHuZip11YX40Xv4gWP4MacHB/co
         9KwBLI30lnThIHKX2Hvb1c7ISOtd36TQazu2dlt/+BO077wFihw914GXFW+MTpHeb1fB
         wpnxcntpvaWg1f3av2i7T1K6T7Ea2N6w9rUNGWI33UPHd2+mpZ283+5r6vlDIvR4frYR
         jAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749768540; x=1750373340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEGtecxN4SBo9EmL2yEIxP+cEfCEUHwfF20h5d02P8o=;
        b=mU6DEyDjz/QwXVtS2jgR2ri0hw2CeBkAzz1A5Xt6Wj9H/UV8HfTy5vP4JGXgNdhIWC
         NQ9vB1mMTp1b5FsmuBtYBUlWfcSMtgZtmaAbcGKvAREfjbfqTvZUuTj/A6ibwjRSvvXp
         weB6Nyw1bOZKf2SIfk1whPV1zbxvgGrTqqv53v560eOIVu32w0Oyu7lGTLsq3NBCFcHC
         WDi2cwbkLl139W8V5pSwHZ5KmTdvYK5yW0gwwNA+YbrybdbLTSwETplj4Yt5Ts6RPpd3
         ryEX9jNkymEO8ZI/FDWEM6iiuz5wbCETpMc91UTU2ZAyZyaBPd6asqrQI+U8sr7cVnMU
         lNyA==
X-Forwarded-Encrypted: i=1; AJvYcCXOjIzizLNyOrj5k6xHbDN44SbV6tvWo07kDH6h9yOq+CqH/DwQmL6YYhHUTjVaA2sOBQo5dpY6K1y8sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy70jxXR2xJUICaGL/hl4mMRjGLku4vbtnTzB3r5kt8UPul7Pql
	z6cM3KsHUXpInNTNFu6ZEpTrW8oF6vHyrBdhQHI0nvgCqgmRMfhj7pcis6G4y8jixrA=
X-Gm-Gg: ASbGnct67z8m9g5CnZWsxW3n7q8FGj2NpVhv/V8J8kuZNHhsDiym/u7qn1alTP4WPQq
	+sgf74Hfu2QQCaVrLltW7dKBZvOpCL5oLRTXBITrHocQg7m/D8tAKUx9gUUcEVbhm5hYYfL5MWZ
	mbTMNYeYD7Ni7D2hgh2DdIThV4ky38tTnstaEkQEMOqX6NUcjw3Q7wKgcyoihfxfX33gGlQzO0b
	hZiMTV7d7o5KqcxT291MHuBTuUWcFNhqDGLVPKg6Pq/h8Fj6iurVp7tOnMy0Hl8P6WgLnY53W01
	fkrnsYe0SYtyc/eSjd0qKh5kQ6Pg95KgNIHNA1NgvUu+Wh3cmxyd9ymE67/BHNI3/fdG09Jm305
	532sTzwZoehgWcX5Va/vpd4LP8Cs36Vc=
X-Google-Smtp-Source: AGHT+IGicmZ0hXFTaHsWzHl5I27R7PwyfJk0YzLn3/RqKtqq+OswBbWo+sqwPlM8mPpDuZ0Zd2I9sA==
X-Received: by 2002:a05:6602:3887:b0:86c:fa3a:fe97 with SMTP id ca18e2360f4ac-875d3cf8a7bmr38126239f.10.1749768539925;
        Thu, 12 Jun 2025 15:48:59 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149c68bfcsm27925173.66.2025.06.12.15.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:48:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org,
	heylenay@4d2.org,
	inochiama@outlook.com,
	elder@riscstar.com,
	guodong@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
Date: Thu, 12 Jun 2025 17:48:55 -0500
Message-ID: <20250612224856.1105924-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_154903_102921_F4672B51 
X-CRM114-Status: GOOD (  11.04  )
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

The pll1_d8 clock is enabled by the boot loader, and is ultimately a
parent for numerous clocks, including those used by APB and AXI buses.
Guodong Xu discovered that this clock got disabled while responding to
getting -EPROBE_DEFER when requesting a reset controller.

The needed clock (CLK_DMA, along with its parents) had already been
enabled.  To respond to the probe deferral return, the CLK_DMA clock
was disabled, and this led to parent clocks also reducing their enable
count.  When the enable count for pll1_d8 was decremented it became 0,
which caused it to be disabled.  This led to a system hang.

Marking that clock critical resolves this by preventing it from being
disabled.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Haylen Chu <heylenay@4d2.org>
---
v3: Define struct with static scope; added Haylen's Reviewed-by
v2: Reworded the description to provide better detail

 drivers/clk/spacemit/ccu-k1.c  |  3 ++-
 drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..df65009a07bb1 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
 CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
+		CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 51d19f5d6aacb..54d40cd39b275 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, _flags)					\
+static struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_INIT(_mask_gate),					\
+	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
+	.common = {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul)						\
-static struct ccu_mix _name = {							\
-	.gate	= CCU_GATE_INIT(_mask_gate),					\
-	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
-	.common = {								\
-		.reg_ctrl	= _reg_ctrl,					\
-		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
-	}									\
-}
+	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, 0)
 
 #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
 			    _mask_gate, _flags)					\

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
