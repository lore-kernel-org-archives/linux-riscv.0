Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3735C98338
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dpyalORpczrhsdG5LQdHsgWnN2m3kRK79eBchqVjyE=; b=nSIKyEkWUwd55Y
	8voOISyqKfXM6CwrXlb37VjGnssx4ccNksAHQaFvUg1mLtJLoi32M43MPJ//+L3z5YlqDKN3lEpgJ
	dMRDBChSvbmUD2EYSglmxkj4jVZs/HoPicyvatSnrCMf4V2kgQ5Shj8wn7/zLpugzXDMYOmXHwpE3
	O42juRQvFZojonOhEg03GoGAUzn+KzLkBw3O1F/01YIO5pe4msUUMmtcpsFTAFQAVTc/CvXNDZerV
	4oZ5OCuWkXjVGn7sCGkNXnKFGYoyfP5QoBsbr0x7l+Skqmgx6XwcM146Ln1bsx+c87k/YAxotMgs2
	V6TLpHM2YoO8/yKUqXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArzX-0000000Gc9z-2nHn;
	Sun, 27 Sep 2026 16:44:43 +0000
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArzV-0000000Gc8s-32mc
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 16:44:43 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso16568661fa.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Sep 2026 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790527479; x=1791132279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dv/smFAyNI+/T4zmB6bAUmDWj4koE82HeZ/XI0Xh8LE=;
        b=OenoJdVsTTFBJWmJXy1+O7KiqOJ+n3rlSBulo9HLqE0TZsR+m76oubEdlZ9csWVTfe
         sgvDQy0Ixjuwl0GNxa5AELIM8chz9bpyhuRh9eTUwqsutiFIiC2bbBrLQFXXxo2axtvl
         5Nw3BsMjGGHDlXWltOr9FchSifh4PId3JASmXKAZaqxvFvoFBH89ObOmnNDc4iKxzeBt
         fJ4PmEVr5EpRqv2t0xhPc1V5ztNmCXC4JOYaEKOd662+qGEudbeCMUp84fYlA8PAWKeT
         co0K2nDB4xYT9QxQYD4NGxFofSIkU5/UmGxrf4vVAN7mItp1WaScW6z50m96U8tXuKLl
         j4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527479; x=1791132279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dv/smFAyNI+/T4zmB6bAUmDWj4koE82HeZ/XI0Xh8LE=;
        b=O5xq2vyzR4hvl4zhIkV1DwyByQG+hc+dd3ohJ044CPteig1D6I6XkZpAS48ShuDsU1
         VDw7WIyLEyXtOT2hoA2dZ37LqcBcOZkS488tEzmJiRrQWQdgOyYgQNaQcKyGg7EdxXp3
         DDlosepfSUghQGcOVp4oLnZG04hvaLVdm9HkmCP1hFUdjJ7qEr15TrwDuMnZI4r8k9Hi
         9NJUXNl6/ofV5gj0kg0Chqq2HOrxIzoP83XjKtg+c/3TWMaPaOMGPd89QW5wuVKJvsjs
         bc5we03TmwHha/rx9aTdfPPH9yDWswQXhkQEU49R3etnCjVNPPj0AW6IzR7ybj1ZUrWT
         jg8g==
X-Forwarded-Encrypted: i=1; AKwUvBwaxfnWqUwY/AdzLEUHXoXV57TXbYjffcjnVsc/283+8jIXbRkj2dtT6BrwcxmzyObTR1oATj3a2iJNfQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIEmZuZSDUgxmwANzuu+nCV1uh2VO8iUdRp7gFr7y4GVySCwyTn
	K+OC09C8XheVnCeyqxD1jQfyo0Ur74iGIxzDVpR9f/zLdX/P2j5j+w4b
X-Gm-Gg: AYBFou3UFuJkhM+XtNBFt95BOcgTMW9vlLdOJ71hFkGjMFeOPnVHQnw0xgurZ9+HqN3
	cR1/xjbrFh5LwOxLlElP3zLbVcXcxZCwxYCGabIwZ91yKUBKT6sF9PAjcW15iOtIS7vCzXMUgDn
	xTMx+bipDoYo6Dg1ssQ8vTdxzQd0RfuTfQc9wfvZoneOuc1JEa4yUGqEUPDCg/zz2zv3lcBxJcK
	kOXssEkOYuon7JsBJaDdIRF6TYF35i06aJv34xwOxzFTItw5l0751INJ07BN2nNwmhud4Dm8BP5
	LY9ieo8NQwvTZ/E/R5/RO83uoueDavbhSanWRp9K7RrbIon6qc8wYse9N39mr0y1n9S51Ezi+6O
	FV23BbqwM6jdUTpUWd2/1kqNOirLHtAiaSL0yA9vaavtwankWGDH57X/vhhR3BVq2WPHwcop4yc
	1iLuCFzL/06LqHbT2MpCQVl8mQYAwQxe1rMnE3rAZamIICNZ8hWEe5qDjNGwtfS+nRxzndo/yM5
	/PL5qMc9k80IR1IB2UEGxjUNy4RGpME
