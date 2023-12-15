Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED079C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DS0VtFC2UojWkcru4LEXegSNtU0p4NDWfsboW8AxYD8=; b=aKyRrKcKoYiEFV
	Me2KLzxRHFOx4NtjaJM+c3/lV5g8QLqYDM4/zXose2qU7Cy61rZZ/LwArKAa+S6NpIA7u0zSJNxo2
	4tK0n67WwDjRrnK+oHPRMWfahdRau2yfrBgxcORNCBLz52rME5S9ZrIQwHnU3WwFg/aJiiU0I7C7y
	8McBrn6WlL0zRJqmde99k5oCYVQT8vXDGRxTybTiton05g5dJR1KVqpqwWw/sch9PsJGxiHFBntU4
	hWLslHH3wtFHPCUFbTQiwmHPNkHT0h4WoApfcDKo2bqGdA87jzXfe1Bj4TU4LZVTGFPFMuDxwkT7q
	IZqvr/Mr4jknPnU+WiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAqy-003q39-1C;
	Fri, 15 Dec 2023 16:15:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEAqr-003q15-2H;
	Fri, 15 Dec 2023 16:15:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4SsDmQ6g1zz6K8tP;
	Sat, 16 Dec 2023 00:13:42 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id C2B1C140133;
	Sat, 16 Dec 2023 00:15:41 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Dec
 2023 16:15:41 +0000
Date: Fri, 15 Dec 2023 16:15:39 +0000
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
	<justin.he@arm.com>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 01/21] ACPI: Only enumerate enabled (or
 functional) devices
Message-ID: <20231215161539.00000940@Huawei.com>
In-Reply-To: <ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOfs-00DvjY-HQ@rmk-PC.armlinux.org.uk>
	<20231214173241.0000260f@Huawei.com>
	<CAJZ5v0jymOtZ0y65K9wE8FJk+ZKwP+FoGm4AKHXcYVfQJL9MVw@mail.gmail.com>
	<ZXtFBYJEX2RrFrwj@shell.armlinux.org.uk>
	<CAJZ5v0h2Keyb-gFWFuPsKtwqjXvM2snyGpo6MMfFzaXKbfEpgw@mail.gmail.com>
	<CAJZ5v0h3WWtvrbxRpaGfq6c756k+L1SzZ1Gv3A14JxXHNcUMKA@mail.gmail.com>
	<ZXxxa+XZjPZtNfJ+@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_081551_523487_120930BF 
X-CRM114-Status: GOOD (  13.46  )
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

T24gRnJpLCAxNSBEZWMgMjAyMyAxNTozMTo1NSArMDAwMAoiUnVzc2VsbCBLaW5nIChPcmFjbGUp
IiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKCj4gT24gVGh1LCBEZWMgMTQsIDIwMjMg
YXQgMDc6Mzc6MTBQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBUaHUs
IERlYyAxNCwgMjAyMyBhdCA3OjE24oCvUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJu
ZWwub3JnPiB3cm90ZTogIAo+ID4gPgo+ID4gPiBPbiBUaHUsIERlYyAxNCwgMjAyMyBhdCA3OjEw
4oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4gPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+
IHdyb3RlOiAgCj4gPiA+ID4gSSBndWVzcyB3ZSBuZWVkIHNvbWV0aGluZyBsaWtlOgo+ID4gPiA+
Cj4gPiA+ID4gICAgICAgICBpZiAoZGV2aWNlLT5zdGF0dXMucHJlc2VudCkKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIGRldmljZS0+ZGV2aWNlX3R5cGUgIT0gQUNQSV9CVVNfVFlQRV9Q
Uk9DRVNTT1IgfHwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZS0+c3RhdHVz
LmVuYWJsZWQ7Cj4gPiA+ID4gICAgICAgICBlbHNlCj4gPiA+ID4gICAgICAgICAgICAgICAgIHJl
dHVybiBkZXZpY2UtPnN0YXR1cy5mdW5jdGlvbmFsOwo+ID4gPiA+Cj4gPiA+ID4gc28gd2Ugb25s
eSBjaGVjayBkZXZpY2UtPnN0YXR1cy5lbmFibGVkIGZvciBwcm9jZXNzb3ItdHlwZSBkZXZpY2Vz
PyAgCj4gPiA+Cj4gPiA+IFllcywgc29tZXRoaW5nIGxpa2UgdGhpcy4gIAo+ID4gCj4gPiBIb3dl
dmVyLCB0aGF0IGlzIG5vdCBzdWZmaWNpZW50LCBiZWNhdXNlIHRoZXJlIGFyZQo+ID4gQUNQSV9C
VVNfVFlQRV9ERVZJQ0UgZGV2aWNlcyByZXByZXNlbnRpbmcgcHJvY2Vzc29ycy4KPiA+IAo+ID4g
SSdtIG5vdCBzdXJlIGFib3V0IGEgY2xlYW4gd2F5IHRvIGRvIGl0IEFUTS4gIAo+IAo+IE9rLCBo
b3cgYWJvdXQ6Cj4gCj4gc3RhdGljIGJvb2wgYWNwaV9kZXZfaXNfcHJvY2Vzc29yKGNvbnN0IHN0
cnVjdCBhY3BpX2RldmljZSAqZGV2aWNlKQo+IHsKPiAJc3RydWN0IGFjcGlfaGFyZHdhcmVfaWQg
Kmh3aWQ7Cj4gCj4gCWlmIChkZXZpY2UtPmRldmljZV90eXBlID09IEFDUElfQlVTX1RZUEVfUFJP
Q0VTU09SKQo+IAkJcmV0dXJuIHRydWU7Cj4gCj4gCWlmIChkZXZpY2UtPmRldmljZV90eXBlICE9
IEFDUElfQlVTX1RZUEVfREVWSUNFKQo+IAkJcmV0dXJuIGZhbHNlOwo+IAo+IAlsaXN0X2Zvcl9l
YWNoX2VudHJ5KGh3aWQsICZkZXZpY2UtPnBucC5pZHMsIGxpc3QpCj4gCQlpZiAoIXN0cmNtcChB
Q1BJX1BST0NFU1NPUl9PQkpFQ1RfSElELCBod2lkLT5pZCkgfHwKPiAJCSAgICAhc3RyY21wKEFD
UElfUFJPQ0VTU09SX0RFVklDRV9ISUQsIGh3aWQtPmlkKSkKPiAJCQlyZXR1cm4gdHJ1ZTsKPiAK
PiAJcmV0dXJuIGZhbHNlOwo+IH0KPiAKPiBhbmQgdGhlbjoKPiAKPiAJaWYgKGRldmljZS0+c3Rh
dHVzLnByZXNlbnQpCj4gCQlyZXR1cm4gIWFjcGlfZGV2X2lzX3Byb2Nlc3NvcihkZXZpY2UpIHx8
IGRldmljZS0+c3RhdHVzLmVuYWJsZWQ7Cj4gCWVsc2UKPiAJCXJldHVybiBkZXZpY2UtPnN0YXR1
cy5mdW5jdGlvbmFsOwo+IAo+ID8KPiAKQ2hhbmdpbmcgaXQgdG8gQ1BVIG9ubHkgZm9yIG5vdyBt
YWtlcyBzZW5zZSB0byBtZSBhbmQgSSB0aGluayB0aGlzIGNvZGUgc25pcHBldCBzaG91bGQgZG8g
dGhlCmpvYi4gIE5pY2UgYW5kIHNpbXBsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
