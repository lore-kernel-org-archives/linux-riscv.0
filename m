Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10143CCD1AB
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxaA313+vMegl5cC8hbB+7hQ7J3/IqFwgoj9JJJUmzs=; b=39r31pLUwM1ARU
	uCLWTFcWto5ia4PiOtWtaspqgmmhFfayWkKD9AuCceb+1CTD8uYRJWs7wEBHTpQregQJfYLsxhZyJ
	mLNGWCMp0YjC7nNW3JId9Wb9AjR++XLQU8kujhnZ6K3zOblqELqoB0gUIjkxp8xF+y9yPffF/xJ+h
	WiaqIQVU91GUjx9/C97RSCMcLbAyYtqmYoW0rhxYJdabfoA5By4RwmSsEEoniALaLXV2ft6ucH06N
	KhvD8ztQnaUksaHS39RXyl/Qxyss2UxF8uwHD+4yMX7ISQMrproiP30z8zOwir9A6h8jX/jpCxFG6
	IuwbgIxXmlSHHSeALvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt78-0000000ENCq-1Ra2;
	Mon, 20 Oct 2025 16:52:06 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt75-0000000ENAG-1ENA
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:04 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-430ca464785so30230015ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979122; x=1761583922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQXVbISA4WvqnIZXTg13FJ7YaYjfMgMauMrkyToUbl4=;
        b=1nlPpncYMPJZW0biqsouOaNlTUmLJbEuUozYYsUlNagBVjFhZDcg9h7n0XxSnZiuP3
         C/sSOqUs50RjoAradT+UDNorDst5GeDzUSJ9VO5zynZcs88AFOiarMOJAGUUD7CsvF+I
         49Vr6QQCHVP9YZ9ro5PVLbrB4bauit5IQHzi5UU1bY6dBqOoImx8FDeLmUt3KSJKJ06t
         NL1iBh8K6wCnkZRgAJ9J9WLFfLJvlHbx4zIvGqbJkFaoJ1KHDXlQxRQR5RdByIgzhZmw
         8roL3KZgOF0x0Ltn6QFIFKYDOyvMqGaa62TbFF2iqNUXwZQlIcguM3hwuv+v1dzjYXRQ
         rLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979122; x=1761583922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQXVbISA4WvqnIZXTg13FJ7YaYjfMgMauMrkyToUbl4=;
        b=lUREQdSHhm4QMKTqEAmcLa6pU8cpt2gr+W+5LbfjzXhpILKBdXU4M4BgvKT0pUYLTZ
         TLu2zL0RaqbloH0S45THQkHMcPNFA4S8LD8pk3C0b4VyKry1V3T6M0J+x+qGc0gShwFy
         rMJdl2uTc0v27ynjlq4DRQWgTWXjHuMM9H0UH576Ud4Mjsm3DzteD6qu5b3dWajBrmh8
         qI9ub/Ad9sxQTGF1uGMktGBeWCtCujzKK29uNzQLUPOhm7zCojDP0I4czz2h6rhdMSYk
         hEkYHkKj0Okex1SxsHCe6z5nOrUyqqPm/cEhxJ31Ol63tMhYwlHuGvlWVb2idJPuyder
         UMJA==
X-Forwarded-Encrypted: i=1; AJvYcCUkJ34CoFnSzEdgSm6dX9u0QXRLX4bW4YBimgv2RgPO43+px2MzV3Iw++l+TMj24+tE0KqvLfeGUkPavA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyl3/rhH4HaaFyDCHQdOKfXLqoXYEtbnKTqm6R2GDfvPUeGt4z
	ur2T7UCXDfAusxGEGmLxkCe3+kkcF/spRXQHKzJz63PGLR9ws73JAe6wNBcxY08Jrhw=
X-Gm-Gg: ASbGncuK92Vw0byuMygAnp5WBGntGZeUqGY8i4ZEQeVHq/GrsG3yL/yAbGuxTNkuUM5
	ThRx71vpoKnW9W30PNMkfhnWMyRdINP1rriCEhFxRHVv7qKxLgFAL92MJS29OfKcNSkkyzW3DLt
	8wj1+rcKWp5Jdew0cxdk7cSHKktDwqLkff2/dkf3n/QtV807CqbMEO0IIlui2pk6gxtK+H9Oz00
	UpZRUGpSarkZ3BMONcOJqXuSM4rbHSlGr6DklMUrMm6zQJerOH8DiiRh1yCRTuCd13QSCvqJqca
	QChAid+0DyXjNNW/xc/fbIzbFOSTkJ0lY6oV5LKz5G3zq0nMrbWlQ6jap7ZCg9tAK327NE7yl4X
	RCoPyPdYM1fs4toz8dpTZdNKaDqsB8CsfbkARj/dFA/vllp246NNij0S8VCpcgs5r2hjOhRz+mq
	7VGYZChxsrxYUEolANl8va4ljW6vKG3oeSij7ADGHFRzReFu8I6QidNQ==
X-Google-Smtp-Source: AGHT+IF2Mm9OQGidsZhPs2Ov77+yd0T2fLJcTJpQ1EVmkmzq5AdT/vC3cNejClhwLlxQGd1xeq/XeQ==
X-Received: by 2002:a92:c24f:0:b0:427:6e7f:89f8 with SMTP id e9e14a558f8ab-430c5263cfdmr219177275ab.10.1760979122272;
        Mon, 20 Oct 2025 09:52:02 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] spi: fsl-qspi: add a clock disable quirk
Date: Mon, 20 Oct 2025 11:51:47 -0500
Message-ID: <20251020165152.666221-5-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095203_344899_383CB221 
X-CRM114-Status: GOOD (  12.58  )
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

The SpacemiT K1 SoC QSPI implementation needs to avoid shutting
off the clock when changing its rate.  Add a new quirk to indicate
the clock should not be disabled/enabled when changing its rate
for operations.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 1e27647dd2a09..703a7df394c00 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -197,6 +197,11 @@
  */
 #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
 
+/*
+ * Do not disable the "qspi" clock when changing its rate.
+ */
+#define QUADSPI_QUIRK_NO_CLK_DISABLE	BIT(6)
+
 struct fsl_qspi_devtype_data {
 	unsigned int rxfifo;
 	unsigned int txfifo;
@@ -306,6 +311,11 @@ static inline int needs_tdh_setting(struct fsl_qspi *q)
 	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
 }
 
+static inline int needs_clk_disable(struct fsl_qspi *q)
+{
+	return !(q->devtype_data->quirks & QUADSPI_QUIRK_NO_CLK_DISABLE);
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
