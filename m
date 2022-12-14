Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA61C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 23:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arJYUBr5hEn6ZJnKTqn4oO1s9EPrbv7jPVwF6CUeX1Y=; b=jcnNiQt0MPL876
	D+3YNXe533otmM/SzMW24qNSBjKwJoWltvAaksXf0XwjHb9MRXJIT7EA1o/qzAxe0n0YRBA87RBjZ
	8aVNX8/VcmMVCe4x7HC6sqLceNRuCYLplKmewcgHjW2mT5o60UJT/y2G2bHltxRflda7kZOEfQrje
	9ZpsP60lhrokXSzGYykG6phc52A3h4koENeI44B1noggy24IMn/lhekpWBc235FLj2JfDcS0nmrJX
	0LvN63TcxQe3Yoq7JakqxtbRmL1Dfw/caF7dMVk808bUBVQPjNdRllY+NPj+cqC+swbYy+FdfpPsj
	bOk0vSd8uBkOLMjBkqIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5awe-0049z6-Qn; Wed, 14 Dec 2022 23:13:48 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5awb-0049qp-JJ
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 23:13:47 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id 2F7FC2B0675A;
	Wed, 14 Dec 2022 18:13:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 14 Dec 2022 18:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1671059616; x=
	1671066816; bh=GamDUxMfCcxUhpw7AJnuCcnm9cZ/4hV0cyPV3Md0rdQ=; b=D
	5HW2HwbhF70EXIzRaNwQhsmDXW1XvCWr7SLS7G5dSBF4xTd1jdTm1aLm6+RM4pSi
	zB2p2CQbX+lo5gnojfEznFFZIX7Lj0LizK+r2FedUj9A4IJJJa6LuK0AQdDlo3Zc
	PhGbpYN75y0IgzC4QpzueM5OhbfRVJICczND3mbKDspVuQ8NpSQzLe2vRC/MZjIc
	Y2bkZrRBKvvlBeWj4zTAun5ajZitlKAl1IhIp+BxRTSB1hO3aVrE/GJq8OJmllQN
	d2zTnFgHfGK7DJQS+5FymdTcHDg2+w0QXtMTNfHtNy7oCIs3G4f7hSL/1wpAhEnk
	DsKkdtBFaINSHODmlUAzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1671059616; x=1671066816; bh=G
	amDUxMfCcxUhpw7AJnuCcnm9cZ/4hV0cyPV3Md0rdQ=; b=q01ffg9i5eRCbyUoK
	y30YdEGAwazfSImLyyV8laZbCVSQ6MJSLoLW4qW0fDRXOgstIUg8QAojBX9g5B1J
	+eCkdQv58fSQJ+owTuzYcc57/DVFoztk0wxhf853TUGFnkiR8x0HmnfDHV1bF0u/
	QaCfGUuxxKas1JNnI0zG2bpXyfAbPejq5DsyTrwf1npnDzLxHkgYppgXe4E+H8GI
	CeRUh+FiBzlQXuGP02EVvO9ko+Elc3ExiUMRAReyIMMWv+okmXTxEDJncxQaGB88
	D1ap4r2YvTWDPiCw8+AHrFFTNxUXEFMVKCcEDpUnBovWesBK/BIpu2Q08SvNc9yZ
	i4qCw==
X-ME-Sender: <xms:oFiaYxYtcgXY-Awf5MlEZVOJHNWsjRlt2AEB7b9jR4WwUi-IqbZFPQ>
    <xme:oFiaY4YSXdIUuiBngoF7sCzduZqxb9XX14b5Du6Z_4yDp3SGDydbqAv6dCPhVy8Db
    Pv7gh17EqBe5IMG3Q>
X-ME-Received: <xmr:oFiaYz-fLW9rOmLB15zwME8Gc0X3UFjS3p-Zd71QQsbOByLPP1IJJQe4xsw3mKL_Nj_yREhxEH7O4Xqln8_WryKJRY3RAAIcUb3sTYniszi7x2Nr_ZA4bEbh1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvfhfhufgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpeeltedutddukeffkeelfefffeeujeeludfgfeffffefteevuedtudet
    vdefgeetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:oFiaY_rTdggPjuNnSTpw3QOisERiPJLF5vYP5e0tLHaYyvEb4hj4Zg>
    <xmx:oFiaY8qhxs8z-nafcqtRtM89vWj9duhniHKOqk57BsDmJqh_B0pMHQ>
    <xmx:oFiaY1T7DMCHLvHbVAFjwY-RSomc0Ob8066cKiW1ly6ZTQ2HN_l21w>
    <xmx:oFiaY_cqmD4ZU583KzK-15AAprUEiOLTAnt7rRobw1fXhe5vg4MVdEEFk00>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Dec 2022 18:13:35 -0500 (EST)
