Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17C1CC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 08:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zr+z4urPpcS5gXAHmFGskjRaIGAAGhDcsXArK6GxYdk=; b=y7FbpTYS9/raT9
	W/C+M2S9Tu4QyV31pgse4uL45HdMv3PT7ZpB2TkN4cWNzMFeOQtZ7wQzCcC3VhtHDcjAngVuXflcd
	DyBgNW/LYSp9M6tRkBVYZNq6A4w2kqAvUa6gUjmZsyOHyrD5qiByCoudOeJda4VXnZpfhOl7oOKtB
	Nj3EvIF4II2zBVt0zeVA8Cl7RQIPCSawNb+6uWgPNKYaEjXZ2HFaWipJJxUuBfyyBQblBWy4A+Yln
	883nWgTWH5Ehjr9Orobc+YIodupdldyIEdgfllxGu30MB9be8s+/UwcW13+TDsxtzevuabX1U0fm4
	QbrWVaRwamWp+bv7Ht2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH5M-0000000HBG7-1xso;
	Thu, 15 Oct 2026 08:45:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHH5L-0000000HBFe-1nme
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Oct 2026 08:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=FaMY6Qi3tuKPVGXdwHUK3kUj4kFnOVhOuQaREJO4d+s=; b=N2Px0SCyEdrsSszLHDO2Kq7Y66
	80qmvPieCJYoDyVyqdiYTlYHzUS5Pqaas6LKPgbe9IGY55JlFGfvNXiwg47hkGvzf4RY1iMzjDFAL
	8h8WD1Qb1wyeOBA/DIXtpiVHEBhxlXhBwktxjLtWxhKCFc8M4X9sX9U60qOm2xz1hDdx5xMaYYcF5
	Q7B/dwJzio4iu8N8PK1cRQK3LFCa+xvWX9DQkzdZWPPdk0rqbubLguknEMnKKxhWWxsqFHlmeN0rB
	Qnisk7kpc0G1+IIr1b5A9wP55EKR/d8vZQMZm/iK8PvpxlLito4U7gBfQ8x2/Z6BkBaJeai9oC3dz
	yn12rl9w==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHH5I-000000007oB-1om4
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 08:45:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so22575055e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053906; x=1792658706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FaMY6Qi3tuKPVGXdwHUK3kUj4kFnOVhOuQaREJO4d+s=;
        b=M9ssDcXqxok0+85x4e5b26bIKpQIOPreWNxGZMXKglDGT5N7LRSxZsHmvIm3ru+Pnh
         W+3ZdW2csMValEGYycfB4ZgsYEHZJm3dbRBzM92rQuCpcbvn/z08fMo8U/AebT/85jB9
         UP0G0dJ4PKaflcRggNxk1MlRIUIWjp3Glygm2dqElnf93IACAkiD4lxgkgvjWnr/Hi9R
         uhAg1my3Sn+2HXEQSSJyRVZJ0h6Vg9xatO4lGr7OexvnY/Y0JIT9Yy+jdJvOyxONoSy+
         aK2Eu91RJHESE/wloGc+VeyhcDeRThmqUgzwfP1NOpOTO38IxlNTNa0qIuunQWwaXAbS
         a+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053906; x=1792658706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaMY6Qi3tuKPVGXdwHUK3kUj4kFnOVhOuQaREJO4d+s=;
        b=N9lB2vRoJmosazPzD+bEnSjWm70MHvXv5WFdpWbHgtO+UT6sBeJdbWaQ/dEuQAb5Vx
         i6Jr8eIEFO1ZHbaNY5JvYmvaKsBJ3xg8TS6izvrpzypMivO1Bzvqdt+iBnzhvlhPbGdb
         2KUyMDyKEYMxnm7Ik3b8SJ4zYoAIA4PHyO7lgVjfh6pm2c3rmBxg8+kZlAo9Q2fQa1hv
         m85jdN1P4rxekna+l0m/ga/dvscVKLW2pJyjxXio0VVKwGEYTY5gqEy8cY9LG0yML6L3
         04Ms+mCM0VpguK+4dD9KIxlEsK6VcKcYjOJRDCsMYCOX3xl+K+976C1h0UIYxHG5TEeY
         /KQA==
