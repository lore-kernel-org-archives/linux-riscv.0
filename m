Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5B0C3ABC9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 02:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+0wFZYhcS0qyShEMsex/RiQh9eNu0xhs9k7lCBjemGI=; b=pTK3jIsP1cSyjv
	WqhxOuA3GwMqFW2wLayXZGmYVWZwVG1/91x3tzWJ6qAZCDw5mzmfFmjhDRuwH6AXjAaI1waDWj5Gb
	+mXvon+0K2LE/oDbrszz4RXhY2qIJwNprUtkXwNruvHdzaZ676wAs+hpGwE8K35L/N2TtHbxF4yzh
	nO6FQYhPsAltZzr4lsS6H5AyJC6CvyRQ7l4i13Ojc94KT+Q9dVIPtZBdaW6yS4MxJiu76Jsu6YMyc
	wDxqjjEUWURzv0qY7UMPr0r0pG+lldmEjd41dQgvVZGMJQin/wcXcgcqPS6rKx3Kp4M44cK+UUnqE
	mch5xHXN1vtC2BzFrdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGqEa-00000007pxa-48Tl;
	Mon, 19 May 2025 02:28:09 +0000
Received: from gw51.a4lg.com ([133.242.172.180] helo=mail-sender.int.a4lg.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGqEY-00000007px8-0JGJ
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 02:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1747621677;
	bh=FC5rj09geFTwTYG6Ppw71Y22XWQDzhsofDG7sV16s7c=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=s6HXwRP3aBkpsoN044JwQd3Jj/KRt3yR5t4xEK0B6/klDmf7XekQ0Qmx0MCLsXLTa
	 7IN/yg9JyYNXj88mmcP/KMMFj1+5n7++u+AoJGJPFFwxOHLlHWFODppp4xVPKgX3GY
	 ydxlx5ZN6BYrpeE9AFWUFjUegRSU9yTY5CuNtOTc=
Message-ID: <760d637b-b13b-4518-b6bf-883d55d44e7f@irq.a4lg.com>
Date: Mon, 19 May 2025 11:27:56 +0900
Mime-Version: 1.0
From: Tsukasa OI <research_trasio@irq.a4lg.com>
Content-Language: en-US
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [BUG] One-time initialization of riscv_hwprobe vDSO data results in
 inconsistent results
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_192806_608052_A54F28EC 
X-CRM114-Status: GOOD (  17.65  )
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

Hello,

While I'm testing a userland Rust patch to query target CPU features
using the riscv_hwprobe system call on Linux, I found a strange mismatch
between a test program written in C.

cf. <https://github.com/rust-lang/stdarch/pull/1770>

On my QEMU-based simulator setup, the Rust version returned the value
RISCV_HWPROBE_MISALIGNED_VECTOR_FAST for the key
RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF but the test program (in C)
returned RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN.

Strangely, the value obtained by the Rust version is correct.

Later I found that the difference between C and Rust programs (both
using riscv_hwprobe) is whether to use vDSO or not.

To avoid compatibility issues, the Rust userland version calls the
syscall function through the libc crate, which (accidentally) avoids
using vDSO.  On the other hand, the test program written in C uses
__riscv_hwprobe glibc function, which utilizes vDSO.  Calling syscall
from the test program in C changed the results so that all values are
consistent with the Rust-based program.

After applying the small instrumentation patch below
(this is applicable to kernel v6.15-rc7),

> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 249aec8594a9..f59b82e35b7e 100644--- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -495,6 +495,7 @@ static int __init init_hwprobe_vdso_data(void)
>  	 * vDSO should defer to the kernel for exotic cpu masks.
>  	 */
>  	avd->homogeneous_cpus = id_bitsmash != 0 && id_bitsmash != -1;
> +	pr_info("init_hwprobe_vdso_data completed.\n");
>  	return 0;
>  }

I found that vDSO data page for riscv_hwprobe system call is initialized
only once (by the init_hwprobe_vdso_data function) and never updated
(causing mismatches if the reference data is updated after the vDSO data
page is initialized).

Here is the excerpt from the kernel log on the test environment
(QEMU-based) with instrumentation:

> [    0.375055] cpu0: Ratio of byte access time to unaligned word access is 5.46, unaligned accesses are fast
> [    0.499882] init_hwprobe_vdso_data completed.
> [    0.644822] cpu0: Ratio of vector byte access time to vector unaligned word access is 3.09, unaligned accesses are fast

Right after the first line is printed, *_FAST is set for
RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (that's why it did not cause a
mismatch on this key).

However, when RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF's value is set to
*_FAST (right after the third line is printed), the vDSO data page is
already initialized (as in the second line), leaving the old state
(RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) in the vDSO data page.

Not only it causes mismatches to benchmark-based data depending on the
timing, it can be a blocker of CPU hotplug support for the RISC-V
architecture as CPU hotplug can possibly change riscv_hwprobe results.

I'm not sure how to resolve this issue correctly (due to atomicity
requirements to update the vDSO data page) but at least I want this
issue to be acknowledged.

Best regards,
Tsukasa

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
