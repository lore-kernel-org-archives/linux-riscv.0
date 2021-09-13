Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065CFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 01:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7131C6108E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 01:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7131C6108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lyAMU1Sx4Vxeu6IbzlPlFLjLlg4la0O90iQ/cL5PS0=; b=wJ1TMqgWJygNcP
	roXpg/h2+1wjUY/g4pwVg1NLhl5Ltc1Qb5OBZ8Ieoj8a3YDpF6S6gL6Ysci3O60CI08R2KZVwN7cq
	IIRsotdFfC9wuTgySdq3dsFHmamx+8fGmAQwMfmkAAJHRixJE2a1jU4jP4InbBbrjfPjqMM+GNvSw
	mpI+wVR0+Ye4L5DALfTditosfMVkI3yAWXqEZ50cGAhuhaj0quaN1JAWBOdApd1gbMG3R1aMqbMBq
	aLik1+FS5mCRigShHwdopEcWVCV9LQes362I5kgRIQRCI5yVTULbyiQQfGuVL2EIwFdIFLUCgM+/g
	jN3td/kOmc83QCIVqiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPb4e-0007GU-Mq; Mon, 13 Sep 2021 01:47:56 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPb4Q-0007Fz-Q6
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 01:47:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id q22so7386400pfu.0
 for <linux-riscv@lists.infradead.org>; Sun, 12 Sep 2021 18:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ia1rwkP7uni5EhSwEMElqDqJu3qS6ynG7Vl5G0lrbo=;
 b=P1DRIcSurUCIjiP6Q9AtmvajYnippfHZ1wkvycOPGt8mG9hZKngCZqqrZz3TtwpJk8
 CgCOKy8LVDByGzXaXBVYNpGVCMMr/+ygFhoDdmDNv8G36cDACR9SDW/JRwkE8r5DKYWZ
 H3CweNwM74GreiykYDKJyocPCH2D5tP9xbWdb/Tbuv4Pvb3gTaepsv3xl1yHpaWCIVKS
 Rq8xXyeBnZO01k6Pr4yoQ1zVzqMwUDOJg3n58760NGKMOdpDgTukaviyHUg3Ux1Ovo6B
 UE5i0XIr5E9Hd66LXKidpSh20FuBhCN+C0aIYxvvgYiJYprIzvUWSfNDcwIkrPAgF+Xw
 ReaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ia1rwkP7uni5EhSwEMElqDqJu3qS6ynG7Vl5G0lrbo=;
 b=34A6Zp1Q0Jdl2in3z3fc6TBsU5xiKSWe5zHy0KMJoDs03q0tMmPGTDBoUe/KTOIRb4
 3KI8LwH6vATF9p72hxWR5cJhmmW6x9f9YBACAidLKzIZpSm7Vp6RTckTBtWEmjJeyr5p
 4wXViNHUqEkGFdTpNQs2wBbZe8KEh1aixYnw3FkWgerW7gF4+OgXfLMp2lq9CZydxo/x
 /7cdTs7VvVs07/bsqych4xhifqcciub80vk2rQwmP38xeOJwvvae37c0wJKIR0+6IK/k
 kvDICgLheWNlhtH7EVH1uliRl/bCHNsbdr7eflTW2jYJizIJdqSe6i7Sf5lDdFdNFRq1
 vKjA==
X-Gm-Message-State: AOAM530koIXApmGjOZDtk6HojgByzOnz72FXhwidouFWmxtZiVk32hPn
 0//m6wj1PQPZf95jBhBQRfOxwnjvEfoyfm9LuyijwQ==
X-Google-Smtp-Source: ABdhPJyTY2JSBN0lqQBo5XyHgEgkgSE7yJpM1s1aWEjcQ18j5CXTAnK5c4f0v1Na4oyenYzA4ErB/LXZ30rc0VWz1LA=
X-Received: by 2002:a65:6398:: with SMTP id h24mr8810743pgv.367.1631497661309; 
 Sun, 12 Sep 2021 18:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 13 Sep 2021 09:47:30 +0800
Message-ID: <CABvJ_xjiD0Vf1SqR2vtLDpmvY79wmG=yyyFU=M8JjuEWs0n_Pw@mail.gmail.com>
Subject: Re: [RFC PATCH v8 00/21] riscv: Add vector ISA support
To: Greentime Hu <greentime.hu@sifive.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_184742_934606_07B9E33B 
X-CRM114-Status: GOOD (  33.14  )
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

Hi all,

The associated Glibc vector patches could be found here
https://sourceware.org/pipermail/libc-alpha/2021-September/130897.html
Thanks

