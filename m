Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE4FC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXQmIYV0d/0YlOY/fHGxo/pqs4/Gxxd5AIMcYxtzGDo=; b=u5yVP2AMq1WD2r
	X+Q+vcgZHw6OCWsVNbTK2sHOOxAQJiuVGv5ElV+7/N5Y+zYYs5H1Tc0LowUREn/4ER3m2UCFcKhn7
	nCv2w/pSFM1q+OH+/7BFKWuwcDI878UzmDAp5146HCgYWjwPXSjDiyy+XRH368KKFR38gJK8ygCGB
	7w+12DQ2EAW2F6pDunitCzDb6wVYyJ14zcAXneTXWebCR7gLDdmSjQaEPHEcEONJFwtA4/zSYwf5k
	pK0EVPnjJV+EspBLke63d22s8I4cNGUtJdGUBvVZTr+vSuHz0T39tqU2agrbQ4sRP72QSJELZVwFG
	qNB5Rk2e6jDYtz4vSG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEjM-008nIl-37;
	Tue, 09 Jan 2024 16:13:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNEjJ-008nHQ-0f;
	Tue, 09 Jan 2024 16:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hjOpdiFLaU/rl9xnyUOLlrLmtfPs6+yF3otyUbGH/R4=; b=a1Ok5TnyDwwEPqkbOv/NhT9x7R
	vsRGEpXQQuagE84o1GOKB+g5J/3SKZHiq7gO7CVhZ9MwbQLrdnXwckcxFgAGvnY9Nk4loJwUNfWTP
	dmTT4AEb4pqk4eK2+PIhMHYIuLyFfMQgkCgMxXmxbzNgRuL29tI50v1rDgTaj2mHCxoPuAbNQPrUt
	Km1OPWQBn9drrgdJHriccMuP6O1dmCKstC1QR2adWEFoMNzjxmXhZjSbPWilyBjDSoIpatoeKnAWZ
	8VR9XluXAKu8zzZRWPmIvh+ZGCcd5RXc90I3qF8F9kbHPYQUINZIyz2P07nQPugKYvhC2BMDt30cD
	fa7z7JPQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35300)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rNEj9-0004JK-0j;
	Tue, 09 Jan 2024 16:13:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rNEjB-0004Pk-Ap; Tue, 09 Jan 2024 16:13:21 +0000
Date: Tue, 9 Jan 2024 16:13:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
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
Subject: Re: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
Message-ID: <ZZ1woQkpMMCWVnXc@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iB0bS6nmjQ++pV1zp5YSGuigbffK5VD3wsX+8bY9MA5w@mail.gmail.com>
 <ZZ1q+7GXqnMMwKNR@shell.armlinux.org.uk>
 <CAJZ5v0jvuTAMak-x=ekphwgNsUWABGRcDPb8D4QB=KhfyC76Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jvuTAMak-x=ekphwgNsUWABGRcDPb8D4QB=KhfyC76Sg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_081329_241374_6130A713 
X-CRM114-Status: GOOD (  41.74  )
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

