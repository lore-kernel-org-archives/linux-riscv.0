Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F3BC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 02:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUVMP2L7El8lvG0CVH9Qmv4k3+NRCCCLbLZTHDeFwzY=; b=xCENWgq7m+AQVT
	ANyVWm6FQtf9d2gaBIvrvO16kM4DGW/EQoPWzgmk9sxHCw5gTR1hmXTowcQ1PFpPSNpmCtC+Gn2hF
	JkdFuuA6QNwPYjxZHlPu0331YyoaymGj8VXqG28SRqxqhj9v2HE97NQo1I5qdwFmHDaL0Vf2NUbTy
	6te6NGy79+Q92GIjdvTUJpaBAk7iDYiIeKWihS10p1QmkxC3lVNILHw2HFOkzQZTxlMCiLk4pNp4D
	Mf1ZOEXzUHIR3xkt1/VLKdHXxu5qG/BpjzZDC8xvwzG67G0URqYIp9bQddG+TnnETT+z/oqlPqlCf
	VD0oQVvx8fRltkcSszZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpJN-00Bmuq-JX; Tue, 28 Feb 2023 02:01:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWpJK-00BmtA-5J
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 02:01:47 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 362B824E16E;
	Tue, 28 Feb 2023 10:00:57 +0800 (CST)
Received: from EXMBX163.cuchost.com (172.16.7.73) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 10:00:57 +0800
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX163.cuchost.com
 (172.16.6.73) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 28 Feb
 2023 10:00:56 +0800
Received: from EXMBX061.cuchost.com ([fe80::b087:fbb:9f87:209e]) by
 EXMBX061.cuchost.com ([fe80::b087:fbb:9f87:209e%14]) with mapi id
 15.00.1497.044; Tue, 28 Feb 2023 10:00:56 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>, Song Shuai
	<suagrfillet@gmail.com>
CC: "corbet@lwn.net" <corbet@lwn.net>, "alexs@kernel.org" <alexs@kernel.org>,
	"siyanteng@loongson.cn" <siyanteng@loongson.cn>, "robh@kernel.org"
	<robh@kernel.org>, "palmer@rivosinc.com" <palmer@rivosinc.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] sched/doc: supplement CPU capacity with RISC-V
Thread-Topic: [PATCH] sched/doc: supplement CPU capacity with RISC-V
Thread-Index: AQHZSpq2x4Tv+NIInUmyvON4k7Hisa7iKdIAgAAMR4CAAAQ8AIABXwiw
Date: Tue, 28 Feb 2023 02:00:56 +0000
Message-ID: <49412393956e428fbc7d27ddecee3493@EXMBX061.cuchost.com>
References: <20230227105941.2749193-1-suagrfillet@gmail.com>
 <Y/yagE7jfRGo1FgY@wendy>
 <CAAYs2=jSt9=d=N98DCVvtNA9FE6KcVYVdHPG-wpuDPknBFUndQ@mail.gmail.com>
 <Y/yoWt+Y7n8/A6m9@wendy>
