Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BB2C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Js5bIC0uOipQ7I6p7EDOP1jRaip0YtV+tjEU+aq8uvk=; b=TuDp7ydileCjY4
	7+x990tCvfn8b2wHv7RDbbeg9Sxuc8YVbiVDLLTLTGCGt+rWs7g+aP1kGFjoNAZxBiss2j/6hej9i
	8oJ/H9gNYhaLvY9EAmtIhV/U27QiEpOsFZVCHU0VA8xGfngDDCDURnFYKXh0HRcFRHtwc2Y8sc2ec
	hTBEUwSDgC5go0MPI18wneRwW4WVYR8LO+abtq4o34sS8GTwqlyfUHuI/6alqbfI39q1nNeCyLVRB
	aK/obrVKvRYIQrP81MmSCCS7ti2p4Fnmm+M50Q8RHkEvI7Clx9rAGgVoycbWDHqPDbUv4M+Uopc6r
	jVwrBkSRpphLO1xB+3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1m-0043sa-28; Sun, 29 May 2022 14:36:22 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1j-0043rt-F0
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 14:36:21 +0000
Received: by mail-pg1-x52b.google.com with SMTP id e66so7991276pgc.8
        for <linux-riscv@lists.infradead.org>; Sun, 29 May 2022 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PC4Ts+vh6pP6JMPWAJQjCuHQI7Qw6zWuXBaf7Nk9oU8=;
        b=KfE0HuhgNT2O4THZDtx3ytAw1y6NUuzmlUiJcBpIos48HT8Awcxb2PyVWFZLJ2hCbT
         Zr6jiWOE7sUnkW7w9iO7RRd5F75aODpVe3isgARcPaA90bi3UvBUmM1RLUKSvWQy4H6X
         ca14xtwE+U3QO1dDXCHh8sYlrnWg1zaWou7IsdUMwyMiYog3IKK64gUCN4JEvTNriVt3
         dyL5/VJu6wXb/swXU40vQb/f3PxnbQra6VPfeR80tAshKkvC9jNhmfa7p0ckJ9SeJKqG
         8/JaYIBbkno5zBo9jf/gf9M9yQvsw8TYERSFyUaFWq0M69C4/s2rXZWT20EkZl/SrLxk
         9LRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PC4Ts+vh6pP6JMPWAJQjCuHQI7Qw6zWuXBaf7Nk9oU8=;
        b=Rfe6mUPWkGZLNIvfvnEx9bh33mrE9t93M3uA7u3zqAWhgM/5fP/a8ZlABs5OYehkUV
         RdQfSvXcEjVfkXblhZx1cjcQcjp2Cc8wHMdx6RKciob4spU+Fwet+QHC07Fv+yM2s1hd
         7LmY7UCmZ+xi+pgE7Qk/j6Za4+2S4hiZ5B/a+b8WgQMGcNwfYrPkAYkpfzf9r6HFeIZm
         7BJ2sCQhYgUIOR5qG/e33AnC6opVjVepvKGEtAg+KcONEn8Y/MU5LtzC9+xa40x9Mdgs
         XIiNQizpz4xps/BJtDrD1Twha5INJqtKzjm3Yd2XggVKYl6s5J97EiEzi0IqldWfSVpm
         uhlw==
X-Gm-Message-State: AOAM5300ImpeLhItHihE03iTWgLqz4odINexQTDYgpxM18Ntfg0Q78aE
	3sL/SVfK/2xbDuqY3Txd1htOF8/rUdUSjlfM
X-Google-Smtp-Source: ABdhPJybgZOaReZZjUAvpxALeSHG48I5ySVV9DWusSlmhRxLQ7M1uAcu9jGBQABIsnZxBaoCuu6J7g==
X-Received: by 2002:a63:24c4:0:b0:3f6:105a:49ef with SMTP id k187-20020a6324c4000000b003f6105a49efmr44973368pgk.380.1653834977019;
        Sun, 29 May 2022 07:36:17 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id h18-20020a056a00231200b005104c6d7941sm7066827pfh.31.2022.05.29.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 07:36:16 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	mingo@redhat.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org
Cc: guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [RFC PATCH riscv/for-next 0/4] Enable ftrace with kernel preemption for RISC-V
Date: Sun, 29 May 2022 22:33:11 +0800
Message-Id: <20220529143315.3678563-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_073619_595488_12A24A69 
X-CRM114-Status: GOOD (  16.10  )
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

This patch remove dependency of dynamic ftrace from calling
stop_machine(), and make it compatiable with kernel preemption.
Originally, we ran into stack corruptions, or execution of partially
updated instructions when starting or stopping ftrace on a fully
preemptible kernel configuration. The reason is that kernel periodically
calls rcu_momentary_dyntick_idle() on cores waiting for the code-patching
core running in ftrace. Though rcu_momentary_dyntick_idle() itself is
marked as notrace, it would call a bunch of tracable functions if we
configured the kernel as preemptible. For example, these are some functions
that happened to have a symbol and have not been marked as notrace on a
RISC-V preemptible kernel compiled with GCC-11:
 - __rcu_report_exp_rnp()
 - rcu_report_exp_cpu_mult()
 - rcu_preempt_deferred_qs()
 - rcu_preempt_need_deferred_qs()
 - rcu_preempt_deferred_qs_irqrestore()

Thus, this make it not ideal for us to rely on stop_machine() and
handly marked "notrace"s to perform runtime code patching. To remove
such dependency, we must make updates of code seemed atomic on running
cores. This might not be obvious for RISC-V since it usaually uses a pair
of AUIPC + JALR to perform a long jump, which cannot be modified and
executed concurrently if we consider preemptions. As such, this patch
proposed a way to make it possible. It embeds a 32-bit rel-address data
into instructions of each ftrace prologue and jumps indirectly. In this
way, we could store and load the address atomically so that the code
patching core could run simutaneously with the rest of running cores.

After applying the patchset, we compiled a preemptible kernel with all
tracers and ftrace-selftest enabled, and booted it on a 2-core QEMU virt
machine. The kernel could boot up successfully, passing all ftrace
testsuits. Besides, we ran a script that randomly pick a tracer on every
0~5 seconds. The kernel has sustained over 20K rounds of the test. In
contrast, a preemptible kernel without our patch would panic in few
rounds on the same machine.

However, we did run into errors when using hwlat or irqsoff tracers
together with cpu-online stressor from stress-ng on a preemptible kernel.
The stressor would randomly take a cpu from 1-N offline and online using
hotplug mechanism. Nonotheless, since we think there is little chance that
it is related to our changes in ftrace, we are working on it in parallel,
and may come up with another patch soon.

Andy Chiu (4):
  riscv: align ftrace to 4 Byte boundary and increase ftrace prologue
    size
  riscv: export patch_insn_write
  riscv: ftrace: use indirect jump to work with kernel preemption
  riscv: ftrace: do not use stop_machine to update code

 arch/riscv/Makefile             |   2 +-
 arch/riscv/include/asm/ftrace.h |  24 ------
 arch/riscv/include/asm/patch.h  |   1 +
 arch/riscv/kernel/ftrace.c      | 135 ++++++++++++++++++++------------
 arch/riscv/kernel/mcount-dyn.S  |  62 +++++++++++----
 arch/riscv/kernel/patch.c       |   4 +-
 6 files changed, 136 insertions(+), 92 deletions(-)

-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
