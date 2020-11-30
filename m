Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8217C64E7B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 03:14:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEC0920757
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 03:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2GYPtEWd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="OIit4FE4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="dYSD8t/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEC0920757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v36c0MndTZ67tRhCp9us/CSRLQ2rbu88QhoWmSz0hJE=; b=2GYPtEWduEijIhFEPaAQ3hniW
	LvuUbXo1oyj0dhChxppJpTxsQ8pw6/jSOJcaIeZY/55ZPn/a9y+yXsO4x3sggy5duFOODjXPh6vM2
	9525s0j0hpeLx7X17kMVgRyvFkJ00XEpSCLMJZjM5FgCdSryeKFmfHR/+WTDaoWfV0jPogfmDjIvB
	NkWbnbKhNVP1E5usJgUYH/z27Qc9HNUEb1//MrAm+FubEWxB452VrnzZeoBGL2wKYOGsNFZd7yZL1
	BEDXncSMutzmW9UlKFRlz9FodZUBo6buZje9kgAx0kz74HVthXXDUDzPfbIxaIQI9PAE/vqiLm9oG
	XGNqfOhhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjZdW-0006Kj-So; Mon, 30 Nov 2020 03:13:58 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjZdU-0006Jt-0i
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 03:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606706035; x=1638242035;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JRjpJjUHwObNWZHESW2KkKj3h/eeMpmBA9/djXroz4o=;
 b=OIit4FE4EPGoMOwc6urGkq/yWrME/MGgbySlDqZ3TEBD9eGMplSYObaY
 J/U7Nfiu93MpP5V9KdaQXz3gSUOtDVmVn3cp8h5545fpXhvVU9nV3LHu0
 +sf8lYxGXzcNQ7BTPaBJXjfZxmL4H8iZHVL5jjZJBaNYPeSe0/tWGjNW+
 ikm5datlClUCsbIP8XlLb/4Qey3XzwNR31XaDCj5knlD9VNrLBla2iJuK
 FZ4Xip3C75R0om9m9BHZ5Vvrbj1YOIeA6jpFatqSJkq7rQcEj+sW3NJ6W
 pcjVnqqh43RY3ZZNALuTwSwnRKMh0JUy+u446r8RSuCdVsZvVjQF11neI Q==;
IronPort-SDR: D254wddaQ0jtJJRpJWzOQDSLzSKoZnhkFcf73XuDck6JiMtipIRBPPEIJPQaudqYY3Z4pBBAl4
 lux8L67FANYO6AKyq7DMqfuWdhfxkIDzHejMLEWzY8IPwa3/L/XZVRL6xJA8O/Jf2nweRJv4mD
 ltivHGJckIbN6eh99doWRzKn4uDcj4ou4S3yeERqOmCpXVI/eGeTxxO0AmtjqgZ9vth/paIKQ+
 3C/7uEYKW+BtTrDW3dzO4cxDcPaniUh3my9sfz1gPG+Ah+Zd8/1tfot4CLWLiG5VBmUeDb347Y
 GGI=
