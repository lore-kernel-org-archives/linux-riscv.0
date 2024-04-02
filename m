Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E148C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNgyWDbAtA5XUDyMB66CIAne3oyH0aEZSDb6TcFpYYg=; b=gwNEgL98igVSHO2dJwCQXPeWAM
	fA/SpI9IlzqvLh6X3hDiY+Y5AyLZBP02rtGEzPxN/n8HpwXUoMan/6UqgBvb0WPFAxqi0DFAytGlp
	X9pG5Sa2L3QZ+i4PRW1gLVuqyF1GHX6kih5O90ZsA0GdOCefKr+uWGt4ukQI66wdt80b41Nk1xBtc
	vaMh5kXHBjhliPEuzQ6DVvQY6eX7fZ1JfsHVQTsRlv8XDZe1zRCdGv/zL5ZcJRCLk/HfNYtHxo+vC
	9W3eTaIIhkcQg7ih65Dk5QgdsO6Q341x4etBui9ZZOusbR4NdM+qVGQvxgMT0a8rf3oycFHMehaio
	0Ifh4eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZkG-0000000AIOo-2EfE;
	Tue, 02 Apr 2024 08:43:52 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZkD-0000000AINZ-3M4F
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 08:43:51 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5a4a102145fso2618182eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 01:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712047427; x=1712652227; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1ao1EWfYPtfm1HGEz8PRLBvpnUq6uoeFW7iGA9WZBEg=;
        b=Vomw1R79KYbPBsx719V2lnluPpsaPURW6pGLkDZg18wldmp0gJcNfr5zhiWwIWnGe/
         pB1DfLHlB2sH3eQMvKdEbaHNUxf5vV2uuz03y5k2oKjnPnF4ijPazN/4svAIPLRdI1mU
         l198uCUprPF6HZS6/K9rTJGTLpvA2UIgIsEhm4tFy7vEDbT+G9nEqAFCFOfxERqL3CeL
         G1quDXitleempipP6Ql692bx9pWB+lOeBlmvmHCrSBX3FAQeKQsyPLq6d1aEPwbMcNL/
         pgVIZ6ACxZLW6UvwIsncBQKdp/vufA4fKvXekv7QaI7Qr6+QzvRx6d0O+IN2baXOKImx
         fPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712047427; x=1712652227;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ao1EWfYPtfm1HGEz8PRLBvpnUq6uoeFW7iGA9WZBEg=;
        b=EdgOw/XV7EIpEdoQHKCKss4COz3F+B0Jn3Xv9bR8k5PGQ82YBcSrbBTSUFo2KX01h/
         uFEZLsiqGOg3v9csU20ssAhAX/T8ac1+8EHXanZS1TwGYXEDSHLmhH+73XeMcAb+i4Z/
         mcgof1qnT4k+iVHNdYGFwKSNNX2Ji+3y3K/sGZYmIc6WwEQl9IlM6saInsvzPMMtA2Cq
         483fIGXWsXM06MnfmQohFfrAqrYTXe1nyGOsHRM6aPGG9gW6RAxB6pQNN2xt/SqBAgsC
         IJNg25m/jE0rIhdzMznnhAEOcnSVAA9W61lImRnzSe85POFG2K0an8Opyp+5XROtgr5w
         /Egw==
X-Forwarded-Encrypted: i=1; AJvYcCW1fEQPznhhKeMVluZER6vN+owvOelLb9dVKE0vuMxIYc+Pkm9uA8E7ZrGDcDBo1xJ5toRpCXhHJ2tIXpqm76QhUwo78CcB6/C/c/88taqA
X-Gm-Message-State: AOJu0YzIBXU6ypEvR7KezhS7c1MIYdwhI2a2SWmBSaxNVlKW54qrxOFE
	zh9hjFlxvT0LUWA3CSlPiloOGsN4i6e5OFxOsLEc6R1sSotRzJoWvqxkaFAf7v0=
X-Google-Smtp-Source: AGHT+IHeap9PtoP9dWxZ8Fxsi6MBW8mCRxu5nAbnRlzNqlVnyWHQm9bQqROV6m51/MeKVk/nOwVHCw==
X-Received: by 2002:a05:6358:e484:b0:183:bd0c:d2c6 with SMTP id by4-20020a056358e48400b00183bd0cd2c6mr4187597rwb.11.1712047426879;
        Tue, 02 Apr 2024 01:43:46 -0700 (PDT)
Received: from [172.16.0.34] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id e19-20020a63f553000000b005e485fbd455sm9184675pgk.45.2024.04.02.01.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 01:43:46 -0700 (PDT)
Message-ID: <d382c616-5212-4da2-be63-6ed0a85e13f7@rivosinc.com>
Date: Tue, 2 Apr 2024 01:43:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 12/15] KVM: riscv: selftests: Add SBI PMU extension
 definitions
To: Andrew Jones <ajones@ventanamicro.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-13-atishp@rivosinc.com>
 <20240302-698f4322ab7ba74fc3dba416@orel>
