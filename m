Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE0DC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 07:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UJ8gF+Z1i7U9DaLhDWHP4J82/lgC1gFnbU1PFmjZws=; b=0BWGyqyk385yWu
	BBT6MF8t0OcSy8CMi0q2Cpv4jmg4USMK7Z8z7SPDCP9O3RupApIYUp3NS3GvaSyvb+hVRA/LRmEji
	0l45Dz7Flne26nvWIycUKK6xpchK53fNFYtHZ+pulZWgmu9dA4e8HVWyfStahEi0VLhjpq+940RCs
	SnfJBfDyueeAeWpbaQz4JxpvVzF4Hho6mOGIWyqUnvcTp5C8krDGp9GZ//JxBsY/EQttkiugVz5sp
	LGuuNa9iy2/rxc9f9zVaX/nhcxpDyAUw37O7eQ0obso+tRbM9/QV/kZ0CFLQPJhtsFLEramPjSy1s
	ROjdlYYfIlHRF1AqGNbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXYA-001pQG-2X;
	Wed, 24 Jan 2024 07:19:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSXY5-001pOC-2U
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 07:19:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 185EDE000C;
	Wed, 24 Jan 2024 07:19:42 +0000 (UTC)
Message-ID: <26808f34-d9c4-404a-bf09-45c4aff139ad@ghiti.fr>
Date: Wed, 24 Jan 2024 08:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] documentation: Document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
References: <20240123-fencei-v9-0-71411bfe8d71@rivosinc.com>
 <20240123-fencei-v9-2-71411bfe8d71@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240123-fencei-v9-2-71411bfe8d71@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_231950_067886_EA5FEEEE 
X-CRM114-Status: GOOD (  30.50  )
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

On 24/01/2024 00:29, Charlie Jenkins wrote:
> Provide documentation that explains how to properly do CMODX in riscv.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>   Documentation/arch/riscv/cmodx.rst | 96 ++++++++++++++++++++++++++++++++++++++
>   Documentation/arch/riscv/index.rst |  1 +
>   2 files changed, 97 insertions(+)
>
> diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
> new file mode 100644
> index 000000000000..2ad46129d812
> --- /dev/null
> +++ b/Documentation/arch/riscv/cmodx.rst
> @@ -0,0 +1,96 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==============================================================================
> +Concurrent Modification and Execution of Instructions (CMODX) for RISC-V Linux
> +==============================================================================
> +
> +CMODX is a programming technique where a program executes instructions that were
> +modified by the program itself. Instruction storage and the instruction cache
> +(icache) are not guaranteed to be synchronized on RISC-V hardware. Therefore, the
> +program must enforce its own synchronization with the unprivileged fence.i
> +instruction.
> +
> +However, the default Linux ABI prohibits the use of fence.i in userspace
> +applications. At any point the scheduler may migrate a task onto a new hart. If
> +migration occurs after the userspace synchronized the icache and instruction
> +storage with fence.i, the icache will no longer be clean. This is due to the


Nit: I think you mean "the icache on the new hart will no longer be clean".


> +behavior of fence.i only affecting the hart that it is called on. Thus, the hart
> +that the task has been migrated to may not have synchronized instruction storage
> +and icache.
> +
> +There are two ways to solve this problem: use the riscv_flush_icache() syscall,
> +or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence.i in
> +userspace. The syscall performs a one-off icache flushing operation. The prctl
> +changes the Linux ABI to allow userspace to emit icache flushing operations.
> +
> +As an aside, "deferred" icache flushes can sometimes be triggered in the kernel.
> +At the time of writing, this only occurs during the riscv_flush_icache() syscall
> +and when the kernel uses copy_to_user_page(). These deferred flushes happen only
> +when the memory map being used by a hart changes. If the prctl() context caused
> +an icache flush, this deferred icache flush will be skipped as it is redundant.
> +Therefore, there will be no additional flush when using the riscv_flush_icache()
> +syscall inside of the prctl() context.
> +
> +prctl() Interface
> +---------------------
> +
> +Call prctl() with ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` as the first argument. The
> +remaining arguments will be delegated to the riscv_set_icache_flush_ctx
> +function detailed below.
> +
> +.. kernel-doc:: arch/riscv/mm/cacheflush.c
> +	:identifiers: riscv_set_icache_flush_ctx
> +
> +Example usage:
> +
> +The following files are meant to be compiled and linked with each other. The
> +modify_instruction() function replaces an add with 0 with an add with one,
> +causing the instruction sequence in get_value() to change from returning a zero
> +to returning a one.
> +
> +cmodx.c::
> +
> +	#include <stdio.h>
> +	#include <sys/prctl.h>
> +
> +	extern int get_value();
> +	extern void modify_instruction();
> +
> +	int main()
> +	{
> +		int value = get_value();
> +		printf("Value before cmodx: %d\n", value);
> +
> +		// Call prctl before first fence.i is called inside modify_instruction
> +		prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX_ON, PR_RISCV_CTX_SW_FENCEI, PR_RISCV_SCOPE_PER_PROCESS);
> +		modify_instruction();
> +
> +		value = get_value();
> +		printf("Value after cmodx: %d\n", value);
> +		return 0;
> +	}
> +
> +cmodx.S::
> +
> +	.option norvc
> +
> +	.text
> +	.global modify_instruction
> +	modify_instruction:
> +	lw a0, new_insn
> +	lui a5,%hi(old_insn)
> +	sw  a0,%lo(old_insn)(a5)
> +	fence.i
> +	ret
> +
> +	.section modifiable, "awx"
> +	.global get_value
> +	get_value:
> +	li a0, 0
> +	old_insn:
> +	addi a0, a0, 0
> +	ret
> +
> +	.data
> +	new_insn:
> +	addi a0, a0, 1
> diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
> index 4dab0cb4b900..eecf347ce849 100644
> --- a/Documentation/arch/riscv/index.rst
> +++ b/Documentation/arch/riscv/index.rst
> @@ -13,6 +13,7 @@ RISC-V architecture
>       patch-acceptance
>       uabi
>       vector
> +    cmodx
>   
>       features
>   
>

I don't know how man pages are synchronized with new additions in the 
kernel, do you? It would be nice to have this new prctl documented for 
userspace.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
