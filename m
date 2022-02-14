Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AAEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 22:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsjzXT7WVtBTzvWbgunSS3tFEcWm+gR5fqAhzFBhc2Q=; b=gyEahhJECJTw65
	qwbYKxEFkpr3UKuwwysl1Mj2fqAE0fXMBfy/zobK9cjcLxWNOVXmOo48VMuI/YzM/m0oZBsyGth/b
	iWPK2cJi8lg4JtYThSyshWU+SA9ZQif4PiWA+O0GciEN3haWcm0j08QD9IRDEyvAzozYOYW43HW03
	j/xt30eotkxPA6oCImyjB2Wi2Nf1NsasPnJD8knHiP3UXexuCFtLQj2zAyJcpHng/eC5jn6MfSvm2
	BCYq+qjH6XdJJ5iUt48w4IuT2YiiTnnfQPUnobtenAPPBJOsXjQ4BGMQe31ZIC9NSZjWllgdEo05k
	G+Wu+aJJJsTP403/Lz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJkDZ-00HDmG-3E; Mon, 14 Feb 2022 22:53:13 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJkDV-00HDlk-Kx
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 22:53:11 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AF0BF580632;
 Mon, 14 Feb 2022 17:53:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 14 Feb 2022 17:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e2LfV2BcYFTZ6ZIg8
 FOTVm2MpIs9idDpZ8R+EsQHXrs=; b=SJdNeO/8jyTfLiWOckcAG2OHGKCIILKot
 CoUd+ViU7KAYtLt39PVDcb/IGuv6zV7lLNGGyCe8EGuQ5DurWAtyc+59koNFynFb
 Vax9tANM2zkhCcUoof6TNS/nhOKqyPS+Hw3tsgsfWgJvrvYRq/oTiaPhFIsCZ3gq
 572A76x7uTT/SQOWr2a+qXWcnzfFPlN8I/AlTAP67o6ZCB+w+xPm/B5psHno61aJ
 DCH/hrkY5RKmleyp5ih42WMsScPaotRe9Unr3WD7ZeSnt0m2dNzPfz999KUbozwI
 V020ATKE/pSE4MZC8o1aHNCuKDsllmkkIJSgA7ad0fRyvnrt2DTiw==
X-ME-Sender: <xms:T90KYtUsU1i8H8oKgKHJ6zYGcswaPP0J8WgFAclau0XetWuIQzG0mw>
 <xme:T90KYtmQA6gxwJzCjpgsGZ91IZLbkRkK9l-KZyxb5ryxN91ZuejBSqStpdrtODbHF
 GifMxA7HMTM-t1YzjE>
X-ME-Received: <xmr:T90KYpb6E2tmhE99twMc1QbFpCxPqjw62-HdwNAwXMsB5Z1t4aNo3u9CZxAFYhuTPi2ZXSZxw3FS5jdDrwiRWsSOAlcaid0NeVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveffteeu
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:T90KYgXiz-V4ond-i7eX1uAvA0i9WOmsdnB3aAw0H2uwKsVWoxeXRw>
 <xmx:T90KYnl-c428-0I3-b8b87OVnAgj1cO8HsHp8BhvVhhh6vh8QeegDA>
 <xmx:T90KYtcrQAQMyH87a2CMfgA9HSwqEFEk9lDpm9-zJ546bLNuMFdolw>
 <xmx:UN0KYnHmkgdFIoGzRmz69Z6jzOvFrkcKI8C9eYQOxPNBA0jBhzy_3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 17:53:00 -0500 (EST)
Date: Tue, 15 Feb 2022 09:53:11 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Joshua Kinard <kumba@gentoo.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
In-Reply-To: <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
Message-ID: <b43cc58-5ace-11e1-1a11-6cca42f65e7@linux-m68k.org>
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
 <CAHmME9ooEbgiv3DRk87ei+rUoVNMJthY7UuG_xCgm=kfMZAajw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_145309_890795_4456CD85 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, 14 Feb 2022, Jason A. Donenfeld wrote:

> 
> So the only systems we're actually talking about without a good cycle 
> counter are non-Amiga m68k? If so, that'd be a pretty terrific finding. 
> It'd mean that this idea can move forward, and we only need to worry 
> about some m68k museum pieces with misconfigured userspaces...
> 

A processor cycle counter is helpful when mounting a timing attack but my 
museum pieces don't suffer from that problem.

Also, they are and always were immune from spectre, meltdown etc.

You misrepresent those secure hardware designs as being problematic, just 
because of some bad advice on some random blogs about RNG API usage.

Do you have a phone that no longer gets updates from its vendor? Have you 
tried patching it?

Your insecure museum pieces are the real problem, not my secure ones.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
