Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393E9C46CD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TItsme1Thkk6JCpceiHGIc/iM3vW/irnlMsV/TM/Xa0=; b=PsI3V0VGhS22JA
	pHOZ3+aDuxln9KrXJ9DBhM6qYD6DLf67gOZAc57lGByazdsfxPj9nQw2k0vEchf3xJHc0ohSm4UA7
	l+8GkBZLLGu8oRgf6NKG2bt1kPwuhV+KRhFY43sT3QVtRgUz0FiJIRPW95YKn5bBb4YZy6hLxchRb
	x+Uy/2agY9fyFwB7pUlBaf7Wu65XERX98thXjZzNpbV7geB7AT3pxkWX1jTTsj8a4A1WE8dvfkNk6
	vpR5l6zfEs9rj9H1wM2FqCobFTF7AqJXOwXeo9VEwyCscOiAfDuXPMWpA01kpKmfjNXa2efDoFFkA
	BnTg3iJ4WPFc+3uFqEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRsn-00EPoR-0Y;
	Wed, 27 Dec 2023 11:15:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIRsj-00EPnu-00;
	Wed, 27 Dec 2023 11:15:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CA37260EA6;
	Wed, 27 Dec 2023 11:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354F6C433C8;
	Wed, 27 Dec 2023 11:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703675723;
	bh=Gy+D+S27rQJBs12wlJEa+cumgsdCkF3P6tKjEyxVt5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pP9RBZ+DfqI9ufbs6J2xz/FKM0nY4Pwf02G34GG/l91DTZu2tk+J7E60zTnEhjPL3
	 qZpNUMit64mYzbAtmwb9KGD6zaz5A40god5gLykenVaCm2sXCYmzeuPBwh81SyO6PE
	 Bmza1w3YIvrK9XpCQ1ll0SBpVNNIbPKuiFHL1di27kuvrOtBBRDVMYxJBl9aC9WXFF
	 MVkAcY36NePVzE7QE5kh7q0qI8bFlVKwHv5Lb87s+QQdATKl+4EzU0nNeZCmAVTbhm
	 BIC374HdlJLWXGEfqtrC7dzBPDecYaAPxTeXEnoldydMWpAyK6aa7O4FdWU6pXS3QV
	 BU1AUG2sovIcQ==
Date: Wed, 27 Dec 2023 12:15:14 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 13/21] ACPICA: Add new MADT GICC flags fields
Message-ID: <ZYwHQgdGGGVkwmJ8@lpieralisi>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOgs-00Dvko-6t@rmk-PC.armlinux.org.uk>
 <20231215162322.00007391@Huawei.com>
 <ZXyEiHLFBsoUkfNI@shell.armlinux.org.uk>
 <ZYAPhlwPUT/7dN4n@lpieralisi>
 <CAJZ5v0hyUqJspPbGTgTMSVHVBe=wHR6swPx-O3UcsH5dXDFpTA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hyUqJspPbGTgTMSVHVBe=wHR6swPx-O3UcsH5dXDFpTA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_031525_147293_0C2A017A 
