Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4B1C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 11:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcdq+R0uiDKKDX1Ci9OfEn0ydGxOsDxTYQCImlouaAQ=; b=xfa89+0pzF8ESy
	BFmYul/EP+mXJXJyFxef2gn/41PNr54jmLrJr8JGhjHDwdbvshIAH+T/w94sWO1JIl9wNtTew1Vvv
	KfBqJPt7cgdg4aSqKWO7odjccSvr+D6F+hOe+Lf8B6usSVVe0ilx6P30zqF+dCwb6wm7EsN9xJuvG
	KjpoO3kGBIsE4w1H+9uX77mCC2BYRPbBEFJadSOU9v00zxwoUCHUGsS8tzN+vRF/+SVSBb+reedDz
	w+oD8mKa1+O/OI0Ifd+iuC47nCCw1u9dpxKddft1TX31YwziUIqbf3s6AFsmBqiMq/cywgv7IW3Dy
	ccfcnfxbLJJhQHHG3ptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLZy-00DeOo-2y;
	Thu, 04 Jan 2024 11:08:02 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLZv-00DeN3-15;
	Thu, 04 Jan 2024 11:08:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A524C40009;
	Thu,  4 Jan 2024 11:07:51 +0000 (UTC)
Message-ID: <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
Date: Thu, 4 Jan 2024 12:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 anup@brainfault.org, atishp@atishpatra.org, rdunlap@infradead.org,
 sfr@canb.auug.org.au, mpe@ellerman.id.au, npiggin@gmail.com,
 linuxppc-dev@lists.ozlabs.org
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240104-d5ebb072b91a6f7abbb2ac76@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_030759_514540_921A257D 
X-CRM114-Status: GOOD (  16.42  )
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

On 04/01/2024 11:52, Andrew Jones wrote:
> This applies to linux-next, but I forgot to append -next to the PATCH
> prefix.


Shoudn't this go to -fixes instead? With a Fixes tag?


>
> On Thu, Jan 04, 2024 at 11:43:08AM +0100, Andrew Jones wrote:
>> KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
>> supporting architectures select HAVE_KVM and then their KVM
>> Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
>> consistent with that approach which fixes configs which have KVM
>> but not EVENTFD, as was discovered with a randconfig test.
>>
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
> I think powerpc may need a patch like this as well, since I don't see
> anything ensuring EVENTFD is selected for it anymore either.
>
> Thanks,
> drew
>
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   arch/riscv/Kconfig     | 1 +
>>   arch/riscv/kvm/Kconfig | 2 +-
>>   2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index a935a5f736b9..daba06a3b76f 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -128,6 +128,7 @@ config RISCV
>>   	select HAVE_KPROBES if !XIP_KERNEL
>>   	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>>   	select HAVE_KRETPROBES if !XIP_KERNEL
>> +	select HAVE_KVM
>>   	# https://github.com/ClangBuiltLinux/linux/issues/1881
>>   	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>>   	select HAVE_MOVE_PMD
>> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
>> index 1fd76aee3b71..36fa8ec9e5ba 100644
>> --- a/arch/riscv/kvm/Kconfig
>> +++ b/arch/riscv/kvm/Kconfig
>> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>>   
>>   config KVM
>>   	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
>> -	depends on RISCV_SBI && MMU
>> +	depends on HAVE_KVM && RISCV_SBI && MMU
>>   	select HAVE_KVM_IRQCHIP
>>   	select HAVE_KVM_IRQ_ROUTING
>>   	select HAVE_KVM_MSI
>> -- 
>> 2.43.0
>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
