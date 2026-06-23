Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCEFCDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FpHLR5ObtYi3PIrHbo3LipuMmjoyvkGmOS/Ck3p8R/I=; b=i/w8AtvYa8mukL
	Gh8OJl1qCdhig4nZmJYnMcbKD5+P5y9qCnK6x1JlOWbFrwg4nWFSfQ42f7XGNpEcv8onHRZDYcCop
	+7bgaYCiKQ+j5SdvjIrK7f8+hRwPgMnotqNAtSG3QKqRUGmJbMSFCNB7AMolUNidGtaQzO5aywzRO
	60LWi4HoPNtXfdIf5dJWqtV9kp9EQ1KW1+DsmGbpnYZABeatmNvrCGljDwmQNo9FczGHc4PSThp/7
	HBePProzNSNjHX1tppyBD81nbI3vdlrZgpZYxsGCIe3QCThB0c/ef+lXSqBomvbxxri+e7RdcKitQ
	uHsf3qhmFALSIuH7At3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwc4-00000005vDm-0aC3;
	Tue, 23 Jun 2026 08:36:08 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwc1-00000005vDG-0U0q
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 08:36:06 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-30c0a352e33so663533eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782203761; x=1782808561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7skaPzF3KTUzEOfw0LLQ9pyyDHIgVG/D2dDrx0ZYAA=;
        b=YoBkcaH0M1+t4guQFWm/5jLHNK3XK/vg+qbmghnvTJ9WhHwObAVeapiYrwvQfc0Weo
         lP+J5mEUwhe0nu/TVn5dxS5yLEhfImZilXv+FfsGvPhZVv0NLZ5rVsWWFJOu9mtMRKzB
         rBy9vszk+i2gKMBThi6qzubBMdcqZs42YKvdDidAjfR92jIVWsZTauiic2zwdEC4ctg4
         6PQl2TbM0nGukbLYndgrARknshPIY6tQ+1eAYezP6/16HS5PTaLy44JVSO5bGVb3Mhx2
         bVziNT/SpgjVudVNA40gmzUYVHphkLACTKQ0mTxWSRi6kWStWZNfBT/TO2YPxn/i5Fiy
         hl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203761; x=1782808561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7skaPzF3KTUzEOfw0LLQ9pyyDHIgVG/D2dDrx0ZYAA=;
        b=feYmF+f46cwAL5BNiwK81rMS60Er/4OaudsYPx1OJkvu6qGXS/Fea6iLV7l+MHsU3t
         XY6TPttiYHfoxZw8HVs7JpE5s0SAOlRRkZTDX01tPI++U4c5vuiWSNwae3FBhaA0eo3E
         2J3y2WRGY6FqdFTs9mh5zXyFl4ebT4BMqZ/XGtwJMXb1G5/Cr7UACVemuSfxM3OMIzJQ
         EytFy+rV6M4qi5oOK9Oqyea0RhZYAeI+jetWNx4bGeAdvSEkcZ9qNNi3QJktt0WxnmDy
         rRoSMsXvUU0gbGKXi47Rn5W/DTiSi+T9A51xfcFtTwGhpIdCrGRTvWJOCjlZYGqEa9xW
         mN4w==
X-Forwarded-Encrypted: i=1; AHgh+RoY9lxpy5/pZHq9KsLKT+7WThrqSspj2RGMwVGrG3S/8PnzSvDC8gUnN+QZBGa8moF24hRN5AVnZcDEOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfQUyFfG6kF8g4jftNv5qQR4+0QPxxxeEEhnNuyBFUJIzomqSE
	Bqtem3kIhOx2mVsWMOYYY1DQhL/SHhCN5XBcbkn8CqqTjIFl0x87gr8v1/X0ERvIKz0vRjCJZjT
	V1K/p
