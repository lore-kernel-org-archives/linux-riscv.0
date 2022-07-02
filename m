Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1572AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Jul 2022 14:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pv353WreEguMoxvqPsyQpTLj2i9DNjzmjbNWBjOGr/k=; b=wplwasNAtsCJKW
	1QjDdxns+yq3f7T5oOGRHXWf8hIH5Y2ykTtrqEUG18qWx/bloYX064AEETntv5iQu8ESDuZr9VGKz
	nzGBESzWsybT8ajU+/eYsoWm+bowRLmqINGXbs6LTcPbTacrHTDv3xczNxmBoLCJLM/z3GrG4ZIMo
	5c4sBmUqfsJmb19bRuCHI+Ppxv28F1wXEuC9iKYIF4iEaFLvyNWa7mVLWmapLDU+Lq7rehJSrVzCQ
	IVomDB43Y/wCxgCWBtyl3/VBmEkb7uftgh0kJl+wGoMKt8MZ6X6AUAwMaKgiG2Y51xIia1KLP/hS7
	ltoQWFenvrQXpczIik4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7eSO-00A2gP-4k; Sat, 02 Jul 2022 14:50:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7eSJ-00A2dg-S5
	for linux-riscv@lists.infradead.org; Sat, 02 Jul 2022 14:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656773443; x=1688309443;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xGaEss6DeaQDTeGHuNyRcMQyMwadcPhzgnPEpaGSAfg=;
  b=bEdSaCi66Nl3HUw6I4qbqVh//Bb48o/qWMqy2IwRkDNVfmf1qrhHRafJ
   9QgKEffS8vK9C+ZmYs52/wTcHdSjUDk8jhSuPKIx/dA1nNlved9qwaUTs
   4YAUnQ1VKSyoPxunFL6xN1/99xez665vq2D4X95B1zDj/BEVXwbn2Tx0B
   DaXwc3LISYG12GYuTaZ548RPLGkFUa+HFbKSN+qeyQ8rmAjH75GSwoliz
   Cbv0Y2JEeGtLIt4dxyVVxapATEpL+xmA5x2dA2aTYS0n9krwvOdpJpjbH
   2TazsKbOSowhiYnOKcgqhHQrgzrqaulwdMVzWFr7yD60gfI86BLeaqQBi
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,240,1650956400"; 
   d="scan'208";a="170799568"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Jul 2022 07:50:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 2 Jul 2022 07:50:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Sat, 2 Jul 2022 07:50:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQPxuCdProGbXCJ5NeTVVtNgSvlZFFcy3jOWMsNQMugAgCAJahX+hHRptU0+P3Fd8GKB8strV9dyS03sP8RHuk8nWDDd0Pd5Y1F9jo6KFx+aGdB2qPLLhqcsA1HF+giZzKwT3SSifFTxLeL54QE4KK3at+36HXPFLKNNZkRi+U/Cadr0bap/mewTe8X5av87cD+PZvHbtP4mVCni+6Jkg8h30qvD+70xXDqwBAF6irZ/g9MneCzE0gwD0wxRm62yzf0tZ6TyopC9dlN0Fwl7NfyMgeV5TmuUWChE6YHIlaPz+0xvxj1u3y8xf/+/mp/Be2fEbIzxf0BkTi8+aAPwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGaEss6DeaQDTeGHuNyRcMQyMwadcPhzgnPEpaGSAfg=;
 b=WDpHeDti1Uu0uXUePlcDmOF4tuhNgmGZ5wE2RzLWzKI6d0zQistVYWg0CO3MgKdSLrQkNjsLevX/TTSQzwSNQvv6PT+Y+QWshnYLDbD14dj50lZ8Q7PJSUJA6iXIVjg15JJh9TxAzDerc6KRGKUyfQ74ZjzB+LcMLT7sc8u6ztjo+hGdNKH9N3xxHDwwQeiOgu4aTrdDrwi/ew5LRUGFa79WiheppZO3zdb6U5mUjxqfbxSu7ZVNJnC8LGibf1n5tdPffBL0YQ3iq9P72Fnq1P1O6WqHCOLiFQTtqaCUt5d3Hjfmm23j1/pPwIvsZG/kKF4lnKrN9hfSWdXG+cThlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGaEss6DeaQDTeGHuNyRcMQyMwadcPhzgnPEpaGSAfg=;
 b=PNJUwQGZZcr+tWVj2Pe+FpOvxDfCKoG/kIYvUrSQPaKSrXuu2mgeY4R99XS1BFp9e+ThZ+UImlWjtU6pYRW+EwVxN0/+Kpc+c8ol8vCtqeCRw6cHRfgo8k6bddc9/fAmSk17US3knMAd4C1CNowGyTGmERt6ZuHzjddDLOohiGo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM8PR11MB5575.namprd11.prod.outlook.com (2603:10b6:8:38::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Sat, 2 Jul
 2022 14:50:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.018; Sat, 2 Jul 2022
 14:50:35 +0000
From: <Conor.Dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<palmer@dabbelt.com>, <Nicolas.Ferre@microchip.com>,
	<Claudiu.Beznea@microchip.com>, <p.zabel@pengutronix.de>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 13/14] clk: microchip: mpfs: convert cfg_clk to
 clk_divider
