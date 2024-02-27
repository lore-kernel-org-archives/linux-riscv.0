Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B88C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlxCBgvzFIgUf6L2OANdc16W1HLSoubquAmEKtVMtSA=; b=GrhbRgbnSJoGfM
	UVcrk1R+/5aYeJA0Y/Bz8My3FLemazmhLU+v+uHIt6aU4ILL1uIIAjxv7drV2X7yaBP2eCObNdBIl
	1w1EgiYef4BLT+hFAixb+bDFPRPz6jlPiLG1pn/xaWyn8vRuMIOhCnWOlUaCpasX60Haa4hLa1BOK
	V1R2PCQzuAE/N8PSxmh072m/r8axGXMKKh9323vBnWee0OVFxrhA9tJdzWKVSj7FGDD/XvYQ5/ad0
	9q/Tn2Z0V5ZC52zKcPQJ9N13vE4P5QrlcjEZkEpYUCG7Ig/LCocsr+ehoELO+HeACOdLBIl1AtH2Q
	JKBOWvhQpyq9kRwUglDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3Rv-00000006gCD-39Bm;
	Tue, 27 Feb 2024 19:49:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf3Ri-00000006g62-0ndX
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 19:48:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56C4BFF802;
	Tue, 27 Feb 2024 19:48:55 +0000 (UTC)
Message-ID: <579c9f3f-8c28-4e4e-88ce-9f266597b7bd@ghiti.fr>
Date: Tue, 27 Feb 2024 20:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes v3 1/2] riscv: Fix enabling cbo.zero when running
 in M-mode
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
References: <20240214090206.195754-1-samuel.holland@sifive.com>
 <20240214090206.195754-2-samuel.holland@sifive.com>
 <20240214-661604d82db4ef137540b762@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240214-661604d82db4ef137540b762@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_114858_400369_87DAB63C 
X-CRM114-Status: GOOD (  18.22  )
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

Hi Samuel,

On 14/02/2024 10:28, Andrew Jones wrote:
> On Wed, Feb 14, 2024 at 01:01:56AM -0800, Samuel Holland wrote:
>> When the kernel is running in M-mode, the CBZE bit must be set in the
>> menvcfg CSR, not in senvcfg.
>>
>> Cc: <stable@vger.kernel.org>
>> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> (no changes since v1)
>>
>>   arch/riscv/include/asm/csr.h   | 2 ++
>>   arch/riscv/kernel/cpufeature.c | 2 +-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>> index 510014051f5d..2468c55933cd 100644
>> --- a/arch/riscv/include/asm/csr.h
>> +++ b/arch/riscv/include/asm/csr.h
>> @@ -424,6 +424,7 @@
>>   # define CSR_STATUS	CSR_MSTATUS
>>   # define CSR_IE		CSR_MIE
>>   # define CSR_TVEC	CSR_MTVEC
>> +# define CSR_ENVCFG	CSR_MENVCFG
>>   # define CSR_SCRATCH	CSR_MSCRATCH
>>   # define CSR_EPC	CSR_MEPC
>>   # define CSR_CAUSE	CSR_MCAUSE
>> @@ -448,6 +449,7 @@
>>   # define CSR_STATUS	CSR_SSTATUS
>>   # define CSR_IE		CSR_SIE
>>   # define CSR_TVEC	CSR_STVEC
>> +# define CSR_ENVCFG	CSR_SENVCFG
>>   # define CSR_SCRATCH	CSR_SSCRATCH
>>   # define CSR_EPC	CSR_SEPC
>>   # define CSR_CAUSE	CSR_SCAUSE
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 89920f84d0a3..c5b13f7dd482 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -950,7 +950,7 @@ arch_initcall(check_unaligned_access_all_cpus);
>>   void riscv_user_isa_enable(void)
>>   {
>>   	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
>> -		csr_set(CSR_SENVCFG, ENVCFG_CBZE);
>> +		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
>>   }
>>   
>>   #ifdef CONFIG_RISCV_ALTERNATIVE
>> -- 
>> 2.43.0
>>
> After our back and forth on how we determine the existence of the *envcfg
> CSRs, I wonder if we shouldn't put a comment above this
> riscv_user_isa_enable() function capturing the [current] decision.
>
> Something like
>
>   /*
>    * While the [ms]envcfg CSRs weren't defined until priv spec 1.12,
>    * they're assumed to be present when an extension is present which
>    * specifies [ms]envcfg bit(s). Hence, we don't do any additional
>    * priv spec version checks or CSR probes here.
>    */


I was about to read the whole discussion in v2 to understand the 
v3...thank you Drew :) I think it really makes sense to add this 
comment, do you intend to do so Samuel?

Thanks,

Alex


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
