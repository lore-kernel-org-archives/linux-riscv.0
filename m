Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269E6C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 09:36:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A282075D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 09:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PzumkDVs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=forissier-org.20150623.gappssmtp.com header.i=@forissier-org.20150623.gappssmtp.com header.b="rrfQcAv9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A282075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=forissier.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=suxmht98VAgmnyFv5HC26pfMEhvwTMLIdZHxe32TGok=; b=PzumkDVsrhQZLWDJzKp4ba+AA
	a1ijuwareHBF7stHBTa4AzxTZDmT5StgUD7ay8r1p2hz0rHS2Lp4rkxrci5RYeXjSHKzB2lFVfzxC
	2lkXv8AoAcCD10FaIQS6HrvhBS1qWvKEIz6kPjZh+2InGv2tr3j08KkV3i3GRM2T4PO55wK3iZlST
	0Plk18mLM1V0GRQzgvv+wwluG1UsE7cwJ1k4zvbgeKOH5ZQZlVdJEwW/SYZocJJqv+W59cZo1zFA+
	+rfZBu21q/SqSUWtW96qIbAOzx0bYJrxjLgxKRb4X9Gfz6rOvqZpM+sApMQr0KE8VeTY14pBSO+yH
	Ia3EbFIOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0iVi-0001qe-9P; Wed, 29 Jul 2020 09:36:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0iVf-0001pg-Ro
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 09:36:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id f7so20976105wrw.1
 for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2020 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0QWOM9k2DT+6vs/6RR1J4aQbHTXIZJddc+xy863UkQw=;
 b=rrfQcAv94e5eOHE+8eVDMSMT4g8xAUDF6tsMVjqK25EUnLQDM1PfRAMCAG8pjXfjEV
 9SZ/ye8Z6AhWPSUTUhv7dlHeJpRHmOOFUOgFTALMiGYlmP3emlYaEjKuODeP9rolSlNB
 8NMgWv5K5RbWHzA32xemmzX2YX/YKSVj+QRMt+wuywnLkJFwFVs9B0VYqnXImAYTnoQc
 PhB/qlAlZVUz8y7Yu7Au+YEBlqqFSSTa9BqtoZf8vaLbD0Hs9S4t/1Kaqhm35GXw5YUK
 lFcNW1nAsvbScqV16poT+UsmX4SlNrCrIR442aAaLo98GDZbITQMK1xh0tpk9f8GRb4n
 a6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0QWOM9k2DT+6vs/6RR1J4aQbHTXIZJddc+xy863UkQw=;
 b=r6hz6dcAbOTQXwZEdeVtuq6DMVQuCq1SulVIVCR2BtLC6FrevywSaeRuU7TdrJcOXr
 Xd3wALkduUemVjbCz5ecXOyI+/ccu0jzZ/exJmOkMB4uL4l2s1LalbsgSMYCbWxhqCNA
 OxpGeCZ0aXoY6qCjz81TOZHa1iCSDC6UCyGm9f5iwvtOLKrMcp6H2C2oZbA7QrJcsJlJ
 vq1EJwKOSIYQ8m3m3BTho+yMSxvGsI2AZfNY7F+9ttMn7KZ7eOpIrDq6GKZwGnlumhmo
 /Rfdo8ZPBmpZliVEeDywX+2kIcU8dSASO2WKgBZWTbvttr2ZMFm3Jsigpm/cMEa/suHt
 Isfg==
X-Gm-Message-State: AOAM532aqWqI9dWHZv9U0FtjJRNtaB497ZJhYpLtTxQB86L0jtMoc7H7
 tg7Mk89ThuDTLwq4g8k21duTtw==
X-Google-Smtp-Source: ABdhPJxWnG3/pJV6eZQ39cWvirj8IvYkSxwYYY28EkvdfUb9indduv0rsxtkVU+wNbBNdWOSG0Hovw==
X-Received: by 2002:adf:e712:: with SMTP id c18mr16552423wrm.92.1596015386611; 
 Wed, 29 Jul 2020 02:36:26 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:269:e210:d805:7291:902e:33f0?
 ([2a01:e0a:269:e210:d805:7291:902e:33f0])
 by smtp.gmail.com with ESMTPSA id w16sm4846456wrg.95.2020.07.29.02.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 02:36:25 -0700 (PDT)
