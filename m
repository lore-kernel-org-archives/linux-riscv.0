Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D0CD11C2
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 14:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6K3EYkowcTmcHYQr6Y1E9RqE3n5WXFF4LD2+RqP9kkQ=; b=3mYDUcibJHObP1
	HFwABcw6bjLAZrhSxU2doICnHAFoUQya3Kk6gcPCcbwFQ/OwdTB/W4S40henur/DDQqQb3MdxFWI4
	XIyMxTcvZIx91obNNrXVGK7/jXgj/jm855qcVBUAro+vNYBCfyQfKwoEYZPg9NS3IWpMmhZ5xbJ0Y
	6LhySUJu04iG25IOmHB+N66KtiOWiPg5SDWe9YZEjUMMVaT1peP0hP1doKaoUsKwaSJSW0yhR8PlK
	v35MzrPMT1j/xw23yKDPc5HhFUZQQE2oA1lhPVBDoJnQIlOr4n29DuAwt6QBDRGNMPKWKBvKTpSyQ
	Ze1LLg6ET2/BU+UOQelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskNG-00000007PYB-38jG;
	Fri, 05 Apr 2024 14:16:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskNC-00000007PWQ-2C1Y
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 14:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0BFB618CB;
	Fri,  5 Apr 2024 14:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D8CC433F1;
	Fri,  5 Apr 2024 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712326613;
	bh=Hw+KO3P+18sZHmzC74dpfmnZvcgIJNwH7PxzRg8kCyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NLcxvN8DTCyS38Wo2c8q90q/2MoZExiascd6YXu8KFmC45GJekv4kw9UWrhP5O+n0
	 T4xoLBCSAvDVEYvlrPQBTILTQwRgV33CHfTCNI7qRQM7BYrkuE03OQOLgno/wn77Hr
	 PESugZv29avchfZsAMS7s+RgIUgsP4Oo55AJ5wVwthZ7azQ+bkK9VOK4bnmL9SeDKc
	 1DW+tMTj256yPD6wXa43Wc+15PNllkAGj03SBSKmJkJyZ4+hPiynM7vGxR5en1wli/
	 jky8B6fJI7vZ5nZqRQjLt+hBOkkkZ2VwAF70r1CsG/RVx+y3YKum8iJy4svQONVsyM
	 VcZaxRzX6q6pg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Pu Lehui
 <pulehui@huawei.com>
Cc: puranjay12@gmail.com
Subject: Re: [PATCH bpf-next] riscv, bpf: add internal-only MOV instruction
 to resolve per-CPU addrs
