Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ACC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 07:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mBVh/t3Y/KGbvdWEsvno+CmqTvI4W4fHZo5xwos3r0=; b=QSo2etY0RXeEmW
	1O+EIci/YvyhFClM+COi2muJCkzQRPrp94BGpPG+EdATv6f+Ziw+GJluKGn+2p8+7fBPN0p+S9D2q
	I49Zpq0B5XsRDIKSJSFwWaC5855HXiDcfP2TJcV1cvpgVeuEM5ph29kjJxAChOlyMySZkGpaYbUCY
	bkjVutuS3U3eVx+nhVkM6EjU1vhCaghYj1owirQvUFMygPmoDRjI+89rYb+2CfPVfKPcxAHFkJfBE
	dm6t/puNqZlSG1v6K6csmI9uT9mSFVq/R+XqWRddjNe7/yR3fvV+33p4szTleDJg4mdpXcfhel347
	aegY+IazGScr1+M/u4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65PE-004uKB-3S; Tue, 28 Jun 2022 07:13:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65PB-004uJM-8U
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 07:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656400380; x=1687936380;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=bwu2b164KD4lBBgX3TqxrNbeEv6yZ2o9FolFnsyj/TM=;
  b=rAvlMjIuDEaJ/NJY5bJD+uPN075XsMvO13ZUdoJ0XgUlS6mSkMPs98hy
   x/IZSHm8Qy8sxLJXMIB88CQIuBWt2ZfGua4AphcNtO+gYPNVw3UInuhwG
   acMhmNp0kR4K1R6S6YOs0XBn6WVPXgUFKi8sq6AV7gln0hTW3k9RdMxNs
   GcANsR4+nCi2HI2n723qxCbXn42H+FamVF7lawqRVRqaeef0UqqItirxc
   XPSbJzxPOhSuvgCHLM6nySydGJnfdUjCg7q6H8s7+3vakgvYcHwajl5uW
   HC9dqDggNegsAgKirMVCHRP9UDQ8Fm7a8SWlViFYj6rCTeDkz+0CcEcmO
   A==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="102035806"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2022 00:12:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 28 Jun 2022 00:12:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 28 Jun 2022 00:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqF2Lo9QdDNdSEJ+yv3rzpQnhYmAh3zhBVC/n2n3s32ZL8C9IrhDSvuxxLKXkPx4EQDdQdy9V1HOPQUo6CkzH4wMhtBQn4z6CxWeDOk0w67cgzmKTumZqfpFZKC3WQMf4ooimjP1y+Tg+h4a2OaAeG+ZTOHWwb2cUxqZe2jdcLGSOeWqs6A85kUgnHaXGFEyqMuCZ5eNte1HLiA/q3GxuAvxMVLOlnlL20eBUyi1e2FI9i6BOtgy/5nXhfhAGnjck75JOVt4TewspUH43K99rjyRNDVtqOeu+8hWpNI2IjVegF/UPnDibijJf0ux9bfJ8+UTf2gjJDgGtljpNtUHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwu2b164KD4lBBgX3TqxrNbeEv6yZ2o9FolFnsyj/TM=;
 b=kj1on3hABAd1p1+vjqfmEQmFm9rBI7eWWUdUMkUQe9tYyYj4+AinbLqbutZ5XAeKjwGD1BgLoPKa5htQ/o0QptwSduSv2RWCWFSzx4J8mqtwOkI0TjbGu08RzqdDMsh20VXluBwuzNy6PPLeT5FaRzvTW7zTJlo8BNNaO4rSsO7jC7gA7nuo/UUUmGFO5Zg2VaoXqRHtsJSbfldKnX2ZZdD7V5pCT7SDBVI1L5pn9x7fROKACcbJca7nOJMefhVKIB6mUF5qHMq5Jrtjo2KRF0AkRieRLioKVhuf19pPWwAf94G4BRPrp04r26oCl865VmPn9mtqq3WxhR70AUygkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwu2b164KD4lBBgX3TqxrNbeEv6yZ2o9FolFnsyj/TM=;
 b=ZIQd28f7lanL+8uhpp2ASPbVDDDYi2NYLU9SA3VdB3R+D0t2tBoQ9fFtPEtS2bEwGWjDwQHLvcmgES53z0IZqAMkrATemG8hd3TGOQx5EWQAohqJVvcsrZHA26uPQPi6JF1KPisRYuSCy/0Uqlh2ryLURt1ZZiUCa7wcHYqeZcY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR1101MB2113.namprd11.prod.outlook.com (2603:10b6:405:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 07:12:53 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:12:53 +0000
From: <Conor.Dooley@microchip.com>
To: <trix@redhat.com>, <Lewis.Hanly@microchip.com>, <a.zummo@towertech.it>,
	<alexandre.belloni@bootlin.com>, <Daire.McNamara@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: remove 'pending' variable from
 mpfs_rtc_wakeup_irq_handler()
Thread-Topic: [PATCH] rtc: remove 'pending' variable from
 mpfs_rtc_wakeup_irq_handler()
Thread-Index: AQHYimjiTUE7thD3Oky3B/i8V/+L0K1kaB6A
Date: Tue, 28 Jun 2022 07:12:53 +0000
Message-ID: <17cba42b-0345-fdb2-69e3-cfc3f310c2f1@microchip.com>
References: <20220627205943.2075043-1-trix@redhat.com>
In-Reply-To: <20220627205943.2075043-1-trix@redhat.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d0870fb-28d7-49c1-c2d7-08da58d59e4b
x-ms-traffictypediagnostic: BN6PR1101MB2113:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: obtl+ROh3FGAYv051FHAa66A+xgAFu6WtV10RrQjSZ2UUtvq5KaSLsfwZE2aTkgoL+8oEAExkvkipUscMBmx4x3JbPwqjAdkOqLKiyFR4aAHnI33/FwPf7Vw31LA4ACv6bwi7S/H2+3rYagioUZa/SnYj7UYMIDhioG5guBgOutXzIaAcg3h9Y+4frkEQ8K3ccgAr6/Y3gOXiI4mkOP8xaYeVj5rMXvj+7RZoPH89G6Xf56PsQOFrnK3xl4O/iTHV8QusCs5TrG8zNWDpPSTVwvhgiboomurQqie3fn6vWLsANhU9QKj6YNJ1qJ7N/GT4DbAPQJQuQV2rSeUU3ktdRQsqNSvwQco5nwSxkzZDxtfRTV+LvIjS2IzmwKXpEjggqQ6OrRULfU6vV3YBi5B1ZiB6NyHbvReGxXQKEe6JOKX6ZOlisiWqg4jSdiEREIIbYNWlutCdC61WnV620M8EvdCeT/Iiw61oLRJ3YyYBw+WVm1CpXIh23Fco0zhkUnh8gyRnn4ZEKQB73CBTyxws23v+ti6zlAblFX5abmWmNLlCpHXh9xElXGXBB/t88AXb+e0Q2/TY/S5g4gB7AgbSwQ7py/XozEGYnWnyToxDBmx4oYPA2R3e+8EO4933+Wrq6OcIXNyQWJWNpSkcWwHFjIhEmOFs3x4Kzhl7XAHtsTvqMehWi6CpDTsJs0LYybV0N721hSi2KTRyRalrDslY6XBWJoyOBk/55o3DWFaaakCEMDH+OqxY7HgjZM/yzcLCAuvDntYRZd9Y9r0sPeXUpJJ9X7knzdX1/O84wpMeWfOTfJfhIrxrc6VP8nUNrd2pGHpWECAWl8r72NPVTfDwly0ldykH5bWBZ3wco1lVaE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(396003)(376002)(366004)(54906003)(2906002)(6512007)(4326008)(38100700002)(64756008)(8676002)(6636002)(316002)(66556008)(66476007)(38070700005)(110136005)(8936002)(5660300002)(86362001)(122000001)(66946007)(66446008)(83380400001)(91956017)(6506007)(26005)(53546011)(478600001)(71200400001)(76116006)(31686004)(6486002)(36756003)(186003)(2616005)(41300700001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHIrT0hjUFgxLzlRVEdtT1JTdW5JZnB5d1hNNFVkMjIrOGhLck9nZ2dxQW5L?=
 =?utf-8?B?ZFI0VjVXbGV6ZGRYcGk5Ulhmc0ZwUHgrV0dKODVhaURXRzhyNVFpbzN0dXdK?=
 =?utf-8?B?b2ZwQjduSG1TOWNNMHVac1BsWVJJM2c5c3NqT3dYUkozd09YSnVZL3NKTVZt?=
 =?utf-8?B?MzNHNjIvekZvQXNMT1IzM2lydFF1bk03R2dzeGlyUHIyWjVmZm9YWFgrSjJ3?=
 =?utf-8?B?Nzh1cVRqZzREVU9MZGRQK0x0V0FST09kNzZnd3BvZnUvRWxKeVdxeWx2cU95?=
 =?utf-8?B?amxOelJFTWZzYUFOazFucFNwNmZtRUc2Zy9iZCt0WHF0WnN0UWFJR1FQSTNO?=
 =?utf-8?B?TjBBN3lBL01XUUEvYThhRFNGTnlSc3NQVjVBUXEreWo2ZGZJWEI0R2ZHY3VV?=
 =?utf-8?B?UC9LR0JHemlYZXRZN0EyNENlWE5aS2NPa0liY1FiNHhRdUlUSXNBWlZqdjNK?=
 =?utf-8?B?K1BTMzE3Yjk5aVA4UUcxNU5OQXdMa1hDN3c2eUJ6amJXNWYrbHJ4TDJLU1ha?=
 =?utf-8?B?MUhvOE90OWxkeStvTUhJYTA2V0swZWltY2dnUzNDelZRRy9FMXo5Z2l3SEd0?=
 =?utf-8?B?T055WXhhQzg5MDgzZVlSZlhNYW8rczJwUlpMNTZtTktjQ0xVRjBlYXFnMmcz?=
 =?utf-8?B?c0kxeVJTRTBLT0x3cGdaWnV3S21mK014ZG5RRHNINjR3LysveGxyU3A2ZkE3?=
 =?utf-8?B?cUcwV0dYS2VtUk5MWWNkVGpvMENUdVltVTNtZUJoZklnZUEvQkxLZFVaN3ZH?=
 =?utf-8?B?Zzg2TVcySWVpUjhMSlVFSFB3R0VrTWVRSVAwN1dRZ3NBUXo5SEcyMEV1ay96?=
 =?utf-8?B?OGJpK1JQRDYxaGJlanRyZXFmVU5BSHNxS3JKTzgybStXNTlnUUpYalI1V2NI?=
 =?utf-8?B?cE5Ld0ZrTjYxZGh1NTQxQXlJcGxtdmdvWlh0Unc4STUwYjRkcmZ3WnRsZEtW?=
 =?utf-8?B?TlNjTy9tVXVBQXcra3JmRnhpbEJrZXdvQXZyblYrWERmYWoybC9xVlhPWmJ3?=
 =?utf-8?B?dGEvei9jYm51Y3QzeXhRYVZ3N2VHTXJMTzVvTm5maWU5ZEpMcmxlaFRsTFc0?=
 =?utf-8?B?NWQvZmVqNmtGaVIrUWNUem5ueGhYTUUyRG5ETnI0azlBQ1hwR3VjbzVmYzJz?=
 =?utf-8?B?VHphc3IvZHBFVXpsb2FjbVZHd1pFakRwWUZqSll1ckhIYUtWaTR4Mzk4Z3F0?=
 =?utf-8?B?YnN2eWJmdnFXNEpXQnJCdXFoaG44eHp5UjdYQ0pHK3k0Y0VuN0xXaTJscEla?=
 =?utf-8?B?WHZVTWhrVEt4OVhqTkx1ZnpZa1JkUjQwWVgwaW9ZSlpTZTJXeHZEd3JxUUlU?=
 =?utf-8?B?dG5lcFZBbEVNT1QxSGVwYWwrUmM0aEFYaDRKRVVIWHhEZWt3TDBBTnFRTUxu?=
 =?utf-8?B?RE54VytxelA1UlZkUmRHVmZOZGhnU01pVlJUSXR5OTViMWF6OUJ2T2F3WXdG?=
 =?utf-8?B?RVo4VXh3cUlpMy9mTDZ4N3kzblpKU015WkIvbW1KSkQ4LzBQMVFXd3lxSVJ3?=
 =?utf-8?B?SWJ4WHhPYm8zQWJqYUdGL3k2elMxMElud3IrVEJRaFJWbWx4TUtSNG9TdGZR?=
 =?utf-8?B?MzBhMkQxOEZYQnMyQVdrbFFsTmZLVmxqeXYxblZrT0VIelZiakxaYXJkWEdM?=
 =?utf-8?B?RTFBelJKcWYxelVEUVBnUkQ4RDhVakc1N0pOTEU3ZHZ6ZDdsSVozUTY1bkF0?=
 =?utf-8?B?VVRudG9udHJkeTE3YStPQ2R5blNqcFVGandmSW9vTmtrRU9LS1lOaGZwVTJD?=
 =?utf-8?B?MVYreHZoVEp3TVQrSHFBQ1RhbURoMnZYL3VrbnBkM0xZbkxyMWM3cmdCN2FD?=
 =?utf-8?B?cit1Qk1HZlhnMXlMRE1NU2tBM1lWdGFoT1piMk40ZU9OSStITllHUmxpeHU5?=
 =?utf-8?B?OFNyVko4QjFvcElJcWRURDRNVDBXR21ScDZtQXFzc0lqNCt5RzdrcWw5YjVK?=
 =?utf-8?B?V1NwZW1JRGFsOEhmM0MwVjZxRCtnd0xna2JwMXpSWE9PNk5oSXNMNnB4ekVI?=
 =?utf-8?B?OTZIVjg2RUhVYTljZDF0U3Frc0hxOEloZnc0dUJCSGY4VTdHdVduUDB2cWNI?=
 =?utf-8?B?b21Jdy9mQnB0OHo5czV6VXVBUUxHalRRdDViQytnUmZJWDYvT094c2tpQnJL?=
 =?utf-8?Q?N3SS5USF7eGFcNTqiMRRTtYHr?=
Content-ID: <1DEC78195ACC7749A90B6115D8878669@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0870fb-28d7-49c1-c2d7-08da58d59e4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:12:53.3233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iP0++YPI2pgIGSmKt3Kumiv9H2LY/2qIMi4BFgcX2fDHxIC/C3BmbXvVgFrevHrsSMfeHDaBhXGzjOp+XAgvVdYTW1QspQDzfT4Ngj4WM3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_001301_411331_93247DCF 
X-CRM114-Status: GOOD (  18.37  )
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

On 27/06/2022 21:59, Tom Rix wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> cppcheck reports
> [drivers/rtc/rtc-mpfs.c:219]: (style) Variable 'pending' is assigned a value that is never used.
> 
> The fetched CONTROL_REG stored in pending is unused and partially
> duplicates the functionality of the later call to mpfs_rtc_clear().  This looks
> like leftover development code, so remove pending.

It predates my involvement with the driver so I am not sure why
exactly it was introduced, but it looks to me to be surplus to
requirements.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/rtc/rtc-mpfs.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index db9c638e50f7..f14d1925e0c9 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -213,10 +213,7 @@ static inline struct clk *mpfs_rtc_init_clk(struct device *dev)
>   static irqreturn_t mpfs_rtc_wakeup_irq_handler(int irq, void *dev)
>   {
>          struct mpfs_rtc_dev *rtcdev = dev;
> -       unsigned long pending;
> 
> -       pending = readl(rtcdev->base + CONTROL_REG);
> -       pending &= CONTROL_ALARM_ON_BIT;
>          mpfs_rtc_clear_irq(rtcdev);
> 
>          rtc_update_irq(rtcdev->rtc, 1, RTC_IRQF | RTC_AF);
> --
> 2.27.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
