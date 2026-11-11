Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B025606A324
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OzFX26G3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=QGBSj5SW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:From:References:In-Reply-To:
	Mime-Version:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=btKJLR3UPBBmetTaAmx4n2qvDQQuTbIrkIifH50SSck=; b=OzFX26G375/JjSDHQUS4Ne73Qx
	PppsDYQX0A8SvOqPankwuD18Q1d/fIS68nXNR1tkzj3x/umqf2AzTblb0cTcxw2vXDBUak4S/1d9V
	RQBXO9fKXf+PRocd5B7KYE++q3oHndacQ8IxgVkEb1xzB13W7aZmQADurJ0WIKIZOaRHOIs6kOW3p
	dKARRPtk7v1kZhVLjPWyvcBAV5ow3+WlIptoHSV3wFAuwDrsvhEKkL/Reig22E3f8gVm2en1wU+CQ
	CQrcW8zlsviOv40KCnEDX4wK5aOjCCQQAhJ3hXDkwRC/1Lm2IH8oTfC6rOOKvcq0kMsAUFFp05sIt
	TL1r1Duw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6hX-00000006VLM-1RMc;
	Wed, 11 Nov 2026 11:41:15 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6hS-00000006VK9-0ymX
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 11:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794397260; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zVvZBV6suQrnzsiHL0fsmvRL+1EnY1VOLR3pQOW7cuk=;
 b=QGBSj5SWW/tNmQGgEVryANpsNR7fxnlSkJ0jMqrnww6f8/65uQub60tFUdOqVqUU7Rx4ai
 1u59gmjC+EZq7ctngGnHTsST3aCVaEuFhy0jQw+CvoU7MAZSJ+LG7HZ+GjVk+exJhoteaH
 yXnI5MCNR4Yf+w3z3+9I+XQ+VkMu60Wyc2VucAVELwKGCpwRgaoRDxosIksEhGlLbo6Rmm
 k+lcgKQ3vDbWI2i3jD1CtKKEfi62TkZts1a2Wn2j7a+mocWKtGPbCf6Fc8E8vmAbCM23s9
 34VKoZAsGmzDcb6TPvWeq+5O8D1PX5rYAox/8mObW13TXKlLB0uPXbmxKHYaqA==
Content-Language: en-US
Date: Wed, 11 Nov 2026 19:40:55 +0800
Message-Id: <a767f8c1-a568-42bf-8dd2-0b05d32686ec@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
In-Reply-To: <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com> <20261104161512.883885-2-anup.patel@oss.qualcomm.com> <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
Received: from [100.86.214.79] ([58.250.106.117]) by smtp.feishu.cn with ESMTPS; Wed, 11 Nov 2026 19:40:57 +0800
X-Lms-Return-Path: <lba+26af4544a+2a7a02+lists.infradead.org+yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and csr_write_num() functions
To: "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>, 
	"Anup Patel" <anup.patel@oss.qualcomm.com>, 
	"Sunil V L" <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_034110_583881_C94316E8 
X-CRM114-Status: GOOD (  18.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, Yuanzhu <yuanzhu@bytedance.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, yang.yicong@picoheart.com, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 5:15 PM, Zhanpeng Zhang wrote:
> Hi Anup,
> 
> On 11/5/26 12:15 AM, Anup Patel wrote:
>> From: Anup Patel <apatel@ventanamicro.com>
>>
>> In RISC-V, there is no CSR read/write instruction which takes CSR
>> number via register so add common csr_read_num() and csr_write_num()
>> functions which allow accessing certain CSRs by passing CSR number
>> as parameter. These common functions will be first used by the
>> ACPI CPPC driver and RISC-V PMU driver.
>>
>> Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
>> as CPPC register and the RISC-V SBI specification allows arbitrary
>> CSR number as PMU hardware counter. This means ACPI CPPC driver and
>> RISC-V PMU driver no longer need to do sanity checks on CSR number
>> which are now done by the common csr_read_num() and csr_write_num()
>> functions.
>>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Reviewed-by: Atish Patra <atishp@rivosinc.com>
>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>> ---
>>   arch/riscv/include/asm/csr.h |   3 +
>>   arch/riscv/kernel/Makefile   |   1 +
>>   arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>>   drivers/acpi/riscv/cppc.c    |  17 ++--
>>   drivers/perf/riscv_pmu.c     |  54 ++----------
>>   5 files changed, 184 insertions(+), 56 deletions(-)
>>   create mode 100644 arch/riscv/kernel/csr.c
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index 621f84d1898f..ebd82043430b 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>>
>> [...]
>>   /*
>>    * Read the CSR of a corresponding counter.
>>    */
>>   unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
>>   {
>> -	if (csr < CSR_CYCLE || csr > CSR_HPMCOUNTER31H ||
>> -	   (csr > CSR_HPMCOUNTER31 && csr < CSR_CYCLEH)) {
> 
> 
> Could we keep the existing CSR range check in riscv_pmu_ctr_read_csr()
> when switching it to csr_read_num()?
> 
> The SBI PMU driver still assumes the architectural counter layout. For
> example, if SBI assigns an event to a custom counter at CSR 0x800,
> pmu_sbi_csr_index() truncates 0x800 - CSR_CYCLE to zero. The perf mmap
> page then advertises index 1, so userspace reads cycle while the kernel
> reads 0x800. The same index is used to set and clear scounteren.

I think it's an existing problem that current SBI PMU doesn't support
custom counters, but only rejects the custom counters in riscv_pmu_ctr_read_csr().
the index truncation and scounteren issue should still exist even if we
add back the check in riscv_pmu_ctr_read_csr().

but you're right that remove the check here changes the existing
behaviour and should be retained.

thanks.

> 
> Non-snapshot overflow handling and RV32 high-half reads also assume the
> architectural layout. Could we keep the PMU conversion
> behavior-preserving and handle custom counters separately?
> 
>> [...]
> Thanks,
> Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
