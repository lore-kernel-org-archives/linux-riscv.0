Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46296C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TijLjIfsRKqJlRZftXsq8gImHcmHRHKa/d9G6na8N0s=; b=KGvCtZLiNoSZu3
	mPzYLRQM1/+q80XkpLt8waoPq91yw/zrswMK8MgUhH6H08La4zCGXHkAl+r1PDr/h3cxb/6MSAmZD
	3Wg5kp8uYsxLZkFg0CXDLFI+KX63/ZAftI0DcHwnhM6vC08oMtk++y44TRcwSTT3AuMIGxno7rdUz
	I7rkyQ14cQoLuv1le/OlO+1UAIExNkV1MO3idvsDlm5agdl4Adn2zVjtHWxC009gLc3iHLgEY9ait
	dTGV2nfVvc51hopxbH5FWJUNQ89vZy48ZenoF2jMjEszQMBBp/eVivGPtmtaOWQPrLfZpmIVwsWRm
	Ra/tPF2xW36GwVeHhejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWM2f-006b7y-89; Thu, 08 Sep 2022 18:14:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWM2b-006b4Z-C5
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662660857; x=1694196857;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CWi+kvR+5luqsqWt+KHHc/fJzgWThAyyMK+Mq6xh2xE=;
  b=f6OuV7JrkLo3ZKySW3BzIlakfptI5YtnvEIelHSVtQr4UEmtH0x0H0ce
   nNrTjNnMe0B4O838DnGntbsu86ug7BKhaGl8p7TROtHyfx7J/lenud946
   SAjWee1G2CHBnlRs36+G+9NPa9GwSfOIvxA21aIVgFUJrTO3TMI6Wx4/n
   PVDC4p9xq7UUT4KEV7IYa7ddNcihGmphcoz5XqBLfQH2PcTAuTIAdnpze
   yluZdEw6iB+XI6iUaK7is96YqkybcrchG9umo6jJxgPDdO9emzliIeTP6
   PxAzN6iuMaCVCbvVqEVpNeZIyqhw3UNbkmLktq95QFLALjaAfdAwy/grR
   g==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="179737834"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 11:14:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 11:14:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 8 Sep 2022 11:14:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdDuuG5LRbpcYOtaU/+KDq06GBs8irevuzrBBlfiHqvKCW7UrqngfvMueSqY+Mdi0oAG+5WDJPZ/3w05rxrU8lQWov+liW0Ys6L4n8o/giWsledHLEZUpNOT9buViOJO6XHBdEqq2gyFaKNvnjV5nqh9YfIGOxJICcRXI5NSf4dMkSY/ZkH9JHdxWwL724IpK5D42nrQD5da5jzHS3Dn5kfdmh11tWLEbnUER7XS+i4VTeNM9tK+S3desxX+EADVBtfUzJFx17JGqQcpo5UEtVrgaaUAYB0Tig0nfxtIH/h72O7kDy8etSph6xub1+lRtUPm5ELQwWOJU0amZRhzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWi+kvR+5luqsqWt+KHHc/fJzgWThAyyMK+Mq6xh2xE=;
 b=CeEbREBxkL5F3zSQlTlOH3lap7L0XrRU8TjsM9Vs1IEXo4nSy2cZsEn77RkmdsGl1B7qBqSAUJfjFnLanV3a7hpEAsM74UlMNWnw+kp1butnYlurtA+VBkBZfqpPdtBaHTF5OA48T6zyvrRl2LRAov6I4RvvcCPna9kty5dUObxKg6tBTcOKDOttoaPgja7R57uaqHcguJ5gzH0a70QxhZ5ZDr+U/hz6qxRt4VwavnHWiJr/Tx49bdgwZSvj/CFdF2Ozvey7iEk9/o2DzIS2E/TfOl4qXiwTW6CUGBPkNPbmkcmFx1U1KuZDjWUGGGiVY1nlBlAYYn2SQgy6KwjAqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWi+kvR+5luqsqWt+KHHc/fJzgWThAyyMK+Mq6xh2xE=;
 b=UCVkcCk5SBpaUEfJROjCQEoD/pBBlWG1GnVizCKcMQPBy+L93WSDWOz86Df2qiMyEBlImi0Wih18TEOFQlMrmqqrlf6Zojywov3r2er3iszMAoTUDfU96pxOz3o65jy4piqYnagTsZYZvA2lo9yWuLBkYboSZC7Ek4aChI4CqDA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 18:14:01 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 18:14:00 +0000
