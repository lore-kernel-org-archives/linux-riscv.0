Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09100C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRwnr8MnB04ouvjERp1u3ZUcYaE8OgQvVBhBcEztK1Y=; b=qt/BIJY9k8+UFQ
	FCwYN0+me/o2bP2zTJFCQ6hdenSKSaEKyV+CXwHcfguZHmV7ktirkyJ/Ig/IakV4UKD5qVEmEthpd
	eTHXMYGhP4R7CZfVMXgGyiR23kQeUoDTpRi8FDbMChy1MkyUx893e7+5RHdgOlHAGPQvG29ColTxC
	wHPbwrNJ4Qc5F/RatXxOvYvQcOomsI5hF7LeY2igCWOGzlZF5LOAip4pPMmiUkW1k7J39/m2JF3gd
	bwHIiO8U0CoyeNBhnaWqR56DlnldWz3jm46HK6ihKXpLkXCxUT2IKRRNkRE27iHCkTtgizPSCy6Kk
	jKw4Ywr0Kls/QvP7KjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wuA-000aye-By; Thu, 30 Jun 2022 16:20:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wu2-000auk-GS
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 16:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656606026; x=1688142026;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IvryVm35M7XaaFczN1NEItQqso5NUvMa5/2a5x79jbk=;
  b=lkGDoFHTudM746BRJN4n8Lysum4vbkbD1pBuaTANoctavd98JE0AEpVw
   OBUyK2TjS3ou69D9g7H87jjIHy2B42Rn3FAUsaKcJ2BxWJQd6i19SGo1Y
   LDR3Vz0KmN4fl6F8AIcWiVWvPM7B62YIYtJcUZsZXFVS/5tpYA2HtUo9Q
   4w8UkzOnGfFxcnmzsYgOMA4MoIekQmL0pgamsk5tOkaq7I0UvzPcc4ctN
   Bj//lfSAlrlGuypw5dmYCHcKT5JydzIojXRZdpIL4iNzUczGutNQSgeRR
   i1YvfAAWw3RzXmX7gcjV/49ic8c7aEKXZKFNgHpjhLlaP27yXS/0z5qK+
   g==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="170560878"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 09:20:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 09:20:21 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 30 Jun 2022 09:20:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgRPre/JIUco4PZMpsn8QNjJxv/1gTBw4/0FG45w2DNS8gZecn550e4FYcNKbNYD1rP1yLT9cpm6aLz7VfFnMJ4qJLoyji7uR9HahMl2zCmvH+9qjBJAw0C95+YdURcpvpHjyLCSfxGsb6tjr/qyeyWn1uc5c3RTGIrnCVy2SOtCF7nZKzo2uoZcs+m3V/NSXB3St2aaf0yeQXzUyNh03ZF+r71sgu8PQNgrkPJx4nEvg11h+ZpOi1WJI0EQPMn6soH/D6S9+qj8OCC+6gGUUbtPGQ+zTTzzQavBk3AjKxivtDFiDtDhYJxj/LzMs/7DWswZxBnusSKQeGv3M0RJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvryVm35M7XaaFczN1NEItQqso5NUvMa5/2a5x79jbk=;
 b=IQqFOZcLY0tcl3Qz0zaWW3D62Q7SCpPc0aLdl71ZOu8Ve4flFfeYPHPESN7nzaWNDqpT0Nt5sEA0QZ8QHkFEIjvP08OUYn9rrWyGJFGbvESN1kOknZJVfRwW+qHhemDJfazfbfnu4rKn9/Kh5aioVXLP3TWkpznsih6BhbTGWUT+mPSfVsXlGYT2pZjBcL2TyZxsj2D0tBfKuXI63Vk3rIhzPlxjiQoke32XoN4S5T+xqdxAWbBuC9bFJ6XOx5HjA7iqlR2hzQAZmdhwt9+RrDO2zdoxA660Hzo/tvoghiHDkMQsiSWN0TXb9Kqe6dh1SdHnALNY3zhsUX3ihkaSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvryVm35M7XaaFczN1NEItQqso5NUvMa5/2a5x79jbk=;
 b=RRFy9Os9m4RkfGVMJIy4q2IpPnyc8rXrFYBXlmS4raevaJ1rbjm4JypsfMkRsfqSSDGg4w8BUsVG5EFxoRy4ZlNYLuchOC1Fzn1wHKShOGCL1H8issRRdTkfNE0JL4pRVXLPPe55MxG5AaZsSy4oQJF48aWRBohcU2+8n6fvYnE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH2PR11MB4392.namprd11.prod.outlook.com (2603:10b6:610:3e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 16:20:19 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.022; Thu, 30 Jun 2022
 16:20:19 +0000
From: <Conor.Dooley@microchip.com>
To: <p.zabel@pengutronix.de>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <palmer@dabbelt.com>, <Nicolas.Ferre@microchip.com>,
	<Claudiu.Beznea@microchip.com>, <Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 04/14] reset: add polarfire soc reset support
