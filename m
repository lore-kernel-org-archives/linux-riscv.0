Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8246AC47073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 15:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VLrsgPQxSFG1PeZjf/rl431mOFlH8c9wZdc6HebdOFw=; b=Z6BWU16OQb+uuS6ALuBj11y8Ed
	LjJTahqEJFBB6lFo1NxYhRubXpXD9zUxruxh1h2XjbHg7sjw7/Wbu6BIlAv+NiMsJes6b2/Ip/7PM
	UE9PPMusjUgdsL7ZiGBoYQ5ZS4FEibxOdgGygs48CDfGGojqhAAyHqwHLciaKQVF0UgUb735wyqqG
	wrWlV/HQOgPRIV5k2W+hEl2Pje6VAPi4B6mKnqMVwLhGJ6vQ2T36SN7Fk2CwMhebRVahymSnmGwmA
	N+RxJ0yFlDCtzkQdHM7Zah/z/CEPi0R9Xub06wl7kNrgEsRKh4A0myWQVJ4b44tSngS2eapzs5ccV
	krQAMNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2rF-00BDCe-2O;
	Wed, 03 Jan 2024 15:08:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2rC-00BDBz-0u
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 15:08:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6d9b37f4804so369468b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704294512; x=1704899312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZW5HL8jTOKyKXCZ5ChELVp1LLtBzg1hO02LPO4zJgA=;
        b=F6ubi2me2zDCP2ppdsQqsOgcxg1gku5qpdsM9tpod9tCOrEcAXixT/HH1psNCKTp89
         vANnRTmzOxE1uTViOvQIiUQERlI/kzzPqJUEwMMKDkf8bVbvFjlQtrQCGEgWFORNn21t
         /OaroaoOJwiN0joodvTaPDR0iGXXq7/ExoMt9lZTFmhiFkXOvZGLFMD9vs+5oDg4W8y9
         mkpKLN42RbQtpNhlxTCZOVZqOw+uskELf0Tq1SxN0vvdnNdemvoP3pcYC/zZIPEOZDJO
         vjFRa5f+EFuuqd4FMpaCyNOMZ/AzvsufIKI70Yt4J8C57yanST7xF9cax2KtWbqqldX8
         aUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294512; x=1704899312;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZW5HL8jTOKyKXCZ5ChELVp1LLtBzg1hO02LPO4zJgA=;
        b=khlJR1/KJxDT8r3tmLOUmgEJ2kWdV4l65gvN7j1ABMMKj9lLCULOHjAhpkFsfJp30U
         5b2MupMfSxUUMMmEf6HCdPaCons+21IfM/L+0ILt5k2g+Mt1RTRa6mzRiXrDQqqj0c3g
         CRIQuhcE3H9gHSWp0jgxIxWYvyKqPH2UKqIPoUr9NPxJslDVN54D6NMc0M5PjpbMLSlw
         aIA/qN/KsqYv0z2K934mFz6EHUUaCbWcOKLglk5F7KN8cnKt3uawpejHb8OKsUqVE7FX
         S4PMpe2pNXQaC57302yxGbaSl0qufNhpUnUyBaAd2hr2KneKqUiW1PVVNj1kth/YZbtR
         HCLA==
X-Gm-Message-State: AOJu0YwONdTu61OwXoPQPKosg+DkD/ZS/5FkSiO+S/c66eP9yxHudS/T
	YVAKmYBEbp54Yfz1o+VHJO98PG66frqgQPlI203u1utDE1U=
X-Google-Smtp-Source: AGHT+IHuhGPmsZXMPYg/Oipy87wT0ng96ZoQ9H6Ux7E1g+sj1o/jFKAOGpMHo3dVB4MgwTUas4/JLQ==
X-Received: by 2002:a05:6a00:114f:b0:6d9:e443:e24d with SMTP id b15-20020a056a00114f00b006d9e443e24dmr1214727pfm.1.1704294512185;
        Wed, 03 Jan 2024 07:08:32 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id e17-20020a630f11000000b005c6007a13b5sm22146963pgl.25.2024.01.03.07.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:08:31 -0800 (PST)
Date: Wed, 03 Jan 2024 07:08:31 -0800 (PST)
X-Google-Original-Date: Wed, 03 Jan 2024 07:08:30 PST (-0800)
Subject: Re: [PATCH] RISC-V: hwprobe: Check for the reserved flags
In-Reply-To: <20240103-4665626eafc3c8ad049af13d@orel>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-660139e9-e4ef-4a87-aede-33a679f76f4b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_070834_540173_1337939B 
X-CRM114-Status: GOOD (  23.32  )
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

On Wed, 03 Jan 2024 05:23:57 PST (-0800), ajones@ventanamicro.com wrote:
> Hi Palmer,
>
> On Wed, Jan 03, 2024 at 04:12:20AM -0800, Palmer Dabbelt wrote:
>> This check got dropped when RISCV_HWPROBE_WHICH_CPUS was added, but
>> we've still got a bunch of other reserved flags.  So check for them,
>> just to make sure userspace doesn't get confused later.
>>
>> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
>
> I'm having trouble finding the tree/branch for this commit hash.

It's just over here 
<https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=for-next>, 
that's where I push stuff before it goes to my testing box.  Something 
rebooted, though, so it ended up tied up for a bit...

>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/kernel/sys_hwprobe.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
>> index ccf61b040536..10d72893b04f 100644
>> --- a/arch/riscv/kernel/sys_hwprobe.c
>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>> @@ -347,6 +347,10 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>>  			    unsigned long __user *cpus_user,
>>  			    unsigned int flags)
>>  {
>> +	/* The rest of the flags are still reserved. */
>> +	if (flags & ~RISCV_HWPROBE_WICHH_CPUS)
>                                    ^ WHICH
>
>
> We shouldn't need this check since the way v3 of the series has
> do_riscv_hwprobe() is
>
>  static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>                            size_t pair_count, size_t cpusetsize,
>                            unsigned long __user *cpus_user,
>                            unsigned int flags)
>  {
>        if (flags & RISCV_HWPROBE_WHICH_CPUS)
>                return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
>                                        cpus_user, flags);
>
>        return hwprobe_get_values(pairs, pair_count, cpusetsize,
>                                  cpus_user, flags);
>  }
>
> And hwprobe_get_cpus() starts with this check
>
>       if (flags != RISCV_HWPROBE_WHICH_CPUS)
>                return -EINVAL;
>
> And hwprobe_get_values() starts with the original check
>
>       /* Check the reserved flags. */
>       if (flags != 0)
>               return -EINVAL;
>
>
> IOW, we don't check flags at the top level, but each branch checks for its
> flags and hwprobe_get_values() doesn't have any.

Ya, sorry, I think I was just still asleep.

>
> Thanks,
> drew
>
>> +		return -EINVAL;
>> +
>>  	if (flags & RISCV_HWPROBE_WHICH_CPUS)
>>  		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
>>  					cpus_user, flags);
>> --
>> 2.43.0
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
