Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E75C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RG2tSmBApst7yeGH4kkJRSYqcYpmjWLvFaljFdUNVM=; b=JKrGkPKPXDI4am
	ZkN3YzF/qmj0rRyty0BSmQtk3gAUqV/PS44hegZj5tOlYRGM4FUdxjnacwtxyEPa32PLNAbLmXz5H
	dCerzadHwKzcNniAIa5CJUG9Ptq9AjqzCrsr1iKlHTjT7XpjhXQVNW+es1KWk1KR93LHVNtJ/MSJZ
	V7xfNradPg31Bj5vinQ0pYhHzLkFO17nqzANnnK5KI16ca4pPcPGgL9jPrZWFBRibcXdTLX0fetIw
	w+1B9orWFqVUmt2Y80OdJ6fShNaWTsHrfznqPttIKRd/XJ7tkS8zGp5gdsF2saOhp8U1FYTlDpori
	SRwwMNHjwhjWlQ9ILxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mshnh-00BUE2-AW; Thu, 02 Dec 2021 08:50:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mshnd-00BUCL-Ex
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 08:50:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so1706251wmj.5
 for <linux-riscv@lists.infradead.org>; Thu, 02 Dec 2021 00:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=es9/Tr6MB1CFpBQoW+wl/y/nUnYLARczzVgZp7MOScI=;
 b=trU/HvMQ7/qXEGbT8w2fuzq/IzVhjJo+jv5NUg97R9B4KBq+JW0d+bzZ1KJjEAK6ZM
 ax5M3PsJWAjI2vzfu2sMLO7qV3P7qSDDAnL6vv1rwo5uyk70CxUE8yApTF8fNO+oz4AY
 C23hGwNotMUxbk8vGAWP2Vt/C9uakdv/pllQwixjZ2MmtQ8tLGPkYOhcipT1zc2UZYX5
 tKBp/C1S/izliKNLO9oHECStzQONlfh5uNBKeGqQYQK18XBOfAJJfJNOo9VmEAnPE9iD
 nWHDSSVC2V9hDPoUdLi26pGumLWISp1H08yXOuPpQAu8w2W8DddVx3y/uTxUQGsBO4ZJ
 w4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=es9/Tr6MB1CFpBQoW+wl/y/nUnYLARczzVgZp7MOScI=;
 b=az3imEr9pZ3qH4sKZdVOC/9Sgn3vKqDshgx6W9T+iN9L8EzKp83qA9q6kSOl5GgtXC
 yuz/WzGTUiIx9K/Uim2J/H1kaeBRAXFn6GhrNh/0MvVfvJSCwCk+w0Py1qWOB6MCd98Y
 08HV5BFj1fh2DbmV6uvFKZ2NSWP/Ebv1yQS5NqnPrnI+vsqLWW4EQHh2BmIYyWiaxl4v
 2JPJ0059fXt/MYcmvX4VqblptsS0iAAvDMG7XA2Uib3IuJzNDJ2y+og7joewGq8hTq/E
 tR8lEKQpwMnbZtTT0dYhb7DV62j/RHCGGAy/fh4eg2A4GUXc+gGA2UOQt2yieGSUTxzc
 VkHQ==
X-Gm-Message-State: AOAM531Y4+xWe44zE5fKdytYHWhYWRahL9nSfZx01rauZAYF1Xq4JZN9
 zhRRtq336+yNsGi7YdrL1JI5sDW0ZwJr42BWyTN9Sw==
X-Google-Smtp-Source: ABdhPJxJlghneRv8O/VzzShZ0fGp35zLfia3JcnzpVsZAO4FM0BD2ejTpkwZZafmtDg20KSSZI+Y6E7Ul+5Cdpiffks=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr4687630wmj.176.1638435039573; 
 Thu, 02 Dec 2021 00:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20211126193111.559874-1-atishp@atishpatra.org>
In-Reply-To: <20211126193111.559874-1-atishp@atishpatra.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Dec 2021 14:20:28 +0530
Message-ID: <CAAhSdy0bKWCBT+b1w1Z5YO+Vq8xYgyYQoR8yvPK2SuK=VXwWXw@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update Atish's email address
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_005041_552609_C3951C52 
X-CRM114-Status: GOOD (  16.12  )
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

On Sat, Nov 27, 2021 at 1:01 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> I am no longer employed by western digital. Update my email address to
> personal one and add entries to .mailmap as well.
>
> Signed-off-by: Atish Patra <atishp@atishpatra.org>
> ---
>  .mailmap    | 3 +++
>  MAINTAINERS | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 14314e3c5d5e..5878de9783e4 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -50,6 +50,9 @@ Archit Taneja <archit@ti.com>
>  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
>  Arnaud Patard <arnaud.patard@rtp-net.org>
>  Arnd Bergmann <arnd@arndb.de>
> +Atish Patra <atish.patra@wdc.com>
> +Atish Patra <atishp@atishpatra.org>
> +Atish Patra <atishp@rivosinc.com>

I think you just need one-line entry to map WDC email (OLD) to
Personal/Rivos email (NEW)

Something like:
Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com>

Regards,
Anup

>  Axel Dyks <xl@xlsigned.net>
>  Axel Lin <axel.lin@gmail.com>
>  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7a2345ce8521..b22af4edcd08 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10434,7 +10434,7 @@ F:      arch/powerpc/kvm/
>
>  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
>  M:     Anup Patel <anup.patel@wdc.com>
> -R:     Atish Patra <atish.patra@wdc.com>
> +R:     Atish Patra <atishp@atishpatra.org>
>  L:     kvm@vger.kernel.org
>  L:     kvm-riscv@lists.infradead.org
>  L:     linux-riscv@lists.infradead.org
> --
> 2.33.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
