Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D366ECAAA4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 17:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXNG+idjuN0bh+1dKligLqttodKfLODwerjbWVVVpYU=; b=GqJhHhMaBOW8zk
	lUc7qhnEYubq/XD7/GKCcbv8PURfy/z+ajSN+UoH1lB5KbnWVXnGy0zgd1tkPDEXPAxOFvYUaI6tG
	kK5tCGYj9Mg+8wFiMHH4Ek0JkNlfT+3l1lZP0QbOIcS3/ehj8Tvb96nc3xrEYkNcUrFbHIww1+qQ2
	Y+5ycH/5zeHp2i9eISaKw5PgAlzwy8CJ1YeSENAu+BTXov5ybJZoW3ktYVrTuUrsMX2ZdB/tI1UPh
	frxzK72JJvcK0panXAlbA/UY2jqa4o/ekE/jsCziVc3hS1pDC1X+jgnnka5CftSVUNeEJovjRG7eK
	yDquNlVO+pt00sFXJhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSil8-00C4Ze-5z; Mon, 29 Aug 2022 17:41:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSil3-00C4Wy-V5
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 17:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661794870; x=1693330870;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=f0SDPFqsC9wYb71TLxAti8ltotPUal3ldLFeX5nzz1g=;
  b=wYvq9+TT8uyIJTLeH02WEG8soTeAIdgVB6dMDSNWxIbk5HO6pznioodj
   vON8xVByE6e2e+TXwx0sKRo51MvI6qJoeyrXx7R/66ztfv8UA2umZCBQX
   VNLCvPIAl2LFQqNbDqD3bqbr9JPW3A/pAw5LDbl6J8BGGh4bMR4DrsCcr
   gjiB8lnhGUDv8xK19Cmu9i6ynuLzsvOSxLvk3RM8cUjHg1FeJkmsANzMZ
   u1Quddff5SI2daPcr7tmB9fXF3NuC5WiZOc5+ItN8TdMy+eA2CbUOMJSp
   6/SE26xaLU2e6WTSfMyQgrad7PyOtvJLVl6FOlkrJaDxTXXWiRrxw5Rli
   A==;