Thread-Topic: [PATCH v1 13/14] clk: microchip: mpfs: convert cfg_clk to
 clk_divider
Thread-Index: AQHYjFiyIkQOJ8CbOkiGHeJXuBuJXa1rLXqA
Date: Sat, 2 Jul 2022 14:50:35 +0000
Message-ID: <6dddf781-c912-e14f-9236-4a8e6ab45d3b@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
 <20220630080532.323731-14-conor.dooley@microchip.com>
In-Reply-To: <20220630080532.323731-14-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e968e65b-42c7-4436-ea19-08da5c3a38b6
x-ms-traffictypediagnostic: DM8PR11MB5575:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOYI3xr4i+3ltd9BcYb0imfse/59a1X/yBQV1unk8VS43fQkBYamBWGL5l7xPqnDMRcykGpFWZ3y0xLKPATsay77ySSzgGHUC1Dx4ClqDIv/2jw0FQj+ReoEE3j9VhDmFZXccgTxidcUmwXheDKOYghtcbegYJMQLC86rIR95+XaS9VF3X2VatDyuoUrDYafE2brkWgdO9pn8vjCTTBf4e5/QxClvjULDUmGGxqUwqbZVlsiCGx3rD7HWay9VmE4YX9W/KRJfVNH0L04GOJUYjzs/mFde/TLF/ZNllzcmimxJu8rtL/E0kHT6ubyyxCdEMONyZFEgz2KXGWhNBlRpQoMo0q/ClOjezckWdpWWvD4jIgoRyxGMoZANJB6hSFz9ihEZ1HWiRVmWad+ipcwlgXQ6iQQO4Fd8695HL5bo/qBq0jQtYADqAMrlK40MjJodJyuE+wznFxKZU+t8Knzc2RAEuZeXOJnfCagD8/SCjOQD0yK3GXIld2JsgXXOV5xLGLxDxSfF3m1fel07wNXUL7C/hYjMxQcRGaVJ+SZgdohNOfJSlblKFxEpyYev8dg688TbzQ+jwP1Tp8gQf+7HvXEUTdTc+JCsInHp7cgaWMByrff62z0Y8XgYYey7REMyKnytwHK8oIekwa3ILr+mLfV/h/XIcTwR5V+mr+6PNnZB3dfMIINucdjRV4jwj7tv8ne4kbWj4HF1MGXmu0obc5L6VVbCCZ9vfEMmfjR7rar0S3fwZ+2K7jK1ERububWG4HVWkCkJJuHnvfJ0LsNNsxwy885D+EnGV4RQGAiv29wMDUexGMgfv13MiWsslZ5JaQT5t/YPfkUO08Vriguv/iu9BnssPOHh/FQx89bp2mf34vb4sJdJcOdjY71ngZdu3zcbFoD23PCFUJcY/XGs7b/ys9nFxPddtIlqadNffM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(366004)(396003)(39860400002)(86362001)(31696002)(921005)(38070700005)(122000001)(38100700002)(8936002)(6486002)(966005)(478600001)(5660300002)(2906002)(41300700001)(7416002)(316002)(6636002)(54906003)(110136005)(71200400001)(4326008)(8676002)(91956017)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(186003)(83380400001)(26005)(6506007)(53546011)(2616005)(6512007)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkJVd0tDeDVRUGR2SUNSdVZnU2kraERLbFZVRHlIbFM5QjFXVGNQYkl0cGtX?=
 =?utf-8?B?YnFHdjNYTXcvSVBWbnU1STBRQ2RFeVE0TE0wQUFac0YxbHlOQlg1TE9wUmVF?=
 =?utf-8?B?TDkrMTZNamxUSjVsUmp6QmRzT1N6NUdDYStjeEdkMmpSVTJtVDUvOEJnTjYy?=
 =?utf-8?B?NXNjUEtYSExLejVzcldPUlhBMW01Y29xay80elVqM3VEeEdLUTExVE5RUFVQ?=
 =?utf-8?B?akhnZlhQVGFqU1hZT1RLYVEvaDY1VkhabVBPei84b2pqNndMaGZWU2xGajhS?=
 =?utf-8?B?ZjdxK0N5c3ZjdG1WWTBETjl0UmMxV0VqN3ZwRmMvUjg5ZWlSMXRZZ3ZOVndi?=
 =?utf-8?B?YVpUOGZ0VlZnbDA3dVdIMFR1eisrTldBWFdBbFRaTTgzWjF2LzVmeW5pSWE1?=
 =?utf-8?B?cDdrS1ZFWWY3SVYyQzFqRWdRZ1ZuQmF6NW1lNWtOK0VEQmJWa3RaODhJYTFE?=
 =?utf-8?B?dkNZalRPTS9STU0xYnJ2WEI1ZXVWN2JaTnRmZkRmVW53b3RTbHRTaU9qbXV2?=
 =?utf-8?B?ckxsWDlSeVJZd3c3Q3JNVXVZWTNCK3NaclNCVlRkZnBGT1lNZm5hL1UrRDVK?=
 =?utf-8?B?VUZuUW9yOWJIckJ6UnhxZWpoZ3U5L1JRNTl0M0dFUm1wbGp6ZUJObHVMQWF5?=
 =?utf-8?B?SmdOajNMSFM2aXdXcUJNeVYxMzNrNVl1bHUvUTBCK2g4NUJXbTBXeDdvbEE0?=
 =?utf-8?B?SGZqV2dRUnlZUTNBaUNITlZjT2FFYW10MHJ3UEJENzMxQXNBcDB0cURsZEUx?=
 =?utf-8?B?N2lMeU0vS1N3cThBWUZQK0NhWVkrVHJTb2FNK1hQZ3VBZkhnRUI5dEp0OFNr?=
 =?utf-8?B?K2pJZUhkMzVUTk8wckk4VmtBN25oM0ZoL0s3Ly9VeEhoN1piUklKOUN4Ujc5?=
 =?utf-8?B?aFhLZmMyRGJiZlZ5V0xBV1FuTzFsQUdyV1JVM09JVTF6V0JmZEVtMmgxWXVt?=
 =?utf-8?B?NWVWemdlK3lFTVQvZ3ZNR0pEYnRWS2JwYk5HUXpoRjlDZll5S0k2Y2RZb3oy?=
 =?utf-8?B?S0lxUDZBOUNyVnNiQ1k4anJiYlhCOEdpOHJhMFZlcFdTZXRzUlJqNUptWjdG?=
 =?utf-8?B?UFFyZWRzTFpHWEpWMVljUGN5MWVVenJNMkxMaWU4NGszSEs1OXlyaE9mczBS?=
 =?utf-8?B?dTArL3pSUlMwSUZnc3JhUDZGNFZVM3hKYWRoWkRVNVZCdDF0RmY0bnRFb1k2?=
 =?utf-8?B?S0Q2c09OUFladUtwWHpBc3ZMUEpSMkZZc21VSG92K0c0V2tHU3dybytFcVdN?=
 =?utf-8?B?NWhURFd0YkFRdTFMVWhaMGpQTEhObFRzb2NWZEtsUG9TT29uai9VLy9DVzdH?=
 =?utf-8?B?aXNBUmtOb0VNWDJBUFBvSENpMEpNZnczaExTYk5SOE5ablhpdVd5amdxTVhQ?=
 =?utf-8?B?OFdoSTFFUlN1Nm0rWk03eDloSkpKdHh1QU41SnczS1FtN29MSXVJME5kTzBK?=
 =?utf-8?B?YWg2dXl2OHVIMGh4OTdGWlFweC9Ca2drb1k1cHVyU2cxNUkxVUZESExRYkZY?=
 =?utf-8?B?alE3VFp6VDUxOSt5Wi9jV1FxN1NoZW10NUtxbzhjQUhybVNvdHpKbjJZM0Fp?=
 =?utf-8?B?aWRGUlk5WDlqQ05SYWJUakdLS2JSVjZtMkpZTitrL0FTRFJTaWJUT2xtak42?=
 =?utf-8?B?OEpoN0Z2TEtGM2oyRHlWMnlBUDd3SkRTWWVudFFiMkZrZHZMZXhOQlg0UFpO?=
 =?utf-8?B?T3YzcExkeXBLZzNsQ29kUHl2bXArczgrb1pYSFJvU1lhMFp3VHZ5MVNqL2dJ?=
 =?utf-8?B?WWpvOGk2Q0VWMHdMWVpEUjJMcHBRWFBuZHV0dmNpb2xGbGRUejZsRTRnUTYw?=
 =?utf-8?B?Z1Zpb3ZvbGpLcEpVcUZyV1NvTnJFMWFKSGcvN1VYTjVGTzlJY016RkxxbnA2?=
 =?utf-8?B?RkdoQlBCZ0tHVnBsN1k2akpGY3JSU2xRTWNIcDJjSXFwZzE5UW5lMkJiQlNY?=
 =?utf-8?B?TUcvYmgySTJmdjFxTVhkZ0ZJOUtYQVdrVDRibUdMUzlCN0M3VFFScDhSa1Yz?=
 =?utf-8?B?TWlJcDFNVkNOd0k4NThwV3hJZHpwUjdONDI0azhqQlFsNWdsSmorUlJzVVJY?=
 =?utf-8?B?eTZ5cXNLSk1JRmdVQkxpTTZwTGFCNjBaUXpQeGQwbXRZcllzNkJ0eU1LOTZx?=
 =?utf-8?Q?7drOBLvVE65YIN/oIrK3ZbABE?=
