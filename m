Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AD2ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 17:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ascsEcXcS4qHDliR7eftI8ugDF3vnn45q5Kd2kT2uew=; b=cn+TxiS4vLSDji
	YggjTF5iQGUo26as5uj0BCGC7VEzqaD19E4C5ldQWMtDXzRmD1Mvsm4yWVXJZkUXEmjIdJ+F6zrt/
	TQByYCT1CICQG++exRMUaKRnYVETDZDzxP3qZ1fb4lwEmFvLD770jT4d3VcwIdlxGcKYTPlfnS9cr
	MG2E55YjBQel6jcAavVlxm/2O0S7MLppp9t6qCQMs10RrZYZwd6Vd3tN6e2okbIv9/2S0stW1AzhN
	rI9JzqpYnuilBBzfvWeCGWd8KoBKyy7OuuskQFJcV/41egoeGiEVtNNphbgZ4nXGwJAVTuLd7PVJg
	bHBirVGfHBU0+jJbISfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3It-00C9Re-RN; Wed, 21 Sep 2022 17:14:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3Iq-00C9Qf-DA
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 17:14:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9D56F628D8;
	Wed, 21 Sep 2022 17:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0872BC433D6;
	Wed, 21 Sep 2022 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663780467;
	bh=Y3leVvDpTR9qgkTrECXwvv7jqZqIyvUQSUHk6XmHwrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvjoYQVVjeFdWc+N6mZ06f3HOCsPQ6kcb/a0lYvrbTIbU/WZDEskFcIRoSmLqftpE
	 LPpDkzfI8n92mdVoYXdGGeUEGEkCfbH8z+U6ntY7B35t8Wy/NZvc3j8v3zUmuIbiY0
	 oar7zgkadc97CO/l1Nf5nH7KEBDvVBmmlHY20N32K7RF+99JUc3W/ZPlvomqYU0kog
	 DR6Bp1CD7i2hldBAbpeeEVqSqJuVk0KbfKPTK6b69hle0XoxbArT/aE6gWVx/+0k3q
	 e0ORROSGeRl9P+vg9I1Rtl6IVSwZLWilnyO1z9O/oHmelB0+Jem3MvoP2inTUj/rTc
	 bZC5tYjaBEoXg==
Date: Wed, 21 Sep 2022 18:14:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Chris Stillson <stillson@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	atishp@rivosinc.com
Subject: Re: [PATCH 00/17] Prctl to enable vector commands, previous vector
 patches rebased
Message-ID: <YytGbx1RW2mZAzQ9@spud>
References: <CAM2SziVKzk1zpEZJ4h1+pG90=V7d-bYLySxh2-ZCAHOzNy54yQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAM2SziVKzk1zpEZJ4h1+pG90=V7d-bYLySxh2-ZCAHOzNy54yQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_101428_541526_12CF2B76 
X-CRM114-Status: GOOD (  27.59  )
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

On Wed, Sep 21, 2022 at 09:44:43AM -0700, Chris Stillson wrote:
> This patch adds a prctl to enable, disable, or query whether vectors
> are enabled or not.
> This is to allow a process to "opt out" of the overhead incurred by
> using vectors. Because this
> is build on top of an existing set of patches to work with vectors,
> they have been rebased to
> Linux 6.0-rc1.

Hey Chris,
Any other review aside - it looks like this patchset has been oddly
sent. Did you by any chance copy paste the patches into gmail?

May you should speak with Atish or Palmer about how to set up your
environment to use git send-email. "Our" tools expect that a series of
patches is threaded so that tools like `b4` can pull the lot down
from lore.kernel.org etc. git send-email will do that for you for free.

Secondly, it looks like in many of the patches you are not the author,
so you there's a "From: blah blan <blah@blah.com>" missing from them
which happens when you copy a patch but again send-email will sort out
for you.

The signed-off-by chains on a lot of mails look wrong too, mostly they
are missing your SoB since you are the sender.

Finally, please run get_maintainer.pl - there are KVM patches in here
and you have not CCed the KVM maintainers (nor have you CCed the people
who wrote the patches in the first place).

