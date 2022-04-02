Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16851C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 07:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRMSUcABfFSSmsGtrfaCp1IihK4/8pvi+aCpx5v/dIw=; b=XvlZcW1QzpptD7
	KDIHs8HquDsf1zpX7rXZtK7F9jErWpr+69X+QlrN4h5sfj86AK7TJlzeUOI78VfZNbYtVGn5Iv4Ab
	/qQ/S7hnFsi8xvyebFm0xePx5Owk4i3w/m5KW80ws7/OL/IKELbwYn51o1qvliWY/hsT0bY+joBLy
	Gv1gqYNCrrXiPNukdeJwGPU+RJfyHQFjxMu6LdUA5K5x0p5DQ3mTeKvcCElTk1Pa5Mia/uAaHUJLX
	CLyVhOUuZktR2+xOXWJauthNQ0Y9uxTByluyABSNhgQBbleWVck4neF/vvPEexa/0A33CyaHop3GC
	69MCZNfG/aB7sz6099xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naYVp-008FuX-Mc; Sat, 02 Apr 2022 07:49:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naYVm-008FtH-0o
 for linux-riscv@lists.infradead.org; Sat, 02 Apr 2022 07:49:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8E89B801BA;
 Sat,  2 Apr 2022 07:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DAFC340EC;
 Sat,  2 Apr 2022 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648885766;
 bh=n5LErFXRESNWybe75JSAh5NCeQt0jrP61FM5XFBKGkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kNtFpBeSmonWdZyVB6qCDjlQOeTN4J2lVP1d924C8kEH+x0gZ9rrTOCIhhBAE5frI
 jq8GQp/qz7U+ld7ULy5Ki9RyDRH2LQeT+XQexFGVlcBkUvx54z7bcznFTJiJ0tX+P6
 yhrLGNogbVGHWmRKIQQ5fM/p0ftHGcdUtnyx2uHs=
Date: Sat, 2 Apr 2022 09:49:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Ohad Sharabi <osharabi@habana.ai>
Subject: Re: [PATCH] habanalabs: Elide a warning on 32-bit targets
Message-ID: <YkgAAqAb+9UKDEtn@kroah.com>
References: <20220401163909.20343-1-palmer@rivosinc.com>
 <CAFCwf13-o=kUR61xjWt=F-Q-Vfy=kF6fpMP7iB+83Gfqw7+2HA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFCwf13-o=kUR61xjWt=F-Q-Vfy=kF6fpMP7iB+83Gfqw7+2HA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_004930_396184_1E55F54E 
X-CRM114-Status: GOOD (  27.66  )
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

