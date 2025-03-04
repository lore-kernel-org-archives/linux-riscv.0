Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BE7C282D3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 08:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5hRkPYekVfdn1sFcV/84PZKWzC97FMCYsndL91NDoM=; b=ucbGW3c78XK4Ib
	rlQp9V5QxKuflvjavi2ogcueMMPxuycQAV4GjRlmMn8RRmpDBWjsLnISxErLux1+KxmgYiJwBh/ET
	WI72O5niW4klLfZbYrEd93v7WzDpaMUrekIYr0MTRgFnapR6Jp2HvIKrNAptiDmlKrzFnYSC85AQo
	Dol1iX48gpsXzHGwszubOqgVYWpvmx46qttN1th8rEdFeXxss655RL6291mzM09w2RB7w/Xjpjqdu
	8OhnLCxx8UT6+sKfHFq5sjfnoWcpxgwzFD9/L2GwkINoDPNsZyAV6mTJWaZBjT6h7CKpTA9jpwlJ1
	RZZCQGZ+qs4kYM+Kp71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNE3-00000003YLw-33vU;
	Tue, 04 Mar 2025 08:02:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMxM-00000003UN6-2gpI
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 07:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D2925C5677;
	Tue,  4 Mar 2025 07:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFAF5C4CEE9;
	Tue,  4 Mar 2025 07:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741074287;
	bh=9bxpUZMc/I1HEv4SLq+lQIM/QZ/o1hTAwys66NHVlqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NRjugh86mZu6/NUJQyJD/KAXr6dzb2sdrCV7inzMKonWGk+8VCLebAzk1ZwF5VEZW
	 JOXLDwCNuoOWHmytXIuINoCPIzuAyld8OFIoSXGgPcWWxKbhHNwBcgk9W8ZLy+RZNA
	 3MrWRXkyDJOrvYfZEowwE7cCuy9/xU3sEzSB1AnFX8beMNuL7sguG3TlVCBngt84R8
	 Vno2FlV4FbHHgetK+/qVsT785mbh1Yr9pM561RHJ/pmWoqOErTNR8wTK6uUypTGHvQ
	 O1s74qQo8vphe8V6Ex1tcbsFhEOZcOEwIt9BfHdCzooRlwqI458jQxAaFUWmo5cmxP
	 h+zRCmlOl/ncQ==
Message-ID: <3190de22-67eb-4f28-b7f1-27bcd8db1e9a@kernel.org>
Date: Tue, 4 Mar 2025 08:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
 <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
 <90d0d409-f374-4e06-bc69-b9bf0622959d@samsung.com>
 <7ba53937-7922-41da-a7ed-909ce620db1f@kernel.org>
 <09411368-cd76-479f-ade3-5a87d3f9be38@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <09411368-cd76-479f-ade3-5a87d3f9be38@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_234448_779398_DC2E1C18 
X-CRM114-Status: GOOD (  13.55  )
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