From: <Conor.Dooley@microchip.com>
To: <uwu@icenowy.me>, <paul.walmsley@sifive.com>, <greentime.hu@sifive.com>,
	<lpieralisi@kernel.org>, <robh@kernel.org>, <kw@linux.com>,
	<bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] PCI: fu740: do not use clock name when requesting clock
Thread-Topic: [PATCH] PCI: fu740: do not use clock name when requesting clock
Thread-Index: AQHYwnx0NYa6w3eDKkCEt2xzrlxSOa3V2JAA
Date: Thu, 8 Sep 2022 18:14:00 +0000
Message-ID: <8d7b8514-efe0-d3e3-8458-f4f003f10154@microchip.com>
References: <20220907054020.745672-1-uwu@icenowy.me>
In-Reply-To: <20220907054020.745672-1-uwu@icenowy.me>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CO1PR11MB5202:EE_
x-ms-office365-filtering-correlation-id: e49bec43-0ef1-4f1d-a678-08da91c5e7b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VXEkpMa+CD5EAKs38bbeWd4Ybohs3surQDTo77yQ3QHcRNX/jKKZ8HiJqOgp5L1oTQWx4tc0ZltMHfw/oj7xggw0l+zpU03qwuLIfeXsjYBtFPPhK1ezybaALGjEWr9Ni5DkZX+fh9s6SkOYvwAB/tOc8WlUfjtg04mruj295Hmd7pTOCBGihzq00RUoIyGjcSd3kj0n2sH48ZdeRNUV5MS+f+yyXnHL9p2ktvanq3rlGpY+kDLcAfcuQbd49TBx27CuBZSePln2GtkyeR3QjFBnXHbkWyiAklOvWOAeqdVts+h3IrbZzmas3fCqTEDUkFf0ZyFIPIKTx4kxDxhLVm5vAX1r9azEYX2Npk8ghC82Z/0U+9ZeL2yY1aRv8FKyHwa9/tyMU86yhNDSTEG5Qr4hxcT2+rQ+Us680M/M7qp8hyvLxfDRRBNKyfVgdavgPFpa5wKBJW/tZ4WSMGKRu7SVfGW+9UxcJvnWvnFWavYmg+orcSQC4U83E9ykF/S8VAN9nFLnyl+thQuB3TP62XAtO09tYuZy0NKT3Ew93/G6yjlbKnSf0N4NHnJdc8Txx6nGg25THYgj9uZp5b2q/A/Alm9ac5/kXxoIniF2Iwa6C+C4KrfTK5DBBYoOhCzfK1Tl/eQPqmdPto/lOfPu/44wuDEB4JSkMHN6yNOaZxMPSEF2jNIyG/E4WazorxoBO6rYXV3IuzmL1pQrFfrwp8SCJZ/2hRxVTQEYQB6WsaWN0UVxUIe8sO1YpPV8AXHQdmsRWp8hpqgwv9hNX0xJEHsDyccTQr70QZMIRvVNS6OB4kM1xhgAgR3a2x0IpcLHN5B6/tJBoAp66+xHyhMHGOtBTt1HSu14xmbI9xUNwvI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(366004)(346002)(396003)(478600001)(122000001)(38100700002)(316002)(110136005)(54906003)(36756003)(6486002)(71200400001)(966005)(38070700005)(31686004)(31696002)(86362001)(2616005)(53546011)(6506007)(66446008)(41300700001)(6512007)(8936002)(26005)(4326008)(83380400001)(66556008)(5660300002)(76116006)(186003)(66476007)(8676002)(7416002)(64756008)(66946007)(2906002)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YzB4V3VHazBIc2dYNlNyakRtdmViWnJNdS9ESkFyN1VxNlpMWXkwcFpJOUdY?=
 =?utf-8?B?ZjY0S3hkSmZlSlBZc0ZNclZIbENhYjNvdGZzQ3hQeUVnSHNhMXRtZkF5VWZH?=
 =?utf-8?B?UUdieDY5anJLVVZPZEF3QWZJdm9DM2EzWVFwVUdPYnFYZUt2YytianlheERQ?=
 =?utf-8?B?c2FTa0JEc3ZyT0tXeUFSQmx5MGxCQWhTMXprbWtGQU5YdDFqc3NKZXVkUXBy?=
 =?utf-8?B?R2lkcFUvczVDdTAvYXR0OHl2SjZoZXQwNWdyUHdBTUNDcndpV3UydmtQU0Fy?=
 =?utf-8?B?T2dONTU1b3VXWGxCY0N2UG8vYUFOMmJxdGcyYWJ4ZWptbEo3cXlORU1iZFdG?=
 =?utf-8?B?aVphT3l3VGo4cXFtT3FyaHdveVhTUndYU0Jxa2NBQW5QMjZtMHJiNzNmUVBx?=
 =?utf-8?B?b3QvZnNud1VBMGRwRTlOcmwxOVArdzZjOXhEZzJrd1RKR2NRb2RRb3d3MGFl?=
 =?utf-8?B?dzljeGNoalIvQ0h2MDJmOUlmSjBxNmM1Y3J0aU5uLzArejJrUnFkTnpkYkti?=
 =?utf-8?B?NkpINnJyZWNmU0JlYjhoT1dYaU04RERyL0M1V1RBMWdjWENXY1NLWDNSclNI?=
 =?utf-8?B?L2Y5Z2N0cmNEMjErNC82alVWeGFHWmc3c09IWjF3NzRBOHhKeE1YYVpNTzBR?=
 =?utf-8?B?YzlPZjZDYXpOSlhZZFNob3dMc2tjL3ZXZkhNOE5LZlpyR2JFVC9SWnNIbWV0?=
 =?utf-8?B?ZGhHdk1vWnk0M2FBdWxEV0RsS0NteXJDTVFJZk1yRm15Rk1XUkRVSUxYbjN4?=
 =?utf-8?B?ci9FYS9Rb1JJcVk0QlFzV3U2WXF1OG1WcmZqd29aZ242V3JkMDkwT05KZU9T?=
 =?utf-8?B?S0w4dmVza2ZOOUVOdnZmczVWOTdGcTgvL2krVGFHTW5RQVBJN1F3dVlpODBC?=
 =?utf-8?B?Sm9nM2p1YUJLaFNZWWE4ajRRVjFFYWkxcVhpQjZZRGF1NXEraHZsaWoweTVN?=
 =?utf-8?B?VFJXS3pKUGNFMEFRRkl2ZmFjZ2xBN2ZYWU9Bd2NhaHFVTGxudUQya2xjekNl?=
 =?utf-8?B?alkwUWJMQWo2RTMzZi9adXlHMy9DMnB4WE54MU16Z0J3QkgxaWJnQXJlQVBN?=
 =?utf-8?B?MUR0QU1oRlNmN1hEYWNnMkFjNGxtRE9zZTZBa0ZrSGdubXlMVWlML2ZvOFdW?=
 =?utf-8?B?bmllM2NkbElxN3V4a1VTWC9Uby83UXYybzRPdExDZ3pxK3ZYRHBGcDVwMS8r?=
 =?utf-8?B?THJ4bXREbjBnVEdiTnZ1M2oyd0dmdFdZMVVhekZNc1hFTmJqYWV1eS9DNTkv?=
 =?utf-8?B?SDlWMXQ0bDZHNHFZazNqdDNNeHpaT2Z0SVZ3eGdIelBKTHRZMkhrcTRSSW4x?=
 =?utf-8?B?Z2xpdFZ3eElSelJyWXUxd056WVpKV2pSMUNNOTg0MGk1dTJiVExWdVlqWmEz?=
 =?utf-8?B?dFZHMlVYVVJQa1NxRjVQUEdkL09HSVJVbkprS0tlNUNmQ08vQlU4dUlva3Fj?=
 =?utf-8?B?NDYxek5ySFp1OEpEeElsdWJQcGFJNUp3clI0VHlmaFkzZzFvek8xU2lweDFP?=
 =?utf-8?B?Q0J0a09xUk9JMGVWQlBEZUYwUEIvMUl1RVJYNG5CSWFkVTFWTDNLem5UNEE0?=
 =?utf-8?B?MlRRb2ZWMEt5U0NKTDAvVGNyc1orWGJXYWVHdXdmREZLTUExT01kOWJUQTlq?=
 =?utf-8?B?aEE4N1ZFZitmWHVaOWYzZFkyMnordEZiNDdxOGNqOE4zOGNDUFVjenZROTlM?=
 =?utf-8?B?WmZoZVhYQ2VYdUZZU1hRTGxReFpDdDJiVm4yQlFHbTk1blhtMmYxRXNlZGJ6?=
 =?utf-8?B?Mmd0d0tNOEJXQi9iYk8xclhRRmMraHlGQlM0QTB6VVJwQ0QzRWtlc3ByNlp2?=
 =?utf-8?B?WGhxL3BRa1VDUHJGbmZVRGdMaVVPUjNnY21DSHNncU5lVm9vbDFqcWdtaktK?=
 =?utf-8?B?Z1luWEdEYzBYSEo1Qk1GKy9hbnJDMVlSNFBMY3F3dTRWSXAzeDU3WlJWSi9W?=
 =?utf-8?B?cEpqbngwTnZmWTFXeVVEWkZSZU93VFk3TGZGdHlEZi9jUHk3VUhVRXMvMmtz?=
 =?utf-8?B?eG5wVHlBMnlBUHhqTlEwSklIa3NJQm9YK1MzdVZFMXAyak8rWlEwcm9YOWcw?=
 =?utf-8?B?QWViMVErR0w1akV6WlJqQjBOQ2RRRE5ZTmQ5dkRlRUpCN2hVYnNtYVdkTHhO?=
 =?utf-8?B?U1VCY21lMVdEeW9nTDBMKy9xTkpwYnlnaWNRVldlWDNzT0lVc3lpVHhWOVl5?=
 =?utf-8?B?V0E9PQ==?=
