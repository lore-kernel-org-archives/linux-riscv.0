Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C78C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37I+bCdMWAAr5kbsYGKu1DJnFB4JvwmEUHvRUsK83Dg=; b=HvLffGHvtyVHIr
	+MCiFhsrvf+ld7s4ISCHslzPnDu3t3+P/F4SNfFV4rwHrN4nAnBUYjO0j+xPKd4f1h5b2DO7/JgoY
	VjLeX6jVaFUZP/0HYJJxewOwvZHyT2i2oP7PpZl98BbFFXsHqNtOBrBkUQoP9dqfXpT/j0exIeAVW
	jzYagZpxZqEfuWv5szldYdpjrS2jF6xDallPgO0fWvLthT3qah7oAcczYNf7wS31KZeaPP42l30nU
	txpb9zjVzxA6dslPBIOzWWIurVrotu2RNNMEoUExriQz4dpad+24eKJPmWw8PBL4zUmrC8vlOm0Pm
	CW5cfG2VKmajMGKsJA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0VR-00000001wXG-220s;
	Tue, 25 Jun 2024 07:22:21 +0000
Received: from fout6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM0VO-00000001wWg-3f4Q
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 07:22:20 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id B2AAC1380260;
	Tue, 25 Jun 2024 03:22:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 25 Jun 2024 03:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719300137; x=1719386537; bh=kqD1JVVmb6
	5kM+8TRypaMtMSw95vRHKsvANGjybyrPs=; b=JI2NnhbDiRz+XtaZOE/bmBmcC9
	y0EyY2llyKi6gdvjKx1r1hA/Sp+YxYTsh5R4n17kBIqknSQAROV1too416xz/ax7
	DnnBJG1hO25/CV60G8SSL08IsslBBeMnfT9net4th4Zh9mhvhU/DJsMRuhBNgS3E
	0VPlxU/h2WIqd5/h+xqpcLNb3FylkO5VgnBAm9vqbLiTkbPF6CfJ5etKz1Kdlz6g
	XsaFDZtzr86kr8O4geYi5FetIADdYnaQpvDBu55+vHHcrV8TKcnZhnAv95+sSFqZ
	lVTTKSD6ezB96+es6B2qbjQ1P3PHFwXreqGZJng2oKC/W4s7uWUK5KrDjiQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719300137; x=1719386537; bh=kqD1JVVmb65kM+8TRypaMtMSw95v
	RHKsvANGjybyrPs=; b=nii1oWgI7WMslQkPVOju+ij36Es5RtXqNHA9yKqnjG8A
	/6sHxHue9WXJ+9DOxwSzTPko23n5KXsoa6MuswLmoNWzrkp/0wwWs+HckTmyWvnS
	vFd+qTvwAua8fFc1olEPYCCyGr7lvmWs7tgKITHfwgjPqGBDu3kq+6GaGAcfil+N
	LRpbttIg9XP1FXvMTRN2LfjT0zLxGzwXnUv8OSFvGh//b/sWkrmRAPEmhfciYZHu
	OISRx6Ws2r+o/pMUq1MEsjtRh0KiuVyyZCKVUE51CtS/Shyj+r2yibWJVJFKZA/0
	2X2NzkLianjEFBwYul+W+025Fgof0A5Fm0c5c6mwnQ==
X-ME-Sender: <xms:KHB6ZgBifU8qyh7Hen9xqhrQWMmo0RsmL9eotuAMGFs1onD0HXFfEA>
    <xme:KHB6ZijWZB5iEGbnIvaynzSW5-TMdpen-UsUCXR4BLvZG7I2RjTuG-0dTnY3Vz_wd
    ErlBUsr4Fx9T_EaFcE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegvddguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:KXB6Zjl3l50wSTwqFG8ioukc-g61PgCzgX01VcseaGpdWq4vmYO7FA>
    <xmx:KXB6ZmxlCsqMlCZDJLqUVWfn8MZ7ECDbrhSeaDpY3p-VHvVyycCVaw>
    <xmx:KXB6ZlT7X8HJgRHGH0q78K3BWOn3L8jDW0VFQpTffwcl_djQXWLfew>
    <xmx:KXB6ZhYXApxt0XgYZhF8A9lmJpDbOUWPdh0naveFocTcpqd6K7sm1Q>
    <xmx:KXB6ZmQ60H2urzdeAAEbeBLfc362BpSQsmD9KzkcaS9n3A-vmDQqIAh3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DADC6B60092; Tue, 25 Jun 2024 03:22:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <4d8e0883-6a8c-4eb5-bf61-604e2b98356a@app.fastmail.com>
In-Reply-To: <20240625040500.1788-1-jszhang@kernel.org>
References: <20240625040500.1788-1-jszhang@kernel.org>
Date: Tue, 25 Jun 2024 09:21:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jisheng Zhang" <jszhang@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] riscv: uaccess: optimizations
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_002219_276628_743549A7 
X-CRM114-Status: GOOD (  15.88  )
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

On Tue, Jun 25, 2024, at 06:04, Jisheng Zhang wrote:
> This series tries to optimize riscv uaccess in the following way:
>
> patch1 implement the user_access_begin and families, I.E the unsafe
> accessors. when a function like strncpy_from_user() is called,
> the userspace access protection is disabled and enabled for every
> word read. After patch1, the protection is disabled at the beginning
> of the copy and enabled at the end.
>
> patch2 is a simple clean up
>
> patch3 uses 'asm goto' for put_user()
> patch4 uses 'asm goto output' for get_user()
>
> Both patch3 and patch4 are based on the fact -- 'asm goto' and
> 'asm goto output'generates noticeably better code since we don't need
> to test the error etc, the exception just jumps to the error handling
> directly.

Nice!

I hope that we can one day make this more straightforward
and share more of the implementation across architectures,
in particular the bits that are just wrappers around
the low-level asm.

We have something like this already on powerpc and x86,
and Linus just did the version for arm64, which I assume
you are using as a template for this. Four architectures
is probably the point at which we should try to consolidate
the code again and move as much as we can into asm-generic.

I think the only bets we really need from an architecture
here are:

- __enable_user_access()/__disable_user_access() in
   the label version
- __raw_get_mem_{1,2,4,8}() and __raw_put_mem_{1,2,4,8}()

and then we can build all the normal interface functions
on those in a way that assumes we have as goto available,
with the appropriate fallback in __raw_get_mem_*() as
long as we need to support gcc-10 and older.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
