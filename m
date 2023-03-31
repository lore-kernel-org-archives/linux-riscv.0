Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5C6C761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UsYSqWmTp0cUBAyOPqgWoDsEM/5U6/8q9C/+/qKGKRs=; b=J608RxXFyu7+dp
	Zw09bopNJ9TDtDJBcAekrZAUQTiCakFDiLECNfaOmw2W5SnGbuokBgUuGO1PNSTH+zA/6QX/Hef5v
	1xoyA6jmj5+zz5WMzwAzDA4s7Q+35gwFUqGhgXIfxpzh6jI9nOAj03nT4CD1Sc8UgqD8emmLqmSAq
	VA4xp4Txf1gR2GElp3Ew9CD8AdMOvMT7P6nbj0M7tuTc1maKLKi835V9Ky1MmlWDMOGLSR94x4S/U
	b7k3fnuPwBp+sVIaB1CKTuRhjGNQy95vePzNu3ivARSBZsKcht07S8CFRTdAwUt7bNPoZ/ACpqDNz
	lThiHpLyBq8VXEV5eTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piFJ1-007ca7-2K;
	Fri, 31 Mar 2023 14:00:39 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piFIx-007cZB-2d;
	Fri, 31 Mar 2023 14:00:37 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 567AF58268C;
	Fri, 31 Mar 2023 10:00:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 10:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680271232; x=1680278432; bh=N4
	WD590DO+hPCMhWnriCpuvGtJsGQmYQ3+9FXgeZTtc=; b=REpduR9CC3w/0FF9Iv
	EBH9KHHpZAkRv+W9aThRognDHqxxXErt1hEf262htgmfU1y7J8I/og12pQbF1QY9
	z/0+3+/Bf2oK+XUqQ1up2zoCUTbBItrTDBxbm/DdhVRyQkbfie0xE3OFe/uFVR+g
	bks9fZAGQKmrcGDNEtLT86tfn4Wms5mpNyxZklg1B0YWQfy7g9hvGDntPvsCkCeJ
	wLqLsQR9c7xNiHy3PDZ3zK2RyfRwh8d+h+Q+id4O9QFBuDiG38QiGwFwY4W/6byQ
	pNhd/J6qIoDVk9dy/Mdw+8Tf65QdzUWqpPIiUv5wn3AR7WW2l24R3SQbLghgPyUF
	F7gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680271232; x=1680278432; bh=N4WD590DO+hPC
	MhWnriCpuvGtJsGQmYQ3+9FXgeZTtc=; b=i3D+2hFUqX2bGpzs9rCNqcr3CpE2N
	rt7cbXlRcTHCWGo/szfA6As2ip+aj8s1suA1RYGH89iU3g1ca7fdoQJNHyYwLXNr
	WC1WRAlkGPS93OO7BATELyF5zFYGJWHyOuPym1F/LtRkCwUjFR6xo7so3vFgV9vY
	IVCo8mq7pf1tL4yq8LWAbqZdlON6KFVL3Sapxm6koAA4gN8G5B28UEccNxYiAtHQ
	dvIbN7+ejsM+GITaw6ebr/XqJrMfO1ez3Qm4YcHOOMz99mIsNZvq856hdCwflb78
	BjnKIQ+2qfc2YpkHszA6wodj1J2AgunOKqhhPHInMSpLYh9uMkriYgwXQ==
X-ME-Sender: <xms:fecmZCPw2k0WFSiszAjxauKOayaTiHCGBi32kM44TXaFV2BHsjDyMA>
    <xme:fecmZA_NMdzB6aDZzwfF-uMmNEuqPyfkq2LjSDyiaL-SuJ9PAODPdoOWMVJQGZfSu
    RbTsP31nEFUHDqIAlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:fecmZJQhpIILzpcdD_xrCsjH7l6FjkrLtyxwa_ai5mBKaMgvipDDUw>
    <xmx:fecmZCuwYKd2Df_H4rBh_fLvS9zA0ETUOaGqv1ZZCjcnlhkXxmP3UA>
    <xmx:fecmZKdoWRB2Q6l5_A5sNhUbdy-jv6JeyG7Yd6afjSO5tFxo2aX65Q>
    <xmx:gOcmZNdii8AAZvnO0o6gFFummVS7dXiShnWCiEYYWDOp-MlzOf1x5w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2063AB60092; Fri, 31 Mar 2023 10:00:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <df6340c8-6ac2-4459-a9e5-c411020962d6@app.fastmail.com>
In-Reply-To: <cb9367fb-0897-244d-15b6-fdfafde2a1c0@arm.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
 <cb9367fb-0897-244d-15b6-fdfafde2a1c0@arm.com>
Date: Fri, 31 Mar 2023 16:00:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robin Murphy" <robin.murphy@arm.com>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>, "Stafford Horne" <shorne@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Christoph Hellwig" <hch@lst.de>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean() helper
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_070035_945759_7E5D3228 
X-CRM114-Status: GOOD (  17.06  )
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

On Mon, Mar 27, 2023, at 14:48, Robin Murphy wrote:
> On 2023-03-27 13:13, Arnd Bergmann wrote:
>> 
>> [ HELP NEEDED: can anyone confirm that it is a correct assumption
>>    on arm that a cache-coherent device writing to a page always results
>>    in it being in a PG_dcache_clean state like on ia64, or can a device
>>    write directly into the dcache?]
>
> In AMBA at least, if a snooping write hits in a cache then the data is 
> most likely going to get routed directly into that cache. If it has 
> write-back write-allocate attributes it could also land in any cache 
> along its normal path to RAM; it wouldn't have to go all the way.
>
> Hence all the fun we have where treating a coherent device as 
> non-coherent can still be almost as broken as the other way round :)

Ok, thanks for the information. I'm still not sure whether this can
result in the situation where PG_dcache_clean is wrong though.

Specifically, the question is whether a DMA to a coherent buffer
can end up in a dirty L1 dcache of one core and require to write
back the dcache before invalidating the icache for that page.

On ia64, this is not the case, the optimization here is to
only flush the icache after a coherent DMA into an executable
user page, while Arm only does this for noncoherent DMA but not
coherent DMA.

From your explanation it sounds like this might happen,
even though that would mean that "coherent" DMA is slightly
less coherent than it is elsewhere.

To be on the safe side, I'd have to pass a flag into
arch_dma_mark_clean() about coherency, to let the arm
implementation still require the extra dcache flush
for coherent DMA, while ia64 can ignore that flag.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
