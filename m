Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32DFC19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 08:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syhIbjQVfGAG2E8s/3MkLP+EUQvEq/FgyLlN0t5y/rk=; b=US29kzwASbIJTR
	x7A7mS70BjEI/XzFtsLTt9Id5VpdMBiPuRpkM4W2rZqSXYlK586YFl91XVtpU3X5UcKJRee/nbhc9
	iimNKHRZYtBThbkWP+Qx0YhKBP66VU840uNFAbJsoicleuoBMZVEMARwOZjLmcy06yKySZeq9lCkw
	Sg1P8BkTYSMkDAJAj/Vtiyo1+PCcBfvq8HRWYoO/EXZbflh7C/SFKmHLQWrPID1QXnGt5BSxH8r91
	pAYTxD0dLwD0M5wmWTzcrnYPf2rCOLFG0+wJ65mxDoSgnCeQ1KfNQq/30D64gI80lkS288rhKMKfu
	82J4LfDRAAGOLdDoQ5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM38d-00A8pp-HZ; Thu, 11 Aug 2022 08:01:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM38Z-00A8kv-4r
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 08:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660204912; x=1691740912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qBreVjxkYnu0QUb04w6mXe6e5UWPfI4hoyN5t6A0//g=;
  b=rl0pCZw/deumjSjU3FVb5+148pJXunZW1EPDIhTD1xu+HU0KVmrXnhcH
   nyFxI5DV3qT12Q/PLzPpkbEt0WNfJbnfVY+AcNQYtzvhiVz87pSuLIkcm
   tKWcTM3m3IbBAUKOO8kqePcNh77jVLIkvKSoKBn5OkdxzoAOxwk1XnheI
   5inHTkxRYnR/Z8dhwF6NHJ+GZsHD9lxTAVkoWZQaFfWPHZnprAhenVP/C
   t+DiWy5SM9aXq/lyxeVEhWiLS+Xq0O+eVQHP8JCXF4NsdZKJPV8/y/5Sh
   s1iC/vTenaCSXaJB1TXdIAx3GWSHMfTiTi2MMafs0v5kJO+TjsFeHkhrB
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="175810390"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2022 01:01:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 11 Aug 2022 01:01:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 11 Aug 2022 01:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbgZyAdndxd9fMmZqcOTVK7i/F/ciV+a3OhvvGioeJhRtZM0G+PAOnBRC4GnzRw9VNjKZ8SZxeDsIIweB+jp4yNgpOs8yR199TU2egHm8wpqE9WY4zdr9kRQ1kfVJ2Ub9Z7sja91NgfishVaD0x2jSKuijsZ836AJqwJx1jzx/ApeY6x1bWEMsI0pUyUSYDX7gwdNvESpcG0uStaLCY8WWgjhUKum/EDV+zEzl/txbNJ62z6r32i6DFrHgsSs3TZgSZW8jlDz0gW53dZ0lgOcv+8mAzEjoFKsz1CUA5ZBe4paWUtvTf/bqXzaookm9TM9lIeYtObMi0zDXNWE+eKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBreVjxkYnu0QUb04w6mXe6e5UWPfI4hoyN5t6A0//g=;
 b=KzaKja7BTMehqkynV0aQ8RjR+PNbtsUDcN5g08R5vva/BOX4UQcvgBqyfmLJi51N9QYUmlf0fU6FuIeQBN+0xIFTyJOhxRktPNjxavGDoNdIRAOW6SpLzPh1m4WnQZ4vG3RYnG7LWvzfvxrqPDLwDQBrZhZXXZQxUCPmfgUAprSGlv/cBSDoLuhoRAcqBpj4XORt7B7f881fNUmRcCxeLd4aWmaNcOWdQHNkDx2deOFppeoKo3zKDV0P5LE2Udmtj3rtDOM4fP3wfbDm8t7cPFmXT6CeFb3pU8u/OA8jvg58DqqRQPQCUC5YfEoYL0yeZk64jhWCQNSdkYqWC+OVVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBreVjxkYnu0QUb04w6mXe6e5UWPfI4hoyN5t6A0//g=;
 b=YWSdZyi2obgOWTt+TSIT8oNNXqV4ceEyy6/+t6DTHMT9CVed9/VfzTewOvetTRJmTRj48JXAU/nvMJMCdYZOPV7zH28LYZqTGpQZipvOCLCOV7tfGTP7R/Vy6QkmTN8tF5+KLqu4PI9iMtIDVLhfqTwbps72QHbjpiHtoQGnjpw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 08:01:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 08:01:37 +0000
