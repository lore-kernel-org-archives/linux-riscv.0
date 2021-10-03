Return-Path: <SRS0=8Hg0=OX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C98C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 00:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B683617E1
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 00:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B683617E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NP7pmokwM2XwysQogxmu2ehpfkQ14YrJiCvZHJ0kByc=; b=vLfD/TOR0nc9ot
	R18n93qPkDGL6FZ93n98BSrrTlRZA/sRLmWtsC7TZrrIOYRtFuqpuXtUMmZjodHp8ejgjK4m7Syt4
	q+IB5GFy1ysK/o/MHkcaeYQQ6FzeYuKxuc9RH7OyqF0OOFaoJ2cVYzIaqyKXqQ/gt/k9o/kS9ER40
	SMM6UU1i+ahKgzjZLd6g5N0miaFQsejbglubVzFux8l6Cd5rVY4PwnSdc1hkm0w3dl9YzyY1fkfa0
	nG84+6y0F6cywhWzngdU0UVwcFgJR+hMKxIwr3FScK5fyhUb0EeNUE6elXYpFN71JFcIIjpe5teL0
	Jn0jCAwA0M9Qb0qv6glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWpmr-002ysS-Ug; Sun, 03 Oct 2021 00:55:29 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWpmp-002yrr-RS
 for linux-riscv@lists.infradead.org; Sun, 03 Oct 2021 00:55:29 +0000
Received: by mail-ua1-x929.google.com with SMTP id 10so9536112uae.10
 for <linux-riscv@lists.infradead.org>; Sat, 02 Oct 2021 17:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=WuNiwrSrEnX4dMPY+G+mXt6Rdx6le2ov5eo31uGaV4I=;
 b=bPORE+Ka6bQ6Ix9WoLbi801Em9kp1jiG0FyOFqPVZt65cg/2zt5ZuNpxySSs0hMhvQ
 ZnoU2ZEzcdWIcy11FGW1VofxIEHe7J4HSnuQtiCf630/RnccOOk81eSeU/KHzch4T/hy
 C1BAMcOgRuQq3GksdQWDdupDqRC9x5KzgZC+IAyAF3uz1tF5Hv0oPI9N2HomeZzcp3Yn
 RvXBXfxNVv+S8IIshKvE4V+2MwNCkZ0niKddHfZPN7VVdp5iP4+H1lue0twzVCoqTt0H
 fvBJgbGQB/9BJVohjDNI58sMDU4fQQKjJCPgtrESqNXxTfXHmUviJnW8Vv6T6D9e4KHv
 M83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=WuNiwrSrEnX4dMPY+G+mXt6Rdx6le2ov5eo31uGaV4I=;
 b=VZGHBFzuPEMJMDcR8Qa5qSR1s5v4AdODbFvW86Af2/htRZg7f0STfr0Yv1U2lKQFF9
 SyipevZEEJN58FhbscYNe5VALyaMjQLUQGjz5sxp950D1sWv9L8XXnwd7wpjY67VKCpr
 lMxc/0ShE6acHC6luxA5x+XVhxElkvIeKdrQnRXdU7yQZRw+fVKApKdwhtLZefmhOkgn
 4TZZd7hjMubE/Q9AsdAPAOvvhF1chx2PW6vwOA+fxdpeczHSmeTJ1w2uPYePYGenjtAU
 dMaetBoMHVElHP+b6dYto7uODviNJguRENswecPPoBjDOxzdWjrsCtPGGSivlUC2aKe4
 aFng==
X-Gm-Message-State: AOAM531IkASPnbeg9Dg5sVVef1zdgXEZ5h8Vu+9Sz8o/U9ppuvp19Eul
 C8dE7WNJCK9jsQQDYnA3fOaMUQ==
X-Google-Smtp-Source: ABdhPJzSW3IDnK2jC80wagzqFwX6QHpCIBNq6auYYvJl8xfq3QRo1kdhsuuVeVyrLEVwd1hGJp0MTA==
X-Received: by 2002:ab0:53c8:: with SMTP id l8mr2937713uaa.26.1633222526611;
 Sat, 02 Oct 2021 17:55:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q26sm5273759vkn.40.2021.10.02.17.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 17:55:26 -0700 (PDT)
Subject: [PATCH] RISC-V: Include clone3() on rv32
Date: Sat,  2 Oct 2021 17:21:20 -0700
Message-Id: <20211003002120.198752-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, christian@brauner.io, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_175527_913188_BC2D0B48 
X-CRM114-Status: GOOD (  11.18  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

As far as I can tell this should be enabled on rv32 as well, I'm not
sure why it's rv64-only.  checksyscalls is complaining about our lack of
clone3() on rv32.

Fixes: 56ac5e213933 ("riscv: enable sys_clone3 syscall for rv64")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/uapi/asm/unistd.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
index 4b989ae15d59..8062996c2dfd 100644
--- a/arch/riscv/include/uapi/asm/unistd.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -18,9 +18,10 @@
 #ifdef __LP64__
 #define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SET_GET_RLIMIT
-#define __ARCH_WANT_SYS_CLONE3
 #endif /* __LP64__ */
 
+#define __ARCH_WANT_SYS_CLONE3
+
 #include <asm-generic/unistd.h>
 
 /*
-- 
2.33.0.800.g4c38ced690-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
