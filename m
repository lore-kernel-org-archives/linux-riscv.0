Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71968C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DiIcnvf5HO2FoqYPCeye9dRG49h4rAO8+F89eN5Pf8=; b=YTTnAvLoyj6Cps
	9mwxJG6bg6hzsx7c3l0UFcSfNbLdxYUnr24qQXt3V77KR+mbX7Eua4NuNfE7V7buGYP81l+cMuSu2
	roAx7EqR/W7frx0KVDiGea5KJKKhcnbrGOlfRS8aTFIkmm14fhjpyCD7bl9JQ6YkTKwHzWxG6mVTq
	dNmLTAPrvBpBaAW0IjucIhDyvX09XmjW1GsvtAWWlccj8UPZeI2x8V6FHyA13BqjRn9ekxKpASoAa
	wM2j7kYQ9XokaQHjEF5GLyuLYDvHmJBRRRgNGhClJoqJ8amx6836h2dzFY5JfQexvwvR7WjNy/nlX
	bvbBag5Drfwi4C3pMb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SAF-00GPsf-0a; Thu, 07 Jul 2022 14:07:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SA9-00GPrB-SL
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657202846; x=1688738846;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=R0/7Mug7kA4piQO5K6IzN6CnfN7w7Qy7TYc2Dli8N/4=;
  b=dVQk4Nzs3TDbvhsam4+kPwvcwvXj+dy6mbRhfIPCBYg5w3mvTc9PVhxv
   SKkETzddJpKw3/rmOPgKWcHUCEK8ARha4FrxCUT3iYQruBdEedY+PSaWW
   xc7fCifXzgD0SUfBciG2jj8tfXaewL/olC+eV707nVDOAKukshFnhy8rE
   xvI9AYZDsuDltC3CtIkaKRzEoOPcCi8oO32UeINQNIet3tsiotulW2DY6
   +Si0ZFtR82uCImXoz+TEXZY7D/sALEyGzizgdqnU09Fjk2izXKf5LCKtq
   s4zcODpftaidok3xRZPrvkoiQocpuCNa6voaaWt0AqVzYPeLjCq2Ta80C
   g==;
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="163765011"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2022 07:07:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Jul 2022 07:07:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 7 Jul 2022 07:07:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/ZEb267Va+VEXiLxiX0voUXXUbZ64ZFYMUjREEW46dRKMg3pgXENjZyeDznURd2i1y7nacFRPgGy22cnS4DKlGtl86vXP83goHiZApmEVIqKFszji9fUyIIR3/8jqAQvVbEkp4q7wE78yepMSIMOdvwvcvZN3yIlNcWH79p3EpPa9w72y04bkf2OZ3FQ2Hkwj/6Ie6x6CbzTRu2T14bLWNA/5dSswQ/rnVZb6aQLl0rBU/gXgKmNA552/zP5z5CoEUA6f9RXS3MYQUnXd32LKwMYcF7rILw9O0/5eo1vud6W5JG2VIbmU2VC9OYwHQ31omn9cbXb73MmfXdhyPo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0/7Mug7kA4piQO5K6IzN6CnfN7w7Qy7TYc2Dli8N/4=;
 b=jAxVJmGwnNigb5fxd+vOPFbnAB4RPhBTGacD5xtajznHLco8WcpEfWNikraI6SA4DOy0sanri8/vU/AeM+Xy3YNTf4rYiltwCj/8TORkXFGLMLL99by4Xc9xsOQJY0wniY0snAWoQDquo7UX8vrP7kVV0CyN4XibX40ISH42oOBGicQ1Wu23D/0xoIj0rm/57jkjyns3ugeRa+8saJ5rjECgen02rFeiCRxORXb0riqgJG36BKGH3Kb94dXU7zpI+vVJBbyzsZxhUuBduJh4paQOftFKVAsKTsqUwjG9ZWKgTm4cjGP+Gu+X28wxoooEmPsxDii3RVHVcGMuGeus/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0/7Mug7kA4piQO5K6IzN6CnfN7w7Qy7TYc2Dli8N/4=;
 b=qsSNbQo5tW8AB6AsIMptNmzE3TOltWfxiHdGDkvst6+X82/UuS/JOjlCjN/h6eo7y2ftS3+uC68VFjj8xao8eHF+wpG+EXjyqMjfsEuivrFlr1vwZelSMfJf99VV3M48+1YecLOZXYEJhz1BjeYR5JD13rDNZ9J770FpIzWyazc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 14:07:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 14:07:06 +0000
