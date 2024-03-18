Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B346C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 22:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rm532Wiakukc6zZoDLKz0VSD5GTFtlXQgulRHXnhGIs=; b=KGr7rad367KZK+
	IuQgtRBbcB97iIr9jz/8KMxYXaWkmtPPwyjJLlrtR2gwlt4qEIzsspW9dE952cUIINrDmUkc3xYX1
	ci4DKeeuS7tmj8AX8jq0/A3UVQewLuvs/iKJP82XzWFGMZkj4NXULauoykciEK91XLY8XkEPyIXxx
	S08WTPHtwRYcTmPv7kBLXO3hF8BeHI0yJUQuk6R3UZisolJ2oYv3CCwOwIhOksO/SuCHCoMKBStfc
	N2uyI2QfKT9qho8LH3hHpJVXTFYg1tr5NcRB8blBLtVfoqLe0C71eIAvtapCI9hQZX8KAT2Sdki5G
	3YR15P4xfsLbFdMMUwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmLl1-0000000AQgO-1wlS;
	Mon, 18 Mar 2024 22:47:03 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmLkw-0000000AQa8-1wVl
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 22:47:00 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5a470320194so2283119eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 15:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710802017; x=1711406817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Hl7mzFXoKsnD5jNzAKhdfpCR878Iekflp3ULzor2TY=;
        b=le6rdNn8flMDU8L1/J0cCcEhXL/XoEav/crifRIMreSq4VlAqj9KU3gfAAiqNMC2tV
         DYnUR6C+RengaW2UIxpb8UiSxwlakkIg/ZRm5RoZ3kHzcIN/y9CrDal/lvrp+86IX2lR
         NYeSoXM3gW162iBbQfNhIVsuRz9K5X/Vs/habogWXmDz8mcOWfU+jSnXtVWNJ1u7cdGS
         0ePwaYRTlPxjQePktFJMvKJbgyBccY3iESzvxFXU+KBfFBJMqPBtI+fCzaMZqYhwSajn
         vfNQELcpHhv+Rs6sll0+tcVvgC1cWkzXAm5OOY7/BlO+eqrWZTPdvNre/6lurCPAr0Ql
         ikJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710802017; x=1711406817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Hl7mzFXoKsnD5jNzAKhdfpCR878Iekflp3ULzor2TY=;
        b=Oy+Fjeq/K+cXHZfpNnq+2P2CtFhUg2bCUfh1nk2HZUvYp/CIPhGgINcoJDcRQa7vOb
         upKKB9GHS165VV9wjQiBuqUSahANtz2nHEMc8KVp44GA7q5pGEYH1qZSk3HL/xvOr+sT
         eXjsM9vnGpre6a+L90aYiQBqY/7Ps7ugCWZWXxlqXzw7IKk0WBZkjBAYHhj0MAwJQnR+
         1OdEmL0VWJOG1n/oJ1WSgDfkdzb4ruewstQkq4welcG2qqjCDBrAgKhl8NSbn6LAMJXl
         QH7wBQ1lqRcQbDHZL20NaabjL5R6v7FUzZ2lC6gVtLS6wfI3L8eezxVGOU9uJ79r+A2U
         T72A==
X-Forwarded-Encrypted: i=1; AJvYcCVEx1gAjXyFICWw4S+TpO07rlPc/BpFHHJSoWchmWsIwDJO4e/B3Zo/8mqrTcR/PHuGBrF9SV9Q2bbzTDSKV9ShrcvdORZEs+9swalPFYYm
X-Gm-Message-State: AOJu0YzwHfQfiRGHx+H9wdYnwTArF3KWOzmu41bj2vKuV7VZbdYTCm07
	n7bS4sZ+gP34lcRKfY+tMQXoa3w0TJQYndEh/UiUBVQfFTWpjDsRUGcZGeVOREk=
