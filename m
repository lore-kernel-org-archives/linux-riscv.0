Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAE4C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 12:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xhNPItui4w6ADVEVGdcANLwrUPDzuvAAGWXeXterUqo=; b=lSqPpjy2MnRKlg
	mQfSKeezY7Qu026sFFU7TLkxqinHjY+WEyEUkDnFXTRevjINGbE/HJMltcW6WESnaoiurgfo4BWQU
	erir8y865YY/claKa+h6oWDoMdavc8fuC39Tk1sfh558OZFAzRIE5oT1VqrXiTHpz/Q/gdmeW/yax
	Z9gGeypwa9FGTNvCTaC/6H3eCz4QEcodZ7u28sRIGrcbt79YY7Jb1vnDAGjlZ+1shkUeGX+19IEDJ
	cehPeut7zeqTUFSY1Umo5ZJODSpS/1aof/2fw4JDo9NhTY1QxfpBvHCMXvfjD8/fD/nUdyeOQSwW0
	nGo+vNnGQx28CiaQUi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz6I-0000000ErLc-439B;
	Wed, 15 Jul 2026 12:52:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz6G-0000000ErKW-2M2h
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 12:52:33 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5521887a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119951; x=1784724751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWcdIs2ci+zPyHZ1UgU5XfiAjrJantGzHWpSqVd+iVQ=;
        b=SSrcQHECY8aRAiUq3eFW2AM45NT5BhxOlsi5XjvtadrrDo829dKok3LXhvdj30Tnmq
         t+8s4ayQyOFkp45v4FZxNsx+mFZ8oiK5szTzIuxdM9A07K2ilMxoMzz6Dwhfa686KMdp
         9XYKkryYfaalymhZlthZzxKC2wOc0Xts9+lITEN4WmBq0YR0YHMMtoGh/nOACcyTYEQV
         SMo4o/Xnt7b+cp3fw0YrCSCvU0aoEq8KFKtd9b4QGR9FWidyIze31IJxYh+SG1gRoS5+
         7Ba0FXgmlGo0U1TMimDKAx1Jj+eX7LWZHGOK4g1e2c1mOWn1bwZvWXPWRe2c9UOOPnx7
         4B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119951; x=1784724751;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWcdIs2ci+zPyHZ1UgU5XfiAjrJantGzHWpSqVd+iVQ=;
        b=s7tDJw6m7SE75Ffw5hYFN+j0eDVQWGD5xKYZwuv9TeNimI/6r0fvyIx1Um9vaZhmZs
         7CMhaqzqgwZecaf/JBLAf7/ypvy2GUhBT8ImHy/v831TMD9BuvlzGvXatY0nA0rmMrpl
         0b+5dTPdJF5ZqQj4O5LNTm3KDYS9vNdR0pF87jEYC6b4Ny5FIo8eRu1V5oAbx3x4Irma
         hjraCEbhvKaugupD3Ye7U/ou7VGSL2IViEixNVBp3eR0topcrp4T9BWTZjmywZ1NwaZW
         cVZt57ZvVKLTc1osRtA0PggoYN4nljpguox1KOiIWkrs/4TRezMoFRBU+9uLRZhhge37
         2YJw==
X-Forwarded-Encrypted: i=1; AHgh+RouWoNG6WCdgOP/5n9bn23xgIoUhitz9ulSO3JEhohFCkjkJFYAM8Z+S/2W/YnalrcwDdU0vF5B/Hc0LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO5jg4ZDXKO7bDBd3KcyBr0e8rJmRxHkKbKWzCSUcq0yrvYNvV
	UGksFNgfiuo//6hQQGuDJCopiJGrLZVxbUK+SxYSFjlNIVlZcjH44ulR
X-Gm-Gg: AfdE7ckNsD6HnzGoPf3E4Nb+Gp0kW0vv8VtLibvj44dMehzwGsJPxxOQBBa67K/eSnO
	Avjkv93F54hehsGw2m6CSSeAbA0xIhZELY8f9PZbOIDXVO8MdGDQeTaeB7O/Ivqxg18B5j2bl+N
	bvwKO3UZkXtlTOeHDiqfSbyzToYYHM/vm8qHGJie5Ar8iTQgUykd9yaidD5JF6dpYnKILZDwWkM
	TZvLJUoERJ6KKfyALZ2IxJwnarw6wkUA9YOAEfOOiwdDkr/cDJPx1Lfi0wsOQz9yWttGQKMqZrY
	OiJRbuCGw0JtgNkqEc/30Can9Ly9DOpmpZxY9aEPy1A0tvje8jrDHdOWdOsJY9rtkTUJQ1PbYKu
	bFZpJHeV+K3KVdNsQeKqbdQlGXkmlS6XanavXg9z1llsx2fCeq/PD3pXwfktH/wILDDm3rm8NY/
	cyMbeJsUkPwRN7jmLrniGKVF8F8oN/dA7Pp+qKff4=
