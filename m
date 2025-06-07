Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9865CC5B543
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XYI+hhMn/y6+NmCLMT/H5QHsKxGRfKPaQhB574gJ11E=; b=uISGwEh+CO28CG
	vdrPpZ0p64z2BVHokkjw1LwaSVtGBEbWmKvljY2q13yV2Pt9vzZNrObHp5RSx/DBjTL8M6P5kTwFc
	yMG6EmlMwi4a3AlDdU6JzkkcRojh46Bn2+CJ4/r8vNXzI/PcVXPMxE1Ze/BweHkozDG7yB5CSc01f
	sKyhSkOVxs1R0y6XrzbfmLaHnp4lOjBMJX8tZVx2H9o2SzdcJ5RXQlwaKth5qPvPIALluYYjvzLzU
	6jVoM1oKsL8+DwJ+FKG+x2VXTd47wNMy6OYJZFaGJIxWW5FTQeIOdeqxtaw19KTEWMbDu/BkVr/An
	SXi63t6te/oMBqaYwyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO0O8-000000025gh-0MZN;
	Sat, 07 Jun 2025 20:43:36 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uO096-000000024PV-3CRx
	for linux-riscv@lists.infradead.org;
	Sat, 07 Jun 2025 20:28:06 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2ea35edc691so65533fac.2
        for <linux-riscv@lists.infradead.org>; Sat, 07 Jun 2025 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749328083; x=1749932883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+L1F7WN7oNU4Rha4L1L/e482m8K2Vmc2Laqvym1FnH4=;
        b=IGldaS6ElTUVeW9TcV5vrBynTPe9PgNb/RRaDdt3AyfM+/xAS8o7NYrfm1m23XB8qj
         ggLzf2PxTItdD10nc78NTBriNA1YNdANSB0f6LE34sGQRJyLbNIZYIeNMbcubDdU+jE0
         GKIUILCUgbHen2iUWg1QLTZNgRxXGAOKbn09OpsewcZXPuNVyn5EFmunGrPUiKEXv1mS
         Xunn2Lwm/vw44fEMCaBFsYC24pWsP067Gol0COquvZ5OgmQnROOSZMugMgyHcPqHcIoX
         gaHhwxcE4puY0hVPcCdvsLaWNl7EVyYAxcAZ3zIVkxtvNUmKOdIlD/fO75e9vGuN2T2s
         PNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749328083; x=1749932883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L1F7WN7oNU4Rha4L1L/e482m8K2Vmc2Laqvym1FnH4=;
        b=ps3TnI+uqt2w+t/t6mzg9Nfz5I7Yj9+4XCwGg07XGrBIX8Fk1q0+KRwBUfJJkQxpQR
         NIC5XQkFi3gvMK0EaOwppTipcIawmZsr2w+Y0qBS+b7ndj6T6or3Rp4YlCv6ROU81dis
         10OsdDI4LcDqY1BbBd+rRKmhCjWkMKOgHR7BcDlK/Xs2fZ/fxfAgGOAtrrXsQkhvVESJ
         MwN3fKAXr+onG/sPrTjbpVNowc0+Ak6cSmxZUZQb6gDSlPJw44SzBjS7aAjrot50+Ezz
         cDd66rlww168Z7ZB3QoGkrj4TBJ6Rtbr75Rn0ljtvD0se7v1KyKzKtoqSwXH0v9bpIQr
         4YNw==
X-Forwarded-Encrypted: i=1; AJvYcCUqL3HXL/YKw2qHIpo89+R3t+zBQ25pSnm42Uy9vv/NUu4AuM7MWngFiJ4SbHZMpDo2b78dDzwWqFybbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFnwMhYt5CNzLYfGFWnvX6mTE1WKwSTqWQ3xChzObJUE1VR1EV
	ZkIwPD7aBhwQCWNrIM1lGUZFEwLrYqxVegz83AOpA+F6azC/71Iat2geuRyXXYIwYYk=
X-Gm-Gg: ASbGncsnSjwXf7UriAPEjeAp+PMAqwjW9PrQ+jMgM6iqzaHfwDXg445wquuoZVGFBaN
	SNSKgb46vbwkI7teZeopR2jp7DmUPRHjixv4EggU/xTUqYjB2rxEqBVBUoIEvABi9AB+ruTcb6q
	LK8ikCkuYct+s2dXcnlGvDffVWyzAf0q0/zqbjlZmg0B1ANzTjgie+BDeLfG0/uEKli/U/aFVRp
	cj6tgo77DxivDz4M8p2+roF7EOcbv88PFdkNwEdm5h6ARp07BAwBxiGXLC3E+F2/a/Y8RM3BhpY
	/vfSP8ko1xcsgSXv3/nxWcWI9xixlP/ZO8HcAqlzKBpeZM/JR1GMi/+6F8l0xddwAljRKqfSySx
	o2FH7uos3VNWY0l/cTcufwJor2bZGzrI=
X-Google-Smtp-Source: AGHT+IEvPgGJvDGOrI6eAu5IXXdeG5KtOXQ02AqjXd9yxzuhdNHpWFjKBYNJ0mWoWzWzeLONozHNTA==
X-Received: by 2002:a05:6870:818f:b0:2e8:ff0e:17d3 with SMTP id 586e51a60fabf-2ea009b7c99mr4489727fac.21.1749328083498;
        Sat, 07 Jun 2025 13:28:03 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60f3e46bc17sm747593eaf.0.2025.06.07.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:28:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org,
	heylenay@4d2.org,
	inochiama@outlook.com,
	elder@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Date: Sat,  7 Jun 2025 15:27:58 -0500
Message-ID: <20250607202759.4180579-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_132805_043573_E8647BF2 
X-CRM114-Status: GOOD (  11.46  )
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
parent for numerous clocks.  Guodong Xu was recently testing DMA,
adding a reset property, and discovered that the needed reset was
not yet ready during initial probe.  It dropped its clock reference,
which dropped parent references, and along the way it dropped the sole
reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
disabled, which resulted in a non-functioning system.

Mark that clock critical so it doesn't get turned off in this case.
We might be able to turn this flag off someday, but for now it
resolves the problem Guodong encountered.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
---
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
index 51d19f5d6aacb..668c8139339e1 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, _flags)					\
+struct ccu_mix _name = {							\
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
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
