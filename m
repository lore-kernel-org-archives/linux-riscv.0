Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF098EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 20:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mY9Kmm41orAbDZmid4c8BMQips2PSpsSWc28mLpqn+o=; b=lVcZ9d1U88cWH4VLU3h38aCE5Q
	GsN+GGXM3HjHGwaNvKsmg3HkNUrgKLb03r66XSFZDGwUVHgd2WBfCUyUdeitoOlvR1L0AmimzCQES
	CZlJtAeIJmBCO6Pex/5Znqoxi6yPObYFocb8crukPx1TFwpqK8qwVSTVCKqpTtI5Jmn/6cVvnxzlS
	WObFqbSl2OxVonaCDI2zaqVPcA9n4eFyNyP4ob/R69DAAcKmCLWs3aiAgNXcQ1tgtPwNd6sMAl9/v
	9bfA8hjqLbanfuEOSrFEy35CkE+yqfbbzY6yHfQ5OBTBguusrmF9jEwHmjp9lW7Ts13T7d7cZIm8U
	Oc2/CegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDVzt-008c7n-0w;
	Sun, 25 Jun 2023 20:06:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDVzp-008c6p-23
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 20:06:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b5422163f4so21805255ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687723564; x=1690315564;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6SoUflbTM/FpgEV6FO9AKFH9tH6vucslhbHlIS2yfeM=;
        b=ZLPdvBMxDTBShZwleMmWJaWVBmf53QN+HrNSZlrWzo2JWiNkfCHstLeTirA6+d9FQ3
         VqvooySACl3hpPCtF26veDxBeCd+DkDQywGxkxOAhFexK6Sm+ziuAmOEcLTk2w9p+EB4
         7S+MzM/fwiVCvviLrsr76YVVZio8p/LJi0aEdyDeYi8PfQq0ekupSbLbvj4h9ONc5ZS4
         Fj6a2JJUcq6M8fN2YNAdlkG6K30KjKjfqwAWiAdQ5ROrYrHGxUFmjanw/l0wh+0dPXCR
         GWELy3E4TbHoRay8ZUnfazzSjzyI3RJ4YK/xWoepy8lBe5rNih5RWySluB+VGM0/oqdt
         AWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687723564; x=1690315564;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SoUflbTM/FpgEV6FO9AKFH9tH6vucslhbHlIS2yfeM=;
        b=TGTlCgLeUYP3WsVMuAfnKfarZNM2uxEVe9HQXEch0alvLrqlBvIdatdO8jIxUYFGdF
         Q7sdUc0esyofC0RzzoTeI3g9S5f3IYJNEcC3kktWmP9EdSC/HZ1ik2asUQyml28auEDT
         XaTu0zp/8jx4kB+xkKpdWllSPJaH/Lc5724ju1YScLCbAUoi6OYTmX2OMOsQF2RW6nRa
         iAEw/jErw3CdYGjbx+xyLZmzYbSK1g/pI/jnCqlQIR75dQiZlAg/O63cpzpo1o+JbV2l
         SUDJE6QmdUQerfxcG+AGQUwNXis9w8FPpjk1pXgRWVUK/NIBEYmoK0Xmt4tZ3QzIVavB
         J6VA==
X-Gm-Message-State: AC+VfDxhAMrqM9utPtJeF425TTQbY+KXX9v9wzlGyh3izIn5qWBkOZzt
	o7z8fUCRLYZw1SBZws1RDaySmUqZC7O1FILPtfU=
X-Google-Smtp-Source: ACHHUZ7qoTL6Fs6w5qVttplqtoBlBRnylqxh9Grb6wLCiQBLyYog7SpdpXr7h1pf1VjgHeT8B6f7mg==
X-Received: by 2002:a17:902:ecc5:b0:1b7:f98d:5567 with SMTP id a5-20020a170902ecc500b001b7f98d5567mr2921712plh.68.1687723563907;
        Sun, 25 Jun 2023 13:06:03 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id i9-20020a17090332c900b00192aa53a7d5sm2813875plr.8.2023.06.25.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:06:03 -0700 (PDT)
