Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1CFC3ABD8
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 05:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujCqnU01iYV/ySkyAYXP2r6pjJk2z0wU9kkmYkcQopU=; b=1Q0BH7kLTFQyWv
	9FG08B5lL8/Xji+BqYJdxgLSsdmR8NlbXY8HNltgxsQ3bqDDJagS65taboxag9m1XJ44RzprN9N02
	Z//9nI/raASQZVKod+X8eEyZTDgdfVPsbLE52RwUoNjuOq4NhL2sl/Tfh6EoP9aJFwUGdSRH8ClBY
	CjNq/GZonu1UqaIGNGWrGnpnLXkJA9/aV80RqEQpI5r/du95J3n1xrnqC8m/axFxbRiwC9ZFc63CE
	vA6aXh/XOCIqg0JUwrP/De066Qcw1uotR8hOnH4oQtstBu2J6WJL+8nNfKvXJgE1wrgZjejEpiKxo
	dSx9y+1qaPYMuRCfZtMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRFO-00000005Rzq-0Rst;
	Tue, 17 Sep 2024 05:59:34 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRFK-00000005RzO-3U5X
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 05:59:32 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1fee6435a34so45423385ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726552769; x=1727157569; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Tc+i0jL+SgEcOjmMg2Bl4vsyUPl8jhbpSLkRrsREYU=;
        b=BagCRrt5Q7YJQosNnC6v4cdGkuvt0+TsNfQlZ00NOYpBG9oI/P1G+ONNCZ+ozHIs9G
         BWY8ZS4GKX/XiNXENzs9wg3lxfWto9Dl18wqwECDT2LLl4mhyXOzDXHXmxRil1kfKXRl
         GuGDLA6UxoIRnFxwoqE+Zy2MPHZn0F5f57cMtbW48T3Gvl55lGKfdqTzBpTC2N5jUzVu
         yf1NC5sr23dKHU3F4DVdMouGD+7rCjdi3z+FrTr7FRKQItfo+CuxBu3Boz7//pRifui9
         JG9ivOeNsX9/lJmZsGWEfmBEx9b1r5THFvTW+7G0U50Q439d1r+Gs5dtCNKLZ0iKbvlr
         qriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726552769; x=1727157569;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Tc+i0jL+SgEcOjmMg2Bl4vsyUPl8jhbpSLkRrsREYU=;
        b=wsv0oIakyzwUhiFyEUjKYkRYAaxxllk9aXRCbk+DxLA6YqA/wXL9Z0QwPr2G2T3bmM
         Bfzba4pZJNwKnnxM/BqjfgfCXWZzy7Q+gtwXLigkMIyMHgnjV3zKvpaglNF1WnXRz1Pi
         oTxEDiYEx0oX33cnNezXOaLe2taDIwf/J6XKlT0gx3xlCHGZkWimFd14HKM/X38L2SAD
         onStYAXU6TBQH41ZP3jA/PBDrSjG7pZU00BiVbQF1cgdECQzYxBg/tzNyoD6ViexGSrM
         MMlOpyeNriTOwS62FPM+UW/UuEZdhlYWUz9SX3vhWF8oiE2QSg+b6oTlrQDWmG6N4Bpc
         pysg==
X-Gm-Message-State: AOJu0YwZTjKDaPPlscz8JZypABTmIeVmMgX1784EVMwME6cRPWOtmfQY
	kSUUsDyvwf8+82eox9qNRX/idKKcaKwLflp5Xo2txMObrAwADUYtIT9T9nuzO1U=
X-Google-Smtp-Source: AGHT+IHmRxszv3e1lKEIxv9DUkSNGSmFzkYMMAf4vZ11XlTwpEwRIP+nuTl2ZfeEhAN7qZWn8UuwrA==
X-Received: by 2002:a17:902:fc4c:b0:207:4c7c:743b with SMTP id d9443c01a7336-2076d90a1aamr269812965ad.0.1726552769241;
        Mon, 16 Sep 2024 22:59:29 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794712f91sm44325315ad.229.2024.09.16.22.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 22:59:28 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <84ae492a-1995-4fa1-9d3c-78c5bbf9ff71@gmail.com>
Date: Tue, 17 Sep 2024 13:59:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] riscv/entry: issue about a0/orig_a0 register and ENOSYS
Content-Language: en-GB-large
To: linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
 "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrea Bolognani <abologna@redhat.com>, WANG Xuerui <git@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Yangyu Chen <cyy@cyyself.name>,
 Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 rsworktech@outlook.com
References: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
In-Reply-To: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_225930_915470_309E3FD8 
X-CRM114-Status: GOOD (  31.29  )
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

