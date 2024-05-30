Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6776C27C50
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 00:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iSWTTi8EIbjmPadSBFWsVku3YG+xf7ndipdLeoOfRE4=; b=QG2eoWBTB1SsSl
	dQ2GtcjO4TjsDoVv6BVg4o/JRiIm7Lihvu4T8id1mXG9XA2PqurR6e1HeFfYzvo0g8p5bdpIKI4mI
	Q3iyrIkUB6G3UycfafS2BOESMBt9gHH/O5mwI88o+qhkE0BuyXp/14WjpcX3t1H37G8aPy4e/7fS7
	re1f2rWlEP9Ie4OYrCks/eos4rNORZsNgvKIaav4IC2qqT8k0sD2HA+intf9MD19ETIjhARxJvxi8
	2zoLE7SFzPbDTMoO2oEj7rKJ+C0ReCo74u7YClszSVLYBnkTawcRDsUVXX4hSwIBNDXjarJuVuqVs
	7owP0hDzBxXQFzR2J73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTUB-00000005s0r-2sfr;
	Thu, 30 May 2024 00:17:39 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCTU8-00000005rzt-2nNk
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 00:17:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2c1ab9e17f6so210988a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 17:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717028255; x=1717633055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CfeW8EqYXxaySwYF/8C+JSagNvnC45TM4Hz+nm+CSRI=;
        b=VmTJr7B3RXES7DN5KQ8CqmY0/3g9RNGpkSivFWHZDLWiSnUTsiGxmAfZCHNiCDBD4u
         F3Jy+kCb3fj/dB05vWqFd8caJGYR/o70mpOYt5kvWeB/dCCSGdk6EDkJlHec+vtp3rrX
         mBt62wfl3speP8dT2oK3JDu7s3VUvE8MATCPeiwfBsr21cRomh7TXOhtTFNWEqbyOwnj
         ++tvNr8zHScv02qDz3rDPVK8uUqq9Ja7c3cJbBPhkriwbnyfETMoF9+Z10leth+g0qu/
         GfPAVdA0TAhlK2d/amBOs07NS3LeA4jwU03AXkMYbPDMvBaeb/VUsy93VactvTdcaiMo
         K6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717028255; x=1717633055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfeW8EqYXxaySwYF/8C+JSagNvnC45TM4Hz+nm+CSRI=;
        b=QK40WndZa1ASbjYPc6iPmPiurIXYP7ZOJBOYm3wpay9d0wZVIzkpSRC09HzH3iWJc0
         XZkwcFphLzDubVviKeCgQXehESSWtEw0QG3O3pXdfd76bqUWnIB02zC1CH5tGdQ//4Es
         mG7ZZH9SIMGXULLwUamPss0UCqJRj90eLVNk7YLdMAR2OUW4AEpmEI+q1J+L6yzjuMi2
         R0822u7EbsZ4KCpwDc74gvi0vSka9xVsrATZ8iwdh7OGP6bg85RHHa1LO9ci6g7K4TzL
         5YhQ+cbruY4W4wtmEbwp31BE46g328ZaIfzTNuQP/rruLOb2M0mwLGRXzQDWOfrAzcWM
         M0vw==
X-Forwarded-Encrypted: i=1; AJvYcCXoDmUmrCe8SLrw6EB1SZg4puoOJu7wF1SWvEmGnrpWfFHT4Azr7ZausVCIPXoJf/vXn/Mel1tDKPPzgfX7uy21U9dIEF46Tj88fGB4DWOt
X-Gm-Message-State: AOJu0Yy5jhr9ueVSq2Am4sB4j1cllPnaJLHunwpznTxIXelpGHIWUucf
	1LTrnw6sbAFlxhJRtfdat8I7W5kh11LzT8rN5tF8fxxY7dnusv+uCPU1kg0z4Zc=
X-Google-Smtp-Source: AGHT+IGxn82BdppJsiKdAmg7jIowsQcKelUH6a4zwXXajGsUSnB466N/dzB9HNnLA6+BW7yCPV+EYg==
X-Received: by 2002:a17:90b:3709:b0:2c0:29d5:3515 with SMTP id 98e67ed59e1d1-2c1abc12514mr663413a91.3.1717028254983;
        Wed, 29 May 2024 17:17:34 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a776e206sm432171a91.20.2024.05.29.17.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 17:17:34 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Matthew Bystrin <dev.mbstr@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/4] riscv: Frame pointer fixes and enhancements
Date: Wed, 29 May 2024 17:15:55 -0700
Message-ID: <20240530001733.1407654-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_171737_066518_D9E2F4BA 
X-CRM114-Status: UNSURE (   8.85  )
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

