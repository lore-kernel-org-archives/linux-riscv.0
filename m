Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AEDC4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 08:00:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7096D208D5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 08:00:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLFH82Jo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lsoj8+VP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="x40Y9Fb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7096D208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9DB2052gQWKdcyYq5JTYrBuSo74xWZ1/weZNfUlmBo=; b=CLFH82JovxQSAHCkEGgqr+DH5M
	NL41dfvObVawI1gmdjEKV7xXsl7oreYYzN4zeyQXLGIkYsKGY6G1Ir0pK40Nokw50pchdURNSDSF+
	tdXoDx4GN287SVJCC5jMQyR5IJVuthd0CdkYXXofWEk44+DrOTSdqcHmyePYbkKYstQDUqdNieGyz
	8+RMtSbtxxrJnLPLHxxTD/GURTf6kTvuOU8RcUzM6MbQgpoOb6Obv7EMNdLvWLELaQXixDBL34Dnm
	gIp/eqagFdf13HFRNJbbKDszbRKMAosNtVKhiTw3flzXoi0ly+QzARNe80CRmbf24SqpiNjCUZhM6
	/FF5rucw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdU0Q-00013G-Tq; Fri, 13 Nov 2020 08:00:26 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdU0N-00012q-T1
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 08:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605254423; x=1636790423;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=LYcLw8jkHx8JbZCRWZyBDV2BWsXYcnc64X7t9vHrni8=;
 b=lsoj8+VPoF+UTxk0tUFg3IeM7KLZ3wivbvx9Hn2Ry5w9pU2/+N9iJotq
 267QEWOz66El7piUMdgSdcR9ykKaFFREJVZnJIrp9LUhYM9ZciJzPrWCm
 nws25L1JVeaPkzDAgy+BU97/B2ZtrJ3teC7RR1F4ypfgxgJdXXNdiQsSX
 aIUtSFfV9kDj4SNj/AIOcMRcNnHKL9STAlUPszoA3801PlHG5tjsLJEvr
 kxm4A3Zq2PtA0DOTpWoM7cRBj/qtcoMMUXzbfDsph909NPaLMuYWgmXnu
 T8VxY+h823gWaRzy1O6MKG5bYLK//f8qE9qcSap2MPFas8oz9nZ7NuXXV Q==;
IronPort-SDR: jf78yetHnnQpmdJHzqZdjanhn7GNzsWiuhHvxFVTnDUrnjeI/c9WpOT3Yxw1SkE1uUeMv2x6wk
 i/HU0toW5J+xLQGj8REDlHqJNafrJVHHW4h4GBRPwk/LRv8RrUDrsth2J9kJzd6hqkLxCjxtv5
 23tERMzqTp+FwqY4w1daSpc3wbhRF5W0MWTgCqhxy5aL++5iMBto3IX8yvB6nbsF/Rcec8hBGC
 rzhpZtR2OcRRgw4CqfELyUnQECq+EvM4+xqZBzjJXjeZS6gdu+DEuVLrBgVxVXOaZuULcLkJjs
 aZI=
