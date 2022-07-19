Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588DBC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xU/Vi4JObm5h6XFsJClbuGs6UOSV7GnHi+FrQEkoGc=; b=kDHCwmROMx4alV
	TUB1zLY3BjhaLGVXw+tNOCxfZ3qChw6jWalVJnDu6SDrdtfBNA9UPzsmUXl4rGBAsIXrwN/bZ3v7b
	fi9ewWIJvCpFIo+Tl9rmDj6PoC+hcetS8wFgsWTNUn03Q6yVd/wx2t/zDl5zNf7tz/Ae/c0qtXDME
	kT2P2W816RGIUncvDa6c1866hgbopkjRahNyIocKa6oHTjWV0A7xIwMwB0NL/JzYeoFIX2r/olzdU
	a6UDlYXZkdcBhXRKLS2riv0hhjQvaVY7Sxkw8Z9iYubCkN2CkBXgS1fsRSQi01fwqaUjQZN1o2crh
	Iux9OSvXVqftzgFRIiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkTT-0080IZ-0q; Tue, 19 Jul 2022 10:29:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkTQ-0080Gq-I6
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 10:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658226544; x=1689762544;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rFLZ0+YUbtDhm4gZgBuynSCCQr95Sf5dNqTs1W02240=;
  b=DIj+WtJTXKCaRCReGGTNcQXIm6DHl3ki2Ko2JRuAUY0b7CD3yjn3x8PQ
   ng1D+THIAqhDc67WmSUoJB8ASYPVOpna7vWmmmNfiILjcnXk2uGE/5A/v
   EuvNZAlR985UVUm2OYJgy5ofsc+hlhgdYRbT/n325VygWcg2D3TYxjHCO
   iieY4fBi5MS+tMWQD1BpLSMldTUpEiRCjt+qwpkFmOXgSWEHmKU3LrYj7
   oif2Uyy0i90DsSty4SJFDqYSZeB7KjIoAamxUqsYLJUguCjdts9moHZ/f
   76AavPyNkXKwdho7QNxOkaEkNtfsGfm7SkxiRmQH99wqrV4k8bvNv5ZdO
   g==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="105109488"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 03:28:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 03:28:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Jul 2022 03:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvk3cNeHgjjmTIRh9Hg7hH9VnVYMusmTG2NC0bP/SCYaUSIDlnuKKfll4b7spu+XaW+eIhMI7UUvOXp8DN+Rey4JeY5PksvkyvOQ8iUHoi2PimWyhCFHodd4Ao4HM48hffEx5WCvvleOzhasN+goYjWiX9dWrT8kh4PXjFtLoJkYvxfOAtixcfQX9mPT3Vq68y7ApgL83Z95Gxql0SSC3/4+CO2Dk7OiOJtKCQxanWP81x2R8B7KHGHBPIEarCeC0/mLaZ1KssrWcy7DVbijRhXr9MiFhSb8svyzEFJ72IrOQreLzAaA4wWws29Uv4D3peUFP2xtHUNTGzxgSOa6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFLZ0+YUbtDhm4gZgBuynSCCQr95Sf5dNqTs1W02240=;
 b=PrWAH+qiD7RQRzulQ2CswaMPajEfIu8qdevxF036UGJLq68PrgQ46mx6jlbQ7p3hfhIk/ly8TtufI2h+MPIwzPWomOfxEd9Qz2VjHDRLO7aA1RZbbSnpqA1r3n8PjNVbskxedTI09MT/4ldPeTiaxu79lyw7qjnw5jUTeu1Dtyapgsp9eYt5t8Ha7VrxkLW6gDV7vdcHPiSuUS0FZAurcpAZo4lxotn3YFNv25xo5RjFjVTHKjpAXB23hwmsi/TYCbBukfWJeCm8r4DYWeMvBXiPDB1ebRadqTcagBsUSEWZk8qacMGnecGY7qRepK7emlGBOrWjtqQSBjod6LR9SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFLZ0+YUbtDhm4gZgBuynSCCQr95Sf5dNqTs1W02240=;
 b=j2n7eOuHKjFRy9tr2qGQ/fskyn0tWLXbHU7xGr8YFoVCvJLan+IDS6+6g3fD+UgiYLimUqCPzZ4trodPVqZWexGyrADYk+Y0TpZjEn7vLtnuoeQuQX4r5N+KlwRFaOFewskgMsQ8V/9tucGsmgYv7Nh4yiVTp8M/Rn/Uo+mJNvU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB4145.namprd11.prod.outlook.com (2603:10b6:405:7b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 10:28:19 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 10:28:18 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <emil.renner.berthing@canonical.com>
CC: <ben@decadent.org.uk>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
Thread-Topic: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
Thread-Index: AQHYl3QKKSCWWhX0s0WwUnXgqKZ/ra2CpM8AgAAPeACAAIcBAIACP7uAgAAHIQCAAAOQgA==
Date: Tue, 19 Jul 2022 10:28:18 +0000
Message-ID: <e896e651-89ef-6205-b2b5-ad9f4905f698@microchip.com>
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk>
 <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
 <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
 <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com>
 <CAJM55Z8Eq-iUBFb79HJpykgGOFD-QykNdOJ7Xvj2-azeFJehLA@mail.gmail.com>
 <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com>
In-Reply-To: <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d971cdc-7591-4782-dafe-08da697165f0
x-ms-traffictypediagnostic: BN6PR11MB4145:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OToRPJ8YT17wvBX5MtSiFLxWwLyErzY/3SczRORj71wpUYdeipQ/hAMtYj6XzVOqLPkP221vgsqxmg1kR804SZKe+MH4rMgR1DduJ4+QvWXXbS3ZjNf/Li39rT65xty+S9xiVZ3e3jgwDINX9XgWND/H1wkKTFaEkpPcLIuPuSz1c/cBVhv6R8zLg7IJsGag8h43lyugFc9SDedhUjp4AvbWz6SJOSBFTJF68bwSxSWb7Lnj83rPdh8yNdN7tGFyTwxToZ2X/hIVkUNxKWwyeCr1B+daaiaH1zfHiHqhB3Tnrm9x73ArM+XWq+FgkDWufAHj2q9bAIvKo7/3VJRQI1aTsOdGpp0dxECLLRMBFcwW3hGhnWgjs3mp+QUbdul6OvThtBKZR7b3WR2H5xU8458iUM+33/ubKTZn+TAPz0PBSgxQ3JXCwBxxUDJLSoWAy0HuhqFZlBiWoqb6Q9maMHkclhoFgNNwj+1/PV18IQBHAXZXUfRBxivmH2YUq5n4deY2gneqhUo04W5M9EZE6HPinfetThqDSaYN97z+BSMOwllvvrEaT5LcyPARmirz3XKxgbM4xOWCOLEPhDuHzvaYBWF2Bv0L/yooY9k8laMgBaX6q2QgbCokFqQZKQHk4UCopvotyMD3Jdp4spAm4JBJFINCXXE+pbZjkZFtNA+FCTGsdUTrfreB8Q6DD8ZAXRS0Yht7PBYQAL8czrpHVEbRCIOISY/XgyjgFUQhQh6D2G5Lo7kpvtPOlmCux6U2kJpwBo7MODOAZgrJYZPO74drxkysuSFALtrckCEyciMmFtK75qPor1xnOsAfergdRtCh5TKLdWwwaexlfnRETv8QscR6ZUZLLNwMFjxcUgd1sjz18OmzYY3wHzIUo+pMgvhYHjG9mawbWIekB3SIDv3W/GUhcN+7o8daUZnmS64=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(376002)(346002)(396003)(136003)(122000001)(36756003)(38100700002)(31686004)(86362001)(76116006)(91956017)(186003)(38070700005)(2616005)(31696002)(26005)(41300700001)(6512007)(478600001)(6506007)(110136005)(53546011)(6486002)(54906003)(64756008)(4744005)(8676002)(2906002)(5660300002)(71200400001)(8936002)(66476007)(4326008)(316002)(66556008)(66446008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0xwOTdjZnFHbk1NcXZJWEU4dEJUcTVZQ1M4U0IraUxZUjA1S3dGMjRxSU1n?=
 =?utf-8?B?d0JUQzdFUEdCSnJVM2dId1FSOVphbFVsUXluZ2xoK3RvMC8xMG5DdFVJRjhY?=
 =?utf-8?B?S2RnN0Q0bmxya0JiTmkxbXFId1NJVFo3VE1pakF2VUhDSjBzS045OGM1bnow?=
 =?utf-8?B?THhKbW5jWUxSNm1IZm8yWXk1SW1hNllRUzhTaytkVDA4YWRvd0draVgrZDRq?=
 =?utf-8?B?TnhmZjh0enpPQzRsQUR4VWltdTltNUVaRVNpN1FpWHh4K04yNWFoVE5hV3lC?=
 =?utf-8?B?bkVlL05vTVpLZDVBWlRpQzlTQnBKUWE1Zy9MeDVOVmNFTWdua0lXTFVNN2JH?=
 =?utf-8?B?dnQrTEdlUmdSUEh0RlVqcTVXNXJlcnpIOUtTT21iL2g2RDdKSjhuN3laNHFt?=
 =?utf-8?B?NjdIcVhPODd3QVFWRTUyclNhWDdJZzZHOGJ6bXlaZzg1Z1lRU3ltbWlhSmpP?=
 =?utf-8?B?KzMyaHRoTCsyUEdKUUhxSHE0eWhaZXhaYkJ4MkRFQ2dwY1RmQUk0Z0E4eHVv?=
 =?utf-8?B?aHZQUmtZNkNMaWtBRXBNNWJLQ2VtTVVpRCtvK0xtTE4rU3ZpS0tyRFJzYVF4?=
 =?utf-8?B?V3duenZLNi96R0x3Z3R1c0I0ajZDOFJuMnY3VlBlbGxMZVg2dVdLMEkxajcr?=
 =?utf-8?B?ekR2MW1JVXAyU1UwSzhkREhOQzNGU2VSWXBkY1AzZUF4MjZ0QVhyY1ZCb3Yv?=
 =?utf-8?B?VUlvcEVuOXpjQlRkcUU1Z2NQT0REUHFQYW9GZWRZcEttZEVSQWRMZENEaU5C?=
 =?utf-8?B?K09ZKzRRNG9UWXRWWmVWdzYveWk5VGhvNkVoU3UxSXVhK1ZZZVZhQzNZSFpG?=
 =?utf-8?B?aHRQVC9oeUZRVjJTWExzOVAwU2FvWDhWNU1ETzhXT003WVovZG91TDdlNW51?=
 =?utf-8?B?V212UnR2N01nMURERUhoNHhnL1VQekE0RWVneHlmWFB0bVB2dnI4Z0pOR01u?=
 =?utf-8?B?ODNmN1NBb0U2eWNQRlNpTmlCbUxaWTRFa0M0SEIxSUc5TmRoZFg0UUNqTGtj?=
 =?utf-8?B?dHkyaWk2ZkN5QmlqYWZkUkE4MGYxVm9uM0dwcktCeHhpVk5vVWJ5WjUyc0tM?=
 =?utf-8?B?MmZQV1EwRzM2VEdkaTlOdWs4SnBmdDdVc3Q5VzRIRXFMeFlDQVBPeXBHeEN5?=
 =?utf-8?B?TVZ3OUl2dk9SYXkvY1RWb1lEd0JnMjR1dGx5YlF3ZTREMHk2NjZPeHFMRS9N?=
 =?utf-8?B?YUxhMUhCTWZZNFNyUlp0Z0ZxV2lWM1JCK000LzRmeXZtOWI5Uk9vNEZua0Yw?=
 =?utf-8?B?UlZrbWJJMFlqdDNsZXUzWkQ0TFB6cVFYTXUwUWMxWmROZVdLZW5mdTdkampp?=
 =?utf-8?B?VnlDemF2c2VDU2xDbzVnR1hERjU4NFJQN2hHTTBxMUZGZGJaeFRPMkQ4Qzlm?=
 =?utf-8?B?QmNGeUR5WEY0RVhZdThRSkoyU1hHTWhJem5QaW83RVRZaW9HUEw0RjEzR1Nh?=
 =?utf-8?B?TnBmTzZkOWhUNExrNXZGZnRQNEZKMkN1eTZKdnUxdXBZT2EyS3pYSGpRcnJK?=
 =?utf-8?B?SUNDNVI1cElaZERQWXNHcEhYV01JUlZLM1VvWmZpOUZBdXNjOW9vc2o2a2p0?=
 =?utf-8?B?TWRiSTc5QlR0QmtxRVUyT1NqMHVZNkpPVzYvVitrTDQ2cXl3emUybC9QTGtR?=
 =?utf-8?B?em56YUxxUlF6NCtBRXRNMXM2cDNhdWl5TmZzVU4wNzI5ejRIZlpoZFFoUTVR?=
 =?utf-8?B?eitNS0lKS3RMWlhvSkQwelprS1M5dDVsWnkzSmR5K2hCRkQ2SGxOTmRQM3lR?=
 =?utf-8?B?c0Z3VnBtSHRZN3BxNW5EYUNDMmV0SmtvY1F1ZHNZT3FtbjZJNG16UlRManNV?=
 =?utf-8?B?YWdqVDRpd1N6QmZvc2NtWllSNlNaeFhXNkhxNDYwRWVaY05tZlFvK29QTjJD?=
 =?utf-8?B?UW5PKzhoOHVkUkVYb2s2Zk9EcDJOWGRaSldleEFBQmd6d3VMbzdxREU2UWUx?=
 =?utf-8?B?YjdMZ0NQODQ2UUFwNHBodk43V1hacEdzYnRKMmxmazdidkIwNXpxVXNXbVd2?=
 =?utf-8?B?OVhYOGZNTmxOYndxSnpGbncwdlQzMXRZWTZZbDdzd1kxUDFIM1hsTHN5MFpl?=
 =?utf-8?B?VWhvTkt5am9hd3kwS1BDdnhXQWV3Y21kMDVpR1F1YiszODFGWXJIdHVpLzMx?=
 =?utf-8?Q?ICth8ZvdbOSirzaPWqlZiDCTd?=
Content-ID: <D3B8FF5E716EC44199F4EBB1E5603C6C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d971cdc-7591-4782-dafe-08da697165f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 10:28:18.8221
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q/cUwJijBafQIcUm23+ht17CeHhuzP31ccrzOsXMYj1UN50e1DyE46ivRCjsb2aBeStKdU5uz6VogaldNmmjeLiRhqV1JUwji89zOqXTrds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_032904_683682_430879FE 
X-CRM114-Status: GOOD (  11.99  )
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

On 19/07/2022 11:15, Guo Ren wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Sorry, I missed your patch. You are the first person to catch that.
> 
> + $(build)=arch/riscv/kernel/compat_vdso compat_$@)
> 
> The above is also good for me.
> 
> For that one, Could you add "Fixes: 0715372a06ce ("riscv: compat:
> vdso: Add COMPAT_VDSO base code ...")" in your next version of the
> patch from Ben's and add "Ben Hutchings as Co-developed-by:"?
> 
>

Why would Ben get a Co-developed-by?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
