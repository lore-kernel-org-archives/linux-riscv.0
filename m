Return-Path: <SRS0=216k=BM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7F5C433E0
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 07:15:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91C2C2076B
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 07:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ym6k/fA0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cGhjEHp9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ZHkUZgkZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91C2C2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P22XiC0oIwZo9dkgUJ5D7ge+NVVmHwtJUNYyqme03aU=; b=Ym6k/fA0tA3AjhsPq2lkhah50R
	Uu44bv2LAzmhbAbCBjSEjwUwjDArkHdKJdcb4NlBfmxUmKjlARJfaA9D6xEpeZy1LEMVXHtcqU3b7
	wUrO0AHS6wS1z6PdyntAeT0pHs+syANym+7YTHIuCjh8d1FsvPIDlTZ2KobCAtK1Tl5YCMh6l5HCF
	AXcHpltmZjPBwYiHCrp0eLwTIELFz4tx3gIiXbPJllsvIA0LqbN7m3ogruBONhwp/vNJknmRrqpgw
	QmrLfVkm1QIDm+7HrlYze6JpG7HUO9RXYjeNG1iIbwI5DdDsQoWaFF9Tveao5yAhwnd2mRGbDfPUF
	m2nejvoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k28Cl-0005QC-Dr; Sun, 02 Aug 2020 07:14:47 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k28Cg-0005Pm-UE
 for linux-riscv@lists.infradead.org; Sun, 02 Aug 2020 07:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596352483; x=1627888483;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=yWk9BHZciMi4FKHssdZWkjTsAQDtV2hTqSwRJ6K3EYc=;
 b=cGhjEHp9Lay0+z1di+gDIFHaUA7qzelT6xFndrN6qrCouaH4/8I7Y2Pn
 hpZAgfUpuFMse/jWsYaCpvc6ixayLJR1apPF9bVWf4tQBYxSRGkZOFPlp
 /a80ZyluqWJ+f8NbWcAd+p8IyU3w4WroIonly+2yNbZT20SPgkYmwAWms
 WqwOGiU2JlXJymCTL2i7lD/WbSupF+w7rmWaOxBJWRlhXck8ExfWIGYu6
 CCp/UA1Oe2Gs/jKW9jEC7iHj7604QXLemb38loBUUc6Ovr0AKfepPQcu2
 rXi18v0Qa9dbZpSJG1Af4vEY3hdPh5ek7lFYCJPQMCAaq6c9m4BTOmc5Y w==;
IronPort-SDR: HwnlQ5e0IYHBNw40Avrv0in3lKVsdJ2BMJcFWIhm+ygG7FFbDIDF0SjIqBZF+UOk9KxJ8F7ql1
 flNTLz/MoNh1B6E72/hnMFkr2zV5oYeglj6MogQ/6B5jaztkDur+GiIADFLNAgjENA6afDyiAk
 J7C0x1JaNmTZS87kV//cZKyzJa41kbDt/gIfJhZIbj7YTmWhlxNEqmx8Rz5iuqROwo8/bGLAiF
 Kznr4ew1tF04uig6QrC/H67booxGEvMOlptqoMcyPqungVXhSZwevLwbNBKE25C0FdbpAGuODM
 87I=
X-IronPort-AV: E=Sophos;i="5.75,425,1589212800"; d="scan'208";a="148244322"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hgst.iphmx.com with ESMTP; 02 Aug 2020 15:14:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NblFFFGwbXif1JmfgQCPZCXEvmqluzjOoymBWhIXiCjbXrmCrtrz465TSEF9sHXQEeBoPbVgs3GVbEOoLkHFsHqJ73FCD3veT4+hiB21bj5E2F5P04URvr231zfAHvoEUGyFg47V90UGku0zZXJuHMlBwGT+EA1Sd9ZqF7/piwMQ+UXHjav35CYx/ro3Aiz4HAIuPnrOZw/u4Eya/cF2pscWNLt9ZiDz2ZeP0mR34F5ebqkgRvSww31q37fnKK52bVMiYJGOoUI7uJgvfXm1zliQrsFcpL4w+9XrSzj51TuYlBz8pbALCryoBaxHQbjABilJlgZ9TVrqlDqEDXKybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWk9BHZciMi4FKHssdZWkjTsAQDtV2hTqSwRJ6K3EYc=;
 b=dHpO28wel3cJFj6m77rRgXGIXzvwocDMU6aO/cu6UQAMSxvtfb3AmQ5mW8V2CgMNMv4FeLm288pNV7XL/zfQKT14RudjAKX1oM0hLU5SE7YNNqL6U6fJl0DwUgmhhJlJEq9rYavTkXMfa7IARKU2jppui/6G51ZMCwqsi9DaQcMBTF2zgosuwVXcAX+MlCLCDIpz1/N+F2cnK5F/ybEzBu6xya58Cs3z97Wa7HsU03JlUHifkM6rdM/uFSO3VvJyVJQ5F6Cce3bvMu5/8uPcgB5iJ+5W673byTTxHmCdERcLR05NiUnxN2aydXZYCQtxhEFd7znYmPSdP06jr9EkrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWk9BHZciMi4FKHssdZWkjTsAQDtV2hTqSwRJ6K3EYc=;
 b=ZHkUZgkZ1Zw/jKzG0819BOSdLeakGnX5lq6mUrBUljEDP379rFjyALFHbp1ATtUfpWl375BUHSGgHEnXoZjU/0g/OOG/6Q8DxdVrhPMs+djOiHkCJEAs9CK4+mcba8LR62CwzY05LC5yI4+Yrbl87w6rtaB8meJSgZ2WpL9O6m8=
