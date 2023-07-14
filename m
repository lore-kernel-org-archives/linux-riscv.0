Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38086C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 19:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXpNpQhVvvfUCfjtlbc35gkvb6X9KJ3Uq9hTwoqr90E=; b=bF8mE5H74KZl6N
	ZC3WYd1SELsFuFSCnbngtw87ZHpfLswOI8RWCI7jGZRvVpW9yMMyyHQI4mSIzWvq3izLi8zUbED7k
	mf9j9bf+BhvN04+K0UB1VhGvxPeS8fct7AipN03YK0xe9pUEPtf2E/8G1p48+Sv48EdiFNWL3zunw
	fZRTticEt7DalmERI0I8cKeivmurv2ECdnB8iaNEhiiWF4yK4Ud/1gzCXBXBzitw0pNB/RZDx2Gkn
	n+Bz+5k5Lddbzmb96mzzO7JLfdzlnRJQNEHQo/+ESzB4nGbwF7varUSjy5THeKLphFPm2gtJRFes0
	nEc89wWZpuPGY5yQXgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOu3-0079Jl-01;
	Fri, 14 Jul 2023 19:56:35 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOtz-0079HB-13;
	Fri, 14 Jul 2023 19:56:33 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id DEDF05C009D;
	Fri, 14 Jul 2023 15:56:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 14 Jul 2023 15:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1689364585; x=1689450985; bh=bIDbQfxsNuvf3d9r/rOpxa+WmMoPtn+8jD3
	nk1eOuRM=; b=SGMembvX6/sAHfuOugqH9axbat/QoJ0k31uIq0vHq0+0ZRq9/bm
	OXE4fsjATB99uYFbcAOqgiYTHo/G6oDsB/CtG/4tOHM+S4lOaCWbNGhHggOsAJTg
	R9x3L8nKHjrq8GlGVIJ3q52beg3LfkH49h4safD8f3/9/UWoGrvEiu/G8GQeWhsj
	QBINygCvMVi3GocH49248OkLx/g7BcAV1u7sIyM14bQ44Jjn/2m2h0UISKDEyaOz
	LiZL8ngaiTLV0m38ocWnY5LlNGr8kj6VSMgo6BbX4AuPvRR9+inBIg2TDeq3EBVa
	XU1pvnDy1aQqp4RoKfvE7UAdu5l/KSmdn0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1689364585; x=1689450985; bh=bIDbQfxsNuvf3d9r/rOpxa+WmMoPtn+8jD3
	nk1eOuRM=; b=OQUfHU85i/3qDShDvTCgfTD7feljdTJdTsnuo5ejQBoyPs0P2uv
	Z8yhnO9uqNgQP4P4ilW2vOODiZuuT114HqvMR+jVhEzUGMPzGFNZb9y/2mM11JH3
	iSO1XktS3kXfIxO1sn/yYGVQonR1mWZCYIIOrqoVRNzaSTphNKiVsgzIBPIScgWb
	Z9v0Zo8pgQ6o2JVPgvhPnhBB/uIl9i84xc840h50R0HRvBf8iSsayfWcg5bT1Eec
	vVXCtmEw6o+6btBP99+xmA290mk9/QTtkdDPF9AJWxPcVzskgP+PvHPr+w/oRip3
	0GmREp6JTbBoHvyZLHHMGxmDM7Lx70sI4ew==
X-ME-Sender: <xms:aKixZINAaHZB2npjlr6kbwwcGSVaR5zGuNyYmH16wvpA4A1Iul-Z-A>
    <xme:aKixZO9FE28zzxsHMXwW1FYewcFTJPhJbLC0HpzLgAg6Gu9oCDArV6KFkUHtSfJNl
    EUoJjSEoSDY6FTMNnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeeigddugeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefgkeeuleegieeghfduudeltdekfeffjeeuleehleefudettddtgfevueef
    feeigeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:aKixZPTYvU0vcmCP_r2Hf20okR3zUmuZi9AmprKDUWqxyEYbhddrMw>
    <xmx:aKixZAsElIgnNOVEibh3rfmvgRbV4aiLiBiVdTJDz0occUAMdxRP6Q>
    <xmx:aKixZAdfD6MDZtpCirPQ9q2-7iBk7Zcv9Ts7-dfZxNFt69I6d2fbWA>
    <xmx:aaixZHzmJD_NpvGaWn6kqZWRXRbs2qeuuJsh2383wclZmbiiFdiBMw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 66359B60086; Fri, 14 Jul 2023 15:56:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <bf997965-71d1-4949-8cbc-de46ac6a1283@app.fastmail.com>