X-Mozilla-News-Host: news://nntp.lore.kernel.org
Content-Language: en-US
In-Reply-To: <20240302-698f4322ab7ba74fc3dba416@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_014349_878839_0FDBFD4A 
X-CRM114-Status: GOOD (  23.77  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/2/24 03:00, Andrew Jones wrote:
> On Wed, Feb 28, 2024 at 05:01:27PM -0800, Atish Patra wrote:
>> The SBI PMU extension definition is required for upcoming SBI PMU
>> selftests.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   .../selftests/kvm/include/riscv/processor.h   | 67 +++++++++++++++++++
>>   1 file changed, 67 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
>> index f75c381fa35a..a49a39c8e8d4 100644
>> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
>> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> 
> We should probably create a new header (include/riscv/sbi.h) since
> otherwise processor.h is very quickly going to look like an SBI
> header with a few non-sbi things in it. Can we add a patch prior to
> this one that moves the SBI stuff we currently have in processor.h
> out to an sbi.h? Or, we could start synchronizing a copy of
> arch/riscv/include/asm/sbi.h in tools/arch/riscv/include/asm like
> we've done for csr.h
> 
A separate sbi.h makes sense. I have moved the definitions to sbi.h as 
of now.

There is still lot more changes in sbi.h which is not required for 
selftests even after this patch. But I am okay with syncing with sbi.h
But I am not sure what should be the synchronization policy for sbi.h.

As needed or regular sync with after every release? The csr.h is already 
out of date even though it was created last MW (one change is part of 
this series).

Let me know if you have any thoughts about that. I can send another 
version with that.

>> @@ -169,17 +169,84 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handl
>>   enum sbi_ext_id {
>>   	SBI_EXT_BASE = 0x10,
>>   	SBI_EXT_STA = 0x535441,
>> +	SBI_EXT_PMU = 0x504D55,
>>   };
>>   
>>   enum sbi_ext_base_fid {
>>   	SBI_EXT_BASE_PROBE_EXT = 3,
>>   };
>>   
>> +enum sbi_ext_pmu_fid {
>> +	SBI_EXT_PMU_NUM_COUNTERS = 0,
>> +	SBI_EXT_PMU_COUNTER_GET_INFO,
>> +	SBI_EXT_PMU_COUNTER_CFG_MATCH,
>> +	SBI_EXT_PMU_COUNTER_START,
>> +	SBI_EXT_PMU_COUNTER_STOP,
>> +	SBI_EXT_PMU_COUNTER_FW_READ,
>> +	SBI_EXT_PMU_COUNTER_FW_READ_HI,
>> +	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
>> +};
>> +
>> +union sbi_pmu_ctr_info {
>> +	unsigned long value;
>> +	struct {
>> +		unsigned long csr:12;
>> +		unsigned long width:6;
>> +#if __riscv_xlen == 32
>> +		unsigned long reserved:13;
>> +#else
>> +		unsigned long reserved:45;
>> +#endif
>> +		unsigned long type:1;
>> +	};
>> +};
>> +
>>   struct sbiret {
>>   	long error;
>>   	long value;
>>   };
>>   
>> +/** General pmu event codes specified in SBI PMU extension */
>> +enum sbi_pmu_hw_generic_events_t {
>> +	SBI_PMU_HW_NO_EVENT			= 0,
>> +	SBI_PMU_HW_CPU_CYCLES			= 1,
>> +	SBI_PMU_HW_INSTRUCTIONS			= 2,
>> +	SBI_PMU_HW_CACHE_REFERENCES		= 3,
>> +	SBI_PMU_HW_CACHE_MISSES			= 4,
>> +	SBI_PMU_HW_BRANCH_INSTRUCTIONS		= 5,
>> +	SBI_PMU_HW_BRANCH_MISSES		= 6,
>> +	SBI_PMU_HW_BUS_CYCLES			= 7,
>> +	SBI_PMU_HW_STALLED_CYCLES_FRONTEND	= 8,
>> +	SBI_PMU_HW_STALLED_CYCLES_BACKEND	= 9,
>> +	SBI_PMU_HW_REF_CPU_CYCLES		= 10,
>> +
>> +	SBI_PMU_HW_GENERAL_MAX,
>> +};
>> +
>> +/* SBI PMU counter types */
>> +enum sbi_pmu_ctr_type {
>> +	SBI_PMU_CTR_TYPE_HW = 0x0,
>> +	SBI_PMU_CTR_TYPE_FW,
>> +};
>> +
>> +/* Flags defined for config matching function */
>> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
>> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
>> +#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
>> +#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
>> +#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
>> +#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
>> +#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
>> +#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
>> +
>> +/* Flags defined for counter start function */
>> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
>> +#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
>> +
>> +/* Flags defined for counter stop function */
>> +#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>> +#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
> 
> When changing shifts to BIT()'s, don't forget these (easy not to forget
> if we go with the synch sbi.h to tools approach)
> 
>> +
>>   struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>>   			unsigned long arg1, unsigned long arg2,
>>   			unsigned long arg3, unsigned long arg4,
>> -- 
>> 2.34.1
>>
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
