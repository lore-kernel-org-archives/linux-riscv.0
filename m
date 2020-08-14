Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19172C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 22:47:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F262068E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 22:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngs95Dkl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ueoQGnQg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F262068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=7Qqq0+gQOxsz9Bp+7IDfZNtlMeVv8+jHLDPBu31M8cI=; b=ngs95DklTqPysl349pNBipotD
	ZZIdrbJzu8bY0HZNvdqLB9HcTPIgbr+jn2Bl4JjKueX3fNSwREOBBAeFFgpJ6YmFvOQMxwF6TN0++
	Lq69WrZxMn2sWfXFoNyyoT2TPVqE2C7rroSYwMqfEhqFCGAgy4Kptdr9/oHqr7jA0ptvWoLhxUPdo
	5bgJ21spLvunXJRQL2xOeDdPf3xeD11EHT6+mE+ID+yoUvjOjnRRrTPIMP/3oLV3I/5EIpCedETq1
	iV57GXbc7lQtNpxyv2oCIFrhNcEqOaqcMedU6Lkjg1/m+5tZXch8EGWVvL9y8rth02TMYet1wpise
	751m/g4nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6iTV-0004hW-Mi; Fri, 14 Aug 2020 22:47:01 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6iTT-0004gl-2x
 for linux-riscv@lists.infradead.org; Fri, 14 Aug 2020 22:46:59 +0000
Received: by mail-pl1-x644.google.com with SMTP id f10so4812714plj.8
 for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2020 15:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hfkleEwSe7pLkB1i+3oiskPIgfmW6z+glQ5do1GkngU=;
 b=ueoQGnQgW5aNBF+q57GgcNTXjdyuwW3K88ga2JaQhzV7mJG76V/u7U1gG63QK7QKSY
 V+SB8kr0uA9VzGzKQ3mPanX+ObE513VSRBxefsfMR3hsIf20tUPoKWF6SGvVkO7CoRbf
 rvhYjx3CdRJS2K24smJ1WJRY/6RTXoRcauaf4af9pqbxeGUEPjFaojrI6c1i5cHvxIBJ
 PHRPhPvJ+IOeua5/oMKIDNehV/d7cHXIMqnXXMvYnBvG5T2fFyi2ao7MVWMhNnyHVyNQ
 9XfQPDzaxCBJlLhoO51zSDDDVcYqapC9p4iw3QTd8mrh+JBv/grkt/x5zP+UU4e4cmao
 47NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hfkleEwSe7pLkB1i+3oiskPIgfmW6z+glQ5do1GkngU=;
 b=g75fus8N2eW0KZFDGW3FhMllS0BDwnogOctJ9JcoAiTQyU+zZT4APJ/D1s8Zf1rhvr
 zu+0B/tX5C5bOX0ObSC+DfOEkqB71wtSV1CAyMBiRjBKJ+eMcPhcWxlVw6w5/v/IeXeZ
 nC1Zl1oLOEuUCTbP0q+WSLYLg2nkk8CTMv29OYqxLPSxT09QQ1xlilKSWOiutfeunB7G
 gyz/CvH141hzQMLbto2R7TIpTwhO69JheaRDcvaTn88VZnSzCW5ZLBgMoBJhAoB2C0WQ
 nC5Dswa8rPwWI/Zgi+YHxYJDKKlb/Nub5ab6I6pUu59JpnyKRQ5zLTuV+DnB39s712A9
 kzrQ==
X-Gm-Message-State: AOAM530MhZ4+hKnMLx7+JVBYWxevnlg3SNeKqQAfx7I2AE1PDTtyhPUr
 3x00LWpEdvd/nH26xlqQwHL1YA==
X-Google-Smtp-Source: ABdhPJzlKNlwtLtRjj0H1x1Ji+tUu5s6Vu5SfHlWfbVy6P4m/qfnwqHH0hb6pWdbUe8J+eN645d+Vw==
X-Received: by 2002:a17:902:d346:: with SMTP id
 l6mr3263838plk.77.1597445216938; 
 Fri, 14 Aug 2020 15:46:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g4sm9643218pjh.32.2020.08.14.15.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 15:46:56 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:46:56 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 15:46:54 PDT (-0700)
Subject: Re: [PATCH v2] riscv: Setup exception vector for nommu platform
In-Reply-To: <CAAhSdy1hLAVEHohtuZ6XYxOjWgUmZPXah=tJFrb6tWoRyEiRgA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-4a2f780e-e0c2-41d9-9ce9-c27a090236c3@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_184659_173683_3E952CEC 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, aou@eecs.berkeley.edu,
 qiuwenbo@phytium.com.cn, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 13 Aug 2020 01:49:44 PDT (-0700), anup@brainfault.org wrote:
> On Thu, Aug 13, 2020 at 9:10 AM Qiu Wenbo <qiuwenbo@phytium.com.cn> wrote:
>>
>> Exception vector is missing on nommu platform and that is an issue.
>> This patch is tested in Sipeed Maix Bit Dev Board.
>>
>> Fixes: 79b1feba5455 ("RISC-V: Setup exception vector early")
>> Suggested-by: Anup Patel <anup@brainfault.org>
>> Suggested-by: Atish Patra <atishp@atishpatra.org>
>> Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
>> ---
>>  arch/riscv/kernel/head.S | 25 +++++++++++++++++--------
>>  1 file changed, 17 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index d0c5c316e9bb..0a4e81b8dc79 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -77,16 +77,10 @@ relocate:
>>         csrw CSR_SATP, a0
>>  .align 2
>>  1:
>> -       /* Set trap vector to exception handler */
>> -       la a0, handle_exception
>> +       /* Set trap vector to spin forever to help debug */
>> +       la a0, .Lsecondary_park
>>         csrw CSR_TVEC, a0
>>
>> -       /*
>> -        * Set sup0 scratch register to 0, indicating to exception vector that
>> -        * we are presently executing in kernel.
>> -        */
>> -       csrw CSR_SCRATCH, zero
>> -
>>         /* Reload the global pointer */
>>  .option push
>>  .option norelax
>> @@ -144,9 +138,23 @@ secondary_start_common:
>>         la a0, swapper_pg_dir
>>         call relocate
>>  #endif
>> +       call setup_trap_vector
>>         tail smp_callin
>>  #endif /* CONFIG_SMP */
>>
>> +.align 2
>> +setup_trap_vector:
>> +       /* Set trap vector to exception handler */
>> +       la a0, handle_exception
>> +       csrw CSR_TVEC, a0
>> +
>> +       /*
>> +        * Set sup0 scratch register to 0, indicating to exception vector that
>> +        * we are presently executing in kernel.
>> +        */
>> +       csrw CSR_SCRATCH, zero
>> +       ret
>> +
>>  .Lsecondary_park:
>>         /* We lack SMP support or have too many harts, so park this hart */
>>         wfi
>> @@ -240,6 +248,7 @@ clear_bss_done:
>>         call relocate
>>  #endif /* CONFIG_MMU */
>>
>> +       call setup_trap_vector
>>         /* Restore C environment */
>>         la tp, init_task
>>         sw zero, TASK_TI_CPU(tp)
>> --
>> 2.28.0
>>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
