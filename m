Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C95DC4828D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 21:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LuW6dCIwOqAMylIkEvc0Lntk18u1yVV0Qr0isBp8+zI=; b=SnFT+/cjl0aALp
	zdysNjj5ykj6l0Q5FA7QThwrMDcVX6gDF1IL+wYlIH8Y/jF8qbsFBjq3F1JdoWz3+MGUmV0sVthga
	Z12yipZLcXQTDsHFdhf7PKTxuVQsEpXAyQhZ0JeXlWdD+5CrFI7dLk3po1mAZ6BEGSpLqW6kJI0ug
	8oLg0xHNmxVxwEaWOxm7zBqKf15tRmSp5UJjdF4Gr7+oAmZy0FPVsHtjArvyvgNUnhotiVhl1HX9u
	EjtIe7di0wPdEGvGozYrWn155EXRXDUNzi+SinOaJKzqjdYlKJbX5AStQFqkEnPF9QKsrbRZ1OJ9S
	9cXPsmhw3BfWlHeYSZ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWNXX-0000000HG7T-2Cm2;
	Sat, 03 Feb 2024 21:27:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWNXT-0000000HG75-3H5k
	for linux-riscv@lists.infradead.org;
	Sat, 03 Feb 2024 21:27:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40ef64d8955so29205505e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Feb 2024 13:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706995619; x=1707600419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6Y7+XPYPmbCAkQx9j5duSD/dFWM/YcSFb0QEVK+BJ8=;
        b=UvAF4jbxWSB7cWwxhjtdYgjQA8WCkOC5une9+rtPEJZ0iMh+Qqtoz8kGd5vEWRV+Bk
         wV+fLZS2dPvv9L74JzMWUaUSue1rc09xMAQ4fKHf7jF0Von2O7YuqMUqg8wAa9m55/bA
         SEA21H9F/JflWn8Ma0zoOtVeeh7fZ0gLHeQjGJ17K87dluHEvlOI6sNN3cLSQZhUz3xb
         1fpbUL4MbhacAiOIGQ5hbGmt4wKSo0++rEPOi78VFeOOWbCcQ2uC3VbzGRLrzTrtz1gd
         EqRGln24XW3cGJ62L6DFtDSlkt0ayFNaXFGnJ/alz0UXV6l9GMoy3/PX0qlGpTkHIvPp
         lXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706995619; x=1707600419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6Y7+XPYPmbCAkQx9j5duSD/dFWM/YcSFb0QEVK+BJ8=;
        b=bpfnCXMxEq7C3Xs6EJQLvBlSV1zXF7lU02DtjzGfa1kL+UcTwm9IxgA02SV/vFzo2K
         EAGlzZR28wDHOIGcic5btNZJXPSD0UACyLjofLrvumulHoGKEOWKAcNtbduBW1MGdTpI
         98bk8m2Hx9qOQMz1LUUoL41L/IuyWCU90NxNPKPLPCM1B1HKzFDoz1+vSxqW4SZJycuw
         aXZnk8QjCtuS66cmxEWtbAIF5fnUUAfGngPciuL68KRPUPQLQ0KPSGo6NySOuGhgb+lT
         kfyxZCoWs9ylo3bmcHDq7z/1YBSYsOvvpucnykebLUa8eIDfkSg7bTVNdnttlzHLss0A
         bwFw==
X-Gm-Message-State: AOJu0YwBp9ImqlAbmJuiBkV6kEDGaRKmuaZgqItApKYvJRalf7aIej2d
	k8qQ8ekgN34YpNcKBmOsBlA+bbySUSgZjIuuMmx4Q5LhYQMoGl45
X-Google-Smtp-Source: AGHT+IHl332lB7I4w6kkAF8JX6knTYB1InBgu2tYeGKQrUDpG3gvhhkmTyHvV7sFy4+f04GKn6CSAg==
X-Received: by 2002:a05:600c:34c6:b0:40f:b79d:8f26 with SMTP id d6-20020a05600c34c600b0040fb79d8f26mr1670841wmq.4.1706995618887;
        Sat, 03 Feb 2024 13:26:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXqnLwWYq/Hyd0WZBD8DHXU3p2pIPyRURF9CjiMZvwY6hAjDoAszNdnZzBP7ygHFMcsr91EyzYX4D7nYJuPwRycfmf+XBfxuTdcC7hXyGXyfq03Z0u3FiwrK5SR5oRL+do93G56/KFUadfArHZXafNJGUICrDMspG2qoP651B4P37l8QLlUo7BoIbIajX8tYT4EPGSJ58r0Uso2XorfITHgDUdRAp1MJXthr1orup21IMhfLwaY7nAvZXgn89u4jn0ynh2J3XIlvWAtUAtHygFVRdTZwOGvsqM/G6ypBIk/pqB0xkiVX/qAuJXcHbfFIQHy
Received: from prasmi.home ([2a00:23c8:2500:a01:c74c:5b2a:8ca7:1220])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d46c9000000b0033af4848124sm4715366wrs.109.2024.02.03.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 13:26:58 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Pavel Machek <pavel@denx.de>
Subject: [PATCH] cache: ax45mp_cache: Align end size to cache boundary in ax45mp_dma_cache_wback()
Date: Sat,  3 Feb 2024 21:26:40 +0000
Message-Id: <20240203212640.129797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_132703_847821_016EEDA0 
X-CRM114-Status: UNSURE (   8.56  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Align the end size to cache boundary size in ax45mp_dma_cache_wback()
callback likewise done in ax45mp_dma_cache_inv() callback.

Additionally return early in case of start == end.

Fixes: d34599bcd2e4 ("cache: Add L2 cache management for Andes AX45MP RISC-V core")
Reported-by: Pavel Machek <pavel@denx.de>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/cache/ax45mp_cache.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
index 57186c58dc84..1d7dd3d2c101 100644
--- a/drivers/cache/ax45mp_cache.c
+++ b/drivers/cache/ax45mp_cache.c
@@ -129,8 +129,12 @@ static void ax45mp_dma_cache_wback(phys_addr_t paddr, size_t size)
 	unsigned long line_size;
 	unsigned long flags;
 
+	if (unlikely(start == end))
+		return;
+
 	line_size = ax45mp_priv.ax45mp_cache_line_size;
 	start = start & (~(line_size - 1));
+	end = ((end + line_size - 1) & (~(line_size - 1)));
 	local_irq_save(flags);
 	ax45mp_cpu_dcache_wb_range(start, end);
 	local_irq_restore(flags);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
