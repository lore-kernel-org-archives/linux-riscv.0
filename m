Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6B3C77B7A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zKdE0bL7tWjm/bpso3mi8GUvzM518mPSSKS02vISo8Q=; b=xjZ+I9y6XGzYBK
	uwjKRVTuFYsu23Id9+aLYrFsAyXar7Q1T21THcpC1JcuPNVyanK0DeuaxhJeChZH3Y+ea87gePFz1
	E0xm7LgXTgNxnzeUzDaUFGDdfCZ0wHQsyhRhu6OP1pSY3UpenThvwFGkyQWFuEhs0uTJvWI4oaKCM
	MiCbLCCOxJG38sSKJgPIiFR3+GUAizF0Hoyq/bLIyL1E/7LmEgBAUOc5YYPLLWa2HtjazjNjBYEt6
	OddeGTIkHwtx1p+kqU0gUKzl7ByOsNNo+Gu8GgdoiybB3l9CGZ6GQIHsZ0NKuRrEgtbnnVHw73KiY
	UkTwkoQKMCw/kukfNv0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6q0A-005MqB-34;
	Wed, 07 Jun 2023 10:02:50 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6q07-005Mo7-1a
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 10:02:48 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 89F633200907;
	Wed,  7 Jun 2023 06:02:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 07 Jun 2023 06:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686132160; x=1686218560; bh=T0
	S94E2qLXmGs+N9sPOaQszP553BKZ2FJLocWfYPArs=; b=pFhjS116As8+eGURjI
	zVHDXCcfMw2WiNMgh3caeu5W6Fpjv5Bo5arbt445G4Ii3l0NgiWci8HdkXDCbE7j
	RbuTQqfMjFMXWdjpo58NMN24tC84cBVnIBIEZBYZQnyvjU6xpAxyKHBd6K+oFd1O
	HYKnOwSH3S364eDp9K+YXhHnkb2ryLRIx1pbskIO3y0EHyyj0zSpwTuDzo8j8Gpm
	ALCYUqnfSIIr+mRw7NzfQE6V9jAZ8Qyg8QJ0bJdWIvVLzRDlsvL38xnaJQQ9k0my
	ck9peEuB/sSL9ZVv+FBjUtIFDuukdpR4EusWJmbu8InAzLKoVADG1iRjkxremr3J
	acPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686132160; x=1686218560; bh=T0S94E2qLXmGs
	+N9sPOaQszP553BKZ2FJLocWfYPArs=; b=t8ZZIgthjGwEP1RH+BAH4u5JBRhm7
	ZnXTWLnHptByfT2ahXyjN+BqgcKxWyELWKlp9hBk8Q0Bchj7u1copP+07bM4cYFO
	47sm6ZPJo2RBXGGAOhYlcd8L82/mGxF3iImaWsF5WpVO3lefh1RmeLFC1Fz4opq3
	d2Rhm+ooAoNRLUjASCToADEW7D3iOXIw2POZHMUeBaxUVBNlfyvunBTS754pcBtS
	DyMnXvvnIAR6HD5C2uDIEb5iqfqzfMjK58l5cWjjIohtmitJuIQhT3xqxBsAgfzv
	WwIEpYNcZ+qYJ4gNDZQIqHaof3ye7q4YkSXIAPCJSp3RhsHBt6A8dhoAg==
X-ME-Sender: <xms:v1WAZNZ6tx4KzLLwjBQybMyfYrpydqQygebu58gMU898AaW3Mybsxg>
    <xme:v1WAZEatuQXZPeiyRazxsbX3d6f2KdM7mEZ8Joak9-W_Nn0ZwoOM2j0h8NB8lGVji
    f12eYqsaVUL0Vpli0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtgedgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffdtleeuheffgefggedugfelleeigfdukeegffeggefhveffgeekteduleel
    vdetnecuffhomhgrihhnpeguihgvrdhnvghtnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:v1WAZP8CpKmKcWHhUIHLX1JxIlfSRjRGRMjCP-2R5lQFwxZOdQGFbQ>
    <xmx:v1WAZLrMfb9ykHuWBytX9AIPB1zYj5Q47SnOwDbZuTmgL7sFnciGcQ>
    <xmx:v1WAZIoLO9IR2dKbhHGEOnadDVWykCK-gRTYXRN-dsPt49J4Yap3jw>
    <xmx:wFWAZDWWByNSSzYfgRTvqGCehTTBvNYxePiX4YXRyDy2bA9U4OPQzg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 14B58B60086; Wed,  7 Jun 2023 06:02:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <635d1aaf-3982-4404-9c05-05e51800691e@app.fastmail.com>
In-Reply-To: <20230607094615.792013-1-falcon@tinylab.org>
References: <b80f021a-30b7-47e9-8455-3844be157cc2@app.fastmail.com>
 <20230607094615.792013-1-falcon@tinylab.org>
Date: Wed, 07 Jun 2023 12:02:18 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Willy Tarreau" <w@1wt.eu>
Subject: Re: [PATCH v3 1/3] tools/nolibc: fix up #error compile failures with -ENOSYS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_030247_560070_B15951A2 
X-CRM114-Status: GOOD (  17.57  )
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

On Wed, Jun 7, 2023, at 11:46, Zhangjin Wu wrote:
>> On Wed, Jun 7, 2023, at 07:19, Zhangjin Wu wrote:
>
> Ok, agree, as the 64bit version of lseek may be enough for nolibc, if a target
> application really require, they can add the alias themselves.
>
>> Are there any examples of functions where we actually want mulitple
>> versions?
>>
>
> For example, the following ones are related to the syscalls being added,
> all of them have similar library routines in current sys.h:
>
> * waitid, https://linux.die.net/man/2/waitid
> * ppoll, https://linux.die.net/man/2/ppoll
> * pselect, https://linux.die.net/man/2/pselect6
> * clock_gettime, https://linux.die.net/man/2/clock_gettime
>
> The similar routines are put in right side:
>
> * waitid --> waitpid, wait, wait4
> * ppoll --> poll
> * pselect --> select
> * clock_gettime --> gettimeofday

Ok, I think these are all useful to have in both versions.

All four of these examples are old enough that I think it's
sufficient just expose them to userspace as the bare system
calls, and have the older library calls be implemented using
them without a fallback to the native syscalls of the same
name on architectures that have both, newer architectures
would only have the latest version anyway.

> For the clock_gettime, it may also let us think about if we need to add
> its friends (clock_getres, clock_settime) together.

Yes, I think that makes sense. We also need clock_settime()
to implement settimeofday() on rv32.

Ideally, I'd love to extend the tooling around system calls
in the kernel so we can automatically generate the low-level
wrapper functions from syscall.tbl, but this needs a lot of
other work that you should not need to depend on for what
you are doing right now.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
