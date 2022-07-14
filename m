Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25B1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 15:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a6+ChOF8qR4NzBfHF6pP9zLz6RHgDKvN637pk9PIXSU=; b=zfgBDccXSQOFSb
	H9PkymuxJLxDT0quBxQG1m2erAugAWjDWInfqkhdhUu5NyE81fR9w+B68ruBBaW1m/pus39ExLpiC
	/lrFXufu+STtVLyvCsCFJDheKobdl7FGbbuiO5sPWSXb+62AXyILFYrYHFexy1AWJ/6S4AtuS2KSe
	HxrTqFlxDCLy4kCB+Z5P+Qi5nueB9FQcp3qr6VlypgsudT/ShPLg/8YRmgBYHv9hk9Upysz9toqe1
	8EC2qG+ct1POF7LYE64eZGSkD+CkWLckNOI5CA8iUbTiz3+R2sd5Ef0vbcP0Ea1ZJdORviN2XoQA8
	l31XrBSUXTVM0xshFwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0lW-00FhcI-CO; Thu, 14 Jul 2022 15:28:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0lQ-00FhZY-KM
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 15:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657812508; x=1689348508;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ASTW0+TJ5Ex78FuDdv6Q0zyx4ypN2TtZSjTCSAPYXBM=;
  b=u/Z8Y2Imr3ae9f9k7Q6dev+FVM9Ilh5KA/QhGKN0+/oikvRfEEl0y7Au
   RTWUuwQcoXEhnOTZFeyMu0r4ew7/p6XZOU5Rh6ALOZsgyecAERvIYRPnX
   KEH3vbeS8C2aBiIePBGtB82wZroFdMv+N/ghFv7He5cIxRuzlygAZkyuh
   YbAs+qrTvC/DaJkuTWNyCjB6CbiJWI4HShiq+JIzviYiO9sa/3hj+OgSA
   e0K0zbqPtCiSlAf1vye4qisLcOBY++gSiknJI8zB5x05ONPpFG7tdJpKg
   yIvfjS9wgm0o0YbORvt6Y0Lc7QVgGLisgXlzVDS2HPGeFZVqHvstpjS2k
   A==;
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="104482730"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 08:28:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 08:28:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 14 Jul 2022 08:28:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9trwKqRhI6S45XIm2qIYX8eCBpHCdr7YaI5Us3jg9G32xh0Ercff4Dfw8ENFM5mvwk3pMzsi/H+QvnpGYwfVEd5GflJXNpq5AqFN2gdx3mOhD3DdmAXIGTCgUPx1tSWLbWTZikpHrv7K2ygVvU7yXNsEIKa/H1huqsSh5YKjAFbMZKmPdA7MIh8NfhttMRfFtnAFg7CHH4ubfsSQ0f/fspHkK665+srPQ6y0pMIE6QM0JN2OJAQ4uUHgaal0kTfhchtF9HO9TAAzHmEZNqUyS/J6DJgMobNteFhyzOnRi2/oDe3PoAZd097wT8W93/gW4q+mZcGGgGMkLBb5oFJlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASTW0+TJ5Ex78FuDdv6Q0zyx4ypN2TtZSjTCSAPYXBM=;
 b=hLcbN0OMfAGoT2u0qbvxPWwmfaxHyt9U72wNFZGNO3BGH7g0yafqP+Dgpq7IiZOmUUZXp8Y72FxiWw2svmenCwZ8f8983scAngWdjat/JIQak1nj6sMVtdkzLLen0kXrlBzOJUKQBPm+hG/HgNtSFVxAmKpBmoyi60DTAtkWHQEQ7T75XvG/OFzyv1y4LPzuYs22pdyyyBX4QWVkKYe7+2vTxf+apc1ReQqorTWUgfdFrx9frCRjjqePKBP5RQZd2jTxcHfArWdQ43/N1DSksvPI25DSK495XnGqJ5CRWz3oZJNIDR/ZXuSI9FuJwxd2Dc9wmHpN91WeDi3HaWZjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASTW0+TJ5Ex78FuDdv6Q0zyx4ypN2TtZSjTCSAPYXBM=;
 b=dzsQqQqOrdnsbvxjrugIT3Xk6Bdj4gSqmOcBpJ1gmSf9Xpewy9NkUFGlCGlib6XUPsMgr02IRCr9sK6VclFWoJuHQ9apioUilqNkmeQOw9K9hYs68u0adIeW+ZdEg106P65viaaCU4dGp45dNMgmfRnd56wiQFVyZy3k87WgGY8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN9PR11MB5498.namprd11.prod.outlook.com (2603:10b6:408:103::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.13; Thu, 14 Jul
 2022 15:28:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 15:28:16 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] Microchip devicetree fixes for 5.19-rc6
