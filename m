Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B2C02188
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 20:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sb2pFjB83ZfNFzD0SeJ1wdTZsHxpcPEppTSYjHg6KPg=; b=dnIk67lxB/g30V
	TzybBL7OMHLAPvh1tpYQhjB3klz2j6JO2tSkLXaER3G/ETDBhindF6F1kkO8+ty0By3QCAkA6fiY5
	E5TO9Y7X21BcZdAyTV+XASWB6u3W5XQRUyhBPJQXZ0FiitkQu09jumz9+WJc4L27WpqXX5cBo5mNJ
	j96vH01YqErI5bJRRIbm0oHVwEnAZy7i+8xm1agje1WPbjVdtYd2qp/Xb2tTXNLHgWvAHz3lG0rSE
	esK/+dwbfshBzhd8JJn+3/jhDBGbytRJQHCdN2Ru0/Lo/ce7bSyLHyWK1oTIRNaCPrD0/Xbtoq6o1
	YlSnl57jQvNyWZ7mAvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWpi-0000000G4uf-1hOy;
	Thu, 16 Jan 2025 20:51:18 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWgz-0000000G3qb-3N87
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 20:42:19 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso13925606d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 12:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737060136; x=1737664936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJQkn8xBOrqxhMrTvXO5m4xHY+rpEt1QvLDpaLCQ2xA=;
        b=Hz4D9m4eMz+xpl+j4oDOCHYv32Xjd670zcqpPstNJ99mVmLg0besp4b64O/GyoehS3
         xqM/nz64ITGhIf3BXaywPIBWQFqDjll4fHyFsKprUJmpYOXDZZvvagdvtt8NnuHlXjX8
         nydDoKh3Yp2AxdqcL54xspKw+/U49Ga6n5lI7jx8+oW7TmiMQSa8tFS5YrIO9NuJdtOt
         L1/wpX/JFot8C7snkB6UOUr/Lp5LPMF8MTeU7tWgSWS3xvahrca5Ampw/VtjYlAy3TY6
         uA8ttmSxHAAXpfw1z6+Zf90XovPl7lSSzZAs5rKCqeiWyMQZJnz6vtOcZD3x+AUsxyOt
         b6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737060136; x=1737664936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJQkn8xBOrqxhMrTvXO5m4xHY+rpEt1QvLDpaLCQ2xA=;
        b=DO9zvTDLCZG4DBQp1xsXl830yjvdVc/hlYBQD51PGzwGy+B1yZljrC7lqTicTzjHqx
         qtuvuRDj7xruGXp4Q+wGlSwHxGYZG0jBez4SISwNTMneoEmx3wE4iZsBxqr/7jbc934q
         1sJh1f7CWVrzBAevJVhHfwUm6F+NOA7/Y3zYjt6A/3AoRwikXOza4edGY5Y9TeUKxl9L
         NnQigpc2yUaa7U2/gmOBt2qhGjcra2ZitsczlawrBuoHz2c5NpIyvzKvAir8DU/LUUbC
         rRP0iOYf1pK5T3WcWPrGUAM8RFAa7CnXMlYpl5e+tWDuYWxjLMtOIR1Suv9g6yfUKKks
         9s5g==
X-Forwarded-Encrypted: i=1; AJvYcCWpdTstxWpFNGqgLQI1oyPoeK0AL6pWIK2JX9Tp2t+9HN1xVIbU5qsClydjQ+IDB1VjGzgkiwyr2qchnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmWm9bSN3BTzjiFCIsQpBRPUwAEd2uZs/KA4RGKgnbaw4qD8bm
	7qEo+Co+RCm7pdYVbjMWSG7i3X0gsCjBkJ38XUUfzzI781YpMeyFT0g/TNmFG6qu8UuCRZiwEH/
	nvwvrmuZEsmBv0wC9NG551uGRCy8=
X-Gm-Gg: ASbGncsKhfwK+0W/W0pXqFkXifEuM2Y+enaqjxmeZBj0iaUWbJrk3EbcGbBz+13wUO1
	SNfOreVTNBuyVD2kBvD9F+vPvg0uxySdGzGPt8A==
X-Google-Smtp-Source: AGHT+IHACpWQarwyHqgVFej12h3sZ9v5XSkC82TZvdnRS6/tjJiM7t0IXYSpLP19pAQaJiQBCnassDGmy7JGKAd6wj8=
X-Received: by 2002:a05:6214:240b:b0:6df:97a3:5e76 with SMTP id
 6a1803df08f44-6e1b21d13e5mr4146116d6.27.1737060136243; Thu, 16 Jan 2025
 12:42:16 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop>
 <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com> <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
 <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Thu, 16 Jan 2025 21:42:05 +0100
