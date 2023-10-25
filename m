Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A96C0032E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 20:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwiANHuQpH8xWubD2In5aNvEdm64gmj0T+7VzeZO+OA=; b=ylRky5jJOMJ0Yq
	1jy/g7W8ibuBOnyH5j+oaUZpYOSbC9uedv0MoX+hOcfQHWw1h2F8S2u4wEQwvCP/2VV3iHhcAvasM
	vimxTab0Z3uU1pKlybLHh6v05nQHpW/Dfv3svUs9KzC2qRTUyLchwqpaK9SwRMMQaL8IWMk56fWlr
	zhyrin0HB+9Rw+4PqR7esTND/Ug2dTzwLCoQyIAJkIjYRF32KvOjiYk5IRFA8YXDQORXhBsRixLGb
	5xqEpkpb1YMTbZ75nyXlJH5bcos2WLnUmkgeKjY2sDx2KhU06gdXxmtUBFFwWZllTfwWZgpiVQkh3
	pJnU8qsDu11lYmC23rMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvks2-00D6yk-0O;
	Wed, 25 Oct 2023 20:52:54 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvkrz-00D6we-0a
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 20:52:52 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 1688C5C010D;
	Wed, 25 Oct 2023 16:52:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 25 Oct 2023 16:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698267164; x=1698353564; bh=Lw
	km4by0Rki3JY+h6pP3hgKn84sTDYv48INvl6mOPx0=; b=EVs5SINrDuZyr+FdoB
	/KT2yCpM/aCvcgrKTwKt82ffUgNjPCOaT4detltoHGvUR8aujlpORn8a0u8niErV
	Zx2WyilaDcWVHGLVy2GheqlfE8XS3UyMlknBPkfqii2hcZtAwQrFhVe+7+LvngBI
	eRt7qJoteMZvrkXivybaTeYAwBuCaZTLgeyDG89ptUzBsyt9jFo/Lsjg5oM4r7w+
	mY36Bs5NZ1Bxxit7llkhrYpWRVYAxWbgAYvzfFcfeaYTe5bUe+BHmNeqH76hJhWQ
	+9OwQXlH+KcAICkD4KApf7elWDkAPZjUvogsrmoW1nlZCJtIZ1Hzk7muoj3ihij8
	oRPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698267164; x=1698353564; bh=Lwkm4by0Rki3J
	Y+h6pP3hgKn84sTDYv48INvl6mOPx0=; b=nYndhwyOjJwKekFfaJQ96GLSjBtgR
	6KDIyg3YBnVEpIIWHoTtGVhJBmMyFqpXAmOoxOTQkS0al7c6R4xZh509P6ZSaBJt
	g8heyn4Ke8YhmqvFsj/jtlyFLLYzul3dAnOqt1IVwjTThbDIut0ZfkYN+bYP8MxK
	Aehus9MxE5cqcd0PKTXSjQe5j1PXtxMAHWySXaa8XRg7MZz9QVB9ogmv8gBkSjB3
	qgmlBJNxxH7GmYhja5rTWgBz8TqahESrgLNmHAW7hhBWRSgcI3MyUf0cX6DFlWDE
	ai7vFOv9anFePpue4GW5iPtM9AzmwqgVa5wnAPLhuzDcwETvbliU726fw==
X-ME-Sender: <xms:G4A5ZTPvNocsC00WmySUy_U0FZgPnCwlQeegak5ez8YvXyxKts7Frg>
    <xme:G4A5Zd_GRfIeCramOakSE5ulbqAFppoOwn-M2pZAAsxzo8u3UZKgypONYRhlT2Hxc
    gDc-RFAKo8BF2GbZi4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrledtgdduheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:G4A5ZSRfVof2wTyakLYZQ0JE-z6rYY5k6tc5niOEhzeB6vqFNMizKA>
    <xmx:G4A5ZXtGVGtSLpJIHvDjGmgjahUu88W7EbAvuPYY9qoZ12IAbeWu9A>
    <xmx:G4A5ZbdI3EktLJRSy1ZJQU7g0bK8iBLodDZDRFlKEKsoHbIUzRHbQw>
    <xmx:HIA5ZdvGur4GYsps9tn6DzlV-YwTIkvIs02dVgRfO3yXqRbC21bHvQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 773ABB60089; Wed, 25 Oct 2023 16:52:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <059f17e6-e240-40fa-8742-7844ad3b3502@app.fastmail.com>
In-Reply-To: <ZTl8gauEst2NGrw6@ghost>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
 <20230919-optimize_checksum-v7-2-06c7d0ddd5d6@rivosinc.com>
 <DM8PR11MB575134C301E7E17E72281CFAB8DEA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <ZTl8gauEst2NGrw6@ghost>
Date: Wed, 25 Oct 2023 22:52:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Conor Dooley" <conor@kernel.org>, "David Laight" <David.Laight@aculab.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 2/4] riscv: Checksum header
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_135251_669003_C88A512B 
X-CRM114-Status: GOOD (  15.66  )
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

On Wed, Oct 25, 2023, at 22:37, Charlie Jenkins wrote:
> On Wed, Oct 25, 2023 at 06:50:05AM +0000, Wang, Xiao W wrote:

>> > +
>> > +/*
>> > + * Quickly compute an IP checksum with the assumption that IPv4 headers
>> > will
>> > + * always be in multiples of 32-bits, and have an ihl of at least 5.
>> > + * @ihl is the number of 32 bit segments and must be greater than or equal
>> > to 5.
>> > + * @iph is assumed to be word aligned.
>> 
>> Not sure if the assumption is always true. It looks the implementation in "lib/checksum.c" doesn't take this assumption.
>> The ip header can comes after a 14-Byte ether header, which may start from a word-aligned or DMA friendly address.
>
> While lib/checksum.c does not make this assumption, other architectures
> (x86, ARM, powerpc, mips, arc) do make this assumption. Architectures
> seem to only align the header on a word boundary in do_csum. I worry
> that the benefit of aligning iph in this "fast" csum function would
> disproportionately impact hardware that has fast misaligned accesses.

Most architectures set NET_IP_ALIGN to '2', which is intended
to have the IP header at a 32-bit aligned address, though
some other targets don't bother:

arch/arm64/include/asm/processor.h:#define NET_IP_ALIGN 0
arch/powerpc/include/asm/processor.h:#define NET_IP_ALIGN       0
arch/x86/include/asm/processor.h:#define NET_IP_ALIGN   0
include/linux/skbuff.h:#define NET_IP_ALIGN     2

I think it's considered a driver bug if an SKB ends up
with a misaligned IP header, but it's also something that
some of the more obscure drivers get wrong.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
