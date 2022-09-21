Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDDCC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 17:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SslNfpES97Tp4YGx+6cCsHfKKSDg50Od4DnRqOKwUSQ=; b=VRMBrPMhDe9rF6
	pBxmHjuQFoc9I1zDGqLachy6Ez7lmHUbjOnrYbfDqScDTIBTxJPXUCeAsbbXuKhkD1S78N/vmhCbc
	hzc1GZwdE1KN7VI4CXclMrZYCD1LC8Ej4AoK88o8tiwkUD2QV8mEYvuXYobxU6xQIsyhs79rVUJLr
	O/AtVSe7sBpHc94Djbf/2GvDPU1XaRaGFy1R8rn2qH2+3icC4xG66vIonSi6yztn/El9H+tbYGNGw
	2PNQ3P0it7/c2h5+lOSKJTMK77VZ7bNkypR7chb1675du+oVHfdspb1YHaRcAJO+GSNngCWTSZlcz
	wcyhBnzoHW8FEvdRaqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3wo-00CFYI-LR; Wed, 21 Sep 2022 17:55:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob3wl-00CFXI-Uk
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 17:55:45 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ob3wk-00006P-6w; Wed, 21 Sep 2022 19:55:42 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Stillson <stillson@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, atishp@rivosinc.com, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 00/17] Prctl to enable vector commands, previous vector patches rebased
Date: Wed, 21 Sep 2022 19:55:41 +0200
Message-ID: <8995651.CDJkKcVGEf@diego>
In-Reply-To: <YytGbx1RW2mZAzQ9@spud>
References: <CAM2SziVKzk1zpEZJ4h1+pG90=V7d-bYLySxh2-ZCAHOzNy54yQ@mail.gmail.com> <YytGbx1RW2mZAzQ9@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_105544_020870_E5772759 
X-CRM114-Status: GOOD (  36.76  )
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

Am Mittwoch, 21. September 2022, 19:14:23 CEST schrieb Conor Dooley:
> On Wed, Sep 21, 2022 at 09:44:43AM -0700, Chris Stillson wrote:
> > This patch adds a prctl to enable, disable, or query whether vectors
> > are enabled or not.
> > This is to allow a process to "opt out" of the overhead incurred by
> > using vectors. Because this
> > is build on top of an existing set of patches to work with vectors,
> > they have been rebased to
> > Linux 6.0-rc1.
> 
> Hey Chris,
> Any other review aside - it looks like this patchset has been oddly
> sent. Did you by any chance copy paste the patches into gmail?
> 
> May you should speak with Atish or Palmer about how to set up your
> environment to use git send-email. "Our" tools expect that a series of
> patches is threaded so that tools like `b4` can pull the lot down
> from lore.kernel.org etc. git send-email will do that for you for free.


And it's not even limited to automated tools, also there's ease-of-use in
mail clients, as they often can do threaded views, so even with later
replies the whole thing stays together.


Heiko