X-Google-Smtp-Source: AGHT+IHnE/sjSgzIeAoLFARhPO6yyilH56PIXsstvtejzJrYAKM5eet1GCCHHu8wfL5/gLzL4gZWhw==
X-Received: by 2002:a05:6358:726:b0:17e:b7a0:2ecd with SMTP id e38-20020a056358072600b0017eb7a02ecdmr1071084rwj.0.1710802017033;
        Mon, 18 Mar 2024 15:46:57 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::546? ([2601:647:4180:9630::546])
        by smtp.gmail.com with ESMTPSA id z13-20020aa785cd000000b006e5597994c8sm8485049pfn.5.2024.03.18.15.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 15:46:56 -0700 (PDT)
Message-ID: <2de56d8b-bc78-428b-9c09-4729b269fa41@rivosinc.com>
Date: Mon, 18 Mar 2024 15:46:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Inochi Amaoto <inochiama@outlook.com>
Cc: Conor Dooley <conor@kernel.org>, Qingfang Deng <dqfext@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>,
 Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240315-73aa13079ef83a4559869084@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240315-73aa13079ef83a4559869084@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_154658_569450_62304B3A 
X-CRM114-Status: GOOD (  29.10  )
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

On 3/15/24 01:11, Andrew Jones wrote:
> On Wed, Mar 13, 2024 at 09:31:26AM +0800, Inochi Amaoto wrote:
> ...
>> IMHO, it may be better to use a new DT property like "riscv,cpu-errata" or
>> "<vendor>,cpu-errata". It can achieve almost everything like using pseudo
>> isa. And the only cost I think is a small amount code to parse this.
>>
> 
> What's the ACPI equivalent for this new DT property? If there isn't one,
> then the cost is also to introduce something to the ACPI spec and add the
> ACPI parsing code.
> 
> I'd much rather we call specified behaviors "extensions", whether they
> are vendor-specific or RVI standard, and then treat all extensions the
> same way in hardware descriptions and Linux. It'd also be best if errata
> in extension implementations were handled by replacing the extension in
> the hardware description with a new name which is specifically for the
> behavior Linux should expect. (Just because two extensions are almost the
> same doesn't mean we should say we have one and then have some second
> mechanism to say, "well, not really, instead of that, it's this". It's
> cleaner to just remove the extension it doesn't properly implement from
> its hardware description and create a name for the behavior it does have.)
> 
> Errata in behaviors which don't have extension names (are hopefully few)
> and are where mvendorid and friends would need to be checked, but then why
> not create a pseudo extension name, as Conor suggests, so the rest of
> Linux code can manage errata the same way it manages every other behavior?
> 
> The growth rate of the ISA bitmap is worth thinking about, though, since
> we have several copies of it (at least one "all harts" bitmap, one bitmap
> for each hart, another one for each vcpu, and then there's nested virt...)
> We don't have enough extensions to worry about it now, but we can
> eventually try partitioning, using common maps for common bits, not
> storing bits which can be inferred from other bits, etc.

This is my biggest worry going forward. We already have a ever growing 
standard RVI extension list. On top of that we have genuine vendor 
extensions. IMHO, errata are bit different than extensions as there will 
be few vendor extensions in the future but many hardware erratas :)
If we start calling every hardware errata as an pseudo ISA extensions, 
we will much bigger problem maintaining it in the future.

We discussed this earlier during the Andes PMU extension series[1] as 
well. We have three types of extensions in discussions now.

1. standard RVI extensions
2. Vendor extensions
	a. Genuine vendor extension
	b. Vendor erratas which can be described as pseudo-extensions now

Keeping all these within a single ISA bitmap space seems very odd to me.
I think the feasible approach would be to partition the standard and 
vendor ISA extension space as you suggested.


For 2.b, either we can start defining pseudo extensions or adding 
vendor/arch/impid checks.

@Conor: You seems to prefer the earlier approach instead of adding the 
checks. Care to elaborate why do you think that's a better method 
compared to a simple check ?


I agree that don't have the crystal ball and may be proven wrong in the 
future (I will be definitely happy about that!). But given the diversity 
of RISC-V ecosystem, I feel that may be our sad reality.


[1] 
https://lore.kernel.org/linux-riscv/20240110073917.2398826-8-peterlin@andestech.com/

> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
