Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AB4C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 10:12:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A7161164
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 10:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A7161164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y5YsVoPnHghbf4Tkir6/10PeBP0mmBIoqTulwi969iw=; b=eTEUtt5DV5OHOFqJ7brmDYbQ0
	mqf9GilWdK4SEa40czjO8SQmEN9SdNqLPLCjofLEgFKRpBWchpSdgFnTFlsnlIkCZiXrhd7L8ISoa
	PflI6YpCUgktGocN2F0VgCW1ETlxXOqCcoAdIMaNK10sDDj04Jr9l4RApT0O2nbAeyEloytAWnWy4
	9I/B+heV3G7DOgNwO+jtT/QfqVlOiYrvSIJfnq8822WGkzfmtiCUhOffxhsf4qqZ2wF1lUigpDgxm
	3EdUlNvyIinbKtoy+Lu62uOLEyrw0MGptlBanxyx1zURqnQWBQaf6nYmJWO99bHuMZ/ED50B+CGPb
	Ec0D5nVdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lds2P-00FwHC-IU; Tue, 04 May 2021 10:12:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lds2O-00FwH5-1X
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 10:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=kmDcSftNWk9Jr/mCQmhq2Elghmq2IS/Dkl3MPqeXw7I=; b=qLl8o7r1/ZLvsIjCwrGtA99rBW
 /ia7DLXOGsgU4UnHVOwKcPQBiqqwUbkcNwL1WMa3rserMomJrbUE8Am/tGpA5RSK7uWfu+nC5jeXS
 ShRC+XjACUcSwbXPBcErAnmaMKUJwxpPM/iYL1YhmaC1SKQFMaCmFLNcAvezYNlC+oTiHzcapxG0a
 f++rZAHJLX1G7jgcl/8/ia9HWc7nAUVU/WzB6b8O7hIhQ7ZRyije5c7D8WSMA2W6LtnLyF6HqQ/fa
 j1PVPDaf9b4d6+f8Rdx1j1w7qSqGt65tmAYiNF1sAXofLWHEpu0CfOHDwuofHrw75kMFXYygG15+D
 zMbA3S8Q==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lds2K-003srh-Kj
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 10:12:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CBB1D6E;
 Tue,  4 May 2021 03:12:09 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2D803F73B;
 Tue,  4 May 2021 03:12:06 -0700 (PDT)
Date: Tue, 4 May 2021 11:12:01 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com,
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, alex.dewar90@gmail.com,
 khilman@baylibre.com, hayashi.kunihiko@socionext.com,
 vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
Message-ID: <20210504101201.GA20729@lpieralisi>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <20210503164023.GA919777@bjorn-Precision-5520>
 <CAHCEeh+cMrEnHNG3W3ZNzdgT-m7BMorDawF6D8qkFYGg=RJMOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHCEeh+cMrEnHNG3W3ZNzdgT-m7BMorDawF6D8qkFYGg=RJMOw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_031216_800821_79079375 
X-CRM114-Status: GOOD (  31.66  )
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

