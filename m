Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D475FC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 23:37:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF3264E7B
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 23:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF3264E7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dXBM3zYI+A9OxQ9x3FeJj4h8YYLcRFbzf5fo2iwL62w=; b=i6M/E8xKbJRgMqB2sq9aNpk9b
	BmypWGy3JzRKWQmThYYziN/sKWjoOmac9h6Y5Yq/pdfRoh7JPSnyURm4QhA2fp1vrOTqf8j6rGE1r
	TyEtJjU7nK7rf7gQKFdeshwWymCdO8ewzT6tzFSYHhMyWbSk/wwKLwUWH2mjzbfP5ViwrpGVANM0f
	rTDg8QxEFsWaM9cGaIH7mhK2Wwz9lU3Gl18mkd2WEjx/jRFJb/2YxVIFIiHbS3Php71yT5XeMal1B
	lpgWB7A/OE/NxAtxsONAji+1x3s1vG2LI93Lq7Zn57PvjSKjsF5TEeNEY0RH1gtK4FTy93+83lY+6
	iAzi38d9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9G5z-0004Bm-UY; Mon, 08 Feb 2021 23:37:31 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9G5w-0004AI-Ny
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 23:37:29 +0000
Received: by mail-il1-x12f.google.com with SMTP id d6so14470956ilo.6
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 15:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nY+hAFuWBJsnXzQEIqifUogLLPLxvPaMSeX6QEiCxNQ=;
 b=bMpydch2jple90JAnLDPt4e9xcDElyuVsoWRBub4Wb2KyoLaN0cbknEe8vstquKYwZ
 tll3quu+GiWCme6ATQzz6pX5+euSATje1jv/2PNMR6MyhNhXadIUcxlaIohUEICQ+Hl6
 zgJU/rLWWWf56M8ElfVpG2o5xgSy1FuGDhZNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nY+hAFuWBJsnXzQEIqifUogLLPLxvPaMSeX6QEiCxNQ=;
 b=Ckpe3RH7g3Q4BNu9mtKf6lgRs3zGA0VP7/GfUdhefaYvDWftoiK6q/jlNS2w6zTH9B
 5yGIEK/Kek52Wt6SEueT6FyL7OL31pD6V/Z6puTLjzNR3T/P9mngUv4U/SeReE8bbPmJ
 8Nt4dr6xWHqU/PmsRwO9bC8NMEKGQZgWuZNT8S2Jge/QW5Wjm7jqwRrXz1DVrBMNOxDu
 wk+EiASChVBICiLJHrFAlUtV3YkGgXDKG6tIGgDECiasNVBDx9DCkgzSp2lYjDxiAIlT
 78FTnys5D4qkgB03G1450p5acJTDLQkafyRwyi65pFA94yLkKrHUbl+ll5ckK7nNlBwE
 2Wyw==
X-Gm-Message-State: AOAM533zue9gmj2yss3IIgRV5OuJDy5aEi1xOnajeK2DZKeIBnE48emA
 LiKZ92ScvvpNK8ah6eh05owRHg==
X-Google-Smtp-Source: ABdhPJypuK6nOerAerFaG6xS1+h27p9Sfrfd7PMiC0RbKIjb7r9OIEZSFaDZ0oGvSS2Tmrv6063gvg==
X-Received: by 2002:a92:d44b:: with SMTP id r11mr17918502ilm.159.1612827445835; 
 Mon, 08 Feb 2021 15:37:25 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id d135sm9686897iog.35.2021.02.08.15.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 15:37:25 -0800 (PST)
Subject: Re: [PATCH] selftests/vDSO: fix ABI selftest on riscv
To: Tobias Klauser <tklauser@distanz.ch>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210204145042.7345-1-tklauser@distanz.ch>
 <mhng-1ed0f9e8-84ec-4f2e-ac42-5a608726e2fe@palmerdabbelt-glaptop>
 <20210205075745.jlf3vsjkp3n3rwss@distanz.ch>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5a8923b2-0c5e-ab6c-52fd-f00bc1361a3f@linuxfoundation.org>
Date: Mon, 8 Feb 2021 16:37:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210205075745.jlf3vsjkp3n3rwss@distanz.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_183728_804249_57B6B145 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: aou@eecs.berkeley.edu, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 vincenzo.frascino@arm.com, shuah@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/5/21 12:57 AM, Tobias Klauser wrote:
> On 2021-02-05 at 08:06:37 +0100, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Thu, 04 Feb 2021 06:50:42 PST (-0800), tklauser@distanz.ch wrote:
> 
> [...]
> 
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> Thank you!
> 
>> Not sure if you want this through the RISC-V tree, so I'm leaving it out for
>> now and assuming it'll go through a kselftest tree.
> 
> Either way is fine for me.
> 

Thank you. Applied to linux-kselftest next for 5.12-rc1

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