Content-ID: <29EE15B3DC742F42997F891378F069A5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49bec43-0ef1-4f1d-a678-08da91c5e7b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 18:14:00.7251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vA7nEy3OMz+HxXYvVM5e0XLRqy0I9HPgecNR927FQv0lXYhvoh/7h3Dqg/WfwCPpcxv1zV5jIPyCvRtW38zRv1+XW2RcFT7OC9KYQqaD65s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_111417_637621_516CEA46 
X-CRM114-Status: GOOD (  19.61  )
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

On 07/09/2022 06:40, Icenowy Zheng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The DT binding of FU740 PCIe does not enforce a clock-names property,
> and there exist some device tree that has a clock name that does not
> stick to the one used by Linux DT (e.g. the one shipped with current
> U-Boot mainline).

I recently added the missing enforcement:
https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/commit/?h=pci/dt&id=b408fad61d34c765c3e01895286332af2d50402a

Since there's only one clock though, I'd imagine it makes little to no
real difference if the check here is relaxed.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Drop the name in the clock request, instead just pass NULL (because
> this device should have only a single clock).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/pci/controller/dwc/pcie-fu740.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 0c90583c078b..edb218a37a4f 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -315,7 +315,7 @@ static int fu740_pcie_probe(struct platform_device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get pwren-gpios\n");
> 
>         /* Fetch clocks */
> -       afp->pcie_aux = devm_clk_get(dev, "pcie_aux");
> +       afp->pcie_aux = devm_clk_get(dev, NULL);
>         if (IS_ERR(afp->pcie_aux))
>                 return dev_err_probe(dev, PTR_ERR(afp->pcie_aux),
>                                              "pcie_aux clock source missing or invalid\n");
> --
> 2.37.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
