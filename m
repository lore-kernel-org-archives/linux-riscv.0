Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51970C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 06:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6toFQy/JnGLuBOdPQ2hN49auYOjR0T6W0jVo9u7nVCQ=; b=dQR1kLhEUx+qgl
	PFncJSnuCkIzoXr8m4G57mLrvjY6/AlI09+QCFBB3CcQSbOKvhHQ/dMHwMrYM6zo/bkRu148uX/+c
	t7u97CrpdWf0u8ZOBT3z55g1XlNIp4WLNNNBNv9Yb9uP0QpPY92rLn5CtiEnipG8IVl/Nproz6dqg
	QdLexJQf+O5FfVsu1kwFM9WI0RHn78yNgjogEz1x0jfZ26NquzDgwwPTRn3mfFhPbg29oniKD/rtf
	4YVqFt1+zLAOGYoN40lETvFlf9vJuWmc9+bX8/bYf68XAJK+2K2/L0MUn2zu/VQP7mV1EZXomd2JN
	oPtLaUX6hUGogKq6q/rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpao-000Zk8-Bt; Fri, 03 Feb 2023 06:30:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpal-000Zj7-8x
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 06:30:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C93A9CE2EA2;
	Fri,  3 Feb 2023 06:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8BEC433EF;
	Fri,  3 Feb 2023 06:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675405828;
	bh=j6I7zaAES9oltJCRwDO/7+UEDLvZ7GINMhpnILkQXUo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mInjAoh3BTeCCcM5IeeR8jvO7wVCIrKyBP6eOVYV6NdaZ6xL9NG06/+voAtY/NscN
	 sIhzQE8MuUaZ0fgHuH3AtJL/Cu3EFqgsEA+z1mN8HZAIfFpSkEkLs0/cgNd/vEzcu8
	 gN8sPDXyCA9Wd5z11DQPttPdME4BsSvZ6hyofD9G+RR0syeIXyQKidltsmxkeC6ljs
	 bnutrPDZihk0YUE3RV9mN+oOO05+rF5iJDHC1c8EyiWNmOv1ZC/l70HktQ7Qj4YNmS
	 Wuqdu1UmnDypfEtoVZDla0QO7ItArq9+qV4UsxmzNMn93ANIZyNlMWvT/CxEwpP3Nw
	 0D5KMEzf2Arbw==
Date: Fri, 03 Feb 2023 06:30:24 +0000
From: Conor Dooley <conor@kernel.org>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Mason Huo <mason.huo@starfivetech.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_v3_4/4=5D_RISC-V=3A_Add_arch_functi?= =?US-ASCII?Q?ons_to_support_hibernation/suspend-to-disk?=
User-Agent: K-9 Mail for Android
In-Reply-To: <debdfe40909c4b4787868b11730170c9@EXMBX066.cuchost.com>
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com> <20230127091051.1465278-5-jeeheng.sia@starfivetech.com> <Y9hTGo6dfgeusW4B@spud> <debdfe40909c4b4787868b11730170c9@EXMBX066.cuchost.com>
Message-ID: <26A8AAC0-D477-45CD-A7D1-55218992B25F@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_223035_676789_E84FFE1F 
X-CRM114-Status: GOOD (  10.74  )
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



On 3 February 2023 03:43:35 GMT, JeeHeng Sia <jeeheng.sia@starfivetech.com> wrote:
>
>
>> -----Original Message-----
>> From: Conor Dooley <conor@kernel.org>
>> Sent: Tuesday, 31 January, 2023 7:31 AM
>> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Alexandre Ghiti <alexghiti@rivosinc.com>
>> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
>> Subject: Re: [PATCH v3 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
>> 
>> +CC Alex
>> 
>> Alex, could you take a look at the page table bits here when you get a
>> chance please?
>> 
>> > + * @a0 - destination
>> > + * @a1 - source
>> > + */
>> > +	.macro	copy_page a0, a1
>> > +		lui	a2, 0x1
>> > +		add	a2, a2, a0
>> > +.1 :
>> > +		REG_L	t0, 0(a1)
>> > +		REG_L	t1, SZREG(a1)
>> > +
>> > +		REG_S	t0, 0(a0)
>> > +		REG_S	t1, SZREG(a0)
>> > +
>> > +		addi	a0, a0, 2 * SZREG
>> > +		addi	a1, a1, 2 * SZREG
>> > +		bne	a2, a0, .1
>> 
>> allmodconfig, clang 15.0.4:
>> 
>> <instantiation>:3:1: error: unexpected token at start of statement
>> .1 :
>> ^
>> /stuff/linux/arch/riscv/kernel/hibernate-asm.S:83:2: note: while in macro instantiation
>>  copy_page a0, a1
>>  ^
>> <instantiation>:12:15: error: unknown operand
>>   bne a2, a0, .1
>>               ^
>> /stuff/linux/arch/riscv/kernel/hibernate-asm.S:83:2: note: while in macro instantiation
>>  copy_page a0, a1
>>  ^
>> make[5]: *** [/stuff/linux/scripts/Makefile.build:384: arch/riscv/kernel/hibernate-asm.o] Error 1
>Hi Conor, I couldn't reproduce the above error, could you share the build command please?

It was just allmodconfig with LLVM=1

>> 
>> > +	.endm
>> > +
>> >  #endif	/* __ASM_ASSEMBLER_H */
> 
>> Thanks,
>> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
