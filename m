Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BE9C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 04:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNfkFcTV5Lh/acV+DL9Ow7LKYZ2qGZqZP2Wl1nm4JH0=; b=fuf7iMV+v8g/Xo
	2psrHnJM3VaR8kUiWItQg12MlY7x0Q+kW1YQTsb0ym0sEduzbbb7Ph7b/9GorZkqVQ5v29hLi8Vpk
	7x5V3uREihWllpW8dHptwDFZzqYUQnqflM6YFEsi9fjJOYPO592furNC7D/KBbkNl07v4y7moDdun
	k3YTsodGu4FyhsrEQoEmamuSyDSgmoU7DH7HQd3a7A1pt7SVVvXHyeZI1no+mYmpPuy48w5PFbBvK
	LFQ3Yx3mscrapxCqR18esYBDAZ8Yhu/oGRbEwzf0iP3N1THKyGSK81zWdLX0/oI/aNT68+mhewgv3
	3iLl9283D7vIqe8tGiLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwF30-002G8H-0r;
	Tue, 09 May 2023 04:33:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwF2u-002G72-2H
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 04:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683606832; x=1715142832;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Jfels1Q0mn24g0g8/Fe5uLaA8kVg64immsPwgHfIL7I=;
  b=NzlkrPN1ZZnL/5pm++gKeWt/WDTBqOhKknrsGJBRPItV36isEal8luBZ
   gGcVFgwYxuIINomG54VyP8/3Yub7dLOJEm79slZ22HPlLYrwZpNAup/ks
   VmqbSblf6i2hV3g0TBGWIxTjbyYsfEfEzGGeYDycC0ozkBK8acYDYIZE6
   bxkFXt6+C+iar6EVzbg62poI3vjmK40VDJLd92hCp+SVbsTLXT6OB1yAN
   l4ahpfsWCQessKAbRI2oherrYQiEQ8tJ6X8sqmITGBzDi2EI253aSwD7e
   ZH0d+qe8x1iCGIR6iYFUpgahzk6aueMPh0E2OEXXe3a0juv3UHBUnidGa
   w==;
X-IronPort-AV: E=Sophos;i="5.99,261,1677567600"; 
   d="scan'208";a="214356417"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 May 2023 21:33:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 8 May 2023 21:33:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 8 May 2023 21:33:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBIhp8bVBDLegNfCteYGbYZgg6mWNB0Eg8lgFislwEssJq+86CJgmr9Fojf6CSf5NS5qEWOnS6vqJm2fPHVosSzAtNe55fu7FSUXtUUJU6Q2d2nsGFe432y71nB1UIG5RzMK5QD0XA/j9IGUZsid0ZLGJRwLvadrYxngUyxm0KflW7/GYTILy+BohxXAL8F7zyc5bFwqtBiU4nRmW9PJzqVdDbLR7mvmNpU72njJLrcv+/HGTLm1SqGH2Z4Rq7m5gidgjQTT243COrMlzT0v/7v2wbpuli2v6DmG89gt0Ws6PRBE1rsZ0L2Kirwo9tLgzW/FT7YSEuhUZyEJH4a6RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfels1Q0mn24g0g8/Fe5uLaA8kVg64immsPwgHfIL7I=;
 b=HBbtRhTZrsSYL9DDZkq52DYoocty/v8UYujZWI5dnlZWJkidS+rKOBvLZUQZS1P/l9aydkHIhZiXJ5QKLYB9+7ca3s21sIm+BVNqAtUP1CgAO9nVLO9LuwndMIyfSWCT6raFIwO5qcd4zSCfk8ubhsYjwcVKyndCuDITzifGn6rkbB8Q1Dt4ntQlffHSBpYFPizTgLJJZNpL0KPF71a3D/UGyazrQt1Wgsu1JgsEoEu3nScELKVvWIVoyEY+BITMlkaujcpSZqOWm88vbuUwbZK+FF6/OmrQrSvH3xagM+mxd/UzFRmhAWruDFYAvdBMbyHDpW37Ptg7jf8B+UJvcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfels1Q0mn24g0g8/Fe5uLaA8kVg64immsPwgHfIL7I=;
 b=nw+ZH2Vxy1Y82zoLvNwigz1xyos2gbsue6qpPZwWwTrvkIr2AsOGNKSA1qX0AW2hO8subT/GfgPMtPJg6umAuSBMADVTpbsI9z/LoLXuFdFHv8HGh3k/4+J04v12Ijqvk4AEDtzHUV+fsD1xMQuYw0FSf+M+oZiynQlUlHSXBwg=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Tue, 9 May 2023 04:33:42 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%2]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 04:33:42 +0000
From: <Claudiu.Beznea@microchip.com>
To: <walker.chen@starfivetech.com>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Conor.Dooley@microchip.com>, <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 2/3] ASoC: starfive: Add JH7110 TDM driver
Thread-Topic: [PATCH v3 2/3] ASoC: starfive: Add JH7110 TDM driver
Thread-Index: AQHZgi9u+07uwXSuxEGGyKwTcNekWw==
Date: Tue, 9 May 2023 04:33:42 +0000
Message-ID: <bf12f28f-c458-9279-82a0-a673c075e440@microchip.com>
References: <20230506090116.9206-1-walker.chen@starfivetech.com>
 <20230506090116.9206-3-walker.chen@starfivetech.com>
