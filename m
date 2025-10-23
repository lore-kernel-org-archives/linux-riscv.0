Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45468CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOZ6UvzFFmnSRimYnzkit/SbDLDZgRBCKCw62iw/vII=; b=rrApnIiDPRR+TJ5erK2AWE5rS8
	Gtkrv92ejxe7TbbHM//N4YBpoYVwwhVXMsLrkUkAkq2A+l/stI9zQnSiv6g6bZdhVUAXyY/PyHuxw
	TOFR7DVLRCfsoZM9+BymB+Da4RuabU1sb5lClv/VcMB/oqWgjBzfv67oQzNlxBW4qhoqeEz3Iqd/h
	WvlUKl36pDRJbFeR6fcxsG9+v4ISt5DFP0YijFQCN+HuG0/Ysm+f8Jtu/tx4f8+ZqeSEi1bEcjl7b
	+TU1SCor2zMXeeZCRDAB2zZtu6t9loDF8bpoM+fr36yA3vWxMPt3b0MJ7iqYjHmiOM2/WV6by/Max
	Ekxk/nZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByuz-000000073CQ-0qmz;
	Thu, 23 Oct 2025 17:16:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByuy-000000073Bx-06ge
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Oct 2025 17:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description;
	bh=X9X+jmxs3bZOeIMHDjmz4qo/mPpOfY5EsxKQvkOjXWk=; b=NmMVY+RjbGCvJ7WKvWE5N+dCff
	qCU+6jnpHdRVv4HgWX2+reyf70DsKfUGwpLnGrwN0S4lbe47SZh9OJ64iKrR/LfQ/LVGR0JcK99MW
	LfuSBvilOtY2Y8k3TcQaJ1sFcHPaG4vMcqvIQiQWzqo1RL6IK+fRPRSM+LFvLCIcYkAn/YaV4ryXN
	aoERPzMeFmkN8OoDn1pxvJ6TFNtykJTmUvjG5cDIhuA4RhZRKD4SNN+3cDbX4RTjhOCkFWriYlMby
	nIof/VSgOXYJlUYE9sC0f4uqO7KAZenTegBxM5W+Q4i6hU75cTtyBLXAN99mE15um5w2xlQQP5k59
	XEBodeQA==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBy3F-00000001X44-46SV
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 16:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Cc; bh=X9X+jmxs3bZOeIMHDjmz4qo/mPpOfY5EsxKQvkOjXWk=; b=PBPwSQUP4HMeyBKB/ry5IM
	+iBPQuNojkWzpUr0xr0aMerdf3WZ/WEoq/kjGTmaMLb3NHWbaBLkJkC5YQrlrjkUD6RzIFK5b+4Yk
	NRAc1vKLfz2K9blWHY2IyKSWOkHqqODCMckv2wrsAj7C13jWBv38MIX0HpI7Hp6OFb0GS50BlsZX+
	5MtGM9FdBMufRBu9jp1QcnGvTS/YxYiPQ5Md8Jf+Xcmk03S1d0A8QGO/wobwxbxhw1qVqKD9Gxez4
	ccBuUSlvdartDqf4BcPSzevkRbE+laXHck9UvKD9DQCDYv6HNab3fguq2hEHpDFm4/u+PlBk30hmh
	L/Vnfpeo+88Q==;
Received: from [63.135.74.212] (helo=[192.168.1.241])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vByur-00Bce9-Gk
	for <linux-riscv@lists.infradead.org> ; Thu, 23 Oct 2025 18:15:57 +0100
Message-ID: <6ea7bd96-d898-4633-b0d9-4817db356ad7@codethink.co.uk>
Date: Thu, 23 Oct 2025 18:15:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: asm: use .insn for making custom instructioons
To: linux-riscv@lists.infradead.org
References: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
 <20251017-cc34e15526ff6f64e4dbdfcb@orel>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20251017-cc34e15526ff6f64e4dbdfcb@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_172034_125719_B9DE0056 
X-CRM114-Status: GOOD (  16.66  )
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

On 17/10/2025 19:27, Andrew Jones wrote:
> On Fri, Oct 17, 2025 at 05:55:27PM +0100, Ben Dooks wrote:
>> Using .word breaks with big endian builds, making something which
>> is not a valid or worse an instruction or pair that does something
>> which is not intended.
> 
> The motivation is no longer for big endian and, since big endian
> doesn't require AS_HAS_INSN, is never really could be without adding
> that dependency. The commit message should be changed to point out
> that we want to use .insn when possible because it provides validation
> and allows mapping symbols to identify the words as instructions.
> 
>>
>> It would seem sensible to add an ASM_INSN() wrapper for anyone to
>> use for hand assembly of instructions.
> 
> This sentence isn't necessary.
> 
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/include/asm/asm.h      | 6 ++++++
>>   arch/riscv/include/asm/insn-def.h | 8 ++++----
>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>> index 8bd2a11382a3..c92f0ff51ffa 100644
>> --- a/arch/riscv/include/asm/asm.h
>> +++ b/arch/riscv/include/asm/asm.h
>> @@ -12,6 +12,12 @@
>>   #define __ASM_STR(x)	#x
>>   #endif
>>   
>> +#ifndef CONFIG_AS_HAS_INSN
>> +#define ASM_INSN(__x) ".4byte " __x
>> +#else
>> +#define ASM_INSN(__x) ".insn " __x
>> +#endif
>> +
>>   #if __riscv_xlen == 64
>>   #define __REG_SEL(a, b)	__ASM_STR(a)
>>   #elif __riscv_xlen == 32
>> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
>> index c9cfcea52cbb..35b5024db0fc 100644
>> --- a/arch/riscv/include/asm/insn-def.h
>> +++ b/arch/riscv/include/asm/insn-def.h
>> @@ -256,10 +256,10 @@
>>   	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
>>   	       SIMM12((offset) & 0xfe0), RS1(base))
>>   
>> -#define RISCV_PAUSE	".4byte 0x100000f"
>> -#define ZAWRS_WRS_NTO	".4byte 0x00d00073"
>> -#define ZAWRS_WRS_STO	".4byte 0x01d00073"
>> -#define RISCV_NOP4	".4byte 0x00000013"
>> +#define RISCV_PAUSE	ASM_INSN("0x100000f")
>> +#define ZAWRS_WRS_NTO	ASM_INSN("0x00d00073")
>> +#define ZAWRS_WRS_STO	ASM_INSN("0x01d00073")
>> +#define RISCV_NOP4	ASM_INSN("0x00000013")
>>   
>>   #define RISCV_INSN_NOP4	_AC(0x00000013, U)
> 
> Other than the commit message changes, the patch looks good.
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew


Re-worded and add the review.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
