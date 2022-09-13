Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7431C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 09:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TISLmHDV200b4Fd0jlMpzh06Ku+tPt9etxoeznN9r1M=; b=JUnkdTsd7E7GPS
	mIoosunBY3//cdliFH/h5HS/eInhNDjfHT9/RqPnOCu5gkMdXNBL7NFHX1R3gGqT1GcWw+7xLcdLc
	ijk0jznTgJrwRyskCXf4VnzRamnX6nj3blCShX7zXkcoNSGXRlAJYxabW51T8CGvxjrDWln37jO3B
	38+DmPxKiCI2QI1oQZaraWOc9QlX1+i/8HCZIYfs5AswHT/VtK9EZnpH+vV8G6tsstZ+kpzKG0v6g
	6pjXkTzeHGTwi67QdsPNVw45Cm9H41Daewsjp00aKjDcQg/eKcCEOkoBfZMNpOmeNzhGoZYvJ6WlD
	yB8ALE3+T3pmFxcNuq7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sb-005Po3-Hw; Tue, 13 Sep 2022 09:44:05 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2SX-005PhS-Rg
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 09:44:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id e5so11220478pfl.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fdg/2jVQ7CDAOfidBbAaebAaEKVw5Zy8Q+nYcVzrfkY=;
        b=Esye1EIV/d5Izz+cmvNznoDje6QLNzlBoMjythr4bbnnpHH46eTPAxzc2gRUUu1045
         XxkGuCFPUaEQpYsG+zS+g8nNdbSfuInflxcQDpiSA7z5ezNmyIpYp6m5lFtckVL/KHgs
         DnnFfiqV30I+sIHRKWxeAa3qQGO3U2xvY24m8SDx8PFoEXGOY/xLwEe45UE+KKUdLbm0
         +WcoVufwq+76g2W/T2Vni8dlGn2rQBBkHpQWmPlMA2xeutUFYMV/fqYzrVql4BsuaNEk
         HQ8Xs77Kh3A9qzEzt3k5dr2pvtJUhmJUr1h09fLTyKUu6Fxsuowtrjy0nP//MuTy1/Oq
         b5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fdg/2jVQ7CDAOfidBbAaebAaEKVw5Zy8Q+nYcVzrfkY=;
        b=N0Rxmpw/ICPIcdx1W41tnwoNLtyXR7IyBX4TAolIjXnGTZSr8mgmP4CeA1hRuiKB5x
         NND30JMjY8uryacl1XOR8H/csjzeNP68VE3sVD+grXutj3P2qZ3Gmrqv+oQQQ+c0jctn
         wawPdmhEi390hiE/WOnDTxeSTpPzg3iIsMDYk9EPJWRvQ76aGWNk67W7XjUEG0phOXAe
         CPkU/eTB7gg3bgFl8n+ZMxxmaJFJBKF3qhsStL9QrtKP62ebUlgT8d11HxISbaRyvLVt
         /lOuoXNz2EIfseSsqwSRiBZSlxQdxLK9EfNREIwFtLIaxqpUO05JW0406vsc0/ZnyDSO
         E47w==
X-Gm-Message-State: ACgBeo2gc8y0vaBUqLLNuN1n4iZ+v8rcrwqhXUuNX1IBbnHaPn0q3Wmd
	cxyjMjxOJE3aucAWfYOYjEG85g==
X-Google-Smtp-Source: AA6agR7IGjMEOq33XYlvKNqOB2Lv6wZgYWpQQt0PavhB8+gcy2LA5iwy6pr5TR3lCKeXIsacKmeb3A==
X-Received: by 2002:a63:8bc8:0:b0:438:bc9e:edc4 with SMTP id j191-20020a638bc8000000b00438bc9eedc4mr12264175pge.20.1663062238996;
        Tue, 13 Sep 2022 02:43:58 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79e1c000000b00543236e83e6sm4904428pfq.22.2022.09.13.02.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:43:58 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	ardb@kernel.org
Cc: greentime.hu@sifive.com,
	zong.li@sifive.com,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	kernel@esmil.dk,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC v2 riscv/for-next 0/5] Enable ftrace with kernel preemption for RISC-V
Date: Tue, 13 Sep 2022 17:42:47 +0800
Message-Id: <20220913094252.3555240-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_024401_973373_DD86063B 
X-CRM114-Status: GOOD (  16.99  )
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

This patch removes dependency of dynamic ftrace from calling
stop_machine(), and makes it compatiable with kernel preemption.
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

Though we ran into errors when using hwlat or irqsoff tracers together
with cpu-online stressor from stress-ng on a preemptible kernel. We
believe the reason may be that  percpu workers of the tracers are being
queued into unbounded workqueue when cpu get offlined and patches will go
through tracing tree.

Additionally, we found patching of tracepoints unsafe since the
instructions being patched are not naturally aligned. This may result in
2 half-word stores, which breaks atomicity, during the code patching.

changes in patch v2:
 - Enforce alignments on all functions with a compiler workaround.
 - Support 64bit addressing for ftrace targets if xlen == 64
 - Initialize ftrace target addresses to avoid calling bad address in a
   hypothesized case.
 - Use LGPTR instead of SZPTR since .align is log-scaled for
   mcount-dyn.S
 - Require the nop instruction of all jump_labels aligns naturally on
   4B.

Andy Chiu (5):
  riscv: align ftrace to 4 Byte boundary and increase ftrace prologue
    size
  riscv: export patch_insn_write
  riscv: ftrace: use indirect jump to work with kernel preemption
  riscv: ftrace: do not use stop_machine to update code
  riscv: align arch_static_branch function

 arch/riscv/Makefile                 |   2 +-
 arch/riscv/include/asm/ftrace.h     |  24 ----
 arch/riscv/include/asm/jump_label.h |   2 +
 arch/riscv/include/asm/patch.h      |   1 +
 arch/riscv/kernel/ftrace.c          | 179 ++++++++++++++++++++--------
 arch/riscv/kernel/mcount-dyn.S      |  69 ++++++++---
 arch/riscv/kernel/patch.c           |   4 +-
 7 files changed, 188 insertions(+), 93 deletions(-)

-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
