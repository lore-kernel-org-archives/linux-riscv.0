Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B726ACD6E4A
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Mye0xN1sgBH7lYcwzLvIqc+PdJ7iWtHRe7etqp0o18g=; b=Wqt
	zyQFjCrS7lZu2AJuqRv5sJ6vAdTyPR3UNMiRouHQs+cp7aplBFvpgbUGs7cJf01rPzrMbMoeegGED
	Pfjx1GIxIv2I7NuRDcDBdCVjSFyKos3DcWwgCtoYSQv2cl2IZ0vK8bKvmygs2oXYgrU74qESbnGNo
	4vZp92ONgDdA+TvKqYH8id7QlgjYS3LtrFrHISxIcbn6dUguGSLCpOjizbWAmtIFBHH1kMY2s/538
	How0LSxgbXZSdKKzUCwpgIgkjbacoN3QmMVybm3ZSD1Hhisn5EUIQKjUNYImhglDbUIQ1uJV3d+1Q
	eno6cXlj3PtN2s5arhotvPnPgJ7q3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGlP-00000008cVU-0db1;
	Sat, 30 May 2026 10:17:55 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGlM-00000008cUs-2VzJ
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 10:17:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-bcceb394417so1790829266b.0
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 03:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780136270; cv=none;
        d=google.com; s=arc-20240605;
        b=aw/XPxRNTLtehOVA7YDaieLbe8SCHaYoMOZ61PRmQXJqFrcr6VnbjjgiH8juNaqrCr
         NodtAflLKdXAagZcoZPQAXgeCgF2X9WcYUJ7dLtEFfaw27G4kGvOD61i0zUNE35NkdYY
         CTbBVtFpgwlxL0G3CygTbz37Obk5zxH/WV6xhoej2JFHeDKMP6co0HGT/4x2/MVF7eTt
         /tmB2dwVaGDHIh6zCZydNBP70gK2rXa7RNQ8n7Y3tzeqtylDARJLaJ3TpIptDloiJyjk
         o3ITOOc7BHV+vgLrYwtPjJkg/r3KUemOpVHO/8pd/iYisdKetFhnRKhLD8bV6lD7u0GI
         ljfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1PbLr1gEYk4kp4dkTw7SOTXuGRGsi5XnZq3F5T8LJWM=;
        fh=iHwPe7oNyM5a9QU+4n6dnTVLSqX0DicumAwhl9kzknk=;
        b=VVaPZ2nliEUNrGaXhmvjR82YbYKS4w5kjfGOYnA8Fvsqcres+WNQSxHQCK70lasjNP
         PNIj+FNPWWDpOPzYW/6jRGH6uxlbfsm5IBJ1Ls8+Pn8VuKeVDbowU4mkYHrXo17touzT
         /brp4EiwqXW7kIR8rJMVkII2wspl9MNduRcRWGhSvmDZYnhG3HVbmG9YRtnvOXbIvP3f
         MNuWAdJRGZvzr0BCBqEkuoFFuIVuMIwVFMawUlEuoaEIY3Nzknv4+LHatRM96pn01tpO
         LRW0whv0xWjdhS59eghZPzaYnES0cZxm/6uAUQb1JQG0y5UtzAu7tW1tIizEOnu4jZ+D
         gXqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780136270; x=1780741070; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1PbLr1gEYk4kp4dkTw7SOTXuGRGsi5XnZq3F5T8LJWM=;
        b=PG2eXbLnpZKurzsJVWduQdO8Dj3lVs4EeUgj2xLOG5HoUhrgldFK+k+6XhzmvoGpYr
         cT99Ih5R1ILZN7iQYS7dPLho7m86CsSIM7khszJ58e1U+VngZ31h57yUDNvRecdIhpOC
         JOiE79SmjQaWBEenFEXKOAUT1ssBVH7C73+71k5itaSJbU9XKbqVjEpcLuqhShI29RdO
         NI4oGxz+2pu2Jl05STbEH0cZxUjP27t5nPjqu9Btx6/DonvkLh3UHioOpxPEm3OgAPyy
         e6lKM1tXdtXJhyKFjDMOX0FwtPNgulgfzTh9sBEgoLVlvxD8luz/b7RsPqJErLXgnmM4
         8VhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780136270; x=1780741070;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1PbLr1gEYk4kp4dkTw7SOTXuGRGsi5XnZq3F5T8LJWM=;
        b=jty5Kwu+CoOrn6rPR+rGi46sYEF1kC4Gp/Fqfem/5ve4TgYVGLMFS4UPmjp96fHiSs
         9B7JLPQdWldQR34gTlKXnGAYtcwi1JuJ7Joh3rwkWBRCh8xnQc2Bxuewe6W/bpupbTVE
         PHWsmhKmdf788DtR6uldXlFuRHRKae5goKDDLjUJg0IBHm9fUXCN/1FyW6CHEr4ZaSWF
         haja1TMGH4z2RDkh0hGyRQ3mOeAl0/cqoWXdXruSdBYcDEXljOAtPPJaYz9v69MGYisl
         /UXUOTNn41s1Yf5gG2qHiU5aB35A6qbb6qrV6vk8HxUghVm2/EEx+r7kIqsq6fAPXvPo
         qYKQ==
