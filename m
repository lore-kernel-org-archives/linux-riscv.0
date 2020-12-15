Return-Path: <SRS0=RRT7=FT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911D8C2BB48
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 16:11:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D1F206DB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Dec 2020 16:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D1F206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b5IBoKTKYRatkcIgrdnAw+WETLUuziAVVucf9rp2p7U=; b=16pcMWGKfZE6j80GXlTvnUSwv
	85w/vMnKugLNCcrfg02wero5hrdcCCWC0I+iWTv+uW+IpUYRSI+JGHFaZw0IEYPpYcmya4yIKvx3u
	fkv1owQyfuFaoqpSDdwtsEGueN59ZVF+LI2tTJwoLsZzclrp5nBkmGijDlo/W7lPgfcKLewHRX/o2
	58BPQ9OqndMUYPSI+uJfm7+o2d6CsJq09zXAINrhtKL4sTk1bQMP7Tpm5z8PdYEPX7/qfpjRCOxN0
	fOAfEz6ePj97Lny6yqtnwcMvpKHdzsPXQtKp3MsdA67CnpS0P0XKOR+QdzH5I8Uah3UQI51vqUJGa
	VhHcb5r+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpCuc-0007gK-VE; Tue, 15 Dec 2020 16:10:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpCuY-0007fT-OT
 for linux-riscv@lists.infradead.org; Tue, 15 Dec 2020 16:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608048650; x=1639584650;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uXoubEVznbh/ClpylVPUArgDptNsx5vA84iF9aGyHs8=;
 b=soiNH5vwGABCGUq8XSDS5+ZLAxMuX6YtL2Hnv6D2NiD487r/ft/1OZ6v
 ts1f2YqfuVTuffxgKE7s052wEkJru8xXBDoeYHWC+MOzGVFwYN7gOmQpZ
 ae+2mxSAy0eeN0hILZwo1DI7VXWyBnLbPsOq6agxbbyogWN52SHdCeN1x
 LkA/w8UUbPPEVRIQOYaUgkDU4zmZUa1qYVgGL468al0MW8fLBkXXEAW/8
 L5BNOezEhWjKnGihA3NiahxYdKV6XWeiUsPwFm7/to5KsNgwavKI5xPrs
 v+KQDtyJKo+8QpbbF/W0KQdrpEdfCfZpId9YRA1hLigIbo1wjbIJinRsm g==;
