Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F009CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4giWcjMmO6SHh9rSI2lfhi+C1tQ2l3jwnYQqREOy5w4=; b=z5ZaY2JFlMgf8c
	wxwR40teDqjAZcMRXbWydaOHl/duRRlbSKAmj7A2rsIbMwkQRFjxrc539XYHg7Lq4ltOGWfyNFJAo
	Txxz1vHd2bIQmeuA3My5YjwWrvuAfIgL1rL+nzIB9FAPvVpo7lfYeSG+vMsj8q6eTBlS1xPVt61ci
	Wbpgd2dl84F20Wl/Iev2BZhIyLCsOZUpIVQz3JKdjsouTkvAcHCoVICsrkkGqiHc5El6YtWbkNhab
	h3FTH9Xo8C5eMU11Z02yhdli6gekPR7LAe4kf8a0+f63RVGTBpG8Q5n+GQ86ExuHESkf6ifaIWe3E
	iRq1EUP7/aQORIh6cMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4iYA-00G8Hg-Gy; Mon, 12 Dec 2022 13:08:54 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4iY6-00G8EP-8f
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 13:08:52 +0000
Received: by mail-ed1-x530.google.com with SMTP id i15so12743961edf.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hrsTHdTJbwls01AqE8UPAVwypoZK7MqNkS0vyWojDY0=;
        b=JAq03fHIf8UuWIJHvhpRM+Oi++N5xfDJubmTSXe4iFh8RjCZmBts2l5NWwEz/a5n9r
         tW2wQEX4fhpHI4JW2o6SvinEGHARdWRiFAq2k3rUq1II+ltsLB2wLI70zokFvxFJHmbk
         qPNeFccGX2EspzTx/gmm7DqfoXlkuuKMSKbqwDYY7pr/4JSkU5U1Ljg4nDADttNkS4JE
         /evkOmJe86hF+zSbt2ptqYc1iVAstcx5/2hERs0+93wQepQJ1KPuUN4dHBiqUAH8UNXo
         YHeztyJkSJaYXg0nQI22OTdiT5glecWt7B6K1hXmntJ9r8O4IhaS7ymptUu3XOr+zVeK
         sxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrsTHdTJbwls01AqE8UPAVwypoZK7MqNkS0vyWojDY0=;
        b=oH7vkex9XD6id34RGTai+NTqnLlYdIizs81OK+d0OIZy53QBizr/xX1rAgXScb7rvu
         eSDeTs19FH2QpfZjdsVIkRoxDx7GcdgnqwIfQeeG55FDsYKkxVCE53LDT2W3NGC+EgR9
         b9OJ1exWPNCIlHbFsyM1wzhwJ6US6oF43tbN+U344Vwb/LlqlG8FJUNrQh8rJZZEZTKV
         s1tt8p58W0h+MQIINrFI3jo0GT2WzwBgHvF1L0y4fukiy3nx2jwLzgAZuEtGLea8M2g3
         GomRSmxWK4oa/OxQChEcRH+e9KQgj2ya4m62pkqcOw+IdFyBPYSXXjbxKH6f7OyKdvSe
         8Log==
X-Gm-Message-State: ANoB5pkBP+v8nE0Ip0ddD9sV83Kj86k82MWyYk86XKlIIiDWrKS4dGN7
	iBMTHgu+L7KxMiRRGhO00JzKc0HZezp6M+fov4Ne0w==
X-Google-Smtp-Source: AA0mqf4hhAV6qnhgB/a43t2zmLT85++iSw6RqiW6FztbKeqmmRQu+gMIQlhxBBJ5aKBrrMatWIl0Ylw2BekWCNITujc=
X-Received: by 2002:aa7:ca4c:0:b0:46c:24fc:ba0f with SMTP id
 j12-20020aa7ca4c000000b0046c24fcba0fmr24347150edt.140.1670850526482; Mon, 12
 Dec 2022 05:08:46 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy0qihfFCXTV-QUjP-5XiQQqBC4_sP-swx77k6PC3uTmmw@mail.gmail.com>
 <CABgObfZ7Ar-t5m0+p=H1h0_bk-dJ5rYSVRCo6ZP5Wa0Qva2sLQ@mail.gmail.com>
In-Reply-To: <CABgObfZ7Ar-t5m0+p=H1h0_bk-dJ5rYSVRCo6ZP5Wa0Qva2sLQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Dec 2022 18:38:34 +0530
Message-ID: <CAAhSdy0c5_oa27axsG_YnZmJqoTVXAeR2XQ=sqvLtBMaB3wB1Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_050850_413722_9C643FDB 
X-CRM114-Status: GOOD (  26.12  )
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

