Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96CEE784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uyu0dEHA3FpYGP1XXx0ZRRXdlQ7FzdobhUUkcM9NYVk=; b=UW4EFvshxBxK39
	nV9uXSczd20JFyr5GXiOqczM0PUD/S/SqZgvOv6dVT+bPg5SzAmpMlpQeNwjhPcVxFSxCvO5bHekZ
	QFA8MOBRENTpwYiGWSHP1VHVMoF834gqiocCRUiI9RXJckH4q2j1Vl9ELdsAIjfNimpwHMNO342Qt
	0e4w35yxDtC0TFci3XoOW15uQzNv4IUmbhrUQ7cZO5L05hc5Px6K36Klxkk+/Dl/YN3LV5SODG1Kj
	EMc/kD/FS/7zlR0xgdiMvhp6Hr5B7QJ1QNEyQ00tZkBnaayaOXzXWKsWpSFB1i5MKWe92VVP3vqHq
	GgisPeTtaaHCg/z+6DMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Wj-0000000377c-3IYH;
	Sun, 28 Dec 2025 23:50:21 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va0Wh-0000000377F-0kt7
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 23:50:20 +0000
Received: by mail-qk1-x744.google.com with SMTP id af79cd13be357-8b2148ca40eso1377565485a.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 15:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766965818; x=1767570618; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpN54oVgQguU3p5JgPy3uhgmnh+wgxqdR+Icp20pf+8=;
        b=pnycaIHJCYB3e1zn1tWX8JibhJPFlNBHcYf7yoY7Lb45LTU3esCCiQNsNjKuLEWvUY
         JIMwpW4lDq4a9ZPUh1WVqiW/3ZfpmLYnWI9XD5j5HVmdPizERuMaSXHMeYmEMvzk7+ce
         hDUHbTQQwPu39jBEFf7wAdfDRXRzHRwiHIiPD1uIdGTyjAMYpxbSEUF1q/7G11nodeG9
         vp+3v7MM7b5Q8j3JdZaQy2ik/4nyAZePBE9H4D6rHJRu8dv/Jq1BQTHrFKJHF3TC8s2+
         el/xCdk0yI1L87tIQxwgZydmtWxNJ2dhIrYo8Q08AW+i/hiOA6adQHPIa4Y07yKVZ/gX
         3EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766965818; x=1767570618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpN54oVgQguU3p5JgPy3uhgmnh+wgxqdR+Icp20pf+8=;
        b=G6TrWIzsoKB9CEG3MbBHy4mCH0ksAZZU5+yblI7gap4k9gAZ/W45BH199HOR2VpCm4
         UUMXI5aijUzt1IIeQM5h3kHieYzjHa+A8lCetQ10muAnyibl5n2I/RaprUwC3PzYVXDQ
         Aridp9oCxIlchOwH+PgHD/CW6aEbb+zMUWPYXrQ5K1Nte8GTwlhX9ojkgZg0kG5uXnlb
         SuhbpCDtLMCEQTL5/4YZBwlatwlUa60LJ4N75lwYPLXzgaX2dNoNUa38OPDKy1aIU0/a
         hFQQCn2ggTwgPK5nUFAyjvh12sdJxkxsuxbBgzdtphV/Aplt7EvXpS8RVxZP4/dOJ/M7
         4z0w==
X-Forwarded-Encrypted: i=1; AJvYcCWgTOlZ+rNdg5RkxbbmzcTGT2QXSu94BZUu2wZRf36FG1dE2B5lSnkstcVmWBj95Syf+PVibiF4AVclhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5I557rOmdMSrhc0LuWcNllhb9z2Zq6TRuC9fU4NLhr2nwLThz
	Uz0dbTVLI4cyqEH7YvKHBwsxyyS+tTGahFR7TFH3jIMR5tE0s8jENZYbQSt2Cdhq1yE=
X-Gm-Gg: AY/fxX6PXSXb6LhwgCatofuB0vGoFbOvlwwiSoagcUbm6o7aEaG4/Y2YTrqi3vuMBv6
	Zyv7poR1bDvtn84HQfQWnCOZII4xGyAL3c9LDRlSpykRhmwA+1o/GsgckzeA9aKU719UTqcLOwx
	7skgfPqLjXP3oaHaLZ8dT4v69q66zEL3d2hAzCjXWFhswZPNLCGfSU8r8dZtIpUO+wPh7jmnXMF
	OLtD8SaclW6hlKTUmfcLIBWjf8t4x8D6pYQs7jUvWbd0vIdZ9Vi+hSZiki3J8JbQ+Bp0OZgY9Cb
	oWJOKFL4Uxar9oREsQXt/ujgX9/8DDRRboQ1i3pRad/InBPRchw0Wrq+oX/OWXXYCrQy5i6STJ5
	ZO1ytB74RVVJnQDzQayio07us0UvCreFfGZpXojDk/SGJVDpp4ZqNaNjRV8SyvhxeFZGZKXTJNZ
	SYLOCAkB76SqJjpYQEWDR2xdu7jkr1ns3AUsCQDPbwT8Z9uf4b8O4=
X-Google-Smtp-Source: AGHT+IEGbKgRTG08k8rXERBJismFkK/tDgJdZx5wXocvbU/vsRR/qDK2KUySLLUQVB2beTsVWlcMDw==
X-Received: by 2002:a05:620a:29c7:b0:809:eb12:1ea0 with SMTP id af79cd13be357-8c08fd18b81mr4252356785a.81.1766965817857;
        Sun, 28 Dec 2025 15:50:17 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm2406423185a.45.2025.12.28.15.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:50:17 -0800 (PST)
Message-ID: <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
Date: Sun, 28 Dec 2025 17:50:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
 <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_155019_234939_050176BE 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

On 12/27/25 8:51 PM, Guodong Xu wrote:
>> That's what I understand it to mean, anyway.
>>     https://github.com/riscv/riscv-b
>>
>> There's no point in supporting "b" in devicetree to represent
>> the others if it also requires the others to be present.
>>
>> I think that, instead, "b", "zba", "zbb", and "zbs" should all
>> be allowed.
>>
>> I might even go further and harden the requirement, saying that
>> if you specify "b" you should*not* specify "zba", "zbb", or "zbs".
> Historical reasons here. "b" came too late. The chip vendors have published
> cores with "zba", "zbb", and "zbs"already.
> 
> That's a migration bridge to require "b" must be listed
> together with the other three.

Are you saying "b" has already been included with "zba", "zbb", and
"zbs" in an existing DTS file?

What I'm suggesting is that (unless someone has already done this in
a DTS file), there is no reason to require "b" *and* the other three.
You should allow either "b" *or* all of the other three, not both.
That would support older platforms as well as newer ones that use
the more concise "b" only.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
