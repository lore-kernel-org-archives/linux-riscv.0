Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC0BECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aSyYo/hpwTxCkryn/uMgX5po65iiqbOlG1NTFMTyRI=; b=JKakISPmhlagAW
	EOntECtyIadN1exlZdwcv5DG+p/TDRXxGSPr7QWJZVsVZuZGfmfZwZvOCkSQkTi/gSAjdfLCykq2E
	nv3w43N2sUiESFTffB/qWA2BPlqpBze3rqol0O1nx+QVvBu/zxHd21hd8qkEeyNt8x80YUrC3qZ7r
	4bbRYqOzG2PCjTmJbgR50sw2dmB5nlp74OOF9IvD+yhZEzkPytAld2obApGzP/poKTbcpABT/UXO1
	AIeiYPB2SozO1jc07Dx5e3pOaw/UuI/RRBowSxuOYG8vr2vtp6kqPaWDdZfjXuMd35eQc1h+DHmrz
	2eV020CfMqf9SfFV2AVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYpo-005Wqa-8S; Mon, 29 Aug 2022 07:05:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYpk-005Wno-5h
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 07:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661756720; x=1693292720;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=uz/Hs0cZBPlOrYO/SqoExl5sbFkIsHnKtkvbt5Mx5o4=;
  b=qjrlEIOwTim9nm0JUL7u2USgCVNertAoRIi/CGFmj+9ESkCd2RplI3i3
   E63zW63J37hrKPXD7ITztPxlon4DByjXoapJlQgnBTPSph2nwwMYjbHm+
   WAfm6wu5h3PWE4eHpZLSiWRsbYS52VcjifRLCXxK2j2eF/25yslTbHGSo
   zH2a9aUvXftTC3vWmQJIA+IGbtl/QEa4dkP0wqUgmuNG9cmozN/rwhCkT
   GskEhLm0Ion9yWmVlVJAn+NhsTQrjeuFta0uSuuIgrx4qzKLE7yj006tD
   zRHISjaetLlNVjStYMaXGXoThcqrYZSpuXrC6HA7xcmdpUyYCSBMqp7Vh
   A==;
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="171364084"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 00:05:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 00:05:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 29 Aug 2022 00:05:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUsJ+sN16xYTaeQ/sofYN638sc/D4J+R4rnsccZ8zc8kB8O9HIZvOzWJ4I5h60sdl+Y3XDDzXt//XIOmvNbUiKkxmh/aOFt2ttLjWMsBJWzisiL92a917FqC6kvzBdNUG93U94YxKd6pRMB+QJQ64cADOsh4JEVBpPW/M5dGOzxw51hdpxJFY8NcpD8apxtWNr5vvzeEJ0oE6leEUgg1myixotKZ/oYS/vVBmNtUXppjJOaFeBVpPWcVXYi6KTt/KR3rEiLq29XIj5A13KjKa/yoDge0kROgmjJI+8uz39ZR4VuxZEiCojyv8Q9yeAqkCvX6H9ZjpVsKjIfBi0iKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz/Hs0cZBPlOrYO/SqoExl5sbFkIsHnKtkvbt5Mx5o4=;
 b=EZ1tRQ8TA8PsmCWaJgO8UKwlPg88WDVrV3xJgNMr1zetf3JmjW4qJbkDg+ljODYuq2QMBhFlxm8IXWD1/7dJnqTeGDdoltMTJEuCJiuTGeprhd5fawFTnSkPuU/AIQJHpNTiC4o2VCoZ4GuBcrczvUzyO+yAfluuisaKaSNscfCneYH2z+0WeCECz7ix7a+uCshsCty0eWLTqZl01CtK2+Lj0Tg92fds0TmRu0H76UOYnXGl6uhtysmwrFWBgXgOptwwvDX0bptW+3kxTRlFBaeOA9jbwfOBrtZDq/nbrWVzd9Fq1ZnJsSXmV4+3YEfuVvBxmHnnnDp0t5//4ejX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz/Hs0cZBPlOrYO/SqoExl5sbFkIsHnKtkvbt5Mx5o4=;
 b=eDxQIR63l5SuDoDzKwW5agHQnwfQh5yyajgLSR9Nv3QqrNX7STAuap6oZ1O+HC/xx7fWCitEzAL6OfeGMyRD6Mi7WRUzPPdbNivyq4+9BGJPq/Z5HXkzuV/zTZf9gpyf7bcfz0jMLDL1Xts5zXKyjQhWONIEEdZ0EgLUq7DJpIE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2363.namprd11.prod.outlook.com (2603:10b6:3:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 07:05:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 07:05:09 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] soc: sifive: l2 cache: Rename SiFive L2 cache to
 composible cache.
