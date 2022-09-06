Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AADC38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWJuzLBA/sbdxgj80GxMeHwAhPGgXWfP6d3SaJyN+rI=; b=sxyqbN76MiIMBH
	eeveYreCLonNw783aAD1LfeK7wA6Puc6YOVDpnTYHmsdTYWFk0BkoC6VjizHCXFG+oaq2kXPetfN5
	Dc4eqSTDMoe6NS/6VFklSG8TeuHG+KdNXuaKrLPMOvNQdzN2l5nPY0eBi08r02X7ODPEd2JWg3/mF
	KklZk66ateMY6MDR/+3SxLmdQ/HfWCD/DHHHsEo3GJvqVsQMlyqqoKi/Q+rnZzofmBsS/OfJttdBn
	r2o1lL3mLl8PaMxFII3mQQltjFOv1F1L/kj/QC7Kn9pk09u9emi65aD9FhWRWo+7KLj+Hb6gvuK2y
	g2iBmyFc+6jzZM530Dbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUAS-00BONE-Ie; Tue, 06 Sep 2022 08:42:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU8K-00BMWc-I8; Tue, 06 Sep 2022 08:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662453636; x=1693989636;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Dz4cPZ5WreIsd6pctMpK3vXgL6hbpqs//41sbn5OV3U=;
  b=wmCvSf9WONTz5lkQs7xXp18ZzGjFWj78QMxftJUdx6zOV53h52d8zpkJ
   EiQ46hZTaX1bkOILR9z8w/w3GjnS0Dse1bugWsVFI/iyA3KPWPpRWVm52
   elbXmoiXzC45F446+G5T0M4u5FydHDFH3pBHoN0dQ1q6jdT1Z4o+mjSzy
   mv67ZYDOjgfEB7pZcAGYNvUwYMj/dcnrSICrrfQtKtO6SGzWohSsb4oWT
   DZn/bX2dalmQClOIx703K0RO4x8KsWz9Du7AU2Tm6gQM+s5DApHMG1Vsp
   vxidKfBO/F8SA0LpSZqwmQGRbjPY8yUjyuMV0BNbmT9aw+H819WjdZ/6J
   w==;
X-IronPort-AV: E=Sophos;i="5.93,293,1654585200"; 
   d="scan'208";a="175778194"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 01:40:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 01:40:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 6 Sep 2022 01:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOZV9WZO4l1ISg+3Hfn3ftDydK7mqylhVKZE8doLhL4QVR1qHot5d5pCLooP6/KEIZ8wvFWboJQRGOdwNUK3TYBHzNpyYrOp9mSjbMnyJl2Q3eC4HPc2QOewZiPbwuRVJ8kFsdHfKhkI6NkvgDi7P6S8XhbaIO2FJhVIxmrB+PEQgbpbKSXbPm6yknkGLCVygRw7wGSPJvX+Qei6VL7eXl/rNF2leOHrpAbYzenVgbfCReIk8ghm6WvUG468RC0DdxyacntknAI2AfS/ulRxc4O9iMXwfgESu69FsXUZpkrsCNWUJSXmKrb0A9+OgUdcahDZu9sgHUXO7SJcaGt8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz4cPZ5WreIsd6pctMpK3vXgL6hbpqs//41sbn5OV3U=;
 b=nmGRcrZMIKzVl8s99PVQhP/Xx1SMK7cc//XlUY0YjU/K7drU8GdirKMgRwzVN5UDwiQCgVMTvINBGyAzrfaUq4cx8egTmY+UA/TicwqKDmgN8dGXLDf7i4fkURPyrOLCFawqEAG3uQnWiWrkKtXnogYoD/jw26YaJg6z0Lh+JMyJsa7Q1+m/FiwC5vq33dvSSicaREjhGqk/cXsI3pfQR1PRSGKOiyursQAUgpoIxbFwOafIFF6CjIA10SZWfQB8G98OVg+gKzIg3rSx4OhZU4zhJqhTFIaVyKOe6fWyC0MEYIMZCrgeglCKrKSnApCK9cKbxz8GSmJF1yKRCNo+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz4cPZ5WreIsd6pctMpK3vXgL6hbpqs//41sbn5OV3U=;
 b=cf1w+ytpyQD2cyGUOweODeQbDWxdNvccgLL995fTTFaCx02XibtPveZPiir35r+yPsgwyGxON0+iOzDPGQ4Op24mhkUq25dt8rdWn5lrnNf+nX/6Ext7feyTrSS7LWj4I1BuGQYBG+4wEG7ORSUcinlXgWk2b5XhAnusatfEkfM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Tue, 6 Sep
 2022 08:40:23 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 08:40:23 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
CC: <palmer@dabbelt.com>, <heiko@sntech.de>, <anup@brainfault.org>,
	<atishp@atishpatra.org>
Subject: Re: [PATCH 1/3] RISC-V: Output cbom-block-size
Thread-Topic: [PATCH 1/3] RISC-V: Output cbom-block-size
Thread-Index: AQHYwcvExmNBI2asc02J8FECeoGTKq3SFO6A
Date: Tue, 6 Sep 2022 08:40:23 +0000
Message-ID: <3da2f5bd-104d-4562-3748-847b2d1c8166@microchip.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
 <20220906083555.931806-2-ajones@ventanamicro.com>
