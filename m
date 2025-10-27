Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BC2CCF9EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NrU8mtLjIPiWu2nxBp13iI+KBlprMd/8slsCPXtRQQI=; b=IO1yWT2MIQ24jI
	5bw01hhcnbzlSfIvAOnZy7YNLdCNHhiwMpI/Ec51syHIxIHMhlwrZg7X98mDxJHgsnlppB8lp+M1P
	RG+0twOwa4M3OU3Xj849+nv/aSBpqvDD9torDDTWpufnFk5Ww2N9ILurcMzeZWl2DRdwKuV4grXEE
	j3ijztiZpHF8SCIJtSrIaJVqEQVqb+mOUpppZmtWvt6x+eTlviU/tPi8cTxiI90laDzkjPmjSxiqi
	ecphsb3nlP6XYMfKZk3LmL5e5ZLQ/9qFhpAtTfrZKbpGZgoRRKKHMgMHzpHCVqoaKx+yV97fPUGMT
	THSY4eeIRNR8CnnRZhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIl-0000000E1zu-11cP;
	Mon, 27 Oct 2025 13:30:23 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIj-0000000E1xR-0iFK
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:22 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-93e7e87c21bso507186539f.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571820; x=1762176620; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59JPfJxdtbZVN0/1a3YIl7OOO3eshWQJw5UtvH1ggXo=;
        b=E5cq8LIofbVHL4PJqBDLeTivHdwxikKiDtXrHAp7ekI19wjhRS0WToVdgxqrqDo3kh
         AIHqeKsdcGM4F7vS31zook1CstiLnXL+iMJ75+3SrQik93nc5kgrYtDBaMawTfb5+lvf
         9ESms3mUv67qs2QhLVOmXPjrSfMu1k1oYDvqNaJjBLEhvgcenj/TTIshi5pXzmedVbB5
         j70VW1kUrsGhG8LR3sTMK7E3/PBiQ5O9+S5pCowntyRqAdTezbYVm2CWmkAni089e3sW
         ZJI5TzknWd7nQTP58e0OAT0YxMivAFSzF+K922nnrcmIGNzkx9mXF+aI7MqVtQJM11pF
         NkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571820; x=1762176620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59JPfJxdtbZVN0/1a3YIl7OOO3eshWQJw5UtvH1ggXo=;
        b=libKGYQU+fPK14ZBVnMKtpkmNlZAnEz+lbfagXlFOMtbLAu/JzLnEJ/ukzuBI91whq
         UE48t4aqvse0vIlqxHkitJIOcFzDFfqvqwqMYjJqzzM3/k86gFLkkQtCQu4SfZr9Znq1
         HqfAeVoFcs/66h2NUEAmKXfnxvKyrSgsVqYBj/gqWfR/LneG8NjM/UEgLj5Hv562aK0t
         /XG+4TZsS4xspF6vgxIDXYe1kV+yL3LfY2ee9UQDpMg5/E3EH2kDzI1i5md7uqhYhdVx
         AeCUvYIVW7XqKLjqpoSouIjSwBUB5U4WEHbl0klH0JVP5iq8TU4YXjZEiB/Z8ZW5mlFC
         ylRw==
X-Forwarded-Encrypted: i=1; AJvYcCWgHDDFd+s0jcDoH5e+LePOHJeaJ5zVtf2itr5HuH01wCcCAsUttR7VdrXq37TTSkgJ7NhiUEUyavRaNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YynuASAgKGftCFNTyOci9QPm7gglAOLF4RKpFCb8+ahS+lNDspj
	+EX9bn6uVp4hT6raGedTltjPu1aqXLp8zmGq5taDs0QtK1ocJVrdscMx62vGSjgdMTU=
X-Gm-Gg: ASbGncvdfumWfCHIbV8UZR8nWvaF46sQ6XTKz3uLJ8Buo0d/TgqZQfXzFN0VPqIFVJJ
	jOO0zrtymOqHv5O1k2hiC4kM1i1t7zjyTNqM0uxvdNEoEhTIzW8RHpN/IHhKscnlGimBP//p6kB
	r38avcDN9/OakypYFGVntSVAABy6CY4Vv5WGLIyPF/rYvstMUo+yC3Mma1KYGRFSv8eycWAJNlZ
	IW377J7JdiJTEmGUGYygbdjtBgl+HldvTa/EuZQPMAoJdF3z8pdTCrtOMS8qN4OldwShcAI1zcu
	3t22Gjp/CgjyA/AY1slRa8uw+cASRk13AGSDxwiPnDWHMxuthE28xBcl+1Cuz2/OAEkrvvftDO9
	jlnND/onwsonVX2qBU7pqiDsBz7OYA19bNyD/uCdzU/VpZ7SEvj//xCT3sixp9+HXZEdNH4t8s4
	N6RQRcL6gqiELrRCEQGbkJGT9n2CHUS6+Ko9x10cbpqpirzvgM44GW9w==
X-Google-Smtp-Source: AGHT+IEOMq9HwQy8lmaiH8m2VohckOU5pzhBNmgtnKE6agpQoWegyJcP4IEG3hVlkqulKDQU9Y3jXA==
X-Received: by 2002:a05:6602:29d0:b0:943:5c52:f802 with SMTP id ca18e2360f4ac-945b7d9fd42mr24171239f.0.1761571820080;
        Mon, 27 Oct 2025 06:30:20 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:19 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4 4/9] spi: fsl-qspi: switch predicates to bool
Date: Mon, 27 Oct 2025 08:30:02 -0500
Message-ID: <20251027133008.360237-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063021_212171_A1D692DC 
X-CRM114-Status: UNSURE (   9.78  )
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

Change all the needs_*() functions so they are no longer inline, and return
bool rather than int.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Added Frank Li's Reviewed-by

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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
