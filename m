Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4300CC3ABCB
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 04:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CIEVVxfXCc0MG6y1gINChX8WXzqM6zE+zuFsDCxK444=; b=CFO
	x/ErPl7Qf0guKYHvA6kEbnW90xlPeXueHyrpl2sLPesA9jzt+6UIT/Tlmbv7qLZ1O1tKHKXNlhBKg
	yDaGAxnF3/iuecaWga1YFriM5YGkZwkQwPtz9vRPVycGUuj8+d6c4nNTMMdx6SeqvFlhK2qOgMubG
	NdaGyBLHskM8lqXEGeDQKB08YkZJ67lyCO5o4rX9zwp4mWKDqfC30jd8nJRT+qM1D0V1QwQOFk4n0
	NR4e+BPH/+7LkXi6c1cN2fQQKnzYnklWUgRh/rgdDyKHUizHd3V2E9xA0gH21NzIOXaIJ1B283EtZ
	nqzWvDiaxjabqx37F1FaEaDt9dDuVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqPWo-00000005KDJ-1plW;
	Tue, 17 Sep 2024 04:09:26 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqPWl-00000005KCr-2JON
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 04:09:24 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-205722ba00cso43029515ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 21:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726546162; x=1727150962; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:content-language:user-agent
         :mime-version:date:message-id:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLP3iy9E8YIRIod5VuQH5Q4jITgxku5jTl2OIlXsXvM=;
        b=FmmzrCM5sQr2aavYrMN9nPJjSGyXcG84Vv9ntI2LAJy/JdqiMYcr36Q7Gx7jNnhUgB
         GSult3J7y8xkh8/7HvtpdP9cqhQkUuvNjzM9IZny3PGzpYh330t0abweS4KcxtnN6zAl
         Pq5NY08R8tasGJUTtsRUIhTje4sTrPUmyTYUMxBq9DKKl+DqzvAkgA6+PM6MA8RTxdnn
         Oz4hc2cxAb+WwqA0azNbi1T32Aa2/qcn6sBRkdJQNG0sVWCbttcK2PW7JcGGoFmbhNwl
         qK1HH5YvvWONbyOIHvhJGPxfK4x8d4ZJAoawRxCJXvDT9tLJVH/zaup86DS9bre+34RG
         ksHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726546162; x=1727150962;
        h=content-transfer-encoding:cc:to:subject:content-language:user-agent
         :mime-version:date:message-id:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLP3iy9E8YIRIod5VuQH5Q4jITgxku5jTl2OIlXsXvM=;
        b=i7GT4WHdvKtxp05XBHcXS5R5qqciZeZodJtAxoeBYV446dalRr6J0f2hNhYZKx/U1n
         QP7sKc/65cpJyuizfyMOU02CsiAd04KsJCIM7cOwiUqUIFI5kmsDa4rvpkVteEFxQJhH
         /wRNpz4WkaFYrWRJR6HFQ8bQGZBVGQd5aEoLmDtHoMNTsXs2gMvkWXGAbZsE2cJBITm2
         j6RHLofFR+FDtjwqnoaCWulY7Xy77lGuamact/fSEx2QJSP9bMNlqjueshwDV+INz6Yi
         lIkVTpyxm3Z9UHWKI+aTFIju5GML4YjkEM0Hh8+2IKvPGMntHotuC2WLU/KAwjLYH4r9
         YMJg==
X-Gm-Message-State: AOJu0Yz0QM/d6Oj65gBbUjHKPbYAxzyGyg3U1CwdaCebPI+AebHU3dVV
	4dYf+uFcvGFkZ4lZoDhcesbq78gvs78FsW916OaXE9YUo6Pm0OOj7BPv3f7ukcc=
X-Google-Smtp-Source: AGHT+IGtte48VDWtp7voeGx5u8hIT4MMgsMcZHq0QKlHfI2T2hgNVfvxq/b4zP5WAhQtiBQNdQKPiA==
X-Received: by 2002:a17:902:db06:b0:206:fd9b:f4f1 with SMTP id d9443c01a7336-2076e4a6ee1mr266495285ad.56.1726546161434;
        Mon, 16 Sep 2024 21:09:21 -0700 (PDT)