From: <Conor.Dooley@microchip.com>
To: <lukas.bulwahn@gmail.com>
CC: <Daire.McNamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<wsa@kernel.org>, <arnd@arndb.de>, <kernel-janitors@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP POLARFIRE
 SOC SUPPORT
Thread-Topic: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP
 POLARFIRE SOC SUPPORT
Thread-Index: AQHYrVDAFjo5LcJuaEKmHCoveAZVwa2pSTkAgAAFHQCAAAgfAA==
Date: Thu, 11 Aug 2022 08:01:37 +0000
Message-ID: <962d7dce-e80e-0cf6-d346-4ae7bef892df@microchip.com>
References: <20220811070506.12252-1-lukas.bulwahn@gmail.com>
 <47742925-2d0d-7313-f811-aa17e35ce81a@microchip.com>
 <CAKXUXMzaR_503UMXmoRe4CvUuek50VJb+33R6xYf3Op4tw78ZQ@mail.gmail.com>
In-Reply-To: <CAKXUXMzaR_503UMXmoRe4CvUuek50VJb+33R6xYf3Op4tw78ZQ@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 683f3d73-d8e6-41af-0e8a-08da7b6fb7a4
x-ms-traffictypediagnostic: SA2PR11MB4905:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HQx04PQs23r/50wHzlOYKFOlKl55bCLb7knkm+25BEt89UmW7I9fOTkZ+O2caSNTosNky7AT1PZf3WHjtOVkgocX1jZkuZk7MWHRhZXnYWfS4BvOeLdGANtJL+yIdi7D3Rx7JsV5yr9qqnE2kfPTYc8WXz0rmY+nZwvxtBAGar2PI3OoU3H7Jc4ebBQ+uazxHYC5fu+KOrwSPM5w5+jOy3pREHvY6CD9r1GtVZKu14kFMQc3lAnWNwKLP9CAs6jZmG2U/JPH6ZbQGpxwzNbE2joe3Nva8qEnXCDvX1j/M3em1zrgOJUJRDR8KsRVkdCTGAvyL5C/kpVTNKKnnYSek8I9oece/PiM3+682qKgbGBajPQaD9vpkq7z2ytfPbJwBQiKr/TNxskMpbHLWTgXsmU4tHPl8Zpox5fZOB74SOr1I5Ee9SXpTIhIubchULBm5bnw2jlzhWbErh8eQUdNrmukf5jqwjP4QTumSVGgnPK/GFDaElA2eIghrFcamRr4qv5fvwFT9m1m/CpAtVxXvep/J5clN+NqQCEmpzhop4g+oynHsDU3s68FcvbezeNDEy3E7ofJ7pmld8uMqBchOumd8yjZnoOWt50dMMeM4ZW28vEORa0NliLVfqzxLbHvoecj3SrFky3TPMWSdSYR8+F9TtNt1yveYWDdsVZJKGNfRZY02DrYlu3MbePPO7K2R25J6PwTu5qn2ZHHDQLyNOcOPr6BMsU4I9tv/OGxQwPkz78zx74xP8xJEjbmKCOcummUTw7ufJNq0nqyACM+PrnhqBmrv+aOyWBe8CYAT0coMQGiyl05DTSOVKzumloAczBNojiJpGMfhj+KpZ+v9Q7XI6ogtAkDnZt4LdypNHz1pVs69/bLWJorujXPKahg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(2616005)(66446008)(4326008)(76116006)(64756008)(66556008)(8676002)(2906002)(66946007)(36756003)(6486002)(91956017)(478600001)(6916009)(66476007)(71200400001)(316002)(54906003)(38100700002)(38070700005)(122000001)(31696002)(6512007)(41300700001)(86362001)(26005)(186003)(6506007)(53546011)(5660300002)(31686004)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDJRVDNZUW1FNWtwZHdHb3FwY0xaNi9HS2NEMVlaMjhYdWZjVnE0cU8zN1Ev?=
 =?utf-8?B?R0ZIVW5WK3dYYUNRMHFvV1BhN3AvalkxM2hvYW9teVE5TnZaR0c3M2N5S3N2?=
 =?utf-8?B?blJYQmRKZmZVY1VRRUhXVFRldlppa1NNMllyazdtbTlNaUNyWExpZHhUMmxt?=
 =?utf-8?B?ZmlUQnRGZW43TWhjUXRQYWlJR0kzZDQ4YVVJenZrenBzT2RURmVaWTlxZUcv?=
 =?utf-8?B?eXFXbWpCaUZhcms3WWQ5eTBZZlVrSDRwYUlXdnh3dzFoTmRiUEEvZE1YZkxo?=
 =?utf-8?B?ODdtVmJLTndyNFp3ZFhVcjEvaENGTC9vblB6eWNiSHZtYzh2R1ZaeFF2Qndx?=
 =?utf-8?B?Z0ZzdU8vUlJsa3ZlcDRaUHorYytJVHlhL3FZUDM5NzVLOVdoK2RuY01rVGlS?=
 =?utf-8?B?dXlkaTl1dU04cE9XQ1RNRy9YMkNQNFdTZlcydVd6RndhUDI3eHZpRE5USkRF?=
 =?utf-8?B?N3Rxb3J6bS8wcmtTaUFRNFluMnZhRk1XRVpwVHcwWXgzRDdNallYOWFhR3Ni?=
 =?utf-8?B?WnRmSGZjWmVvR3U5bW16aHZBaW8wSWEwby8zcXZaeWd6TWJZekozQk55WUR6?=
 =?utf-8?B?MW9qdDhxY3RBVE9RMkJBRk5nNUthVnNudHZySHVWaU81T1BtajRxSXpqRUVN?=
 =?utf-8?B?Y1BKUXRGMm8wRG9NblBCYnBEZ1ZLWUtaSHpSUUpydzJqYit3T05UNUx1cGNF?=
 =?utf-8?B?VGM2MGQzQjNtYk1yYUdjOVJTK1VEZHB6SGlVaVE0MU1vRU40NlEvODZaUGxa?=
 =?utf-8?B?S0o1Zjl4elkzb1Y1dlN1WWtGRFJHZ3ZzQUVoVkF2TU5NNStTSXBTMXVHNTBE?=
 =?utf-8?B?Z3JDUFVDamx2cnNXNWVDSENaREkvd25KY1JSVXBKTXRvMDRDNndkQ3ZKcndh?=
 =?utf-8?B?eUZtQ1k2cUJBK0pBU29jcG1lWmI3bERVa3JZWUFxVUdRaCtJb0RmSlpnT3N6?=
 =?utf-8?B?S3hlT2hmeDN5aVFTY3BKYVM4Zkc0dkdKQUQ4Zmt0LzVQOEZzMENPWDFDNVJO?=
 =?utf-8?B?SXlXOEVOMmZKbjQxUmVROGp4VzNCVmY2Um1CTFM2NURYV2h5NnBKemVaQzJV?=
 =?utf-8?B?MVRjWTFBaFkxd3JXUzlGVGpjZytKaTZIa1lXaWhFNlZoSFJlRHk5L2dLaHhY?=
 =?utf-8?B?cHNaS3d2Q1NGN3FLU1h1Y2d3eWR0RFpIbFo5djdZMnQwdUhud0wrbW0wYVRh?=
 =?utf-8?B?NWtEeGZMUlp5c2JRK0o3b2p2V3hYeG11RjZReHkyekZxUWZYWEkzdDhBYnVI?=
 =?utf-8?B?d1kwTEcvMkdYY093anJtQnFmVXpzV2h2WjZ2NnBxWEwvVmVJczIzY3ltUUIw?=
 =?utf-8?B?YWJxMVd5TEtYaGhFNlFKN21pUWVFRFQ1dFdEbFNieWUxQlZUeDRzNlN6aTZn?=
 =?utf-8?B?VU9zUGtqVFIwNm1yTVdIMUMxN1BDT2hkTThUOHZKU1E5MVQvalR6b2N0cE1n?=
 =?utf-8?B?RTgzRFpiZ2x2VUUxaU1ONUtpbU0wMEREWmNjdGlNTUZhWXJVNDJMdjVDcndL?=
 =?utf-8?B?cmx2dmsrN0ZCazB4K1UzWld5U0hCWEVTOEZKaVBhSDIyT1pSK1FzOU0vR1Uw?=
 =?utf-8?B?dzMyYktwbGtrcXo4Q21PV0plTG1rTW43V1FBOUJ2MjMzbDB1czVNNXd2QVJS?=
 =?utf-8?B?NTBETXpKV3FPRW5wNTM3RXRKcjdDc0V4VDJ0TU5oNWF3RkNCbGV5MzA4QUVZ?=
 =?utf-8?B?aXRqRzMvZVZmSWsycXVaRGZRNjN6bnFRbktuWkhuSDlhYzNhdUhlRDNwUUYr?=
 =?utf-8?B?TnBnclQ3RlBLamFFb1B1OWJWUGNjdjNhZC9lRVplb0Q5MjhvTXU3N3JDbHRp?=
 =?utf-8?B?ODEyaUZWb1c3RGo5UmdZeFNOT0dLWEYzM2ZYZ2R0VStrWEpRTmE3eXZ5WFpz?=
 =?utf-8?B?bXdDS1BiOXEzMHhsMU4rYnVYTGQ2RFFSNVl2TEdpVVNNZ2xVMXdOU1AwdUs5?=
 =?utf-8?B?RHZWZmpNRUNFWXlMRkV6THp2eW1CRmtpczgyQldvTVBUMzU3dTFQRHFYWm9G?=
 =?utf-8?B?czFlb0lRNGRyVWJyangvWHRGR2RKNEh5enFUeThKdlNvMlR6M1J4MUIydENU?=
 =?utf-8?B?MXNVSDZ4V3duU0gvOVJHQnpzU1RCRVgwcWJVb0NmV2lua085MmFEd1YvL2Jl?=
 =?utf-8?Q?YLfe4dQ5z4mmBrPIPfVAfrB7t?=
