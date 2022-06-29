Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A8EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 19:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rV4UVcgbwlMkpJlsbp3RGHwWK+lbFg2m3RRSKScVL8=; b=AhUKEh2ijfiDqF
	8nAE1xkVGJ5rRoB7zE5ZgdXsMmjvDtqyyUJQe2DVzmKiztZjBq7qJp+eZehDbrsTN/PE5zVSynuq1
	cXXbn035os04ulDJSh56ri7hPPz3xAsY6Svvu4XAwvDUj3M6AmA9UoGEpXUm8A8oSdjbWKK3E/ANM
	/N9Spbs1Gb02R+hhwXzr0dFdcS/ECsM6LpQyzMJW9/QUjzIYHHsL2A1DU//w6PPd+5mo2kRte+zkE
	bFrf7R4a+LlNmxXszhraWeqNhk1uI8mLrdYB9A9MKgnuz0nN/4I6vynvOoeAbpLUjRZRNVCA6rojY
	rIGxTwXQJh2aMsp/ialg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dK5-00Dlo2-SG; Wed, 29 Jun 2022 19:26:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6dJs-00Dlli-FA; Wed, 29 Jun 2022 19:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656530748; x=1688066748;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=L4MgbrC8fL5KdgRtLj8QP2i/nFgdDyA8ckZDmFsUyq0=;
  b=DX2Qlur8llNL+DG0FC5D97QT/4Ayuyzo3KzHwXAbSgr653TiMbjBHUpd
   y1UXolTguV8D4ApTMoFMl0J4l4zZmtuS0KpKRLEyyB4O/HoAwYmp6Bj1d
   kEeOWwkhyDmUHhDZh1MVPPzosp11+71vJOxuyGY4J0cfn5fu0PvqfKvf1
   nvvbokZ/Kha9twnQ5P+q1/PUaxDJ9oa+gZMKZ0M0GrtTGf6s00i05nEkM
   QUnMDx+hXwLTgGOJr5SK0Min0LzjZkPufVQDNRcYo7rGnuO0hiK/41Vka
   QZPIjCVr6jvJfrH16JO01tswnG2nBJwGcbnDCFHAqgrsF9UYHqJpYPJvL
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="165703609"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2022 12:25:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 29 Jun 2022 12:25:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 29 Jun 2022 12:25:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flApUIeDVsp606j/Cxkvwr9dqcr6jbbfZmP4jGhGjmK1rJX8ivMwL4SxwNjkLV0gkx91Hm0R2ht3zc/lKvU4g8aCWYGcUBs+sv4WFvpzxLwfEIh1Aq3vyfzWFbxNubDqEYJOjqhEzxspItcpaSeCe8wzhGdcQRfyYR4Ehe6XuVI8WkJqKrDfunPSfQdMM5GhRMkqn2Hb9ZO7Z9rjAxGUEZ7pLE5v7KxVUOHGmS3RQnPQrm8uR2vH0twHNZ64vOsOHEDCte8Mf1tu60AGHjlsTPX1JjPcn84shamtiMY/UgfzCTxMy8AwO9fiSVnc37D9A4jSy4S4SRKj5mBbZqXWfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4MgbrC8fL5KdgRtLj8QP2i/nFgdDyA8ckZDmFsUyq0=;
 b=Fsg8cnk4PqC9GYclXZfvnIoQy4X2LxqwyC204fycZPrIskRf8nkns7r98BwIY9/8o1pZ2W+4gL20iKIJzRbfXjE4kSQJoRNCMwth/5M22sOIlyCaPjIg7Qm7FsJtqeXGgEIoOvudpRgZD8n8HhPtkVwr0cvdx5YEtju5tQ0nuOk1JHhS4WMnOQj0dATLyj/z5d+9LlaSVzhK/0NJnl5k+9oeW6tsA//VuEjsk2BTn8TSXjb6a6DnG9Kzd7VFp5SVt9tlXTmsjn5U97Znl3K3L/q9ncjzD1swFQ+4BlDtk1M0XbuCS46EUi1bu+cAnHKumwGnY4YM2VGRcT/sSXTjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4MgbrC8fL5KdgRtLj8QP2i/nFgdDyA8ckZDmFsUyq0=;
 b=MbSNNhsjcVTkCRUum1L/EUlJVPCWHw0/ltiNpa9gx39hmzTyVjkK85UJ2R1TgrJNNm5FtAeogq8aNFjLOUMraiAeQlMTt0neax6S/1C2pVrKpjNRo/Xi1620qANjaF7h8ynMWTjncOPQSBcb0zDWHhdjpKwGXVUgEGgV0RigNEs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 19:25:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Wed, 29 Jun 2022
 19:25:41 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <Conor.Dooley@microchip.com>
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
Thread-Index: AQHYikaSsliGXUqkU0W62iFZL9A2pK1mrJEAgAAIIICAAAgGAIAAAp2AgAAEkQCAAAOXgA==
Date: Wed, 29 Jun 2022 19:25:41 +0000
Message-ID: <f569aff9-fbe1-66f1-d308-cec428aa5886@microchip.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
 <20220627165047.336669-10-sudeep.holla@arm.com>
 <bb124e47-f866-e39e-0f76-dc468ce384c6@microchip.com>
 <3656a067-cc3f-fd5b-e339-5925a856cce1@microchip.com>
 <20220629184708.x5exgjoy4sblyqml@bogus>
 <88ef07ea-fbde-b997-6c0c-99f5fb7be201@microchip.com>
 <20220629191250.mg3dybgl6hnlnqee@bogus>
