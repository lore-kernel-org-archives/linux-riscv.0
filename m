Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE94EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 11:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:Mime-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fc5Imi17kE6+bkRPjywto2FgcaGxZcCHbFnKwBzkDcg=; b=1DVVxVKAkYtJ00
	fbaNgXtR8Fp29YZ3dITTeeVsnHckI3QudPKcdy4MhmBc1U18MtfiW1xwv2wshbDkPVdH2NCRsmwCW
	/qe9uppMAA1WWE4uWlSyKQbKKo9q/kfcLbYZ5v1wHw7+B+x3uHJvGVAYDtRSwlf+QYQf+OsDrtC0o
	Dr8HAG7KBZxQyHNaOoYMdmi4/PWJhDbtNqeo0WWWmNIZmqlBuZfeQUpQDbg6Bx9LAK57xqT9IDNu4
	ZVWcmNyFJzdxqrmk32xZnU+HpTrUmkJ48kBPEQbG3CNCv2ad4vToyGzuu3B3akWBvLHwqywpwC6Vu
	v0+x+pRVbo65T0kGCjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAh0-00GZmP-2S;
	Sat, 22 Jul 2023 11:22:34 +0000
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAgx-00GZlU-2G
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 11:22:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id D8FAC300089;
	Sat, 22 Jul 2023 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1690024946;
	bh=w4yOQK9JdR8adwYuBmQtHnr6Kf6iy+PgXtvgOOQRd+c=;
	h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=EwM3w5Erfo6XVlAfJ1tzdmkLR9xysd0a4U0jyTqEo8qDhZfQ7Cva+daAv2+ovg+dU
	 jRKbDi6IkY9ZJovtZN1oyrQpjwVLmP8dJLT2hjyVQHfNfTGTDzN2OtYcGJhzVj55oe
	 hBLE7D/8GNBId84BWc+wrL9fvgFq9Lx4c9FMHeeE=
Message-ID: <d7dfcb4e-d8a8-7b90-aab5-9be0fc3c9027@irq.a4lg.com>
Date: Sat, 22 Jul 2023 20:22:25 +0900
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] RISC-V: fix the comment for ISA string workaround
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
 <a7d3db75ba6f3bdd6185ff1574c9a71a14a95126.1690006695.git.research_trasio@irq.a4lg.com>
 <20230722-smog-establish-ebb3eaa5e9e9@spud>
Content-Language: en-US
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <20230722-smog-establish-ebb3eaa5e9e9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_042232_003480_99135390 
X-CRM114-Status: GOOD (  20.68  )
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



On 2023/07/22 19:52, Conor Dooley wrote:
> On Sat, Jul 22, 2023 at 06:22:38AM +0000, Tsukasa OI wrote:
>> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>>
>> Extensions prefixed with "Su" won't corrupt the workaround in many
>> cases.  The only exception is when the first multi-letter extension in the
>> ISA string begins with "Su" and is not prefixed with an underscore.
>>
>> For instance, following ISA string can confuse this QEMU workaround.
>>
>> *   "rv64imacsuclic" (RV64I + M + A + C + "Suclic")
>>
>> However, this case is very unlikely because extensions prefixed by either
>> "Z", "Sm" or "Ss" will most likely precede first.
>>
>> For instance, the "Suclic" extension (draft as of now) will be placed after
>> related "Smclic" and "Ssclic" extensions.  It's also highly likely that
>> other unprivileged extensions like "Zba" will precede.
>>
>> It's also possible to suppress the issue in the QEMU workaround with an
>> underscore.  Following ISA string won't confuse the QEMU workaround.
>>
>> *   "rv64imac_suclic" (RV64I + M + A + C + delimited "Suclic")
>>
>> This fix is to tell kernel developers the nature of this workaround
>> precisely.  There are some "Su*" extensions to be ratified but don't worry
>> about this workaround too much.
>>
> 
>> This commit comes with another minor editorial fix.
> 
> Which is what?
> 
> The new wording is fine by me though..
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

1. Use of plurals ("letters" and "bits")
2. Second "'s' & 'u'" to "'s' and 'u'"
3. Spacing after the first "'s' & 'u'" (before "(QEMU).")

It feels they are too minor to separate to another commit.
At least I should replace the commit message to "other minor editorial
fixes" and... should I clarify editorial fixes?

Thanks,
Tsukasa

> 
> Thanks,
> Conor.
> 
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>> ---
>>  arch/riscv/kernel/cpufeature.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 63277cdc1ea5..91f1ef3e762c 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -170,10 +170,11 @@ void __init riscv_fill_hwcap(void)
>>  			case 's':
>>  			case 'S':
>>  				/*
>> -				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
>> -				 * No need to set the bit in riscv_isa as 's' & 'u' are
>> -				 * not valid ISA extensions. It works until multi-letter
>> -				 * extension starting with "Su" appears.
>> +				 * Workaround for invalid single-letters 's' & 'u' (QEMU).
>> +				 * No need to set the bits in riscv_isa as 's' and 'u' are
>> +				 * not valid ISA extensions. It works unless the first multi-letter
>> +				 * extension in the ISA string begins with "Su" and not prefixed
>> +				 * with an underscore.
>>  				 */
>>  				if (ext[-1] != '_' && tolower(ext[1]) == 'u') {
>>  					++isa;
>> -- 
>> 2.40.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