Content-ID: <1912F1AD88B71E43BBB0F50850C0323B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683f3d73-d8e6-41af-0e8a-08da7b6fb7a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 08:01:37.8445
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwgYabWh6bArCMSx2m9rEed059uRzCRmyYYn0OOwhoGj/a9FXdXxxCRQrw/RjV/DpB1OLty751OBTjLH+SP9HZj43m/GEZs9zFGj6FommPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_010151_225089_CD34398C 
X-CRM114-Status: GOOD (  28.62  )
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

On 11/08/2022 08:32, Lukas Bulwahn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Thu, Aug 11, 2022 at 9:14 AM <Conor.Dooley@microchip.com> wrote:
>>
>> On 11/08/2022 08:05, Lukas Bulwahn wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Commit 3cbd67384677 ("MAINTAINERS: add the Polarfire SoC's i2c driver")
>>> adds the file entry for drivers/i2c/busses/i2c-microchip-core.c, but the
>>> file is actually named drivers/i2c/busses/i2c-microchip-corei2c.c.
>>>
>>> Repair this file reference in RISC-V/MICROCHIP POLARFIRE SOC SUPPORT.
>>>
>>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>> ---
>>> Conor, please ack.
>>
>> FFS... Silly mistake from me there, keep getting caught out by
>> the maintainers entries when I do an inter-version rename.
>> Is there something I can add to my build scripts, other than the
>> get_maintainer selftest to catch these?
>> Thanks Lukas.
>>
> 
> I am not aware of another script. Why do you see the need for another one?
> 
> I acknowledge that ./scripts/get_maintainer.pl --self-test=patterns
> does take a few seconds (roughly 30 or so) and it checks the whole
> MAINTAINERS file. Is that just not performant enough?


