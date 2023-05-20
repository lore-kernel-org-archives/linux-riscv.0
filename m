Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2E8C77B7F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoULA7JlK8cBtEAdIuIa5eQVur67VQoe0qA/3HPR4YA=; b=kSajS3WJqKoJhF
	T988nvP2dXXOk+Ft4fbdRajURIUUGtnoH5ilSspnxUoRQRxPZfr4qUxIOFU038fu5S5C3bMrM1FGD
	I9EXswnJWhIncRhIGQwyqSpw2nmpvz6xlCR66Uggm7jlhFTMZz2MaOpsj0kbJnMQK+GNECEgPh4T/
	rrsY8QEn8DMjIv+2bJvRLqJrisKcHbrkczhIrIBPYBP03Pv/ZDuPkv3tm+e+UDVgrANQPSAya8447
	9Q19Gp68hIpxBvG4MMjaBP5hJsW3jRuiUspJRVcddkZYZHFLvgCUlocB9ZZPT/MxVMmqKChq8cdXC
	N3cCgkQ+BYHvcG2vDFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0GrL-000v7U-04;
	Sat, 20 May 2023 07:18:35 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0GrG-000v6k-2R
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 07:18:32 +0000
Date: Sat, 20 May 2023 09:18:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684567106; bh=fD+QpWRMeNFpRCJAE2QutFXhc74ml8IcDlJIdx112eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uj+pDEHqqNV40b2qwspNNCqdm/q/yaCq93D06gl4xwM/y1QgFOHkvfkBKDLbF3b/8
	 8WvG0c74Q8zNqe4oclx74UEc/7QAn1JImdiWfLm7JWYGUP30m/AbUsd32xPS5pDo84
	 37y8Sunt1vg0v4qtRrLtQLi90o+Oj5ihEu08paG0=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Paul E . McKenney" <paulmck@kernel.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: riscv: Fix up compile error for rv32
Message-ID: <3ce199ce-d9ca-4aa1-b19d-8e6b9b574300@t-8ch.de>
References: <cover.1684425792.git.falcon@tinylab.org>
 <20230519094030.GA24947@1wt.eu>
 <c5140f54-99f2-4d7f-8b53-bd3cd1093727@t-8ch.de>
 <ZGdNHv/QmAGBIYsM@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZGdNHv/QmAGBIYsM@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_001830_955069_200D9159 
X-CRM114-Status: GOOD (  20.27  )
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

T24gMjAyMy0wNS0xOSAxMjoxOToxMCswMjAwLCBXaWxseSBUYXJyZWF1IHdyb3RlOgo+IE9uIEZy
aSwgTWF5IDE5LCAyMDIzIGF0IDEyOjExOjAwUE0gKzAyMDAsIFRob21hcyBXZWnDn3NjaHVoIHdy
b3RlOgo+ID4gSGkgV2lsbHksCj4gPiAKPiA+IE9uIDIwMjMtMDUtMTkgMTE6NDA6MzArMDIwMCwg
V2lsbHkgVGFycmVhdSB3cm90ZToKPiA+ID4gSGkgWmhhbmdqaW4sCj4gPiA+IAo+ID4gPiBPbiBG
cmksIE1heSAxOSwgMjAyMyBhdCAwMTowMDoxOEFNICswODAwLCBaaGFuZ2ppbiBXdSB3cm90ZToK
PiA+ID4gPiBIaSwgV2lsbHkKPiA+ID4gPiAKPiA+ID4gPiBub2xpYmMgZm9yIHJpc2N2IGlzIG9u
bHkgdGVzdGVkIGZvciBydjY0IGN1cnJlbnRseSAoc2VlCj4gPiA+ID4gdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvbm9saWJjL01ha2VmaWxlKSwgdGhpcyBwYXRjaHNldCB0cmllcyB0byBsZXQgaXQK
PiA+ID4gPiBjb21waWxlIGZvciBydjMyLCBidXQgc3RpbGwgbm90IHBhc3MgdGhlIG5vbGliYyBz
ZWxmdGVzdDoKPiA+ID4gPiAKPiA+ID4gPiAqIFRoZSBmaXJzdCBwYXRjaCB1c2VzIGx3L3N3IGlu
c3RlYWQgb2YgbGQvc2QgZm9yIHJ2MzIgYW5kIHZlcnNlLXZpY2UgZm9yIHJ2NjQKPiA+ID4gPiAg
ICAgKiBUaGlzIHBhdGNoIG1heSBjb25mbGljdCB3aXRoIHRoZSBzdGFja3Byb3RlY3RvciBwYXRj
aCBbMV0sIGJlY2F1c2UKPiA+ID4gPiAgICAgICBib3RoIG9mIHRoZW0gY2hhbmdlZCB0aGUgX3N0
YXJ0IGFzc2VtYmx5IGluIGFyY2gtcmlzY3YuaAo+ID4gPiAKPiA+ID4gVGhhdCdzIHF1aXRlIGVt
YmFycmFzc2luZywgSSdtIGhhdmluZyB0byB0cmFjZSBvZiB0aGF0IHNlcmllcyBoZXJlLiBOb3cK
PiA+ID4gSSBjYW4gZmluZCBpdCBpbiBteSBMS01MIGFyY2hpdmVzLCBidXQgSSBkb24ndCBoYXZl
IHRoZSBkaXJlY3QgbWVzc2FnZSBhbmQKPiA+ID4gZGlkbid0IHNwb3QgdGhlIG90aGVyIG9uZXMu
IEknbGwgaGF2ZSB0byBpbnZlc3RpZ2F0ZSwgdGhhbmtzIGZvciBub3RpZnlpbmcKPiA+ID4gbWUh
IEknbSBDQ2luZyBUaG9tYXMsIEkgd2lsbCBjaGVjayB3aXRoIGhpbSBob3cgdG8gYmVzdCBtZXJn
ZSB0aGUgdHdvLgo+ID4gCj4gPiBJIHRoaW5rIHRoZSBjb25mbGljdCBzaG91bGQgYmUgdHJpdmlh
bCB0byBmaXguCj4gPiAKPiA+IEkgY2FuIGFsc28gcmVzZW5kIG15IHNlcmllcyBvciBqdXN0IHRo
ZSBzaW5nbGUgcmlzY3YgcGF0Y2guCj4gCj4gT0sgdGhlbiBJJ2xsIHBpY2sgWmhhbmdqaW4ncyBz
ZXJpZXMgYW5kIHdpbGwgYXBwbHkgeW91cnMgb24gdG9wIG9mIGl0Lgo+IERvIG5vdCBib3RoZXIg
cmVzZW5kaW5nIHRoZSB3aG9sZSBzZXJpZXMsIG9ubHkgdGhlIHJpc2N2IHBhdGNoIHdpbGwgYmUK
PiBzdWZmaWNpZW50LCBJIGhhdmUgdGhlIHJlc3Qgb2YgeW91ciBzZXJpZXMgaW4gbXkgbGttbCBt
Ym94LgoKQ291bGQgeW91IGxldCBtZSBrbm93IGlmIG9yIHdoZW4geW91ciBhcmUgcHVibGlzaGlu
ZyB5b3VyIGludGVncmF0aW9uCmJyYW5jaD8KClRob21hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
