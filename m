Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D745C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 10:44:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21E8C233CF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 10:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21E8C233CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R3vtbJ/9z/mhD2hX1vEqXwYhLjjidDzEC/KuSD2K9ZE=; b=krcUSMWyxfK++EU3qUJAbuslS
	dL6DQmmGBg0eSNa1w9b1em+Y1NdtWNlFPHndQ79msC297xFMpjJh+JQM1VK8bd6FL4QmggnJpkVkC
	l0FTH3QwbTKR4S3wd5vUG1Onued6vN0oTdEim8TsmwLUXwDttNZxPNL8tmtOIVdoOgKJjT3CBweGH
	IjoNbSkUa7gPoMe7SVAcEE4XRevO3Ec6boqr2e06qayJBdvlaeBPZZsJfTMQVfQDDbS/C7akYi0hx
	qEpkHPVDb5gKYHjh3X6dRHtRQEKlSAOmb7JiA8BrVJ8MB0JBKdGgYUw0ySPu2GSSpWoErvXAB5cDH
	DU4hoTYYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Ma9-0003wc-Dz; Fri, 15 Jan 2021 10:43:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Ma7-0003vA-8G
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 10:43:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id y187so7201156wmd.3
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1GOy62bJEqZmaaaVa7bc8fN/pAm+7HJUXrlW/loQbn4=;
 b=GRA245+v6+D969lm0qdoKR5AIDYU7qHRSngOxiM5SoTxd9sjQn12AxYh2ioJablJDK
 82B+TLMQVl3gdj6R7N4eJRd0XG1kulYPA9fZ/82s6ZvlGkW42ze7LCVgBdBdDt6B5RMf
 9epB4HQiaITY4kh2oapeXqrKn2uFmqlFcxUQjgb460lyFY6aVMOFdRHcEyu+VjcpKS1d
 UXMLUEYvOaNkScqT9oLQoMVeftjmqKWqqKHKy6loT4rvjqRKSooA3Ps+6dFkB2OROOtX
 IO2nOQGkRmFpd4tFT0SODWqSDYv9eToLvAcI1nnVkIc9iRm62m4eq5N5f00V+avYhMw9
 DA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1GOy62bJEqZmaaaVa7bc8fN/pAm+7HJUXrlW/loQbn4=;
 b=K5FJ8+iR3T+m+GCXEW7qVDfeSw7sgevRFFV8X9laFavCkxv8/3I5r6+PiyeB30hHwf
 USt429BLWRZE/mROtK4VFlJUwLZTfrIQp+g+T4RUNfVFCVD4qBTWkyLIHWhllPEXTI+h
 0nnvYJzxE8kW5w+gVJSnj31zCn9RWHUrAFAdfae1/I+le0l80cIYDQzv3jcSbhkII1h0
 e7B2T7r20yG9+jOEABeBuKouF/WdFD/DRIrVGiIpxrzX2eGWTj7JNJaN7BaXiiXbz43U
 etLpJgY7RTOa2WAIEzeUQle4e2nS3776jzaLiKtOInaWizyVqipswfV/y36jka4UGZVJ
 GAZg==
X-Gm-Message-State: AOAM530iwT4iU5VTq6zquJ2PYs572vPll1I3yRbzwlzdZE43l9RlSTag
 MZRag8dkOO1DgzrDVppdJ/CRm2LZe957bRiBzBtWUg==
X-Google-Smtp-Source: ABdhPJzSOXIQTfntvA3kJDnEuvoCbjy6DhMm6SSdgl6w+Wjwi5svPoulGemqVvF5Ip9r2PbEaJje5Vbbfi95JJdENvQ=
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr8266838wmg.152.1610707421375; 
 Fri, 15 Jan 2021 02:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20210111212031.2422-1-vitaly.wool@konsulko.com>
 <CAAhSdy04Nm+ET3Oepe5zRyVWiWpZzmfe=0BrdOEPUHGEOF86Vw@mail.gmail.com>
 <CAM4kBBKsYxaMe_R=JU=FxWdxS3vsgvpcMY3PCKBW080-9uSOrA@mail.gmail.com>
In-Reply-To: <CAM4kBBKsYxaMe_R=JU=FxWdxS3vsgvpcMY3PCKBW080-9uSOrA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Jan 2021 16:13:30 +0530
Message-ID: <CAAhSdy190iZJsuiMRfPeeFCciG=ag7kn7CbL-Rmzc++QF4QGCw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: simplify BUILTIN_DTB processing
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_054351_465560_0F1E7F77 
X-CRM114-Status: GOOD (  20.35  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 15, 2021 at 3:18 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
>
>
> On Fri, 15 Jan 2021, 10:39 Anup Patel, <anup@brainfault.org> wrote:
>>
>> On Tue, Jan 12, 2021 at 2:51 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>> >
>> > Provide __dtb_start as a parameter to setup_vm() in case
>> > CONFIG_BUILTIN_DTB is true, so we don't have to duplicate
>> > BUILTIN_DTB specific processing in MMU-enabled and MMU-disabled
>> > versions of setup_vm().
>> >
>> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
>> > ---
>> >  arch/riscv/kernel/head.S | 4 ++++
>> >  arch/riscv/mm/init.c     | 4 ----
>> >  2 files changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> > index 16e9941900c4..f5a9bad86e58 100644
>> > --- a/arch/riscv/kernel/head.S
>> > +++ b/arch/riscv/kernel/head.S
>> > @@ -260,7 +260,11 @@ clear_bss_done:
>> >
>> >         /* Initialize page tables and relocate to virtual addresses */
>> >         la sp, init_thread_union + THREAD_SIZE
>> > +#ifdef CONFIG_BUILTIN_DTB
>> > +       la a0, __dtb_start
>> > +#else
>> >         mv a0, s1
>> > +#endif /* CONFIG_BUILTIN_DTB */
>> >         call setup_vm
>> >  #ifdef CONFIG_MMU
>> >         la a0, early_pg_dir
>> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> > index 5b17f8d22f91..45faad7c4291 100644
>> > --- a/arch/riscv/mm/init.c
>> > +++ b/arch/riscv/mm/init.c
>> > @@ -615,11 +615,7 @@ static void __init setup_vm_final(void)
>> >  #else
>> >  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>> >  {
>> > -#ifdef CONFIG_BUILTIN_DTB
>> > -       dtb_early_va = (void *) __dtb_start;
>> > -#else
>> >         dtb_early_va = (void *)dtb_pa;
>> > -#endif
>> >         dtb_early_pa = dtb_pa;
>> >  }
>> >
>> > --
>> > 2.20.1
>> >
>>
>> We can avoid the early DTB mapping for MMU-enabled case when
>> BUILTIN_DTB is enabled (same as previous discussion). Otherwise
>> looks good to me.
>
>
> Right, but I had already submitted the patch which takes care of that, and you have reviewed it too IIRC :)

Ahh, I assumed this patch is based on latest stable Linux-5.11-rcX.

Either you can create a series with two patches OR you can squash this patch
into your previous patch.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