In-Reply-To: <CAP-5=fWmPQ9vtH1t9pSPCPBiOFxQQe43C7Bk4amLS08ASAnwGg@mail.gmail.com>
References: <1687443219-11946-1-git-send-email-yangtiezhu@loongson.cn>
 <1412dbaf-56f4-418b-85ea-681b1c44cc26@app.fastmail.com>
 <CAP-5=fWmPQ9vtH1t9pSPCPBiOFxQQe43C7Bk4amLS08ASAnwGg@mail.gmail.com>
Date: Fri, 14 Jul 2023 21:56:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>, "Tiezhu Yang" <yangtiezhu@loongson.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH v3 0/2] Unify uapi bitsperlong.h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_125631_767047_C0FD3BEA 
X-CRM114-Status: GOOD (  24.04  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMTQsIDIwMjMsIGF0IDIwOjM0LCBJYW4gUm9nZXJzIHdyb3RlOgo+IE9uIFRo
dSwgSnVuIDIyLCAyMDIzIGF0IDg6MTDigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
PiB3cm90ZToKPj4KPj4gT24gVGh1LCBKdW4gMjIsIDIwMjMsIGF0IDE2OjEzLCBUaWV6aHUgWWFu
ZyB3cm90ZToKPj4gPiB2MzoKPj4gPiAgIC0tIENoZWNrIHRoZSBkZWZpbml0aW9uIG9mIF9fQklU
U19QRVJfTE9ORyBmaXJzdCBhdAo+PiA+ICAgICAgdGhlIGJlZ2lubmluZyBvZiB1YXBpL2FzbS1n
ZW5lcmljL2JpdHNwZXJsb25nLmgKPj4gPgo+Cj4gVGhhbmtzIGZvciBkb2luZyB0aGlzIGNsZWFu
dXAhIEkganVzdCB3YW50ZWQgdG8gcmVwb3J0IGFuIGlzc3VlIEkgcmFuCj4gaW50byB3aXRoIGJ1
aWxkaW5nIHRoZSBMaW51eCBwZXJmIHRvb2wuIFRoZSBoZWFkZXIgZ3VhcmQgaW46Cj4gdG9vbHMv
aW5jbHVkZS9hc20tZ2VuZXJpYy9iaXRzcGVybG9uZy5oCj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvdG9vbHMv
aW5jbHVkZS9hc20tZ2VuZXJpYy9iaXRzcGVybG9uZy5oCj4KPiBDYXVzZWQgYW4gaXNzdWUgd2l0
aCBidWlsZGluZzoKPiB0b29scy9wZXJmL3V0aWwvY3MtZXRtLmMKPiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS90
b29scy9wZXJmL3V0aWwvY3MtZXRtLmMKPgo+IFRoZSBpc3N1ZSB3YXMgdGhhdCBjcy1ldG0uYyB3
b3VsZCAjaW5jbHVkZSBhIHN5c3RlbSBoZWFkZXIsIHdoaWNoCj4gd291bGQgdHJhbnNpdGl2ZWx5
IGluY2x1ZGUgYSBoZWFkZXIgd2l0aCB0aGUgc2FtZSBoZWFkZXIgZ3VhcmQuIFRoaXMKPiBsZWQg
dG8gdGhlIHRvb2xzL2luY2x1ZGUvYXNtLWdlbmVyaWMvYml0c3BlcmxvbmcuaCBiZWluZyBpZ25v
cmVkIGFuZAo+IHRoZSBjb21waWxhdGlvbiBvZiB0b29scy9wZXJmL3V0aWwvY3MtZXRtLmMgZmFp
bGluZyBkdWUgdG8gYSBtaXNzaW5nCj4gZGVmaW5lLiBNeSBsb2NhbCB3b3JrYXJvdW5kIGlzOgo+
Cj4gYGBgCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvYXNtLWdlbmVyaWMvYml0c3Blcmxv
bmcuaAo+IGIvdG9vbHMvaW5jbHVkZS9hc20tZ2VuZXJpYy9iaXRzcGVybG9uZy5oCj4gaW5kZXgg
MjA5M2Q1NmRkZDExLi44ODUwOGEzNWNiNDUgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvaW5jbHVkZS9h
c20tZ2VuZXJpYy9iaXRzcGVybG9uZy5oCj4gKysrIGIvdG9vbHMvaW5jbHVkZS9hc20tZ2VuZXJp
Yy9iaXRzcGVybG9uZy5oCj4gQEAgLTEsNiArMSw2IEBACj4gLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAgKi8KPiAtI2lmbmRlZiBfX0FTTV9HRU5FUklDX0JJVFNfUEVSX0xPTkcK
PiAtI2RlZmluZSBfX0FTTV9HRU5FUklDX0JJVFNfUEVSX0xPTkcKPiArI2lmbmRlZiBfX0xJTlVY
X1RPT0xTX0FTTV9HRU5FUklDX0JJVFNfUEVSX0xPTkcKPiArI2RlZmluZSBfX0xJTlVYX1RPT0xT
X0FTTV9HRU5FUklDX0JJVFNfUEVSX0xPTkcKPiAjaW5jbHVkZSA8dWFwaS9hc20tZ2VuZXJpYy9i
aXRzcGVybG9uZy5oPgo+IEBAIC0yMSw0ICsyMSw0IEBACj4gI2RlZmluZSBzbWFsbF9jb25zdF9u
Yml0cyhuYml0cykgXAo+IChfX2J1aWx0aW5fY29uc3RhbnRfcChuYml0cykgJiYgKG5iaXRzKSA8
PSBCSVRTX1BFUl9MT05HICYmIChuYml0cykgPiAwKQo+IC0jZW5kaWYgLyogX19BU01fR0VORVJJ
Q19CSVRTX1BFUl9MT05HICovCj4gKyNlbmRpZiAvKiBfX0xJTlVYX1RPT0xTX0FTTV9HRU5FUklD
X0JJVFNfUEVSX0xPTkcgKi8KPiBgYGAKPgo+IEknbSBub3Qgc3VyZSBpZiBhIHdpZGVyIGZpeCBp
cyBuZWNlc3NhcnkgZm9yIHRoaXMsIGJ1dCBJIHRob3VnaHQgaXQKPiB3b3J0aHdoaWxlIHRvIHJl
cG9ydCB0aGF0IHRoZXJlIGFyZSBwb3RlbnRpYWwgaXNzdWVzLiBJIGRvbid0IHRoaW5rIHdlCj4g
Y2FuIHVzZSAjcHJhZ21hIG9uY2UsIGFzIGFuIGFsdGVybmF0aXZlIHRvIGhlYWRlciBndWFyZHMs
IHRvIGF2b2lkCj4gdGhpcyBraW5kIG9mIG5hbWUgY29sbGlzaW9uLgoKVGhhbmtzIGZvciB0aGUg
cmVwb3J0ISBJIHRoaW5rIHRoZSBjb3JyZWN0IGZpeCBpcyB0byB1cGRhdGUKdGhlIHRvb2xzL2lu
Y2x1ZGUvIGhlYWRlcnMgdG8gaGF2ZSB0aGUgc2FtZSBjaGFuZ2UgYXMgdGhlIGtlcm5lbAppdHNl
bGYuIEkgZG9uJ3Qga25vdyB3aHkgd2UgZW5kIHVwIGluY2x1ZGluZyBib3RoLCB0aGF0IHNvdW5k
cwpsaWtlIGEgc2VwYXJhdGUgaXNzdWUgYnV0IHNob3VsZCBub3JtYWxseSBiZSBoYXJtbGVzcyBh
cyBsb25nCmFzIHRoZSBjb250ZW50cyBhcmUgdGhlIHNhbWUuCgogICAgICBBcm5kCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
