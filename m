Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC58DC636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gk459t25DRVw0DozcmF8JzV+3zha2ftk1DHpVloK6Oc=; b=sLy50djx0phyjB
	d9EfTFbwtQQ3C7nG2K6PETHUO9ZDx0e1vmsE9r/faJNrGdC6jETgYefI+aeVSsFnEi0wuxbdsDgml
	n2F/tsYvYpMswVcjaVzKBoTB/FZmRq1x+dHiEotzqPjZGDdU6B4awinqPooRYcOh7koLNjcGXkt+A
	SRVRz/zkw91x5Oi3OIcfilJBNyGWWQNM+DnzU42AOJBKETTF/Wd2B8NEug/qximE4XZe6PJcmUCG5
	qlF2lAyNucsAtdT2fY3dh5lHK0qBnhY/NbS6uH8vJWXGGd6sxwRqd5ZXaSlsaaOQaMqw4PeGJKsa+
	qgnwNkDdYvwgWEW+HBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2n4-000dq9-6f; Thu, 09 Feb 2023 09:00:26 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2n1-000dno-6l
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:00:25 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-310-f-7qB-QRPTeL7-rfR361BA-1; Thu, 09 Feb 2023 09:00:16 +0000
X-MC-Unique: f-7qB-QRPTeL7-rfR361BA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Thu, 9 Feb
 2023 09:00:13 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Thu, 9 Feb 2023 09:00:13 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Evgenii Shatokhin
	<e.shatokhin@yadro.com>, "suagrfillet@gmail.com" <suagrfillet@gmail.com>,
	"andy.chiu@sifive.com" <andy.chiu@sifive.com>,
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
Thread-Index: AQHZO2Vv8FsBcndYrkieV7dCV5LmRa7FoF6ggAA6xYCAAHaDsA==
Date: Thu, 9 Feb 2023 09:00:13 +0000
Message-ID: <f00256bcbe114669acca1b0105cefb99@AcuMS.aculab.com>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N>
 <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N>
 <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
 <8154e7e618d84e298bad1dc95f26c000@AcuMS.aculab.com>
 <CAJF2gTQGxxgusRgPdNaw4-d+o0a4vefUj7PNpZuym6VKQC4dhw@mail.gmail.com>
In-Reply-To: <CAJF2gTQGxxgusRgPdNaw4-d+o0a4vefUj7PNpZuym6VKQC4dhw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230209_010023_534672_2DBFB1EA 
X-CRM114-Status: UNSURE (   5.83  )
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

From: Guo Ren
> Sent: 09 February 2023 01:51
...
> Yours cost one more instruction, right?
>          addr-12  auipc
>          addr-8    jalr
>          addr-4    // Literal (32-bits)
>          addr+0   nop or jmp addr-n // one more?
>          addr+4   function_code

Yes, it is 4 bytes larger but there is one less
instruction executed (only one nop) when ftrace is disabled.
That probably matters more than anything in the ftrace
'prologue' code.

I also suspect that you can use a 32bit integer as
a table index in 64bit mode to save a word there.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