Subject: Re: [PATCH RESEND] riscv: don't specify -mno-save-restore when
 building with clang
To: Tobias Klauser <tklauser@distanz.ch>
References: <20200729044143.tzok6p3nctqzms4w@distanz.ch>
 <20200729080811.12111-1-jerome@forissier.org>
 <20200729082903.6ix42nylg2e36lh6@distanz.ch>
From: Jerome Forissier <jerome@forissier.org>
Message-ID: <d09a872d-3f6a-c849-a5c9-f3c859a49349@forissier.org>
Date: Wed, 29 Jul 2020 11:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729082903.6ix42nylg2e36lh6@distanz.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_053628_012292_83F25D07 
X-CRM114-Status: GOOD (  26.73  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 7/29/20 10:29 AM, Tobias Klauser wrote:
> On 2020-07-29 at 10:08:11 +0200, Jerome Forissier <jerome@forissier.org> wrote:
>>> On 2020-07-28 at 18:06:36 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
>>>> On 2020-07-28 at 17:20:45 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>>> On Tue, 28 Jul 2020 06:12:52 PDT (-0700), tklauser@distanz.ch wrote:
>>>>>> Clang doesn't support -msave-restore and -mno-save-restore. This avoids
>>>>>> the following message emitted by clang:
>>>>>>
>>>>>>   '-save-restore' is not a recognized feature for this target (ignoring feature)
>>>>>>
>>>>>> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
>>>>>> ---
>>>>>> Resent due to infradead.org mailing list issues.
>>>>>>
>>>>>>  arch/riscv/Makefile | 2 ++
>>>>>>  1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>>>>>> index fb6e37db836d..cd3720bc45e8 100644
>>>>>> --- a/arch/riscv/Makefile
>>>>>> +++ b/arch/riscv/Makefile
>>>>>> @@ -44,7 +44,9 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>>>>>>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>>>>>>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>>>>>>
>>>>>> +ifndef CONFIG_CC_IS_CLANG
>>>>>>  KBUILD_CFLAGS += -mno-save-restore
>>>>>> +endif
>>>>>>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>>>>>>
>>>>>>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>>>>>
>>>>> Thanks, this one didn't make it the first time.  Is there a reason we can't use
>>>>> cc-option here?  IIRC that's what we use for the other compiler options that
>>>>> may be unimplemented, and it has the advantage of avoiding encoding specific
>>>>> compilers into the build system.
>>>>
>>>> Thanks for the hint. I don't know how I could've overlooked cc-option.
>>>> Will send a v2 using cc-option.
>>>
>>> Looks like it's a bit more complicated:
>>>
>>> Using just cc-option still leads to the warning being emitted, so I
>>> think the CONFIG_CC_IS_CLANG check is still needed (checked using clang
>>
>> Shouldnt cc-option be fixed instead? The warning effectively means the option
>> is not supported, so why should cc-option pretend it is?
> 
> The problem is that clang somewhat handles the option, i.e. doesn't
> treat it as an unknown option like others and thus doesn't exit with
> non-zero, like it does for other options only available for gcc. This is
> what cc-option relies on.

OK, I was thinking perhaps cc-option should consider a warning as a hint
that the option should not be used. But it is probably not a good idea
after all (could easily break things).

However this makes me think the following could work (untested!):

-KBUILD_CFLAGS += -mno-save-restore
+KBUILD_CFLAGS += $(call cc-option,-mno-save-restore -Werror)

> 
> Like mentioned in the follow-up patch [1] clang 11 will handle
> -m{no,}save-restore correctly, so we need to address that case as well
> (which [1] does). Unfortunately, I currently see no other way than using
> these ifeq's to fix this.
> 
> [1] https://lore.kernel.org/linux-riscv/20200729044428.32460-1-tklauser@distanz.ch/T/#u

The -Werror technique would avoid introducing a test on the version number.

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