On Mon, Dec 12, 2022 at 5:06 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Wed, Dec 7, 2022 at 11:33 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > Hi Paolo,
> >
> > We have the following KVM RISC-V changes for 6.2:
> > 1) Allow unloading KVM module
> > 2) Allow KVM user-space to set mvendorid, marchid, and mimpid
> > 3) Several fixes and cleanups
> >
> > Please pull.
> >
> > Regards,
> > Anup
>
> Hmm, I looked at them more closely and I noticed something weird in
> the author date:
>
> git log --format='%an %ad %s' origin/master..6ebbdecff6ae
> Anup Patel Wed Dec 7 09:17:49 2022 +0530 RISC-V: KVM: Add ONE_REG
> interface for mvendorid, marchid, and mimpid
> Anup Patel Wed Dec 7 09:17:43 2022 +0530 RISC-V: KVM: Save mvendorid,
> marchid, and mimpid when creating VCPU
> Anup Patel Wed Dec 7 09:17:38 2022 +0530 RISC-V: Export
> sbi_get_mvendorid() and friends
> Anup Patel Wed Dec 7 09:17:27 2022 +0530 RISC-V: KVM: Move sbi related
> struct and functions to kvm_vcpu_sbi.h
> Anup Patel Wed Dec 7 09:17:19 2022 +0530 RISC-V: KVM: Use switch-case
> in kvm_riscv_vcpu_set/get_reg()
> Anup Patel Wed Dec 7 09:17:12 2022 +0530 RISC-V: KVM: Remove redundant
> includes of asm/csr.h
> Anup Patel Wed Dec 7 09:17:05 2022 +0530 RISC-V: KVM: Remove redundant
> includes of asm/kvm_vcpu_timer.h
> Anup Patel Wed Dec 7 09:16:51 2022 +0530 RISC-V: KVM: Fix reg_val
> check in kvm_riscv_vcpu_set_reg_config()
> Christophe JAILLET Wed Dec 7 09:16:39 2022 +0530 RISC-V: KVM: Simplify
> kvm_arch_prepare_memory_region()
> Anup Patel Wed Dec 7 09:16:21 2022 +0530 RISC-V: KVM: Exit run-loop
> immediately if xfer_to_guest fails
> Bo Liu Wed Dec 7 09:16:11 2022 +0530 RISC-V: KVM: use vma_lookup()
> instead of find_vma_intersection()
> XiakaiPan Wed Dec 7 09:16:02 2022 +0530 RISC-V: KVM: Add exit logic to main.c
>
> Something in your workflow has eaten the actual date when these were
> posted to the mailing list.
>
> For example, https://lore.kernel.org/lkml/CAAhSdy0t1XGTENidgNQkQ5m5emZOes+-2RXTPLEJ0tEZXuX2hA@mail.gmail.com/t/
> shows Bo Liu's patch as being sent on November 1st.
>
> Please keep the author information from the mailing list messages, and
> also please try to update the KVM/RISC-V tree as soon as patches are
> ready and tested, i.e. earlier than the week before the merge window.
> (Seeing '6.1-rc8' as the base for the pull request is often a sign of
> something wrong with the workflow; see
>
> It's a small set of changes, so I'm going to defer this pull request
> to the second week of the merge window.

Should I send another PR ?
OR
Should I re-create the kvm-riscv-6.2-1 tag ?

Regards,
Anup

>
> Paolo
>
> > The following changes since commit 76dcd734eca23168cb008912c0f69ff408905235:
> >
> >   Linux 6.1-rc8 (2022-12-04 14:48:12 -0800)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.2-1
> >
> > for you to fetch changes up to 6ebbdecff6ae00557a52539287b681641f4f0d33:
> >
> >   RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and
> > mimpid (2022-12-07 09:17:49 +0530)
> >
> > ----------------------------------------------------------------
> > KVM/riscv changes for 6.2
> >
> > - Allow unloading KVM module
> > - Allow KVM user-space to set mvendorid, marchid, and mimpid
> > - Several fixes and cleanups
> >
> > ----------------------------------------------------------------
> > Anup Patel (9):
> >       RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
> >       RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
> >       RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
> >       RISC-V: KVM: Remove redundant includes of asm/csr.h
> >       RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
> >       RISC-V: KVM: Move sbi related struct and functions to kvm_vcpu_sbi.h
> >       RISC-V: Export sbi_get_mvendorid() and friends
> >       RISC-V: KVM: Save mvendorid, marchid, and mimpid when creating VCPU
> >       RISC-V: KVM: Add ONE_REG interface for mvendorid, marchid, and mimpid
> >
> > Bo Liu (1):
> >       RISC-V: KVM: use vma_lookup() instead of find_vma_intersection()
> >
> > Christophe JAILLET (1):
> >       RISC-V: KVM: Simplify kvm_arch_prepare_memory_region()
> >
> > XiakaiPan (1):
> >       RISC-V: KVM: Add exit logic to main.c
> >
> >  arch/riscv/include/asm/kvm_host.h     | 16 +++----
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 +++
> >  arch/riscv/include/uapi/asm/kvm.h     |  3 ++
> >  arch/riscv/kernel/sbi.c               |  3 ++
> >  arch/riscv/kvm/main.c                 |  6 +++
> >  arch/riscv/kvm/mmu.c                  |  6 +--
> >  arch/riscv/kvm/vcpu.c                 | 85 ++++++++++++++++++++++++++---------
> >  arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++---
> >  arch/riscv/kvm/vcpu_sbi_hsm.c         |  1 -
> >  arch/riscv/kvm/vcpu_sbi_replace.c     |  1 -
> >  arch/riscv/kvm/vcpu_sbi_v01.c         |  1 -
> >  11 files changed, 97 insertions(+), 44 deletions(-)
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