X-Gm-Gg: AfdE7clJ/6ia9DPPqkIXHH/k44IHaIjc0kniU919YbdvMruRuu7sApJ7iI8DZ0aXeKZ
	N6isLtST0P0tWMjgG8nQxWLG6VDdJDVz+FuwDSh+4qs7vb82mHqVuzLRpcBEbU/QKDUjRKJy4QV
	a4ClwuffvnS5Ar+wpwXljk/oN2IeJ1A2VognsDsn3ClVK54M0nV3Rhrp5nzXtIj0dkEYYDoFuBs
	+OMqN41kGw6xaW22bnJf3RGw23gpJqjmK5wB/JYTgBuzaA9La+kAXfJ9nUEi2YHR6CPtVxVKJgc
	6ZeRb8jlMtrPa7hg4qRH4oI+JSAoJN5r+G/ES42vfiossDM8p8uwNa9/5ugn5xcfrEEBs9pHCBU
	InInnp1DXzpRF0/LQhHTZS1VCV/mKnkowjyZ5LduE0jesakd4sUEdrXD0lsVR/yJufh85WbrTMZ
	iZox2jCqy57F06JcLxwlPC6fsbkqS/fAVS/jRrNql6rx62mg==
X-Received: by 2002:a05:7300:aca4:b0:30b:ec2c:26d5 with SMTP id 5a478bee46e88-30c555f467emr2169370eec.15.1782203760610;
        Tue, 23 Jun 2026 01:36:00 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f0a9sm15190216eec.2.2026.06.23.01.35.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 23 Jun 2026 01:36:00 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: uaccess: Add a fast path for small aligned copies
Date: Tue, 23 Jun 2026 16:35:51 +0800
Message-Id: <20260623083551.86021-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_013605_312336_D1EFA8E6 
X-CRM114-Status: UNSURE (   9.03  )
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

The scalar user copy routine currently enters the word-copy path only
for copies of at least 9 * SZREG - 1 bytes. On RV64 this is 71 bytes,
so common 32-byte and 64-byte aligned user/kernel copies fall back to
byte-by-byte copying.

Add a small-copy word path for copies below that threshold when both
source and destination are SZREG-aligned. Unaligned and sub-word copies
keep using the existing byte-copy path, and larger copies keep using the
existing large-copy paths.

This is a generic usercopy improvement. One common case is Linux AIO:
io_getevents() copies 32-byte struct io_event objects to userspace, and
io_submit() copies 64-byte struct iocb objects from userspace.

fio libaio randrw three-run averages improved:

  baseline:   read 560k IOPS, write 240k IOPS, sys 68.60%
  this patch: read 593k IOPS, write 254k IOPS, sys 69.03%

This is about +5.8% read IOPS and +5.5% write IOPS.

lmbench bw_pipe with small messages was also improved:

  bw_pipe -m <size> -M 16m -W 1 -N 5

  size   baseline MB/s   this patch MB/s   change
   32       62.52            74.54         +19.2%
   64      122.57           155.31         +26.7%

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/lib/uaccess.S | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4efea1b3326c8..2d78007f10d01 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -70,12 +70,27 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	add	t0, a0, a2
 
 	/*
-	 * Use byte copy only if too small.
-	 * SZREG holds 4 for RV32 and 8 for RV64
+	 * For small copies below the large-copy threshold, use word-copy if
+	 * both src and dst are naturally aligned. Unaligned or sub-word copies
+	 * are left to the byte-copy tail.
 	 */
 	li	a3, 9*SZREG-1 /* size must >= (word_copy stride + SZREG-1) */
+	bgeu	a2, a3, .Llarge_copy_user
+	li	a3, SZREG
 	bltu	a2, a3, .Lbyte_copy_tail
+	or	a3, a0, a1
+	andi	a3, a3, SZREG-1
+	bnez	a3, .Lbyte_copy_tail
+	andi	t1, t0, ~(SZREG-1)
+5:
+	fixup REG_L   a5, 0(a1), 10f
+	addi	a1, a1, SZREG
+	fixup REG_S   a5, 0(a0), 10f
+	addi	a0, a0, SZREG
+	bltu	a0, t1, 5b
+	j	.Lbyte_copy_tail
 
+.Llarge_copy_user:
 	/*
 	 * Copy first bytes until dst is aligned to word boundary.
 	 * a0 - start of dst
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
