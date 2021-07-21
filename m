Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE621C636C8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 00:26:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F89261019
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 00:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F89261019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AHBey7AEcC6FqR+X2RH5SBFIfDtkgS+xhHkkte0MCFE=; b=07R0nLE1+dcOaW7H8ZYu4BatpK
	4NMP7Lc2XyLY6lxlAvoeXvdC3ZLNoN4Z9pk8SworcZ5et3LiQzzy0fvDzviALdsRXh0Po8PlsLpKH
	3MdDje+GFvtcZJgKjwKjLf8XQomynNQJGb7HawnzrMkf18WzhJTwJaeZU9P72Tzj8RZgzgczfvfRj
	NBuoa81h7QcHEUhKfMgcoeXJ0I99K5QitGN/D4iVEtVsUKCKdpkrh1cL93oU9OMFAFV6c4WihfXWo
	IK+y9usJFu+s10XNo++R0Xr0VMfFdfUWKRf7jgin9Rzwm9BJJuJqTc94qplOydAcxHChA8ryFp1uY
	/1CCEUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m604F-00EBPl-Hd; Wed, 21 Jul 2021 00:26:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m604C-00EBOv-BO
 for linux-riscv@lists.infradead.org; Wed, 21 Jul 2021 00:26:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id j4so301424pgk.5
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 17:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HU58CogAQohVW71EtvAZO3RqmIQLLJsZMVI5o5yTkQY=;
 b=HqJmMupj199pureG1HeFCEVJyoCvVJ0xgDo4FnGZ72A8lhWenOCc++0epX3DZp/3fd
 VLX0sJwBAhNlemiPWGmeNDlS2b3E2hnb4ezkmfkrbuVCMe5iMuL5wvmiAfYee0QnApnB
 IM/OYXbjwWQOKGn2HGeTdLEfbcfAzU6NTP/6tiGjzH7kA65PtTCXZEuFMUbtBh7L0/bV
 lkP+qq+RDICUu3SMUx13ZyCLOzkZVN5VOE6VU0vg6KWyO0madIWv5ndXIvmo54I1qqm9
 EXBbI4nYH6Ce+bqomqfLvOiGzwPjzGS4UB1D5Kw3kJDimy6fZW+S6MgFJUNt2d1nMdWX
 Nvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HU58CogAQohVW71EtvAZO3RqmIQLLJsZMVI5o5yTkQY=;
 b=cYeGTw/Aw/enNS6t5PGqn4yIrBly32JG6ypoMcArdpsYRBeDGAgNAkYirhZ1crZXLy
 Bi8iXPV5ipyV/FZ9imcAxXOKroRAc1rbXOmfILqPkZXroLYhlX8W9bg6R3K+u6zFT5l0
 Nb7b36CJbh1A4VctR9HzWxXt0a6uHa0kJFWBxRuoCwgwYqrbXT5+vc14gwEPHpFSxwln
 fTcNuj8S3Rq8ftSm6eYRtC0aKgAVXuiPxHDpwLjyG0oNWFr/llOVBybg3GNfESLFE0bx
 OphedjqUhzFZMDfSFpdPJo5KEHc4LNnB+rUoesJBPTXSU5oDIreLdKJl1/WPuVKqZkzK
 /DVA==
X-Gm-Message-State: AOAM531M5FPedEMel++ZCIigiZwxr/4ts+imAzP0K7tmxFoFo0DyUiCS
 4LaP7TBzrlOqKXRUcbL8adahByXQ4OA=
X-Google-Smtp-Source: ABdhPJy+fVaJakwcWcHs5y2nAtieI+LqPS/s8YSALTVQdoR4MaYNKm8SVd6u7bEE91H6qoNf2FKz0g==
X-Received: by 2002:aa7:80d9:0:b029:2ed:49fa:6dc5 with SMTP id
 a25-20020aa780d90000b02902ed49fa6dc5mr33776132pfn.3.1626827186583; 
 Tue, 20 Jul 2021 17:26:26 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id p24sm28390770pgl.68.2021.07.20.17.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 17:26:26 -0700 (PDT)
Subject: Re: Linux 5.14-rc2
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
References: <CAHk-=wjYghA5O+ZsWKVNApMK3j4V1EibO5P+c4MrHnqp8YhY=g@mail.gmail.com>
 <20210719140437.GA2178213@roeck-us.net>
 <CAHk-=wivYZGxR4oumBk_rTAstRx=WWpwBAgS7n3M5ydbd0rTzQ@mail.gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <06a1a5fa-3d3e-8037-ee6c-74acc16a0df3@gmail.com>
Date: Wed, 21 Jul 2021 09:26:23 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wivYZGxR4oumBk_rTAstRx=WWpwBAgS7n3M5ydbd0rTzQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_172628_452693_262CF907 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/21/2021 2:24 AM, Linus Torvalds wrote:
> Don't know if you guys saw these mainline -rc reports:
> 
>   https://lore.kernel.org/lkml/2c03b355-86dd-1fa6-dbaf-5857f4a45a66@roeck-us.net/
>   https://lore.kernel.org/lkml/20210719140437.GA2178213@roeck-us.net/
> 
> On Mon, Jul 19, 2021 at 7:05 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Failed builds:
>>         riscv32:allmodconfig
>>         riscv:allmodconfig
>>
>> No major change here, except that arcv2 images now build.
>> For reference, the riscv build problem is:
>>
>> cc1: error: '4496' is not a valid offset in '-mstack-protector-guard-offset='
> 
> and from the -rc1 one from Guenter:
> 
>> The riscv:allmodconfig build failure is not new. It is seen if both
>> STACKPROTECTOR_PER_TASK and GCC_PLUGIN_RANDSTRUCT are enabled.
>> See
>> https://patchwork.kernel.org/project/linux-riscv/patch/20210706162621.940924-1-linux@roeck-us.net/
>> for details and a proposed fix.
>>
>> riscv32 images fail to boot due to commit ca6eaaa210de ("riscv:
>> __asm_copy_to-from_user: Optimize unaligned memory access and pipeline
>> stall"). I reported this a couple of days ago, but have not seen a reply.
> 
> it would be nice to have these basic tests all passing again.

I have sent the fixes yesterday in my time.

https://lists.infradead.org/pipermail/linux-riscv/2021-July/007621.html

Guenter and Geert have confirmed the fix.

https://lists.infradead.org/pipermail/linux-riscv/2021-July/007634.html
https://lists.infradead.org/pipermail/linux-riscv/2021-July/007626.html

Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
