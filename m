Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC71C5B543
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 12:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrt09QArOAVPYQPB8LnDJaOu9HSo/ugiUCEtu0KmSAk=; b=P0lWT4+SVQVdyA
	MeLzuIxlwWxY4L9NojQ+B1frh4aRG7stbDMkytWugN/uXq05T5XNoUTdAnXnb1MQctxxLlV4q/tOy
	knzlfH4umt7BW5gksY16cVDS9/azNZt52XC6KZL6p3uBLXtowyCGfgmSafYu2aHvBBHcf5x1W6Pch
	ot+wr7AwG8Oe1BBWyBAUnGmyptHET1GsTEU/UPZT84yXysPM77JYG6pJPqZbQMV6Y6cUduSgzy1Cw
	kQuR0tl7H0NWAcLh8hIZq7NoWkB57M+xVeIzjbPHTYDnZacis69rq/rdwdNT0AdZQCxz2wSXwwWU/
	I5XG1/N49yiSsgH+hYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnUM-0000000DN5o-1vnG;
	Wed, 04 Jun 2025 12:45:02 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnUK-0000000DN4v-2R4k
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 12:45:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B189A439BC;
	Wed,  4 Jun 2025 12:44:54 +0000 (UTC)
Message-ID: <c239ee1b-f201-4e7b-80f8-03a7fb02b666@ghiti.fr>
Date: Wed, 4 Jun 2025 14:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Broken 32-bit riscv debug build with ZSTD and FTRACE
To: Marco Bonelli <marco@mebeim.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "terrelln@fb.com" <terrelln@fb.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <960240908.630790.1748641210849@privateemail.com>
 <1552795452.650306.1748692371190@privateemail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <1552795452.650306.1748692371190@privateemail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeetieeitefghfeuvddvjeeiudehheeiffffgeeviedtleehgeffgfdtveekteehudenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvuddrvdeingdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehmrghrtghosehmvggsvghimhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghrrhgvlhhlnhesfhgsrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepm
 hgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqthhrrggtvgdqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_054500_778304_A3D2D33E 
X-CRM114-Status: UNSURE (   6.63  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Marco,

On 5/31/25 13:52, Marco Bonelli wrote:
>> Steps to reproduce:
>>
>>      export ARCH=riscv CROSS_COMPILE=riscv32-linux-
>>      make distclean
>>      make defconfig
>>      make 32-bit.config
>>      ./scripts/config \
>>          -e DEBUG_KERNEL \
>>          -e DEBUG_INFO \
>>          -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
>>          -d DEBUG_INFO_NONE \
>>          -d DEBUG_INFO_REDUCED
>>      make olddefconfig
>>      make -j vmlinux
> Sorry, forgot to add "-e FTRACE" to the steps above. Here it is:
>
> 	export ARCH=riscv CROSS_COMPILE=riscv32-linux-
> 	make distclean
> 	make defconfig
> 	make 32-bit.config
> 	./scripts/config \
> 		-e DEBUG_KERNEL \
> 		-e DEBUG_INFO \
> 		-e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
> 		-d DEBUG_INFO_NONE \
> 		-d DEBUG_INFO_REDUCED \
> 		-e FTRACE
> 	make olddefconfig
> 	make -j vmlinux
>
> Everything else still applies.
>
> --
> Marco Bonelli
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


First, thanks for the report!

I unfortunately cannot reproduce this issue locally, I tried on both 
v6.15 and latest linus master, with gcc 13.1.0 and gcc 14.2.0 . I made 
sure that I have FTRACE, ZSTD_COMPRESS and DEBUG_INFO enabled.

Can you attach your full config?

Thanks,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