From: <Conor.Dooley@microchip.com>
To: <arnd@arndb.de>
CC: <palmer@rivosinc.com>, <palmer@dabbelt.com>, <Cyril.Jean@microchip.com>,
	<Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>,
	<aou@eecs.berkeley.edu>, <gregkh@linuxfoundation.org>,
	<herbert@gondor.apana.org.au>, <kw@linux.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <lorenzo.pieralisi@arm.com>,
	<mturquette@baylibre.com>, <paul.walmsley@sifive.com>, <robh@kernel.org>,
	<bhelgaas@google.com>, <sboyd@kernel.org>, <wsa@kernel.org>
Subject: Re: [RESEND PATCH v4] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Thread-Topic: [RESEND PATCH v4] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Thread-Index: AQHYhou4Yct9CdBHxU6rAH/n3LO9DK1y/l2AgAACAACAAAg/gA==
Date: Thu, 7 Jul 2022 14:07:06 +0000
Message-ID: <75d066e0-ea6a-8389-f36f-92688a32b525@microchip.com>
References: <20220622225822.2166305-1-mail@conchuod.ie>
 <a39bad24-d2bb-ef3e-d57a-2ac4fa1156ef@microchip.com>
 <CAK8P3a04WLx4Me_=hm9v+Kpq31i3ZCDfPiDhT64RyE_pZZPDVg@mail.gmail.com>
