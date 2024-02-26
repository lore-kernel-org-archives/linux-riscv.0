Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A32DC5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+DF+3H68PdfJO4BZnQd7R/bhJkJWVZNu3583fEhyhQ=; b=gNrJlNv6jNYsKA
	N4KoiOwpCBquq3vU9Kxb7nf61H3zWjsvz2Bqh1YPjH957ZQcXcg2VAiSwUO+itbFzdNR3AGKL/sCz
	+H5RGX6PTOZF3Lvh1u30odV9sWI0oTK2HN0NYgSgbT+GDThCYbnEvxKrwtAT2X3nM4VBTd2xyFgBq
	Bq9JE1UdPnjXMO9TRW3ewFzPhMJX3vUj4gIAZvMv5Q3zbKQYdxH3f1/bvAChStnqZDqi69gTknEo9
	uPhrkri8dqRoLlePfSIkbkZTgnPNXDp/FdymPP8QiK0VYzdsTimgQlJvkSOFa6dgPx6VrhDNFmvV0
	gjP6H2dDZ6NCvHfp5Vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refls-00000002Bzi-23F9;
	Mon, 26 Feb 2024 18:32:12 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reflp-00000002BxI-1bHh
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 18:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=OTrgJSJ1jDEPsGQxe8NHCf/xZH4XRsuoxTPG/b1FsiA=; b=QyS7hGWI1LCToHyw7V9iQMYHun
	l7QpKUvlkFmqUnyTqBxsxezsPT4BE+q4DF+ZiOHNgkEOdd8bjWVEhO6cizyxFAEZD2mOdPidhrH+h
	nQxqOMMVb51ZFFZwIrzRq1MkLntB29UnFBXaPsZhaCNAuay4/FZCAZ+le/Uw8oAVxwITbFd+zmCqc
	g3N+RXuLRLwlgKmLTPF2bgYqVpcsH1tm/ZRxHby6c6AQlRinRmt9CSBuY/Bh8MX4iXWzL32pV3Ys+
	74cpgV+eN6Wyzdbqmf88v1Y8Qc6qqD/eWTDsuAKtzWdrKACXsmtwDfRccbUmBuQxUVQVaQ/a+yBai
	xAQaB4hw==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1reflL-004AMc-1u;
	Mon, 26 Feb 2024 19:31:39 +0100
Date: Mon, 26 Feb 2024 19:31:38 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v15 15/23] PCI: microchip: Add event irqchip field to
 host port and add PLDA irqchip
Message-ID: <ZdzZClVcyHXKwsUJ@aurel32.net>
Mail-Followup-To: Minda Chen <minda.chen@starfivetech.com>,
	David Abdurachmanov <david.abdurachmanov@gmail.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
References: <20240218101831.113469-1-minda.chen@starfivetech.com>
 <20240218101831.113469-2-minda.chen@starfivetech.com>
 <SHXPR01MB0863FCE82CA2155E52A3EB6FE650A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <CAEn-LTphwFA6KgCZWsqiMMob2Xw4t4sCZ70U0u0z2=yJOpyGHA@mail.gmail.com>
 <SHXPR01MB0863DBBEB8C6AD12F3C0056DE657A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SHXPR01MB0863DBBEB8C6AD12F3C0056DE657A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_103209_584368_509B3868 
X-CRM114-Status: GOOD (  27.62  )
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

