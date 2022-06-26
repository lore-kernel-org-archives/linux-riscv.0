Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79D8C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 20:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taOnEH5boafkQ1OGU4ZGXT3A+t7x8UDKOw0Ji9FAABU=; b=S9h2lBEaz3fehc
	4Jw+Zyw57J10NgHBf4Sj0byvVb6SVo8q6dEPj7tT8NsmKP6Hx2fCoxpcGBIxb75bLQ8bzRxo66Lu1
	+/vKD6TWAbWrxx2zH1vRT1eVFwNoHbleEx8igsoM0vZffFHrbAeWQiFfVODx2VtZ6k7oNgoaLJhqs
	pbGKYqDmgFXuBA+aJIDWNklhLkebM6vCP2BU6y0am9WErpaGOy6BbXA+Rck/mDgryvpZNFJG8S3km
	JHAHcXBweSllK9Ct6b6nE1EYQv3TuDewTRgXU7BSV1nqnS9k4L+Ugq9VXrCHJBxHMLP0kY3t9HGEu
	F3QUnS3WtbITFpYNSfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ZIl-00DYks-KO; Sun, 26 Jun 2022 20:56:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ZIh-00DYjZ-Th
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 20:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656276971; x=1687812971;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=24EM5/QQASX2tkebaifTNE0LLLNMFAUIty0PXyNXwSI=;
  b=P8hYd/TUxRCuTPrM6Hgc/p4HSrdQ8HVVSIN7UOdghpBdjkhzN+rzhR8L
   u0RUzMO6IVSNsMiStJty2ZQa5QCmbLH3PYnpvEwh+sD3duiaG7NzVOJr3
   zYvEaNwyC7saScHMtr3/+iCRrxxjzD8ggZsT+ZeWY+e2GvCThTjzr3S/X
   8AgfG1CK4b4Ptqddqowb8ArF4mLQwsszCwJ4pDlVZwBlfxakLFA9CMiwx
   5bhFR7igWGJAhuOZ2H53aYY+hJeqUmSw9CgkwBENpQ7R9wb5edmtqxQ12
   uHU9g8qjx3ALNIcdSKOZ6irNDF78pOgSyT5ffOGvDbVQcmaaoaAwjACRi
   g==;
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; 
   d="scan'208";a="101799283"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2022 13:56:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 26 Jun 2022 13:56:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 26 Jun 2022 13:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsVRXB9+LyWFzseUW27ptxXYu2wSscaKczMFbg5GDMVUBDpwoE2+UR2chtqbWN9tMBz5OVcXKiUHmXEa7hrcq2yJTcVsf43DB/3VrHGPD5MjHslKJJrWgYxh0krlFB9fhWnlU6LyT0g3Mbn3McojnqvJ0ppCFkGskfn6bqOR9wlfjnKc4LlAk0OumnglLtmLrgLW1Ri68q4S/0xO24hQlVwauwz/ZliAUCBvscKTW5+rCfFJKC8padFv+Pb7jxnRkjgItsF2dqp5wv6e9fxn5jdE0c/i8Klc8nHdHBDA5gt5rGLIx7qoeSHIq+pq8/iZpoqYRmSMz6JrkpyzFM1REw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24EM5/QQASX2tkebaifTNE0LLLNMFAUIty0PXyNXwSI=;
 b=MW7cJxR6/xq32oYNRbOF6U5eQzXWtSm9Pal61rDV+C6h06h6mQ5XuMw8dFraViSCdhjZSVfvU1FE+MNQAegKmfseegSxxprzg0mLAINYArD7mi+JWhojo+AmuYrUnKByoFpU5YU4kDKaUoGeHvFBNdPSMXFMMF/y9dXafER/I43+CEoMC4wuDXbuZwJAl2jVdE5LJDMmsXN8tfNPxS0d/P90QECoq5VzsyMkrlDnHrQrEWbXQGJjRJ9RHV/VDE9kPv+JbFDRvvJamASM2KuUhlOjHzvQjO0SBeA8BOS7VpkN+AFPMy7qf99eHKHEz6uAfOEKKNt3hLQJxe1PoH3YKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24EM5/QQASX2tkebaifTNE0LLLNMFAUIty0PXyNXwSI=;
 b=dNKCIhb6QYExlGBbLz93OL8dIR2KbqYn5Q9l7TZKHfQD5aSEW0oX+v8bdqglINxy7zx5d4BH0Cp43vjcQui38duweWYvNtUPXPuAulEYeiz6ZXsXFTyS79H/cglDhf/U3KYeqy0Av3QJZkH+O5t0gzC0II6tFjTjDWaRhjP/VoA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by LV2PR11MB6024.namprd11.prod.outlook.com (2603:10b6:408:17a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Sun, 26 Jun
 2022 20:56:00 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 20:56:00 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: align gpio-key node names with dtschema
Thread-Topic: [PATCH] riscv: dts: align gpio-key node names with dtschema
Thread-Index: AQHYh+0TSEsUfCu3dUCW8EahvV7Amq1iLm0A
Date: Sun, 26 Jun 2022 20:56:00 +0000
Message-ID: <daf4a88e-ea33-be74-7e0a-b2ff20ea734f@microchip.com>
References: <20220624170811.66395-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624170811.66395-1-krzysztof.kozlowski@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ffa3a80-7c82-4f65-261b-08da57b6469a
x-ms-traffictypediagnostic: LV2PR11MB6024:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+XjyCBAQKIr0B0nk++klTblKs8nLd4JWKiN8FkM9++Wl86/9qaRYs40BNQ3HsJt5RKoRF81BhtGx1yDPbL9flUx+v0BEacAJcIRbQjqYbZoNpnjeISw3uHvbn3atUuCJQQHp3NZgy2wDZONKhlmXcXpNYjddpWyRSf4yONUqLgKuXtHOhAxENg8fedR/3mI4zzjPJdbBummyKZqL7zi4fNv4XAGSQcy7lE3L/f+HdQHTUt3Yw8L0g6FrogoJU5945tdIGaO460XnOdw5rOW/+FCXJRz9Xgcwso+bQJ6ersVU8PZ1AwFjP37stlTwBs5XuzRLLdupCAbD8ClWqeiTVAq3snozACgnKUdJq7LwE5jgRdyQAUAvXs5t0GGVOJlyjGt0PP6PLcvw+qXRpjxJS4npWwuCplBetphzSEQak+E1Slb2S/nY0MBSBIGrh6P7fAZzoPnndb2WaYmznntlzq3tHnVeDc4edCoVmNB7ZpsrdAQ5Ke7qZxL78cPKp4xMpIFS1EPgusHCe3KxoRPxnOy8QJ9ouh0jpvmcr6mfgIeVTLPsJ+3P2PrDs4lHtMmCg7CPdTmT6XQIQlsuujyq4QEBYXlBBMOPKDG2Jd9K1wf8BBW4hMtq84/Ungki6PxwVzfrftFK+G7Xz8F4Tcf/L8UPeaFIC/4JHJUJhHiLILgLp0evtADvVEu3bZ/HoZz4EdLCwn094D2deUHFl8rEm/Kqe79EWwFvKDfIQSLG9IZKwX5vmL7z+l2ULJuwOEtoxXYuplBtMdCURyH4t2S4aJvf1OM4FDatlxa8ZU6NmQ9126/jVVbz3POLH+ampNLSM0QaoIXZ+6TVzLuKiR+OM4+PQQrec8f8RZlfP2e7iMC1gneqa0yg5kjGZYU0TczgbwPF6jqfc38rlzw7xOrZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39850400004)(346002)(136003)(376002)(38070700005)(8936002)(5660300002)(53546011)(26005)(83380400001)(6506007)(6512007)(2906002)(91956017)(41300700001)(66556008)(8676002)(66446008)(76116006)(64756008)(66476007)(66946007)(31696002)(86362001)(6486002)(31686004)(38100700002)(2616005)(966005)(36756003)(71200400001)(122000001)(316002)(110136005)(186003)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amFBenc2NnVuME9mWDhsMkZOblV4cUJZZERyUWVaZk1hZG0wblZtYkFrb1cr?=
 =?utf-8?B?dXhFcVRLRXB6YkREb2tBQnhOUWs3emplbnhVMzN3SmdlZnVrdFpNQUl0UTFs?=
 =?utf-8?B?MjRJZ1Q4endla2VoSE8yWW8rWDBoMEwzNnBvNTZueFkwdlgvV0J2NHlySThW?=
 =?utf-8?B?WjJrbmpOZ2IvYXFuT1gyNjdCMndET0FtSlNKQU94SjZLUFlreUV4Mnp5UktG?=
 =?utf-8?B?bGpURXMxaEM3WDI2ZVo2ZkhiVlQ5V0syald0SUpBaFI4NjVOKy8wY1JRSEw5?=
 =?utf-8?B?TlFYenJJaFhBdHFnb3RKbjlTazZjQzJuaUJnalhwL2pIK0tmRHFzMUdDUHRZ?=
 =?utf-8?B?T0xnUC9FbE5hcXEyN3pJUGtOMkxhMC95VDR0R1FkcGdZL3p2RVNkdnQrQ0kz?=
 =?utf-8?B?eUtNU2ZLK3JLaXJrazJ0N091enZEL0ZOaTdOcnBPS24wenpPYXdsb3BoSUZt?=
 =?utf-8?B?ZlZDN2VHSGNKS2lJWldEOWM2eDVId1pXL1VQVEZLeGovSzdSV2JnT1ZVbFB1?=
 =?utf-8?B?M0h4RmhzdXdVYU0zUjlUZStHTy8rNzliejBvVE5jTEJHZjY3NmNVdDgxZlVZ?=
 =?utf-8?B?NXl4eU5sUFpkUzRqZ0F4RHFuendEY0d3dmpUWlVtS2xPU0pkVXV6RzJVOFNO?=
 =?utf-8?B?NTNtMmt5NW5yTEQraGRiRTRRbnlRZ2lrTXpjWGxoVFJVTWpUY2JMZFFmSk45?=
 =?utf-8?B?aGEwNzJKR2lDK0JHSVJLakhQOFF3Sy9KSGoxYnZKY01SRjllQXZvWEY3dDQ2?=
 =?utf-8?B?ZmorWCt0Q0RjZTFtQUNCUHE0d3Vub3lNbUdsVEY3NDNHcWxEZlhHbkVFU3ds?=
 =?utf-8?B?eGpHNUVCbTE2MUtXeDRqUWVFaWl4Z3Z6a2ZJdE4zTVZMTFVoRVFTQ29zczBO?=
 =?utf-8?B?K25rZlIwUlJhZEU1OWg5UDRNUk1rdHQvNVkzK0xUMG9sTFlydVNaRHlEUmVu?=
 =?utf-8?B?Z1VCTWdMY0orL0xJMG91L0I4LzkvVWtrbDhKMDd5SzUzOHhYemc3THE4alh4?=
 =?utf-8?B?bFYzOXJJSmczdHNQUG05OVdIMllvQmJZWDNkeUR5d1p4R0JTVWV0YnZqcnFw?=
 =?utf-8?B?UFVtSXVZRjJ1R2k2Mjg3WUg5LzlVejRNcE9qWkR2MVlSVFhia1BNZE9mYjdj?=
 =?utf-8?B?dzh1bHJnSEJleG1CemJKaWNrY09tQ1FOWTltRlVUQUcvSDVWbmpYZUs1NzE4?=
 =?utf-8?B?bFQ4cW53RUlhaU04MHNncDdqcHJwMzQwUDFEWTRnTE9xeWRWb2Rid0xzdzY3?=
 =?utf-8?B?NkdtMThDTTZKTzBaWUl3UE84Sm1WaUFBdTlLZytYRXdOQndMNmFyZnlTL25O?=
 =?utf-8?B?aU5zdy8waUNEVGZHeUo3eUliYlZaYzZQcTduWkVnakEweC9GNjFyWDFzb2pU?=
 =?utf-8?B?ekQrbmgvRFg4K2Q4SDhTbkk3emwwUnpGNXh6ZndxclBRVDBWVDE4ZjVpZmdq?=
 =?utf-8?B?SnlaWGo1KzFwc1ZweUdYaEp6RVA5OFNrSGtlaDU5c2RKS2dsdzJSbGlwNGhI?=
 =?utf-8?B?eC9reFM0TkUvd2RQdHE1cGd1SUxzcmZTVzhURkFwcEZMUVlTSnlSRmw0V3dm?=
 =?utf-8?B?YmJrSHRTaVYxdHhBajBVS3lJRWl4ay8vajZEa3NoWjR0dFA0elZyb1VRRTRV?=
 =?utf-8?B?aERtb1lyTGpOOTRLU0tiUlIxVmtNSE1md2l4ZW8yS1llOUNBcXEyanRGRFhE?=
 =?utf-8?B?N1NmOEUrWVZ1S1pnOURVTzBsSG9UNWJFRnk2RUJJUUxwWkFZbk9JSW1qamU5?=
 =?utf-8?B?WElTVWFCUFlqSmdxS3IvUnNjbzBzRGdhUkpTb2k5enRieDlVQVB3UlUvT09s?=
 =?utf-8?B?RVJqRy93bVcwaFB5V0RkNDlsUWdQM2tVSndWaGgybmxHcWFEVWtua2pBWE5w?=
 =?utf-8?B?cE45UExrZzV2WDBzS0NiNDBpeWFiekRBY1JXby9YMzVjZzlpYU1CL1k0dnVM?=
 =?utf-8?B?T29ua3cwcnRURFZiM2ptMVBvaWtHbE9tNjZXWlJXTUtpdm9nNHNETmE4SE1Z?=
 =?utf-8?B?SlluKzhhaGU5dE5nTFZPdFJxQlBCWlVyd1FhWUVjNEhGcy8wdVRmcUZ4dk82?=
 =?utf-8?B?dGNER3d6dW4vaU9UTkF4TCtvU3N4dnNWeWZYck1GRWVVeWw3eTFCNUVqdW5H?=
 =?utf-8?Q?E7HimxDkyPjRxk9+Ya73CxtnJ?=