Thread-Topic: [PATCH v1 04/14] reset: add polarfire soc reset support
Thread-Index: AQHYjFiLUdivMuF33kSysKGuotnsQq1nqk8AgAB3kwA=
Date: Thu, 30 Jun 2022 16:20:19 +0000
Message-ID: <eed577e2-b416-dfea-a830-2c037e34ac64@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
 <20220630080532.323731-5-conor.dooley@microchip.com>
 <813a3b51f82a11a86bd3af2c3299c344e08e8963.camel@pengutronix.de>
In-Reply-To: <813a3b51f82a11a86bd3af2c3299c344e08e8963.camel@pengutronix.de>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d04aefa-0008-40b6-ac65-08da5ab46cff
x-ms-traffictypediagnostic: CH2PR11MB4392:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zcM7B35t3YKSOBIOkHkRmsgiD+NgVc1VrsvUTDCq+J+mCAroTvEbwjzxOjFijBb7L8uX3GsnciUaQjmqb4FeIOCFIXaztNdfn3V6Gd7ac31jjWiN0ZZ2bpv2eHmv0Tk6nEsLmfI/U5i/xUh0iI67jrrLfql7MhdnjUbaIB4ReqAhgxjqMvKBPJoIQIjHH0+SgJxN7nO0Xwy34Z7Ig5NpcLol/hu+mHYYPop1f2KdXF5bSaL6Dw6xFsGcsN1oGjpYBwxs+0YraQDb1Px+lWEpQ09bFS1BO1AND+gg222ycubARKt3aAdA0LtUCI23luirwbXie7hdhBRelZt/QCNPYOyQpPLqsnBV3QEP60ZRYkRkeNdqnE9BYmev9Kf7/IsbLhqnvY3vy1VhMSV9RTrqfgqAL/HlRTC4dYQV63cQR31lysnnlHEqfXeW2Fj3Jy3VRgYynTjV8vqbfrxkxbuv7wH6XcQg5yBJr7Zwlb2C+WAfqX+U3mGHWZ/2hLTXFPQDrWlIFARRUokBA8duSCx8lHzYrKAzUjp/8RdZ1KJFWPWQsVlm/8icf7jc1WFNrvc4I/fWYXmhP6g7pdGBcew3l83hwpU3LK63k0soIFZcug4mP6ETBVtQ2lCKELkolhptEqnVgetx4mSOUyTZVnHz9gcfLYp4IOCZQadAWl3UXoOwXD4qs35s30la+352S5GDuzQii9pWqC9cJvqCaXqm4uADgOJSvBkscfVW5sn8VgU3KjFzBYj+VgKtc8C69//EIQiCkgud7/EUcakJuRmr+cRh7wp7n+DQyjch/QsL1Vb/iG9KersqeYxj1Q+5LBVxPgFUqLFZBSUvhz57cxB3LfFNkdiLNXzObC2ujQJx6qce5nTnKgYq1V7UUdzo4GlQWr/XgBwtOobINpT2JGe4cg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(39860400002)(346002)(396003)(136003)(7416002)(2616005)(41300700001)(31696002)(8936002)(5660300002)(2906002)(38070700005)(186003)(6512007)(86362001)(26005)(71200400001)(6486002)(478600001)(53546011)(6506007)(110136005)(38100700002)(4326008)(6636002)(91956017)(8676002)(66476007)(64756008)(66946007)(66556008)(31686004)(76116006)(66446008)(316002)(122000001)(83380400001)(36756003)(921005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czExQWdWSGo4VWlheWdrVDkxR3N2cWFkMVdaaUt5cUwwT05RVmZnMUNOL0Fi?=
 =?utf-8?B?NW9JdWJFay8wZ1BHMGRZWEVpelQvK0VhUnd6dENyemlEc3p5dFlqVVVvaUhI?=
 =?utf-8?B?Y1pFcm12TEVtUCt0L3pObHdraHYxd2VhdWlPcm1xbVZTMm9lWUQ3T2dIL0x3?=
 =?utf-8?B?VEE0bkJPVGdTOWp2dlBNaWRmNmdqZVdwY293dlNaa3lYZ2xYMkovd0FnS3dV?=
 =?utf-8?B?N1ZYekllQ1F1alR2bE1ocCtPZWE0cjdYR25zeGwvUWRXZjVncEJUSUYydEJh?=
 =?utf-8?B?RlNSMkJGRXlISGxlbHIvb3FiSkVmOFR1KzM0WEhVdCt2dFh2RU1FWWxRdFlw?=
 =?utf-8?B?ZzJ4YWVFUlpPRGwxZDF1cG9URm5uTFRFMHBYMXgyMTVmMkhQUFRiZ2lrS3Y3?=
 =?utf-8?B?WEF5ZUxUYmF2UVN3UngzWDZtRWJrTFRWR0JjUUx4L2pZSEpZYVBlOHVRRE9u?=
 =?utf-8?B?c1Bwcm9VRjZLMGVMTzNvdzNQWlZ2M2FjQVZTZkRyaTQvUnBYSmZod0c5dmho?=
 =?utf-8?B?eFQrNklGdDh1ZlRNY3JYUmpwa0N0TUpQajFSVzVJMG9KSUVwL051N0g2ekpL?=
 =?utf-8?B?TS8vdHRwbHFDaDJvYnlsUXc4T1RpcWpHV3U1WFhScEpiOVZWNDZ6S0dJdDVm?=
 =?utf-8?B?NmhUNkwxci9GSFc2c0xqME1YdlhDOCtSUEI1RVBLQXVLc0RJNjlkQlZ6Rk51?=
 =?utf-8?B?NEpEcFdVOVNMMm5aSk1iZlhQKytER0wrSnRYZHpCSi9XUHhyQi9TRmhkdTB1?=
 =?utf-8?B?U21LRVJxU20zVmoxVk5qWGdjSWI1ZVFKV21aM0RoLzJoTnVxaU9Rb3o0YzIw?=
 =?utf-8?B?SXNFV2FMc0ZKclZRajYxMFNVTllZbzlNNHVVNXFTYnNtc2pxYzZNUEVvK1h1?=
 =?utf-8?B?VUg2c1VpMTZFeDNsME8yc2pTODNLSi9EYktKTHdOSGthNWFtLzFWcDcvdE5V?=
 =?utf-8?B?V2x4RlNNQXBXZU1UdFVMOUtkZGk0Q2VvQ2F2bjJRSzU5ODlqU2ZqZjBuQkYr?=
 =?utf-8?B?aDNTY0RXN2JvWTJNYm4xUDd2S3JUV3BkbUhjVEplaTJrQWtCbU80MU5UcE9E?=
 =?utf-8?B?YjhrYWQ3R0p6cXVqVXRGeGxKZGg2bzBpTlJTL3pjbitnYzhiL2s2MTI4US9x?=
 =?utf-8?B?ZXRYakoxcEpQc3M1dGdSRlBQVHlldE54a0R6SU9CclVXR05sdjhzYXdFOUlo?=
 =?utf-8?B?TFF6YXFjR1BvK3VqUWxoTU0wa1VkTXJyQjFYNUF1WndaaE5wbjEyUUk1akh0?=
 =?utf-8?B?SStja2VBQ2JxNHdMKzNoNnRvdW9NTklFM3JQdUFlSTVsRXRYREhpREVYV3Fa?=
 =?utf-8?B?emxhSHJCYWtUbkxiVmNHY0xWMWIzVlNnVUVjVSthVW0wRTVqaTFJR2RORW8x?=
 =?utf-8?B?NXFKaWRwYzZ2MVQyUnBIRk1CbHdyYUFBN0FJRFQyeDBSZVdIMVhkMlIyTStw?=
 =?utf-8?B?VDE1d3NLV01pb2RYaWdwZVowTGtZS1hCb1BHT3grM2dGS0hEZFFEUmMwK05M?=
 =?utf-8?B?VlhzUjhrMXFGSGpaS0lQdDlBQTk1MnZxRlhkKzNhejVicnlKV2lZTXhXM1hu?=
 =?utf-8?B?WllXTmlSSEYrMzBuTmN2LzhoVjhzWG15N2VXZWRJOTRwRnBJSjIzTjcyblda?=
 =?utf-8?B?S1hhUzh0KzI5N25kZDZHQ1JBRDczejllZU5ERE9hVGNCOG56OXdDbGdBZjVM?=
 =?utf-8?B?dmVmNkJ2RXUvaEZMY1VTN3RpbGNXak9aUTFUZGwzZ1doS0VXZk56bmFOenpL?=
 =?utf-8?B?L0VqSnY1RE9xcUZ6djE1dEJyeHN3RVVxbGFVR2gzY0RadDErWk9DYk8zSkVs?=
 =?utf-8?B?NFp5TzBUU1BrYWxnbDZvUlRsRDBVbms3V3FmdUhmWU5KWWJ6SmJkUEI0dUlt?=
 =?utf-8?B?Z0lYRW1WZGd6QktmeTI3NTNLeE5SSWowcjZsVGZWb1Nqc3FIeGZ3VkxVYUR2?=
 =?utf-8?B?MTFPUlZ6RVR4RW5yWmtsakxCTXB3ZDhpMG8wQko2ZUxvREFaYUxNNktvMlhk?=
 =?utf-8?B?V2hWSlU1cThNRzJQWTczYUNkSklsVWpZMC9sb2NvUDlIZG5SbGMzTk1tZWFG?=
 =?utf-8?B?NHdRbkxHRWVpeE0zellOM0dwc1hwQ1prcWZWdmZtcmsweHc0T2l4QlZXeTBs?=
 =?utf-8?B?UDJvckU2TFNpUWhIRFhaYnZUT2VpMFRHLzhWclByaUg5dFAxWUNUQlo2Rmdl?=
 =?utf-8?B?QlE9PQ==?=
