Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D942AC47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/caS7EeQe2V5g1n8fcG5yIn1jp1rfwf7BlY+/9rmwqw=; b=vJlTy472iOyJi6
	d+40rgeF8h/zs7Pqgteh2SbFwiNoTY+wZihgi5xnWF6WyfbHdJsMXLv3Yl2PlwWjCB8dZkvKFYS6F
	h8Mc409puMzfAxrJligXVSqtidZ+A40XH62973eJs0fwtoeT3bL4fglTnyX+GbmHbO9dggy5Y82fT
	q50epduuNX4Mv3dczKQgIaaiRdL+dRUkR9AYG2S0n6MBgFnUINJ/YZO4dmIKvNepXuDlVHZP1D9GH
	4Yf51Gh/8ni4zBeq1CyLroyVylxktTYC4H20UODfedpuRRuKkEBSeW9aRniamcTezTQY+UZH76OGG
	MnYc6KZdSHMvNUrMqsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy7c-00DEaM-0y;
	Mon, 22 Jan 2024 17:30:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy7Y-00DE2Y-1c;
	Mon, 22 Jan 2024 17:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4s5ASXue467nLReommt3Qb/xh4/CleRrf7HABCgDhAc=; b=k2RTabvplP91YS/X8q/zqV21/0
	qq9DgaiMgmZJiqO3jB55Q9chgwQ35eB1+eA7x7jhEHzaKdet6hSaC52CWHQUgwvG7gkDXSgFaHYat
	F0fK7xJGkii9k+DKttPiUF0xErSZBLXj7z3pTPWSb7ke6hMhA8Q1+WfuHcA4kdmfF4+MTDeWJqrHn
	DKxdjxQtMmdbZ+GjpYGGO2++xFou5Tg1sahLJn3m0tXgnSlLLVFyRoEFSuaMmiAwqWqCQ62AkNjs/
	r8m/fC/O5qBwbiu03pbM8QcCyTyuegbDsHWC+bqv2hZ/QYcKy7OJpQoabZft8xMDIEc6qarES6VyY
	n51mtm7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60388)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rRy5I-0001Gc-2T;
	Mon, 22 Jan 2024 17:27:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rRy5D-0001Bz-Ok; Mon, 22 Jan 2024 17:27:39 +0000
Date: Mon, 22 Jan 2024 17:27:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
Message-ID: <Za6li4NhfvL6x6Vl@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
 <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
 <ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
 <20240122160227.00002d83@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122160227.00002d83@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_093004_557405_47E0169A 