Thread-Topic: [GIT PULL] Microchip devicetree fixes for 5.19-rc6
Thread-Index: AQHYkvg4LNVeea/w2U20A3b77W4ccq19/feAgAAIxIA=
Date: Thu, 14 Jul 2022 15:28:16 +0000
Message-ID: <c0ecea83-44ed-99b5-0b04-ff3bcd5654fb@microchip.com>
References: <mhng-f325f08e-2a0e-4c66-b422-7af21cf10448@palmer-ri-x1c9>
In-Reply-To: <mhng-f325f08e-2a0e-4c66-b422-7af21cf10448@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98f338b2-bccf-4134-e12f-08da65ad7919
x-ms-traffictypediagnostic: BN9PR11MB5498:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GBJkmSPKGbvyn5w2+rJ5tGSo6JXkyhh1HUwXUgviRZuuZZRVAIHcsZLEWq8Z1veB4KX6KmVLN7qV7rg2tXCm9GfYJoMVmksnlYs0iUt2GMUTjt3/qJQY5DqcG626GMzd6UJzR1vDd8JxmKhk5CE8nDf6WVZVB6WDk/TLuET9CZYPmbsENXZzuAyLYDvm+eUzvqgoeAhlBqXufqqSuhK9f/wsURe/2cpCgAJ2tmuUEcXAQyXUfAKgmDtVNe+6eQPgJsRplo7+OYApudNOlBZ3cx4WZLCY+BYYQ0+FT7J7J6s86dI0C769rp7hXYDRYnyq7yV+mAyvI+L+7K6gFQybhUiY6aWgDru4+o3dYaVRfNuG10B/SgUNh2J6Yxh97hkqNnVIN+y5vSYWZ45FQZ1jNeAXNyTKhAHDy76WfvSE4oVjD0GMT52o+tHLN6jYA0EfbXj9diGdzs5/mmRuSZx1iotEJeS2i197dSTVYFzwLjQXMlYXbI5Oh0XmHpX7JOB94T9rmUFy7XOzaxscuAcUCBz8lLna7x1Y1nMhjVJ0VXlChAsDrQEtis5Cf9J8PbhLQ9fkDzvn/1qhLqN1wRd4ZG8RWCYR6FyFEvi0wfFdnlFyJwvfNuNWkf3eNl6+BvAphDKen3Kq3wX+bKh7Xzko77t3o0LZ/jXx4/YcEkPUO00FbBb3zspfEHc2jtvN0UVELyL6s9HdSc9xHAQCGzEUB82DX1ENm2zd0mXSFChHbfLuB40qRCG1l2mMdLngus3SOvih/4c67/jZoc9iFOhgkePpVQKXvYaxfs23lGRRHJsVcabyUFVDmlHDOhYAiXiIMjLaaqaW9iVPOMB4px98ax3gJyZEDsA0GYuAxkUeojNj0t/p/OPbUNXa+NKGiM5o
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(136003)(346002)(396003)(366004)(6486002)(86362001)(71200400001)(91956017)(122000001)(38070700005)(4326008)(38100700002)(478600001)(64756008)(6512007)(6506007)(26005)(316002)(6916009)(8676002)(41300700001)(53546011)(31686004)(36756003)(66946007)(76116006)(66556008)(2616005)(186003)(66476007)(66446008)(558084003)(8936002)(5660300002)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RENWS3hFbnZxSUZIZ21aMHhPWCt6cmUybmtVQ0YrQWtKeWpBc2NRZ2JHc2Za?=
 =?utf-8?B?ckpsVkl0VTJSZUFLLzBDS1NQUUl2Ym8vMG1SM2dQVDFPVjNZRGcrQzAvS3VR?=
 =?utf-8?B?R0pKUjZZODFwVit4VEhLUlJWZldPZ3hIZVRFMmdqUE81aVRqWXZTVTFFOXRz?=
 =?utf-8?B?TWpGTTV6b0NndGxldVk0SGhBTkJ0bGY2Q0VIVmJnSHVFd0p2N01HLzB1eUFM?=
 =?utf-8?B?MnNFRHE0cVNEWUlMTk9iSlhsT3BwRmVJeU13QzdIcm92YWx1OUlucllRMTNU?=
 =?utf-8?B?eFd3cVJPSjdPZ01iTi9DeVBXekNQMlBSV2dPTEc4UXVBQnJKa1FRZWZRQ0pW?=
 =?utf-8?B?V29CZlNMaWRtMGpBM2lrWHkzMTdGMEp2WXpBTllaS1ozRjRwQVZWUGRWNDNt?=
 =?utf-8?B?Q3NyQ3FZKzJRdktCV3dTSVpHMTU3aFlSeGFDajJ3M0Izd1U5Mk00dStaQlh1?=
 =?utf-8?B?cTdvaFZ2dWJVOVF0VnJQYXI2VjFXbGQwKzViVFhzK3JueFJEQzI3QktQZG03?=
 =?utf-8?B?eGNUa1RmU3paSWZMRnRRbmhDZ09WdU5rUGxEOFVUVkhIZkNzeTUxeWMyU1lM?=
 =?utf-8?B?dEF4Tml5dWlZZ09vVHV6b01sWEU1ZXZkRjFHMk5sdUlzL2pnQ1cxRGQ0OFk3?=
 =?utf-8?B?aGR5aktabjZDNHRyTUlmOHNUajZNRHlaQ09EczFuS0w1VVRhZlZaNW4vcG41?=
 =?utf-8?B?bVBLK0FwNnIvQmxMc0hOOWkzbmtDWWRjK0Rpa2JoMHNjMnRSVzVpbWcxN1NT?=
 =?utf-8?B?UEYyY1B4TE03dnBlVTVESzBCV1dmOHFVMUNPdHlmSkJaeEpHcVZDZWhmU3h2?=
 =?utf-8?B?VnJlVDQ0QkZXSmdUdVJmeXdzZ29FTWxZZ0E2T3lxbU1UZFRubFMvRDFCa2tD?=
 =?utf-8?B?aHVtQ3hZM1lTa25qd2QzV3d6a290ZG9kMjRXVTRVZzBsU2gwN2M1cDhMbm44?=
 =?utf-8?B?L2NOZm1JNW1KbGlpSmE1MHdsVmhvdWJibk1FbjBsV2d3UWF6V3Zva2drYUt2?=
 =?utf-8?B?TXptZ3ZHeVdaa0xoOVVGTjhPdklUd0NVYnZjM0ROczcxYVVIUm1HVEtuVEV6?=
 =?utf-8?B?THFudTI3QUM5Z1lMVEU4VHIxT1MrdHpkYnJmeVZZbTBKc1Eyc05COFI1Nklq?=
 =?utf-8?B?Y2NNcFo5YklobVhoeHFTZTJhenk1eEV5MllXNE5EWktsMW1PUkZTQnA5aDYv?=
 =?utf-8?B?TXUxeGV3NzBYbHA1bjRxMmpoMWI1RFNBL3BGY1c3ei9Lb2VzZU9CYWFPTEdi?=
 =?utf-8?B?eDZja2NUYldYTjk5enBqZTFxSU5kSW5FUjk1Y0NoRVRLdEFmM1REY2RmTThH?=
 =?utf-8?B?TC9YMlVVVExoUGQ0Z0hxSjRkSUpqdnVOUk83cEw0QXB4T0k2SkpaL3BHVm82?=
 =?utf-8?B?ZGpTSnNGbjYrTDBoOXJ4dllCeFpUSlRRRU0ra3VVdDk2aC9PWVUwSnYvaUpP?=
 =?utf-8?B?Yk11enBNTXdxcVJmeHYzQUlyU1loTTBFdEo4U2g0ZTNUZUZHOFZkZ3RXblVI?=
 =?utf-8?B?VkdyT2V5S3g4cks5YkRFOUk1Wmx1SjdsOERvVGtIbmtUQ2hLNG1LOEE1TWEr?=
 =?utf-8?B?aVp0MlZvbktjQTZZS04xZ0M3L1RRUXlxU09YVGtOMHd5M3Fqd2Jod1NkQzh5?=
 =?utf-8?B?WTdBb0FFeVlBSTExK3RXZnFEYmtkd08xM3NQdDBocEplZWw1MEpJamc5VkRn?=
 =?utf-8?B?Q2Y0Y3Nra25Qa1JCSWcwNzJmTEdXbE5IQUpyNUdVcmlIT09BNHZXdEo3UzJi?=
 =?utf-8?B?bXRzQVp1Qmp1c3ZMWU5tUDloU3dMNTEySHhkdDVKd0tMWnk1TThRNldKWEgv?=
 =?utf-8?B?MGZnR2xVZXJlM0hWRlpXamR1RkdXcDVTOXVYaTh3M1JjbUlodFQyQXF2MDFu?=
 =?utf-8?B?VUQ5aUF1SVVhWFdDTVNMVmVuREFHQ3A5ZUx6V0NVZmV1ZmpsRVBzaTE3eEFP?=
 =?utf-8?B?ZVhNMG4zdS9GSWEzd01xRGdMa0FIaWhYbS81R0RWWWpLd3crcmMvdzhVOHpR?=
 =?utf-8?B?NVlsOGZ5N3U0WHc3YnA1QWZ2eTNGTWhZN1FSRmJRV0FTSUV2aVB3VGhhQ0pq?=
 =?utf-8?B?d3lQa2kwQm1FSFdscWk4RnYrbjZPYmJ1dUdWWUtpU01qaFZYSHp6N1lmWVVF?=
 =?utf-8?B?M2ExYTZpMDBaajVxcUVLS3czbVluMUtmbEh3RGF0RUxQSmdCdWhseGsxem9r?=
 =?utf-8?B?MHc9PQ==?=
Content-ID: <2707B20F501582438752F0913E5F535B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f338b2-bccf-4134-e12f-08da65ad7919
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 15:28:16.1364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6eU4hKVEP3B/O1Hoq/qrVDwAOnUlX51kF3rIlpDvzO//P+2+S706gRqVQHpLxdZ0XfocakluT8Q+erMTYWWgb9+WQSFpx9ID6e4GjguH8As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_082828_768045_11995DA0 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

On 14/07/2022 15:56, Palmer Dabbelt wrote:
> 
> Sorry for missing it last week, I got tied up with this test flakiness.
> This is on fixes.
> 
> Thanks!

Cool, thanks Palmer. Just in time for me to send another one ;)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
