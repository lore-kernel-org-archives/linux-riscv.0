Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63145C04A95
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI9pJ3BdspscXclLalCe6Q9IOFPa4t8YLfqyjn0KDUc=; b=Rz8Yp1mG/dlo8q
	aorejqkVw9WtvKeBFwRcBin5Io1Bn3rsDGF4Aolm90DYec8g+YKvphiOxFaYNyqQSzIOuQoto9wV2
	k5LpcsU0whKyGkJwXZ6X7a/i8GO3A03KDQgSJKSjwmwGHhXpmOdNMLz83oo6lXLof05mkus5kD1+x
	n4n5U3aM6+XWImVgP6z+LeZJ7tXTo+3MrW5d48kGsjBrh9SHY4PXCwglPgSlIG6DtOZScexfaaFyv
	NzIGL9qArwsq3lNnWVkHk6+WkCe74FTut2gNoRQ+harwdOsRZwrOX8dfE1xi9rVaDNJh5v7Qs8/+U
	rbG35HImfRnOSVU0+0Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odX5C-00GTdP-SQ; Wed, 28 Sep 2022 13:26:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odX59-00GTcS-Qx
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 13:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664371595; x=1695907595;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HRCwhwzAWAbEC9zkFNV2i0S74jQbZkwtaAdgqCTX8fM=;
  b=mKGjagbmgkQREjx3S8pelYIRfZpImfgSjPswhvHCECg2pxYkIeqYPUkP
   bcRgYiur0dH3KW1pkfurCNY50o8uE0efKmCzmKYVEYy4Z52fIgQVDJi6N
   q0U0IFa2apx+pW4c/8FVXQqt8BLijk5eqK2QTIpjcI8v7Vkwx8vXCFr9B
   b+/pjFisW6nbGCh+SxvEkzavglLHHhkxr1tB3BcDN3UVx5798kuqA8WCW
   EM+rfNfwU7mQeIyDXlPQcMJtc3dHMPBB+xKX2WiCvzjlKQ4migbRRBaPN
   f4zbnTDFNJ3pN2zBCe6lMB7auUcle+vinDp90+15QF57Zt1W3QVTxtxx1
   w==;
X-IronPort-AV: E=Sophos;i="5.93,352,1654585200"; 
   d="scan'208";a="182439282"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Sep 2022 06:26:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 28 Sep 2022 06:26:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 28 Sep 2022 06:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNNVzD5YtWHcz/mWIwnSNfOJQBFU0OPl12ie2xdaed6Y0tTXj+UU62Uds657z1xehb1HBskZ5csi62W9g/glNWJzayb7+mAMm8j9HZWWHm4Nv/4am23pLC0zGk38Vpvmb2LJq1O+DWC0xas3aMYauRQ4CF2stPwpnTkgojE4hsqI4PUVmR527K6bNFguOGyOsFHGwBj+NwerjgrCsbKiNUzKmkN5BgDAELIBhL97Vuepaka9Z9Ztgn+zbITH48nwwfgRSPlcCgIaxx6ZXoZrc07rCN7YHk1CDuXUdLD9cpibY9bJulfBUiVvOE7pymKciVNahGpX6cH/uFepvHy51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRCwhwzAWAbEC9zkFNV2i0S74jQbZkwtaAdgqCTX8fM=;
 b=Q/M8TT2u8qRzKQrfcEpWqWiOcbu8eJ1cCJpZxr46yVBL156dvFBmSx4I6od3F5f85IuJFNdSV+RIMj2EqUYMjrgrwnVjSlHPrnotE7i2LZctluAoZ5+BwNZ+y8NZpbqNekED1nJATyeLxYEuivJ9jAk3G/cLVcWCIEw47oncmDzAmH8JDTX6v40wjGmjHT9iG8I2A5JiBpy5UpLE4cqvpXDz/Er2LgHwiBIM14X843mT69hM2N9e8js6jROhsmT6VcQjvxc5MLM9qSJo+rxr0ll3fWc0BuTLiWGNYWdYGaZU1lfO6PfTwUHOLK0CCn7FCQSP4XXmevCdPBHP1bPVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRCwhwzAWAbEC9zkFNV2i0S74jQbZkwtaAdgqCTX8fM=;
 b=ToSMciOrOGZ49JrkviS6c/qO1eE62J7hnRLJ/guSFKjgWzJ30zlAM2RwsYHOo4m/IShroyVSGO8IMwh7V8D6Jx6D2QFJtpRl0rqvdjvbWZFCSJHCcBAQ8VbI3hd+MWhlLjFEXDpYKiNdWMyfIKclaytKobigrteZf5ijSltKw/M=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Wed, 28 Sep
 2022 13:26:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::68c0:270e:246d:618a]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::68c0:270e:246d:618a%3]) with mapi id 15.20.5676.017; Wed, 28 Sep 2022
 13:26:30 +0000
