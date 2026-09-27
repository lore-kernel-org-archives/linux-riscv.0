Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3540C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VnxHhbfjeXMCMLglQnajP5ED9gkKaouUdWPOAyqVnQ=; b=0pX9rGdCKGZhfb
	s5fBtnDpfc9BYXhIoLRCJSgjfrFHSDVjbZBfaeNNS4zwz9LJy2X+MEitvUxHrLZkFIGcJkB26rByr
	qYUe2H7DYv/BPtQxtnSFfl2C1BybNO2U+jOS/8ZTA1cpOfULWbKn+sRu7RleWuLYVARPJwNgzXh8V
	vsUrJO5IpqcH9z7uKUaxJQUh6bgN2qZ9Y7N/t7oNUWmh2XkVGH3Dk2S93nrqWrITdGtawNG7fTVTU
	5gKD4aVKt/5oWIFgJdSL85ZFWoWb7xZOSv0wK6syWaoqPhcDRXUzP6CgguZlkEp+GiGmnXcCFG/N8
	7TJV730X/blxzUZ1GPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArzb-0000000GcBz-3BIN;
	Sun, 27 Sep 2026 16:44:47 +0000
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArzZ-0000000GcAO-1vhH
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 16:44:46 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a59bc470d6so22800341fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Sep 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790527484; x=1791132284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NxJpu186+SP46KgosTgr8E7d2y7iRUk9Jv2CU5ub00=;
        b=lSmuicyB7b0Ht3kRPdkgpqouuSnuRaoknMAfYmtDVZy3i8qb1rAddTBJbmiLFG7Dji
         EA5M5tFXoBYWxu0O002fxNCmaAEow9IMs3tdUbkV9G0NDdm/DuRgh/nOemekHLS5qG14
         xEjZzu8UE+jQc0IjNCZ1zPyEJQPbB3lKxcWGRpSVPjv6tWJU4wyreh6c0ARg2WoT95oU
         3zDLxMjQLhID2bFgyZtqo7hjt/r8rFnsdSYlrcRBGPzHJ4eEdW7kasBbxhi6byh5Bp2b
         JaNKFkuq9EvQ2SxW3tfSe9vjMqyqfzM3776LyFr+dZpm24vxX0bghFQS0WQgn1oG9dvJ
         +y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527484; x=1791132284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NxJpu186+SP46KgosTgr8E7d2y7iRUk9Jv2CU5ub00=;
        b=G2UYDj3wdPXXJK/z/TwIY1RwzylA+Doi8b458z6Sl8EPUZibqDX/HYet35ZdV3fwgS
         u1T8S2ZnGPZl4KmG/bu9w9eoUMZugz9lZN18eModpYxNfrLhsInGy0rlghrCdLB91tTc
         jX4qSJ5w9G3WHDdzT4N16Y6nxWglVG4zKQAjbX6IHPIr/ZIW6H4JeC+gUlEwYor3hR/I
         qftsm39DjzpmX9WiPUJZdWRi9IOnXEYxCnxkG3ZZCzMpsxzTSwPRt9W032fSPBUjIBN0
         SCbBa0l69dP4pi0cL1kjLlW9hOCoyqfUhODnQDa7LIMntxGVpBxBOyd1nHnf5K6L4Ni4
         wssA==
X-Forwarded-Encrypted: i=1; AKwUvBwIFcWp2wOsl+cXTqoJ/I/JuXV5LssdP5fXdf238mHfY9W4/WOyf7o/+TJOpVlFBApNKnB2g57mlwAFnw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLQCcghwUAPNH5+o/boYCXl/sFP3q7x54cP878hcwhEzmj0cs2O
	uBG/bkTEkZ8VAfTjFp+gJIXTFxpkxI6MLZS7BBXvrgmatYYrt7Jr4N0F
