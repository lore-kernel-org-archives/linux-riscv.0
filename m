Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D36C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 23:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdjqUf9R/6dfHTDzvhPwuA7rvtGWQwTEEA1WgWFoc6c=; b=nMT3xGqfGsHwCv
	kILG1OTqXfczwLRWZgtiNR8fnWUGGkQQXYZHkeLjPsFAH8JresApY644LmkKYmtKUQvAUGg+/VnZ5
	dW3mJp47N/g8sE7ixbANBsyrg8RcnogJhYCFnZFAysGuvRLINlyETuJC60gjqdCjt+e8KaisKuQ0f
	bB4yFK3yuBv8G5qCUCuFjSLmT/IN5cADjedPzl57rjqBUq8Att7AmXaKxpXPGKrhFtAWWQ8yEr5Dr
	92cxYhtZZ3aLE9CYTwrmAPjE2GrbV7gqSIkqr16XY2JkoSx48MeKYfzDys4uqH6wJi5bt//OaEYbu
	ko47ULprszYiFtHINZwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnSCF-00000005A3y-0jg1;
	Thu, 21 Mar 2024 23:51:43 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnSC7-00000005A2M-3cdT
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 23:51:41 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-368506aa460so6284265ab.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711065093; x=1711669893; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNqlzzs3C3okF1Ihs4S4kvN5WrFgjE+GlyvdPE0dOGo=;
        b=EUKCBBNsBjm0GdLCsSYqAQ9qa6jWwXZv9nAePKUtQ3JQbWYFc7APptDVeqsCB4GtWp
         3dYUFiu4GMMHEhgPnYS6C/p8gyy4fjKJ3j+1zPRlxMTBkCDgYGzDwLK5VeTOSIC6Woiv
         vmKBuYT8yopapfyukKmtwEUP5rQmsxP7DyB+9W8LCQDkn37kg6ogAT98rxOvNuX+6r+A
         OLS4vh5jZNORLXmAKguRiT7VqMNnr3dEbzfcKamuOSLIOFVth2dIVe0LDY6jHOsK2TPP
         HvOCoy1XcvcpySDvLExlz7opvRLYXf8EAkUid32iyiMnauDxpu7Eqqacn5CHJ6slwRBI
         BLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711065093; x=1711669893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNqlzzs3C3okF1Ihs4S4kvN5WrFgjE+GlyvdPE0dOGo=;
        b=Fwl1y7ii0vnlBi+7cRFIWXeadTNYqOf2owC+DSiCvuTBv3/K0o/OXwU1gK3aONFx0E
         ckJYhmegU+oSbmg5kY9dcfOG0YULcG8AjtRXceiWzzSFnaD9yqJJw37P1fsLSjIEETaQ
         mHtrLTYxvNQj4sBjD52l7D1hqSgTOnUXS/30iy14ZS1GPrDcU950etaeP5hDXIEbfwmQ
         hajBtz0XqrneHVeUAEIGoQH91h0y1tfhCl0FE4iDfLrOP730BJ8oT+lKMp+Y3WXp67/t
         kVgV080c8RpDGIjQWGhiTizyqlqAj49wf0nVvAd0n6VWQXYiUhURatBfF3mdUEiBlqtB
         +UBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCqp3a3DCg2oqjuhyT29tKpTUszGLBkYJHCa0iVggNJC4PijDtzNo8y42rnVvVMLIDnxOFQlRI4YYFb0mjDZJBZdo3GgHTTrTLBgnSSbUs
X-Gm-Message-State: AOJu0YyJW/yPhpsGIOZdb2pa2C1nuEsJb5fEJSN2eQOA+YYuIO7J7gep
	1NHJWH+EspOI2U5UwUGb+2Z1LD9OzB+5AF8ODPfBInFq3bwwhyEg0RdLv0BXydk=