In-Reply-To: <Y/yoWt+Y7n8/A6m9@wendy>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_180146_517711_C241CDC9 
X-CRM114-Status: GOOD (  21.96  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSAyNywg
MjAyMyA4OjU2IFBNDQo+IFRvOiBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+DQo+
IENjOiBjb3JiZXRAbHduLm5ldDsgYWxleHNAa2VybmVsLm9yZzsgc2l5YW50ZW5nQGxvb25nc29u
LmNuOw0KPiByb2JoQGtlcm5lbC5vcmc7IHBhbG1lckByaXZvc2luYy5jb207IExleWZvb24gVGFu
DQo+IDxsZXlmb29uLnRhbkBzdGFyZml2ZXRlY2guY29tPjsgbGludXgtZG9jQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc2NoZWQvZG9jOiBzdXBwbGVt
ZW50IENQVSBjYXBhY2l0eSB3aXRoIFJJU0MtVg0KPiANCj4gT24gTW9uLCBGZWIgMjcsIDIwMjMg
YXQgMTI6NDA6NDVQTSArMDAwMCwgU29uZyBTaHVhaSB3cm90ZToNCj4gPiBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiDkuo4yMDIz5bm0MuaciDI35pel5ZGo5LiADQo+
IDExOjU35YaZ6YGT77yaDQo+ID4gPg0KPiA+ID4gT24gTW9uLCBGZWIgMjcsIDIwMjMgYXQgMDY6
NTk6NDFQTSArMDgwMCwgU29uZyBTaHVhaSB3cm90ZToNCj4gPiA+ID4gVGhpcyBjb21taXQgN2Qy
MDc4MzEwY2JmICgiZHQtYmluZGluZ3M6IGFybTogbW92ZSBjcHUtY2FwYWNpdHkgdG8NCj4gPiA+
ID4gYSBzaGFyZWQgbG9hdGlvbiIpIHVwZGF0ZXMgc29tZSByZWZlcmVuY2VzIGFib3V0DQo+ID4g
PiA+IGNhcGFjaXR5LWRtaXBzLW1oeg0KPiA+ID4NCj4gPiA+IE5vdCByZXF1ZXN0aW5nIGEgcmVz
cGluIGZvciB0aGlzLCBidXQgbWVudGlvbmluZyBjb21taXQgOTkxOTk0NTA5ZWU5DQo+ID4gPiAo
ImR0LWJpbmRpbmdzOiByaXNjdjogYWRkIGEgY2FwYWNpdHktZG1pcHMtbWh6IGNwdSBwcm9wZXJ0
eSIpIGlzDQo+ID4gPiBwcm9iYWJseSBtb3JlIHJlbGV2YW50IGFzIGEganVzdGlmaWNhdGlvbiBm
b3IgdGhpcyBjaGFuZ2UuDQo+ID4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBjb3JyZWN0aW9uLCBJ
J2xsIHBheSBhdHRlbnRpb24gbmV4dCB0aW1lLg0KPiA+DQo+ID4gSSBoYXZlIGEgcXVlc3Rpb24g
YWJvdXQgdGhlIHBhdGNoIHlvdSBtZW50aW9uZWQ6DQo+ID4gVGhlIHBhdGNoIHVzZXMgY3B1X3Nj
YWxlIHBlcl9jcHUgdmFyaWFibGUgdG8gc3RvcmUgdGhlIENQVSBjYXBhY2l0eQ0KPiA+IHRocm91
Z2ggYXJjaF90b3BvbG9neSwgQnV0IGFyY2hfc2NhbGVfY3B1X2NhcGFjaXR5KCkgaW50ZXJmYWNl
IHNlZW1zDQo+ID4gbm90IGRlZmluZWQgdG8gZGVsaXZlciB0aGUgY3B1X3NjYWxlIHRvIHRoZSBz
Y2hlZHVsZXIgSW4gY29udHJhc3QsDQo+ID4gYXJtNjQgZGVmaW5lcyBpdCBhcyB0aGUgdG9wb2xv
Z3lfZ2V0X2NwdV9zY2FsZSgpIGluIGl0cw0KPiA+IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdG9w
b2xvZ3kuaC4NCj4gPiBJcyB0aGlzIGFuIG92ZXJzaWdodCBvciBhIHBhcnRpY3VsYXIgcHVycG9z
ZT8NCj4gDQo+IEludGVudGlvbmFsIG92ZXJzaWdodCBJIHN1cHBvc2U/IEl0IHdhc24ndCBteSBp
bnRlbnRpb24gdG8gZG8gYW55dGhpbmcgb3RoZXINCj4gdGhhbiBkb2N1bWVudCB0aGUgcHJvcGVy
dHkgdGhhdCBwZW9wbGUgd2VyZSBhbHJlYWR5IHVzaW5nIGluIHRoZWlyDQo+IGRldmljZXRyZWVz
IChhbmQgZmluZGluZyBidWdzIHdpdGghKS4NCj4gSW4gcmV0cm9zcGVjdCwgcGVyaGFwcyBpdCBp
cyBiZXR0ZXIgaWYgSSB1bi1yZXZpZXcgdGhpcyBwYXRjaCB1bnRpbCB3ZSBrbm93IGl0IGlzDQo+
IHBsdW1iZWQgaW50byB0aGUgc2NoZWR1bGVyIHByb3Blcmx5Pw0KPiANCj4gTGV5IEZvb24gVGFu
IGlzIHRoZSBvbmUgdGhhdCBmb3VuZCB0aGUgUklTQy1WIGJ1Z3Mgd2l0aCB0aGlzIHByb3BlcnR5
IGluIHRoZWlyDQo+IGRldmljZXRyZWUsIHNvIHBlcmhhcHMgdGhleSd2ZSBhbHJlYWR5IGRvbmUg
dGhlIHdvcmsgaGVyZT8NCg0KSSBoYXZlIGZldyBwYXRjaGVzIHRvIHdpcmUgdXAgZmV3IGFyY2hf
Kl90b3BvbG9neSBmdW5jdGlvbnMgZm9yIFJJU0MtViBhcmNoaXRlY3R1cmUuIEJ1dCBoYXZlbid0
IHNlbmQgb3V0IHRvIE1MLg0KDQpSZWdhcmRzDQpMZXkgRm9vbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
