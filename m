Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7293BE810BE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA0ktUi8hRej0UhMlnjtOzSOu+ySiXFDaM9QfIJY1As=; b=JZ+qsfBFv6bikn
	8DjwTLRnMik7ATVbTyEfa/pmXbhkY4HcnzK0pHVvVbVJIzgVEi0blJKvVzuza7GWMWeI9xpm7mO7p
	0V9sCmXL65tp0HL6bCfyf4ivi1wGO5xt1Koo5tUJZvXnvSoZMnquNz5s1XMLQ8qMw260SyZVV4Erw
	MPVkT0PmjQFQE/31IMKrE3NM//uALRabzVvlKdwLed38Tk8X4dlssV8Lhm0k4L50epbdzK52a/BTE
	zQbPnjiE34Vbm7Kah8SldhMqpjMHlabZeEU9jwzI8yXifG5c+QZnU1DOMk7LalIlQQnU4x0pjCVLQ
	2d9tGxELQLrMoaEnMDOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRgC-000bsf-2A;
	Wed, 27 Sep 2023 10:22:04 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlRg9-000brW-0I
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 10:22:02 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 4593832003D3;
	Wed, 27 Sep 2023 06:21:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 27 Sep 2023 06:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695810112; x=1695896512; bh=G7
	dGvBd5JsvFwgK2DiyTTK5tZ9qMJXgbyFZhkcns0j8=; b=jJLQRHOAPLDSOvLQqW
	WexvwtHRbbvyYZN4KpedDK9YccRpe43O8KW6HCHNmUOvgDytGvWCxRVlt2WRcWAI
	w7J2R1N8qolU3EvO62bbJOpcszJHsBP6Cstv29tacwiI4pv+fI3A1bsWk5TkAis3
	lydKl3qhhTWR1SjJNPJePPSt9qTT7rYJCtozU60/KXpPiz2Xsk906JXVplRtaOis
	T7arKLWfu+xbmagOY9lGeFQgWtGeDY5iZTTGAkhu/Cmn9QUr8j26eodbL5hOb8Y2
	JDZIDbFr4m6K/8jRSVM1L38P9P5lWtkrIDx41cwz3uXjStv22w78aagvfDMvaNIR
	89mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695810112; x=1695896512; bh=G7dGvBd5JsvFw
	gK2DiyTTK5tZ9qMJXgbyFZhkcns0j8=; b=XuAhfabudNl+kqZNOXcRIxfP89H1a
	KPFafcBWfDl/Scy7NW7BlMWmJZkxEc2tnHz9ed8U+0WsyVXygiEdK7lCzsSBfB69
	XRsqdTGQ0MdyPVSIYtFUxltswAeKap/nWJQ6Kh1ZPIZcdMXCVdE219albEBWH073
	Zvp8ASEatxFtRsRGheszk9lOFk3QMzscA5nXFxzx4ol9FL2V1yt5bu8ubqxHMaDH
	2VD/4268cqPTilnXUFC+IPXIP1svuq4bwW7oZJkvUh/NzjOMH5I5kaFa55zRfxDv
	rl7hzJSbHtZtKSBHLbymF9gly5ei0S+T946ox6OuKBxVmD729kf2UY+Ig==
X-ME-Sender: <xms:PgIUZQgd8wc2oEIwXUtFjGaBVd_-mvP1lYS227cqqe0FiDn0uLTNgw>
    <xme:PgIUZZCo7skyPjFBGoK2IMEXJHEGYAwh_uDjnYl6ch7H7KOJiBYBD2-hYGLFwGxn3
    XeG4oHpeDz_6U3JYfM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtdefucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epvdefjeevfefhvdevjeeuheefieetvdduheeludevtdefhfekleduhfdvjedtieeinecu
    ffhomhgrihhnpehlfihnrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:PgIUZYF9L6JvIGCmFcBH-mWGhkd-RDEh2UMI0pQsOFgkWAMcm-rhyA>
    <xmx:PgIUZRTCyY6yWS5f1bwEKcP2SDwSysedEghOT0XswqmFlKSpCxdnIQ>
    <xmx:PgIUZdxe-Y4wWjYltbwliWqsUiL_Z0RS3qKLeIajl6UkqiCFW_krgw>
    <xmx:QAIUZT62hUezLzCf7tWCLY3gFCsJGirrafP915pncyO15zAz5TE6UQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D0E99B60089; Wed, 27 Sep 2023 06:21:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <f636d6c8-d437-48d4-9582-33b3ee77c145@app.fastmail.com>
In-Reply-To: <6n7o7p99-9pr2-9orq-6nq1-093n7n7n43o9@syhkavp.arg>
References: <cover.1695679700.git.falcon@tinylab.org>
 <fbb6f526-0db9-4bbe-9635-8cb55b4335ee@app.fastmail.com>
 <a08e1cee-05e0-447a-b25b-6c2ebb116e8d@app.fastmail.com>
 <6n7o7p99-9pr2-9orq-6nq1-093n7n7n43o9@syhkavp.arg>
Date: Wed, 27 Sep 2023 12:21:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Pitre" <nico@fluxnic.net>
Cc: "Zhangjin Wu" <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, paulburton@kernel.org,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Willy Tarreau" <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Tim Bird" <tim.bird@sony.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: [PATCH v1 0/7] DCE/DSE: Add Dead Syscalls Elimination support, part1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_032201_454467_5E00F8AA 
X-CRM114-Status: GOOD (  13.60  )
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

On Tue, Sep 26, 2023, at 22:49, Nicolas Pitre wrote:
> On Tue, 26 Sep 2023, Arnd Bergmann wrote:
>
>> $ size build/tmp/vmlinux-*
>>    text	   data	    bss	     dec    hex	filename
>>   754772  220016  71841	 1046629  ff865	vmlinux-tinyconfig
>>   717500  223368  71841	 1012709  f73e5	vmlinux-tiny+nosyscalls
>>   567310  176200  71473	  814983  c6f87	vmlinux-tiny+gc-sections
>>   493278  170752  71433	  735463  b38e7	vmlinux-tiny+gc-sections+nosyscalls
>> 10120058 3572756 493701	14186515 d87813	vmlinux-defconfig
>>  9953934 3529004 491525	13974463 d53bbf	vmlinux-defconfig+gc
>>  9709856 3500600 489221	13699677 d10a5d	vmlinux-defconfig+gc+nosyscalls
>> 
>> This would put us at an upper bound of 10% size savings (80kb) for
>> tinyconfig, which is clearly significant. For defconfig, it's
>> still 2.0% or 275kb size reduction when all syscalls are dropped.
>
> I did something similar a while ago. Results included here:
>
> https://lwn.net/Articles/746780/
>
> In my case, stubbing out all syscalls produced a 7.8% reduction which 
> was somewhat disappointing compared to other techniques. Of course it 
> all depends on what is your actual goal.

Thanks for the link, I had forgotten about your article.

With all the findings combined, I guess the filtering
at the syscall table level is not all that promising
any more. Going through the list of saved space, I ended up
with 5.7% (47kb) in the best case after I left the 40 syscalls
from the example in this thread.

Removing entire groups of features using normal Kconfig symbols
based on the remaining syscalls that have the largest size
probably gives better results. I can see possible groups
of syscalls that could be disabled under CONFIG_EXPERT,
along with making their underlying infrastructure optional:

- xattr
- ptrace
- adjtimex
- splice/vmsplice/tee
- unshare/setns
- sched_*

After those, one would quickly hit diminishing returns.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