In-Reply-To: <CAK8P3a04WLx4Me_=hm9v+Kpq31i3ZCDfPiDhT64RyE_pZZPDVg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f097ec90-6fe6-410c-fcd7-08da6021f9cf
x-ms-traffictypediagnostic: MN2PR11MB4760:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: exo5pWdeb9fu7R348rRgLq/GRQFgbL4J4uygwf36ffMTZQFXCPDvLz4YVDpHRjfpQNYXtwlHJJ0MJQ1WXCXbxHnh0FxvSouDRescQaqed3FG/BmZU00XQ6IPWV1mT79WbV63+3uU8bSsWRaGgraQBSY/ToGRbhtI0IWbEfrbo89koUgTx3GnbalNR8kOXBlLKgE6VZ9v4PTRFaDBYpXz3d0bgl6Ad+kfGizIor0aRrTf0yd5Do1uKnCmc0sgGOe6fy+yrgkrnWqObylq9vW7Sd6Bj24+Y4ykg6e4hmyZ/QVUEDS1vxBYqmrO5X4NBbmX4cwF+2F7d8MqLaGgHhAcvvnVRUkrtdtuc+8hm2tKzhfvXK9suKNsaFCJSJTYssUFQihCxB2UJLaUR4K/cElUIFk0EgFeRct+7HPcGoItQDmg8hlMWClZRUvZzDtOJlA3gkjP8vq0kMvg7juQPd+mnEBBLydvPQCl5vfKW9HWZnpthujoZTDALSJtT05jV70uUmVMQETaaLBB9lvvnnwBtBzS5YFOTL6Ns2VAR6fNOl6GgQ4kfXIjQOYTJoajW6lt1ePMvJZ8PXF4ELolE1K8AwOuwsv50qppAe1/ijvsGHOUMxfj6LXyXgub7BDZE1eUkJqI6NPjwu+0UlPWaUPa0us6JQzZ0BQVVdNFlKspm9z94pcOHOq+gWLFmwphKnnvg3oqjlEtm/2KLU03vulr1LTKp+Ds6ZZANwn59BIPJm/C8h1RuwUOw93IQw21vccfX6Wh2XxDvf84kVkxiVcHIrBgPZiPqJ4o1a2lTpV+LD5nsRhli2/KD6dlLduedNJTTxFxzLeiOBZPWy2sV1DC8ftJ79ygI4CS0bm5eZeJZjTRneGkO2gd9dY3ozzoTnKX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(6916009)(31686004)(54906003)(186003)(66446008)(64756008)(76116006)(71200400001)(8936002)(66556008)(478600001)(8676002)(91956017)(66476007)(66946007)(2616005)(26005)(6512007)(4326008)(6506007)(83380400001)(53546011)(36756003)(38070700005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(122000001)(316002)(31696002)(6486002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0dQZHhWTnFmOGNvWG14SmtZRzN0Q3Q0Q2tLTlkvTzZOajVmWHpnRlNsU2xY?=
 =?utf-8?B?SnR1OEh3cXJmWXJkenJsZGJ5S2hETVF2TDVoQ0t0V3ZRZ1pMcm9hWGtNWFdW?=
 =?utf-8?B?MlZ0U1NuVUl3Z3JwZ1BiOVFNNTcyTlR5M2dNU1A0QmdwUW82T21aVkFJSlVy?=
 =?utf-8?B?aTlyZVVSbEwwM0o4dXhYNjBzRkg5eW9HcnlsTXlUUHRLMzJWYU83TGZpL0tR?=
 =?utf-8?B?MVgrZE5IcTlSR2RyVEQxdDFvai93SVhoQURESFgvWUVqdVdwZS82SkVCaElx?=
 =?utf-8?B?ci84RjZQMFdHRW41S3RhL0ViaUJ4clg3WHJrOEpPVHNyR3BxS2RBVzFHTDN1?=
 =?utf-8?B?a1hxTDBkMnp0ZlFBWTAwSjhyUTA3N2ZHbTVUVlpJUGJyTFV0c2VBeFhVdjYy?=
 =?utf-8?B?M3A1T2FzRysxY2E4V2FFTzJoRnQzVUV3UjN2TERuMGNzeXdabTM2RFpzaTlp?=
 =?utf-8?B?THkrQW1HZ2VLRXd0dGJLQkdjL1B2QXlSdEc1Qy9Nc3YyWkYwQU5SMCtzcGpR?=
 =?utf-8?B?M3crWWFhMWlmazFGb0wveXRtenNIcHQ2UVUrVFZURWVhaUhvRFpmM3VBblpi?=
 =?utf-8?B?RFpnMG9lenNSYjZ3bWg2OEpqbW1kN0VlcDZwVVJQT2szbGJkMThqdHJCSVBu?=
 =?utf-8?B?Mm81djNIVE1Mdmg5L29peWg5OFpPQ3N5THVLUDR2alFaczlQTWFpUWdGTW1C?=
 =?utf-8?B?VXBIaGVnaUtObTFYR0xzZ2RFazRkYTRQZFFDRkdjWlFWemdkYlBCM1NNaWtY?=
 =?utf-8?B?UUhqU2xZZG1XazExWlNJVlptSk1KM1RQTmRodERxV1Y2c0VtYkljKzVteU40?=
 =?utf-8?B?Ni91NU95c0xJUEJySEZMZHVUZGNHdEVuejFpNWZNU1Q4QTQwZmtjWEh6dFl0?=
 =?utf-8?B?N2hveEFvRDFtaFZUb0hyZjk4dUg3LzVWWWRheTRaeVozR0hwKzZyOEJvZVY0?=
 =?utf-8?B?VmJQZHVYL3ZMd0ZUMW02bVdocjZlMzBqY29iRzR4UVZkdGdBb2tYalNXWGhF?=
 =?utf-8?B?RHJJNVVaVXA4M0xmT3pWeEpzeG41TUJ6YWYydVNQM3pqbHc0aTVOZEk2Q3d4?=
 =?utf-8?B?T3pCY010ODRhdHZ2RG5yT2dGZys3Y0JQdGNsYkdNSG5ybWhYSzR0bG56OEdL?=
 =?utf-8?B?Y280dkE0UGtLcGMyRk10ckFHZnp2V0RMUUVrQ0IyRmxoOUZ2Sy9SUGl4NGxl?=
 =?utf-8?B?SUVrdjUyV2xWdmtiUzV0V0pwN29BbWd0eUdraXRjQjVoRHhDcFF5VUpOaVZl?=
 =?utf-8?B?U3dndW5VRldXdFZFSGc2T2ZqZmNQTmtYWlY2QlRkWmRhc0xpR1QrK0ZhTXpV?=
 =?utf-8?B?ekJ6Wmp6VEV0RE1YM01CckhETE96eStKWkpHcUJkR0VZZ1ZuMVVla0xZUWVW?=
 =?utf-8?B?NGJkV3FNcjJxNGJQaU0rcWlyUFFESUVpbVE3c1NKMW9PTk5ZNEZNQ3pCcWRY?=
 =?utf-8?B?aGxNQU8wcGpSZmZQQVo2SWRMenp0Wkk5WmdpeUI3UkpYZlM5NldBU0VJdVIx?=
 =?utf-8?B?bzVLNHplR3lnYitGZG9VL3Q2YXkzR2V2SzdBVHFMdHI4S1k0TGdDMzhrazZ0?=
 =?utf-8?B?eFU3bHc1RFgxaHV0bnBhZllIQ3hoWUV0bTJKWHVxbzZmN2tzckhxVS94eWJQ?=
 =?utf-8?B?QU9kSjZERVppS28vK3AxZWdXbGs3TFVwSmdHM2taVzV4YkkwdXVIK1dmZ3J1?=
 =?utf-8?B?cGZLQ05yV1k1ZVlFSEUyekdESFpmeE0rZy9BdjFPRVp1TkIzMkh4djFBL2NI?=
 =?utf-8?B?Yzk5aTZCbldwMVhLeXNwYlZTN0ZnZFhGQnUyUUIzeUtmc1JSSzh3ZnV3MXZ5?=
 =?utf-8?B?UmU2R2NReUJDZ2ZMT2FkdURYV0ErdmxxSVFZWnZBVk1kOG5UM3o0Q2thdGVV?=
 =?utf-8?B?aXRXcVNycXgvcmtGTFo1djBvcFp0RmZycUpHT2QxVTdXcHJaZGtjWERRU0tH?=
 =?utf-8?B?QnlDQ08rN3BNY1RqTmNrcVB6L2FjMVVYUEErNHpVTEp5cG82NkQ5Q3JLazV4?=
 =?utf-8?B?TXhlMXFGSDhLdGc1ZnlydnFoQ2RRWENtV2tPeTlveHBITzlJNUNSc1JZbFdp?=
 =?utf-8?B?alZ0SVVrOVpHQ0p0akdCUyt0bEZ4bGdHZXVsZEMvRTZrTXhITzVvVmpqa1Er?=
 =?utf-8?Q?U9QDL8le4M3G8RRvAR0Nc4FlW?=
Content-ID: <F3FB7BC9E756CC4F85793B61E840D20D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f097ec90-6fe6-410c-fcd7-08da6021f9cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 14:07:06.7066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYubmV3aaKJC9ioNieKM8Bc5oCDqyGdMfYhEBA3sKdJIOcfigA32FD7VIAPDxkt3iuQtVMRDh4DO3SRCGmeAEVhvhmyCnvyA6aFwR1Co0T0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_070726_037560_307F82B6 
X-CRM114-Status: GOOD (  22.99  )
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

On 07/07/2022 14:37, Arnd Bergmann wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Jul 7, 2022 at 3:30 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 22/06/2022 23:58, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Hardware random, PCI and clock drivers for the PolarFire SoC have been
>>> upstreamed but are not covered by the MAINTAINERS entry, so add them.
>>> Daire is the author of the clock & PCI drivers, so add him as a
>>> maintainer in place of Lewis.
>>>
>>> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>>> Acked-by: Stephen Boyd <sboyd@kernel.org>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Arnd, Palmer:
>> Does the SoC tree make more sense for this patch?
>> I am missing an ack from Herbert (but I don't think that's blocking
>> for a MAINTAINERS update to my own entry?).
>>
>> If SoC is the better option, should I resend this to soc@kernel.org?
>> Unfortunately, since I originally sent this patch there have been
>> other changes to this entry that will conflict in -next (all are
>> additions so easily resolved...).
>>
>> I was hoping to get this patch applied to v5.19-rc(foo) since we
>> never added maintainers entries for these drivers rather than wait
>> for v5.20.
>>
>> If you (plural) would rather wait for v5.20, I can resubmit this patch
>> after v5.20-mw1 with an additional i2c entry (if the driver is applied)
>> that already has an ack from Wolfram.
> 
> I tend to take MAINTAINERS updates as bugfixes in the soc tre
> (for 5.19), and I can pick it up if you send it to soc@kernel.org.

Cool, I will resend to soc@kernel.org.

> 
> There should never be a need to wait for the merge window
> with these updates, it's either a bugfix (for 5.19) or for the current
> -next cycle (5.20).

I was just suggesting that to avoid conflicts in linux-next
but they will/can be trivially resolved.

Thanks Arnd.
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
