Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8825DC00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fRe0bfAUNMPM1ywWeX9tiGN0A2/w5xa5pGc+Jb8Gp0=; b=yQXCfK7OhSVeMJ
	qM622joNdJD2bYQhF0DsWVoeJ+FhC9RdWYN3gyeV9ZADFWbeSLwvDh9uP58HHK+ZA9n0CaS6wUcKX
	xl4gnKLRJCFRPSxpxtqWjcSYJMp40DOmvcBNeoepEYNFepmaauGJX/oMfGCgQqLgF9cJfXbagNO7O
	Rtm/g2oozrCBGrIaNa0bPv0TD6d4aGFlRQz73boWWbUQ0fMkW1aL77vHexkT53q2egXEmcRcApjiv
	ofMt+kBnCpKoXpJy2qaL4/RGjlPxE3HrGV0ymMqAXDA/SAM9COjsylphnUXX9mSg+VS+TTMRKlPav
	mSAd2rnuMep7OZHY2E6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPga-002Ks1-HL; Tue, 26 Jul 2022 18:53:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPgX-002Kpo-T7
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 18:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658861617; x=1690397617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=R8uA8WLgBFBKnU7ncR0TaCHRWIWIUMTf5ztL6h9swIA=;
  b=Aoy2Sn/h4UR4APmJ8vjvTyA+w5Lifwgrs/fqmHkxE1CFl4fIeoOYPznJ
   eQEdQNgSIQ+TZNnYMUm+Mrfk1EstNcbk7cd/6/g4i0TIq9yO9IAyi+k+E
   i9/bRa+ql1KgWp6lfqLgCbtr/ZRsjJcRS/VFae+zwI/SDLBo1DJm3ZW6C
   Y/otfXCi0f33901d3OWR7blnGmLCdm55m3AUOmosA6ajCHL7jEBe3AMBO
   EpCxD4ErFnFJedUBb2eEOOLPPmA/Bn8lq30v6ZsLeuw+2utYUUaT1X161
   Kt01tcaIDHaT1+fHI29IZW0AFTQ3+HNx0ZyZmXwVkc49GxJkemy36IeUJ
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="169621221"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2022 11:53:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 26 Jul 2022 11:53:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 26 Jul 2022 11:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvA6ayrIga94NcAwCGP67CDSlSoq9dT83Fm84ChXjh9AH+1EpsxlHaK1TbUVQCnWY/siyT+1X7H1GA9zv+fBQpRARKIfcacINTOeuGsIl6HobcQuf1Za+kFiX7lV97YPWZF0xDCk+RpbXgExkSJwvlCzQxtJlxa37SidIkybVeMzV8c8OFlVP1xBcoafBSUMDJ6ab+FJMYPik6btUDAh3rZUI8uhAzwQeE+Wtz8ccuNX0dB9Y/3VnSIsj8y8GTuVWOdmR5Xc1wVw1vQdoZ8lTEjgsLAq593g4zvvGFLul6BXYpOq5IKLxqlDQTZPvkXLqO2A9HyUfDRS2a1JpZAvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8uA8WLgBFBKnU7ncR0TaCHRWIWIUMTf5ztL6h9swIA=;
 b=WxsyrJkYJtt0XwUInMZgRAVlDcgBLkSTr0Q0BPKFi9Tj1o+j+kfXKmkLPDzpoxnLH2vvd9e8Dyz7/SAog6+ycS8rSX6jcMgoUDk4Exo0HGTPXWAurvTej+TwaEmvtFRcM9sNHhMMlTgm6D+Iv0RGq1Xm/9OwwPDkDiqKKHqrer/CxZ8YoXtlwiOE3lBZWD4kW+FhX/oECBGG9nPkVtkNNG3WEeLZfJY3Ve6sLJMR4J3d7rXFnGh8jfQoAjNwVyos+dezBnkyn52rjCnKSE9F49wVBnGIdMwcbIdF6D0yGwS4pVrAZa2xPm3HbzH27ovevRyHMM+lX3tiafRI3AARWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8uA8WLgBFBKnU7ncR0TaCHRWIWIUMTf5ztL6h9swIA=;
 b=YtGmqILvVLqU8bJozGBxRT0b9E+Ytn4cdSJsrtXMk6jYzgM4TOo+RNS1CWT0jeKJS1/Iatj25iguEUaoO0fJ1TjzaDIaRLnKskxp62pPlIjoXu9LutymM9fjJN8O4lBiwVZxGY2OMe5bcs1I+965qk7ZSrqQQPnj7mZE5ys0c6M=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3197.namprd11.prod.outlook.com (2603:10b6:805:c5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Tue, 26 Jul
 2022 18:53:32 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 18:53:32 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <geert+renesas@glider.be>,
	<magnus.damm@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Topic: [PATCH 6/6] riscv: dts: renesas: Add initial devicetree for
 Renesas RZ/Five SoC
Thread-Index: AQHYoRqPxI/VCgWJ706uhVm84f5gp62Q992AgAAH7AA=
Date: Tue, 26 Jul 2022 18:53:32 +0000
Message-ID: <8fcd765c-d0af-9759-be0c-8ac90e4e5d95@microchip.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <cc6f723a-441e-55fc-5044-890d45fb79b4@microchip.com>
In-Reply-To: <cc6f723a-441e-55fc-5044-890d45fb79b4@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f7ce572-4c30-41a3-3026-08da6f382303
x-ms-traffictypediagnostic: SN6PR11MB3197:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vqBPuEKeHHBeeVv7JX/qCBO0dzIXr11fuXYIwHiF7bQgKwy9MeF5duBHg9W+lf4MbN6cpVxTFKDzmcLjGpuJufCuW82mOPD+7qdfprwEU88UH69tG58BZzv1hpSI8x+XSbmAf/fQdPtkbZaQSzj+Pyf3+XZXFNlJLlAlFHTCpK6bQeIxO1yNkZToO9mSgiuUCT3k51SvT/atzw3HU4rl1lFpEeU6nLaXucEdPAjeizPVFHIA1ltyJ38YCxm+V/yXcwDkjilhp7/7A56kPcno6jiw6+D9fHDJdY3jIhKZ0pCLnkdeEZckDJRZotWKFD3JZbbUpsR/cNos+Ph9O4sVk6f2EM3Cm3PsJYuGxKclvJiYgrbCHFgikQ/NQ1dkDqqLH+yiOWDkVNXJZ+L4KWE0qy8RHTEgt/+2ycP2FOQZ8jqiLrbsga5U4/I5ogx3JBwCYB6ZMT8/PdongYRJ/ejbc22XlXfcqzdSYyn+XKTKKh/V9RMPBk1lNFY9XvFMT/bCB52JLHA3WT61BMX2KkfbxXfObQzz+4XEBZ2UmIs9nL4l8kByiYa+n0fY5YW/RTqUY3rww9e7D9epbaLAvYfzQThHKzl/r6QDPIi0W7ZZNRs5LTbgrJ6AY2eOZgAegelxjv5pW09oUm94NymjBMFEtpkTaf4X+seAowucDkSkwbZKaVeE+iMIqSqZClXoZJ/Eydo3DwsAP1SZZ6QQnMRqlCovJ7Zgkmz0pw4+d8DcfJeBRXtZyvcJPHUNuzpyaFVENdIRirrNor1j6lz2Dqka8h2KQjKkxmZcvyuCyw9NrS6JRkFdYV9dzhoSCPfzj3Z7CtGS8LdS195p91rUng1GFfBgDpQaCkWFi69+mkFDZZ9C26TLrpFgvDba2mgFNYLP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(39860400002)(136003)(38070700005)(2616005)(316002)(8936002)(38100700002)(83380400001)(7416002)(31686004)(71200400001)(36756003)(2906002)(41300700001)(4744005)(6486002)(122000001)(5660300002)(478600001)(110136005)(8676002)(54906003)(6512007)(26005)(86362001)(31696002)(91956017)(66476007)(4326008)(66446008)(53546011)(66946007)(76116006)(186003)(64756008)(6506007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VDNjK21NdEFNZ2p1WkdRVGQ3K002cDdiRHpFY3Fzb2pGdGVMUUpEVEhSWjNW?=
 =?utf-8?B?dVhwMEFFS2VGb3M4Y1d4MVpsVE5TUFFtQU83bUFQcmhTWGN0QkY0OHI3aDRI?=
 =?utf-8?B?UFVRWDZja3hJMVl2UTgybno1MG5YM2s5WlM1T0lEYlRUL3EvRVh2eDJud204?=
 =?utf-8?B?WnJPa1hWRjJGMnRBR3QzdWdqSHl6VmNOandVU2EzNHB6UzZCSm5JbWU4aURk?=
 =?utf-8?B?UXo3eWppZkFmZlFHTUZZR1UwWmdCSlZwRU1oV1l6Nm5POUxQWmk0QXBTQUVC?=
 =?utf-8?B?T2JiTk53ZS9FdGxXOG9nbXBTbWF5V09ZK2crTWpmZEZoWk1RbzBDamdwZi9F?=
 =?utf-8?B?OUptdExOZzFUZjRoRkF2VlBnTEgxWGVIM2RuU2hhSCt2YytCSlJuT2hLUkhh?=
 =?utf-8?B?VnRmUHl0V2VybkRSRmVwRlFjYzFjMzgrT3NLWDhnUGJmanE5aUFFSk02ZnEz?=
 =?utf-8?B?OUNNVHRxV056ZlVBeGpUQ2pwMjVOTThmUUcra1hBQ1orb3N1QUo0Z3k5WVJX?=
 =?utf-8?B?c2VMWjV2UHZpUFBWY2V2Qk1RamRYWXM2OG1BanUzbUFmcUNYM08zd1ZLQU80?=
 =?utf-8?B?WVdZc08wM0VBdlU5ZGVXYk5ib25xZExyRU51eTRza24vNXliM1hEa2lzM0NK?=
 =?utf-8?B?aE9VQUg2UzZnWm9PVzZSeWlwQmE2MEk2M1dhWmUvbzdtTkxFSWU1c2ZLbDM2?=
 =?utf-8?B?ZlNjWndwVEVJOHgzZm10WDQ2RC91TFU4S1FEd3BFVmsvQlZLTTcwYmhHamZs?=
 =?utf-8?B?OTNlVFZ5Y1JoLzhSenlkZVUrN3l5RFpMaXJ4UElibnZLaVdqUkR2U1dKZXhN?=
 =?utf-8?B?T1hKTkxHSmRtNHRCeDVmNjVMd3IxbGFNaFgyMVRuN0RrQjdPcmZJZzR1N1hT?=
 =?utf-8?B?cXdHK0JKcWJUTEEydVprckNHK1A1dnh0Q0c3WGNQQ2hicHhGTG1Cb0NYSjB6?=
 =?utf-8?B?TzV4R2FNdDBJcU8xaXlTQ2ZaSWIzSFhXeVp4WG04NmI0TGF3TFVsUnM1Slkr?=
 =?utf-8?B?cndiNGRjazJmMGtpcjBkYjZQdTFiUjJyQWREaGIrQjRpcDg1amhDMDhqbUFR?=
 =?utf-8?B?OG1mTWJqdUM4RDVkcEZMdHo3am53dSs2c080QkVvVE1VRWNQZXg0aFhSa3ox?=
 =?utf-8?B?K3p6STBrZmNqZVF1b1ZsR1I0TGtJcEJCL2tteHhBRGUzWGc1U21VL3hNZUsx?=
 =?utf-8?B?UGtrWkE5ZStIY3BDYWY1ZVcrUk1kK3hvejl4U0NlMEdNdlBJeU52cjNlelFW?=
 =?utf-8?B?dzJ1M3pGakcxd28xVHlxR0t1Wk5RTC95UGQ5djhVUXhNcWpEZUcwSzRUdEp0?=
 =?utf-8?B?WTZIdlpQVklhMWxpR3dmZTJhYUc5N2FkQ2lqYUY0RnNBVnh6MlZSazN0dEJB?=
 =?utf-8?B?T1QrbVc5UmVudE1CZExUc2JHdzlDOGlpa0VRc3RRYUgwYnp5MUZuMzkybFBO?=
 =?utf-8?B?QXk1UUIvaDJQc0ozOHNwM3A2cStzVFVIdysrMkpJU3NXWUVJRUJwVFRmSzFW?=
 =?utf-8?B?cjFjaU5RcUQzR0c4V2Z5NDlaREJEQVkzTGd6ZnhaZGcrekw3bFd3cEhZZTdv?=
 =?utf-8?B?SlJBSnVzUUpiNnZJak5BQzNlVS9Ec0JNM0dNOUlacFNFcHZoQk54YkV6dWUx?=
 =?utf-8?B?ek5zSFozRG80UDhTcUgrS1V2QjRVUzdMY25IcmE5SXVxRnVIeWtQK3AwWmNV?=
 =?utf-8?B?VFhZd3d0THNIRUpSSkFGQ25XdS9lWHB2eks0M3d3NFRSc1pLMDFkZkVpblBt?=
 =?utf-8?B?NFp3amEveG5rRkRPeitvRXoxZzEwOWR2ZGZTY3ZtV1RnZXhPVDFjazBYRDYx?=
 =?utf-8?B?UGFOMlo4VWQ3ZjR3bkxyTGVsek1XbVRlQmptSS9qckFMU2QwcEhhU0tyU2dZ?=
 =?utf-8?B?ek0rM2RHYk1UMWxLK0hudmRMcUpGMDdrVlczUDl4QzMvVDJoNTdSL01CWVdp?=
 =?utf-8?B?R2dFMDFHZ1AvWnZTL2dsc05WSWs2UDM3MnhwaXJhRmV4VFdjU0hEenhzbWNn?=
 =?utf-8?B?emcyenlZYkUzQncyUStOclhFbTlDejVPcTlTZ3V6eGFMV1h3V3Y2S0NlVERN?=
 =?utf-8?B?ZkRDRVNNRVYrcC9jYldtUCs5VEZwbHB1RXZ2YWk5c1R6WXoyWGNzRS9SRHNM?=
 =?utf-8?B?N3NJYmJNV0xQTTVYZXZKeWpZVHpLVVBWZ2FrdlBWT3hqa3JQUDlEanZuUXVJ?=
 =?utf-8?B?a0E9PQ==?=
Content-ID: <4DFFCAB7FA878B46BDAE9D4FF14AA899@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7ce572-4c30-41a3-3026-08da6f382303
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 18:53:32.2453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgbflaM0xlxCBi8OHDbPai3yHTKqri6pBN5U58Bgr9VupQXxC4DcEXXC2/Ed+nYnlobuEnwDRn4lZ3FcowE5HFQCDg9GEWnL3jSRLBL+ulg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_115338_071890_3D907ECC 
X-CRM114-Status: GOOD (  14.65  )
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

On 26/07/2022 19:25, Conor.Dooley@microchip.com wrote:
> Hey,
> Saw your other binding patches coming in earlier & wondered if
> this would show up today ;)
> 
> On 26/07/2022 19:06, Lad Prabhakar wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
>> Single).
>>
>> Below is the list of IP blocks added in the initial SoC DTSI which can be
>> used to boot via initramfs on RZ/Five SMARC EVK:
>> - AX45MP CPU
>> - CPG
>> - PINCTRL
>> - PLIC
>> - SCIF0
>> - SYSC
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> ---
>>  arch/riscv/boot/dts/Makefile               |   1 +
>>  arch/riscv/boot/dts/renesas/r9a07g043.dtsi | 121 +++++++++++++++++++++
> 
> Missing files? Where is your Makefile for this directory?
> Or the board dts?
> 
> Enabling CONFIG_SOC_RENESAS_RZFIVE causes dtbs_check to fail :(
> 

FWIW, it breaks the dts build too even disabled b/c of the missing
Makefile.
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