T24gVHVlLCBNYXkgMDQsIDIwMjEgYXQgMDM6MjA6MDBQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdy
b3RlOgo+IEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQ15pyI
NOaXpSDpgLHkuowg5LiK5Y2IMTI6NDDlr6vpgZPvvJoKPiA+Cj4gPiBPbiBUdWUsIEFwciAwNiwg
MjAyMSBhdCAwNToyNjoyOFBNICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6Cj4gPiA+IFRoaXMg
cGF0Y2hzZXQgaW5jbHVkZXMgU2lGaXZlIEZVNzQwIFBDSWUgaG9zdCBjb250cm9sbGVyIGRyaXZl
ci4gV2UgYWxzbwo+ID4gPiBhZGQgcGNpZV9hdXggY2xvY2sgYW5kIHBjaWVfcG93ZXJfb25fcmVz
ZXQgY29udHJvbGxlciB0byBwcmNpIGRyaXZlciBmb3IKPiA+ID4gUENJZSBkcml2ZXIgdG8gdXNl
IGl0Lgo+ID4KPiA+IEkgZHJvcHBlZCB0aGlzIHNlcmllcyBiZWNhdXNlIG9mIHRoZSBidWlsZCBw
cm9ibGVtIEkgbWVudGlvbmVkIFsxXS4KPiA+IEl0IHdpbGwgbm90IGJlIGluY2x1ZGVkIGluIHY1
LjEzIHVubGVzcyB0aGUgYnVpbGQgcHJvYmxlbSBpcyBmaXhlZAo+ID4gQVNBUC4KPiA+Cj4gPiBb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMDQyODE5NDcxMy5HQTMxNDk3NUBiam9y
bi1QcmVjaXNpb24tNTUyMAo+ID4KPiAKPiBIaSBhbGwsCj4gCj4gVGhpcyBidWlsZCBmYWlsZWQg
aW4geDg2XzY0IGlzIGJlY2F1c2UgQ09ORklHX0dQSU9MSUIgaXMgZGlzYWJsZWQgaW4KPiB0aGUg
dGVzdGluZyBjb25maWcuCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL0tjb25maWcKPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKPiBpbmRl
eCAwYTM3ZDIxZWQ2NGUuLjU2YjY2ZTFmZWQ1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
S2NvbmZpZwo+IEBAIC0zMjMsNiArMzIzLDcgQEAgY29uZmlnIFBDSUVfRlU3NDAKPiAgICAgICAg
IGRlcGVuZHMgb24gUENJX01TSV9JUlFfRE9NQUlOCj4gICAgICAgICBkZXBlbmRzIG9uIFNPQ19T
SUZJVkUgfHwgQ09NUElMRV9URVNUCj4gICAgICAgICBzZWxlY3QgUENJRV9EV19IT1NUCj4gKyAg
ICAgICBzZWxlY3QgR1BJT0xJQgoKSSB0aGluayB0aGF0IGFuIGluY2x1ZGU6CgojaW5jbHVkZSA8
bGludXgvZ3Bpby9jb25zdW1lci5oPgoKaW4gdGhlIGRyaXZlciB3b3VsZCBkby4gU3RpbGwsIEkg
YmVsaWV2ZSB3ZSBzaG91bGQgYWxzbyBhZGQgYQoiZGVwZW5kcyBvbiIgaW4gdGhlIEtjb25maWcg
ZW50cnkgcmF0aGVyIHRoYW4gYSAic2VsZWN0Ii4KClBsZWFzZSBsZXQgbWUga25vdyBhcyBzb29u
IGFzIHBvc3NpYmxlLgoKTG9yZW56bwoKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgU2F5IFkg
aGVyZSBpZiB5b3Ugd2FudCBQQ0llIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgdGhlIFNpRml2ZQo+
ICAgICAgICAgICBGVTc0MC4KPiAKPiBBZnRlciBhcHBseWluZyB0aGlzIGNoYW5nZSwgaXQgY2Fu
IGJ1aWxkIHBhc3MuCj4gCj4gPiA+IFRoaXMgaXMgdGVzdGVkIHdpdGggZTEwMDBlOiBJbnRlbChS
KSBQUk8vMTAwMCBOZXR3b3JrIENhcmQsIEFNRCBSYWRlb24gUjUKPiA+ID4gMjMwIGdyYXBoaWNz
IGNhcmQgYW5kIFNQIE0uMiBQQ0llIEdlbiAzIFNTRCBpbiBTaUZpdmUgVW5tYXRjaGVkIGJhc2Vk
IG9uCj4gPiA+IHY1LjExIExpbnV4IGtlcm5lbC4KPiA+ID4KPiA+ID4gQ2hhbmdlcyBpbiB2NToK
PiA+ID4gIC0gRml4IHR5cG8gaW4gY29tbWVudHMKPiA+ID4gIC0gS2VlcCBjb21tZW50cyBzdHls
ZSBjb25zaXN0ZW50Cj4gPiA+ICAtIFJlZmluZSBzb21lIGVycm9yIGhhbmRsaW5nIGNvZGVzCj4g
PiA+ICAtIFJlbW92ZSB1bm5lZWRlZCBoZWFkZXIgZmlsZSBpbmNsdWRpbmcKPiA+ID4gIC0gTWVy
Z2UgZnU3NDBfcGNpZV9sdHNzbV9lbmFibGUgaW1wbGVtZW50YXRpb24gdG8gZnU3NDBfcGNpZV9z
dGFydF9saW5rCj4gPiA+Cj4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiA+ICAtIEZpeCBXdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUgd2FybmluZyBpbiBwcmNpIGRyaXZlcgo+ID4gPgo+ID4gPiBDaGFu
Z2VzIGluIHYzOgo+ID4gPiAgLSBSZW1vdmUgaXRlbXMgdGhhdCBoYXMgYmVlbiBkZWZpbmVkCj4g
PiA+ICAtIFJlZmluZSBmb3JtYXQgb2Ygc2lmaXZlLGZ1NzQwLXBjaWUueWFtbAo+ID4gPiAgLSBS
ZXBsYWNlIHBlcnN0bi1ncGlvcyB3aXRoIHRoZSBjb21tb24gb25lCj4gPiA+ICAtIENoYW5nZSBE
QkkgbWFwcGluZyBzcGFjZSB0byAyR0IgZnJvbSA0R0IKPiA+ID4gIC0gUmVmaW5lIGRyaXZlcnMv
cmVzZXQvS2NvbmZpZwo+ID4gPgo+ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPiAgLSBSZWZpbmUg
Y29kZXMgYmFzZWQgb24gcmV2aWV3ZXJzJyBmZWVkYmFjawo+ID4gPiAgLSBSZW1vdmUgZGVmaW5l
IGFuZCB1c2UgdGhlIGNvbW1vbiBvbmUKPiA+ID4gIC0gUmVwbGFjZSBfX3Jhd193cml0ZWwgd2l0
aCB3cml0ZWxfcmVsYXhlZAo+ID4gPiAgLSBTcGxpdCBmdTc0MF9waHlyZWdyZWFkd3JpdGUgdG8g
d3JpdGUgZnVuY3Rpb24KPiA+ID4gIC0gVXNlIHJlYWRsX3BvbGxfdGltZW91dCBpbiBzdGVhZCBv
ZiB3aGlsZSBsb29wIGNoZWNraW5nCj4gPiA+ICAtIFVzZSBkd2MgY29tbW9uIGNvZGVzCj4gPiA+
ICAtIFVzZSBncGlvIGRlc2NyaXB0b3JzIGFuZCB0aGUgZ3Bpb2RfKiBhcGkuCj4gPiA+ICAtIFJl
cGxhY2UgZGV2bV9pb3JlbWFwX3Jlc291cmNlIHdpdGggZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlX2J5bmFtZQo+ID4gPiAgLSBSZXBsYWNlIGRldm1fcmVzZXRfY29udHJvbF9nZXQgd2l0
aCBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZQo+ID4gPiAgLSBBZGQgbW9yZSBjb21t
ZW50cyBmb3IgZGVsYXkgYW5kIHNsZWVwCj4gPiA+ICAtIFJlbW92ZSAicGh5ID8geCA6IHkiIGV4
cHJlc3Npb25zCj4gPiA+ICAtIFJlZmluZSBjb2RlIGxvZ2ljIHRvIHJlbW92ZSBwb3NzaWJsZSBp
bmZpbml0ZSBsb29wCj4gPiA+ICAtIFJlcGxhY2UgbWFnaWMgbnVtYmVyIHdpdGggbWVhbmluZ2Z1
bCBkZWZpbmUKPiA+ID4gIC0gUmVtb3ZlIGZ1NzQwX3BjaWVfcG1fb3BzCj4gPiA+ICAtIFVzZSBi
dWlsdGluX3BsYXRmb3JtX2RyaXZlcgo+ID4gPgo+ID4gPiBHcmVlbnRpbWUgSHUgKDUpOgo+ID4g
PiAgIGNsazogc2lmaXZlOiBBZGQgcGNpZV9hdXggY2xvY2sgaW4gcHJjaSBkcml2ZXIgZm9yIFBD
SWUgZHJpdmVyCj4gPiA+ICAgY2xrOiBzaWZpdmU6IFVzZSByZXNldC1zaW1wbGUgaW4gcHJjaSBk
cml2ZXIgZm9yIFBDSWUgZHJpdmVyCj4gPiA+ICAgTUFJTlRBSU5FUlM6IEFkZCBtYWludGFpbmVy
cyBmb3IgU2lGaXZlIEZVNzQwIFBDSWUgZHJpdmVyCj4gPiA+ICAgZHQtYmluZGluZ3M6IFBDSTog
QWRkIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlcgo+ID4gPiAgIHJpc2N2OiBkdHM6
IEFkZCBQQ0llIHN1cHBvcnQgZm9yIHRoZSBTaUZpdmUgRlU3NDAtQzAwMCBTb0MKPiA+ID4KPiA+
ID4gUGF1bCBXYWxtc2xleSAoMSk6Cj4gPiA+ICAgUENJOiBmdTc0MDogQWRkIFNpRml2ZSBGVTc0
MCBQQ0llIGhvc3QgY29udHJvbGxlciBkcml2ZXIKPiA+ID4KPiA+ID4gIC4uLi9iaW5kaW5ncy9w
Y2kvc2lmaXZlLGZ1NzQwLXBjaWUueWFtbCAgICAgICB8IDExMyArKysrKysrCj4gPiA+ICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwo+ID4gPiAg
YXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvZnU3NDAtYzAwMC5kdHNpICAgIHwgIDMzICsrCj4g
PiA+ICBkcml2ZXJzL2Nsay9zaWZpdmUvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Kwo+ID4gPiAgZHJpdmVycy9jbGsvc2lmaXZlL2Z1NzQwLXByY2kuYyAgICAgICAgICAgICAgIHwg
IDExICsKPiA+ID4gIGRyaXZlcnMvY2xrL3NpZml2ZS9mdTc0MC1wcmNpLmggICAgICAgICAgICAg
ICB8ICAgMiArLQo+ID4gPiAgZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMgICAgICAg
ICAgICAgIHwgIDU0ICsrKwo+ID4gPiAgZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmgg
ICAgICAgICAgICAgIHwgIDEzICsKPiA+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tj
b25maWcgICAgICAgICAgICB8ICAgOSArCj4gPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwo+ID4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1mdTc0MC5jICAgICAgIHwgMzA4ICsrKysrKysrKysrKysrKysrKwo+ID4gPiAg
ZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+
ID4gIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc2lmaXZlLWZ1NzQwLXByY2kuaCB8ICAgMSAr
Cj4gPiA+ICAxMyBmaWxlcyBjaGFuZ2VkLCA1NTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wY2kvc2lmaXZlLGZ1NzQwLXBjaWUueWFtbAo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYwo+ID4gPgo+ID4gPiAtLQo+
ID4gPiAyLjMwLjIKPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
