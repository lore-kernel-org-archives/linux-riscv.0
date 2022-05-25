Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1350C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OIn61hDsD7mN16Hr5eua482+lFtJY2zQkAEHhIXNAI=; b=G1RqGWTOLG7gov
	fNweLCk4sd959s8GUJJjdVxgd6F2DKGPOvcGokxshTt4qYw7BzXboG6N4XxQBTRVH9NKvpOJB7M4i
	+KvHb/qnccAV9nEm1olZa6ERmcZMLfqMoyXfB7wqj1f9V4DdyxfPB5yUI3f0TmDRsxr4oq/NrzpLL
	hoh1bFjWNzI+KsUsvybieTuTdGiPNEZT1Xyb/QL+yIZ+oXStQIIr1EibiNFhhSz51sHsfHpy1dr1B
	eWZs70wuCFr7jGwkKXzP3OI+tCCujCdKXtjTm15GyTksr/RGTKHI9u7d6+yl+/eRt+eTljBYoHShL
	HWgPfZBR7nRShy4S1aEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttZS-00Bm9H-B5; Wed, 25 May 2022 16:09:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttZO-00Bm7e-Un
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 16:09:12 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6337B3F1F2
	for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653494948;
	bh=d8wzs0GJmElvjOENQNOKSUNkK9vo5WqYmuRjW9+dNXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=fmgQ8PXmDIYcMgWN1p/JT1Fqqqv8Kzpmi6YHDFc7xl0U/gBce8lmC3IrwIHN/IDNu
	 kPWABV90kSjIYqs3r18jJeEeK1g+q6pGrirq2A1JG+hVm0q5pR0Crl2ZqndfqvfjJ2
	 GGx42+LFv/vfWbPYJdbmjjoTfqQH18E4uvODWy59fAXFra8LiUTZ7FTbaAc16tuW/L
	 Ijmnj2Qt2DAvVi6ux3dtFtRibpe7Ut5wx+vcf44wyHhuVvh/irbHyQHxdNMZctHU1V
	 mGgnz18lpyTiggIviv8VcWd85JNWTpmrNI3TLu5oCgZ/C09Z9P9xGkYn/7WHxZFuk1
	 0vCMmLgXlEUrA==
Received: by mail-ej1-f72.google.com with SMTP id b17-20020a170906491100b006feec47b64bso4733464ejq.5
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 09:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=d8wzs0GJmElvjOENQNOKSUNkK9vo5WqYmuRjW9+dNXI=;
        b=29XSiJz6iE7sr8a7Xnk41NzbCmSwYywpJcz8xA+cOWGP/LJ1f2TqrbzQUM8RbeJ4GZ
         EM0WXJuK06yuBQanMCTUuu4FE0dqqDnFq5mls/sdw2Ihh9KkOjWwLwAbhSHn8MHSmoAs
         Ha0gPnhWG6CipewwALT3zOxnHpdYD7vwt02CaluOONFbmhYjvJ3XNXC+hbHxS6Vep7M8
         tdEXLfeD8pjaGFlGAR6t5lmjplgQfwcJiexcalBkSIzMHAw7jiNr0TfXJEbfU307sP1v
         t3f9FRAS4m/6x0MGDb9am5EK3WhM0d2j2CXz0m1wwgAirR5SluaG+RYzQjj+RPBCjoKF
         lqQw==
X-Gm-Message-State: AOAM533twSpiygkH+QPBYWakPliLIWVYKAoy6R74EsiiVzHsZTVhptN7
	TuqQQP0BmmV6z17LJNPOdR+Rm9wb5KoN0BTDpTFNpklBWzxXtGJ7wpWU1CPizRO/xlrrjsNtSPJ
	mnOsgGTOzaN97wpLFsZmY2+frAEtO8fDvRA2Rl924K/GkdA==
X-Received: by 2002:a05:6402:1914:b0:42b:73ae:e082 with SMTP id e20-20020a056402191400b0042b73aee082mr14382682edz.31.1653494948045;
        Wed, 25 May 2022 09:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpqXsCgcavHTP6/CfZQf4opU8VPdadSWqUfI+xqHjR9H80zRw2o39oJtqvERVspav9HAZUAA==
X-Received: by 2002:a05:6402:1914:b0:42b:73ae:e082 with SMTP id e20-20020a056402191400b0042b73aee082mr14382654edz.31.1653494947825;
        Wed, 25 May 2022 09:09:07 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id vw13-20020a170907058d00b006feec47dae7sm2963066ejb.149.2022.05.25.09.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 09:09:06 -0700 (PDT)
Message-ID: <1e90b15b-8c73-0de8-2885-1292923b7575@canonical.com>
Date: Wed, 25 May 2022 18:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 5/5] riscv/efi_stub: Support for 64bit boot-hartid
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>, Sunil V L <sunil.vl@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>
References: <20220525151106.2176147-1-sunilvl@ventanamicro.com>
 <20220525151106.2176147-6-sunilvl@ventanamicro.com>
 <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAMj1kXFhEBv7MVCKZuXdx9=hZx3qWbkATdLDwXAe_Zn9Xyx=dg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_090911_312500_18C26C92 
X-CRM114-Status: GOOD (  20.99  )
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

On 5/25/22 17:48, Ard Biesheuvel wrote:
> On Wed, 25 May 2022 at 17:11, Sunil V L <sunilvl@ventanamicro.com> wrote:
>>
>> The boot-hartid can be a 64bit value on RV64 platforms. Currently,
>> the "boot-hartid" in DT is assumed to be 32bit only. This patch
>> detects the size of the "boot-hartid" and uses 32bit or 64bit
>> FDT reads appropriately.
>>
>> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
>> ---
>>   drivers/firmware/efi/libstub/riscv-stub.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
>> index 9e85e58d1f27..d748533f1329 100644
>> --- a/drivers/firmware/efi/libstub/riscv-stub.c
>> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
>> @@ -29,7 +29,7 @@ static int get_boot_hartid_from_fdt(void)
>>   {
>>          const void *fdt;
>>          int chosen_node, len;
>> -       const fdt32_t *prop;
>> +       const void *prop;
>>
>>          fdt = get_efi_config_table(DEVICE_TREE_GUID);
>>          if (!fdt)
>> @@ -40,10 +40,16 @@ static int get_boot_hartid_from_fdt(void)
>>                  return -EINVAL;
>>
>>          prop = fdt_getprop((void *)fdt, chosen_node, "boot-hartid", &len);
>> -       if (!prop || len != sizeof(u32))
>> +       if (!prop)
>> +               return -EINVAL;
>> +
>> +       if (len == sizeof(u32))
>> +               hartid = (unsigned long) fdt32_to_cpu(*(fdt32_t *)prop);
>> +       else if (len == sizeof(u64))
>> +               hartid = (unsigned long) fdt64_to_cpu(*(fdt64_t *)prop);
> 
> Does RISC-V care about alignment? A 64-bit quantity is not guaranteed
> to appear 64-bit aligned in the DT, and the cast violates C alignment
> rules, so this should probably used get_unaligned_be64() or something
> like that.

When running in S-mode the SBI handles unaligned access but this has a 
performance penalty.

We could use fdt64_to_cpu(__get_unaligned_t(fdt64_t, prop)) here.

Best regards

Heinrich

> 
> 
>> +       else
>>                  return -EINVAL;
>>
>> -       hartid = fdt32_to_cpu(*prop);
>>          return 0;
>>   }
>>
>> --
>> 2.25.1
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
