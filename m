Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CB9D11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aW1FD3pcwIbkYQ+YNRMokMd6Kip3stem/winz/GWZIg=; b=trqZPhgPrvrdrh
	EaMHZXfUwUPtdz+Y1+cDb9/A48oQWqty/Cv6RmhNJQ+2Ev4fDs91MAXdN44VXWCYuEbeDx0kgg8aS
	tDXjI7gSflYHsg+lB+CSTUa5fAFsW0qMq0QyXelKiuRk4LCSf+45E3YROHGfy5ym3RTwUEvzK8U4f
	rGZwH1a31d1lsLQONL2IIMFLD69kP9/KrIQ+756FVcwKevMfPda8vbyqzz1hFi7Ffg+mylTdZEeIW
	xpPFpeR3Gb91L+tV4VSJMHES8VfPimZJLJ7qmoaOy7X5ThnrHHps7B75tVfP+9mVXdMgGNYDbUh55
	OgRtpB58bKsdvYfg/VfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjJ-0000000GkSQ-230s;
	Thu, 27 Nov 2025 14:12:17 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcjH-0000000GkRG-1bln
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:12:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-341988c720aso781782a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252734; x=1764857534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0swZ8Ypan+oXrthAo/pUrKpZWoHKJGiiGThfa6sHH8=;
        b=MLr+gfPKdjCWPLu3QnVH/2HaFtLsXikMTss0OWojPypEiiV9Dg3wwMp2QJmqvj442O
         JHnUYv/VVbYh68A+GmDvNTvO53AM76kWmZgU6zBPEUw3fETN0zWCMR0zI3hEKstYmdW/
         VW20qoLaPG2pCJSmKbmr+cLPwM+bbJnYQLFGzXzMCf8ePcxd5MPKPKxSv9q2fQgNzf8H
         CgWeN1c+kU8TcNmHtlWCOHtuf2X/Z3Tq+GRs2pg0IB4kceXSIa5OTFh+3y/25FvW23IP
         0RxIPsH88MCLABeQ+9BPezl9DR4wKAUNbr2q7WlCkj1HD5A2F3kKgYw+eSCEkQ6K5Xdy
         HlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252734; x=1764857534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0swZ8Ypan+oXrthAo/pUrKpZWoHKJGiiGThfa6sHH8=;
        b=OfskiCKjMD8kbh2JAzEO+LA3u/yTNibhP9b8dEa1FNDdbm6bwiBAL6GdNoRQ3l9dQE
         G+LLQcvsQKC0D8MKqO3x1AHPtBHp3ZU7lXaQgMtoksJ/mvavvZcv9YiWijEsp4vnOAbD
         vsNsvwUxPJ91MvhBwgR1WBcaWjoBwSBzKwnrYQboh3pTvhC8UxjdSZU58uxScxvyT3Gb
         RfcfC5U0MAVFfZBS0tUkJW2/MExeXYMYYM/+hJOWIJ2UH2pAzifB64C1ZQxIq2kmzSYB
         SJt8QVEbKKidDSQkPe6BhLQmYCp2PU0JvA9LQwX7dY5MeoxdY8WlPRxsYNPhRg4deBHT
         6iLw==
X-Gm-Message-State: AOJu0Ywgu2ASyWst6siUJA0MQP46iw9vZ9d++YkP5ibaQq1eEGSOLvzq
	DUQQqPlxjg1Db2bY6YlxCjjCxWiZfKtIKItGUzNMPbFThZxK5WF+xtKGO423lsaixlw=
X-Gm-Gg: ASbGnct9qCWWSfo12uEpwDAPe7HLr1alvDy2xAeOVmC1hIdwOfroCe7ClAXeVDDseXL
	I717nKXxVLkUnbpG9hUBedKN0YuYd3a2PWeuGdgdquQ2wogp+6eQo2XCOGnZfssh6CB7FmVXaqz
	9nqUdXdUPs3wUtp8JlCW1XqGRyUIJjdlrWEBQiYecbf2jQLYGVQkZI24l8k5tKwdi+tWok41sYe
	/G6z2/0T+WSgB0LisTdJx8EPxBsGLVRQZ79TBbC5385ZxJGfhVRJzJxrei5LrrXk87142aXqdMV
	XP/TZ9l5BOzOCWy3sy3HRPtel9vifD8idXhvuExh2uC5J3s1LBi7RFUaYDk0drBFUiKINJqGeQE
	DIH4COsgYn8sr+JuGNYRXG73KVU93pw0pt1ux6PAla7oFtrgPjSlkSU1A+rbuywjrUp+d1TpTCW
	fVLtQDoNtQhmYs/vzKg3kKpVlhJtxzeBwUfV9HUwuUMhApGekDDyVU6Yr9r+7Wi7oQRVNmiME9n
	w==
X-Google-Smtp-Source: AGHT+IHkhvWqjx6FEHq30tTA44a11zGXZ1BYveiPwreNaqri3rljB5haB7+w3kfLn/irkM5FUcsJKg==
X-Received: by 2002:a17:90b:35cc:b0:33b:cfac:d5c6 with SMTP id 98e67ed59e1d1-34733f487f1mr23197433a91.29.1764252734477;
        Thu, 27 Nov 2025 06:12:14 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.11.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:12:14 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	apatel@ventanamicro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 4/9] fork: Add arch override for do_shoot_lazy_tlb()
Date: Thu, 27 Nov 2025 22:11:12 +0800
Message-ID: <20251127141117.87420-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251127141117.87420-1-luxu.kernel@bytedance.com>
References: <20251127141117.87420-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061215_425767_63F097BA 
X-CRM114-Status: UNSURE (   9.62  )
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

When both CONFIG_RISCV_LAZY_TLB_FLUSH and CONFIG_MMU_LSYZ_TLB_SHOOTDOWN
is enabled, riscv needs an arch special method to free the mm that needs
to be shot down. Thus we add arch override for  do_shoot_lazy_tlb().

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 kernel/fork.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 3da0f08615a95..b6d11acd6ac10 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -612,7 +612,8 @@ static void do_check_lazy_tlb(void *arg)
 	WARN_ON_ONCE(current->active_mm == mm);
 }
 
-static void do_shoot_lazy_tlb(void *arg)
+#ifndef arch_do_shoot_lazy_tlb
+static void arch_do_shoot_lazy_tlb(void *arg)
 {
 	struct mm_struct *mm = arg;
 
@@ -622,6 +623,7 @@ static void do_shoot_lazy_tlb(void *arg)
 		switch_mm(mm, &init_mm, current);
 	}
 }
+#endif
 
 static void cleanup_lazy_tlbs(struct mm_struct *mm)
 {
@@ -661,7 +663,7 @@ static void cleanup_lazy_tlbs(struct mm_struct *mm)
 	 * - A delayed freeing and RCU-like quiescing sequence based on mm
 	 *   switching to avoid IPIs completely.
 	 */
-	on_each_cpu_mask(mm_cpumask(mm), do_shoot_lazy_tlb, (void *)mm, 1);
+	on_each_cpu_mask(mm_cpumask(mm), arch_do_shoot_lazy_tlb, (void *)mm, 1);
 	if (IS_ENABLED(CONFIG_DEBUG_VM_SHOOT_LAZIES))
 		on_each_cpu(do_check_lazy_tlb, (void *)mm, 1);
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
