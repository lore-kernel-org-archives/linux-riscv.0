Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EACCCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QkZiFgB8ybSdPHeugrXtK0W90o/ST5LFar6hGz1rBE=; b=efl4oF65dQajau
	xltShsWP+o96Blp98+cLLzGcW2IMqHWDE5AxZgk7FgULqCx+kO+drO265Jgs3f9/zvBlo5aompwbe
	+RUvEfaTXkmoVbNOBolxCC3eMDiPgtTJzY4Tn/92KwhFvTXcqNDKnCbXQGx1CSjOisDEKnhGD53nD
	JL8dep3qieb77GUGIG2UHJTLI9bWZ7Ah0HNC8K6tIRm0QlmEKSLu0GTk71mig7XOakrAH8T01BAei
	dCdfxM8QUhL0YEEqWf3f0duWUpqnXfXXT1h+/3mlq4hHzzVZGu9cvYzJs+jLddpEseqzils06fORH
	KW3iHWDlsVHh/gw0srtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzbC-000000078Ep-3zNh;
	Thu, 23 Oct 2025 17:59:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb7-000000078Aa-0Rjy
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0LXU+r3p2H3OLM8MjqTR3TSPttnWfeamJ354G5+nCPs=; b=cBz3XiSkooQUO7JQj+/OfpH/KV
	Ba7jXGCsIPYkNNJhsvIxDt1anskBk3VmxqNhRKSy8ovApwLxo5g6zIC0cdNHtKcfwZyzL0+0Q6gqN
	fM/C6xsrgHvhg9MF3sbNB+uQuxUK/qrZkKlNa4jXLs/OndrIOliIy/V6afh589C916+BZ4NKT208g
	LrmXaVePS/9NUa4w0+1/OFFSadvIsPVwKA0xKmiUAy+F1weP4dODTfTf+Mza7fI1OvkuT/uc+j6af
	+GTUf1jd+nVDtaqLaeSgQzYKtWMbsixTq+MaR4dRqyCtDMCVtUbHfbxWso7R3aP2Rd9yowtXZ8YHG
	rXOQPGmg==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByjO-00000001ZRq-3x6I
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:04:09 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-33292adb180so1121653a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242372; x=1761847172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LXU+r3p2H3OLM8MjqTR3TSPttnWfeamJ354G5+nCPs=;
        b=u+I2v4WfgxLoj2bL9X5ojiCHJoUBA6HaCJRLc1TKriQ26x/FxzoDh+Kvjol/NDjKej
         spRY6CD5/BYIp6LnaIuPtyEGTxtriXrzwzBw9daZoCyl2GeDS+A/xEIqd7UpIxTGW2Dc
         gaN3kZoViQo/hR82hYXwhHjEQrar409umYP1iUH4LZ9QZsDtr85d1qoAkyHVt4oLHxze
         cQaIJmy0pvbPTQV7FKPGr5axRGcBEUlkWpCLg5z1LD4V/sfPDoB8kZYQEcjvX5/6hWkQ
         YQWhgkkXHXzeeXNmtIGjQNIio7TclL8CF1fGmdS76fBKTdmO2/Yjd7TQgqm/wm9iXSwx
         aUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242372; x=1761847172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LXU+r3p2H3OLM8MjqTR3TSPttnWfeamJ354G5+nCPs=;
        b=HTdnwfORruNe/Tr/sa29g9WmrAAs0xvwIrhw7OJ8WSrZWZePfCnyb5WYN4bUKtBFj6
         fl/Y8oQGA2lD7gi0xfkJo3VSZD8JZOQUlSfjNoLznWKd4Y9y48Wck9J7PLra8lCm2llW
         OOSDMtiTfgSOO0hg60MiOwlKtFJusulA9GKDWIKWQFCESb+58uKYVF9Qn+JR0F1o0ShW
         nQpGznlCdxUPj1MuC5jsgMZGs+JR8Z1hYek0SzDf0BmO2JrAZYRAsiqmpseBUYBP5FLj
         CIJLT8/XXwvTDa2Ba1x6dOSPlV82aR225TCSfmnZzpZCpbWjwtI8/gsNkjYXhLsBneDb
         k26Q==
X-Forwarded-Encrypted: i=1; AJvYcCV28Nb126JXMuEYZzYVC8+v3bm/GGLo9fsQvFUyJ+91i3TdXkuGN+0PfIG8CPYKvPPKQVrshZg/D6Dy+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0p8qT80BkClp9kLmZYU8IroZPvq3KA2Wh1UH7AGu9FqY3WU/c
	4rw6933e8e1Hd0uXSPBLblhF4GCpA5n3YYWGVoniYhOrRJsYeB0F+6F18WjLYhx77kpR6tBJc4V
	Fs12qyXs=