From: <Conor.Dooley@microchip.com>
To: <dmitry.kasatkin@huawei.com>
CC: <cl-cheri-discuss@lists.cam.ac.uk>, <linux-riscv@lists.infradead.org>,
	<cl-cheribsd-discuss@lists.cam.ac.uk>, <wang.kui1@huawei.com>,
	<julian.horsch@aisec.fraunhofer.de>, <lukas.auer@aisec.fraunhofer.de>,
	<vincent.ahlrichs@aisec.fraunhofer.de>
Subject: Re: RISC-V CHERI port
Thread-Topic: RISC-V CHERI port
Thread-Index: AQHY0xj5issePbSyp0Kh6CV3gQk2w630zmSAgAABdICAAAW1gA==
Date: Wed, 28 Sep 2022 13:26:30 +0000
Message-ID: <8c4c6877-0b23-29fa-73e3-f81ec90a145d@microchip.com>
References: <1c0ba05578f1487980b071da1377fb3f@huawei.com>
 <YzRFcaNFZ7LPzrLH@wendy> <a75136c743c044cfb6d04ec221fb6753@huawei.com>
In-Reply-To: <a75136c743c044cfb6d04ec221fb6753@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SJ0PR11MB6790:EE_
x-ms-office365-filtering-correlation-id: d7e1a4cc-08f2-4c7f-6bd9-08daa1550e09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TzUlNlj1X91YUOi2y6bFalTkRDM4KJlu4eiHJ4ON0aW5UyvPym66GCSUC0QP8GNmRGSa10yRqrZ2nDgGQdByq/xTZFGBOVU2XE/r5wwO9i6L+ejssPKPxXURiunhPC0c91Yoez/C6QOSirRpJD0ovSxacKBnkUxs4IXOFNAe06umBbQ6KdM6tr3H6LHAD7CbvMRqQIXzmE9t9ixecGouks6Yu+qhiD+Z1ul3pS4fZ8qCl6NAB/K56AmIWX7QMcTB4UD5cfcCTkYfYk7NIfUQwPUzQf+9hYjKd7LoDFABx4qYT2u+xidWX3rE2DtyI3xqYBnOV1ak+kapXxksjzi9V58WqzH/H4GtOS9l/eLUD+8h7y1HGwXRTkwyNtNQ44KJeYCjRqg9Ebkv7vNCz/C6l1XGII/jJMPBQhor3J5dR8czkN1GQoJBGa/TsLMjxI30xkFnKxCRa5kCWTXs8eWbLRqgGU2ppbrxhLAnGTJrE95ZOB44nABVaXaMwR3mSUHjaqfi7+JnT571AAnG9TGEkAMGSmL8kik2dsU/K5x2AgXFAqSOW324m6ZzsIutWmjXY9baDqq12Xlj5+Py757Utw9t+SgCRQwowItFX3/ld6M4t9k3AdWKxKfTut6mULFytnZKPfA4QfAmLInRUzg8Wg/vI5H59bMwgFkfFBnT5QEs4kMLnt3zC/k3XOnobtP1BfUqARBDzi40IpnSnMHa6ip3Alce895W8Fk2Hrf27hjvYnNQrMnArQWYytM8oyLCyDZ0rrKWkRnhfr7rGaQGkesHtTEzt0d/dbamj692Az1pkHuByczBeGpLTW5CIIumK1tG2RwbfpKdcgIIy6h/EbyjRzxFk8RgiNz997Z8Tpw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199015)(8936002)(38070700005)(31696002)(2906002)(86362001)(71200400001)(41300700001)(26005)(122000001)(6512007)(186003)(966005)(6916009)(2616005)(53546011)(91956017)(6486002)(478600001)(6506007)(4326008)(76116006)(66946007)(64756008)(316002)(66476007)(8676002)(66446008)(38100700002)(66556008)(54906003)(5660300002)(3480700007)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjdCck1HY21qY2NNck1BeVZnSDNtUm9kcUtpc1pTRGIzemdxMWpZSTJ5aEdj?=
 =?utf-8?B?UGd5aFpodmNIZXBVL0lQWkppOWNBOG9VbTlWZnFKUDhDVHhQWTFtTVRMY205?=
 =?utf-8?B?bHRiZmFFY1NpWXhvZk52c3RnQmpLUEdXNTBXb1dobnIzVG51cWFVSXduQStu?=
 =?utf-8?B?V2ViS01sdXFvRjdTc2tVczJmM1p4emVRYjljU3RnYXVxOFIvcCs5TjNIamx2?=
 =?utf-8?B?eVNLRlo5ekZjUGlkc2JPeGJHVjExTlZxNHlaL3hrYVlES0RueE9JR1FHaHQ5?=
 =?utf-8?B?MlUwREtkR0pyY3JMRDdYQnJ5OW94T1E2dFNQZk1FbmJUK0lNRFYzRVhvMFNK?=
 =?utf-8?B?enZEdXZHWmlpR3dJdSt5dXR4VERUaHA3bXZ0NnFqS0c0aE0rQ0N0cmpRdXVU?=
 =?utf-8?B?d0p3eXdJWVpQYW5vUzFZVG43TEJJMXZVTmJlSjdkRnJ6SURJQmc3cUxIVjNY?=
 =?utf-8?B?eDdGTlcySm9QUXlkcFlQSlBYcEdzY2JwaTcyM2xnbkZWSU9mWUVGdXZaZWRC?=
 =?utf-8?B?c2gwaVVsUDNZb1I4VXJqNGpTVEVJLzh2Wk9QMDhQR0UrTlBnUk1XaUxVZzNl?=
 =?utf-8?B?NlplcFR3YksvYUd2Q0k4WGRhT0ZVNFFYS3dzV1o5WldXNXV5RldUN1o0SjJT?=
 =?utf-8?B?MXRIbWxFdUNKNlhtQTNPL0ZrcGcwcWdVSlpCbkIxY3RJZ1phV2haejdBcmVJ?=
 =?utf-8?B?Und6K0FPeU03dWR5cFltbFMyR2dTKzZtM0FzOFgzMmpURmgxQXFDMUtXOFl1?=
 =?utf-8?B?c2tmRENVbzBPT3c0YThkZWdqcUluRDc3d1NpOTNLa3R2Qzgvdkhzazd3Zm5P?=
 =?utf-8?B?ZFB6S01NWUt1cUpJRnppZEllSURROC81TUpYcm5BNE5zWEx5T05vOVhJVDZi?=
 =?utf-8?B?VUN5MWdRUTVhdzB4L215NzZaQzVIUnlaV09WUVV2YmNaUGJBU2JRNS9OelFS?=
 =?utf-8?B?WU1hbW5SbkRHRUNwMGF6RTcxYThSd2Q0d1ZuR3JaeFNwUDdxTlpuSTdYSk5s?=
 =?utf-8?B?M0RrM3lKaXp4bVk0TEx5YjUvUUhiTlV1UUVWWDAyZEZodUdkQlVnSklOeUtI?=
 =?utf-8?B?bFhiQXNmUmgxSFFJUWVYQU5OR1NHcXFldTlkZHBLdFJGZi9wZ0NpVjd0Tzhs?=
 =?utf-8?B?bGVYR1BQMGNVcWdteHpUc2o1NFFlRERJUXVqQ1ZvUllRMzJxR2hTMEhVSHpn?=
 =?utf-8?B?ZFlveW1LcVkwZE52UC80ajdtVmEvU1VGUEVjbkpoQU5XbWtDN3hRYmJ3VVFv?=
 =?utf-8?B?L0FScFE0cEJLQ2JEczNPalFEdlg4clR3MXZkZkVDNld5amNqNmpFa1VhcjE1?=
 =?utf-8?B?VjlmQXNxSXVvcEpoOEt6ZVhIZjcxTVRVL2JoSEFKS211UFFGTFBLRkN1WjY4?=
 =?utf-8?B?QTZoY2V5VDZzQzhiZU1TazhreDNZV2NtcXE0VVFJZXJyVjBrS1pJNVl1RU9N?=
 =?utf-8?B?UDBHTFhlSkRtQnB1R0ZLRlowdEJTaDJxOUpnSDRtWTBxU29hNTViQnNVQ3FY?=
 =?utf-8?B?ZTl3SUoxKys0WVJrV2k2bUNlL0xlWUFOZk1iMEhEbnkzNko3cmJOUTNrRzJl?=
 =?utf-8?B?TWJQK1JRYjNEMGxJTHl4ZDdrTW0rNkZTMzk3Uk05TVlGNit0N055SGo1MkVG?=
 =?utf-8?B?SS9UcEVZVEVLa3EvNDJWY1VrQzcxbi90bGFDSjYrd2RZL0xKaXRqcGFEOXAr?=
 =?utf-8?B?VlhONE5tbHh6R040SzBXTmNraUpzZzFUbVhwajZBOUNJRDE2ZXQ3OWU4S3hQ?=
 =?utf-8?B?L2grV1JEQ3p1RzVFRmRqZ21JdkFBQVgxUjBzSXoxaCtZRjFNL2pMNTVROFF0?=
 =?utf-8?B?Z0g0MjVTMmJaL0NJanBFZUZod0NrQjBha3pseFR5OE51RS9IbmxFSERHdGpw?=
 =?utf-8?B?bGFCUUJJR3crUE4rOWZjbVFCUWhqWlZCK1NXcDQ3Q1ZZOExwb0lVa1E2dVU0?=
 =?utf-8?B?RW8xM1JEbkUvWllDTjdVMzdVL1QzQUpwTEk0N1FsYzNPNWtEQnhQdkdrbVBM?=
 =?utf-8?B?clcwaGxiL2MyNEpoL2VNNS85UnptaGFUellNcGJjd29TWndZVTlhQXpwcUdU?=
 =?utf-8?B?V1I0ZHhjak1PQ3BxTUh0MUc5cWZYc1hLUEhNdE1xYjJlNm1Qci9saEg4T2o5?=
 =?utf-8?Q?XDQ4ZVJ3qVY6J8uIAB+Vo5Twx?=
