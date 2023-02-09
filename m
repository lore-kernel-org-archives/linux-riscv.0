Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C257C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 22:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HR5c6KmlHRcm58ZZW31NP9e0qM8daDpHXswZkCtl238=; b=I+bGcK43/AKYwd
	kseXpnRmNJzvf5vPsPgSTPoZhBw6XIOQ7Uh+TPLQewhwLyST8kz1SHKhuAFaXGXc7k6jMq1H4aXpo
	kNNVTwu+nA3B0qEngltf6ryKhhIVtoshnze3FDOfbWkx2jTIcj+hueKkOQPJRJA7CJaBb+a8fqAw5
	PwCPhs0QzxpFOeo4p/W7Xkx3io6eJk/JZIP7pWZZx5RgpeXx65q6lY2YWFVNc7MyNpBCgAYYlZbpb
	v50g4mh4fb3mmDY+mJ8pqA/g5cx/w2s6YiAga5H/r0Tx/wWhZmgWjCs3nG/dOJUd+SWCbwYhRO/cT
	39ucI6fajKhQ5FO3xmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQFh3-003RAb-Ge; Thu, 09 Feb 2023 22:47:05 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQFh0-003R94-QO
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 22:47:04 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-120-y9Hy2ItONBePGdE4Dx08xA-1; Thu, 09 Feb 2023 22:46:55 +0000
X-MC-Unique: y9Hy2ItONBePGdE4Dx08xA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Thu, 9 Feb
 2023 22:46:53 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Thu, 9 Feb 2023 22:46:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>, Mark Rutland <mark.rutland@arm.com>
CC: Evgenii Shatokhin <e.shatokhin@yadro.com>, "suagrfillet@gmail.com"
	<suagrfillet@gmail.com>, "andy.chiu@sifive.com" <andy.chiu@sifive.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guo Ren
	<guoren@linux.alibaba.com>, "anup@brainfault.org" <anup@brainfault.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "heiko@sntech.de" <heiko@sntech.de>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "mhiramat@kernel.org"
	<mhiramat@kernel.org>, "jolsa@redhat.com" <jolsa@redhat.com>, "bp@suse.de"
	<bp@suse.de>, "jpoimboe@kernel.org" <jpoimboe@kernel.org>, "linux@yadro.com"
	<linux@yadro.com>
Subject: RE: [PATCH -next V7 0/7] riscv: Optimize function trace
Thread-Topic: [PATCH -next V7 0/7] riscv: Optimize function trace
Thread-Index: AQHZPCY58FsBcndYrkieV7dCV5LmRa7HNcCg
Date: Thu, 9 Feb 2023 22:46:53 +0000
Message-ID: <90ad3009049e4d39a952b6e4c170740b@AcuMS.aculab.com>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N>
 <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N>
 <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
 <Y+O1qY453BnhqgQZ@FVFF77S0Q05N.cambridge.arm.com>
 <CAJF2gTT_aMBx3mPnzWWqj6uGM75yT_62x+_wZ4HkWd7BqEzvug@mail.gmail.com>
In-Reply-To: <CAJF2gTT_aMBx3mPnzWWqj6uGM75yT_62x+_wZ4HkWd7BqEzvug@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230209_144703_147769_F22F256C 
X-CRM114-Status: GOOD (  13.21  )
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

From: Guo Ren
> Sent: 09 February 2023 01:31
...
> > I'm a bit confused there; I thought that the `symbol(reg)` addressing mode was
> > generating additional bits that the AUPIC didn't -- have I got that wrong?
> >
> > What specifies which register the JALR will write the link address to?
>
> According to the spec, auipc t1,0x0 should write PC + 0x0<<12 (which
> is equal to PC) to t1 and then jalr t0, (t0)0 jumps to the address
> stored in t0 + 0x0 and stores the return address to t0.
> 
> That means auipc defines xxx << 12 bits, jalr defines lowest 12 bits.

...
> What I want to point out:
> If we keep "auipc (addr+00)" fixed, we could use the different
> trampolines at "jalr (addr+0x4)" (All of them must be in one 2k
> aligned area).

I looked up auipc:
"AUIPC is used to build PC-relative addresses and uses the U-type format.
AUIPC forms a 32-bit offset from the U-immediate, filling in the lowest
12 bits with zeros, adds this offset to the address of the AUIPC instruction,
then places the result in rd."

So it generates 'pc + (val << 12)'.
And the jalr then adds in a 12bit offset.

I think that means that if you have two trampolines you might need
to change both instructions even if the two trampolines are actually
adjacent instructions.
It is the distance from the call site that mustn't cross a 2k
boundary - not the absolute address of the trampoline itself.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