X-Gm-Features: AbW1kvZkiUy496iMlyaJzvfye_IOgV9RfBQMyk7ZAcKoXtvYI4DmcGkMijbvCWw
Message-ID: <CAKp59VG=MV2=gCFqsC16EpP9oGa=eDBFJbwn-vS5q8oKyM_ZJQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-Vgh
To: Stefano Stabellini <sstabellini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_124217_842268_1F45778A 
X-CRM114-Status: GOOD (  42.98  )
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
Cc: jgross@suse.com, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMTA6MTTigK9QTSBTdGVmYW5vIFN0YWJlbGxpbmkKPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAxNSBKYW4gMjAyNSwgTWls
YW4gxJBva2nEhyB3cm90ZToKPiA+IEhlbGxvIFN0ZWZhbm8sIE9sZWtzaWkKPiA+Cj4gPiBPbiBX
ZWQsIEphbiAxNSwgMjAyNSBhdCA1OjMw4oCvUE0gT2xla3NpaSBLdXJvY2hrbwo+ID4gPG9sZWtz
aWkua3Vyb2Noa29AZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgU3RlZmFubywKPiA+
ID4KPiA+ID4gT24gMS8xNS8yNSAxOjAxIEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4g
PiA+Cj4gPiA+ICtPbGVrc2lpCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgMTQgSmFuIDIwMjUsIE1pbGFu
IERqb2tpYyB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogU2xhdmlzYSBQZXRyb3ZpYyA8U2xhdmlz
YS5QZXRyb3ZpY0BydC1yay5jb20+Cj4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBp
bml0aWFsIHN1cHBvcnQgZm9yIHJ1bm5pbmcgUklTQy1WIGFzIGEgWGVuIGd1ZXN0Lgo+ID4gPiBJ
dCBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5IGluZnJhc3RydWN0dXJlIGFuZCBzdHVicyBmb3IgWGVu
LXNwZWNpZmljCj4gPiA+IG9wZXJhdGlvbnMuIEtleSBjaGFuZ2VzIGluY2x1ZGU6Cj4gPiA+Cj4g
PiA+IC0gTW9kaWZpY2F0aW9ucyB0byB0aGUgUklTQy1WIGtlcm5lbCB0byBpbnRlZ3JhdGUgWGVu
LXNwZWNpZmljIGh5cGVyY2FsbHMKPiA+ID4gICBhbmQgaW50ZXJmYWNlcywgd2l0aCBmdW5jdGlv
biBpbXBsZW1lbnRhdGlvbnMgc3R1YmJlZCBmb3IgZnV0dXJlIHdvcmsuCj4gPiA+IC0gSW50cm9k
dWN0aW9uIG9mIFhlbi1zcGVjaWZpYyBoZWFkZXJzIGZvciBSSVNDLVYsIGluY2x1ZGluZyBldmVu
dAo+ID4gPiAgIGhhbmRsaW5nLCBoeXBlcnZpc29yIGludGVyYWN0aW9uLCBhbmQgcGFnZSBtYW5h
Z2VtZW50LiBGdW5jdGlvbnMgYXJlCj4gPiA+ICAgZGVmaW5lZCBidXQgbm90IHlldCBpbXBsZW1l
bnRlZC4KPiA+ID4gLSBTdHViIGltcGxlbWVudGF0aW9ucyBmb3IgbWVtb3J5IG1hbmFnZW1lbnQs
IGdyYW50IHRhYmxlcywgYW5kIGNvbnRleHQKPiA+ID4gICBzd2l0Y2hpbmcgaW4gdGhlIFhlbiBl
bnZpcm9ubWVudCwgYWxsb3dpbmcgZnVydGhlciBkZXZlbG9wbWVudCBhbmQKPiA+ID4gICBpbnRl
Z3JhdGlvbi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxNaWxhbi5E
am9raWNAcnQtcmsuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTbGF2aXNhIFBldHJvdmljIDxT
bGF2aXNhLlBldHJvdmljQHJ0LXJrLmNvbT4KPiA+ID4KPiA+ID4gSGkgTWlsYW4sIFNsYXZpc2Es
Cj4gPiA+Cj4gPiA+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgY29udHJpYnV0aW9uISBX
aGljaCBYZW4gdHJlZSBhcmUgeW91IHVzaW5nCj4gPiA+IGZvciBkZXZlbG9wbWVudD8KPiA+ID4K
PiA+ID4gVGhleSBhcmUgdXNpbmcgWzFdIGFuZCBoYXZlIHNlcGFyYXRlIGJyYW5jaGVzIG9uIHRv
cCBvZiBsYXRlc3QuIFNvIHdlIGFyZSBpbgo+ID4gPiBzeW5jLiBBbHNvLCBpZiB5b3UgYXJlIGlu
dGVyZXN0ZWQgd2UgaGF2ZSBjcmVhdGVkIGEgdGFzay9lcGljcyBmb3IgdGhpcyBmZWF0dXJlIGlu
Cj4gPiA+IFsxXSBzbyB5b3UgY291bGQgYWxzbyBjaGVjayB0aGVyZSBzb21lIGRldGFpbHM6Cj4g
PiA+IDEuIGh0dHBzOi8vZ2l0bGFiLmNvbS9ncm91cHMveGVuLXByb2plY3QvcGVvcGxlL29sa3Vy
Ly0vZXBpY3MvNQo+ID4gPiAyLiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxl
L29sa3VyL3hlbi8tL2lzc3Vlcy8xMgo+ID4gPgo+ID4gPiAgSSBhbSBhc2tpbmcgYmVjYXVzZSBS
SVNDLVYgc3VwcG9ydCBpbiBYZW4gaXMgc3RpbGwgaW4KPiA+ID4gdGhlIHByb2Nlc3Mgb2YgYmVp
bmcgdXBzdHJlYW1lZCwgYW5kIFsxXSBpcyB0aGUgdHJlZSB0aGF0IGNvbnNvbGlkYXRlcwo+ID4g
PiBhbGwgcGF0Y2hlcyBjdXJyZW50bHkgb24gdGhlIHRvLWJlLXVwc3RyZWFtZWQgbGlzdC4KPiA+
ID4KPiA+ID4gV2hpbGUgdGhlIHNwZWNpZmljIFhlbiB0cmVlIHlvdSBhcmUgdXNpbmcgaXMgbm90
IHBhcnRpY3VsYXJseSBpbXBvcnRhbnQKPiA+ID4gYXQgdGhpcyBzdGFnZSwgYW5kIHVzaW5nIFsx
XSBpcyBub3QgYSByZXF1aXJlbWVudCwgSSBhbSBhc2tpbmcgYmVjYXVzZQo+ID4gPiBpdCBpcyBl
c3NlbnRpYWwgdG8gYWxpZ24gb24gdGhlIGh5cGVydmlzb3IgQUJJLCBlc3BlY2lhbGx5IHJlZ2Fy
ZGluZyBhbnkKPiA+ID4gZGV0YWlscyB0aGF0IGhhdmUgbm90IHlldCBiZWVuIHVwc3RyZWFtZWQu
IFNwZWNpZmljYWxseSwgaXMgdGhlcmUKPiA+ID4gYW55dGhpbmcgaW4gdGhpcyBwYXRjaCBzZXJp
ZXMgdGhhdCByZWxpZXMgb24gZmVhdHVyZXMgbm90IHlldCB1cHN0cmVhbQo+ID4gPiBpbiBYZW4/
Cj4gPiA+Cj4gPiA+IFRoZXJlIGFyZSBmZXcgZmVhdHVyZXMgYnV0IHNvbWUgdGhpbmdzIHdoaWNo
IGFyZSBSdC1UaydzIGJyYW5jaCBpbiBbMV0gY291bGQgZ28KPiA+ID4gd2l0aG91dCB3YWl0aW5n
IGZvciB0aGVzZSBmZWF0dXJlcyB0byBiZSB1cHN0cmVhbWVkLgo+ID4gPgo+ID4gPiBUaGFua3Mu
Cj4gPiA+Cj4gPiA+IH4gT2xla3NpaQo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29t
L3hlbi1wcm9qZWN0L3Blb3BsZS9vbGt1ci94ZW4vLS90cmVlL2xhdGVzdD9yZWZfdHlwZT1oZWFk
cwo+ID4KPiA+IEFzIE9sZWtzaWkgYWxyZWFkeSBleHBsYWluZWQsIHdlIGFyZSB3b3JraW5nIGlu
IHN5bmMgd2l0aCBoaXMgbGF0ZXN0Cj4gPiBicmFuY2ggd2hlcmUgbW9zdCBvZiB0aGUgcmlzYyBw
b3J0IGlzIGRvbmUuCj4KPiBQZXJmZWN0LCBJIHdhcyBob3BpbmcgeW91J2Qgc2F5IHRoYXQhIDot
KQo+IEl0IGlzIGdyZWF0IHRvIGhhdmUgeW91IG9uIGJvYXJkLgo+Cj4KPiA+IEkgd291bGQganVz
dCBhZGQgdGhhdCB0aGlzIHBhdGNoIGludHJvZHVjZXMga2VybmVsIHJpc2MtdiBoeXBlcmNhbGwK
PiA+IHN1cHBvcnQgb24gd2hpY2ggb25seSBvdXIgYnJhbmNoIG9uIHhlbiB0cmVlIGRlcGVuZHMg
b24uIFRoZXJlZm9yZSwgaXQKPiA+IHdvbid0IGRpc3J1cHQgYW55IGZ1bmN0aW9uYWxpdHkgd2l0
aCBjdXJyZW50IHVwc3RyZWFtIFhlbiwgaXQgd2lsbAo+ID4ganVzdCBpbnRyb2R1Y2Uga2VybmVs
IGZ1bmN0aW9uYWxpdHkgd2hpY2ggaXMgbm90IHVzZWQgZnJvbSBYZW4gc2lkZQo+ID4gdW50aWwg
b3VyIGJyYW5jaCBpcyBtZXJnZWQgdXBzdHJlYW0uCj4KPiBJZGVhbGx5LCB3ZSBzaG91bGQgdXBz
dHJlYW0gdGhlIFhlbiBzaWRlIG9mIGFuIGludGVyZmFjZSBmaXJzdCB0byBYZW4sCj4gdGhlbiBh
ZGQgc3VwcG9ydCBmb3IgdGhlIGludGVyZmFjZSB0byBMaW51eC4gTGV0IG1lIG1ha2UgYSBjb25j
cmV0ZQo+IGV4YW1wbGUuIExldCdzIHNheSB0aGF0IHlvdSB1cHN0cmVhbSBoeXBlcmNhbGwgc3Vw
cG9ydCB0byBMaW51eCBmaXJzdCwKPiB1c2luZyBTQklfRUNBTEwgZGVmaW5lZCBhcyAweEUuIFRo
ZW4sIGR1cmluZyB0aGUgdXBzdHJlYW1pbmcgcHJvY2VzcywKPiB0aGUgWGVuIGNvbW11bml0eSBk
ZWNpZGVzIHRvIGNoYW5nZSBTQklfRUNBTEwgdG8gMFhFQTEgdG8gbWFrZSBpdCB0aGUKPiBzYW1l
IGFzIEFSTS4gWW91J2QgaGF2ZSB0byBjaGFuZ2UgdGhlIExpbnV4IGNvZGUgYWdhaW4gdG8gZml4
IGl0LiBUbwo+IGF2b2lkIHRoaXMsIGl0IGlzIGJlc3QgdG8gd2FpdCB1cHN0cmVhbWluZyB0aGUg
TGludXggc2lkZSwgdW50aWwgdGhlIFhlbgo+IHNpZGUgaXMgQWNrZWQuCj4KU3VyZSwgSSBnb3Qg
eW91ciBwb2ludC4gVGhpcyBpcyBhY3R1YWxseSBvbmUgb2YgdGhlIHRoaW5ncyB3ZSB3ZXJlIG5v
dApzdXJlIGFib3V0ICh3aGV0aGVyIHdlIHNob3VsZCB1cHN0cmVhbSBMaW51eCBvciBYZW4gc2lk
ZSBmaXJzdCkuCkFueXdheXMgaXQncyBnb29kIHRoYXQgd2UgZ290IHJldmlldyBjb21tZW50cy4g
V2UnbGwgZml4IHRoaXMgcGF0Y2gKYWNjb3JkaW5nIHRvIHN1Z2dlc3Rpb25zIGFuZCBzZW5kIGl0
IGJhY2sgd2hlbiBYZW4gc2lkZSBpcyB1cHN0cmVhbS4KCj4gVGhpcyB3YXMganVzdCBhbiBleGFt
cGxlLCBhbmQgQW5kcmV3IGlzIHJpZ2h0IHRoYXQgdGhlIFNCSQo+IEltcGxlbWVudGF0aW9uIElE
IGZvciBYZW4gaXMgcmVzZXJ2ZWQgdG8gMHg3LCBzZWUgdGhlIFNCSSBzcGVjaWZpY2F0aW9uLgpZ
ZXMsIHdlIHdlcmUgbm90IGF3YXJlIG9mIGl0LCB0aGFua3MuCgpCUiwKTWlsYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