X-Received: by 2002:a17:90b:4e8f:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-38e17d96412mr7448999a91.5.1784119951167;
        Wed, 15 Jul 2026 05:52:31 -0700 (PDT)
Received: from MacBookPro.lan ([2408:8256:3310:8e00:f02b:c960:26d3:2b22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172cba1fsm3036140a91.5.2026.07.15.05.52.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Jul 2026 05:52:30 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: wefu@redhat.com,
	Zhengyu He <hezhy472013@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peixin Xie <peixin.xie@spacemit.com>
Subject: [PATCH] spi: spacemit: Correct TX FIFO slot calculation
Date: Wed, 15 Jul 2026 20:52:15 +0800
Message-ID: <20260715-k1-spi-tx-fifo-fix-v1-for-next-v1-1-02024223b08a@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Change-ID: 20260715-k1-spi-tx-fifo-fix-v1-for-next-43cdd0d9213f
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=jC5K1NA2Qi20lryJrip427XM3Y5XYrk3Gmi9jleDf2o=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqV31qlRwpRvEkyvTUy4uncIOL9TlEAlgjz+Jsp
 RUGLads05eJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCald9agAKCRDN9pw2gLgN
 2BgLEACEiMAXQf5d7wzj918XbzCyvgH3JojkX5J45Fs6Qk5AP0sNvlewOxIYinhm1gTStnxa9Ta
 LB+21b+WXPxgVfgGrCnDfxpK/rR7SLZkmgiJNmpXhebrKDHY/2DMvzafZu37EiihZLNqX/dRhTa
 EpZgLe0zfD3pn6czo561TLMaV9SQDzNLLitsnJIfpKtO5FrRq4ChBsUnYNp8CQpk5DMXEaYRbVY
 VNz6e05pjjA8Q0YDd3yhVMAV1KVSgclq81Q+qERowiEDzKDo4oQDxS53et25Fxtj4UkzXwx11t0
 TCAS9FPA30049y1aqfKDMs9d3czb0X8GOj3oLBVPkc9CEX1v7ae32kwjCshr27whNfjFmEGmbRb
 PqzWfjtJ4cWUDJ8oCaOtellab5Eo6PhQ9tlyG1R3W/V55IHTGu9uq7zMKcDMYA8kK8I2js/OR/1
 PaXRfvSdg5kBgkjJ4KRAn3bpyW5s1HlrWOVYzA/XOogRS54EU3UtygZ0ymdFIJ3U/soev51RthE
 cuErPy7pM9cbzy1lFw4/Qisy00azAyJn3mMqsK6knbU/X63chY3FChgNTo5jTa5ptFvSAMGt3Um
 yysNS34cLkUBmFq/IVKS320JKIEoANLVZ1c6n2VjDW19ineJEXurLCk5HY8pwRhMIH5lhE8CQJL bg0AgFEW2lf4GaA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp; fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_055232_611656_09BB5833 
X-CRM114-Status: GOOD (  14.54  )
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

In k1_spi_write, the count variable is intended to represent the number
of slots available for writing into the TX FIFO.

The current implementation uses FIELD_GET(SSP_STATUS_TFL, val) in an
attempt to determine this count, but this register field returns the
number of occupied slots, not the available space. The previous
implementation attempted to handle this via a ternary operator (? :
K1_SPI_FIFO_SIZE), which incorrectly assumed that the hardware returned
0 when the FIFO was empty (meaning all slots were available), leading to
incorrect accounting of the buffer space.

Fix this by calculating the free slots: count = K1_SPI_FIFO_SIZE -
FIELD_GET(SSP_STATUS_TFL, val);

The associated comment has been updated to reflect the logic change: The
old comment reflected an incorrect assumption about the hardware
behavior, which was the root cause of the previous buggy logic.

This patch accurately and concisely describes the purpose of the new
calculation.

Signed-off-by: Peixin Xie <peixin.xie@spacemit.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
 drivers/spi/spi-spacemit-k1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 215fe66d27b4..0faf7ffed676 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -494,8 +494,8 @@ static bool k1_spi_write(struct k1_spi_driver_data *drv_data, u32 val)
 {
 	unsigned int count;
 
-	/* Get the number of open slots in the FIFO; zero means all */
-	count = FIELD_GET(SSP_STATUS_TFL, val) ? : K1_SPI_FIFO_SIZE;
+	/* Get the number of free slots in the FIFO */
+	count = K1_SPI_FIFO_SIZE - FIELD_GET(SSP_STATUS_TFL, val);
 
 	/*
 	 * Limit how much we try to send at a time, to reduce the

---
base-commit: 51ed53630915c9cc290036fe4f430849e23bbf8e
change-id: 20260715-k1-spi-tx-fifo-fix-v1-for-next-43cdd0d9213f

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
