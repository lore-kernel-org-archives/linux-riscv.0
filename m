Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505BDE7D242
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Pas1C/S1q5sWPrqOGVnS/Gbz5+Ja02H58TwM9TE6v0=; b=OnlzT2Dya6ghB4
	xtAPXEdrigD/uVlT82HX3qmC8NJZGjrvxmU8rpZDFtKXUiHnsnhPAT0yo9wD/ZH2RWA2H6H1hB4Zy
	eGUXdnOFO06YD9Exub6uLqZX8HojLPE8rJf6Sp6ORBEIXrteN/6AB/Df14rSKDOiSrmY+X9WOYkLn
	t29+DgtVmPBp2mmT3TNQgAPac0WEp91utLzOC5ch96FtJVFmV8SthWFq2wmXBOrmbFpBYxTzsXpSv
	gnQZolejtoDVt/95CGgssp51+XuyoTWHtwC7NT52Lxkmd4QsLElZKyUxRwmenn+EWrHrLJ5K2Iw2H
	vXkoLNzf2W5kjUTQNH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2HM-00FmES-0I;
	Tue, 26 Sep 2023 07:14:44 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql2HJ-00FmDD-0v
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 07:14:42 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 309D8320094D;
	Tue, 26 Sep 2023 03:14:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 26 Sep 2023 03:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695712473; x=1695798873; bh=VF
	VeVZmTfs9bsTzTBLiILy5KA2+NCbWVhaZijAd/VUg=; b=RD/znBmfPhrGsAnVAY
	+irDC1f47jwc/OcjLoXLDdVUlj1zpwTv0GWS7Dpasxt0ve/H43ktE5AlC/mqEMKR
	ep1xWhoEEkI7ZY/OjixKQdAP+3ziGChjqiRAlm4Y+PfzFTLDsLcBVJ7i/fRn6Jb3
	HMmFKjpCbGGxb18L0YIasG8OAIVmisiROiqoPRzDAQBpTbuzDbTGrhYdOqTqnkmR
	N6RZGRkOQdmMabpuuUZ3eYqMW78/NM6NWplH74ZkFcrhvmMcsLf6mGsLOok/aVo4
	Aj3f+SVK1GyM/VBdy7NtsjSm8LNIcS61Hlam+uhlqr+ObXhHuTP9CDlKYVO/PN1r
	byKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695712473; x=1695798873; bh=VFVeVZmTfs9bs
	TzTBLiILy5KA2+NCbWVhaZijAd/VUg=; b=Ahh6tOszfUEWLcNcTiHI95DQ4R64V
	qFSrCmckpTae9k4He4XOTDs3KBomVkkso3mw+ynZIFoMiSqGV/G4ckBtZA1MJ4mm
	7gdY8wtbyMMrjIQafA+JBk15LR/NeELV4B3EspPY8plBzzY08TeD3bt9gJ8PYm92
	v8iw6vN92eHlDqC/lyVIiSGsbfaNzwLBQXpcfSCRnfaeuXkxXsmTBRN1Seua6n3O
	0yAm+1GcweN6o8OLGuFTXtymeLacVGJ4O/u0WVRlUMBK4s/bxPXrT7gQ9+HzEvCj
	ITlpEN2QCGDN9Ghljw4CeoFvJE3c1Z5sTDe+zHYWSAeHaW3hXvL/lx1Gg==
X-ME-Sender: <xms:2IQSZXmjoEFmrLb9EKWoCoxtD3u0aXEjXfXQPS8hKWP4jPEsadNRng>
    <xme:2IQSZa1sxi3qnBIBUVbJzRYdK5_4bVisgfksSY-XsMGzbXPgzuPcKW0Frf4i1eVqV
    HumL6H5D9chBkVzdD0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelhedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:2IQSZdoL_O_-_O2PAecArnTaJAHWSsMp4R_MWwza4KO0Xi81nAbr7A>
    <xmx:2IQSZflT0t41018Agk-iGSM8ZfiHxwX1uMwMXO8QobVy0Ap8Cy1ozA>
    <xmx:2IQSZV07z2qJ_dVH0TNRbPa7ApSCu8mgd6rUxWEvxFIYwzGJCD83wg>
    <xmx:2YQSZWuURAkURuQdAchXzcSNdwcy3aiXInl96Rj4GrGMelswsO6NFQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7A2D7B60089; Tue, 26 Sep 2023 03:14:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <fbb6f526-0db9-4bbe-9635-8cb55b4335ee@app.fastmail.com>
In-Reply-To: <cover.1695679700.git.falcon@tinylab.org>
References: <cover.1695679700.git.falcon@tinylab.org>
Date: Tue, 26 Sep 2023 09:14:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, paulburton@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Willy Tarreau" <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Tim Bird" <tim.bird@sony.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Nicolas Pitre" <nico@fluxnic.net>
Subject: Re: [PATCH v1 0/7] DCE/DSE: Add Dead Syscalls Elimination support, part1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_001441_504541_A2F5570B 
X-CRM114-Status: GOOD (  18.70  )
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

On Tue, Sep 26, 2023, at 00:33, Zhangjin Wu wrote:
>
> This series aims to add DCE based DSE support, here is the first
> revision of the RFC patchset [1], the whole series includes three parts,
> here is the Part1.
>
> This Part1 adds basic DCE based DSE support.
>
> Part2 will further eliminate the unused syscalls forcely kept by the
> exception tables.
>
> Part3 will add DSE test support with nolibc-test.c.

I missed the RFC version, but I think this is a useful thing to
have overall, though it will probably need to go through a couple
of revisions and rewrites, mostly to ensure we are not adding
complexity that gets in the way of other improvements I would
like to see to the syscall entry handling.

It would be nice to include some size numbers here for at least
one practical use case. If you have a defconfig for a shipping
product with a small kernel, what is the 'size -B' output you
see comparing with and without DCE and, and with DCE+DSE?

There is generally not much work going into micro-optimizing
the size of the kernel image any more, for a number of reasons,
but if you are able to show that this is a noticeable improvement,
we should be able to find a way to do it. Geert is doing statistics
about size bloat over time, and anything that undoes a couple
of years worth of bloat would clearly be significant here.

Another alternative would be to resume the work done by Nicolas
Pitre, who added Kconfig symbols for controlling groups of
system calls. Since we already have a number of those compile
time options, adding more of them should generally be
less controversial and more consistent, while bringing most
of the same benefits.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