X-Gm-Gg: AYBFou1fGwkG5W/Ikt5lECn8trvMTgMNc/JZ22wQcE0GEV+ydIgKbpL6H8KJV25jYah
	TIqoXzMjlvRtDfLWD/QwTOd8jv7JcJoanhXETXy+f/BhhKf9HwUngZ/yj1KjeIR6aIN2BJL1rQp
	NCVQLUgA3WZXweEQX/4COflOqR0Hp6s8Papv6SBCSkMh8C085iKiJk3d41ZbMc0/3H/Ihe/4zoO
	9ho/ew53e0WXaecj5EXQIM6nezAoiS+7AeMBosUZVY85oDxxyyh7Bk92k/t2eJSQdhf3VWdaxQ/
	ilz2NNkWcZTkLa/I9TRY1daCiVmcuRWPhv5OwiWoFy4wgmGpjbHhzx0z/7I3Trb6pBpDAwneGkf
	kV5Vm2gA4oftr/ULMN9oCn5raZUeXvhaw+mbiwkixSKSmevjh322w9vsZetmIX00j1BXrcxO1cU
	qJK8IA7hJMOdQ0c+Oosqj4Gc2jHymwYWPGnfAU96grbsAcsIrkkIOgAbLETMffgUDbQv16Q8AHa
	6/tKeeXxWySqCDyidAfK/IuzH971UDOWai4antoBeM=
X-Received: by 2002:a05:651c:a164:b0:3a5:f041:d7c2 with SMTP id 38308e7fff4ca-3a63c0f4a16mr25583771fa.15.1790527483544;
        Sun, 27 Sep 2026 09:44:43 -0700 (PDT)
Received: from artemiipatov-ThinkPad-T14-Gen-2i.. ([185.119.0.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580b28sm22425781fa.11.2026.09.27.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:44:43 -0700 (PDT)
From: artemiispatov@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: tglx@kernel.org,
	peterz@infradead.org,
	anup@brainfault.org,
	atishp@rivosinc.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	conor@kernel.org,
	hui.wang@canonical.com,
	artemiispatov@gmail.com
Subject: [PATCH 2/2] riscv: sbi: Accept SBI_ERR_ALREADY_AVAILABLE in sbi_hsm_hart_start
Date: Sun, 27 Sep 2026 19:44:18 +0300
Message-ID: <20260927164418.3090433-3-artemiispatov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927164418.3090433-1-artemiispatov@gmail.com>
References: <20260927164418.3090433-1-artemiispatov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_094445_524849_CEBE2D47 
X-CRM114-Status: GOOD (  12.69  )
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

From: Artemii Patov <artemiispatov@gmail.com>

Commit 8ac00cddc1a6 ("cpu/hotplug: Skip kick stage if the AP is stuck in
SYNC_STATE_ALIVE") changes the sync-state switching in kernel/cpu.c so
that a second AP bringup is no longer aborted. For that to work on
RISC-V, sbi_hsm_hart_start() must treat SBI_ERR_ALREADY_AVAILABLE as
a successful start: HSM returns this error when the hart is already
running.

Add the SBI_ERR_ALREADY_AVAILABLE -> -EALREADY mapping to
sbi_err_map_linux_errno() and treat -EALREADY as success in
sbi_hsm_hart_start(). Otherwise the error propagates through
arch_cpuhp_kick_ap_alive() to cpuhp_kick_ap_alive(), which fails the
retry and aborts the bringup.

Signed-off-by: Artemii Patov <artemiispatov@gmail.com>
---
 arch/riscv/include/asm/sbi.h    | 2 ++
 arch/riscv/kernel/cpu_ops_sbi.c | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5725e0ca4dda..25016f1a9ad0 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -664,6 +664,8 @@ static inline int sbi_err_map_linux_errno(int err)
 		return -EINVAL;
 	case SBI_ERR_BAD_RANGE:
 		return -ERANGE;
+	case SBI_ERR_ALREADY_AVAILABLE:
+		return -EALREADY;
 	case SBI_ERR_INVALID_ADDRESS:
 		return -EFAULT;
 	case SBI_ERR_NO_SHMEM:
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index ee6e4b5cc39e..5acca3f4f8c0 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -26,12 +26,17 @@ static struct sbi_hart_boot_data boot_data[NR_CPUS];
 static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 			      unsigned long priv)
 {
+	int err;
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START,
 			hartid, saddr, priv, 0, 0, 0);
 
-	return sbi_err_map_linux_errno(ret.error);
+	err = sbi_err_map_linux_errno(ret.error);
+	if (err == -EALREADY)
+		return 0;
+
+	return err;
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
