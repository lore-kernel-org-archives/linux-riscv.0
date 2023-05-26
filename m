Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5167C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fau+wjbSiTZ2MD/fY7m8MtbgHA0c4uGMiRH1NWf5IqM=; b=m9n5zKzmV0CI1f
	eQZNCsxxzcW/f5A4yMO5y7Ji5AHh+kKefWl7dCxBputDFSHv/gbU7RKy4DYUe0K5KxthcgAtSzgQa
	XPIM+UtfRJd8/YWeK4a+u786fV6tfWluKHJcg16Ce+2U8cJoxsQ53ooj59H5VNiydL5YrDOfwhdLp
	HYCW7gUX6TWHGcshQZYlfi4qcKNqZUVEZbVoQeiJlYQt/VA2jhFFVXihu30WX0JeCBMICsk3uK6nM
	OonRSoNddfZtzGVZncYUiU/y9LNI06e/ZrcpKhsfZijcerrNRDvx5LX/CrecOXTudlmZGGoAaed+o
	jPubbKwBzB/P/A5W94lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tqs-001pke-1P;
	Fri, 26 May 2023 09:35:14 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Tqp-001pjD-2G
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 09:35:13 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C87AF5C02A7;
	Fri, 26 May 2023 05:35:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 26 May 2023 05:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1685093710; x=1685180110; bh=VQuY/hL2S/RS8GNDFwVDAwplsazM8ODjSL8
	HxOJd4/M=; b=nwK6/l/Qae+SBdLMMpC8B/2CiUB+2CFgiCiftBPiwUx1JwLIBhI
	2Zx1jckJ3DX8WZWAh8rhOwF5ufG1TFkxNHAFtHJBI45m4b2jUp9TMb7GvUmedRq9
	RYRUUkLm2hK5qadBAGJUZf+H/n5tD0HT7/Gdoy5CkK9kguBQlk4IzX7ZwMCed4ZW
	Y9MeJQ/eEpSK+paOQl4XrrN6cdBwrUmsF5OjnEYsGSpHKlvTKO5lbhUYww2u9QY/
	xN7psVe7Vd6wiK6hMpntz85UqmLcHdDxoibcgvnLkC2NanKn9oOnRmeNX8IuPTVq
	6rV6eMoORCWGKxlv5Y6jWDxZMLzMSvgRDRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1685093710; x=1685180110; bh=VQuY/hL2S/RS8GNDFwVDAwplsazM8ODjSL8
	HxOJd4/M=; b=lJ+afdWVNY+5p1btQimqvgioXqVzsADLAjA8v/L0UM8MgNRC2AN
	dUAxU5T3Vu4pR4tVzWC4JGhjPF2D6vYIEoxnXoVwnFfm0WV/QftbQfD7oXIklg4S
	cPMu2dgkiriEq3qQXTmvoaC09McuCpVmZ7plxdbonHSXcxQa5oo+2L5koof/Tbqv
	/TK8yMfBCdo/eMpK3CFCSyFeCGfH7IHTvnDvSYVUEmuGhQREhV9gGOuD7m5kkwRz
	OPhq0FKBj5lfzfUH+5z8Y6vzwbvsS26Zr2BGb6tUhMY9DfZlkxSf73BfIH7kVQiI
	VVCQeSEELgJwFKJzd3BgIadGNQFX9s13lSA==
X-ME-Sender: <xms:Tn1wZNQohCUUl8CF-T0qRkqy04FPKUkOhFAa8x8RgUF6MRwUeQ4o9g>
    <xme:Tn1wZGz2WXl0mSB-m5swPxBsFljQznixhkVm4uuBd3EA7hH9nPdiV6FBkRdH_YiBr
    b8gFqhQfRSU3cwQ5PY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Tn1wZC1Mo0kZBNMUjJu8vENwbYYhuFdwHZ1vpnuyIrZTc713OsV8Tw>
    <xmx:Tn1wZFBJV5WggaFPQbzroudAjMF_leGrvSHEZ1BhC9v8zxgeaFOKKA>
    <xmx:Tn1wZGjbCzTt76jRHsb6khFLbw-6tccF6S4G6ux-GmdML5EcrmedvQ>
    <xmx:Tn1wZIZ5XQSy09vmRDbepF54mJ8VLE1u-1JT6mPmPPydzVV7zB7Atg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 89C20B60086; Fri, 26 May 2023 05:35:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-441-ga3ab13cd6d-fm-20230517.001-ga3ab13cd
Mime-Version: 1.0
Message-Id: <83ab9f47-e1ed-463c-a717-26aad6bf2b71@app.fastmail.com>
In-Reply-To: <78d91061-1bcd-4031-89e1-706c3f49d762@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <ec5af2ae25264eddce4b50380bfd24f9490eca75.1684949268.git.falcon@tinylab.org>
 <78d91061-1bcd-4031-89e1-706c3f49d762@t-8ch.de>
Date: Fri, 26 May 2023 11:34:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Zhangjin Wu" <falcon@tinylab.org>
Cc: "Willy Tarreau" <w@1wt.eu>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>
Subject: Re: [PATCH 09/13] tools/nolibc: sys_poll: riscv: use __NR_ppoll_time64 for
 rv32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023511_805165_05FD93DC 
X-CRM114-Status: GOOD (  14.12  )
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