X-IronPort-AV: E=Sophos;i="5.77,474,1596470400"; d="scan'208";a="152651963"
Received: from mail-bn7nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.108])
 by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2020 16:00:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gey4I6HImxfqbU1ve5aCGnYPmWk+QItVbFa6r+MXot2dDy3+KQcePccDhvK19+4BE80fbcdHpIVXBqD8fXApET1+JxtX4A55zQjehkO+Rygb8vU1QUHjz/nHr5hfIUNg2FsjfTy3eGgEgFWFYyyfTxDwph9LqO1ry/KxpjziryCo7zF4d+tt1JjeYuORakZ7fFBh1Rkbn9XaqLif+1WGv/zuwnupyI3XIUgtLA+Cab1DenfOeKCPah4sYN/JvbnEEUx5JeQ5kfDF9bXHnJJjRWjCqIA42ZYmSkmgJXAoitxThd0ObhVv2Y7Z/wwYq3H0HtBvUFtuNsSLotO9FDjS3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYcLw8jkHx8JbZCRWZyBDV2BWsXYcnc64X7t9vHrni8=;
 b=kEpfNqNDx7x+rVzruBp8Z4UFb+PPzS8HLBIt4Wntc0oovifDXnULrORXXma468gbvjZkwe6OcyAnG39NpZ+6lmwbPx0nCGKK12e3r7Ql1xaCa+cNV6UAyGoQUBHPZflyfpErkw1wqCh25wcOcRJfHdnMzOUTZ5f+sVtZBKmJT5+bODSCcEDdpb67/mZa4boig0MwcTU99KqI3P01ZN1qYU6bKDcMqWH9veAuSC4ymn6XpkbfYTSvZI4W6K+15m7aPDpxeDwgQGEbkBxyMzAh4t4yOa21JxQH0OjlOYcY5b/gl15dqemu7xUtEbr8vSCQX/4wiTaJ8GZRppR8h9eOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYcLw8jkHx8JbZCRWZyBDV2BWsXYcnc64X7t9vHrni8=;
 b=x40Y9Fb91lV1J0O69zShBjphCLa/R4Zf1ojdb+1yFeOlYtFb2gZ+J8sPMPcf2rK6CQuU0j6HdgpVjPRWaM8SL0q9ekh54LiQnQZ8PFRGbLApycUtXfGzSnb2ifIaDutyd46X8fj5UjQ2rajOwlJxsmNaaYQxhh+8UO3fu3N7uvg=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6352.namprd04.prod.outlook.com (2603:10b6:208:1ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Fri, 13 Nov
 2020 08:00:20 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 08:00:20 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "broonie@kernel.org" <broonie@kernel.org>, 
 "seanga2@gmail.com" <seanga2@gmail.com>, "fancer.lancer@gmail.com"
 <fancer.lancer@gmail.com>
Subject: Re: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Thread-Topic: [PATCH 06/32] spi: dw: Add support for the Kendryte K210 SoC
Thread-Index: AQHWtN4N0wumwRzXdUGPL6nbxUOPp6m8qtQAgAkRfoA=
Date: Fri, 13 Nov 2020 08:00:20 +0000
Message-ID: <b84dc6fbe9116c75c0fd07d8ddc149caf13cfc16.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-7-damien.lemoal@wdc.com>
 <53859725-ca0b-5f57-9147-10346707b3cb@gmail.com>
In-Reply-To: <53859725-ca0b-5f57-9147-10346707b3cb@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e131d735-ae71-4d93-5a2d-08d887aa2b08
x-ms-traffictypediagnostic: MN2PR04MB6352:
x-microsoft-antispam-prvs: <MN2PR04MB635280E1B5EF10192E002FBDE7E60@MN2PR04MB6352.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LXbydiyu2trAaFIgVxnmhgAHYdA+2HFWGetY0i0HeG+vs/T2GhE3WN+UUuv/BbcncxFjlX1aEbpbIrmwMrBWV6H7vOajVXzgOdmdkWFx7HhNU3h+upRiSGvcyiwKPy++FT9yEfCfe/wOgUGyiiHOq1ycfZXqBBW4UeGrCRUJGEg1vSTWJ94tb53gASnbyqgcdplnDfj384lLhEJzYOqfV2vaQAORtI2l+4sXg7eS03hRXTUXXiTGcUPyAiaIJFjRjduVYbmfvCTjscY2bN3v/Ttk8G+zpPHtdQ5+j3/FraoCXrNyWuJmT/E1CO3NJMWYM0+1op/NebN4hbmC/lH/Pg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(71200400001)(91956017)(186003)(66556008)(83380400001)(36756003)(76116006)(66446008)(64756008)(8676002)(6486002)(2906002)(8936002)(478600001)(66476007)(66946007)(6506007)(86362001)(316002)(53546011)(110136005)(6512007)(2616005)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: DolMrwM1uzd0cEgshHtgqTFRiA7bngD4LtiUkiTrYASMs/36F1Cvi1coX8WFQfZnuuoXbNwsamm42XP5VYKRnY8W/9tVsctTNkO5DCGhiVT7wGTIbAziNY/+8Q8C3Niswi5toc9O79NFyjH7w4RIfFqSO+M/zHEaXj2Jfwg6UZEFc5DtNTHOWn5aJJfe2AwUwOMczu4pJE88+UmvYOXav6LZxBkqpZ8fgOoTmKcDVhRCp8IJ/ui72y/VkwmABzQXWuSYBxuoWXCw0CwL3Fs+KxmoNxNL/BSZveQtmZU9j1vgMc7h7Z9NrVqaMPW4hO0Vwkc/ZYmI+6rIITqSuQi6b/RoFErT0eZb332hYu3UipDA7oaOihu4lyZtrys0lHKlXD03rNeMv83lXYyJupOjexxh4CwigHO7x3q1Cie0oyXVugIQMR164HkX1cT1/dxSbr4kzEQ/R6LPvdnwZ0ni+R7pfkdJUwptwE2KbsPP+DHJCTOP+JIvlBBOUfkvGFHwzbm/uVnoO5MuxXNiYvwKt4BfQOo95CE77+L3LP2ZSQ0rn8knZNTiMo2wTwtpsps0ybe8BZgF5pdWuYdqgQ5lUzLnZjGa7fuBj/qO+MqTPM1nN+RCs9BnhhWxRJ04RgVPRBQAcCqjYLBp8Kq/v0ux92mIOJQhiOvXwxjHdB3hxJZdI8cxIIH9OUaS63+owubGi1RXe+asIDjfvIXDl0hGvg==
x-ms-exchange-transport-forked: True
Content-ID: <20FB9CDB9EE8A54D83EBA14B140587DD@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e131d735-ae71-4d93-5a2d-08d887aa2b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 08:00:20.7723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hNXTd9a3xG+2FzgwTrEa1Xc0eMx3e1yeqRIVvMVJrDAe7EyKyGKt36mkNprosDLmPYE5ePo/VpKVXey7JvNcgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_030024_106972_25B2E516 
X-CRM114-Status: GOOD (  22.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

T24gU2F0LCAyMDIwLTExLTA3IGF0IDA4OjMxIC0wNTAwLCBTZWFuIEFuZGVyc29uIHdyb3RlOg0K
PiBPbiAxMS83LzIwIDM6MTMgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOg0KPiA+IFRoZSBEVyBT
UEkgbWFzdGVyIG9mIHRoZSBLZW5kcnl0ZSBLMjEwIFJJU0MtViBTb0MgdXNlcyB0aGUgMzItYml0
cw0KPiA+IGN0cmxyMCByZWdpc3RlciBmb3JtYXQuIFRoaXMgU29DIGlzIGFsc28gcXVpdGUgc2xv
dyBhbmQgZ2V0cyBzaWduaWZpY2FudA0KPiA+IFNEIGNhcmQgcGVyZm9ybWFuY2UgaW1wcm92ZW1l
bnRzIGZyb20gdXNpbmcgbm8tZGVsYXkgcG9sbGVkIHRyYW5zZmVycy4NCj4gPiBBZGQgdGhlIGR3
X3NwaV9rMjEwX2luaXQoKSBmdW5jdGlvbiB0aWVkIHRvIHRoZQ0KPiA+ICJjYW5hYW4sa2VuZHJ5
dGUtazIxMC1zcGkiIGNvbXBhdGlibGUgc3RyaW5nIHRvIHNldCB0aGUNCj4gPiBEV19TUElfQ0FQ
X0RGU18zMiBhbmQgRFdfU1BJX0NBUF9QT0xMX05PREVMQVkgRFcgU1BJIGNhcGFiaWxpdHkgZmll
bGRzDQo+ID4gZm9yIHRoaXMgU29DLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBM
ZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL3Nw
aS9zcGktZHctbW1pby5jIHwgOSArKysrKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWR3LW1t
aW8uYyBiL2RyaXZlcnMvc3BpL3NwaS1kdy1tbWlvLmMNCj4gPiBpbmRleCAzZjFiYzM4NGNiNDUu
LmEwMGRlZjZjNWIzOSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktZHctbW1pby5j
DQo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWR3LW1taW8uYw0KPiA+IEBAIC0yMjMsNiArMjIz
LDE0IEBAIHN0YXRpYyBpbnQgZHdfc3BpX2tlZW1iYXlfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LA0KPiA+IMKgCXJldHVybiAwOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gDQo+ID4g
DQo+ID4gDQo+ID4gK3N0YXRpYyBpbnQgZHdfc3BpX2syMTBfaW5pdChzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2LA0KPiA+ICsJCQkgICAgc3RydWN0IGR3X3NwaV9tbWlvICpkd3NtbWlvKQ0K
PiA+ICt7DQo+ID4gKwlkd3NtbWlvLT5kd3MuY2FwcyA9IERXX1NQSV9DQVBfREZTXzMyIHwgRFdf
U1BJX0NBUF9QT0xMX05PREVMQVk7DQo+IA0KPiBDYW4ndCB5b3UgZG8gcnVudGltZSBkZXRlY3Rp
b24gb2YgREZTXzMyIGluIHByb2JlPw0KDQpEb25lICEgU2VuZGluZyB0aGF0IGluIFYyIChJIHdp
bGwgc3BsaXQgdGhlIHNwaSBkdyBmcm9tIHRoZSByZXN0IG9mIHRoZQ0Kc2VyaWVzKS4NCg0KDQoN
Ci0tIA0KRGFtaWVuIExlIE1vYWwNCldlc3Rlcm4gRGlnaXRhbA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