Thread-Topic: [PATCH 2/3] soc: sifive: l2 cache: Rename SiFive L2 cache to
 composible cache.
Thread-Index: AQHYu2+0mRQQ5mCpPkuQboDoEF5AOK3FdGUA
Date: Mon, 29 Aug 2022 07:05:09 +0000
Message-ID: <1a0da77e-8b26-a6aa-4af2-bf852470230a@microchip.com>
References: <20220829062202.3287-1-zong.li@sifive.com>
 <20220829062202.3287-3-zong.li@sifive.com>
In-Reply-To: <20220829062202.3287-3-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2870178d-adc5-4e1a-06a3-08da898ccf86
x-ms-traffictypediagnostic: DM5PR1101MB2363:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nN3/5SL/NxZET28ZJ5PQlmSo9kKarRmnhRVq0Ytahy81jpXF5n5eZb+b9bvQ9QdYdPeWjRDt0ePPdzMc3qaLfZrD9GCegjTXbFuhUo/0QPIjhXplkxlhBhgNjHLkb05To4Z+5xISDaxFyzk8K9jdAOO4mJ6E/6dQrimKtjqxoxqSKaRv60vMnZk8lmaV36yaAA9MF/x/tDW2StBeim6hfWhjg8oLCLZweW6B1kds3wyuEMKaavHTj+DMeqBDGxXnkNjO52bVQCQi0562UFkBUpG6gf+IB5yfDKVEcAc+iys63inmZqJKyH4UN0DmVBz7xprMz1Zrvuq8XejdlG5X8E/BPQfe5FVc/QRxK726tSSHy/OrJlxDVSf219SbRFspecZ9bJVrl+nHKYFROEtKSg30+yYGjVp289EeWfSnWC68VQB6jw2Tmzh2D2ZXCTwsatVDUDAjjTrvTn460XlZATvg+GyBecDZUzGNDm0LtjD12mWrVpSafEmiBqR2a2TymFcLAyrHwqFi+e2V5ptYSNxeRoWngjdPbHO6Zg++3oHRixHcpmaNtJKgawBGCPJ+t/XL0cOhtioJWFLBeZ+6bzZpqb2iruwLkXuBW4UL98qx8eLST0SyPgNUwKoCG3UPgr4j/M7a9G2UAJOhoPK8qmAFOiBEA9MwrULWTAO5ef2jWqJAJ6w7bYfevhViEIT8exmXnDPSsoIMi/bYACmmW496MBeHUK7gJDMrvNP7LTrOpJJVkEMCrzcrrAluPXNteuypjPIP97dC5K6Q3hHqts/Cf8tmLKi4+SzM8wF4wNVVua8kgqCWKKRYtYPO6RX2UzJ/4gPfGRJZ3UU0Yk6j7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(6029001)(346002)(396003)(366004)(136003)(39860400002)(376002)(2906002)(6512007)(26005)(122000001)(53546011)(6506007)(38100700002)(2616005)(186003)(83380400001)(71200400001)(316002)(110136005)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(31686004)(76116006)(6486002)(31696002)(91956017)(7416002)(41300700001)(5660300002)(8936002)(921005)(36756003)(86362001)(38070700005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WmxKZFRtelRRNEhvNHRXSmJHQXJieDhJRnRoQW5NVGNuR0tHRm1xZzVVWXdD?=
 =?utf-8?B?MjU5ekV4aHNZSFpzQXpqd2FjbGRST1M5QlhQRDNRNmN0bDNyVEhWM3NMaklj?=
 =?utf-8?B?bFFZYWxkVUVyMWhsU0ExV0pWSDRUQm94THJhUG5uOWhqbjh0bXljaUFtR2Zv?=
 =?utf-8?B?Si9KVnFDMzM1eUt5WW1oaE9wbVdBR21pcVEwbU9vZ3RnS0ZyM1dWd0pkWDl1?=
 =?utf-8?B?eXZlbnpRSURNS1ZoTGs0KzI1amd3d3lpbDZKWGg3ZVp3Z0E2TWcwWmlmYnJz?=
 =?utf-8?B?cTVsVHI2WmdZNjBJYXpYRzd2Y3RCa1NsYXIwM0x4d2pPdVBNRFdGVHRlQjhk?=
 =?utf-8?B?NFJqdXlQT1NPUENiQ0dPVE14SytCeUF5U0lIZFdjbzAyNnE0WHRDYnFSM2Zj?=
 =?utf-8?B?aFd4R0FqQlJuTlEwZjNvai9nOHAvL1hiK0psRHdEZVhqanRMeUd6OWd3MDh5?=
 =?utf-8?B?aW9uNndITStZS1dDakY4L1kvT2c5S1daMFZmZzlNaWwwLzJ2QVBvVXgrcUc5?=
 =?utf-8?B?R2N3T0FDNU5Hb21LVG1GdDFiRXZLT0puK2VIdFhtTiszbTVGZzQ3R1lEQWY0?=
 =?utf-8?B?Ryt1ZjhiRHJHdEhkamF0TXF1cVJkN0llSlRPVThvdEJ5bGZUcDJwNXhwSG9Z?=
 =?utf-8?B?TnoreHlpaWRUUTkyOCtQdzlSbHI5Nk5iY01MYWJmRG9TeWY5MkJ1d0czZnhm?=
 =?utf-8?B?c1lFQUF4TjdocURFdDBkVWMramVOQ25idUxLQjRTMGVNSC9jNjBrOHY0R1JW?=
 =?utf-8?B?YUxXekJvNUFiWklmOVhKYWlUMkduMTZQcUN1Y1FWb0RsSVdDMnpqVnp0WWx3?=
 =?utf-8?B?WkU5aTZ3bDVBSHVWSG9URWVjNWluajRPY2FMVFdsUnJWWk1nSzNGeERwS2hj?=
 =?utf-8?B?Tk1kMmxlekJ3eWUzMXh4TVM1ZFBWOGpKaENSaWNia0VUbkJPWlRMWHQrSnA4?=
 =?utf-8?B?eWJyZ25LdDBuRVRmUS9pRkpuQ0h6ak9DOWRMTGF6NEV3clhSc0VKYW56Nmt3?=
 =?utf-8?B?dXlDWUJKQnFBbms5ZDRkcFU2RlFBVnZ0aVV2NTdvRTJKVjJNTDdLNjhRaUp3?=
 =?utf-8?B?RlNYQklzZmt3K0VaTHlkTnFYMGtSaEJobmZoRk5Fc1d0VmtiY2ZsRWpRUFRR?=
 =?utf-8?B?VXZoVGZVWThscUhGMmpHYm5kSU1WZ1pLM2xROVg4MDMrZ0RyWFVjdkVDTHU3?=
 =?utf-8?B?VytUL003QmExbVN5S3hFRWZpYW5oeTkzbWxqRDhSV2swTzlFeXloS2EzQXBT?=
 =?utf-8?B?aEkvbHl0U3N3VWpybFJ6R2VtR2xjWXlIMk5XMUZHdkNlSEVFejlZaVJ0dnBZ?=
 =?utf-8?B?REt5VzV5TUE1M2E0S1dGQmFUSms2R3FBYkppbmFGaE5ONk0xNTl0ZFRCbnEz?=
 =?utf-8?B?RW1ETjhNK0VtcHJ3eXNpclA4LzBkVGhITURzQk00cTZlRWF1MTVJYTQ1ZVZ0?=
 =?utf-8?B?ZkxhN0tvV3FwOHN6Sy9JYzlTbjVqRjJWdkI1c3BHaVBRQ0wrOCtpdWNRUzZm?=
 =?utf-8?B?WDVpdXR0OEJlaE5BSy9iZFRvMnlycnBXYmQrT3VFSXBvNEJ0US9oSjYzVmVN?=
 =?utf-8?B?c2tpOWF2RlpiczVGbzZuQnJaUEVYaEh0eDRaS0J3Vk1waVdFUDNDL0JXODQx?=
 =?utf-8?B?c1h3STNWdFl1ZEVhaVRCamdqWXVJMkp5OTR0RXVQRGVkSnp0aE9UZFRhc1NP?=
 =?utf-8?B?YlJndlBnSzBqc2ZRcTF0dXJaQUQwV2lic1RWWUVKMm4yWVM1bDRlWmUxdnpR?=
 =?utf-8?B?QVZodU5GUzJORUxhaWF6Zm94dzFEMDRHS2ZkdU42ZE9TY1pZWDY5M2lJb2Rv?=
 =?utf-8?B?V2NIa2dKNzRYeDFyWFM0bFVwK2I0dXREMFlpNUZidmx4L0NrQjdubFpqNC9y?=
 =?utf-8?B?UlpTTjNWNW5QQVNKaTlSN1oyZnhXQ2VLNWFkUDd2QXFtcmwyVU5OVjk3T1g4?=
 =?utf-8?B?ZEtxMERIUllVaXVZeXlVWkl5K3ZJWlpjTS95RHVGd0FpbGdTM0EzU3NlWElr?=
 =?utf-8?B?c1l3NkMzWkQ4NFk5RTlDeGRySm9VRUJPYVU1WXlGRTVuOE1Pd3NXT2ZVZmJW?=
 =?utf-8?B?SXRFSkp4Tmx2WC9PR0QrYkJTUGRhYTZpRWI1RXBHSXBuQ1RXMFJVSFdlckJv?=
 =?utf-8?Q?4uCP+ZR7TwmWxdLxNPzSEsH+M?=
Content-ID: <00CF326C450B444E8243A5E9191C04C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2870178d-adc5-4e1a-06a3-08da898ccf86
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 07:05:09.5971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gO/Kj1/RwbUT3HrKd3capP3LJOLtDmYfuGHmE7B5WF0obHGLSkCG2SnaforLorIaw9cMl9nqLLl7s5sgOQivELJozJkhyVXAhYHeay4h8QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2363
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_000520_361169_2FA16A82 
X-CRM114-Status: GOOD (  24.73  )
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

Hey Zong,

On 29/08/2022 07:22, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Since composible cache may be L3 cache if pL2 cache exists, we should use
> its original name composible cache to prevent confusion.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>   drivers/soc/sifive/Kconfig           |   7 +-
>   drivers/soc/sifive/Makefile          |   2 +-
>   drivers/soc/sifive/sifive_ccache.c   | 221 +++++++++++++++++++++++++
>   drivers/soc/sifive/sifive_l2_cache.c | 237 ---------------------------

Where did the 16 lines go? Could you please split renames off from any
other changes so that it is easier to see what has changed?

>   include/soc/sifive/sifive_ccache.h   |  16 ++
>   include/soc/sifive/sifive_l2_cache.h |  16 --
>   6 files changed, 242 insertions(+), 257 deletions(-)
>   create mode 100644 drivers/soc/sifive/sifive_ccache.c
>   delete mode 100644 drivers/soc/sifive/sifive_l2_cache.c
>   create mode 100644 include/soc/sifive/sifive_ccache.h
>   delete mode 100644 include/soc/sifive/sifive_l2_cache.h
> 
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index 58cf8c40d08d..3d65d2771f9a 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -2,9 +2,10 @@
> 
>   if SOC_SIFIVE
> 
> -config SIFIVE_L2
> -       bool "Sifive L2 Cache controller"
> +config SIFIVE_CCACHE
> +       bool "Sifive composable Cache controller"
> +       default y

Changing this to default on is not a rename of the file..
This should be in a different patch.

>          help
> -         Support for the L2 cache controller on SiFive platforms.
> +         Support for the composable cache controller on SiFive platforms.
> 
>   endif
> diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile
> index b5caff77938f..1f5dc339bf82 100644
> --- a/drivers/soc/sifive/Makefile
> +++ b/drivers/soc/sifive/Makefile
> @@ -1,3 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0
> 
> -obj-$(CONFIG_SIFIVE_L2)        += sifive_l2_cache.o
> +obj-$(CONFIG_SIFIVE_CCACHE)    += sifive_ccache.o
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> new file mode 100644
> index 000000000000..46ce33db7d30
> --- /dev/null
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SiFive composable cache controller Driver
> + *
> + * Copyright (C) 2018-2019 SiFive, Inc.
> + *
> + */
> +#include <linux/debugfs.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_address.h>
> +#include <linux/device.h>
> +#include <asm/cacheinfo.h>
> +#include <soc/sifive/sifive_ccache.h>
> +
> +#define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
> +#define SIFIVE_CCACHE_DIRECCFIX_HIGH 0x104
> +#define SIFIVE_CCACHE_DIRECCFIX_COUNT 0x108
> +
> +#define SIFIVE_CCACHE_DATECCFIX_LOW 0x140
> +#define SIFIVE_CCACHE_DATECCFIX_HIGH 0x144
> +#define SIFIVE_CCACHE_DATECCFIX_COUNT 0x148
> +
> +#define SIFIVE_CCACHE_DATECCFAIL_LOW 0x160
> +#define SIFIVE_CCACHE_DATECCFAIL_HIGH 0x164
> +#define SIFIVE_CCACHE_DATECCFAIL_COUNT 0x168
> +
> +#define SIFIVE_CCACHE_CONFIG 0x00
> +#define SIFIVE_CCACHE_WAYENABLE 0x08
> +#define SIFIVE_CCACHE_ECCINJECTERR 0x40

 From what I can see, you've also changed these around too?
Please generate the patch's diff so that the rename is detected & the
diff shows only what changed in the file. The -M option is what you
are looking for.

I have a couple other comments to make about what's changed here other,
thatn the rename but I will do so against a v2 where the diff is usable.

Thanks,
Conor.

> +
> +#define SIFIVE_CCACHE_MAX_ECCINTR 3
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
