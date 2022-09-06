Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D774BC38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHdG9OftQZtoRX9zWa92P8c8obaNpFetjOpN+usUGRc=; b=a2YM1lxXVH21Dy
	lLm027dqTw+hDjOv2YzqAP9gcsNQJSLekGbNCzB/IhPJoWYi5uHERSJ9ShVY8BrOzfYB58YNNOw+f
	W37hCoxP4LHsavwLF3/pffDYmov48qWvGC3uYfKFyWNCYsJBB7znAWzE+K14PnJ2YaxMNQg2JJyCe
	laYtthI5CWFUJjcOdHrTIP8q2hAEWlEGNHynTZvILeWflhW1KZn8O3LXpRa8ATHP1fdM//IH96Fwa
	3Hrlz0ao1PmMiaUjVtwrPBNad90IAwvy+Byg95c4v5t1+Mom5mxdOuwP6Sfc7un5Ubcdl5Qtfkq9t
	MiV+3dtv1FVHnw6ihf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV6V-00Bzx0-4e; Tue, 06 Sep 2022 09:42:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV6A-00Bzmp-Vi; Tue, 06 Sep 2022 09:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662457346; x=1693993346;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ljC/hD2QRtzUxgCdsrfxcSyG7pmosLpfQjMKbbBW22A=;
  b=Nfad0L6bsmXpwAO13CAw7Mj2opVMKTVlFD1aoP974a5m5VbRCyt7q6dV
   rfcAvrOh4nqmsh0NQcKTEbDL6cqDLWHmXM/c3v9Ml1KN6Ufx/qI5J0wkX
   X3AIRiTkj1i/oqlwLpS6yxFPW1LU26qlNouuUhQY+PuWIX593g+cTNRr8
   dtyykrjvqFgH5+YFb8+H3xgYNZwHKXU3d3KqV+/ipCcNdDv6YCR5b3k8J
   O4gDeJkQSeBMXMu+8TYSLffzwP2mUM/a6gn7OfcMk6SImp9OsrGNHZuZ1
   uSwV4Y2x+TomYw//9Rcokl7EAsWBTZZunZvmzz5SV8FkNehCM1ek95YzT
   w==;
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="179310570"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 02:42:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 02:42:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 6 Sep 2022 02:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PajfxnYSVniObrrciYfRXWlsMxSCMEDvvLKRZ3WRQQF5qqiAzI/LCBi25m/dcABVO9pe0QD84D70BFjiHteCM5COJlMps41KM6uEm2BZNCdt9xxyDG5NkPvdMtOlefHgegBdbt3lN7k/WvyBsTPX5erT+weszC6DQP+29h/X5U53j+i36mJesQwdXprhYdUc/FzXmbNl5/WYiK8pLu2pVW0PNGj7EICbPM18adJgDjx41AMegKA+kVeCCeJzr+R1EWKkLm9RZ1BxcBj4b4uxt96CeWH+XNe0d35FHihAghlND0dRSJH9k6NKlF8gyF3MbC5cvc7iQXFCgJckbUamFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljC/hD2QRtzUxgCdsrfxcSyG7pmosLpfQjMKbbBW22A=;
 b=Dsv8eE2FBBXaVBZnF8h1PA7YKmV+sDQgT0qwYCrOjH40e3uYJaMX29F/fTtYdKBT2qRjGq5i+XrVbm+hED4xi3t2WTiubr5NNMBcwTTYEz4CAIjqLoQmkUNcEiJRcyLE9/D+3EP52XVmtuxOd2it3zwtiMN1lskhwK4lNe3O0FRFgbt5C9xNV9ncT3brbytCqWMBDiNiBMqsffz/JCK7cPpSEff4B9ovWFj0FF63AjjbO8TSd5EeADtchKOwhsDKtlrpjTnX2UMPUK0e+XUTjxUDFS6/y5s6ByjthpLtvuw7TPHCVcIFZ+LeippF8+yqfjT9DtEJCPtbohiYRAgOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljC/hD2QRtzUxgCdsrfxcSyG7pmosLpfQjMKbbBW22A=;
 b=LHUQ+TLMHWBmymmUY0Dl6OnR6fwWqO2Duh3e8H73TWdGqvJ0bu5ao4SdZxcdiC8pk+63Y+gYG5KpYBxXwrDNV6R+hiTwMqYZkkrYPsEEbILajbLzqLFDMm3Dd7uvN4aGxvhSIF94iujOqsJOmIHf6wIn2ZWazQ2rhQ2zFRW/aHs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 09:42:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 09:42:11 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <heiko@sntech.de>