X-Gm-Message-State: AOJu0Yx8mI+fOKdMP47bmF9jXoLFm6XTfenhauIfUsInjsXh6JXrgmND
	VLiZbURMrhHW0tGbw7yR6Y53bSAwRrVqQQeU3rC057v47z+crnE8H69n8XlMnI3bcT0wLWsnPJi
	U2bEn0hMMb3Ov8EppaYfdQgR/vmuAjiHWDxumEVqTLw==
X-Gm-Gg: Acq92OH93T6y95+9LCT3lj3hth2C4XLVv5dG0wLVEg324qAAewdWzxGipWMHhg/JfAD
	/0OmwxZ8/EKRDFipwjLo1zMX9WOlF5RuA3qdfoFy6+kn71TDx5REWTpcDSpav+8cJgVqj7PeKFg
	pHrx3BryBqZjI/mw6qsVWCnXHsCUMq/eDAq/87ElkDdIaosBRKP2V+Tb81/Sw6AIdZBAiW77z3F
	zfAgZ55dB9a3Sb0pr0ghUAe+FF4oldUd9HXHOnPGy1UNa6AvyXIUBEeNK7+o0SdWRSVJJ6y/tbT
	78fpDBWhGCl6YOwmQA==
X-Received: by 2002:a17:907:d405:b0:bd5:2ed4:4ef6 with SMTP id
 a640c23a62f3a-beab01dd693mr152380166b.19.1780136269957; Sat, 30 May 2026
 03:17:49 -0700 (PDT)
MIME-Version: 1.0
From: Paul Sherman <shermanpauldylan@gmail.com>
Date: Sat, 30 May 2026 03:17:47 -0700
X-Gm-Features: AVHnY4KkHicHWQzEXzDwjBc_zs-TuLc6bCYU7qzXxPJtRcx-H-m1d-4vpUJEtfM
Message-ID: <CALGMsBCg+nDZi5=zxSxLYZ770dKK-+De6VSjOrWKLN1wAURMJg@mail.gmail.com>
Subject: [PATCH] riscv: smp: set CPU 0 possible in setup_smp()
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, sholland@gekkio.fi, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_031752_677927_0A838499 
X-CRM114-Status: UNSURE (   9.29  )
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

From b0162f20c370dce032c59be77c5820a3c7f2f891 Mon Sep 17 00:00:00 2001
From: Paul Sherman <shermanpauldylan@gmail.com>
Date: Sat, 30 May 2026 02:49:56 -0700
Subject: [PATCH] riscv: smp: set CPU 0 possible in setup_smp()

setup_smp() calls set_cpu_possible() for CPUs 1..nr_cpu_ids-1 but
never for CPU 0 (the boot CPU). x86 handles this via
init_cpu_possible(cpumask_of(0)); RISC-V has no equivalent.

Without CPU 0 in cpu_possible_mask, rcu_init_one()'s
for_each_possible_cpu() loop skips it, leaving rdp->mynode=NULL.
rcutree_prepare_cpu() then dereferences NULL and hangs.

Exposed on Sophgo SG2042 (64-hart, 4-NUMA) with Linux 7.0-rc2.

Fixes: a4166aec1130 ("riscv: Deduplicate code in setup_smp()")
Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>
---
 arch/riscv/kernel/smpboot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 601a321e0f17..71662f6bb1db 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -169,6 +169,15 @@ void __init setup_smp(void)
  for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++)
  if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
  set_cpu_possible(cpuid, true);
+
+ /*
+ * Boot CPU (cpuid=0) is never set possible by the loop above.
+ * x86 and arm64 call init_cpu_possible(cpumask_of(0)) explicitly;
+ * RISC-V was missing this. Without it, rcu_init_one()'s
+ * for_each_possible_cpu loop skips CPU 0, leaving rdp->mynode=NULL,
+ * causing rcutree_prepare_cpu() to dereference NULL and hang.
+ */
+ set_cpu_possible(0, true);
 }

 static int start_secondary_cpu(int cpu, struct task_struct *tidle)
-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