Content-ID: <1E1AAEE99CEBEC48B9CE5D4E076C9E71@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e1a4cc-08f2-4c7f-6bd9-08daa1550e09
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2022 13:26:30.5512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1agUnVMeLFLxZTkaEiJMemtvKLdfkezOjmYFYrRw12bmmO3pyj7wl+45zbRj+yvdLOhoDIc24cSJJQIy9jaBLmdLTyGDONrPpKbyt5ncVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_062636_103042_0F82362A 
X-CRM114-Status: GOOD (  17.23  )
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

On 28/09/2022 14:05, Dmitry Kasatkin wrote:
>  You don't often get email from dmitry.kasatkin@huawei.com. Learn why
> this is important <https://aka.ms/LearnAboutSenderIdentification> 
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> Sorry about that unfinished email... I sent full version...

Heh, no worries. Just FYI this mail will have been rejected by the
lists for being HTML, so mainly replying to propagate the reply.

See you've sent a new mail already :)

> 
> 
> 
> ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>
> 
*From:* Conor Dooley <conor.dooley@microchip.com>
> *Sent:* Wednesday, September 28, 2022 4:00 PM *To:* Dmitry Kasatkin 
> *Cc:* cl-cheri-discuss@lists.cam.ac.uk;
> linux-riscv@lists.infradead.org; cl-cheribsd-discuss@lists.cam.ac.uk;
> Wang Kui; Jan Erik Ekberg; Horsch, Julian; Auer, Lukas; Ahlrichs,
> Vincent; linux-kernel@vger.kernel.org *Subject:* Re: RISC-V CHERI
> port On Wed, Sep 28, 2022 at 12:54:40PM +0000, Dmitry Kasatkin
> wrote:
>> Hi,
>> 
>> I would like to inform here that our Cheri Linux for RISC-V work
>> has been open sourced.
> 
> That sounds great - but unfortunately I do not know what "Cheri
> Linux" is or what the "RISC-V work" entails. Do you maybe have some
> links to relevant material that you can share or a brief explanation
> of the benefits?
> 
> I can only assume it is this? https://github.com/cheri-linux/linux
> <https://github.com/cheri-linux/linux>
> 
> Is it something you intend upstreaming?
> 
> Thanks, Conor.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
