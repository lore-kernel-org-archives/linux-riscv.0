Return-Path: <SRS0=uNJT=B7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDABC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 19:26:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4529520735
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 19:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbHCgmwm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="RWwdrwHx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4529520735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=2AePK4rWQVA8J3EuTImPyCfaVIspzhbybgRl/BU+w30=; b=YbHCgmwmRe1HKqya2TWi8DwO+
	HmBQclv0m5r9DkjedTlXftunWfYyrV10QWFYjAda85LayO8kEfQXjFWWBY/s48NkTL7BvxiVoQezj
	CYGN1P0JvicHQLuBgjDMKESLxDZpd9YCvgn6hX0MSqdhbns6wmT0ldMLt06eF+JUq5AaA7CDOszyr
	r8UVz+Ilj71sww2XVyCk4FOUbK3w4qsSrhzcC8WpQf323I8UyaRDCufrFwXJQ6ON988b2fOQG9nac
	l5k5taFwK17XWRkHopanmzVBr6IKAyu4VlH5oiVc6P4JOZ44r1+CHLTL149tfF1LSoVwBgBWQ18vv
	PgoR+Q7YA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Cfc-0005XO-0X; Fri, 21 Aug 2020 19:25:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9CfZ-0005Ws-FK
 for linux-riscv@lists.infradead.org; Fri, 21 Aug 2020 19:25:46 +0000
Received: by mail-pf1-x441.google.com with SMTP id r11so1530313pfl.11
 for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2020 12:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FDwpM4GaEzoscqk+s5D20X81oz01F9Lnfg0VQNTjuGY=;
 b=RWwdrwHx8gmYXyYWShwEe1i+wv2uojsKzksxasL8gnv0UvQuBJ5aZL2j6KfZxUtpU5
 my7ljkA2m8kk9qyH+eARaN3aMZGjyt8K9n4lSq48yQbIJuXUQDNYcTAOmMTgGLDroDgs
 gRVMF8RBMRZm5JFQudTDK8ABxjfqU9Rp+oNMC+Efn0qKJ5oASFLncyU5YQwN6/q2BAao
 EsDiOxeEH+/GXis9dy7rDogVPVbtVHAwJ0ZZDOnKqbxItugXAK16z55SWYVQylZtBfw9
 jk93VPtacsBko/o3daQrMHt52Ermox55xt06H1RAsvVE1K9jACF0F95hD7F5jhB1N9N4
 aglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FDwpM4GaEzoscqk+s5D20X81oz01F9Lnfg0VQNTjuGY=;
 b=Fbxpjzzo2w+G+xzCwDmaw65YS3igGJDqXu/d4Vyb3Lvda6NlUyIMmg2PG1ndvlWFj5
 mVUt/mSdLKHHnJAxUQWrSte5bFoYcblnAsYSrvHcyDK3vP3NYJ8PN1nRFNOb97RXgdkY
 wC2ebxNLSzT1zfzOW06RbgkVNwthije4OHCCJ/KgSv7LeaOxYALjVLRLzLA0m4BQnqPW
 iSXKk9vE3QjaWUDM21YFrwYKDs833w5tyUNuQxwfgu7G1zEuTpP/z/6yXV28h+1LH4n0
 /1xg1YgXRfyGYbhkqRuGKxPH2MkruZNL7rytLlmwijFCxoCK7UP0D9qSFuGLBisHtnXj
 QICw==
X-Gm-Message-State: AOAM530WtdMy2Fj1ImPBOMU3R7RCcoxB3zltVXbJnG0h0rxa6La7WHya
 AUiLwWQhoPwX3y5adr03Z1/4qTR0sX0PYw==
X-Google-Smtp-Source: ABdhPJw7D0v0kLvXZS1ZvNvknMf7IKlae1DKLkZjNAn0zL4ePFnJ5M4Fd062GmShXeGVpnR6lTU9tw==
X-Received: by 2002:aa7:92d7:: with SMTP id k23mr3445610pfa.295.1598037942868; 
 Fri, 21 Aug 2020 12:25:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u191sm2774320pgu.56.2020.08.21.12.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 12:25:41 -0700 (PDT)
Date: Fri, 21 Aug 2020 12:25:41 -0700 (PDT)
X-Google-Original-Date: Fri, 21 Aug 2020 12:25:40 PDT (-0700)
Subject: Re: [PATCH] riscv/mm: Simplify retry logic in do_page_fault()
In-Reply-To: <CAOJsxLHNFh76470xWASaC9QSH=vV9aL16Zy6yDwvj9KD132kqA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: penberg@gmail.com
Message-ID: <mhng-d0f213f2-8fae-41b0-aa1b-7681c1521719@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_152545_548141_F4DEE356 
X-CRM114-Status: GOOD (  22.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 20 Aug 2020 21:06:34 PDT (-0700), penberg@gmail.com wrote:
> On Fri, Aug 21, 2020 at 6:32 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 19 Aug 2020 07:10:11 PDT (-0700), penberg@gmail.com wrote:
>> > From: Pekka Enberg <penberg@kernel.org>
>> >
>> > Let's combine the two retry logic if statements in do_page_fault() to
>> > simplify the code.
>> > ---
>> >  arch/riscv/mm/fault.c | 20 +++++++++-----------
>> >  1 file changed, 9 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
>> > index 716d64e36f83..f5c2e4a249eb 100644
>> > --- a/arch/riscv/mm/fault.c
>> > +++ b/arch/riscv/mm/fault.c
>> > @@ -127,17 +127,15 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>> >               BUG();
>> >       }
>> >
>> > -     if (flags & FAULT_FLAG_ALLOW_RETRY) {
>> > -             if (fault & VM_FAULT_RETRY) {
>> > -                     flags |= FAULT_FLAG_TRIED;
>> > -
>> > -                     /*
>> > -                      * No need to mmap_read_unlock(mm) as we would
>> > -                      * have already released it in __lock_page_or_retry
>> > -                      * in mm/filemap.c.
>> > -                      */
>> > -                     goto retry;
>> > -             }
>> > +     if (unlikely((fault & VM_FAULT_RETRY) && (flags & FAULT_FLAG_ALLOW_RETRY))) {
>> > +             flags |= FAULT_FLAG_TRIED;
>> > +
>> > +             /*
>> > +              * No need to mmap_read_unlock(mm) as we would
>> > +              * have already released it in __lock_page_or_retry
>> > +              * in mm/filemap.c.
>> > +              */
>> > +             goto retry;
>> >       }
>> >
>> >       mmap_read_unlock(mm);
>>
>> This is missing your Signed-off-by, and while it's a bit pedantic I can't add
>> it myself.  Otherwise
>>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> Thanks!
>
> Oh, sorry about that. Here you go:
>
> Signed-off-by: Pekka Enberg <penberg@kernel.org>
>
> I can also resend the patch with a SOB if you so prefer.

This is fine.  It's on fixes, but unless something comes up I won't send it out
until next week.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
