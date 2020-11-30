Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34418C64E8A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 13:23:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86467206F9
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 13:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGGizUrv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KH5R8/OH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="WQxHGR10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86467206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5CK+QfDm+/pS1py78pno1BLXLlM2UDtPC1GrQ/j1OAI=; b=kGGizUrvVlEwX8X2vKKM7JlLq
	dxMMe9wDHiusxSrOHoE+XrjyJeNEtRhEDvHw0TfK0hApk2wXIUYXmcNtDVFoUS5Ku7aRpMQ6d0x8G
	vhzqrwi71EPkT4lZJlUsMxFycEyACMI7E5K1Yrtsh1pCAsm+GEfYZblit7RPoD+pPjU7i8AbGxCVZ
	VZ+Qpv0eNNaj7MfS5kbAupPHSNWRIUK/Hggyxi/x0yoc08jRtO52nMgJkk/570KWE2ZOnMvRo21jr
	UfBq7gTXnVoaESaHhJEUawzjpPHgCqTKEn2Y4vu9wxAgHGeX1eWjkeFlM0S5H8aPZCO8jofE185K1
	4Zn6T8hHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjj9B-00014j-EF; Mon, 30 Nov 2020 13:23:17 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjj97-00012d-6K
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 13:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606742593; x=1638278593;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=btbhucfy+FRlQz2DFsZ5cuEh60WDmzb6dMYo6E/E36Y=;
 b=KH5R8/OHGoc/HqpHhONTYV7I7P2k8zjRM/6++RtAHGg3DOWFsj3PXbdk
 FSB5zKJUsxNBD8gU8UsTjiv9akMUwjhIHRW/L7GehmAY1DeZYmg+9FdHw
 ifx+Ihzy4MrLKH83pFelkxH8YIUKCE2TSkcdkVxEutsZDq1vrHNPqY5fR
 1/9GjaVjbyHOIzci/jv7F6ESdIIP1c12GWWIhrE8yNRXbCZ2Sp97OP1uN
 zhTX0ugCo2sU1seR43AjaLHB3YmZBpPXoMf0HLR5CK/bD7WYOLSjj6hfD
 rPKYUeFsUUHBMcrW099NoCz6kbi6TFnmn2vcl+ms4PzzRof9btxop97ze w==;
IronPort-SDR: Jqy4IDzPs7qNWYc6d/F2VpsLuB+D/W6kGJYjH8u2mnkuDrmchDfSZ/O52y9rWq7QAG3zJWiJWv
 12XMS//EO4KjQsjujYpMPG9pv5SVmDUec83vmuLvVYdST4+t32RSxseDztxi5EXSsY9a2HvHrs
 aeGV5W/u8eL03hihdso0jOsPhlqG7YHs7L8rT9a4gTlwRbWM0RzkCFTgpblQbOms0zKkH+uPEp
 OpDzKMOUQzft5qSJ+fwKnn9P0eZkbwX3PeDz4neWqtg/9Szbgb6NSA/4ERD4l79zDAz/L4LhkQ
 kwk=
