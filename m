Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE462C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 22:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djH9PkoLqX+TUpsq9Qz9mqujdiGnISLGeccgKp5LaWY=; b=DaSjKucsJ8jgSO
	82hj7OcOI1MPSNuMCiMIeo4QsDoLjumpOg0YX48M3W3j6GoLZxwXoCU/J4+D5odesyh5mXVy4TaW0
	dI2bJrJDG+A/0j6NsZGlD99gWCr5zj69k3lgCUaLiefar/rxoXQA9hIxUIqDFZDRMx+w0yndjyHC/
	fQKuZO/YtjxB0ga4bMll7heLscGCcuf14NMnwlooqXU2mMRLyVURN8XswMJtGj2zV4tcKdhdROivc
	q+tIn/QurHDnlNCI2yZZOAvDXgLnfN2TnYw7IgmuKQPYmmgCFwesA1g66Erup/UsdDirVPTuXGkjU
	W+BXWYvVp963ivA+IjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsws-00H57v-9R; Wed, 08 Feb 2023 22:29:54 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPswm-00H55r-9u
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 22:29:52 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-62-7A3AGomqMleUYNu3luwyAg-1; Wed, 08 Feb 2023 22:29:43 +0000
X-MC-Unique: 7A3AGomqMleUYNu3luwyAg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Wed, 8 Feb
 2023 22:29:41 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Wed, 8 Feb 2023 22:29:41 +0000
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
Thread-Index: AQHZO2Vv8FsBcndYrkieV7dCV5LmRa7FoF6g
Date: Wed, 8 Feb 2023 22:29:41 +0000
Message-ID: <8154e7e618d84e298bad1dc95f26c000@AcuMS.aculab.com>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N>
 <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N>
 <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
In-Reply-To: <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230208_142948_622460_29E9D06A 
X-CRM114-Status: UNSURE (   9.64  )
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

> >   # Note: aligned to 8 bytes
> >   addr-08               // Literal (first 32-bits)      // patched to ops ptr
> >   addr-04               // Literal (last 32-bits)       // patched to ops ptr
> >   addr+00       func:   mv      t0, ra
> We needn't "mv t0, ra" here because our "jalr" could work with t0 and
> won't affect ra. Let's do it in the trampoline code, and then we can
> save another word here.
> >   addr+04               auipc   t1, ftrace_caller
> >   addr+08               jalr    ftrace_caller(t1)

Is that some kind of 'load high' and 'add offset' pair?
I guess 64bit kernels guarantee to put all module code
within +-2G of the main kernel? 

> Here is the call-site:
>    # Note: aligned to 8 bytes
>    addr-08               // Literal (first 32-bits)      // patched to ops ptr
>    addr-04               // Literal (last 32-bits)       // patched to ops ptr
>    addr+00               auipc   t0, ftrace_caller
>    addr+04               jalr    ftrace_caller(t0)

Could you even do something like:
	addr-n	call ftrace-function
	addr-n+x	literals
	addr+0	nop or jmp addr-n
	addr+4	function_code
So that all the code executed when tracing is enabled
is before the label and only one 'nop' is in the body.
The called code can use the return address to find the
literals and then modify it to return to addr+4.
The code cost when trace is enabled is probably irrelevant
here - dominated by what happens later.
It probably isn't even worth aligning a 64bit constant.
Doing two reads probably won't be noticable.

What you do want to ensure is that the initial patch is
overwriting nop - just in case the gap isn't there.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
