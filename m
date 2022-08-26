Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82440ECAAA3
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8WsvS86IAy0uAovZBiRuZWVAR09EErmjbiX/Q3w9KQ=; b=SVa0/YBnG8kRP3
	67nZ1OvID8Y6lSBzBpyOaXl/SikwavJeS6uWNKIUmHhXy+o6NOthgiM0/4C1OmrFpa+2i7wmBahnp
	/XHllmhsgtn3JGL6klKlOK4tn9OrmtdFZa+rX9j8AiTYe/8QZ8xKbZPtL/RKw2GU8MjXTREG7w1R8
	C6xDMYTwolzYsDMwBXoMqqw0+5kFEDZjPtE554A9HGlisP6hmm+fEpdX0C0xI8JcbgvRmRs3uu6++
	sO75CZLKpwXYGDy4XlawDfve/TohDv+nh0eiQoPkGDakBPJWZ4xiY1lGYRLI227M5e3F0V53VVXn7
	dMNSByzHKrkQWodDTF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRd86-0096DE-Ut; Fri, 26 Aug 2022 17:28:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRd80-0096Ax-U2
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 17:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661534900; x=1693070900;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=70dRe/FHZTVHaTjje4zrRq11TGxd6q/kSbKOzG7/i2A=;
  b=KzYp2yjUV/9VIYQfNvVWQuLuTeVSaX5ySZ02zfX66e5V0vfqsBOna10C
   qRLoAZyuJN3qGzui1+6UMZwoc3n7GthiMR/mf5E09dulTs2sJCD03xwBl
   t1nFHu8UjjLTSnmRw3Kwfvy0z+GXOZfaDpxofemFeWt0wKXMc7NZN+VGU
   y2akURjoLvPvSTTESNOOk0Oi641mrzayZfgFk8wnCnM6VpJNYmESgHAp+
   sfEgjaPkTkBYkEvNkw1SG3jfVdvHFueQ6M40f7BjzB3UpS5k/MIia/Guy
   9jQU+KpekNRSJw02voBtZP5/a0fveUL4nurI/oPe7nG6BevX/BSgglwLm
   w==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="110945606"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 10:28:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 10:28:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 10:28:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqtTZiwG2qdHfhW2EBdyrzSmdpEh2SuPUkRgRZ+DPJomfSeOssLm40Lhm0vm2Ht6m9wTxLnAF7+1Rce0AwVDWoiD+97yzz4lhAJJ18r2GkCYE++MvBJa/fhKNNuTJjEApyenemoUtdMWtcDDrOod+qqx5WaI46lkKBrExFoWWFFnjagveXtGIe9ar91uChQyM7TEpbF/hQTeqZjv1emo9G4XFSP4Fpj4tIJsPkLu3a+FhGRccDLi47YzceLiCDACb0dK6chHOo6/a4dNZFmGv4rO3ShoY/xkNIkRvDlXQRayx246Wm5mm23y2OTs97Lwx3FaNvd1pTudklXs+kLFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70dRe/FHZTVHaTjje4zrRq11TGxd6q/kSbKOzG7/i2A=;
 b=lSPvJ9t7HZL+N28InUx5c37awg/Nu4kSQRGfKG/4zPzJh0QMHnZty13eSwS/WCNVIXDyhzE2sQrWaqwrMyd1ffMOIENQ0s/4jCbj6U8GX8Cb30HmsOIsP0feZBS4jeMF850CLd9+Vk9VH1h6GCY5LaFUHdoFb+lhX70v4vLrO5wq6fKSrPoWgrij5BNe2RP+CwWzsLpx0aPiauW+cFfgua/ItMpjfYsJ3Eb2rlg7jkkVkux5GPSR64so6sk5K0qc4H1i9urjV8IzNh0iCVss8wUyBZbcIG0S69aMglU5rexpdHg+GZT3UK7WpKpdkcwqv9oDK8Rm1hiWVYRqRaQ2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70dRe/FHZTVHaTjje4zrRq11TGxd6q/kSbKOzG7/i2A=;
 b=qFQyumVgpfCw2Y5vpRQva2tw+EQavXvFH7K8ViIXE+oZctGEJKq/ufcx1JdCQuqbAsl7NRNEdWsqIZtVAwL0JtPEyDI9MPp0OahZc6Zyy2ksIS/8ssvaCQZqWkzUsscKlr+YVVsiHBI5qarXJrIXh9sn3h40GO8PCg/DE+Of/N8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4183.namprd11.prod.outlook.com (2603:10b6:a03:18e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 17:28:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.016; Fri, 26 Aug 2022
 17:28:01 +0000
From: <Conor.Dooley@microchip.com>
To: <heiko@sntech.de>, <atishp@atishpatra.org>, <anup@brainfault.org>,
	<will@kernel.org>, <mark.rutland@arm.com>
CC: <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <cmuellner@linux.com>,
	<philipp.tomsich@vrull.eu>
Subject: Re: [PATCH] drivers/perf: riscv_pmu_sbi: add perf_user_access sysctl
Thread-Topic: [PATCH] drivers/perf: riscv_pmu_sbi: add perf_user_access sysctl
Thread-Index: AQHYuV7zIdZzt1WIp0+BPxs9hl7WLK3Bb6IA
Date: Fri, 26 Aug 2022 17:28:01 +0000
Message-ID: <9650ad31-d59e-9325-1e05-73261960ccdc@microchip.com>
References: <20220826151556.1708879-1-heiko@sntech.de>
In-Reply-To: <20220826151556.1708879-1-heiko@sntech.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cf2b0f4-620d-4e62-d5fd-08da8788538c
x-ms-traffictypediagnostic: BY5PR11MB4183:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mRbl3xI4n0ZSOjS8Gi69keHVIV2aGzeLikmEa47unCLXuAIClTRCqq5/QBewT8gNdWCwSS3oJcqXlcnpe/MQKAsictbm0KK/0O6hC11U62i5YI1L31/HnBRpuE/hQ5J2UtV2e/lBPRd7r1bpGSGxlAeBf/KwD/lb+hLV5lTI/W3p7n99SxMB+Kz2Zi6d/4AAIR5AJ35zUors9WOM28tuJ5C9snqDVeW44xEZQAoTUIsWBh9SgvCz7avPgWfODYG7UUErSTjBvWselqKbhw90XbAdDjuHiCmwqOunFKqMEXvMADwkqcEMsLy0C9fNVr9zp3iQiO0uaJyj0up/dWg6BYJkPY+PQ+Cjy7wqgxGpbC37Cm6NtrYE4pU81nc3phCMPavYawN/yAHMn8fMOd5uvO9TLjSFLtaBip78XFxysMPgk9NpbIRVgf27qhxe0IWkV4ZQkPOdpj8ybRmjY6O/jfmnn8NofNaislAAgh/5rteyl40LVnLq/PJGBaKaL8a7YqgaoBIxkEns8TqeJ+e9nhJKzHlMllbkYxaa3XoRWCGxf9Nt1scwrMjAXAx82n4nJUNt3bfmwSzDMf87UqzeqLI+2SfoX7D7jYP4D6bHC2Cmnui7K1AATiaDd0w0HNGpIMa1GGV4BqkO4TeXJRivET1R2JnnkmVLY1QQ3Ipfbvqnr0t8nEpS98M3khNRcsQHBPN/URg3/4iuw+9otJM7gYY1v650QmcD9PpLCM774ow91ICSzSrgUHO0EpNpjj2qbVUaa/cqygBC6eesxjF80GMw/iMZe0oGdEGlz8HauKyf1nqHRaZ3GrNyLJbcF6r/0JgOliYHE3gzwJ4veni6PYnPKLPsHRIV1lVQExVmCz8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(376002)(396003)(136003)(39860400002)(31696002)(5660300002)(86362001)(36756003)(26005)(31686004)(71200400001)(41300700001)(7416002)(6512007)(66476007)(66556008)(91956017)(8936002)(2906002)(2616005)(8676002)(64756008)(6506007)(76116006)(53546011)(66446008)(66946007)(4326008)(38070700005)(110136005)(122000001)(83380400001)(6486002)(186003)(478600001)(966005)(54906003)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk1BS0VUVHVMRXV0UTQ5SlgzOUpMZ0lITFBQcEp2WUNzdHdIRTBTajhkTUVY?=
 =?utf-8?B?U3E4WG1jdW5IRWJjRWgwd0U2RDBlQnJJU2hsWlVQQVNZTWhhZG9DVDN1TlN6?=
 =?utf-8?B?NXMwajVYd0hhZUF4bFd6WFE4bExMMEdKODVaYytlYmFpaHZNdjVFczdxK0pL?=
 =?utf-8?B?aGxrZG16bDlTb0VYRC9QR2haZ2k0ejFTMjZnVTZHek4rTUl3M2EyYjlGd0Rs?=
 =?utf-8?B?WlJXRXhZbjhrOTdoK0RQOXdmdzlmMzZxdE0yRys1Mmdjdmxsd0dpZ1dVR241?=
 =?utf-8?B?eHJHeDJSa1F6M3p6OTNqRjgwbjJtMzBBZ3U3MFNIRUlhTEJ4RDI2OHRGd1V6?=
 =?utf-8?B?eWtFNHJ3RzdCM3V3bzB4Q3psRHRWNk9lWHIwTU5jM1NldFlwOUxPbHRNOWZk?=
 =?utf-8?B?ZStGMXFGRWJ3VW1QMm9FQk5rd09kREhGUmlyeVpRbTNwcDRRS1BvWUFOang0?=
 =?utf-8?B?RC9hUncvZnZNZWRtYW02TU1mQUtwY25xYmc1UkZlbE1qLzcvTlFseklrVEVi?=
 =?utf-8?B?ZzBJMytrQnE5anNRMmYySXQxR3M5YTRLMjc1S3VuMlY1WXpiSFlNTUN3QTYz?=
 =?utf-8?B?QytIYmg1Z2d3K0lBK3FhcmFJQ0JxUFQ1aXlmSGNGakZ2bzhjT00rQlZRWVNz?=
 =?utf-8?B?OWZyV1I2akxMV2hyZnVLaVdYTnhSL05FbGRpeWtOb3kzOHlYOEZLUy9wNG9t?=
 =?utf-8?B?TmVNaGtQZGo4UTdmRzBVVlZ4MXAwMWhCMEtWbDNOdEFJU21EemJJYmlQbmdP?=
 =?utf-8?B?TldWeDdtTlNGS05CdnlRSnBzU3g4UE9IM0c3NmI0dDdkbi9zeFlPNWg2OHR2?=
 =?utf-8?B?czlzQjNiT1VzUE4zRVBZSll6YW4vcFR6bGxVSjY5MUxLQWVOMzcxL2J6OTJL?=
 =?utf-8?B?SG11S1FQREtpcDJIL2FtS2xURklVZy9OclMzMDVvaDJ3Z0xlajlsRU9SbElT?=
 =?utf-8?B?Q1pVbjhZOWFMR3FSTUFrZGpGKzRIY3Q1dk9QMjZGRi9PbXM5Y3ZiV3Y2bHZB?=
 =?utf-8?B?V3NaVEVoYU1vWXdoTWcvdnRMc2JkdU1WOGo2aitDZlg1bGhEUHFzS0dHZy9x?=
 =?utf-8?B?M1BjUW93NnMzYU8rUU4vaGl4andFc05UMkJZMllLUEpoWDdZZWRqU1h1ZUZw?=
 =?utf-8?B?bnQ1YVpwRHp2UmZIdFdrY3MyclhaTnVtSkt2ZzBlVy9OTVNRK0c2ZG1CY2l5?=
 =?utf-8?B?YW56U0RidlpGU1NWOFZybzBjU0czbjU0Y0E1TTNLbjdTb1JWVTFNK2NMNThw?=
 =?utf-8?B?UnBlNnkzZUpScy95M1l4UVRHZE80OXU3dlFVT2ZCbXhLVHgvbC9FU2xUVGow?=
 =?utf-8?B?blNCOTI2NlVlQ012K0ZTTEVSSXZpMkxGODNkYUFJQUs1amZOcXRYYWtUQ0ZF?=
 =?utf-8?B?TW9RMVVuK09MZEYwVEpsU0p3Yno2V2pqV21JaEhsTldlRnUwaXE0U3g1b1k3?=
 =?utf-8?B?c3VmbWdWNEw4WFAzZVpVMjFnekZUV1llV0lvTGlsR1ArNDRHWWRVbFp1b3RD?=
 =?utf-8?B?RGNoeUgveFhIcmIzV2c4TUxnaElXZVRyUGNWTUNRUkN6S0VjS2Npdkt1Ym40?=
 =?utf-8?B?SHNuMHkvcFhPTGtyVHQwRUJCa29lZXkraFNmalBMWjlwZElPOFFnVTVFTjBT?=
 =?utf-8?B?QmVFQittMHU3dnhoME13akJQK3I5dUpkdTl4MzYxRW9IN0FXNlByaVdtdklu?=
 =?utf-8?B?a29kZ2JQb0hEakUwYkszakNuSCt4enJ1aVJ1VXlGaFFNdnFCeUN5TnliOGlD?=
 =?utf-8?B?YUJtT29jMys5QmtiZE91S25FNkYxallRUXZEcFF4ejQ4K3F6bTExZFBIaEhr?=
 =?utf-8?B?LzNaWTRDMjJJSGpqeEVITXMzbjBHRFRUNWlXZ2RGZktIZnEzUmdpL1VNWURn?=
 =?utf-8?B?L0pnTzE5cTdtR3FMSTZkS0YxSW5icjJXbk9ycVVUellwVU9WZ0h5ZWZ1Skl2?=
 =?utf-8?B?amc1VHZLTjFxR0R1Tm45SDY1K2N5U3F5TU1aY1lpa05aUjh4SlkxdzdweFh2?=
 =?utf-8?B?dnRkZE1WWlp5dUFCalpQNGwzQWpxd3ZsRFdQUmYyeUNRM1gvMTdTcXBnTWdq?=
 =?utf-8?B?Qk0xTE83c1hjUTlSY25US0hsTXBFSjRwMHkraHVkVkhDRTc5aitHR0ZiNjFD?=
 =?utf-8?B?cmJkdXk3elFzVDJXb0hTV2N1blh6bEt3cnc5WXRwaVNBbk51dTJyQ0xxckhm?=
 =?utf-8?B?WXc9PQ==?=
Content-ID: <7831CA7AE8E0B14AB94362AEE5264A59@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf2b0f4-620d-4e62-d5fd-08da8788538c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 17:28:01.2762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJUPql79QFttQYHQFXPljwBymb/f6i1RdDFKP6Bjf/zipQQryDPuaQVAQQF/xMmdpQR/gO7osbvxvMLBka1hXFsHdIetemsLG0TcE19Jkpc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_102821_082040_ACB45E24 
X-CRM114-Status: GOOD (  28.97  )
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

Hey Heiko,
Couple comments, mostly nitpicky sorts of things..

On 26/08/2022 16:15, Heiko Stuebner wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add a sysctl similar to the one on arm64 to enable/disable
> access to counter CSRs from u-mode on RISC-V.
> 
> The default is of course set to disabled keeping the current
> state of access - to only the TIME CSR.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst |  6 +--
>  drivers/perf/riscv_pmu_sbi.c                | 43 ++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index ee6572b1edad..efd4bc385e7a 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -894,15 +894,15 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
>  The default value is 8.
> 
> 
> -perf_user_access (arm64 only)
> -=================================
> +perf_user_access (arm64 and riscv only)
> +=======================================
> 
>  Controls user space access for reading perf event counters. When set to 1,
>  user space can read performance monitor counter registers directly.
> 
>  The default value is 0 (access disabled).
> 
> -See Documentation/arm64/perf.rst for more information.
> +See Documentation/arm64/perf.rst for more information on arm64

Code aside, this reads somewhat confusingly. How come riscv doesn't have
further information to offer?

Even if we don't have anything from a riscv point of view, it would read
better if this statement mentioned what it is about arm64 that requires
more information. Something like "for more information on arm64 only
fetures x, y & z".

> 
> 
>  pid_max
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 6f6681bbfd36..7aab8d673357 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -41,6 +41,8 @@ static const struct attribute_group *riscv_pmu_attr_groups[] = {
>         NULL,
>  };
> 
> +static int sysctl_perf_user_access __read_mostly;
> +
>  /*
>   * RISC-V doesn't have hetergenous harts yet. This need to be part of

Not in your changes, but s/hetergenous/heterogeneous

>   * per_cpu in case of harts with different pmu counters
> @@ -640,13 +642,22 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
>         return IRQ_HANDLED;
>  }
> 
> +/*
> + * Depending on the perf_user_access setting, enable the access
> + * from usermode either for all counters or for TIME csr only.
> + */
> +static void riscv_pmu_update_user_access(void *info)
> +{
> +       csr_write(CSR_SCOUNTEREN, sysctl_perf_user_access ? GENMASK(31, 0) :
> +                                                           0x2);

This file does not comply to 80 character limits to begin with, so I
think this would be better on an 82 character line than broken up.

> +}
> +
>  static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  {
>         struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
>         struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
> 
> -       /* Enable the access for TIME csr only from the user mode now */
> -       csr_write(CSR_SCOUNTEREN, 0x2);
> +       riscv_pmu_update_user_access(NULL);
> 
>         /* Stop all the counters so that they can be enabled from perf */
>         pmu_sbi_stop_all(pmu);
> @@ -785,6 +796,32 @@ static void riscv_pmu_destroy(struct riscv_pmu *pmu)
>         cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
>  }
> 
> +static int riscv_pmu_proc_user_access_handler(struct ctl_table *table,
> +                       int write, void *buffer, size_t *lenp, loff_t *ppos)

I assume checkpatch will whinge about the alignment here.

> +{
> +       int ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
> +
> +       if (ret || !write)
> +               return ret;
> +
> +       on_each_cpu(riscv_pmu_update_user_access, NULL, 1);
> +
> +       return 0;
> +}
> +
> +static struct ctl_table sbi_pmu_sysctl_table[] = {
> +       {
> +               .procname       = "perf_user_access",
> +               .data           = &sysctl_perf_user_access,
> +               .maxlen         = sizeof(unsigned int),
> +               .mode           = 0644,

Mixed use of whitespace here, some are spaces and some tabs..

Thanks,
Conor.

> +               .proc_handler   = riscv_pmu_proc_user_access_handler,
> +               .extra1         = SYSCTL_ZERO,
> +               .extra2         = SYSCTL_ONE,
> +       },
> +       { }
> +};
> +
>  static int pmu_sbi_device_probe(struct platform_device *pdev)
>  {
>         struct riscv_pmu *pmu = NULL;
> @@ -834,6 +871,8 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>         if (ret)
>                 goto out_unregister;
> 
> +       register_sysctl("kernel", sbi_pmu_sysctl_table);
> +
>         return 0;
> 
>  out_unregister:
> --
> 2.35.1
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
