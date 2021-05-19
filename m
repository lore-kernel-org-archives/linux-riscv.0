Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844CBC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:10:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0161D6139A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0161D6139A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1iYVn7fwgGKWSGmnwfSg5fjfoUb2MiVK1+aOIOotvIA=; b=W8oPmmi71IFTxvopWhuhn9cjU
	/e0xLJnGPpIfp6WwIY7q9Fk4BsUNIe1beOnip1pkhS0885r/auRYCTBD087DQe49canl3E6Jw2/u2
	Uuakc4UDJZEDsbhuK/YTveRQxadnOc+zTFxV6XTnxn+MZEvLidTxzR94GUU8rdtwG0/zyiEi/rqDf
	uup1BhpgC/gLUqzULgL5u1j3dEOU+GQHiu3G4lGlARDqpbo8YOE88IfLA2j0UTMDg7xmw0FEIVlIB
	nG/qYMOcq+rl0e9WrC9dkwj9PmhsBAskgDBcTNjS93E7j0QOTRnznrHfK0SdHcyOb7z78m2n8fUJP
	ypJuUkxYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljETe-002orF-IX; Wed, 19 May 2021 05:10:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljETW-002opC-PQ
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=euUNmfdra3fw2767TBroA6MJ91YZAjLv3gkDPjRiyS4=; b=ezVaArSFITDYD+lk/5wEuSNEZP
 ebAs67GLoPuYdLqaru4qKolcZDu9M4Adqn6xFT73y4OebQs+WCzRSsfi3VYnVH3xJDCT2FCEL4zoM
 95je2Mpbhio9W8rdVZvoqLVMtnz9paHLEtWTP9I7qDdgBL/MeRp+y5VvPwKc7vkhp1ErRwKxYqZVw
 MKZRg4mmwHwLyyQV4W8p2uJvD4I/GmbfzMF52OTeeFprI4LxxU/+MPL3QTpD0HtVSUO/PbFPktw+B
 cQMEFb+2XXs9bfHEA+bhzuTzwurkOP4eHrtq8m4g3qVvyzh5W+aDLmvWLOea/QANVrY6RhLTdYlOZ
 3BULQqBw==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljETT-00F8jZ-OO
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:10:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id v12so12501123wrq.6
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 22:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=euUNmfdra3fw2767TBroA6MJ91YZAjLv3gkDPjRiyS4=;
 b=Zti7viSDHb0VTJftg3BPlW8ti+9QLDu9Xm7Yuq0CCaDfNVh6YVDf4YCUULjLTTGsGi
 R1DWHJ/IGB4/xZji/+Kmxkn7Ut0h48a9LUaXZmEXtV3uecqh2Ave3mBhZ1iW+y/ghhC3
 RjxfEb9aAI9waxiOiWBz+x9Xwn7Pg4bShrDhbcYUNn8YaTPlRC/G9POIPXYeG5kZzDoi
 e7tyARNKu5qPxBQ8uEIfyMeHaT+AUN/COoiK8qgqUbRyv/mpwUwAzDfeBOd0AxYbDcXo
 H6W9ppBsMXoACuavlTXfTcptSGl+tmDqfqQOLWDjAPSKjqVzn0MvKJPY/dYqbWhh1eqG
 iS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=euUNmfdra3fw2767TBroA6MJ91YZAjLv3gkDPjRiyS4=;
 b=KeXZbag2A7MreO/9Uv8p9cc1uKdZgxf/lV8U9WuLx81lchz2n/vHTRYzCRIBROAgs5
 I9X63XphJ6zi9TCQPEZ6Ivk+uJIafRhzMKhP1DrVLy1pEfldDa6xERdTCuLkM1afHLEc
 31+Epi2N8GwNye7balqfbP0GCJ+o/lkT2QgZ1wxKzDVpCY43qZ+a/ACJI5M/blqDbLip
 N7aiRJZx8ta/ZaHyKaeRzeNM7MIG6VWOm2tWo+jtC0bcftOW1XZ3eJuC7mwjGAPEZouh
 RH5wzAgUuXeOJ0EJq1LHxU/y/WRt/Qs3wOmrhYGThoE2r+QMwX5xCzlB1D+CwcHvTRBA
 9g6w==
X-Gm-Message-State: AOAM530eqyLOc9NvU8MsJ6ihYGwZIAA7SfyfJia0U/O7LYNSsqOhs2HR
 yfKJuqNJ7GX5Gv55uGIizVCDQFBimeFbWZD8dIb7Lg==
