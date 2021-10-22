Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544BAC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 11:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D900601FA
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 11:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D900601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkpsIKyMRKgShklts0RnCNxBwjtT6mz29BkQy9qshpc=; b=pucsauILMLKlMu
	GV3CfNsizxV2HG8bHQViIxCtglAMG3GRkZLruYFPGfjqCM1HcFhRGa+zW4dRMj33mkKkAQ5IwYCS3
	k03hAmJu7YgygrEmMpnBzesg7+hWK30k0Z/RePKSeuwoIp7lcaSuHb02BqSbhCPiRpSaI5R7sn0C9
	aBHVJFsR3++RM0J/+ctSkFc7EWMAF1YJ3YrXoGPPpp+vHooHUe8PXUEOHOdZjKuXmIBrOsQuG0rm5
	8FF1OhXyTyiEKUNJwdRymI4M9vwXAGHGBb4zLq8/pwkVFX9+w/GgRrG+UB46b7Ae4In62WRP8po5n
	gscC0IIWFuhqVL94vDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdt9b-00AiJD-Pn; Fri, 22 Oct 2021 11:56:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdt9W-00AiEk-Gs
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 11:56:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 y22-20020a1c7d16000000b003231ea3d705so3095645wmc.4
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GfBU0GpSmy79GbH1anUO6sQjWFqwumWH7YxWakuinzc=;
 b=tWFAlFo6sqxss1FMA0XqNpWM7eRhtkHwtdMZr7zjgIb9Kk1jFDMx8krC6Pb6mRQJaB
 YVlYtaP1wZZWcAIaqOa3C8Og9j133Gm0PjCPtNTZycCwAwGHM4UIaSAzKegCraumHUGv
 dpUQ8+yZex7bLvyKOSSG/AZ2J1OernkkHlGRiAcIkbd11zkrEMqmmdJ7L0aBsbQGht97
 73yRbPa0l6tjQwWs5yRdKAsPp3i3/kVscHlz7wmqgWkqPNxcWSm1jbdCXHbO+CqRJEdB
 u1ODdswp9XwhcF2Gg8cDf+JBaZJZXIMThDP9nPL1xI6qdhI5XPKP/sQuCqOZf39UcAKY
 KHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GfBU0GpSmy79GbH1anUO6sQjWFqwumWH7YxWakuinzc=;
 b=eWYboZBaVNGZdIEK7rgcW6pARsv95po9YEHZ1KiqISfoKms5UsG5UUMZDohZyicN78
 qswwdfKZ5H0kRNrj7q94G7RPt2Tla6shPs4yE76soU7OiNXEqIPNNDmterDUB/MhEYND
 EEsuCNSNW9eCl2ykj4i2eA2Wgdtem0US//7xdkGFsZ0Hv1swpW805SDJGGKUPgTh/a4+
 EmiZXOEhz+B1Rr9HdYIme4VyAKdoOwu0wm7vTg2Oi64P4etoDvTFpKPqF06wM/d9hU7/
 sOuS7J52YLXgtQ9wij9fPMZDFZbX9F8G4fWiJbL+bGESOIS3itZsGy3MY0cMKyoudpQy
 iLdw==
X-Gm-Message-State: AOAM533PE1Y8gCiKOR1Owgmy+bau5SUZXQ5jOy8S0sXSlCwrsskyRVVV
 jcE22jPtI3Jlc6q9I0tOCBdRCXaX/ZUGxik/Kp2pVQ==
X-Google-Smtp-Source: ABdhPJyje0rIg0VhIHC70ks2ose2WVfVFBCEjQcBhQxEnJNRdtAXMllSDvh8stJgNdMbceG5aDtLDTWNxC9gMg0twV0=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr13289169wme.137.1634903759923; 
 Fri, 22 Oct 2021 04:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211022061514.25946-1-lukas.bulwahn@gmail.com>
 <5c27a2ff-b7a2-99d8-bdc4-7f2b20092500@redhat.com>
In-Reply-To: <5c27a2ff-b7a2-99d8-bdc4-7f2b20092500@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Oct 2021 17:25:48 +0530
Message-ID: <CAAhSdy0h38gOZ-7WKDN=SLBhC0pbRjXS19XyU9eu-PzUi3Xv7A@mail.gmail.com>
Subject: Re: [PATCH] riscv: do not select non-existing config ANON_INODES
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, kernel-janitors@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_045602_591286_070B9183 
X-CRM114-Status: GOOD (  14.67  )
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

On Fri, Oct 22, 2021 at 3:24 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 22/10/21 08:15, Lukas Bulwahn wrote:
> > Commit 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support") selects
> > the config ANON_INODES in config KVM, but the config ANON_INODES is removed
> > since commit 5dd50aaeb185 ("Make anon_inodes unconditional") in 2018.
> >
> > Hence, ./scripts/checkkconfigsymbols.py warns on non-existing symbols:
> >
> >    ANON_INODES
> >    Referencing files: arch/riscv/kvm/Kconfig
> >
> > Remove selecting the non-existing config ANON_INODES.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >   arch/riscv/kvm/Kconfig | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> > index a712bb910cda..f5a342fa1b1d 100644
> > --- a/arch/riscv/kvm/Kconfig
> > +++ b/arch/riscv/kvm/Kconfig
> > @@ -22,7 +22,6 @@ config KVM
> >       depends on RISCV_SBI && MMU
> >       select MMU_NOTIFIER
> >       select PREEMPT_NOTIFIERS
> > -     select ANON_INODES
> >       select KVM_MMIO
> >       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> >       select HAVE_KVM_VCPU_ASYNC_IOCTL
> >
>
> Queued, thanks.

Thanks Paolo for applying this directly.

Regards,
Anup

>
> Paolo
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