Content-ID: <33FA11B684C06E4CB076FA3678F7EE2E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d04aefa-0008-40b6-ac65-08da5ab46cff
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 16:20:19.5342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyQitjiK2nfN+pBvGfk3GG+obsxh/73FO1pi6BlT+PvwuUUli3Z6EnUUq7fxPUuUtuKdmuwVTl1rAdu/1FZoJQajmALSOww8eR+ZORBv/vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4392
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_092026_700752_AB9D9D6E 
X-CRM114-Status: GOOD (  21.20  )
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

On 30/06/2022 10:12, Philipp Zabel wrote:

(This came to me oddly quoted, so I have fixed it myself)

>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> Hi Conor,
>> 
>> On Do, 2022-06-30 at 09:05 +0100, Conor Dooley wrote:
>> Add support for the resets on Microchip's PolarFire SoC (MPFS).
>> Reset control is a single register, wedged in between registers for
>> clock control. To fit with existed DT etc, the reset controller is
>> 
> existing                     ^
>> 
>> created using the aux device framework & set up in the clock driver.
>> 
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  drivers/reset/Kconfig      |   9 +++
>>  drivers/reset/Makefile     |   2 +-
>>  drivers/reset/reset-mpfs.c | 145 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 155 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/reset/reset-mpfs.c
>> 
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 93c8d07ee328..edf48951f763 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -122,6 +122,15 @@ config RESET_MCHP_SPARX5
>>         help
>>           This driver supports switch core reset for the Microchip Sparx5 SoC.
>> 
>> 
>> +config RESET_POLARFIRE_SOC
>> +       bool "Microchip PolarFire SoC (MPFS) Reset Driver"
>> +       depends on AUXILIARY_BUS && MCHP_CLK_MPFS
>> +       default MCHP_CLK_MPFS
>> +       help
>> +         This driver supports peripheral reset for the Microchip PolarFire SoC
>> +
>> +         CONFIG_RESET_MPFS
>> 
>This doesn't look intentional.

