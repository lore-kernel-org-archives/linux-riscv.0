Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F7CCCF9E9
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LQndbBp2yBbOjY0sQhV9UT/O4yOkoJb9XmvbbdJ9Ow=; b=MDpvHpEppayjiO
	bUQAweA5LlsTbj/ADedPGu/5XQQ7XGO0trhD9T5Xa59yUMNyj41Pp+FVrt8DYqUe7o3ivhIyDy/W8
	R1GPofasHvkcfHgMac4CHXCucQk2fudIWOEeP6sVYM8LyeWdKSwKtLoUQnGqinnI+vVuoX1QPHreQ
	qSYBtgR4c2k/KnKfwJHnG1IZx6IWJ4lktntauCDrB/abm3z6JQQGg5eBp5vNmZad4/SPkgsUrK8BP
	fNQVq4suvg0VxOcgevFHtcFS+UEBR7owPoVO3eBlmGQhXZ2E1T7/LSMp1tNE7l/0Ze7OK8w/vRGsg
	p6R176XfRUs60sVX4SMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb7-000000078BO-1Sof;
	Thu, 23 Oct 2025 17:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb5-000000078A1-2gDy
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mpdAYbWvJ67Pq6SWW8TZBr3xHWfsprNvetly1iKihCo=; b=d5rSpHKlaRNbf97TR6xQk2R62+
	4CJwSxU/HFgxBeYjuWcBvwRetA6n3vqqCuK1m/5NFyuJgEQIVvNtdR8ImZsCFhzg5TjSw4wlwimWt
	oE2DSerF0k9kNhRKq3aHvPJkL+VU90CdQ9JuX7lxKRiOzdE93rzEH4DIdfhQPi/KjhfaynXvRErIv
	A/iSwgOvk7QT/ewuVuprMyN+q8QHhtf9XSRv3C93JWOJ9EUdAKcC2f5/xzq5I7OhBARxoDTT6hVPR
	hO+tl5b8AdS+vnxmT2cLR2WtX2W+zkv+T0oggf7xomnEjcSAs1TezOguwwpehFfzsUVR37WuuxI2i
	LT81l93Q==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByjN-00000001ZRk-2Pc9
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:04:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so977302a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242370; x=1761847170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpdAYbWvJ67Pq6SWW8TZBr3xHWfsprNvetly1iKihCo=;
        b=lwTo6VprBoEl4CeYsVsqigiUScVMPlFflnJMDUeTf74kR0UeVRgyY1wujMxLPR2uYQ
         6BAZet/QNultK3OqzzDaAxwC2HVAMF0TW+VGZ5CeIg01i7Ax2uVuN+zP/Kp5VC1rUdqt
         GnHt4Dt4B3lZOzd1Za63vkjwbo1ONR4mi9HTm1Xsk4bcFeccexrLH90MfOXp3hlIrfXS
         7oOPrthrnyTVePvX44MtKCah2PvXNl0oZ+jnCTFH3jNpNvo+WeYUmZGdYal80NqwGR9S
         EBDNQCl3tJZmzWFi0lsMr6G6+tTaWzuhPcq0G+jP/Ab17+yC5MGJp3ihOydYLjkKh/Pg
         MMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242370; x=1761847170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpdAYbWvJ67Pq6SWW8TZBr3xHWfsprNvetly1iKihCo=;
        b=ZB1APkTZt54vyv/io4dpCcATEbK0F4rwPljtKHTuirv590NOn09tRAxC90N27vU3D5
         G2meb6KUmTDojlhW/HsEc6qd0gMZAmBZRvpJ/VQ6QnrRgo63SKRVg5CA5tfWwTXKx6DP
         u/kbXIUCfHIfepX4GMKrCWk1B9PR+eMMbud8d4T7dnGVRDWTu/ad06s2CUufjEihxsBP
         yP2ZMruW2+NzJsQbIX4+2FCwZU2X34KiTG9jelhDlZB7FeigzuQPSKS9EG72Q+sDzQqe
         qPiGcXZiJJ1hdBfpqCKamqwv9ROlTGZ1WaPad4A/By4ecSr40Z2UBlWMsnTTWA6Zs5Pc
         46tQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkVXZ7ZWfGsybF0xcWoZdvXttDD4RkgzIu/xeUg07BstTUU5hAYSRGuk4JFYdI8KObs80auDpIABJ7lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDLCcAMxkcQ4tdo4OC64rRBcZXqUavdyUkH4DxT2qDE9GDOnPh
	AYvXg20g4G5EDgJkKHuMY5/iOoSmhwXgk+OQPLqN/FpnedHxCr79gspcnC2QN3woyVA=
