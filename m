Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A7BCCD192
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Gst2mniQd2gY6s4QAWctalX8yV0qBKU/dYC+1oGQjU=; b=rYpm2rrWT7i990
	KYgOLrQggluI6/C+03ToKeGsXLSt5awfHSBS16uu0wpFBd+Orz5NHrHoDoTyEQ8A8IBtwGJBUqOMm
	Q8mpgzjVUFzpqznulr7Fs4GVeW8NOSGDp6XU6V140Jevyu7+3ZPQOr5CY7I/9gZX19hUk3trymgQa
	0Ychc4yI7Q3t1+s2TrisCwXYkAFZwShYBU95BYijhIpTZJLMjmW54AkmJkKR3prPk2O5tOaJwuXn+
	DavXAly11bpwIbvYrQfUWefo7QKBXhnxD9uFxDj6tvxczMVQY70Dmp6AvEOdc0WlyRnZc6gMfUyW2
	gngXYYvB+nuoMvphf3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqez-00000007tiz-1I8s;
	Wed, 18 Sep 2024 09:07:41 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqqew-00000007ti7-3Bic
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 09:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yNAK/OKQT3dRIkbSu4E3cCi+/OlSS0ZmMUvwc9bXbI8=; b=I/oW7NIJUZ1bO78AOmstia8yIZ
	rSc1c9AISsvHdLi8GzVr/OdR2xL13iOuTSx/chUNheO4f0P4eTi9Rmpme+HQodiVAm1kbRI0GBZ7i
	PBiH06NhuVtkX21iYh0+hL1Cm0RNXB4x9bRGrYCDHxwpFYIW+9MFKsb82pFpVAT0VI5qC6LK2TbXR
	CYjS5dPxqSmYLYDh/w/znw6lQEVCbhFmhoEui2n/m8nLEjwq0xMO+v6eQQwD7INjOLDV3pCsD/B8i
	B7Gr4TbF/l8RkAmaNW1Uhdg/w3g6WApyf62Gv9HhSu0TtjF5iG/SxIudy46z7OH9eJgICXUkYjhY9
	KadUrgIA==;
Received: from [83.68.141.146] (helo=[10.136.0.254])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqqes-00Br8b-D8; Wed, 18 Sep 2024 10:07:34 +0100
Message-ID: <5daeb572-563d-4cda-9f67-042f0ab380f5@codethink.co.uk>
Date: Wed, 18 Sep 2024 10:07:33 +0100
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
X-CRM114-CacheID: sfid-20240918_020738_919568_1BC99562 
X-CRM114-Status: GOOD (  22.53  )
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

Ah, didn't notice that.

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

will have a look at that.

>> +
>> +		if (rs == 0 && funct3 == 2 && csr == CSR_CYCLE) {
> 
> We could probably create a riscv_insn_is_csr_read() and RV_EXTRACT_CSR()
> for this.

Not sure if this is totally necessary. I will check for the relevant 
read/write type from the CSR acces instructions

>> +			u64 val = csr_read(CSR_TIME);
>> +			/* we've got a RDCCLYE, emulated it with CSR_TIME */
>> +
>> +			printk_ratelimited("PID %d: process using RDCYCLE, emulating with RDTIME\n", current->pid);
> 
> If we add current->comm it may be easier to find applications that should
> be converted to CSR_TIME.

ok, will add.

>> +
>> +			regs_set_register(regs, rd*sizeof(unsigned long), val);
> 
> nit: spaces around the '*'

oops. will fix

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

Thanks.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
