Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C3E4D1AD4F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gqHBUN2QUppr/mMTxg2zl2PminTMS1VWnQlS07Zx1Q8=; b=3g0XvblZ5MiyOF
	oOQZR5MUAmB1vrhut8fHKwUnF5Fs7EMXKIJlijCnSTqp4I6RLGY3qQKl+zN7ncGtVJE/Aw6TIEl6l
	kgFMh+4PU4A06xZUeSw85V9x9ZuLwhq3aBVfmUfdFQIsZOdiOIsi27OVGhUU3AHcCz0d7VzvTNvpf
	OtzxodgHWbK2CxNNFeRHX33C48LEP/7G04RiM401xAqXGdkF7tAIbsfbj7AfsiBuy1Z1nHPxtCcW5
	ZrBL6YybExRpOVzp5uMSHZGq046VIJ6vvosCL0s5TosYH2VdEy8bQ+4/xbaLW6WYxb2zuQVBLGELg
	xqXLI4yTu8I6eo9uP59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t12hP-0000000BflV-01oI;
	Wed, 16 Oct 2024 12:00:19 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t12hJ-0000000Bfkh-1rRK
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 12:00:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6DFB1C0003;
	Wed, 16 Oct 2024 12:00:05 +0000 (UTC)
Message-ID: <6b2ff48a-ab43-4866-af5a-b8b7d3c23582@ghiti.fr>
Date: Wed, 16 Oct 2024 14:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] riscv/entry: issue about a0/orig_a0 register and ENOSYS
Content-Language: en-US
To: Celeste Liu <coelacanthushex@gmail.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Oleg Nesterov <oleg@redhat.com>, "Dmitry V. Levin" <ldv@strace.io>
Cc: Andrea Bolognani <abologna@redhat.com>, WANG Xuerui <git@xen0n.name>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
 Yao Zi <ziyao@disroot.org>, Yangyu Chen <cyy@cyyself.name>,
 Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 rsworktech@outlook.com
References: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <59505464-c84a-403d-972f-d4b2055eeaac@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_050013_816134_1FB09196 
X-CRM114-Status: GOOD (  32.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Celeste,

Thank you for looking into this and really sorry about the late response.

On 17/09/2024 06:09, Celeste Liu wrote:
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


Where does this requirement come from?


> *  or only set a0 to ENOSYS when the return value of
>     syscall_enter_from_user_mode() != -1
>
> Again, if we choose the latter way to avoid conflict with the first
> issue, we will meet the third problem: strace depends on that kernel
> will return ENOSYS when syscall nr is -1 to implement their syscall
> tampering feature[2].


IIUC, seccomp and others in syscall_enter_from_user_mode() could return 
-1 and then we could not differentiate with the syscall number being -1.

But could we imagine, to distinguish between an error and the syscall 
number being -1, checking again the syscall number after we call 
syscall_enter_from_user_mode()? If the syscall number is -1, then we set 
ENOSYS otherwise we don't do anything (a bit like what you did in 
52449c17bdd1 ("riscv: entry: set a0 = -ENOSYS only when syscall != -1")).

Let me know if I completely misunderstood here!

Thanks again for the thorough explanation,

Alex


>
> Actually, we tried the both ways in 52449c17bdd1 ("riscv: entry: set
> a0 = -ENOSYS only when syscall != -1") and 61119394631f ("riscv: entry:
> always initialize regs->a0 to -ENOSYS") before.
>
> Naturally, there is a solution:
>
> 1. Just add orig_a0 in user_regs_struct and let strace use it as
>     loongarch does. So only two problems, which can be resolved without
>     conflict, are left here.
>
> The conflicts are the direct result of the limitation of generic entry
> API, so we have another two solutions:
>
> 2. Give up the generic entry API, and switch back to the
>     architecture-specific standardalone implementation.
> 3. Redesign the generic entry API: the problem was caused by
>     syscall_enter_from_user_mode() using the value -1 (which is unused
>     normally) of syscall nr to inform syscall was reject by seccomp/bpf.
>
> In theory, the Solution 1 is best:
>
> *  a0 was used for two purposes in ABI, so using two variables to store
>     it is natural.
> *  Userspace can implement features without depending on the internal
>     behavior of the kernel.
>
> Unfortunately, it's difficult to implement based on the current code.
> The RISC-V defined struct pt_regs as below:
>
>          struct pt_regs {
>                  unsigned long epc;
>          ...
>                  unsigned long t6;
>                  /* Supervisor/Machine CSRs */
>                  unsigned long status;
>                  unsigned long badaddr;
>                  unsigned long cause;
>                  /* a0 value before the syscall */
>                  unsigned long orig_a0;
>          };
>
> And user_regs_struct needs to be a prefix of struct pt_regs, so if we
> want to include orig_a0 in user_regs_struct, we will need to include
> Supervisor/Machine CSRs as well. It's not a big problem. Since
> struct pt_regs is the internal ABI of the kernel, we can reorder it.
> Unfortunately, struct user_regs_struct is defined as below:
>
>          struct user_regs_struct {
>                  unsigned long pc;
>          ...
>                  unsigned long t6;
>          };
>
> It doesn't contain something like reserved[] as padding to leave the
> space to add more registers from struct pt_regs!
> The loongarch do the right thing as below:
>
>          struct user_pt_regs {
>                  /* Main processor registers. */
>                  unsigned long regs[32];
>          ...
>                  unsigned long reserved[10];
>          } __attribute__((aligned(8)));
>
> RISC-V can't include orig_a0 in user_regs_struct without breaking UABI.
>
> Need a discussion to decide to use which solution, or is there any
> other better solution?
>
> [1]: https://github.com/strace/strace/issues/315
> [2]: https://lore.kernel.org/linux-riscv/20240627071422.GA2626@altlinux.org/
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
