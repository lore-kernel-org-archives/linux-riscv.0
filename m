Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB36C54F51
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 06:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgLMedqfpfTBuJH0WRUJI7IR0LifMYlJ9YJGqvI+Sms=; b=olH3MUrlU83ony
	C+hD2JTpis8A4G5dxZv8p5Zc08dncVpyUk29vFi3RIu4x5EORs40UXIXi4SdUygmuW/+XE0gESTz4
	O4CnlWECGNRNItJeWOYqxziKQUFTIFOmk+2tu1jRO/r+VENyOWRqMdZYG63k1kvmRBOEjienVTMPS
	3dvSvxqbHia6uK6U8Rh/eqi0E01RBMbzOVNscxsMbhr9rosb+XnD+QZVPWpfALITJkni05t7qtwVr
	IJsibAu76QROUhkDrGvxsV/z28f70VsmrMOsgTl2JRHGxBsTOxSCHcjwh+2YuTjM0hGV9DRh3gYTQ
	XlYs3GUMA41DC8QJWZ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobZW-00000004YxM-1iAn;
	Tue, 28 Jul 2026 06:45:50 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobZS-00000004Yv5-0b7Q
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 06:45:48 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2ce7ac92dfcso31822405ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785221145; x=1785825945; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9PHCPemx3I5IiaOZkfCpXgJjCP/3isLoWalQDvmgro=;
        b=am+nuyhWGZQGDZUpub8mb0r92Upz2N0J7ZuxaYTm+jIIYULepZ49dzcDaa42V2KzOS
         76LP7TK5Nk4zuoScKMyxrO2mtH1w/a00vJZT53rh6xGk/HDUvuISqGcRHs0CtJaTSgac
         oNfMbPpJftzSGaZES45iYAX3QAcO3A5R2oHAiPQlAOqvdOUjfUnb0uAAbmg9AdVr7Zqi
         9l6z8gK8QXNBUx56U4v73Ban/tlB6udxHhyP6/NwSMJREDuq4nJQIu6fPBWh8Fvnzxu3
         Q3CZxuEN/dxegi05TFhoMkb139W2lBinS4GfztOsgjLrb4WCGoDe8Am7xXBOtQZEZ+3b
         ifYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785221145; x=1785825945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9PHCPemx3I5IiaOZkfCpXgJjCP/3isLoWalQDvmgro=;
        b=EI7iERBj7D0YahXLARObx8jD39Qo1evJLR6nIk4UfKDIY+cIh7ImjwYFMrBYSdQSg3
         3V2WLbK2QDctiLkvJ5EnCck3NMr0jvOGnfG3SfKrrwd93OZl7DW7Ja0D+i02vXTjnkKj
         1AwHBwYK74KB4sTW1xnwan8clOTrUTLCh6qCi8opxPd/+Aqyo7TJM0r9s/lSHAHBcQ7c
         g7qVOz+RETSK3+nIF8lYVneNhTqRJXvTddkOv6nC/wgcUdT4x+E6GFm63lGT80aVTuwX
         vJYYFL4ioPDJACxYWa/uToV/PQMMp2zeT2tFKlYsD5amaHBEgM7/VdKs9dX06lFIkj21
         iAjA==
X-Forwarded-Encrypted: i=1; AHgh+Rp98Fy3AiDHvje6ORgrEkNAeBbo9DUJBsZI5n8aZ9bWkd6fS4baAzPpGZsmswVbzqY0HW9Us9BUoyAF1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnFDQhnT/I+rbiiAUFTWyuokQ4p7Qahk+VRtAJ/OGkEVxcVCqs
	MURrqQDKtFOC4Yl/dJLgdRyKdctEJlRxzL2lwNhXcKNdO/r7vn5JfBTs
