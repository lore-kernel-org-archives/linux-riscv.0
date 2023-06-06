Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CA0C7EE2F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mwHE3bAlCYLgWayZTwoJJlIAoHNpFP0FFWycAM7DSdk=; b=lzTSV1CLHBnYfz
	xJ0BPLoFGSqn7vY+2VMZlHOb6QgcImk+E6fUVTcjnb8ZgPJqiFNq8EpYX1wXllDYVq8CmHr7iQkoY
	fz32MIzZxgJj/0UfOITZQv4XvZPF+HrhHmjF1NTD57GW9ikeYedoDmis7y+GlVrHBy+jE9/ODGyU6
	0TiPykjCGeSQJVYizk/AKYCtNa8WdygG3mnQm8HR+FKQDzLoJX5YafBk7nJyPY+Y/GwF1f324vhBQ
	v9/lerGpTgcd6TFk/Z8KC+P8hpVQTbtcLf3/YxaDt4SGCanXRM1Q4/i/tGRxLcyGpRwhPvh9Fxeaz
	cb2kB/8mRpqNYJsWVMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ul6-001QaQ-18;
	Tue, 06 Jun 2023 11:21:52 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ul2-001QYX-33
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 11:21:51 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id F33D95C01BC;
	Tue,  6 Jun 2023 07:21:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 06 Jun 2023 07:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686050507; x=1686136907; bh=1x
	n4EnfXPYPcSd+SYlCMqeGdlk7+uLOsdP8xB0JMCIg=; b=Ql8KhoFvs6janwDPYm
	OzFnqZbirQ3Y1K/vaWQUlfwmD6LLsen3JVt1Trqjhmh1d6XJaad8lWQ/Lnqi3H60
	f0DMSkIZbX1RAd1S3OiQgOy/huyUyDrgIK311sNrC9SVe4CMaC12/NySF6Oi6SYI
	T0xJtHVXbRqTxA346xGMtBCkMTiR2bjcah9oeGV2pehTWN+Q3m3QOs4UtlEHfor1
	ATqjmdDuCG/8IVRJsw19UFeisjALKMEEuIhKJdMFkSP8zmyYOXO9cjCwPMV7JrHG
	1moLS1VazweI4fT39KVr/Wvxh/U+JubvzNVd6GTLfWGvvbT4Ax8XHQg7Qeu0d1jz
	oE9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686050507; x=1686136907; bh=1xn4EnfXPYPcS
	d+SYlCMqeGdlk7+uLOsdP8xB0JMCIg=; b=SoXI6SuToid++cgZQHF+nQwl5JUOj
	B7iVXV2kSaTM6n4O/WMF/pZSxe14Lp/NszNzLEzghNRlmhh6PkKz9aQA5GIadIcy
	sVd8mf1y9DyNR4aAqyb+xyfP7lC4ROYB24Y7TcxuPswg7T83xu0gmOF1rJTnXQf2
	5RpPjxVsykYqTUgp8VfuoP85DUjrQDAf4b6iBvcm3gTGn1cjnadFvHmfy8jA4aRd
	DKGFVTgCMoPfmpDSn1XVpoU4/ymakGZlF+kuwniJd/wRlYPDe6tOvonLCmNdwqUw
	vcOxpswbtRteBo6hIP4O69/NM0zUMLBp+pp81ElMQehHzbt1h+AwapsAg==
X-ME-Sender: <xms:yhZ_ZM8OrrNAFSWfiy_I81HTHoPLeUkTMlXNIPkNhZ6lbqofLZkK0A>
    <xme:yhZ_ZEtkNFO4emSxZjf73vuZBsZRrOiSU_a8c9Qv7WubopeJ1rQVorVGmqlf7RCa_
    Yce6O80Q0xxIFuCrxE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtuddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:yxZ_ZCBu7vWQL64mUtLPgb2p5GNhVIwZVeAxWIvr1Huc-JIXN-OUCw>
    <xmx:yxZ_ZMcP2Xc1TwSQbQs00NMfGL5dDmmy2GUm4thhbLAAw0dL1V_M_w>
    <xmx:yxZ_ZBNGUGXTxkdrRQATBt9rqKTOj7AcJwUPc7-8tnf9xwjiYyYxDg>
    <xmx:yxZ_ZCquUM0kNEoguyU_GnRNzIHkGfSFKYmSx0osfr8NYSbTAm_Ang>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DC0D9B60086; Tue,  6 Jun 2023 07:21:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <63133024-e986-44e2-86f5-efc1c42207ac@app.fastmail.com>