In-Reply-To: <20220906083555.931806-2-ajones@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab8eab00-a73e-408f-8ed8-08da8fe3708a
x-ms-traffictypediagnostic: BYAPR11MB3671:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pWKaXIaypfXWIdXddHvxRqsWdu55YmiuEH8ln3JN6YUVLlkGlHw1+gw6mm1HmfHwv5JgQdqrEYEn1ZPpeBDPA5z5bHF5Y+hI4LBk44aAJapRjXvTZtY8d0KwjA/QI/GHAmrHlInqypHFc/T66jednQiK51o8IxgLlTe8/kaIAX4o/ERc3alOjSj0MD27GkDl+QERs6wKlEpakol5t32ncJDUbI7+XhelN7sdt04XyU73Y4/rNwcinGltR6hND8Fg7mMx0ukiXg8BtN3gQji7CNrdHVx6N4fyZPc9xGZPfuoyWQFdI0JPK2mH4vxszz3VghAN933ilW+hQWEJ9luPMTyzhI4G2xSQUXKj6CqhsdUAm+d6Oljuv35Tkai1kusWNMafmUy/V+6OjQeWhOoNXvRqJjlwrf4W6RhrP/FIh4NzThufuR9QDl6Soru9+PJrTOtY2NvRED4kyfrHtjbe2aMZLGhjbK8tAOvVfE9v6ELYSIPv8zYGqCzDViWcDDp7V6a3iha9LIiOKMq2sjhxYaQh0kDM/rEaqHkdaZuVMT+3V68u6XbJiv4XGHZ2mB7kUeqO8QyRXErI2q2LiTmahJMlxyZr+/styGD6ddLg1vljtru7FM8krrTB0J0RDjf9V0+Dormfb3eLwwxR/y5aIZUuBB5MrmnZKHzZ1thohoY2wl4AF/DxFf9JzLwKST8B9QzA6OZ655nFn4XIhbP9MX3fgqvx3Ik6pd+btfo9jvIxpCrOVGU4v5lW4ifKD1Lc55iZr9dOuGaI1gnngwok1HBtkQdQyuQEJdj+6z/9k2GJvCTw+yWdtmMA5Bn8B913pZz5OL6o/J+lTYUA4wMjRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(39860400002)(366004)(346002)(136003)(53546011)(6512007)(83380400001)(6506007)(26005)(4744005)(86362001)(66446008)(41300700001)(8936002)(478600001)(66476007)(71200400001)(4326008)(66556008)(66946007)(8676002)(36756003)(64756008)(91956017)(6486002)(5660300002)(76116006)(122000001)(2906002)(316002)(110136005)(2616005)(38070700005)(38100700002)(186003)(31686004)(54906003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWVicXV2dlpEbXdkTElQdjF1VlJsa2MvaU5LN1NvN1BrdmJ2T2VrK0hyWnR3?=
 =?utf-8?B?TlZjRDc4UG9nNHlOamRGNjBLTUovOGVTNWsybUxSNW1nQ1EyUTZYSnpZNVdG?=
 =?utf-8?B?bG5EZ0ZhaldaYkQ3bm1KdUdKbHdPcGVGOGdRSXNtN0EwSHlmb01KSDRVeHNP?=
 =?utf-8?B?eDR0S3VzczdQdkhhcHM3OUlJcHNudTJvUHNKRjBjYUxQMjJOVVNWeWczS3Ba?=
 =?utf-8?B?Y0c3YlM5M0F3NmR0OXNSZGZWZnhWaDlnTmExWS9VWEdQbnAyS1U5b0wwTS8v?=
 =?utf-8?B?a2w0eGNPWm5lMHN4WTRweThnekRJSFcvbGVJZG9PWVhJS2E4QytBNzNmMSs0?=
 =?utf-8?B?dnllK0lOeC9pUFI1ZjgySmFTS0NHUHhmRFBVSU1QWHVLemxxZ2pTSmxYZ0Jz?=
 =?utf-8?B?N1pwbDQ2dTFjNVN5QlVRMUlnejZsSTlpbG5aQkRhTElUNEpOazgzZlVmU2RG?=
 =?utf-8?B?QkVDbTNWNGZ2cFhTYjJlZFJCczBtUFNULzk2UnF4YitqTWlnWVlhaTVwaGsz?=
 =?utf-8?B?czRLL1NDVkpYTkp6bTNVV1NjaTRRSVJGcHViU2lhUlpkTklTOHBWUXpuZm9j?=
 =?utf-8?B?bTdxcURIdUNqaWY2MDFTSWlqSTM4SkhvUkhXU2dSb1RiS3Y4SHd0NnNUMDNr?=
 =?utf-8?B?TEFMWTY3Nm1WOFJWbTJ3dUhUR2NVUEhOZFd4bnU0YWpxWnBxQzdVaEM5YnB3?=
 =?utf-8?B?QTYxMmtLWXJhS29UcWoxQjA5U1ZhV3phUUNzTjNtWXBOSWJleWU1NjkvK3R0?=
 =?utf-8?B?N0Rla216aGlmazBGaTA5Szd1b1ZjRUdLRDA4b2E0L2VOZkdJaUhJMDdrSWlG?=
 =?utf-8?B?aCtsQ1RjSXREenhlTkliNFFLN1Z1Q2VOZDJmUHdySEpVTGNXNjlxMXAzUi9z?=
 =?utf-8?B?VFUyMGFBU2VVUGIwc01FTkZvUklRSXo1NkxyUWlOMG52ajlrWEhYbGxHOWQ0?=
 =?utf-8?B?V3JpSklnanlCVTZkNFRnODE0VEI3ckxLREc4aVVDc0tscmVlanhTMW9DTFNx?=
 =?utf-8?B?WkZUdDBZTjlTZ2k0KzJRaDE3SGE3K0xEYlJudUlXOUZiSm5Rd3hnSWx5STRM?=
 =?utf-8?B?cWJLYmNBd2U5TGQ4S0lYcHBKQ3F2MHVMcm1hNWcyL250ZE41OFhqeEwvYlhW?=
 =?utf-8?B?TDB2WkY3YkxhNFMxMFdWblY2Zm80TGZXbE9nNGUwYVg5Y0VpL3NpRUNDRWhF?=
 =?utf-8?B?QVRzMWdWdDBrMVFPOUNka2pWelRKcTJPSDhBVVBWdzgwWW04ZWFBeC9ERmlX?=
 =?utf-8?B?cUFmNTJuM2swM3JsR0ZFSjJESkUyOGdzQVhXMGJ1Vml6emVaTUIzNm1qaGl5?=
 =?utf-8?B?MjVNOEhUNmVETlg1RnZqRTFCdzZ5YXhPL2VZYXIxU0Rqd3JoT01rb1lyZjNs?=
 =?utf-8?B?RUk5R1Y0VHZ6SDFUekYrTkk2WWVxeVEvTGt3Unk5UHhjenhVQlFhb0daVlFh?=
 =?utf-8?B?MGgwTFNWOUpmNFEvM0cxelV5SU9hcjNNMjVuRmE1V004bGFnZjRCR0NCK1lF?=
 =?utf-8?B?cFZ3WGFEZ0ZhOUVhVHlMdUh5NWtBMGRxbm9Da1BzUjRkOGoyVFAvWjVMTFpB?=
 =?utf-8?B?V2FvK3YwVlVObVNpd3E2V2VpWWFIUWdHTklKcExBLzFkSkdKaE1IZ1RGUDVB?=
 =?utf-8?B?WnNWeElHaWl0VkZzcjNwTmF2ZFFJV3IzdkdZNEZFYjBQYlJWU1F1YXdyblM3?=
 =?utf-8?B?Zk53SkxYaUpwS3MrZHErS0FidkZBa21NOU9ocTNWaXZOdjV3QXplTThHa3dt?=
 =?utf-8?B?c2xpbXZrUXhLZUsvSlFMM0NJZmRMS1NZR3laSytCV0VETFVEY3ZXUk94UWRp?=
 =?utf-8?B?V28xSTc0T1E4N3BmQzNKYmNiWVM5RlEvS0NRSzh6a0lpL1Baa1Vydk5BL0t5?=
 =?utf-8?B?bjd5ekdibWIvTFg3NEF6Vzlpa3NJV213eThnRnBYV2dCNTl3Q0ZQTWdXN29u?=
 =?utf-8?B?bzRtamdCZkhDZzd4SmFYRlA5Q2dYSU5DYnpIa3FjTzFWTWt2SGFaajJPc0JI?=
 =?utf-8?B?Y01zeVZGejhNWkdZa1k3UGx1RUlKMmR5OHZlbmplU2N4bUNIeG45ZHRVazZm?=
 =?utf-8?B?WW5NL1BIaVpEMGdzSW95dzhXYllOQTZYbjczei9BWVpaK1d5cC9zY0IwTlZq?=
 =?utf-8?Q?97+J/kLV3qALdZkXi0sfkN3HI?=
Content-ID: <5F82898DF00E8D4984010BA812371FBC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab8eab00-a73e-408f-8ed8-08da8fe3708a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 08:40:23.4667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7hTEG/CD9+254ehTeOsVNsKbneu9liV4Z7iLHM6yPaoVWjfj17YA0gXuKuKEP1FJ8pKNe7EcUeuPlsu8/GGHeL3GTlWckJyJgt+PJ+LIj8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3671
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_014036_955015_0C616F51 
X-CRM114-Status: GOOD (  16.99  )
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

On 06/09/2022 09:35, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Provide an info message with the block size when the Zicbom extension is
> present and the block size has been determined.

Why might someone care about this?

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>   arch/riscv/mm/cacheflush.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index e5b087be1577..8595baf8e403 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
>                  }
>          }
> 
> -       if (probed_block_size)
> +       if (probed_block_size) {
>                  riscv_cbom_block_size = probed_block_size;
> +               pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
> +       }
>   }
>   #endif
> --
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
