Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A15BC83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=20V+HrgeVnu7xcDt3TOaQUC9wEKQQmUwhXfRh6TS8vY=; b=fQIMVIQkziV0+qXvdGZiG+is3a
	297BE/JQRGp1YCnzT2ASpPAMbrmCgBv3zU+b6WIGJkSA+10U1rsvmhx+LSmG4Oksl1ZChyfWTH2mX
	THyog/fL5KsbNPg3JAuycd20gorlNXTexZQo3wKYJwVHIvxMclJr/7gJeiRcIVNC5QxhdkdDbmVXj
	uMhGfUJ3TXKJIRIVazNCxOcFvFWa78c90xqcC4KIbd3QdGeiU19VsELEQgtWyngf06o8R2TGNP/0O
	cXzp64NRPXU/VcL/u4IEjp206kvgxa8IjGRaT718qjF9lfWucShrX2Dolwp4YXV5wASa0HfSqtZB9
	bEdw5uxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhzm-0000000El5h-43J9;
	Fri, 04 Jul 2025 15:06:34 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgax-0000000EXLe-2Hkk
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 13:36:52 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BC7311400239;
	Fri,  4 Jul 2025 09:36:50 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 09:36:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751636210;
	 x=1751722610; bh=4WAwqvw8g3t1MUCHlAIadPbHEDivdqOU5oF5ZelV4ww=; b=
	Ierk354AvF659FFpEBGZTnHYIKg5Cftf2qg+x1+moeY0eQH0V5tIDArd0R1asTWH
	3Ph/Zhxo4uqzR23mbt1uqpOiQFdzI4DmS2+a7Lj3VE8+rNZgSe6195p1FXRNKvT3
	dDttZYTVyarpE7xl5fG3tnObnDl3IJZu5qn2B8wuYvLUwD4BQRazzHfETlb1e7zr
	C/OIPEWYQNN1ZB+Un9zrdBdTZrZcx7r0loYfP3TGNZPfTdRuZUoAbeI6HhxOYX1e
	9laI7rCkUK0SZI4cF9RKRtwO3HpZrdx2qh/m2P6L4wbIfHRWuxhppW0A2/n7bq7H
	0h2eHRd8WRBgoPKvpdKYpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751636210; x=
	1751722610; bh=4WAwqvw8g3t1MUCHlAIadPbHEDivdqOU5oF5ZelV4ww=; b=M
	vfGxD45kzCPWcC1qgDw6pQLWiTjnNSo9fflkxfhmwu00u4MLErLDWnnQdkbMYPUO
	ep7W9iUaPExx49n1CZGeWZnp4dSbkablwgofEldRzt8PObUUAaBB4SJROM3EZDQs
	EeeQ3KSgbi+98NIXPg1nrjaYrS0bGMNrVeRtAhEQV0JVzlOXJs/DjBIidzK6tgEm
	CyDVMHynVKycn07PBvZo63tH2bvSK3xQuPpyCkgFaNQNyu7fXHuWxo364m00Cqja
	L2uRNuo1C38lM/eKZ5mJskKA7Ym+q2lR6M15+cb7BgUDN4Nls3Sdzw1BRjuPdaE/
	SwPLNckhUFyNtlbdWSsMg==
X-ME-Sender: <xms:8NhnaAT2fbqff4v-deXXDh6h9sFJZglSsRMzCTnlLYYXIqLcyXMNCQ>
    <xme:8NhnaNxzTx6SQttAoJ9N7sO1iylqVB5hrKBqO2l1Gf6q9fOpwAf1pb20QJOlP30ud
    9QSXzURHGpthyNlHo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsggvnhejudejsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtoh
    epthhimheitdelsegrnhguvghsthgvtghhrdgtohhmpdhrtghpthhtohepphhrrggshhgr
    khgrrhdrmhgrhhgruggvvhdqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomhdprh
    gtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhu
    segvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigsehghhhith
    hirdhfrhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkse
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8NhnaN1UHNjfOf7_aLGGRl33HPK20Q_iXfXrFxorL-owGRn9rW3zmQ>
    <xmx:8NhnaEAc7p7ywTmYFbhVKVxdggyzX7XfvU1RiYBdW19WFZgvM7Ev-Q>
    <xmx:8NhnaJhLB2CpJT0d2RainLbBsUwZub8QX27CVdSLtt9ZHwwtxI2eEw>
    <xmx:8NhnaApcDHKDpiu1GnI_oTHKrXxpAT8Aar_UyIb5hM8NUcDqVqjbYw>
    <xmx:8thnaIl4lmGLlojO5Dj9VTiwT59P03yJXEJ-mx7s2PP4RHLxjwbmb9qI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F2AFD700065; Fri,  4 Jul 2025 09:36:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T286e4b5afb74591b
Date: Fri, 04 Jul 2025 15:36:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ben Zong-You Xie" <ben717@andestech.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@lists.linux.dev, tim609@andestech.com
Message-Id: <ebbaa7c9-156a-4205-94d9-d9e4a683840c@app.fastmail.com>
In-Reply-To: <aGfR+Vx0dseqgmKW@atctrx.andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
 <cb8891d4-de4e-493c-9914-0391b3baf212@kernel.org>
 <aGfR+Vx0dseqgmKW@atctrx.andestech.com>
Subject: Re: [PATCH 0/8] add Voyager board support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_063651_660300_83F06EEE 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Jul 4, 2025, at 15:07, Ben Zong-You Xie wrote:
> On Fri, Jul 04, 2025 at 11:15:43AM +0200, Krzysztof Kozlowski wrote:
>> > Also, there is a patch dependency in this patchset:
>> > Patch 2 <- Patch 4 <- Patch 5 <- Patch 6
>> 
>> How? These are bindings. How DTS can depend on the binding? Do you have
>> akcs from their subsystem maintainers that you are sending it here?
>>
>> Sorry, but no, this should go via their maintainers, unless they did not
>> want to pick it up. Is this the case here?
>
> The dependency chain arises because each of these patches introduces a new file,
> requiring a corresponding update to the MAINTAINERS file.
>
> In v4 [1], Rob and Daniel attempted to merge Patch 4 and Patch 5, respectively,
> but encountered conflicts in the MAINTAINERS file. That's why I specified the
> patch dependencies in v5 and this patchset.
>
> Now, I understand that binding patches are typically handled by subsystem
> maintainers. To prevent the conflicts again, I think I should gather all
> MAINTAINERS file changes into a single patch. Is that right?

Don't overthink that part, the MAINTAINERS file doesn't have to cleanly
bisect, so I'd just create the full entry there in the same patch
that adds the arch/riscv/Kconfig entry.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
