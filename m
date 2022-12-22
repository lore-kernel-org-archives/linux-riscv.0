Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8048CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJjIH+jcvx5EIZ9aHuc19jfyMHjAOJLpHzYtRHejDU8=; b=KbQ3b3ticjNE9N
	i57TZGKYS/CPK8o2WbxSLxLJ7ngvBo+v9NGglxTULXUN2efrk9O9G8Yq7QwLuS5D7YC1V+XKiwTgJ
	L1Sa3PXw3/c4JuSW2UWecikKr489JDrmR5uNxEUIudrvW1MElWWBoAruFF+tlxiOP3SQtMVclJId/
	OH2NlF/M+4rzupdzo6vdf34hw4sv3yGfahe2StnBCltVWQ8sUh4E8KWbJQK+qpXkMwG3SmDor6Bj/
	V7sa14vyQkNWB0LdOb8NQyi1BEkubTKMIlDnBzJUCm3Q5DEn2hrGFQSu6fRoj350pGtrOFD2JWKDU
	iYzY8ohqGHUBaRYTLG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RCd-00FtVF-GS; Thu, 22 Dec 2022 19:26:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8RC7-00FtFU-Qb
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 19:25:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id t18so1868982pfq.13
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 11:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yB1NUsw2OOJ4s3GRJv7W/3p4cooq8aSsPXXdqNZx6es=;
        b=1dmu3WGoywCgc5sYxKABgoHOXmBMuPHQahfpt9Fljbpx4HgGDNdC3hGqKGyjRaphUg
         3AnBcrTOhQvHOvLzbhbja2QdkWMwutzxqB7p0WaUxQwgiLF1onfoqA+pjIdDeFMED/+O
         /iVl2BSWR1yyFm8LyOX2VGRlOio+c+80o8fZcZdskwwW+8w1JJNRDjJHI1lnLKbiC5tz
         ymEajIK3HnTkNizq3odPVZG/esGVStDCH+EJ/h0qoMZ9pBYIv0lM35OPT9GFui+rbb68
         l99/0EkdEDL+bRQTWdfOIm1CS/H6lei0k5MRGWHGXd62xjHRSoWemBtm+hPqH0lOFFxK
         JfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yB1NUsw2OOJ4s3GRJv7W/3p4cooq8aSsPXXdqNZx6es=;
        b=gj1xxTKp3aEYWSr5cPzJuv0kLjljy7iDgviVJb0OH3RSlDccXIyL4t2VMuigRn1g1l
         eb3tCv46y7VDFT683XZA/i+HkvZJxVJ8mNQPGmtPwJOHzSq/YQr+6DfF0Wsi4jeag5yc
         wYVC8wRoK/Ve8jAi3EjMkiNg5uuDko/1UZ7KnH6c733NzLnu2F3raWa80AztcZBwKgR3
         he/yxv2PNesVynmw8rfF9nKoJOy18lOYKvW3x86GbfnR7aptXqfy3CAR7Uf0Ldx/feF3
         OFWkZFKzl98IWxxG1e+p0WWjA4GJFsFPOWuF/YXGqoI3EC7cG/QZLbhDc2gF4BtLFtGR
         cq9w==
X-Gm-Message-State: AFqh2kr2n+oXOSFeFt6p5FENog4ZcSJSt5kWvBna4eNtAG+Qho/LTIrK
	ScByZlBBpy5EAGss+31avRModw==
X-Google-Smtp-Source: AMrXdXtX5V7Oq9wn6JDLeEAucZK85QgVp0t+7h4EAEv5jPpf6Gn5QiD+MfydfVUOvj89yq52ZIcU+A==
X-Received: by 2002:aa7:9631:0:b0:57a:9a7f:7896 with SMTP id r17-20020aa79631000000b0057a9a7f7896mr22083241pfg.28.1671737129334;
        Thu, 22 Dec 2022 11:25:29 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id w192-20020a6282c9000000b00575448ab0e9sm1048356pfd.123.2022.12.22.11.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 11:25:28 -0800 (PST)
Message-ID: <fa18d2a8-92bd-8e01-fce2-d5af9455558e@rivosinc.com>
Date: Thu, 22 Dec 2022 11:25:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@libc.org>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <CABvJ_xg--0Gia9Za9endcz5kaqfDugrcdpkg-f1u=2mt7AE2cA@mail.gmail.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CABvJ_xg--0Gia9Za9endcz5kaqfDugrcdpkg-f1u=2mt7AE2cA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_112532_116168_A4EEBAE3 
X-CRM114-Status: GOOD (  20.07  )
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


On 12/21/22 19:37, Vincent Chen wrote:
> On Thu, Dec 22, 2022 at 3:52 AM Vineet Gupta <vineetg@rivosinc.com> wrote:
>>
>>
>> On 12/21/22 11:45, Vineet Gupta wrote:
>>> 4. Kernel with RVV support + user program using original Glibc sigcontext
>>> In this case, the kernel needs to save vector registers context to
>>> memory. The user program may encounter memory issues if the user space
>>> does not reserve enough memory size for the kernel to create the
>>> sigcontext. However, we can't seem to avoid this case since there is
>>> no flexible memory area in struct sigcontext for future expansion.
>> This is not an issue, if we don't change sigcontext (in kernel and
>> glibc) - it is essentially the case of existing binaries.
>> kernel still saves regs on user stack, in rt_sigframe, its just that
>> userspace is not able to access them in SA_SIGINFO signal handers.
>> aarch64 have this implemented this approach and it is likely they can't
>> do that either for SVE regs.
> Sorry, I don't clearly describe the case. As you mentioned, the kernel
> will save the vector registers to the user stack or user-specified
> memory region by struct rt_sigframe in your patch. But, if there is an
> existing binary compiled with the original sigcontext.h, it will
> assume that the kernel only occupies the sizeof(struct sigcontext) to
> save these registers. It will not aware the RVV extension is supported
> and not expect that the kernel with RVV support needs an extra huge
> memory region on its stack or specified memory region to save vector
> registers context. In this case, the user program will encounter
> memory corruption issues if the size of the memory region specified by
> the user program is not enough to store these vector registers'
> context.

No, it will not. In this scheme struct sigcontext remains same as 
before. Kernel is copying the RVV context not in sigcontext, but beyond 
the canonical sigcontext, in layout specified in the rt_sigframe. Please 
take a look at my patch again. It works.

Again I don't care what scheme we follow, I just want o make forward 
progress.

-Vineet


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
