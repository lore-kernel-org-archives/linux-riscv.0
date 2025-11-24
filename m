Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15884CFA466
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 11:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4I5WTPAtvjwAOyM+8OkB7vtAqqLzzik+LMX67v0VBWA=; b=RHLPjKA5MtDDI8
	P2EnUytzLvyaiPzL4q+nv4TGmNZUlrnI+ikgh411QQbJD6mKItcRkpqt06J60INtCIfHs63UnSujJ
	nSRph7EISdyHMEjidKWl+lEciYaZXNftoPKJFabokTZIzhQpFlFgwmJ406z2okutkIIpKc+Bf9DKd
	XKh0aFBkEvcvUG0PIo7vK5ovgFljuEfaN7fF5EiX0cyIzcI/yo8J0uONatcOyh9pdANlzA1qOImke
	3WmhyFoAmj54iGs5J4+VbzT3o+c6a2vHSyi1qBTVYBUNy073JvVJ5tMusw4Crh40Rcs/5lG6MXoiW
	Je1nrSkEVvAdgkAVEAuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNURV-0000000BWkq-1DwQ;
	Mon, 24 Nov 2025 11:09:13 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNURQ-0000000BWjf-2bcf
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 11:09:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763982543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fHbRXG5zcPi5U3auT3myCfCfZXNeSkv3n4bnbaf+eOjT2X+1+G+7st0tKRfcLBPrIaAiu2KVHPRauFbtOlo2x3hHcBFsMFxHjKW1t08t2xnIApylZzFNWCKVnNpxzdNDIsraEi/dYXty83B9lemwIMPkPzOYuqsNg9kzkwmYqII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763982543; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YDFfcBn0c5x3mM0XZdA1SdYtIMqprY2W/a/3aBZk8eg=; 
	b=OJE+FPDFP+NWe7tR+xtxFeAXVNTm19SlFZXR8DaZgQEKkc0Yfi5r4ERWuB/rFbwMeU4kUnAy0qlQNUzBKecUeVdg7r8emQEFkp436JcN8lpVuTlTKDiRJbnD42kol4Lh4AwD8FChPD+xJM9nx8gTfnLVv+ztUVHiIkOmYTgv/Ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763982543;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=YDFfcBn0c5x3mM0XZdA1SdYtIMqprY2W/a/3aBZk8eg=;
	b=nPZy+YZv09KvfuBaoRJtwgaWZn1QGMcqg/PqQmimGXwagT1tALFQOmcMx2D3G+h5
	4MEkZE81SbnR8cUQvxgYuD13rEJrx0/NXOpFQk2mwr9nnSR2wXbs/ggYT2iSeGTQSI7
	ScThndxBlOcLhPcO2rfOAvheE2z/htwlAo5aKjDDruqgrfnS+VgxEioDOGMtzzv3OIJ
	hvByjHNi79SUFCeemQHvbC0U2Yju/k3K82/QPLdhvNv/+bWK3HhVzNHBwnlXSfFACL3
	RQrxQnnl0NKE/AcB12Fih5gx7jHeLrrg+QteNpAYDu7IyOr6HXbN0KeXkptEcQI0/BX
	QljCT3VPYQ==
Received: by mx.zohomail.com with SMTPS id 1763982541277419.2649646713086;
	Mon, 24 Nov 2025 03:09:01 -0800 (PST)
Message-ID: <1f0885a31e8fd9f4cd667c05fef818c8a38203e7.camel@icenowy.me>
Subject: Re: [PATCH v3 2/2] riscv: dts: starfive: add Orange Pi RV
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>, E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  devicetree@vger.kernel.org, Conor Dooley
 <conor+dt@kernel.org>
Date: Mon, 24 Nov 2025 19:08:55 +0800
In-Reply-To: <20251124-blaming-duplicity-fb1311864b3f@spud>
References: <20251123225059.49665-1-e@freeshell.de>
	 <20251123225059.49665-3-e@freeshell.de>
	 <20251124-blaming-duplicity-fb1311864b3f@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_030908_706738_591FFE2A 