Message-ID: <5fbdfe75-bd68-007b-1b64-37334a10a8d1@sholland.org>
Date: Wed, 14 Dec 2022 17:13:34 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Vineet Gupta <vineetg@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 fweimer@redhat.com, Andrew Waterman <andrew@sifive.com>,
 stillson@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
 anup@brainfault.org, atishp@atishpatra.org, guoren@kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
 vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 bjorn@kernel.org, libc-alpha@sourceware.org, christoph.muellner@vrull.eu,
 Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
 <Y5irn63DQkwumfvW@bruce.bluespec.com>
 <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
In-Reply-To: <8fe9cfaf-2cbc-8de6-3928-067de9113bfc@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_151346_035890_BA11F318 
X-CRM114-Status: GOOD (  25.41  )
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

T24gMTIvMTQvMjIgMTQ6MDcsIFZpbmVldCBHdXB0YSB3cm90ZToKPiBPbiAxMi8xMy8yMiAwODo0
MywgRGFyaXVzIFJhZCB3cm90ZToKPj4gT24gRnJpLCBEZWMgMDksIDIwMjIgYXQgMTE6NDI6MTlB
TSAtMDgwMCwgVmluZWV0IEd1cHRhIHdyb3RlOgo+Pj4gSWYgdGhhdCBpcyBmYWlsaW5nLAo+Pj4g
dGhlIHN5c3RlbSBpcyBub3QgZG9pbmcgd2VsbCBhbnl3YXlzLiBCZXNpZGVzIGl0IGlzIG5vdCBh
biBpc3N1ZSBhdCBhbGwKPj4+IHNpbmNlIEVOT01FTSBpbiBjbG9uZS9leGVjdmUgZm9yIHRoZSBh
ZGRpdGlvbmFsIHNwYWNlIHNob3VsZCBoYW5kbGUgdGhlCj4+PiBmYWlsdXJlIGFueXdheXMuIE9u
bHkgdmVyeSBzb3BoaXN0aWNhdGVkIGFwcHMgd291bGQgZG93bmdyYWRlIGZyb20KPj4+IGV4ZWN1
dGluZwo+Pj4gViB0byBTY2FsYXIgY29kZSBpZiB0aGUgcHJjdGwgZmFpbGVkLgo+PiBUaGlzIHNl
ZW1zIHVubGlrZWx5LsKgIEFzIHZlY3RvciBzdXBwb3J0IGRvZXMgbm90IGV4aXN0IGluIGFueSBw
cmVzZW50Cj4+IGhhcmR3YXJlLCBhbmQgdGhlIHZlY3RvciBleHRlbnNpb24gaXMgb25seSBvcHRp
b25hbCBpbiB0aGUgUklTQy1WCj4+IHByb2ZpbGVzCj4+IHRoYXQgaW5jbHVkZSBpdCwgSSB3b3Vs
ZCB0aGluayB0aGF0IGl0IGlzIGFsbW9zdCBjZXJ0YWluIHRoYXQgYW55Cj4+IGFwcGxpY2F0aW9u
IHRoYXQgc3VwcG9ydHMgViB3b3VsZCBoYXZlIGEgZmFsbGJhY2sgcGF0aCBmb3Igd2hlbiB0aGUg
Vgo+PiBleHRlbnNpb24gaXMgbm90IGF2YWlsYWJsZS4KPiAKPiBGb3Igc3BlY2lhbGl6ZWQgY2Fz
ZXMgc3VyZSB3ZSB3b3VsZCBleHBlY3QgZmF0IGJpbmFyaWVzIHdpdGggSUZVTkMgYmFzZWQKPiBk
aXNwYXRjaGVzIChnbGliYyBtZW0qL3N0ciogYXJlIG9idmlvdXMgZXhhbXBsZXMpLiBCdXQgd2l0
aCBuZXdlcgo+IGNvbXBpbGVycyBhdXRvdmVjIGlzIGluY3JlYXNpbmcgYmVjb21pbmcgZGVmYXVs
dCBldmVuIGF0IG1lZGl1bQo+IG9wdGltaXphdGlvbiBsZXZlbHMgc3VjaCBhcyAtTzIuIFNvIFYg
Y29kZSBsaXR0ZXJlZCBhbGwgb3ZlciBpcyBqdXN0IGEKPiBtYXR0ZXIgb2YgdGltZSBmb3IgdGhl
IHByb2ZpbGVzL3ZhcmlhbnRzIHdoaWNoIGFsbG93IFYuIEZvciBsZXNzIGNhcGFibGUKCkF1dG92
ZWN0b3JpemF0aW9uIGlzIG9ubHkgcG9zc2libGUgd2hlcmUgdGhlIHByb2ZpbGUgKnJlcXVpcmVz
KiBWLiBBbmQKbm8gZXhpc3RpbmcgcHJvZmlsZSBkb2VzIHRoYXQuCgo+IHN5c3RlbXMgdy9vIFYg
dGhpcyBpcyBhbGwgYnV0IG1vb3QgZGlzY3Vzc2lvbiBzaW5jZSBrZXJuZWwgaXRzZWxmIG5lZWQK
PiBub3QgYmUgYnVpbHQgd2l0aCBWIGVuYWJsZWQuCgpEaXN0cm8ga2VybmVscyB3aWxsIGJlIGJ1
aWx0IHdpdGggViBlbmFibGVkLCBhbmQgd2lsbCBzcGVuZCBtb3N0IG9mCnRoZWlyIHRpbWUgcnVu
bmluZyBvbiBzeXN0ZW1zIHdpdGhvdXQgVi4KCj4+IEFub3RoZXIgbW90aXZhdGlvbiBmb3IgcmVx
dWlyaW5nIHRoYXQgdXNlciBzcGFjZSByZXF1ZXN0IHVzZSBvZiB0aGUKPj4gdmVjdG9yCj4+IGV4
dGVuc2lvbiBpcyB0aGF0IHRoZSB2ZWN0b3IgdW5pdCBtYXkgYmUgc2hhcmVkIGJldHdlZW4gbXVs
dGlwbGUgaGFydHMKPj4gYW5kL29yIGhhdmUgcG93ZXIgb3IgcGVyZm9ybWFuY2UgaW1wbGljYXRp
b25zIGluIHRoZSBzeXN0ZW0uwqAgQnkKPj4gcmVxdWlyaW5nCj4+IHRoYXQgdXNlciBzcGFjZSBy
ZXF1ZXN0IGFjY2VzcywgaXQgYWxsb3dzIHRoZSBzeXN0ZW0gdG8gZGVjbGluZSB0aGF0Cj4+IGFj
Y2VzcywgYW5kIHVzZXIgc3BhY2UgY2FuIGhhbmRsZSB0aGlzIGdyYWNlZnVsbHkuCj4gCj4gQnV0
IGluIHRoaXMgc3BlY2lmaWMgZXhhbXBsZSB3b24ndCB0aGUgcHJjdGwgY2F1c2UgbW9yZSBwYWlu
LiBTbyAyCj4gY29uY3VycmVudCBwcm9jZXNzZXMgb24gMiBkaWZmZXJlbnQgaGFydHMgd2l0aCBz
aGFyZWQgViB1bml0LiBPbmUgc2VuZHMKPiBwcmN0bCB0byBlbmFibGUgYW5kIG90aGVyIHdhbnRz
IHRvIGRpc2FibGUsIHdoYXQgd291bGQgdGhlIGtlcm5lbCBkby4KPiBXaWxsIGl0IGp1c3QgYmUg
d2hvZXZlciBlbmRzIHVwIHJ1bm5pbmcgbGF0ZXIgd2lucy4gR3JhbnRlZCBJJ20gbm90IHRvbwo+
IGZhbWlsaWFyIHdpdGggaG93IHN1Y2ggYSBjcm9zcy1oYXJ0IHNoYXJpbmcgd291bGQgd29yayBp
biBhIFZlY3Rvcgo+IGluc3RydWN0aW9ucyBiZWluZyBwYXJ0IG9mIElTQcKgICh2cy4gVmVjdG9y
IGFjY2VsZXJhdG9yIHdpdGggam9iCj4gcHVzaC9wdWxsIGFwcHJvYWNoKQoKVGhlIHZlY3RvciBl
eGVjdXRpb24gdW5pdCBjYW4gYmUgc2hhcmVkIGJldHdlZW4gaGFydHMsIG5vdCB0aGUgdmVjdG9y
CnN0YXRlLiBUaGluayBTTVQuCgo+IEhvbmVzdGx5IEknbSBzeW1wYXRoZXRpYyB0byB5b3VyIHBv
d2VyIGNvbmNlcm5zIHdpdGgga2VlcGluZyBWIGVuYWJsZWQKPiBhbGwgdGhlIHRpbWUuIEJ1dCB0
aGUgbWVjaGFuaWNzIG9mIGltcGxlbWVudGluZyB0aGlzIHByY3RsIG1ha2VzIG1lCj4gd2FyeS4g
QXNzdW1pbmcgdGhpcyBpcyBkb25lIGZyb20gZHluYW1pYyBsb2FkZXIsIGl0IGltcGxpZXMgbG9h
ZGVyCj4gaXRzZWxmIG5lZWRzIHRvIGJlIGJ1aWx0IHdpdGggViBkaXNhYmxlZC4gVGhpcyBhbHNv
IGxlYXZlcyBidW5jaCBvZiBwZXJmCj4gb24gdGFibGUgc2luY2UgbG9hZGVyIGRvZXMgdG9ucyBv
ZiBvZiBzdHJpbmcgYW5kIG1lbW9yeSBvcGVyYXRpb25zIHdoaWNoCj4gY291bGQgcG90ZW50aWFs
bHkgYmVuZWZpdCBmcm9tIFYgZW5hYmxlZCBjb2RlLCBncmFudGVkIGl0IGlzIG5vdCBkZWFsCj4g
YnJlYWtlci4KClRoZSBkeW5hbWljIGxvYWRlciBjYW4gZG8gZHluYW1pYyBkaXNwYXRjaCBiYXNl
ZCBvbiB0aGUgcmVzdWx0IG9mIHRoZQpwcmN0bCgpIGp1c3QgYXMgd2VsbCBhcyBhbnkgb3RoZXIg
bGlicmFyeS4KCkFuZCB0aGUgZGlzdHJvJ3MgZHluYW1pYyBsb2FkZXIgY2FuJ3QgYmUgY29tcGls
ZWQgd2l0aCBhdXRvdmVjdG9yaXphdGlvbgplbmFibGVkIGFueXdheSwgYmVjYXVzZSBhZ2FpbiB0
aGUgcHJvZmlsZXMgc3VwcG9ydCBwcm9jZXNzb3JzIHdpdGhvdXQgVi4KCj4+IElmIHdlIGFkZCBh
IG1lY2hhbmlzbSBmb3IgdXNlciBzcGFjZSB0byByZXF1ZXN0IGFjY2VzcyB0byB0aGUgdmVjdG9y
Cj4+IGV4dGVuc2lvbiwgYW5kIGl0IHR1cm5zIG91dCB0aGF0IGl0IHdhcyB1bm5lY2Vzc2FyeSwg
dGhlIHdvcnN0IHRoYXQgaGFzCj4+IGhhcHBlbmVkIGlzIGEgc2xpZ2h0IGluY29udmVuaWVuY2Uu
Cj4+Cj4+IElmIHdlIGRvIG5vdCBhZGQgc3VjaCBhIG1lY2hhbmlzbSwgYW5kIGxhdGVyIGRldGVy
bWluZSB0aGF0IGl0IGlzCj4+IG5lY2Vzc2FyeSwgd2UgaGF2ZSBhIG11Y2ggZ3JlYXRlciBwcm9i
bGVtLsKgIFRoZXJlIHdvdWxkIGJlIGJhY2t3YXJkCj4+IGNvbXBhdGliaWxpdHkgaXNzdWVzIHdp
dGggdGhlIEFCSSwgYW5kIHN1Y2ggYSBtZWNoYW5pc20gY291bGQgcHJvYmFibHkKPj4gbm90Cj4+
IGJlIGZ1bGx5IGltcGxlbWVudGVkIGF0IGFsbCBkdWUgdG8gdGhlIGRlc2lyZSB0byBzdXBwb3J0
IHBvdGVudGlhbCBmdXR1cmUKPj4gbGVnYWN5IHZlY3RvciBjb2RlLgo+IAo+IFZlcnkgdHJ1ZSwg
YnV0IHRoaXMgaW4gaXRzZWxmIGlzIG5vdCBzdWZmaWNpZW50IG9mIGEgcmVhc29uIHRvIHdhcnJh
bnQKPiBhZGRpbmcgaXQgbm93LgoKSXQgaXMsIGJlY2F1c2UgY2hhbmdpbmcgdGhlIHNpZ2NvbnRl
eHQgbGF5b3V0IHdpdGhvdXQgYW4gb3B0LWluIGlzCmFscmVhZHkgYW4gQUJJIGJyZWFrIChpdCBj
b21wbGV0ZWx5IGJsb3dzIHBhc3QgTUlOU0lHU1RLU1opLgoKUmVnYXJkcywKU2FtdWVsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
