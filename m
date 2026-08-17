Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2EAC5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KjU6QqyFacm38rkKvZgcnlsHt91S7OmvBefLyyEC3M=; b=lb95AZFEPCqLZj
	7wP9khT8JeCgqEjPs1d3E4rp4VC5cwEnJZ4Fmw/OxMivfi/qOk4v6iOyhi8CuJfhcuzDXVqC7lDbo
	bpS3EuuoivN6jRkdadyfkciuCVRWT4Yji7RNstO0qK9ec9ynsVwqEL4m44gMk77XMibG5G7zrkzyv
	s+2s9kdJ+nCWbdA6ASSnyaERZkG78Rea7Hxgs0A6ouiifc2BWuLvnQnMzhRFISMwMs9YN5TpzAvQz
	NAqLy8gxmz8XsigEr27vUForOYNWLVxMX6IEFyPnv0NBJepJF3w4ECP2hrDAnq8++EcFZDed/zSnK
	nlty30J2qc8z8f1t2kBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyHO-00000006IEV-3Gst;
	Mon, 17 Aug 2026 14:25:34 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyHM-00000006IE9-1MI3
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:25:33 +0000
Received: from bat.kanata.rendec.net (unknown [72.143.213.121])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 18153C2DC3;
	Mon, 17 Aug 2026 17:25:24 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 18153C2DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1786976730;
	bh=roywxzjwoDpRPpkuvJQWLXoKTdkrckRY7+MlEfFx5fw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HXYXSPXWdmUZu4Pue0ZKV6rZF2xLFPPHgLzx8gwJdilmCq6Tp+ba+iL91HpZbzsSO
	 Uugtv6b6i37mHhwFp0pO0d+1wdyW/1I+Dp4AUvQYuyH1Ho4NKBvYbm6S1B/oHOsAno
	 xjV7XLJduVv/cj4qpe+wYUli1z2MuF90D8fCFxtTozHvTk5P5/D8OFmK3t/8SksBCF
	 YUa/+L5do1LbPE60fXDZ1t6TOVL5Sagd5Hnqfb8q6CBL7AbL6hwxMoQr5dMpBC2qoY
	 Ax2FI2hPRu97+zp7E2igfoa+KTqSq6OmoA0ulTNy0pu5AQ+x2JpzT38wKzdW6KegvM
	 Kdo+gwH/bjGsA==
Message-ID: <a4e7d860dc82bc68945446277f2653ac9ad343f1.camel@rendec.net>
Subject: Re: [PATCH 5/5] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, daniel.lezcano@kernel.org, anup@brainfault.org, 
	hui.wang@canonical.com, samuel.holland@sifive.com
Date: Mon, 17 Aug 2026 10:25:20 -0400
In-Reply-To: <CAJF2gTTeZohiUrn83d-XrxDdMP-LA2eyjpxyqn_-XOk0ko0qbA@mail.gmail.com>
References: <20260816070049.2097442-1-guoren@kernel.org>
	 <20260816070049.2097442-6-guoren@kernel.org>
	 <e70e9fd19e9ebaec823a8abc518bf935e36938b9.camel@rendec.net>
	 <CAJF2gTTeZohiUrn83d-XrxDdMP-LA2eyjpxyqn_-XOk0ko0qbA@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_072532_561368_3087EBCD 
X-CRM114-Status: GOOD (  17.94  )
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

