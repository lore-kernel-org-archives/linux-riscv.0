Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D56EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhnzmIKvUOirvBt0y9TSlp3RQpZDIPUloY143iT4uGk=; b=kBT5cckNp03EdC
	pA/jlHEBznUKi3JO/ywfNXSBKbS40LRYBfBxdq/skf8D0eMGIB3L3TwaCucYT/3685s/oRDKdV7Im
	t+RP5z93TAnF+Pdxj6XkFREWF14KGyvqgtJaVVfx/pAFDKmAWFFgcmWh9DyFazgjiizSC+Q7gbiIb
	MoYyxNOUatchjPOF3JoNgt9wG/mmIQGparFeCn4DcazD/KEDju0udjdr9AUY4AbEcARmgqA9RWjyT
	sTh1dPlPUwO2msT5Ymrbrb5C0Dt21fgWEPGR6ok4BOD7DG3M+fk0MW+X5P87k1yy5kaZl60MdZ1RU
	7iIalzUpFw/CFMMj6H+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwTc-00ESq9-2Q;
	Wed, 21 Jun 2023 11:58:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwTb-00ESpc-2O
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Jun 2023 11:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kl6nUkWuWRJmNI9AJnTnKYdYaqy5k7lvmEkgCwhBU2Y=; b=iBd7t2e4KtP1yDrPCNpHpNxGZt
	oV1d+5sNoJjk7V8slb3vOPXe163K5GQmlw/Hsc4JLGye1z6NOy9y+rwashq7ENtu+UNVBaVxTQPhr
	xvgFvhSEhFTRKBc5ivvnCF22WzSijIuypa5Wy6FEyEcMEDNGPjeg3+K2Ev1fxcm7mfEpdHqztz6r3
	NQCk1FxIIzO7MfUywTjdujiN1SvxB82Em9eAAmRANCEgd6xiMlfikcOdLDXlLfZwlmKGuj+AJFf4a
	ep6Y8AwETUyGkIzv23ZxfOdvK0jeuyRl+wwBXU6UhrLPFUj/f9BGBIdnG83bZUwIOQumJB4h1wTK8
	+TCgpIow==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qBwTV-00HQ3X-1Y;
	Wed, 21 Jun 2023 11:58:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 237223002A9;
	Wed, 21 Jun 2023 13:58:12 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0421220825AF9; Wed, 21 Jun 2023 13:58:11 +0200 (CEST)
Date: Wed, 21 Jun 2023 13:58:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stephane Eranian <eranian@google.com>
Cc: Eric Lin <eric.lin@sifive.com>, mingo@redhat.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
	adrian.hunter@intel.com, palmer@dabbelt.com,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: Re: [PATCH] perf/core: Add pmu stop before unthrottling to prevent
 WARNING
