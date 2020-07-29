Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC4BC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 09:44:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B344206D4
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 09:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mm17zazn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=forissier-org.20150623.gappssmtp.com header.i=@forissier-org.20150623.gappssmtp.com header.b="opZoclrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B344206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=forissier.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a9dIyQF219UMC7/W2xXA0GKrZcm5FU5zL4yddNsDL8U=; b=mm17zaznQn0miKITb2WO+RPyg
	q2vlFDr/Q1hBzIPPdrF6CU0FUDmB5DHj84591LL7cQhF++O6MsGBkDgiddG+OML88P6MkJLy2JWjh
	cOvuapNv1iJIcPPa3uLnq9uv2WFkUqshUU8CtedbXQjDlNgHJSBPGEEXO+DCTof9//IcJgEShElsl
	8InBbYz8hUPA4V52s/fYlAjd1uH7x+VP3OYTXA3NcG7LjfkUeh+DtJ0MCU0TC50a9HAnStWtkP+0r
	7xBlaAv4/U51MY7+zP6j65Dwhvr1ngKDfgXC6HMKCafM/xJq9qvxTaMGQ0v/3AW52Km/dNVDRMpR4
	bYX4DAYxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0id3-00037H-Dc; Wed, 29 Jul 2020 09:44:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0id0-00036q-Lb
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 09:44:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id f7so20997455wrw.1
 for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2020 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=forissier-org.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1B6sHmpFdSMlBrSZn4FtDLGgjbjrh4KTYvqK28zKwEg=;
 b=opZoclrpw7l19LPDT2No4+V5ths3PaT6n06lw1Ayayyf66MX1qY6u39Zrh4vC3w3tQ
 8FM4hE1nD5RxHGIx8fT42aoLASshUtjJHmHi7knQSU6cSO7zIJWO6Vtl2JG4JBnjwlAl
 R82EBkRrEwgtmNqbBZFziTvISymiPS+70nI20mBq29B3FLCnpkUJWMWFPO8Ct6ufDEGP
 yxdnMfgEulMOgLYQll253OmX7zmbafGlq/mU7X0yVFjFXG2t4/vEdpnBk0ERpk/PGqYz
 X5i7iPG3LL1C5SNXg5CFaY1+Bo8aNqiz2WJgj25mPsj3El8gLqf5OjfY3mqetK8XIRiJ
 d0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1B6sHmpFdSMlBrSZn4FtDLGgjbjrh4KTYvqK28zKwEg=;
 b=Jsy9kxlsTBDU4MGUnZ7QCtw08KVI3U9DJSENmkwSJ4McGrZ4Dl7RgpRgyVxfmort5M
 fGwOErvXbinQRA5MX2/Yw+8BxDSJ3cWOPgX4ElP5QiuwipVrhfUMZ64U51v1jwa7ssga
 hej1Rk8hRruWt1qQeTbRHK7NYqt7B86+WULeo0VytGw/DqL9tfsFa9rq8vAbc1C0eUSa
 0eEGfSRxu4EpK12onyEOCky6K7/oDuXMuqwBogbhtK56sFKsY7DJUcmDrHxsXkxdVu/S
 UVlfNS9XSKZBmFMHiqTFr0QtCQGQsnBqjn0vJ30YpU9PyYz//Z54km52Tk3BOJZtxV8P
 Z/nQ==
X-Gm-Message-State: AOAM531V06RAhuO6+naBrZKE1gMQxXGOhPCo6sY14mEhFWf3h+AVawps
 dM7mADFy8wpJTRjhviEdpUPHGw==
X-Google-Smtp-Source: ABdhPJxtqtArcqB9/kz8kRH38tIaD8rXcHJKHaCNZuP1Z7p74QDOT6HD+yiWalqOqYNl7pzgLPVlRw==
X-Received: by 2002:adf:f008:: with SMTP id j8mr27467322wro.385.1596015840939; 
 Wed, 29 Jul 2020 02:44:00 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:269:e210:d805:7291:902e:33f0?
 ([2a01:e0a:269:e210:d805:7291:902e:33f0])
 by smtp.gmail.com with ESMTPSA id r206sm4133133wma.6.2020.07.29.02.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 02:44:00 -0700 (PDT)