In-Reply-To: <20230506090116.9206-3-walker.chen@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|DS7PR11MB7781:EE_
x-ms-office365-filtering-correlation-id: 9af90f0d-5e9b-488d-6d51-08db5046918c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HGRU/VfkY3JwGicUxsA1FuAJ4zMaj+HxKUete7J1ht3YA9WsH0PlQil40h6EYwWL7KZHgz+IU9k31xE3FKNrYysDruzSnz0B+wahSvHRTp6yUNM7AmPScs+kRIY7fwPaGJStGPMd3NncciFXG2nlN0cTGpWyvjlS8humnX0oVMb69KUrnRlBCnwYJD1d+98hIvgKu5KkZm1vfFRhh52xWcBTQRT1XyVr/SJOAxa0bpm7CplrYYNWiiHagn8PwoBRS0mkCy+R9yYhltji/GQNZCwPIGEw9LG3M828AK1a84Q8USKF4VKoE+eyHXTsIzyZ6IASLEQ3no9km4pR1LaHv8OMxym3UdKaaTy66KWlhgCt8Zq3ammixmKXmzWGvvQcv3/4fwXGfcYBCazsrIlZAR3QdWOYceInGEvl64olW4B+ssgXZgW9gG1KYqLr9jJUUsbhAqdore1ityTseSOdHGGUlVRrlUWmc2ucZ1CB60laoyzpsoyxUYIqK8CToxjTbpESwgne4VRRDZ7N7p/DBJ2pFCOlwih5vMCSigB0rCErrhfU+gLICO7EqnxpW7Nrh2MdMmclltzaG3RvQzSCgogB1kZDxwGB7qiE3KKMJ3ksH5PSVD6mA9+Is88lCaSeLSMo1hfE9uvljPEe4aPNvkCLsavSX6tSZw9nI1fGCmR5MT8KvxQ1r+BWNUhIUmr8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(122000001)(71200400001)(38100700002)(2616005)(26005)(186003)(53546011)(6512007)(83380400001)(7416002)(2906002)(8676002)(8936002)(6506007)(6486002)(31696002)(478600001)(36756003)(110136005)(54906003)(4326008)(316002)(86362001)(5660300002)(41300700001)(64756008)(66946007)(66476007)(66446008)(91956017)(76116006)(66556008)(38070700005)(31686004)(30864003)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHV4bjkrK0xWUm1YcmlWbHowajlKV0FaVkhZb2ZLL0VHR2tlQWRhZ0E5Y2tW?=
 =?utf-8?B?dzZTeFluK3VHUm9sMko4R3Q2VmFGK1JWN3hTb0dSelcyMC9UMDhaYjRQb3Va?=
 =?utf-8?B?SjVud053TDdxblhBb042cVByUnV4cm1pYi9VZVpDWDdzKytmSXJwNjVuMmRa?=
 =?utf-8?B?VUszWWVkUU9oWHQvN3hoZDFpRlVzcSt5THk0T2N3WVdYQzMwd25taDV4RXo1?=
 =?utf-8?B?VHMwS1lBVWUrcy92eWJDNUZLSEVockNnSjNSOUNrb0tIUVdUZWRKZFVGa013?=
 =?utf-8?B?Nldtdi9YNjl5NG9aUFJVT0RTQTFSVkkzb1hCS2xibGNRZWF2SUsrMHhQWFY0?=
 =?utf-8?B?NVZEdUFzOENUYm00UmFJdmVUMWJZOFg5Nnp2OW1ORWE0S2F2TVhhOWtQc0dB?=
 =?utf-8?B?TWNSb3B5Y1FnQWVUWHFEZFQrbUx3bGhFWTU0TlVlOTZ0KzVBN2xhMmlLYVBi?=
 =?utf-8?B?TVowQjkzNVRQQm11Y1dadXB2MlhyTHVCTUZvT2YrZ0l3TVRacG5LVnNLZDFL?=
 =?utf-8?B?MXZMeEtiNkRLRGJQR3RkQnAwNFp2ZUwxc01ZaFhsQStYMmFEY0VIRjFQWlBT?=
 =?utf-8?B?NlZaMFlZUEpIajg5ZnIxUHNRdEp2d1FmZjlHOEwwNGN1NzhjZ1dtRkhLUHdl?=
 =?utf-8?B?Yml5Q0tTYlBEaTRGVzlkNUl6MDFpUlZDcExsOGlKNWVqRjJkU2JOeXZsb2RP?=
 =?utf-8?B?Vk8yZm52QW9XMXpyVTZtYUE3N3phelgydE1oOHBwNjE4TDREeGR1a25Wa0g0?=
 =?utf-8?B?bzNmL2N6S2R4M1MzT3VGU1M1WXVmQmhvYUxMR1FzdFpXa3ZPTkxaSTNQTFRz?=
 =?utf-8?B?M1Z1UWI0Mi9HQk9oc1B5ck5GWmFlcUQ2bitWRWpYQ0VRaWdaOFNBdVdVY2ZX?=
 =?utf-8?B?eE0wWjZqcVMyZlhvSVVQbll0WHNoVDlzYW1TM0VSYmVENkNrYXl4b2Jhb1hp?=
 =?utf-8?B?V291cERqRTFKT1RUeDRidHdFdUFBR1NHQVRTUWFLTlZoVnhMb1JWbWtNQ21S?=
 =?utf-8?B?Ny9YZzZzWXJ4NFhLQ0o2bm50blNVRXhqcHBVMGtQK1haMjZyZC9oOWpQOUdE?=
 =?utf-8?B?MzlaVWZEdElNL1pXOVVKWUZiRmJEdWZBS2Z2cmp4SzBzS3BCLzd5Skt2T1lY?=
 =?utf-8?B?ak1CWlJVVTR0OFJpU0FHQlVXNXk0VnpIMWc0MU5XM3Izb0NPR3YzSkxNa2xJ?=
 =?utf-8?B?cmRUNTJSNDd2SFBOZVhKZFBlRXM2T3FrQTRIenNsKzh3ZCtlMUFjQjcwRGtW?=
 =?utf-8?B?d0QxMkh2eDNhRHNUVkUwZDZUMDU3YUVJV0VHUHo1RWR5VVp6QUJQMTVwUHZx?=
 =?utf-8?B?UTdMbU9aZG0ybDl0dzJpbXBHaVUvVDY2SjFQU09xU3JXc0U1RERLbUpVV3Vi?=
 =?utf-8?B?ZGIzWXVOemd2VmFkMTJGcFJFMDMzR2ZkUUFJeVdZM1AwaytoeFIyT0xjWUdr?=
 =?utf-8?B?a0l5bVhGY3EyUWVUTGFWNlZEN3hJT2ZCQnY5cmVoL05FQVpRU1NoakRLYzJQ?=
 =?utf-8?B?OWJrbm9HSlF2c28vSlJuYlVBdE5KcXpHWXh3ajJZblJFVlNsT3JZaG1lUTJx?=
 =?utf-8?B?USs3Nm5OMHp2REhEQU9FWW5SUGVublVjRTJqRllmVEY5NnRwNEFGMFMwdXUw?=
 =?utf-8?B?K242dFRHVDlJNEdSRjBTR0dQUmVlL1UyVUxkY3hMQ3U2RmFoOERON0FRSGdQ?=
 =?utf-8?B?VVdtVkkrbDd5TWlXVHpTNnM3cHlmbWxFYnl2cFFHbzZaL3dIbEhzcXFGd21U?=
 =?utf-8?B?K0p4M0M3RTFrWUk5eWVYMldIM01YaDVpMWRJOTFwTVFwZlJycnc3b3FMU2xX?=
 =?utf-8?B?Z1Z6YUxyMnBoRytKSGFpTHdBWXEveEhoUmpkNllpZG1LemtDanl5ank1VXIx?=
 =?utf-8?B?bGpFWjNKR0FqaUQ0c1NoUXl5WjVITzVqaU14REI4c1RFRzRLUFJ0a3dnb1NV?=
 =?utf-8?B?UEpRNzNmd1dDT25Xd1JpR3o3RG50UGxJUjcrL1JkVlc1NjlVdk9OVkNpZnVZ?=
 =?utf-8?B?VklNQ2VZaDFpVEg4cE12VXYwcU1raWJDVUtSbUpkQkR3Tm9TNEt3NnY2dmFy?=
 =?utf-8?B?TkVhL2xsWVFXU2FFVDFBckRLbjZ4UzA2elRCaFBxNVRwRkVXek81OHRXenRU?=
 =?utf-8?B?M0hKYVNUVmpvcWg4MThoVEd3WERsUFJsOW45SXY1NndZaE5hdWRXVjJKUDlt?=
 =?utf-8?B?dkE9PQ==?=