Date: Sun, 25 Jun 2023 13:06:03 -0700 (PDT)
X-Google-Original-Date: Sun, 25 Jun 2023 13:05:16 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <20230625-radish-comic-b0861fb96023@spud>
CC: jszhang@kernel.org, ndesaulniers@google.com, bjorn@kernel.org,
  llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-c2d55859-cf3b-48ac-bf38-9aa1344fc93c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_130605_673367_67E0F111 
X-CRM114-Status: GOOD (  40.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 25 Jun 2023 05:43:13 PDT (-0700), Conor Dooley wrote:
> On Sun, Jun 25, 2023 at 08:24:56PM +0800, Jisheng Zhang wrote:
>> On Fri, Jun 23, 2023 at 10:17:54AM -0700, Nick Desaulniers wrote:
>> > On Thu, Jun 22, 2023 at 11:18:03PM +0000, Nathan Chancellor wrote:
>> > > If you wanted to restrict it to just LD_IS_BFD in arch/riscv/Kconfig,
>> > > that would be fine with me too.
>> > > 
>> > >   select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if LD_IS_BFD
>> > 
>> > Hi Jisheng, would you mind sending a v3 with the attached patch applied
>> > on top / at the end of your series?
>> 
>> Hi Nick, Nathan, Palmer,
>> 
>> I saw the series has been applied to riscv-next, so I'm not sure which
>> solution would it be, Palmer to apply Nick's patch to riscv-next or
>> I to send out v3, any suggestion is appreciated.
>
> I don't see what you are seeing w/ riscv/for-next. HEAD is currently at
> 4681dacadeef ("riscv: replace deprecated scall with ecall") and there
> are no patches from your series in the branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next

It's been in and out of staging a few times as we tracked down the 
performance regression, but it shouldn't have ever made it to linux-next 
for real.

I'm fine just picking up the patch to disable DCE, I've got a few other 
(hopefully small) things to work through first though.

> Cheers,
> Conor.
>
>> > > Nick said he would work on a report for the LLVM side, so as long as
>> > > this issue is handled in some way to avoid regressing LLD builds until
>> > > it is resolved, I don't think there is anything else for the kernel to
>> > > do. We like to have breadcrumbs via issue links, not sure if the report
>> > > will be internal to Google or on LLVM's issue tracker though;
>> > > regardless, we will have to touch this block to add a version check
>> > > later, at which point we can add a link to the fix in LLD.
>> > 
>> > https://github.com/ClangBuiltLinux/linux/issues/1881
>> 
>> > From 3e5e010958ee41b9fb408cfade8fb017c2fe7169 Mon Sep 17 00:00:00 2001
>> > From: Nick Desaulniers <ndesaulniers@google.com>
>> > Date: Fri, 23 Jun 2023 10:06:17 -0700
>> > Subject: [PATCH] riscv: disable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for LLD
>> > 
>> > Linking allyesconfig with ld.lld-17 with CONFIG_DEAD_CODE_ELIMINATION=y
>> > takes hours.  Assuming this is a performance regression that can be
>> > fixed, tentatively disable this for now so that allyesconfig builds
>> > don't start timing out.  If and when there's a fix to ld.lld, this can
>> > be converted to a version check instead so that users of older but still
>> > supported versions of ld.lld don't hurt themselves by enabling
>> > CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y.
>> > 
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/1881
>> > Reported-by: Palmer Dabbelt <palmer@dabbelt.com>
>> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
>> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> > ---
>> > Hi Jisheng, would you mind sending a v3 with this patch on top/at the
>> > end of your patch series?
>> > 
>> >  arch/riscv/Kconfig | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > 
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index 8effe5bb7788..0573991e9b78 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -116,7 +116,8 @@ config RISCV
>> >  	select HAVE_KPROBES if !XIP_KERNEL
>> >  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>> >  	select HAVE_KRETPROBES if !XIP_KERNEL
>> > -	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>> > +	# https://github.com/ClangBuiltLinux/linux/issues/1881
>> > +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>> >  	select HAVE_MOVE_PMD
>> >  	select HAVE_MOVE_PUD
>> >  	select HAVE_PCI
>> > -- 
>> > 2.41.0.162.gfafddb0af9-goog
>> > 
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
