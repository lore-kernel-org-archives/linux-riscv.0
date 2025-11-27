Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D32FD11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6xBZluVUVST51v1qkTa/r/Jtewoy2PuxopkZnpGrjg4=; b=pf2gLqDaPU3HvA
	xo7xaZf8hve/aa8NWU/DetZZ6XxHnJWjzQem7hUpPPxG8ouPaRhPijGd+3/XQ+3atU+8eq5hb5zIp
	l4ZvjLAf1uU9BfdD9NrlN1jyhsrzJrv5cw1XF3BPEqdZOMmRSUdFUb0Z7OEcIT9lvasqHPRUiJmga
	MspF1MwT2HdO/57oLGlQrr2+dW99Rso9lX7T31/gj3UildTBwzhK681OEqYKdC5+kVVWW3MQSKPO0
	Pq2WsHHCj29NAIK2x10Ot/uPFZEXJdoLf67+9KmdR8KKoAGHKREdUvXPB389YYxLy5LWqTl9UtPwK
	t8N8Fy5oVBDjubewKcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcio-0000000GkEU-0yyw;
	Thu, 27 Nov 2025 14:11:46 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcil-0000000GkCY-3lXA
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 14:11:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-343f52d15efso837350a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 06:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764252699; x=1764857499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u3WXNKq2AX75j2bmfv330sc+Ngjbx9cqOj8cPkF805A=;
        b=SH9yzrYkaAvEGLb+pF3UqZT+y9Bk1sj1+H42IEDVc2AR9sDeYcPkyJNujHqZvrSFnJ
         KWBMBZgnS/51tR8y606ixWtTgxstYaiK0vJDy9A1xOsN4CVUN0RhC50joPaiUgT5cax8
         HziiLpzPA2q9UYF05o5G8YXvoNQVuVObk3s3XfKouNbf+ZUt6zps2afVr5j5qrfqS0LU
         ElnqaAgGAUZ1TBjxFXlEs4tkM8S+S3Rl4JEfiKvPgarcASCngh6Rzxh5+rPasXwev6mx
         Of503/D9V9VutQa9ApE5tPgBgFHWakUS4jLkFPvAE4jH3qp+yb2ZXieC0m7NLs1aoDfC
         F6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252699; x=1764857499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3WXNKq2AX75j2bmfv330sc+Ngjbx9cqOj8cPkF805A=;
        b=oXh3NGpBLMF7AlE78hDIDz5O41xeqz6WlLwSjK3WnClzJmziGJ2ymy8OUCv4O+8QxD
         Ahdff7TeCGlVu89675zWpOn0asO3N5SB2NgH3MKJwducfL9Pay3/K7Vq1SpfWPvAhwsg
         u/ATueuZsYRIyX7M7b/pNK+xzgYPxTzplPFu3jhm7hVYbQATBkYBAiedY5rJOThnMnfN
         JcjVGiFDItf6BbojIPoRoiZmkkTN4aYhalnTj6BioBCCQ684mPOYb3tXDpkHeTPyduUf
         fwUqUOKSReGG9KQ1zDZA9CXiypO5fL94twhSaVVLMFYvbnB6ZLXzBIX+EtqZiwNe77Lg
         6bSg==
X-Gm-Message-State: AOJu0Yyqb8NCUWxNTNaGekWIYubNg2rNkKC8sjxMx94EPr2V+jwW8KkY
	yKBhy8kihRgZ0VB+pf4iq6Vxd76/WKNmiQmK4wh2yWgVudJ1LtStlqQCIDIwi2HFg4w=
