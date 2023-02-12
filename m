Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BF1C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 18:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxxpS6KMqtkfy3sntm4FhxrtSOY+N/FDGRUn9cIlU58=; b=WjVOkkiBlFYvDj
	mzIc2iOvUvMuLcevKDz3cnLT4s8tLkIMA+gIjevoErgfBfAnNkgteCGyeItAwIC1RwGih3psh6zIS
	BTSspuDjfM5MSAjr6lwOYo1N9r7xkx0TfT+8H1j+xOb/fsq2iLQHiagkp9AzabS1Y0fc9/5QjQCH4
	GJx+VnP7j2VrU5gjO+ZlwThd842clCHtx0sRVG6MVr5x17Sp+Srjk22ilRPH5MsR6HuSZy6a50ECl
	b9odfx+0Mvg3zN3KLgPfajIBTaD0ZfkLBNw3s0EsNkWaYbhOc3TclZnhsdwzXxA3OHRjspQjrnhGw
	luLLt6X0+TOKwQB0oYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRHFC-00C5pP-Bm; Sun, 12 Feb 2023 18:38:34 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRHF9-00C5oJ-Du; Sun, 12 Feb 2023 18:38:33 +0000
Received: by mail-oi1-x235.google.com with SMTP id s17so8539326ois.10;
        Sun, 12 Feb 2023 10:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HnZTM4aCncFxs1pAbM5ySS/dMSWJRqjHRewc8smV+6s=;
        b=RaIxDjv+9itnwY0BWpVFW2NNiprhUZbyJPqmqDDUTo8E7DAs022bgJN2634MbdYmNm
         i5AzsvLo6R40GBt2zMkC+rc2ZYqehTpK11eTM//PtykS5++V0lelmL8yugR1Abxe61se
         D5NQXe17/pOJ+oRZEuafx5BcwfdhPtGq/U23Qs+JYJkOI2aOqHo04Q1WJD1YMX5z3bn1
         PXr2o0ak15xBnQssi5061CELOaIi8ejUcQuKOWdbyeZVjHnheXEZDvNGwfLlzJYJLzVM
         3fFWSBe80YO5tcfQSm1k8gxR9UssOZz91uLh4cDX6rwuKGzQsGUfZDM9i/hrB7q4qKCJ
         dcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HnZTM4aCncFxs1pAbM5ySS/dMSWJRqjHRewc8smV+6s=;
        b=21kQN5z4koIg+mUD8OqK6hnatVRnNC0XgcUKPZxLEwfDFW/ludtwsi3qxpCybgzNmS
         jO/GQ4knBRAa5O8SvP4Gf14lTV9j5Z1O3e5y47Ezj8moU0HX0rG0GGyyLRESUmGJpM3d
         BI+TgawMJUk6JQAEcVpiI1zQ1dbB+Bqn/E/C7cq4xZdJSRaFDh5bX32rHPNTtP5NxQ5g
         kocFFV7d4CM4Fts0bi3Pc6ofnULXV7Qt1qJI+PFgSnJ0i8Y5p2GZkPMjSi5IqyibCuHK
         Q88N2SsfmSPA4XXVWJ1MGIPozzV/jLCOEgBe1PaMII0mN2CzIwl3C5kGpwordU0goBj5
         oErg==
X-Gm-Message-State: AO0yUKW+Ba/aBYQuempUE4fzgPTU1vZquDHJ2XtdPJBSRv6tYMfFKPS5
	X36xOj88FqNX+JMV6khsfNp21qcbGj8=
X-Google-Smtp-Source: AK7set/KP9lAHf+iHmY/lcIV+05r1h1S1yTa/ED7OMXagnfbf8i4LW5WMdvneV+hrq3qeTTWpVbHpg==
X-Received: by 2002:a05:6808:2802:b0:378:5f75:bf27 with SMTP id et2-20020a056808280200b003785f75bf27mr10005359oib.50.1676227110035;
        Sun, 12 Feb 2023 10:38:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j20-20020aca1714000000b0037d8c938d62sm893861oii.50.2023.02.12.10.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 10:38:29 -0800 (PST)
Message-ID: <48d2ac96-abdd-23bc-b167-08dc2c1a1dbe@roeck-us.net>
Date: Sun, 12 Feb 2023 10:38:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20230128172856.3814-1-jszhang@kernel.org>
 <20230212154333.GA3760469@roeck-us.net> <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud> <Y+kcgcncQO/2DNLo@spud> <Y+kqi8bQE+8hLfOF@spud>
 <a059a815-dcb0-c575-b5a4-f9433e268e9b@roeck-us.net> <Y+kt04c1iRlzUNLA@spud>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <Y+kt04c1iRlzUNLA@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_103831_521035_006DF087 
X-CRM114-Status: GOOD (  19.65  )
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

On 2/12/23 10:20, Conor Dooley wrote:
> On Sun, Feb 12, 2023 at 10:14:13AM -0800, Guenter Roeck wrote:
>> On 2/12/23 10:06, Conor Dooley wrote:
>>> On Sun, Feb 12, 2023 at 05:06:09PM +0000, Conor Dooley wrote:
>>>> On Sun, Feb 12, 2023 at 04:33:58PM +0000, Conor Dooley wrote:
>>>>> On Sun, Feb 12, 2023 at 03:59:59PM +0000, Conor Dooley wrote:
>>>>
>>>> So as not to lead anyone up the garden path, let me correct myself:
>>>>
>>>>> Hmm, so this appears to be us attempting to patch in alternatives where
>>>>> none actually exists - seemingly F & D.
>>>>
>>>> And of course that's not true, riscv_has_extension_likely() now uses
>>>> alternatives as of:
>>>> bdda5d554e43 ("riscv: introduce riscv_has_extension_[un]likely()")
>>>>
>>>>   From a quick look, it just happens that the only users are F & D.
>>>>
>>>
>>> Samuel pointed out that this is a lockdep splat on irc.
>>> There's a patch on the list that removes the lockdep annotation
>>> entirely:
>>> https://patchwork.kernel.org/project/linux-riscv/patch/20230202114116.3695793-1-changbin.du@huawei.com/
>>>
>>> So ye, no surprises that it was config based!
>>>
>>> Palmer posted a "better" fix for that lockdep warning a while ago:
>>> https://lore.kernel.org/all/20220322022331.32136-1-palmer@rivosinc.com/
>>>
>>> So we'd have to duplicate/reuse that for cpufeature/errata patching.
>>>
>>>
>>
>> This does not (only) happen in stop_machine().
> 
> Yah, sorry I meant that it's the same lockdep splat as is being
> addressed there.
> The first patch deletes the lockdep stuff entirely, so removes the
> splat. I was thinking that we'd need to take Palmer's (IMO better)
> patch and do the same thing for patching alternatives, but I figure we
> can just take the text_mutex itself for alternatives & not have to
> dance around the lock.
> 
> I'll go do that I suppose!

Thanks a lot for the clarification. That sounds like the backtrace
can be largely ignored. However, I still see that the patch series
results in boot hangs with the sifive_u qemu emulation, where
the log ends with "Oops - illegal instruction". Is that problem
being addressed as well ?

Thanks,
Guenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
