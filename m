Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B7DC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 10:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umSQIo7TjGfvhG5p3gIuiKpqkmk9QtLCxuJCuvk5h7c=; b=Dt2Yvwbio/2Whv
	92MXCotxEsf5km4Gynl5A0X3/PiD0+4WEGZ2AjEWzKePfbA7P9uQEucg+56gozpE6naR6My3ok030
	CDqrpUBnVqGYYUshSqlbeFv08I+QaI2r7Jqin6CCoJM7q/HONnAE7EUy/TujRw1kcY9rpwXEMyF54
	mGPgCIeGvyxaYhd+oWo45YkFg43BQO9+Q2wlOeUAMBy7PHtwYItPOGLXPd51d8EJAsSoAVXll0H2z
	EOyLmLwyD+BeGCGWKBzEkDx3NmBTkHlqerOk+jI09yit1MijOyuNc40ZhDxCJidnmgbXBuDLRpl1H
	a/gxBWkQRyh6z631iPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQjF-000000098qA-3lVH;
	Mon, 12 May 2025 10:49:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQZS-000000097Ui-3Aek
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 10:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E69445C60E5;
	Mon, 12 May 2025 10:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90E3C4CEE7;
	Mon, 12 May 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046381;
	bh=fhsyjR8QFHwu3idQVwqe5ohx0+Dd6OzfwXMSoVUKXA0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VAyEhlsReDz0EnSxSASu6bw+ipNSQ8lfCwiu8sHNERApVSkpIWZMfDx8nOGh3I/cs
	 blSaWM3g/ko4zQo/FA/BqY1n6oSWqFgtXFxyeDG4/AyAg55y7ZgYSxFaJuy7C2+zi9
	 nCS8hhnFU53sGUXjduYo3OEPCA3H8XuUT1ZdU2SMb3iLugG8zKrgB3suS3Doms158D
	 t6H3g5e2n3fbuFhwSnLgBeNuK9OBnpoKYB4JptJJXpUTnQCFZuU14j6lI6lCItUB5G
	 cf0eFWlZThkhrtOdv1g999BplT3LgKNFIuDypfkeK9678cb9ssETjUd4Oy93Jei2yG
	 3uJchDiuxQ2ZQ==
Message-ID: <bd001136-eb48-44f0-8724-09eeb022df8e@kernel.org>
Date: Mon, 12 May 2025 12:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management
 controllers
To: Nick Hu <nick.hu@sifive.com>
Cc: Cyan Yang <cyan.yang@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
References: <20250509021605.26764-1-nick.hu@sifive.com>
 <20250509-small-graceful-limpet-d0ea41@kuoka>
 <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAKddAkAzDGL-7MbroRqQnZzPXOquUMKNuGGppqB-d_XZXbcvBA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_033942_889469_FC6C4C40 
X-CRM114-Status: GOOD (  13.62  )
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

T24gMTIvMDUvMjAyNSAwNToyMCwgTmljayBIdSB3cm90ZToKPiBPbiBGcmksIE1heSA5LCAyMDI1
IGF0IDI6NDDigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pgo+PiBPbiBGcmksIE1heSAwOSwgMjAyNSBhdCAxMDoxNjowNEFNIEdNVCwgTmljayBIdSB3
cm90ZToKPj4+IFNpRml2ZSBEb21haW4gTWFuYWdlbWVudCBjb250cm9sbGVyIGluY2x1ZGVzIHRo
ZSBmb2xsb3dpbmcgY29tcG9uZW50cwo+Pj4gLSBTaUZpdmUgVGlsZSBNYW5hZ2VtZW50IENvbnRy
b2xsZXIKPj4+IC0gU2lGaXZlIENsdXN0ZXIgTWFuYWdlbWVudCBDb250cm9sbGVyCj4+PiAtIFNp
Rml2ZSBDb3JlIENvbXBsZXggTWFuYWdlbWVudCBDb250cm9sbGVyCj4+Pgo+Pj4gVGhlc2UgY29u
dHJvbGxlcnMgY29udHJvbCB0aGUgY2xvY2sgYW5kIHBvd2VyIGRvbWFpbiBvZiB0aGUKPj4+IGNv
cnJlc3BvbmRpbmcgZG9tYWluLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2su
aHVAc2lmaXZlLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4KPj4+IC0tLQo+Pj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bv
d2VyL3NpZml2ZSx0bWMueWFtbCB8IDg5ICsrKysrKysrKysrKysrKysrKysKPj4KPj4gV2hlcmUg
aXMgYSBwYXRjaCB3aXRoIHRoZSBkcml2ZXIgKHVzZXIgb2YgdGhlIGJpbmRpbmcpPwo+Pgo+IFdl
IGFyZSBob3BpbmcgdGhlIGRyaXZlciBjYW4gYmUgc3VibWl0dGVkIGF0IGEgbGF0ZXIgc3RhZ2Uu
Cj4gVGhlIGRyaXZlciB0aGF0IGhhbmRsZXMgdGhlIE1NSU8gaXMgaW1wbGVtZW50ZWQgaW4gT3Bl
blNCSSBhbmQgZGVwZW5kcwo+IG9uIHNvbWUgcHJlcmVxdWlzaXRlIHBhdGNoZXMgWzFdLCBzbyBp
dCB3aWxsIGZvbGxvdyBhZnRlcndhcmQuCgpUaGlzIHBhdGNoIGFsb25lIG1ha2VzIGxpdHRsZSBz
ZW5zZSBhbmQgYnJpbmdzIGxpdHRsZSBiZW5lZml0LiBQb3N0IHRoaXMKd2l0aCB1c2VyLgoKLi4u
Cgo+Pj4gKyAgcmVnOgo+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4gKwo+Pj4gKyAgc2lmaXZlLGZl
YXR1cmUtbGV2ZWw6Cj4+PiArICAgIGRlc2NyaXB0aW9uOiB8Cj4+PiArICAgICAgU3VwcG9ydGVk
IHBvd2VyIGZlYXR1cmVzLiBUaGlzIHByb3BlcnR5IGlzIGFic2VudCBpZiB0aGUgZnVsbCBzZXQg
b2YgZmVhdHVyZXMKPj4+ICsgICAgICBpcyBzdXBwb3J0ZWQKPj4KPj4gQ29tcGF0aWJsZSBkZWZp
bmVzIHRoaXMuIERyb3AuCj4+Cj4gVGhlIHByb3BlcnR5IGRlcGVuZHMgb24gaG93IHRoZSBJUCBp
cyBob29rZWQgdXAgdG8gdGhlIHJlc3Qgb2YgdGhlIFNvQy4KPiBIYXZpbmcgdGhpcyBwcm9wZXJ0
eSBzaW1wbGlmaWVzIHRoZSBTVyBhbmQgYWxsb3dzIHVzIHRvIHVzZSBhIHNpbmdsZQo+IGZhbGxi
YWNrIGNvbXBhdGlibGUgc3RyaW5nLCBzbyB3ZSBwcmVmZXIgdG8ga2VlcCBpdC4KCkFuZCB3ZSBw
cmVmZXIgeW91IHRvIGZvbGxvdyBzdGFuZGFyZCBEVCBydWxlcywgc2VlIHdyaXRpbmcgYmluZGlu
Z3Mgb3IKdGFsa3Mgb24gY29uZmVyZW5jZXMuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
