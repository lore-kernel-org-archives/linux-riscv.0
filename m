Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29252C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fDY7nPxZZOi8ngegUPRqxEQV7ybB/0bh6O07ReZvLOE=; b=qd3urLHXLE2Cff
	N8eioMPw0nGTE2gxCB/D4gKI+oaI324wFVgaZwe4tneWlwOlGZ2zOCIDP+AlupUWsWqrHPfVGNVmV
	t4+Uo0BFnp0u9oExHioO1d7Wqh6KvH/Zob03EEU7Tu9WE2IHUS4/M6P3CVFfQD+F9Znvp7anrqevQ
	2vA/X0kSo3EHILhgadkl0gTkrO2dWY58YCUSAQO7isfTHlK6xub1BOZWJI+u6sW9+3QlASpemUNnv
	bJ06d3EEOTdsvzKwPjTySNF6j+R2iK51nmyvFR0vqlqTbnGqswfnj9x3WFYUN86Ji0yFx4tNSst/x
	LgKyRsEbvCFzHbFpjHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMl5r-004KNX-0j;
	Mon, 08 Jan 2024 08:34:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMl5n-004KLo-31
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 08:34:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40d4a7f0c4dso18276465e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 00:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704702881; x=1705307681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GfLQg2J+OwD4mK8aB87IakjXF3Kgfssqm9r5be44QF4=;
        b=IZAca7cJiOq7ZCAWCLosQ1JCoJYxcOSjfqFsyqeDQgf6NyYEKbVg2u06xbISirIK/T
         /PS0FymA8VbGlX2EOlFQbQGilNzwDK20g8CKCAgavQ6jm1exm4jJ7J35jYKJsNRM94+F
         54JqutalfSwB82jlS/7Lsc6Y0LeSf3qUvSD68wmU1HQltiLxmZmCyqoc4vL7fF4ch/s7
         03x2Vz/SJ8g96ro5PCpTL7vEiQMJRDX/7u/UdNKoeCv0Zfe0m0tCHJK8aG7Bj4723orB
         7Bhe0cYgpDx3pDqLJcrAQQVsdsSSEA63NL0JvC3qefVixDTXG6JfJ9qPRoqY4S8TwGMs
         qz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704702881; x=1705307681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfLQg2J+OwD4mK8aB87IakjXF3Kgfssqm9r5be44QF4=;
        b=chCEicrz5dDWI3PXRMASVLjYwdQicjl/JfR/Oaim9rf4WgDD/EhS5Ik9qXvHEcjYwL
         1Ofkk4uIFc/kNPGwN4/pLLeTMmPLdG2iuF1oBaNuiBohlVKCo5zOtfofsSSsXSUnzkUK
         bZXXtyEMJI91l6aSDNVTb2AJio/f8vCVX2Fys9G/YnBEFHhq+lAE7eyo7fSjwPCj/8Q+
         VymlC5hSZGncoF379c4j9qsbw90HIsAoZsDpllri3xKjwxsdCDs1vz/aRBv4Kmx6W+Gv
         2JgmS97Wln9HKtvxlRmoXZZmRU3+MDs++mTdXKHpXeJKCu4dl3G2BuDu1TEkVLmrvNHI
         tnug==
X-Gm-Message-State: AOJu0YwsTsg+h0+UHFLzFcQl+zHxKAcUD7yHZknnv7pF7KDe0+/FCukK
	iBh75wd5xrCMFbNSOGp5m3cRMV7zbah28w==
X-Google-Smtp-Source: AGHT+IG/mp6y+0cYUrDCavig/3hnnulb4tFtsRjSF6zEM6NAi6nWZTX4f7mAdVBvGKSLQG0+ZSf0JA==
X-Received: by 2002:a05:600c:3ac6:b0:40e:4785:276f with SMTP id d6-20020a05600c3ac600b0040e4785276fmr507460wms.100.1704702881399;
        Mon, 08 Jan 2024 00:34:41 -0800 (PST)
Received: from [172.20.10.3] ([37.161.21.69])
        by smtp.gmail.com with ESMTPSA id fc7-20020a05600c524700b0040d7b340e07sm10122595wmb.45.2024.01.08.00.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 00:34:40 -0800 (PST)
Message-ID: <6fd9dcfa-b412-4573-a2c7-e4ded89bb225@suse.com>
Date: Mon, 8 Jan 2024 09:34:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/36] Remove UCLINUX from LTP
To: Rob Landley <rob@landley.net>, Cyril Hrubis <chrubis@suse.cz>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it,
 Li Wang <liwang@redhat.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Christophe Lyon <christophe.lyon@linaro.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
References: <20240103015240.1065284-1-pvorel@suse.cz>
 <CAMuHMdXGwyS-CL0vLdUP4Z4YEYhmcmDyC3YdGCnS=jFkqASqvw@mail.gmail.com>
 <20240103114957.GD1073466@pevik>
 <CAMuHMdX0s0gLRoPtjJmDnSmZ_MNY590dN+JxM1HKAL1g_bjX+w@mail.gmail.com>
 <ZZVOhlGPg5KRyS-F@yuki> <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
Content-Language: en-US
From: Andrea Cervesato <andrea.cervesato@suse.com>
In-Reply-To: <5a1f1ff3-8a61-67cf-59a9-ce498738d912@landley.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_003443_973117_388B2498 
X-CRM114-Status: GOOD (  11.77  )
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

Hi!

My 2 cents. I'm working on refactoring growfiles test which uses UCLINUX 
flag.
During its development I had occasion to check UCLINUX support and 
(indeed) it seems pretty
broken for LTP, because nobody is maintaining it for a while and such 
tests use old API that will
be replaced in any case sooner or later. I agree with other people about 
removing it, unless there's
a valid reason to keep it.
Just in case we want to keep it, someone should take care about UCLINUX 
support, testing LTP releases for it as well, but it doesn't seem like 
something we can do inside the LTP devs team due to the lack of resources.

Regards,
Andrea

On 1/5/24 04:52, Rob Landley wrote:
> On 1/3/24 06:09, Cyril Hrubis wrote:
>> Hi!
>>> I am not sure I agree with this series.
>>> Removing support for UCLINUX from LTP is almost a guarantee for
>>> not noticing when more breakage is introduced.
>>>
>>> How exactly is UCLINUX broken in LTP?
>> As far as we know noone is using it and nobody is maintaing it for a
>> decade,
> Nobody is maintaining "uclinux" because that was a distro, but you can build
> nommu support in buildroot and such, and people do.
>
> Rob



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