X-CRM114-Status: GOOD (  31.26  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDQ6MDI6MjdQTSArMDAwMCwgSm9uYXRoYW4gQ2FtZXJv
biB3cm90ZToKPiBPbiBNb24sIDE1IEphbiAyMDI0IDExOjA2OjI5ICswMDAwCj4gIlJ1c3NlbGwg
S2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gCj4gPiBPbiBN
b24sIERlYyAxOCwgMjAyMyBhdCAwOToyMjowM1BNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3
cm90ZToKPiA+ID4gT24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2lu
ZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOiAgCj4gPiA+ID4KPiA+ID4gPiBG
cm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+ID4gPgo+ID4gPiA+IEFD
UEkgaGFzIHR3byBkZXNjcmlwdGlvbnMgb2YgQ1BVcywgb25lIGluIHRoZSBNQURUL0FQSUMgdGFi
bGUsIHRoZSBvdGhlcgo+ID4gPiA+IGluIHRoZSBEU0RULiBCb3RoIGFyZSByZXF1aXJlZC4gKEFD
UEkgNi41J3MgOC40ICJEZWNsYXJpbmcgUHJvY2Vzc29ycyIKPiA+ID4gPiBzYXlzICJFYWNoIHBy
b2Nlc3NvciBpbiB0aGUgc3lzdGVtIG11c3QgYmUgZGVjbGFyZWQgaW4gdGhlIEFDUEkKPiA+ID4g
PiBuYW1lc3BhY2UiKS4gSGF2aW5nIHR3byBkZXNjcmlwdGlvbnMgYWxsb3dzIGZpcm13YXJlIGF1
dGhvcnMgdG8gZ2V0Cj4gPiA+ID4gdGhpcyB3cm9uZy4KPiA+ID4gPgo+ID4gPiA+IElmIENQVXMg
YXJlIGRlc2NyaWJlZCBpbiB0aGUgTUFEVC9BUElDLCB0aGV5IHdpbGwgYmUgYnJvdWdodCBvbmxp
bmUKPiA+ID4gPiBlYXJseSBkdXJpbmcgYm9vdC4gT25jZSB0aGUgcmVnaXN0ZXJfY3B1KCkgY2Fs
bHMgYXJlIG1vdmVkIHRvIEFDUEksCj4gPiA+ID4gdGhleSB3aWxsIGJlIGJhc2VkIG9uIHRoZSBE
U0RUIGRlc2NyaXB0aW9uIG9mIHRoZSBDUFVzLiBXaGVuIENQVXMgYXJlCj4gPiA+ID4gbWlzc2lu
ZyBmcm9tIHRoZSBEU0RUIGRlc2NyaXB0aW9uLCB0aGV5IHdpbGwgZW5kIHVwIG9ubGluZSwgYnV0
IG5vdAo+ID4gPiA+IHJlZ2lzdGVyZWQuCj4gPiA+ID4KPiA+ID4gPiBBZGQgYSBoZWxwZXIgdGhh
dCBydW5zIGFmdGVyIGFjcGlfaW5pdCgpIGhhcyBjb21wbGV0ZWQgdG8gcmVnaXN0ZXIKPiA+ID4g
PiBDUFVzIHRoYXQgYXJlIG9ubGluZSwgYnV0IHdlcmVuJ3QgZm91bmQgaW4gdGhlIERTRFQuIEFu
eSBDUFUgdGhhdAo+ID4gPiA+IGlzIHJlZ2lzdGVyZWQgYnkgdGhpcyBjb2RlIHRyaWdnZXJzIGEg
ZmlybXdhcmUtYnVnIHdhcm5pbmcgYW5kIGtlcm5lbAo+ID4gPiA+IHRhaW50Lgo+ID4gPiA+Cj4g
PiA+ID4gUWVtdSBUQ0cgb25seSBkZXNjcmliZXMgdGhlIGZpcnN0IENQVSBpbiB0aGUgRFNEVCwg
dW5sZXNzIGNwdS1ob3RwbHVnCj4gPiA+ID4gaXMgY29uZmlndXJlZC4gIAo+ID4gPiAKPiA+ID4g
U28gd2h5IGlzIHRoaXMgYSBrZXJuZWwgcHJvYmxlbT8gIAo+ID4gCj4gPiBTbyB3aGF0IGFyZSB5
b3UgcHJvcG9zaW5nIHNob3VsZCBiZSB0aGUgYmVoYXZpb3VyIGhlcmU/IFdoYXQgdGhpcwo+ID4g
c3RhdGVtZW50IHNlZW1zIHRvIGJlIHNheWluZyBpcyB0aGF0IFFFTVUgYXMgaXQgZXhpc3RzIHRv
ZGF5IG9ubHkKPiA+IGRlc2NyaWJlcyB0aGUgZmlyc3QgQ1BVIGluIERTRFQuCj4gCj4gVGhpcyBj
b25mdXNlcyBtZSBzb21ld2hhdCwgYmVjYXVzZSBJJ20gZmFyIGZyb20gc3VyZSB3aGljaCBtYWNo
aW5lcyB0aGlzCj4gaXMgdHJ1ZSBmb3IgaW4gUUVNVS4gIEknbSBndWVzc2luZyBpdCdzIGEgbGVn
YWN5IHRoaW5nIHdpdGgKPiBzb21lIG9sZCBkaXN0cm8gdmVyc2lvbiBvZiBRRU1VIC0gc28gd2Un
bGwgaGF2ZSB0byBwYXBlciBvdmVyIGl0IGFueXdheQo+IGJ1dCBmb3IgY3VycmVudCBRRU1VIEkn
bSBub3Qgc3VyZSBpdCdzIHRydWUuCj4gCj4gSGVscGZ1bGx5IHRoZXJlIGFyZSBhIGJ1bmNoIG9m
IEFDUEkgdGFibGUgdGVzdHMgc28gSSd2ZSBiZWVuIGNoZWNraW5nCj4gdGhyb3VnaCBhbGwgdGhl
IG11bHRpIENQVSBjYXNlcy4KPiAKPiBDUFUgaG90cGx1ZyBub3QgZW5hYmxlZC4KPiBwYy9EU0RU
LmRpbW1weG0gIC0gNHggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDQKPiBwYy9EU0RULmFjcGlo
bWF0IC0gMnggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDIKPiBxMzUvRFNEVC5hY3BpaG1hdCAt
IDJ4IFByb2Nlc3NvciBlbnRyaWVzLiAtc21wIDIKPiB2aXJ0L0RTRFQuYWNwaWhtYXR2aXJ0IC0g
NHggQUNQSTAwMDcgZW50cmllcyAtc21wIDQKPiBxMzUvRFNEVC5hY3BpaG1hdC1ub2luaXRpYXRv
ciAtIDQgeCBQcm9jZXNzb3IgKCkgZW50cmllcyAtc21wIDQgCj4gdmlydC9EU0RULnRvcG9sb2d5
IC0gOHggQUNQSTAwMDcgZW50cmllcwo+IAo+IEkndmUgYWxzbyBsb29rZWQgYXQgdGhlIGNvZGUg
YW5kIHdlIGhhdmUgdmFyaW91cyB0eXBlcyBvZgo+IENQVSBob3RwbHVnIG9uIHg4NiBidXQgdGhl
eSBhbGwgYnVpbGQgYXBwcm9wcmlhdGUgbnVtYmVycyBvZgo+IFByb2Nlc3NvcigpIGVudHJpZXMg
aW4gRFNEVC4KPiBBcm0gbGlrZXdpc2Ugc2VlbXMgdG8gYnVpbGQgdGhlIHJpZ2h0IG51bWJlciBv
ZiBBQ1BJMDAwNyBlbnRyaWVzCj4gKGFuZCBkb2Vzbid0IHlldCBoYXZlIENQVSBIUCBzdXBwb3J0
KS4KPiAKPiBJZiBhbnlvbmUgY2FuIGFkZCBhIHJlZmVyZW5jZSBvbiB3aHkgdGhpcyBpcyBuZWVk
ZWQgdGhhdCB3b3VsZCBiZSB2ZXJ5Cj4gaGVscGZ1bC4KCk1heWJlIFNhbGlsIGNhbiBzaGVkIHNv
bWUgbGlnaHQgb24gdGhpcz8KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFy
bWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93
biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
