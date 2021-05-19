Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD06C43460
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 10:49:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0E6610A8
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 10:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA0E6610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oMtXK+7ZMDHe1rflCCVYNNtDHKBGkfBRLLHWnYNNAgc=; b=M2+Jke+Jydx87VKAQHcb63+Mb
	0wWR/KH+PyLY+j7PHSQzKk4RHnxz9iH4ie1UGK9DDLpvQYKNZXgId187oGB2FZiZpAwM+mEELnLgE
	Pp9g3gXltKFYSSOBzB1yTxJjAh1xEwaZVV7ObBXBMu+liJXV5rUpSWywnbjLZipmr5WxP4kJIkdij
	1pSBR2QGC+tNjOn6wfcZ5wdJ7nSv2RkX9kSqCmPHviSBCxZRYqUW8lwtGZtjPxBwV9DkB3a7bRPuE
	xRndiFFaBcd2zcD9IluigNHx+vXjXb312mLM1k18qYZddVJ21Pv1CU5vDtI14UDNCSdUF3CkAgKpD
	GbHqQ/wPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljJlb-003ewR-2I; Wed, 19 May 2021 10:49:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJjt-003eK1-UZ; Wed, 19 May 2021 10:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cgWxGkbQLQnVNZgYbp37G/STJ3z6RtVgqdVl7dgWAGA=; b=ydKJ/HvxGf5tscSqt05hIiRznZ
 SGrbqN5zqQwDfjtYIioniWTjwyv8glABisKTib55SX4JW91QfvxBaG+es5s27I3jjS9vPMSph4ykN
 mNNZWJCeUWxK92O/VDWieJQ2aw2+wBmtEns9DxYmUYi7T0DXvdeDLZXNWcWX7y3TMxX+nxh6xYlLA
 xahtcQxaRWfSEdMl7TpVPzYzYfBM+AlrRUqixjI/9RcVWa7OacZ2Zpd3KVzARvtufT3KsZ37/+apU
 JgmujGADCENl0B86rYJkJQ6J4MqM0E/BuH6BA8QAwioj0HltX+rXDRrPEMPzyqBU2JBjLM1qW9Yuz
 9BO7Qg6A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJjq-00FMnA-Qm; Wed, 19 May 2021 10:47:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBFBA611BD;
 Wed, 19 May 2021 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621421261;
 bh=SXc+hAJjey2h+VFj3gyn7xrlOb7KS62mh1je1KAkZYM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oq/FOCI0KLWwj9CX+OKZZ/sWYz+u7RO3yGdlQj3XT1e6GUXE69wUpill4kA645JoL
 e0B8JwnAhu79JyCXMqoYqgEiJtcSELZPTVNpuKiBuUkTMWA/I+O8axtWPCdPtHqPvt
 yLwxuwlJydNNFthpuuSzEe7ShL1K4SVQ4Dl20qQc=
Date: Wed, 19 May 2021 12:47:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Graf <graf@amazon.com>,
 Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-doc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
Message-ID: <YKTsyyVYsHVMQC+G@kroah.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
 <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
 <YKSgcn5gxE/4u2bT@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKSgcn5gxE/4u2bT@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_034742_949207_7718CECE 
X-CRM114-Status: GOOD (  36.45  )
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

