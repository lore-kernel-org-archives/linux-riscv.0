Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EB2E7C4C8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBhLLDuHplWWgAYFV1aAlOfK2dIm2GLBtBA7e3SuqUA=; b=ULkB48119xmZIz
	sCFUfjp7v41tXG5GhzwvU5E+XkRLl4B+i+jPFkx//B6NuyeEzM0VjJsf7cKqXjCjtBP8EFixiYfrA
	cbV34bixE8Ju5YMhUs8w9vxbpdN1LkzTkzRlGcdCj6HnyleHAlmdDxdZ84Nd9x8hG0+iJP9raSFxQ
	R2mkSH6WM9FY/AMy9xeXNvyXHL+KTYeu++g9X89PZr260tMUm3olPHJFSECGbr8DELBo7zGjxijBa
	ZA52g/1XGqFfff3ZotUCl6Onl1xWh6Vt1njJ7gwVDQDUUBLfOdnAeH4ZDoyOugZz5DnEffSkCnpu8
	tjNJFANHhNPlspD3YSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo39m-000G0t-2a;
	Wed, 04 Oct 2023 14:47:22 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo39i-000FzI-0b
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:47:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1696430820; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nxDApxEtzlx2xFddY5YqEaRiOelJY8n/5mSNawUGpBG3I4vQC4X6GggHHzTZGSLcLkPGqCZOrc+tkBKbKAd3i06Bbk7F0OUL7UxA76yEowMwZhSJ74h2XX37KOf54puONWX7BIVNHtshOXE/9mI3fxe3FOJu3TJpZ9yeDzplVFw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696430820; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U9trAlWX6nBvb4VRniGzCrIKYuNDIMWaTtr2TJttzSk=; 
	b=Pb0xQhHAo1a30Wk3f00tHT5zSAo2GAyeRFIbWiMCxFSbygrlW4OnZkyNQoDbzqLwOwSwyQOebsf6/MlERWP1fwTNGjA2pBlD/OqclMdwf49it/1lzynrNllKQdwiSv5oknBgYLs0vMONzdPCafJAOFvRlkXb15dZE03/+ELxbug=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696430820;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=U9trAlWX6nBvb4VRniGzCrIKYuNDIMWaTtr2TJttzSk=;
	b=clD1xuxQ/rJT7sA7O7drvAgcArpOp3gx//OhNLxCkza9KKFmcbCglsnObwhOrAKZ
	V4iO/MHUcJIfw+nCFggVYLY0hPT/C/R0nG9HUcMtbRgcQwvxBt6DrPVPLO5xVl4tqj9
	t/+YXinXCg+k30aSzalQmTOkomM8b/NVjL5ArW78BBufIWPenKo7XjKK+Gd5iYWtH7H
	urAHnBNC4SpiQ6QzjUG19BJg3sxcSxZeb0TDa3liQHXmPy/A9Pt8j96RbJlaFoApC/t
	ug0UzUii4LGLU2jmdXK7JwSwRe6suIbo9t68yzPgI/egoHEWZU+P2ZFIgI34IxpOMjs
	UfnD+EigcQ==
Received: from edelgard.fodlan.icenowy.me (120.85.98.65 [120.85.98.65]) by mx.zohomail.com
	with SMTPS id 1696430817671586.6852143453285; Wed, 4 Oct 2023 07:46:57 -0700 (PDT)
Message-ID: <be4e43b676ca5619e99b0f5abf228e45fadedb70.camel@icenowy.me>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
From: Icenowy Zheng <uwu@icenowy.me>
To: Robin Murphy <robin.murphy@arm.com>, "Lad, Prabhakar"
	 <prabhakar.csengg@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Christoph Hellwig <hch@lst.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Robert Nelson
 <robertcnelson@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, Fu
 Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor
 Dooley <conor@kernel.org>, Jason Kridner <jkridner@beagleboard.org>, Xi
 Ruoyao <xry111@xry111.site>, Han Gao <gaohan@iscas.ac.cn>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Linux-MM <linux-mm@kvack.org>
Date: Wed, 04 Oct 2023 22:46:49 +0800
In-Reply-To: <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
	 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
	 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
	 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker>
	 <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
	 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com>
	 <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me>
	 <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_074718_247252_234B1C7E 
X-CRM114-Status: GOOD (  27.33  )
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

