Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D2DCCD19F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gjNflp8L26UOx5l02/Ommcv1au9a3ahnRc9D6qpBRw=; b=UN+S0xXlBSoNpZ
	RoiAEf+yBxi1Swp2x5sYIR2qgSB6v/QYGjsoxWUeOk5CS20pkHXRzaKd/oczUXYiTVZVGT7M0PNYf
	ysP4Qqzyq0psgTiZeq/6ZLdQ+RjQYU41V5bbjcV5Sz7MTlynZYaj+55/21tVDZ2rJn3w/XlYUXtd3
	Td9vmw9YYVXiknPARxCw1DdL7hUgkEfkKuHy5dvw8eAFJp7NdB5YMinHH20zNvFgd+1qUW67kOMg/
	9Kv7HfFnIAGZNFmeFXCE7rNwh5QZuoBqwhIN9SozE2sIr01nlXudvwcR4PbAUPRryaw/W7V8eqmRf
	IMMUV7F17mkRVin6JLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt7A-0000000ENEC-2fQd;
	Mon, 20 Oct 2025 16:52:08 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt76-0000000ENBB-2Dv0
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:52:05 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-940dbb1e343so44537139f.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979123; x=1761583923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOxUmFizj9Ufb4EIO4FC5gzTfZsJZC8/cUTKAJuMzsg=;
        b=zPlxEAYWOQPveDiXIN4IMVtKTM1ishk5r75NQFJsKI74yL3wleLXye/BRrfQQDehHU
         Dg6uNOg1tHFl72oBzv6F197U74sdGZE9nBpW/EcdGzLjKJJjhhlpc4asckPCB5CN2vPJ
         KQeitZdXuPy/kuK0Lk1Iaqqy+OE+Gmwm4LnbY5lFiUIc/0R0tt8X5vS+1FJzkBiy3Akq
         b9IwA7rZKlSLHY70HGff/CRqH8mVrLIA02OZdUPn7ti1TFkScX/vpMOFphP9cZ6y64mC
         /SDtOcZs7WLP2Vo7UXfaDbg1mtkjGb4pfcaFGUCPPrUamOs1rZMbH51PnHDhTH/ieHAT
         Y/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979123; x=1761583923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOxUmFizj9Ufb4EIO4FC5gzTfZsJZC8/cUTKAJuMzsg=;
        b=asoidzzvDdS05ul90iKksxDZUfy0gKp5jVQ7OJwNuSwY/vo5hOAdm/f7sup/E+D6c2
         rm8gtz+2U73+gMiS64WNEF4dnu4/MGfLeP/xUjPpyvI11vHLoHn0XefIOFuwgRXOEHN9
         XWEw0DR7OVjOJasYFvdU0WDqW72avBN36mqSF4DOVnFdk7DjReHameEPv6l690JNMRKh
         nFXtYjXA73JX/djowSc4L6YJmEkLdXbSsKJXlluS+YNIhtgBbg1A+N5ZRRQFIxwltqJE
         hpLIeU9z9FsN39VSy+NOjVfJFO/aWbDOuz524uL6BE9Y46UF5E4fLFQ5Al0akp13xb/K
         7ZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1cwnUfk5ND0cdYpZwL19fMlVLJe7LutfjioKsyoVEHjLWfRmLTHsj00QJEYo42H3eAsBUS8w6OKTSBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwexR1uO5Jep/eslkR7m5qTckfPjpSjaHJR3dDPxZ52Johb4+ph
	/QwLQX1LKhGTsQ0yg51VGQI+7utf1uU67EN1GBg4t6FqPAzTi5qBwMc0Rb0ey8KU2fB5JahkQq3
	Kl7RcVE4=
X-Gm-Gg: ASbGncsZpWnSNuVdMCdHBvVvNAqrfugibJ1d9EelMJnAafqUw2qZRRWwamjxGQgjcJU
	u0OqAgiYWmVfqzXAHevmUOvAo0pRNIy+vxsmoHWQYNayoe8JorLrFcCA1he0rUogu4AtHb3Ad2l
	uJTW+5ltHYYg2OQmOcxOKqF9neKHNrLXW9kpYjx3O3c0pn4gFRPJF4axLyo6GcPk6egZj1SDqlr
	KEnoqBd24Aa7EPTxXXltCCN6iVo0ScTNwJGYfpknM/oeBmHVSMjk2zKVJsX9sFxiEcx58dw4gss
	XxqYbEs/ixRVDRijz5O1xVbgwsBRjnrAdQNafK2sRha49/cApS/418L5mV9F5XQzlnX+jBm2a6L
	rq6vfrbnjCLiyj6Z3mvagqhBZa381dwMPCdLyDb8eLC8DbUKJtC9Lp8U83yOW1FkKEZyv0GLdRv
	o38P+jQP7/A90ktF3MVrh6q6zUn2dOIXg5N1Jyw5yRY/Fi/T2W9bte2L/Kf4X7ZoXn
X-Google-Smtp-Source: AGHT+IF/UQC1U4T3O3fIMqDaCL1ih7iPN9SgktMMT7A1RqheXlU2cIQVFeZ9iCADqymX+H06lIfZxA==
X-Received: by 2002:a05:6e02:154a:b0:42f:a6b7:922b with SMTP id e9e14a558f8ab-430b42f1f24mr238954605ab.7.1760979123535;
        Mon, 20 Oct 2025 09:52:03 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:03 -0700 (PDT)
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
Subject: [PATCH 5/8] spi: fsl-qspi: allot 1KB per chip
Date: Mon, 20 Oct 2025 11:51:48 -0500
Message-ID: <20251020165152.666221-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095204_606578_ACB701EC 
X-CRM114-Status: GOOD (  12.74  )
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

In fsl_qspi_default_setup(), four registers define the size
of blocks of data to written to each of four chips that
comprise SPI NOR flash storage.  They are currently defined
to be the same as the AHB buffer size (which is always 1KB).

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but
requires these four sizes to be multiples of 1024 bytes.

Rather than add a new quirk to support this scenario, just
define the four sizes to be 1KB rather than being dependent
on the AHB buffer size.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 703a7df394c00..9ecb756b33dba 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -795,17 +795,14 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * We use 1K for each chip and set SFA1AD, SFA2AD, SFB1AD, SFB2AD
+	 * accordingly.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	qspi_writel(q, addr_offset + 1 * SZ_1K, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * SZ_1K, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * SZ_1K, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * SZ_1K, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