SGksCgpPbiAyMDI0LTAyLTIxIDEwOjEwLCBNaW5kYSBDaGVuIHdyb3RlOgo+IAo+IAo+ID4gCj4g
PiBPbiBUdWUsIEZlYiAyMCwgMjAyNCBhdCAxOjAy4oCvUE0gTWluZGEgQ2hlbiA8bWluZGEuY2hl
bkBzdGFyZml2ZXRlY2guY29tPgo+ID4gd3JvdGU6Cj4gPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4g
PiBBcyBQTERBIGR0cyBiaW5kaW5nIGRvYyhEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGNpLwo+ID4gPiA+IHBsZGEseHByZXNzcmljaDMtYXhpLWNvbW1vbi55YW1sKSBzaG93ZWQs
IFBMREEgUENJZSBjb250YWlucyBhbgo+ID4gPiA+IGludGVycnVwdCBjb250cm9sbGVyLgo+ID4g
PiA+Cj4gPiA+ID4gTWljcm9jaGlwIFBvbGFyRmlyZSBQQ0lFIGV2ZW50IElSUXMgaW5jbHVkZXMg
UExEQSBpbnRlcnJ1cHRzIGFuZAo+ID4gPiA+IFBvbGFyZmlyZSB0aGVpciBvd24gaW50ZXJydXB0
cy4gVGhlIGludGVycnVwdCBpcnFjaGlwIG9wcyBpbmNsdWRlcwo+ID4gPiA+IGFjay9tYXNrL3Vu
bWFzayBpbnRlcnJ1cHQgb3BzLCB3aGljaCB3aWxsIHdyaXRlIGNvcnJlY3QgcmVnaXN0ZXJzLgo+
ID4gPiA+IE1pY3JvY2hpcCBQb2xhcmZpcmUgUENJZSBhZGRpdGlvbmFsIGludGVycnVwdHMgcmVx
dWlyZSB0byB3cml0ZQo+ID4gPiA+IFBvbGFyZmlyZSBTb0Mgc2VsZi1kZWZpbmVkIHJlZ2lzdGVy
cy4gU28gTWljcm9jaGlwIFBDSWUgZXZlbnQgaXJxY2hpcCBvcHMgY2FuCj4gPiBub3QgYmUgcmUt
dXNlZC4KPiA+ID4gPgo+ID4gPiA+IFRvIHN1cHBvcnQgUExEQSBpdHMgb3duIGV2ZW50IElSUSBw
cm9jZXNzLCBpbXBsZW1lbnRzIFBMREEgaXJxY2hpcAo+ID4gPiA+IG9wcyBhbmQgYWRkIGV2ZW50
IGlycWNoaXAgZmllbGQgdG8gc3RydWN0IHBjaWVfcGxkYV9ycC4KPiA+ID4gPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE1pbmRhIENoZW4gPG1pbmRhLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4KPiA+
ID4gPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiA+ID4gPiAtLS0KPiA+ID4gPiAgLi4uL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1taWNyb2No
aXAtaG9zdC5jIHwgNjYgKysrKysrKysrKysrKysrKysrLQo+ID4gPiA+ICBkcml2ZXJzL3BjaS9j
b250cm9sbGVyL3BsZGEvcGNpZS1wbGRhLmggICAgICAgfCAgMyArCj4gPiA+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLW1pY3JvY2hpcC1o
b3N0LmMKPiA+ID4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLW1pY3JvY2hp
cC1ob3N0LmMKPiA+ID4gPiBpbmRleCBiM2RmMzczYTIxNDEuLmJlYWY1YzI3ZGE4NCAxMDA2NDQK
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1taWNyb2NoaXAt
aG9zdC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtbWlj
cm9jaGlwLWhvc3QuYwo+ID4gPiA+IEBAIC03NzAsNiArNzcwLDY0IEBAIHN0YXRpYyBzdHJ1Y3Qg
aXJxX2NoaXAgbWNfZXZlbnRfaXJxX2NoaXAgPSB7Cj4gPiA+ID4gICAgICAgLmlycV91bm1hc2sg
PSBtY191bm1hc2tfZXZlbnRfaXJxLCAgfTsKPiA+ID4gPgo+ID4gPiBIaSBUaG9tYXMKPiA+ID4g
ICBJIHRoaW5rIHRoaXMgcGF0Y2ggY29kZSBpdCBpcyBlYXN5IHRvIHJldmlldy4gSWYgeW91IGJ1
c3ksIENvdWxkIHlvdQo+ID4gPiBsZXQgb3RoZXIgSVJRIG1haW50YWluZXIgcmV2aWV3PyBUaGFu
a3MuCj4gPiA+Cj4gPiA+IEhpIExvcmVuem8sIEJqb3JuIGFuZCBLcnp5c3p0b2YKPiA+IAo+ID4g
SGkgTWluZGEsCj4gPiAKPiA+IFRoaXMgcGF0Y2hzZXQgc2VlbXMgdG8gaGF2ZSBicm9rZW4gdGhy
ZWFkaW5nIChsb3JlLCBtYWlsbWFuKS4gSSBoYXZlIHNlZW4gb3RoZXIKPiA+IGZvbGtzIG9uIElS
QyBtZW50aW9uaW5nIHRoYXQgdG9vLgo+ID4gCj4gPiBJIGFtIG5vdCBzdXJlIGlmIHRoYXQgcmVx
dWlyZXMgcmUtc2VuZGluZywgYnV0IGxldCdzIHdhaXQgZm9yIG90aGVycyB0byBjb21tZW50Lgo+
ID4gCj4gPiBDaGVlcnMsCj4gPiBkYXZpZAo+ID4gCj4gRG8geW91IG1lYW4gdGhlIGF1dG8gdGVz
dCBlcnJvciBpbiBsaW51eC1yaXNjdj8gCj4gSSBjYW4gc2VlIHRoYXQuIEJ1dCBJbiB2MTQgcmVz
ZW5kIHZlcnNpb24sIFRoZXJlIGlzIG5vIGVycm9yLiBWZXJzaW9uIDE1IGp1c3QgYWRkCj4gYSBu
ZXcgcGF0Y2guIE90aGVyIG5vIGNoYW5nZS4gSXQgaXMgdmVyeSBzdHJhbmdlLgo+IElmIG5vdCB0
aGlzIGVycm9yLCBJIHdpbGwgd2FpdGluZyBvdGhlcnMgY29tbWVudC4KClYxNSBpcyB3cm9uZ2x5
IHRocmVhZGVkOgotIFBhdGNoIDIgaGFzIG5vIEluLVJlcGx5LVRvIC8gSW4tUmVwbHktVG8gaGVh
ZGVycwotIFBhdGNoIDMgdG8gMTMgcmVmZXJlbmNlIHBhdGNoIDIgaW5zdGVhZCBvZiB0aGUgY292
ZXIgbGV0dGVyCi0gUGF0Y2ggMTQgaGFzIG5vIEluLVJlcGx5LVRvIC8gSW4tUmVwbHktVG8gaGVh
ZGVycwotIFBhdGNoIDE1IHJlZmVyZW5jZXMgcGF0Y2ggMTQgaW5zdGVhZCBvZiB0aGUgY292ZXIg
bGV0dGVyCi0gUGF0Y2ggMTYgaGFzIG5vIEluLVJlcGx5LVRvIC8gSW4tUmVwbHktVG8gaGVhZGVy
cwotIFBhdGNoIDE3IHRvIDIzIHJlZmVyZW5jZSBwYXRjaCAxNyBpbnN0ZWFkIG9mIHRoZSBjb3Zl
ciBsZXR0ZXIKClNhaWQgb3RoZXJ3aXNlLCB0aGUgcGF0Y2hlcyBhcHBlYXJzIGFzIChzb3JyeSBm
b3IgdGhlIGxvbmcgbGluZXMpOgoKW1BBVENIIHYxNSAwMC8yM10gUmVmYWN0b3JpbmcgTWljcm9j
aGlwIFBDSWUgZHJpdmVyIGFuZCBhZGQgU3RhckZpdmUgUENJZQrilJTilIA+W1BBVENIIHYxNSAw
MS8yM10gZHQtYmluZGluZ3M6IFBDSTogQWRkIFBMREEgWHByZXNzUklDSCBQQ0llIGhvc3QgY29t
bW9uIHByb3BlcnRpZXMKW1BBVENIIHYxNSAwMi8yM10gUENJOiBtaWNyb2NoaXA6IE1vdmUgcGNp
ZS1taWNyb2NoaXAtaG9zdC5jIHRvIHBsZGEgZGlyZWN0b3J5CuKUnOKUgD5bUEFUQ0ggdjE1IDAz
LzIzXSBQQ0k6IG1pY3JvY2hpcDogTW92ZSBQTERBIElQIHJlZ2lzdGVyIG1hY3JvcyB0byBwY2ll
LXBsZGEuaArilJzilIA+W1BBVENIIHYxNSAwNC8yM10gUENJOiBtaWNyb2NoaXA6IEFkZCBicmlk
Z2VfYWRkciBmaWVsZCB0byBzdHJ1Y3QgbWNfcGNpZQrilJzilIA+W1BBVENIIHYxNSAwNS8yM10g
UENJOiBtaWNyb2NoaXA6IFJlbmFtZSB0d28gUENJZSBkYXRhIHN0cnVjdHVyZXMK4pSc4pSAPltQ
QVRDSCB2MTUgMDYvMjNdIFBDSTogbWljcm9jaGlwOiBNb3ZlIFBDSWUgaG9zdCBkYXRhIHN0cnVj
dHVyZXMgdG8gcGxkYS1wY2llLmgK4pSc4pSAPltQQVRDSCB2MTUgMDcvMjNdIFBDSTogbWljcm9j
aGlwOiBSZW5hbWUgdHdvIHNldHVwIGZ1bmN0aW9ucwrilJzilIA+W1BBVENIIHYxNSAwOC8yM10g
UENJOiBtaWNyb2NoaXA6IENoYW5nZSB0aGUgYXJndW1lbnQgb2YgcGxkYV9wY2llX3NldHVwX2lv
bWVtcygpCuKUnOKUgD5bUEFUQ0ggdjE1IDA5LzIzXSBQQ0k6IG1pY3JvY2hpcDogTW92ZSBzZXR1
cCBmdW5jdGlvbnMgdG8gcGNpZS1wbGRhLWhvc3QuYwrilJzilIA+W1BBVENIIHYxNSAxMC8yM10g
UENJOiBtaWNyb2NoaXA6IFJlbmFtZSBpbnRlcnJ1cHQgcmVsYXRlZCBmdW5jdGlvbnMK4pSc4pSA
PltQQVRDSCB2MTUgMTEvMjNdIFBDSTogbWljcm9jaGlwOiBBZGQgbnVtX2V2ZW50cyBmaWVsZCB0
byBzdHJ1Y3QgcGxkYV9wY2llX3JwCuKUnOKUgD5bUEFUQ0ggdjE1IDEyLzIzXSBQQ0k6IG1pY3Jv
Y2hpcDogQWRkIHJlcXVlc3RfZXZlbnRfaXJxKCkgY2FsbGJhY2sgZnVuY3Rpb24K4pSU4pSAPltQ
QVRDSCB2MTUgMTMvMjNdIFBDSTogbWljcm9jaGlwOiBBZGQgSU5UeCBhbmQgTVNJIGV2ZW50IG51
bSB0byBzdHJ1Y3QgcGxkYV9ldmVudApbUEFUQ0ggdjE1IDE0LzIzXSBQQ0k6IG1pY3JvY2hpcDog
QWRkIGdldF9ldmVudHMoKSBjYWxsYmFjayBhbmQgYWRkIFBMREEgZ2V0X2V2ZW50KCkK4pSU4pSA
PltQQVRDSCB2MTUgMTUvMjNdIFBDSTogbWljcm9jaGlwOiBBZGQgZXZlbnQgaXJxY2hpcCBmaWVs
ZCB0byBob3N0IHBvcnQgYW5kIGFkZCBQTERBIGlycWNoaXAKW1BBVENIIHYxNSAxNi8yM10gUENJ
OiBtaWNyb2NoaXA6IE1vdmUgSVJRIGZ1bmN0aW9ucyB0byBwY2llLXBsZGEtaG9zdC5jCuKUnOKU
gD5bUEFUQ0ggdjE1IDE3LzIzXSBQQ0k6IHBsZGE6IEFkZCBldmVudCBiaXRtYXAgZmllbGQgdG8g
c3RydWN0IHBsZGFfcGNpZV9ycArilJzilIA+W1BBVENIIHYxNSAxOC8yM10gUENJOiBwbGRhOiBB
ZGQgaG9zdCBpbml0L2RlaW5pdCBhbmQgbWFwIGJ1cyBmdW5jdGlvbnMK4pSc4pSAPltQQVRDSCB2
MTUgMTkvMjNdIGR0LWJpbmRpbmdzOiBQQ0k6IEFkZCBTdGFyRml2ZSBKSDcxMTAgUENJZSBjb250
cm9sbGVyCuKUnOKUgD5bUEFUQ0ggdjE1IDIwLzIzXSBQQ0k6IEFkZCBQQ0lFX1JFU0VUX0NPTkZJ
R19ERVZJQ0VfV0FJVF9NUyB3YWl0aW5nIHRpbWUgdmFsdWUK4pSc4pSAPltQQVRDSCB2MTUgMjEv
MjNdIFBDSTogc3RhcmZpdmU6IEFkZCBKSDcxMTAgUENJZSBjb250cm9sbGVyCuKUnOKUgD5bUEFU
Q0ggdjE1IDIyLzIzXSBQQ0k6IHN0YXJmaXZlOiBPZmZsb2FkIHRoZSBOVk1lIHRpbWVvdXQgd29y
a2Fyb3VuZCB0byBob3N0IGRyaXZlcnMuCuKUlOKUgD5bUEFUQ0ggdjE1IDIzLzIzXSByaXNjdjog
ZHRzOiBzdGFyZml2ZTogYWRkIFBDSWUgZHRzIGNvbmZpZ3VyYXRpb24gZm9yIEpINzExMAoKSSAq
dGhpbmsqIGl0IGlzIHRoZSByZWFzb24gd2h5IHNvbWUgdG9vbHMgYXJlIG5vdCBhYmxlIHRvIGNv
bnNpZGVyIGFsbAp0aGUgcGF0Y2hlcyBhcyBhIHNpbmdsZSBwYXRjaHNldC4KClJlZ2FyZHMKQXVy
ZWxpZW4KCi0tIApBdXJlbGllbiBKYXJubyAgICAgICAgICAgICAgICAgICAgICAgICAgR1BHOiA0
MDk2Ui8xREREOEM5QgphdXJlbGllbkBhdXJlbDMyLm5ldCAgICAgICAgICAgICAgICAgICAgIGh0
dHA6Ly9hdXJlbDMyLm5ldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
