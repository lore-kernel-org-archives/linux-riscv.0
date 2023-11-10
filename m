Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30769C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLFE4g86b3UBNE3mDUHXaO0sNA43Z2F9DuXzynXLMj0=; b=mNLBlBHdTYpuPv
	8bfHWZuTQ4nZPn+Hd66DKugnMnrrVzSMH1ctvD3vgt0xXgEbQTzib8RrcWdNpdkzyoY12uhPjvQlp
	ZPjXAZffXnyxoRbCT9q2qlvEgpfBGcssot1czDRUDv+iTQUiwJI01dLhR6oUMtR52atFc72PhZqZR
	tox/pHl14lWljkokfDlse8pqWoAlowWZmVavrb7lkeCox/UZ64/IVu8mIMqOPhgGmsJGDBPVfDFCJ
	DIa0ILnPsIc+kkAWqCUnCpixD5dVh9CCU7Jp0s1nfMKJF3E7KuHUpE5aI3dfpOdc9k3v388wyVkMK
	pAW9A2IZpzRaqumulR0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1VUt-00991v-0C;
	Fri, 10 Nov 2023 17:40:47 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1VUq-00991X-10
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 17:40:45 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3b5714439b3so1220045b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 09:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699638043; x=1700242843; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrebI6zohBxl5u8DkEUaInQTNbtoP68hU5Hdc32f034=;
        b=TxfNI5fBp8wEEuwrAcyR6Si8qGHdDnfZUuFt56T6mFp11UQ/x29bBafdGG2e0AZmC9
         f24ZNJemuDSpHGgJpMM6CVSbUbfgcw0zs+oteXgpLoKKZhU7P9x08DgjfLp6WSNlOmDY
         84xQyAdtHy03i+SUKzjvc+WR7XSaPelqf67tlAAmwsCaF/mOkfpvZrPujD5LqB9VcBfN
         zbpOOiwlu7VLBFQGyedTNYmV7LdX1YrqQY6HiwQtQBd3yN0To9aonFVYbzk6JBmHJSDj
         HTK3YZMB3irrEYkALrYqxLpbe2llgY/uRHbkqOruI3N1fd2yebwG3M4BLav+UK2ZGEua
         qVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699638043; x=1700242843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrebI6zohBxl5u8DkEUaInQTNbtoP68hU5Hdc32f034=;
        b=pL4lVUZjilTZim1DHK56v1G7nZ/y0LMCxDJLQsgpFc+Y74V/AOfM94XQyRz5iA8fq0
         wwqHzoiT5810OhVVguEYSZvxHBRlCosNiJAZLkIAFMLUpcu5N3SqIBZiC3vIIVOJw/YG
         acPXM9hjeghw0lSQiNPjHAIxQoJP3pW6WBwvavKMNp2nQspK8q3cN7kY/T6kTvPxWyt1
         6PuRlho714MivWLXF5fWgEbIc2Bsk+SJACvBkOZ65nKXvJbSJCShiNgsEmw2gv1jDPX/
         Gz0z182wumJJax7S5lzBGTrR1rvLpY/zTOHZu786MiVKWEMDsCg5Jqotbw0VQ4bSllxj
         dYYw==
X-Gm-Message-State: AOJu0YwBmWf12iYxZxpbRZgTE0Z6Y443FMCm5rsHWTZh4w+6qL1bRtFd
	D1VpDQz9e45QcJZN1P7wLb2Svw==
X-Google-Smtp-Source: AGHT+IGNxgT+7VupBwkRr5oBAnlu+Zh6h+oQMEsGdkGOqCFbsuH/3JoVKmwlTt0Ssgz7Vrft8Iobxg==
X-Received: by 2002:a05:6808:64f:b0:3b2:e2d5:bcec with SMTP id z15-20020a056808064f00b003b2e2d5bcecmr5156961oih.47.1699638042906;
        Fri, 10 Nov 2023 09:40:42 -0800 (PST)