Content-ID: <AD84BBCC274C2846BE314B49675751C2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af90f0d-5e9b-488d-6d51-08db5046918c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 04:33:42.2491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otprFGMpnsiOSB7kK9IsG1g9J5NAmHFCk/lQb8mGrXZf1ba9cvcIefG+DVwB0sEdcJHSSTlyWGeZtvyRLsrhNOqqahPnd/4ojB5prhAdlc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_213353_073240_97D36AAB 
X-CRM114-Status: GOOD (  21.20  )
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

On 06.05.2023 12:01, Walker Chen wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add tdm driver support for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  MAINTAINERS                     |   6 +
>  sound/soc/Kconfig               |   1 +
>  sound/soc/Makefile              |   1 +
>  sound/soc/starfive/Kconfig      |  15 +
>  sound/soc/starfive/Makefile     |   2 +
>  sound/soc/starfive/jh7110_tdm.c | 573 ++++++++++++++++++++++++++++++++
>  sound/soc/starfive/jh7110_tdm.h | 147 ++++++++
>  7 files changed, 745 insertions(+)
>  create mode 100644 sound/soc/starfive/Kconfig
>  create mode 100644 sound/soc/starfive/Makefile
>  create mode 100644 sound/soc/starfive/jh7110_tdm.c
>  create mode 100644 sound/soc/starfive/jh7110_tdm.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f9c544bc189..add89615d327 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19945,6 +19945,12 @@ F:     Documentation/devicetree/bindings/power/starfive*
>  F:     drivers/soc/starfive/jh71xx_pmu.c
>  F:     include/dt-bindings/power/starfive,jh7110-pmu.h
> 
> +STARFIVE JH7110 TDM DRIVERS
> +M:     Walker Chen <walker.chen@starfivetech.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> +F:     sound/soc/starfive/jh7110-tdm.*
> +
>  STARFIVE SOC DRIVERS
>  M:     Conor Dooley <conor@kernel.org>
>  S:     Maintained
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index 848fbae26c3b..8d1d9401ecf2 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -91,6 +91,7 @@ source "sound/soc/sh/Kconfig"
>  source "sound/soc/sof/Kconfig"
>  source "sound/soc/spear/Kconfig"
>  source "sound/soc/sprd/Kconfig"
> +source "sound/soc/starfive/Kconfig"
>  source "sound/soc/sti/Kconfig"
>  source "sound/soc/stm/Kconfig"
>  source "sound/soc/sunxi/Kconfig"
> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
> index 507eaed1d6a1..65aeb4ef4068 100644
> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_SND_SOC) += sh/
>  obj-$(CONFIG_SND_SOC)  += sof/
>  obj-$(CONFIG_SND_SOC)  += spear/
>  obj-$(CONFIG_SND_SOC)  += sprd/
> +obj-$(CONFIG_SND_SOC)  += starfive/
>  obj-$(CONFIG_SND_SOC)  += sti/
>  obj-$(CONFIG_SND_SOC)  += stm/
>  obj-$(CONFIG_SND_SOC)  += sunxi/
> diff --git a/sound/soc/starfive/Kconfig b/sound/soc/starfive/Kconfig
> new file mode 100644
> index 000000000000..737c956f7b93
> --- /dev/null
> +++ b/sound/soc/starfive/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config SND_SOC_STARFIVE
> +       tristate "Audio support for StarFive SoC"
> +       depends on COMPILE_TEST || SOC_STARFIVE
> +       help
> +         Say Y or M if you want to add support for codecs attached to
> +         the Starfive SoCs' Audio interfaces. You will also need to
> +         select the audio interfaces to support below.
> +
> +config SND_SOC_JH7110_TDM
> +       tristate "JH7110 TDM device driver"
> +       depends on HAVE_CLK && SND_SOC_STARFIVE
> +       select SND_SOC_GENERIC_DMAENGINE_PCM
> +       help
> +         Say Y or M if you want to add support for StarFive TDM driver.
> diff --git a/sound/soc/starfive/Makefile b/sound/soc/starfive/Makefile
> new file mode 100644
> index 000000000000..f7d960211d72
> --- /dev/null
> +++ b/sound/soc/starfive/Makefile
> @@ -0,0 +1,2 @@
> +# StarFive Platform Support
> +obj-$(CONFIG_SND_SOC_JH7110_TDM) += jh7110_tdm.o
> diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
> new file mode 100644
> index 000000000000..33f7cf43e4bd
> --- /dev/null
> +++ b/sound/soc/starfive/jh7110_tdm.c
> @@ -0,0 +1,573 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * jh7110_tdm.c -- StarFive JH7110 TDM driver
> + *
> + * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
> + *
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/initval.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include "jh7110_tdm.h"
> +
> +static inline u32 jh7110_tdm_readl(struct jh7110_tdm_dev *tdm, u16 reg)
> +{
> +       return readl_relaxed(tdm->tdm_base + reg);
> +}
> +
> +static inline void jh7110_tdm_writel(struct jh7110_tdm_dev *tdm, u16 reg, u32 val)
> +{
> +       writel_relaxed(val, tdm->tdm_base + reg);
> +}
> +
> +static void jh7110_tdm_save_context(struct jh7110_tdm_dev *tdm,
> +                                   struct snd_pcm_substream *substream)
> +{
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               tdm->saved_pcmtxcr = jh7110_tdm_readl(tdm, TDM_PCMTXCR);
> +       else
> +               tdm->saved_pcmrxcr = jh7110_tdm_readl(tdm, TDM_PCMRXCR);
> +}
> +
> +static void jh7110_tdm_start(struct jh7110_tdm_dev *tdm,
> +                            struct snd_pcm_substream *substream)
> +{
> +       u32 data;
> +
> +       data = jh7110_tdm_readl(tdm, TDM_PCMGBCR);
> +       jh7110_tdm_writel(tdm, TDM_PCMGBCR, data | PCMGBCR_ENABLE);
> +
> +       /* restore context */
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               jh7110_tdm_writel(tdm, TDM_PCMTXCR, tdm->saved_pcmtxcr | PCMTXCR_TXEN);
> +       else
> +               jh7110_tdm_writel(tdm, TDM_PCMRXCR, tdm->saved_pcmrxcr | PCMRXCR_RXEN);
> +}
> +
> +static void jh7110_tdm_stop(struct jh7110_tdm_dev *tdm,
> +                           struct snd_pcm_substream *substream)
> +{
> +       unsigned int val;
> +
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +               val = jh7110_tdm_readl(tdm, TDM_PCMTXCR);
> +               val &= ~PCMTXCR_TXEN;
> +               jh7110_tdm_writel(tdm, TDM_PCMTXCR, val);
> +       } else {
> +               val = jh7110_tdm_readl(tdm, TDM_PCMRXCR);
> +               val &= ~PCMRXCR_RXEN;
> +               jh7110_tdm_writel(tdm, TDM_PCMRXCR, val);
> +       }
> +}
> +
> +static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
> +{
> +       u32 sl, sscale, syncdiv;
> +
> +       if (tdm->rx.sl >= tdm->tx.sl)
> +               sl = tdm->rx.sl;
> +       else
> +               sl = tdm->tx.sl;
> +
> +       if (tdm->rx.sscale >= tdm->tx.sscale)
> +               sscale = tdm->rx.sscale;
> +       else
> +               sscale = tdm->tx.sscale;
> +
> +       syncdiv = tdm->pcmclk / tdm->samplerate - 1;
> +
> +       if ((syncdiv + 1) < (sl * sscale)) {
> +               dev_err(tdm->dev, "Failed to set syncdiv!\n");
> +               return -EINVAL;
> +       }
> +
> +       if (tdm->syncm == TDM_SYNCM_LONG &&
> +           (tdm->rx.sscale <= 1 || tdm->tx.sscale <= 1)) {
> +               if ((syncdiv + 1) <= sl) {
> +                       dev_err(tdm->dev, "Wrong syncdiv! It must be (syncdiv+1) > max[tx.sl, rx.sl]\n");
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       jh7110_tdm_writel(tdm, TDM_PCMDIV, syncdiv);
> +       return 0;
> +}
> +
> +static int jh7110_tdm_config(struct jh7110_tdm_dev *tdm,
> +                            struct snd_pcm_substream *substream)
> +{
> +       u32 datarx, datatx;
> +       int ret;
> +
> +       ret = jh7110_tdm_syncdiv(tdm);
> +       if (ret)
> +               return ret;
> +
> +       datarx = (tdm->rx.ifl << IFL_BIT) |
> +                 (tdm->rx.wl << WL_BIT) |
> +                 (tdm->rx.sscale << SSCALE_BIT) |
> +                 (tdm->rx.sl << SL_BIT) |
> +                 (tdm->rx.lrj << LRJ_BIT);
> +
> +       datatx = (tdm->tx.ifl << IFL_BIT) |
> +                 (tdm->tx.wl << WL_BIT) |
> +                 (tdm->tx.sscale << SSCALE_BIT) |
> +                 (tdm->tx.sl << SL_BIT) |
> +                 (tdm->tx.lrj << LRJ_BIT);
> +
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               jh7110_tdm_writel(tdm, TDM_PCMTXCR, datatx);
> +       else
> +               jh7110_tdm_writel(tdm, TDM_PCMRXCR, datarx);
> +
> +       return 0;
> +}
> +
> +static void jh7110_tdm_clk_disable(struct jh7110_tdm_dev *tdm)
> +{
> +       int i;
> +
> +       for (i = tdm->num_clks - 1; i >= 0; i--)
> +               clk_disable_unprepare(tdm->clks[i]);
> +}

This could be replaced by clk_bulk_disable_unprepare().

> +
> +static int jh7110_tdm_clk_enable(struct jh7110_tdm_dev *tdm)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < tdm->num_clks; i++) {
> +               ret = clk_prepare_enable(tdm->clks[i]);
> +               if (ret) {
> +                       while (i-- > 0)
> +                               clk_disable_unprepare(tdm->clks[i]);
> +                       return ret;
> +               }
> +       }


And this could be replaced by clk_bulk_prepare_enable().

> +
> +       ret = reset_control_deassert(tdm->resets);
> +       if (ret) {
> +               dev_err(tdm->dev, "Failed to deassert tdm resets\n");
> +               goto dis_tdm_clk;
> +       }
> +
> +       /* select tdm_ext clock as the clock source for tdm */
> +       ret = clk_set_parent(tdm->clks[5], tdm->clks[4]);
> +       if (ret) {
> +               dev_err(tdm->dev, "Can't set clock source for clk_tdm: %d\n", ret);
> +               goto dis_tdm_clk;
> +       }
> +       return 0;
> +
> +dis_tdm_clk:
> +       for (i = tdm->num_clks - 1; i >= 0; i--)
> +               clk_disable_unprepare(tdm->clks[i]);

clk_bulk_disable_unprepare()

> +
> +       return ret;
> +}
> +
> +#ifdef CONFIG_PM
> +static int jh7110_tdm_runtime_suspend(struct device *dev)
> +{
> +       struct jh7110_tdm_dev *tdm = dev_get_drvdata(dev);
> +
> +       jh7110_tdm_clk_disable(tdm);
> +       return 0;
> +}
> +
> +static int jh7110_tdm_runtime_resume(struct device *dev)
> +{
> +       struct jh7110_tdm_dev *tdm = dev_get_drvdata(dev);
> +
> +       return jh7110_tdm_clk_enable(tdm);
> +}
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int jh7110_tdm_suspend(struct snd_soc_component *component)
> +{
> +       /* save context */
> +       tdm->saved_pcmgbcr = jh7110_tdm_readl(tdm, TDM_PCMGBCR);
> +       tdm->saved_pcmdiv = jh7110_tdm_readl(tdm, TDM_PCMDIV);
> +
> +       return pm_runtime_force_suspend(component->dev);
> +}
> +
> +static int jh7110_tdm_resume(struct snd_soc_component *component)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_component_get_drvdata(component);
> +
> +       /* restore context */
> +       jh7110_tdm_writel(tdm, TDM_PCMGBCR, tdm->saved_pcmgbcr);
> +       jh7110_tdm_writel(tdm, TDM_PCMDIV, tdm->saved_pcmdiv);
> +
> +       return pm_runtime_force_resume(component->dev);
> +}
> +
> +#else
> +#define jh7110_tdm_suspend     NULL
> +#define jh7110_tdm_resume      NULL
> +#endif

