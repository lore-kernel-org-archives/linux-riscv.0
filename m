Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49854C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7Koc7MWu8467xy/EiiMygW9OVOGG1F4iMPUlvsJkK8=; b=nAXiMus2lL8skD
	NvtUoe/abzLtxVOYMX9RjC5mBxdZGpSMDYS5t0if2k9rfKZN9miTGCIsHhK587tCUPjr0xyToiZTI
	F/sQqG9Mr+GjOHKhvIDuLY0+a/BAg08SI69fWlqyb8HR8Md/LcXgZrsPDaUTXxnNqCGzoO5j9yDfB
	IdgGXSWkUM/hGwpmKaF7q5WfskscosgmoNPan4x2R1KnMBakT+9Ri4JiVhAyU2lKK+aQ+QGnTXEdF
	N4I3g8PFovDBGpIr+/q8/9+bZgeqR57naQly1wJ9/djDuzoDIePZ2esL4cVD9mAilzWm6vadrDJv/
	UoBYBm0Sk7NiB8fNg1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3NV-000000017g3-1sqx;
	Thu, 25 Jan 2024 17:19:01 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3NS-000000017dp-160d
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:19:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A3F7FF806;
	Thu, 25 Jan 2024 17:18:55 +0000 (UTC)
Message-ID: <9d6cafcc-2bb8-4c7d-8d53-8c10a29a56c9@ghiti.fr>
Date: Thu, 25 Jan 2024 18:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] documentation: Document
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
References: <20240124-fencei-v10-0-a25971f4301d@rivosinc.com>
 <20240124-fencei-v10-2-a25971f4301d@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240124-fencei-v10-2-a25971f4301d@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_091858_701076_AA52F028 
X-CRM114-Status: GOOD (  28.46  )
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


On 25/01/2024 05:23, Charlie Jenkins wrote:
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
> index 000000000000..24aafa23a72b
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
> +storage with fence.i, the icache on the new hart will no longer be clean. This
> +is due to the behavior of fence.i only affecting the hart that it is called on.
> +Thus, the hart that the task has been migrated to may not have synchronized
> +instruction storage and icache.
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

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
