Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9717ACCD191
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NKtnWLykfmNHt5lemT2sdYcxkEZQ/MEe+pl4d1K4NI=; b=ysAv82hdf+9yI1
	ZN8ubyhq2VnSuWg5cT5iB0CY4vNJS75YCzMffU5uUpFwEsjEngyyPqR/Y+/VtuDcNI2BKcehTt1Fx
	5WwIrAgBhYReEl0yk/GjE2jn1UINJKosQ52eEDNlm9/9PCv2zP6lfMVf/N+dp2gziwWqcuMrUC7oO
	5nvDNE4Rmm4lD/P6r1y/Nqv78JGei7gEjEILZoAriw4EtjjnB/KzKGtVJQozDXXrGROgVfz/YIasn
	+kMWUeAmV9W1gxozpi/XfTs8GGsPaUAZqDHZuKv5n708WvsZQGoMSyE6pTpGt5UmkMQUW9x6PS0lg
	NwUVtGOh8T920cLZdc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqmP-00000007uPy-0rUa;
	Wed, 18 Sep 2024 09:15:21 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqmM-00000007uPK-3bDK
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 09:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7HunsVn0i5H7wnrEH05aye8p87cvPSuFCD3jzC2lA0g=; b=t9inYu4U6E1kC/xPcQuTLp234C
	z4pqXaYIQ4CNSLPQhOFjJHBSsO7w1cgupmgp43IWryqO6+iaRSpjXIrNLqu2ShsMnrV2MUhfnwaom
	l9PrzQlpqNItkDs7va91QXWpq3SGLIpVQMtz/5OeoEOp7JXzs2+Tb5mWZlMutXhzoHpTJyipjZS7Q
	ukXEyq/XVyQ5QQcwLfUjT7d2kqn7Yfqf5jQtXLdkMTOLitj8K/fRb2W76S7Ol3Nx4iiK4rBpMhQWl
	YbYQdIlzysB+VPEi8xHpR7S3T/YD8IUJP2ffjeN9QfJtT8ELyFpMXhMRbewbDx3zNjJ06wGQ+bTiG
	7uZdur7A==;
Received: from [83.68.141.146] (helo=[10.136.0.254])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqqmH-00BrLu-NK; Wed, 18 Sep 2024 10:15:14 +0100
Message-ID: <3b2c206f-bea6-4058-ac6c-c8b1071fdb8c@codethink.co.uk>
Date: Wed, 18 Sep 2024 10:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: add trap and emulation for RDCYCLE
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org
References: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
 <20240917130853.18657-4-ben.dooks@codethink.co.uk>
 <20240918-a465abde626cce8b72ba4758@orel>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20240918-a465abde626cce8b72ba4758@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_021518_934334_CA5EEE01 
X-CRM114-Status: GOOD (  25.12  )
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

On 18/09/2024 07:45, Andrew Jones wrote:
> On Tue, Sep 17, 2024 at 02:08:53PM GMT, Ben Dooks wrote:
>> Add a trap for RDCYCLE and emulate it as RDTIME instruciton.
>>
>> This is an initial PoC and should probably be made more generic
>> way of trapping and dealing with bad instructions
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/kernel/traps.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index 1c3fab272fd1..51ea28ebf54d 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -167,6 +167,35 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
>>   DO_ERROR_INFO(do_trap_insn_fault,
>>   	SIGSEGV, SEGV_ACCERR, "instruction access fault");
>>   
>> +#define is_system(__i) (((__i) & 0x7f) == RVG_OPCODE_SYSTEM)
> 
> We have riscv_insn_is_system()
> 
>> +
>> +static bool riscv_try_csr_fixup_user(struct pt_regs *regs, u32 insn)
>> +{
>> +	/* expecting a 4 byte CSR instruction (*/
>> +	if (unlikely(GET_INSN_LENGTH(insn) != 4))
>> +		return false;
>> +
>> +	if (is_system(insn)) {
>> +		u32 csr = insn >> RVG_SYSTEM_CSR_OFF;
>> +		u32 rd = (insn >> RVG_RD_OPOFF) & RVG_RD_MASK;
>> +		u32 rs = (insn >> RVG_RS1_OPOFF) & RVG_RS1_MASK;
>> +		u32 funct3 = (insn >> RV_INSN_FUNCT3_OPOFF) & 0x7;
> 
> There are are a few other macros in asm/insn.h that can be applied, such
> as RV_EXTRACT_RD_REG(), and more could be added if necessary.
> 
>> +
>> +		if (rs == 0 && funct3 == 2 && csr == CSR_CYCLE) {
> 
> We could probably create a riscv_insn_is_csr_read() and RV_EXTRACT_CSR()
> for this.
> 
>> +			u64 val = csr_read(CSR_TIME);
>> +			/* we've got a RDCCLYE, emulated it with CSR_TIME */
>> +
>> +			printk_ratelimited("PID %d: process using RDCYCLE, emulating with RDTIME\n", current->pid);
> 
> If we add current->comm it may be easier to find applications that should
> be converted to CSR_TIME.

I guess I should have also checked for the 32bit case too, but i think
those are slightly different encodings for RDCYCLE/RDCYCLEH calls.


> 
>> +
>> +			regs_set_register(regs, rd*sizeof(unsigned long), val);
> 
> nit: spaces around the '*'
> 
>> +			regs->epc += 4;
>> +			return true;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
>>   {
>>   	bool handled;
>> @@ -186,6 +215,8 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>>   		}
>>   
>>   		handled = riscv_v_first_use_handler(regs, insn);
>> +		if (!handle)
>                       ^handled?
> 
>> +			handled = riscv_try_csr_fixup_user(regs, insn);
>>   
>>   		local_irq_disable();
>>   
>> -- 
>> 2.37.2.352.g3c44437643
>>
>>
> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
