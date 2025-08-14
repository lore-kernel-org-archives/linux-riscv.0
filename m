Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91C2CA0EE3
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sshIfmjwNPtwibZUzs+Hdfeh+TOGGgE0avHo58Ims94=; b=sRuvzd2O2xnAOg
	3otelTvaprYgrinjwmvYpsiZCm8lReokQdayiTV1drNCkTaOBcoBq1geoCAhTmuYUkT9NECRTodqG
	qFTRtnnco+nrmEPbPS5B3PNPdfEoPovn2fJROXYw85wLtMpM9G8jN9/3vqXpvG+9hdisHPC4ptCpJ
	7ukQj+aEyPhDx3WUhXKUYTugZf7uGmssuvuMJXBT1lcdgB4nAGlaQ5/5NCgYYVKOSivCPnTCiWeKo
	PScwfZ+euRLbaZ7tCBMfzulkt3bzPPE46qbS09r8aCCwFBxNx5BOoPKEaWLB45dbMpaWJDgTegla/
	GPsy8DQWVcFmKBVGTBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTKq-0000000GFEI-2SFQ;
	Thu, 14 Aug 2025 08:29:20 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSwz-0000000GBqR-3YRz
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 08:04:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755158675; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rb4ombeV9ei2da0W8tsF5zKnNPD7MkNetzD+zYg2mN0IAMeoia6Fs04cycCTUKm0u2luvT4+b+abw5ZLn9nzOOkj6SAMlJG5pd+PvlL41qxrN7WMSGGAw2p6ayEBi02UTj1KDPiAi5P1f3kaVt+oPof9zL2abCaKA8uZP8TRIrM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755158675; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FMmVn36sWG1jpRXXy04zEk9a4w0ZdpUm4kL73V8H7N8=; 
	b=OwtG6yxSMdMQZYm3AgFqgQSs45w8EL8xKkgt1rKTCNrUeou/3QHFDSIldjLfCIIG2zJCIKaQho9YOf4RbPEePlycyda+l/d9zC4iwYSnXgU+wqyfkKo1eodDX4DzF8xw+jrhiK3dn2xwli45+mzY4QGNFxLuBhW7rUQNJ4Jc1fw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755158675;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=FMmVn36sWG1jpRXXy04zEk9a4w0ZdpUm4kL73V8H7N8=;
	b=RRPD7QhEVP4jcWvzvjCWF18xmvpUE+4BpOs5rnpkJc5puWa+up9q2kE1ZGjWrjPZ
	FWW7ZZNHysWowq09w3ToykOEsmWiuZxJm+45pVxLjH0+M9v9s2ouXkUB9Hhm1+g7umN
	In5jJawDo/wEz6mD/4K9zpXcHua3mjCvCwEOJ62526IBokUt8ZC1hR/M+l3Qc3hC9/k
	/FmBFVX1eCetFiZ99YMEJRw9JuLAhUO1Z7FCwPmtZ/x1cSrjgqCxsVdUtmRwi7+gsXj
	D1kdlGUf6A+q7xY955PPWrgc6ttEQrjr420SBSa69hqAVbSMiEHKsaXI2XftjpDaW9i
	grcTDD4wDw==
Received: by mx.zohomail.com with SMTPS id 175515867452093.35323223534306;
	Thu, 14 Aug 2025 01:04:34 -0700 (PDT)
Message-ID: <ec0a7543f9feb5dc096f3030c8b3d73d71834a36.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/4] dt-bindings: firmware: thead,th1520-aon: add a
 mailbox name for SBI
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Drew Fustini
 <fustini@kernel.org>,  Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>, Yao
 Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 14 Aug 2025 16:04:27 +0800
In-Reply-To: <026419bc-c0f8-4891-a348-311f51cb999f@kernel.org>
References: <20250814070757.2267325-1-uwu@icenowy.me>
	 <20250814070757.2267325-3-uwu@icenowy.me>
	 <d0d4c9e7-c350-4996-a53b-09b13bdb9409@kernel.org>
	 <1b63d1872f5b2c89f2fafdf717bda5ec29589b69.camel@icenowy.me>
	 <026419bc-c0f8-4891-a348-311f51cb999f@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_010441_944998_DCEFDBEF 
X-CRM114-Status: GOOD (  18.55  )
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

