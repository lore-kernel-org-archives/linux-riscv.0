Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D050C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 03:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsL6AFoTluoYuzkYQAp4OtS5FZwDSakdm7S3vXI81CU=; b=4JqKw3zFcTqgq9
	hu6faglnNrwkAOmS4l/UF1DDxqjVnB9egFR7YYK7Oig5vT+NJBZMdb7LnibMXCmF9fgGmi+D7He7V
	61ZwDxEr68uQSFyyt26pD/IYDqqhYTuj/5ACOaFLEfCT6tVfHWX1rMQb+mu1mum3k25O8WCQU6eDW
	dxpO+69CV4iVauben3+WwWWAZrQ5sPG8LiktLXC+WpKOMlAFVD+ohNBvN+3/vJndvr08+CXvEaVSL
	aPUI0V3r2fM4W76qFwD1U1SIWWucMQkpaa3UhKQoAifk0x4BGo1WU1gTleGahjnlJOqcopgLooNgs
	Oyl2PBpdxL+9gp/9x+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNmzy-000C73-P1; Fri, 03 Feb 2023 03:44:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNmzv-000C2T-7q
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 03:44:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5505A24E13F;
	Fri,  3 Feb 2023 11:43:36 +0800 (CST)
Received: from EXMBX065.cuchost.com (172.16.6.65) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 11:43:36 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX065.cuchost.com
 (172.16.6.65) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Feb
 2023 11:43:35 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 3 Feb 2023 11:43:35 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v3 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Topic: [PATCH v3 4/4] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Thread-Index: AQHZMi9ZN0+4F1UUIkevO0NjoPA20663GzgAgAWChyA=
Date: Fri, 3 Feb 2023 03:43:35 +0000
Message-ID: <debdfe40909c4b4787868b11730170c9@EXMBX066.cuchost.com>
References: <20230127091051.1465278-1-jeeheng.sia@starfivetech.com>
 <20230127091051.1465278-5-jeeheng.sia@starfivetech.com>
 <Y9hTGo6dfgeusW4B@spud>
In-Reply-To: <Y9hTGo6dfgeusW4B@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.50.196.81]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_194423_457664_30D16C81 
X-CRM114-Status: GOOD (  10.10  )
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, 31 January, 2023 7:31 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Alexandre Ghiti <alexghiti@rivosinc.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v3 4/4] RISC-V: Add arch functions to support hibernation/suspend-to-disk
> 
> +CC Alex
> 
> Alex, could you take a look at the page table bits here when you get a
> chance please?
> 
> > + * @a0 - destination
> > + * @a1 - source
> > + */
> > +	.macro	copy_page a0, a1
> > +		lui	a2, 0x1
> > +		add	a2, a2, a0
> > +.1 :
> > +		REG_L	t0, 0(a1)
> > +		REG_L	t1, SZREG(a1)
> > +
> > +		REG_S	t0, 0(a0)
> > +		REG_S	t1, SZREG(a0)
> > +
> > +		addi	a0, a0, 2 * SZREG
> > +		addi	a1, a1, 2 * SZREG
> > +		bne	a2, a0, .1
> 
> allmodconfig, clang 15.0.4:
> 
> <instantiation>:3:1: error: unexpected token at start of statement
> .1 :
> ^
> /stuff/linux/arch/riscv/kernel/hibernate-asm.S:83:2: note: while in macro instantiation
>  copy_page a0, a1
>  ^
> <instantiation>:12:15: error: unknown operand
>   bne a2, a0, .1
>               ^
> /stuff/linux/arch/riscv/kernel/hibernate-asm.S:83:2: note: while in macro instantiation
>  copy_page a0, a1
>  ^
> make[5]: *** [/stuff/linux/scripts/Makefile.build:384: arch/riscv/kernel/hibernate-asm.o] Error 1
Hi Conor, I couldn't reproduce the above error, could you share the build command please?
> 
> > +	.endm
> > +
> >  #endif	/* __ASM_ASSEMBLER_H */
 
> Thanks,
> Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