T24gRnJpLCBBcHIgMDEsIDIwMjIgYXQgMDk6MTM6NDhQTSArMDMwMCwgT2RlZCBHYWJiYXkgd3Jv
dGU6Cj4gT24gRnJpLCBBcHIgMSwgMjAyMiBhdCA3OjQxIFBNIFBhbG1lciBEYWJiZWx0IDxwYWxt
ZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiBUaGlzIGRvdWJsZS1jYXN0IHBhdHRlcm4gbG9va3Mg
YSBiaXQgYXdrd2FyZCwgYnV0IGl0IGFscmVhZHkgZXhpc3RzCj4gPiBlbHNld2hlcmUgaW4gdGhl
IGRyaXZlci4gIFdpdGhvdXQgdGhpcyBwYXRjaCBJIGdldAo+ID4KPiA+IGRyaXZlcnMvbWlzYy9o
YWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYzogSW4gZnVuY3Rpb24g4oCYYWxsb2NfZGV2aWNlX21l
bW9yeeKAmToKPiA+IGRyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYzoxNTM6
NDk6IHdhcm5pbmc6IGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIgb2YgZGlmZmVyZW50IHNp
emUgWy1XcG9pbnRlci10by1pbnQtY2FzdF0KPiA+ICAgMTUzIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHU2NCkgZ2VuX3Bvb2xfZG1hX2FsbG9jX2Fs
aWduKHZtLT5kcmFtX3BnX3Bvb2wsCj4gPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA+Cj4gPiB3aGljaCBlbmRzIHVwIHByb21vdGVk
IHRvIGEgYnVpbGQgZXJyb3IgaW4gbXkgdGVzdCBzZXR1cC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiAtLS0KPiA+Cj4g
PiBJIGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgdGhpcyBkcml2ZXIsIEknbSBqdXN0IHBhdHRl
cm4tbWF0Y2hpbmcgdGhlCj4gPiB3YXJuaW5nIGF3YXkuCj4gPiAtLS0KPiA+ICBkcml2ZXJzL21p
c2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMgfCAxMCArKysrKy0tLS0tCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jIGIvZHJpdmVycy9t
aXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jCj4gPiBpbmRleCBlMDA4ZDgyZTRiYTMuLmYx
ZmM3OWMxZmMxMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1v
bi9tZW1vcnkuYwo+ID4gKysrIGIvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9y
eS5jCj4gPiBAQCAtMTUwLDEyICsxNTAsMTIgQEAgc3RhdGljIGludCBhbGxvY19kZXZpY2VfbWVt
b3J5KHN0cnVjdCBobF9jdHggKmN0eCwgc3RydWN0IGhsX21lbV9pbiAqYXJncywKPiA+ICAgICAg
ICAgICAgICAgICBmb3IgKGkgPSAwIDsgaSA8IG51bV9wZ3MgOyBpKyspIHsKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGlmIChpc19wb3dlcl9vZl8yKHBhZ2Vfc2l6ZSkpCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBoeXNfcGdfcGFjay0+cGFnZXNbaV0gPQo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHU2NCkgZ2VuX3Bv
b2xfZG1hX2FsbG9jX2FsaWduKHZtLT5kcmFtX3BnX3Bvb2wsCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBhZ2Vfc2l6ZSwgTlVMTCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9z
aXplKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICh1NjQpICh1aW50cHRyX3QpIGdlbl9wb29sX2RtYV9hbGxvY19hbGlnbih2bS0+ZHJhbV9wZ19w
b29sLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZ2Vfc2l6ZSwgTlVM
TCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3NpemUpOwo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwaHlzX3BnX3BhY2stPnBhZ2VzW2ldID0gKHU2NCkgZ2VuX3Bvb2xfYWxsb2Modm0t
PmRyYW1fcGdfcG9vbCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9zaXplKTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19wZ19wYWNrLT5wYWdlc1tpXSA9
ICh1NjQpICh1aW50cHRyX3QpIGdlbl9wb29sX2FsbG9jKHZtLT5kcmFtX3BnX3Bvb2wsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlX3NpemUpOwo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFwaHlzX3BnX3BhY2stPnBhZ2VzW2ldKSB7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoaGRldi0+ZGV2LAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gYWxsb2NhdGUgZGV2aWNl
IG1lbW9yeSAob3V0IG9mIG1lbW9yeSlcbiIpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiAKPiBU
aGlzIHBhdGNoIGlzOgo+IFJldmlld2VkLWJ5OiBPZGVkIEdhYmJheSA8b2dhYmJheUBrZXJuZWwu
b3JnPgo+IAo+IEdyZWcsCj4gQ291bGQgeW91IHBsZWFzZSBhcHBseSB0aGlzIGRpcmVjdGx5IHRv
IHlvdXIgbWlzYyB0cmVlIGFuZCBzZW5kIGl0IHRvCj4gTGludXMgYXQgeW91ciBuZXh0IHB1bGwg
cmVxdWVzdCA/CgpTbyBpZ25vcmUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIyMDQwMTA0
MTYxNS4zMjk2Mzg3LTEtamNtdmJrYmNAZ21haWwuY29tID8KCj4gSSBkb24ndCBoYXZlIGFueSBv
dGhlciBmaXhlcyBwZW5kaW5nIGZvciA1LjE4LgoKWWVzLCBJIHdpbGwgcXVldWUgdGhpcyB1cCBh
ZnRlciAtcmMxIGlzIG91dC4KCnRoYW5rcywKCmdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
