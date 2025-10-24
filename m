Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD3ACCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsfV64IsUUmzNdocS7r3an27jiprbnQRP6fpZ6Apovs=; b=WiUVtP6YXWR1gs
	EjLuvR0w++s1sjLszUUBikXFT2+wX2I8MDkn7/WXenW1n+vBQhp9Eaeh6y85sDV5OzCHbsQ96MZnu
	XdMIYGlyCb6E/p8eEWROm/88yD6olfAntrQLRNeFrpN/Newd3Vynxacij+QBlbq0WeOPm2VYUz6Yb
	gsGLjFEpZf3NWtc6muzjOch/A1EQv4Jeqf5hMbD940IbkSvxzZYf4G0E0+EDzHmz1yqhUc8gwmFBl
	JGkroKZi8VKwL9C5E3ZNEKNoKdaeNNEg1WI3mOrQ/+A7NazClfN73HdgWDAodSJ918uIKKRf+AXG/
	t/ng/6wDwKHQrWMzBxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCETn-00000008vxu-1M9s;
	Fri, 24 Oct 2025 09:53:03 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCETk-00000008vwy-2trm
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 09:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=0GI+8ZC3iIdYFxrvCUu8O1So+ugjo11WhjG4xy6OKeg=; b=e3iIBLxMMjINth5g
	Bmv7LQ69/9/sT60hZwEj2x4It3vChphpfjgrrq8yHRtT3dbil82M7OfBUpqotgkR3dzHMXSkJerpD
	IO0yoPqzP8jfZE1ITYGvW9eUMLgldt/cHGdRoiPrWfqRfYLVV84oI5SKzFgnUwGYGWN2syap/jjjG
	Ej68fJxXt56fn2tZTwvmChgb/uonrUQ+qDkCLQaoH+M1jwhNXs3xVqPtIxIKeyOgJJOtw3ZMiEooJ
	VN/C7PcC3P8gYBeBe9+VflFZep9ujDSV5YXIlHMSS5f4HzAOXdjp3ZrEV3c69g+GuV8DnLNMCS27J
	ELwkCcpSze8fvtsbnw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vCETX-00CeDC-FX; Fri, 24 Oct 2025 10:52:47 +0100
Message-ID: <a4aeef53-0789-47ca-a838-207df2a5072f@codethink.co.uk>
Date: Fri, 24 Oct 2025 10:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: asm: use .insn for making custom instructioons
To: Paul Walmsley <pjw@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ajones@ventanamicro.com, macro@orcam.me.uk
References: <20251023174040.1037765-1-ben.dooks@codethink.co.uk>
 <f9dba0cc-50d7-5960-91dc-e7e3496387e0@kernel.org>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <f9dba0cc-50d7-5960-91dc-e7e3496387e0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_025300_819045_CD12F742 
X-CRM114-Status: GOOD (  13.67  )
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

On 24/10/2025 04:12, Paul Walmsley wrote:
> Hi Ben,
> 
> On Thu, 23 Oct 2025, Ben Dooks wrote:
> 
>> The assembler has .insn for building custom instructions
>> now, so remove the .4byte which also ensures the output
>> is marked as an instruction and not as data (which may
>> confuse both debuggers and anything else that relies on
>> this sort of marking)
>>
>> Add an ASM_INSN_I() wrapper in asm.h to allow the selecting
>> of how this is output so older assemblers are still good.
>>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>> v2:
>>    - fixed #ifndef v #ifdef
>>    - added custom MIPS instructions too
>>    -
>> ---
>>   arch/riscv/include/asm/asm.h                    | 6 ++++++
>>   arch/riscv/include/asm/insn-def.h               | 8 ++++----
>>   arch/riscv/include/asm/vendor_extensions/mips.h | 6 +++---
>>   3 files changed, 13 insertions(+), 7 deletions(-)
>>
> 
> [ ... ]
> 
>> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
>> index c9cfcea52cbb..a7860e6b908d 100644
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
>> +#define RISCV_PAUSE	ASM_INSN_I("0x100000f")
>> +#define ZAWRS_WRS_NTO	ASM_INSN_I("0x00d00073")
>> +#define ZAWRS_WRS_STO	ASM_INSN_I("0x01d00073")
>> +#define RISCV_NOP4	ASM_INSN(_U"0x00000013")
> 
> This looks garbled.  Is this intentional?

No, must have done this between writing it and saving.

Worse is it builds fine :/

Will do v3, thanks.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
