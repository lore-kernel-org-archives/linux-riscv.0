Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F655D41C31
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 10:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIYgLjYX/ANL/7JySTXwEb4EZU18GpCJjxyhedPBs3E=; b=SWc3meORTelCEz
	9Vn2OjwrYvcxJpcySOfouxN4qVjpt5tdmQELlQbZPHTdiPKrTcxYu6M5rpKI0eI8JxJndLJdTdMBC
	L1Rp0LEpgaEcqzGp5D50OeCf0X0pwsu5fTgfEoln9moTd+tBGGE3cMgNHIxSEWkK7rUnODFoaApmW
	lC61fjdISmtDwB9sRKlM0HhVOmD2jNtkT8XyiRpQMbq/LF9X28RYSsV4LtWHccr9Ap7/TiclrljlX
	rnm60rXc6MJHKSqlyuVd0uNn5hzbY+f7vm0LRA31YcpWZqzNoBSDcjEPHOpyqZerrDNyZOix6z99w
	CS4XYyTCYKDGyoOZsrsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAkb-00000006TJg-1DMy;
	Wed, 13 Nov 2024 10:37:29 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBAiN-00000006Syk-3A3A
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 10:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WFrlD3CGkqDD4l0lx0gGpSQZHz4g0b+NNmiWS+uOR9o=; b=mLZOG5B9qW3J09Nj/uXHWapy/i
	7WG13KaD42O/ze/ppq/uuuZ6WUURnh0n8aTwN7s0vSAU/xQxlqaOc37irU32yEQZpIkrgbJmTbeNL
	2qBMHStAn9KIvAnp9ACFxef2tRXU8wtRlsSZY5SbQ8geMU9zh1UEyHpFfHA+cdkdavOcnki2FgyRy
	bTjlT76udLOomsW/DN6qOV1XQX2hI5w9gOlih79dDMfN3aeNuxPo1dYkJ3oE2Oaogp4/ELlwGcCVP
	clma9kOx0AMzwzU3ZJevyIVgs1vHI6uvswmOj4XrKaRtJZT0k1YqDB6/lYFdUjxpqknd08+amqwxi
	TXGaAnZA==;
Received: from [63.135.74.212] (helo=[192.168.1.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tBAiJ-003xqE-CX; Wed, 13 Nov 2024 10:35:08 +0000
Message-ID: <133bc3d8-5196-4207-8e1b-e3da5fa82630@codethink.co.uk>
Date: Wed, 13 Nov 2024 10:35:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: insn: add RV_EXTRACT_FUNCT3()
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, alex@ghiti.fr
References: <20241113091703.3133017-1-ben.dooks@codethink.co.uk>
 <20241113091703.3133017-4-ben.dooks@codethink.co.uk>
 <20241113-c53841e015159bbf656643ae@orel>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20241113-c53841e015159bbf656643ae@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_023511_909021_654F4F19 
X-CRM114-Status: GOOD (  14.06  )
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

On 13/11/2024 10:17, Andrew Jones wrote:
> On Wed, Nov 13, 2024 at 09:17:03AM +0000, Ben Dooks wrote:
>> Add extraction for the func3 field of most instructions
>> for use with anyone who needs it.
>>
>> Note, added this for decoding of CSR accesses for
>> work we did looking at the RDCYCLE v RDTIME calls.
>>
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> ---
>>   arch/riscv/include/asm/insn.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
>> index 09fde95a5e8f..c67f44ff2066 100644
>> --- a/arch/riscv/include/asm/insn.h
>> +++ b/arch/riscv/include/asm/insn.h
>> @@ -299,6 +299,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
>>   	({typeof(x) x_ = (x); \
>>   	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
>>   
>> +#define RV_EXTRACT_FUNCT3(x) \
>> +	({typeof(x) x_ = (x); \
>> +	(RV_X(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK)); })
>> +
>>   #define RV_EXTRACT_UTYPE_IMM(x) \
>>   	({typeof(x) x_ = (x); \
>>   	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
>> -- 
>> 2.37.2.352.g3c44437643
>>
> 
> It doesn't hurt to have an unused macro and there's a reasonable chance
> there will be a user someday, but I'd typically wait for a user before
> adding stuff. Anyway,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

I am wondering if we add a check for RDCYCLE and print a warning
even if we didn't try an fixup.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