On Wed, May 19, 2021 at 07:21:54AM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 19, 2021 at 10:40:13AM +0530, Anup Patel wrote:
> > On Wed, May 19, 2021 at 10:28 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, May 19, 2021 at 09:05:35AM +0530, Anup Patel wrote:
> > > > From: Anup Patel <anup@brainfault.org>
> > > >
> > > > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > > > Linux on RV64/RV32 Guest with multiple VCPUs.
> > > >
> > > > Key aspects of KVM RISC-V added by this series are:
> > > > 1. No RISC-V specific KVM IOCTL
> > > > 2. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > > > 3. Both RV64 and RV32 host supported
> > > > 4. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > > > 5. KVM ONE_REG interface for VCPU register access from user-space
> > > > 6. PLIC emulation is done in user-space
> > > > 7. Timer and IPI emuation is done in-kernel
> > > > 8. Both Sv39x4 and Sv48x4 supported for RV64 host
> > > > 9. MMU notifiers supported
> > > > 10. Generic dirtylog supported
> > > > 11. FP lazy save/restore supported
> > > > 12. SBI v0.1 emulation for KVM Guest available
> > > > 13. Forward unhandled SBI calls to KVM userspace
> > > > 14. Hugepage support for Guest/VM
> > > > 15. IOEVENTFD support for Vhost
> > > >
> > > > Here's a brief TODO list which we will work upon after this series:
> > > > 1. SBI v0.2 emulation in-kernel
> > > > 2. SBI v0.2 hart state management emulation in-kernel
> > > > 3. In-kernel PLIC emulation
> > > > 4. ..... and more .....
> > > >
> > > > This series can be found in riscv_kvm_v18 branch at:
> > > > https//github.com/avpatel/linux.git
> > > >
> > > > Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v7 branch
> > > > at: https//github.com/avpatel/kvmtool.git
> > > >
> > > > The QEMU RISC-V hypervisor emulation is done by Alistair and is available
> > > > in master branch at: https://git.qemu.org/git/qemu.git
> > > >
> > > > To play around with KVM RISC-V, refer KVM RISC-V wiki at:
> > > > https://github.com/kvm-riscv/howto/wiki
> > > > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
> > > > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
> > > >
> > > > Changes since v17:
> > > >  - Rebased on Linux-5.13-rc2
> > > >  - Moved to new KVM MMU notifier APIs
> > > >  - Removed redundant kvm_arch_vcpu_uninit()
> > > >  - Moved KVM RISC-V sources to drivers/staging for compliance with
> > > >    Linux RISC-V patch acceptance policy
> > >
> > > What is this new "patch acceptance policy" and what does it have to do
> > > with drivers/staging?
> > 
> > The Linux RISC-V patch acceptance policy is here:
> > Documentation/riscv/patch-acceptance.rst
> > 
> > As-per this policy, the Linux RISC-V maintainers will only accept
> > patches for frozen/ratified RISC-V extensions. Basically, it links the
> > Linux RISC-V development process with the RISC-V foundation
> > process which is painfully slow.
> > 
> > The KVM RISC-V patches have been sitting on the lists for almost
> > 2 years now. The requirements for freezing RISC-V H-extension
> > (hypervisor extension) keeps changing and we are not clear when
> > it will be frozen. In fact, quite a few people have already implemented
> > RISC-V H-extension in hardware as well and KVM RISC-V works
> > on real HW as well.
> > 
> > Rationale of moving KVM RISC-V to drivers/staging is to continue
> > KVM RISC-V development without breaking the Linux RISC-V patch
> > acceptance policy until RISC-V H-extension is frozen. Once, RISC-V
> > H-extension is frozen we will move KVM RISC-V back to arch/riscv
> > (like other architectures).
> 
> Wait, no, this has nothing to do with what drivers/staging/ is for and
> how it is used.  Again, not ok.
> 
> > > What does drivers/staging/ have to do with this at all?  Did anyone ask
> > > the staging maintainer about this?
> > 
> > Yes, Paolo (KVM maintainer) suggested having KVM RISC-V under
> > drivers/staging until RISC-V H-extension is frozen and continue the
> > KVM RISC-V development from there.
> 
> staging is not for stuff like this at all.  It is for code that is
> self-contained (not this) and needs work to get merged into the main
> part of the kernel (listed in a TODO file, and is not this).
> 
> It is not a dumping ground for stuff that arch maintainers can not seem
> to agree on, and it is not a place where you can just randomly play
> around with user/kernel apis with no consequences.
> 
> So no, sorry, not going to take this code at all.

And to be a bit more clear about this, having other subsystem
maintainers drop their unwanted code on this subsystem, _without_ even
asking me first is just not very nice.  All of a sudden I am now
responsible for this stuff, without me even being asked about it.
Should I start throwing random drivers into the kvm subsystem for them
to maintain because I don't want to?  :)

If there's really no other way to do this, than to put it in staging,
let's talk about it.  But saying "this must go here" is not a
conversation...

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