X-IronPort-AV: E=Sophos;i="5.78,381,1599548400"; d="scan'208";a="95243220"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Nov 2020 06:23:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 30 Nov 2020 06:23:10 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 30 Nov 2020 06:23:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBM79ZyRHARQ+AfWnc2lJE1TRvhRROCEnNxwA9m8n7/vWxCooIMojfkmYDpujm7WGNottIqM9Mr4Q1Gw/WLXGI2eEi0KBndqY4bbXBuk39Gb33KH5bFBjke+Qn+NPHJhfG4LmY7WFDaAvFdQB1uQopQBkDmzJG9/WQqroCydWq0C5ZgxEhhaNPD2heIDm3t6aURhug5HyeIIqe2jzFIPN1JqC2dUUQci+s2sfE9FZeUo13iZLwQ8HtDubjbCJQ692HIwwFlcXccrsbWExFDmc6VKTpZKQcAus8fdUsr7Q64vWPW7fZkNLTCS66KAe3/aRg8NEzxoNwqRiqxMubnsRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btbhucfy+FRlQz2DFsZ5cuEh60WDmzb6dMYo6E/E36Y=;
 b=f4lt0yDlUHhZ7FqG4mEGQv7P6ymBzcDGFSIfbjOUL9g1O7G4d7hrDadU3LcIQ7wn8+MAeniVx6iQ/OO7PV2N9c66W+HR2o3/8ZV4t1/nL+sjLwpW849nnSIGe7RzakGUgs03M0GBmGGayS1NWRUSnFiDB+YNxTTmLhTp9HscCZwUoXjOmNcN9bX01VXK4Y9sgkTNBka8lQgZLLdKwD2wjjGrPZxUbGuWNyp/l8xlcm+YZAiz8DWJKgrohfQWcYj1zMfNCyq1UkqzAtH5HeTmigm9aWiNcPa6fPrnG9mV6OFUuXiZkQxoLoIPxmGrpfTDETlVtqkkckqVuWCf8dHUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btbhucfy+FRlQz2DFsZ5cuEh60WDmzb6dMYo6E/E36Y=;
 b=WQxHGR10zkttD1ECMAOMQxirDc2Xr9EERFbGAFIxi49hCD01x9F47l/o4weYnLj5+9sz8/2nGuMTN5W9ZYHjiFFUe/IFJjsmskfL9Fei31vz67RtVz2rw9h2Ewp5ZJsBCXcozUd2+hEII2yvFXF//bA2Ar1RRfPshAZFkkn0YpA=