Reading the "submitting patches" document might be helpful to you:
https://docs.kernel.org/process/submitting-patches.html

Thanks,
Conor.

> 
> 
> Chris Stillson (1):
>   riscv: prctl to enable vector commands
> 
> Greentime Hu (9):
>   riscv: Add new csr defines related to vector extension
>   riscv: Add has_vector/riscv_vsize to save vector features.
>   riscv: Add vector struct and assembler definitions
>   riscv: Add task switch support for vector
>   riscv: Add ptrace vector support
>   riscv: Add sigcontext save/restore for vector
>   riscv: Add support for kernel mode vector
>   riscv: Add vector extension XOR implementation
>   riscv: Fix a kernel panic issue if $s2 is set to a specific value
>     before entering Linux
> 
> Guo Ren (4):
>   riscv: Rename __switch_to_aux -> fpu
>   riscv: Extending cpufeature.c to detect V-extension
>   riscv: Add vector feature to compile
>   riscv: Reset vector register
> 
> Vincent Chen (3):
>   riscv: signal: Report signal frame size to userspace via auxv
>   riscv: Add V extension to KVM ISA allow list
>   riscv: KVM: Add vector lazy save/restore support
> 
>  arch/riscv/Kconfig                       |  15 +-
>  arch/riscv/Makefile                      |   1 +
>  arch/riscv/configs/defconfig             |   6 +
>  arch/riscv/include/asm/csr.h             |  16 ++-
>  arch/riscv/include/asm/elf.h             |  47 +++---
>  arch/riscv/include/asm/hwcap.h           |   1 +
>  arch/riscv/include/asm/kvm_host.h        |   2 +
>  arch/riscv/include/asm/kvm_vcpu_vector.h |  65 +++++++++
>  arch/riscv/include/asm/processor.h       |   9 ++
>  arch/riscv/include/asm/switch_to.h       |  83 ++++++++++-
>  arch/riscv/include/asm/vector.h          |  17 +++
>  arch/riscv/include/asm/xor.h             |  82 +++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h     |   1 +
>  arch/riscv/include/uapi/asm/hwcap.h      |   1 +
>  arch/riscv/include/uapi/asm/kvm.h        |   7 +
>  arch/riscv/include/uapi/asm/ptrace.h     |  23 +++
>  arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
>  arch/riscv/kernel/Makefile               |   2 +
>  arch/riscv/kernel/asm-offsets.c          |  15 ++
>  arch/riscv/kernel/cpufeature.c           |  21 +++
>  arch/riscv/kernel/entry.S                |   6 +-
>  arch/riscv/kernel/head.S                 |  37 ++++-
>  arch/riscv/kernel/kernel_mode_vector.c   | 132 +++++++++++++++++
>  arch/riscv/kernel/process.c              |  61 ++++++++
>  arch/riscv/kernel/ptrace.c               |  71 ++++++++++
>  arch/riscv/kernel/riscv_ksyms.c          |   6 +
>  arch/riscv/kernel/signal.c               | 173 ++++++++++++++++++++++-
>  arch/riscv/kernel/vector.S               | 102 +++++++++++++
>  arch/riscv/kvm/Makefile                  |   1 +
>  arch/riscv/kvm/vcpu.c                    |  32 +++++
>  arch/riscv/kvm/vcpu_switch.S             |  69 +++++++++
>  arch/riscv/kvm/vcpu_vector.c             | 173 +++++++++++++++++++++++
>  arch/riscv/lib/Makefile                  |   1 +
>  arch/riscv/lib/xor.S                     |  81 +++++++++++
>  include/uapi/linux/elf.h                 |   1 +
>  include/uapi/linux/prctl.h               |   6 +
>  kernel/sys.c                             |   7 +
>  37 files changed, 1355 insertions(+), 42 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
>  create mode 100644 arch/riscv/include/asm/vector.h
>  create mode 100644 arch/riscv/include/asm/xor.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
>  create mode 100644 arch/riscv/kernel/vector.S
>  create mode 100644 arch/riscv/kvm/vcpu_vector.c
>  create mode 100644 arch/riscv/lib/xor.S
> 
> --
> 2.25.1
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