Yeah, it takes longer than my kernel build does! If there was something
faster I'd have added it to run every time I do a build so it'd be
impossible to miss.

It's fine, I'll just add it as a arg ;)

> 
> I usually have a set of patches in a local branch (all those patches
> were sent out, but are pending somewhere) to get to zero warnings from
> this script. In the last few years, I did get to some points in time
> that ./scripts/get_maintainer.pl --self-test=patterns reported zero
> warnings on linux-next, but then new issues were introduced and the
> hunt continued. When we are back at that point of zero warnings, I
> will ask the intel 0-day testing team to include the '
> ./scripts/get_maintainer.pl --self-test=patterns' check into their
> patch testing efforts, and hopefully that reduces the chance of
> picking a patch with such an issue and we can keep it almost always at
> zero warnings (wishful thinking on my side).

Yeah, would be nice for catching eejits like me :)
Thanks!

> 
> Lukas
> 
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>>>
>>> Arnd, please pick this minor non-urgent clean-up patch.
>>>
>>>    MAINTAINERS | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 9203efedea1e..797fde7e1821 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -17544,7 +17544,7 @@ F:      Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
>>>    F:     arch/riscv/boot/dts/microchip/
>>>    F:     drivers/char/hw_random/mpfs-rng.c
>>>    F:     drivers/clk/microchip/clk-mpfs.c
>>> -F:     drivers/i2c/busses/i2c-microchip-core.c
>>> +F:     drivers/i2c/busses/i2c-microchip-corei2c.c
>>>    F:     drivers/mailbox/mailbox-mpfs.c
>>>    F:     drivers/pci/controller/pcie-microchip-host.c
>>>    F:     drivers/rtc/rtc-mpfs.c
>>> --
>>> 2.17.1
>>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
