Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D79FC636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pECuPa7TSNZC7lX6y3iDyrl7URLt/00QmXfIXORVsh8=; b=ZJULv7YvSoJCsP
	Oo+D1FsOEQQ91GhUzo9T3ba9V/1hgOmofyEZ20TCbb8NtZC3g8/D0sDrIQ6NahzA1UrNN9S0/zsWz
	031x+HHnM892KKj7tjtWRwCknwwM9TgYcBiDy4Iq2jqeFZP63IZOPxSiPzzJ1YIzp1MuFY2OXLg/d
	K0j28BVfyUb7atg2+/9/u2A8p4AfqEgq1XRaIRY/Hooyv8DqV+bmujIXjJ1WfvN7e8b9P1t8A1StG
	UuwMQY2HXbfhcFogi06REEI4jL643KMm8IgphOwEIETW6sMQvzg9lk1Qh6lf7VSyiWplvVW+F+BWI
	R0KuZn6crCLV0nRH19uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSg78-00ArNE-5k; Thu, 16 Feb 2023 15:24:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSg74-00ArLw-Ps
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 15:24:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B4E1B825DD;
	Thu, 16 Feb 2023 15:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93525C433EF;
	Thu, 16 Feb 2023 15:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676561036;
	bh=yLtl/ZoTFhFQF8F15NijTr30bEfNrPFH3IlKTUdQhs0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tkf1sCPk17qoZnElk1gT130KeKtwOQr+VaA2yoTFQMS7PbPHeOpNmTwv73ug4TyX+
	 NtsTV8Gqy9EU19sC29rYfA7rkPCgsIKfeK8QitE1eY/4PetAPB+4j92VcxzlidNPG6
	 u49k/vNdXdUyHKWC6a3IZV1bMbRcEVrpOBAqUsxHxAx/uajLzqb44f+xK5/XSL/ULt
	 /T1ln7kwIiOm///NavKe3TdF2h9ncifTOls9ubpaoANzPl/yv4xs23fr0TUSOclX8E
	 tkftu8PSoqgyhcFgskKmFiN3Fd/2z9iww97DhIiTYjasQ+qzN1w2nwr2GRZ+181veC
	 Y83ABU7SDyhlQ==
Date: Fri, 17 Feb 2023 00:23:51 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, "liaochang (A)" <liaochang1@huawei.com>,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 conor.dooley@microchip.com, penberg@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
Message-Id: <20230217002351.112635f4fb35f84002666d29@kernel.org>
In-Reply-To: <Y9juYX8Bt1Z55lv0@FVFF77S0Q05N>
References: <20230126161559.1467374-1-guoren@kernel.org>
	<0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
	<CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
	<87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
	<Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
	<CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
	<Y9juYX8Bt1Z55lv0@FVFF77S0Q05N>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_072359_162279_CE1BCE62 
X-CRM114-Status: GOOD (  35.85  )
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

