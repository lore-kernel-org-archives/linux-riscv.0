Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E632C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=INHja1Bk+XBkC7AMVVBB2CvPMfAXnf/nSQDrQmOgs0k=; b=N2dyK2CaLLzxBbsxS5dAe2ivsN
	+s81lZdJWGCmgeGCtYkfjf2SpC9f3sZSQ2OMnP1e8upXws/HofHIYoHFLkbdE3CD9Ql/Gph257b9F
	gdvZc384PU7NSUk20oMwHCxvCTzOYOyquBYB1ZsjTKnEd458GoSN5tav0ykZO4ckawC9P4cIqI5co
	S3lzPJKiyUZqpT5OXYwimatETYL9SE0vDY34hyU9z41itDIiyKmt+RrKkVgBL7k2ympNLBgWg40fW
	I/R+1/MT1o7qPQvYygUF+Dv2GaP4bWZeKKBLeqAQsJEo0lMpzPnBNTbkueDkhv8iCKgwzFv8GMTyV
	AdYCAqfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuip-00000004nxs-0SHk;
	Tue, 11 Feb 2025 18:10:59 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtDb-00000004XIi-0eS2;
	Tue, 11 Feb 2025 16:34:41 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C575625401A7;
	Tue, 11 Feb 2025 11:34:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 11:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739291676;
	 x=1739378076; bh=d5BwCvTiZ3qrlhVBFg5q2tte+PfUCaSlYpVNs8m646o=; b=
	2PNp0TpuncwFONiMcbpBK4M/zx0SSDekA/9pIC+cjylGukqoFIvRToiF7G+9hSeO
	Lrxtcb86BxSUbi5oxHvNGr4iFRiDSdSjGtmYOH7yPcbh+MSfREawz3FHqeJACFeH
	DOuBzwlIdP9e02fs2fikxkTU7+Tn21U9jmW3uG3VOlOCaK0+kC4uk7DADQLeqyXK
	Q7yw7nTgDYcXC8kGRSenmRfJ2MMKKKaEo5Zpd6KyTQ4nkVsfL9IObL20RumozGqu
	G2reGtG+5sHI/ldhJX+1bwKKBtOTrNPxha7IX0l3TqZCcxy9OKKYCbJOvK19G08k
	lGRRPWeLHjl1sNT+Ep4BJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739291676; x=
	1739378076; bh=d5BwCvTiZ3qrlhVBFg5q2tte+PfUCaSlYpVNs8m646o=; b=V
	Ozk7pPVP0h+2AgFpeLiu+lol0wO2ZOwZbLVqtS4KGk4Sv3t85E1mudIpDOEbXfQL
	kksCP0l0S7lLL12pN0nc08TxkUTAySh0HNLuXoaM/UMgiP5+1SjVWJ6zxcso6xgB
	DXx1A/PvuTqX0pHNffJwi/lYiwtgsvho07LVmJP0hGlnr8Pdg7om3k7lSU9KMbuQ
	JvHx3r1SIE6xCTyKz5ryBzOALXnitWKk9i72BizUxDkREmwuaT74owWu8j/1K9/2
	n/4maTuzyGNFP7eNX23yp21uiE2+6b9EhXmLH993y4ogPLwJ7mcqid0u5CPdydya
	kuSBAth4Bxik9i6KGDWig==
X-ME-Sender: <xms:G3yrZ0_1Q0FaY3Ee8S-xqosqwKaUdnqIkyLkedkcu-bNFNAb450W4Q>
    <xme:G3yrZ8uIHsfjJoL1mqa3ii6htsHiHG3Axxyp7vKd-WjvSr8OeI2pKDxvAJK8qv5QG
    umammks5eod-_0DqTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeef
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdr
    tghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtth
    hopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohephhhofigr
    rhgutghhuhelheesghhmrghilhdrtghomhdprhgtphhtthhopehirhhoghgvrhhssehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopegrughrihgrnhdrhhhunhhtvghrsehinhhtvghlrdgtohhmpdhrtg
    hpthhtoheprggtmhgvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:G3yrZ6D4alMOE8a4n5nNd47ja1Afft99h3C7U7t0sfArp3SwKp8zTQ>
    <xmx:G3yrZ0cIT9itAmmwv_nJYSaHkR9KXCJ7zp3EYddpHtGBzpLB3Uaj8Q>
    <xmx:G3yrZ5MUzop_mWBRb-SdG5t8q4ll4twTv6rZSd5xaHfEvJ5mHsow_A>
    <xmx:G3yrZ-lwpTINmJhziLmwbMkAZW-tz6V43rSWnjoB0CzV9r-nE8xyMA>
    <xmx:HHyrZxaR4B9VF91_YcucqNeu4wHHckuYASiugAG400-WBcAbej798u8y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3A14C2220072; Tue, 11 Feb 2025 11:34:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:34:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Kan Liang" <kan.liang@linux.intel.com>,
 "John Garry" <john.g.garry@oracle.com>, "Will Deacon" <will@kernel.org>,
 "James Clark" <james.clark@linaro.org>,
 "Mike Leach" <mike.leach@linaro.org>, "Leo Yan" <leo.yan@linux.dev>,
 guoren <guoren@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Bibo Mao" <maobibo@loongson.cn>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Howard Chu" <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Message-Id: <8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com>