Received: from MWHPR11MB1247.namprd11.prod.outlook.com (2603:10b6:300:2a::11)
 by MWHPR1101MB2159.namprd11.prod.outlook.com (2603:10b6:301:53::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 13:23:06 +0000
Received: from MWHPR11MB1247.namprd11.prod.outlook.com
 ([fe80::8073:14fc:edb1:4c78]) by MWHPR11MB1247.namprd11.prod.outlook.com
 ([fe80::8073:14fc:edb1:4c78%4]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 13:23:06 +0000
From: <Conor.Dooley@microchip.com>
To: <Damien.LeMoal@wdc.com>, <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/6] mbox: add polarfire soc system controller mailbox
Thread-Topic: [PATCH 1/6] mbox: add polarfire soc system controller mailbox
Thread-Index: AQHWvpYWpjpGcxGpkk2/6LWeCEcR4qngurKA
Date: Mon, 30 Nov 2020 13:23:06 +0000
Message-ID: <ffa091eb-0963-f2b5-de9a-c76767d6776c@microchip.com>
References: <20201119170419.18272-1-conor.dooley@microchip.com>
 <BL0PR04MB6514AA9B313828842F7EF0D8E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
In-Reply-To: <BL0PR04MB6514AA9B313828842F7EF0D8E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69db25b7-bc67-45b5-62f3-08d8953312e3
x-ms-traffictypediagnostic: MWHPR1101MB2159:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2159D8547EF97E5F047A80C598F50@MWHPR1101MB2159.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+7SfbpYVTmWJKCS+Hm0SKRo2yoyqhjstbvWmneaB2wQbjBgjueM72bPpDTrcQJCpe+MP03UTI7IsW1Euc7LGQIL6+PD1hAxI97vD+xhoBxLSM94Rcu8j0bKrZ62T8RcJ8wrXr4ALUureQxvw5ugeFWaOugwFUd3UMA1vdVKd4hR3cxmH0rKEQ5k/837N1ZvgYK3EajwGTl2JgmezYI9OnpzuCkw5V/Uog4ao5ZxepDscakhHsD+zRQEiuihneyqYKJFAzsRPHlMnQQrIkRHI1tRIcYw8C1slS/Jn8xcNt6HtDylMT5KhUU5a4jqXqppHX/NYE8V+5DezBTrVS+bm3JXzFXVkWFS8wErgFHpFu+NE0om/hj/sYywLCRawIYg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1247.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(136003)(346002)(366004)(396003)(8676002)(478600001)(91956017)(8936002)(66446008)(6512007)(71200400001)(186003)(4326008)(6486002)(76116006)(66556008)(64756008)(66476007)(107886003)(7416002)(15650500001)(66946007)(54906003)(5660300002)(31696002)(26005)(53546011)(6506007)(36756003)(2616005)(2906002)(316002)(110136005)(31686004)(86362001)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YWhqd3VRbzMveisrSnQyYnV2V0lVWTNkUER2K1Z6OVdWNEw3Z09HYjJhdStN?=
 =?utf-8?B?ZGs0dVN1alF6ZlNMYmxoV3NBSHZuNmtFME92SEl5U3p1ZzRmYy9kcnpsRDh0?=
 =?utf-8?B?Rk9adzRuMEpMMXloOGd6NTRwMW1EQTN4QUJmdjZVZmsraHh6RGgwcTU2Nkwx?=
 =?utf-8?B?VHh0QlFvV2VmbWxGY3pQd0lBcWtkTVZXejFFSGI2TTBRcTJmTjV1M3BMTVZr?=
 =?utf-8?B?WGNORW4yU1JaM1dxUFJoYW41WVB0cnJLS3NOdkpZdDlHNHo0aHdLVmRWWlFp?=
 =?utf-8?B?cTlzclZNMHVEWG5FSUdZTmJxdXMrWjlHQmFBN1YwUWpQM0dXVmo0eStneHI2?=
 =?utf-8?B?SWphSEE2SVVRNkFNcHVVRStNNUExR2RUUkN5VDJ5OThBaXNaTWM4aWVkRm1G?=
 =?utf-8?B?ZE03dnFZY2dNQkwxdmxTNTJDZVZSTkZwNWxSbkNVbXVwNWNRb1pPQzA0bzh6?=
 =?utf-8?B?TGpCdTkvS2xDa3NTQ0JEazNNdmd1UDZaY2E5RnJpWGdyQ3ZXRGw4c1N1YlQ5?=
 =?utf-8?B?S3lsNDRPcFF1cWFKNFo2bnMyWk5qN2h5TTlQdGpEWTAvVEthYmpXTlMvdVZn?=
 =?utf-8?B?OTNLRzJ3U0ZLTzVGUDAyLzNHWHhZRHh3SGtkQU8zbk8xOG5wUWJYQzFJbW42?=
 =?utf-8?B?dVRTVDczMnlsRUQ3M1NTT3VTdG1FUldSZnlUeVZzVVhQL1draHBnalBWK1Ry?=
 =?utf-8?B?MXIxWmJiTnRDRE1sY24wMk50b0huam8weFZtemRRbkgwRVloWUpSZEkwcXl2?=
 =?utf-8?B?U2NZaXFWTFg4MDBKZWozQXpFY2Q3WGlsWUtLRzZkRUtYdlFWQ1V5Vys2Z1Rm?=
 =?utf-8?B?ekZQUXhUbUp1c0RCcjljVE4wNUJTYk11aSt2UUJ4TDFmeXhKLzkvbmNGWlRN?=
 =?utf-8?B?OTlmTlRhQWhIZEVudnNudllyNDlyaUdKeWw5RWExaHM0aUhIQ01HQnd3UXpU?=
 =?utf-8?B?WDBPbkpFdm5haW01cmdJMGxLbjRRUWd0dVhBWXBUNGVnRndlTnVwa2tlOXc4?=
 =?utf-8?B?dnl1dVNmNFo4ejFselVydGtYS3RRbEw0UDRJR1F6RWxxZW50TTdDaUV5TVJv?=
 =?utf-8?B?NWR4MnFqNFdhNjdKOFFleXE4Vm1LVXBWTi9WYm56RmJ6Z2xMc1p0QStJMDY4?=
 =?utf-8?B?RnlVUXczSVdQajdYL0d0WHJYN1FZa1llTElnNTN0Q2ZhZXc0eVZwOUJqdDZU?=
 =?utf-8?B?MzFFdWhoWG85cFM1d3ZDWldWWGpTV3FRdSt6OTMzSW4rS2FNam1mSmk5M3hz?=
 =?utf-8?B?UDFmck0wdkI0K1BRVzVlazExNm9KemNDSUdRRzVyV1NXSFM2NFc5VTlNWU1T?=
 =?utf-8?Q?pVDOHDxCdJesI=3D?=
Content-ID: <3B069392F810154F955378EF39B4D04B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1247.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69db25b7-bc67-45b5-62f3-08d8953312e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 13:23:06.4868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OT4g0Q3sRbkZmUwBDRAKZScQvPipkbafK9lszjb76JS2zwptMBSLG/0OUznRbUzbN9eOkQAorsXUlvjb/VeNUY/vlOTdK8XsTWPiwOJBEqM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_082313_380400_5EEC0339 
X-CRM114-Status: GOOD (  18.26  )
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
Cc: Cyril.Jean@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, Anup.Patel@wdc.com, Atish.Patra@wdc.com,
 Lewis.Hanly@microchip.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAvMTEvMjAyMCAwMDowNSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPg0KPiBPbiAyMDIwLzExLzIwIDI6MDUsIGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBUaGlzIGRyaXZlciBhZGRzIHN1cHBvcnQgZm9y
IHRoZSBzaW5nbGUgbWFpbGJveCBjaGFubmVsIG9mIHRoZSBNU1MNCj4+IHN5c3RlbSBjb250cm9s
bGVyIG9uIHRoZSBNaWNyb2NoaXAgUG9sYXJGaXJlIFNvQy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAg
ZHJpdmVycy9tYWlsYm94L0tjb25maWcgICAgICAgIHwgIDEyICsrDQo+PiAgZHJpdmVycy9tYWls
Ym94L01ha2VmaWxlICAgICAgIHwgICAyICsNCj4+ICBkcml2ZXJzL21haWxib3gvbWFpbGJveC1t
cGZzLmMgfCAyOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgMyBmaWxl
cyBjaGFuZ2VkLCAzMTAgaW5zZXJ0aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21haWxib3gvbWFpbGJveC1tcGZzLmMNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
YWlsYm94L0tjb25maWcgYi9kcml2ZXJzL21haWxib3gvS2NvbmZpZw0KPj4gaW5kZXggMDViMTAw
OWUyODIwLi40ODgxYTUxOTY4M2EgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21haWxib3gvS2Nv
bmZpZw0KPj4gKysrIGIvZHJpdmVycy9tYWlsYm94L0tjb25maWcNCj4+IEBAIC0xNTMsNiArMTUz
LDE4IEBAIGNvbmZpZyBNQUlMQk9YX1RFU1QNCj4+ICAgICAgICAgVGVzdCBjbGllbnQgdG8gaGVs
cCB3aXRoIHRlc3RpbmcgbmV3IENvbnRyb2xsZXIgZHJpdmVyDQo+PiAgICAgICAgIGltcGxlbWVu
dGF0aW9ucy4NCj4+DQo+PiArY29uZmlnIE1QRlNfTUJPWA0KPj4gKyAgICAgdHJpc3RhdGUgIk1Q
RlMgTWFpbGJveCINCj4+ICsgICAgIGRlcGVuZHMgb24gSEFTX0lPTUVNDQo+IFNob3VsZG4ndCB0
aGlzIGRlcGVuZGVuY3kgYmUgb24gU09DX01JQ1JPQ0hJUF9QT0xBUkZJUkUgPw0KTm90IGVudGly
ZWx5IHN1cmUgd2hhdCB5b3UgbWVhbiBieSB0aGlzIG9uZS4gWW91IHdhbnQgdGhlIEhBU19JT01F
TSB0byBiZSBzZWxlY3RlZCBieSBTT0NfTUlDUk9DSElQX1BPTEFSRklSRSA/DQo+DQo+PiArICAg
ICBkZXBlbmRzIG9uIFNPQ19NSUNST0NISVBfUE9MQVJGSVJFDQo+PiArICAgICBoZWxwDQo+PiAr
ICAgICAgIFRoaXMgZHJpdmVyIGFkZHMgc3VwcG9ydCBmb3IgdGhlIFBvbGFyZmlyZSBTb0MgbWFp
bGJveCBjb250cm9sbGVyLg0KPj4gKw0KPj4gKyAgICAgICBUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlLiB0aGUNCj4+ICsgICAgICAgbW9kdWxlIHdpbGwg
YmUgY2FsbGVkIG1haWxib3gtbXBmcy4NCj4+ICsNCj4+ICsgICAgICAgSWYgdW5zdXJlLCBzYXkg
WS4NCj4+ICsNCj4+ICBjb25maWcgUUNPTV9BUENTX0lQQw0KPj4gICAgICAgdHJpc3RhdGUgIlF1
YWxjb21tIEFQQ1MgSVBDIGRyaXZlciINCj4+ICAgICAgIGRlcGVuZHMgb24gQVJDSF9RQ09NIHx8
IENPTVBJTEVfVEVTVA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9NYWtlZmlsZSBi
L2RyaXZlcnMvbWFpbGJveC9NYWtlZmlsZQ0KPj4gaW5kZXggMmUwNmUwMmIyZTAzLi42M2Y0OWI1
YmNjNDMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21haWxib3gvTWFrZWZpbGUNCj4+ICsrKyBi
L2RyaXZlcnMvbWFpbGJveC9NYWtlZmlsZQ0KPj4gQEAgLTM5LDYgKzM5LDggQEAgb2JqLSQoQ09O
RklHX0JDTV9QRENfTUJPWCkgICs9IGJjbS1wZGMtbWFpbGJveC5vDQo+Pg0KPj4gIG9iai0kKENP
TkZJR19CQ01fRkxFWFJNX01CT1gpICAgICAgICArPSBiY20tZmxleHJtLW1haWxib3gubw0KPj4N
Cj4+ICtvYmotJChDT05GSUdfTVBGU19NQk9YKSAgICAgICs9IG1haWxib3gtbXBmcy5vDQo+PiAr
DQo+PiAgb2JqLSQoQ09ORklHX1FDT01fQVBDU19JUEMpICArPSBxY29tLWFwY3MtaXBjLW1haWxi
b3gubw0KPj4NCj4+ICBvYmotJChDT05GSUdfVEVHUkFfSFNQX01CT1gpICs9IHRlZ3JhLWhzcC5v
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L21haWxib3gtbXBmcy5jIGIvZHJpdmVy
cy9tYWlsYm94L21haWxib3gtbXBmcy5jDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5k
ZXggMDAwMDAwMDAwMDAwLi42ODZjY2QzMzE3ZjkNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBi
L2RyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1wZnMuYw0KPj4gQEAgLTAsMCArMSwyOTYgQEANCj4+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4gKy8qDQo+PiArICogTWlj
cm9jaGlwIE1QRlMgc3lzdGVtIGNvbnRyb2xsZXIvbWFpbGJveCBjb250cm9sbGVyIGRyaXZlcg0K
Pj4gKyAqDQo+PiArICogQ29weXJpZ2h0IChjKSAyMDIwIE1pY3JvY2hpcCBDb3Jwb3JhdGlvbi4g
QWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4+ICsgKg0KPj4gKyAqIEF1dGhvcjogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+ICsgKg0KPj4gKyAqLw0KPj4gKw0KPj4g
KyNpbmNsdWRlIDxsaW51eC9pby5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9lcnIuaD4NCj4+ICsj
aW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+
ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVw
dC5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4NCj4+ICsjaW5jbHVk
ZSA8bGludXgvbWFpbGJveF9jb250cm9sbGVyLmg+DQo+PiArI2luY2x1ZGUgPHNvYy9taWNyb2No
aXAvbXBmcy5oPg0KPj4gKw0KPj4gKyNkZWZpbmUgU0VSVklDRVNfQ1JfT0ZGU0VUICAgICAgICAg
ICAgICAgICAgIDB4NTB1DQo+PiArI2RlZmluZSBTRVJWSUNFU19TUl9PRkZTRVQgICAgICAgICAg
ICAgICAgICAgMHg1NHUNCj4+ICsjZGVmaW5lIE1BSUxCT1hfUkVHX09GRlNFVCAgICAgICAgICAg
ICAgICAgICAweDgwMHUNCj4+ICsjZGVmaW5lIE1TU19TWVNfU1VDQ0VTUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDB1DQp0cmltbWVkLCB3aWxsIGFkZHJlc3MgdGhlIHJlc3QgaW4gVjIN
Cj4gLS0gDQo+IERhbWllbiBMZSBNb2FsDQo+IFdlc3Rlcm4gRGlnaXRhbCBSZXNlYXJjaA0KDQrC
oA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
