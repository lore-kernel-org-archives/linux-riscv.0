Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB9EC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NiH7TCRyduCCJ5XsqQ7gLTVWnMdnx+pxgptMVF0aau0=; b=w9kDcCHljdiQJA
	f26Iv1hL3iCBprZIZTRkNNlDsDQ55jW9Qg67h1/03uUv6p1TcHvUGou+mEWpK6E1ey00Cl6VRPXYG
	p6wBNzF211eehsizH7iassVFfJK7WnBVWiKrq2rLBAxxteFhwlXqMe5mfOtGP9atPNDsicxPhvRZ6
	SiIjT87YEslOixU/rHHtmCILkcYv33agK/TmuXjDG3hsvPlFWWyvTOgmoldjrOuRJV+0HF4zDROLO
	ZP4EJdEp7PiI6mhJOgCdd6MM92AGiyX0Vj0FS0YLKPThtWxtBbABfa1oRN18Usci3ToJyBqtjc9Pt
	m/6s+nqDu4GAFwYQgySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURJ1-0000000Cksz-1NJN;
	Mon, 29 Jan 2024 13:04:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rURIx-0000000Ckrl-1eMh;
	Mon, 29 Jan 2024 13:04:05 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TNpM75yZdz6K9JK;
	Mon, 29 Jan 2024 21:00:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F10A140A1B;
	Mon, 29 Jan 2024 21:03:55 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Jan
 2024 13:03:54 +0000
Date: Mon, 29 Jan 2024 13:03:54 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>,
	<acpica-devel@lists.linuxfoundation.org>, <linux-csky@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, <jianyong.wu@arm.com>,
	<justin.he@arm.com>, James Morse <james.morse@arm.com>,
	<vishnu@os.amperecomputing.com>, <miguel.luis@oracle.com>
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
Message-ID: <20240129130354.0000042b@Huawei.com>
In-Reply-To: <20240123092725.00004382@Huawei.com>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
	<CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
	<ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
	<20240122160227.00002d83@Huawei.com>
	<CAJZ5v0hamuXJ_w-TSmVb=5jGide=Lb7sCjbzzNb_rFuPrvkgxQ@mail.gmail.com>
	<Za6mHRJVjb6M1mun@shell.armlinux.org.uk>
	<20240123092725.00004382@Huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_050403_764410_3320F0B2 
X-CRM114-Status: GOOD (  48.13  )
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

