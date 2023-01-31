Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2495C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 12:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhGp0ac5UD0KUliyvCXjsAYKs05y0zZc/FxXjAhuUso=; b=Mv2KV26/Ik50tf
	xCbxE3mGMYngX32GEe6xl9lMajnHm6dHcnpQ5VUUeUIB/ArFESrf2GEMa3FWKM7MJVDzCWXPJ+ra/
	wtwMFSGuaGgJjStpcoauvYpS2CbMaUs2HGSV0Gl72sDka7S5JSlTh7tP9g8YMRQr7DLkQnOxRdbAR
	YBPsJBGw8pS0rr/6fagZ/AQdp0+w+G0NznD+XgytRoy9ZGZ7NvdYhxMRsm51hjuGejhEFdDp/s+mB
	xLyK8GCsLNG/2BzKruhV3UmGgwEG3rD5ioRxdPQFZswcZ9XtX7SsyGNlQThmCgwIgqr+u+hM9e24Q
	I2oVi16C3ttZUQEr1y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpor-007sgq-AD; Tue, 31 Jan 2023 12:33:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpok-007sfl-Rl
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 12:32:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74F0CB81BC5;
	Tue, 31 Jan 2023 12:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F3DC433EF;
	Tue, 31 Jan 2023 12:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675168371;
	bh=XMt8AVXDCOd/Rs6vc6kQue3V5MV99U//73gnlqRozJ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NtoDolA9YmbmzDvm8CPAiURc5XXn4kDciE21UhO5RAUKwKWv3Z6dFb9Uj/nl+YnZp
	 3LxpXYCT87RzLo1V/ym9bgvNEjQu5FPLt24BbFTCcEeEOmcpbmeLNPVjeK5VR+/a2J
	 7/tRu3UAn6ic2BtQfhSI4vPEsFWMY5gYmCdIJMkbZd+C7W6rT7varD/XT3EPwSBL1J
	 YKJCuLdqcj0+CQxOFJqHuuq9RyuKih84QTeyTY5vyAPWE83v87+gDeYOYqC5uCj2c+
	 XvvLf6nz0kjfVTaBTQ1eaupt6g27W0edoqCYVGtgS5xxMK8K0ogcg7OE1fJviBrxXg
	 U33ZJFCwAYS4g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, guoren@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, mark.rutland@arm.com, liaochang (A)
 <liaochang1@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an
 illegal position
