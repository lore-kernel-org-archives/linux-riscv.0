Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8045FE7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UajX0hfTsZ1LiOwe7WNXS8pIXwNV+N2bR8nOaFAm6kY=; b=MA3X+P4ucRppzB
	Q9YTbaN8nQoG1LWwM+cE9D//4Et7RujjQQnNTq1G4iPoBBoCbawVkV+/XT+QSEKx7qZhaZkAgR04X
	TRegjZTWU7ReYC2huEvbQEu0o00l1S3/6EBmpiOXc4G/h7NlZalls8BRfawapZ/3zmQpdQ2fm9dok
	Byix8YhHHYvKpZHBhMiELfvPwpenWqxExClvyjFYNNp451xzhXpGUGq4Mahc1JqXwWC2lvRtAgmjI
	rj0zrG6eSR2hv/kDaJwyXjv2CAKdDniGBIIuJG2VHJ9X7x2j2CViYZZZUynuw4Kvp6xvQHzTQ+rFf
	/HzAjFEaLKpIpU7QTIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJQ4-000000054MJ-3CD3;
	Mon, 13 Jan 2025 12:19:48 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJQ1-000000054LA-3se5
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 12:19:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1736770782; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GlmJnh0wJyDrDeO54WDVZREmrXSWXpTgiT2QRaS1g0lgjA7PKBt67+60Ksj4Sb7clUHCXmqdOao8SkEmMdI1dbfl6VQQOa6QJFN6SXxi8XstHhfhmw3UgNbmkbQxhbQYeJXLeBOR2tvWqpHzE2y4US9jZgGVpTXdtJmlXWhPecs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736770782; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yg980IXsItT1ob0TGMGNg+N1u7n0tXM7s7EHT8ZvaOE=; 
	b=EvW23UyJyUUYf2T87/6FrFBZkDk4HrTsi8CGOaBdUFmf+egYHU2aub0buO7ovDMo5D0A03xn0nzfr96YBmGzHNrymi+xJnyfbsLMzX0VftGaQIgyJlf49uI7A1kfmFpkTA21Z9DKxpIrQ1WxTLMHLZQfGwQslTT4v5t9hl0rS54=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736770782;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=yg980IXsItT1ob0TGMGNg+N1u7n0tXM7s7EHT8ZvaOE=;
	b=C/xhGw3Gdf0JU2WhUT6ycBFraS0/yQWo9mYI9JUP1Ap7bRSjybjmxF3RKMpzdZpK
	iKD0H6a25NJ4ACR6ouyx4gKMELMrnK4ax6Vf1jJup31GdQsIgKT+4A/Fq4NVQfC0RL2
	kDRoyGMli7GY0OGIKKEXLBGr9qXbmMzNT60XJmFk=
Received: by mx.zohomail.com with SMTPS id 173677077432099.51494040975774;
	Mon, 13 Jan 2025 04:19:34 -0800 (PST)
Message-ID: <a1386cfb-7698-43f6-acff-628d9626da47@zohomail.com>
Date: Mon, 13 Jan 2025 20:19:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: canaan: Add clock initial support for
 K230
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-3-27b30a2ca52d@zohomail.com>
 <ebj26gfkaypgtvi7o2ab3mfvcgc7yk4scdoxroftlp7lnx3xix@p3nnfiva3hdm>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <ebj26gfkaypgtvi7o2ab3mfvcgc7yk4scdoxroftlp7lnx3xix@p3nnfiva3hdm>
Feedback-ID: rr08011227102e394c4ece469786f9a63f0000268b6dc8886a4bdfe9cfcc1d7509dc8a729330385f8b10a251:zu08011227060641b058f7bd561e629be2000014ba64026e331fba48e2cc9e36c581def167ce43f42c3ee11c:rf0801122c06663dad68cb3878c535246800002ee0df51d8bf8a147c9dbba85400de34851e84c7c0c613b553fb57f1c3a7:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_041946_054968_57796524 
X-CRM114-Status: GOOD (  14.24  )
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