T24gMDQvMDMvMjAyNSAwODozOCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4gCj4gCj4gT24g
My8zLzI1IDE4OjQzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiAwMy8wMy8yMDI1
IDA5OjM4LCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMi8yMS8yNSAx
MDoxMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+PiBPbiBXZWQsIEZlYiAxOSwgMjAy
NSBhdCAwMzowMjoxOFBNICswMTAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4+Pj4gVGhl
IExpY2hlZVBpIDRBIGJvYXJkLCBmZWF0dXJpbmcgdGhlIFQtSEVBRCBUSDE1MjAgU29DLCBpbmNs
dWRlcyBhbiBJbWFnaW5hdGlvbgo+Pj4+PiBUZWNobm9sb2dpZXMgQlhNLTQtNjQgR1BVLiBJbml0
aWFsIHN1cHBvcnQgZm9yIHRoaXMgR1BVIHdhcyBwcm92aWRlZCB0aHJvdWdoIGEKPj4+Pj4gZG93
bnN0cmVhbSBkcml2ZXIgWzFdLiBSZWNlbnRseSwgZWZmb3J0cyBoYXZlIGJlZW4gbWFkZSB0byB1
cHN0cmVhbSBzdXBwb3J0IGZvcgo+Pj4+PiB0aGUgUm9ndWUgZmFtaWx5IEdQVXMsIHdoaWNoIHRo
ZSBCWE0tNC02NCBpcyBwYXJ0IG9mIFsyXS4KPj4+Pj4KPj4+Pj4gV2hpbGUgdGhlIGluaXRpYWwg
dXBzdHJlYW0gZHJpdmVyIGZvY3VzZWQgb24gdGhlIEFYRS0xLTE2IEdQVSwgbmV3ZXIgcGF0Y2hl
cwo+Pj4+PiBoYXZlIGludHJvZHVjZWQgc3VwcG9ydCBmb3IgdGhlIEJYUy00LTY0IEdQVSBbM10u
IFRoZSBtb2Rlcm4gdXBzdHJlYW0KPj4+Pj4gZHJtL2ltYWdpbmF0aW9uIGRyaXZlciBpcyBleHBl
Y3RlZCB0byBzdXBwb3J0IHRoZSBCWE0tNC02NCBhcyB3ZWxsIFs0XVs1XS4gQXMKPj4+Pj4gdGhp
cyBzdXBwb3J0IGlzIGJlaW5nIGRldmVsb3BlZCwgaXQncyBjcnVjaWFsIHRvIHVwc3RyZWFtIHRo
ZSBuZWNlc3NhcnkgZ2x1ZQo+Pj4+PiBjb2RlIGluY2x1ZGluZyBjbG9jayBhbmQgcG93ZXItZG9t
YWluIGRyaXZlcnMgc28gdGhleSdyZSByZWFkeSBmb3IgaW50ZWdyYXRpb24KPj4+Pj4gd2l0aCB0
aGUgZHJtL2ltYWdpbmF0aW9uIGRyaXZlci4KPj4+Pj4KPj4+Pgo+Pj4+IFRoaXMgaXMgdjUgb2Yg
YmlnIHBhdGNoc2V0IHdoaWNoIGJlY2FtZSBodWdlLiBJIHVuZGVyc3RhbmQgeW91IGRpZCBsaWtl
Cj4+Pj4gdGhhdCBmb3IgdjEgd2hpY2ggd2FzIFJGQy4gQnV0IGl0IHN0b3BwZWQgYmVpbmcgUkZD
Lgo+Pj4+Cj4+Pj4gU3BsaXQgeW91ciBwYXRjaHNldCwga2VlcGluZyB2ZXJzaW9uaW5nIGFuZCBj
aGFuZ2Vsb2csIHBlciBzdWJzeXN0ZW0uCj4+Pgo+Pj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5
4oCUSSBkaWRuJ3QgaGF2ZSBhY2Nlc3MgdG8gZW1haWwuIEkgYWdyZWUgd2l0aAo+Pj4geW91ciBz
dWdnZXN0aW9uIGFuZCB3aWxsIHNlbmQgdGhlIGNsb2NrIGNoYW5nZXMsIGZpcm13YXJlL3Bvd2Vy
IGRvbWFpbiwKPj4+IHJlc2V0LCBhbmQgZHJtL2ltYWdpbmF0aW9uIHVwZGF0ZXMgYXMgc2VwYXJh
dGUgcGF0Y2hzZXRzIGZvciBtZXJnaW5nLgo+Pgo+Pgo+PiBIb3cgZGlkIHlvdSBpbXBsZW1lbnQg
YWJvdmUgY29tbWVudD8gWW91IGRpZCB0aGUgc3BsaXQsIHJpZ2h0PyBXaGVyZSBpcwo+PiB2ZXJz
aW9uaW5nIGFuZCB3aGVyZSBhcmUgY2hhbmdlbG9ncz8KPiAKPiBTbyBJIHRob3VnaHQgdGhlIHN1
Yi1zZXJpZXMgc2hvdWxkIGJlIHZlcnNpb25lZCBpbmRlcGVuZGVudGx5IGZyb20gdjEgPwoKS2Vl
cCB0aGUgdmVyc2lvbmluZy4gS2VlcCB0aGUgY2hhbmdlbG9nLgoKWW91IG5vdyB2ZXJzaW9uZWQg
eW91ciBuZXcgc2V0IGluZGVwZW5kZW50bHksIHNvIEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyCnF1
ZXN0aW9uLgoKPiBUaGVuIGxpbmtlZCB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbnMgaW4gdGhlIGNv
dmVyIGxldHRlciwgd2l0aG91dAo+IGNvcHlpbmcgdGhlbS4KCk5vdGhpbmcgc2FpZCB0aGlzIGlz
IHRoZSBzYW1lIHBhdGNoc2V0LiBZb3UganVzdCBtZW50aW9uZWQgc29tZSAiYmlnZ2VyCnNlcmll
cyIgY292ZXIgbGV0dGVyLiBIb3cgc29tZSBvdGhlciBiaWdnZXIgc2VyaWVzIGlzIGFueWhvdyBy
ZWxhdGVkPwpBbmQgaG93IGNhbiBJIGZpbmQgcmVsZXZhbnQgcGllY2VzIHRoZXJlPwoKWW91IGFy
ZSBzdXBwb3NlZCB0byBtYWtlIGl0IGVhc3kgZm9yIHJldmlld2Vycywgbm90IGRpZmZpY3VsdC4K
CkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
