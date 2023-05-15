Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C679BC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 03:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LjiFMAC+Tz0A0jF75nIrk3st19v14xkqI4lhh5JOhKw=; b=2KqngD2l650nTe
	PacUeRHfxJQQviG7wePyVzAMy5qODk1cTAL0KhmjpAlenaZdEHqSnKrfZcaMkvexsCRk4BcsAz4E9
	sMUbhDyRKxi73TgUh6Ti3tysYUeemDRHKpBY9MKIJugszfKIkvGUfR8/dWM+BL+pVMZc8gimKgcff
	RhJKm7XyWvZboJrbmRjoPhuWwWRNBbZLLOYX8bp9TWyQ0q7xMfmxgrYtMvSBo6xDEtMUO3eNBcvt5
	QB1uXqrZbYLhuQbZRY9hjK0hwOPsEGTXBU/fXEHfFns9WggN4fg5AwDZZbj/QvNAjYOFX7N1i3gMH
	xAGbqHRlt7Ui1vx8NbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyOef-000hmS-1g;
	Mon, 15 May 2023 03:13:45 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyOeY-000hlV-20
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 03:13:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2502346bea0so7582145a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 20:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684120417; x=1686712417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxpFGoxleToaQwkHibZ+pniT5a0w07wmiTEGO0b16Vo=;
        b=aSCO1ZUHRnLT0HbSwrWiP7TCHqlmHQdUDduIsVKHGoUaY6ROnA8cP5+RczTadKuocY
         sLMNEMpTCzItVU6bBBNwPIRNLJumVtiSPafhhhkJfCilQ5U7Qpu2I4Vml+BGcoHJ5KfL
         dWTTAq0Bb2x+jTp92UjXF3FfIHfAd2HpjVjKgtAyVwA5h7kGB+0FjgNSQLHuYat8Z0Al
         fmuvZFXdJcpIZR4jgmQc8/eFd6PftjcIFBqFpTLQpsgBAL4kbaNJ9h/hNouQ9EaSyabV
         dmuM1n+VfEkkX29aeVZYacIxt2BHDSXUkFiy1wP8lzq6V7alRLEtIK69mGZWTspgr2YO
         LFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684120417; x=1686712417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxpFGoxleToaQwkHibZ+pniT5a0w07wmiTEGO0b16Vo=;
        b=jcZlWpOTHgFSWaK9cbNjwYZVrQwkkdz0OzJn7KRKxsD34hHsJ0J+KnT07Dvv0cMn5q
         JkbtDxRDGPYEz9w94Z8TP78/5mgynFK/0c6VsQIz6fkQ4qmUj3qJkc3vG094S1O2b8nS
         5J9RzRG+zI9C6MPoo35Fa6INkeVUtB0w+SWKlnen6dJOWeOqqF6LB17bJ/aJgQD7KXRx
         FBNZXwF9XC0sGR8nmasKxkm3xrr9V/wNA1iY1xNj4ec1SpEcllMSW2ZBsmYDzMhpffCp
         igSRtSb7YpohyoupxjuVU0AQpcPc0tuJcXl5dBXjQMGGteqotOQb7jge5x3JiKa0CPxG
         +IUw==
X-Gm-Message-State: AC+VfDyuJXzppbBG3YVZr3vbCsWYKVTxHrFfmshPvlxzuUYzDxdXXNln
	JIwSNU6P9hE9B9WWiZT9yk8=
X-Google-Smtp-Source: ACHHUZ7bom1WsQSB9N7JbS2hNeG7BAQVaheeDyi1N5Vs6lkfmNmaRmJdqhiEQg2hZDvBtME2yZj8YQ==
X-Received: by 2002:a17:90a:760c:b0:24e:5ed7:2e3f with SMTP id s12-20020a17090a760c00b0024e5ed72e3fmr33118826pjk.13.1684120416916;
        Sun, 14 May 2023 20:13:36 -0700 (PDT)
Received: from localhost.localdomain ([43.132.98.42])
        by smtp.googlemail.com with ESMTPSA id o4-20020a17090a744400b00252b3328ad8sm4943577pjk.0.2023.05.14.20.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 20:13:36 -0700 (PDT)
