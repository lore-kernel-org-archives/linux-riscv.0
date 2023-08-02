Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3987C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3I7KPe8wztM4UtdEvMGt1fc0VzmvMUvI6VA84xecbyo=; b=R2J0Xk+cm0JAry
	Q9ryBWnVooq7Ube8wPEsuJEdSVZOJzAKgGZ/V8Qfzo7N/BdaF4H8Sh9Kme+/BeLKt2odI3K/0Usjj
	VYzGPeTt+VAjdTr2bZ8dUCjHM+a0MZNSjMdUjm6qELwnUiPsxKXToNgJd4qXxdG1CeavFBZYPmN4y
	Ne6ab6g/pvAINmznYNlhkiU5e+F3/K3ndgzbaOEnleH40M05/Zh6gGO+ajuiLzsqQHVq5oLSPKFb8
	aqJXjABemSQ/NzYFJDxYkyxAJOMeJ7KXMdHT2hMGpHcsOvRtWO4QbLQwyAxuvbhrZcPBONf7jtyHx
	9SUDOoXlzip/aHv/a5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6Ld-004FnQ-0L;
	Wed, 02 Aug 2023 07:32:45 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6LZ-004FmN-2M
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 07:32:44 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0021224E03C;
	Wed,  2 Aug 2023 15:32:16 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 15:32:17 +0800
Received: from [192.168.125.127] (183.27.98.54) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 2 Aug
 2023 15:32:15 +0800
Message-ID: <d64874cb-8628-a6d2-d2f4-8af4d0ebf8b2@starfivetech.com>
Date: Wed, 2 Aug 2023 15:32:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1] riscv: Using TOOLCHAIN_HAS_ZIHINTPAUSE marco replace
 zihintpause
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
CC: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Dao Lu <daolu@rivosinc.com>, "Heiko
 Stuebner" <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Mason Huo
	<mason.huo@starfivetech.com>
References: <20230802064215.31111-1-minda.chen@starfivetech.com>
 <20230802-sharpness-spoon-f9b8804fb66f@wendy>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230802-sharpness-spoon-f9b8804fb66f@wendy>
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_003241_968238_7A3CF4EB 
X-CRM114-Status: GOOD (  19.32  )
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



On 2023/8/2 14:54, Conor Dooley wrote:
> Hey Minda,
> 
> On Wed, Aug 02, 2023 at 02:42:15PM +0800, Minda Chen wrote:
>> Actually it is a part of Conor's
>> commit aae538cd03bc ("riscv: fix detection of toolchain
>> Zihintpause support").
>> It is looks like a merge issue.
> 
> Yup, spot on.
> 
>> Samuel's
>> commit 0b1d60d6dd9e ("riscv: Fix build with
>> CONFIG_CC_OPTIMIZE_FOR_SIZE=y") do not base on Conor's commit and
>> revert to __riscv_zihintpause. So this patch can fix it.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> 
> Did you actually manage to trigger this, or was this by inspection?
> clang-15 + binutils 2.35 was, IIRC, how we spotted this because that's
> what the clang-built-linux CI uses to test the LTS kernels from before
> LLVM's IAS was supported for RISC-V. Seemingly all that needs to be
> satisfied there is that zihintpause doesn't appear in -march so this has
> gone unnoticed.
> 
> Fixes: 3c349eacc559 ("Merge patch "riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y"")
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
Thanks, Conor. I found this just by inspection. I found a issue that vdso.so call cpu_relax
cause application core dump in kernel 6.1.31. I need Samuel'patch to fix this. And I search the log
of processor.h found this issue.
>> ---
>>  arch/riscv/include/asm/vdso/processor.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
>> index 14f5d27783b8..96b65a5396df 100644
>> --- a/arch/riscv/include/asm/vdso/processor.h
>> +++ b/arch/riscv/include/asm/vdso/processor.h
>> @@ -14,7 +14,7 @@ static inline void cpu_relax(void)
>>  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>>  #endif
>>  
>> -#ifdef __riscv_zihintpause
>> +#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
>>  	/*
>>  	 * Reduce instruction retirement.
>>  	 * This assumes the PC changes.
>> -- 
>> 2.17.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
