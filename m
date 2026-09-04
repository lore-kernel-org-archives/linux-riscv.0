Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ADBC79F82
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 19:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x1G9J4hfvrFwGfOijre8DcYvm34FubK2EZrXhUcbfCg=; b=DUt4KzeiRMHyUm
	AI61R6kzm0JbET3CvrK5A7Oyuv+iCX1qGOMW8IufKH0wDXg3A2wFRwtZLYp1FoEdIoYMgw8A3ZQGN
	S24LKSYBKWFbTLXLy68u0kqEOZuAUC/j83y0FHmTgquJ8Q11201Y0PwZ9WA4Q+2Y0/Xd8n0gqihzF
	OX4PIMbWNsNzEYPgMYw3PdKx+9P8ro39tL1F5nLQa5wTs9SKrUS7C2iThQ+czunp6wxi8LJngydWA
	SjwwHAVtG9ciNjKVZivF8LCR8okKZ2tD/lE6/ZLpKPKyuv1kGOF0rHjFYVaXh8jkGTCJ0YoQaIOoC
	Y/GREOtNBhHAWOsCjygw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwp-00000003D8C-359h;
	Fri, 04 Sep 2026 19:51:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Zwm-00000003D6t-43Ut
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 19:51:39 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso1201421b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788551496; x=1789156296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKfMAbI9WP00e34xfYRqukO9FWyuttxaiqoWfdsqtb0=;
        b=WOtBCDWLkr03s17jT2lraZJ/fgQBtZt0mPoQtos8MBm7+6qsaILhjixtE7+kKsBh1+
         AdUdGB9//aC4CyGUQu3aQ4uwd/e4sy0ZoCGDe62axVz9ZOsUfwsDIR/qvRajZ0DG20uv
         wnkMldYiMDkuHE9XSbtgqAlHuMiEB/3KnhZfqTa84aqc4S6/exgcHE1wSMNJSgxOIC0v
         P8ho1KXoIDI8gmeQYuGv6xinCOIuFXcPHa6xyC3m/OtkzJ8KuO65hGR/1pqhQww21fA7
         ZmLWWrBAjrJoKaIcLM1EHgzY3m2mviaAc9abXKakP6H9i1i5uhUwrKrpvX1Rd+etzLbU
         Gd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788551496; x=1789156296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKfMAbI9WP00e34xfYRqukO9FWyuttxaiqoWfdsqtb0=;
        b=FJHpLJuKmJkSfkhOl4Y07l9Lfr5tUeTLAeEFDDol0x0YAZXuXcobbwZyjI7xS/GWAk
         YIxSyH8pOrRfkcySmaTYczqGbC5Y5ba7l04mYZ10f1sW658s9mvxhyCWydjzRWYieUpD
         VQr/NHX112C9xtNFRPemZ18QeZhQJN5tDGryeAXFzdzITwnVG5Nwg+wqc9uDGHIF6H/o
         X1YiZGBuGbWiko4Sk0Ne79+XLXeYOhQ3BBLz4ZkNqoQJrA4CEFclN63HYS7UYOdANwoj
         FoykK3sE4pbtupw7wgJJtc8fhNkDckAaAkO8IcyNlcMWcMukpAKmIiUfBqvqMTEjQUOx
         Pe5g==
X-Forwarded-Encrypted: i=1; AKwUvByOTKfwaJi8DjzVo6LcU485hkAh06MUBRex0k9awyxseJNCYtgPycierR/3mo9qwuy8gwXcykxE9IJqZA==@lists.infradead.org
X-Gm-Message-State: AFuF++lFfUxx0yyET1ZPqNc/Pv0n28VC2VmsCRO6EpGeaXZ6+DOpfUpC
	rs0yuYxkiHGx/F5Ymp1oBNQQwm5UgRQ+q5f1XoThghA8iDUKHzKbQ/e7
X-Gm-Gg: AYBFou0kEfW7WFIqJyAIbspFHipb/RfjpDCifzNJ7w6sJ9r2kj+JsH/XHVc20YHKurC
	Bc5Zq6XeT3YwqbkbSAeim1kBHNURhy4KWOWsJaChqOwCGMxetQf8ibWUyg5Oe/gSCyAS3Z7MpfK
	/EpNuyMuwSwtqYGOQbnMXNmbBx6d959MvnjZY1LMoaD5fAXTANRAfrKODA+Nb5nZuwBh5QfVtle
	dhnypcchmJ8iiWmoxytNSal/+69OcO4h2ji/E12UjkOBMviXaxsv6Sd0gMhXKPh3hdc3QuUPVrJ
	T+begowxE9qtoJQhhHRvOheN0M0Qew+N4o+VuXDvtTjYszYsNBmShaoq/7JWg1RcCS0gW97Q7je
	T+p/zPhJxGCyYaFl5CLIt35XiqmeKrKUtW8zAHzONukhLUf2Mc7Q3Vdo2EEVFrp9ph/AJzxwz0U
	KYp1MGpCTAoXuZMcPcLzbHLz3MT/qRivF6i0vbHCZV3ljx2lW32i3IbjbACHS+vDF3qfcFWj3e8
	P/JII1FwTsV2vKSF5QUTuLHjTVREKF04xgiOgnEdzMhHFsRR5eZExYf3AiCRIlANXu4QvIAlgyR
	eFk64u/7O8OH+fWEAx7qx4+VULVTnEH5gvu7+lQ0UJp1++mONtaklB/ZGJkg7bM26sBdrtS4xWM
	=