From: Ze Gao <zegao2021@gmail.com>
X-Google-Original-From: Ze Gao <zegao@tencent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Ze Gao <zegao@tencent.com>,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH 0/4] Make fpobe + rethook immune to recursion
Date: Mon, 15 May 2023 11:13:09 +0800
Message-Id: <20230515031314.7836-1-zegao@tencent.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_201338_679700_635AE962 
X-CRM114-Status: GOOD (  11.24  )
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

Current fprobe and rethook has some pitfalls and may introduce kernel stack recusion, especially in
massive tracing scenario.

For example, if (DEBUG_PREEMPT | TRACE_PREEMPT_TOGGLE) , preempt_count_{add, sub} can be traced via
ftrace, if we happens to use fprobe + rethook based on ftrace to hook on those functions, 
recursion is introduced in functions like rethook_trampoline_handler and leads to kernel crash
because of stack overflow.

Snippets of such bug are like this:
[   56.038709] BUG: #DF stack guard page was hit at 000000000b5b7199 (stack is 00000000f4b5a9b2..00000000af4160ce)
[   56.038713] stack guard page: 0000 [#1] PREEMPT SMP NOPTI
[   56.038715] CPU: 5 PID: 1836 Comm: retsnoop Kdump: loaded Not tainted 6.1.18 #2
[   56.038717] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 05/05/2021
[   56.038717] BUG: #DF stack guard page was hit at 0000000069dc65a2 (stack is 000000006b9345c5..00000000a221349b)
[   56.038718] RIP: 0010:ftrace_ops_test+0x1a/0x70
[   56.038721] Code: 89 df e8 79 e2 ff ff e9 6e ff ff ff 0f 1f 40 00 48 81 ec b0 00 00 00 49 89 f1 49 89 f8 31 c0 48 89 e6 b9 16 00 00 00 48 89 f7 <f3> 48 ab 48 85 d2 74 35 49 8b 80 d8 00 00 00 48 8b 40 08 48 89 44
[   56.038722] RSP: 0018:fffffe5a8bba5fa0 EFLAGS: 00010046
[   56.038724] RAX: 0000000000000000 RBX: fffffe5a8bba6090 RCX: 0000000000000016
[   56.038725] RDX: fffffe5a8bba6090 RSI: fffffe5a8bba5fa0 RDI: fffffe5a8bba5fa0
[   56.038726] RBP: ffffffffb7137910 R08: ffff8b967f827c70 R09: ffffffffb7137910
[   56.038727] R10: 0000000000000000 R11: 0000000000000000 R12: fffffe5a8bba6090
[   56.038727] R13: ffffffffb729e2bf R14: ffffffffffffffdf R15: ffff8b967f827c70
[   56.038728] FS:  00007f6592d6ed00(0000) GS:ffff8b977da00000(0000) knlGS:0000000000000000
[   56.038730] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   56.038730] CR2: fffffe5a8bba5f98 CR3: 000000010ed94002 CR4: 00000000003726e0
[   56.038733] Call Trace:
[   56.038735]  <#DF>
[   56.038740]  ? exc_int3+0xa/0xc0
[   56.038743]  arch_ftrace_ops_list_func+0xc2/0x190
[   56.038745]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038748]  ftrace_regs_call+0x5/0x52
[   56.038751]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038754]  ? osnoise_arch_unregister+0x210/0x210
[   56.038757]  ? preempt_count_add+0x5/0xa0
[   56.038760]  preempt_count_add+0x5/0xa0
[   56.038762]  rethook_trampoline_handler+0x5f/0x140
[   56.038764]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038766]  arch_rethook_trampoline_callback+0x3b/0x50
[   56.038768]  arch_rethook_trampoline+0x2c/0x60
[   56.038770]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038775]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038778]  osnoise_arch_unregister+0x210/0x210
[   56.038780]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038781]  arch_rethook_trampoline_callback+0x3b/0x50
[   56.038783]  arch_rethook_trampoline+0x2c/0x60
[   56.038785]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038790]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038792]  osnoise_arch_unregister+0x210/0x210
[   56.038794]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038795]  arch_rethook_trampoline_callback+0x3b/0x50
[   56.038797]  arch_rethook_trampoline+0x2c/0x60
[   56.038799]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038804]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038806]  osnoise_arch_unregister+0x210/0x210
[   56.038808]  ? rethook_trampoline_handler+0x5f/0x140
[   56.038810]  arch_rethook_trampoline_callback+0x3b/0x50
[   56.038811]  arch_rethook_trampoline+0x2c/0x60
...
[   56.039133]  ? rethook_trampoline_handler+0x5f/0x140
[   56.039137]  ? rethook_trampoline_handler+0x5f/0x140
[   56.039139]  osnoise_arch_unregister+0x210/0x210
[   56.039141]  ? rethook_trampoline_handler+0x5f/0x140
[   56.039143]  arch_rethook_trampoline_callback+0x3b/0x50
[   56.039144]  arch_rethook_trampoline+0x2c/0x60
[   56.039147]  ? rethook_trampoline_handler+0x5f/0x140
[   56.039151]  ? rethook_trampoline_handler+0x5f/0x140
[   56.039156]  ? vsnprintf+0x2a3/0x550
[   56.039161]  ? sprintf+0x4e/0x60
[   56.039163]  ? kallsyms_lookup_buildid+0x5f/0x130
[   56.039167]  ? __sprint_symbol.constprop.0+0xec/0x110
[   56.039171]  ? symbol_string+0xc5/0x150
[   56.039197]  ? vsnprintf+0x33a/0x550
[   56.039201]  ? exc_int3+0xa/0xc0
[   56.039204]  ? exc_int3+0xa/0xc0
[   56.039205]  ? ftrace_regs_call+0x5/0x52
[   56.039208]  ? ftrace_regs_call+0x5/0x52
[   56.039211]  ? lock_acquire+0x25d/0x2e0
[   56.039214]  ? lock_release+0x208/0x460
[   56.039218]  ? is_bpf_text_address+0x67/0xf0
[   56.039220]  ? kernel_text_address+0x111/0x120
[   56.039223]  ? __kernel_text_address+0xe/0x40
[   56.039225]  ? show_trace_log_lvl+0x1d7/0x336
[   56.039227]  ? show_trace_log_lvl+0x1d7/0x336
[   56.039236]  ? __die_body.cold+0x1a/0x1f
[   56.039239]  ? die+0x2a/0x50
[   56.039242]  ? handle_stack_overflow+0x49/0x60
[   56.039245]  ? exc_double_fault+0x148/0x180
[   56.039248]  ? asm_exc_double_fault+0x1f/0x30
[   56.039251]  ? rethook_trampoline_handler+0x5f/0x140
[   56.039252]  ? cpu_cgroup_css_free+0x30/0x30
[   56.039254]  ? cpu_cgroup_css_free+0x30/0x30
[   56.039258]  ? ftrace_ops_test+0x1a/0x70
[   56.039260]  </#DF>

This bug is found via tool retsnoop which internally uses bpf based on fprobe + rethook
Discussion of this bug can be found here:
  Link: https://lore.kernel.org/bpf/20230510122045.2259-1-zegao@tencent.com/

This patch series fix this problem by adding more recursion detection in each possible entry
functions, and also mark these specific to fprobe or rethook which are beyond the recusion-free
guarded region notrace. 


Ze Gao (4):
  rethook: use preempt_{disable, enable}_notrace in
    rethook_trampoline_handler
  fprobe: make fprobe_kprobe_handler recursion free
  fprobe: add recursion detection in fprobe_exit_handler
  rehook, fprobe: mark rethook related functions notrace

 arch/riscv/kernel/probes/rethook.c |  4 +-
 arch/s390/kernel/rethook.c         |  6 +--
 arch/x86/kernel/rethook.c          |  8 ++--
 kernel/trace/fprobe.c              | 76 +++++++++++++++++++++++-------
 kernel/trace/rethook.c             | 12 ++---
 5 files changed, 75 insertions(+), 31 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