Correct. I fixed it when rebasing on -next and forgot to re-fix it
when I had to reset back to -rc2...

>> 
>> +
>>  config RESET_MESON
>>         tristate "Meson Reset Driver"
>>         depends on ARCH_MESON || COMPILE_TEST
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index a80a9c4008a7..5fac3a753858 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -17,6 +17,7 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
>>  obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>>  obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>>  obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
>> +obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
>>  obj-$(CONFIG_RESET_MESON) += reset-meson.o
>>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>>  obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
>> @@ -38,4 +39,3 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>>  obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
>> -
>> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
>> new file mode 100644
>> index 000000000000..49c47a3e6c70
>> --- /dev/null
>> +++ b/drivers/reset/reset-mpfs.c
>> @@ -0,0 +1,145 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * PolarFire SoC (MPFS) Peripheral Clock Reset Controller
>> + *
>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries.
>> + *
>> + */
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <dt-bindings/clock/microchip,mpfs-clock.h>
>> +#include <soc/microchip/mpfs.h>
>> +
>> +/*
>> + * The ENVM reset is the lowest bit in the register & I am using the CLK_FOO
>> + * defines in the dt to make things easier to configure - so this is accounting
>> + * for the offset of 3 there.
>> + */
>> +#define MPFS_PERIPH_OFFSET     CLK_ENVM
>> +#define MPFS_NUM_RESETS                30u
>> +#define MPFS_SLEEP_MIN_US      100
>> +#define MPFS_SLEEP_MAX_US      200
>> +
>> +/*
>> + * Peripheral clock resets
>> + */
>> +
>> +static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +       u32 reg;
>> +
>> +       reg = mpfs_reset_read(rcdev->dev);
>> +       reg |= (1u << id);
>> +       mpfs_reset_write(rcdev->dev, reg);
> 
> This is missing a spinlock to protect against concurrent read-modify-
> writes.
>> 
>> +
>> +       return 0;
>> +}
>> +
>> +static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +       u32 reg, val;
>> +
>> +       reg = mpfs_reset_read(rcdev->dev);
>> +       val = reg & ~(1u << id);
> 
> You could use BIT(id) instead of (1u << id).
> 
>> +       mpfs_reset_write(rcdev->dev, val);
>> +
>> +       return 0;
>> +}
>> +
>> +static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +       u32 reg = mpfs_reset_read(rcdev->dev);
>> +
>> +       return (reg & (1u << id));
> 
> Side note, this works because MPFS_NUM_RESETS makes sure the sign bit
> is never hit.