X-CRM114-Status: GOOD (  18.23  )
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

5ZyoIDIwMjUtMTEtMjTmmJ/mnJ/kuIDnmoQgMTE6MDcgKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBTdW4sIE5vdiAyMywgMjAyNSBhdCAwMjo1MDo0NVBNIC0wODAwLCBFIFNoYXR0
b3cgd3JvdGU6Cj4gPiBGcm9tOiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+IAo+
ID4gT3JhbmdlIFBpIFJWIGlzIGEgU0JDIGJhc2VkIG9uIHRoZSBTdGFyRml2ZSBWaXNpb25GaXZl
IDIgYm9hcmQuCj4gPiAKPiA+IE9yYW5nZSBQaSBSViBmZWF0dXJlczoKPiA+IAo+ID4gLSBTdGFy
Rml2ZSBKSDcxMTAgU29DCj4gPiAtIEdiRSBwb3J0IGNvbm5lY3RlZCB0byBKSDcxMTAgR01BQzAg
dmlhIFlUODUzMSBQSFkKPiA+IC0gNHggVVNCIHBvcnRzIHZpYSBWTDgwNSBQQ0llIFVTQiBjb250
cm9sbGVyIGNvbm5lY3RlZCB0byBKSDcxMTAKPiA+IHBjaWUwCj4gPiAtIE0uMiBNLWtleSBzbG90
IGNvbm5lY3RlZCB0byBKSDcxMTAgcGNpZTEKPiA+IC0gSERNSSB2aWRlbyBvdXRwdXQKPiA+IC0g
My41bW0gYXVkaW8gb3V0cHV0Cj4gPiAtIEFtcGFrIEFQNjI1NiBTRElPIFdpLUZpL0JsdWV0b290
aCBtb2R1bGUgb24gbW1jMAo+ID4gLSBtaWNyb1NEIHNsb3Qgb24gbW1jMQo+ID4gLSBTUEkgTk9S
IGZsYXNoIG1lbW9yeQo+ID4gLSAyNGMwMiBFRVBST00gKHJlYWQgb25seSBieSBkZWZhdWx0KQo+
ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+
IFNpZ25lZC1vZmYtYnk6IEUgU2hhdHRvdyA8ZUBmcmVlc2hlbGwuZGU+Cj4gPiAtLS0KPiA+IMKg
YXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqAgfMKg
IDEgKwo+ID4gwqAuLi4vYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW9yYW5nZXBpLXJ2LmR0c8Kg
IHwgNzYKPiA+ICsrKysrKysrKysrKysrKysrKysKPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA3NyBp
bnNlcnRpb25zKCspCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL2poNzExMC1vcmFuZ2VwaS0KPiA+IHJ2LmR0cwo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9NYWtlZmlsZQo+ID4gYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3N0YXJmaXZlL01ha2VmaWxlCj4gPiBpbmRleCA2MmI2NTlmODliYTcuLmQzNGM4
Yzc5YmMxMCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvTWFr
ZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvTWFrZWZpbGUKPiA+
IEBAIC0xMiw2ICsxMiw3IEBAIGR0Yi0kKENPTkZJR19BUkNIX1NUQVJGSVZFKSArPSBqaDcxMTAt
Cj4gPiBkZWVwY29tcHV0aW5nLWZtbDEzdjAxLmR0Ygo+ID4gwqBkdGItJChDT05GSUdfQVJDSF9T
VEFSRklWRSkgKz0gamg3MTEwLW1pbGt2LW1hcnMuZHRiCj4gPiDCoGR0Yi0kKENPTkZJR19BUkNI
X1NUQVJGSVZFKSArPSBqaDcxMTAtbWlsa3YtbWFyc2NtLWVtbWMuZHRiCj4gPiDCoGR0Yi0kKENP
TkZJR19BUkNIX1NUQVJGSVZFKSArPSBqaDcxMTAtbWlsa3YtbWFyc2NtLWxpdGUuZHRiCj4gPiAr
ZHRiLSQoQ09ORklHX0FSQ0hfU1RBUkZJVkUpICs9IGpoNzExMC1vcmFuZ2VwaS1ydi5kdGIKPiA+
IMKgZHRiLSQoQ09ORklHX0FSQ0hfU1RBUkZJVkUpICs9IGpoNzExMC1waW5lNjQtc3RhcjY0LmR0
Ygo+ID4gwqBkdGItJChDT05GSUdfQVJDSF9TVEFSRklWRSkgKz0gamg3MTEwLXN0YXJmaXZlLXZp
c2lvbmZpdmUtMi0KPiA+IHYxLjJhLmR0Ygo+ID4gwqBkdGItJChDT05GSUdfQVJDSF9TVEFSRklW
RSkgKz0gamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi0KPiA+IHYxLjNiLmR0Ygo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW9yYW5nZXBpLXJ2
LmR0cwo+ID4gYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1vcmFuZ2VwaS1y
di5kdHMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjE2
ZWMyNzY3MTM0ZQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zdGFyZml2ZS9qaDcxMTAtb3JhbmdlcGktcnYuZHRzCj4gPiBAQCAtMCwwICsxLDc2IEBACj4g
PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgT1IgTUlUCj4gPiArLyoKPiA+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjUgSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4g
PiArICovCj4gPiArCj4gPiArL2R0cy12MS87Cj4gPiArI2luY2x1ZGUgImpoNzExMC1jb21tb24u
ZHRzaSIKPiA+ICsKPiA+ICsvIHsKPiA+ICvCoMKgwqDCoMKgwqDCoG1vZGVsID0gIlh1bmxvbmcg
T3JhbmdlIFBpIFJWIjsKPiA+ICvCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAieHVubG9uZyxv
cmFuZ2VwaS1ydiIsICJzdGFyZml2ZSxqaDcxMTAiOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKg
LyogVGhpcyByZWd1bGF0b3IgaXMgYWx3YXlzIG9uIGJ5IGhhcmR3YXJlICovCj4gPiArwqDCoMKg
wqDCoMKgwqByZWdfdmNjM3YzX3BjaWU6IHJlZ3VsYXRvci12Y2MzdjMtcGNpZSB7Cj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQi
Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZ3VsYXRvci1uYW1lID0gInZj
YzN2My1wY2llIjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWd1bGF0b3It
bWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4gK8KgwqDCoMKgwqDC
oMKgfTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHdpZmlfcHdyc2VxOiB3aWZpLXB3cnNlcSB7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY29tcGF0aWJsZSA9ICJtbWMtcHdy
c2VxLXNpbXBsZSI7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmVzZXQtZ3Bp
b3MgPSA8JnN5c2dwaW8gNjIgR1BJT19BQ1RJVkVfTE9XPjsKPiA+ICvCoMKgwqDCoMKgwqDCoH07
Cj4gPiArfTsKPiA+ICsKPiA+ICsmZ21hYzAgewo+ID4gK8KgwqDCoMKgwqDCoMKgYXNzaWduZWQt
Y2xvY2tzID0gPCZhb25jcmcgSkg3MTEwX0FPTkNMS19HTUFDMF9UWD47Cj4gPiArwqDCoMKgwqDC
oMKgwqBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZhb25jcmcKPiA+IEpINzExMF9BT05DTEtf
R01BQzBfUk1JSV9SVFg+Owo+ID4gK8KgwqDCoMKgwqDCoMKgc3RhcmZpdmUsdHgtdXNlLXJnbWlp
LWNsazsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+ID4gKwo+
ID4gKyZtbWMwIHsKPiA+ICvCoMKgwqDCoMKgwqDCoCNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4g
K8KgwqDCoMKgwqDCoMKgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArwqDCoMKgwqDCoMKgwqBjYXAt
c2QtaGlnaHNwZWVkOwo+ID4gK8KgwqDCoMKgwqDCoMKgbW1jLXB3cnNlcSA9IDwmd2lmaV9wd3Jz
ZXE+Owo+ID4gK8KgwqDCoMKgwqDCoMKgdm1tYy1zdXBwbHkgPSA8JnJlZ192Y2MzdjNfcGNpZT47
Cj4gPiArwqDCoMKgwqDCoMKgwqB2cW1tYy1zdXBwbHkgPSA8JnZjY18zdjM+Owo+ID4gK8KgwqDC
oMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgYXA2MjU2
OiB3aWZpQDEgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUg
PSAiYnJjbSxiY200MzQ1Ni1mbWFjIiwgImJyY20sYmNtNDMyOS0KPiA+IGZtYWMiOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwxPjsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAvKiBUT0RPOiBvdXQtb2YtYmFuZCBJUlEgb24gR1BJTzIxICovCj4g
Cj4gV2hhdCdzIHVwIHdpdGggdGhpcyBUT0RPPyBXaHkncyB0aGUgZ3BpbyBub3QgaGVyZT8gTWlz
c2luZyBiaW5kaW5nCj4gc3VwcG9ydCwgbWlzc2luZyBkcml2ZXIgc3VwcG9ydD8KCk1pc3Npbmcg
ZHJpdmVyIHN1cHBvcnQgaW4gdGhlIHBpbmN0cmwgZHJpdmVyLgoKPiAKPiA+ICvCoMKgwqDCoMKg
wqDCoH07Cj4gPiArfTsKPiA+ICsKPiA+ICsmbW1jMSB7Cj4gPiArwqDCoMKgwqDCoMKgwqBjZC1n
cGlvcyA9IDwmc3lzZ3BpbyA0MSBHUElPX0FDVElWRV9ISUdIPjsKPiA+ICt9Owo+ID4gKwo+ID4g
KyZwY2llMCB7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAib2theSI7Cj4gPiArfTsKPiA+
ICsKPiA+ICsmcGNpZTEgewo+ID4gK8KgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+ID4g
K307Cj4gPiArCj4gPiArJnBoeTAgewo+ID4gK8KgwqDCoMKgwqDCoMKgcngtaW50ZXJuYWwtZGVs
YXktcHMgPSA8MTUwMD47Cj4gPiArwqDCoMKgwqDCoMKgwqB0eC1pbnRlcm5hbC1kZWxheS1wcyA9
IDwxNTAwPjsKPiA+ICvCoMKgwqDCoMKgwqDCoG1vdG9yY29tbSxyeC1jbGstZHJ2LW1pY3JvYW1w
ID0gPDM5NzA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgbW90b3Jjb21tLHJ4LWRhdGEtZHJ2LW1pY3Jv
YW1wID0gPDI5MTA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgbW90b3Jjb21tLHR4LWNsay1hZGotZW5h
YmxlZDsKPiA+ICvCoMKgwqDCoMKgwqDCoG1vdG9yY29tbSx0eC1jbGstMTAtaW52ZXJ0ZWQ7Cj4g
PiArwqDCoMKgwqDCoMKgwqBtb3RvcmNvbW0sdHgtY2xrLTEwMC1pbnZlcnRlZDsKPiA+ICvCoMKg
wqDCoMKgwqDCoG1vdG9yY29tbSx0eC1jbGstMTAwMC1pbnZlcnRlZDsKPiA+ICt9Owo+ID4gKwo+
ID4gKyZwd21kYWMgewo+ID4gK8KgwqDCoMKgwqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307
Cj4gPiAtLSAKPiA+IDIuNTAuMAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