Ck9uIDIwMjUvMS85IDE3OjA5LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIFdlZCwg
SmFuIDA4LCAyMDI1IGF0IDA3OjUzOjA5UE0gKzA4MDAsIFh1a2FpIFdhbmcgd3JvdGU6Cj4+IFRo
aXMgcGF0Y2ggcHJvdmlkZXMgYmFzaWMgc3VwcG9ydCBmb3IgdGhlIEsyMzAgY2xvY2ssIHdoaWNo
IGRvZXMgbm90Cj4+IGNvdmVyIGFsbCBjbG9ja3MuCj4+Cj4+IFRoZSBjbG9jayB0cmVlIG9mIHRo
ZSBLMjMwIFNvQyBjb25zaXN0cyBvZiBPU0MyNE0sCj4+IFBMTHMgYW5kIHN5c2Nsay4KPj4KPj4g
Q28tZGV2ZWxvcGVkLWJ5OiBUcm95IE1pdGNoZWxsIDxUcm95TWl0Y2hlbGw5ODhAZ21haWwuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDxUcm95TWl0Y2hlbGw5ODhAZ21haWwu
Y29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBYdWthaSBXYW5nIDxraW5neHVrYWlAem9ob21haWwuY29t
Pgo+PiAtLS0KPj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMzAuZHRzaSB8IDI3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMzAu
ZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvY2FuYWFuL2syMzAuZHRzaQo+PiBpbmRleCA5NWMx
YTNkOGZiMTE5MmUzMDExM2Q5NmQzZTk2MzI5NTQ1YmM2YWU3Li5jNDA3NDcxYWYzZGFhYzE1NGUw
ZmJkZDM3N2Q1N2VhM2ZmNDY5OGUxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2NhbmFhbi9rMjMwLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9jYW5hYW4vazIz
MC5kdHNpCj4+IEBAIC0zLDYgKzMsNyBAQAo+PiAgICogQ29weXJpZ2h0IChDKSAyMDI0IFlhbmd5
dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+PiAgICovCj4+ICAKPj4gKyNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9rMjMwLWNsay5oPgo+PiAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVy
cnVwdC1jb250cm9sbGVyL2lycS5oPgo+PiAgCj4+ICAvZHRzLXYxLzsKPj4gQEAgLTY1LDYgKzY2
LDEzIEBAIGFwYl9jbGs6IGFwYi1jbGstY2xvY2sgewo+PiAgCQkjY2xvY2stY2VsbHMgPSA8MD47
Cj4+ICAJfTsKPj4gIAo+PiArCW9zYzI0bTogY2xvY2stMjRtIHsKPj4gKwkJY29tcGF0aWJsZSA9
ICJmaXhlZC1jbG9jayI7Cj4+ICsJCSNjbG9jay1jZWxscyA9IDwwPjsKPj4gKwkJY2xvY2stZnJl
cXVlbmN5ID0gPDI0MDAwMDAwPjsKPj4gKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gIm9zYzI0bSI7
Cj4+ICsJfTsKPj4gKwo+PiAgCXNvYyB7Cj4+ICAJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7
Cj4+ICAJCWludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+Owo+PiBAQCAtMTM4LDUgKzE0NiwyNCBA
QCB1YXJ0NDogc2VyaWFsQDkxNDA0MDAwIHsKPj4gIAkJCXJlZy1zaGlmdCA9IDwyPjsKPj4gIAkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICAJCX07Cj4+ICsKPj4gKwkJc3lzY2xrOiBjbG9jay1j
b250cm9sbGVyQDkxMTAwMDAwIHsKPiBEb2VzIG5vdCBsb29rIGxpa2UgcGxhY2VkIGluIGNvcnJl
Y3Qgb3JkZXIuCj4KPj4gKwkJCWNvbXBhdGlibGUgPSAiY2FuYWFuLGsyMzAtY2xrIjsKPj4gKwkJ
CXJlZyA9IDwweDAgMHg5MTEwMjAwMCAweDAgMHgxMDAwPiwgPDB4MCAweDkxMTAwMDAwIDB4MCAw
eDEwMDA+Owo+PiArCQkJY2xvY2tzID0gPCZvc2MyNG0+Owo+PiArCQkJI2Nsb2NrLWNlbGxzID0g
PDE+Owo+PiArCQkJY2xvY2stb3V0cHV0LW5hbWVzID0KPiBVbm5lY2Vzc2FyeSBibGFuayBsaW5l
Cj4KPj4gKwkJCSJDUFUwX0FDTEsiLCAiQ1BVMF9QTElDIiwgIkNQVTBfTk9DX0REUkNQNCIsICJD
UFUwX1BDTEsiLAo+IE1lc3NlZCBpbmRlbnRhdGlvbi9hbGlnbm1lbnQuIFNlZSBEVFMgY29kaW5n
IHN0eWxlLgoKSSd2ZSByZW9yZGVyIHRoZSBwcm9wZXJ0aWVzIGFuZCBjaGFuZ2VkIHRoZSBpbmRl
bnRhdGlvbjoKCm9zYzI0bTogY2xvY2stMjRtIHsKwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJmaXhlZC1jbG9jayI7CsKgwqDCoMKgwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNDAwMDAw
MD47CsKgwqDCoMKgwqDCoMKgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJvc2MyNG0iOwrCoMKgwqDC
oMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MD47Cn07CgpzeXNjbGs6IGNsb2NrLWNvbnRyb2xsZXJA
OTExMDIwMDAgewoKwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJjYW5hYW4sazIzMC1jbGsi
OwrCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4OTExMDIwMDAgMHgwIDB4MTAwMD4sCsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwweDAgMHg5MTEwMDAwMCAweDAgMHgxMDAwPjsKwqDCoMKg
wqDCoMKgwqAgY2xvY2tzID0gPCZvc2MyNG0+OwrCoMKgwqDCoMKgwqDCoCBjbG9jay1vdXRwdXQt
bmFtZXMgPSAiQ1BVMF9BQ0xLIiwgIkNQVTBfUExJQyIsICJDUFUwX05PQ19ERFJDUDQiLArCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiQ1BV
MF9QQ0xLIiwgIlBNVV9QQ0xLIiwgIkhTX0hDTEtfSElHSF9TUkMiLArCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiSFNfSENMS19ISUdIX0dB
VEUiLCAiSFNfSENMS19TUkMiLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAiSFNfU0QwX0hTX0FIQl9HQVQiLCAiSFNfU0QxX0hTX0FIQl9H
QVQiLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAiSFNfU1NJMV9IU19BSEJfR0EiLCAiSFNfU1NJMl9IU19BSEJfR0EiLArCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiSFNfVVNCMF9I
U19BSEJfR0EiLCAiSFNfVVNCMV9IU19BSEJfR0EiLArCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiSFNfU1NJMF9BWEkiLCAiSFNfU1NJMSIs
ICJIU19TU0kyIiwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIkhTX1FTUElfQVhJX1NSQyIsICJIU19TU0kxX0FDTEtfR0FURSIsCsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJIU19T
U0kyX0FDTEtfR0FURSIsICJIU19TRF9DQVJEX1NSQyIsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJIU19TRDBfQ0FSRF9UWCIsICJIU19T
RDFfQ0FSRF9UWCIsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICJIU19TRF9BWElfU1JDIiwgIkhTX1NEMF9BWElfR0FURSIsCsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJIU19TRDFf
QVhJX0dBVEUiLCAiSFNfU0QwX0JBU0VfR0FURSIsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJIU19TRDFfQkFTRV9HQVRFIiwgIkhTX09T
UElfU1JDIiwKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIkhTX1VTQl9SRUZfNTFNIiwgIkhTX1NEX1RJTUVSX1NSQyIsCsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJIU19TRDBfVElN
RVJfR0FURSIsICJIU19TRDFfVElNRVJfR0FURSIsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJIU19VU0IwX1JFRkVSRU5DRSIsICJIU19V
U0IxX1JFRkVSRU5DRSI7CsKgwqDCoMKgwqDCoMKgICNjbG9jay1jZWxscyA9IDwxPjsKfTsKCkRv
ZXMgdGhpcyB1cGRhdGVkIHZlcnNpb24gbG9va3MgYXBwcm9wcmlhdGXvvJ8KCj4KPiBCZXN0IHJl
Z2FyZHMsCj4gS3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