Received: from [127.0.0.1] ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d169csm42928855ad.138.2024.09.16.21.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 21:09:20 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
Date: Tue, 17 Sep 2024 12:09:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB-large
Subject: [RFC] riscv/entry: issue about a0/orig_a0 register and ENOSYS
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_210923_631201_CBF3E741 
X-CRM114-Status: GOOD (  14.02  )
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

Before PTRACE_GET_SYSCALL_INFO was implemented in v5.3, the only way to
get syscall arguments was to get user_regs_struct via PTRACE_GETREGSET.
On some architectures where a register is used as both the first
argument and the return value and thus will be changed at some stage of
the syscall process, something like orig_a0 is provided to save the
original argument register value. But RISC-V doesn't export orig_a0 in
user_regs_struct (This ABI was designed at e2c0cdfba7f6 ("RISC-V:
User-facing API").) so userspace application like strace will get the
right or wrong result depends on the operation order in do_trap_ecall_u()
function.

This requires we put the ENOSYS process after syscall_enter_from_user_mode()
or syscall_handler()[1]. Unfortunately, the generic entry API
syscall_enter_from_user_mode() requires we

*  process ENOSYS before syscall_enter_from_user_mode()
*  or only set a0 to ENOSYS when the return value of
   syscall_enter_from_user_mode() != -1

Again, if we choose the latter way to avoid conflict with the first
issue, we will meet the third problem: strace depends on that kernel
will return ENOSYS when syscall nr is -1 to implement their syscall
tampering feature[2].

Actually, we tried the both ways in 52449c17bdd1 ("riscv: entry: set
a0 = -ENOSYS only when syscall != -1") and 61119394631f ("riscv: entry:
always initialize regs->a0 to -ENOSYS") before.

Naturally, there is a solution:

1. Just add orig_a0 in user_regs_struct and let strace use it as
   loongarch does. So only two problems, which can be resolved without
   conflict, are left here.

The conflicts are the direct result of the limitation of generic entry
API, so we have another two solutions:

2. Give up the generic entry API, and switch back to the
   architecture-specific standardalone implementation.
3. Redesign the generic entry API: the problem was caused by
   syscall_enter_from_user_mode() using the value -1 (which is unused
   normally) of syscall nr to inform syscall was reject by seccomp/bpf.

In theory, the Solution 1 is best:

*  a0 was used for two purposes in ABI, so using two variables to store
   it is natural.
*  Userspace can implement features without depending on the internal
   behavior of the kernel.

Unfortunately, it's difficult to implement based on the current code.
The RISC-V defined struct pt_regs as below:

        struct pt_regs {
                unsigned long epc;
        ...
                unsigned long t6;
                /* Supervisor/Machine CSRs */
                unsigned long status;
                unsigned long badaddr;
                unsigned long cause;
                /* a0 value before the syscall */
                unsigned long orig_a0;
        };

And user_regs_struct needs to be a prefix of struct pt_regs, so if we
want to include orig_a0 in user_regs_struct, we will need to include
Supervisor/Machine CSRs as well. It's not a big problem. Since
struct pt_regs is the internal ABI of the kernel, we can reorder it.
Unfortunately, struct user_regs_struct is defined as below:

        struct user_regs_struct {
                unsigned long pc;
        ...
                unsigned long t6;
        };

It doesn't contain something like reserved[] as padding to leave the
space to add more registers from struct pt_regs!
The loongarch do the right thing as below:

        struct user_pt_regs {
                /* Main processor registers. */
                unsigned long regs[32];
        ...
                unsigned long reserved[10];
        } __attribute__((aligned(8)));

RISC-V can't include orig_a0 in user_regs_struct without breaking UABI.

Need a discussion to decide to use which solution, or is there any
other better solution?

[1]: https://github.com/strace/strace/issues/315
[2]: https://lore.kernel.org/linux-riscv/20240627071422.GA2626@altlinux.org/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