I can add a comment to that effect if you want?

>> 
>> +}
>> +
>> +static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)
>> +{
>> +       mpfs_assert(rcdev, id);
>> +
>> +       usleep_range(MPFS_SLEEP_MIN_US, MPFS_SLEEP_MAX_US);
>> +
>> +       mpfs_deassert(rcdev, id);
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct reset_control_ops mpfs_reset_ops = {
>> +       .reset = mpfs_reset,
>> +       .assert = mpfs_assert,
>> +       .deassert = mpfs_deassert,
>> +       .status = mpfs_status,
>> +};
>> +
>> +static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
>> +                           const struct of_phandle_args *reset_spec)
>> +{
>> +       unsigned int index = reset_spec->args[0];
>> +
>> +       /*
>> +        * CLK_RESERVED does not map to a clock, but it does map to a reset,
>> +        * so it has to be accounted for here. It is the reset for the fabric,
>> +        * so if this reset gets called - do not reset it.
>> +        */
>> +       if (index == CLK_RESERVED) {
>> +               dev_err(rcdev->dev, "Resetting the fabric is not supported\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (index < MPFS_PERIPH_OFFSET || index >= (MPFS_PERIPH_OFFSET + rcdev->nr_resets)) {
>> +               dev_err(rcdev->dev, "Invalid reset index %u\n", reset_spec->args[0]);
> 
> s/reset_spec->args[0]/index/
> 
>> +               return -EINVAL;
>> +       }
>> +
>> +       return index - MPFS_PERIPH_OFFSET;
>> +}
>> +
>> +static int mpfs_reset_probe(struct auxiliary_device *adev,
>> +                           const struct auxiliary_device_id *id)
>> +{
>> +       struct device *dev = &adev->dev;
>> +       struct reset_controller_dev *rcdev;
>> +       int ret;
>> +
>> +       rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
>> +       if (!rcdev)
>> +               return -ENOMEM;
>> +
>> +       rcdev->dev = dev;
>> +       rcdev->dev->parent = adev->dev.parent;
>> 
>> s/adev->dev./dev->/
>> 
>> +       rcdev->ops = &mpfs_reset_ops;
>> +       rcdev->of_node = adev->dev.parent->of_node;
>> 
>> s/adev->dev./dev->/
>> 
>> +       rcdev->of_reset_n_cells = 1;
>> +       rcdev->of_xlate = mpfs_reset_xlate;
>> +       rcdev->nr_resets = MPFS_NUM_RESETS;
>> +
>> +       ret = devm_reset_controller_register(dev, rcdev);
>> +       if (!ret)
>> +               dev_info(dev, "Registered MPFS reset controller\n");
> 
> Is this really useful information for most users?

Probably not, but it is useful for my CI haha.
If you don't like it, I will remove it.

> 
>> +
>> +       return ret;
>> +}
>> +
>> +static const struct auxiliary_device_id mpfs_reset_ids[] = {
>> +       {
>> +               .name = "clk_mpfs.reset-mpfs",
>> +       },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
>> +
>> +static struct auxiliary_driver mpfs_reset_driver = {
>> +       .probe          = mpfs_reset_probe,
>> +       .id_table       = mpfs_reset_ids,
>> +};
>> +
>> +module_auxiliary_driver(mpfs_reset_driver);
>> +
>> +MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
>> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS(MCHP_CLK_MPFS);
>> 
> regards
> Philipp
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