X-Gm-Gg: ASbGncuADEGjSZiiwikyCu/ECwe9eLi434Aisqpw6hyDo27pZzL1jkHCHYRm8ygZy90
	ikSCmqCeh+kg3K0B3fSw6Ril76rXEX51RjNLvBxP/2Kj8BsCvr9KyRARIGNsq8+Jb0snOwBUiu0
	SDATT3leFwLkNkmIN4raTHwm28A3j1B3U/nNpIl8tF1rhaVW2G10E9ZWZyL+tSGLJtZVjzCXf/R
	NXLQO/siaChK6lXn2WmsGOFUOMjvf4CCNSxSKas8JXfk2pKCQ/Zfz7Z5f22nypinTQACOAJwqX+
	N/nU9Y2Gi5BFonDoYvaOb75XlQ05CunboE08vHoFWLxcjAOgsAFBJ3IHZilE6Y9oig+URPHQ9dm
	RVmVwk5/G5VHPOMUm8Zxm98wEYhz3/rnh1MOxBK0zWZF7jCv9WmMl86dFtrfXkb0qRtEv8QJPbq
	sbyF4GQI+WlqrfYlkiihNdCdEfK0si17Eghg==
X-Google-Smtp-Source: AGHT+IEF41yHnh/Q9tj7kOyP7EkFl0s2frDdTCHx9ucShzUXPPZ2GVIgbE/DpmewAxUbKZPk9NMitQ==
X-Received: by 2002:a17:90b:1dcb:b0:33b:b033:d7e5 with SMTP id 98e67ed59e1d1-33bcf9186f0mr36102913a91.35.1761242371953;
        Thu, 23 Oct 2025 10:59:31 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:31 -0700 (PDT)
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
Subject: [PATCH v2 6/9] spi: fsl-qspi: allot 1KB per chip
Date: Thu, 23 Oct 2025 12:59:18 -0500
Message-ID: <20251023175922.528868-7-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_180407_180114_B39EBCDB 
X-CRM114-Status: GOOD (  15.33  )
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

In fsl_qspi_default_setup(), four registers define the size of blocks of
data to written to each of four chips that comprise SPI NOR flash storage.
They are currently defined to be the same as the AHB buffer size (which is
always 1KB).

The SpacemiT QSPI has an AHB buffer size of 512 bytes, but requires these
four sizes to be multiples of 1024 bytes.

Define a new field sfa_size in the fsl_qspi_devtype_data structure that, if
non-zero, will be used instead of the AHB buffer size to define the size of
these chip regions.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New field fsl_qspi_devtype_data->sfa_size now defines the size of
       the serial flash regions if it's non-zero

 drivers/spi/spi-fsl-qspi.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c21e3804cb032..a474d1b341b6a 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -207,6 +207,7 @@ struct fsl_qspi_devtype_data {
 	unsigned int txfifo;
 	int invalid_mstrid;
 	unsigned int ahb_buf_size;
+	unsigned int sfa_size;
 	unsigned int quirks;
 	bool little_endian;
 };
@@ -737,6 +738,7 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 {
 	void __iomem *base = q->iobase;
 	u32 reg, addr_offset = 0;
+	u32 size;
 	int ret;
 
 	/* disable and unprepare clock to avoid glitch pass to controller */
@@ -795,17 +797,17 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
 	 * In HW there can be a maximum of four chips on two buses with
 	 * two chip selects on each bus. We use four chip selects in SW
 	 * to differentiate between the four chips.
-	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
-	 * SFB2AD accordingly.
+	 *
+	 * By default we write the AHB buffer size to each chip, but
+	 * a different size can be specified with devtype_data->sfa_size.
+	 * The SFA1AD, SFA2AD, SFB1AD, and SFB2AD registers define the
+	 * top (end) of these four regions.
 	 */
-	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
-		    base + QUADSPI_SFA1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
-		    base + QUADSPI_SFA2AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
-		    base + QUADSPI_SFB1AD);
-	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
-		    base + QUADSPI_SFB2AD);
+	size = q->devtype_data->sfa_size ? : q->devtype_data->ahb_buf_size;
+	qspi_writel(q, addr_offset + 1 * size, base + QUADSPI_SFA1AD);
+	qspi_writel(q, addr_offset + 2 * size, base + QUADSPI_SFA2AD);
+	qspi_writel(q, addr_offset + 3 * size, base + QUADSPI_SFB1AD);
+	qspi_writel(q, addr_offset + 4 * size, base + QUADSPI_SFB2AD);
 
 	q->selected = -1;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
