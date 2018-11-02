Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8B8C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 06:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3312081B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 06:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="drGGmi0z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3312081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hpe.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Lw40ciE1zHUKwMwb4y3kJdpDq/TjTW74mSXbVRfhbo=; b=drGGmi0zYsW2OR
	GqhZEL2ZdXD6WBDPt4Y5bGsWirOC2sDaOGe1q/L2OY8DzNF+1msJomvL1HA3biqd44XIwBPdwx7+l
	n0NJ7lzVD7rQTCcFn6LDdl6CT9QPCLR4dwCTgrrwcNuXGRazGgoxjPPAdWGpdz4HfrYcpEGBjUgbF
	ukKJVPyoP2bvvm3eyGq/NxbKsQFve9EaTy1z4nWrXzPN+FTwvmZMWe6yJk3EduM2gCTz27wQVCzPJ
	Uha3yXN58UmtlmBTRY9jfqjOuJAFs7mxI4WwPhP97gZBYAE1d0owvptmrs5ncezrIw1sx4LENkJbb
	ZG1cjD38l69BjU9Sc5pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gISzT-0001jr-60; Fri, 02 Nov 2018 06:31:31 +0000
Received: from g9t5009.houston.hpe.com ([15.241.48.73])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gISzQ-0001iR-CX
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 06:31:30 +0000
Received: from G9W8454.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.216.161.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5009.houston.hpe.com (Postfix) with ESMTPS id E2D38B9;
 Fri,  2 Nov 2018 06:31:13 +0000 (UTC)
Received: from G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) by
 G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) with Microsoft SMTP
 Server (TLS) id 15.0.1367.3; Fri, 2 Nov 2018 06:31:13 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.241.52.11) by
 G9W8454.americas.hpqcorp.net (16.216.161.4) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Fri, 2 Nov 2018 06:31:13 +0000
Received: from TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM (10.169.47.11) by
 TU4PR8401MB0399.NAMPRD84.PROD.OUTLOOK.COM (10.169.43.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.21; Fri, 2 Nov 2018 06:31:10 +0000
Received: from TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::40f:8c5:f31e:355f]) by TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::40f:8c5:f31e:355f%7]) with mapi id 15.20.1273.027; Fri, 2 Nov 2018
 06:31:10 +0000
From: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
To: Atish Patra <atish.patra@wdc.com>, Olof Johansson
 <olof.johansson@gmail.com>
Subject: RE: SBI extension proposal
Thread-Topic: SBI extension proposal
Thread-Index: AQHUcUbctwM8nXMZUU6atK0+B4IP1KU5tZ+AgAACy4CAABgfgIACMiUQ
Date: Fri, 2 Nov 2018 06:31:10 +0000
Message-ID:
 <TU4PR8401MB09581F92A2F7C0C7FFFA190EFFCF0@TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM>
References: <7f2a546a-6ebb-43c6-83a0-5e712ec2e2c7@wdc.com>
 <CAK-hmcQeiGa3BwnzEVB_dyhFiC7rXHFN-wTsJomg-jAo7a+v3Q@mail.gmail.com>
 <CAK-hmcSTg=AbXfDwx-O-8WuMsaVbJXP7Jd7HYoFh3jDJHGZ2iQ@mail.gmail.com>
 <cf729ca1-3ad0-8fe8-5cfa-d09d6c28d831@wdc.com>