5ZyoIDIwMjUtMDgtMTTmmJ/mnJ/lm5vnmoQgMDk6NDkgKzAyMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMTQvMDgvMjAyNSAwOTozMCwgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IOWcqCAyMDI1LTA4LTE05pif5pyf5Zub55qEIDA5OjE4ICswMjAw77yMS3J6eXN6dG9mIEtv
emxvd3NraeWGmemBk++8mgo+ID4gPiBPbiAxNC8wOC8yMDI1IDA5OjA3LCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gPiA+IFRoZSBTQkkgZmlybXdhcmUgbWlnaHQgd2FudCB0byBjb21tdW5pY2F0
ZSB0byB0aGUgQU9OIGZpcm13YXJlCj4gPiA+ID4gdG9vLgo+ID4gPiA+IAo+ID4gPiA+IEFkZCBh
IG1ib3gtbmFtZSBpdGVtIHRvIGFsbG93IHRvIGFsbG9jYXRlIGEgbWFpbGJveCBmb3IgU0JJLgo+
ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5
Lm1lPgo+ID4gPiA+IC0tLQo+ID4gPiA+IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdh
cmUvdGhlYWQsdGgxNTIwLWFvbi55YW1swqDCoMKgwqAgfCA3Cj4gPiA+ID4gKysrKy0tLQo+ID4g
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+
ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0Cj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZmlybXdhcmUvdGhlYWQsdGgxNTIwLQo+ID4gPiA+IGFvbi55YW1sCj4gPiA+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZmlybXdhcmUvdGhlYWQsdGgx
NTIwLQo+ID4gPiA+IGFvbi55YW1sCj4gPiA+ID4gaW5kZXggMzM2NTEyNGM3ZmQ0Ny4uNTU1NDY1
ZjRhYWI0ZSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZmlybXdhcmUvdGhlYWQsdGgxNTIwLQo+ID4gPiA+IGFvbi55YW1sCj4gPiA+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUy
MC0KPiA+ID4gPiBhb24ueWFtbAo+ID4gPiA+IEBAIC0yNiwxMSArMjYsMTIgQEAgcHJvcGVydGll
czoKPiA+ID4gPiDCoMKgwqDCoCBjb25zdDogdGhlYWQsdGgxNTIwLWFvbgo+ID4gPiA+IMKgCj4g
PiA+ID4gwqDCoCBtYm94ZXM6Cj4gPiA+ID4gLcKgwqDCoCBtYXhJdGVtczogMQo+ID4gPiA+ICvC
oMKgwqAgbWF4SXRlbXM6IDIKPiA+ID4gCj4gPiA+IAo+ID4gPiBBQkkgYnJlYWsgd2l0aG91dCBl
eHBsYW5hdGlvbiB3aHkgKCJhbGxvdyIgaXMgbm90IGEgcmVhc29uIHRvCj4gPiA+IGFmZmVjdAo+
ID4gPiBBQkkpIGFuZCBpdHMgaW1wYWN0Lgo+ID4gCj4gPiBJcyBhZGRpbmcgaXRlbXMgYW4gQUJJ
IGJyZWFrPwo+IAo+IEFkZGluZyByZXF1aXJlZCBpdGVtcyBpcyBBQkkgYnJlYWsuIFlvdSBjYW4g
ZWFzaWx5IHRlc3QgaXQuIEFwcGx5Cj4gcGF0Y2gKPiAjMSBhbmQgdGVzdCB5b3VyIERUUy4gQXBw
bHkgcGF0Y2ggIzIgYW5kIHRlc3QgeW91ciBEVFMuIE5ldyB3YXJuaW5ncwo+IGFwcGVhciwgc28g
dGhhdCdzIGEgcHJvb2Ygb2YgQUJJIGltcGFjdC4KCkFoIHNvcnJ5IEkgZG9uJ3QgbWVhbiB0aGF0
IGl0ZW0gaXMgcmVxdWlyZWQuCgo+IAo+IAo+ID4gCj4gPiBPciBzaG91bGQgSSBleHBsaWNpdGx5
IHNheSAibWluSXRlbXM6IDEiIGhlcmU/Cj4gCj4gWWVzLCBidXQgeW91IHNob3VsZCBjbGVhcmx5
IGV4cGxhaW4gdGhlIGltcGFjdC4gSXMgaXQgd29ya2luZz8gTm90Cj4gd29ya2luZz8gQXJlIHlv
dSBmaXhpbmcgc29tZXRoaW5nPwoKVGhlIGpzb25zY2hlbWEgZHJhZnQgc2F5cyAiT21pdHRpbmcg
dGhpcyBrZXl3b3JkIGhhcyB0aGUgc2FtZSBiZWhhdmlvcgphcyBhIHZhbHVlIG9mIDAuIiBmb3Ig
bWluSXRlbXMuIFsxXQoKWzFdCmh0dHBzOi8vanNvbi1zY2hlbWEub3JnL2RyYWZ0LzIwMjAtMTIv
anNvbi1zY2hlbWEtdmFsaWRhdGlvbiNzZWN0aW9uLTYuNC4yLTMKCj4gCj4gQmVzdCByZWdhcmRz
LAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