X-IronPort-AV: E=Sophos;i="5.78,379,1599494400"; d="scan'208";a="263891048"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hgst.iphmx.com with ESMTP; 30 Nov 2020 11:13:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbUldRw/WWhFAmQwWPgrE2uG8gQCRugSy/Orz25llKYeVZ0Ea/AYS1T8KTY3m2S5YwLv8dxWdzGTQdL3Dx0JvIBgndjuDZj4yH4r7ohn0GMI0qiAuTLZQe2+/U5so2ZbEUKhdS1Gyu5sBFPSODox6lGa3IqKT1ynUnfWNgvoRCuOgdBbsbB1zRvkh3eBIK6oeY52YHSAvSeEE9tAeofTTUU9Yfb4SukmEsEuOTGOyj/9fu5FXxLfOT7GQ5EPggHZe8s4KpzYL8UOXcna4UjOWhY/KeoXM1fVI+emM5V/l2OkDKvnuJN+KYn4M76LqP0cgpMDSCGc+WDTzrH6emuJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRjpJjUHwObNWZHESW2KkKj3h/eeMpmBA9/djXroz4o=;
 b=L550AV1xsHt2/28cW3cMljKEKXwoduaLNi21Qx6LYY8RcdvoSBAVv9oZ3Hhd5q609LdMgNfR9s+RBxrXQeieXX9f6+g/BBIB8tROF26Hh+MBXt+Nfe7BASJIafc84WPOVdAKtgg4o9g338gNSt5+IpVuIM2JZPeXGo7o/SZ6yqPEo3U9ofZFmIthSICb0E1pbOs82sQHTqH6+X17950U/pT/9R7WxDVqzU451RJw0a3WEoA5fHik/Mqzre6NXPMLypzNhexO9eXTBQoxdybKBISyFBMPYbupWjboZ5X/TsAX2Gsu3CkLKKFdScxo8o08MGJjD8SB7SSX73MmsEeZag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRjpJjUHwObNWZHESW2KkKj3h/eeMpmBA9/djXroz4o=;
 b=dYSD8t/FkoJRf1hUN3Bm9iVE+k6O3E4ihGdOsrePud1ZK6YGmMd/cBYjq4hZZLfTi9picZxXmG4T2kni0AXWA0JIMi+9fZerS7hTN3aFrdLTcJrMJK4QEYj+AQFex/49QGxoIib5I/EoiyMcTCy5zMArjmJwWWdCiMhHQNjGPzw=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB7047.namprd04.prod.outlook.com (2603:10b6:610:9f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 03:13:45 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Mon, 30 Nov 2020
 03:13:45 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
Thread-Topic: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
Thread-Index: AQHWtN4lakjfsgLC7Uq3vn4b+Zr42anfxNoAgABfB4A=
Date: Mon, 30 Nov 2020 03:13:45 +0000
Message-ID: <b92c455b1db0f1b4a82d8cea0fbdebb47609bf42.camel@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-21-damien.lemoal@wdc.com>
 <CACRpkdZhOxz5NhrkFxZ5G4aOrmBoAcQodOvqzNROQtXpHVQGDQ@mail.gmail.com>
 <CH2PR04MB65228DE061918A4D2A08A0CFE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CACRpkdbA_JMiyraKC_3WT26mMUxfuLD=Q_HREmbEB=yNPpuHjw@mail.gmail.com>
In-Reply-To: <CACRpkdbA_JMiyraKC_3WT26mMUxfuLD=Q_HREmbEB=yNPpuHjw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8dd4c748-145e-4e27-523a-08d894ddf2e9
x-ms-traffictypediagnostic: CH2PR04MB7047:
x-microsoft-antispam-prvs: <CH2PR04MB70473A0523BA92F9CB090B21E7F50@CH2PR04MB7047.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j62VymdwvQSid2TBBpdP3xx+iyuUbGqi0Wrxm+rNiNl/UUVmLIv2oICUp5POMnWfnfKrT1RqeIRr9zEl4puZraZPpPuob4/g9Hxaa880YDfaqoohlrFf1fjTB6P/7THQQAftoKSGbMQjvf9dl6xoFiYwoEqauN7diRbGM3fMUG17vGvDJkNCu5w6GYzk9zVqqMWOf4jRqpO1/0FciT4Q2zf2qAWSkyIBE+y+yucuxzpFNqHAoIzjti1j5g5vKSx0DeYWA+7kufFzDg4D3wsK+G7PxP0WBoiM2saBFMDfA6M8M8R54iqNGGlMMWzIvOzcRMBNfNMMuWZ0A6cLCDrRew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(86362001)(4001150100001)(71200400001)(5660300002)(8676002)(53546011)(91956017)(83380400001)(6486002)(316002)(66946007)(2906002)(6506007)(54906003)(2616005)(66446008)(6916009)(64756008)(8936002)(66556008)(66476007)(6512007)(76116006)(7416002)(478600001)(186003)(36756003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RHJxMzZlRERIS2duYWpwbWd1TmxRbEhtRVpKaTZoWnpzR1Z0SWVLM0NQNTlX?=
 =?utf-8?B?YnVhamFMK2hjUXpYMjM2YXZrRnVPVFI2dnlCNUxmdjk5NU4vcnJJTU5aOXZh?=
 =?utf-8?B?TUcyR212ZkhzOUNJd2pma2JoRzRodUQ4TW1LR2RwN29EQ3hjUXJ5Qi9SR1lQ?=
 =?utf-8?B?ZjlBcFVXSUdXQ1VaQ0ZYTHR2blRmR0NJT295VlhwZDMrQ1hhOVZGZHNVNDk1?=
 =?utf-8?B?ZFl0N21UUFo4ckE4LzYzcGlLQ1hYY092MzZVUExDdkVPRzVCeHpIRVJXcXVQ?=
 =?utf-8?B?Tk94c09VaUJUbHg4M21CbitadklzbXZNREUybGQvcWo5bnYzdmlLV1UvSUNq?=
 =?utf-8?B?SnhFNCtQWUNiUGVnRXlBLy9uclBkampPMzdRZUhCRUhvSFZRajBaU3VNUXVn?=
 =?utf-8?B?MGpMbi93eDhjR3pMaDdKS1oxMHFmOVRyV05HNHJrY0hISzVFSWUzNVdKVDE1?=
 =?utf-8?B?QzJQZ0VHZzVzSmFmZWd4MVBOcmFKa1JhQlljbHFnNXRybUw2MzhyVW12UEdS?=
 =?utf-8?B?RHgzVTY0NjZpTllWRG1ORFNOZjdpNjN4eGNFVFcxYzh5dWNpRW5kcFRQN3JC?=
 =?utf-8?B?d3JLbEJsa2lOYUx0WHAxNzRBbXFZKzEzbGNraUkxWlU4enBsSnRoYitWTjdP?=
 =?utf-8?B?dXJiZ1NNNGxBT0pyOGE3eGxwREl6UEVNeGZRN3MxMHhvbmpZWmhTekJ2bEph?=
 =?utf-8?B?dWRFQ1hWMlVTK2UxWVU3ODZ6TzFDZS9Fc2NVcjdHb3VjN01mTFBpNE1PNUpw?=
 =?utf-8?B?TmgwMUNiQkYwVzN1K0IwdjBJUVB5dnBBNTdNMThvbTVndG5nR0x0b3BwSWlk?=
 =?utf-8?B?eXUxTllWQng3M2IrU3JHUE1yUnNkM3g0OHNTcHNxSnQxQUREVTUzS3BCNnFx?=
 =?utf-8?B?T2h0QTR4T0hObW1LK2YvdlVCL3k4K2Z4UkwveXpOM0I3cnhyZXdCSDF6ajN6?=
 =?utf-8?B?MkFrMTBaMzNSUDhZZ1RLdWtIWFczbVVud0wxTFVtYTJvaUhHUld5K1BuK2pV?=
 =?utf-8?B?MFFQNzNUeWlFaVBGdHQxTFNEbXBPUzY0dHYyUFB3UmFoQzlvOHF3TUljdVRy?=
 =?utf-8?B?RmtYdWNRb3U2WCs0NVJPVEpBYmhSVkw2U0FFRFEwWmwrUUdPYUduQUNucjha?=
 =?utf-8?B?M3Bndnp0OUlTUEhoZ3l3bGFBbkJEU1JscjVGbmpNa3ZLVlZNZ2hpbWUvL21s?=
 =?utf-8?B?Smcxc0ZhWjgyQjhGK2cyZ0E5Y1FkRHhIVzdnLzY3SmdGWlNFdEhYL1lMd2d3?=
 =?utf-8?B?ZCtwVzFDTW1BWU1ZNE5Cdm83U1E4VmRQclhYSnNRYmNaZWJlNTdBSnl0UnQ1?=
 =?utf-8?B?VFFMTXJVVzFlb0k0aFVLTnVvSGFHWnNOd0dpSFFvM1ZqYmJHMmRUckZ5Um1B?=
 =?utf-8?B?elVSZzNXKzdteWlIQTNRTEFBdXcwdDhQYUhvQ2xnQ0wvOUs4VmpsYkp2VUF5?=
 =?utf-8?Q?lLVZb1ea?=
x-ms-exchange-transport-forked: True
Content-ID: <3627C25D6514674E8CB94AE13DEA21DB@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd4c748-145e-4e27-523a-08d894ddf2e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 03:13:45.6388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhaHCGNpkJKyHB6Fp5NOmOynnbr7QvMFgAyXN24vBMyuAu+FWiQvWewp/sMnpI/U1+ZNnrfHBWRQgQ+CL8cdIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_221356_545326_C19C1EC6 
X-CRM114-Status: GOOD (  36.50  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIwLTExLTI5IGF0IDIyOjMzICswMTAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBUdWUsIE5vdiAyNCwgMjAyMCBhdCA5OjUzIEFNIERhbWllbiBMZSBNb2FsIDxEYW1pZW4u
TGVNb2FsQHdkYy5jb20+IHdyb3RlOg0KPiA+IE9uIDIwMjAvMTEvMjQgMTc6NDMsIExpbnVzIFdh
bGxlaWogd3JvdGU6DQo+IA0KPiA+ID4gV291bGQgYWxzbyBiZSBuaWNlIGlmIHRoZSBtYWludGFp
bmVyIGNvdWxkIGFkZCBzb21lIGNvbW1lbnRzPw0KPiA+IA0KPiA+IFdoYXQgZG8geW91IG1lYW4g
PyBJIGRvIG5vdCB1bmRlcnN0YW5kLiBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGluZGljYXRl
cyB0aGF0DQo+ID4geW91IGFyZSB0aGUgbWFpbnRhaW5lciBvZiB0aGUgcGluY3RybCBkcml2ZXJz
IHN1YnN5c3RlbS4NCj4gDQo+IFNvcnJ5IEkgdGhvdWdodCB3ZSBoYWQgYSBSSVNDViBkcml2ZXIg
YWxyZWFkeSwgYW5kIHdlIGRvbid0DQo+IHNvIHRoaXMgaXMgY29vbC4NCj4gDQo+ID4gRG8geW91
IG1lYW4gYWRkaW5nIGFuDQo+ID4gZW50cnkgdG8gdGhlIE1BSU5UQUlORVIgZmlsZSBmb3IgdGhp
cyBkcml2ZXIgPyBJIGNhbiBkbyB0aGF0IGFuZCBwdXQgbXkgc2VsZiBhcw0KPiA+IG1haW50YWlu
ZXIuIE9yIGRvIHlvdSBtZWFuIHlvdSB3b3VsZCBsaWtlIGEgY29tbWVudCBmcm9tIFBhbG1lciAo
cmlzY3YgYXJjaA0KPiA+IG1haW50YWluZXIpID8NCj4gDQo+IFRoYXQgd291bGQgYmUgbmljZS4g
V2hvZXZlciB3aWxsIGVudGh1c2lhc3RpY2FsbHkgcmV2aWV3IHBhdGNoZXMgdG8NCj4gdGhpcyBk
cml2ZXIgYW5kIG1ha2Ugc3VyZSBpdCB3b3JrcyBhbmQgZ2V0IG1vZGVybml6ZWQgc2hvdWxkIGlk
ZWFsbHkNCj4gYmUgbGlzdGVkIGFzIG1haW50YWluZXIuIEkgc3VnZ2VzdCB5b3UgbGlzdCB5b3Vy
c2VsZi4NCg0KT0ssIG5vIHByb2JsZW0uIFdpbGwgZG8uDQoNCj4gVGhlIG9ubHkgaW5wdXQgSSB3
YW50IGZyb20gdGhlIFJJU0NWIGFyY2ggbWFpbnRhaW5lciB3b3VsZA0KPiBiZSBvbiB0aGlzIGNv
ZGU6DQo+IA0KPiArLyoNCj4gKyAqIE1vc3QgZGV2aWNlcyBvbiB0aGUgSzIxMCBTb0MgZGVwZW5k
IG9uIHBpbiBtYXBwaW5nIGNoYW5nZXMgdG8gaW5pdGlhbGl6ZQ0KPiArICogY29ycmVjdGx5LiBT
byBpbml0aWFsaXplIHRoaXMgZHJpdmVyIGVhcmx5IGFzIHBhcnQgb2YgdGhlIHBvc3QgY29yZQ0K
PiArICogaW5pdGlhbGl6YXRpb24uDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgX19pbml0IGsyMTBf
ZnBpb2FfaW5pdCh2b2lkKQ0KPiArew0KPiArICAgICAgIHJldHVybiBwbGF0Zm9ybV9kcml2ZXJf
cmVnaXN0ZXIoJmsyMTBfZnBpb2FfZHJpdmVyKTsNCj4gK30NCj4gK3Bvc3Rjb3JlX2luaXRjYWxs
KGsyMTBfZnBpb2FfaW5pdCk7DQo+IA0KPiBUaGlzIGlzIGEgYml0IG5hc3R5IGFuZCB3ZSBkbyBu
b3QgcmVjb21tZW5kIGl0LiBCdXQgSSB3aWxsIGFjY2VwdCBpdA0KPiBpZiB0aGUgYXJjaCBtYWlu
dGFpbmVyIGNsYWltcyBpdCBpcyBuZWNlc3NhcnkuIFdoYXQgaGFwcGVucyBpZiB5b3UNCj4ganVz
dCBtYWtlIGl0IGluaXRpYWxpemUgYXQgZHJpdmVyIGxldmVsPw0KDQpJIGNoZWNrZWQgYWdhaW4g
YW5kIG5vdGhpbmcgYmFkIGhhcHBlbnMuIERlY2xhcmluZyB0aGUgZHJpdmVyIHdpdGgNCmJ1aWx0
aW5fcGxhdGZvcm1fZHJpdmVyKCkgd29ya3MganVzdCBmaW5lLiBJIHdpbGwgY2hhbmdlIGJhY2sg
dG8gdXNpbmcgdGhpcw0KaW5zdGVhZCBvZiB0aGUgcG9zdGNvcmVfaW5pdGNhbGwoKS4NCg0KTm90
ZSB0aGF0IEkgaGFkIGRvbmUgdGhlIHNhbWUgZm9yIHRoZSBrMjEwIHN5c2N0bCBhbmQgcmVzZXQg
ZHJpdmVycyB0b28gdG8gZ2V0DQp0aGVzZSBkcml2ZXJzIHRvIGluaXRpYWxpemUgZWFybHkgYW5k
IGF2b2lkIGFuIGFubm95aW5nwqBlcnJvciBtZXNzYWdlcyB3aGVuIHRoZQ0KZHdhcGIgR1BJTyBk
cml2ZXIgaXMgcHJvYmVkICh0aGUgZXJyb3IgYmVpbmcgIkNhbm5vdCBnZXQgcmVzZXQgZGVzY3Jp
cHRvciIgZnJvbQ0KZHdhcGJfZ2V0X3Jlc2V0KCkpLiBCdXQgdGhhdCBpcyBub3QgYSByZWFsIGVy
cm9yIGFzIHRoZSBlcnJvciBjb2RlIGlzDQpFUFJPQkVfREVGRVIsIHdoaWNoIGxlYWRzIHRvIHRo
ZSBncGlvIGRyaXZlciBpbml0aWFsaXphdGlvbiBiZWluZyByZXRyaWVkDQpsYXRlciwgYWZ0ZXIg
dGhlIHJlc2V0IGNvbnRyb2xsZXIgaW5pdGlhbGl6YXRpb24uIFRoaXMgYW5ub3lpbmcgYm9vdCBm
YWxzZQ0KZXJyb3IgbWVzc2FnZSBjYW4gYmUgZml4ZWQgc2ltcGx5IHdpdGggc29tZXRoaW5nIGxp
a2UgdGhpczoNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLWR3YXBiLmMgYi9kcml2
ZXJzL2dwaW8vZ3Bpby1kd2FwYi5jDQppbmRleCAyYTkwNDZjMGZiMTYuLjRhODAxZTgzOTE5YiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLWR3YXBiLmMNCisrKyBiL2RyaXZlcnMvZ3Bp
by9ncGlvLWR3YXBiLmMNCkBAIC02MTcsOCArNjE3LDEwIEBAIHN0YXRpYyBpbnQgZHdhcGJfZ2V0
X3Jlc2V0KHN0cnVjdCBkd2FwYl9ncGlvICpncGlvKQ0KIA0KICAgICAgICBncGlvLT5yc3QgPSBk
ZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX3NoYXJlZChncGlvLT5kZXYsIE5VTEwpOw0K
ICAgICAgICBpZiAoSVNfRVJSKGdwaW8tPnJzdCkpIHsNCi0gICAgICAgICAgICAgICBkZXZfZXJy
KGdwaW8tPmRldiwgIkNhbm5vdCBnZXQgcmVzZXQgZGVzY3JpcHRvclxuIik7DQotICAgICAgICAg
ICAgICAgcmV0dXJuIFBUUl9FUlIoZ3Bpby0+cnN0KTsNCisgICAgICAgICAgICAgICBlcnIgPSBQ
VFJfRVJSKGdwaW8tPnJzdCk7DQorICAgICAgICAgICAgICAgaWYgKGVyciAhPSAtRVBST0JFX0RF
RkVSKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihncGlvLT5kZXYsICJDYW5ub3Qg
Z2V0IHJlc2V0IGRlc2NyaXB0b3JcbiIpOw0KKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7DQog
ICAgICAgIH0NCg0KYW5kIGFsbCBkcml2ZXJzIGNhbiBub3cgdXNlIGJ1aWx0aW5fcGxhdGZvcm1f
ZHJpdmVyKCkgZGVjbGFyYXRpb24gd2l0aCBhIGNsZWFuDQpib290IGxvZy4gSWYgeW91IGFyZSBP
SyB3aXRoIHRoZSBhYm92ZSBwYXRjaCwgSSB3aWxsIHNlbmQgaXQuDQoNClRoYW5rcyAhDQoNCj4g
DQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQoNCi0tIA0KRGFtaWVuIExlIE1vYWwNCldlc3Rl
cm4gRGlnaXRhbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