Content-ID: <6CA14ECC4D7E284DB68939A1B0931230@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e968e65b-42c7-4436-ea19-08da5c3a38b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2022 14:50:35.5404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ERy9DQglP0SarNFl52dRtLF71Dbs97e9GvO05uC8m6OoD4254f5N3HeaHx63PKk8mdSXSjcBz4AdMmxQDBGnxI4dPm5OSp9e3hXifcs6T1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220702_075044_180610_C6BC9A09 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 30/06/2022 09:05, Conor Dooley wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The cfg_clk struct is now just a redefinition of the clk_divider struct
> with custom implentations of the ops, that implement an extra level of
> redirection. Remove the custom struct and replace it with clk_divider.

Looks like I forgot to assign the spinlock in this and the periph_clk
patches. I'm respinning anyway to fix Philipp's comments on the reset
controller & to drop the two net-next patches so I'll fix this too.
Thanks,
Conor.

> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/clk-mpfs.c | 75 +++-----------------------------
>  1 file changed, 7 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index e58d0bc4669a..c4d1c48d6d3d 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -51,24 +51,13 @@ struct mpfs_msspll_hw_clock {
> 
>  #define to_mpfs_msspll_clk(_hw) container_of(_hw, struct mpfs_msspll_hw_clock, hw)
> 
> -struct mpfs_cfg_clock {
> -       void __iomem *reg;
> -       const struct clk_div_table *table;
> -       u8 shift;
> -       u8 width;
> -       u8 flags;
> -};
> -
>  struct mpfs_cfg_hw_clock {
> -       struct mpfs_cfg_clock cfg;
> -       struct clk_hw hw;
> +       struct clk_divider cfg;
>         struct clk_init_data init;
>         unsigned int id;
>         u32 reg_offset;
>  };
> 
> -#define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
> -
>  struct mpfs_periph_clock {
>         void __iomem *reg;
>         u8 shift;
> @@ -228,56 +217,6 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
>   * "CFG" clocks
>   */
> 
> -static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
> -{
> -       struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> -       struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -       u32 val;
> -
> -       val = readl_relaxed(cfg->reg) >> cfg->shift;
> -       val &= clk_div_mask(cfg->width);
> -
> -       return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
> -}
> -
> -static long mpfs_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
> -{
> -       struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> -       struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -
> -       return divider_round_rate(hw, rate, prate, cfg->table, cfg->width, 0);
> -}
> -
> -static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
> -{
> -       struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> -       struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -       unsigned long flags;
> -       u32 val;
> -       int divider_setting;
> -
> -       divider_setting = divider_get_val(rate, prate, cfg->table, cfg->width, 0);
> -
> -       if (divider_setting < 0)
> -               return divider_setting;
> -
> -       spin_lock_irqsave(&mpfs_clk_lock, flags);
> -       val = readl_relaxed(cfg->reg);
> -       val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
> -       val |= divider_setting << cfg->shift;
> -       writel_relaxed(val, cfg->reg);
> -
> -       spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> -
> -       return 0;
> -}
> -
> -static const struct clk_ops mpfs_clk_cfg_ops = {
> -       .recalc_rate = mpfs_cfg_clk_recalc_rate,
> -       .round_rate = mpfs_cfg_clk_round_rate,
> -       .set_rate = mpfs_cfg_clk_set_rate,
> -};
> -
>  #define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {                \
>         .id = _id,                                                                      \
>         .cfg.shift = _shift,                                                            \
> @@ -285,7 +224,7 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
>         .cfg.table = _table,                                                            \
>         .reg_offset = _offset,                                                          \
>         .cfg.flags = _flags,                                                            \
> -       .hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),                   \
> +       .cfg.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_ops, 0),                \
>  }
> 
>  static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
> @@ -302,8 +241,8 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
>                 .cfg.table = mpfs_div_rtcref_table,
>                 .reg_offset = REG_RTC_CLOCK_CR,
>                 .cfg.flags = CLK_DIVIDER_ONE_BASED,
> -               .hw.init =
> -                       CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
> +               .cfg.hw.init =
> +                       CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &clk_divider_ops, 0),
>         }
>  };
> 
> @@ -317,13 +256,13 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
>                 struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
> 
>                 cfg_hw->cfg.reg = data->base + cfg_hw->reg_offset;
> -               ret = devm_clk_hw_register(dev, &cfg_hw->hw);
> +               ret = devm_clk_hw_register(dev, &cfg_hw->cfg.hw);
>                 if (ret)
>                         return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>                                              cfg_hw->id);
> 
>                 id = cfg_hw->id;
> -               data->hw_data.hws[id] = &cfg_hw->hw;
> +               data->hw_data.hws[id] = &cfg_hw->cfg.hw;
>         }
> 
>         return 0;
> @@ -393,7 +332,7 @@ static const struct clk_ops mpfs_periph_clk_ops = {
>                                   _flags),                                      \
>  }
> 
> -#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
> +#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
> 
>  /*
>   * Critical clocks:
> --
> 2.36.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
