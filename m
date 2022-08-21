Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDA4C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 06:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5ejPgLeQ6/NPiAX9QHonoIxdN4Vv1PEkXUYvRoK8VU=; b=N9jq9vUaWpMtbV
	pQLs37VglaYV4zUIDpEpvdNciktHGttlfpVl4LTBArtUVVNTOYGgphVLkNxJX2HEzXifVi9ebDQ6L
	TtNVGNch4fESxH4Jj38vwG0G5ijav/9TOnA5qaJCWOo8Ld879j+YqQ9z6LUQNLZsAoC08fDaryOG/
	w4IfY1uS0rMxec7AKnnchKJP3H6okYbHhI8k4UKcxR/Sdk1kLym1m5CzBaJWnW7QRuESCpY/Uw74y
	s7Ldgno6AXNVYoahSYrFUM20P6RDWL1ohqALewg3pg+fktueD0xWZJ+yp68l85CfxYQHvM6rewHbl
	RBLVSGIfxBdXNSKS107Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPeib-006ucU-Ar; Sun, 21 Aug 2022 06:45:57 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPeiX-006uXj-Hx
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 06:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661064338; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bYCJqhi+7nttqyXosZqYm05vspgGmksaihPrm5uAGVuFIqeWwjyfqlFNXC6DeV/imHingbli6MlJ24QDPtYvcfYZLevSmeW7Ke0ypSqUuve/qZ/Md6bDMqL2wNWsCYTTRiowt5OTBr0GBBRATIs/gUZmRprjJOq6NZ2PnJVEpHg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661064338; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=XOgbmExxvrqPcmSB4T3YYmPjxkSvihylwUhZYEypY/o=; 
	b=Z/lj6UjQdvfPjKHhUYCVNBwwb0tVvvwTvcjYn6Fa8ZTUVF0p90qs88jn2NKSkW9AtMNWZS4q6UbxA4py2y1TvnopB+EzNRTWCmwKAsm+haZMTy4bGrsJdss1kXXIQKvNZHFVI6JUxpFhSdM3uFIsjCJjFJXESTMWyI1uppeGzuM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661064338;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XOgbmExxvrqPcmSB4T3YYmPjxkSvihylwUhZYEypY/o=;
	b=OzoilHrmKoD5y7+Yp7rUZt1f2jCBCriC5nIpmcz1YvfpV+Bk5QvJ7OKl8j4Kpmg5
	yI38dBZQzD4SXAxAx2iqyGjtLI3X/6PNTgXxfBQ63uKWdSRjgOOHp/i79SxBLdJ4uQA
	SDsj98NFgYcV3f6nQslenrXyTsxObqi8jl/D/lb8=
Received: from edelgard.icenowy.me (112.94.100.154 [112.94.100.154]) by mx.zohomail.com
	with SMTPS id 1661064334957903.0114134560564; Sat, 20 Aug 2022 23:45:34 -0700 (PDT)
Message-ID: <c6cba83ea9eea7fc41a9e78d0e45487b21f0f560.camel@icenowy.me>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor.Dooley@microchip.com, samuel@sholland.org, andre.przywara@arm.com
Cc: wens@csie.org, jernej.skrabec@gmail.com, linux-sunxi@lists.linux.dev, 
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Date: Sun, 21 Aug 2022 14:45:27 +0800
In-Reply-To: <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
	 <20220815050815.22340-7-samuel@sholland.org>
	 <20220815141159.10edeba5@donnerap.cambridge.arm.com>
	 <3cd9ed5b-8348-38ac-feb1-9a7da858cebc@microchip.com>
	 <932aaefd-e2ca-ef26-bf30-e315fb271ec5@sholland.org>
	 <ff9e8bd3-c5f7-6319-060e-250151087a8e@microchip.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_234553_809280_9D820249 
X-CRM114-Status: GOOD (  29.82  )
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

