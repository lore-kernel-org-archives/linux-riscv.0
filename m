Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE3DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 11:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtZnja+jV4See3NOPpqRsrJYIRu2po5QHW4YI0+Huoo=; b=lhdE1jTkZejEMy
	7ldAyNDR+D9gWosC9SR1JmRkIsH36zSWXbTf5q+XtNr7EUkJ0rYJMl4Y5E92vxdNBNk0z45VTi1Ez
	+A4cfCM2Ddew18smQvFjlqEnRQoFDZq7xgH8n45pGy6tGZj5QrF1r7ddKJww8nxotm+osCeJHTEaU
	FWCS1UCAQPZ74TJt0cyFAT1WhG2fN1wupYAO24Gpl+8Jlg+Fp/UmPIGOVbQ7EX4umZOlqbR1pwhDu
	Y6JSv6MBspRXbfhY6og6Aq0pEdDtGM4PtDkLwaVX9a/JGBsovlI/useiGk215h+cp7S9Gm0ccGr3p
	d+qbLW9nfNwLRQN3uX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4h9k-00Ea32-7O; Mon, 12 Dec 2022 11:39:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4h6g-00EZUF-6E
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 11:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670844984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h3nGaS/BzxpoZBgzJ/A6+CxjyYDCWWuPh4Q+FvFOKgE=;
	b=dPQscaic1ZyenPsAjzIpk5tc5c2BY2SAqj8eQogHx15iD31pyCKtPKmooBijzShYxI0tMF
	9QUpdpfYULO14RmIdgoVU4Bx4GHXbKSWdjcMGj7kw8Rpp/W2t6O6Rje8M21a2CN02Mq7Ax
	qqhRQ0+TKp2ZQiQOO87Tl+ju2du1a0Q=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-qELcspnANkuQCAh8-AjbzQ-1; Mon, 12 Dec 2022 06:36:23 -0500
X-MC-Unique: qELcspnANkuQCAh8-AjbzQ-1
Received: by mail-ua1-f69.google.com with SMTP id y40-20020a9f326b000000b0041919bac03fso5177220uad.13
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 03:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3nGaS/BzxpoZBgzJ/A6+CxjyYDCWWuPh4Q+FvFOKgE=;
        b=SUNPupd2T16xnv/kvgt33fk6KGOaLcx8C625OVfLnhj+VMzZuqa2Bve8nNBlfHUf7s
         CtbfevaUlWDSnKgS7AwA3oHgrTsvo/aUUtao1HtXPQH6KiRIPVTET1VdtIORUULC4ekh
         3LZY75su+cDHpH9N2vwguXpFP5UsGsW9aJYh9J1AgQTedXzoxW3U0urQn3z6gf2QoLnd
         A9KqGJ1+I6EhidOdSgL0KzfSQqWHNpm3czJGuw2e3ykffG9WL+Yw9j86cp/T9B/45oI+
         a4PTBQ5lS7CE+xoQFxkc7KBXr5Amz2HpgIKMzcpMJtN5fHEr2WAXh1hj4HIO+cqZ/PxU
         gQCg==
X-Gm-Message-State: ANoB5pn53BfTqqDhhtgpodtsv4Q0rYvkYs7MFpNeOckV0mTO3y7jmuzm
	3KOg1hSm1ClLJcgyNz5++dVYl5FQU00y7E6eMSx213iolaUDsNEvXP7Gvx2MsVA2fyhP5/wLWkG
	vk5RV0apPEPHMw+AM88vdntQHkvhHQUXjJY+Ed9cSWOBJ
X-Received: by 2002:a67:ee95:0:b0:3aa:2354:b5d2 with SMTP id n21-20020a67ee95000000b003aa2354b5d2mr46725191vsp.16.1670844982490;
        Mon, 12 Dec 2022 03:36:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6L0suCBdpdKZTeXJrqwx+cD9dUWlWKYgmOdFJG5Nxuva9VVcEzWcg9/sxtke4bVoRcGFHv6zO88PrSQMOiXvU=
X-Received: by 2002:a67:ee95:0:b0:3aa:2354:b5d2 with SMTP id
 n21-20020a67ee95000000b003aa2354b5d2mr46725186vsp.16.1670844982153; Mon, 12
 Dec 2022 03:36:22 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
In-Reply-To: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Dec 2022 12:36:11 +0100
Message-ID: <CABgObfZ7Ar-t5m0+p=H1h0_bk-dJ5rYSVRCo6ZP5Wa0Qva2sLQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_033626_698194_13930921 
X-CRM114-Status: GOOD (  19.50  )
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