In-Reply-To: <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-4-irogers@google.com>
 <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com>
 <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] perf syscalltbl: Remove struct syscalltbl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_083439_696984_B46474AF 
X-CRM114-Status: GOOD (  13.94  )
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

T24gVHVlLCBGZWIgMTEsIDIwMjUsIGF0IDE3OjE4LCBJYW4gUm9nZXJzIHdyb3RlOgo+IE9uIE1v
biwgRmViIDEwLCAyMDI1IGF0IDExOjQ44oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4gd3JvdGU6Cgo+PiBUaGUgc3lzY2FsbCBudW1iZXJzIG9uIG1pcHMgKGFuZCBwcmV2aW91c2x5
IG9uIGlhNjQpIGFyZSBvZmZzZXQgYnkKPj4gYSBsYXJnZSBudW1iZXIgZGVwZW5kaW5nIG9uIHRo
ZSBBQkkgKG8zMi9uMzIvbjY0KS4gSSBhc3N1bWUgd2hhdAo+PiB3ZSB3YW50IGhlcmUgaXMgdG8g
aGF2ZSB0aGUgc21hbGwgbnVtYmVycyB3aXRob3V0IHRoZSBvZmZzZXQgaW4KPj4gc3lzY2FsbF9u
dW1fdG9fbmFtZVtdLCBidXQgdGhhdCByZXF1aXJlcyBhZGRpbmcgdGhlIG9mZnNldCBkdXJpbmcK
Pj4gdGhlIGxvb2t1cC4gQ2FuIHlvdSBjaGVjayBpZiB0aGlzIGlzIGhhbmRsZWQgY29ycmVjdGx5
Pwo+Cj4gVGhhbmtzIEFybmQhIEkgYWdyZWUgdGhlIHRhYmxlcyBhcmUgbGFyZ2UgYW5kIGNhbiBi
ZSBzcGFyc2UsIHRoZXknbGwKPiBhbHNvIGJlIGZ1bGwgb2YgcmVsb2NhdGlvbnMuIE1JUFMgZG9l
c24ndCBsb29rIGxpa2UgYW4gb3V0bGllciB0byBtZQo+IGhlcmU6CgpTb3JyeSwgSSBzaG91bGQg
aGF2ZSBiZWVuIGNsZWFyZXIgd2hhdCBJIG1lYW50LCBzZWUKYXJjaC9taXBzL2luY2x1ZGUvdWFw
aS9hc20vdW5pc3RkLmg6CgojaWYgX01JUFNfU0lNID09IF9NSVBTX1NJTV9OQUJJMzIKI2RlZmlu
ZSBfX05SX0xpbnV4ICAgICAgNjAwMAojaW5jbHVkZSA8YXNtL3VuaXN0ZF9uMzIuaD4KI2VuZGlm
CgphbmQKYXJjaC9taXBzL2luY2x1ZGUvZ2VuZXJhdGVkL3VhcGkvYXNtL3VuaXN0ZF9uMzIuaAoK
I2RlZmluZSBfX05SX3JlYWQgKF9fTlJfTGludXggKyAwKQojZGVmaW5lIF9fTlJfd3JpdGUgKF9f
TlJfTGludXggKyAxKQojZGVmaW5lIF9fTlJfb3BlbiAoX19OUl9MaW51eCArIDIpCgpUaGVzZSBv
ZmZzZXRzIGFyZSA0MDAwLzUwMDAvNjAwMCByZXNwZWN0aXZlbHkuCgo+IGBgYAo+ICNpZiBkZWZp
bmVkKEFMTF9TWVNDQUxMVEJMKSB8fCBkZWZpbmVkKF9fbWlwc19fKQo+IHN0YXRpYyBjb25zdCBj
aGFyICpjb25zdCBzeXNjYWxsX251bV90b19uYW1lX0VNX01JUFNbXSA9IHsKPiAgICAgICAgWzBd
ID0gInJlYWQiLAo+ICAgICAgICBbMV0gPSAid3JpdGUiLAo+ICAgICAgICBbMl0gPSAib3BlbiIs
Cj4gLi4uCj4gICAgICAgICBbNDY1XSA9ICJsaXN0eGF0dHJhdCIsCj4gICAgICAgICBbNDY2XSA9
ICJyZW1vdmV4YXR0cmF0IiwKPiB9OwoKVGhpcyBtZWFucyB0aGUgYXJyYXkgaXMgbm90IHNwYXJz
ZSwgYnV0IHRoZSBudW1iZXJzCmhlcmUgZG8gbm90IG1hdGNoIHRoZSBzeXNjYWxsIG51bWJlciBh
cmd1bWVudCByZWdpc3Rlci4KClRoZSBxdWVzdGlvbiBpcyB3aGV0aGVyIHRyYWNpbmcgb24gbWlw
cyBhZGRzIHRoZSBzYW1lCnBlci1BQkkgb2Zmc2V0IGFnYWluLCBvciBpZiBpdCB0cmllcyBhbmQg
ZmFpbHMgdG8gbG9vawp1cCBpbmRleCA2MDAyIGZvciAnb3BlbicuCgogICAgICAgQXJuZAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