SGksCgpTb3JyeSBJIG1pc3NlZCB0aGlzIHRocmVhZC4KCk9uIFR1ZSwgMzEgSmFuIDIwMjMgMTA6
MzM6MDUgKzAwMDAKTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT4gd3JvdGU6Cgo+
IE9uIFR1ZSwgSmFuIDMxLCAyMDIzIGF0IDA5OjQ4OjI5QU0gKzA4MDAsIEd1byBSZW4gd3JvdGU6
Cj4gPiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAxMTo0OSBQTSBNYXJrIFJ1dGxhbmQgPG1hcmsu
cnV0bGFuZEBhcm0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgQmpvcm4sCj4gPiA+Cj4gPiA+
IE9uIE1vbiwgSmFuIDMwLCAyMDIzIGF0IDA0OjI4OjE1UE0gKzAxMDAsIEJqw7ZybiBUw7ZwZWwg
d3JvdGU6Cj4gPiA+ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKPiA+ID4g
Pgo+ID4gPiA+ID4+IEluIHRoZSBzZXJpZSBvZiBSSVNDViBPUFRQUk9CRVMgWzFdLCBpdCBwYXRj
aGVzIGEgbG9uZy1qdW1wIGluc3RydWN0aW9ucyBwYWlyCj4gPiA+ID4gPj4gQVVJUEMvSkFMUiBp
biBrZXJuZWwgdGV4dCwgc28gaW4gb3JkZXIgdG8gZW5zdXJlIG90aGVyIENQVXMgZG9lcyBub3Qg
ZXhlY3V0ZQo+ID4gPiA+ID4+IGluIHRoZSBpbnN0cnVjdGlvbnMgdGhhdCB3aWxsIGJlIG1vZGlm
aWVkLCBpdCBpcyBzdGlsbCBuZWVkIHRvIHN0b3Agb3RoZXIgQ1BVcwo+ID4gPiA+ID4+IHZpYSBw
YXRjaF90ZXh0IEFQSSwgb3IgeW91IGhhdmUgYW55IGJldHRlciBzb2x1dGlvbiB0byBhY2hpZXZl
IHRoZSBwdXJwb3NlPwo+ID4gPiA+ID4gIC0gVGhlIHN0b3BfbWFjaGluZSBpcyBhbiBleHBlbnNp
dmUgd2F5IGFsbCBhcmNoaXRlY3R1cmVzIHNob3VsZAo+ID4gPiA+ID4gYXZvaWQsIGFuZCB5b3Ug
Y291bGQga2VlcCB0aGF0IGluIHlvdXIgT1BUUFJPQkVTIGltcGxlbWVudGF0aW9uIGZpbGVzCj4g
PiA+ID4gPiB3aXRoIHN0YXRpYyBmdW5jdGlvbnMuCj4gPiA+ID4gPiAgLSBUaGUgc3RvcF9tYWNo
aW5lIGNvdWxkbid0IHdvcmsgd2l0aCBQUkVFTVBUSU9OLCBzbyB5b3VyCj4gPiA+ID4gPiBpbXBs
ZW1lbnRhdGlvbiBuZWVkcyB0byB3b3JrIHdpdGggIVBSRUVNUFRJT04uCj4gPiA+ID4KPiA+ID4g
PiAuLi5hbmQgc3RvcF9tYWNoaW5lKCkgd2l0aCAhUFJFRU1QVElPTiBpcyBicm9rZW4gYXMgd2Vs
bCwgd2hlbiB5b3UncmUKPiA+ID4gPiByZXBsYWNpbmcgbXVsdGlwbGUgaW5zdHJ1Y3Rpb25zIChz
ZWUgTWFyaydzIHBvc3QgYXQgWzFdKS4gVGhlCj4gPiA+ID4gc3RvcF9tYWNoaW5lKCkgZGFuY2Ug
bWlnaHQgd29yayB3aGVuIHlvdSdyZSByZXBsYWNpbmcgKm9uZSogaW5zdHJ1Y3Rpb24sCj4gPiA+
ID4gbm90IG11bHRpcGxlIGFzIGluIHRoZSBSSVNDLVYgY2FzZS4gSSdsbCBleHBhbmQgb24gdGhp
cyBpbiBhIGNvbW1lbnQgaW4KPiA+ID4gPiB0aGUgT1BUUFJPQkVTIHY2IHNlcmllcy4KPiA+ID4K
PiA+ID4gSnVzdCB0byBjbGFyaWZ5LCBteSBjb21tZW50cyBpbiBbMV0gd2VyZSBhc3N1bWluZyB0
aGF0IHN0b3BfbWFjaGluZSgpIHdhcyBub3QKPiA+ID4gdXNlZCwgaW4gd2hpY2ggY2FzZSB0aGVy
ZSBpcyBhIHByb2JsZW0gd2l0aCBvciB3aXRob3V0IFBSRUVNUFRJT04uCj4gPiA+Cj4gPiA+IEkg
YmVsaWV2ZSB0aGF0IHdoZW4gdXNpbmcgc3RvcF9tYWNoaW5lKCksIHRoZSAhUFJFRU1QVElPTiBj
YXNlIGlzIGZpbmUsIHNpbmNlCj4gPiA+IHN0b3BfbWFjaGluZSgpIHNjaGVkdWxlcyB3b3JrIHJh
dGhlciB0aGFuIHJ1bm5pbmcgd29yayBpbiBJUlEgY29udGV4dCBvbiB0aGUKPiA+ID4gYmFjayBv
ZiBhbiBJUEksIHNvIG5vIENQVXMgc2hvdWxkIGJlIG1pZC1zZXF1bmNlIGR1cmluZyB0aGUgcGF0
Y2hpbmcsIGFuZCBpdCdzCj4gPiA+IG5vdCBwb3NzaWJsZSBmb3IgdGhlcmUgdG8gYmUgdGhyZWFk
cyB3aGljaCBhcmUgcHJlZW1wdGVkIG1pZC1zZXF1ZW5jZS4KPiA+ID4KPiA+ID4gVGhhdCBhbGwg
c2FpZCwgSUlVQyBvcHRwcm9iZXMgaXMgZ29pbmcgdG8gZGlzYXBwZWFyIG9uY2UgZnByb2JlIGlz
IHJlYWR5Cj4gPiA+IGV2ZXJ5d2hlcmUsIHNvIHRoYXQgbWlnaHQgYmUgbW9vdC4KPiA+IFRoZSBv
cHRwcm9iZXMgY291bGQgYmUgaW4gdGhlIG1pZGRsZSBvZiBhIGZ1bmN0aW9uLCBidXQgZnByb2Jl
IG11c3QgYmUKPiA+IHRoZSBlbnRyeSBvZiBhIGZ1bmN0aW9uLCByaWdodD8KPiA+IAo+ID4gRG9l
cyB5b3VyIGZwcm9iZSBoZXJlIG1lYW46ID8KPiA+IAo+ID4gVGhlIExpbnV4IGtlcm5lbCBjb25m
aWd1cmF0aW9uIGl0ZW0gQ09ORklHX0ZQUk9CRToKPiA+IAo+ID4gcHJvbXB0OiBLZXJuZWwgRnVu
Y3Rpb24gUHJvYmUgKGZwcm9iZSkKPiA+IHR5cGU6IGJvb2wKPiA+IGRlcGVuZHMgb246ICggQ09O
RklHX0ZVTkNUSU9OX1RSQUNFUiApICYmICgKPiA+IENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRI
X1JFR1MgKSAmJiAoIENPTkZJR19IQVZFX1JFVEhPT0sgKQo+ID4gZGVmaW5lZCBpbiBrZXJuZWwv
dHJhY2UvS2NvbmZpZwo+IAo+IFllcy4KPiAKPiBNYXNhbWksIFN0ZXZlLCBhbmQgSSBoYWQgYSBj
aGF0IGF0IHRoZSB0cmFjaW5nIHN1bW1pdCBsYXRlIGxhc3QgeWVhciAod2hpY2gKPiB1bmZvcnR1
bmF0ZWx5LCB3YXMgbm90IHJlY29yZGVkKSwgYW5kIHdoYXQgd2UnZCBsaWtlIHRvIGRvIGlzIGdl
dCBlYWNoCj4gYXJjaGl0ZWN0dXJlIHRvIGhhdmUgRlBST0JFIChhbmQgRlRSQUNFX1dJVEhfQVJH
UyksIGF0IHdoaWNoIHBvaW50IE9QVFBST0JFCj4gYW5kIEtSRVRQUk9CRSBiZWNvbWUgcmVkdW5k
YW50IGFuZCBjb3VsZCBiZSByZW1vdmVkLgoKTm8sIHRoZSBmcHJvYmUgd2lsbCByZXBsYWNlIHRo
ZSBLUkVUUFJPQkUgYnV0IG5vdCBPUFRQUk9CRS4gVGhlIE9QVFBST0JFCmlzIGNvbXBsZXRlbHkg
ZGlmZmVyZW50IG9uZS4gRnByb2JlIGlzIHVzZWQgb25seSBmb3IgZnVuY3Rpb24gZW50cnksIGJ1
dApvcHRwcm9iZSBpcyBhcHBsaWVkIHRvIHRoZSBmdW5jdGlvbiBib2R5LgoKPiAKPiBpLmUuIHdl
J2Qga2VlcCBLUFJPQkVTIGFzIGEgInlvdSBjYW4gdHJhY2UgYW55IGluc3RydWN0aW9uIiBmZWF0
dXJlLCBidXQgaW4gdGhlCj4gZmV3IGNhc2VzIHdoZXJlIE9QVFBST0JFUyBjYW4gbWFrZSB0aGlu
Z3MgZmF0ZXIgYnkgdXNpbmcgRlRSQUNFLCB5b3Ugc2hvdWxkCj4ganVzdCB1c2UgdGhhdCBkaXJl
Y3RseSB2aWEgRlBST0JFLgoKSSB0aGluayB3aGF0IHlvdSBhcmUgc2F5aW5nIGlzIEtQUk9CRV9P
Tl9GVFJBQ0UsIGFuZCB0aGF0IHdpbGwgYmUgcmVwbGFjZWQgYnkKRlBST0JFUy4KClRoYW5rIHlv
dSwKCj4gCj4gVGhhbmtzLAo+IE1hcmsuCgoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkg
PG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