you may use pm_sleep_ptr() to avoid these.

> +
> +static const struct snd_soc_component_driver jh7110_tdm_component = {
> +       .name = "jh7110-tdm",
> +       .suspend = jh7110_tdm_suspend,
> +       .resume = jh7110_tdm_resume,
> +};
> +
> +static int jh7110_tdm_startup(struct snd_pcm_substream *substream,
> +                             struct snd_soc_dai *cpu_dai)
> +{
> +       struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +       struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +
> +       dai_link->stop_dma_first = 1;
> +
> +       return 0;
> +}
> +
> +static int jh7110_tdm_hw_params(struct snd_pcm_substream *substream,
> +                               struct snd_pcm_hw_params *params,
> +                               struct snd_soc_dai *dai)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
> +       int chan_wl, chan_sl, chan_nr;
> +       unsigned int data_width;
> +       unsigned int dma_bus_width;
> +       struct snd_dmaengine_dai_dma_data *dma_data = NULL;
> +       int ret = 0;
> +
> +       data_width = params_width(params);
> +
> +       tdm->samplerate = params_rate(params);
> +       tdm->pcmclk = params_channels(params) * tdm->samplerate * data_width;
> +
> +       switch (params_format(params)) {
> +       case SNDRV_PCM_FORMAT_S16_LE:
> +               chan_wl = TDM_16BIT_WORD_LEN;
> +               chan_sl = TDM_16BIT_SLOT_LEN;
> +               dma_bus_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +               break;
> +
> +       case SNDRV_PCM_FORMAT_S32_LE:
> +               chan_wl = TDM_32BIT_WORD_LEN;
> +               chan_sl = TDM_32BIT_SLOT_LEN;
> +               dma_bus_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +               break;
> +
> +       default:
> +               dev_err(tdm->dev, "tdm: unsupported PCM fmt");
> +               return -EINVAL;
> +       }
> +
> +       chan_nr = params_channels(params);
> +       switch (chan_nr) {
> +       case 1:
> +       case 2:
> +       case 4:
> +       case 6:
> +       case 8:
> +               break;
> +       default:
> +               dev_err(tdm->dev, "channel not supported\n");
> +               return -EINVAL;
> +       }
> +
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +               tdm->tx.wl = chan_wl;
> +               tdm->tx.sl = chan_sl;
> +               tdm->tx.sscale = chan_nr;
> +               tdm->play_dma_data.addr_width = dma_bus_width;
> +               dma_data = &tdm->play_dma_data;
> +       } else {
> +               tdm->rx.wl = chan_wl;
> +               tdm->rx.sl = chan_sl;
> +               tdm->rx.sscale = chan_nr;
> +               tdm->capture_dma_data.addr_width = dma_bus_width;
> +               dma_data = &tdm->capture_dma_data;
> +       }
> +
> +       snd_soc_dai_set_dma_data(dai, substream, dma_data);
> +
> +       ret = jh7110_tdm_config(tdm, substream);
> +       if (ret)
> +               return ret;
> +
> +       jh7110_tdm_save_context(tdm, substream);
> +       return 0;
> +}
> +
> +static int jh7110_tdm_trigger(struct snd_pcm_substream *substream,
> +                             int cmd, struct snd_soc_dai *dai)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
> +       int ret = 0;
> +
> +       switch (cmd) {
> +       case SNDRV_PCM_TRIGGER_START:
> +       case SNDRV_PCM_TRIGGER_RESUME:
> +       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               jh7110_tdm_start(tdm, substream);
> +               break;
> +
> +       case SNDRV_PCM_TRIGGER_STOP:
> +       case SNDRV_PCM_TRIGGER_SUSPEND:
> +       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +               jh7110_tdm_stop(tdm, substream);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +       return ret;
> +}
> +
> +static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
> +                                 unsigned int fmt)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(cpu_dai);
> +       unsigned int gbcr;
> +       int ret = 0;
> +
> +       /* set master/slave audio interface */
> +       switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +       case SND_SOC_DAIFMT_BP_FP:
> +               /* cpu is master */
> +               tdm->ms_mode = TDM_AS_MASTER;
> +               break;
> +       case SND_SOC_DAIFMT_BC_FC:
> +               /* codec is master */
> +               tdm->ms_mode = TDM_AS_SLAVE;
> +               break;
> +       case SND_SOC_DAIFMT_BC_FP:
> +       case SND_SOC_DAIFMT_BP_FC:
> +               ret = -EINVAL;
> +               break;
> +       default:
> +               dev_dbg(tdm->dev, "dwc : Invalid clock provider format\n");
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       gbcr = (tdm->clkpolity << CLKPOL_BIT) |
> +               (tdm->elm << ELM_BIT) |
> +               (tdm->syncm << SYNCM_BIT) |
> +               (tdm->ms_mode << MS_BIT);
> +       jh7110_tdm_writel(tdm, TDM_PCMGBCR, gbcr);
> +
> +       return ret;
> +}
> +
> +static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
> +       .startup        = jh7110_tdm_startup,
> +       .hw_params      = jh7110_tdm_hw_params,
> +       .trigger        = jh7110_tdm_trigger,
> +       .set_fmt        = jh7110_tdm_set_dai_fmt,
> +};
> +
> +static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
> +
> +       snd_soc_dai_init_dma_data(dai, &tdm->play_dma_data, &tdm->capture_dma_data);
> +       snd_soc_dai_set_drvdata(dai, tdm);
> +       return 0;
> +}
> +
> +#define JH7110_TDM_RATES       SNDRV_PCM_RATE_8000_48000
> +
> +#define JH7110_TDM_FORMATS     (SNDRV_PCM_FMTBIT_S16_LE | \
> +                                SNDRV_PCM_FMTBIT_S32_LE)
> +
> +static struct snd_soc_dai_driver jh7110_tdm_dai = {
> +       .name = "sf_tdm",
> +       .id = 0,
> +       .playback = {
> +               .stream_name    = "Playback",
> +               .channels_min   = 1,
> +               .channels_max   = 8,
> +               .rates          = JH7110_TDM_RATES,
> +               .formats        = JH7110_TDM_FORMATS,
> +       },
> +       .capture = {
> +               .stream_name    = "Capture",
> +               .channels_min   = 1,
> +               .channels_max   = 8,
> +               .rates          = JH7110_TDM_RATES,
> +               .formats        = JH7110_TDM_FORMATS,
> +       },
> +       .ops = &jh7110_tdm_dai_ops,
> +       .probe = jh7110_tdm_dai_probe,
> +       .symmetric_rate = 1,
> +};
> +
> +static const struct snd_pcm_hardware jh7110_pcm_hardware = {
> +       .info                   = (SNDRV_PCM_INFO_MMAP          |
> +                                  SNDRV_PCM_INFO_MMAP_VALID    |
> +                                  SNDRV_PCM_INFO_PAUSE         |
> +                                  SNDRV_PCM_INFO_RESUME        |
> +                                  SNDRV_PCM_INFO_INTERLEAVED   |
> +                                  SNDRV_PCM_INFO_BLOCK_TRANSFER),
> +       .buffer_bytes_max       = 192512,
> +       .period_bytes_min       = 4096,
> +       .period_bytes_max       = 32768,
> +       .periods_min            = 1,
> +       .periods_max            = 48,
> +       .fifo_size              = 16,
> +};
> +
> +static const struct snd_dmaengine_pcm_config jh7110_dmaengine_pcm_config = {
> +       .pcm_hardware = &jh7110_pcm_hardware,
> +       .prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
> +       .prealloc_buffer_size = 192512,
> +};
> +
> +static void jh7110_tdm_init_params(struct jh7110_tdm_dev *tdm)
> +{
> +       tdm->clkpolity = TDM_TX_RASING_RX_FALLING;
> +       tdm->elm = TDM_ELM_LATE;
> +       tdm->syncm = TDM_SYNCM_SHORT;
> +
> +       tdm->rx.ifl = TDM_FIFO_HALF;
> +       tdm->tx.ifl = TDM_FIFO_HALF;
> +       tdm->rx.wl = TDM_16BIT_WORD_LEN;
> +       tdm->tx.wl = TDM_16BIT_WORD_LEN;
> +       tdm->rx.sscale = 2;
> +       tdm->tx.sscale = 2;
> +       tdm->rx.lrj = TDM_LEFT_JUSTIFT;
> +       tdm->tx.lrj = TDM_LEFT_JUSTIFT;
> +
> +       tdm->play_dma_data.addr = JH7110_TDM_FIFO;
> +       tdm->play_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +       tdm->play_dma_data.fifo_size = JH7110_TDM_FIFO_DEPTH / 2;
> +       tdm->play_dma_data.maxburst = 16;
> +
> +       tdm->capture_dma_data.addr = JH7110_TDM_FIFO;
> +       tdm->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +       tdm->capture_dma_data.fifo_size = JH7110_TDM_FIFO_DEPTH / 2;
> +       tdm->capture_dma_data.maxburst = 8;
> +}
> +
> +static int jh7110_tdm_clk_reset_init(struct platform_device *pdev,
> +                                    struct jh7110_tdm_dev *tdm)
> +{
> +       int i, ret;
> +
> +       for (i = 0; i < tdm->num_clks; i++) {
> +               tdm->clks[i] = devm_clk_get(&pdev->dev, tdm->clk_names[i]);
> +               if (IS_ERR(tdm->clks[i])) {
> +                       dev_err(&pdev->dev, "Failed to get clock: %s\n",
> +                               tdm->clk_names[i]);
> +                       return PTR_ERR(tdm->clks[i]);
> +               }
> +       }

devm_clk_bulk_get() ?

> +
> +       tdm->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
> +       if (IS_ERR(tdm->resets)) {
> +               ret = PTR_ERR(tdm->resets);
> +               dev_err(&pdev->dev, "Failed to get tdm resets");
> +               return ret;
> +       }
> +
> +       return jh7110_tdm_clk_enable(tdm);
> +}
> +
> +static int jh7110_tdm_probe(struct platform_device *pdev)
> +{
> +       struct jh7110_tdm_dev *tdm;
> +       const struct starfive_tdm_driverdata *driver_data;
> +       int ret;
> +
> +       tdm = devm_kzalloc(&pdev->dev, sizeof(*tdm), GFP_KERNEL);
> +       if (!tdm)
> +               return -ENOMEM;
> +
> +       driver_data = of_device_get_match_data(&pdev->dev);
> +       tdm->clk_names = (const char **)driver_data->clk_names;
> +       tdm->num_clks = driver_data->num_clks;
> +
> +       tdm->tdm_base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(tdm->tdm_base))
> +               return PTR_ERR(tdm->tdm_base);
> +
> +       tdm->dev = &pdev->dev;
> +
> +       ret = jh7110_tdm_clk_reset_init(pdev, tdm);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to enable audio-tdm clock\n");
> +               return ret;
> +       }
> +
> +       jh7110_tdm_init_params(tdm);
> +
> +       dev_set_drvdata(&pdev->dev, tdm);
> +       ret = devm_snd_soc_register_component(&pdev->dev, &jh7110_tdm_component,
> +                                             &jh7110_tdm_dai, 1);
> +       if (ret != 0) {

if (ret)

> +               dev_err(&pdev->dev, "Failed to register dai\n");
> +               return ret;
> +       }
> +
> +       ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
> +                                             &jh7110_dmaengine_pcm_config,
> +                                             SND_DMAENGINE_PCM_FLAG_COMPAT);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Could not register pcm: %d\n", ret);
> +               return ret;
> +       }
> +
> +       pm_runtime_enable(&pdev->dev);
> +#ifdef CONFIG_PM
> +       jh7110_tdm_clk_disable(tdm);
> +#endif
> +
> +       return 0;
> +}
> +
> +static int jh7110_tdm_dev_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_disable(&pdev->dev);
> +       return 0;
> +}
> +
> +static const struct starfive_tdm_driverdata jh7110_drvdata = {
> +       .clk_names = {"mclk_inner", "tdm_ahb", "tdm_apb", "tdm_internal", "tdm_ext", "tdm"},
> +       .num_clks = 6,
> +};
> +
> +static const struct of_device_id jh7110_tdm_of_match[] = {
> +       { .compatible = "starfive,jh7110-tdm", .data = &jh7110_drvdata },
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, jh7110_tdm_of_match);
> +
> +static const struct dev_pm_ops jh7110_tdm_pm_ops = {
> +       SET_RUNTIME_PM_OPS(jh7110_tdm_runtime_suspend,
> +                          jh7110_tdm_runtime_resume, NULL)

You can use RUNTIME_PM_OPS() and avoid having #ifdef CONFIG_PM around
jh7110_tdm_runtime_suspend and jh7110_tdm_runtime_resume definitions.

> +};
> +
> +static struct platform_driver jh7110_tdm_driver = {
> +       .driver = {
> +               .name = "jh7110-tdm",
> +               .of_match_table = jh7110_tdm_of_match,
> +               .pm = &jh7110_tdm_pm_ops,
> +       },
> +       .probe = jh7110_tdm_probe,
> +       .remove = jh7110_tdm_dev_remove,
> +};
> +module_platform_driver(jh7110_tdm_driver);
> +
> +MODULE_DESCRIPTION("StarFive JH7110 TDM ASoC Driver");
> +MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/starfive/jh7110_tdm.h b/sound/soc/starfive/jh7110_tdm.h
> new file mode 100644
> index 000000000000..80f17946a45d
> --- /dev/null
> +++ b/sound/soc/starfive/jh7110_tdm.h
> @@ -0,0 +1,147 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * TDM driver for the StarFive JH7110 SoC
> + *
> + * Copyright (C) 2022-2023 StarFive Technology Co., Ltd.
> + *
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +
> +#ifndef __SND_SOC_STARFIVE_TDM_H
> +#define __SND_SOC_STARFIVE_TDM_H
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm.h>
> +#include <linux/dmaengine.h>
> +#include <linux/types.h>
> +
> +#define TDM_PCMGBCR                    0x00
> +       #define PCMGBCR_MASK            0x1e
> +       #define PCMGBCR_ENABLE          BIT(0)
> +       #define PCMGBCR_TRITXEN         BIT(4)
> +       #define CLKPOL_BIT              5
> +       #define TRITXEN_BIT             4
> +       #define ELM_BIT                 3
> +       #define SYNCM_BIT               2
> +       #define MS_BIT                  1
> +#define TDM_PCMTXCR                    0x04
> +       #define PCMTXCR_TXEN            BIT(0)
> +       #define IFL_BIT                 11
> +       #define WL_BIT                  8
> +       #define SSCALE_BIT              4
> +       #define SL_BIT                  2
> +       #define LRJ_BIT                 1
> +#define TDM_PCMRXCR                    0x08
> +       #define PCMRXCR_RXEN            BIT(0)
> +       #define PCMRXCR_RXSL_MASK       0xc
> +       #define PCMRXCR_RXSL_16BIT      0x4
> +       #define PCMRXCR_RXSL_32BIT      0x8
> +       #define PCMRXCR_SCALE_MASK      0xf0
> +       #define PCMRXCR_SCALE_1CH       0x10
> +#define TDM_PCMDIV                     0x0c
> +
> +/*  DMA registers */
> +#define JH7110_TDM_FIFO                        0x170c0000
> +#define JH7110_TDM_FIFO_DEPTH          32
> +#define JH7110_TDM_MAX_CLOCKS          6
> +
> +enum TDM_MASTER_SLAVE_MODE {
> +       TDM_AS_MASTER = 0,
> +       TDM_AS_SLAVE,
> +};
> +
> +enum TDM_CLKPOL {
> +       /* tx raising and rx falling */
> +       TDM_TX_RASING_RX_FALLING = 0,
> +       /* tx falling and rx raising */
> +       TDM_TX_FALLING_RX_RASING,
> +};
> +
> +enum TDM_ELM {
> +       /* only work while SYNCM=0 */
> +       TDM_ELM_LATE = 0,
> +       TDM_ELM_EARLY,
> +};
> +
> +enum TDM_SYNCM {
> +       /* short frame sync */
> +       TDM_SYNCM_SHORT = 0,
> +       /* long frame sync */
> +       TDM_SYNCM_LONG,
> +};
> +
> +enum TDM_IFL {
> +       /* FIFO to send or received : half-1/2, Quarter-1/4 */
> +       TDM_FIFO_HALF = 0,
> +       TDM_FIFO_QUARTER,
> +};
> +
> +enum TDM_WL {
> +       /* send or received word length */
> +       TDM_8BIT_WORD_LEN = 0,
> +       TDM_16BIT_WORD_LEN,
> +       TDM_20BIT_WORD_LEN,
> +       TDM_24BIT_WORD_LEN,
> +       TDM_32BIT_WORD_LEN,
> +};
> +
> +enum TDM_SL {
> +       /* send or received slot length */
> +       TDM_8BIT_SLOT_LEN = 0,
> +       TDM_16BIT_SLOT_LEN,
> +       TDM_32BIT_SLOT_LEN,
> +};
> +
> +enum TDM_LRJ {
> +       /* left-justify or right-justify */
> +       TDM_RIGHT_JUSTIFY = 0,
> +       TDM_LEFT_JUSTIFT,
> +};
> +
> +struct tdm_chan_cfg {
> +       enum TDM_IFL ifl;
> +       enum TDM_WL  wl;
> +       unsigned char sscale;
> +       enum TDM_SL  sl;
> +       enum TDM_LRJ lrj;
> +       unsigned char enable;
> +};
> +
> +struct starfive_tdm_driverdata {
> +       const char *clk_names[JH7110_TDM_MAX_CLOCKS];
> +       int num_clks;
> +};
> +
> +struct jh7110_tdm_dev {
> +       void __iomem *tdm_base;
> +       struct device *dev;
> +       const char **clk_names;
> +       struct clk *clks[JH7110_TDM_MAX_CLOCKS];
> +       int num_clks;
> +       struct reset_control *resets;
> +
> +       enum TDM_CLKPOL clkpolity;
> +       enum TDM_ELM    elm;
> +       enum TDM_SYNCM  syncm;
> +       enum TDM_MASTER_SLAVE_MODE ms_mode;
> +
> +       struct tdm_chan_cfg tx;
> +       struct tdm_chan_cfg rx;
> +
> +       u16 syncdiv;
> +       u32 samplerate;
> +       u32 pcmclk;
> +
> +       /* data related to DMA transfers b/w tdm and DMAC */
> +       struct snd_dmaengine_dai_dma_data play_dma_data;
> +       struct snd_dmaengine_dai_dma_data capture_dma_data;
> +       u32 saved_pcmgbcr;
> +       u32 saved_pcmtxcr;
> +       u32 saved_pcmrxcr;
> +       u32 saved_pcmdiv;
> +};
> +
> +#endif /* __SND_SOC_STARFIVE_TDM_H */
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
