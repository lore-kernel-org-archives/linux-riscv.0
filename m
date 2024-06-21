Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C887C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 05:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnHLNOPlLuC6DXwbuwCyPj1Tg6GAB2pcEOAysBhe9oY=; b=Qgl3LvNOpV7cDu
	+aBj+DGGaDifq0/HKPT0+8c7qQrMLVhJ1Jm36BjmORR2TZ+VxgKBQekJqBA/9KbxC5TZLkJ0yUOKo
	4St7jg2pOXsfMo2liOxjcWu5oVeTq4PEWdCZwrb6nUbDW2ipMUPg5pZiCw4/6sLQNswETRLGk5fZ9
	g+CFOGKnmVMSsvqufxKXGHfLlHXqIv1S11GtBWUtOB4de2fOlOwVt0YDNwGMuz4s1QSzPM9qRgEZd
	LOlSVBOfaVvNAOdBeIDXqHmCX7AZNwUIzK606DDFRvppggD58ArudkzWnaB0CbICTWGSnCamRq66w
	a41MDLkCJcml3iEI2+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWfa-00000007kmc-1nVc;
	Fri, 21 Jun 2024 05:18:42 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKWfV-00000007klU-3fek
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 05:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1718947110; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c6AgMWpCL8iULRscSMXdhBHx4hgxfgjJ24VxE/Q2HPq5GATNxkF77w8vNl9xQ8fjmpiKk+3/+DXwWBPWPr0HHt76+EyMMU1UnladPKhxzW51Eir0rbpVHGhOSfOkyv9l9Fty4PiyMny1BQF/3n2C+wMox78sHcp7ZORKqJL3gLU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718947110; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x7lQvMt4ex5lL65NuvtYppd4hlL7l7zTLlB6KxolOZs=; 
	b=VbFUh/AKg1umViHEU2X0BQ89gHYyVRnoBkzOdkD/rtyxikPGWjjBLooLxQW1XzgUUmS78De5N1vIv/vAsopBEbwev0G6sbWZzzAo7IRhVX3JM3d6C0FrU9d+8cnfY2LJroVg4EBfwwyky7PhHYn1L/pf3mrNGdU58j7/q2J9yJI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718947110;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=x7lQvMt4ex5lL65NuvtYppd4hlL7l7zTLlB6KxolOZs=;
	b=YX0jP+1E/1s43ENznX+gHHToSYxwi54xOe+Y205R53HC6oOpDmKLnNh7OAWIUsDx
	gycX4A0SGnKXFnMPkdu3tIlHge9mOU/KraRveogR5qYYGeCxWjb6VGCVFoN4viVoTX9
	SM6MhSsb2PKDiLEmsMvXGp2zYfi1r1ZLBvvMzdtaokcixEHY2fB0a5oOT9E3/5HwfGv
	ioSgTWxlkgfkjOvYaZkd8tG9R6etYtBIcx9tS16ibCjmc/cOEjDJCOj5g24GVOae8ui
	hwI2mDQ+A1mJFXy3ef0QZMMvtlN6PMyOghMoYksgCXm+jL0j6RRxdTQwkmamdoVQjdW
	lGtGT22VIg==
Received: by mx.zohomail.com with SMTPS id 1718947108447520.378193907363;
	Thu, 20 Jun 2024 22:18:28 -0700 (PDT)
Message-ID: <8fac6e0f11ab5f5fc28be6e73f196b38e99f8c39.camel@icenowy.me>
Subject: Re: [External] Re: [PATCH] RISC-V: Provide the frequency of mtime
 via hwprobe
From: Icenowy Zheng <uwu@icenowy.me>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, Evan Green
 <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 costa.shul@redhat.com, Andy Chiu <andy.chiu@sifive.com>,
 samitolvanen@google.com, linux-doc@vger.kernel.org,  linux-riscv
 <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Date: Fri, 21 Jun 2024 13:18:22 +0800
In-Reply-To: <CAEEQ3w=HZptMOgXp2Rtuz-VtzPabN=h5N3=3wS4AMk3Lo7E7FQ@mail.gmail.com>
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
	 <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com>
	 <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
	 <CAEEQ3w=HZptMOgXp2Rtuz-VtzPabN=h5N3=3wS4AMk3Lo7E7FQ@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_221838_001220_07F0B4C6 
X-CRM114-Status: GOOD (  19.32  )
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