X-Gm-Gg: ASbGncueuVnXflV6Q3+j3MmtHME4r09RNlJHYkJl2mekSrZAlIYcM8wduZaKDWXUehw
	FBAQp5wEStqHjSrSEOkl2jkyac+ETaMfCbkSELqwf6N2BC3Sa9o+PEEmVUxypNPy4/rD8FWxb5U
	87BiUQKIf5zKuZLaTQDV7T22XnQ84zUBitk5yByb/uEkXEY/n++oxcSThrxVRZaidqK0R5T9tjj
	u2yXn1Z/DGNRi3pJkZpxy0euzr3w7C4ZR6VogjXpeZme9glSZEKSmPDAislm9gJ2/X7oPVi5mE6
	5API1ffg/8O0/75GTILfDkxdYDSeXqN2RZ0NKzwvqzgj7XFoaWtxnXCz+PQxEu4m8KnNFxYwwjd
	n5CzB1fhhCNeeh1eTskdSf7ogLAjIIWd9UGxSw9aq3nNRpHImluvcZHp96b3Yf0cFS/QEEP1XK1
	jEF0Sp2XCz6Roko5TXRxkgaTk+93mzZ3TcdEZb/PwW9Idasf3EWvGBfVOkSunttcasBqsoCHH/p
	b2pH5nbd4t1
X-Google-Smtp-Source: AGHT+IGqqZbiAaSC9ZX+pYvJ1IbIc0rETHK1OBZOJFFlIrrfxJbsAOd/0yhH41xHJLHj1PsrjPP9Tw==
X-Received: by 2002:a17:90b:54cd:b0:32e:3552:8c79 with SMTP id 98e67ed59e1d1-3475ed6a4f9mr10948253a91.29.1764252699207;
        Thu, 27 Nov 2025 06:11:39 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b7341d2sm2030249a91.11.2025.11.27.06.11.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 06:11:38 -0800 (PST)
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
Subject: [RFC PATCH v2 0/9] riscv: mm: Introduce lazy tlb flush
Date: Thu, 27 Nov 2025 22:11:08 +0800
Message-ID: <20251127141117.87420-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_061144_079869_CB57AFCF 
X-CRM114-Status: UNSURE (   9.18  )
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

This patch series introduces a lazy tlb flush mechanism for riscv. This
mechanism is based on two insights:

1) Since each CPU has limited TLB entries, there exist limited active
ASIDs in each CPU's TLB at the same time. When a mm has not been used
for enough long time (or, after enough switch_mm times), we can assume
its TLB entries are all evicted out. Then we can clear current CPU in
its mm_cpumask so that next time when the memory mapping of this mm is
modified, no IPI will be sent to current CPU.

2) When memory mapping of a mm is modified, instead of sending IPI to
all CPUs recorded in its mm_cpumask, we check whether each target CPU
is using this mm right now. If not, we just store the TLB Flush
information in target CPU's percpu buffer, avoiding the IPI. Next time
when the target CPU switch_mm to this mm, it can check the percpu buffer
and perform TLB Flush itself, without IPI involvement either.

Using this mechanism, we significantly reduced the number of IPI due to
TLB Flush:

* ltp - mmapstress01
Before: ~108k
After: ~17k

* ltp - hackbench
Before: ~385k
After: ~2k

Thanks Guo Ren for his advice on memory access latency test via lmbench.
We are unable to test it now due to lack of real machines. We will
supply this test and adjust our mechanism according to it as soon as
possible.

Xu Lu (9):
  riscv: Introduce RISCV_LAZY_TLB_FLUSH config
  riscv: mm: Apply a threshold to the number of active ASIDs on each CPU
  riscv: mm: Grab mm_count to avoid mm getting released
  fork: Add arch override for do_shoot_lazy_tlb()
  riscv: mm: Introduce arch_do_shoot_lazy_tlb
  riscv: mm: Introduce percpu TLB Flush queue
  riscv: mm: Defer the TLB Flush to switch_mm
  riscv: mm: Clear mm_cpumask during local_flush_tlb_all_asid()
  riscv: mm: Clear mm_cpumask during local_flush_tlb_all()

 arch/riscv/Kconfig                   |  12 ++
 arch/riscv/include/asm/mmu.h         |   4 +
 arch/riscv/include/asm/mmu_context.h |   5 +
 arch/riscv/include/asm/tlbflush.h    |  63 ++++++
 arch/riscv/mm/context.c              |  24 ++-
 arch/riscv/mm/tlbflush.c             | 302 +++++++++++++++++++++++++--
 kernel/fork.c                        |   6 +-
 7 files changed, 394 insertions(+), 22 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
