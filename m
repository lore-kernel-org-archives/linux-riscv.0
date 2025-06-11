Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14821C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHEbhu50RIZoWVr72b237UMC6yu2v/cUFI4DICSMS1w=; b=1TGCUi7qj8PVXU
	bg39zVPa2hXfKZKPbr1pU/IF8Wmjj5zidjV1CNYpUCOiEyav/g4GIxZaD+/JPXe3wbc+auwLPlHgV
	tg8h3CyALO3o1hIj9RYugRuTKv41cEzHPdKIG/vSgaHRLD/m8JIuvwR6zmV1HuxJ3k00drumHZ4zA
	OaD5U3dpdFPrUM+xX9Au6G4qC5t2Ke6AJrC7G2tKwsm93bBiu3B2snUT58oe/wkuHx18NY0uz3gLu
	m6xVT1X24wU6T2ShRVEEs0BbYb5gzxToTUMhSfHQAEoVhp5+vL3361rKXgIqaf+gh2+iKuRBDASRZ
	pQsvnCBqFFLGuJNAIasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFkt-0000000959K-2QJq;
	Wed, 11 Jun 2025 07:20:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFkr-0000000958x-2rZ3
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:20:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F22FDA51484;
	Wed, 11 Jun 2025 07:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CD6C4CEEE;
	Wed, 11 Jun 2025 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749626412;
	bh=/7F7WpshDjelGHatVoqukDPGIQiPrcJCWYW44DDjwdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OzQBkf+x0narII+HmtYjWGCDN8/DOMdf4UkTkqxLguCdwRjHLR5+rHwNe1cAfZREB
	 9pPCpyuhKjmwtzIzueeRyPw5gAAjv/xdaCTYM9MxqqDtxMmKId5ORA9IlQZDcV/0I7
	 w41ze7A30V5bt0/fPf/sXTv48tG1KawkM9+0GzmoX5Wz8bXUVwRy2T2jN8vSy2tXZ/
	 cRfhKFJyHsomqx59QY39eHhrjtVUzVaIFIxBQx6MjwgoaLTTTKLVWQPmn29dNe3xmO
	 6mG7chv3fwK1VWl9325TmhHvN9LgpFDuGnW9erlb0hUw2KJJ5kKvp4xr9udzZg/Kw+
	 SWh2e0vPAyJZA==
Message-ID: <19dd3d16-aadd-469c-a090-238baba14d4e@kernel.org>
Date: Wed, 11 Jun 2025 09:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add SiFive Domain Management
 controllers
To: Nick Hu <nick.hu@sifive.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, Cyan Yang
 <cyan.yang@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20250611031023.28769-1-nick.hu@sifive.com>
 <20250611031023.28769-2-nick.hu@sifive.com>
 <9c429671-8409-4911-8559-73a069d66964@kernel.org>
 <CAKddAkAyvRdAz9X_rCGgfdxD0Z_Q7sAt8e5nuJe7=s7G-Y3+AQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAKddAkAyvRdAz9X_rCGgfdxD0Z_Q7sAt8e5nuJe7=s7G-Y3+AQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_002013_850554_76B38C3D 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

T24gMTEvMDYvMjAyNSAwOToxNSwgTmljayBIdSB3cm90ZToKPiBPbiBXZWQsIEp1biAxMSwgMjAy
NSBhdCAyOjU34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90
ZToKPj4KPj4gT24gMTEvMDYvMjAyNSAwNToxMCwgTmljayBIdSB3cm90ZToKPj4+IFNpRml2ZSBE
b21haW4gTWFuYWdlbWVudCBjb250cm9sbGVyIGluY2x1ZGVzIHRoZSBmb2xsb3dpbmcgY29tcG9u
ZW50cwo+Pj4gLSBTaUZpdmUgVGlsZSBNYW5hZ2VtZW50IENvbnRyb2xsZXIKPj4+IC0gU2lGaXZl
IENsdXN0ZXIgTWFuYWdlbWVudCBDb250cm9sbGVyCj4+PiAtIFNpRml2ZSBDb3JlIENvbXBsZXgg
TWFuYWdlbWVudCBDb250cm9sbGVyCj4+Pgo+Pj4gVGhlc2UgY29udHJvbGxlcnMgY29udHJvbCB0
aGUgY2xvY2sgYW5kIHBvd2VyIGRvbWFpbiBvZiB0aGUKPj4+IGNvcnJlc3BvbmRpbmcgZG9tYWlu
Lgo+Pj4KPj4+IEhvd2V2ZXIsIFNpbmNlIHdlIGRvbid0IGhhdmUgYSBTb0Mgc3BlY2lmaWMgY29t
cGF0aWJsZSBzdHJpbmcgeWV0LCBzbwo+Pj4gYWRkICctIHt9JyBmb3IgdGhlIGZpcnN0IGVudHJ5
IFsxXVsyXS4KPj4KPj4KPj4gQnV0IHlvdSBtdXN0IGhhdmUgU29jIHNwZWNpZmljIGNvbXBhdGli
bGUgc3RyaW5ncy4gU2VlIHByZXZpb3VzIGRpc2N1c3Npb24uCj4+Cj4gTWF5YmUgSSdtIG1pc3Np
bmcgc29tZXRoaW5nLCBidXQgc2luY2Ugd2UgZG9uJ3QgaGF2ZSBhIFNvQy1zcGVjaWZpYyBjb21w
YXRpYmxlCj4gc3RyaW5nIHlldCwgSSB0aG91Z2h0IHdlIGFncmVlZCB0byBpbmNsdWRlIGEgYC0g
e31gIGFzIHRoZSBmaXJzdAo+IGVudHJ5LCBhbG9uZyB3aXRoIGFuCj4gZXhwbGFuYXRpb24gaW4g
Ym90aCB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGNvbW1lbnRzIFsxXS4KQnV0IHlvdXIgY29tbWl0
IG1zZyBkb2VzIG5vdCBleHBsYWluLiBZb3UgbmVlZCB0byBleHBsYWluIHdoeSB5b3UgZG8gbm90
CmhhdmUgU29DIHNwZWNpZmljIGNvbXBhdGlibGVzLiBTYXlpbmcgIkkgZG8gbm90IGhhdmUgYSBT
b0Mgc3BlY2lmaWMKY29tcGF0aWJsZSIgaXMgbm90IGFuIGFyZ3VtZW50IGV4cGxhaW5pbmcgd2h5
IHlvdSBkbyBub3QgaGF2ZSBTb0MKc3BlY2lmaWMgY29tcGF0aWJsZS4KCkJlc3QgcmVnYXJkcywK
S3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