Received: from [10.46.15.71] ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id c10-20020a655a8a000000b005b6c1972c99sm6015061pgt.7.2023.11.10.09.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 09:40:42 -0800 (PST)
Message-ID: <a37be8f7-64a4-4cec-8692-28ad92a02b00@sifive.com>
Date: Fri, 10 Nov 2023 09:40:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clocksource: Add JH7110 timer driver
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Walker Chen <walker.chen@starfivetech.com>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>
References: <20231019053501.46899-1-xingyu.wu@starfivetech.com>
 <20231019053501.46899-3-xingyu.wu@starfivetech.com>
 <3f76f965-7c7b-109e-2ee0-3033e332e84b@linaro.org>
 <bb819333-52d3-49fc-9bb9-1a227bd5ca8f@starfivetech.com>
 <d0e70434-e273-4799-c5ec-bbee1b3f5cc7@linaro.org>
 <540136d4-6f8f-49a6-80ff-cc621f2f462b@starfivetech.com>
 <65c38717-3e0c-46d3-a124-29cae48f1a2e@linaro.org>
 <72ad5029-42b2-481a-887f-8f6079d8859b@starfivetech.com>
 <a8f0011c-5689-4071-b5e0-90bd6b7c66bc@linaro.org>
 <b402eb4d-a770-4988-8274-8a2544362229@starfivetech.com>
 <1dd3d765-c583-4db9-a0aa-303bfcf871db@linaro.org>
 <7c2e9b70-201c-45f8-9871-a823cc2ded16@starfivetech.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <7c2e9b70-201c-45f8-9871-a823cc2ded16@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_094044_376332_2B2AC1EE 
X-CRM114-Status: GOOD (  22.20  )
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

On 2023-11-08 11:51 PM, Xingyu Wu wrote:
> On 2023/11/8 17:10, Daniel Lezcano wrote:
>> On 08/11/2023 04:45, Xingyu Wu wrote:
>>> On 2023/11/2 22:29, Daniel Lezcano wrote:
>> 
>> [ ... ]
>> 
>>> Thanks. The riscv-timer has a clocksource with a higher rating but a 
>>> clockevent with lower rating[1] than jh7110-timer. I tested the 
>>> jh7110-timer as clockevent and flagged as one shot, which could do some
>>> of the works instead of riscv-timer. And the current_clockevent changed
>>> to jh7110-timer.
>>> 
>>> Because the jh7110-timer works as clocksource with lower rating and only
>>> will be used as global timer at CPU idle time. Is it necessary to be
>>> registered as clocksource? If not, should it just be registered as
>>> clockevent?
>> 
>> Yes, you can register the clockevent without the clocksource.
>> 
>> You mentioned the JH7110 has a better rating than the CPU architected
>> timers. The rating is there to "choose" the best timer, so it is up to the
>> author of the driver check against which timers it compares on the
>> platform.
>> 
>> Usually, CPU timers are the best.
>> 
>> It is surprising the timer-riscv has a so low rating. You may double check
>> if jh7110 is really better. If it is the case, then implementing a
>> clockevent per cpu would make more sense, otherwise one clockevent as a
>> global timer is enough.

The timer-riscv clockevent has a low rating because it requires a call to
firmware to set the timer, as well as a trap to firmware to handle the
interrupt, which both add overhead. Implementations which support the Sstc
extension[1] do not require firmware assistance to implement the clockevent, so
in that case we register the clockevent with a higher rating.

[1]: https://github.com/riscv/riscv-time-compare

>> Unused clocksource, clockevents should be stopped in case the firmware let
>> them in a undetermined state.
> 
> The interrupts of jh7110-timer each channel are global interrupts like
> SPI(Shared Peripheral Interrupt) not PPI (Private Peripheral Interrupt). They
> are up to PLIC to select which core to respond to. So it is hard to implement
> a clockevent per cpu core. I tested this with request_percpu_irq() and it
> failed.

You cannot use request_percpu_irq(), but the driver should be able to set the
affinity of each IRQ to a separate CPU.

Regards,
Samuel

> I think it is enough to implement a clockevent as a global timer. Thank you
> for your advice.
> 
> Best regards, Xingyu Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
