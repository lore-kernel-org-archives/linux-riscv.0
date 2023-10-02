Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2123BE7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/pxZ77b2cMYqkHGbwbaPQXend3fypOGGogrdDvnSXw=; b=KRgrhVGQEhGLko
	lwEZ5v8fNpd5znTUUOTvw9sIyhCJXFYFRlkArJA+4lTBXwGF/PwmQRXl1eYds72YY+D6fHVC2RV2I
	umHCKmyHzlIdSfz/DEFv/i1jVYYnbPG1kQm3yOU6CNqvfe02r13fffjLtyfSpPXq/x/zXm2GBmjig
	Y/U+kkGBE4BS4mUQBDnffn7zuhPwYyRoJ/JzUwEz/k3RAh6w3BUSFEI8F/LVbDHKeBsHyeIMlL5D4
	5wt15St9ZA18dpWinHRE/YWc716h0qey0s/jNcffwT+rbeDmqefepjD/YtpvlOTULtMKaPHFK3hMw
	Za0p4u75D7TAv1uX68Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHqL-00Ch3v-0w;
	Mon, 02 Oct 2023 12:16:09 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnHqH-00Ch2q-07
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 12:16:08 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 56F283201213;
	Mon,  2 Oct 2023 08:15:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 02 Oct 2023 08:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1696248951; x=1696335351; bh=N+N+eDyJwbmWM7IQgkOKLUE0MMGHc0rbju4
	i4SQwITA=; b=o1r4Xi4XRpANR4t1+OSUZfhXOPXLnO41r7vbPsDeVb/+vEdcfs3
	zx9fvT7d+ZpTFILgo8Br49VSu2yNjOWgIxiJW0O0mJLm/ZZjDiGVmLptlj3HHluo
	XGm68ltfM2SCPAXIpdnaQISeHqmUVplVIaTRcVbnArlMegzun52FL9S82F6njxMh
	Iq9ANq67K6qxE2UURxTUDFAS+d6xiFxLOKbUMYUGagxumDKUbI9HEOTFnPYbNryA
	qOqvasYQvCjQqhrFMV0ordePTlyfR32JaQm0KO9HVByox2u0UTRBvh+5Q9qoh3Bj
	qySzLUgikjMWIETztxXmiRrSNQyPOqf8eDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696248951; x=1696335351; bh=N+N+eDyJwbmWM7IQgkOKLUE0MMGHc0rbju4
	i4SQwITA=; b=NrBhK+tHsuOJycJmvBrNcCCel/68YdBEklbH/JyGT7hXxWa16xC
	czCJStwi5e8nArlvM/ewzEIKUS4UVAJNVmc4DUBO/dsun5xbgiUcY/gsE8Cy+Pr4
	Lgpnf+Ir5sgwq+BLKeyVMQUg0YtFwQo+NVep3rPvqESpa3NyCt5zreALGqgAKzu4
	eLRPRWDSBa+n3EUfUjqZ/KmoC49DDRjmT/bx1sA8EawdKSbT6cWNowbjWTwdfEW9
	F2GT285uHFbooZ5PC+fEbk/FXEhqgeXCkxwKp3aC/1M40QjOfkSDgTo/N37Fvsj8
	BKh/gyHN1Quz4+/Or/eC09BKTUJLSJTkGZA==
X-ME-Sender: <xms:d7QaZeWFVYs20Nl_qN0f7CdeVrFqdlAO92yZFvTQJPRayR62H2GMWA>
    <xme:d7QaZancx3bwzBHCuBO4YKYURkF8V9woI9322MzBlcmhSa6U8wxWJh833TqNLRWkg
    wuiYxmk35KQfP30wjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdelgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:d7QaZSYihRTIFf6A5I-dGGesd0g8gQggnjw-QoPM-Gou5MrjFvEOWA>
    <xmx:d7QaZVUaSQ3ST3wrq9ie91ubp-XFxCKEB5wHUNeFCo-yBCJBPaq2bQ>
    <xmx:d7QaZYlYaI4USvJRuw5lFz9gvwkb6ByrB0FQBQiRAtmdtJ7dbSdXAA>
    <xmx:d7QaZXuLkkQ0D3Ess4e_3_rHpxdfCUqB16XOlWIE3Hoj9j5gNz4USg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5578EB60089; Mon,  2 Oct 2023 08:15:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <ccf08724-7b70-4a59-950e-eb56bbfe7df0@app.fastmail.com>