Received: from BY5PR04MB6724.namprd04.prod.outlook.com (2603:10b6:a03:219::15)
 by BYAPR04MB4551.namprd04.prod.outlook.com (2603:10b6:a03:11::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Sun, 2 Aug
 2020 07:14:34 +0000
Received: from BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::90f3:1abd:2ec8:a91a]) by BY5PR04MB6724.namprd04.prod.outlook.com
 ([fe80::90f3:1abd:2ec8:a91a%9]) with mapi id 15.20.3239.021; Sun, 2 Aug 2020
 07:14:33 +0000
From: Atish Patra <Atish.Patra@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RISC-V Microconference Accepted into 2020 Linux Plumbers Conference
Thread-Topic: RISC-V Microconference Accepted into 2020 Linux Plumbers
 Conference
Thread-Index: AQHWaJySnmm+Nl0jlk6cN/m/hkR8Cg==
Date: Sun, 2 Aug 2020 07:14:33 +0000
Message-ID: <e99c6a5d98ace676f7d2dffe47ae11f35351e26d.camel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [98.248.240.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4574b154-27f0-4f77-a375-08d836b3b527
x-ms-traffictypediagnostic: BYAPR04MB4551:
x-microsoft-antispam-prvs: <BYAPR04MB4551AC931AA7CF994A19C3DEFA4C0@BYAPR04MB4551.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JhQYJUDMcLflzEDYCY0UWoXJCMdDf1fsTDQ1xWkGKn3NNcgdLRgFGlNVbYOHV9rI2R6f27EKbeLGuAW0Jxyux3bGE8t+MoFKSrUl96xRo/DEN58/V2Ufs92TvgKT4FoHs+C0WTXvo67UWjHyROwnJQOTt74WYRywnEI4mmxHysgFPSbfFE3fA962q0sQuICajDTLTdHk1w4o2GT11WCJQtZjOexlqEXkjGkMEAh+8O8Tg3/Zb1Sfkq77+v0jxsov5rSWyixl6x/Xv4bTqin3TnW4eH1Nkhu3SMM0z02uMHtSs6GTsEE5USW+rASvqJMpyJoUgEXdIU7jq9EcRch5uwsNzaNw5nipWur5pxBJoczJlS9bCIedOh7QdJvBmfIpu0SjbE1nbgl6ZLITamQMKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6724.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39850400004)(396003)(366004)(346002)(376002)(4744005)(76116006)(6512007)(8676002)(6506007)(316002)(66946007)(6916009)(36756003)(478600001)(5660300002)(86362001)(2616005)(6486002)(966005)(26005)(186003)(66556008)(8936002)(66476007)(64756008)(66446008)(2906002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: B30htTdC02bRq5CJD64+c8l1Xt/ET4diqI2h78Nmgc/bm8uq0OCNKwbS1HjQ2HaWtcnxpM1xuLMZkIAr95k06tr5+/fxZb7P4IH/hjnhJ2P8AWbm9CLZCxyuzAVqr23e5tPgi00VuK7e6gxqlFKo4VXvdYqjGV831Y5jfa9C+7ykSuXlJwZMmPbj8KeIUfwHNI+H8juaAyufTGpvVsqBZMR1gafywtBDKGpMseC5YojDroMnDakBMCZqqtEOwkWkhMMqZzlnF1KGKhDHWXNkKiNjIatjTeTKXww7KdmoSIK3RGw8B26bVLlsYTK7JdSnMTGswPh3q357Wh9yt0FSYH7yHYg8V1QrvwLYFM95lAcvq4gpkY/sBbWc3tUMlkhfI2oo7wVH1m/pdSA3CKYWMBdC927iWcK0/IV599+LifGAb0R87iUBN9sg+npjnx9CEtvJnqR/70PeatqSxfB8PrzK803NLYpVaPwXssvrnzZaQSHx0gyQOLNgwh3Exu9qaqigUiTPpJrFMcsuoM50nCqn1xOdsO0J8+dxjQ8k7rcCHFgy/VoEsPwDATpUwTMxj0T2M+GFhQCCQr0+kYgO9nb4ihqhdYteWZuS4oVtoFSRYOWBOIb0CDR8xVA4ZYquIeHYGwrMi1BSwtq4JZLsDA==
x-ms-exchange-transport-forked: True
Content-ID: <6417D9994E6B20438BE16E950493D2AF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6724.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4574b154-27f0-4f77-a375-08d836b3b527
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2020 07:14:33.7741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cid7qx1zuljZ1W8i0bGR+QvGqePO70mKv9NXLXtEXlb0Gb0RdkEkquntAsGQTyNn886aJ7Hatk5TfqDdonSpFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_031443_323025_BD8EB548 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Cfp for topic proposals for RISC-V micro conference is open now.
The deadline is 15th August.

Here is the announcement.
https://www.linuxplumbersconf.org/blog/2020/risc-v-microconference-accepted-into-2020-linux-plumbers-conference/

FYI: The Linux plumbers event will be virtual this year. More details
can be found here.
https://www.linuxplumbersconf.org/event/7/page/43-lpc-2020-overview

-- 
Regards,
Atish
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