In-Reply-To: <20230606111216.524384-1-falcon@tinylab.org>
References: <d1c83340-af4c-4780-a101-b9d22b47379c@app.fastmail.com>
 <20230606111216.524384-1-falcon@tinylab.org>
Date: Tue, 06 Jun 2023 13:21:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhangjin Wu" <falcon@tinylab.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Willy Tarreau" <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/3] selftests/nolibc: riscv: customize makefile for rv32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_042149_723549_EDE03B6F 
X-CRM114-Status: GOOD (  18.58  )
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

On Tue, Jun 6, 2023, at 13:12, Zhangjin Wu wrote:
>> On Sat, Jun 3, 2023, at 11:05, Zhangjin Wu wrote:
>> would seem more consistent with how x86 is handled, and would
>> probably be more easily extensible if we want to also make
>> this work with other sub-targets like mipseb, armv5 or ppc32
>> in the future.
>
> As Arnd and Thomas suggested to align with x86, I just tried to find a
> solution to avoid mixing the use of _ARCH and ARCH in this Makefile.
>
> Since both riscv32 and riscv64 share the same SRCARCH=riscv (arch/riscv),
> and the kernel side doesn't accept riscv32 or riscv64 currently, we need to
> manually convert them to _ARCH=riscv and pass them to the kernel makefile
> like this: ARCH=$(_ARCH), it mixes the use of _ARCH and ARCH, this is why I
> used the '$(if' method currently.
>
> The solution is adding something like x86 in the kernel Makefile:
>
>     diff --git a/Makefile b/Makefile
>     index 9d765ebcccf1..a442c893d795 100644
>     --- a/Makefile
>     +++ b/Makefile
>     @@ -415,6 +415,14 @@ ifeq ($(ARCH),parisc64)
>             SRCARCH := parisc
>      endif
>
>     +# Additional ARCH settings for riscv
>     +ifeq ($(ARCH),riscv32)
>     +        SRCARCH := riscv
>     +endif
>     +ifeq ($(ARCH),riscv64)
>     +        SRCARCH := riscv
>     +endif
>     +
>      export cross_compiling :=
>      ifneq ($(SRCARCH),$(SUBARCH))
>      cross_compiling := 1

I've never been a big fan of the top-level $(ARCH) setting
in the kernel, is there a reason this has to be the same
as the variable in tools/include/nolibc? If not, I'd just
leave the Linux Makefile unchanged.

For userspace we have a lot more target names than
arch/*/ directories in the kernel, and I don't think
I'd want to enumerate all the possibilities in the
build system globally.
> b/tools/testing/selftests/nolibc/Makefile
>     index 4a3a105e1fdf..1b2247a6365d 100644
>     --- a/tools/testing/selftests/nolibc/Makefile
>     +++ b/tools/testing/selftests/nolibc/Makefile
>     @@ -21,6 +21,8 @@ IMAGE_x86        = arch/x86/boot/bzImage
>      IMAGE_arm64      = arch/arm64/boot/Image
>      IMAGE_arm        = arch/arm/boot/zImage
>      IMAGE_mips       = vmlinuz
>     +IMAGE_riscv32    = arch/riscv/boot/Image
>     +IMAGE_riscv64    = arch/riscv/boot/Image
>      IMAGE_riscv      = arch/riscv/boot/Image
>      IMAGE_s390       = arch/s390/boot/bzImage
>      IMAGE_loongarch  = arch/loongarch/boot/vmlinuz.efi
>     @@ -34,6 +36,8 @@ DEFCONFIG_x86        = defconfig
>      DEFCONFIG_arm64      = defconfig
>      DEFCONFIG_arm        = multi_v7_defconfig
>      DEFCONFIG_mips       = malta_defconfig
>     +DEFCONFIG_riscv32    = rv32_defconfig
>     +DEFCONFIG_riscv64    = defconfig
...

Right, that part looks good to me.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
