Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5700BC7EE43
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTwFJrCkllTdgkkr4cUtvWaSJ44INY0Tj7a7jnrVUA0=; b=gpv6MQcBc5oj3k
	sC9pKB4GKVq3H/HS8M8/0kt/3NHxPcYYvrKdJhKrsG47nEh43jMCvEhE5OGbLmeVDbrK+3HNxxbgV
	mGQ4vFVC3c6a1wesGhoN0A06DLq0lIu1+FwJtGA+f5ghU726R6rQwPHxgddDrkp5o1pwcrT4JbrYA
	UrT6W/dPN14ZlcqzyQrmqOxvBqS1IeJgt7UsCuhyEjHliJuSCDLH6jQOtpRCDCpBB6J/u6OyLN2Tr
	/C//p5uVIgEhndizYiYVGq6wzmof89fFICkbZjiFjPXk3sdLydikNJwcO64xxq5l4hIknMxTp8yi7
	S2DNl7oRuJQ4ZF2FdtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q84cG-00Gvd4-0g;
	Sat, 10 Jun 2023 19:51:16 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q84cB-00Gval-2C
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 19:51:13 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-191-aQsr8P1pPA2zGT4voRzmug-1; Sat, 10 Jun 2023 20:51:04 +0100
X-MC-Unique: aQsr8P1pPA2zGT4voRzmug-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 10 Jun
 2023 20:50:58 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 10 Jun 2023 20:50:58 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Andrew Cooper' <andrew.cooper3@citrix.com>, Yunhong Jiang
	<yunhong.jiang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>
CC: "Kirill A. Shutemov" <kirill@shutemov.name>, LKML
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>, "Arjan van
 de Veen" <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, "Paul
 McKenney" <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, "Sean
 Christopherson" <seanjc@google.com>, Oleksandr Natalenko
	<oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>, "Guilherme
 G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
	"Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Russell
 King <linux@armlinux.org.uk>, "Arnd Bergmann" <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
	<guoren@kernel.org>, "linux-csky@vger.kernel.org"
	<linux-csky@vger.kernel.org>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>, "Michael
 Kelley (LINUX)" <mikelley@microsoft.com>, Dave Hansen
	<dave.hansen@linux.intel.com>
Subject: RE: [patch] x86/realmode: Make stack lock work in trampoline_compat()
Thread-Topic: [patch] x86/realmode: Make stack lock work in
 trampoline_compat()
Thread-Index: AQHZmmUgtDGga6k1FUelCeu8f3dcaq+Ecr5A
Date: Sat, 10 Jun 2023 19:50:58 +0000
Message-ID: <67f939e112cc4578833ca74123bee402@AcuMS.aculab.com>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <87h6rujdvl.ffs@tglx> <20230608233402.GA3430@yjiang5-mobl.amr.corp.intel.com>
 <a56a06c2-73fd-5295-3f6c-922ccb078488@citrix.com>
In-Reply-To: <a56a06c2-73fd-5295-3f6c-922ccb078488@citrix.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_125112_062973_4F583E54 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

From: Andrew Cooper
> Sent: 09 June 2023 00:58
> 
...
> The important point is the l suffix on btsl, which forces it to be long
> (32bit) irrespective of the default operand size.

Does that matter at all?
The 'bit' opcodes (I'm sure 'bts' is 'bit test and set') take
a bit offset from the base address.
This accesses the same bit regardless of the operand size.

The one real issue is that a byte operand will only lock the one byte.
This might be problematic if non-bit locked accesses are also used.
Although it would need to be rather obscure use.
(This may be one of them...)

The only other problem is that btsl always does a locked 32bit
access. If the base address is misaligned this is a misaligned
locked access - problematic if it crosses a cache line boundary.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
