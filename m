Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038ADC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 08:29:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9953464F99
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 08:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9953464F99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f/z/c5hUqkHeolRbIfqd3HsTFTVH9xSdRw6j6BpKnis=; b=jVpoNgoY5O+hp2x3UD8+YfgYZ
	1ykX2FJR07EqqelWnxmz6g2BDvwAQfdykfcBfMSbwMn+j00XDiPbBpn1kPdwrT3x7EmJVFkM9eGdd
	G2XQbwHWUc+kGJ7eTalIemjwd2IrpzHHzrJc2bpT9coDuwF0LGbN5rS1fmiiW/OhfJ4oLiVdv+ZyR
	j78AJo7WQmeyAzfN6GathoT93WgsJ5rY/fmpNYtpuonGfREIv9PDEMzq1GVteZVxRTgG6qzcxuFwc
	WVwRN7TQbjMqNi7mjSggKcTnZHrSKdnibLYQnQ4vzRkOKd++uuPkxzReoZLRuL8s2ezh2TMZHhXOA
	zX6e67i1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMRYe-002lBP-87; Wed, 17 Mar 2021 08:29:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMRYZ-002lAh-MN
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 08:29:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id d191so951660wmd.2
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 01:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FszYK6XJvOqLV5aC3rDe7wSMfM1HwiAzqiaWoilNkjU=;
 b=t9hpWuZ2CcgCRCUbHLeRNb5NDl9j+FOvAu6JeWVAqK2KEq9Wf0mxjvhikSWoGuV5Gv
 tImIVqJldHUey+Jdtl8gqK8E4ofum8VPCBgGbiqtcL57ORceLo4lYi6AECRV7TKICzTr
 LBE/s4omyiHXVKxfYk0her+kDiJHxx8sMUPM9Dpx7IuwyJ5C1wQu4G8+fSFnCZ2pStNr
 8reNQ4AcHiSdczFEyxcyJ0B4olgsS4mUSUl0pfvQNYjJLkTmhco+U1vLi0rtTUfhQV81
 py142E5/HkEmMPobMJnn7huKa8qDzmHNJsxwjzuDH9HLE1O4Ca/2LhdGkqlC+c59AOgX
 oMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FszYK6XJvOqLV5aC3rDe7wSMfM1HwiAzqiaWoilNkjU=;
 b=TP/zrCI0kdBjf9W3Ex4TtHWzOfMpNxS0X8HTPAkeKznsTVAIDJqZoThqQmaz8yqFTS
 het+WoOthY/R/bmvcdOrS6W9NOoKLtNJA/gQL0MUVTCUsn75hjxVvkUWg+ClF5LD1Bbu
 I1POrKz1Urncvm79b4pSnUcWK/M1l+brbVB5S1W1YsKpQR1TwIDw4X4cvlmAB41cW2Vb
 xFCJoxECR/6AEPZvJYsGv1TWH6p0SXkDssQhfqD9OmkiKtpr5OUBJvQY8cKO03/Eb9gW
 d9ALskvnzHSbtuiyoml99HZAS1Gl3oBaxnUE/zUzXqfm0hwLUypkHjcpo8DmrU+p+4p3
 hdVg==
X-Gm-Message-State: AOAM530TmbR0gudm1itGXrzvFFWd70gm1lWw3TxNoqKYbWWNAlKf0q77
 T35fnLnvfiMBJWgfTblBBaICWjT0JCcBzdAZ9E6KRQ==
X-Google-Smtp-Source: ABdhPJyODgVdBUcy6KutdnAXKlUrHshjF8dk1NiL3hZy0C6VgqD356X7b+rkzblx76EXjRPFCC2dU+tUbneuvDcA6Ow=
X-Received: by 2002:a1c:60c2:: with SMTP id u185mr1163441wmb.157.1615969770350; 
 Wed, 17 Mar 2021 01:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210311164712.652608-1-anup.patel@wdc.com>
 <mhng-18286acf-f6b8-4793-88a1-f747b818f764@palmerdabbelt-glaptop>