On 2024-09-17 12:09, Celeste Liu wrote:
> Before PTRACE_GET_SYSCALL_INFO was implemented in v5.3, the only way to
> get syscall arguments was to get user_regs_struct via PTRACE_GETREGSET.
> On some architectures where a register is used as both the first
> argument and the return value and thus will be changed at some stage of
> the syscall process, something like orig_a0 is provided to save the
> original argument register value. But RISC-V doesn't export orig_a0 in
> user_regs_struct (This ABI was designed at e2c0cdfba7f6 ("RISC-V:
> User-facing API").) so userspace application like strace will get the
> right or wrong result depends on the operation order in do_trap_ecall_u()
> function.
> 
> This requires we put the ENOSYS process after syscall_enter_from_user_mode()
> or syscall_handler()[1]. Unfortunately, the generic entry API
> syscall_enter_from_user_mode() requires we
> 
> *  process ENOSYS before syscall_enter_from_user_mode()
> *  or only set a0 to ENOSYS when the return value of
>    syscall_enter_from_user_mode() != -1
> 
> Again, if we choose the latter way to avoid conflict with the first
> issue, we will meet the third problem: strace depends on that kernel
> will return ENOSYS when syscall nr is -1 to implement their syscall
> tampering feature[2].
> 
> Actually, we tried the both ways in 52449c17bdd1 ("riscv: entry: set
> a0 = -ENOSYS only when syscall != -1") and 61119394631f ("riscv: entry:
> always initialize regs->a0 to -ENOSYS") before.

It's also impossible to save original syscall number before 
syscall_enter_from_user_mode() to use later because some API like ptrace() can 
change syscall number in syscall_enter_from_user_mode().

> 
> Naturally, there is a solution:
> 
> 1. Just add orig_a0 in user_regs_struct and let strace use it as
>    loongarch does. So only two problems, which can be resolved without
>    conflict, are left here.
> 
> The conflicts are the direct result of the limitation of generic entry
> API, so we have another two solutions:
> 
> 2. Give up the generic entry API, and switch back to the
>    architecture-specific standardalone implementation.
> 3. Redesign the generic entry API: the problem was caused by
>    syscall_enter_from_user_mode() using the value -1 (which is unused
>    normally) of syscall nr to inform syscall was reject by seccomp/bpf.

The issue of generic entry API is that -1 is invalid syscall number, but it 
still contains some information. It's similar to situation of Python's 
PyLong_As* API: all bits of return value are used to contains some information. 
Since there is no elegant way to implement sum type in C, we can split to into 
two value: the return value is just success or reject, and an argument to pass 
syscall out.

But from another angle, syscall number is in a7 register, so we can call the 
get_syscall_nr() after calling the syscall_enter_from_user_mode() to bypass the 
information lost of the return value of the syscall_enter_from_user_mode(). But 
in this way, the syscall number in the syscall_enter_from_user_mode() return 
value is useless, and we can remove it directly.

> 
> In theory, the Solution 1 is best:
> 
> *  a0 was used for two purposes in ABI, so using two variables to store
>    it is natural.
> *  Userspace can implement features without depending on the internal
>    behavior of the kernel.
> 
> Unfortunately, it's difficult to implement based on the current code.
> The RISC-V defined struct pt_regs as below:
> 
>         struct pt_regs {
>                 unsigned long epc;
>         ...
>                 unsigned long t6;
>                 /* Supervisor/Machine CSRs */
>                 unsigned long status;
>                 unsigned long badaddr;
>                 unsigned long cause;
>                 /* a0 value before the syscall */
>                 unsigned long orig_a0;
>         };
> 
> And user_regs_struct needs to be a prefix of struct pt_regs, so if we
> want to include orig_a0 in user_regs_struct, we will need to include
> Supervisor/Machine CSRs as well. It's not a big problem. Since
> struct pt_regs is the internal ABI of the kernel, we can reorder it.
> Unfortunately, struct user_regs_struct is defined as below:
> 
>         struct user_regs_struct {
>                 unsigned long pc;
>         ...
>                 unsigned long t6;
>         };
> 
> It doesn't contain something like reserved[] as padding to leave the
> space to add more registers from struct pt_regs!
> The loongarch do the right thing as below:
> 
>         struct user_pt_regs {
>                 /* Main processor registers. */
>                 unsigned long regs[32];
>         ...
>                 unsigned long reserved[10];
>         } __attribute__((aligned(8)));
> 
> RISC-V can't include orig_a0 in user_regs_struct without breaking UABI.
> 
> Need a discussion to decide to use which solution, or is there any
> other better solution?
> 
> [1]: https://github.com/strace/strace/issues/315
> [2]: https://lore.kernel.org/linux-riscv/20240627071422.GA2626@altlinux.org/
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
