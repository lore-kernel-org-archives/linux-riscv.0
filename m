Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C2EC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 14:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPC9sUVOVyT5I04poWt0ud2GqcNlCydy/4Dm2cJp9RU=; b=Ga+ryR30CDbODw
	QdXcpokdgeVum8H6w6ESZnG5/dIpbBS3bo0y/L7p/Cs+WS5YHGL28+6/KIxYLy08uda0hsnxZfZgL
	gXPcf099EFDDkHiqnFdyTzYLoW+/F13pD4mkwaxZynGaOsTQ5tVL3R0aU5ZZdQIfn8xGq0XoidUdm
	L5AqWumarcswKM+WHg3uKZ2Hbh0AEAZCosSAQiKZWtWLcCfewZYh5RG8aaQBpBGDbvVJbtnSYmN0X
	TtC6da4xdP/ImcUgTDEhegDmsePHZLeHH7i2KCSMOSeiyyCB6ETd1WuhJd0TjWBjWg8EwnRWqvPWG
	d/dDXqGulgq751e5cvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hvn-005QkE-Qp; Fri, 01 Jul 2022 14:47:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hvb-005QeG-0s; Fri, 01 Jul 2022 14:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656686846; x=1688222846;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NjPUfxDct31FxK667u88FLvU9pkDtF/1fkjR4x3TO1o=;
  b=lKeLfpr2KfXmtPvCzzZMrOGD3YwfVGRyBUjjR4HbkC1E31wUIJMJZ5bn
   9PdXLNO/IuvD2lnQtiYQV6M/kMkt7mZ8TgHVHgsAekD63dliVPWFUk+T5
   PbnKKZY8axj3BCETxpJ6Hwd+xkU6vJlN/CPFKlYaBEKyNxTDfXQ96bH22
   pN5fYsATTJsb9G/LDT4o5Y0vP1L046o/AcknnHfYKoC0LFcjCXDb4y+HB
   4Iu23IN91+KLbVxfSNvN41Jam1xF/cOeojjf/1MOPaSd5GhyRNHqzWJAC
   3VWNXZMgOl0k2gLNVVfCIa1ItCmkhWtqo9SCQauVGPwLZCh/KtsmSiKXV
   A==;
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; 
   d="scan'208";a="180385657"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2022 07:47:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 1 Jul 2022 07:47:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 1 Jul 2022 07:47:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch6fTHZ6i9KPHtyVLpw5Owh8zx7uIwCQbvuLA0muUUX6sAHreKHMzesqFlvvYmWb8MjIKRVEdbobPxMawmiIw1BpoYojKxc0a2kr6rjA78naUpNXRmhx6LJwtrLWtyNT2zA5CGe18r/wEFDsvXGLWoGuJIBgXgzz6SbwFHEKsLMv1Qfdt9DHPKx+YhbwYMmLBeZFLicvpP4MHD/YaF6FexuWjm0LiPufMlmtuc1tcQQGJNzJDYZcTqS/JqWtOOyc87O5Eao8tJc6apYnPAXAU8VRpd+rZhl+1iOq0PS8z6t8Vcb6i5m9lN9fDQbt7jrmNwsKwdNliG2MAXbKMOYyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjPUfxDct31FxK667u88FLvU9pkDtF/1fkjR4x3TO1o=;
 b=DQEE9HP5NyQDsXES30sIeQfcopWyzvaHE+lUMkOzZfNkNBcQYulDax/UvTXrgV4hT6BEYNVbcOa6GGICO1W2e09Y591ESXvPcLp5H+BCwjZk5jpUmm4KakGaM6nhzRL6Cu+qRVVn8ybO3tMk0O8KCPPEY05ztW+lHV2W7ZCuzJV9ncEuLCB2uNUrsBhxN/Wj5ZtNjsSfdB0Zhl9OdauUhETgRuG/eV6C5I6tr32cqjr8xurzuXpVf/ioRgZPvW1smoPivX+QmJEWhsu4HVLfYKzfbbC0MD2K6ne4CDnRJzv5mlHllOKSlUSykN232ZGEkBgDlDpvDGt6SyM2npSPvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjPUfxDct31FxK667u88FLvU9pkDtF/1fkjR4x3TO1o=;
 b=vjizimLNE5fbYKwc48bNUjXO6uS9p9AUpial5MYnksPoek6B786BDYWU4n1hVeJIwVFkuv9M2b6ZUWQgFWT7dFaHmFb3UpmupSx5eqa3R2SggzOoaWmtsRbs6w84bDq1NtlWgA1FTJvpj9y9+wNqfnkMLT9eS9oaFKUABYlLwz0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR1101MB2107.namprd11.prod.outlook.com (2603:10b6:4:5a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 14:47:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 14:47:16 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <linux-kernel@vger.kernel.org>, <gregkh@linuxfoundation.org>,
	<atishp@atishpatra.org>, <atishp@rivosinc.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <wangqing@vivo.com>, <robh+dt@kernel.org>,
	<rafael@kernel.org>, <ionela.voinescu@arm.com>, <pierre.gondois@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<gshan@redhat.com>, <Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Topic: [PATCH v5 09/19] arch_topology: Use the last level cache
 information from the cacheinfo
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAargIAAEAyAgAAEPgCAAAqJAIAAMFoAgAC8ZgCAAGP7gIAAEAqAgAAdSoCAAA0zgIAAAdqAgAACLICAAB2mAIAA2xUAgAA8J4A=
Date: Fri, 1 Jul 2022 14:47:16 +0000
Message-ID: <64272301-7fd5-c996-217d-2b83e85fc1b7@microchip.com>
References: <03433f57-04ed-44a9-a2f6-5577df94f11e@microchip.com>
 <b2ab0ac1-bfef-5ba0-4ee5-15e604d8aa2e@microchip.com>
 <20220630103958.tcear5oz3orsqwg6@bogus>
 <9d9e80b8-17e2-b1d9-14fa-f1d8d7dfbd9a@microchip.com>
 <20220630173513.dyrrmjbpxzi3e6fe@bogus>
 <3840dbf7-ca18-b7ab-4d7a-92c9305476fa@microchip.com>
 <20220630200717.zlc6z6zcqbsw7euk@bogus>
 <ddb8238a-003e-fe5a-2a11-cb34c324fb33@microchip.com>
 <20220630202141.37p5qhppkiz6wrcb@bogus>
 <f5d73b6b-081e-328e-6599-92e8abadbdc0@microchip.com>
 <20220701111156.dqmdrj2hzjadojz2@bogus>
In-Reply-To: <20220701111156.dqmdrj2hzjadojz2@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52133f86-da1c-4c3a-95d3-08da5b7097a3
x-ms-traffictypediagnostic: DM5PR1101MB2107:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +GbBwSY5Xo7OgIMZos8VQphi3I1ROicfdqVFctFoehRgi8Aq9GSGHZ1CGl5U/OttT2Xd62ucguwZPo8uQ/+F3rsWqCnY0Cp9REIcqbS2s2s+JHzK4W/WGKdcKL7mUOzepWAqj7p6mHtq7jVFg9a0pfPYqCZPEM9Riqsp/AWtVyqw2VpfQHsXVyVjpD8/m7B49IMxU2Gj7sYUjPVBMdHhUsmG2yimpoIie9oAn9FbKgirzgst1Ykrpuz/F1ZF6VREW8cDRuVgbftuUTOwF2jlNzpCYmUMtgZbX5WfKS3rN3YTDzJO0yJzs4W+r1TEgkY9T3izHdOQNNNCmFcsYct9hESLE66aQhU+C5y+7w+joB/Kx0MQu8KqLvQUpKLlbnNcWcWtS3HMbUUZREZCNxGYAAwUKzkvLx+6TifF52pc6zR+U2QNCDnoI1ZjTWDbqJ1WZ29sRn2UUJms/6CJj6A/MgAmqOP8qoJyMDnGhHuNfj56pijRSb7OBDAS8jNBtG+HqSSNGhSK3I2kKwP7OcAiyh64TgNPxsi8BRGl2DIQ9RH9uxIPIf5Qy1JW74MP4gEnbPpy7XbdINp3QlqbC2dGuPm73iwTfrul6f/8JDv2cNYdBfVcC6mPRHvz5K+GahKpbxGpUIZOH20dopBbUXgdE9DeBBF9RJyGJnaZqJ9dYhUDVDg3JT2g35edKy22KqjOgd2REXhJdmPvFJBvCwHqUJaOibnn+vm97lqWDYNppQkIzV/KeC2uvZXN5ahdcacMRKzZQjKx4JyWWX9JWb6yz/uCvyJl1hA4B3YY3R8e96VQXi3hRpq4ajdonSg8As/3hGCI1YlLhN3wHfik6ZR0kN42Zgo7fQBaOswoTU8kvHKVekwH6i5nVU2lcClUAVfx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(136003)(346002)(396003)(39860400002)(38100700002)(53546011)(2906002)(316002)(38070700005)(6506007)(122000001)(26005)(6512007)(41300700001)(186003)(54906003)(86362001)(31696002)(5660300002)(71200400001)(2616005)(107886003)(76116006)(7416002)(64756008)(66946007)(66446008)(31686004)(6486002)(478600001)(8936002)(91956017)(66556008)(36756003)(66476007)(8676002)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VE5XSWZhanZDaTlibzc5QURmaEgyak10U0QxZzMzU1RsOEZhVStIMktUNTA4?=
 =?utf-8?B?V2hEek5aZVFUR0xQRjRPZkVaOUNUQnVYeGhZcm5rUUhBYTl1T2JYQUFlbkx5?=
 =?utf-8?B?WkphYWI4c2NQYlBudms2V090aVAvTW9mTy9XVmQ4T0J6aGxRUzdCazJYOGJP?=
 =?utf-8?B?R2tUamNtQVlXYzA1Tnh2cWg2NFNMN2xVcVZKY2NtVk5WTXNmdkt2VkNtbjZL?=
 =?utf-8?B?V09mOE93WC9xRXZmK0ExbXNnRHZnb04yeTYzcWZXcHhzVXZtMjNldWd5d2da?=
 =?utf-8?B?bldHNzdJdnVEY2ZPQno4UXNscVRMbk83UGNnaDFja0hRMWN6RHc1RTJqeXlv?=
 =?utf-8?B?Tndlb3NQSGNnNXZiblI1ZUpZZndobnRxendxT3NzK2JNcHdzUFc3YUJ1WnNH?=
 =?utf-8?B?b3RTVEVMRndObzVpeEFZUjRLMnpCSjhPWUtDM3VBUWtPYXhhWi9rZzY2NWNV?=
 =?utf-8?B?aGZTTHFSS0hXYWNqYk1EcUZhbkM1S3A2WDA1cC9hV1NTbDVzTWR0emNqeEtv?=
 =?utf-8?B?ZWhYMlUwVFU2MERENG9lZXM3RmRhbHBNd1ovMzRIN0hpS3VuYlMvVjNUQXFW?=
 =?utf-8?B?eXBvdDNWNldJaWJadjFnN0dCYXJsVkY5c0pmMjA5YTUwRHRpTnlROGhxNGJu?=
 =?utf-8?B?c0hVdmhCVzFQSFF1U2RVeWZSQ3NTRHB0bmZlVkFnM25xZXNrS0JXN0gzb0Qy?=
 =?utf-8?B?VkxPTkdSaE9tdXNaQ0M0d2c5NXhQOEhGRlpPcmpqL2ZCQWtQdnRIcGVBVVpw?=
 =?utf-8?B?bUJMcVB6QnVWaStpbllmVjNkR1EzellVWXpjQ2gxUXNXNi85S2FWNWI2bFpm?=
 =?utf-8?B?djdjdUhHZTZUL0xyckhBUUVvMTJrNUxub3RRM2dsdnUvalRKK0t4anhqMnh2?=
 =?utf-8?B?V2pvRGd0Q25yenVmNkpOYldVRlNPWEx5aEVjMGtCbFc5TzU0VHRhZk05K0VB?=
 =?utf-8?B?ME95Mnc5aFRGaVlXZTR3ZENGL2s2WjNXTjJDdUJtVkFIamZiZXBXYVZza0Z3?=
 =?utf-8?B?SHl0WWpVeHFzQ2c0MmhwUG5KcnluejEwbXgwMVpVZFBiVEhtbHRkMzNJdTRh?=
 =?utf-8?B?aEMzaCsvSnBWQnRkMkZ5V0RzVFE1Y08yVUpwbDFzMjFqSVkya1JCY3RnbVJ3?=
 =?utf-8?B?Z1NFM2FuOVZPMUtHS0R1WDNEbDdJRitvODJMRHJ1Z2VsemFLS3NBcHdBU09O?=
 =?utf-8?B?S0FtWmJRNkRneTZEaWJVSmxyT2RKeXZXdE5YMTc5ZWlCSkl6WmNEUjBtbTNr?=
 =?utf-8?B?T3BiNkhMQzFNZmdjT3Fic3BGQzRwZmlHSkhUbmllNkNTZlpwZFJoVXRtdG9n?=
 =?utf-8?B?enc4K2dNcnhoMldXaGx4VXRPdkFGZFNXNFdzUms2RHlrQUFObjRTWmI1QW95?=
 =?utf-8?B?akxRQXJBdGRqSWxydXhJUDFTTUpaQlBhZ2tmbUgwb1cxdmo3UU9VOHNiNEp5?=
 =?utf-8?B?SWQyQms4eC9WY3RCR1BNL1VJMGVrdFhQMm9PUHJDYmRhb2JDMW8wS3VqeTRW?=
 =?utf-8?B?c3ZDQkt4Z2NsMUdGS0UxQUxRZ3VmYmtkQU1uZHZ6TVM2MlgzUzNMZ09VQ2pT?=
 =?utf-8?B?MVhQUXlFd2F3eGwzUzJ5a3hENW9OaWNYVjBOem1YWVYzZ05KTFBrOVNzMFBX?=
 =?utf-8?B?M05WaUoyV0lUVC9QbDF4UElHRjBaYUVPd0ljSU9FWWhHMVNYRTE0VUx0MUpk?=
 =?utf-8?B?c0NONGVsTzdZUlNMUXViMDhsUnVRK1ZZQlRqZExRVkM5QWRuUHRRZE9jR0Jr?=
 =?utf-8?B?RjJpMEpqYzM1WG1MUGdSYkd6bmJSdmxDM2R4aUROQ0dwb05YNC9jNFp5RXNT?=
 =?utf-8?B?STlBS0Nlb1dzMkJRL1N2NmVNR1VhaU80ZUdiNHh3WFV0OFBSWFFiOVozMGkx?=
 =?utf-8?B?Um4xTXZCQUJLa2x6YUhmUlV4dHNDeFNUTko3em9zQ0krRzlxb1pYOE9iditX?=
 =?utf-8?B?NWZlZ1ptUU5WZWppMlYxeVpydHJjckdrMHRjSTk5U3phWmZuR0ZRYVh0K0dx?=
 =?utf-8?B?NzRLVG52aWpTUndsV0NMQkVDTEMxeXNFQmlXWUZiQUp2aWZpdGVEWk9HOWcv?=
 =?utf-8?B?c1hhYmEwTW4wS1JRamxIWE9wcUpoaEJwMytiUnRHd3pXL1FLQ1pkaHhzVlZC?=
 =?utf-8?Q?oLCK25Qb8H+TJVXOiqPhmzn0v?=
Content-ID: <5EEF37EA78E18849885A8A48E8B13811@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52133f86-da1c-4c3a-95d3-08da5b7097a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 14:47:16.4735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqF+dLrr34AkrD4/S1rUBdfryXuf2DyRjKzvoLP8pAVRE4n6GqCENk1yfGW6rwnnaofe0FLUUio937QPNXzwCRjym8jZmTl1qx+bnwsUjOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_074727_362715_0C448B2F 
X-CRM114-Status: GOOD (  21.07  )
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

On 01/07/2022 12:11, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Jun 30, 2022 at 10:07:49PM +0000, Conor.Dooley@microchip.com wrote:
>>
>>
>> On 30/06/2022 21:21, Sudeep Holla wrote:
>>> On Thu, Jun 30, 2022 at 08:13:55PM +0000, Conor.Dooley@microchip.com wrote:
>>>>
>>>> I didn't have the time to go digging into things, but the following
>>>> macro looked odd:
>>>> #define per_cpu_cacheinfo_idx(cpu, idx)            \
>>>>                             (per_cpu_cacheinfo(cpu) + (idx))
>>>> Maybe it is just badly named, but is this getting the per_cpu_cacheinfo
>>>> and then incrementing intentionally, or is it meant to get the
>>>> per_cpu_cacheinfo of cpu + idx?
>>>
>>> OK, basically per_cpu_cacheinfo(cpu) get the information for a cpu
>>> while per_cpu_cacheinfo_idx(cpu, idx) will fetch the information for a
>>> given cpu and given index within the cpu. So we are incrementing the
>>> pointer by the index. These work just fine on arm64 platform.
>>
>> Right, that's what I figured but wanted to be sure.
>>
> 
> OK
> 
>>>
>>> Not sure if compiler is optimising something as I still can't understand
>>> how we can end up with valid llc but fw_token as NULL.
>> See idk about that. The following fails to boot.
>> index 167abfa6f37d..9d45c37fb004 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -36,6 +36,8 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
>>   static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
>>                                             struct cacheinfo *sib_leaf)
>>   {
>> +       if (!this_leaf || !sib_leaf)
>> +               return false;
> 
> Did you hit this ?

Ah I forgot to remove this, I had added it (since I knew a return value
of false was correct) but it was still failing to boot. It was my step
prior to adding the if(!llc...

> 
>>          /*
>>           * For non DT/ACPI systems, assume unique level 1 caches,
>>           * system-wide shared caches for all other levels. This will be used
>> @@ -74,8 +76,12 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
>>
>>          llc_x = per_cpu_cacheinfo_idx(cpu_x, cache_leaves(cpu_x) - 1);
>>          llc_y = per_cpu_cacheinfo_idx(cpu_y, cache_leaves(cpu_y) - 1);
>> +       if (!llc_x || !llc_y){
>> +               printk("llc was null\n");
> 
> Or this ?

This printk never prints out.

> 
>> +               return false;
>> +       }
>>
>> -       return cache_leaves_are_shared(llc_x, llc_y);
>> +       return false; //cache_leaves_are_shared(llc_x, llc_y);
> 
> Even the above change fails to boot ? Coz you are always returning false here
> too.

Correct, fails to boot.

> 
>>   }
>>
>>   #ifdef CONFIG_OF
>>
>> and this boots:
>>
>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>> index 167abfa6f37d..01900908fe31 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -36,6 +36,8 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
>>   static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
>>                                             struct cacheinfo *sib_leaf)
>>   {
>> +       if (!this_leaf || !sib_leaf)
>> +               return false;
>>          /*
>>           * For non DT/ACPI systems, assume unique level 1 caches,
>>           * system-wide shared caches for all other levels. This will be used
>> @@ -75,7 +77,7 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
>>          llc_x = per_cpu_cacheinfo_idx(cpu_x, cache_leaves(cpu_x) - 1);
>>          llc_y = per_cpu_cacheinfo_idx(cpu_y, cache_leaves(cpu_y) - 1);
>>
> 
> You are just missing the checks for llc_x and llc_y and it works which
> means llc_x and llc_y is where things are going wrong.
> 

Sounds about right to me.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
