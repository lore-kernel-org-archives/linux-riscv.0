Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D355FC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npklxiNBDUEdjR4Pum+/cZj2q8TqX87h+sMW0/JWIh0=; b=FWjHRlREn0wWsf
	vcfQifBjFRH4sFSS9MRcVbcCv+T+blb5zz9v5FTbJGk7IQPcBMs0+KAqMxZikTOhzyFlIRh59VrfF
	Lrd1YduEnFqADRg/YpIOxrCeSFel4XF/iZc9hT9Ob+1YAK8oDKwHNzHDiYxgVXqkQhnEk2fynqR06
	pk2RwEjT8mrZW584BmjsyWpHjDBrzZLr9SZbB/+T2kwhAy0cngIAAVLhQ/Rl6sqOXpB4X2NAq47xe
	0x+KsTB/JIsJMPISO0kDDfIdhWVJtMNp0mb5kquIZK+137HXRUoU/u6lGbBGW6n08QTUBqwG2qo89
	BzWAk3Kx0rH/nvqGq8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDXK-005C3t-1L;
	Wed, 02 Aug 2023 15:13:18 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDXH-005C2V-0r
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:13:16 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-40fbf360a9cso21486501cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690989193; x=1691593993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVI5JsCHMJSGtKkijTAXqZDZkWTAdbsjY/9SJVukayA=;
        b=JZ4fB5monA+6WPOwYfK5G0qJoT2ZedkThiZdAj7pz3BkBhB2l6WMMhuvZC5rvZoR8i
         OfxvSkR/gztJl3V7XiRPOIbNvzOQMIs7hSi1fejXqCv5359wGZhYf21Ef3nihQxLDvQy
         Fkkt4GdRaHGxUJ1Cx5WspKVpN0X40H7hK6K1jk1H99K0j2QqmsX8bwByMbUsT+NFIYex
         qLlKbPYy/58/H0tus3vf86yspuHAAm2SIwlTvOiEMcCnc6z3Eyl8Ur9bGHA035eAmyeS
         FOLlFMMmShRE3nui3TrYEuG0SHA95BQOA6bsXUJBPIEZCof69AXqj1iBQg5+XuPLj/df
         UzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690989193; x=1691593993;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVI5JsCHMJSGtKkijTAXqZDZkWTAdbsjY/9SJVukayA=;
        b=ING4l/nfS0ZJiPeRjQlOmZjtv4RO8xq0oWCY1NdVGjHBvRRZXqDn7PlSt4TSGWwje8
         VaQSolf5DP0EeYmEh1kEJNkfeW8pZCFuf+OEW3mVjqMMMfMXaoTUkKh0+lJ/SD8sgHlk
         MDf77XH9sADcN9XZ0B33+jjzhTuvqEmMT4/GIdgSCgE1Rcn9OK/SQiyjebXRJZOp44GE
         3lW1cIHhg0L3/rl3+/kyikMiJvZAJgBKgD4iUGRwwHqLk/+FenLXWK246E7eHDtgPx81
         UsvXMbXfm9G1eUDvwO7f98viLLiIX8yxqEDh01WTKPyJygyqLx52yIF5XSVJXA0+mQ79
         oz6g==
X-Gm-Message-State: ABy/qLYl1NjmmIUmdzmsCPpd48OAgk8AzNjuxYQkoYId7ofLlzgKxV1F
	2zs1EZK6qAWHGUUWvUWvJodtRQ==
X-Google-Smtp-Source: APBJJlGYTuOuGFNZvsAG1WFY2w6e/pOV6+DxLXCtY/uhO3o+Qr3lFAv+U+eaPpvUbDTjWgJqM7N27Q==
X-Received: by 2002:ac8:5d8a:0:b0:403:e3ce:565b with SMTP id d10-20020ac85d8a000000b00403e3ce565bmr17920564qtx.4.1690989193587;
        Wed, 02 Aug 2023 08:13:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:b9cf:51fb:f73:15c5? ([2600:1700:2000:b002:b9cf:51fb:f73:15c5])
        by smtp.gmail.com with ESMTPSA id r2-20020ac87ee2000000b003ff1f891206sm5330344qtc.61.2023.08.02.08.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 08:13:13 -0700 (PDT)