X-Received: by 2002:a05:651c:b23:b0:3a5:e027:1b49 with SMTP id 38308e7fff4ca-3a64c71fe9bmr18935721fa.2.1790527479362;
        Sun, 27 Sep 2026 09:44:39 -0700 (PDT)
Received: from artemiipatov-ThinkPad-T14-Gen-2i.. ([185.119.0.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b580b28sm22425781fa.11.2026.09.27.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:44:39 -0700 (PDT)
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
Subject: [PATCH 1/2] cpu/hotplug: Skip kick stage if the AP is stuck in SYNC_STATE_ALIVE
Date: Sun, 27 Sep 2026 19:44:17 +0300
Message-ID: <20260927164418.3090433-2-artemiispatov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927164418.3090433-1-artemiispatov@gmail.com>
References: <20260927164418.3090433-1-artemiispatov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_094441_795266_3C29FB7C 
X-CRM114-Status: GOOD (  19.13  )
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

There are scenarios where the AP gets stuck in cpuhp_ap_sync_alive()
during bringup. For example, when the AP starts late, the control CPU
may time out in cpuhp_wait_for_sync_state() waiting for the ALIVE state
and abort the bringup with an error.

The AP eventually reaches cpuhp_ap_sync_alive(), marks itself ALIVE and
spins, waiting for the control CPU to release it. The only way out of
this loop is the compare-exchange in cpuhp_wait_for_sync_state(), which
is invoked from cpuhp_bp_sync_alive() and transitions
SYNC_STATE_ALIVE to SYNC_STATE_SHOULD_ONLINE.

On a retry of the bringup, the ALIVE state was treated as a CPU which
did not come up: cpuhp_can_boot_ap() overwrote SYNC_STATE_ALIVE with
SYNC_STATE_KICKED and the kick stage tried to start the AP again. That
would require the AP to run through the boot stages once more until it
sets SYNC_STATE_ALIVE, which the kick mechanism cannot guarantee: on
RISC-V, sbi_hsm_hart_start() on an already running hart returns
SBI_ERR_ALREADY_AVAILABLE and does not reset it. So the AP remained
stuck and the retry failed.

Fix this by treating SYNC_STATE_ALIVE as "already alive, no kick
needed": cpuhp_can_boot_ap() leaves the state unchanged and
cpuhp_kick_ap_alive() skips the kick in that case. The retry then
proceeds to cpuhp_wait_for_sync_state(), which performs the
ALIVE -> SHOULD_ONLINE transition and releases the stuck CPU.

In cpuhp_ap_sync_alive() promote SYNC_STATE_KICKED to SYNC_STATE_ALIVE
only, so that SYNC_STATE_SHOULD_ONLINE set earlier by the control CPU
(e.g. when the AP re-enters the sync point on a retry after a failed
bringup attempt) is not overwritten.

Fixes: 6f0621238b7e ("cpu/hotplug: Add CPU state tracking and synchronization")
Signed-off-by: Artemii Patov <artemiispatov@gmail.com>
---
 kernel/cpu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..eb9cb7c3e565 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -392,7 +392,11 @@ void cpuhp_ap_sync_alive(void)
 {
 	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
 
-	cpuhp_ap_update_sync_state(SYNC_STATE_ALIVE);
+	/*
+	 * Compare-exchange failure means that the state is either SYNC_STATE_ALIVE
+	 * or SYNC_STATE_SHOULD_ONLINE, both are acceptable.
+	 */
+	atomic_cmpxchg(st, SYNC_STATE_KICKED, SYNC_STATE_ALIVE);
 
 	/* Wait for the control CPU to release it. */
 	while (atomic_read(st) != SYNC_STATE_SHOULD_ONLINE)
@@ -414,7 +418,7 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 		break;
 	case SYNC_STATE_ALIVE:
 		/* CPU is stuck cpuhp_ap_sync_alive(). */
-		break;
+		return true;
 	default:
 		/* CPU failed to report online or dead and is in limbo state. */
 		return false;
@@ -822,6 +826,15 @@ static int bringup_wait_for_ap_online(unsigned int cpu)
 #ifdef CONFIG_HOTPLUG_SPLIT_STARTUP
 static int cpuhp_kick_ap_alive(unsigned int cpu)
 {
+	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
+
+	/*
+	 * The AP is already alive and waiting in cpuhp_ap_sync_alive().
+	 * cpuhp_bp_sync_alive() will release it, so skip the kick.
+	 */
+	if (atomic_read(&st->ap_sync_state) == SYNC_STATE_ALIVE)
+		return 0;
+
 	if (!cpuhp_can_boot_ap(cpu))
 		return -EAGAIN;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
