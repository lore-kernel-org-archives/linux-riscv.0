Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0900CD3439
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 04:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrxA/B+8oqVQjNPMvNKxB57bgfusQiPBOByzBw9rTQc=; b=z6kFrWOXy2V6uK
	LpeeZNWsHRICXjs2XjvOixyzYmj65MPVB6FPj9uO81h4EN2WmwFoW2xUEba0aVeRejLn24ELN2ytz
	KUKLMN7tz2yyyTeBBO91Tu8BE95Nzok9ILbscJVnlg+jwgrw7j/mxIJSB9qVP1256p0F/lgXtN5kM
	o0MsJPzTihHoXVPefBXk2vNdLf2rQg6j+JeZACjwA0W9b+tWvkmb9/Cnvto89x923IUvjfIKDivWC
	OrI8bUnPA6aC7Se/X/SJqyDVqA6tNbgWG2Y0cG4DmGXU3qdlTExrXBd9QWXaRNVO8gdPe2qcfCS4L
	VRD/8MpzVHvVMULIsRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiSOO-00GwUS-0x;
	Tue, 19 Sep 2023 04:31:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiSOK-00GwSY-1R
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 04:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695097875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tujQrNvl4PrxqMiJg4NQJAeEUSLfcAURkaot9IyEWb0=;
	b=hlaOSo41osQ3Fwnre2sp51uPxy8BAq0AlrPPSeBnAlDgfJfu4wzb80F8MS2bgPWXRS1Zun
	iocSP/YUy7xNk14eBODhRmxfdk09xN8EhMgCdjHk0MMPIa/pJM6N5il8XXuqqruR3TEjnv
	A9B0Pb09jbPx83hI5sv9+Md3e0eRyNU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-I6rWJ9DGNYuq1YJNmxSckA-1; Tue, 19 Sep 2023 00:31:13 -0400
X-MC-Unique: I6rWJ9DGNYuq1YJNmxSckA-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1c59cd2cff8so3058325ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 21:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695097872; x=1695702672;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tujQrNvl4PrxqMiJg4NQJAeEUSLfcAURkaot9IyEWb0=;
        b=OA53hPd/BkHl5IHGhYsP/sXW+yKcnvCrI1nG1ElQ1RaXuVsfrTPVQKNKNIwa9GPv0Q
         2Ou6fx0e3r1bBv1VG+2z6rSgwQMtKUGx5IsgPx/yIAweQDBfp/idiLQ2LnIsNU+itgu+
         50SnJWcWdhj0bVF3lx0HjXYq6pskZI35foMe9OGe0kq4zZeuj4cWSYxEWdg2rC9W9APd
         2YKpiOdwaxzzexIh+froH3GAWxBD3WkHu/zo5AHwsnYbswIAqHqTvqbVd9RXrM9qc9xg
         vzrQ0bS5in4P1eh5lUmh4lnQxnZunSlsRECL5RA7iM2XmK9AYRyXFrReuOL00DuzXcPp
         6oMg==
X-Gm-Message-State: AOJu0YzS0tzm0BJhTyf40GsvBTq4/cIpayHSh4azoqD8nSxKd+UI2zBQ
	c1EF62zDQj63QvQS3v+bqVuyuaxHGPo6zpf+74Q+ngTkiDROP56iOyPsT5V3078EufbUMZwsGRG
	qpyKDicJEVMp5go7IYqcRWsr4h38z
X-Received: by 2002:a17:902:7e8a:b0:1c1:ed61:e058 with SMTP id z10-20020a1709027e8a00b001c1ed61e058mr9604509pla.16.1695097872165;
        Mon, 18 Sep 2023 21:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0jjbVQCYx0HrEgkOAsu8m5j5UqVtkKvnOrxhTmEgF6XxUE6+/pZbGU0AbafmkGXTMtnwJTA==
X-Received: by 2002:a17:902:7e8a:b0:1c1:ed61:e058 with SMTP id z10-20020a1709027e8a00b001c1ed61e058mr9604496pla.16.1695097871847;
        Mon, 18 Sep 2023 21:31:11 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id b7-20020a170902b60700b001b9f032bb3dsm9059276pls.3.2023.09.18.21.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 21:31:11 -0700 (PDT)
