Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B9BCED61D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 07:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/6ymEvj8k1kGFZ0ahTtghegT98puzptCSOeLVFWn08=; b=yYMG3hJAhK/Tj2
	793Z0vh1Sxt9ouSHZQ5iRIw5LXI1XD8owTpf5ipms176FvbPCBq2wq66NwUCOEqDSMRMaT0tEIHOR
	tAZMjrOd31KTguvJSBAD377ySGBa3KEaO27ZVgskvjDNtQWrTOalF2zTxVz6JpIq6oW4/G1HCxPez
	CJMHBmZ89FkHRDZ/rsLtgyUZ2wUkJOA+mTV49Pqt4W5VB6uYOOuG36jEkQObIMgvUCI5J86nOyO5u
	xnTy1mbC4gf+gAqMgPVLbLbJ0GqYLkNg4LRBdGc9I5Z+JOo8ikFrgrujECzcCEUbeOLtmVsLoG5tV
	ze9X1pbmslgqhgpI/Yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRaD-00000008L93-0SFk;
	Wed, 09 Oct 2024 07:58:09 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRVD-00000008JuS-3KcY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 07:53:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D808D1BF208;
	Wed,  9 Oct 2024 07:52:56 +0000 (UTC)
Message-ID: <c5cd71d1-8779-45d9-965d-8459d060857b@ghiti.fr>
Date: Wed, 9 Oct 2024 09:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
 <3c2ff70d-a580-4bba-b6e2-1b66b0a98c5d@ghiti.fr>
 <811ea10e-3bf1-45a5-a407-c09ec5756b48@canonical.com>
 <2d907c14-5b43-446e-9640-efb0fa0ba385@ghiti.fr>
 <a3308767-eb30-446b-8c70-32b36a3075e4@canonical.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <a3308767-eb30-446b-8c70-32b36a3075e4@canonical.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_005300_121789_A6BD2705 