IronPort-SDR: KldaIgAZ5kFcFEFbOr+zrWEMfxcn/S6o3tbiHa2TXveJUN9y+eqdGQNCtnDHlBsmAAcwl292Ag
 FpYZXGx6ToKhyLyWv7pj3+WV10qlwcJCdhMJp6pzr/4f1My91D5S8ihwlEBVSsiHgBJIPN6qLy
 R4WrTUgxMqg7BpvkEEyHE9KDTpE6I8h5bqvfVsh4apfBVpohdQ6vfu5NNignKs6oAhrIJWpv1w
 qyjZZxc9sSixiaRyYRrnffq+6BE57AD/ASvdoUzo4I7c55dorDbcrZRUzcqqP+YGxN/zuOKcXw
 gfY=
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="102860961"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Dec 2020 09:10:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Dec 2020 09:10:46 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 15 Dec 2020 09:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjuLDs7vXOclBSyJrEFCRAN9xbQULcnpBA19kZgQqjfkeWrrnf0TKtO9CNLgh+80uTincPngNHIAGdniS4AnSP177fCiCYAAadowaWFIMAGAl5IuDfdMSAxJFsQ52GMVtNzUqPdBqhnLuEaBsju3IozLZ2qaEtZ7PZr/nyQt2uQXv9OaWSqWowv/Skl92MboP0Js1lMqfmRcCLTFmkByapboaq3QxYArF5hXoDm+ACyqgKD76Wov+SC6AmW/T8NoXOSMC52fkn69LPVzH6pPKRU1DqPMkoMP05xITFvlxq92vra1irtRr2WpXp4a7+wJQaborKMDOAq46zsAuAUIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXoubEVznbh/ClpylVPUArgDptNsx5vA84iF9aGyHs8=;
 b=cbHCEvQtkcD3jPvwPLZLFUbDBFQmr/08wlRBaNIVRAe08ZlA+1vh56+n7K/IndhmyLEQGv2qDn09IxbosOQ1uBdS8T/EKVkRUI7WL4mGVwLtPY5vAqwELDnT2oDO9JA1W9gldaesVPGHXybuqi5mbco0aLW7kb0AzRcvY5e+9MzUTHNHEOFiqK264WpYfDBQ1RG4y3flDPjPCoR3ARiq/chEUdvkg25L6Xa9CY3OhRlUbMSXbvg0ed+M0orIT0ySICSFDmheYlPo7VxqIl3wgx1aaW+S9k3DFk/aMaYDcxn+2jf6dAvSpKafXIFaXkMWQ1EkO5ccBWt68LKlugQ2CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXoubEVznbh/ClpylVPUArgDptNsx5vA84iF9aGyHs8=;
 b=u/9Cc8yp6Bl4j4LnF1fyk1yLOBNwprERHi/bPqZ2sXCdnNmSV5/pFFOXyy9ddQKs6ZLb3oOQdNNZk6YmXaOG9b2FqiVutxYqwPHhDZ0V/K8wNZupOxBnHfrpEaizyAJGlGLAgCtxFSqN37x/8B42mLZ3q/dLN7sfNiCr2+5pLBk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1472.namprd11.prod.outlook.com (2603:10b6:301:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Tue, 15 Dec
 2020 16:10:43 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::bd27:48c3:39b1:20f7]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::bd27:48c3:39b1:20f7%4]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 16:10:43 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: add bindings for polarfire soc system
 controller
Thread-Topic: [PATCH v2 4/5] dt-bindings: add bindings for polarfire soc
 system controller
Thread-Index: AQHWx9GUMiFt2E9iykKozVqkenoK6anr04uAgAyWfgA=
Date: Tue, 15 Dec 2020 16:10:43 +0000
Message-ID: <4cfe0fc2-b89f-d737-fb5c-abcf2caa419f@microchip.com>
References: <20201201110311.28593-1-conor.dooley@microchip.com>
 <20201207155657.GB345332@robh.at.kernel.org>