This series improves frame pointer support in the RISC-V kernel. Patch 1
fixes a bug in 32-bit kernels. Patch 2 prepares for patch 3, which fixes
several places where the kernel clobbers the frame pointer. Patch 4
saves a frame record in the exception entry assembly so the kernel can
unwind past exceptions. Here's an example of what the result looks like:

  [  150.315343] sysrq: Show backtrace of all active CPUs
  [  150.319827] sysrq: CPU0:
  [  150.322063] Call Trace:
  [  150.324684] [<ffffffff800059fa>] show_stack+0x2c/0x38
  [  150.329757] [<ffffffff803e0228>] sysrq_handle_showallcpus+0x78/0xbc
  [  150.336014] [<ffffffff803dfc52>] __handle_sysrq+0x152/0x15e
  [  150.341601] [<ffffffff803e0a88>] write_sysrq_trigger+0xa4/0xba
  [  150.347221] [<ffffffff80182638>] proc_reg_write+0x3e/0x80
  [  150.352787] [<ffffffff8012885e>] vfs_write+0xd8/0x302
  [  150.357625] [<ffffffff80128ba8>] ksys_write+0x58/0xaa
  [  150.362856] [<ffffffff80128c10>] __riscv_sys_write+0x16/0x1e
  [  150.368317] [<ffffffff80005650>] syscall_handler+0x1c/0x28
  [  150.373986] [<ffffffff807372c8>] do_trap_ecall_u+0x64/0xb0
  [  150.379431] [<ffffffff8073e91c>] ret_from_exception+0x0/0x70
  [  150.385207] sysrq: CPU1: backtrace skipped as idling
  [  150.385210] sysrq: CPU2: backtrace skipped as idling
  [  150.385213] sysrq: CPU3:
  [  150.397294] Call Trace:
  [  150.399717] [<ffffffff800059fa>] show_stack+0x2c/0x38
  [  150.404756] [<ffffffff803e02e6>] showacpu+0x56/0x84
  [  150.409620] [<ffffffff8009959e>] __flush_smp_call_function_queue+0x13a/0x1d2
  [  150.416657] [<ffffffff8009968c>] generic_smp_call_function_single_interrupt+0xe/0x16
  [  150.424390] [<ffffffff8000886c>] handle_IPI+0x38/0x74
  [  150.429424] [<ffffffff800659ce>] handle_percpu_devid_irq+0x82/0x106
  [  150.435678] [<ffffffff80060b72>] generic_handle_domain_irq+0x1c/0x2a
  [  150.442019] [<ffffffff8006b9de>] ipi_mux_process+0x6e/0xd6
  [  150.447490] [<ffffffff8000af48>] sbi_ipi_handle+0x30/0x46
  [  150.452876] [<ffffffff80060b72>] generic_handle_domain_irq+0x1c/0x2a
  [  150.459217] [<ffffffff80341936>] riscv_intc_irq+0x22/0x60
  [  150.464602] [<ffffffff807373b0>] handle_riscv_irq+0x30/0x4e
  [  150.470161] [<ffffffff8073736a>] do_irq+0x1a/0x30
  [  150.474851] [<ffffffff8073e91c>] ret_from_exception+0x0/0x70
  [  150.480497] [<ffffffff8033c5a0>] __percpu_counter_sum+0xbe/0xd0
  [  150.486403] [<ffffffff8033c5a0>] __percpu_counter_sum+0xbe/0xd0
  [  150.492310] [<ffffffff8000eac0>] __mmdrop+0xc8/0x208
  [  150.497260] [<ffffffff80038922>] finish_task_switch+0x120/0x198
  [  150.503167] [<ffffffff80739668>] __schedule+0x444/0x6c8
  [  150.508378] [<ffffffff80739a16>] preempt_schedule_common+0x18/0x32
  [  150.514546] [<ffffffff80739222>] preempt_schedule+0x22/0x24
  [  150.520105] [<ffffffff803e026a>] sysrq_handle_showallcpus+0xba/0xbc
  [  150.526359] [<ffffffff803dfc52>] __handle_sysrq+0x152/0x15e
  [  150.531917] [<ffffffff803e0a88>] write_sysrq_trigger+0xa4/0xba
  [  150.537737] [<ffffffff80182638>] proc_reg_write+0x3e/0x80
  [  150.543122] [<ffffffff8012885e>] vfs_write+0xd8/0x302
  [  150.548160] [<ffffffff80128ba8>] ksys_write+0x58/0xaa
  [  150.553197] [<ffffffff80128c10>] __riscv_sys_write+0x16/0x1e
  [  150.558847] [<ffffffff80005650>] syscall_handler+0x1c/0x28
  [  150.564316] [<ffffffff807372c8>] do_trap_ecall_u+0x64/0xb0
  [  150.569788] [<ffffffff8073e91c>] ret_from_exception+0x0/0x70


Samuel Holland (4):
  riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI
  riscv: entry: Balance vector context nesting
  riscv: entry: Do not clobber the frame pointer
  riscv: entry: Save a frame record for exceptions

 arch/riscv/include/asm/processor.h  |  9 ++++-
 arch/riscv/include/asm/ptrace.h     |  5 +++
 arch/riscv/include/asm/stacktrace.h |  5 ---
 arch/riscv/kernel/asm-offsets.c     | 10 ++---
 arch/riscv/kernel/entry.S           | 60 +++++++++++++++--------------
 arch/riscv/kernel/head.S            |  6 +--
 arch/riscv/kernel/process.c         |  5 +--
 arch/riscv/kernel/stacktrace.c      |  9 -----
 8 files changed, 53 insertions(+), 56 deletions(-)

-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
