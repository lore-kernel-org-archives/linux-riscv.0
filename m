Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D323C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 28 May 2022 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcUV3e3ihN6yHtGzs85ox58kW3s1zfKR71Aezf25TPA=; b=Ne+DJfAAVSuR4F
	c1Z18mfx6CBtbIuws25/BUc1z5kLFkQwMCLDRaOAh9lNgNQXifWwggagGA8PIuGukbXwTINLfDZvO
	OvY+AMUAdBSndVGUENZ6OhmsTu9uenHvoy5WW4tiF+4fuuWXTBfsaBioC3E2bkb906PmeCiYM4UHS
	ec/C8XxlgB8DAMramIjA4ya9E+YQLVwXvehsDoTtowlD/aYvKw5kUYXg/9A2tpGcegpriRWu27ZNA
	dBOHkvOewLN8fJsXi/8PREGVTGO5EqCZAmp2OkDI0pDEnF2SnzNQLFygPiJ6LfJlXUMW921cPiHgN
	+2sBmYpEOEJGMViRPjYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusiT-001pux-63; Sat, 28 May 2022 09:26:37 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusiQ-001puB-Ab
	for linux-riscv@lists.infradead.org; Sat, 28 May 2022 09:26:35 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B4B393FBEF
	for <linux-riscv@lists.infradead.org>; Sat, 28 May 2022 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653729991;
	bh=51HZ/ZF/DBZUi+hYAZR96Rw1JBH9NEA5/WPL/bsRkcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=PjRpaU37gizYPwysg6ZSC1IqCUDHQYN0F2kj6DgY+j73+SaykqM6mgVCdWuByQs+5
	 ptFYa1JPHQbvy+v+PvGJT3w/AbJOzjxALha+WHtdwjY8wkXqnv/++oKIY/xLA2Sawk
	 ma7kPiHQLAzstktNCuzPQwivLGL3x0q3WM3wC53za1p7fhjXQteSjSM97gvVP15LUz
	 3/LE+JgoyeFrrZt5HYbbbCf1Jhmd6sw+qTLe/M23u1PJwTssJdcE+1LpusbRul/Mon
	 gzkyGyXZyp2RCmZ3DJSHn0VuAb2YNzwQ7hWQk6FEaj0av8zLI13Vg537oqtWR6XiJ1
	 zQLqc/Q4cDfOQ==
Received: by mail-ed1-f69.google.com with SMTP id v22-20020a056402185600b0042d5f95eb4aso2002447edy.13
        for <linux-riscv@lists.infradead.org>; Sat, 28 May 2022 02:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=51HZ/ZF/DBZUi+hYAZR96Rw1JBH9NEA5/WPL/bsRkcs=;
        b=lPIqdXUZeeUHQ0PZjqp6kL/6Lq0RxO3zdIKgDlgtKiWQWzpVi5eV/cXL3r4mtPxY9U
         HoMeMj9DERFP2ME6yZmZr7KErPNISzhGB3/ovOYFrRO/3QIp45/qpJpO9I+otlY4cZho
         +8OzPrKbD9s9u/9TvVmbJALJbuVPUR3uInoUVg4bsv8fcipwwdO7bipfOxqzEed2cZC5
         OY9A/RQsnsZJ3fwU3uqKOGOwOmcsUjNsDlA/nRUhTaqdd04GOkmEO8oeAfkXCy6pg3SV
         phy89G3H3p3CXniUmpILYwlrsFfwsAJumo1y4P4x2T2Hq+WXP2lvfhpl+lPdKyB6DZNw
         J9+Q==
X-Gm-Message-State: AOAM531iHXZ+N6RgIO83YJFQfVt2QZmKIz7IIBk2FNqxUp9RUaAJV/Ob
	pak+XDlOBZBRz/tRoWT+cAcYidzhpgZ7SZ9gkcYTy4SIuo3/2bDnI91tZyHFlE0uqDQWbkJB+DQ
	obLAL5UD8Swpz9OJsap5prBdDTME7NmJpqI0knun0p2j6gg==
X-Received: by 2002:a17:907:6e12:b0:6fe:c2fd:89b7 with SMTP id sd18-20020a1709076e1200b006fec2fd89b7mr28883565ejc.581.1653729991234;
        Sat, 28 May 2022 02:26:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTIoHfWrOT9U2e85CFhK4imRJ1Ycox2VrkT/sTmCYMzAKvkrW+16CaVVHurj+g2SGaWKw6qQ==
X-Received: by 2002:a17:907:6e12:b0:6fe:c2fd:89b7 with SMTP id sd18-20020a1709076e1200b006fec2fd89b7mr28883553ejc.581.1653729990956;
        Sat, 28 May 2022 02:26:30 -0700 (PDT)
Received: from [192.168.123.94] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id w24-20020a50d798000000b0042db87b5ff4sm607240edi.88.2022.05.28.02.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 02:26:30 -0700 (PDT)
Message-ID: <7b93efe6-fb54-d6f8-dd3b-3fb260652f15@canonical.com>
Date: Sat, 28 May 2022 11:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] riscv: read-only pages should not be writable
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, linux-efi <linux-efi@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
References: <20220528014132.91052-1-heinrich.schuchardt@canonical.com>
 <CAMj1kXGmwwD==yOnzfYgPg8Bpz1POK7aPBULcuMdgS-E1G2EAw@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAMj1kXGmwwD==yOnzfYgPg8Bpz1POK7aPBULcuMdgS-E1G2EAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_022634_688326_E9E9905F 
X-CRM114-Status: GOOD (  17.70  )
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



On 5/28/22 11:13, Ard Biesheuvel wrote:
> On Sat, 28 May 2022 at 03:41, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> If EFI pages are marked as read-only,
>> we should remove the _PAGE_WRITE flag.
>>
>> The current code overwrites an unused value.
>>
>> Fixes: b91540d52a08b ("RISC-V: Add EFI runtime services")
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   arch/riscv/kernel/efi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
>> index 024159298231..1aa540350abd 100644
>> --- a/arch/riscv/kernel/efi.c
>> +++ b/arch/riscv/kernel/efi.c
>> @@ -65,7 +65,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
>>
>>          if (md->attribute & EFI_MEMORY_RO) {
>>                  val = pte_val(pte) & ~_PAGE_WRITE;
>> -               val = pte_val(pte) | _PAGE_READ;
>> +               val |= _PAGE_READ;
>>                  pte = __pte(val);
>>          }
>>          if (md->attribute & EFI_MEMORY_XP) {
>> --
>> 2.36.1
>>
> 
> Thanks Heinrich
> 
> Queued in efi/urgent.

I guess this should also be down-ported to 5.15 and 5.10.

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