T24gRnJpLCBNYXkgMjYsIDIwMjMsIGF0IDA5OjE1LCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToK
PiBPbiAyMDIzLTA1LTI1IDAxOjU3OjI0KzA4MDAsIFpoYW5namluIFd1IHdyb3RlOgo+PiBydjMy
IHVzZXMgdGhlIGdlbmVyaWMgaW5jbHVkZS91YXBpL2FzbS1nZW5lcmljL3VuaXN0ZC5oIGFuZCBp
dCBoYXMgbm8KCj4+ICAKPj4gKy8qIG5lZWRlZCBieSB0aW1lNjQgc3lzY2FsbHMgKi8KPj4gK3N0
cnVjdCB0aW1lc3BlYzY0IHsKPj4gKwl0aW1lNjRfdAl0dl9zZWM7CQkvKiBzZWNvbmRzICovCj4+
ICsJbG9uZwkJdHZfbnNlYzsJLyogbmFub3NlY29uZHMgKi8KPj4gK307Cj4KPiBBIHF1ZXN0aW9u
IHRvIHlvdSBhbmQgV2lsbHksIGFzIGl0J3MgYWxzbyBkb25lIHRoZSBzYW1lIGZvciBvdGhlciB0
eXBlczoKPgo+IFdoYXQgaXMgdGhlIGFkdmFudGFnZSBvZiBjdXN0b20gZGVmaW5pdGlvbnMgb3Zl
ciB1c2luZyB0aGUgb25lIGZyb20gdGhlCj4ga2VybmVsIChtYXliZSB2aWEgYSB0eXBlZGVmKS4K
Pgo+IEZyb20gbGludXgvdGltZV90eXBlcy5oOgo+Cj4gc3RydWN0IF9fa2VybmVsX3RpbWVzcGVj
IHsKPiAJX19rZXJuZWxfdGltZTY0X3QgdHZfc2V0Owo+IAlsb25nIGxvbmcgdHZfbnNlYzsKPiB9
OwoKSSBhZ3JlZSB0aGUgX19rZXJuZWxfKiB0eXBlcyBhcmUgd2hhdCB3ZSBzaG91bGQgYmUgdXNp
bmcgd2hlbgppbnRlcmFjdGluZyB3aXRoIHN5c3RlbSBjYWxscyBkaXJlY3RseSwgdGhhdCBpcyBk
ZWZpbml0ZWx5IHdoYXQKdGhleSBhcmUgaW50ZW5kZWQgZm9yLgoKSSB3b3VsZCBnbyBmdXJ0aGVy
IGhlcmUgYW5kIGNvbXBsZXRlbHkgZHJvcCBzdXBwb3J0IGZvciAzMi1iaXQKdGltZV90L29mZl90
IGFuZCBkZXJpdmVkIHR5cGVzIGluIG5vbGliYy4gVW5mb3J0dW5hdGVseSwgdGhlCmtlcm5lbCdz
IGluY2x1ZGUvdWFwaS9saW51eC90aW1lLmggaGVhZGVyIHN0aWxsIGRlZmluZXMgdGhlCm9sZCB0
eXBlcywgdGhpcyBpcyBvbmUgb2YgdGhlIGxhc3QgcmVtbmFudHMgdGhlIHRpbWUzMiBzeXNjYWxs
cwpkZWZpbml0aW9ucyBpbiB0aGUga2VybmVsIGhlYWRlcnMsIGFuZCB0aGlzIGFscmVhZHkgY29u
ZmxpY3RzCndpdGggdGhlIGdsaWJjIGFuZCBtdXNsIGRlZmluaXRpb25zLCBzbyBhbnl0aGluZyB0
aGF0IGluY2x1ZGVzCnRoaXMgaGVhZGVyIGlzIGJyb2tlbiBvbiByZWFsIHN5c3RlbXMuIEkgdGhp
bmsgaXQgbWFrZXMgbW9zdApzZW5zZSBmb3Igbm9saWJjIHRvIGp1c3QgdXNlIHRoZSBsaW51eC90
aW1lX3R5cGVzLmggaGVhZGVyCmluc3RlYWQgYW5kIHVzZSBzb21ldGhpbmcgbGlrZQoKI2RlZmlu
ZSB0aW1lc3BlYyAgIF9fa2VybmVsX3RpbWVzcGVjCiNkZWZpbmUgaXRpbWVyc3BlYyBfX2tlcm5l
bF9pdGltZXJzcGVjCnR5cGVkZWYgX19rZXJuZWxfdGltZTY0X3QgdGltZV90OwovKiB0aW1ldmFs
IGlzIG9ubHkgcHJvdmlkZWQgZm9yIHVzZXJzLCBub3QgY29tcGF0aWJsZSB3aXRoIHN5c2NhbGxz
ICovCnN0cnVjdCB0aW1ldmFsIHsgX19rZXJuZWxfdGltZTY0X3QgdHZfc2VjOyBfX3M2NCB0dl9u
c2VjOyB9OwoKc28gd2UgY2FuIGRyb3AgYWxsIHRoZSBmYWxsYmFja3MgZm9yIG9sZCAzMi1iaXQg
dGFyZ2V0cy4gVGhpcwphbHNvIGFsbG93cyBydW5uaW5nIHdpdGggQ09ORklHX0NPTVBBVF8zMkJJ
VF9USU1FIGRpc2FibGVkLgoKICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