CC: <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <anup@brainfault.org>, <atishp@atishpatra.org>
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Thread-Topic: [PATCH 1/3] RISC-V: Output cbom-block-size
Thread-Index: AQHYwcvExmNBI2asc02J8FECeoGTKq3SFO6AgAAEUoCAAAFCgIAACD8AgAADcwA=
Date: Tue, 6 Sep 2022 09:42:11 +0000
Message-ID: <9f46a2dc-7515-c460-002a-29d8e32562df@microchip.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906083555.931806-2-ajones@ventanamicro.com>
 <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
 <20220906085533.orfbu5gyeur5xj6i@kamzik>
 <b24c9045-d0f7-f88a-a34a-ab13b8b1167a@microchip.com>
 <20220906092934.mn45eil73xh2lgel@kamzik>
In-Reply-To: <20220906092934.mn45eil73xh2lgel@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e0ab7c9-3a13-4993-fbc1-08da8fec12d7
x-ms-traffictypediagnostic: SN7PR11MB7091:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yUDnc0D282B3NhqVICG+xDe3MFCHJ5OrS75ISJJZykvg3+NlClseiMeRjc6vMiGpi+69Wn6RkDtZzPgTls3Kts1Pxi/x5ZtpTbjuJnXawiAq8GXCOvuLE2ggWxMraTB+8aoCoht1LbYSmDvKAhHKE2ABv2Fmc13bqhcgmTd+VAGkjGNll3saqiFoyzeyw1Nr9CJJ2C2A9D6eIwEfsFgMnIFiGuIijyXp/vxM2VHQLbd66no1FX1jBWWl93vVHLl6YQ5JwYqBiZhU6eJNzZQsflGuQSY9HrfxBfFyZQQ6KwCG3Wu+r0zIKb5UStUDPVZ+jMguRRbzCzKPA31lrNBkd1MarUVGuSHc8GWq37fM5+d6AkqCNogWQZcx73UoPx87GSvLNhw7h+Q1kXRU7uyxMuF8Zob8jIhKOga6dp4yxOX0vTUu5Alix5/BuPQdl1+JY8FbyngGbsZJD4i0Sa24CvfueNNSvjMOHOfWkFrPH+K6bU7BYZPa8BKQT71npx90Z8sg0AA+aXL31DHyBasILoQWlmR7LW0eLYD5b0BYrKwy/F64gUi7M74E8UymsOvQWSGMkWSYLFCB8KCl8Sb7ZmtdXwbjJQSvjInkJO+icJk9cB5jXZGBVGBjQhLSqiZyE5iJCV3RzHZRjjXcnafBMZyxGrM16rMu8NTOIwJUf8ktuPU2JxujV73bjfSJw8qUN7VDC11oEDi3+obeA9etOJxMw4BLOPxoxGdyZpS9WVZAfSrqzO9jfi0TB05wssWjDRaUlM18HkTs0MV88bgUKLCyXzkZXLoXHBeWXcP1JKvl6kTTVtvBD14vGISf/oll7udMAhWVxYA/J9KR1ar3Fw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(136003)(39860400002)(346002)(66446008)(66946007)(76116006)(478600001)(66556008)(91956017)(316002)(54906003)(110136005)(6486002)(66476007)(2906002)(38070700005)(122000001)(36756003)(31686004)(86362001)(31696002)(38100700002)(2616005)(41300700001)(71200400001)(6506007)(53546011)(26005)(6512007)(8676002)(4326008)(186003)(64756008)(5660300002)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUFGb0Q4V2xlajBYek1WVUNiWEJ5V3JZNWF2YVREZEFjWmRIMkt2cWhhck5m?=
 =?utf-8?B?cTMzTWwvWEYxL3oxYlB4SkgyTkVXeW5VOTFRaWpKSHJobE5kOVkveFNIWWxN?=
 =?utf-8?B?VWVKMkdHSjBQb2tBSS92bFFoTWhEcDY0dHFQUzF4UWl2cXJoQmlOZWp3Zk9H?=
 =?utf-8?B?QUl4ajN2SmhidFdrMkRNOXY4aHpmTlMwNGUvUktsaXVrL2Q3dk1mcXZ1cWU3?=
 =?utf-8?B?bEI0ZGtWQWg2emxPajNHWmEyTTJURUdld2oraVpYMW9RWkYzaGJCa0kweHE4?=
 =?utf-8?B?MWhLckdiaHcrY1BWWmRGU0ZnVUg2Nno4cnFCVVhSZmY5bFpURkRmTkJzZmJ2?=
 =?utf-8?B?bjRWQmNZdkZpZ3RpL0JDWkRXVy9TYVlvU3Q5YklxeXpTRzdab0hnajhsQ0E2?=
 =?utf-8?B?SVJhbno1dmE5ZVFOdHNCTVA5Zjh1b0tycWR3OHV2d0tuTG03WVlUelJ5R0My?=
 =?utf-8?B?UllYelF0aWlwNEVlVitJR1VTSUordFYvTGVndGw3WExxTXFGRmJyckQxT2hy?=
 =?utf-8?B?SnVWanZLTXBxeWRLRDZ4TkdiV2FKbG9Rc2MxUlNGRXEvUWV4VzdLejBrMHRK?=
 =?utf-8?B?MlBXL1lKK1NWemZ4Wi9XbXF5d20yaVEvQUVXZVpWSFAxOFc3YS95dlZlc3Uy?=
 =?utf-8?B?VjVIQ1U5RHhzU2d1d0lWTi9VZUpnaE1LVGlIbUl3L2xNNEl1c0l6aGRzL3ds?=
 =?utf-8?B?bDFRak40bDNaUC82WDhIQUVMSS96dmlSSlh6cUErdDdJSHJJNG50Y1VBendJ?=
 =?utf-8?B?dWk0ZmQvbDlpSy9HeE9aWHBEdDE4ajdKVnQ2SDJGWHFvSXVMdS9acVBoWHdn?=
 =?utf-8?B?T1duN3FSY3V6cTFUb1BqMDhBWEp0Ykh1Sm1PVGFBODVhK3JFVWpseW9BOFhU?=
 =?utf-8?B?NE9tQTA5bzhwMlRRczc5MGxjVHh5dStOTTFTcWExWXBDckRBaUZSbUxkbVFn?=
 =?utf-8?B?Y2NrZnFFVmxGRWlRTHNrRllTaVNSamQ4TmFTZHUwb2dsTmtVVlBnc09xaWRX?=
 =?utf-8?B?Z01LZmRINFBBeHZmT1dXcSs3bGI0cUR6dVppU0VNTlZCUTYybUFiUFJBM2VK?=
 =?utf-8?B?ZEdqNHNMOWowb2szQ0R1VTBQalhjNDZhVk0zU0pGTU01enpVdWNLYUNESVJW?=
 =?utf-8?B?N2NxUnhmcVVEVWwwVkxxaExVSlJaZnF4dnJnVzBtTzAvS3BCendpc0V3S3ZR?=
 =?utf-8?B?Skk3ejlzdDdNSVBabFoxcXFabkt6dWs3aElZb0VxcXl5TnlnQzh3Y1JmWk55?=
 =?utf-8?B?ZVB1QUo3SEFvdHVZM1gzKzM4VXd0RGc0T1czZm04eHdVUnhhdDVkTlpDQ1Vk?=
 =?utf-8?B?azJPQlFSbmRRUTFTZTEyRkVZaWlXajNPY0xWWnZQSW5jcHpnZmxuYkg2eTBs?=
 =?utf-8?B?cnZ2N1BwRVRtbmFESm9OQWNLQ2dHVGFHM3k5OVZISklYMDk2aTBuOVZSaW54?=
 =?utf-8?B?N0Q4a0xXY2lKMG84eG9ORjVNVDg1Y0JBeXVyVjZFb1dnRStnc3ZzR1ZNVS9i?=
 =?utf-8?B?cTlJSGdDa3d1MnlUQnkvMWdCNG52KzErRXc0MEx4NnRDdy84S2dzZUxxMVJT?=
 =?utf-8?B?dTQ4MWZJektBdHhKT0tJNzkvOTZrczNObFVvYjNDSThTWitvbGEveklwTkRH?=
 =?utf-8?B?WmRPRzVxMUg2L2NXTnF1N3cwRG94eGdGNmJQMWxPSDNla05hZjc0WkJ3SGlu?=
 =?utf-8?B?UHFVRnRVMVlQKzhDQ2ZEbHdCMTZMUmxKdG1PYzFwamcxc3J2SXZqc2ZCZFgx?=
 =?utf-8?B?UGRTMWpGOVlJVDJDclNMeTg1NlVxMyt0d3pOaTM5Y3VqQXB3cmZwYVYvUFA2?=
 =?utf-8?B?TWdCK0pQVXZIdy9oeUJ6N1hWN1NQelMrTnRlaGdtK1J4RStHQis3UkNOd1R6?=
 =?utf-8?B?MDk2NitSdjl0Sk9GSFB6cC9OQXJFK1kyNmdIdWRoeVJDajZQV2Z3dEExdWlo?=
 =?utf-8?B?a0JpRjRTdmtSU2RDeXdDUGJ6UW1OT0FWaFRZb0ZFWG1DSXdLazN0bXBzM2xt?=
 =?utf-8?B?UGM5ZmJZZnJZWUpPTlhLUEViTFFXTVVwa04xeHNTblg4aUo2S0xYazVpejd6?=
 =?utf-8?B?N3pRdnNLaHBQdE9Da04zZWVheU1wZlhiMDRMdkE5cXFrbkpPd0JkKzBaTmsx?=
 =?utf-8?Q?XuDJCL/c+JIYGTsQZ/0sQ0/9t?=