5ZyoIDIwMjItMDgtMjDmmJ/mnJ/lha3nmoQgMTc6MjkgKzAwMDDvvIxDb25vci5Eb29sZXlAbWlj
cm9jaGlwLmNvbeWGmemBk++8mgo+IE9uIDIwLzA4LzIwMjIgMTg6MjQsIFNhbXVlbCBIb2xsYW5k
IHdyb3RlOgo+ID4gT24gOC8xNS8yMiAxMjowMSBQTSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5j
b23CoHdyb3RlOgo+ID4gPiBPbiAxNS8wOC8yMDIyIDE0OjExLCBBbmRyZSBQcnp5d2FyYSB3cm90
ZToKPiA+ID4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzCj4gPiA+ID4geW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4g
PiA+IAo+ID4gPiA+IE9uIE1vbiwgMTUgQXVnIDIwMjIgMDA6MDg6MDkgLTA1MDAKPiA+ID4gPiBT
YW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4gd3JvdGU6Cj4gPiA+ID4gCj4gPiA+
ID4gSGksCj4gPiA+ID4gCj4gPiA+ID4gdGhhbmtzIGZvciBhbGwgdGhlIGVmZm9ydHMgaW4gZ2V0
dGluZyB0aG9zZSBTb0MgcGVyaXBoZXJhbHMKPiA+ID4gPiBzdXBwb3J0ZWQhCj4gPiA+ID4gCj4g
PiA+ID4gPiBEMSBpcyBhIFNvQyBjb250YWluaW5nIGEgc2luZ2xlLWNvcmUgVC1IRUFEIFh1YW50
aWUgQzkwNiBDUFUsCj4gPiA+ID4gPiBhcyB3ZWxsIGFzCj4gPiA+ID4gPiBvbmUgSGlGaSA0IERT
UC4gVGhlIFNvQyBpcyBiYXNlZCBvbiBhIGRlc2lnbiB0aGF0Cj4gPiA+ID4gPiBhZGRpdGlvbmFs
bHkgY29udGFpbmVkCj4gPiA+ID4gPiBhIHBhaXIgb2YgQ29ydGV4IEE3J3MuIEZvciB0aGF0IHJl
YXNvbiwgc29tZSBwZXJpcGhlcmFscyBhcmUKPiA+ID4gPiA+IGR1cGxpY2F0ZWQuCj4gPiA+ID4g
Cj4gPiA+ID4gU28gYmVjYXVzZSBvZiB0aGlzLCB0aGUgQWxsd2lubmVyIFI1MjggYW5kIFQxMTMg
U29DcyB3b3VsZAo+ID4gPiA+IHNoYXJlIGFsbW9zdAo+ID4gPiA+IGV2ZXJ5dGhpbmcgaW4gdGhp
cyBmaWxlLiBXb3VsZCBpdCBiZSB1c2VmdWwgdG8gYWxyZWFkeSBzcGxpdAo+ID4gPiA+IHRoaXMg
RFQgdXA/Cj4gPiA+ID4gVG8gaGF2ZSBhIGJhc2UgLmR0c2ksIGJhc2ljYWxseSB0aGlzIGZpbGUg
d2l0aG91dCAvY3B1cyBhbmQKPiA+ID4gPiAvc29jL3BsaWMsCj4gPiA+ID4gdGhlbiBoYXZlIGEg
UklTQy1WIHNwZWNpZmljIGZpbGUgd2l0aCBqdXN0IHRob3NlLCBpbmNsdWRpbmcgdGhlCj4gPiA+
ID4gYmFzZT8KPiA+ID4gPiBUaGVyZSBpcyBwcmVjZWRlbmNlIGZvciB0aGlzIGFjcm9zcy1hcmNo
KC1kaXJlY3Rvcmllcykgc2hhcmluZwo+ID4gPiA+IHdpdGggdGhlCj4gPiA+ID4gUmFzcGJlcnJ5
IFBpIGFuZCBBbGx3aW5uZXIgSDMvSDUgU29Dcy4KPiA+ID4gCj4gPiA+IEZvciB0aG9zZSBwbGF5
aW5nIGFsb25nIGF0IGhvbWUsIG9uZSBleGFtcGxlIGlzIHRoZSBhcm02NAo+ID4gPiBiYW5hbmFw
aSBtMgo+ID4gPiBkdHMgd2hpY2ggbG9va3MgbGlrZToKPiA+ID4gPiAvZHRzLXYxLzsKPiA+ID4g
PiAjaW5jbHVkZSAic3VuNTBpLWg1LmR0c2kiCj4gPiA+ID4gI2luY2x1ZGUgInN1bjUwaS1oNS1j
cHUtb3BwLmR0c2kiCj4gPiA+ID4gI2luY2x1ZGUgPGFybS9zdW54aS1iYW5hbmFwaS1tMi1wbHVz
LXYxLjIuZHRzaT4KPiA+ID4gPiAKPiA+ID4gPiAvIHsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
bW9kZWwgPSAiQmFuYW5hIFBpIEJQSS1NMi1QbHVzIHYxLjIgSDUiOwo+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqBjb21wYXRpYmxlID0gImJhbmFuYXBpLGJwaS1tMi1wbHVzLXYxLjIiLAo+ID4gPiA+
ICJhbGx3aW5uZXIsc3VuNTBpLWg1IjsKPiA+ID4gPiB9Owo+ID4gPiAKPiA+ID4gSSB0aGluayB0
aGlzIGlzIGEgcHJldHR5IGdvb2QgaWRlYSwgYW5kIHB1dHRpbmcgaW4gdGhlIG1vZHVsYXJpdHkK
PiA+ID4gdXAKPiA+ID4gZnJvbnQgc2VlbXMgbG9naWNhbCB0byBtZSwgc28gd2hlbiB0aGUgYXJt
IG9uZSBkb2VzIGV2ZW50dWFsbHkKPiA+ID4gZ2V0Cj4gPiA+IGFkZGVkIGl0IGNhbiBiZSBkb25l
IGJ5IG9ubHkgdG91Y2hpbmcgYSBzaW5nbGUgYXJjaC4KPiA+IAo+ID4gVGhpcyBpcyBub3QgZmVh
c2libGUsIGR1ZSB0byB0aGUgZGlmZmVyZW50ICNpbnRlcnJ1cHQtY2VsbHMuIFNlZQo+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FNdUhNZFhIU01jclZPSCt2Y3JkUlJG
K2kyVGtNY0Zpc0d4SE1CUFVFYThuVE1GcHp3QG1haWwuZ21haWwuY29tLwo+ID4gCj4gPiBFdmVu
IGlmIHdlIHNoYXJlIHNvbWUgZmlsZSBhY3Jvc3MgYXJjaGl0ZWN0dXJlcywgeW91IHN0aWxsIGhh
dmUgdG8KPiA+IHVwZGF0ZSBmaWxlcwo+ID4gaW4gYm90aCBwbGFjZXMgdG8gZ2V0IHRoZSBpbnRl
cnJ1cHRzIHByb3BlcnRpZXMgY29ycmVjdC4KPiA+IAo+ID4gSSBnZXQgdGhlIGRlc2lyZSB0byBk
ZWR1cGxpY2F0ZSB0aGluZ3MsIGJ1dCB3ZSBhbHJlYWR5IGRlYWwgd2l0aAo+ID4gdXBkYXRpbmcg
dGhlCj4gPiBzYW1lL3NpbWlsYXIgbm9kZXMgYWNyb3NzIHNldmVyYWwgU29Dcywgc28gdGhhdCBp
cyBub3RoaW5nIG5ldy4gSQo+ID4gdGhpbmsgaXQgd291bGQKPiA+IGJlIG1vcmUgY29uZnVzaW5n
L2NvbXBsaWNhdGVkIHRvIGhhdmUgYWxsIG9mIHRoZSBpbnRlcnJ1cHRzCj4gPiBwcm9wZXJ0aWVz
Cj4gPiBvdmVycmlkZGVuIGluIGEgc2VwYXJhdGUgZmlsZS4KPiAKPiBZZWFoLCBzaG91bGQgbWF5
YmUgaGF2ZSBjaXJjbGVkIGJhY2sgYWZ0ZXIgdGhhdCBjb252ZXJzYXRpb24sIHdvdWxkCj4gaGF2
ZSBiZWVuCj4gbmljZSBidXQgaWYgdGhlIERUQyBjYW4ndCBkbyBpdCBuaWNlbHkgdGhlbiB3L2Uu
CgpXZWxsLCBtYXliZSB3ZSBjYW4gb3ZlcnVzZSB0aGUgZmFjaWxpdHkgb2YgQyBwcmVwcm9jZXNz
b3I/CgplLmcuCgpgYGAKLy8gRm9yIEFSTQojZGVmaW5lIFNPQ19QRVJJUEhFUkFMX0lSUShuKSBH
SUNfU1BJIG4KLy8gRm9yIFJJU0MtVgojZGVmaW5lIFNPQ19QRVJJUEhFUkFMX0lSUShuKSBuCmBg
YAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