X-CRM114-Status: GOOD (  28.23  )
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

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMDI6MTQ6MzBQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMTA6MjPigK9BTSBMb3JlbnpvIFBp
ZXJhbGlzaQo+IDxscGllcmFsaXNpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
RGVjIDE1LCAyMDIzIGF0IDA0OjUzOjI4UE0gKzAwMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3
cm90ZToKPiA+ID4gT24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMDQ6MjM6MjJQTSArMDAwMCwgSm9u
YXRoYW4gQ2FtZXJvbiB3cm90ZToKPiA+ID4gPiBPbiBXZWQsIDEzIERlYyAyMDIzIDEyOjUwOjE4
ICswMDAwCj4gPiA+ID4gUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiA+IEZyb206IEphbWVzIE1vcnNlIDxqYW1l
cy5tb3JzZUBhcm0uY29tPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFkZCB0aGUgbmV3IGZsYWcgZmll
bGQgdG8gdGhlIE1BRFQncyBHSUNDIHN0cnVjdHVyZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAnT25s
aW5lIENhcGFibGUnIGluZGljYXRlcyBhIGRpc2FibGVkIENQVSBjYW4gYmUgZW5hYmxlZCBsYXRl
ci4gU2VlCj4gPiA+ID4gPiBBQ1BJIHNwZWNpZmljYXRpb24gNi41IFRhYmVsIDUuMzc6IEdJQ0Mg
Q1BVIEludGVyZmFjZSBGbGFncy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBK
YW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+ID4gPiA+IFRlc3RlZC1ieTogTWln
dWVsIEx1aXMgPG1pZ3VlbC5sdWlzQG9yYWNsZS5jb20+Cj4gPiA+ID4gPiBUZXN0ZWQtYnk6IFZp
c2hudSBQYWpqdXJpIDx2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4KPiA+ID4gPiA+IFRl
c3RlZC1ieTogSmlhbnlvbmcgV3UgPGppYW55b25nLnd1QGFybS5jb20+Cj4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgo+ID4gPiA+Cj4gPiA+ID4gSSBzZWUgdGhlcmUgaXMgYW4gYWNwaWNhIHB1bGwgcmVxdWVz
dCBpbmNsdWRpbmcgdGhpcyBiaXQgYnV0IHdpdGggYSBkaWZmZXJlbnQgbmFtZQo+ID4gPiA+IEZv
ciByZWZlcmVuY2UuCj4gPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2FjcGljYS9hY3BpY2EvcHVs
bC85MTQvY29tbWl0cy80NTNhNWY2NzU2Nzc4NjUyMjAyMWQ1ZjY5MTNmNTYxZjhiM2NhYmY2Cj4g
PiA+ID4KPiA+ID4gPiArQ0MgTG9yZW56byB3aG8gc3VibWl0dGVkIHRoYXQuCj4gPiA+Cj4gPiA+
ID4gPiArI2RlZmluZSBBQ1BJX01BRFRfR0lDQ19DUFVfQ0FQQUJMRSAgICAgICgxPDwzKSAgIC8q
IDAzOiBDUFUgaXMgb25saW5lIGNhcGFibGUgKi8KPiA+ID4gPgo+ID4gPiA+IEFDUElfTUFEVF9H
SUNDX09OTElORV9DQVBBQkxFCj4gPiA+Cj4gPiA+IEl0J3Mgc29tZXdoYXQgZGlzYXBwb2ludGlu
ZywgYnV0IG5vIGJpZyBkZWFsLiBJdCdzIGVhc3kgZW5vdWdoIHRvIGNoYW5nZQo+ID4gPiAiaXJx
Y2hpcC9naWMtdjM6IEFkZCBzdXBwb3J0IGZvciBBQ1BJJ3MgZGlzYWJsZWQgYnV0ICdvbmxpbmUg
Y2FwYWJsZScgQ1BVcyIKPiA+ID4gdG8gdXNlIExvcmVuem8ncyBuYW1lIHdoZW4gdGhhdCBwYXRj
aCBoaXRzIC0gYW5kIGl0IGJlY29tZXMgb25lIGxlc3MKPiA+ID4gcGF0Y2ggaW4gdGhpcyBwYXRj
aCBzZXQgd2hlbiBMb3JlbnpvJ3MgY2hhbmdlIGV2ZW50dWFsbHkgaGl0cyBtYWlubGluZS4KPiA+
ID4KPiA+ID4gRG9lcyBhbnlvbmUga25vdyBob3cgbG9uZyBpdCBtYXkgdGFrZSBmb3IgTG9yZW56
bydzIGNoYW5nZSB0byBnZXQgaW50bwo+ID4gPiBtYWlubGluZT8gV291bGQgaXQgYmUgYnkgdGhl
IDYuOCBtZXJnZSB3aW5kb3cgb3IgdGhlIGZvbGxvd2luZyBvbmU/Cj4gPgo+ID4gSSB3aXNoIEkg
a25ldy4gSSBzdWJtaXR0ZWQgQUNQSUNBIGNoYW5nZXMgZm9yIHRoZSBvbmxpbmUgY2FwYWJsZSBi
aXQKPiA+IHNpbmNlIEkgaGFkIHRvIGFkZCBhZGRpdGlvbmFsIGZsYWdzIG9uIHRvcCAoaWUgRE1B
IGNvaGVyZW50KSBhbmQgaXQKPiA+IHdvdWxkIG5vdCBtYWtlIHNlbnNlIHRvIHN1Ym1pdCB0aGUg
bGF0dGVyIHdpdGhvdXQgdGhlIGZvcm1lci4KPiA+Cj4gPiBJJ2QgYmUgZ3JlYXQgaWYgdGhlIEFD
UElDQSBoZWFkZXJzIGNhbiBtYWtlIGl0IGludG8gTGludXggZm9yIHRoZSB1cGNvbWluZwo+ID4g
bWVyZ2Ugd2luZG93LCBub3Qgc3VyZSB3aGF0IEkgY2FuIGRvIHRvIGZhc3R0cmFjayB0aGUgcHJv
Y2VzcyB0aG91Z2gKPiA+IChJIHNoYWxsIHBpbmcgdGhlIG1haW50YWluZXJzKS4KPiAKPiBJZiB5
b3VyIHVwc3RyZWFtIHB1bGwgcmVxdWVzdCBoYXMgYmVlbiBtZXJnZWQsIEkgY2FuIHBpY2sgdXAg
TGludXgKPiBwYXRjaGVzIGNhcnJ5aW5nIExpbms6IHRhZ3MgcG9pbnRpbmcgdG8gdGhlIHVwc3Ry
ZWFtIEFDUElDQSBjb21taXRzIGluCj4gdGhhdCBwdWxsIHJlcXVlc3QuCgpBQ1BJQ0EgUFIgd2Fz
IG1lcmdlZCwgc2VudCB0aGUgTGludXhpemVkIHZlcnNpb24gYWxvbmcgd2l0aCB0aGUgR0lDIGNo
YW5nZXMKaGVyZToKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzEyMjcxMTAwMzgu
NTU0NTMtMS1scGllcmFsaXNpQGtlcm5lbC5vcmcKClRoYW5rcywKTG9yZW56bwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