X-Received: by 2002:a05:6a00:b94:b0:84e:2382:f4f0 with SMTP id d2e1a72fcca58-861660e2f8amr11334624b3a.4.1788551495503;
        Fri, 04 Sep 2026 12:51:35 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615404876fsm1497684b3a.59.2026.09.04.12.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:51:35 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: bpf@vger.kernel.org
Cc: Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	apais@microsoft.com
Subject: [PATCH bpf-next v1 0/7] Fix timed may_goto with private stacks
Date: Fri,  4 Sep 2026 19:51:25 +0000
Message-ID: <20260904195132.141068-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_125137_026751_C576FBF4 
X-CRM114-Status: GOOD (  11.26  )
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

Jeremy reported a bug[1] while executing a BPF program containing
timed_may_goto instructions with private stacks.

timed_may_goto[2] is a runtime safety mechanism that allows BPF
programs to execute longer loops[3]. The BPF verifier replaces each
may_goto instruction with a loop counter initialized to 0xffff and a
timestamp check[4] that terminates the loop after 250 ms.

Private stacks[5] allow BPF programs to use per-CPU memory instead of
consuming more of the native kernel stack when BPF programs are deeply
nested.

To make timed may_goto work, the BPF program reserves 16 bytes of stack
space. The first 8 bytes store the loop counter and the next 8 bytes
store the timestamp.

After the loop counter is exhausted, arch_bpf_timed_may_goto() is
called. On x86, it adds the counter's stack offset to RBP to obtain a
pointer to the counter and timestamp[6]. This works when the BPF
program uses the normal stack because RBP is also the BPF frame pointer.

When a private stack is used, the x86 JIT uses R9 as the BPF frame pointer.
The verifier-generated loads and stores therefore access the counter and
timestamp through R9. However, arch_bpf_timed_may_goto() still adds the
offset to RBP and accesses an unrelated location in the native JIT stack
frame. This is the mismatch Jeremy reported.

Fix the mismatch by resolving the address in the generated BPF
instructions:

        BPF_REG_AX = BPF_REG_FP
        BPF_REG_AX += stack_offset

The JIT can then select the correct BPF frame pointer before calling
arch_bpf_timed_may_goto(). The function receives the resolved pointer
instead of reconstructing it from RBP.

The LoongArch timed may_goto implementation is currently queued through
the loongarch-next tree[7], while its selftests were merged separately
through the bpf-next tree[8]. This series is based on bpf-next and
therefore does not include the LoongArch trampoline update.

[1] https://lore.kernel.org/all/20260824213158.3755932-2-Jeremy.Jean@oss.cyber.gouv.fr/
[2] https://lore.kernel.org/all/20250304003239.2390751-1-memxor@gmail.com/
[3] https://elixir.bootlin.com/linux/v7.2.2/source/tools/testing/selftests/bpf/libarena/include/bpf_may_goto.h#L8
[4] https://elixir.bootlin.com/linux/v7.2.2/source/kernel/bpf/core.c#L3407
[5] https://lore.kernel.org/bpf/20260417034658.2625353-1-yonghong.song@linux.dev/
[6] https://elixir.bootlin.com/linux/v7.2.2/source/arch/x86/net/bpf_timed_may_goto.S#L18
[7] https://lore.kernel.org/loongarch/20260804153938.16129-3-dongtai.guo@linux.dev/
[8] https://lore.kernel.org/bpf/20260813070906.5164-1-yangtiezhu@loongson.cn/

Siddharth Chintamaneni (7):
  bpf: Fix timed may_goto stack pointer for private stacks
  bpf, x86: Use resolved pointer for timed may_goto
  bpf, arm64: Use resolved pointer for timed may_goto
  bpf, powerpc64: Use resolved pointer for timed may_goto
  bpf, riscv: Use resolved pointer for timed may_goto
  bpf, s390: Use resolved pointer for timed may_goto
  selftests/bpf: Test timed may_goto with private stacks

 arch/arm64/net/bpf_timed_may_goto.S           | 12 ++------
 arch/powerpc/net/bpf_timed_may_goto.S         |  8 ++---
 arch/riscv/net/bpf_timed_may_goto.S           | 13 ++++----
 arch/s390/net/bpf_jit_comp.c                  |  6 ++--
 arch/s390/net/bpf_timed_may_goto.S            |  8 ++---
 arch/x86/net/bpf_timed_may_goto.S             |  6 ----
 kernel/bpf/fixups.c                           | 19 ++++++------
 .../bpf/progs/verifier_bpf_fastcall.c         | 30 ++++++++++---------
 .../selftests/bpf/progs/verifier_may_goto_1.c | 17 ++++++-----
 .../bpf/progs/verifier_private_stack.c        | 19 ++++++++++++
 10 files changed, 75 insertions(+), 63 deletions(-)


base-commit: d761934c9483ecde93fe99d8705282f716dfee50
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
