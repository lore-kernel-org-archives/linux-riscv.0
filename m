Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEA0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 00:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfX1kwV7CzwlkZ9vKczg8/lnZTvWpptduw41/fLsOO0=; b=LiTtqD0ExiCkDa
	t9FNhwr/eoVzYWT3Agz/pxBh3hrmd9T/ytTOP40y7tUfRDOHmIyB9OfzDTdcQR1Cown07zyF1T46U
	9XQGxwQ5OYsSwICiIL5MA0PRpzPjsyHv5JhNlofpvcklcsuBIeelXP5iAFfdJxSLaeAYy8AUekMt1
	bWtNcZmbFKm86nyV8U/UYEuvlIZP8FLC4zDqCtqzLXLZf1w+lKbyc5VtKD6sWQaJ18EsNKyjIf5ZC
	hQO0mZdj1EJJfJ0BAJ/OLqIL0WlTgT+u1gqLJBgWSJaPmHHpexdfPnAQm4nXnj9UMRNCyib0R6e3H
	nHtMEs79Urth2/Ok3JUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8VX5-0018oN-3w; Fri, 23 Dec 2022 00:03:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8VX1-0018m3-EG
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 00:03:25 +0000
Received: by mail-pl1-x634.google.com with SMTP id jn22so3440833plb.13
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 16:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=heHkQsknG7rsIP7257jLHshZGHxMGkLPE4gJfI3iQu4=;
        b=3safF1xHFUqnqN14ZNJPPrg1zobsluqvGjwMoKuPZsxflERvZacsrAkG8TXNJSrMe4
         gg7Ii+k64JhbTkxX/TMV4bCkcTztoijhuDjPjgYi3waL/Li6lxuy77O22Djp7qtIEOta
         Mibijwat8VZksMwBcs8CcsgA7CHoKDAXW+PfKC2WazH4xqseqCeIsMvxc4WQkB21Xpx0
         aRJICf/UtKXWq55COTzYuq32Nn8hH81nQLABrac6m0b0qUkbBOQmVaZDxnEXggAe0Zxq
         i9d/6157PiGCfZVTcHg4jdSKVQkph69IuTw1hUZYmqIWBRcaeiSTw9fdiok6Hejvl/iJ
         JhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heHkQsknG7rsIP7257jLHshZGHxMGkLPE4gJfI3iQu4=;
        b=BpQeDG+g7cPUIWNv1TFrSbqbJlUKxsV8LrRvKQh7La04dqmNCji577bl5SNelpp3Kf
         4PLD91Foj9HRml8lX+3KGfLxDgTFCtKhjTXYz+0Ags1iM77aM6J8+dWmXzQOo10CCEi7
         PeoxbKxg6Yg7SUDxwLyewvynkvPJ98tlrZ1xycY9QLRB89iTjdnGiE7mpVbpt5OPqB5S
         reuhEUwgAjEhFl+DsEnhLk9Ekc21H9OMK15h26zKfE7WFwC7xP9+p69IEx1LcxWv5mQl
         EgiQLpCE/GsQw+QlXo2zv9r4WgV6+HZykRiiqK6Ux911otBEnbivWGYc8m+U+NIoF+Og
         KJjw==
X-Gm-Message-State: AFqh2kroOPV+xi5MwZJ6YCQ9K9xfePZlLinFOYmX0C1luSmUjc+afMZk
	dyYlweKLH2w84aA6a9h9UER+lw==
X-Google-Smtp-Source: AMrXdXvNRkdEbE2wHldGLvzesw+/+f0C3cJ48jPY4jcocCh09lvUxS5zpxsNojAr/y5xRK56YhUXmQ==
X-Received: by 2002:a17:902:ccc1:b0:189:5ff5:eb92 with SMTP id z1-20020a170902ccc100b001895ff5eb92mr9601784ple.39.1671753800255;
        Thu, 22 Dec 2022 16:03:20 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001868bf6a7b8sm1071869ple.146.2022.12.22.16.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 16:03:19 -0800 (PST)
Message-ID: <18228ba9-464b-d4c1-f8b9-8de1b0e6a64f@rivosinc.com>
Date: Thu, 22 Dec 2022 16:03:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: add base extensions to enum riscv_isa_ext_id
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux@rivosinc.com,
 Jisheng Zhang <jszhang@kernel.org>
References: <20221222224104.3449841-1-vineetg@rivosinc.com>
 <Y6TgAxg3csoQqaFr@spud> <1cd24228-847f-61a1-2466-07f0cc4c221a@rivosinc.com>
 <Y6TprjVBPX6CRvOm@spud>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <Y6TprjVBPX6CRvOm@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_160323_833769_C5B490FC 
X-CRM114-Status: GOOD (  12.66  )
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



On 12/22/22 15:35, Conor Dooley wrote:
> On Thu, Dec 22, 2022 at 03:13:56PM -0800, Vineet Gupta wrote:
>>
>> On 12/22/22 14:53, Conor Dooley wrote:
>>> Hi Vineet,
>>>
>>> On Thu, Dec 22, 2022 at 02:41:04PM -0800, Vineet Gupta wrote:
>>>> This allows for using the enum in general to refer to any extension.
>>> What is the point of this patch? It's hard to understand the rationale
>>> without having any user, especially...
>> Right I'm trying to build a cpu feature enable API which required handling
>> of all extensions.
> Does it matter to you if it's defines or an enum, as long as every
> extension is exposed to you via the same mechanism?

No, I just went with what v6.1 release code base had.

>
>> Ideally yes this needs to go there. But it seemed more like a cleanup type
>> patch to warrant a standalone submission.
> Meh, dw. Not expecting people to know about every patch under the sun.

No this patch doesn't require people to know what series it facilitates 
since IMO it is a trivial cleanup - fixing 2 disparate ways of defining 
extensions.
And as I said it is not urgent, specially with other changes in flight.

Thx,
-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