5ZyoIDIwMjQtMDYtMjHmmJ/mnJ/kupTnmoQgMTE6MDEgKzA4MDDvvIx5dW5odWkgY3Vp5YaZ6YGT
77yaCj4gSGkgSWNlbm93eSwKPiAKPiBPbiBXZWQsIEp1biAxOSwgMjAyNCBhdCA3OjUx4oCvQU0g
SWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+ID4gCj4gPiDlnKggMjAyNC0w
Ni0xOOaYn+acn+S6jOeahCAxODoxMSArMDEwMO+8jEplc3NpY2EgQ2xhcmtl5YaZ6YGT77yaCj4g
PiA+IE9uIDE4IEp1biAyMDI0LCBhdCAxMjo0NiwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVk
YW5jZS5jb20+Cj4gPiA+IHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IEZyb206IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4gPiA+IAo+ID4gPiA+IEEgaGFuZGZ1bCBvZiB1
c2VyLXZpc2libGUgYmVoYXZpb3IgaXMgYmFzZWQgb24gdGhlIGZyZXF1ZW5jeSBvZgo+ID4gPiA+
IHRoZQo+ID4gPiA+IG1hY2hpbmUtbW9kZSB0aW1lLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gPiAKPiA+
ID4gSSB3b3VsZCBzdWdnZXN0IHJlZmVycmluZyB0byB0aGUgdXNlci1tb2RlIENTUiBpbnN0ZWFk
LCBpLmUuCj4gPiA+IOKAnHRpbWXigJ0KPiA+ID4gcmF0aGVyIHRoYW4g4oCcbXRpbWXigJ0gdGhy
b3VnaG91dCBpbiBuYW1lcyBhbmQgZGVzY3JpcHRpb25zLCBzaW5jZQo+ID4gPiB0aGF04oCZcwo+
ID4gPiB0aGUgdGhpbmcgdGhhdCB1c2VyLW1vZGUgc29mdHdhcmUgaXMgYWN0dWFsbHkgcmVhZGlu
ZyBmcm9tLgo+ID4gCj4gPiBBZ3JlZS4gTVRJTUUgaXNuJ3QgZXZlbiBhIHRoaW5nIGRlZmluZWQg
aW4gUklTQy1WIElTQSAtLSBpdCdzIHBhcnQKPiA+IG9mCj4gPiB0aGUgQUNMSU5UIHRpbWVyIHNw
ZWMsIGJ1dCBiZWZvcmUgQUNMSU5UIGdldHMgd2lkZWx5IGFjY2VwdGVkLCBpdCdzCj4gPiBqdXN0
IHNvbWUgU2lGaXZlIHRoaW5nIHRoYXQgZ290IGNvcGllZCBieSBtYW55IG90aGVyIHZlbmRvcnMg
KGFuZAo+ID4gdmVuZG9ycyBzdWNoIGFzIFQtSGVhZCBldmVuIHByb3ZpZGVzIENMSU5UIHcvbyBN
VElNRSByZWdpc3RlciAod2VsbAo+ID4gYmVjYXVzZSB0aGVzZSBULUhlYWQgY29yZXMgaGF2ZSBy
ZWZlcmVuY2Ugc291cmNlIGNvZGUgYXZhaWxhYmxlLAo+ID4gdGhpcwo+ID4gaXMgYmVjYXVzZSBv
ZiB0aGVpciBDUFUgZGVzaWduIHVzZXMgYW4gZXh0ZXJuYWwgY291bnRlciBmZWQgYXMgVElNRQo+
ID4gcmVnaXN0ZXIpKS4KPiAKPiBPa2F5LCBUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbnMswqAg
SSB0aGluayB0aGlzIG1vZGlmaWNhdGlvbiBpcyBtb3JlCj4gYXBwcm9wcmlhdGU6Cj4gCj4gUklT
Qy1WOiBQcm92aWRlIHRoZSBmcmVxdWVuY3kgb2YgdGltZSBjb3VudGVyIHZpYSBod3Byb2JlCgpT
dXJlLCBvciB5b3UgY291bGQganVzdCBzYXkgdGltZSBDU1IsIHdoaWNoIGlzIGEgZGVmaW5lZCBD
U1IgaW4gdGhlCnVzZXIgSVNBIGRvY3VtZW50LCBhbmQgYWxsb3cgdG8gYmUgcmVhZCBmcm9tIHVz
ZXJzcGFjZS4KCj4gCj4gQSBoYW5kZnVsIG9mIHVzZXItdmlzaWJsZSBiZWhhdmlvciBpcyBiYXNl
ZCBvbiB0aGUgZnJlcXVlbmN5IG9mIHRoZQo+IHRpbWUgY291bnRlci4KPiAKPiBXaGF0IGRvIHlv
dSB0aGluayA/Cj4gCj4gPiAKPiA+ID4gCj4gPiA+IEplc3MKPiA+ID4gCj4gPiA+IAo+ID4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiBsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cj4gPiAKPiAKPiBUaGFua3MsCj4gWXVuaHVpCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