X-Forwarded-Encrypted: i=1; AKwUvByz4I8ycvVvJ9PA81JFz7io2hFjM2ZEb77UsjjQDG494ULWnJKEC1ldxPqxKQEsBhNt3ptwzOlBr02Oaw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLvta2zzCcHCwDCHFUwZg68RpyXPxZo6eRvDd0kbk/Wb6sK6K5n
	TA3BgFjxFPpCTh04eFJ+D0IZawbheWmnQu3mxllfRDwTs2J1/oJ6/g7N
X-Gm-Gg: AYBFou31wft/+J9wfnBwWbrpifdEqe3C8BLimvIFcoGPGx1gcvm7BnaX25O/BS3f49r
	WBTscHqxg09Ho7cZ3ebXrUSnKkAW6qqlmQxAsTEaCBaIFkwGfbmOgQC0Qhgzzxwlxyq5LhCxsbQ
	ypPqHMcp+HvEKqgkqTDQMGjLh6iHiqR+32WU9aGsZwx7g0sqp1VSMzCoIxOms+JxmoGYUHu1e4f
	JbS6GdWUdOCOX0jCP+d3sRPtuVT18THhvzogZHcI2tDRyjghr8DdkXGwoWtaqMkXcXahuoWNSzB
	6pwKuBfEiTkn80wFP4DPyZQdVgHCCViIFjyvzHTZBrJxiW2AYXpwYhYOKZ7+yFaFalixKZ+dfLm
	ZjrKoK8EBxE2jJdtqw/Vz8Rwg30gpAD1cUF5htaWhAjOOxNJsu+y3EgtA0sBA57c2HjVjn3ZQiw
	V9BPOOOUpwXok0fYm3Dcqh/KbGI5C+aLMpYnem8rZMxQ7mh7hZY/hQe8uR+HZbxMFAZDCOk3IrL
	MQhCmldHTDrisoiJhJNNJg=
X-Received: by 2002:a05:600c:4ec9:b0:4a1:7739:f9ab with SMTP id 5b1f17b1804b1-4a18e4ca953mr372100775e9.20.1792053906052;
        Thu, 15 Oct 2026 01:45:06 -0700 (PDT)
Received: from LAPTOP-AVI.taile24b5.ts.net ([2a06:c701:4778:c500:7c03:57fb:1f59:3fa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm56537925e9.7.2026.10.15.01.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:45:05 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2] cache: sifive_ccache: propagate IRQ count errors
Date: Thu, 15 Oct 2026 11:45:02 +0300
Message-ID: <20261015084502.3061706-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_094508_563333_0256B0A0 
X-CRM114-Status: GOOD (  13.68  )
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

platform_irq_count() returns -EPROBE_DEFER when the
interrupt provider is not ready, but
sifive_ccache_probe() only checks for a zero count.

-EPROBE_DEFER seems to be the only negative return
code possible here (currently).

A negative count skips the IRQ registration loop and
allows the probe to return success without requesting
a deferred retry.

Return negative IRQ counts so the driver is reprobed
when the interrupt provider becomes available.

Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platform driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
- Combine the negative and zero IRQ count checks as suggested by Conor Dooley.

v1: https://lore.kernel.org/r/20261013095756.1084568-1-thnkslprpt@gmail.com/

 drivers/cache/sifive_ccache.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d52..f2428f7ea373e 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -262,8 +262,9 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 	quirks = (unsigned long)device_get_match_data(dev);
 
 	intr_num = platform_irq_count(pdev);
-	if (!intr_num)
-		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
+	if (intr_num <= 0)
+		return dev_err_probe(dev, intr_num ?: -ENODEV,
+					"No interrupts property\n");
 
 	for (int i = 0; i < intr_num; i++) {
 		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