Content-ID: <8E40B2189FCE994CBC0EE58FDBB94D8E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0ab7c9-3a13-4993-fbc1-08da8fec12d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 09:42:11.6920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0k6VkrKNflnTIV6FUq4TNiTEnnHDJNmd2Fw/D1x94Qow/4syijgTZkL6xgeK4CmFTUBuzOxDtIJ2yiM2IxUFVUc8ByYzraUjOVsj+qnvmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_024227_359990_12C48BAE 
X-CRM114-Status: GOOD (  27.13  )
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

On 06/09/2022 10:29, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Sep 06, 2022 at 09:00:20AM +0000, Conor.Dooley@microchip.com wrote:
>> On 06/09/2022 09:55, Andrew Jones wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Tue, Sep 06, 2022 at 08:40:23AM +0000, Conor.Dooley@microchip.com wrote:
>>>> On 06/09/2022 09:35, Andrew Jones wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> Provide an info message with the block size when the Zicbom extension is
>>>>> present and the block size has been determined.
>>>>
>>>> Why might someone care about this?
>>>
>>> I was unaware of anywhere else besides hardware descriptions where this is
>>> published. And, while dmesg isn't really publishing it in a way that is
>>> useful to anything other than human readers either, it at least makes it
>>> easy for a user to check it for sanity purposes (which is what I used it
>>> for) or even for applying it if they want to write something that needs it
>>> and the OS provides U-mode access to CMO.
>>>
>>> I'm not married to the idea, though, so if people would rather have less
>>> logs than this information, then I'm fine with dropping the patch.
>>
>> I don't really care either way about logging it, if it helps people to
>> be able to see it perhaps there's a better location than dmesg -
>> would {debug,sys}fs be overkill?
> 
> Thinking about this some more, I think sysfs would probably be the better
> way to go from the start. This patch should probably be dropped and I
> can try to add a sysfs node. The hard part of that will be the naming...
> How about
> 
>   /sys/devices/system/cpu/cpu*/cache/cmo_block_size

Seems sane to me, but I am oh-so-very-far from an expert here.
Heiko might have a more qualified opinion.

> 
> Thanks,
> drew
> 
>>
>> I was just more interested in the motivation behind the change itself.
>> Maybe some of the above in the commit message wuld be nice?
>>
>>>
>>> Thanks,
>>> drew
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>>>> ---
>>>>>     arch/riscv/mm/cacheflush.c | 4 +++-
>>>>>     1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
>>>>> index e5b087be1577..8595baf8e403 100644
>>>>> --- a/arch/riscv/mm/cacheflush.c
>>>>> +++ b/arch/riscv/mm/cacheflush.c
>>>>> @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
>>>>>                    }
>>>>>            }
>>>>>
>>>>> -       if (probed_block_size)
>>>>> +       if (probed_block_size) {
>>>>>                    riscv_cbom_block_size = probed_block_size;
>>>>> +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
>>>>> +       }
>>>>>     }
>>>>>     #endif
>>>>> --
>>>>> 2.37.2
>>>>>
>>>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