T24gVHVlLCBKYW4gMDksIDIwMjQgYXQgMDU6MDU6MTVQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBKYW4gOSwgMjAyNCBhdCA0OjQ54oCvUE0gUnVzc2VsbCBLaW5n
IChPcmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPgo+ID4gT24gTW9u
LCBEZWMgMTgsIDIwMjMgYXQgMDk6MTc6MzRQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3Jv
dGU6Cj4gPiA+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDE6NDnigK9QTSBSdXNzZWxsIEtpbmcg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEZyb206
IEphbWVzIE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4gPiA+Cj4gPiA+ID4gQUNQSSBo
YXMgdHdvIHdheXMgb2YgZGVzY3JpYmluZyBwcm9jZXNzb3JzIGluIHRoZSBEU0RULiBGcm9tIEFD
UEkgdjYuNSwKPiA+ID4gPiA1LjIuMTI6Cj4gPiA+ID4KPiA+ID4gPiAiU3RhcnRpbmcgd2l0aCBB
Q1BJIFNwZWNpZmljYXRpb24gNi4zLCB0aGUgdXNlIG9mIHRoZSBQcm9jZXNzb3IoKSBvYmplY3QK
PiA+ID4gPiB3YXMgZGVwcmVjYXRlZC4gT25seSBsZWdhY3kgc3lzdGVtcyBzaG91bGQgY29udGlu
dWUgd2l0aCB0aGlzIHVzYWdlLiBPbgo+ID4gPiA+IHRoZSBJdGFuaXVtIGFyY2hpdGVjdHVyZSBv
bmx5LCBhIF9VSUQgaXMgcHJvdmlkZWQgZm9yIHRoZSBQcm9jZXNzb3IoKQo+ID4gPiA+IHRoYXQg
aXMgYSBzdHJpbmcgb2JqZWN0LiBUaGlzIHVzYWdlIG9mIF9VSUQgaXMgYWxzbyBkZXByZWNhdGVk
IHNpbmNlIGl0Cj4gPiA+ID4gY2FuIHByZWNsdWRlIGFuIE9TUE0gZnJvbSBiZWluZyBhYmxlIHRv
IG1hdGNoIGEgcHJvY2Vzc29yIHRvIGEKPiA+ID4gPiBub24tZW51bWVyYWJsZSBkZXZpY2UsIHN1
Y2ggYXMgdGhvc2UgZGVmaW5lZCBpbiB0aGUgTUFEVC4gRnJvbSBBQ1BJCj4gPiA+ID4gU3BlY2lm
aWNhdGlvbiA2LjMgb253YXJkLCBhbGwgcHJvY2Vzc29yIG9iamVjdHMgZm9yIGFsbCBhcmNoaXRl
Y3R1cmVzCj4gPiA+ID4gZXhjZXB0IEl0YW5pdW0gbXVzdCBub3cgdXNlIERldmljZSgpIG9iamVj
dHMgd2l0aCBhbiBfSElEIG9mIEFDUEkwMDA3LAo+ID4gPiA+IGFuZCB1c2Ugb25seSBpbnRlZ2Vy
IF9VSUQgdmFsdWVzLiIKPiA+ID4gPgo+ID4gPiA+IEFsc28gc2VlIGh0dHBzOi8vdWVmaS5vcmcv
c3BlY3MvQUNQSS82LjUvMDhfUHJvY2Vzc29yX0NvbmZpZ3VyYXRpb25fYW5kX0NvbnRyb2wuaHRt
bCNkZWNsYXJpbmctcHJvY2Vzc29ycwo+ID4gPiA+Cj4gPiA+ID4gRHVwbGljYXRlIGRlc2NyaXB0
aW9ucyBhcmUgbm90IGFsbG93ZWQsIHRoZSBBQ1BJIHByb2Nlc3NvciBkcml2ZXIgYWxyZWFkeQo+
ID4gPiA+IHBhcnNlcyB0aGUgVUlEIGZyb20gYm90aCBkZXZpY2VzIGFuZCBjb250YWluZXJzLiBh
Y3BpX3Byb2Nlc3Nvcl9nZXRfaW5mbygpCj4gPiA+ID4gcmV0dXJucyBhbiBlcnJvciBpZiB0aGUg
VUlEIGV4aXN0cyB0d2ljZSBpbiB0aGUgRFNEVC4KPiA+ID4KPiA+ID4gSSdtIG5vdCByZWFsbHkg
c3VyZSBob3cgdGhlIGFib3ZlIGlzIHJlbGF0ZWQgdG8gdGhlIGFjdHVhbCBwYXRjaC4KPiA+ID4K
PiA+ID4gPiBUaGUgbWlzc2luZyBwcm9iZSBmb3IgQ1BVcyBkZXNjcmliZWQgYXMgcGFja2FnZXMK
PiA+ID4KPiA+ID4gSXQgaXMgdW5jbGVhciB3aGF0IGV4YWN0bHkgaXMgbWVhbnQgYnkgIkNQVXMg
ZGVzY3JpYmVkIGFzIHBhY2thZ2VzIi4KPiA+ID4KPiA+ID4gRnJvbSB0aGUgcGF0Y2gsIGl0IGxv
b2tzIGxpa2UgdGhvc2Ugd291bGQgYmUgUHJvY2Vzc29yKCkgb2JqZWN0cwo+ID4gPiBkZWZpbmVk
IHVuZGVyIGEgcHJvY2Vzc29yIGNvbnRhaW5lciBkZXZpY2UuCj4gPiA+Cj4gPiA+ID4gY3JlYXRl
cyBhIHByb2JsZW0gZm9yCj4gPiA+ID4gbW92aW5nIHRoZSBjcHVfcmVnaXN0ZXIoKSBjYWxscyBp
bnRvIHRoZSBhY3BpX3Byb2Nlc3NvciBkcml2ZXIsIGFzIENQVXMKPiA+ID4gPiBkZXNjcmliZWQg
bGlrZSB0aGlzIGRvbid0IGdldCByZWdpc3RlcmVkLCBsZWFkaW5nIHRvIGVycm9ycyBmcm9tIG90
aGVyCj4gPiA+ID4gc3Vic3lzdGVtcyB3aGVuIHRoZXkgdHJ5IHRvIGFkZCBuZXcgc3lzZnMgZW50
cmllcyB0byB0aGUgQ1BVIG5vZGUuCj4gPiA+ID4gKGUuZy4gdG9wb2xvZ3lfc3lzZnNfaW5pdCgp
J3MgdXNlIG9mIHRvcG9sb2d5X2FkZF9kZXYoKSB2aWEgY3B1aHApCj4gPiA+ID4KPiA+ID4gPiBU
byBmaXggdGhpcywgcGFyc2UgdGhlIHByb2Nlc3NvciBjb250YWluZXIgYW5kIGNhbGwgYWNwaV9w
cm9jZXNzb3JfYWRkKCkKPiA+ID4gPiBmb3IgZWFjaCBwcm9jZXNzb3IgdGhhdCBpcyBkaXNjb3Zl
cmVkIGxpa2UgdGhpcy4KPiA+ID4KPiA+ID4gRGlzY292ZXJlZCBsaWtlIHdoYXQ/Cj4gPiA+Cj4g
PiA+ID4gVGhlIHByb2Nlc3NvciBjb250YWluZXIKPiA+ID4gPiBoYW5kbGVyIGlzIGFkZGVkIHdp
dGggYWNwaV9zY2FuX2FkZF9oYW5kbGVyKCksIHNvIG5vIGRldGFjaCBjYWxsIHdpbGwKPiA+ID4g
PiBhcnJpdmUuCj4gPiA+Cj4gPiA+IFRoZSBhYm92ZSByZXF1aXJlcyBjbGFyaWZpY2F0aW9uIHRv
by4KPiA+Cj4gPiBUaGUgYWJvdmUgY29tbWVudHMuLi4geWVhLiBBcyBJIGRpZG4ndCB3cml0ZSB0
aGUgY29tbWl0IGRlc2NyaXB0aW9uLCBidXQKPiA+IEphbWVzIGRpZCwgYW5kIEphbWVzIGhhcyBi
YXNpY2FsbHkgdmFuaXNoZWQsIEkgZG9uJ3QgdGhpbmsgdGhlc2UgY2FuIGJlCj4gPiBhbnN3ZXJl
ZCwgc2hvcnQgb2YgcmV3cml0aW5nIHRoZSBlbnRpcmUgY29tbWl0IG1lc3NhZ2UsIHdpdGggbWUg
c3BlbmRpbmcKPiA+IGEgbG90IG9mIHRpbWUgd2l0aCB0aGUgQUNQSSBzcGVjaWZpY2F0aW9uIHRy
eWluZyB0byBnZXQgdGhlIHRlcm1pbm9sb2d5Cj4gPiByaWdodCAtIGJlY2F1c2UgYXQgbG90IG9m
IHRoZSBhYm92ZSBvbiB0aGUgZmFjZSBvZiBpdCBzZWVtcyB0byBiZSB0aGluZ3MKPiA+IHRvIGRv
IHdpdGggd3JvbmcgdGVybWlub2xvZ3kgYmVpbmcgdXNlZC4KPiA+Cj4gPiBJIHdhc24ndCBleHBl
Y3RpbmcgdGhpcyBsZXZlbCBvZiBpc3N1ZXMgd2l0aCB0aGlzIHBhdGNoIHNldCwgYW5kIEkgbm93
Cj4gPiBmZWVsIGNvbXBsZXRlbHkgb3V0IG9mIG15IGRlcHRoIHdpdGggdGhpcyBzZXJpZXMuIEkn
bSB3b25kZXJpbmcgd2hldGhlcgo+ID4gSSBzaG91bGQgZXZlbiBjb250aW51ZSB3aXRoIGl0LCBz
aW5jZSBJIGRvbid0IGhhdmUgdGhlIEFDUEkga25vd2xlZGdlCj4gPiB0byBhZGRyZXNzIGEgbG90
IG9mIHRoZXNlIGNvbW1lbnRzLgo+IAo+IFdlbGwsIHNvcnJ5IGFib3V0IHRoaXMuCj4gCj4gSSBt
ZXQgSmFtZXMgYXQgdGhlIExQQyBsYXN0IHllYXIsIHNvIGhlIHNlZW1zIHRvIGJlIHN0aWxsIGFy
b3VuZCwgaW4KPiBzb21lIHdheSBhdCBsZWFzdC4uCgpPbiB0aGUgcHJldmlvdXMgcG9zdGluZywg
SSB3YW50ZWQgSmFtZXMgdG8gY29tbWVudCBvbiBzb21lIG9mIHRoZQpmZWVkYmFjayBmcm9tIEpv
bmF0aGFuLCBhbmQgZGVzcGl0ZSBleHBsaWNpdGx5IGFza2luZywgdGhlcmUgaGFzIGJlZW4Kbm90
aGluZyBidXQgcmFkaW8gc2lsZW5jZSBldmVyIHNpbmNlIEphbWVzJyBsYXN0IHBvc3Qgb2YgdGhp
cyBzZXJpZXMuCgpTbywgSSBub3cgZGVlbSB0aGlzIHdvcmsgdG8gYmUgY29tcGxldGVseSBkZWFk
IGluIHRoZSB3YXRlciwgYW5kIG5vdApnb2luZyB0byBoYXBwZW4gLSBub3QgdW5sZXNzIG90aGVy
cyBjYW4gaW5wdXQgb24geW91ciBjb21tZW50cy4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0
dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJl
ISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