Content-ID: <4CD79D64034B4B428C0577BE24689EB3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffa3a80-7c82-4f65-261b-08da57b6469a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2022 20:56:00.5893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgjYhSMJcHyvoXqqYaKgJg3O9vHykxrdG7/kd/npxy9iLqgYukrEohMY2YzG2oDmmXE80v08H+dvr1MDAKJ2oWeKEVE50Pacmya3W0IVuwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_135612_315251_941D8EE5 
X-CRM114-Status: GOOD (  15.07  )
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



On 24/06/2022 18:08, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Are you planning to change them all & then change the pattern
property to complain if "key" is missing?
Thanks,
Conor.

> 
> ---
> 
> See: https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/
> ---
>  arch/riscv/boot/dts/canaan/canaan_kd233.dts     | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 6 +++---
>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> index 039b92abf046..f72540bd14a3 100644
> --- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> +++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
> @@ -35,7 +35,7 @@ led1 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		key0 {
> +		key {
>  			label = "KEY0";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 10 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> index b9e30df127fe..8abdbe26a1d0 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> @@ -47,7 +47,7 @@ led2 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		boot {
> +		key-boot {
>  			label = "BOOT";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> index 8d23401b0bbb..3c6df1ecf76f 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> @@ -52,7 +52,7 @@ led2 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		boot {
> +		key-boot {
>  			label = "BOOT";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> index 24fd83b43d9d..03c9843d503e 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> @@ -46,19 +46,19 @@ led2 {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		up {
> +		key-up {
>  			label = "UP";
>  			linux,code = <BTN_1>;
>  			gpios = <&gpio1_0 7 GPIO_ACTIVE_LOW>;
>  		};
>  
> -		press {
> +		key-press {
>  			label = "PRESS";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
>  		};
>  
> -		down {
> +		key-down {
>  			label = "DOWN";
>  			linux,code = <BTN_2>;
>  			gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> index 25341f38292a..7164ad063178 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> @@ -23,7 +23,7 @@ chosen {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		boot {
> +		key-boot {
>  			label = "BOOT";
>  			linux,code = <BTN_0>;
>  			gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