T24gVHVlLCAyMyBKYW4gMjAyNCAwOToyNzoyNSArMDAwMApKb25hdGhhbiBDYW1lcm9uIDxKb25h
dGhhbi5DYW1lcm9uQEh1YXdlaS5jb20+IHdyb3RlOgoKPiBPbiBNb24sIDIyIEphbiAyMDI0IDE3
OjMwOjA1ICswMDAwCj4gIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4Lm9y
Zy51az4gd3JvdGU6Cj4gCj4gPiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAwNToyMjo0NlBNICsw
MTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZTogIAo+ID4gPiBPbiBNb24sIEphbiAyMiwgMjAy
NCBhdCA1OjAy4oCvUE0gSm9uYXRoYW4gQ2FtZXJvbgo+ID4gPiA8Sm9uYXRoYW4uQ2FtZXJvbkBo
dWF3ZWkuY29tPiB3cm90ZTogICAgCj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIDE1IEphbiAyMDI0
IDExOjA2OjI5ICswMDAwCj4gPiA+ID4gIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFy
bWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+ID4gICAgCj4gPiA+ID4gPiBPbiBNb24sIERlYyAx
OCwgMjAyMyBhdCAwOToyMjowM1BNICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZTogICAg
Cj4gPiA+ID4gPiA+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDE6NDnigK9QTSBSdXNzZWxsIEtp
bmcgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZTogICAgCj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEFDUEkgaGFzIHR3byBkZXNjcmlwdGlvbnMgb2YgQ1BV
cywgb25lIGluIHRoZSBNQURUL0FQSUMgdGFibGUsIHRoZSBvdGhlcgo+ID4gPiA+ID4gPiA+IGlu
IHRoZSBEU0RULiBCb3RoIGFyZSByZXF1aXJlZC4gKEFDUEkgNi41J3MgOC40ICJEZWNsYXJpbmcg
UHJvY2Vzc29ycyIKPiA+ID4gPiA+ID4gPiBzYXlzICJFYWNoIHByb2Nlc3NvciBpbiB0aGUgc3lz
dGVtIG11c3QgYmUgZGVjbGFyZWQgaW4gdGhlIEFDUEkKPiA+ID4gPiA+ID4gPiBuYW1lc3BhY2Ui
KS4gSGF2aW5nIHR3byBkZXNjcmlwdGlvbnMgYWxsb3dzIGZpcm13YXJlIGF1dGhvcnMgdG8gZ2V0
Cj4gPiA+ID4gPiA+ID4gdGhpcyB3cm9uZy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IElm
IENQVXMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgTUFEVC9BUElDLCB0aGV5IHdpbGwgYmUgYnJvdWdo
dCBvbmxpbmUKPiA+ID4gPiA+ID4gPiBlYXJseSBkdXJpbmcgYm9vdC4gT25jZSB0aGUgcmVnaXN0
ZXJfY3B1KCkgY2FsbHMgYXJlIG1vdmVkIHRvIEFDUEksCj4gPiA+ID4gPiA+ID4gdGhleSB3aWxs
IGJlIGJhc2VkIG9uIHRoZSBEU0RUIGRlc2NyaXB0aW9uIG9mIHRoZSBDUFVzLiBXaGVuIENQVXMg
YXJlCj4gPiA+ID4gPiA+ID4gbWlzc2luZyBmcm9tIHRoZSBEU0RUIGRlc2NyaXB0aW9uLCB0aGV5
IHdpbGwgZW5kIHVwIG9ubGluZSwgYnV0IG5vdAo+ID4gPiA+ID4gPiA+IHJlZ2lzdGVyZWQuCj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBZGQgYSBoZWxwZXIgdGhhdCBydW5zIGFmdGVyIGFj
cGlfaW5pdCgpIGhhcyBjb21wbGV0ZWQgdG8gcmVnaXN0ZXIKPiA+ID4gPiA+ID4gPiBDUFVzIHRo
YXQgYXJlIG9ubGluZSwgYnV0IHdlcmVuJ3QgZm91bmQgaW4gdGhlIERTRFQuIEFueSBDUFUgdGhh
dAo+ID4gPiA+ID4gPiA+IGlzIHJlZ2lzdGVyZWQgYnkgdGhpcyBjb2RlIHRyaWdnZXJzIGEgZmly
bXdhcmUtYnVnIHdhcm5pbmcgYW5kIGtlcm5lbAo+ID4gPiA+ID4gPiA+IHRhaW50Lgo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gUWVtdSBUQ0cgb25seSBkZXNjcmliZXMgdGhlIGZpcnN0IENQ
VSBpbiB0aGUgRFNEVCwgdW5sZXNzIGNwdS1ob3RwbHVnCj4gPiA+ID4gPiA+ID4gaXMgY29uZmln
dXJlZC4gICAgCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNvIHdoeSBpcyB0aGlzIGEga2VybmVs
IHByb2JsZW0/ICAgIAo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvIHdoYXQgYXJlIHlvdSBwcm9wb3Np
bmcgc2hvdWxkIGJlIHRoZSBiZWhhdmlvdXIgaGVyZT8gV2hhdCB0aGlzCj4gPiA+ID4gPiBzdGF0
ZW1lbnQgc2VlbXMgdG8gYmUgc2F5aW5nIGlzIHRoYXQgUUVNVSBhcyBpdCBleGlzdHMgdG9kYXkg
b25seQo+ID4gPiA+ID4gZGVzY3JpYmVzIHRoZSBmaXJzdCBDUFUgaW4gRFNEVC4gICAgCj4gPiA+
ID4KPiA+ID4gPiBUaGlzIGNvbmZ1c2VzIG1lIHNvbWV3aGF0LCBiZWNhdXNlIEknbSBmYXIgZnJv
bSBzdXJlIHdoaWNoIG1hY2hpbmVzIHRoaXMKPiA+ID4gPiBpcyB0cnVlIGZvciBpbiBRRU1VLiAg
SSdtIGd1ZXNzaW5nIGl0J3MgYSBsZWdhY3kgdGhpbmcgd2l0aAo+ID4gPiA+IHNvbWUgb2xkIGRp
c3RybyB2ZXJzaW9uIG9mIFFFTVUgLSBzbyB3ZSdsbCBoYXZlIHRvIHBhcGVyIG92ZXIgaXQgYW55
d2F5Cj4gPiA+ID4gYnV0IGZvciBjdXJyZW50IFFFTVUgSSdtIG5vdCBzdXJlIGl0J3MgdHJ1ZS4K
PiA+ID4gPgo+ID4gPiA+IEhlbHBmdWxseSB0aGVyZSBhcmUgYSBidW5jaCBvZiBBQ1BJIHRhYmxl
IHRlc3RzIHNvIEkndmUgYmVlbiBjaGVja2luZwo+ID4gPiA+IHRocm91Z2ggYWxsIHRoZSBtdWx0
aSBDUFUgY2FzZXMuCj4gPiA+ID4KPiA+ID4gPiBDUFUgaG90cGx1ZyBub3QgZW5hYmxlZC4KPiA+
ID4gPiBwYy9EU0RULmRpbW1weG0gIC0gNHggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDQKPiA+
ID4gPiBwYy9EU0RULmFjcGlobWF0IC0gMnggUHJvY2Vzc29yIGVudHJpZXMuICAtc21wIDIKPiA+
ID4gPiBxMzUvRFNEVC5hY3BpaG1hdCAtIDJ4IFByb2Nlc3NvciBlbnRyaWVzLiAtc21wIDIKPiA+
ID4gPiB2aXJ0L0RTRFQuYWNwaWhtYXR2aXJ0IC0gNHggQUNQSTAwMDcgZW50cmllcyAtc21wIDQK
PiA+ID4gPiBxMzUvRFNEVC5hY3BpaG1hdC1ub2luaXRpYXRvciAtIDQgeCBQcm9jZXNzb3IgKCkg
ZW50cmllcyAtc21wIDQKPiA+ID4gPiB2aXJ0L0RTRFQudG9wb2xvZ3kgLSA4eCBBQ1BJMDAwNyBl
bnRyaWVzCj4gPiA+ID4KPiA+ID4gPiBJJ3ZlIGFsc28gbG9va2VkIGF0IHRoZSBjb2RlIGFuZCB3
ZSBoYXZlIHZhcmlvdXMgdHlwZXMgb2YKPiA+ID4gPiBDUFUgaG90cGx1ZyBvbiB4ODYgYnV0IHRo
ZXkgYWxsIGJ1aWxkIGFwcHJvcHJpYXRlIG51bWJlcnMgb2YKPiA+ID4gPiBQcm9jZXNzb3IoKSBl
bnRyaWVzIGluIERTRFQuCj4gPiA+ID4gQXJtIGxpa2V3aXNlIHNlZW1zIHRvIGJ1aWxkIHRoZSBy
aWdodCBudW1iZXIgb2YgQUNQSTAwMDcgZW50cmllcwo+ID4gPiA+IChhbmQgZG9lc24ndCB5ZXQg
aGF2ZSBDUFUgSFAgc3VwcG9ydCkuCj4gPiA+ID4KPiA+ID4gPiBJZiBhbnlvbmUgY2FuIGFkZCBh
IHJlZmVyZW5jZSBvbiB3aHkgdGhpcyBpcyBuZWVkZWQgdGhhdCB3b3VsZCBiZSB2ZXJ5Cj4gPiA+
ID4gaGVscGZ1bC4gICAgCj4gPiA+IAo+ID4gPiBZZXMsIGl0IHdvdWxkLgo+ID4gPiAKPiA+ID4g
UGVyc29uYWxseSwgSSB3b3VsZCBwcmVmZXIgdG8gYXNzdW1lIHRoYXQgaXQgaXMgbm90IG5lY2Vz
c2FyeSB1bnRpbCBpdAo+ID4gPiB0dXJucyBvdXQgdGhhdCAoMSkgdGhlcmUgaXMgZmlybXdhcmUg
d2l0aCB0aGlzIGlzc3VlIGFjdHVhbGx5IGluIHVzZQo+ID4gPiBhbmQgKDIpIHVwZGF0aW5nIHRo
ZSBmaXJtd2FyZSBpbiBxdWVzdGlvbiB0byBmb2xsb3cgdGhlIHNwZWNpZmljYXRpb24KPiA+ID4g
aXMgbm90IHByYWN0aWNhbC4KPiA+ID4gCj4gPiA+IE90aGVyd2lzZSwgd2UnZCBtYWtlIGl0IGVh
c2llciB0byBzaGlwIG5vbi1jb21wbGlhbnQgZmlybXdhcmUgZm9yIG5vCj4gPiA+IGdvb2QgcmVh
c29uLiAgICAKPiA+IAo+ID4gSWYgU2FsaWwgY2FuJ3QgY29tZSB1cCB3aXRoIGEgcmVhc29uLCB0
aGVuIEknbSBpbiBmYXZvdXIgb2YgZHJvcHBpbmcKPiA+IHRoZSBwYXRjaCBsaWtlIGFscmVhZHkg
ZG9uZSBmb3IgcGF0Y2ggMi4gSWYgdGhlIGNvZGUgY2hhbmdlIHNlcnZlcyBubwo+ID4gdXNlZnVs
IHB1cnBvc2UsIHRoZXJlJ3Mgbm8gcG9pbnQgaW4gbWFraW5nIHRoZSBjaGFuZ2UuCj4gPiAgIAo+
IAo+IFNhbGlsJ3Mgb3V0IHRvZGF5LCBidXQgSSd2ZSBtZXNzYWdlZCBoaW0gdG8gZm9sbG93IHVw
IGxhdGVyIGluIHRoZSB3ZWVrLgo+IAo+IEl0ICdtaWdodCcgYmUgdGhlIG9kZCBjb2xkIHBsdWcg
cGF0aCB3aGVyZSBRRU1VIGhhbGYgY29tZXMgdXAsIHRoZW4gZXh0cmEKPiBDUFVzIGFyZSBhZGRl
ZCwgdGhlbiBpdCBib290cy4gKHVzZWQgYnkgc29tZSBvcmNoZXN0cmF0aW9uIGZyYW1ld29ya3Mp
CgpJIHBva2VkIHRoaXMgb24geDg2IC0gaXQgb25seSBhcHBsaWVzIHdpdGggaG90cGx1ZyBlbmFi
bGVkIGFueXdheSBzbwpzYW1lIHJlc3VsdCBhcyBkb2luZyB0aGUgaG90cGx1ZyBsYXRlciAtIEFs
bCBwb3NzaWJsZSBQcm9jZXNzb3IoKSBlbnRyaWVzCmFscmVhZHkgZXhpc3QgaW4gRFNEVC4gSGVu
Y2UgdGhpcyBpc24ndCB0aGUgc291cmNlIG9mIHRoZSBteXN0ZXJpb3VzCmJyb2tlbiBjb25maWd1
cmF0aW9uLgoKSWYgYW55b25lIGRvZXMgcG9rZSB0aGlzIHBhdGgsIHRoZSBvbGQgZGlzY3Vzc2lv
biBiZXR3ZWVuIEphbWVzCmFuZCBTYWxpbCBwcm92aWRlcyBzb21lIGluc3RydWN0aW9ucyAobW9z
dGx5IHRoZSB0aHJlYWQgaXMgYWJvdXQKYW5vdGhlciBpc3N1ZSkuCmh0dHBzOi8vb3AtbGlzdHMu
bGluYXJvLm9yZy9hcmNoaXZlcy9saXN0L2xpbmFyby1vcGVuLWRpc2N1c3Npb25zQG9wLWxpc3Rz
LmxpbmFyby5vcmcvdGhyZWFkL0ROQUdCMkZCNUFMVkxWMkJZV1lPQ0xLR05GNzdQTlhTLwoKQWxz
byBvbiB4ODYgYSB0ZXN0IGludm9sdmluZyBzbXAgMixtYXgtY3B1cz00IGFuZCBhZGRpbmcgY3B1
LWlkIDMKKHNvIHNraXBwaW5nIDIpIGRvZXNuJ3QgYm9vdC4gKHRoaXMgaXMgd2l0aG91dCBTYWxp
bCdzIFFFTVUgcGF0Y2hlcykuCkkgZ3Vlc3MgdGhlcmUgYXJlIHNvbWUgd2VsbCBrbm93biBydWxl
cyBpbiB0aGVyZSB0aGF0IEkgZG9uJ3Qga25vdyBhYm91dAphbmQgUUVNVSBpc24ndCBwcmV2ZW50
aW5nIHBlb3BsZSBzaG9vdGluZyB0aGVtc2VsdmVzIGluIHRoZSBmb290LgoKQXMgSSdtIGNvbmNl
cm5lZCwgZHJvcCB0aGlzIHBhdGNoLgpJZiB0aGVyZSBhcmUgcGxhdGZvcm1zIG91dCB0aGVyZSBk
b2luZyB0aGlzIHdyb25nIHRoZXknbGwgc3VyZmFjZSBvbmNlCndlIGdldCB0aGlzIGludG8gbW9y
ZSB0ZXN0IGZhcm1zIChzbyBsaW51eC1uZXh0KS4gIElmIHdlIG5lZWQgdGhpcwonZml4JyB3ZSBj
YW4gYXBwbHkgaXQgd2hlbiB3ZSBoYXZlIGEgcHJvYmxlbSBmaXJtd2FyZSB0byBwb2ludCBhdC4K
ClRoYW5rcywKCkpvbmF0aGFuCgo+IEkgZG9uJ3QgaGF2ZSBhIHNldCB1cCBmb3IgdGhhdCBhbmQg
SSB3b24ndCBnZXQgdG8gY3JlYXRpbmcgb25lIHRvZGF5IGFueXdheQo+ICh3ZSBhbGwgbG92ZSBz
dGFydCBvZiB0aGUgeWVhciBwbGFubmluZyB3b3Jrc2hvcHMhKQoKPiAKPiBJJ3ZlICtDQydkIGEg
ZmV3IHBlb3BsZSBoYXZlIHJ1biB0ZXN0cyBvbiB0aGUgdmFyaW91cyBpdGVyYXRpb25zIG9mIHRo
aXMKPiB3b3JrIGluIHRoZSBwYXN0LiAgTWF5YmUgb25lIG9mIHRoZW0gY2FuIHNoZWQgc29tZSBs
aWdodCBvbiB0aGlzPwo+IAo+IEpvbmF0aGFuCj4gCj4gCj4gCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1h
aWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
