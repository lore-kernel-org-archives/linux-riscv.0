Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1499AC369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnBM2zKKo4T/3C2CjI+oP38ggoU2oP0POu2TPSd4epA=; b=Zimms60yOsV+L7
	vXzDodWQL9cfvmK9Lzd63mcPOmEaUUBWpfqVtj/qeEN5OlG8V8FrbaBO84EB4FXpojidy1Bsh9ffE
	ac5xC3V/NLxZV4jkG6zSdEbigxtZlk6dhrICRG/8KAEIUCjR33uzUyMvd6PKqEreTogFZVyuCDnx/
	KXZhAsyOTbGI/pVP/7+9bYNgQwjUbX6Gda1sOFlXmKeYHFFpF7bPthK0RggpVDwR/znPhxBQ6gQ5V
	b0bpJlZflnV/+FsL7fn8RUVb3ojLPepeajmy8aESEhfq1yKXmFiTGg52hnt/dxgEIVVn1+XsT6jnA
	hL3P0uTGhfCU3bxwCCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZFa-00000004bfN-00Y7;
	Tue, 15 Apr 2025 05:54:26 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZFK-00000004bbn-224W
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 05:54:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B43B43A3B;
	Tue, 15 Apr 2025 05:54:05 +0000 (UTC)
Message-ID: <4a0dc950-cda6-4bb4-a4e9-460bc56b5bb1@ghiti.fr>
Date: Tue, 15 Apr 2025 07:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Avoid fortify warning in syscall_get_arguments()
To: Nathan Chancellor <nathan@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Kees Cook <kees@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250409-riscv-avoid-fortify-warning-syscall_get_arguments-v1-1-7853436d4755@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvddvieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdutdevgeelgeegfeeltdduhfduledvteduhfegffffiefggfektefhjedujeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemsgefgegtmeefjedvugemrggsrggtmegstgdtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemsgefgegtmeefjedvugemrggsrggtmegstgdtkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemsgefgegtmeefjedvugemrggsrggtmegstgdtkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrl
 hhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlughvsehsthhrrggtvgdrihhopdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_225410_657860_E58B72D2 
X-CRM114-Status: GOOD (  27.19  )
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

Hi Nathan,

On 09/04/2025 23:24, Nathan Chancellor wrote:
> When building with CONFIG_FORTIFY_SOURCE=y and W=1, there is a warning
> because of the memcpy() in syscall_get_arguments():
>
>    In file included from include/linux/string.h:392,
>                     from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from arch/riscv/include/asm/processor.h:55,
>                     from include/linux/sched.h:13,
>                     from kernel/ptrace.c:13:
>    In function 'fortify_memcpy_chk',
>        inlined from 'syscall_get_arguments.isra' at arch/riscv/include/asm/syscall.h:66:2:
>    include/linux/fortify-string.h:580:25: error: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
>      580 |                         __read_overflow2_field(q_size_field, size);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
>
> The fortified memcpy() routine enforces that the source is not overread
> and the destination is not overwritten if the size of either field and
> the size of the copy are known at compile time. The memcpy() in
> syscall_get_arguments() intentionally overreads from a1 to a5 in
> 'struct pt_regs' but this is bigger than the size of a1.
>
> Normally, this could be solved by wrapping a1 through a5 with
> struct_group() but there was already a struct_group() applied to these
> members in commit bba547810c66 ("riscv: tracing: Fix
> __write_overflow_field in ftrace_partial_regs()").
>
> Just avoid memcpy() altogether and write the copying of args from regs
> manually, which clears up the warning at the expense of three extra
> lines of code.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I omitted a Fixes tag because I think this has always been an overread
> if I understand correctly but it is only the addition of the checks from
> commit f68f2ff91512 ("fortify: Detect struct member overflows in
> memcpy() at compile-time") that it becomes a noticeable issue.
>
> This came out of a discussion from the addition of
> syscall_set_arguments(), where the same logic causes a more noticeable
> fortify warning because it happens without W=1, as it is an overwrite:
> https://lore.kernel.org/20250408213131.GA2872426@ax162/
> ---
>   arch/riscv/include/asm/syscall.h | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 121fff429dce66b31fe79b691b8edd816c8019e9..eceabf59ae482aa1832b09371ddb3ba8cd65f91d 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -62,8 +62,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
>   					 unsigned long *args)
>   {
>   	args[0] = regs->orig_a0;
> -	args++;
> -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> +	args[1] = regs->a1;
> +	args[2] = regs->a2;
> +	args[3] = regs->a3;
> +	args[4] = regs->a4;
> +	args[5] = regs->a5;
>   }
>   
>   static inline int syscall_get_arch(struct task_struct *task)
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250409-riscv-avoid-fortify-warning-syscall_get_arguments-19c0495d4ed7
>
> Best regards,

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

IIUC, Andrew took this patch, if that changes, please let me know and 
I'll merge it through the riscv tree.

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
