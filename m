Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2905CCCF9E3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3WkibKT+UqFWuQpHs3tOLJ+RjbadsUzhX4Ys+OhDjE=; b=W1uaXPHEm1zGli
	F8E17FIwzIwtT31NEgTaghx+f725mdCG3usgD0IzstPEsUzNLdKA9codC/ZTFND+sYCsIrafLidvX
	EQgxLlbMYfYgFeaDJJ0yb5fRlDoTq2wMx/HoQ7sN7KtBdxdAlPPoTXdbnzth+sSgCl/9bkpJdWfkT
	7ykYY0xnubnkynL7ZmWDGVAkoaAGHiWBQmKLUlQWvau5zp+QY5xZlc3HQeaelQ60RkdHt9uf0qxuE
	DUgJEbL10o8hMmuqJfM0pk+4AXkY17PKSUkdWI7IibK7Gr/sesFVSZbEDnuJyAqQtdhmTNRrDe4ZL
	n+koBzjsKMq3LBZY4Ieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGc-0000000AL7K-3cWv;
	Fri, 24 Oct 2025 19:16:02 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGa-0000000AL4x-2DKN
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:16:01 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-9435969137aso2232039f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333359; x=1761938159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whAVJxDDZqUJMj7E4dlz8n3sScKT3peLB8arm+VC5HI=;
        b=kK4Kb2ahNsjd569gmxzxz6Rhg5NWZlGI79uOi+oAz+VCgitQkA/ShS5igYdaGnGguD
         OUDKke6WhwLRtw9z8s+RwNfQQQCz7h9iTkTkfhjiIrBcHWXkgydqgTjUbSr8ijfm4zav
         rnJZL81+xelgQFekhCJGtIDrSXBJVoLR/bG+MvAaloAPuVjP2BeR0stvB1KFoKZ/yiwG
         tMG4UcLfQA3EFppR7tu86iRamYyT8+/01WiWMMnpTBqTdSknSzmass4gV+fiPWBUBIYo
         3TsmWCikbOYexD/JH6qhYSd3KQhj23NaRvHdMuNF3c3piNJTWJnV+J7fcdLKQ/tEyhc4
         4z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333359; x=1761938159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whAVJxDDZqUJMj7E4dlz8n3sScKT3peLB8arm+VC5HI=;
        b=ce1Si0PNmPLOsQIbdil0YkdRm8pHkncJm3O+TyI7SM6iqXsYycFQinJPGt7oDqcL3s
         vapf5q/hGxuUMnwf8vAUDTXde6ercC4kZQC8FioLxHyuupp8b7VnlxoVcfKcjTuSiQ+k
         7FcbsEoE2OiRQHxSmPJ4qDnLLqXHZUfDGdDH8aFKZkNrcctWplYobaass8yaolHrpIVp
         fhg6IeiOMqcHsn/rAd2olf2lz4cXfKoP6c6mXuIz8zQ4372H/ybYYoJsZrLSU8RolNVv
         /jTqFW+wDxjGGY1BYpsge0Vif7CoS1hSGykIlvPb96dC3knesXgq+tWuvxnLsYqDHvfH
         PMmA==
X-Forwarded-Encrypted: i=1; AJvYcCXEIh5VDWnbOglufMC2fZSr27RyoCkrmGFFTO2oHrHz6oz7VmU5Vh3IcYd5mZhY5HsqVfB81hhns68W8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHlzgBXppLiA6t0jHVjZp/cYgRHpZaBz19D5jFwx92IHNNA8GY
	WDyip2ADbsv3xCdCHltgaVEIDf4vkz+gYP8fXa4AjI6CivU95rR+0/NIVyAdc/PBcco=
X-Gm-Gg: ASbGnctqDgY4HvZ1rVwjBZRlcE4KCT1Vzq2t+eboRORwS50XH8eiqnNnpR8RDP9TfRC
	vTPfJUBy4j8mjejdQb1sgN0lUTpEbNPcGD5rQV8eMPeFNNev4yJ4fxuTzZoPPAxEs9fn+Nn2TOP
	HRtrXA3vOn0mfkpnFzmPfTJ3zrYRmS1Ob4GIBRYjiX9g99gUeDloSuKp8HaVzfuopypVrTJbQiA
	gEfKLtvWTBK/CBHviD/wmxOce/5KWc8/2yBRZfnMrJQIvWMXs0ivxwTTHJYChJYETVarVJuoGso
	aoiG7cbTxzmzXt2eKb3gYzGTsWvxVfdwXZSGx1JshcHLf46H9cIcJEPSM/iSLsqK4mo0fOHHRoy
	YTA20mQuZpskiwI54KGPLZGcZ16QyiD6QdRtA9SCosQRX+NPWar3h0YnLsrtgCNUtzH7Oz9hLMk
	8IzteFo7/M3m83JxO3Jh2IRFYw/f1RrVioTh+p030l72K41cxHa8teUA==
X-Google-Smtp-Source: AGHT+IHX2zRIoMsUD/QzZWZVb8zmLNqKBEZdZKIdnvVZGFa0ldz9lbQJW3juwmiEnXtXUSBt9XGehw==
X-Received: by 2002:a05:6e02:b2b:b0:430:bcef:e0a8 with SMTP id e9e14a558f8ab-430c529fb9amr413408425ab.28.1761333359510;
        Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
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
Subject: [PATCH v3 4/9] spi: fsl-qspi: switch predicates to bool
Date: Fri, 24 Oct 2025 14:15:44 -0500
Message-ID: <20251024191550.194946-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121600_572614_8C759D69 
X-CRM114-Status: UNSURE (   9.82  )
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

Signed-off-by: Alex Elder <elder@riscstar.com>
---
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
