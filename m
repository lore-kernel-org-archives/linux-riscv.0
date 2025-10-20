Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC8ACCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 11:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJlqSsvJ3yPGdJZibDBy83U1Ats27lqOmmx9QrmL+KE=; b=GcRkBpVr8AmOZc
	LoCmutgQ9dDVK4xcMZS714LxGMDsWeb8rFZSAmK2oEIUN/gABzTivlJZiLH92Tdm6l5mKwrQnn/kw
	Nmfw/xRkGoTrrCU5pUTDIQI8d8J5XsiFtR5e1XypWpafDwrPmuI9/kC9KLDDckaAB5ZhaYApLGjAB
	DJbpLMGLNGLTcq0hEBlRsSHsjuLs5swT16XhlldwmHKWL9Y7SMAXEeV6pvueOHpQpwsumTFwbG23Y
	pTqI34V6Vgb0w2YuklzMvo5GLWZi/WmntBK/7tjuZc+PzR20ZtxVv7+WVZH+SIO2z9yx97e6cyfyv
	blhBfbYCBIBmr9C7vv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngl-0000000CzWq-1eqj;
	Mon, 20 Oct 2025 11:04:31 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAngj-0000000CzUE-0Uec
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 11:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=F2rEsTAgxjGpezCDajMh94r4nDEKpQQN1wHXqhyXm+o=; b=IXMUnkuCJKMNl52x
	yvTAaj5IZHhFVsSR7EMAmwDMzI0cxsN4pl2euTK/WMguaHdASKFJNYI15o80MWedIEtFukUlw6HID
	Hf7rkjBXt+mtj9xCw4IWwNEovAIetEadWusAiCLv7ekLekrkJBUldtaX/r0MU7YAeVanH4YtZpDET
	Yww9EmxxRGfwd8xUCQrIzM42L4HCxFodhVVfou0qb43aSwI0Fn/DE/PjAX3ay6TMql7AjSQ5Sg+gi
	IpXOasypr6+becZ3o44/vOEoIOQETgtvwyCOb1rj4QX+6cobjFFozHX4NRUI1mrLeGAzcHlQvcyBb
	nIOjHCM3FR0XXW7cgw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vAngY-00GxSU-LN; Mon, 20 Oct 2025 12:04:18 +0100
Message-ID: <e353132b-1795-4cc9-87e2-fc24a7ae457a@codethink.co.uk>
Date: Mon, 20 Oct 2025 12:04:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/18] riscv: asm: use .insn for making custom
 instructioons
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, -linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>,
 Javier Jardon <javier.jardon@codethink.co.uk>, Ben Dooks
 <bjdooks@gmail.com>, Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Roan Richmod <roan.richmond@codethink.co.uk>, Sam Grove <sgrove@mips.com>,
 Chao-ying Fu <cfu@mips.com>, Mukunda Aprameya <maprameya@mips.com>,
 Umesh Kalappa <ukalappa@mips.com>,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>,
 Kurt Martin <kmartin@mips.com>, allikarjuna Gouda <mgouda@mips.com>,
 Vaibhav Chauthmal <vchauthmal@mips.com>, wapnil Agrawal <sagrawal@mips.com>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
 <20250822165248.289802-6-ben.dooks@codethink.co.uk>
 <20251002-8cb00cce2a2bc7274b3ad503@orel>
 <20251002-c06f1cdf287f9e00c3674942@orel>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20251002-c06f1cdf287f9e00c3674942@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_040429_285851_CF5A9D54 
X-CRM114-Status: GOOD (  14.38  )
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

On 02/10/2025 15:51, Andrew Jones wrote:
> On Thu, Oct 02, 2025 at 09:45:05AM -0500, Andrew Jones wrote:
>> On Fri, Aug 22, 2025 at 05:52:35PM +0100, Ben Dooks wrote:
>>> Using .word breaks with big endian builds, making something which
>>> is not a valid or worse an instruction or pair that does something
>>> which is not intended.
>>>
>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>> ---
>>>   arch/riscv/include/asm/insn-def.h | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
>>> index d5adbaec1d01..2a3019bc1a3b 100644
>>> --- a/arch/riscv/include/asm/insn-def.h
>>> +++ b/arch/riscv/include/asm/insn-def.h
>>> @@ -256,10 +256,17 @@
>>>   	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
>>>   	       SIMM12((offset) & 0xfe0), RS1(base))
>>>   
>>> +#ifndef CONFIG_AS_HAS_INSN
>>>   #define RISCV_PAUSE	".4byte 0x100000f"
>>>   #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
>>>   #define ZAWRS_WRS_STO	".4byte 0x01d00073"
>>>   #define RISCV_NOP4	".4byte 0x00000013"
>>> +#else
>>> +#define RISCV_PAUSE	".insn 0x100000f"
>>> +#define ZAWRS_WRS_NTO	".insn 0x00d00073"
>>> +#define ZAWRS_WRS_STO	".insn 0x01d00073"
>>> +#define RISCV_NOP4	".insn 0x00000013"
>>> +#endif
>>
>> I agree we should use .insn when possible because it provides validation
>> and allows mapping symbols to identify the words as instructions. So ack
>> to the change, but without adding a depends on AS_HAS_INSN to the riscv
>> CPU_BIG_ENDIAN config, then the commit message should drop the reference
>> to big endian for its motivation.
>>
> 
> And Patch14 of this series looks good, but it should be squashed into this
> one.
> 
> Thanks,
> drew
> 

ok, thanks.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
