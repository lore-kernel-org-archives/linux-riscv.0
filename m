Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA72EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p673/HkiCGDKROPa/RToPdSNIufoek48bb3KdQtNCbg=; b=ilrE0aB67t/548
	P3XWdjPZOM3KNZw8KULIZrtvIV6BoJM4U65WKWplRg/eBT8seQ26+8kGZ5q6JCYXTUvDRtrazQTEv
	XxDjOUUpWAZsdi+fDRoB9YQq8VnAiJ3+dGuVq9HeIT4YNr6mp2oyEkHuzgP0c/zznomYfXeC+3XGD
	TsRdyawSlVD4lsw5TWZFlAEyHzmnC/5Ne5EmPwtvN2G2OMhgxsmMsyrIXdtgBiqz18alsa+lxIou5
	fVYsJA15n1HS5tLvRJiDC88bZpVHZPHBER+i+2C3N52aQa5lsXPyBFoFKbuUN9HBCJREZz38e6LxH
	FG+B5yS0XIFJvo/X4L0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8z2-000c4X-2L;
	Fri, 16 Jun 2023 12:55:20 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA8z0-000c3k-0V;
	Fri, 16 Jun 2023 12:55:19 +0000
Received: from [167.98.27.226] (helo=[10.35.6.111])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qA8yv-009RVR-6E; Fri, 16 Jun 2023 13:55:14 +0100
Message-ID: <f0026ebc-aa35-6242-fab2-02ee35afa8b2@codethink.co.uk>
Date: Fri, 16 Jun 2023 13:55:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] riscv: kvm: define vcpu_sbi_ext_pmu in header
Content-Language: en-GB
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 anup@brainfault.org, atishp@atishpatra.or
References: <20230616115410.166244-1-ben.dooks@codethink.co.uk>
 <20230616-founder-speech-6f57f22e1412@wendy>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230616-founder-speech-6f57f22e1412@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_055518_200379_5E4C5C9F 
X-CRM114-Status: GOOD (  17.16  )
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

On 16/06/2023 13:22, Conor Dooley wrote:
> Hey Ben,
> 
> On Fri, Jun 16, 2023 at 12:54:10PM +0100, Ben Dooks wrote:
>> Sparse is giving a warning about vcpu_sbi_ext_pmu not being
>> defined, so add a definition to the relevant header to fix
>> the following:
>>
>> arch/riscv/kvm/vcpu_sbi_pmu.c:81:37: warning: symbol 'vcpu_sbi_ext_pmu' was not declared. Should it be static?
>>
>> Fixes: 3e5e56c60a1477 ("riscv: kvm: move extern sbi_ext declarations to a header")
> 
> You sure this is the right fixes tag? This code didn't exist when I
> wrote that commit, should the fixes tag not be
> 	Fixes: cbddc4c4cb9e ("RISC-V: KVM: Add SBI PMU extension support")
> instead?

I think you're right there.

> Cheers,
> Conor.
> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/include/asm/kvm_vcpu_sbi.h | 3 +++
>>   arch/riscv/kvm/vcpu_sbi.c             | 4 +---
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> index 4278125a38a5..b94c7e958da7 100644
>> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
>> @@ -66,4 +66,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>>   extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
>>   extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
>>   
>> +#ifdef CONFIG_RISCV_PMU_SBI
>> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
>> +#endif
>>   #endif /* __RISCV_KVM_VCPU_SBI_H__ */
>> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
>> index e52fde504433..c973d92a0ba5 100644
>> --- a/arch/riscv/kvm/vcpu_sbi.c
>> +++ b/arch/riscv/kvm/vcpu_sbi.c
>> @@ -20,9 +20,7 @@ static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
>>   };
>>   #endif
>>   
>> -#ifdef CONFIG_RISCV_PMU_SBI
>> -extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
>> -#else
>> +#ifndef CONFIG_RISCV_PMU_SBI
>>   static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
>>   	.extid_start = -1UL,
>>   	.extid_end = -1UL,
>> -- 
>> 2.39.2
>>

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