5ZyoIDIwMjMtMTAtMDTmmJ/mnJ/kuInnmoQgMTU6MTggKzAxMDDvvIxSb2JpbiBNdXJwaHnlhpnp
gZPvvJoKPiBPbiAwNC8xMC8yMDIzIDM6MDIgcG0sIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gWy4u
Ll0KPiA+ID4gPiA+IEkgYmVsaWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgic29jOiByZW5lc2Fz
OiBLY29uZmlnOiBTZWxlY3QKPiA+ID4gPiA+IHRoZQo+ID4gPiA+ID4gcmVxdWlyZWQgY29uZmln
cyBmb3IgUlovRml2ZSBTb0MiKSBjYW4gY2F1c2UgcmVncmVzc2lvbiBvbgo+ID4gPiA+ID4gYWxs
Cj4gPiA+ID4gPiBub24tZG1hLWNvaGVyZW50IHJpc2N2IHBsYXRmb3JtcyB3aXRoIGdlbmVyaWMg
ZGVmY29uZmlnLiBUaGlzCj4gPiA+ID4gPiBpcwo+ID4gPiA+ID4gYSBjb21tb24gaXNzdWUuIFRo
ZSBsb2dpYyBoZXJlIGlzOiBnZW5lcmljIHJpc2N2IGRlZmNvbmZpZwo+ID4gPiA+ID4gc2VsZWN0
cwo+ID4gPiA+ID4gQVJDSF9SOUEwN0cwNDMgd2hpY2ggc2VsZWN0cyBETUFfR0xPQkFMX1BPT0ws
IHdoaWNoIGFzc3VtZXMKPiA+ID4gPiA+IGFsbAo+ID4gPiA+ID4gbm9uLWRtYS1jb2hlcmVudCBy
aXNjdiBwbGF0Zm9ybXMgaGF2ZSBhIGRtYSBnbG9iYWwgcG9vbCwgdGhpcwo+ID4gPiA+ID4gYXNz
dW1wdGlvbgo+ID4gPiA+ID4gc2VlbXMgbm90IGNvcnJlY3QuIEFuZCBJIGJlbGlldmUgRE1BX0dM
T0JBTF9QT09MIHNob3VsZCBub3QKPiA+ID4gPiA+IGJlCj4gPiA+ID4gPiBzZWxlY3RlZCBieSBB
UkNIX1NPQ0ZBTUlMSVksIGluc3RlYWQsIG9ubHkgQVJDSCB1bmRlciBzb21lCj4gPiA+ID4gPiBz
cGVjaWZpYwo+ID4gPiA+ID4gY29uZGl0aW9ucyBjYW4gc2VsZWN0IGl0IGdsb2JhbHksIGZvciBl
eGFtcGxlIE5PTU1VIEFSTSBhbmQKPiA+ID4gPiA+IHNvCj4gPiA+ID4gPiBvbi4KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gU2luY2UgdGhpcyBpcyBhIHJlZ3Jlc3Npb24sIHdoYXQncyBwcm9wZXIgZml4
PyBhbnkgc3VnZ2VzdGlvbgo+ID4gPiA+ID4gaXMKPiA+ID4gPiA+IGFwcHJlY2lhdGVkLgo+ID4g
PiAKPiA+ID4gSSB0aGluayB0aGUgYW5zd2VyIGlzIHRvIG5vdCBzZWxlY3QgRE1BX0dMT0JBTF9Q
T09MLCBzaW5jZSB0aGF0Cj4gPiA+IGlzCj4gPiA+IG9ubHkKPiA+IAo+ID4gV2VsbCBJIHRoaW5r
IGZvciBSSVNDLVYsIGl0J3Mgbm90IE5PTU1VIG9ubHkgYnV0IGFwcGxpY2FibGUgZm9yCj4gPiBl
dmVyeQo+ID4gY29yZSB0aGF0IGRvZXMgbm90IHN1cHBvcnQgU3ZwYm10IG9yIHZlbmRvci1zcGVj
aWZpYyBhbHRlcm5hdGl2ZXMsCj4gPiBiZWNhdXNlIHRoZSBvcmlnaW5hbCBSSVNDLVYgcHJpdiBz
cGVjIGRvZXMgbm90IGRlZmluZSBtZW1vcnkKPiA+IGF0dHJpYnV0ZXMKPiA+IGluIHBhZ2UgdGFi
bGUgZW50cmllcy4KPiA+IAo+ID4gRm9yIHRoZSBSZW5lc2FzL0FuZGVzIGNhc2UgSSB0aGluayBh
IHBvb2wgaXMgc2V0IGJ5IE9wZW5TQkkgd2l0aAo+ID4gdmVuZG9yLXNwZWNpZmljIE0tbW9kZSBm
YWNpbGl0eSBhbmQgdGhlbiBwYXNzZWQgaW4gRFQsIGFuZCB0aGUgUy0KPiA+IG1vZGUKPiA+ICh3
aGljaCBNTVUgaXMgZW5hYmxlZCBpbikganVzdCBzZWVzIGZpeGVkIG1lbW9yeSBhdHRyaWJ1dGVz
LCBpbgo+ID4gdGhpcwo+ID4gY2FzZSBJIHRoaW5rIERNQV9HTE9CQUxfUE9PTCBpcyBuZWVkZWQu
Cj4gCj4gT2ggd293LCBpcyB0aGF0IHJlYWxseSBhIHRoaW5nPyBJbiB0aGF0IGNhc2UsIGVpdGhl
ciB5b3UganVzdCBjYW4ndCAKPiBzdXBwb3J0IHRoaXMgcGxhdGZvcm0gaW4gYSBtdWx0aS1wbGF0
Zm9ybSBrZXJuZWwsIG9yIHNvbWVvbmUgbmVlZHMgdG8KPiBkbyAKCkVtbW1tIHRodXMgUlovRml2
ZSBzaG91bGQgYGRlcGVuZHMgb24gTk9OUE9SVEFCTEVgPwoKPiBzb21lIGZpZGRseSB3b3JrIGlu
IGRtYS1kaXJlY3QgdG8gYSkgaW50cm9kdWNlIHRoZSBub3Rpb24gb2YgYW4KPiBvcHRpb25hbCAK
PiBnbG9iYWwgcG9vbCwgYW5kIGIpIG1ha2UgaXQgc29tZWhvdyBjb3BlIHdpdGggRE1BX0RJUkVD
VF9SRU1BUCBiZWluZyAKPiBlbmFibGVkIGJ1dCBub24tZnVuY3Rpb25hbC4KPiAKPiBUaGFua3Ms
Cj4gUm9iaW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