In-Reply-To: <20240405124348.27644-1-puranjay12@gmail.com>
References: <20240405124348.27644-1-puranjay12@gmail.com>
Date: Fri, 05 Apr 2024 16:16:49 +0200
Message-ID: <87wmpbnbce.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_071654_673915_71E76FF5 
X-CRM114-Status: GOOD (  18.47  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFN1cHBvcnQg
YW4gaW5zdHJ1Y3Rpb24gZm9yIHJlc29sdmluZyBhYnNvbHV0ZSBhZGRyZXNzZXMgb2YgcGVyLUNQ
VQo+IGRhdGEgZnJvbSB0aGVpciBwZXItQ1BVIG9mZnNldHMuIFRoaXMgaW5zdHJ1Y3Rpb24gaXMg
aW50ZXJuYWwtb25seSBhbmQKPiB1c2VycyBhcmUgbm90IGFsbG93ZWQgdG8gdXNlIHRoZW0gZGly
ZWN0bHkuIFRoZXkgd2lsbCBvbmx5IGJlIHVzZWQgZm9yCj4gaW50ZXJuYWwgaW5saW5pbmcgb3B0
aW1pemF0aW9ucyBmb3Igbm93IGJldHdlZW4gQlBGIHZlcmlmaWVyIGFuZCBCUEYKPiBKSVRzLgo+
Cj4gUklTQy1WIHVzZXMgZ2VuZXJpYyBwZXItY3B1IGltcGxlbWVudGF0aW9uIHdoZXJlIHRoZSBv
ZmZzZXRzIGZvciBDUFVzCj4gYXJlIGtlcHQgaW4gYW4gYXJyYXkgY2FsbGVkIF9fcGVyX2NwdV9v
ZmZzZXRbY3B1X251bWJlcl0uIFJJU0NWIHN0b3Jlcwo+IHRoZSBhZGRyZXNzIG9mIHRoZSB0YXNr
X3N0cnVjdCBpbiBUUCByZWdpc3Rlci4gVGhlIGZpcnN0IGVsZW1lbnQgaW4KPiB0YXN0X3N0cnVj
dCBpcyBzdHJ1Y3QgdGhyZWFkX2luZm8sIGFuZCB3ZSBjYW4gZ2V0IHRoZSBjcHUgbnVtYmVyIGJ5
CiAgICAgXgogICAgIGsgOy0pCj4gcmVhZGluZyBmcm9tIHRoZSBUUCByZWdpc3RlciArIG9mZnNl
dG9mKHN0cnVjdCB0aHJlYWRfaW5mbywgY3B1KS4KPgo+IE9uY2Ugd2UgaGF2ZSB0aGUgY3B1IG51
bWJlciBpbiBhIHJlZ2lzdGVyIHdlIHJlYWQgdGhlIG9mZnNldCBmb3IgdGhhdAo+IGNwdSBmcm9t
IGFkZHJlc3M6ICZfX3Blcl9jcHVfb2Zmc2V0ICsgY3B1X251bWJlciA8PCAzLiBUaGVuIHdlIGFk
ZCB0aGlzCj4gb2Zmc2V0IHRvIHRoZSBkZXN0aW5hdGlvbiByZWdpc3Rlci4KCkp1c3QgdG8gY2xh
cmlmeSBmb3IgcmVhZGVyczsgQlBGIHByb2dyYW1zIGFyZSBydW4gd2l0aCBtaWdyYXRlIGRpc2Fi
bGUsCndoaWNoIG1lYW5zIHRoYXQgb24gUlQgd2UgY2FuIGJlIHByZWVtcHRlZCwgd2hpY2ggbWVh
bnMgdGhhdCBwZXItY3B1Cm9wZXJhdGlvbnMgYXJlIHRyaWNraWVyIChkaXNhYmxpbmcgaW50ZXJy
dXB0cy9wcmVlbXB0aW9uKS4KCkhvd2V2ZXIsIHRoaXMgQlBGIGluc3RydWN0aW9uIGlzIGFib3V0
IGNhbGN1bGF0aW5nIHRoZSBwZXItY3B1IGFkZHJlc3MsCnNvIHRoZSBsb29rIHVwIGNhbiBiZSBp
bmxpbmVkLgoKSXQncyBub3QgYSBwZXItY3B1ICpvcGVyYXRpb24qLgoKPiBUbyBtZWFzdXJlIHRo
ZSBpbXByb3ZlbWVudCBmcm9tIHRoaXMgY2hhbmdlLCB0aGUgYmVuY2htYXJrIGluIFsxXSB3YXMK
PiB1c2VkIG9uIFFlbXU6Cj4KPiBCZWZvcmU6Cj4gZ2xvYi1hcnItaW5jICAgOiAgICAxLjEyNyDC
sSAwLjAxM00vcwo+IGFyci1pbmMgICAgICAgIDogICAgMS4xMjEgwrEgMC4wMDRNL3MKPiBoYXNo
LWluYyAgICAgICA6ICAgIDAuNjgxIMKxIDAuMDUyTS9zCj4KPiBBZnRlcjoKPiBnbG9iLWFyci1p
bmMgICA6ICAgIDEuMTM4IMKxIDAuMDExTS9zCj4gYXJyLWluYyAgICAgICAgOiAgICAxLjM2NiDC
sSAwLjAwNk0vcwo+IGhhc2gtaW5jICAgICAgIDogICAgMC42NzYgwrEgMC4wMDFNL3MKPgo+IFsx
XSBodHRwczovL2dpdGh1Yi5jb20vYW5ha3J5aWtvL2xpbnV4L2NvbW1pdC84ZGVjOTAwOTc1ZWYK
Pgo+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4K
PiAtLS0KPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDI0ICsrKysrKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25l
dC9icGZfaml0X2NvbXA2NC5jCj4gaW5kZXggMTVlNDgyZjJjNjU3Li5lOTViZDFkNDU5YTQgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ICsrKyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAtMTIsNiArMTIsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvc3RvcF9tYWNoaW5lLmg+Cj4gICNpbmNsdWRlIDxhc20vcGF0Y2guaD4KPiAgI2lu
Y2x1ZGUgPGFzbS9jZmkuaD4KPiArI2luY2x1ZGUgPGFzbS9wZXJjcHUuaD4KPiAgI2luY2x1ZGUg
ImJwZl9qaXQuaCIKPiAgCj4gICNkZWZpbmUgUlZfRkVOVFJZX05JTlNOUyAyCj4gQEAgLTEwODks
NiArMTA5MCwyNCBAQCBpbnQgYnBmX2ppdF9lbWl0X2luc24oY29uc3Qgc3RydWN0IGJwZl9pbnNu
ICppbnNuLCBzdHJ1Y3QgcnZfaml0X2NvbnRleHQgKmN0eCwKPiAgCQkJZW1pdF9vcihSVl9SRUdf
VDEsIHJkLCBSVl9SRUdfVDEsIGN0eCk7Cj4gIAkJCWVtaXRfbXYocmQsIFJWX1JFR19UMSwgY3R4
KTsKPiAgCQkJYnJlYWs7Cj4gKwkJfSBlbHNlIGlmIChpbnNuX2lzX21vdl9wZXJjcHVfYWRkcihp
bnNuKSkgewo+ICsJCQlpZiAocmQgIT0gcnMpCj4gKwkJCQllbWl0X212KHJkLCBycywgY3R4KTsK
PiArI2lmZGVmIENPTkZJR19TTVAKPiArCQkJCS8qIExvYWQgY3VycmVudCBDUFUgbnVtYmVyIGlu
IFQxICovCj4gKwkJCQllbWl0X2xkKFJWX1JFR19UMSwgb2Zmc2V0b2Yoc3RydWN0IHRocmVhZF9p
bmZvLCBjcHUpLCBSVl9SRUdfVFAsCj4gKwkJCQkJY3R4KTsKPiArCQkJCS8qIDw8IDMgYmVjYXVz
ZSBvZmZzZXRzIGFyZSA4IGJ5dGVzICovCj4gKwkJCQllbWl0X3NsbGkoUlZfUkVHX1QxLCBSVl9S
RUdfVDEsIDMsIGN0eCk7Cj4gKwkJCQkvKiBMb2FkIGFkZHJlc3Mgb2YgX19wZXJfY3B1X29mZnNl
dCBhcnJheSBpbiBUMiAqLwo+ICsJCQkJZW1pdF9pbW0oUlZfUkVHX1QyLCAodTY0KSZfX3Blcl9j
cHVfb2Zmc2V0LCBjdHgpOwoKRGlkIHlvdSB0cnkgdXNpbmcgZW1pdF9hZGRyKCkgaGVyZT8gSSdk
IGd1ZXNzIHRoYXQnbGwgYmUgZmV3ZXIKaW5zdHJ1Y3Rpb25zLCBubz8KCgpCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