X-Google-Smtp-Source: AGHT+IG8c+yACk8/X3Es/Xp0PMdBsSuZwh0qwYwidFyL/zRGltJfSOCF3y2cOWM1wkvDI9gGTrG31A==
X-Received: by 2002:a92:dcce:0:b0:366:40dc:4d99 with SMTP id b14-20020a92dcce000000b0036640dc4d99mr986208ilr.30.1711065092945;
        Thu, 21 Mar 2024 16:51:32 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.86.189])
        by smtp.gmail.com with ESMTPSA id t5-20020a92cc45000000b00366b66af14asm237709ilq.17.2024.03.21.16.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 16:51:32 -0700 (PDT)
Message-ID: <3010bb57-c13f-494a-9e8c-0ae6393b1eee@sifive.com>
Date: Thu, 21 Mar 2024 18:51:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Do not save the scratch CSR during suspend
Content-Language: en-US
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones
 <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Pavel Machek <pavel@ucw.cz>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
References: <20240312195641.1830521-1-samuel.holland@sifive.com>
 <BJSPR01MB0561EC63D6654543D1266AD79C28A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <BJSPR01MB0561EC63D6654543D1266AD79C28A@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_165136_133357_553E1C77 
X-CRM114-Status: GOOD (  17.12  )
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

On 2024-03-14 11:55 PM, JeeHeng Sia wrote:
> 
> 
>> -----Original Message-----
>> From: Samuel Holland <samuel.holland@sifive.com>
>> Sent: Wednesday, March 13, 2024 3:57 AM
>> To: Palmer Dabbelt <palmer@dabbelt.com>; linux-riscv@lists.infradead.org
>> Cc: Samuel Holland <samuel.holland@sifive.com>; Albert Ou <aou@eecs.berkeley.edu>; Andrew Jones <ajones@ventanamicro.com>;
>> Conor Dooley <conor.dooley@microchip.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Paul Walmsley
>> <paul.walmsley@sifive.com>; Pavel Machek <pavel@ucw.cz>; Rafael J. Wysocki <rafael@kernel.org>; JeeHeng Sia
>> <jeeheng.sia@starfivetech.com>; linux-kernel@vger.kernel.org; linux-pm@vger.kernel.org
>> Subject: [PATCH] riscv: Do not save the scratch CSR during suspend
>>
>> While the processor is executing kernel code, the value of the scratch
>> CSR is always zero, so there is no need to save the value. Continue to
>> write the CSR during the resume flow, so we do not rely on firmware to
>> initialize it.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/include/asm/suspend.h | 1 -
>>  arch/riscv/kernel/suspend.c      | 3 +--
>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
>> index 491296a335d0..6569eefacf38 100644
>> --- a/arch/riscv/include/asm/suspend.h
>> +++ b/arch/riscv/include/asm/suspend.h
>> @@ -13,7 +13,6 @@ struct suspend_context {
>>  	/* Saved and restored by low-level functions */
>>  	struct pt_regs regs;
>>  	/* Saved and restored by high-level functions */
>> -	unsigned long scratch;
>>  	unsigned long envcfg;
>>  	unsigned long tvec;
>>  	unsigned long ie;
>> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
>> index 299795341e8a..3d306d8a253d 100644
>> --- a/arch/riscv/kernel/suspend.c
>> +++ b/arch/riscv/kernel/suspend.c
>> @@ -14,7 +14,6 @@
>>
>>  void suspend_save_csrs(struct suspend_context *context)
>>  {
>> -	context->scratch = csr_read(CSR_SCRATCH);
>>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
>>  		context->envcfg = csr_read(CSR_ENVCFG);
>>  	context->tvec = csr_read(CSR_TVEC);
>> @@ -37,7 +36,7 @@ void suspend_save_csrs(struct suspend_context *context)
>>
>>  void suspend_restore_csrs(struct suspend_context *context)
>>  {
>> -	csr_write(CSR_SCRATCH, context->scratch);
>> +	csr_write(CSR_SCRATCH, 0);
> If the register is always zero, do we need to explicitly write zero to the register during resume?

The register contains zero while executing in the kernel. While executing in
userspace, the value is nonzero. The value is checked at the beginning of
handle_exception(). We must ensure the value is zero before enabling interrupts,
or we might incorrectly think the interrupt was entered from userspace.

We don't know what the value will be when the hart comes out of non-retentive
suspend. Per the SBI HSM specification, Table 6: "All other registers remain in
an undefined state."

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