Message-ID: <1e5419bc-049b-cd4b-a820-f75f57c59c6d@sifive.com>
Date: Wed, 2 Aug 2023 10:13:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dts - linux,usable-memory
Content-Language: en-US
To: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
References: <CAPm8-H43P4WrgibV2MGNFZt7ommkchAeom4m0Kt3N-CsG6D9RA@mail.gmail.com>
 <20230802-palpitate-defection-4908b4cbd142@spud>
 <CAPm8-H5d_Hp0zaYh+uX6=KhB2GHGHTkaB6tu6Q82AgR4zK-4xw@mail.gmail.com>
 <CAPm8-H6A9HoJF6B8U5WP2ucqZQrszN-avV6ETX=iPWXq4EvaoA@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAPm8-H6A9HoJF6B8U5WP2ucqZQrszN-avV6ETX=iPWXq4EvaoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_081315_334748_E00F7A40 
X-CRM114-Status: GOOD (  14.04  )
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

Hi Laurentiu,

On 2023-08-02 9:37 AM, Laurentiu-Cristian Duca wrote:
> On 8/2/23, Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> wrote:
>> On 8/2/23, Conor Dooley <conor@kernel.org> wrote:
>>> Hey,
>>>
>>> On Wed, Aug 02, 2023 at 04:51:47PM +0300, Laurentiu-Cristian Duca wrote:
>>>>   my name is laurentiu-cristian duca and i am an open-source enthusiast.
>>>> lately i have tried to use the linux,usable-memory in the dts memory
>>>> node
>>>> and linux freezes.
>>>>   if i use only reg, linux boots fine.
>>>>   does anybody used linux,usable-memory and can you show a working
>>>> example.
>>>>
>>>>   here is what i tried
>>>>         memory@80000000 {
>>>>                 device_type = "memory";
>>>>                 reg = <0x0 0x80000000 0x0 0x700000>;
>>>>                 //linux,usable-memory = <0x80000000 0x700000>;
>>>>         };
>>>
>>> What are you actually doing when you freeze? A normal boot? Kexec?
>>> What hardware is this?
>>> Are you using OpenSBI, and if so what version?
>>> What version of the kernel is this?
>>
>>   linux5.13.19 with busybox minimal rootfs, bbl (berkeley boot loader),
>> hardware fpga board with only uart and memory 8MB
>> i simulate in verilator the verilog sources and i have success if the
>> dts has reg.
>>  when it freezes, i can not see any message in simulation
> [    0.000000] Linux version 5.13.19 (laur@laurPC-100)
> (riscv32-linux-gcc.br_real (Buildroot 2021.08) 11.1.0, GNU ld (GNU
> Binutils) 2.37) #402 SMP Wed Aug 2 15:27:14 EEST 2023
> [    0.000000] OF: fdt: memory scan node memory@80000000, reg size 8,
> [    0.000000] Machine model: kise-lab,simrv
> [    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
> [    0.000000] printk: bootconsole [sbi0] enabled
> [    0.000000] printk: debug: ignoring loglevel setting.
> from here i can not see anything
> 
> 
>> if you want to, i can send you the sources
>>
>>   please tell me if the dts memory property is written correctly for
>> linux,usable-memory

It is not. The number of cells you need is given by the #address-cells and
#size-cells properties of the root node (see early_init_dt_scan_memory()). You
didn't include that part of the DTS in your example, but I am guessing the "reg"
property is correct, and it has two cells each. linux,usable-memory should look
the same. So the correct format would be:

        linux,usable-memory = <0x0 0x80000000 0x0 0x700000>;

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