Message-ID: <20230621115811.GD2053369@hirez.programming.kicks-ass.net>
References: <20230602094841.1225-1-eric.lin@sifive.com>
 <CAPqJEFpamQSbCcD0QJ16u7ctRf1=NYihod6gdZJfxFpE0YUVHQ@mail.gmail.com>
 <CABPqkBRyqsMnNbokBKepkWq1DtzfB0npXySGbKS1T3nQTwmaAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABPqkBRyqsMnNbokBKepkWq1DtzfB0npXySGbKS1T3nQTwmaAw@mail.gmail.com>
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMTE6MTg6MDVQTSAtMDcwMCwgU3RlcGhhbmUgRXJhbmlh
biB3cm90ZToKPiBPbiBUdWUsIEp1biAyMCwgMjAyMyBhdCA5OjI14oCvUE0gRXJpYyBMaW4gPGVy
aWMubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IENDOiBTdGVwaGFuZSBFcmFuaWFuCj4g
Pgo+ID4gT24gRnJpLCBKdW4gMiwgMjAyMyBhdCA1OjQ54oCvUE0gRXJpYyBMaW4gPGVyaWMubGlu
QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBDdXJyZW50bHksIGR1cmluZyB0aGUgcGVy
ZiBzYW1wbGluZywgaWYgdGhlIHBlcmYgaW50ZXJydXB0IHRha2VzIHRvbyBsb25nLAo+ID4gPiBw
ZXJmIGZyYW1ld29yayB3aWxsIGxvd2VyIHRoZSBwZXJmX2V2ZW50X21heF9zYW1wbGVfcmF0ZS4g
VGhpcyB3aWxsIGxpbWl0Cj4gPiA+IHRoZSBudW1iZXIgb2Ygc2FtcGxlcyBwZXIgdGltZXIgdGlj
ayAobWF4X3NhbXBsZXNfcGVyX3RpY2spIGFuZCBzZXQgaHdjLT5pbnRlcnJ1cHRzCj4gPiA+IHRv
IE1BWF9JTlRFUlJVUFRTIHdpdGhpbiB0aGUgX19wZXJmX2V2ZW50X2FjY291bnRfaW50ZXJydXB0
KCkgZnVuY3Rpb24uCj4gPiA+Cj4gPiA+IEFmdGVyd2FyZCwgdGhlIHBlcmYgZnJhbWV3b3JrIHdp
bGwgdW50aHJvdHRsZSB0aGUgZXZlbnQgaW4gdGhlIHRpbWVyIGludGVycnVwdAo+ID4gPiBoYW5k
bGVyLCB3aGljaCB0cmlnZ2VycyB0aGUgZHJpdmVyJ3MgKl9wbXVfc3RhcnQoKSBmdW5jdGlvbi4g
TW9zdCBvZiB0aGUgZHJpdmVyJ3MKPiA+ID4gKl9wbXVfc3RhcnQoKSBmdW5jdGlvbnMgd2lsbCBj
aGVjayB0aGUgZXZlbnQtPmh3LnN0YXRlIHRvIGRldGVybWluZSB3aGV0aGVyIHRoaXMKPiA+ID4g
ZXZlbnQgaGFzIHN0b3BwZWQuIElmIHRoZSBldmVudCBoYXMgbm90IHN0b3BwZWQsIGEgV0FSTl9P
Tl9PTkNFKCkgd2FybmluZwo+ID4gPiB3aWxsIGJlIHRyaWdnZXJlZCBhcyBzaG93biBiZWxvdzoK
PiA+ID4KPiA+ID4gWyAyMTEwLjIyNDcyM10gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0t
LS0tLS0tCj4gPiA+IFsgMjExMC4yMjQ4NTFdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDI0MCBhdCBk
cml2ZXJzL3BlcmYvcmlzY3ZfcG11LmM6MTg0IHJpc2N2X3BtdV9zdGFydCsweDdjLzB4OGUKPiA+
ID4gWyAyMTEwLjIyNTI0Ml0gTW9kdWxlcyBsaW5rZWQgaW46Cj4gPiA+IFsgMjExMC4yMjUzODBd
IENQVTogMCBQSUQ6IDI0MCBDb21tOiBscyBOb3QgdGFpbnRlZCA2LjQtcmM0LWcxOWQwNzg4ZTll
ZjIgIzEKPiA+ID4gWyAyMTEwLjIyNTU3NF0gSGFyZHdhcmUgbmFtZTogU2lGaXZlIChEVCkKPiA+
ID4gWyAyMTEwLjIyNTY1N10gZXBjIDogcmlzY3ZfcG11X3N0YXJ0KzB4N2MvMHg4ZQo+ID4gPiBb
IDIxMTAuMjI1ODM0XSAgcmEgOiByaXNjdl9wbXVfc3RhcnQrMHgyOC8weDhlCj4gPiA+IFsgMjEx
MC4yMjU5OThdIGVwYyA6IGZmZmZmZmZmODBhZWY4NjQgcmEgOiBmZmZmZmZmZjgwYWVmODEwIHNw
IDogZmZmZjhmODAwMDRkYjZmMAo+ID4gPiBbIDIxMTAuMjI2MTM1XSAgZ3AgOiBmZmZmZmZmZjgx
YzgzNzUwIHRwIDogZmZmZmFmODAwNjlmOWJjMCB0MCA6IGZmZmY4ZjgwMDA0ZGI2YzAKPiA+ID4g
WyAyMTEwLjIyNjI0NV0gIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDAwMDAwMDAwMDAwMDAw
MWYgczAgOiBmZmZmOGY4MDAwNGRiNzIwCj4gPiA+IFsgMjExMC4yMjYzNjddICBzMSA6IGZmZmZh
ZjgwMDhjYTEwNjggYTAgOiAwMDAwZmZmZmZmZmZmZmZmIGExIDogMDAwMDAwMDAwMDAwMDAwMAo+
ID4gPiBbIDIxMTAuMjI2NDg4XSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAxIGEzIDogMDAwMDAwMDAw
MDAwMDg3MCBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+ID4gWyAyMTEwLjIyNjYwNV0gIGE1IDog
MDAwMDAwMDAwMDAwMDAwMCBhNiA6IDAwMDAwMDAwMDAwMDA4NDAgYTcgOiAwMDAwMDAwMDAwMDAw
MDMwCj4gPiA+IFsgMjExMC4yMjY3MjFdICBzMiA6IDAwMDAwMDAwMDAwMDAwMDAgczMgOiBmZmZm
YWY4MDA1MTY1ODAwIHM0IDogZmZmZmFmODAwNDI0ZGEwMAo+ID4gPiBbIDIxMTAuMjI2ODM4XSAg
czUgOiBmZmZmZmZmZmZmZmZmZmZmIHM2IDogZmZmZmZmZmY4MWNjNzU5MCBzNyA6IDAwMDAwMDAw
MDAwMDAwMDAKPiA+ID4gWyAyMTEwLjIyNjk1NV0gIHM4IDogMDAwMDAwMDAwMDAwMDAwNiBzOSA6
IDAwMDAwMDAwMDAwMDAwMDEgczEwOiBmZmZmYWY4MDdlZmJjMzQwCj4gPiA+IFsgMjExMC4yMjcw
NjRdICBzMTE6IGZmZmZhZjgwN2VmYmJmMDAgdDMgOiBmZmZmYWY4MDA2YTE2MDI4IHQ0IDogMDAw
MDAwMDBkYmZiYjc5Ngo+ID4gPiBbIDIxMTAuMjI3MTgwXSAgdDUgOiAwMDAwMDAwNzAwMDAwMDAw
IHQ2IDogZmZmZmFmODAwNTI2OTg3MAo+ID4gPiBbIDIxMTAuMjI3Mjc3XSBzdGF0dXM6IDAwMDAw
MDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAw
MDAwMwo+ID4gPiBbIDIxMTAuMjI3NDA3XSBbPGZmZmZmZmZmODBhZWY4NjQ+XSByaXNjdl9wbXVf
c3RhcnQrMHg3Yy8weDhlCj4gPiA+IFsgMjExMC4yMjc2MjJdIFs8ZmZmZmZmZmY4MDE4NWI1Nj5d
IHBlcmZfYWRqdXN0X2ZyZXFfdW50aHJfY29udGV4dCsweDE1ZS8weDE3NAo+ID4gPiBbIDIxMTAu
MjI3OTYxXSBbPGZmZmZmZmZmODAxODg2NDI+XSBwZXJmX2V2ZW50X3Rhc2tfdGljaysweDg4LzB4
OWMKPiA+ID4gWyAyMTEwLjIyODIzNV0gWzxmZmZmZmZmZjgwMDYyNmE4Pl0gc2NoZWR1bGVyX3Rp
Y2srMHhmZS8weDI3Ywo+ID4gPiBbIDIxMTAuMjI4NDYzXSBbPGZmZmZmZmZmODAwYjU2NDA+XSB1
cGRhdGVfcHJvY2Vzc190aW1lcysweDlhLzB4YmEKPiA+ID4gWyAyMTEwLjIyODY5MF0gWzxmZmZm
ZmZmZjgwMGM1YmQ0Pl0gdGlja19zY2hlZF9oYW5kbGUrMHgzMi8weDY2Cj4gPiA+IFsgMjExMC4y
MjkwMDddIFs8ZmZmZmZmZmY4MDBjNWUwYz5dIHRpY2tfc2NoZWRfdGltZXIrMHg2NC8weGIwCj4g
PiA+IFsgMjExMC4yMjkyNTNdIFs8ZmZmZmZmZmY4MDBiNWU1MD5dIF9faHJ0aW1lcl9ydW5fcXVl
dWVzKzB4MTU2LzB4MmY0Cj4gPiA+IFsgMjExMC4yMjk0NDZdIFs8ZmZmZmZmZmY4MDBiNmJkYz5d
IGhydGltZXJfaW50ZXJydXB0KzB4ZTIvMHgxZmUKPiA+ID4gWyAyMTEwLjIyOTYzN10gWzxmZmZm
ZmZmZjgwYWNjOWU4Pl0gcmlzY3ZfdGltZXJfaW50ZXJydXB0KzB4MzgvMHg0Mgo+ID4gPiBbIDIx
MTAuMjI5OTg0XSBbPGZmZmZmZmZmODAwOTBhMTY+XSBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSsw
eDkwLzB4MWQyCj4gPiA+IFsgMjExMC4yMzAxNjJdIFs8ZmZmZmZmZmY4MDA4YTlmND5dIGdlbmVy
aWNfaGFuZGxlX2RvbWFpbl9pcnErMHgyOC8weDM2Cj4gPiA+Cj4gPiA+IFRvIHByZXZlbnQgdGhp
cyB3YXJuaW5nLCB3ZSBzaG91bGQgY2FsbCB0aGUgZHJpdmVyJ3MgKl9wbXVfc3RvcCgpIGZ1bmN0
aW9uIGJlZm9yZSB1bnRocm90dGxpbmcKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBM
aW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAga2VybmVsL2V2ZW50cy9j
b3JlLmMgfCAxICsKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL2V2ZW50cy9jb3JlLmMgYi9rZXJuZWwvZXZlbnRzL2Nv
cmUuYwo+ID4gPiBpbmRleCBkYjAxNmU0MTg5MzEuLjA5OGM4NzVhYmU4OCAxMDA2NDQKPiA+ID4g
LS0tIGEva2VybmVsL2V2ZW50cy9jb3JlLmMKPiA+ID4gKysrIGIva2VybmVsL2V2ZW50cy9jb3Jl
LmMKPiA+ID4gQEAgLTQxMjgsNiArNDEyOCw3IEBAIHBlcmZfYWRqdXN0X2ZyZXFfdW50aHJfY29u
dGV4dChzdHJ1Y3QgcGVyZl9ldmVudF9jb250ZXh0ICpjdHgsIGJvb2wgdW50aHJvdHRsZSkKPiA+
ID4KPiA+ID4gICAgICAgICAgICAgICAgIGlmIChod2MtPmludGVycnVwdHMgPT0gTUFYX0lOVEVS
UlVQVFMpIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaHdjLT5pbnRlcnJ1cHRzID0g
MDsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZXZlbnQtPnBtdS0+c3RvcChldmVudCwg
MCk7Cj4gCj4gQnV0IGhvdyBjb3VsZCB0aGUgZXZlbnQgaGF2ZSBiZWVuIHN0b3BwZWQgd2l0aCBh
IGNhbGwgdG8gcG11LT5zdG9wKCkKPiBkdXJpbmcgdGhyb3R0bGluZz8KClllYWgsIENoYW5nZWxv
ZyBmYWlscyB0byBleHBsYWluIGhvdyB3ZSBnb3QgdG8gdGhlIGZhdWx0eSBzdGF0ZSAtLSBhbmQK
d2l0aG91dCB0aGF0IHdlIGNhbid0IGp1ZGdlIGlmIHRoZSBwcm9wb3NlZCBzb2x1dGlvbiBhY3R1
YWxseSBmaXhlcyB0aGUKcHJvYmxlbSBvciBub3QuCgo+ID4KPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgcGVyZl9sb2dfdGhyb3R0bGUoZXZlbnQsIDEpOwo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBldmVudC0+cG11LT5zdGFydChldmVudCwgMCk7Cj4gPiA+ICAgICAgICAgICAg
ICAgICB9Cj4gPiA+IC0tCj4gPiA+IDIuMTcuMQo+ID4gPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