X-Google-Smtp-Source: ABdhPJwa9Izmvx4WFIO6ko25EtfKdaY6XBgGq19Jcwm/KSSHQqpdTPyHjpR2GyhcJfmWcB9WwWyGSBKXyEBwweCxC3w=
X-Received: by 2002:adf:ffd2:: with SMTP id x18mr12055209wrs.144.1621401025109; 
 Tue, 18 May 2021 22:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
In-Reply-To: <YKSa48cejI1Lax+/@kroah.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 May 2021 10:40:13 +0530
Message-ID: <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
Subject: Re: [PATCH v18 00/18] KVM RISC-V Support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_221027_836105_BCB0BAEE 
X-CRM114-Status: GOOD (  25.60  )
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

On Wed, May 19, 2021 at 10:28 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 19, 2021 at 09:05:35AM +0530, Anup Patel wrote:
> > From: Anup Patel <anup@brainfault.org>
> >
> > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > Linux on RV64/RV32 Guest with multiple VCPUs.
> >
> > Key aspects of KVM RISC-V added by this series are:
> > 1. No RISC-V specific KVM IOCTL
> > 2. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > 3. Both RV64 and RV32 host supported
> > 4. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > 5. KVM ONE_REG interface for VCPU register access from user-space
> > 6. PLIC emulation is done in user-space
> > 7. Timer and IPI emuation is done in-kernel
> > 8. Both Sv39x4 and Sv48x4 supported for RV64 host
> > 9. MMU notifiers supported
> > 10. Generic dirtylog supported
> > 11. FP lazy save/restore supported
> > 12. SBI v0.1 emulation for KVM Guest available
> > 13. Forward unhandled SBI calls to KVM userspace
> > 14. Hugepage support for Guest/VM
> > 15. IOEVENTFD support for Vhost
> >
> > Here's a brief TODO list which we will work upon after this series:
> > 1. SBI v0.2 emulation in-kernel
> > 2. SBI v0.2 hart state management emulation in-kernel
> > 3. In-kernel PLIC emulation
> > 4. ..... and more .....
> >
> > This series can be found in riscv_kvm_v18 branch at:
> > https//github.com/avpatel/linux.git
> >
> > Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v7 branch
> > at: https//github.com/avpatel/kvmtool.git
> >
> > The QEMU RISC-V hypervisor emulation is done by Alistair and is available
> > in master branch at: https://git.qemu.org/git/qemu.git
> >
> > To play around with KVM RISC-V, refer KVM RISC-V wiki at:
> > https://github.com/kvm-riscv/howto/wiki
> > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
> > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
> >
> > Changes since v17:
> >  - Rebased on Linux-5.13-rc2
> >  - Moved to new KVM MMU notifier APIs
> >  - Removed redundant kvm_arch_vcpu_uninit()
> >  - Moved KVM RISC-V sources to drivers/staging for compliance with
> >    Linux RISC-V patch acceptance policy
>
> What is this new "patch acceptance policy" and what does it have to do
> with drivers/staging?

The Linux RISC-V patch acceptance policy is here:
Documentation/riscv/patch-acceptance.rst

As-per this policy, the Linux RISC-V maintainers will only accept
patches for frozen/ratified RISC-V extensions. Basically, it links the
Linux RISC-V development process with the RISC-V foundation
process which is painfully slow.

The KVM RISC-V patches have been sitting on the lists for almost
2 years now. The requirements for freezing RISC-V H-extension
(hypervisor extension) keeps changing and we are not clear when
it will be frozen. In fact, quite a few people have already implemented
RISC-V H-extension in hardware as well and KVM RISC-V works
on real HW as well.

Rationale of moving KVM RISC-V to drivers/staging is to continue
KVM RISC-V development without breaking the Linux RISC-V patch
acceptance policy until RISC-V H-extension is frozen. Once, RISC-V
H-extension is frozen we will move KVM RISC-V back to arch/riscv
(like other architectures).

>
> What does drivers/staging/ have to do with this at all?  Did anyone ask
> the staging maintainer about this?

Yes, Paolo (KVM maintainer) suggested having KVM RISC-V under
drivers/staging until RISC-V H-extension is frozen and continue the
KVM RISC-V development from there.

>
> Not cool, and not something I'm about to take without some very good
> reasons...

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
