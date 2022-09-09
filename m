Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB35ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQEzEHgcRvn+tuh4O8rrpFG3bYAxt7kL9/nL62ABCXU=; b=URdwPgIGoAnBeo
	tqoVqO4akTSO+27lM1hPbk9zKQMItNMET7SKSc4ON6lT3wT7iH+h/dSaeRym8+/GXLYoKjPzd5iEB
	TTCoD5E0D4rDG2m8ccAAJrK/of2fBv1O8QxY1p1rre9QEDoEgaxnxMb+r8yTG3uXeUT6gNNzb6g0S
	l4z3KHhvqZH8OKiTA+DidC8aiqPXz1hjLnQI5PX4PoCokuQKL7Y5Jt6XHQ0QuUigigjv2IPjCc3eJ
	3g/TvDAjCll7clNts38hNcJp5o+fLvDxkszWHaSXWcWSl3u0VumbcE1GzU+82+vPpdyg3gEYw5Zmw
	5zMnmoNvpiv2WZjY3j1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYTS-00DwQF-3E; Fri, 09 Sep 2022 07:30:50 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYTO-00DwN7-Ll
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 07:30:48 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-160-2rEwkm9hOGSozGWzT6J91w-1; Fri, 09 Sep 2022 08:30:39 +0100
X-MC-Unique: 2rEwkm9hOGSozGWzT6J91w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Fri, 9 Sep
 2022 08:30:30 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Fri, 9 Sep 2022 08:30:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sebastian Andrzej Siewior' <bigeasy@linutronix.de>, "guoren@kernel.org"
	<guoren@kernel.org>
CC: "arnd@arndb.de" <arnd@arndb.de>, "palmer@rivosinc.com"
	<palmer@rivosinc.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"peterz@infradead.org" <peterz@infradead.org>, "luto@kernel.org"
	<luto@kernel.org>, "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"heiko@sntech.de" <heiko@sntech.de>, "jszhang@kernel.org"
	<jszhang@kernel.org>, "lazyparser@gmail.com" <lazyparser@gmail.com>,
	"falcon@tinylab.org" <falcon@tinylab.org>, "chenhuacai@kernel.org"
	<chenhuacai@kernel.org>, "apatel@ventanamicro.com" <apatel@ventanamicro.com>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren
	<guoren@linux.alibaba.com>
Subject: RE: [PATCH V4 6/8] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Thread-Topic: [PATCH V4 6/8] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Thread-Index: AQHYw51MXnnvxJJMF0u4mqq9TNC6Qa3Wsk0g
Date: Fri, 9 Sep 2022 07:30:30 +0000
Message-ID: <0ff315c978d24215b00c42df51f51b2d@AcuMS.aculab.com>
References: <20220908022506.1275799-1-guoren@kernel.org>
 <20220908022506.1275799-7-guoren@kernel.org> <YxoTdxk772vneG53@linutronix.de>
In-Reply-To: <YxoTdxk772vneG53@linutronix.de>
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
X-CRM114-CacheID: sfid-20220909_003047_011672_9FA272FD 
X-CRM114-Status: GOOD (  17.30  )
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

From: Sebastian Andrzej Siewior
> Sent: 08 September 2022 17:08
> 
> On 2022-09-07 22:25:04 [-0400], guoren@kernel.org wrote:
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index a07bb3b73b5b..a8a12b4ba1a9 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -433,6 +433,14 @@ config FPU
> >
> >  	  If you don't know what to do here, say Y.
> >
> > +config IRQ_STACKS
> > +	bool "Independent irq stacks"
> > +	default y
> > +	select HAVE_IRQ_EXIT_ON_IRQ_STACK
> > +	help
> > +	  Add independent irq stacks for percpu to prevent kernel stack overflows.
> > +	  We may save some memory footprint by disabling IRQ_STACKS.
> 
> Do you really think that it is needed to save memory here? Avoiding
> stack overflows in deep call chains is probably more important than
> saving ~8KiB per CPU.

Particularly if a 64bit build is using small stacks.

Without static analysis of actual call chain depth it is
really difficult to trim the stack size.

I'd bet (a few beers) that the deepest stack use in inside
the console print code form a printk() (eg warn_on_once)
in an obscure error path somewhere.
This won't be hit during any normal testing.

I think that the analysis objtool does is getting close
to be able to generate the raw data that can be used for
static stack depth analysis.
You need the 'CFI' constants for indirect calls and
some assumptions about depth of recursive calls.
But apart from that the code to process the raw output
isn't that complex.

A nice task for someone with some spare time.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