In-Reply-To: <mhng-18286acf-f6b8-4793-88a1-f747b818f764@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Mar 2021 13:59:17 +0530
Message-ID: <CAAhSdy1rY-OOgboucJjzMh7_Vh-3G9cDyt8gtRgNNFHBV6O2Eg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/3] IPI and remote TBL flush improvement
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <Atish.Patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_082931_892399_3F6E08DC 
X-CRM114-Status: GOOD (  28.01  )
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

On Wed, Mar 17, 2021 at 10:23 AM Palmer Dabbelt
<palmerdabbelt@google.com> wrote:
>
> On Thu, 11 Mar 2021 08:47:09 PST (-0800), Anup Patel wrote:
> > This series primarily does two things:
> > 1. Allows RISC-V IPI provider to specificy whether IPI operations are
> >    suitable for remote TLB flush (PATCH1)
> > 2. Improve remote TLB flush to use IPIs whenever possible (PATCH2)
> > 3. Allow irqchip drivers to handle IPIs from chained IRQ handlers (PATCH3)
>
> IIUC this last one isn't technically used in both forms, as we don't have any
> drivers that behave that way yet?  I'm OK taking it, under the assumption it
> makes keeping the out-of-tree driver for the draft interrupt controller easier,
> but I was wrong then it's probably out of order so I figured I'd check.

The last patch is for RISC-V AIA drivers I am working on.

The draft RISC-V AIA specification is available at:
http://www.jhauser.us/RISCV/riscv-interrupts-019.pdf

>
> Aside from that this generally LGTM.  We are making quite a bit of mess in
> here, but I don't really see a way around that as we need to support the old
> hardware.  We can always do a cleanup when the specifications settle down.

Not all RISC-V platforms will have a mechanism for direct IPI injection from
S-mode so to maintain backward compatibility for older platforms (where
IPI injection will be always through SBI calls) we have chosen the current
approach.

The RISC-V AIA spec is trying to solve this in a way which works for both
S-mode (or HS-mode) and VS-mode. The current RISC-V AIA plan is to
provide IPIs as software injected MSIs between HARTs and this will work
fine for Guest/VM as well.

>
> Oddly enough this did come up in IRC recently and there may be some new bits in
> the CLINT on the FU740 that allow S-mode SW interrupts to show up directly --
> there's at least a "delegate supervisor software interrupt" bit now, but the
> manual only calls out machine mode as being able to set it (though IIUC it's
> memory mapped, so not sure how that would be enforced).  Not saying we need
> that in order to take the last patch, but if it is possible it's probably worth
> giving it a shot when the boards show up.

Adding a few bits in CLINT will not be a complete solution because we also need
a mechanism where a Guest/VM can directly inject IPIs without SBI calls to the
hypervisor.

>
> > This series also a preparatory series for upcoming RISC-V advanced
> > interrupt architecture (AIA) support.
> >
> > These patches can be found in riscv_ipi_imp_v1 branch at
> > https://github.com/avpatel/linux
> >
> > Anup Patel (3):
> >   RISC-V: IPI provider should specify if we can use IPI for remote FENCE
> >   RISC-V: Use IPIs for remote TLB flush when possible
> >   RISC-V: Add handle_IPI_noregs() for irqchip drivers
> >
> >  arch/riscv/include/asm/smp.h      | 19 +++++++++-
> >  arch/riscv/kernel/sbi.c           |  2 +-
> >  arch/riscv/kernel/smp.c           | 30 +++++++++++----
> >  arch/riscv/mm/cacheflush.c        |  2 +-
> >  arch/riscv/mm/tlbflush.c          | 62 ++++++++++++++++++++++++-------
> >  drivers/clocksource/timer-clint.c |  2 +-
> >  6 files changed, 91 insertions(+), 26 deletions(-)

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