In-Reply-To: <20201207155657.GB345332@robh.at.kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ec4c893-5091-42ac-1cc7-08d8a113f9ab
x-ms-traffictypediagnostic: MWHPR11MB1472:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1472C06D930FC35327EEE51298C60@MWHPR11MB1472.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uf/qgVt8HgR+ifQpOfMD0rIrK/dNHk3eo/HQK1wJZ9cM5SBHTmFNC7kTqNk842MWzsTr8cTueL4G8T1fopSHrs2udt3pQrvZZqvurp6rbrdTMbgaCE9ac2TrkhGOii4Gy7QrI8wkedWe2WzJJGazT83e+yxTKBFILA+hu7GZs7zYUCsPaEX7pcEUDlPsokZ7MBpxqniHAUCTZbUujCJhGfUBWnLYIwVkdGyV/iOeFyhDo7iEk4XcNMmgmNI+9/I+rpT0XYqTlYjfKMb7COPI0r+6CASUdpyI07W3DJ9L8Aw8Amr97/vhaUxid7rcmHg8sEzm4C9XFmlblVAO7CN2I93bin0sv8uIKZAD6uiCz3wgG6AEUExl+2nRA1hb1aWkq0Cotc6wOLjjD/KJH18ZblZ0Z7MpSqHMDKl5WdKeBH31MvwEBPankyYZJ93DdpgnRPPyZZZ+e52Y86p+45u62Q/cS43SZ3XfYgk9vLQ25c0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(366004)(396003)(136003)(346002)(6512007)(4326008)(86362001)(31696002)(478600001)(36756003)(2906002)(7416002)(31686004)(71200400001)(83380400001)(26005)(66556008)(66946007)(76116006)(66476007)(5660300002)(66446008)(8936002)(91956017)(6916009)(316002)(54906003)(64756008)(6486002)(2616005)(8676002)(6506007)(186003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TUluSlBIUHlkNklDemtMNlBHNi9qSDlCUU9aQXhYaVA5ZEZxWVNkdUFjWEFD?=
 =?utf-8?B?cm16SjNhTDZQUlQ0TllaVVRVU0pmR1JxbmtQUVMwQmJSOVdHR2IvTERCQTlo?=
 =?utf-8?B?NkhTcXZmSTJrVjlRNnVHN1NneXN1OU9vbGFXVnN2YVQwT2Fld3doU1hqSjg5?=
 =?utf-8?B?bVNtb0NzZThtNU95UGVIR3VwNUZvbkFXZmZVVFArUi9oSERMMmF0NjhJZUV5?=
 =?utf-8?B?aUhPS0U1ckhkSjh1R2FLbm9CelVTbDJpd1Z5dkNJNEx5Q2I1UGFWNDhQV08v?=
 =?utf-8?B?Yml2MDJITTlCYmJ6bnpLdTh1MXlDbzk4TkZNQ3BHZTlYSFFMSGN3WHB3Q2tk?=
 =?utf-8?B?TVhnWGovUnZjN08xc2dHM2V5aFpIWEltQlBhNFhBcWUvZkp1TUprWVhKYzQ1?=
 =?utf-8?B?blB1REVtWmJYYXphK0VpRy9xMjRnYWxJQkZ4dks2TURWVk0wZkR6MVFNODFr?=
 =?utf-8?B?aForaHZrK3lsYW5YK0VtVjRyQUpTUWFacG9QbnNCcEY2Z1llUWhydUJFQUxJ?=
 =?utf-8?B?VUYwTWswVnNTT1A3ZGRnWVNRT1NncEpvZVp1TVhoeFdzbUVKaFVUdHRJMi8w?=
 =?utf-8?B?VXJ3Slp4a1M0dUZ0NjJYM216b0ZBeGp1M3N5cVkzaEZGZFlpQ3lhbXpzT2RY?=
 =?utf-8?B?dmRVTkE5dVJ4VzNkcnlWeW1LSHlFZUVmV1o1ejIxZFdXSTJMdXJUd2ltY2pH?=
 =?utf-8?B?djdLdmNHLzRpd2Q3WXRWODM3RkdRWVRyc09DUGVQS2k4K1JpUFN3WE0xcjV3?=
 =?utf-8?B?N3czVkVKRzFrNzU4ZEhTVnR2UmVkRnliNDJXdDVwUG80NHEyN1FZK0tkc3VS?=
 =?utf-8?B?Q3U5MERacDJlOFFCWi9BaXRYT3ZaZytLMEdWQVI5SExNUmJVeUc1ODZtdmoy?=
 =?utf-8?B?UW4zVEtmMTdveWRJK1FFQkxhZ3JOOUE0NXlaQk1rSlN1QTBrZER6L1V0Vzll?=
 =?utf-8?B?ZGtvRTNlU2tBRlBqT2daZlRpK1l6UmNySmRDK3ozOTNERzQvT2dWbXRmVlcy?=
 =?utf-8?B?ZktWeTc4ayt1K0l4VWg3U1hFMFZjQUdQc1drd0VoWXRqbVpoaFU3REQ5cytX?=
 =?utf-8?B?dTh2L3YwSnVGc2oweUwxdHBNclJFc1RpM1dDdkUzUmRJanhxblJMSGM1Ullm?=
 =?utf-8?B?OWlocEtYb1JWY29BV0Z6eGJHdFJ0YXMrcWQ0ZEpMUWlMcVpYVVRIVFVhcjl3?=
 =?utf-8?B?cXA3eVU0eVdsQ1hJOWRQeWhlVzJ3TUFYZlJyYk9wWG5YRCtkczh5N29mWkty?=
 =?utf-8?B?bzNKNlo4c3VOZS9oS3ZQbkFzemJyK3pNMnMycXBiaDRLRVYrakNxUTM5OXcv?=
 =?utf-8?Q?RmVJTTcf+XQa0=3D?=
Content-ID: <BD80A4337400FB4CA9D656255C2D8916@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec4c893-5091-42ac-1cc7-08d8a113f9ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 16:10:43.7389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMfM9jweWGnXt0yJf0FOlP2IlgxykHD3CPhPmyF+UiHWEwmoP4kMlag+AQTDhxLoPOWwppPqc9ooPaoQNvnwH0jBRCkXINDyqPz3ozdbJig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_111051_166615_1A58AEFD 
X-CRM114-Status: GOOD (  18.39  )
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
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 Lewis.Hanly@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 anup.patel@wdc.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 Cyril.Jean@microchip.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDcvMTIvMjAyMCAxNTo1NiwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPg0KPiBPbiBUdWUsIERlYyAwMSwgMjAyMCBhdCAxMTowMzox
MUFNICswMDAwLCBjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gQWRkIGRldmlj
ZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUgTVNTIHN5c3RlbSBjb250cm9sbGVyIG9uDQo+PiB0aGUg
TWljcm9jaGlwIFBvbGFyRmlyZSBTb0MuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gIC4uLi9taWNyb2No
aXAsbXBmc19zeXNfY29udHJvbGxlci55YW1sICAgICAgICB8IDQ5ICsrKysrKysrKysrKysrKysr
KysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQ0KPj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL21pY3JvY2hpcC9t
aWNyb2NoaXAsbXBmc19zeXNfY29udHJvbGxlci55YW1sDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxt
cGZzX3N5c19jb250cm9sbGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL21pY3JvY2hpcC9taWNyb2NoaXAsbXBmc19zeXNfY29udHJvbGxlci55YW1sDQo+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jMjJmYzIwM2I5NWMN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxtcGZzX3N5c19jb250cm9sbGVyLnlhbWwNCj4+
IEBAIC0wLDAgKzEsNDkgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6
ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb2MvbWljcm9jaGlwL21pY3JvY2hpcCxt
cGZzX3N5c19jb250cm9sbGVyLnlhbWwjIg0KPj4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiDQo+PiArDQo+PiArdGl0bGU6IE1pY3JvY2hp
cCBNUEZTIHN5c3RlbSBjb250cm9sbGVyDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAt
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+PiArDQo+PiArcHJv
cGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiBtaWNyb2NoaXAscG9s
YXJmaXJlLXNvYy1zeXMtY29udHJvbGxlcg0KPj4gKw0KPj4gKyAgbWJveC1uYW1lczoNCj4+ICsg
ICAgbWF4SXRlbXM6IDENCj4+ICsgICAgZGVzY3JpcHRpb246IG5hbWUgb2YgdGhlIG1haWxib3gg
Y29udHJvbGxlciBkZXZpY2Ugbm9kZQ0KPiBLaW5kIG9mIHBvaW50bGVzcyB0byBoYXZlIG5hbWVz
IHdoZW4gdGhlcmUgaXMgb25seSBvbmUgZW50cnkuIEknZCBkcm9wLA0KPiBidXQgaWYgeW91IGRv
LCB5b3UgbmVlZCB0byBkZWZpbmUgd2hhdCB0aGUgbmFtZSBpcy4NCnN1cmUsIHdpbGwgZHJvcA0K
Pg0KPj4gKw0KPj4gKyAgbWJveGVzOg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4gKyAgICBkZXNj
cmlwdGlvbjogfA0KPj4gKyAgICAgIHBoYW5kbGUgYW5kIGluZGV4IG9mIHRoZSBtYWlsYm94IGNv
bnRyb2xsZXIgZGV2aWNlIG5vZGUuIEl0IG11c3QgYmUgMCAoaGFyZHdhcmUgc3VwcG9ydHMgb25s
eSBvbmUgY2hhbm5lbCkuDQo+IE5vIG5lZWQgdG8gcmVkZWZpbmUgYSBjb21tb24gcHJvcGVydHku
IEFuZCB0aGUgdmFsdWUgMCBpcyBvdXRzaWRlIHRoZQ0KPiBzY29wZSBvZiB0aGlzIGJpbmRpbmcu
IFRoYXQncyBkZXBlbmRlbnQgb24gdGhlIG1ib3ggaC93Lg0KDQpJIHdhcyBnb2luZyBvZmYgd2hh
dCB0aGUgb3RoZXIgZHJpdmVycyBoYWQgZG9uZSBoZXJlIHdpdGggdGhlIHJlZGVmaW5pdGlvbi4g
U2hvdWxkIEkgYmUgZG9pbmcgc29tZXRoaW5nIGxpa2UgdGhlIGJjbTI4MzUgaW5zdGVhZD8NCg0K
wqAgbWJveGVzOg0KwqDCoMKgICRyZWY6ICcvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy9waGFuZGxlLWFycmF5Jw0KwqDCoMKgIGRlc2NyaXB0aW9uOiB8DQrCoMKgwqDCoMKgIHBoYW5k
bGUgYW5kIGluZGV4IG9mIHRoZSBtYWlsYm94IGNvbnRyb2xsZXIgZGV2aWNlIG5vZGUuDQrCoMKg
wqDCoMKgIFNlZTogLi4vbWFpbGJveC9tYWlsYm94LnR4dCBmb3IgbW9yZSBpbmZvcm1hdGlvbi4N
CsKgwqDCoCBtYXhJdGVtczogMQ0KDQo+PiArDQo+PiArDQo+PiArICAiI2FkZHJlc3MtY2VsbHMi
Og0KPj4gKyAgICBjb25zdDogMQ0KPj4gKw0KPj4gKyAgIiNzaXplLWNlbGxzIjoNCj4+ICsgICAg
Y29uc3Q6IDENCj4gVGhlc2UgYXJlIG5vdCBuZWVkZWQgdW5sZXNzIHlvdSBoYXZlIGNoaWxkIG5v
ZGVzLiBJZiB5b3UgZG8sIHRoZW4gdGhleQ0KPiBhbHNvIG5lZWQgdG8gYmUgZGVmaW5lZCBoZXJl
Lg0Kbm8gY2hpbGQgbm9kZXMsIHNvIGlsbCBkcm9wIHRoZXNlIHRvbw0KPj4gKw0KPj4gK3JlcXVp
cmVkOg0KPj4gKyAgLSBjb21wYXRpYmxlDQo+PiArICAtIG1ib3gtbmFtZXMNCj4+ICsgIC0gIiNh
ZGRyZXNzLWNlbGxzIg0KPj4gKyAgLSAiI3NpemUtY2VsbHMiDQo+PiArICAtICJtYm94ZXMiDQo+
PiArDQo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArZXhhbXBsZXM6
DQo+PiArICAtIHwNCj4+ICsgICAgc3lzY29udHJvbGxlcjogc3lzY29udHJvbGxlciB7DQo+PiAr
ICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAscG9sYXJmaXJlLXNvYy1zeXMtY29udHJvbGxl
ciI7DQo+PiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiArICAgICAgI3NpemUtY2Vs
bHMgPSA8MT47DQo+PiArICAgICAgbWJveC1uYW1lcyA9ICJtYm94LW1wZnMiOw0KPj4gKyAgICAg
IG1ib3hlcyA9IDwmbWJveCAwPjsNCj4+ICsgICAgfTsNCj4+IC0tDQo+PiAyLjE3LjENCj4+DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
