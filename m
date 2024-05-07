Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82060C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfojjtRFi06PKrnaR+HjgdH4FbMm3T3h8HtxMtu9ciM=; b=KK/WNgIkv8VuJK
	X6llYhsOLjT2suG7UlJzz57gOAJNJCg1QSimC9gASKGkomjbj2+nEaEZxoM9e6PcZkfDrj+bfrQxt
	9KlVp+zEx/ZXW4W0THVPUlDsVoZ62uZwZ2h3NJ9ZDmaI8Iw1zeSkglsZjIRhx0Kp8oczzABrligro
	7/9oBmgN3sF2u0dBmZCFiTYrJJUzXJq+SSkKOeeju632pRaGNyxYKWohkaV5AzplZ5bCzZHrpKKcK
	sQlTZbykYootHyHdCgb8n8q+xw84F/qe2sowZVai5dvwzvL+idQ7EB8OXvmIbg37byM6JRr9aBiJ9
	NVtz1X1hTt+FLDKE36tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FCP-00000009yCR-1Eg6;
	Tue, 07 May 2024 07:25:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FCM-00000009yBf-1AKm
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 07:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 710B7CE113D;
	Tue,  7 May 2024 07:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28A5C2BBFC;
	Tue,  7 May 2024 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715066711;
	bh=Gs3j7oXYZ/cnYw3Tvuveo6X7cpNx8lLk7xv/YA5SssY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=FY5iYGishy4InMmdRopsf1fysYX4wjmy+Af5T4ogIpLQyIQhMSTNdQF1ns6VjyAwO
	 5uF6LQMYTKXg1CipA+pKvbo7oCz0jKGsff1lialhFUkztmWTNNEFDv9agnmXEDOLWZ
	 YelITmVmKQdp94GinpG7y1q92sxn2h93lJ4i+xSvEBQ2Nh3ZcqIqir2GS9Yg8DQEHj
	 8KbzWOOlyYaZ7+tG4TKiRoIa6dy/1Z/2Kl5KlNsk1VDhyBqK47ZOCyMiCZaOkNNQxX
	 K3qypsB4GiaM/G/vUagj3i5zjMkUyEApm4xkQL3YDZOZKwrWU0ajgbiS2YPmch9w1p
	 WaLXxbT6PRu1w==
Date: Tue, 07 May 2024 08:25:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>, Song Liu <song@kernel.org>,
 Xi Wang <xi.wang@gmail.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: Support compiling the kernel with extensions
User-Agent: K-9 Mail for Android
In-Reply-To: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
References: <20240506-compile_kernel_with_extensions-v1-0-5c25c134c097@rivosinc.com>
Message-ID: <12808AB2-0308-4013-9624-E3DEFCC584EA@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_002514_837769_9A7EE3D6 
X-CRM114-Status: GOOD (  11.00  )
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

Hey Charlie,

On 7 May 2024 02:40:41 IST, Charlie Jenkins <charlie@rivosinc.com> wrote:
>The kernel currently has the restriction that it can only be compiled
>with the extensions that are hardcoded in arch/risc/Makefile.
>
>Any extension that is not listed in the Makefile can still be used by
>explicitly writing the assembly and using alternative patching.
>
>This series introduces Kconfig options that allow the kernel to be
>compiled with additional extensions.

One thing I don't see in the commit messages or the cover letter is what your actual motivation is
for making these changes.
Are you effectively looking to evaluate the alternatives at build time, or are you looking to
let the compiler use the extension where it sees
fit? Or perhaps both?

Thanks,
Conor.

>
>Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>---
>Charlie Jenkins (8):
>      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_C Kconfig option
>      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_V Kconfig option
>      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_SVNAPOT Kconfig option
>      riscv: Add PLATFORM_MAY_SUPPORT_RISCV_ISA_SVPBMT Kconfig option
>      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBB Kconfig option
>      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBA Kconfig option
>      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBC Kconfig option
>      riscv: Add PLATFORM_SUPPORTS_RISCV_ISA_ZBS Kconfig option
>
> arch/riscv/Kconfig                    | 135 +-----------
> arch/riscv/Kconfig.isa                | 393 ++++++++++++++++++++++++++++++++++
> arch/riscv/Makefile                   |  15 +-
> arch/riscv/crypto/Kconfig             |  14 +-
> arch/riscv/include/asm/arch_hweight.h |  33 +--
> arch/riscv/include/asm/checksum.h     |  18 +-
> arch/riscv/include/asm/pgtable.h      |   3 +-
> arch/riscv/include/asm/simd.h         |   3 +
> arch/riscv/include/asm/vector.h       |   3 +-
> arch/riscv/kernel/cpufeature.c        |   3 +-
> arch/riscv/kernel/head.S              |   8 +-
> arch/riscv/kernel/probes/uprobes.c    |   2 +-
> arch/riscv/kernel/process.c           |  14 +-
> arch/riscv/kernel/ptrace.c            |   6 +
> arch/riscv/lib/csum.c                 |  48 ++---
> arch/riscv/lib/riscv_v_helpers.c      |   1 -
> arch/riscv/lib/strcmp.S               |   4 +-
> arch/riscv/lib/strlen.S               |   4 +-
> arch/riscv/lib/strncmp.S              |   4 +-
> arch/riscv/lib/uaccess_vector.S       |   2 +
> arch/riscv/lib/xor.S                  |   2 +
> arch/riscv/net/bpf_jit.h              |   8 +-
> 22 files changed, 511 insertions(+), 212 deletions(-)
>---
>base-commit: 2f47357557b7aa98d9d9002688aae480864ca3f6
>change-id: 20240429-compile_kernel_with_extensions-92dd2403d325

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