In-Reply-To: <cf729ca1-3ad0-8fe8-5cfa-d09d6c28d831@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=abner.chang@hpe.com; 
x-originating-ip: [123.194.165.59]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; TU4PR8401MB0399;
 6:2+uspOFTH7NRXw/cfX/Ori0Bw6OW5eRhwMfDso7J3QZZD9ay0xGF178f49wzVo10owGYQlHE7HDcKB+SYg208BEyKCAJiXQkEi0VJDr/XHbuo9mKdnxpz89k2Z8sjXVQFJffe0I0VsuQz4hxSq+RU5K6lInFpiElL1nGIdVnAV3uM1jCYOHUWaHnSQdDVAJUQfINDkDJpGtEQk82cCEadsmUrcpWVcIbBJI/yrwO/is0E7SUN0YlAmS5GiAZuydmnMH9zeYnpU9zKLAvrNrvGEJcQ/W6RcyHBgKmecyB2InV1QJhmKl9dqad0tAf4OuX7Bq3u9qp1o5CUaVcaF5rxSSrilHgdc5A8rQWwjKUGolsb0rAuQwFuqbQUH2AaJtIUGgWe+Iasydbayp6UY7TO1lOUdpSnXn7yIdDsKT3BHtcXeJDVWGFKm9qxgsbw7f5ZCjN1jymjUowLUNnzbWv3Q==;
 5:0eZp+lsaQrf39+9urhHQZ1s395uTyNViwHBfyB4Jj8C1wQuQa3rDNX69U6BUIEwTsAi8avdRQTpnVmgZtb42JH/+ZkZ4IbWelZjz0O+t8zh6Yj72kqjwng53oRb4mfLqt1cVchLd6BQMwrb/wA3oyRMGZIIvtXkEztZs6WzZ3Ig=;
 7:MN2evawivuvXg3vxIBLk5bF/mFQtx3hxJi6H4JD0MzrkbbOZV7GNBYVp4KRLV5fSDBagf9XUVoOT8hfiaNVFegZtQzpMh7WzoZN9w854FGB8hxvWHZiZ3JGOnxugfdoa5cBmZL4tqi+yTcmWJyWn/g==
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39860400002)(189003)(199004)(105586002)(86362001)(66066001)(478600001)(256004)(93886005)(99286004)(14444005)(6116002)(7416002)(81156014)(7736002)(3846002)(81166006)(8676002)(14454004)(446003)(305945005)(2906002)(486006)(25786009)(11346002)(476003)(74316002)(26005)(33656002)(316002)(110136005)(39060400002)(71200400001)(8936002)(71190400001)(7696005)(3480700004)(76176011)(68736007)(186003)(4326008)(54906003)(6246003)(229853002)(2900100001)(97736004)(55016002)(6436002)(106356001)(7116003)(102836004)(53936002)(6506007)(5660300001)(9686003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TU4PR8401MB0399;
 H:TU4PR8401MB0958.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 08e4a4ef-18e9-4b98-9ca5-08d6408cc75b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:TU4PR8401MB0399; 
x-ms-traffictypediagnostic: TU4PR8401MB0399:
x-microsoft-antispam-prvs: <TU4PR8401MB03994D9365457942D4EACA58FFCF0@TU4PR8401MB0399.NAMPRD84.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231382)(944501410)(52105095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:TU4PR8401MB0399; BCL:0; PCL:0; RULEID:; SRVR:TU4PR8401MB0399; 
x-forefront-prvs: 08444C7C87
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: dAdq+8NZGbmV/TwZOPNwYNfLXrUwJiXT74Ub1310ssVu83U16fm3ZzZDvHN40LRNkGJpViIZlRz0ew+AxijTvgByxMXOEsAW4Fzo3dLbESoGBLATfPKowuxGWvJeRm/SLL5HUtpAKzMOMtXqB1aQytWAl3lB5Qrhp6zRhlrsqsR6gcXobDBfymC5QRwIkRmBPLTmwKkFAlynKeu8dDzpsTyqcDsTeSl4FHtQj34p8/g8tA1CflFNQY7JwpRH0H/o4Sa3HO+EDPbZmbtVedrt37fuClDwyjVsDK34dCyOPcx1knOznF16ZrSs5uVNYh6cTmRqfz2JSeGS+MDhMGONTmtXeObObW2OGWoFPQF3dAE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e4a4ef-18e9-4b98-9ca5-08d6408cc75b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2018 06:31:10.2451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TU4PR8401MB0399
X-OriginatorOrg: hpe.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_233128_518990_62266631 
X-CRM114-Status: GOOD (  17.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "zong@andestech.com" <zong@andestech.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Andrew Waterman <andrew@sifive.com>,
 "alankao@andestech.com" <alankao@andestech.com>, "Chen,
 Gilbert" <gilbert.chen@hpe.com>, "anup@brainfault.org" <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, "rjones@redhat.com" <rjones@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "vincentc@andestech.com" <vincentc@andestech.com>,
 "mjc@sifive.com" <mjc@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102063110.vHC8SlZXpBgHmqVyWSyaV-ukuRndNOQM4LOB_oNTlIs@z>

DQo+ID4+PiAtLSBpbnQgc2JpX2hhcnRfdXAodW5zaWduZWQgbG9uZyBoYXJ0aWQsIHVuc2lnbmVk
IGxvbmcgc3RhcnQsDQo+ID4+PiB1bnNpZ25lZCBsb25nIHByaXYpDQo+ID4+Pg0KPiA+Pj4gQnJp
bmdzIHVwICJoYXJ0aWQiIGVpdGhlciBkdXJpbmcgaW5pdGlhbCBib290IG9yIGFmdGVyIGENCj4g
Pj4+IHNiaV9oYXJ0X2Rvd24gU0JJIGNhbGwuDQo+ID4+Pg0KPiA+Pj4gInN0YXJ0IiBwb2ludHMg
dG8gYSBydW50aW1lLXNwZWNpZmllZCBhZGRyZXNzIHdoZXJlIGEgaGFydCBjYW4gZW50ZXINCj4g
Pj4+IGludG8gc3VwZXJ2aXNvciBtb2RlLiBUaGlzIG11c3QgYmUgYSBwaHlzaWNhbCBhZGRyZXNz
Lg0KPiA+Pj4NCj4gPj4+ICJwcml2IiBpcyBhIHByaXZhdGUgZGF0YSB0aGF0IGNhbGxlciBjYW4g
dXNlIHRvIHBhc3MgaW5mb3JtYXRpb24NCj4gPj4+IGFib3V0IGV4ZWN1dGlvbiBjb250ZXh0Lg0K
PiA+Pj4NCj4gPj4+IFJldHVybiB0aGUgYXBwcm9wcmlhdGUgU0JJIGVycm9yIGNvZGUuDQo+ID4+
Pg0KPiA+Pj4gLS0gaW50IHNiaV9oYXJ0X3N1c3BlbmQodTMyIHN0YXRlLCB1bnNpZ25lZCBsb25n
IHJlc3VtZV9lbnRyeSwNCj4gPj4+IHVuc2lnbmVkIGxvbmcgcHJpdikNCj4gPj4+DQo+ID4+PiBT
dXNwZW5kcyB0aGUgY2FsbGluZyBoYXJ0IHRvIGEgcGFydGljdWxhciBwb3dlciBzdGF0ZS4gU3Vz
cGVuZGVkDQo+ID4+PiBoYXJ0IHdpbGwgYXV0b21hdGljYWxseSB3YWtlLXVwIGJhc2VkIG9uIHNv
bWUgd2FrZXVwIGV2ZW50cyBhdA0KPiA+Pj4gcmVzdW1lX2VudHJ5IHBoeXNpY2FsIGFkZHJlc3Mu
DQo+ID4+Pg0KPiA+Pj4gInByaXYiIGlzIGEgcHJpdmF0ZSBkYXRhIHRoYXQgY2FsbGVyIGNhbiB1
c2UgdG8gcGFzcyBpbmZvcm1hdGlvbg0KPiA+Pj4gYWJvdXQgZXhlY3V0aW9uIGNvbnRleHQuIFRo
ZSBTQkkgaW1wbGVtZW50YXRpb24gbXVzdCBzYXZlIGEgY29weSBzbw0KPiA+Pj4gdGhhdCBjYWxs
ZXIgY2FuIHJldXNlIHdoaWxlIHJlc3RvcmluZyBoYXJ0IGZyb20gc3VzcGVuZC4NCj4gPj4+DQo+
ID4+PiBSZXR1cm4gdGhlIGFwcHJvcHJpYXRlIFNCSSBlcnJvciBjb2RlLg0KPiA+Pj4NCj4gPj4+
IC0tIGludCBzYmlfaGFydF9kb3duKCkNCj4gPj4+DQo+ID4+PiBJdCBwb3dlcnMgb2ZmIHRoZSBo
YXJ0IGFuZCB3aWxsIGJlIHVzZWQgaW4gY3B1LWhvdHBsdWcuDQo+ID4+PiBPbmx5IGluZGl2aWR1
YWwgaGFydCBjYW4gcmVtb3ZlIGl0c2VsZiBmcm9tIHN1cGVydmlzb3IgbW9kZS4gSXQgY2FuDQo+
ID4+PiBiZSBtb3ZlZCB0byBub3JtYWwgc3RhdGUgb25seSBieSBzYmlfaGFydF91cCBmdW5jdGlv
bi4NCj4gPj4+DQo+ID4+PiBSZXR1cm4gdGhlIGFwcHJvcHJpYXRlIFNCSSBlcnJvciBjb2RlLg0K
PiA+Pj4NCj4gPj4+IC0tIHUzMiBzYmlfaGFydF9zdGF0ZSh1bnNpZ25lZCBsb25nIGhhcnRpZCkN
Cj4gPj4+DQo+ID4+PiBSZXR1cm5zIHRoZSBSSVNDVl9QT1dFUl9TVEFURSBmb3IgYSBzcGVjaWZp
YyBoYXJ0aWQuIFRoaXMgd2lsbCBoZWxwDQo+ID4+PiBtYWtlIGtleGVjIGxpa2UgZnVuY3Rpb25h
bGl0eSBtb3JlIHJvYnVzdC4NCj4gPj4+DQo+ID4+PiAtLSB2b2lkIHNiaV9zeXN0ZW1fc2h1dGRv
d24oKQ0KPiA+Pj4NCj4gPj4+IFBvd2VycyBvZmYgdGhlIGVudGlyZSBzeXN0ZW0uDQo+ID4+DQo+
ID4+DQo+ID4+IFRoaXMgaXMgYSBzbGlnaHRseSB3ZWlyZCBvbmUgdG8gcHV0IGluIFNCSS4gVGhl
cmUncyB1c3VhbGx5IG90aGVyIGFjdGlvbnMNCj4gbmVlZGVkIGZvciBfc3lzdGVtXyBsZXZlbCBz
aHV0ZG93biwgc3VjaCBhcyBleHRlcm5hbCBwb3dlciByZWd1bGF0b3JzLg0KPiA+Pg0KPiANCj4g
VGhpcyBtaWdodCBiZSBiZWNhdXNlIG9mIG15IGxpbWl0ZWQga25vd2xlZGdlIG9uIHBvd2VyIG1h
bmFnZW1lbnQuDQpJbiBBQ1BJLCBpdCBkZWZpbmVzIHRoZSByZWdpc3RlciBibG9jayB0byBwdXQg
cHJvY2Vzc29yIGludG8gZGlmZmVyZW50IGxldmVscyBvZiBzbGVlcCBtb2RlIChzdXNwZW5kIG1v
ZGUpLiBIb3dldmVyLCB0aGlzIHJlcXVpcmVzIGFkZGl0aW9uYWwgcG93ZXIgbWFuYWdlbWVudCBj
b250cm9sbGVyIG9yIHByb2Nlc3NvciBDU1JzIG9uIFJJU0MtVi4gSWYgd2UgZG9u4oCZdCBjb25z
aWRlciBBQ1BJIGFuZCBIL1cgY2FwYWJpbGl0aWVzIG9mIHBvd2VyIE1HTVQgb24gUklTQy1WIGF0
IHRoaXMgbW9tZW50LCB0aGVuIFNCSSBmb3IgcHJvY2Vzc29yIHBvd2VyIG1hbmFnZW1lbnQgbWF5
IGJlIG5lZWRlZC4NCk15IHF1ZXN0aW9uIGlzIGNhbiBTQklfaGFydF91cCAoKSB0byBleGVjdXRl
ICJzdGFydCIgZXZlbiB0aGUgaGFydCBpcyBub3QgaW4gU3VzcGVuZCBvciBEb3duIHN0YXRlPyBJ
IGFtIGFza2luZyB0aGlzIGJlY2F1c2Ugb24gVUVGSSB3ZSB3b3VsZCBsaWtlIHRvIGhhdmUgU0JJ
IGZvciBzdXBlcnZpc29yIG1vZGUgZmlybXdhcmUgdG8gaW52b2tlIGZ1bmN0aW9ucyBwcm92aWRl
ZCBieSBNLW1vZGUgZHJpdmVyLCBqdXN0IHRyeWluZyB0byBsZXZlcmFnZSBTQklfaGFydF91cCAo
KSBmb3IgdGhpcyBpbnRlbnRpb24uIEhvd2V2ZXIsICJTdGFydCIgaXMgZGVmaW5lZCBhcyBhbiBh
ZGRyZXNzIHRvIGVudHJ5IGludG8gc3VwZXJ2aXNvciBtb2RlLiBXZSBtYXkgbmVlZCB0byBhZGQg
YW4gYWRkaXRpb25hbCBwYXJhbWV0ZXIgdG8gdGhpcyBTQkkgd2hpY2ggaW5kaWNhdGVzIHRoZSBw
cml2aWxlZ2UgdG8gZXhlY3V0ZSAiU3RhcnQiIHRob3VnaC4NCkZvcmdldCB0aGlzIGlmIHRoaXMg
U0JJIGlzIGRlZGljYXRlZCBmb3IgcHJvY2Vzc29yIHBvd2VyIG1hbmFnZW1lbnQuIFdlIGNhbiBw
cm9wb3NlIG5ldyBTQkkgZm9yIGFib3ZlIGludGVudGlvbi4NCg0KPiBXZSBhbHJlYWR5IGhhdmUg
YSBzeXN0ZW0gcmVzZXQgY2FsbCBpbiBTQkkgJiBQU0NJIGFsc28gaGFkIHN5c3RlbSBzaHV0ZG93
bg0KSXMgc3lzdGVtIHJlc2V0IGNhbGwgZGVmaW5lZCBpbiBTQkkgc3BlYyBhcyB3ZWxsPyBJIGRv
buKAmXQgc2VlIHRoaXMgaW4gR2l0aHViLg0KDQo+IGZ1bmN0aW9uLiBBcyBwZXIgbXkgdW5kZXJz
dGFuZGluZywgdGhpcyBBUEkgd2lsbCBwcm92aWRlIGEgd2F5IHRvIGhhbmRsZSBhbGwNCj4gY29t
bW9uIHN1c3BlbmQgcmVsYXRlZCBvcGVyYXRpb25zIG9uIG1hY2hpbmUgbW9kZS4NCj4gSW4gY2Fz
ZSBvZiB2aXJ0dWFsIE9TLCBpdCB3aWxsIG5vdCByZXN1bHQgaW4gYW55IGV4dGVybmFsIHBvd2Vy
IHJlZ3VsYXRpb25zLg0KDQoNCg0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