T24gTW9uLCAyMDI2LTA4LTE3IGF0IDIxOjA1ICswODAwLCBHdW8gUmVuIHdyb3RlOgo+IE9uIFN1
biwgQXVnIDE2LCAyMDI2IGF0IDExOjI44oCvUE0gUmFkdSBSZW5kZWMgPHJhZHVAcmVuZGVjLm5l
dD4gd3JvdGU6Cj4gPiAKPiA+IE9uIFN1biwgMjAyNi0wOC0xNiBhdCAwNzowMCArMDAwMCwgR3Vv
IFJlbiB3cm90ZToKPiA+ID4gRnJvbTogIkdVTyBSZW4gKFh1YW5UaWUpIiA8Z3VvcmVuQGtlcm5l
bC5vcmc+Cj4gPiA+IAo+ID4gPiBJTVNJQyB3YXMgZGVmaW5pbmcgaXRzIG93biBJTVNJQ19OUl9J
UEkgKD0gOCkgd2hpY2ggaGFwcGVuZWQgdG8gbWF0Y2gKPiA+ID4gdGhlIGFyY2hpdGVjdHVyZSdz
IElQSV9NQVguIE5vdyB0aGF0IElQSV9NQVggaXMgZXhwb3J0ZWQgZnJvbSByaXNjdgo+ID4gPiBh
c20vc21wLmgsIHVzZSB0aGUgYXJjaGl0ZWN0dXJlIGNvbnN0YW50IGFuZCBkcm9wIHRoZSBwcml2
YXRlIGRlZmluZS4KPiA+ID4gCj4gPiA+IFRoaXMga2VlcHMgdGhlIG51bWJlciBvZiBtdWx0aXBs
ZXhlZCBJUElzIGluIHN5bmMgd2l0aCB0aGUgcmVzdCBvZiB0aGUKPiA+ID4gUklTQy1WIElQSSBp
bmZyYXN0cnVjdHVyZS4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdVTyBSZW4gKFh1YW5U
aWUpIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+IMKgZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIHwgNCArKy0tCj4gPiA+IMKgZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oIHwgMSAtCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gPiA+IGluZGV4IDEyZWZkMjQxY2U4OC4uODIzZjVm
MmVjYjNkIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2lj
LWVhcmx5LmMKPiA+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJs
eS5jCj4gPiA+IEBAIC02NywxMiArNjcsMTIgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfaXBp
X2RvbWFpbl9pbml0KHZvaWQpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAwOwo+ID4gPiAKPiA+ID4gwqDCoMKgwqDCoCAvKiBDcmVhdGUgSU1TSUMgSVBJIG11bHRpcGxl
eGluZyAqLwo+ID4gPiAtwqDCoMKgwqAgdmlycSA9IGlwaV9tdXhfY3JlYXRlKElNU0lDX05SX0lQ
SSwgaW1zaWNfaXBpX3NlbmQpOwo+ID4gPiArwqDCoMKgwqAgdmlycSA9IGlwaV9tdXhfY3JlYXRl
KElQSV9NQVgsIGltc2ljX2lwaV9zZW5kKTsKPiA+ID4gwqDCoMKgwqDCoCBpZiAodmlycSA8PSAw
KQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdmlycSA8IDAgPyB2aXJx
IDogLUVOT01FTTsKPiA+ID4gCj4gPiA+IMKgwqDCoMKgwqAgLyogU2V0IHZJUlEgcmFuZ2UgKi8K
PiA+ID4gLcKgwqDCoMKgIHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZSh2aXJxLCBJTVNJQ19OUl9J
UEkpOwo+ID4gPiArwqDCoMKgwqAgcmlzY3ZfaXBpX3NldF92aXJxX3JhbmdlKHZpcnEsIElQSV9N
QVgpOwo+ID4gPiAKPiA+ID4gwqDCoMKgwqDCoCAvKiBBbm5vdW5jZSB0aGF0IElNU0lDIGlzIHBy
b3ZpZGluZyBJUElzICovCj4gPiA+IMKgwqDCoMKgwqAgcHJfaW5mbygiJXBmd1A6IHByb3ZpZGlu
ZyBJUElzIHVzaW5nIGludGVycnVwdCAlZFxuIiwgaW1zaWMtPmZ3bm9kZSwgSU1TSUNfSVBJX0lE
KTsKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3Rh
dGUuaCBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaAo+ID4gPiBpbmRl
eCBjNDJlZTE4MGIzMDUuLjg3OGNjMTkyY2NlYyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oCj4gPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaAo+ID4gPiBAQCAtMTMsNyArMTMsNiBAQAo+ID4gPiDC
oCNpbmNsdWRlIDxsaW51eC90aW1lci5oPgo+ID4gPiAKPiA+ID4gwqAjZGVmaW5lIElNU0lDX0lQ
SV9JRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxCj4g
PiA+IC0jZGVmaW5lIElNU0lDX05SX0lQScKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA4Cj4gPiA+IAo+ID4gPiDCoHN0cnVjdCBpbXNpY192ZWN0b3Igewo+
ID4gPiDCoMKgwqDCoMKgIC8qIEZpeGVkIGRldGFpbHMgb2YgdGhlIHZlY3RvciAqLwo+ID4gCj4g
PiBSZXZpZXdlZC1ieTogUmFkdSBSZW5kZWMgPHJhZHVAcmVuZGVjLm5ldD4KPiAKPiBUaGFua3Mg
Zm9yIHRoZSByZXZpZXcsIFJhZHUuIEhvd2V2ZXIsIHRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBbMV0u
IFdvdWxkCj4geW91IG1pbmQgYWxzbyByZXZpZXdpbmcgWzFdPwo+IAo+IFsxXTogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjA4MTYwNzAwNDkuMjA5NzQ0Mi0yLWd1b3Jl
bkBrZXJuZWwub3JnLwoKWW91J3JlIHdlbGNvbWUhIFN1cmUsIHRoYXQgbWFrZXMgc2Vuc2UsIEkg
cmV2aWV3ZWQgWzFdIGFzIHdlbGwuCgotLSAKQmVzdCByZWdhcmRzLApSYWR1CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