Message-ID: <89a36ddc-5354-5ee0-2066-11a8d4ae1806@redhat.com>
Date: Tue, 19 Sep 2023 14:31:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 31/35] arm64: psci: Ignore DENIED CPUs
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 Salil Mehta <salil.mehta@huawei.com>, Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-32-james.morse@arm.com>
 <20230914170155.000065cf@Huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230914170155.000065cf@Huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_213116_558949_957E9E1E 
X-CRM114-Status: GOOD (  26.59  )
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

On 9/15/23 02:01, Jonathan Cameron wrote:
> On Wed, 13 Sep 2023 16:38:19 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> When a CPU is marked as disabled, but online capable in the MADT, PSCI
>> applies some firmware policy to control when it can be brought online.
>> PSCI returns DENIED to a CPU_ON request if this is not currently
>> permitted. The OS can learn the current policy from the _STA enabled bit.
>>
>> Handle the PSCI DENIED return code gracefully instead of printing an
>> error.
> 
> Specification reference would be good particularly as it's only been
> added as a possibility fairly recently.
> 

https://developer.arm.com/documentation/den0022/f/?lang=en   page-58

It seems DENIED is the best matched indicator.

>>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> [ morse: Rewrote commit message ]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> ---
>>   arch/arm64/kernel/psci.c     | 2 +-
>>   arch/arm64/kernel/smp.c      | 3 ++-
>>   drivers/firmware/psci/psci.c | 2 ++
>>   3 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/psci.c b/arch/arm64/kernel/psci.c
>> index 29a8e444db83..4fcc0cdd757b 100644
>> --- a/arch/arm64/kernel/psci.c
>> +++ b/arch/arm64/kernel/psci.c
>> @@ -40,7 +40,7 @@ static int cpu_psci_cpu_boot(unsigned int cpu)
>>   {
>>   	phys_addr_t pa_secondary_entry = __pa_symbol(secondary_entry);
>>   	int err = psci_ops.cpu_on(cpu_logical_map(cpu), pa_secondary_entry);
>> -	if (err)
>> +	if (err && err != -EPROBE_DEFER)
> 
> Hmm. EPROBE_DEFER has very specific meaning around driver requesting a retry
> when some other bit of the system has finished booting.
> I'm not sure it's a good idea for this use case.  Maybe just keep to EPERM
> as psci_to_linux_errno() will return anyway.  Seems valid to me, or
> is the requirement to use EPROBE_DEFER coming from further up the stack?
> 

I agree with Jonathan that -EPERM from psci_to_linux_errno(DENIED) is
good enough here. Actually, I think we need to bail from bringing up
the CPU once error is raised on psci_ops.cpu_on() and avoid reporting
it as error with help of -EPROBE_DEFER. -EPERM can serve the same
purpose.

> 
> 
>>   		pr_err("failed to boot CPU%d (%d)\n", cpu, err);
>>   
>>   	return err;
>> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
>> index 8c8f55721786..e958db987665 100644
>> --- a/arch/arm64/kernel/smp.c
>> +++ b/arch/arm64/kernel/smp.c
>> @@ -124,7 +124,8 @@ int __cpu_up(unsigned int cpu, struct task_struct *idle)
>>   	/* Now bring the CPU into our world */
>>   	ret = boot_secondary(cpu, idle);
>>   	if (ret) {
>> -		pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
>> +		if (ret != -EPROBE_DEFER)
>> +			pr_err("CPU%u: failed to boot: %d\n", cpu, ret);
>>   		return ret;
>>   	}
>>   
>> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
>> index d9629ff87861..f7ab3fed3528 100644
>> --- a/drivers/firmware/psci/psci.c
>> +++ b/drivers/firmware/psci/psci.c
>> @@ -218,6 +218,8 @@ static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point)
>>   	int err;
>>   
>>   	err = invoke_psci_fn(fn, cpuid, entry_point, 0);
>> +	if (err == PSCI_RET_DENIED)
>> +		return -EPROBE_DEFER;
>>   	return psci_to_linux_errno(err);
>>   }
>>   

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