X-Gm-Gg: ASbGncs/ylgVfgp6IDxi1tX56FLjbd+q15oMGfgXP8cWf4gBpG08tda8SdUXKOQeTsz
	XBmQjkOnZF2t3+mZn5PnBPR6ydfc2RUzNXNsLqqryIpmRMSUhqSOY8TVL62RlI7Bg6snXxD17nM
	47gjaLnZoFjKxKtLDrQZzjq5ADz18cMxcF0DSplx6QWpFUoven8p56S+BFupiOXSYzaJ9i3MsNx
	q/+al1800DLPnZ4weFdt7zW/QpWwFW14o9e8f89FU8P5e4FsZlOyTPP9VCzmZnmcjzKY3npNk/0
	T/n2oK3AfIHvnwuJsLZ1s2dEac7t/NsqMPp11ySpX02SsqxXJBhJvRfrhAQD1eq5qX28C5F1aCS
	Io+renr/n//P7sIbl3sARXEUM3N6BQCwkKV0WkdsKoDqaVzIotFjYOxj5MhkDcpushCc55j0xcr
	UX9sRVgUfy1zP/WhBXl2Wuf+0=
X-Google-Smtp-Source: AGHT+IEsHCRIEchVGl1aiqwGIr3m1P1UsY5mh0aI0l1e28xrZb5I36C7fTVFMh7HosCXyjh0AUoMEw==
X-Received: by 2002:a17:90b:1c0e:b0:32b:6ac0:8633 with SMTP id 98e67ed59e1d1-33bcf8743c0mr34004618a91.16.1761242369714;
        Thu, 23 Oct 2025 10:59:29 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:29 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] spi: fsl-qspi: switch predicates to bool
Date: Thu, 23 Oct 2025 12:59:16 -0500
Message-ID: <20251023175922.528868-5-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_180405_836746_4CFAAE4C 
X-CRM114-Status: GOOD (  10.21  )
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

Change all the needs_*() functions so they are no longer inline, and return
bool rather than int.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New patch: predicates now return bool type and drop inline

  patch (patch 4).
 drivers/spi/spi-fsl-qspi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1e27647dd2a09..1944e63169d36 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -276,34 +276,34 @@ struct fsl_qspi {
 	u32 memmap_phy;
 };
 
-static inline int needs_swap_endian(struct fsl_qspi *q)
+static bool needs_swap_endian(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN);
 }
 
-static inline int needs_4x_clock(struct fsl_qspi *q)
+static bool needs_4x_clock(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK);
 }
 
-static inline int needs_fill_txfifo(struct fsl_qspi *q)
+static bool needs_fill_txfifo(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890);
 }
 
-static inline int needs_wakeup_wait_mode(struct fsl_qspi *q)
+static bool needs_wakeup_wait_mode(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618);
 }
 
-static inline int needs_amba_base_offset(struct fsl_qspi *q)
+static bool needs_amba_base_offset(struct fsl_qspi *q)
 {
 	return !(q->devtype_data->quirks & QUADSPI_QUIRK_BASE_INTERNAL);
 }
 
-static inline int needs_tdh_setting(struct fsl_qspi *q)
+static bool needs_tdh_setting(struct fsl_qspi *q)
 {
-	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
+	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
 }
 
 /*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