On Thu, Sep 9, 2021 at 1:45 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> This patchset is implemented based on vector 1.0-rc1 spec to add vector
> support in riscv Linux kernel. To make this happen, we defined a new
> structure __riscv_v_state to save the vector related registers. It is used
> for both kernel space and user space.
>
>  - In kernel space, the datap pointer in __riscv_v_state will be allocated
>    dynamically to save vector registers.
>  - In user space,
>         - In signal handler of user space, datap will point to the address
>           of the __riscv_v_state data structure to save vector
>           registers in stack. We also create a __reserved[] array for
>           future extensions.
>         - In ptrace, the data will be put in ubuf in which we use
>           riscv_vr_get()/riscv_vr_set() to get or set the
>           __riscv_v_state data structure from/to it, datap pointer
>           would be zeroed and vector registers will be copied to the
>           address right after the __riscv_v_state structure in ubuf.
>
> This patchset also adds support for kernel mode vector, kernel XOR
> implementation with vector ISA and includes several bug fixes and code
> refinement.
>
> This patchset is rebased to v5.14 and it is tested by running several
> vector programs simultaneously. It also can get the correct ucontext_t in
> signal handler and restore correct context after sigreturn. It is also
> tested with ptrace() syscall to use PTRACE_GETREGSET/PTRACE_SETREGSET to
> get/set the vector registers. I have tested vlen=128 and vlen=256 cases in
> qemu-system-riscv64 provided by Frank Chang.
>
> We have sent patches to glibc mailing list for ifunc support and sigcontext
> changes. We will send patches for vector support to glibc mailing list
> recently.
>
>  [1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc
>
> ---
> Changelog V8
>  - Rebase to v5.14
>  - Refine struct __riscv_v_state with struct __riscv_ctx_hdr
>  - Refine has_vector into a static key
>  - Defined __reserved space in struct sigcontext for vector and future extensions
>
> Changelog V7
>  - Add support for kernel mode vector
>  - Add vector extension XOR implementation
>  - Optimize task switch codes of vector
>  - Allocate space for vector registers in start_thread()
>  - Fix an illegal instruction exception when accessing vlenb
>  - Optimize vector registers initialization
>  - Initialize vector registers with proper vsetvli then it can work normally
>  - Refine ptrace porting due to generic API changed
>  - Code clean up
>
> Changelog V6
>  - Replace vle.v/vse.v instructions with vle8.v/vse8.v based on 0.9 spec
>  - Add comments based on mailinglist feedback
>  - Fix rv32 build error
>
> Changelog V5
>  - Using regset_size() correctly in generic ptrace
>  - Fix the ptrace porting
>  - Fix compile warning
>
> Changelog V4
>  - Support dynamic vlen
>  - Fix bugs: lazy save/resotre, not saving vtype
>  - Update VS bit offset based on latest vector spec
>  - Add new vector csr based on latest vector spec
>  - Code refine and removed unused macros
>
> Changelog V3
>  - Rebase linux-5.6-rc3 and tested with qemu
>  - Seperate patches with Anup's advice
>  - Give out a ABI puzzle with unlimited vlen
>
> Changelog V2
>  - Fixup typo "vecotr, fstate_save->vstate_save".
>  - Fixup wrong saved registers' length in vector.S.
>  - Seperate unrelated patches from this one.
>
> Greentime Hu (15):
>   riscv: Add new csr defines related to vector extension
>   riscv: Add has_vector/riscv_vsize to save vector features.
>   riscv: Add vector struct and assembler definitions
>   riscv: Add task switch support for vector
>   riscv: Add ptrace vector support
>   riscv: Add sigcontext save/restore for vector
>   riscv: Add support for kernel mode vector
>   riscv: Use CSR_STATUS to replace sstatus in vector.S
>   riscv: Add vector extension XOR implementation
>   riscv: Initialize vector registers with proper vsetvli then it can
>     work normally
>   riscv: Optimize vector registers initialization
>   riscv: Fix an illegal instruction exception when accessing vlenb
>     without enable vector first
>   riscv: Allocate space for vector registers in start_thread()
>   riscv: Optimize task switch codes of vector
>   riscv: Turn has_vector into a static key if VECTOR=y
>
> Guo Ren (5):
>   riscv: Separate patch for cflags and aflags
>   riscv: Rename __switch_to_aux -> fpu
>   riscv: Extending cpufeature.c to detect V-extension
>   riscv: Add vector feature to compile
>   riscv: Reset vector register
>
> Vincent Chen (1):
>   riscv: signal: Report signal frame size to userspace via auxv
>
>  arch/riscv/Kconfig                       |   9 ++
>  arch/riscv/Makefile                      |  19 ++-
>  arch/riscv/include/asm/csr.h             |  16 ++-
>  arch/riscv/include/asm/elf.h             |  41 +++---
>  arch/riscv/include/asm/processor.h       |   3 +
>  arch/riscv/include/asm/switch_to.h       |  71 +++++++++-
>  arch/riscv/include/asm/vector.h          |  16 +++
>  arch/riscv/include/asm/xor.h             |  74 ++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h     |   1 +
>  arch/riscv/include/uapi/asm/hwcap.h      |   1 +
>  arch/riscv/include/uapi/asm/ptrace.h     |  25 ++++
>  arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
>  arch/riscv/kernel/Makefile               |   7 +
>  arch/riscv/kernel/asm-offsets.c          |   8 ++
>  arch/riscv/kernel/cpufeature.c           |  16 +++
>  arch/riscv/kernel/entry.S                |   6 +-
>  arch/riscv/kernel/head.S                 |  22 ++-
>  arch/riscv/kernel/kernel_mode_vector.c   | 158 +++++++++++++++++++++
>  arch/riscv/kernel/process.c              |  49 +++++++
>  arch/riscv/kernel/ptrace.c               |  71 ++++++++++
>  arch/riscv/kernel/setup.c                |   4 +
>  arch/riscv/kernel/signal.c               | 172 ++++++++++++++++++++++-
>  arch/riscv/kernel/vector.S               |  81 +++++++++++
>  arch/riscv/lib/Makefile                  |   1 +
>  arch/riscv/lib/xor.S                     |  81 +++++++++++
>  include/uapi/linux/elf.h                 |   1 +
>  26 files changed, 941 insertions(+), 36 deletions(-)
>  create mode 100644 arch/riscv/include/asm/vector.h
>  create mode 100644 arch/riscv/include/asm/xor.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
>  create mode 100644 arch/riscv/kernel/vector.S
>  create mode 100644 arch/riscv/lib/xor.S
>
> --
> 2.31.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
