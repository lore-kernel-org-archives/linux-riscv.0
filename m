Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED695C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkhagOeSWjndiDU2WpsWWYW2oTwlHtHgy/EtZLK6Bw0=; b=Rfc44XRbSxMYNA
	eWRmauNbRqmLvbmUaX/eX7GREN/7kk1bOnjXaWATsrF/lktGWVnIpG48zvQW88ExILe4LA4huafiK
	669R54LUfPWA4aBSfewU25nMgsnc5moqX3pGjrQQk1Ti1Z2Oykbmyj2dptsVdmCgRMgjqNMdj5NdY
	pBqf17jf2a1H+jwMgJ9EQdbzhfBFI3NY2OCZGI3XyMiuy+X+zmO+KaWvmMIF9G7quVluP98AkDkyZ
	97FwKTt+IjrXsxe5lqU5qDxRxem+xnaHYC3aR5CS8fohAj9FcwvA1ncmDnD/L9dNe5xEzTdIdik03
	ZBuLSn4z4MX+N6JjVpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSHY7-00GkVZ-0j;
	Tue, 23 Jan 2024 14:14:47 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSHY3-00GkSc-1R
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 14:14:45 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 73B243200AE1;
	Tue, 23 Jan 2024 09:14:37 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 23 Jan 2024 09:14:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706019276; x=1706105676; bh=d4pIxWNynI
	YT3Te0hZUQ5p/KQ9LDcVc3qWXc5mhGEyU=; b=bkZ0rzXPvbSFyYP2ANDLn6MSLH
	KUddIjOomdwE9AeUmbATWpaLlsFmXZ9LREdbQD8pPkY/qp2NxF3DHcVsWpWrwrMI
	NugTh+15n/qCae+NH4PL3ROE8Dq1VINE8gUMloTIvY1Z0URwuLCElYp3SEXqOaoT
	bBDZ6EL6PSkip1/BuGFKbXdnYm3eFPQk723kLhiRzzQHlzp+Gn8dB/DEukAzalJr
	fDQM7ssCFPtWAm1N9qAn1soVl77dfiN5Zhoxn0A9XjEIPv5KsznvW3Cl1viFLa3c
	CwGzTY0NgRApU3ixnpWCOCEnmxeqfVKggzBxJ2bY4eNm5ZUWkYYIOccIxLPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706019276; x=1706105676; bh=d4pIxWNynIYT3Te0hZUQ5p/KQ9LD
	cVc3qWXc5mhGEyU=; b=Zmu5XaEigsBCc1ydxeSrS9m1l8LY4z0XBdWFCoV7EWNx
	aJseoq4yg1mAivcgOECYbIYjBaG5blllyoxWy9VbMOBftCTjIrOHOayYTotTcgV2
	uunmP8lst8woYFfCmhBCGviwQHo3rAiOyQqxAsytpkshhXAH7Q97fmISn0uvvK76
	QeI7bq8ddy3E9GN0E/cLmsOeHkPcLafX95ObduDVbIu1r0Y14aGJXxX7JgDAIqfR
	t8wVcTvHDaAJydgR0KL7yMqCIyEWZzoGZB3qFLDdDX8+j9li2n8/OTNT808S/dwY
	U+DPAOx0uzRGfMa6Xr5k5wQK05hATROEnxlX6bQywQ==
X-ME-Sender: <xms:zMmvZa2hbZoJO6WbSZXgBJAkZO7ZhxMwgwyaGloBtMcXcr84enxxSQ>
    <xme:zMmvZdFgYZlBQNjTDiq1B2nI2NYFhIEX8HaObz6pXw3C56TYXLsYfZ1gL09fLH2PC
    wgXqkhjcXmZAIyQ9c0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekkedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:zMmvZS5XfkG5lIodfJrXzuKi8MIWx2MonVJKa6tUCAacM-zljcuADw>
    <xmx:zMmvZb3eaexeDL8cuzGzwVPZzJwkjbFfS3AduTu7pH7vqy9mmoztuA>
    <xmx:zMmvZdFosT_ukRVqeY7PuSC-Dsyq17cAGB_-isVjYj7U-YBDCwmG8w>
    <xmx:zMmvZRh_FipElD_lSFfAKewurYFZt8soexcRUx2psCZPoVqrVXVoUQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 36969B6008D; Tue, 23 Jan 2024 09:14:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
MIME-Version: 1.0
Message-Id: <8d37ad26-efdf-4e10-9a72-d49e37de0307@app.fastmail.com>
In-Reply-To: <1ab7594855718e24ddc629ebbab1edc8bdcd799a.camel@physik.fu-berlin.de>
References: <20240123132335.2034611-1-arnd@kernel.org>
 <1ab7594855718e24ddc629ebbab1edc8bdcd799a.camel@physik.fu-berlin.de>
Date: Tue, 23 Jan 2024 15:14:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH] sh: use generic uaccess
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_061443_910379_1BFEDE62 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, Jan 23, 2024, at 14:55, John Paul Adrian Glaubitz wrote:
>
> Wouldn't that make these operations slower or do you think that GCC is able
> to optimize this well enough?

It's only single load/store instructions, so it should make no
difference. If anything, the generic code should allow the compiler
to have better register allocation and produce better output than
the assembler version (which is how this avoids the ICE), but it's
unlikely to be noticeably either.

> Also, this is something that should definitely be boot-tested to make sure
> this doesn't introduce any regressions.

Agree.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
