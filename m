Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3EDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 23:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Yo6pDNxdKwsYcWQ8l4r1w3+dQI6iWmEz3P7sHjxGiU=; b=eRZiZVdwWMi0Hp
	xumtxyJO4z7ualHd2/IoU6HjyQn13Jozggzzhpek5pci0iXV6zNDKKNVcl92Sh3gwhMUOgtaxG/2p
	8HQoYzU2vp3jBDE5K5nordnznJRMTK3REjWMtqZyJ0SyhV0+P7uBr0RZ+Nmfszl/3eIPaSh2L7zMn
	/M85vk9ahSUeAPZZYanYMUjBOLWr8pIt+2ZbFsdaDW4w83rwRP9qn4815eOB9cKA7IFyZ4gDUPvZL
	cr8eihi0p17CqmYBDZRePysBa5gcqRYOqKmZywsEPG93h+laj0Zb7HGDAoD+KdGlU7ls+BJ4phcJ9
	L1fswTb4/D/TqBTb/Y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UlJ-000hCT-DE; Thu, 22 Dec 2022 23:14:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UlF-000h8y-7Z
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 23:14:03 +0000
Received: by mail-pl1-x636.google.com with SMTP id s7so3393853plk.5
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 15:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWwB3f2OkNnXhFTZO2uwTJ1NS6ioSx9K8nJvVqaTVFo=;
        b=aUz8TVR8VcMeB707btjhc9fjgiFsEo104teaKWg212LaDO9krSuCm3KYoChwdSHbhv
         cDRXdeyqkWRPBhJaZh4X3kyMI8KGii33vsP+z3kU4wDBZlJckb4GNgwCfCPB3gJLIRHk
         /8vmn9VCXgkZOuJnb7KskV1Io6qWeY478CpgoPAx27GtmAnTg1MsH0Pms0JXoDhyk2br
         Fipq5Y5N7ykJiRDpewwwO1UcVGFRIakLnXNBSuH9MF6S+zp4luaYvta9vBkuPCFJoz2+
         putdN4LkrHMTZEfU4LLjc/5CdgRVJ2guAiUYlSVJ80fLmN0UpXr4lWUwjdMwFSqtymog
         PDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LWwB3f2OkNnXhFTZO2uwTJ1NS6ioSx9K8nJvVqaTVFo=;
        b=Y+r7a2QlW6BU2RYU6vMkFkD3euLX5tMH4AHTUn6wGYdLut0ndkpLBWK/EM1sfq1iQN
         SB7BfRcLZOtyzuDzzqiRBw6aUYUg9BlF5H5RtG09FhUhnRAOeH3rfyTClRhPfrD7xPgp
         QyfWzWyHptEpc05tboR6zny9RWCjurzK7Fyr1Ch8XBGcT3q4VeSuCgsf/zRKEQo3UnQY
         YzG1TpumnKNg42LWe9KBW8A1a1JNgRPmVdbya3L4IYfx7kGYkvpQKHSJQYtmynu+6xUS
         hEvjLWfIs2ELPkO5Pj855W/pfKsUA0JbIZuwjiCTmo9G+fOhcdKgJF0CqXaXgHJvoMEj
         bfJw==
X-Gm-Message-State: AFqh2kp3syeZNAiU6g6C0/t0Lj8itfGSyJD25PFWAKzNtc1NgSQgBf9l
	XGacymKQ8kJYAJCYlFvbX6EkOw==
X-Google-Smtp-Source: AMrXdXt/MVf4QQ9oQNyWDRcfBVOHLeMb15YW8O6IrlV/njetHvCc6NidStkITc3xQoRAH2/rQ6fpdQ==
X-Received: by 2002:a17:903:1091:b0:192:4904:afae with SMTP id u17-20020a170903109100b001924904afaemr5728226pld.24.1671750837994;
        Thu, 22 Dec 2022 15:13:57 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id n7-20020a170902e54700b00186b6a04636sm978220plf.255.2022.12.22.15.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 15:13:57 -0800 (PST)
Message-ID: <1cd24228-847f-61a1-2466-07f0cc4c221a@rivosinc.com>
Date: Thu, 22 Dec 2022 15:13:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: add base extensions to enum riscv_isa_ext_id
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux@rivosinc.com,
 Jisheng Zhang <jszhang@kernel.org>
References: <20221222224104.3449841-1-vineetg@rivosinc.com>
 <Y6TgAxg3csoQqaFr@spud>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <Y6TgAxg3csoQqaFr@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_151401_353188_201422A3 
X-CRM114-Status: GOOD (  13.33  )
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



On 12/22/22 14:53, Conor Dooley wrote:
> Hi Vineet,
>
> On Thu, Dec 22, 2022 at 02:41:04PM -0800, Vineet Gupta wrote:
>> This allows for using the enum in general to refer to any extension.
> What is the point of this patch? It's hard to understand the rationale
> without having any user, especially...

Right I'm trying to build a cpu feature enable API which required 
handling of all extensions.
Ideally yes this needs to go there. But it seemed more like a cleanup 
type patch to warrant a standalone submission.
But I guess I can wait for dust to settle.


>
>> +	RISCV_ISA_EXT_s = ('s' - 'a'),
>> +	RISCV_ISA_EXT_u = ('u' - 'a'),
> ... as it is diametrically opposed to another patchset which deletes
> this enum, with a rationale.
> https://lore.kernel.org/linux-riscv/20221204174632.3677-5-jszhang@kernel.org/
>
> +CC Jisheng.
>
> Also, please run get_maintainer.pl, there's a bunch of people touching
> this area at the moment & CCing them would be great.

Ok sure.

> Thanks,
> Conor.
>
> btw, is the rivos list intentionally on CC?

Yep.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
