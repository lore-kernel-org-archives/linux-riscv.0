Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0065CCD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+t2i+PMR4/epwaQ2qwF3UdS0J1BToSOwfNBSfVRT5M=; b=wpBclWOmjrSZq9
	aeh6BrpLKiVKGk/elmdCyPZJQpVTp/TmPV4nFNCwSSMXOE1E+DjOyN+exe+PBLuLk7Hp+QpwaUPtm
	FAxLZa8509vuK0562gSkQZtJkMb30DSjxwm2wGiJBwqIPRk4orJyrkS5lF1MJHigsY+kUccNDq0Vg
	cboonlq0tXeRUC4ddo1TjrAM0lGYvMm8Fl0RHPtQVmJqkuYMkRJuGjUU7OD8/lVNvnTg39nzDi1Bx
	BLkvFuwmk9odIUTV12Z4+e0A4H/oxVXBT6nbnUmMfiEf7xMV9zFOxZOr753cdARLt2SpKbY8lIIIq
	zpKJt+0229JYIKr4gA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSNU-00000005bmH-2mXs;
	Wed, 10 Apr 2024 07:28:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSNP-00000005bjn-3Uzo
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 07:28:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso3252395b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 00:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712734090; x=1713338890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Ig32zWmBFLYBqQb21rAU7TmYkM7kXOo2WhlPw8o8aY=;
        b=2uBRmsHPCWp6dy3kVkehQRdEudHlqBHApO7ushpB8wRRXu1Dr2QknGXA+9uBiHPvET
         1/MQdBejn0Bihmi9Hm6yKZIXJ7jI2j6c8D9WjVvo7WZcTRpNnl2TSvzQPuV4D2pFsqUe
         I0/s3y1WOtCvHRJbwWgZLCBiZAoCzUtGRveYjP7QCfl9Ti32gQXw3ISlxYChZxy/3aKG
         wJbid1DW/ieO0OwDmPxvaikTZj+MkGVkl7AjWNqIjqUaqcB+tU1N3IsI1MwJ4hh6w/LT
         g3ZfLgI/EPmHSroCp8hPgRh2GZEFYiOelOGYPJq8Ji1jXa4sSQSU/qV111NHzHLt+4HF
         rlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712734090; x=1713338890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ig32zWmBFLYBqQb21rAU7TmYkM7kXOo2WhlPw8o8aY=;
        b=XqYe0+/7GwnSvQx96HXdPSuMjNmPGmY2Vk5/MNSf70a6G0FntGpIYduExUr7edUiZ8
         SqA0I/WQwHi7SlIX+nVvzYKXLnBLKVzPeJ0RJ2qqHQmAjlajDN491fn0GdQE1fcHyKIf
         /rp150/2V/yNrnTK1vPeA3EVKsM9KBjVBRYJWPqb609PzHm2V1mWWw4jwtXhtsSdlnMC
         wFqpUZ6aOU2fqWaiWQDKaVVdLhI0lbrRzG9itDj226TVldOM8dKIBuYCe/sL8HQf4QsH
         bulaQi1s64xnqpah72z1Zmm80+uU+yMa/4WzsndmstsIb/NHC55jjwZXQL4FaCzryVzl
         M+qA==
X-Forwarded-Encrypted: i=1; AJvYcCXQGgtdqrKGwwFOov850jk0YpEmwcaUAAMXF7HdXl50ghSBj9Lai5gpLlKHxMFbh4Oopqam9kbn0mB4RK7pz6pK3jZ0EaFcBWyZUvfkgsI7
X-Gm-Message-State: AOJu0YxOPuD2KzH5fV/HeXxmNYNdA7Y21FOdPabu4UHJ72r1EWfh4/Yb
	UiGLdMMrkV1fe83kljSbY8PeXXs30OLkp1ZLHgNXD74T8fkuam0acq0bBnEbCV8=
