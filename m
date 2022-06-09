Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCF1C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Js5bIC0uOipQ7I6p7EDOP1jRaip0YtV+tjEU+aq8uvk=; b=FHoPCuX9e7FIef
	1i+tKh7dwMweum17TtUxFjNtltISM3lcHGHSXcBxQcUV9GE3DL/Rj/NaNBFg6FloAULnmBIr6Ysf6
	GdOp3+4BnlkpeY4bVvgxLzTQFYJ9Y+R66xmU0snfFxwrHJ5RmOKsEtU4Rt2LCbSrybYu7gfIt3PtA
	a6vnti8O/MbEl+hMvb6gzPdfegoeUqPIFGJb2ke4pB9WNFfVeBzHN6jJrVQSC4Tg5fb7Ppuk+fvs/
	II2UxgS2wdeR0LBNdCwCc/zSbLkwxqsfZEybPQbF0rF1ZZljoIdWeqUPGtgS5m9sEzb2euveyBOe7
	G3vN8dFqqfGQmoHOOdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUO-00HLGS-MY; Thu, 09 Jun 2022 07:21:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzCUH-00HLBa-Td
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 07:21:53 +0000
Received: by mail-pj1-x1033.google.com with SMTP id a10so20630084pju.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PC4Ts+vh6pP6JMPWAJQjCuHQI7Qw6zWuXBaf7Nk9oU8=;
        b=W7lB0a7Tx2vAZ576hsn2z7N1DN3AFuiPfVvNu4z1dqSTAm2foD4HuOQ7iG0geORduI
         PyeEIsWuvyIqeDmld+3CZWtLMswKhTJYeipg6ZCmXqJTsUoroc1OOxF+0lNfoE3Jtsbl
         DB51bFns4IPwVSVusSDPPL84rShZO91nNb9LndptRpgokd0IqaoS5qMWquNweh5lHXI9
         Z8s0svaMhYHG3lmeIj+eGFlNLZY2iHcuByRvwpC0vYZZsgDsB+HLojKr7Nh/u7gWFlQm
         LPr9QLDP7+4rQV54es3GP4/c/l+3qmp9uC/4ptTkanpMMMA1MUP+Kccv1VnFUuitbIog
         jppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PC4Ts+vh6pP6JMPWAJQjCuHQI7Qw6zWuXBaf7Nk9oU8=;
        b=cJakmJIgB5kyCCBJWPshaX1ZZ9fdDabGkJW664AMnx8Sz7WuzK8QfxgM770VnYYumK
         PpVDsNiKpX0uvkj2ao8pl9OW4PX0J02g0BMV/WyIm3+04FIxeGZEfHgcQ7WMuNdPSmG+
         ImBWLPk6O+mrmbLXcbe4LQq9ArH0dNNWqjQbOiJi4dlAY7in7vY4pkxYBdr2OgS9YCti
         6nXS9uzX6EwRDoSLHi0PFYyJakQlvMS3FT7PNCtP6ml+U9KPOSiBUI7wLI8d6fcJuf7A
         4szGS+iN0B4dayW6+Ww6sxQzaJfWyNjwOokOB8suwlFo3xLB+q6T1F6ALVFOl4KcowB6
         y1OQ==
X-Gm-Message-State: AOAM530ELCc1mAHpDccXmUOET+jeLgVfMfTPyJQWSYMLeOJbfBSdBRZq
	dBq/C2QXm6kZAUEnrF36+9OKkQ==
X-Google-Smtp-Source: ABdhPJyMC0/H+6vLEI0qxWzYZFmh2h8InilDOxAmBQFTBC8XY0Rg2KR07zPktzvLtSInkBIOcALTvA==
X-Received: by 2002:a17:903:124b:b0:15e:84d0:ded6 with SMTP id u11-20020a170903124b00b0015e84d0ded6mr38193159plh.141.1654759306355;
        Thu, 09 Jun 2022 00:21:46 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id r2-20020a056a00216200b0051bd9981cacsm12952572pff.123.2022.06.09.00.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 00:21:45 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rostedt@goodmis.org,
	mingo@redhat.com,
	linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	zong.li@sifive.com
Subject: [PATCH riscv/for-next 0/4] Enable ftrace with kernel preemption for RISC-V
Date: Thu,  9 Jun 2022 15:18:29 +0800
Message-Id: <20220609071833.1051941-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_002150_057414_C17421BF 
X-CRM114-Status: GOOD (  15.86  )
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