X-IronPort-AV: E=Sophos;i="5.93,273,1654585200"; 
   d="scan'208";a="178182391"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 10:41:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 10:41:04 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 29 Aug 2022 10:41:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sqxh2dZBgHyUgEtfXqbtuUxqTMWDxbZnVUHvM6qYo0hgz9zjeXAanAqVWkbGTy/QhfCgoeH5brcNrm87Vc+cLDa86WO8akW1Bb4Z/MHM0MQ3tbAcPf6x+9PK3kNyWxp0OT3XeCTJFcgLTsGamK+NSJG+ZP/cwa6dmQ/yl1Dn6128Nak2qShJ41lxTkki7oThooTbe9q9R2tMR3rE4Gj+QSuQDXUFQICvYBceI+l5GgQUje8g4KAC0Pd5oH2G/cStxLUGRkPj5XNXNURRpiKMFHjrc5qtQ9aGg4mqJ9L3jloL7pyzdxGZHA0G+b1rEY75k32rC8jJv41EzH9dFvw2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0SDPFqsC9wYb71TLxAti8ltotPUal3ldLFeX5nzz1g=;
 b=fTf0E44khhNwmW8v+xObMJS4Vq4z0hH8ZeL8iFeo/C84oRTNQ7KIzaNnBar1Zzf4olt5KJRj2HEP6DwQX+x+H6ne8Z/O2OmGRT7hedDWrZIn1gJtm4ErNLygwD4vVjxVZL8WSvVgItzDgFauUmyiSRV0fqP+k8Ic27h+Y7c3+AL5k/t6vCxKH6eeZLYNjXzQ+zzqpcZe5Sx4kYUaJ1tugZKhoS+rM14SZW3xIhpPU/J8jyknmWg7vClFPuOclQviz2yENz6HQs5JvdwZlCD96S9DUVAeU/YJTGBrd+pGJqS+Ofily3UsUGpkx6iNjQKAVNR1RGR8O1NfN3lIDuxkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0SDPFqsC9wYb71TLxAti8ltotPUal3ldLFeX5nzz1g=;
 b=J6vNjwARDehbG2xIseiO2HsRBOt02eiPniw5acUdP7Tinb+Vcdi5upD3gOzC+SkK0qzS7MGlbyRkiq0trj3ImuHEzbVGd+7DxOy2AV9oQbYmg46vTQCz8+c8ujwhdrpjzMTkchrci2o+RJa+RfzXsmvIQSDFvHaYFUHSx809XVU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW5PR11MB5908.namprd11.prod.outlook.com (2603:10b6:303:194::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Mon, 29 Aug
 2022 17:40:59 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 17:40:59 +0000
From: <Conor.Dooley@microchip.com>
To: <apatel@ventanamicro.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>
CC: <atishp@atishpatra.org>, <heiko@sntech.de>, <anup@brainfault.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] Add PMEM support for RISC-V
Thread-Topic: [PATCH 0/4] Add PMEM support for RISC-V
Thread-Index: AQHYu6ZO+JUY+heYt0OoC/OUwNufja3GJbOA
Date: Mon, 29 Aug 2022 17:40:59 +0000
Message-ID: <f4b2daab-72f6-ab5a-5743-b41bd5e2c920@microchip.com>
References: <20220829125226.511564-1-apatel@ventanamicro.com>
In-Reply-To: <20220829125226.511564-1-apatel@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d294834-ba29-4f88-1f06-08da89e5a2c0
x-ms-traffictypediagnostic: MW5PR11MB5908:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vmI+KbDGOv9uhlEGuMk3Ng3tJj83PX0On/Wx+fkG2Jw7Mza7P4ub6W3A5DBiOeI2AeWil4t01wc9n4hvBACxtXL9qMaciqdLx3/cs94/X9qx7QGB7/P5QM3Fn8CABIlRpfcIHi1etrTZXH0U6oAvgA+/a59nugY1vVwyRvlN3aDZmS8mOdCWcMPBfJ44jq7wt5Ipj/pP6PGlpffz0DYAMvmGRNPtr1PR8YeTkNXjoBUL4QS2I7rHCblQNK/7lpHouEFRNfzW7SzVFuIHiJxBmeEmYJ2dH4KbwIMdi5k1Ctmh+/YDRFF25v/inYFKaxHA0+dj2FFAe2iG1oXdpki43B/JhZwrINSLGckX9XEAQQhuuUX0uYEfSjZCkU4PTExQxYh5mYQ7UHpQMPyOYXf2avQo+MceablXpetayzlGDnYzrmHF3DOkd1w3lNQVVFF4dCiq+wsBHmykheZx+ZmobmpH3SdMX5KZSr6xb2Ft5sHDeFebeoa8ofuYc4nYDTGCks8WzzE1A/mBhui6ucid0G+i/i3DA41gj2GpQrxBRM3MW5dvskJHzlJNTwMu5EfRz+wWcARuBgn8UrZRxXFn5pI1GlrZbYYV6Abd+8fxP5FPSdf24rwJQVYP44lpGKBJaeg7Mryv4TU8AEPwZoQV4762sSfkaU0+CMT5d+JQaRvXJgcqx9LYqSv4gplTye6sNikHJVPwZxeXASLxGr6ly4x+v8qzMYTGdyYXjTEYMWT0deSrpchic9KF1LK/fcxM+DnGgdVdyCI0ac+5B7JJoqeECTJ4kVulYJHlno9NljKeS4rI1KVh3AjD9tDhtxSrUOjUl4UjkbZ6lPHi5/i+prEujw3eBVsjH7ByIEhYYjMTNT1eLYJPkPCe1QYxONdjX5FoY457b4NVGOpRWTeBgA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(396003)(39860400002)(64756008)(2616005)(41300700001)(8676002)(83380400001)(31696002)(38100700002)(38070700005)(122000001)(66556008)(31686004)(86362001)(66446008)(76116006)(66946007)(91956017)(186003)(66476007)(6506007)(316002)(36756003)(2906002)(5660300002)(8936002)(6486002)(966005)(6512007)(110136005)(478600001)(53546011)(71200400001)(26005)(4326008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDNjQ3pES3dIVG5XdTBhMlFEM0pvL1owUTBNM1dLSy9ma29zNFU4d1c0Qk9n?=
 =?utf-8?B?SU5VbVpGRkpib0swRDU5ZVo1dmF0eHk2V0dCN3VjNnFkb0MzRWF4ajBaK1ZI?=
 =?utf-8?B?c1FvamsxUmtBVVdnWnlINmZFaGRmSFAzWjkrdHVhTDJ6ZFh0b2FmdDVGWEdv?=
 =?utf-8?B?SlRZdDNOYkx0YWd0b3YrK2tMZFZKNXd2S0Zhcko1dy9XNmx2MkhiRHNCOHlo?=
 =?utf-8?B?OEsyZ1I2SWZOK283bEhka0t3dUZCMndmRGlCVklBV0I3SXNMTldmd0lXQXI2?=
 =?utf-8?B?V3JlZVNwcC9scHdRRUlZRklGbHMxWmg2R3hlaUdab1h5aGFGYzNSTFN6aHpQ?=
 =?utf-8?B?WHRZRHlGNU4zem1nV1FqWTdKeUZNYWx1TlZmNFpsR0dRRWw3UXd0NDBKU1Ez?=
 =?utf-8?B?SlF2a0l4V0FVd2xwQ2NLRGlpcVZGMGw2bmJZUVZXUU16TENHWmJxY3RsYVV2?=
 =?utf-8?B?NEt1OTdmZ09aWTEwSzc5UHo5VHE3cm1GSzEzQzVYa2dMcnppR1dkMmMweHdB?=
 =?utf-8?B?WkRtYms2YVdKdGorMzBPRkRJSE92elRqNDRqMG9jb3NhMC9WSzhBS0dQU3Jo?=
 =?utf-8?B?MWNhcFovcXgvMVFXR0E3b0J3dlJralRXY0JjSVpmWGVzdkRnUnFRRWtXU2JB?=
 =?utf-8?B?VEVOZUt0dVY5N0h0WE14SlZlUW8xdTlOMUZOV2FwMmRNTThRcmNpM3F3cWtt?=
 =?utf-8?B?TzRmSlFWQWtlZmVTeGMydHN5ejVDV3c3aWJRaUovMWhTZk1aemRhR3ZKWUFB?=
 =?utf-8?B?dXdZZEFxUk9CcnExWCs5blUxb2VTYTliTnpoajBGMzRiRExWUDJ6NXBWS3Za?=
 =?utf-8?B?d2pvSDcvZ3VyQnhVb0xsc3JyWm1ncFJaYW5KdDJGTlNpYjBVK2t3KzlQdUNJ?=
 =?utf-8?B?KzBKVXN1RXYrd0dPL3I3MHpCZytrSWMzUTVES2dtMGI0TTh6TmNGM3F2SUFL?=
 =?utf-8?B?UFZpRVJxRmw3T3lTNWdIZGZwVlRkTzl3UkF3aXIyaGU5UEovU3psTFZHZnd5?=
 =?utf-8?B?aGFqQ3FpcmM0eG9NM0lieUVyNVBlVEtnYkNHNHJGSzE2R2xmSEgzL0tPd0Jr?=
 =?utf-8?B?WXR3NXVkOFJjTTVzT25takdNRTRqeHhOdGxxelNrY3NCa1BqbDFWSTRyd3Zl?=
 =?utf-8?B?MHlPQ1ZOdWlsdGk3SXFpU3VjdVZQQW81UkJ6MmpXVzNGckN5WVJjZkpvT2Jq?=
 =?utf-8?B?Q1ZiR3UzQTRZS25YeGM3OThKUStBb0N2bThnMThaYVptYkNUekIybWloYkNr?=
 =?utf-8?B?dVF4UUljbjJ5T05yamRmdy9pdHMyeUJjUEpjdHo3MjdXVmpmbURBZDM5dkpI?=
 =?utf-8?B?THhydFRkTkpEVmQxaDJ6MEM2Q2Y5Zm5ORyt2UmtvWnhVUDBGbVVzbTROZUpR?=
 =?utf-8?B?OWR6WlFvL2JWOHAzcnFOTjlmOVpVeGdLeWlpRGZOK0dWRUozb2ZtMXA1TUNX?=
 =?utf-8?B?OHZmaWNYSmlOSHJEenZ3VDZtajduVGtvQ3JxckZLU1NYaTR1dnEwdm00NFR5?=
 =?utf-8?B?cGZ3V0NTRlBpZ1pISUM0RTFackw0RldZb3VPTWo2U0RKUFZiS3JocnUrbC9X?=
 =?utf-8?B?NUhtYW5TU2hKc3Fya2M1ZlFXUU45RVRxMFJrSzRBZ2liUitkYm9FZFJhN095?=
 =?utf-8?B?ZURydDdNYXN5NC9KTzBMb0t4MGJJY2p2VU4wTzlOZGNIeFdaU2lmbmxxQWs4?=
 =?utf-8?B?eGV4UE1hanc1SGRvVlVrZTNrNlVFbEd2WVFqNDBZeXpueG41MWNkT3lPUnpV?=
 =?utf-8?B?MTIwN0ZNeDlwd21lUFYxUVovRkdlL20wbEZmOVFaQjdjN1RjUk1ndFcwZEgv?=
 =?utf-8?B?WGZqWGhoNjZrRmhzOG9nSnZjbXZEQnlBbTlLSXJJSmYwMGowTG9lUDgrZlFm?=
 =?utf-8?B?ek9lRGxpOHRZTjBXbFI3VFdlVGpzYUpEd0M5azJINStDQTd4VmZ0QlNJaDR5?=
 =?utf-8?B?T1pUM0VKWW5BWXZDbEN5b3lYV3hjZkRLM3JoVWs1cmZHT0svMUVvTCtGb1Ex?=
 =?utf-8?B?KzZ0NFNMbDFJNVZncGw0cmpDMGFrUFg2SVBDYlBlcnhXTTYzUzEvS2tYc1pW?=
 =?utf-8?B?QUsyM2NMR2QyTWxLbGxYOG5vdGFnMTY2MXFmWmF3a1JNeHBkQjdhMXpUZlA0?=
 =?utf-8?B?RitHa211Qm1hbUxtbUVJVGVpU0UvYkVsVEZJeWFMRCtyM01QeDc3SHl0a2VT?=
 =?utf-8?B?Zmc9PQ==?=
Content-ID: <F5C7018C5307864CBAF83348D8CC4F56@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d294834-ba29-4f88-1f06-08da89e5a2c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 17:40:59.7206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j88RkXoXy7t62jTsiro94WSLeBronINgMJ1YwU62pVNbpaU/E1BvFDjWYy+SZgFxGOIS+0TJUoW7pLSPNAtBvaeXtErYPg1fdHSugCkMiJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5908
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_104110_040652_2E7F93A7 
X-CRM114-Status: GOOD (  13.09  )
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

On 29/08/2022 13:52, Anup Patel wrote:
> The Linux NVDIMM PEM drivers require arch support to map and access the
> persistent memory device. This series adds RISC-V PMEM support using
> recently added Svpbmt and Zicbom support.
> 
> These patches can also be found in riscv_pmem_v1 branch at:
> https://github.com/avpatel/linux.git

Hey Anup, couple build errors here:

/stuff/linux/arch/riscv/mm/cacheflush.c:99:2: error: call to undeclared function 'for_each_of_cpu_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
        for_each_of_cpu_node(node) {
        ^
/stuff/linux/arch/riscv/mm/cacheflush.c:99:28: error: expected ';' after expression
        for_each_of_cpu_node(node) {
                                  ^
                                  ;
1 warning generated.
/stuff/linux/arch/riscv/mm/cacheflush.c:105:4: error: 'continue' statement not in loop statement
                        continue;
                        ^
/stuff/linux/arch/riscv/mm/cacheflush.c:108:4: error: 'continue' statement not in loop statement
                        continue;
                        ^
/stuff/linux/arch/riscv/mm/cacheflush.c:111:9: error: call to undeclared function 'of_property_read_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
                      ^
/stuff/linux/arch/riscv/mm/cacheflush.c:113:4: error: 'continue' statement not in loop statement
                        continue;
                        ^
6 errors generated.

LKP already complained about this prior to you posting & as it has
all the repro needed, there's not much point in me sharing my config
etc:
https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/

Thanks,
Conor.

PS: I liked the last patch, must've been a hard config option to
find if it took two of you! ;)


> 
> Anup Patel (4):
>   RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
>   RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
>   RISC-V: Implement arch specific PMEM APIs
>   RISC-V: Enable PMEM drivers
> 
>  arch/riscv/Kconfig                  |  1 +
>  arch/riscv/configs/defconfig        |  1 +
>  arch/riscv/include/asm/cacheflush.h |  2 ++
>  arch/riscv/include/asm/io.h         | 10 ++++++++
>  arch/riscv/include/asm/pgtable.h    |  2 ++
>  arch/riscv/mm/Makefile              |  1 +
>  arch/riscv/mm/cacheflush.c          | 37 +++++++++++++++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c     | 36 ----------------------------
>  arch/riscv/mm/pmem.c                | 21 ++++++++++++++++
>  9 files changed, 75 insertions(+), 36 deletions(-)
>  create mode 100644 arch/riscv/mm/pmem.c
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