In-Reply-To: <CAJF2gTTB3dghWivn6HwL8d8L7w5apU6rjYp_fvut1AeybZVe1w@mail.gmail.com>
References: <20230912072740.2544-1-jszhang@kernel.org>
 <ZQBDFa0fGNiaqAgh@gmail.com>
 <C1EDD7DE-A0A9-4F43-9EC1-1C5A212A7033@jrtc27.com>
 <CAJF2gTTB3dghWivn6HwL8d8L7w5apU6rjYp_fvut1AeybZVe1w@mail.gmail.com>
Date: Mon, 02 Oct 2023 14:15:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>, "Jessica Clarke" <jrtc27@jrtc27.com>
Cc: "Jisheng Zhang" <jszhang@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: errata: thead: use riscv_nonstd_cache_ops for CMO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_051605_108533_8E2B5907 
X-CRM114-Status: GOOD (  21.37  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMsIGF0IDAyOjA2LCBHdW8gUmVuIHdyb3RlOgo+IE9uIFdlZCwg
U2VwIDEzLCAyMDIzIGF0IDM6MDDigK9BTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpydGMyNy5j
b20+IHdyb3RlOgo+Pgo+PiBPbiAxMiBTZXAgMjAyMywgYXQgMTE6NTMsIEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPiB3cm90ZToKPj4gPiBQbGVhc2UgcmVtb3ZlIHRoZSB0aGVhZF9lcnJhdGFf
Y2FjaGVfd2JhY2sgYmVjYXVzZSBULUhFQUQgcHJvY2Vzc29ycwo+PiA+IHdvdWxkIHByaW9yaXRp
emUgdXNpbmcgYW4gaW52YWxpZCBjYWNoZWxpbmUgaW5zdGVhZCBvZiBldmljdGluZyBhbgo+PiA+
IGV4aXN0aW5nIGNhY2hlbGluZS4gV2hlbiB3ZSBkbyBkY2FjaGUgY2xlYW4sIHRoZSBmb2xsb3dp
bmcgb3BlcmF0aW9ucwo+PiA+IGFyZSB0byBsZXQgb3RoZXIgaW50ZXJjb25uZWN0IG1hc3RlcnMg
cmVhZC4gU28sIGtlZXBpbmcgd2JhY2tfaW52IGZvcgo+PiA+IFQtSEVBRCBwcm9jZXNzb3JzIGlz
IHRoZSBiZXN0IGNob2ljZSwgYW5kIG1heWJlIHNvbWUgb3RoZXIgcHJvY2Vzc29ycycKPj4gPiB2
ZW5kb3IgaGFzIGEgZGlmZmVyZW50IGlkZWEsIGJ1dCBwbGVhc2UgdXNlIHRoZSB3YmFja19pbnYg
aW5zdGVhZCBvZgo+PiA+IHdiYWNrX29ubHkgZm9yIHRoZSBULUhFQUQgcHJvY2Vzc29ycy4KPj4K
Pj4gVW5sZXNzIHlvdSBjYW4gZGVtb25zdHJhdGUgdGhhdCB5b3VyIGNvcmVzIGhhdmUgc2lnbmlm
aWNhbnRseSB3b3JzZQo+PiBwZXJmb3JtYW5jZSB3aGVuIHVzaW5nIHdiYWNrIGluc3RlYWQgb2Yg
d2JhY2tfaW52IEkgZG8gbm90IHRoaW5rIHRoZQo+PiBub24tc3RhbmRhcmQgaW1wbGVtZW50YXRp
b24gc2hvdWxkIGRldmlhdGUgZnJvbSB0aGUgc2VtYW50aWNzIG9mIHRoZQo+PiBzdGFuZGFyZCBv
bmUuIFRoZXJlIGFyZSBlZmZvcnRzIHRvIHVuaWZ5IHRoZSBpbXBsZW1lbnRlZCBzZW1hbnRpY3Mg
b2YKPj4gdGhlIG9wZXJhdGlvbnMgYWNyb3NzIGFyY2hpdGVjdHVyZXMgYW5kIHRoaXMgd291bGQg
b2JzdHJ1Y3QgdGhvc2UuCj4KPiBJJ20gYWZyYWlkIEkgaGF2ZSB0byBkaXNhZ3JlZSB3aXRoIHRo
ZSB2aWV3IHRoYXQgdGhpcyBvYnN0cnVjdHMKPiAidW5pZnlpbmcgdGhlIGltcGxlbWVudGVkIHNl
bWFudGljcyBvZiB0aGUgb3BlcmF0aW9ucyBhY3Jvc3MKPiBhcmNoaXRlY3R1cmVzLiIKPgo+IHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmlzY3Zfbm9uc3RkX2NhY2hlX29wcyB0aGVhZF9lcnJhdGFfY21v
X29wcyA9IHsKPiAtICAgICAgIC53YmFjayA9ICZ0aGVhZF9lcnJhdGFfY2FjaGVfd2JhY2ssCj4g
KyAgICAgIC53YmFjayA9ICZ0aGVhZF9lcnJhdGFfY2FjaGVfd2JhY2tfaW52LAo+ICAgICAgICAu
aW52ID0gJnRoZWFkX2VycmF0YV9jYWNoZV9pbnYsCj4gICAgICAgIC53YmFja19pbnYgPSAmdGhl
YWRfZXJyYXRhX2NhY2hlX3diYWNrX2ludiwKPgo+IEkgZG9uJ3Qgc2VlIGhvdyB0aGUgYWJvdmUg
cGF0Y2ggb2JzdHJ1Y3RzIHVuaWZ5aW5nLiBPbiB0aGUgY29udHJhcnksCj4gaXQgZGVjcmVhc2Vz
IHRoZSBjdXN0b20gZnVuY3Rpb24sIHdoaWNoIGNvdWxkIGhlbHAgdW5pZnkuIENvdWxkIHlvdQo+
IGdpdmUgdGhlIGxlYXN0IHJlc3BlY3QgZm9yIHRoZSB2ZW5kb3IncyBjaG9pY2U/CgpTaW5jZSB0
aGUgZW1haWwgdGhyZWFkIHBvcHBlZCB1cCBhZnRlciB0aGUgbGF0ZXN0IHJlcGxpZXMsIEkgc2F3
CnRoYXQgSSBoYWQgbm90IHJlcGxpZWQgeWV0LiBJIGFncmVlIHdpdGggSmVzc2ljYSBoZXJlOiB3
ZSBuZWVkIHRvCmVuc3VyZSB0aGF0IHRoZSBjYWxsYmFjayBmdW5jdGlvbnMgZG8gd2hhdCB0aGUg
aW50ZXJmYWNlIHJlcXVpcmVzLAphY3Jvc3MgYWxsIGFyY2hpdGVjdHVyZXMgYW5kIENQVSBpbXBs
ZW1lbnRhdGlvbnMuIFRoZSBjaG9pY2UgdG8KY2FsbCB3YmFjayBvciB3YmFja19pbnYgaXMgYSBt
YXR0ZXIgb2Ygb3B0aW1pemF0aW9uIGluIHRoZSBjYWxsZXIsCmFuZCB3ZSBtYXkgd2VsbCBlbmQg
dXAgY2FsbGluZyAud2JhY2tfaW52KCkgZm9yIGNhc2VzIHRoYXQgY3VycmVudGx5CnJlbHkgb24g
LHdiYWNrKCksIGlmIHdlIGNhbiBzaG93IHRoaXMgdG8gYmUgZmFzdGVyIG9uIGNlcnRhaW4KQ1BV
cywgYW5kIG90aGVyIGNhc2VzIChlLmcuIHJlcGVhdGVkbHkgd3JpdGluZyBhbmQgZmx1c2hpbmcK
aW5kaXZpZHVhbCBieXRlcyB0byBzaW5nbGUgRE1BIGJ1ZmZlcikgY2xlYXJseSByZWx5IG9uIGtl
ZXBpbmcKdGhlIGNhY2hlIGxpbmUuCgpPdGhlciBwb2xpY3kgcXVlc3Rpb25zIGxpa2Ugd2hldGhl
ciB0byB1c2UgLndiYWNrIG9yIC5pbnYgYmVmb3JlCmEgRE1BIGZyb20gZGV2aWNlIGFsc28gc3Rp
bGwgbmVlZCBhIGJldHRlciBhbnN3ZXIsIHdoaWNoIHdlIG11c3QKZGVjaWRlIGdsb2JhbGx5IHJh
dGhlciB0aGFuIHBlciBDUFUgaW1wbGVtZW50YXRpb24uCgogICAgICBBcm5kCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
