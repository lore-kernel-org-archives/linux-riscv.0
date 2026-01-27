Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A7BD2F02A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLAJzuk8jkYOeQvSTnX0IgUGoSbB+ee6YD/oi303nwQ=; b=Ovr6kuqJoh2hnM
	WLAJkKYgp/y1iA2zqbtzPUHeMK0xyIJL371xMOy7ke3cvRrvh3FPk51xLTL7GMKVrV6QxYJxuDqYh
	TCHLz7aqOPgmZbP+k44S+0J2QkSc5RUC/D8l/RWfRDlBfhGG4dqTraMpgWO13eEgmgOLF5jVwAdYX
	1CrGNHP6MlQP6uOQgLXSXOGDVWMv90Ly18mUnNurtzd0dBSRPtFCeef+KzG/xkjD7Z8zH+zJP+JFR
	dXZ3gRcgCSqCtLvbZ4zjsn8BtTGKGTIbWPFpNq+k7H8TNUS4HWswONHvrTm7SYwG8pVLi5PV9KbmR
	wV3vbmjyAod9Qpw/6BOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkj0n-0000000EIci-0gqg;
	Tue, 27 Jan 2026 13:21:41 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkj0l-0000000EIcN-0xVX
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 13:21:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769520096; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n+p9ITehe7iLCcdCXHqjcTteGW+grRub8uFjz2LvFJfo5Taqqa+Bt0ojRtzWwZyGMiJi41GRYA3aSgoHZGdhPQID+0soOgwUn2ww/39aYQ4UQUglXNuy/h42GNDssVEz9sCrQk1c7p8jos3bRYdyNPVndB+0dPZyPRyGojiDTPY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769520096; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=au18OVXzz84BbObn5tg/N4ElDA6wAjL30zw+A8uZLfI=; 
	b=nC8ambVuuehVgYGGQrNUpD6DZpDkhEMmuw1DwWGr9juFuH4VOVfHWgis3wm/211caV6qdmAUmr4ptNV2U42FBRGPz5zFwmZzsddjpIhTcpXe0J4gkOVS+/tn6SI835kZ/898fdOcdwuFfZHOwoIGmGokHe1zCOjyzR8biiiS760=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769520096;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=au18OVXzz84BbObn5tg/N4ElDA6wAjL30zw+A8uZLfI=;
	b=N7gS8ip6JXLb4pdCZCHVgx+FPNguTY4mVxZDS0ERqzg3Tzx+PjRxXFE2eXAZ3Zaw
	5CqAexyJHEFi1/vRqLV1cBHqHNOncZFnZXpBP3IfZvA9Ge+6ph9tKW1ZOZU5bqQQVTg
	ctLuL7m98GUcJYLeUlYflHC5lPRdhWv6SyF+keP4=
Received: by mx.zohomail.com with SMTPS id 17695200885111017.8066507963186;
	Tue, 27 Jan 2026 05:21:28 -0800 (PST)
Message-ID: <6fe3250a-7ca7-418e-9f55-12597aba79ba@zohomail.com>
Date: Tue, 27 Jan 2026 21:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
 <aW3o8xVziqb9iRBN@duge-virtual-machine>
 <bf39fdb8-6698-418b-bd4a-6d8d40ccc9a0@zohomail.com>
 <aXJJ3MjQSq8Rq084@duge-virtual-machine>
 <0af969a7-3579-4303-b302-f171ef02a163@zohomail.com>
 <aXiuDAO7I6urJj09@duge-virtual-machine>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <aXiuDAO7I6urJj09@duge-virtual-machine>
Feedback-ID: rr08011227a425b3b667381810365aabc3000037dba1dbb646afe9a06efa465b5df70dfebe43b8a75d68e24e:zu08011227447b0bc771d9ca025cf244310000f21f616ca4fd2c5a84a096bb6096c09bcf3ee47b112dcfd7c1:rf0801122c1c98ddc0f836bc53b2f7b21000000c8fd550d066760a8096a50cd9ca68e15133f36acc5eeada204e2658190b:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_052139_324276_1C064ABE 
X-CRM114-Status: GOOD (  23.41  )
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

