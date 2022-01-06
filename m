Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D11C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Fee5Pf1xToeLgDNByxawJnZfJL/fEW2RThkrUR1cZs=; b=Hum3jaMl2VdktZ
	WdPGBtbW2IU71TvapGEEx0NgocTZr0spupX2s/oquTBjyUgTqhI4O02nqb4pQKVlAYc4Bh7jTVeYh
	UeT9628V0gcd4LWxunZKHtZgS2GmpqNaOl5+btzX7Yfx7B1Zj+eDum3fA8UyFpV9ZQBP7/qR8Dvwj
	5fl7+r/PfB2REZCtyIo3QdXqen1VRJ0uDspmbdS5OrMIuc55Kbh2oE83KLQF9qb+PTgX9Y4z/gd/b
	PvI8LWW57h3yO0Qx8T4LJ0amtqDoO0GmJ43p3nPePjFdJTNjI24m5QKRTb5uRQQbgihX3intyu0TP
	vBsVNtGlDuIT/R8qoLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5O58-00H37i-Cb; Thu, 06 Jan 2022 08:25:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5O4w-00H32F-Vk
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 08:25:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m20so1264608wmi.0
 for <linux-riscv@lists.infradead.org>; Thu, 06 Jan 2022 00:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18Hu6pHHT8+wZmsysRD7OPc1d8jjkREA01CkZ/k2MYA=;
 b=r0aiCYND3F+tbMUHcd7XhNoB3Mw/LTUGw0E9YDG0Q1zIruDQYML+d4J588HgU74/Jn
 jRu9exVOo2yY8ny8OC49x4fqLBbTmS945tf3JSHSKgnJkOpY/Zh2oiykVTE0n9hvhMqt
 1zwj8pixwWVV/p6oE8CPwlDOfx/oBTrj8n6iOOJ1wKjcYj1JqjT0cvkoWy7klZne76bJ
 Jmct9SiASlC6NXzUbzxHul1eL6Y5xKD2gCv+2BHyDPl/1ayiO+On/BubZ+c9sKIVhXm+
 Tr6oXZDxRTRbsLkUpOZ1qPLHAe0aXbrH/fWj/qQIMDNDoWhWlX5GpxyGM/2cM6yRP1VP
 yEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18Hu6pHHT8+wZmsysRD7OPc1d8jjkREA01CkZ/k2MYA=;
 b=wIYS+Mxg1lB7O9SS6SXJO5LP951/YZI0vdx/zcAA2Vty7+mvIfI4DhvRjEl+HEEGHM
 NJd7KvvgQYVuH5HVscMx6UULkc6E9rWUoxGSxEZdi28UntQMnZ9y/gHXmbjg2o2j5IeM
 Rc2tti83ImnAYRxeX/f5rigHuqxsWqOMHgdBYEa8GN163vC/Q3HVNA2ays85ZAAyNGQW
 Q5hjh3ecmomF0jHmp34qmGYkO2EpS6UFeU7RBCacrZr4ilc9cpkW+Pb2YtJ0Ft3h3glp
 wrkF5K1cCzKd27+0F4atRMp2iSTqieBYLWfm76sidbf7KXvw+nW/sER8Jdtgymwfe6tP
 B9gw==
X-Gm-Message-State: AOAM530HaDZxWpAOtR5SIN20w6IGMRG6nbLH53kdibHPXbcZ2qXLy2Cj
 W+bwVhPVrF4iBfPGexaj/B+wkiBDVOhYSkz0zlTL7g==
X-Google-Smtp-Source: ABdhPJwypdPCTyuWbVbVQiwnWTjO+ZwD0lE2C7hOstG24vnO0DT7pW9BbGPMqwZce4soAaiPqm+KjnxsUIsriXFUAvY=
X-Received: by 2002:a05:600c:1da5:: with SMTP id
 p37mr6170286wms.59.1641457496207; 
 Thu, 06 Jan 2022 00:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20220103133759.103814-1-anup@brainfault.org>
 <CAOnJCUJkVT9W6X+oe1CHjnHLUFs11Z_3qeXnats9pUcxCUiDPw@mail.gmail.com>
In-Reply-To: <CAOnJCUJkVT9W6X+oe1CHjnHLUFs11Z_3qeXnats9pUcxCUiDPw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Jan 2022 13:54:43 +0530
Message-ID: <CAAhSdy0CTwQn3PJER2H3snYA0D9y9f=nN3PCGxvVH_n7zFdZQA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update Anup's email address
To: Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_002459_114668_9AE7F8BE 
X-CRM114-Status: GOOD (  16.62  )
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

On Tue, Jan 4, 2022 at 1:37 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Jan 3, 2022 at 5:38 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > I am no longer work at Western Digital so update my email address to
> > personal one and add entries to .mailmap as well.
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> > ---
> >  .mailmap    | 1 +
> >  MAINTAINERS | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index e951cf1b1730..f5d327f0c4be 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -46,6 +46,7 @@ Andy Adamson <andros@citi.umich.edu>
> >  Antoine Tenart <atenart@kernel.org> <antoine.tenart@bootlin.com>
> >  Antoine Tenart <atenart@kernel.org> <antoine.tenart@free-electrons.com>
> >  Antonio Ospite <ao2@ao2.it> <ao2@amarulasolutions.com>
> > +Anup Patel <anup@brainfault.org> <anup.patel@wdc.com>
> >  Archit Taneja <archit@ti.com>
> >  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
> >  Arnaud Patard <arnaud.patard@rtp-net.org>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3e8241451b49..aa7769f8c779 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10443,7 +10443,7 @@ F:      arch/powerpc/kernel/kvm*
> >  F:     arch/powerpc/kvm/
> >
> >  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> > -M:     Anup Patel <anup.patel@wdc.com>
> > +M:     Anup Patel <anup@brainfault.org>
> >  R:     Atish Patra <atishp@atishpatra.org>
> >  L:     kvm@vger.kernel.org
> >  L:     kvm-riscv@lists.infradead.org
> > --
> > 2.25.1
> >
>
> Acked-by: Atish Patra <atishp@rivosinc.com>

I have queued this patch for 5.17

Thanks,
Anup

>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