Subject: Re: [PATCH RESEND] riscv: don't specify -mno-save-restore when
 building with clang
From: Jerome Forissier <jerome@forissier.org>
To: Tobias Klauser <tklauser@distanz.ch>
References: <20200729044143.tzok6p3nctqzms4w@distanz.ch>
 <20200729080811.12111-1-jerome@forissier.org>
 <20200729082903.6ix42nylg2e36lh6@distanz.ch>
 <d09a872d-3f6a-c849-a5c9-f3c859a49349@forissier.org>
Message-ID: <fd5498de-85a5-c8a1-95f4-e714dd819038@forissier.org>
Date: Wed, 29 Jul 2020 11:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d09a872d-3f6a-c849-a5c9-f3c859a49349@forissier.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_054402_757005_8C85B490 
X-CRM114-Status: GOOD (  24.29  )
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



On 7/29/20 11:36 AM, Jerome Forissier wrote:
> 
> 
> On 7/29/20 10:29 AM, Tobias Klauser wrote:
>> On 2020-07-29 at 10:08:11 +0200, Jerome Forissier <jerome@forissier.org> wrote:
>>>> On 2020-07-28 at 18:06:36 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
>>>>> On 2020-07-28 at 17:20:45 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>>>> On Tue, 28 Jul 2020 06:12:52 PDT (-0700), tklauser@distanz.ch wrote:
>>>>>>> Clang doesn't support -msave-restore and -mno-save-restore. This avoids
>>>>>>> the following message emitted by clang:
>>>>>>>
>>>>>>>   '-save-restore' is not a recognized feature for this target (ignoring feature)
>>>>>>>
>>>>>>> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
>>>>>>> ---
>>>>>>> Resent due to infradead.org mailing list issues.
>>>>>>>
>>>>>>>  arch/riscv/Makefile | 2 ++
>>>>>>>  1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>>>>>>> index fb6e37db836d..cd3720bc45e8 100644
>>>>>>> --- a/arch/riscv/Makefile
>>>>>>> +++ b/arch/riscv/Makefile
>>>>>>> @@ -44,7 +44,9 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
>>>>>>>  KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
>>>>>>>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>>>>>>>
>>>>>>> +ifndef CONFIG_CC_IS_CLANG
>>>>>>>  KBUILD_CFLAGS += -mno-save-restore
>>>>>>> +endif
>>>>>>>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>>>>>>>
>>>>>>>  ifeq ($(CONFIG_CMODEL_MEDLOW),y)
>>>>>>
>>>>>> Thanks, this one didn't make it the first time.  Is there a reason we can't use
>>>>>> cc-option here?  IIRC that's what we use for the other compiler options that
>>>>>> may be unimplemented, and it has the advantage of avoiding encoding specific
>>>>>> compilers into the build system.
>>>>>
>>>>> Thanks for the hint. I don't know how I could've overlooked cc-option.
>>>>> Will send a v2 using cc-option.
>>>>
>>>> Looks like it's a bit more complicated:
>>>>
>>>> Using just cc-option still leads to the warning being emitted, so I
>>>> think the CONFIG_CC_IS_CLANG check is still needed (checked using clang
>>>
>>> Shouldnt cc-option be fixed instead? The warning effectively means the option
>>> is not supported, so why should cc-option pretend it is?
>>
>> The problem is that clang somewhat handles the option, i.e. doesn't
>> treat it as an unknown option like others and thus doesn't exit with
>> non-zero, like it does for other options only available for gcc. This is
>> what cc-option relies on.
> 
> OK, I was thinking perhaps cc-option should consider a warning as a hint
> that the option should not be used. But it is probably not a good idea
> after all (could easily break things).
> 
> However this makes me think the following could work (untested!):
> 
> -KBUILD_CFLAGS += -mno-save-restore
> +KBUILD_CFLAGS += $(call cc-option,-mno-save-restore -Werror)

Sorry, please ignore this nonsense. We don't want -Werror to stick in
KBUILD_CFLAGS obviously.

:-/

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
