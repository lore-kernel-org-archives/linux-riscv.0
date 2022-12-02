Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 842A9C47088
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 08:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukM4a7xdm6FaBhK3uMj+izA2jTPqA2f6iEUNEDKhK0U=; b=guSsCBb7cBkj5Q
	Im7uXD04bCF1cdVueNzPFMv5XBvknLb/5jB3fI2gqQYxldUSBY9ngLlfFkLlUqtfrYgIwefZTZvxw
	WiUFhVVQu6kVG2Hdjqo5HzXiANEib7OG0Ur8ckqEF3UZMDu6KdIb6C1+HgVxgciLmu52fDGqYp+Yq
	iFkJ3/KXsrrm6J7levcsTj6RPiuHaTqdw6465Ti1cCd2lUUFrHoCOLmuJLOemOmcQLBZ6x0pS59cM
	ISmS+wJi7sF8veozNb0kwqC2qh81+GtQfYgIY7YMYE1tKOe5ZQHhIxxmuy976dxwIxFQNjd5pidpN
	FnQSqdUwzm7AtAvEh76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11VN-00EZYs-H5; Fri, 02 Dec 2022 08:34:45 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11VK-00EZWu-ST; Fri, 02 Dec 2022 08:34:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669970069; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NgtWSF4877or8VUSFEbYKgCJE7v7r6fMA8Y2tfuOhjzTsPe16g5y84jeQrrHye30rwh8OsT72z3hPk/Z/GZ2teMCYXkm9PEPFqyTC8Ah7WuQiIcbxqJyfuAnhJYwnyzh90uisa8McLSYw/7uTBT9xre7IOtv6Qj6YNhWOEVtsNo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669970069; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Bb/2sdCTtx4lJG/AtrjSyYbXRs5Y+VwRBAhs9A9oZqw=; 
	b=AGfljpSdkc1zAYxfKZnaNOi61nXu3pGYykN/gitp8IVueTgqhSCWyIqg46U6nY20sIlOK/b/nl27gyNlIh+uxLLWHPbPwbzi+Mge0HdjXIhKUlEvZ4L2SBEr7Gxxu2F3M7rMsiaxE10YkHrLC17maUbG8ZCzlKGbneKKcahIKlw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669970069;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Bb/2sdCTtx4lJG/AtrjSyYbXRs5Y+VwRBAhs9A9oZqw=;
	b=g2Bvw/BwoXZ7egBpBTRgnc9WUdAJ+SOen8MVZHWPCWdMQk818KBieLtNwHiE6KiA
	FlyUwUjf7RukYk5RRmajMR1QKvMZnxVLacnJNQqCuasGx1Orw/C8M8e90raC9h3Wl3e
	6np07gChYH87U20q83v3SigF9yPVnIjR/BN9ZhmU=
Received: from edelgard.fodlan.icenowy.me (120.85.99.229 [120.85.99.229]) by mx.zohomail.com
	with SMTPS id 1669970067473948.4031125749295; Fri, 2 Dec 2022 00:34:27 -0800 (PST)
Message-ID: <8685fd07e7abd6ed5b0321d9d9ba3abc5a8db2fc.camel@icenowy.me>
Subject: Re: [PATCH v2 12/12] riscv: defconfig: Enable the Allwinner D1
 platform and drivers
From: Icenowy Zheng <uwu@icenowy.me>
To: Guo Ren <guoren@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
  linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor
 Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,  Jisheng Zhang <jszhang@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,  Andre
 Przywara <andre.przywara@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup
 Patel <apatel@ventanamicro.com>,  Atish Patra <atishp@rivosinc.com>,
 Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley
 <conor.dooley@microchip.com>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>, Linus Walleij
 <linus.walleij@linaro.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>
Date: Fri, 02 Dec 2022 16:34:20 +0800
In-Reply-To: <CAJF2gTTOKPAqazF5w03NBzxMW7MGpoCn7vvdj=RabGrzp5WVZQ@mail.gmail.com>
References: <20221125234656.47306-1-samuel@sholland.org>
	 <20221125234656.47306-13-samuel@sholland.org>
	 <CAJF2gTTOKPAqazF5w03NBzxMW7MGpoCn7vvdj=RabGrzp5WVZQ@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_003442_982625_F6336A27 
X-CRM114-Status: GOOD (  17.69  )
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