On Wed, Dec 7, 2022 at 11:33 AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.2:
> 1) Allow unloading KVM module
> 2) Allow KVM user-space to set mvendorid, marchid, and mimpid
> 3) Several fixes and cleanups
>
> Please pull.
>
> Regards,
> Anup

Hmm, I looked at them more closely and I noticed something weird in
the author date:

git log --format='%an %ad %s' origin/master..6ebbdecff6ae
Anup Patel Wed Dec 7 09:17:49 2022 +0530 RISC-V: KVM: Add ONE_REG
interface for mvendorid, marchid, and mimpid
Anup Patel Wed Dec 7 09:17:43 2022 +0530 RISC-V: KVM: Save mvendorid,
marchid, and mimpid when creating VCPU
Anup Patel Wed Dec 7 09:17:38 2022 +0530 RISC-V: Export
sbi_get_mvendorid() and friends
Anup Patel Wed Dec 7 09:17:27 2022 +0530 RISC-V: KVM: Move sbi related
struct and functions to kvm_vcpu_sbi.h
Anup Patel Wed Dec 7 09:17:19 2022 +0530 RISC-V: KVM: Use switch-case
in kvm_riscv_vcpu_set/get_reg()
Anup Patel Wed Dec 7 09:17:12 2022 +0530 RISC-V: KVM: Remove redundant
includes of asm/csr.h
Anup Patel Wed Dec 7 09:17:05 2022 +0530 RISC-V: KVM: Remove redundant
includes of asm/kvm_vcpu_timer.h
Anup Patel Wed Dec 7 09:16:51 2022 +0530 RISC-V: KVM: Fix reg_val
check in kvm_riscv_vcpu_set_reg_config()
Christophe JAILLET Wed Dec 7 09:16:39 2022 +0530 RISC-V: KVM: Simplify
kvm_arch_prepare_memory_region()
Anup Patel Wed Dec 7 09:16:21 2022 +0530 RISC-V: KVM: Exit run-loop
immediately if xfer_to_guest fails
Bo Liu Wed Dec 7 09:16:11 2022 +0530 RISC-V: KVM: use vma_lookup()
instead of find_vma_intersection()
XiakaiPan Wed Dec 7 09:16:02 2022 +0530 RISC-V: KVM: Add exit logic to main.c

Something in your workflow has eaten the actual date when these were
posted to the mailing list.

For example, https://lore.kernel.org/lkml/CAAhSdy0t1XGTENidgNQkQ5m5emZOes+-2RXTPLEJ0tEZXuX2hA@mail.gmail.com/t/
shows Bo Liu's patch as being sent on November 1st.

Please keep the author information from the mailing list messages, and
also please try to update the KVM/RISC-V tree as soon as patches are
ready and tested, i.e. earlier than the week before the merge window.
(Seeing '6.1-rc8' as the base for the pull request is often a sign of
something wrong with the workflow; see

It's a small set of changes, so I'm going to defer this pull request
to the second week of the merge window.

Paolo

> The following changes since commit 76dcd734eca23168cb008912c0f69ff408905235:
>
>   Linux 6.1-rc8 (2022-12-04 14:48:12 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.2-1
>
> for you to fetch changes up to 6ebbdecff6ae00557a52539287b681641f4f0d33:
>
>   RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and
> mimpid (2022-12-07 09:17:49 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.2
>
> - Allow unloading KVM module
> - Allow KVM user-space to set mvendorid, marchid, and mimpid
> - Several fixes and cleanups
>
> ----------------------------------------------------------------
> Anup Patel (9):
>       RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
>       RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
>       RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
>       RISC-V: KVM: Remove redundant includes of asm/csr.h
>       RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
>       RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
>       RISC-V: Export sbi_get_mvendorid() and friends
>       RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
>       RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid
>
> Bo Liu (1):
>       RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()
>
> Christophe JAILLET (1):
>       RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()
>
> XiakaiPan (1):
>       RISC-V: KVM: Add exit logic to main.c
>
>  arch/riscv/include/asm/kvm_host.h     | 16 +++----
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 +++
>  arch/riscv/include/uapi/asm/kvm.h     |  3 ++
>  arch/riscv/kernel/sbi.c               |  3 ++
>  arch/riscv/kvm/main.c                 |  6 +++
>  arch/riscv/kvm/mmu.c                  |  6 +--
>  arch/riscv/kvm/vcpu.c                 | 85 ++++++++++++++++++++++++++---------
>  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++---
>  arch/riscv/kvm/vcpu_sbi_hsm.c         |  1 -
>  arch/riscv/kvm/vcpu_sbi_replace.c     |  1 -
>  arch/riscv/kvm/vcpu_sbi_v01.c         |  1 -
>  11 files changed, 97 insertions(+), 44 deletions(-)
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
