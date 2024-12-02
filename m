Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70882D10DDE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRsFKCi3zZr4YPrRDHZ1nd5ZFTJwLi7eWckYMI0pga0=; b=elb/iSz8YRRl4C
	GaNX6zH4jb/95tH2AH8UFlFJPwJ0i4ZgtSZ4nAVn3E3+zDD+c9QU9L82VYYy4L5K8CVvnsjJgmzgg
	pFyHVGEHEU70mg+jTg5gg5CRqzrbrlWRkbFG/I3f8a9W4HwCkt4nd7Yln93Z2AMUbp1fuhN4ab0HH
	OO0NzLNXpDMBuHjr/Nj9+R8X3OzYR9XWyK9cdLO7Jr8vt6R6wDJ/U2H38n+9CxglJcMyup9S3dBXm
	DP0NvU0mXqGkJeFRR5aDLSlVuBmIFVxMWJFJatxKX/CQo5uD0TBaPzHBjjwiI4RlRwX0Ic88IrKEc
	/UNOD7UmH2Yp1QxfC7Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2eW-00000005Xzh-2zqc;
	Mon, 02 Dec 2024 09:23:36 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2eU-00000005XzG-48Xy
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 09:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4Yk2gyflUHJtqfTPyxq5rfbokj0P06x6vTIuJRkjYTM=; b=kM7ZWfZhCedJuCNKH2PaXKAQ9A
	1NYv2qi2IcgwHIOWK6rXgfA5bQn/F8A2Nw116hsnpC70yjt39BWkk091XecfKzIXwTb5NWg/Y9HF2
	SYT7EgDc21fVoq56mIPcVyT8AGxYP9bh/Hn7cQG8oQMnknpC4Y8otOsaHjZA4XXRKUD/2NiANWULS
	8YuN589SIz9VdKtAZAUVm2QxbmvLC2E7iw+jZCttT/bfITJvwSbYoNVDh7+KdWo5rPN22fs3DhS6n
	B3iGszDU5/WNphEhWaCnge1LKzN3YvAHVg/gQ6P+Jhlgw78vvleIYi7DM2CAcA15ObAVMFN/O0qz0
	07YU14Yw==;
Received: from [167.98.27.226] (helo=[172.16.100.165])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tI2eO-00EHTQ-DX; Mon, 02 Dec 2024 09:23:29 +0000
Message-ID: <920e4c25-7846-4301-b318-e984334499fc@codethink.co.uk>
Date: Mon, 2 Dec 2024 09:23:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv: traps: make insn fetch common in unknown
 instruction
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
 <20241201102759.221176-3-ben.dooks@codethink.co.uk>
 <20241202-497efc55997ac9d7c8c297fc@orel>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20241202-497efc55997ac9d7c8c297fc@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_012335_113184_F6472703 
X-CRM114-Status: GOOD (  15.65  )
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

On 02/12/2024 09:16, Andrew Jones wrote:
> On Sun, Dec 01, 2024 at 10:27:58AM +0000, Ben Dooks wrote:
>> Add the trapped instruction (insn) as the second argument to
>> riscv_v_first_use_handler() from the trap handler so when we
>> add more handlers we can do the fetch of the instruction just
>> once.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>> - fixed wording of patch from rfc
>> v2:
>>    - fixed todo by going to illegal instruction error if get_user fails
>>    - added pointer print for failed read
>>    - fixed issues with rebasing onto main branch
>> ---
>>   arch/riscv/include/asm/vector.h |  4 ++--
>>   arch/riscv/kernel/traps.c       | 14 +++++++++++++-
>>   arch/riscv/kernel/vector.c      | 11 +----------
>>   3 files changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
>> index c7c023afbacd..9ec2473c1b73 100644
>> --- a/arch/riscv/include/asm/vector.h
>> +++ b/arch/riscv/include/asm/vector.h
>> @@ -22,7 +22,7 @@
>>   extern unsigned long riscv_v_vsize;
>>   int riscv_v_setup_vsize(void);
>>   bool insn_is_vector(u32 insn_buf);
>> -bool riscv_v_first_use_handler(struct pt_regs *regs);
>> +bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn);
>>   void kernel_vector_begin(void);
>>   void kernel_vector_end(void);
>>   void get_cpu_vector_context(void);
>> @@ -270,7 +270,7 @@ struct pt_regs;
>>   static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
>>   static __always_inline bool has_vector(void) { return false; }
>>   static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
>> -static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
>> +static inline bool riscv_v_first_use_handler(struct pt_regs *regs, u32 insn) { return false; }
>>   static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
>>   static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>>   #define riscv_v_vsize (0)
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index 51ebfd23e007..9662138ba45c 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -172,11 +172,23 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
>>   	bool handled;
>>   
>>   	if (user_mode(regs)) {
>> +		u32 __user *epc = (u32 __user *)regs->epc;
>> +		u32 insn = (u32)regs->badaddr;
>> +
>>   		irqentry_enter_from_user_mode(regs);
>>   
>>   		local_irq_enable();
>>   
>> -		handled = riscv_v_first_use_handler(regs);
>> +		if (!insn) {
>> +			if (__get_user(insn, epc)) {
>> +				printk_ratelimited(KERN_ERR "traps: failed to read instruction at user %px\n", epc);
> 
> I don't think we want this, even ratelimited.
> 

Ok, it is a bit weird but I suppose it will end up generating a fault.



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