Ck9uIDIwMjYvMS8yNyAyMDoyMiwgSmlheXUgRHUgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMjcsIDIw
MjYgYXQgMDc6MDM6NTlQTSArMDgwMCwgWHVrYWkgV2FuZyB3cm90ZToKPj4gT24gMjAyNi8xLzIz
IDAwOjAxLCBKaWF5dSBEdSB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDIyLCAyMDI2IGF0IDA3OjQw
OjI5UE0gKzA4MDAsIFh1a2FpIFdhbmcgd3JvdGU6Cj4+Pj4gT24gMjAyNi8xLzE5IDE2OjE4LCBK
aWF5dSBEdSB3cm90ZToKPj4+Pj4+ICsKPj4+Pj4+ICtLMjMwX0NMS19HQVRFX0ZPUk1BVChoc19o
Y2xrX3NyY19nYXRlLAo+Pj4+Pj4gKwkJICAgICBLMjMwX0hTX0hDTEtfU1JDX0dBVEUsCj4+Pj4+
PiArCQkgICAgIDB4MTgsIDAsIDAsIDAsCj4+Pj4+PiArCQkgICAgICZoc19oY2xrX2hpZ2hfc3Jj
X3JhdGUuY2xrLmh3KTsKPj4+Pj4gSGVyZSwgeW91IHJlcGxhY2VkIGhzX2hjbGtfaGlnaF9nYXRl
KGluIHY5KSB3aXRoIGhzX2hjbGtfaGlnaF9zcmNfcmF0ZSwKPj4+PiBJJ20gYSBiaXQgY29uZnVz
ZWQsIGFzIEkgZG9uJ3QgcmVjYWxsIG1ha2luZyB0aGVzZSBzcGVjaWZpYyBjaGFuZ2VzLgo+Pj4+
IExvb2tpbmcgYXQgdGhlIGNvZGUgYmVsb3csIHRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB2
OSBhbmQgdjEwIGlzCj4+Pj4gd2l0aGluIHRoZSBLMjMwX0NMS19HQVRFX0ZPUk1BVChoc19oY2xr
X3NyY19nYXRlLCAuLi4pIGRlZmluaXRpb24sIHdoZXJlCj4+Pj4gdGhlIHNlY29uZCBwYXJhbWV0
ZXIgY2hhbmdlZCBmcm9tIDEgdG8gMC4gRXZlcnl0aGluZyBlbHNlIGFwcGVhcnMKPj4+PiBjb25z
aXN0ZW50LiBDb3VsZCB5b3UgY2xhcmlmeSB3aGljaCBjaGFuZ2UgeW91IHdlcmUgcmVmZXJyaW5n
IHRvPwo+Pj4+PiBidXQgYWZ0ZXIgbXkgYm9hcmQgdGVzdCwgSSBmaW5kIHRoYXQgd2hlbiBoc19o
Y2xrX2hpZ2hfZ2F0ZSBpcyB0dXJuZWQKPj4+Pj4gb2ZmLCB0aGUgbW1jL3NkIGFuZCBvdGhlciBo
aWdoLXNwZWVkIHN1YnN5c3RlbXMgY2FuIG5vdCB3b3JrLiBTbyBtYXliZQo+Pj4+PiB5b3Ugc2hv
dWxkIG5vdCBjaGFuZ2UgdGhlIGhzX2hjbGtfaGlnaF9nYXRlIHRvIGhzX2hjbGtfaGlnaF9zcmNf
cmF0ZS4KPj4+PiBSZWdhcmRpbmcgdGhlIGNsb2NrIG1hbmFnZW1lbnQsIEkgcmVjb21tZW5kIGV4
cGxpY2l0bHkgZW5hYmxpbmcKPj4+PiBoc19oY2xrX2hpZ2hfZ2F0ZWFzIGl0IHdpbGwgYmUgY2xv
c2VkIGJ5IGBjbG9zZSB1bnVzZWQgY2xvY2tzYC4KPj4+IFNvcnJ5LCB5b3UgYXJlIHJpZ2h0LiBJ
dCB3YXMgbWUgd2hvIG1hZGUgdGhlIGNoYW5nZXMgbG9jYWxseS4gQW5kIEkKPj4+IHNhdyB5b3Vy
IHJlcGx5IHRvIHRoaXMgZW1haWxbMV0sIHdoaWNoIHlvdSBzYWlkIEFjY29yZGluZyB0byB0aGUg
dmVuZG9yJ3MKPj4+IGNvZGUsIHRoZSBwYXJlbnQgY2xvY2sgb2YgaHNfaGNsa19zcmMgaXMgaHNf
aGNsa19oaWdoX3NyYy4KPj4+Cj4+PiBJbmRlZWQsIHRoZSBwYXJlbnQgY2xvY2sgb2YgaHNfaGNs
a19zcmMgaXMgaHNfaGNsa19oaWdoX3NyYy4gCj4+PiBidXQgaHNfaGNsa19oaWdoX2dhdGUgaXMg
dGhlIGdhdGUgb2YgaHNfaGNsa19oaWdoX3NyYy4gCj4+IE5vLiBJdCBzZWVtcyB0aGVyZSBpcyBz
b21lIGNvbmZ1c2lvbi4gVGhlIGhzX2hjbGtfaGlnaF9zcmMgZG9lcyBub3QgaGF2ZQo+PiBhIGdh
dGUuCj4gSW4gdGhpcyBjb2RlIHNlZ21lbnQgb2YgdGhlIHZlbmRvclsxXSwgaXQgc3RhdGVzIHRo
YXQgaHNfaGNsa19oaWdoIGlzCj4gaW5kZWVkIHRoZSBkb3duc3RyZWFtIGdhdGUgb2YgaHNfaGNs
a19oaWdoX3NyYy4gT25jZSBoc19oY2xrX2hpZ2ggaXMgdHVybmVkCj4gb2ZmLCBhbGwgdGhlIGhp
Z2gtc3BlZWQgcGVyaXBoZXJhbHMgc3VjaCBhcyBVU0IsIE1NQywgYW5kIFNEIHdpbGwgZmFpbC4K
PiBUaGlzIGluZGljYXRlcyB0aGF0IGluIHRoZSBoYXJkd2FyZSwgdGhlIGdhdGUgYml0MSBhY3R1
YWxseSBjb250cm9scyB0aGUKPiBvdmVyYWxsIGNsb2NrIHN3aXRjaCBvZiB0aGUgaGlnaCBzcGVl
ZCBzeXN0ZW0uCj4KPiBJIHVuZGVyc3RhbmQgdGhhdCBoc19zZDAvMV9haGJfZ2F0ZSBzaG91bGQg
YmUgZW5hYmxlZCBkdXJpbmcgdGhlIFNEIGRyaXZlcgo+IHByb2JlLCBhbmQgaHNfdXNiMC8xX2Fo
Yl9nYXRlIHNob3VsZCBiZSBlbmFibGVkIGR1cmluZyB0aGUgVVNCIGRyaXZlciBwcm9iZSwKPiBi
dXQgY3VycmVudGx5IHRoZXJlIGlzIE5PIGNsZWFyIGRyaXZlciB0byBFTkFCTEUgaGlfaGNsa19o
aWdoX2dhdGUuIAo+Cj4gU28gaW4geW91ciBjb2RlLCBJIHRoaW5rIGhzX2hjbGtfaGlnaF9nYXRl
IHNob3VsZCBiZSB0aGUgZ2F0ZSBvZiAKPiBoc19oY2xrX2hpZ2hfc3JjX3JhdGUuIEFuZCBoc19o
Y2xrX2hpZ2hfZ2F0ZSBzaG91bGQgYmUgdGhlIHBhcmVudCBvZgo+IGhzX2hjbGtfc3JjX2dhdGUu
Cj4KPiBsaW5rOiBodHRwczovL2dpdGh1Yi5jb20va2VuZHJ5dGUvazIzMF9zZGsvYmxvYi9tYWlu
L3NyYy9saXR0bGUvbGludXgvYXJjaC9yaXNjdi9ib290L2R0cy9rZW5kcnl0ZS9jbG9ja19wcm92
aWRlci5kdHNpI0w0OTcgWzFdCgpPSywgSSB1bmRlcnN0YW5kdGhlIGlzc3VlIHlvdSBkZXNjcmli
ZWQuIFRoZSBuYW1lc3BhY2UgaW4gdGhlIHZlbmRvcidzCmNvZGUgaXMgcXVpdGUgcG9vcmx5IHN0
cnVjdHVyZWQsIHNvIEkgd2lsbCByZW5hbWUgaHNfaGNsa19oaWdoX3NyYyB0bwpoc19oY2xrX2hp
Z2ggYW5kIGhzX2hjbGtfc3JjIHRvIGhzX2hjbGssIHRvIGJldHRlciByZWZsZWN0IHRoYXQgdGhl
eSBhcmUKcGFydCBvZiB0aGUgc2FtZSBjbG9jay4gVGhlIHVwZGF0ZWQgY2xvY2sgdHJlZSBpcyBh
cyBmb2xsb3dzOgoKwqAgwqAgwqAgaHNfaGNsa19oaWdoX2dhdGUKwqAgwqAgwqAgwqAgwqAgaHNf
aGNsa19oaWdoX3JhdGUKwqAgwqAgwqAgwqAgwqAgwqAgwqBoc19oY2xrX2dhdGUKwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaHNfaGNsa19yYXRlCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aHNfc2QwX2FoYl9nYXRlCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaHNfc2QxX2FoYl9n
YXRlCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaHNfc3NpMV9haGJfZ2F0ZQrCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhzX3NzaTJfYWhiX2dhdGUKwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBoc191c2IwX2FoYl9nYXRlCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
aHNfdXNiMV9haGJfZ2F0ZQoKVGhpcyByZXZpc2lvbiBjbGFyaWZpZXMgYm90aCB0aGUgY2xvY2sg
dHJlZSBzdHJ1Y3R1cmUgYW5kIG5hbWVzcGFjZSwgYW5kCm9uY2UgeW91IGVuYWJsZSBhIGxlYWYg
bm9kZSBpbiB0aGUgY2xvY2sgdHJlZSwgc3VjaCBhcyBoc19zZDBfYWhiX2dhdGUsCnRoZSB0b3At
bGV2ZWwgZ2F0ZSBjbG9jayB3aWxsIGJlIGF1dG9tYXRpY2FsbHkgZW5hYmxlZC4KCj4KPj4gVGhl
IGNsb2NrIHRyZWUgaXMgYXMgZm9sbG93Ogo+Pgo+PiDCoCDCoCDCoCDCoHBsbDBfZGl2NAo+PiDC
oCDCoCDCoCDCoCDCoCBoc19oY2xrX2hpZ2hfc3JjX3JhdGUKPj4gwqAgwqAgwqAgwqAgwqAgwqAg
wqBoc19oY2xrX2hpZ2hfZ2F0ZQo+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoGhzX2hjbGtfc3JjX2dh
dGUKPj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaHNfaGNsa19zcmNfcmF0ZQo+PiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhzX3NkMF9haGJfZ2F0ZQo+PiDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGhzX3NkMV9haGJfZ2F0ZQo+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGhzX3NzaTFfYWhiX2dhdGUKPj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBoc19z
c2kyX2FoYl9nYXRlCj4+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaHNfdXNiMF9haGJf
Z2F0ZQo+PiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGhzX3VzYjFfYWhiX2dhdGUKPj4K
Pj4+IFNvLCB3aGF0IHlvdSBtZWFuIGlzCj4+PiB0aGF0IHlvdSB3aWxsIGFkZCB0aGUgQ0xLX0lT
X0NSSVRJQ0FMIGZsYWcgdG8gdGhlIGhzX2hjbGtfaGlnaF9nYXRlPwo+PiBObywgSSBkb24ndCBp
bnRlbmQgdG8gYWRkIENMS19JU19DUklUSUNBTCBmbGFnLiBJbnN0ZWFkLCBJIHJlY29tbWVuZCB5
b3UKPj4gdG8gZXhwbGljaXRseSBlbmFibGUgdGhlIGNsb2NrIGJ5IHVzaW5nIGNsa19wcmVwYXJl
X2VuYWJsZSBpbiB5b3VyIGRyaXZlci4KPiBJIHRoaW5rIHRoZXJlIGlzIE5PIGNsZWFyIGRyaXZl
ciB0byBFTkFCTEUgaGlfaGNsa19oaWdoX2dhdGUuCj4KPiBSZWdhcmRzLAo+IEppYXl1IER1Cj4K
Pj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8xNTk2MTVkMy1jYzUyLTQzYmUt
YmY2ZC01ZmU3MTdlZjFjYzRAem9ob21haWwuY29tLyBbMV0KPj4+Cj4+PiBSZWdhcmRzLAo+Pj4g
SmlheXUgRHUKPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