In-Reply-To: <20230126130509.1418251-1-guoren@kernel.org>
References: <20230126130509.1418251-1-guoren@kernel.org>
Date: Tue, 31 Jan 2023 13:32:48 +0100
Message-ID: <878rhig9zj.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_043255_225135_27327154 
X-CRM114-Status: GOOD (  20.09  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiBUaGUga2VybmVsIHdvdWxkIHBhbmljIHdoZW4gcHJvYmVkIGZvciBh
biBpbGxlZ2FsIHBvc2l0aW9uLiBlZzoKPgo+IChDT05GSUdfUklTQ1ZfSVNBX0M9bikKPgo+IGVj
aG8gJ3A6aGVsbG8ga2VybmVsX2Nsb25lKzB4MTYgYTA9JWEwJyA+PiBrcHJvYmVfZXZlbnRzCj4g
ZWNobyAxID4gZXZlbnRzL2twcm9iZXMvaGVsbG8vZW5hYmxlCj4gY2F0IHRyYWNlCj4KPiBLZXJu
ZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc3RhY2stcHJvdGVjdG9yOiBLZXJuZWwgc3RhY2sKPiBp
cyBjb3JydXB0ZWQgaW46IF9fZG9fc3lzX25ld2ZzdGF0YXQrMHhiOC8weGI4Cj4gQ1BVOiAwIFBJ
RDogMTExIENvbW06IHNoIE5vdCB0YWludGVkCj4gNi4yLjAtcmMxLTAwMDI3LWcyZDM5OGZlNDlh
NGQgIzQ5MAo+IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiBDYWxsIFRy
YWNlOgo+IFs8ZmZmZmZmZmY4MDAwNzI2OD5dIGR1bXBfYmFja3RyYWNlKzB4MzgvMHg0OAo+IFs8
ZmZmZmZmZmY4MGM1ZTgzYz5dIHNob3dfc3RhY2srMHg1MC8weDY4Cj4gWzxmZmZmZmZmZjgwYzZk
YTI4Pl0gZHVtcF9zdGFja19sdmwrMHg2MC8weDg0Cj4gWzxmZmZmZmZmZjgwYzZkYTZjPl0gZHVt
cF9zdGFjaysweDIwLzB4MzAKPiBbPGZmZmZmZmZmODBjNWVjZjQ+XSBwYW5pYysweDE2MC8weDM3
NAo+IFs8ZmZmZmZmZmY4MGM2ZGI5ND5dIGdlbmVyaWNfaGFuZGxlX2FyY2hfaXJxKzB4MC8weGE4
Cj4gWzxmZmZmZmZmZjgwMmRlZWIwPl0gc3lzX25ld3N0YXQrMHgwLzB4MzAKPiBbPGZmZmZmZmZm
ODAwMTU4YzA+XSBzeXNfY2xvbmUrMHgyMC8weDMwCj4gWzxmZmZmZmZmZjgwMDAzOWU4Pl0gcmV0
X2Zyb21fc3lzY2FsbCsweDAvMHg0Cj4gLS0tWyBlbmQgS2VybmVsIHBhbmljIC0gbm90IHN5bmNp
bmc6IHN0YWNrLXByb3RlY3RvcjoKPiBLZXJuZWwgc3RhY2sgaXMgY29ycnVwdGVkIGluOiBfX2Rv
X3N5c19uZXdmc3RhdGF0KzB4YjgvMHhiOCBdLS0tCj4KPiBUaGF0IGlzIGJlY2F1c2UgdGhlIGtw
cm9iZSdzIGVicmVhayBpbnN0cnVjdGlvbiBicm9rZSB0aGUga2VybmVsJ3MKPiBvcmlnaW5hbCBj
b2RlLiBUaGUgdXNlciBzaG91bGQgZ3VhcmFudGVlIHRoZSBjb3JyZWN0aW9uIG9mIHRoZSBwcm9i
ZQo+IHBvc2l0aW9uLCBidXQgaXQgY291bGRuJ3QgbWFrZSB0aGUga2VybmVsIHBhbmljLgo+Cj4g
VGhpcyBwYXRjaCBhZGRzIGFyY2hfY2hlY2tfa3Byb2JlIGluIGFyY2hfcHJlcGFyZV9rcHJvYmUg
dG8gcHJldmVudCBhbgo+IGlsbGVnYWwgcG9zaXRpb24gKFN1Y2ggYXMgdGhlIG1pZGRsZSBvZiBh
biBpbnN0cnVjdGlvbikuCgpOaWNlIQoKQGxpYW9jaGFuZyBXaWxsIHlvdSByZW1vdmUgeW91ciBw
YXRjaCBmcm9tIHRoZSBPUFRQUk9CRSBzZXJpZXM/Cgo+IEZpeGVzOiBjMjJiMGJjYjFkZDAgKCJy
aXNjdjogQWRkIGtwcm9iZXMgc3VwcG9ydGVkIikKPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMg
fCAxOCArKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+IGluZGV4IGYyMTU5MmQyMDMwNi4u
NDc1OTg5ZjA2ZDZkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJv
YmVzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gQEAgLTQ4
LDYgKzQ4LDIxIEBAIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNoX3NpbXVsYXRlX2luc24oc3Ry
dWN0IGtwcm9iZSAqcCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAlwb3N0X2twcm9iZV9oYW5k
bGVyKHAsIGtjYiwgcmVncyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBib29sIF9fa3Byb2JlcyBhcmNo
X2NoZWNrX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ICt7Cj4gKwl1bnNpZ25lZCBsb25nIHRt
cCAgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyIC0gcC0+b2Zmc2V0Owo+ICsJdW5zaWduZWQgbG9u
ZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcC0+YWRkcjsKPiArCj4gKwl3aGlsZSAodG1wIDw9IGFk
ZHIpIHsKPiArCQlpZiAodG1wID09IGFkZHIpCj4gKwkJCXJldHVybiB0cnVlOwo+ICsKPiArCQl0
bXAgKz0gR0VUX0lOU05fTEVOR1RIKCooa3Byb2JlX29wY29kZV90ICopdG1wKTsKCmtwcm9iZV9v
cGNvZGVfdCBpcyB1MzI7IFRoaXMgY2FuIHRyaWdnZXIgYSBtaXNhbGlnbmVkIGxvYWQsIHJpZ2h0
PwoKPiArCX0KPiArCj4gKwlyZXR1cm4gZmFsc2U7Cj4gK30KPiArCj4gIGludCBfX2twcm9iZXMg
YXJjaF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ICB7Cj4gIAl1bnNpZ25lZCBs
b25nIHByb2JlX2FkZHIgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyOwo+IEBAIC01NSw2ICs3MCw5
IEBAIGludCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+
ICAJaWYgKHByb2JlX2FkZHIgJiAweDEpCj4gIAkJcmV0dXJuIC1FSUxTRVE7Cj4gIAo+ICsJaWYg
KCFhcmNoX2NoZWNrX2twcm9iZShwKSkKPiArCQlyZXR1cm4gLUVJTFNFUTsKPiArCj4gIAkvKiBj
b3B5IGluc3RydWN0aW9uICovCj4gIAlwLT5vcGNvZGUgPSAqcC0+YWRkcjsKCk5vdCByZWxhdGVk
IHRvIHlvdXIgcGF0Y2gsIGJ1dCB0aGlzIGNhbiBhbHNvIHRyaWdnZXIgYSBtaXNhbGlnbmVkIGxv
YWQuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