In-Reply-To: <20220629191250.mg3dybgl6hnlnqee@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23a6bc45-3afb-483b-c726-08da5a0527c2
x-ms-traffictypediagnostic: SJ0PR11MB4798:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WpFD/Kfx4S1hRMIo/BGK2rH9lfBsigsrvEt962RjMXFuysLLmATMI7CzEvl70v38+c98RdkE2Owck3OwrzoRNPFxqBCupYR7qyJE64wd34UFNcPmIeJFrMP/FawO5mLLQHYGKjEaV3Smukt+xjd7Sz9k8o/iebtay8mgOOr3nlj8yDdQTTPGjLiVuSfHspyz9DyQk6GHP40y1GIZxtW5BlFAUJNJzr5HD31qIYYKJ5RuLrXrAL6VrE7gKTZHgWkql9s0SlOjn6VTTrK6UNNOxJN/YRb0MsnGPwCY1wG7GzWPJ1hmYkezRmZSaWvllQPnVVh7jzNO5u1xDUvxKd8eNHU4Qz0xDKGlqR6noSc/ftwPunztHbnJt16wPLd7TpfY5o0QZjjDw+azRTLPGuwGvYkm+x2X6bdhQ0Sb6aas7AEnX8Wv2vLShGcbe+fA3mPwjpCqCKMVXyUbjJF94lz2XrwcvObQP/UOxbbK7SIC4XAfQKlVBGw3Tb+8eblnSQ+JbEKYdo7760GjZR2WDMaYDVWPjU9eHveiin61MFf1s4IiJRRvpEO0d9132EfioSWeIIlr+SH/BLHsuGIbEH+3AebL7yG+u0FUV9HlgoULtfHujGlMP65Mp2Igz6Rz6KhbX7E8VbTz6VfeACTANufi1GkSkOrPEobLNlfxNc3Dna8hnBSw2XekMEdBEmir5FapxXLzykTlCpGyg7puDLkKFS4If7jpj3Jn3mC92LMHbyWSQJ1110yQnKFE/DaUiM5Ebk0IVOxOE6mgfR+POSFtkgCcc0G5HLhzot9QYukxOZe+7CW5y9W3oBwqJjbtGs81AASX4yitYdC4mM4RD3F/392kYm6XQRoWHMknQK4axwC1QgTshgKnP8rgISW6/vwVrSAVOLxRmVlbdMJAsg0EQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(346002)(376002)(136003)(366004)(396003)(86362001)(31696002)(8676002)(4326008)(91956017)(71200400001)(66946007)(76116006)(66446008)(26005)(6506007)(38070700005)(122000001)(6512007)(66476007)(6486002)(53546011)(64756008)(7416002)(66556008)(8936002)(478600001)(36756003)(41300700001)(107886003)(2906002)(966005)(2616005)(110136005)(5660300002)(38100700002)(31686004)(316002)(186003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2NxcUxHUk11UFlOMGJMQnpwTmI4cVY2c0prRGlrWkNpVnJkc3dtNXFvYUpZ?=
 =?utf-8?B?Q2lXSVp0cnBSVDUxSTVnZXNpUjlDQlRpZ21HUUdlKzVHcUdLaWN6ZFlRTnJh?=
 =?utf-8?B?NnFITnNJRUduek5SQ2JQaTlqOVBwUEtoMzVSYlVvVFNhMkxqTXkwKzFvZS9P?=
 =?utf-8?B?V1JCaDEyYXJiZVBCekZCK3pWYVFyVWJLbEJ6aW9mTUN2djI1QUVHQ0xGZnA4?=
 =?utf-8?B?WHcyakswVk1yQlprbEdncGNWcnV2Z1lOblhPSlZWOXZqbW8rcml6RkVaT2Zn?=
 =?utf-8?B?cEtzWk5qdWk4R2JpUUwyVnkyNG1tTGVOVEFDQWdIM3F2Mi9pMUZ4L3htOTNF?=
 =?utf-8?B?TmhkOVJXWnNIUjNTdTJLK2FlTGRUdG1mWjB4WU9Fa0FsN25QK3N1VjFFdnZS?=
 =?utf-8?B?RGRkLzAwRGpNaTk5dTYzTzVaalk1MXBpRVMyeG93dzFTcTY1endxT1ZkdWRJ?=
 =?utf-8?B?TTJydGpscEI0VnJVVWhvNlY2NENaVjZrMTJxWXdiMUpjTk1XUXhTaG1LalUw?=
 =?utf-8?B?TGFzV1ZqeWpLZms0Tkg2ejJ2anVmTi9lQ1ZFcThSVXVkcUtMbC9BVTQ2NEFr?=
 =?utf-8?B?S09zQ0krTXdLNmRIV1l5V3lOb2NqTjJaR1hOKzNjOExSalJBNzJ5cHNLMlVD?=
 =?utf-8?B?QUhURzJLdjdaYm9GQ3U5TWhVVWFiS09qS2w4dzYvVDR6TXNML0JseE91MnVB?=
 =?utf-8?B?SExUMmxCQ0EzSTgxejROb3dUOXRvbXJpSTdZVkMwcmo0dVVaL01hTFJpeDVZ?=
 =?utf-8?B?QzFYclFUTkV6LzRwWkdqRTlhMVVvYlFac2dNUGdVM3kwZTNYSm1YQkg4Wmhs?=
 =?utf-8?B?aGdHeCtKV2pjY1creVJsaHNKVDJjV2g1dlRWY2ZwMmhJZjQ5cU1SdTFKd3FJ?=
 =?utf-8?B?dVl1ZGpEcUREZk9YZjN0NUJ5YzJmNklqamRldGhZbWZxK2RsUWhJQ2dOWWNs?=
 =?utf-8?B?YmdXZG83NDB2OVE2d2FjQkI1bzkwMUI2SXljUGo0MGZ5bHZRVDVadXRsYVhD?=
 =?utf-8?B?T216YThxWGFMdysvUnFtcW1OOUVvYmtMTk51bHNzYmZKSVJsOFhzZHdaTG00?=
 =?utf-8?B?KzlEVi80UFpFZHBhQW16T0xiSjZMZlViZ25OV25hT2NJVzI5TlhKM3FDNUdr?=
 =?utf-8?B?SnFlMlNtNmRjMlNtekNiSmVjam1mQStHNjhXS0RBRnBsRVBHRWtEWVFxZ3Uv?=
 =?utf-8?B?cm9xZFlyemd6V0drdktzNUtaeFZiTWd3ZjF5WWZrcnNISk9ZamplcXJ3NExK?=
 =?utf-8?B?bzFjQlZWN0t6cFdUb200TzZUTWYzVjNZR2xrK2ZaVTYwMElRRVRZeHZQNnB6?=
 =?utf-8?B?M0cwdDMzcFdPN2JZZnplTWxRcUdYdGdZdmtyOGJoRUpHM2hxY0ZFcS91NXdZ?=
 =?utf-8?B?S3NPMk8rSzRaall0NnZJdzl5MXNXTk5ldEROSUZ3N0Z2cHNCTXhWR1ZodG1B?=
 =?utf-8?B?REZib3IvS3FXMDM0bWNnSkVUWks5UFgySVczOVRxM2Q4cDhmaHRvZVIxaktV?=
 =?utf-8?B?RFo3bm1naTk0T3d6b0JQRWhmWC85aHo3Sm5kaFphOG13YTZOc0V6UUtubDBX?=
 =?utf-8?B?ZVF3M3NJeFp5ckl6K0g2TUM5dmpoaDFSUWwyME04RXpSOUd3OWFIamVjN2or?=
 =?utf-8?B?OUtZQWVxdTR6NkVjWVA2QncwR3hHUGVJMEk2NnZUWUxBVkZscko5Zm1ldXVY?=
 =?utf-8?B?SEIrNmVNczlGTmhCWVI5RmE3aTlBQUpNUk92QUhNcGNwcVE5R05PYmI4QkUy?=
 =?utf-8?B?bE9IcWU4ZHkwWVNWcHlWMGlPVzd6c25hN0RiODhQUG9qSk9aTEwybExVTXRx?=
 =?utf-8?B?RklqMGhjN1ZhbnNuMDZGUWFjZ0lqTk8zdlo0eXJFM1RON2YrQ0Z2Sml1NGVJ?=
 =?utf-8?B?a3JUS1Z4VU5kMGN6ZHFkYzZBMWVWRWlWaDNoblVxbnN1OCtKZU04L0MwN0JP?=
 =?utf-8?B?UG1vRzludnpNRnZyK1V3bjg3V0dKSXovUU9UWUtJM0lYTHFNOGFWQzl1YVJE?=
 =?utf-8?B?OFNLSFB5Q2J2ejYwOUltUFNnQitvSkVrYStBL044VnN4YmJRYk1Selc3T00x?=
 =?utf-8?B?c01hR2dBN2J0QlhyM1JVU2JvUDFuOFRkcmsyaDQ3eG05ZnBvbGRDL0l5dU9R?=
 =?utf-8?B?dkE3U2c1cnZSNDUyZ1cvZVJDM25kTnVUN0d4VUdjcGhOZDVFR0wyTDlrb2Vz?=
 =?utf-8?B?Y2c9PQ==?=
Content-ID: <60FF93B296E0D84E92F8FDE2F18EA04B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a6bc45-3afb-483b-c726-08da5a0527c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 19:25:41.4290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGjW7tMM5FhrbXvxyNbX6aqeIghMv1gnCgze9KmHwWAlrEcakeeNfM5i2tWkxFa/nkoTOFS3fS4zDLyvnq7gTu7pRYv+paL8ZBViIRQQ8Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_122548_643154_3AA8214B 
X-CRM114-Status: GOOD (  27.33  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

DQoNCk9uIDI5LzA2LzIwMjIgMjA6MTIsIFN1ZGVlcCBIb2xsYSB3cm90ZToNCj4gT24gV2VkLCBK
dW4gMjksIDIwMjIgYXQgMDY6NTY6MjlQTSArMDAwMCwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5j
b20gd3JvdGU6DQo+PiBPbiAyOS8wNi8yMDIyIDE5OjQ3LCBTdWRlZXAgSG9sbGEgd3JvdGU6DQo+
Pj4gT24gV2VkLCBKdW4gMjksIDIwMjIgYXQgMDY6MTg6MjVQTSArMDAwMCwgQ29ub3IuRG9vbGV5
QG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+Pj4+IE9uIDI5LzA2LzIwMjIgMTg6NDksIENvbm9yLkRv
b2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+Pj4+Pg0KPj4+Pj4gT24gMjcvMDYvMjAyMiAxNzo1MCwgU3VkZWVwIEhvbGxh
IHdyb3RlOg0KPj4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+Pj4+
DQo+Pj4+Pj4gVGhlIGNhY2hlaW5mbyBpcyBub3cgaW5pdGlhbGlzZWQgZWFybHkgYWxvbmcgd2l0
aCB0aGUgQ1BVIHRvcG9sb2d5DQo+Pj4+Pj4gaW5pdGlhbGlzYXRpb24uIEluc3RlYWQgb2YgcmVs
eWluZyBvbiB0aGUgTExDIElEIGluZm9ybWF0aW9uIHBhcnNlZA0KPj4+Pj4+IHNlcGFyYXRlbHkg
b25seSB3aXRoIEFDUEkgUFBUVCBlbHNld2hlcmUsIG1pZ3JhdGUgdG8gdXNlIHRoZSBzaW1pbGFy
DQo+Pj4+Pj4gaW5mb3JtYXRpb24gZnJvbSB0aGUgY2FjaGVpbmZvLg0KPj4+Pj4+DQo+Pj4+Pj4g
VGhpcyBpcyBnZW5lcmljIGZvciBib3RoIERUIGFuZCBBQ1BJIHN5c3RlbXMuIFRoZSBBQ1BJIExM
QyBJRCBpbmZvcm1hdGlvbg0KPj4+Pj4+IHBhcnNlZCBzZXBhcmF0ZWx5IGNhbiBub3cgYmUgcmVt
b3ZlZCBmcm9tIGFyY2ggc3BlY2lmaWMgY29kZS4NCj4+Pj4+DQo+Pj4+PiBIZXkgU3VkZWVwLA0K
Pj4+Pj4gSSBiaXNlY3RlZCBicm9rZW4gYm9vdCBvbiBQb2xhckZpcmUgU29DIHRvIHRoaXMgcGF0
Y2ggaW4gbmV4dC0yMDIyMDYyOSA6Lw0KPj4+Pj4gSSBzdXNwZWN0IHRoZSBpc3N1ZSBpcyBhIG1p
c3NpbmcgIm5leHQtbGV2ZWwtY2FjaGUiIGluIHRoZSB0aGUgZHQ6DQo+Pj4+PiBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL21pY3JvY2hpcC9tcGZzLmR0c2kNCj4+Pg0KPj4+IEdvb2QgdGhhdCBJIGluY2x1
ZGVkIHRoaXMgaW4gLW5leHQsIEkgaGFkIG5vdCByZWNlaXZlZCBhbnkgZmVlZGJhY2sgZnJvbQ0K
Pj4+IFJJU0MtViBldmVuIGFmdGVyIDUgaXRlcmF0aW9ucy4NCj4+DQo+PiBJJ2xsIGJlIGhvbmVz
dCwgSSBzYXcgdGhlIHRpdGxlcyBhbmQgQ0MgbGlzdCBhbmQgbWFkZSBzb21lIGluY29ycmVjdA0K
Pj4gYXNzdW1wdGlvbnMgYXMgdG8gd2hldGhlciBsb29raW5nIGF0IGl0IHdhcyB3b3J0aHdoaWxl
ISBJIGFtIG5vdCBhdA0KPj4gdGhpcyBhbGwgdG9vIGxvbmcgYW5kIHdoYXQgaXMvaXNuJ3QgaW1w
b3J0YW50IHRvIGxvb2sgYXQgb2Z0ZW4gaXMgbm90DQo+PiBvYnZpb3VzIHRvIG1lLg0KPiANCj4g
Tm8gd29ycmllcywgdGhhdCdzIHdoeSBJIHRob3VnaHQgYmV0dGVyIHRvIGluY2x1ZGUgaW4gLW5l
eHQgdG8gZ2V0IHNvbWUNCj4gYXR0ZW50aW9uIGFuZCBJIGRpZCBnZXQgaXQgdGhpcyB0aW1lLCBo
dXJyYXkhIPCfmIQNCj4gDQo+PiBCdXQgaGV5LCBvdXIgQ0kgYm9vdHMgLW5leHQgZXZlcnkgZGF5
IGZvciBhIHJlYXNvbiA7KQ0KPj4NCj4gDQo+IEdvb2QgdG8ga25vdyBhbmQgdGhhdCBpcyByZWFs
bHkgZ3JlYXQuIEFueXdheXMgbGV0IG1lIGtub3cgaWYgdGhlIGRpZmYgSSBzZW50DQo+IGhlbHBz
LiBJIHN0cm9uZ2x5IHN1c3BlY3QgdGhhdCBpcyB0aGUgcmVhc29uLCBidXQgSSBtYXkgYmUgd3Jv
bmcuDQoNCkF5ZSwgSSdsbCBnZXQgYmFjayB0byB5b3Ugb24gdGhhdCBvbmUgaW4gYSBtb21lbnQg
b3IgdHdvDQoNCj4gDQo+Pj4gSSBhbHNvIHNlZSB0aGlzIERUUyBpcyB2ZXJ5IG9kZC4gSXQgYWxz
bw0KPj4+IHN0YXRlcyBDUFUwIGRvZXNuJ3QgaGF2ZSBMMS1EJCB3aGlsZSB0aGUgb3RoZXIgNCBD
UFVzIGhhdmUgTDEtRCQuIElzIHRoYXQNCj4+PiBhIG1pc3Rha2Ugb3IgaXMgaXQgdGhlIHJlYWxp
dHkgPw0KPj4NCj4+IEFGQUlLLCByZWFsaXR5LiBJdCdzIHRoZSBzYW1lIGZvciB0aGUgU2lGaXZl
IGZ1NTQwICh3aXRoIHdoaWNoIHRoaXMgc2hhcmVzDQo+PiBhIGNvcmUgY29tcGxleC4gU2VlIHBh
Z2UgMTI6DQo+PiBodHRwczovL3N0YXRpYy5kZXYuc2lmaXZlLmNvbS9GVTU0MC1DMDAwLXYxLjAu
cGRmDQo+Pg0KPj4+IEFub3RoZXIgYnJlYWthZ2UgaW4gdXNlcnNwYWNlIGNhY2hlaW5mbw0KPj4+
IHN5c2ZzIGVudHJ5IG9mIGNwdTAgaGFzIGJvdGggSSQgYW5kIEQkLg0KPj4NCj4+IENvdWxkIHlv
dSBjbGFyaWZ5IHdoYXQgdGhpcyBtZWFucyBwbGVhc2U/DQo+IA0KPiBJZ25vcmUgbWUgaWYgdGhl
IGNwdTAgcmVhbGx5IGRvZXNuJ3QgaGF2ZSBMMS1EJC4gSG93ZXZlciB0aGUgdXNlcnNwYWNlDQo+
IHN5c2ZzIGNhY2hlaW5mbyBpcyBpbmNvbXBsZXRlIHdpdGhvdXQgbGlua2luZyBMMiwgc28gaXQg
Y2FuIGJlIGNvbnNpZGVyZWQNCj4gYXMgd3JvbmcgaW5mbyBwcmVzZW50ZWQgdG8gdGhlIHVzZXIu
DQoNClllYWgsIEknbGwgc2VuZCBhIHBhdGNoIGhvb2tpbmcgdXAgdGhlIEwyLg0KSXQgd2Fzbid0
IGluIHRoZSBpbml0aWFsIGZ1NTQwIGR0c2kgc28gSSBndWVzcyBpdCB3YXMgYWRkZWQgYWZ0ZXIg
dGhlDQppbml0aWFsIGR0cyBmb3IgbXkgc3R1ZmYgd2FzIGNyZWF0ZWQgYmFzZWQgb24gdGhhdC4N
Cg0KPiANCj4gQ2hlY2sgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1PG4+L2NhY2hlL2luZGV4
PGk+LyouDQo+IEwyIHdvbid0IGJlIHByZXNlbnQgdGhlcmUgYXMgdGhlIGxpbmsgd2l0aCBuZXh0
LWxldmVsLWNhY2hlIGlzIG1pc3NpbmcuDQo+IFNvIHVzZXJzcGFjZSBjYW4gaW50ZXJwcmV0IHRo
aXMgYXMgYWJzZW5jZSBvZiBMMi4NCj4gDQoNCiMgY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1
L2NwdTAvY2FjaGUvaW5kZXgwLw0KY29oZXJlbmN5X2xpbmVfc2l6ZSAgICBzaGFyZWRfY3B1X2xp
c3QgICAgICAgIHR5cGUNCmxldmVsICAgICAgICAgICAgICAgICAgc2hhcmVkX2NwdV9tYXAgICAg
ICAgICB1ZXZlbnQNCm51bWJlcl9vZl9zZXRzICAgICAgICAgc2l6ZSAgICAgICAgICAgICAgICAg
ICB3YXlzX29mX2Fzc29jaWF0aXZpdHkNCiMgbHMgL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1
MC9jYWNoZS8NCmluZGV4MCAgaW5kZXgxICB1ZXZlbnQNCiMgY2F0IC9zeXMvZGV2aWNlcy9zeXN0
ZW0vY3B1L2NwdTAvY2FjaGUvaW5kZXgwL2xldmVsIA0KMQ0KIyBjYXQgL3N5cy9kZXZpY2VzL3N5
c3RlbS9jcHUvY3B1MC9jYWNoZS9pbmRleDEvbGV2ZWwgDQoxDQoNCmNwdTAgaXMgL25vdC8gdGhl
IG9uZSB3aXRoIG9ubHkgaW5zdHJ1Y3Rpb24gY2FjaGUsIHRoYXQgaXMgbm90DQpydW5uaW5nIExp
bnV4Lg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
