Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DD0606A333
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 20:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pBP8a9s/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=fEICjyzH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K4ZE/PAadgo5SuPdoWNQPrTUvD1xbrYuxhXlfVQxidg=; b=pBP8a9s/M+MZ80CNCz2v+3mc1n
	xh0mObRB6RmZCQYwyMiZ7NdRN86S2ov58NxUdZO7s7NYCj/Wv/8Lhi+Nf+OC1mM2zcImHIREuc6Na
	US8C5LVFfdAyiVtrU7R4VIQpXqnCAr/X95GgJtqEfxGF83NnBVf7GIQYKC121eQe0czZ0rhHScDtV
	0rw8tL4xX1nl00Yqn5cwxCUdUvanhFbuYDcPJkp1uP9bsEd3sxWFEM6odAuLljwbB4XE0gKRhFtNM
	gkfffrXZWrGDD1X9PqHrqJIKLXDT9RcuyoOXmh2NSSbumWxowfrDY8nZAbgVGaXChAjAoP1CFCA7T
	EaM/ClPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQah-0000000DbAN-23IV;
	Fri, 06 Nov 2026 20:31:15 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQae-0000000Db9n-3vho
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 20:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793997054;
	bh=47GIJtHDikSRTr3Iz0oAp99S7+cqqZ+QBH3BmiF/M7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fEICjyzHIUjZle/Wj4mBt/1Dnor0jMi3VucYkcqE9N6vfrY4I8e26Cmns3jMqK2Ad
	 mM4qBr41GoVx6WtGR2k9su/QzfHkK8n5R9QfHklkbn+9WhTRJ0w25f7HOkSYM6ZI61
	 vZLc2eltSvTOV9sY3Iey1juaDaaq7ZWF27eAupuQzSZrl+d7t2ze76rw1DDQMVeMnI
	 RNYi997oS6maEfaAeVqH6UmztDnflre9AXdNuh3hAFqQc+za4Tkjo+PZ8d9mcraXh0
	 fLJQ4FgqbXm2blN65qNBCBv5BJ83ccHJLeWVb0REGUbsXF4E6c5yhhN7BEeX+Yg1zy
	 s4MJ9aHn8WiMw==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id CB1E1B22094E;
	Fri,  6 Nov 2026 21:30:51 +0100 (CET)
Message-ID: <d051c5f2-3df2-4eeb-b324-6e9ce39a6b27@freeshell.de>
Date: Fri, 6 Nov 2026 12:30:44 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status
 power LED on
To: Owen O'Hehir <oo.hehir@gmail.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184055.3891621-1-oo.hehir@gmail.com>
 <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
 <20261106195945.4157095-1-oo.hehir@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261106195945.4157095-1-oo.hehir@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_123113_469060_95691586 
X-CRM114-Status: GOOD (  15.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Owen,

On 11/6/26 11:59, Owen O'Hehir wrote:
> Hi E,
> 
> Thanks for checking. You're right about the commit message: I saw the
> LED lit before Linux probes and assumed the firmware set it, without
> checking where it comes from.
> 
> On the Lite, the schematic (sheet 21) shows RGPIO3 driving the system
> LED and also used for fastboot detection, through jumper J20 that pulls
> it to 1.8 V via R257 (1k). Detection happens at reset, before Linux,

No, the software is not any concern for a hardware description.

> and R257 limits the current whichever level the pin is driven to
> afterwards, so I don't think driving it high conflicts there.
> 
> Owen

It may or may not conflict in software operation but that has nothing to
do with if it should be applied to device tree that describes hardware.
Conor since applied, which is trusting you researched this correctly
before sending to the list. I'm saying that all things being good in
intention this is obviously not well researched, and not allowing for
discussion to verify the fix before applying.

Anyways it is a user light not a power LED. Pine64 Star64 has a power
LED and this user LED. If a board does not have power LED then co-opting
the user LED is something that should be done in inittab not treating
upstream device tree as a preferences config file for userland.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
