Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AB1C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 04:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTi2iMh/IdztbWGr8MjUgNMnolud8TLMJPC5sJMqsfE=; b=AbGLBlSCq9Mmje
	s4k8tYCWQFUTsKG2TLWYpApqxMrttGF819jbJckJQbO7NQw7yzJolzG9/iVViOeNo1qTTrj/HYt23
	iZ64Cfw04++wbSCCqbN9rCAEAMO8WiTcmBfZMjMkGfHzXXDcgNIs80C6NqnMxvPvLPnFaTtyLd+w1
	hNw18pVmeBYgLpgiO9C15Z1PnYDgw/9rdpmWl1w4PGqRpet/ZS9Pe6SWXJK0JuojbbHHZvWYkZZ2V
	fIIg9p9ASZXAzDt8rRHhKdWKJqJ3MLpq63LGJqbWF2aO8c4WJF+tJPgduRBmOf7ZpmsnDKmVORYn4
	ExXFDqTvZpx3N/S+vpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtMMj-00HUDg-VO; Sat, 04 Dec 2021 04:09:38 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtMMg-00HUCW-Nt
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 04:09:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so3702911wmc.2
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 20:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tpeccUSJsSvJStEMWbp4Kpifv0i5piggQ5Q0bjyTPA=;
 b=lQqC1ucSfqkj6ErW6i6uVxmWz2Ddcj3w7qmEBbovctdRbp6rkD8Isid4VbPDf/gYRB
 S4fALxLnn2HH2WUSaWcfzPi0Bcp1APHkcJDJQmWE9mZc0+cQiA/JFjYcw3fWKFMQm6AQ
 kNl1YijqrzJcfR+rs72T/qAn54aVsry59XOHTvSO5fWlaBoeGC0tBvrwef0jF+nJ9wLO
 JFmgqQKq0IGiXBVXJCvSuO53PAu+MYoVl4QbB2dzlP/QMviEzORW+TiHHpZ4riRf/Ro2
 k5LzXNu9OT1TxUb6voyzJ4mqBSupe9ggvCUnzvNZqCvfmDqpfT5oMgAtUHbG0L2iBUWh
 pRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tpeccUSJsSvJStEMWbp4Kpifv0i5piggQ5Q0bjyTPA=;
 b=Y4eVqjN2yyJfpPXqSmjoTNfBFy4Nn2rbUpP5QP0+BN2Ijez3ftkAdpuzrL0VtBrK8v
 9wT9+vzZqLzxU1DqDxFyIGT2vfzVA+VW7iMNkVy5oALDf3wcSXVSMTtjUGiVhR56iDrQ
 ANv2Ej0IBFhuU4Lqxw6Cqi2CPXZajEnCTXwFME/1gLkJxFpQaaWfV7JYcuRI6Gwv33rv
 i0R7zyIblzP0/D+Fjm+6IRGoh3NMBKRFLitwIJsUm0sL4PUzEuvGy7o9IEaeeiMd+kNe
 X9zrQjzk5K2gUgFCmGq3ZveIkVyu2pUK45SmqvP3nG4VzxzGp4dWxln6aAoR8OiDDmRz
 lv8Q==
X-Gm-Message-State: AOAM532p1YaLrjMn5GmHee7a1zJKDmDw4F4nURRdn5n/IGBbWSRIFqGR
 DjyZAmKlVLPSdKyXwL3IsLT23pTxWpKs7h9IxQxfbQ==
X-Google-Smtp-Source: ABdhPJw51KWA7sJPb31HUd4HOH4EkxzkMBiXdbkuk+r3buWjXUnh3vSsgBHiqTq5ETSkoyKshmo70CmljLiANghRt8w=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr20250612wmj.176.1638590971589; 
 Fri, 03 Dec 2021 20:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20211202235823.1926970-1-atishp@atishpatra.org>
 <f63e9f1b-4b8e-6c3e-8e21-f9a5f97ca17d@arm.com>
In-Reply-To: <f63e9f1b-4b8e-6c3e-8e21-f9a5f97ca17d@arm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 Dec 2021 09:39:20 +0530
Message-ID: <CAAhSdy2xRwUmdi7Kc7ZokgB5W1LWKZ7YU-doHZ5dfaVKvzRdUg@mail.gmail.com>
Subject: Re: [PATCH v3] MAINTAINERS: Update Atish's email address
To: Steven Price <steven.price@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_200934_894065_0A53EE71 
X-CRM114-Status: GOOD (  21.15  )
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

On Fri, Dec 3, 2021 at 9:40 PM Steven Price <steven.price@arm.com> wrote:
>
> On 02/12/2021 23:58, Atish Patra wrote:
> > I am no longer employed by western digital. Update my email address to
> > personal one and add entries to .mailmap as well.
> >
> > Signed-off-by: Atish Patra <atishp@atishpatra.org>
> > ---
> >  .mailmap    | 1 +
> >  MAINTAINERS | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index 6277bb27b4bf..23f6b0a60adf 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -50,6 +50,7 @@ Archit Taneja <archit@ti.com>
> >  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
> >  Arnaud Patard <arnaud.patard@rtp-net.org>
> >  Arnd Bergmann <arnd@arndb.de>
> > +Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com> <atishp@rivosinc.com>
>
> I don't think this does what you expect. You can't list more than one
> email address to replace on the same line. You can use the command "git
> check-mailmap" to test what happens, e.g. with this change applied:
>
>   $ git check-mailmap "<atishp@rivosinc.com>"
>   <atishp@rivosinc.com>
>   $ git check-mailmap "<atish.patra@wdc.com>"
>   Atish Patra <atishp@atishpatra.org>
>   $ git check-mailmap "<atishp@atishpatra.org>"
>   <atishp@atishpatra.org>
>
> So only your @wdc.com address is translated. If you want to translate
> the @rivosinc.com address as well you need a second line. As the file says:

Thanks Steve for noticing this. Even, I realized this while queuing the patch.

I have removed @rivosinc.com email address from the patch in my queue. I
believe Atish currently uses both personal and @rivosinc.com email addresses
on LKML.

Refer,
https://github.com/kvm-riscv/linux/commit/2255b100410179bb8151e99e8396debddea0ef1d
https://github.com/kvm-riscv/linux/commits/riscv_kvm_queue

Regards,
Anup

>
> # For format details, see "MAPPING AUTHORS" in "man git-shortlog".
>
> Steve
>
> >  Axel Dyks <xl@xlsigned.net>
> >  Axel Lin <axel.lin@gmail.com>
> >  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5250298d2817..6c2a34da0314 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10434,7 +10434,7 @@ F:    arch/powerpc/kvm/
> >
> >  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> >  M:   Anup Patel <anup.patel@wdc.com>
> > -R:   Atish Patra <atish.patra@wdc.com>
> > +R:   Atish Patra <atishp@atishpatra.org>
> >  L:   kvm@vger.kernel.org
> >  L:   kvm-riscv@lists.infradead.org
> >  L:   linux-riscv@lists.infradead.org
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