> Secondly, it looks like in many of the patches you are not the author,
> so you there's a "From: blah blan <blah@blah.com>" missing from them
> which happens when you copy a patch but again send-email will sort out
> for you.
> 
> The signed-off-by chains on a lot of mails look wrong too, mostly they
> are missing your SoB since you are the sender.
> 
> Finally, please run get_maintainer.pl - there are KVM patches in here
> and you have not CCed the KVM maintainers (nor have you CCed the people
> who wrote the patches in the first place).
> 
> Reading the "submitting patches" document might be helpful to you:
> https://docs.kernel.org/process/submitting-patches.html
> 
> Thanks,
> Conor.
> 
> > 
> > 
> > Chris Stillson (1):
> >   riscv: prctl to enable vector commands
> > 
> > Greentime Hu (9):
> >   riscv: Add new csr defines related to vector extension
> >   riscv: Add has_vector/riscv_vsize to save vector features.
> >   riscv: Add vector struct and assembler definitions
> >   riscv: Add task switch support for vector
> >   riscv: Add ptrace vector support
> >   riscv: Add sigcontext save/restore for vector
> >   riscv: Add support for kernel mode vector
> >   riscv: Add vector extension XOR implementation
> >   riscv: Fix a kernel panic issue if $s2 is set to a specific value
> >     before entering Linux
> > 
> > Guo Ren (4):
> >   riscv: Rename __switch_to_aux -> fpu
> >   riscv: Extending cpufeature.c to detect V-extension
> >   riscv: Add vector feature to compile
> >   riscv: Reset vector register
> > 
> > Vincent Chen (3):
> >   riscv: signal: Report signal frame size to userspace via auxv
> >   riscv: Add V extension to KVM ISA allow list
> >   riscv: KVM: Add vector lazy save/restore support
> > 
> >  arch/riscv/Kconfig                       |  15 +-
> >  arch/riscv/Makefile                      |   1 +
> >  arch/riscv/configs/defconfig             |   6 +
> >  arch/riscv/include/asm/csr.h             |  16 ++-
> >  arch/riscv/include/asm/elf.h             |  47 +++---
> >  arch/riscv/include/asm/hwcap.h           |   1 +
> >  arch/riscv/include/asm/kvm_host.h        |   2 +
> >  arch/riscv/include/asm/kvm_vcpu_vector.h |  65 +++++++++
> >  arch/riscv/include/asm/processor.h       |   9 ++
> >  arch/riscv/include/asm/switch_to.h       |  83 ++++++++++-
> >  arch/riscv/include/asm/vector.h          |  17 +++
> >  arch/riscv/include/asm/xor.h             |  82 +++++++++++
> >  arch/riscv/include/uapi/asm/auxvec.h     |   1 +
> >  arch/riscv/include/uapi/asm/hwcap.h      |   1 +
> >  arch/riscv/include/uapi/asm/kvm.h        |   7 +
> >  arch/riscv/include/uapi/asm/ptrace.h     |  23 +++
> >  arch/riscv/include/uapi/asm/sigcontext.h |  24 ++++
> >  arch/riscv/kernel/Makefile               |   2 +
> >  arch/riscv/kernel/asm-offsets.c          |  15 ++
> >  arch/riscv/kernel/cpufeature.c           |  21 +++
> >  arch/riscv/kernel/entry.S                |   6 +-
> >  arch/riscv/kernel/head.S                 |  37 ++++-
> >  arch/riscv/kernel/kernel_mode_vector.c   | 132 +++++++++++++++++
> >  arch/riscv/kernel/process.c              |  61 ++++++++
> >  arch/riscv/kernel/ptrace.c               |  71 ++++++++++
> >  arch/riscv/kernel/riscv_ksyms.c          |   6 +
> >  arch/riscv/kernel/signal.c               | 173 ++++++++++++++++++++++-
> >  arch/riscv/kernel/vector.S               | 102 +++++++++++++
> >  arch/riscv/kvm/Makefile                  |   1 +
> >  arch/riscv/kvm/vcpu.c                    |  32 +++++
> >  arch/riscv/kvm/vcpu_switch.S             |  69 +++++++++
> >  arch/riscv/kvm/vcpu_vector.c             | 173 +++++++++++++++++++++++
> >  arch/riscv/lib/Makefile                  |   1 +
> >  arch/riscv/lib/xor.S                     |  81 +++++++++++
> >  include/uapi/linux/elf.h                 |   1 +
> >  include/uapi/linux/prctl.h               |   6 +
> >  kernel/sys.c                             |   7 +
> >  37 files changed, 1355 insertions(+), 42 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
> >  create mode 100644 arch/riscv/include/asm/vector.h
> >  create mode 100644 arch/riscv/include/asm/xor.h
> >  create mode 100644 arch/riscv/kernel/kernel_mode_vector.c
> >  create mode 100644 arch/riscv/kernel/vector.S
> >  create mode 100644 arch/riscv/kvm/vcpu_vector.c
> >  create mode 100644 arch/riscv/lib/xor.S
> > 
> > --
> > 2.25.1
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