X-Gm-Gg: AR+sD13SdIpDVf2jKvAD4TP2NhQjF+NsqUOtwqFOuaGJVNOVFM2iOmCVFXW+Ii9D+5O
	6mSl9+JAFIS6QrfWTXwApg12G6Qs9TgzqLoOz7IUBqWFmUmAGELCqsmx15aaAl+DLigwogBiAVT
	ohlsWXA+5KeRn5NUeSKvVIMjkEJ+zIDE6wollg1PPsIXlFx6w+2mKcehgkCQOu2657NX82xS350
	IYgJRKiq/WMTX56/LMg34H2ZAkNVYQ5G5mZAHg8mHqczXpfb5dV3vxUHYxq7+ynOFju2674WfgF
	f17QXJXpjoRUmZ8NSc+zv1+v2z/Sle4mKoWItkJ8183HUoDJ1Cw2uA/fm1NOrOvFR0XAWzSEXW/
	gTA+wBQmA0F6QrKCQM+lmARKxCeGL2Nd9kp8s3tHu5PxQaRDj1vz5ckIwLHU5/7K1WRlcVnpLKp
	Xuzyq5mqA1Lg==
X-Received: by 2002:a17:903:b90:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2d015c9b773mr13766995ad.9.1785221144689;
        Mon, 27 Jul 2026 23:45:44 -0700 (PDT)
Received: from [10.125.112.20] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e1e26sm46147345ad.22.2026.07.27.23.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 23:45:43 -0700 (PDT)
Message-ID: <14ae96c1-707c-4999-bc9d-65ec74fbeff2@gmail.com>
Date: Tue, 28 Jul 2026 14:45:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] kdump: reduce vmcore size and capture time
To: Rob Herring <robh@kernel.org>, m.szyprowski@samsung.com
Cc: chenhuacai@kernel.org, kernel@xen0n.name, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, saravanak@kernel.org,
 bhe@redhat.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, iommu@lists.linux.dev, zhaomeijing@lixiang.com,
 catalin.marinas@arm.com, will@kernel.org, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 ruirui.yang@linux.dev, robin.murphy@arm.com
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
 <20260723234126.GA3253409-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20260723234126.GA3253409-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_234546_186935_19112725 
X-CRM114-Status: GOOD (  21.50  )
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



On 7/24/26 07:41, Rob Herring wrote:
> On Tue, Jun 30, 2026 at 03:47:04PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU
>> firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
>> those carveouts as part of system RAM even though their contents are
>> firmware state that is not useful for kernel crash analysis.
> 
> What about reserved regions on ACPI based systems?

ACPI based systems already filter out these reserved regions from vmcore.
In the EFI memory map, firmware carveouts are reported with the type
EFI_RESERVED_TYPE. This type of memory gets the nomap flag set in
memblock.memory (is_usable_memory() returns false in reserve_regions()
and mark these regions with nomap flag), during prepare_elf_headers(),
for_each_mem_range() filters out these nomap regions. Therefore, the
memory reserved on ACPI based systems will not be dumped into the vmcore.
> 
>> This series introduces an opt-in 'dumpable' flag [1] on struct
>> reserved_mem and uses it to filter the elfcorehdr PT_LOAD ranges on
>> DT-based architectures (arm64, riscv, loongarch). By default reserved
>> regions are treated as non-dumpable; CMA regions are explicitly opted
>> in because their pages are returned to the buddy allocator and may
>> carry key crash-analysis data.
> 
> I never like seeing the same change being made to each architecture. 
> That's generally a sign of restructuring needed. loongarch and arm64 
> prepare_elf_headers() look about the same. riscv version uses 
> walk_system_ram_res() for some reason. 
> 
> Perhaps the dumpable flag belongs in memblock instead? Then at least we 
> wouldn't need more DT APIs exposed to the arch code, and the code stays 
> independent of the firmware API.

Agreed on both points. Adding the flag to memblock can indeed eliminate
the duplicated code in prepare_elf_headers, and avoid expose APIs to the
arch code.

I will add a dumpability marker to memblock for future extensibility
and to avoid duplicating the same code across different architectures.

I'm inclined to add a nodump flag, similar to nomap, by default all memory
is dumpable, and only the small fraction of memory that carries this flag
would be excluded from the vmcore, What do you think about this approach?

walk_system_ram_res() in riscv could be reworked into the same form as in
the arm64/loongarch architectures, will do in next version.

> 
> I'd really like Marek's review on the reserved memory code changes.

Marek, could you take a look when you have a chance about the reserved
memory code changes, I'm happy to respin and address any feedback.

> 
> Rob

Best regards,
Wandun


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
