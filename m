Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86232C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 08:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJleOvJkeGZMMkEPSiR7G870f3I8GCwZ3I0p+0hjvtU=; b=FkxDqsweLrDdT8
	wD8Qlq7HxTKdg45g/2I2oadMF0+BOFSQVjqc1sREJXK9Z8JhEzLUnygVGDumxabK46k19qCQP4KB4
	NerlKwE3X8rtPC2ryNcf6BoH7vh3j4JquPglhEsDSaJM8i1KXwYzd5L/+RNOLx6ZnMYf/JbZlFwIo
	Jw02wBGP9kFsxYzarCSYizUz13ph8AORWaEtznh/mxiaPTqHLXX/2Rn71E9m2kzlBbjs6eT3lnly4
	zeh8buVg55/5IJOBOwYWqR8Wor38fLf/B6AxYl2e+cLiN3Ts1Gbrxk7gzeGhqaDN9Tt5vTBT5KQ/x
	yWyO2gw5wVUdXgooXV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN88C-00Ak6x-Ac; Wed, 01 Feb 2023 08:06:12 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN886-00Ak56-2M
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 08:06:11 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 7579A5C009C;
	Wed,  1 Feb 2023 03:06:01 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 01 Feb 2023 03:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1675238761; x=1675325161; bh=05fE/HK6Dq
	vQfuvfJUrtINoSrSYug5Jz6pNScpWDd9M=; b=gdDAzdJnUgARfIEeRZCLlY2AtO
	v74aILYBuJUkN5gVMmUtlosl9ppOfH60aqfSoj07Kl6G7zkPDXIcc1Tn7WqGsCSY
	JHWRmXGc5FjMONZaMfY5WnKfh4+yNPKjapKm7nBNB4gkUJE1FMz0/yaIXkasXZYr
	Bc1mldhanJo4qytC7b/hiwGs9IV4mRSuggQP/az3Ybajn7Z0am77Hnl5ZJMZym3H
	vWd/exHbA6TIoDYIzC+RjUXaZJ1HDmXkDOaZTvPw4zzphBjM2enPEEOSrQOYwuoZ
	QZzR+YVnbCYoWnucl0BxQmxUZqRR2YZ+y9GhCgcrf+tynOql1uNkVhNyJ/cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675238761; x=1675325161; bh=05fE/HK6DqvQfuvfJUrtINoSrSYu
	g5Jz6pNScpWDd9M=; b=XnK7mTbGT+y2VJPvrPrYkQusdgUqVG+arE0ljbCtLobt
	xF7R0hFy26tIba5+FFbfuDjPITdtTJywip6T8hEWQUscePYDJ7v+IzjQsead5HQg
	j54GeZEWOtyXWA/zoi+NWPqgM8vaodQf9A6s7F1nneQc3xLQ1dR1G0GAPw2gaY3A
	WPculnNFTznKCI1DJmPz7teFuBAB/N4B5VAWHrsG9g28p+n5bGtTj1P7xc1sPsgN
	kGqaf5MdAfjxWayKoHJX6lVgBfmZ4BOer/Mj44RDf6m3Rn/sqIhLcUzccNIJVMOR
	0K/E/yN5n+IJMexHT8W4XElTCgy+E91qRKJz7KE+ag==
X-ME-Sender: <xms:aB3aY0kNRkhEsKKc7NW05bFZlBy0UWXoQG814K_VbXZ6oRacZ0YgdA>
    <xme:aB3aYz1aBYvMbdLtkMaXJsJdBRmcsfPlBVZMlSTXO070uA5tuWD7Sbpx8jfRoAg3S
    R9KeXnnBzq6L5r9fR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:aB3aYyqS9g0SH2SwMkDNfyVSdWwWQ_3vkD-Y8I2CJK8T08FGcXImjA>
    <xmx:aB3aYwlk6ejAUhE8GGyoNRtrsjcSfpj2rncyHbwPj8DgBJQQXj9lsw>
    <xmx:aB3aYy1yzx3pB_HtgiksIP1tWk8igi724QtNhtyVToNDcf8KbDHNCQ>
    <xmx:aR3aY4PmUfRE7zHhmGRTa3xNtxToXlz0tv-QKwHcrevHDVzY3GqBPw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4D56FB60450; Wed,  1 Feb 2023 03:06:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <b064f754-4d94-4c0d-ad27-e0ad223d022c@app.fastmail.com>
In-Reply-To: <11BE997B-93C7-4D38-99BF-FD025A1FB945@jrtc27.com>
References:  <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
 <Y9KQPxzHBuZGIN4U@casper.infradead.org>
 <CA+V-a8uizF8sQgs8cfTwH3OnK+nvr2dXAoSOPTXCXLFnprHSeA@mail.gmail.com>
 <Y9fhOFEV0kS9U06/@casper.infradead.org> <Y9oHT1D1X9cdHLr0@infradead.org>
 <11BE997B-93C7-4D38-99BF-FD025A1FB945@jrtc27.com>
Date: Wed, 01 Feb 2023 09:05:41 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jessica Clarke" <jrtc27@jrtc27.com>,
 "Christoph Hellwig" <hch@infradead.org>
Cc: "Matthew Wilcox" <willy@infradead.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Geert Uytterhoeven" <geert.uytterhoeven@gmail.com>,
 "Fabrizio Castro" <fabrizio.castro.jz@renesas.com>,
 "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Chris Paterson" <Chris.Paterson2@renesas.com>
Subject: Re: [QUERY]: Block region to mmap
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_000606_213839_C4AEB787 
X-CRM114-Status: GOOD (  19.32  )
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

On Wed, Feb 1, 2023, at 08:05, Jessica Clarke wrote:
> On 1 Feb 2023, at 06:31, Christoph Hellwig <hch@infradead.org> wrote:
>> On Mon, Jan 30, 2023 at 03:24:40PM +0000, Matthew Wilcox wrote:
>> 
>>> Before we go too deeply into it, how much would it cost to buy all of
>>> these parts and feed them into a shredder?  I'm not entirely joking;
>>> if it's less than the software engineering time it'd take to develop
>>> and support this feature, we should do it.
>> 
>> The above suggests this is in no way an actual hardware problem, but the
>> stupid decision is done in the M-Mode firmware.  I think it is very
>> reasonable to simply not support the devices in Linux until the firmware
>> is fixed.
>
> No, it really is a hardware spec violation. Virtual addresses within
> the magic range bypass translation with no way to turn it off. The
> firmware is being (has been?) patched to block those accesses at the
> physical memory protection level so any attempt to use those virtual
> addresses will fault, but if Linux wants to support this cursed
> hardware and its gross spec violation then it needs to forbid any
> allocation of the VA range.

For a local build of an embedded system it's probably enough to
set CONFIG_DEFAULT_MMAP_MIN_ADDR and CONFIG_LSM_MMAP_MIN_ADDR
in order to force userspace outside of the broken address
range.

If that configuration can no longer run most regular userspace
binaries, there is probably not much need to detect the hardware
that needs it and do this automatically in the kernel, beyond
perhaps some platform specific code that refuses to boot unless
the config options are set this way on the affected chip
revisions.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