X-CRM114-Status: GOOD (  16.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkvMTAvMjAyNCAwOTo0NywgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiBPbiAwOS4x
MC4yNCAwOTozNCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+PiBIaSBIZWlucmljaCwKPj4KPj4g
T24gMDEvMTAvMjAyNCAxNzoyNCwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPj4+IE9uIDAx
LjEwLjI0IDE1OjUxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+Pj4gSGkgSGVpbnJpY2gsCj4+
Pj4KPj4+PiBPbiAyOS8wOS8yMDI0IDE2OjAyLCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+
Pj4+PiBUaGUgSU1BR0VfRExMQ0hBUkFDVEVSSVNUSUNTX05YX0NPTVBBVCBpbmZvcm1zIHRoZSBm
aXJtd2FyZSB0aGF0IHRoZQo+Pj4+PiBFRkkgYmluYXJ5IGRvZXMgbm90IHJlbHkgb24gcGFnZXMg
dGhhdCBhcmUgYm90aCBleGVjdXRhYmxlIGFuZAo+Pj4+PiB3cml0YWJsZS4KPj4+Pj4KPj4+Pj4g
VGhlIGZsYWcgaXMgdXNlZCBieSBzb21lIGRpc3RybyB2ZXJzaW9ucyBvZiBHUlVCIHRvIGRlY2lk
ZSBpZiB0aGUgRUZJCj4+Pj4+IGJpbmFyeSBtYXkgYmUgZXhlY3V0ZWQuCj4+Pj4+Cj4+Pj4+IEFz
IHRoZSBMaW51eCBrZXJuZWwgbmVpdGhlciBoYXMgUldYIHNlY3Rpb25zIG5vciBuZWVkcyBSV1gg
cGFnZXMgZm9yCj4+Pj4+IHJlbG9jYXRpb24gd2Ugc2hvdWxkIHNldCB0aGUgZmxhZy4KPj4+Pj4K
Pj4+Pj4gQ2M6IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+Cj4+Pj4+IENjOiA8c3Rh
YmxlQHZnZXIua2VybmVsLm9yZz4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggU2NodWNo
YXJkdCAKPj4+Pj4gPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4KPj4+Pj4gLS0t
Cj4+Pj4+IMKgIGFyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUyB8IDIgKy0KPj4+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMgCj4+Pj4+IGIvYXJj
aC9yaXNjdi9rZXJuZWwvZWZpLSBoZWFkZXIuUwo+Pj4+PiBpbmRleCA1MTViMmRmYmNhNzUuLmM1
ZjE3YzI3MTBiNSAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRl
ci5TCj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VmaS1oZWFkZXIuUwo+Pj4+PiBAQCAt
NjQsNyArNjQsNyBAQCBleHRyYV9oZWFkZXJfZmllbGRzOgo+Pj4+PiDCoMKgwqDCoMKgIC5sb25n
wqDCoMKgIGVmaV9oZWFkZXJfZW5kIC0gX3N0YXJ0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBT
aXplT2ZIZWFkZXJzCj4+Pj4+IMKgwqDCoMKgwqAgLmxvbmfCoMKgwqAgMMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIENoZWNrU3VtCj4+Pj4+IMKgwqDCoMKgwqAgLnNo
b3J0wqDCoMKgIElNQUdFX1NVQlNZU1RFTV9FRklfQVBQTElDQVRJT07CoMKgwqDCoMKgwqDCoCAv
LyBTdWJzeXN0ZW0KPj4+Pj4gLcKgwqDCoCAuc2hvcnTCoMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIERsbENoYXJhY3RlcmlzdGljcwo+Pj4+PiArwqDCoMKg
IC5zaG9ydMKgwqDCoCBJTUFHRV9ETExfQ0hBUkFDVEVSSVNUSUNTX05YX0NPTVBBVMKgwqDCoCAv
LyAKPj4+Pj4gRGxsQ2hhcmFjdGVyaXN0aWNzCj4+Pj4+IMKgwqDCoMKgwqAgLnF1YWTCoMKgwqAg
MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFNpemVPZlN0YWNrUmVz
ZXJ2ZQo+Pj4+PiDCoMKgwqDCoMKgIC5xdWFkwqDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvLyBTaXplT2ZTdGFja0NvbW1pdAo+Pj4+PiDCoMKgwqDCoMKgIC5x
dWFkwqDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBTaXpl
T2ZIZWFwUmVzZXJ2ZQo+Pj4+Cj4+Pj4KPj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgaWYgdGhpcyBm
aXhlcyBzb21ldGhpbmcgb3Igbm90OiB3aGF0IGNvdWxkIGdvIAo+Pj4+IHdyb25nIGlmIHdlIGRv
bid0IGRvIHRoaXM/Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+PiBBbGV4Cj4+Pj4KPj4+Cj4+
Pgo+Pj4gSGVsbG8gQWxleGFuZHJlLAo+Pj4KPj4+IGh0dHBzOi8vbGVhcm4ubWljcm9zb2Z0LmNv
bS9lbi11cy93aW5kb3dzLWhhcmR3YXJlL2RyaXZlcnMvYnJpbmd1cC8gCj4+PiB1ZWZpLWNhLW1l
bW9yeS1taXRpZ2F0aW9uLXJlcXVpcmVtZW50cwo+Pj4gZGVzY3JpYmVzIE1pY3Jvc29mdCdzIGVm
Zm9ydCB0byBpbXByb3ZlIHNlY3VyaXR5IGJ5IGF2b2lkaW5nIG1lbW9yeSAKPj4+IHBhZ2VzIHRo
YXQgYXJlIGJvdGggZXhlY3V0YWJsZSBhbmQgd3JpdGFibGUuCj4+Pgo+Pj4gSU1BR0VfRExMX0NI
QVJBQ1RFUklTVElDU19OWF9DT01QQVQgaXMgYW4gYXNzZXJ0aW9uIGJ5IHRoZSBFRkkgCj4+PiBi
aW5hcnkgdGhhdCBpdCBkb2VzIG5vdCB1c2UgUldYIHBhZ2VzLiBJdCBtYXkgdXNlIHRoZSAKPj4+
IEVGSV9NRU1PUllfQVRUUklCVVRFX1BST1RPQ09MIHRvIHNldCB3aGV0aGVyIGEgcGFnZSBpcyB3
cml0YWJsZSBvciAKPj4+IGV4ZWN1dGFibGUgKGJ1dCBub3QgYm90aCkuCj4+Pgo+Pj4gV2hlbiB1
c2luZyBzZWN1cmUgYm9vdCwgY29tcGxpYW50IGZpcm13YXJlIHdpbGwgbm90IGFsbG93IGxvYWRp
bmcgYSAKPj4+IGJpbmFyeSBpZiB0aGUgZmxhZyBpcyBub3Qgc2V0Lgo+Pgo+Pgo+PiBHcmVhdCwg
c28gdGhhdCdzIGEgbmVjZXNzYXJ5IGZpeCwgaXQgd2lsbCBnZXQgbWVyZ2VkIGluIHRoZSBuZXh0
IHJjIAo+PiBvciBzbzoKPj4KPj4gRml4ZXM6IGNiN2QyZGQ1NjEyYSAoIlJJU0MtVjogQWRkIFBF
L0NPRkYgaGVhZGVyIGZvciBFRkkgc3R1YiIpCj4KPiBUaGFua3MgZm9yIHJldmlld2luZy4KPgo+
IEF0IHRoZSB0aW1lIG9mIGNvbW1pdCBjYjdkMmRkNTYxMmEgKDIwMjAtMTAtMDIpIHRoZSByZXF1
aXJlbWVudCBkaWQgCj4gbm90IGV4aXN0LiBJIGd1ZXNzIGEgRml4ZXM6IHRhZyBpcyBub3QgYXBw
bGljYWJsZSB1bmRlciB0aGVzZSAKPiBjaXJjdW1zdGFuY2VzLgoKCkhtbSBvaywgaW5kZWVkIHRo
YXQgd291bGQgYmUgd2VpcmQgc2luY2UgaXQgaXMgbm90IHRoZSBjdWxwcml0LCBJJ2xsIApyZW1v
dmUgaXQgYW5kIGl0IHdpbGwgc2ltcGx5IGZhaWwgdG8gYXBwbHkgZm9yIGtlcm5lbHMgYmVmb3Jl
IHRoaXMgCmNvbW1pdCwgbm8gYmlnIGRlYWwgSSBndWVzcy4KClRoYW5rcyBhZ2FpbiBIZWlucmlj
aCEKCkFsZXgKCgo+Cj4gQmVzdCByZWdhcmRzCj4KPiBIZWlucmljaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