X-Google-Smtp-Source: AGHT+IGnAZXE/XiGFQ0xzq27+Bwb+2iBqYQega7VKj5SmqFQEmNOu1qpGgpcd92WDjvowGcA4TzlPQ==
X-Received: by 2002:a05:6a20:7488:b0:1a3:53e7:16da with SMTP id p8-20020a056a20748800b001a353e716damr2250861pzd.15.1712734089807;
        Wed, 10 Apr 2024 00:28:09 -0700 (PDT)
Received: from [172.16.0.21] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id n15-20020a170903110f00b001e20587b552sm10131456plh.163.2024.04.10.00.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 00:28:09 -0700 (PDT)
Message-ID: <4a428500-4e37-4e7d-968d-3da20dd822af@rivosinc.com>
Date: Wed, 10 Apr 2024 00:28:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/22] KVM: riscv: selftests: Add a test for PMU
 snapshot functionality
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alexey Makhalov <amakhalov@vmware.com>,
 Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-22-atishp@rivosinc.com>
 <20240405-4e840120e8117c286cb593f9@orel>
 <8748dbed-d105-4f26-a808-667c3b56c8ec@rivosinc.com>
 <20240410-2a41e43624596a442d6a95cd@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240410-2a41e43624596a442d6a95cd@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_002812_264820_E4D14415 
X-CRM114-Status: GOOD (  24.22  )
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


On 4/10/24 00:10, Andrew Jones wrote:
> On Tue, Apr 09, 2024 at 03:52:40PM -0700, Atish Patra wrote:
>> On 4/5/24 06:11, Andrew Jones wrote:
>>> On Wed, Apr 03, 2024 at 01:04:50AM -0700, Atish Patra wrote:
> ...
>>>> +	probe = guest_sbi_probe_extension(SBI_EXT_PMU, &out_val);
>>>> +	GUEST_ASSERT(probe && out_val == 1);
>>>> +
>>>> +	if (get_host_sbi_spec_version() < sbi_mk_version(2, 0))
>>>> +		__GUEST_ASSERT(0, "SBI implementation version doesn't support PMU Snapshot");
>>>> +}
>>> It's a pity we can't check the SBI spec version that KVM is advertising
>>> from KVM userspace. Normally we'd want to check something like this at
>>> the start of the test with TEST_REQUIRE() before running a VCPU in order
>>> to generate a skip exit.
>>>
>> Agreed. I will send a separate series for that as it is an ABI change.
>>
>>> (We probably should allow reading and even writing the SBI spec version
>>> from the VMM in order to better support migration.)
>>>
>> How that would work for SBI spec version write use case ? For migraiton, you
>> can't go back to older SBI versions in the host. Isn't it ?
>>
>> Considering this case your VM is running with PMU snapshot as the host has
>> SBI v2.0. It can't be migrated to v1.0 and expecting it work. Correct ?
>>
> We can start a VM on a host with SBI v2.0, but tell KVM to tell the VM
> that it has v1.0. Then, the guest shouldn't use any features from SBI
> that appear after v1.0 and it should be safe to migrate to a host with
> v1.0.

That depends on when the VMM request to KVM to change the version.
Most of SBI implementation checks the SBI version at the boot and 
enable/disable
feature based on the SBI version available. If the SBI version supported 
by KVM changes
to an older one, the calls from VM will fail unexpectedly.

> A more likely scenario might be this though:
>
>   1. KVM userspace checks and captures the SBI version of the host where
>      the VM is first being launched, e.g. v2.0
>   2. The VM gets migrated to another host which supports something later,
>      e.g. v3.0, but to
>      - avoid possibly confusing the guest we tell the destination host
>        that it should expose v2.0 as the SBI version
>      - allow rollback to the source host without concern that the guest
>        has already seen v3.0 and started to use something that the
>        source can't provide

This makes sense though. As per my understanding, we should not allow 
modifying
the SBI version that is less that the version VM already boot with.
However, we can allow modifying the SBI version that is higher or same 
as the VM booted with.

I can't think of a use case for the higher version though.

> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