5ZyoIDIwMjItMTEtMjbmmJ/mnJ/lha3nmoQgMDg6MjQgKzA4MDDvvIxHdW8gUmVu5YaZ6YGT77ya
Cj4gT24gU2F0LCBOb3YgMjYsIDIwMjIgYXQgNzo0NyBBTSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVs
QHNob2xsYW5kLm9yZz4KPiB3cm90ZToKPiA+IAo+ID4gTm93IHRoYXQgc2V2ZXJhbCBEMS1iYXNl
ZCBib2FyZHMgYXJlIHN1cHBvcnRlZCwgZW5hYmxlIHRoZSBwbGF0Zm9ybQo+ID4gaW4KPiA+IG91
ciBkZWZjb25maWcuIEJ1aWxkIGluIHRoZSBkcml2ZXJzIHdoaWNoIGFyZSBuZWNlc3NhcnkgdG8g
Ym9vdCwKPiA+IHN1Y2ggYXMKPiA+IHRoZSBwaW5jdHJsLCBNTUMsIFJUQyAod2hpY2ggcHJvdmlk
ZXMgY3JpdGljYWwgY2xvY2tzKSwgU1BJIChmb3IKPiA+IGZsYXNoKSwKPiA+IGFuZCB3YXRjaGRv
ZyAod2hpY2ggbWF5IGJlIGxlZnQgZW5hYmxlZCBieSB0aGUgYm9vdGxvYWRlcikuIE90aGVyCj4g
PiBjb21tb24KPiA+IG9uYm9hcmQgcGVyaXBoZXJhbHMgYXJlIGVuYWJsZWQgYXMgbW9kdWxlcy4K
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9sbGFuZC5v
cmc+Cj4gPiAtLS0KPiA+IAo+ID4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4gPiAKPiA+IMKgYXJj
aC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyB8IDIzICsrKysrKysrKysrKysrKysrKysrKystCj4g
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4gPiBiL2FyY2gv
cmlzY3YvY29uZmlncy9kZWZjb25maWcKPiA+IGluZGV4IDA1ZmQ1ZmNmMjRmOS4uOGRmZTA1NTBj
MGU2IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gKysr
IGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gQEAgLTI1LDYgKzI1LDcgQEAgQ09O
RklHX0JMS19ERVZfSU5JVFJEPXkKPiA+IMKgQ09ORklHX0VYUEVSVD15Cj4gPiDCoCMgQ09ORklH
X1NZU0ZTX1NZU0NBTEwgaXMgbm90IHNldAo+ID4gwqBDT05GSUdfUFJPRklMSU5HPXkKPiA+ICtD
T05GSUdfQVJDSF9TVU5YST15Cj4gPiDCoENPTkZJR19TT0NfTUlDUk9DSElQX1BPTEFSRklSRT15
Cj4gPiDCoENPTkZJR19TT0NfU0lGSVZFPXkKPiA+IMKgQ09ORklHX1NPQ19TVEFSRklWRT15Cj4g
PiBAQCAtMTE4LDIyICsxMTksMzEgQEAgQ09ORklHX1ZJUlRJT19ORVQ9eQo+ID4gwqBDT05GSUdf
TUFDQj15Cj4gPiDCoENPTkZJR19FMTAwMEU9eQo+ID4gwqBDT05GSUdfUjgxNjk9eQo+ID4gK0NP
TkZJR19TVE1NQUNfRVRIPW0KPiA+IMKgQ09ORklHX01JQ1JPU0VNSV9QSFk9eQo+ID4gwqBDT05G
SUdfSU5QVVRfTU9VU0VERVY9eQo+ID4gK0NPTkZJR19LRVlCT0FSRF9TVU40SV9MUkFEQz1tCj4g
PiDCoENPTkZJR19TRVJJQUxfODI1MD15Cj4gPiDCoENPTkZJR19TRVJJQUxfODI1MF9DT05TT0xF
PXkKPiA+ICtDT05GSUdfU0VSSUFMXzgyNTBfRFc9eQo+ID4gwqBDT05GSUdfU0VSSUFMX09GX1BM
QVRGT1JNPXkKPiA+IMKgQ09ORklHX1ZJUlRJT19DT05TT0xFPXkKPiA+IMKgQ09ORklHX0hXX1JB
TkRPTT15Cj4gPiDCoENPTkZJR19IV19SQU5ET01fVklSVElPPXkKPiA+ICtDT05GSUdfSTJDX01W
NjRYWFg9bQo+ID4gwqBDT05GSUdfU1BJPXkKPiA+IMKgQ09ORklHX1NQSV9TSUZJVkU9eQo+ID4g
K0NPTkZJR19TUElfU1VONkk9eQo+ID4gwqAjIENPTkZJR19QVFBfMTU4OF9DTE9DSyBpcyBub3Qg
c2V0Cj4gPiAtQ09ORklHX0dQSU9MSUI9eQo+ID4gwqBDT05GSUdfR1BJT19TSUZJVkU9eQo+ID4g
K0NPTkZJR19XQVRDSERPRz15Cj4gPiArQ09ORklHX1NVTlhJX1dBVENIRE9HPXkKPiA+ICtDT05G
SUdfUkVHVUxBVE9SPXkKPiA+ICtDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZPTFRBR0U9eQo+ID4g
wqBDT05GSUdfRFJNPW0KPiA+IMKgQ09ORklHX0RSTV9SQURFT049bQo+ID4gwqBDT05GSUdfRFJN
X05PVVZFQVU9bQo+ID4gK0NPTkZJR19EUk1fU1VONEk9bQo+ID4gwqBDT05GSUdfRFJNX1ZJUlRJ
T19HUFU9bQo+ID4gwqBDT05GSUdfRkI9eQo+ID4gwqBDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09M
RT15Cj4gPiBAQCAtMTQ2LDE5ICsxNTYsMzAgQEAgQ09ORklHX1VTQl9PSENJX0hDRD15Cj4gPiDC
oENPTkZJR19VU0JfT0hDSV9IQ0RfUExBVEZPUk09eQo+ID4gwqBDT05GSUdfVVNCX1NUT1JBR0U9
eQo+ID4gwqBDT05GSUdfVVNCX1VBUz15Cj4gPiArQ09ORklHX1VTQl9NVVNCX0hEUkM9bQo+ID4g
K0NPTkZJR19VU0JfTVVTQl9TVU5YST1tCj4gPiArQ09ORklHX05PUF9VU0JfWENFSVY9bQo+ID4g
wqBDT05GSUdfTU1DPXkKPiA+IMKgQ09ORklHX01NQ19TREhDST15Cj4gPiDCoENPTkZJR19NTUNf
U0RIQ0lfUExURk09eQo+ID4gwqBDT05GSUdfTU1DX1NESENJX0NBREVOQ0U9eQo+ID4gwqBDT05G
SUdfTU1DX1NQST15Cj4gPiArQ09ORklHX01NQ19TVU5YST15Cj4gPiDCoENPTkZJR19SVENfQ0xB
U1M9eQo+ID4gK0NPTkZJR19SVENfRFJWX1NVTjZJPXkKPiA+ICtDT05GSUdfRE1BREVWSUNFUz15
Cj4gPiArQ09ORklHX0RNQV9TVU42ST1tCj4gPiDCoENPTkZJR19WSVJUSU9fUENJPXkKPiA+IMKg
Q09ORklHX1ZJUlRJT19CQUxMT09OPXkKPiA+IMKgQ09ORklHX1ZJUlRJT19JTlBVVD15Cj4gPiDC
oENPTkZJR19WSVJUSU9fTU1JTz15Cj4gPiArQ09ORklHX1NVTjhJX0RFMl9DQ1U9bQo+ID4gK0NP
TkZJR19TVU41MElfSU9NTVU9eQo+IERvIHdlIG5lZWQgSU9NTVU/CgpJdCdzIHV0aWxpemVkIGJ5
IHNvbWUgcGVyaXBoZXJhbHMsIGUuZy4gdGhlIGRpc3BsYXkgZW5naW5lLgoKPiAKPiBPdGhlcnM6
Cj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IAo+ID4gwqBDT05G
SUdfUlBNU0dfQ0hBUj15Cj4gPiDCoENPTkZJR19SUE1TR19DVFJMPXkKPiA+IMKgQ09ORklHX1JQ
TVNHX1ZJUlRJTz15Cj4gPiArQ09ORklHX1BIWV9TVU40SV9VU0I9bQo+ID4gK0NPTkZJR19OVk1F
TV9TVU5YSV9TSUQ9eQo+ID4gwqBDT05GSUdfRVhUNF9GUz15Cj4gPiDCoENPTkZJR19FWFQ0X0ZT
X1BPU0lYX0FDTD15Cj4gPiDCoENPTkZJR19FWFQ0X0ZTX1NFQ1VSSVRZPXkKPiA+IC0tCj4gPiAy
LjM3LjQKPiA+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
