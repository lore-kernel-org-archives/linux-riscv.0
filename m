Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F940CCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EW1pA/P4w+hWZeriA60+bl9KJUnOEkiVpB7W5SOO6IU=; b=PU49rxYh/Vu05y
	W7STSUGuMmXraBLe7T4pfCz/DIcWP8cCUuD/u0yqqqMvWyoEaBwEhpzqhYB8YJGKmxUtW2Fb2e48G
	SnBwRo5pufPdwx95RZ8G1RGsdZMY0aR3HRtjK2E76+c82OWB+JhM2yZ3wbqMhxCjguhCiNKco8iam
	9PRQyuYtosysmPXpRZj2MH0RsxXZQebNExV8UGXyqfXOaTh8tAzXZDJcBjqbZibJiMG2AFkC0MoYG
	PAboUQzprQ1+4TCMaKoCP0UoGxSIsSPEJSVKxrYvdqp8xikELurdEsxn9QloD/HecW2KyvhPRK5VT
	74aXXNttWRmqfBSmFrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGh-0000000ALAo-0jzb;
	Fri, 24 Oct 2025 19:16:07 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGb-0000000AL5L-24h9
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:16:02 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-430cd27de3eso11021055ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333360; x=1761938160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdm2X0Uh+6QoNIFH/yUFpeoxSayQYwUIia5PVqWIucY=;
        b=l4pn/TQVgxMq1uncnF4yLdWHhQsI2JD/Nnz2e2MHOFipK6gH8brMwhWU0jkVgmT9rA
         rfhcZhLuxG8YFina5gdr9pEdmZXGRqhbzPuDw5KkzYbDZ71YREoTyCWASbsdj+m08esr
         kBKsNwGTWp/fKR6ZFCBWj/iV+q2T4042RKRpSAeis3aEp7UCpLpZPO07iXN4EZTvH3PW
         j79U8jjeK+FbfT9mzrleu4PEh0n6Sw+zhKZBLa4z7sjlsuiipxn7VSRzoDfmWsZgreIO
         39LZkHHuiapXsaeam1idzilU/GYJAA3XYTgp5LDJbN5+/Cd54Wm/+cYVkg/UxJhUjPb+
         KWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333360; x=1761938160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bdm2X0Uh+6QoNIFH/yUFpeoxSayQYwUIia5PVqWIucY=;
        b=YqJuQ+sXrfsoUFhoP9fXR1irNuZWyI0ah/oGq50vCnpRIENV4hSMmqBnndH3nzahQ5
         9X+3ZyASeY00V91Wv7ESpJ8AWTyLWo30RyKEFJaKycsfLiigeu7RAn7YFXe/ROiUkulq
         pAhcMW50nXWqygK/DdSbuBfCbP9/+ap5uQEOYefatbE3Iu5pZkklZ7a1s0a48qAQZVQk
         E2p+0tfQMa+0QL1bKG1LokHDeWaJMJbqjRvWLJkol2Sb7BATZDyXDrmEm27vbjPw8Uue
         X4Yc6cT31xHiVQvdIDA+vYJbn0EDQ9XwODoX9IYEai2Qe+orvUtuCbfnpMmIkP+MuShH
         EBJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG9YdHvEugg+7OKNCrey+ofPmzIgFC/kbp7Q42OsiPRPBXig7dQrjgdHCAWPa997Yn5zArW/SN2z+GOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHlUzQpUoDc8F5XB4TOWSj/5FHKfUvtOCu+hdFabSqd5eaKBO5
	aJDjoaLYNv60KqUZwYKpwprd0rNzRWNb2r5NKAsIQjqLf4Fht3PtPSV4mJUcSW8JQT0=
X-Gm-Gg: ASbGnctm9f2spi97YEfP0nVQEKnLylNtMFbWwwAfenJGYsXBrnn5DuELGC1M2/nS3lg
	lz7WcqvRHrlfV3AuHAgjtD8VvhJuvhAIoljp50X2TIkMExI0hui1akIOImRE1BL8i4QgRCeHbTH
	ponZ4zG6Eh+rT5ZyB+jweN339SzMqxM8Dorpd1Tx5+G+kMv9OCQ9+i4AsvTLI6qyekdzi6C8Up+
	o2SpUWjbkCY7G52RbCJOvDD0MnsrirTe6MzQsCU0W8Oa4OsMvxXIGkyVrUv+tceILkd33UD7NG5
	5GqJrfDBoPP6AdzWygAeOInNdz2cKwC8ALIw5piwFPhVazPU57oBN8wiHRweymhF0QmZCgK453V
	EMY7jPcSZsf+biIfiffw29jJE0iwWD7pveMjpehtJi8bFAZ1ugbXKcOoQYxhec1KXE5WRcbzifW
	6kyb0bBM7y4rNL26rKSPsZMIxfc+A2P/zm8sgE1ycZoZ4=
X-Google-Smtp-Source: AGHT+IElepsQIkPTyqRqx2ZlqiV2TkOUrhFpvX3uGDnya5yADO7YFKd2LUmYcqJ1EtE3DJar2SatmQ==
X-Received: by 2002:a05:6e02:144e:b0:42f:9353:c7bc with SMTP id e9e14a558f8ab-430c5209537mr363720175ab.6.1761333360521;
        Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
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
Subject: [PATCH v3 5/9] spi: fsl-qspi: add a clock disable quirk
Date: Fri, 24 Oct 2025 14:15:45 -0500
Message-ID: <20251024191550.194946-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121601_538700_96E1DFDE 
X-CRM114-Status: GOOD (  11.88  )
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

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
clock when changing its rate.  Add a new quirk to indicate that disabling
and enabling the clock should be skipped when changing its rate.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - needs_clk_disable() is no longer inline

 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1944e63169d36..2c030dd6facc7 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -197,6 +197,11 @@
  */
 #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
 
+/*
+ * Do not disable the "qspi" clock when changing its rate.
+ */
+#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
+
 struct fsl_qspi_devtype_data {
 	unsigned int rxfifo;
 	unsigned int txfifo;
@@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
 	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
 }
 
+static bool needs_clk_disable(struct fsl_qspi *q)
+{
+	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
+}
+
 /*
  * An IC bug makes it necessary to rearrange the 32-bit data.
  * Later chips, such as IMX6SLX, have fixed this bug.
@@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
 	if (needs_4x_clock(q))
 		rate *= 4;
 
-	fsl_qspi_clk_disable_unprep(q);
+	if (needs_clk_disable(q))
+		fsl_qspi_clk_disable_unprep(q);
 
 	ret = clk_set_rate(q->clk, rate);
 	if (ret)
 		return;
 
-	ret = fsl_qspi_clk_prep_enable(q);
-	if (ret)
-		return;
+	if (needs_clk_disable(q)) {
+		ret = fsl_qspi_clk_prep_enable(q);
+		if (ret)
+			return;
+	}
 
 	q->selected = spi_get_chipselect(spi, 0);
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
