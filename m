Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B830ECAAD4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gh0aNvt6fn9ssrD6QlDXIn2i4ywS3yRBNLrCdu7E63I=; b=wIY4LY3ShdPwkx
	8W0jcnXsL9Og+EybuHkVSb7NwfVxtjI8GnHghKjygAlONe20iEFngslxVN2EkmpDbJErrJAysEhYZ
	5gqVaEF1ygl4gkggEDctocu5ksqZ3j0HiZyWGPUu7eUliULEcohnyL6eUBPI86YEV1MrnMfbmZ2jH
	7K4c7MZDMKkFQijFRWNS0NRHQVYJqbCUQxXsIq7uf/RYOxrhnVI24tbujbqBmfExjuHOY91pcFjko
	y19ZH6BQR6kKE6V2gL/xumgZbusfbm7FGbEvqArsKPGrMuq+h1NmD4ReJUpMWCjeAaQWYgHHihGI1
	wCv086vAU/DINIENkf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNaV-006In3-Tr; Wed, 31 Aug 2022 13:16:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNaS-006Ikx-CF
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 13:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661951816; x=1693487816;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SLsobx9Pc+D4XaPcvXUkbVzsitLD0+kO5SRPcFj1aQw=;
  b=Q06fc20l9KJySUNcaGPvonWT0rhZIG9H/wkgQc7OtXB6wRV/B8CSzuPK
   Vrt+lvqlQAGFzHQ85sU35lJCxvL4/kdWDMh+CuagH/bXDZKQ4DbzQ5Rgc
   w88VBLK8s6lr7DcXsbNkSrSN9gh8Ga5nhGqLC2NNqukJU3U0VM0cz62UZ
   PkENnVUx6ADLPSLNN/LI6UFNLZMEO1WorQAl8OnMZTs1WEuPgoNGih2T8
   SA8S1deW7d2Nom4n/G6kcyI+0L9628SJ+kw+a+kMnZTk1vZACPOkZ05dU
   wLa1yymJ0lFK/6cPkA7XMEZFdF05iMJIkGbS6R7eX4PJTPfTJzRHTxpLx
   A==;
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; 
   d="scan'208";a="188821374"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Aug 2022 06:16:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 31 Aug 2022 06:16:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 31 Aug 2022 06:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWj/MklBZ0Wh7jkY5aiblHGcyXsGSyYsX27BRy1+TS/zFav7JVYl0Ca9XjWO9y3ImOmtOGuPkc921lAMZlWa7ZBIR82vqgYX2UzaXB29VS7IMwkoip6CleSR7BJ6U7NG7dju/HkaQMeJU5D3vFbY3Bg1Ogvhfh4ziMsKDjR8rL0QezL+gOmBLgSC9COcWOCAa4ludaDMc0S9xXy/Ec/d6EUfvXf25o2l8H9lAp05F8Qn+uy3ZsJNkvsIo47IhRkZbYcGIGPnoC/Si0R/1r6NILBrHN191eppu+6bF4Q37zUWXCeArZkT7DKMGj5jW8zJAMDTk1GGbMQ0MW7TOkm18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLsobx9Pc+D4XaPcvXUkbVzsitLD0+kO5SRPcFj1aQw=;
 b=SbcLQ5dShS9iJq7JiJ7o3DnsdtncGqx96knsLHoSoo4X6zG4P5yoYlkSzoZfdGndLMyzNX3IgA/YJ5EppZ7V5Vvzi0FM9SpnQWFHow38jqXMI6McHad4JadBm1xRfXubdpWaGxTqhgGmNXzEt9uvCGSqzuZ58IA3kCtSpBLhS7d+wqnvIUFWXuy3UZdM00nh/yYt8u7W9eECMp27tAnoO3pi1EHdrU1/sdyn6a5S6LLYvcZVvu6KJ8Gj74WAJTTZ3h4aLiWOSz5nRZycQ7v6VaZEF+Tew2p0yoh5oocnJFfgkAXNfJCMthAyyK9ChYEXF42izrhpW0Cvaa3XCRu53A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLsobx9Pc+D4XaPcvXUkbVzsitLD0+kO5SRPcFj1aQw=;
 b=vN4ADLCicUnSfaZYvakRHL3WkxPGlWYqKELa5PReQdBKvdQ9b3XpxtO7OKAYFtZANc4iOu9voaVcXO78Tuct6ChruX/NcacmxSj4NhdNBcvrOVYBzvN/mNSSwk4Y1DeVXvfZOZ+Go9+EUn9bG8XJjx7ftMKMortRh2f0o8YK3g4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB5174.namprd11.prod.outlook.com (2603:10b6:510:3b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 31 Aug
 2022 13:16:47 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 13:16:47 +0000
From: <Conor.Dooley@microchip.com>
To: <zouyipeng@huawei.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>
Subject: Re: [PATCH] riscv:lib: optimize memcmp with ld insn
Thread-Topic: [PATCH] riscv:lib: optimize memcmp with ld insn
Thread-Index: AQHYvTsz2ZzE0Vvu602ydwyjTDJ37a3I/UyA
Date: Wed, 31 Aug 2022 13:16:47 +0000
Message-ID: <594e8d95-c039-6c8f-4669-6c9a514cbc91@microchip.com>
References: <20220831130754.93422-1-zouyipeng@huawei.com>
In-Reply-To: <20220831130754.93422-1-zouyipeng@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84d9e80a-5c78-4eae-2fff-08da8b530ea2
x-ms-traffictypediagnostic: PH0PR11MB5174:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OQaUBvyC2K2df5/VIG/fvAW+KnYGCs70GStjQbv/womg/m3rs6C3cPJ0cAv2z0T5lqAp3Pe1kHjRehy0gsuArKPGz7Ev0z/wIjG6Z5JOvCE9yCsPCJq0S1yUr5M7FOU/01QXtWUt7qhoXNb50D1hPOXVaIF41NYKwJ3psE3vILGdyBVV96PX1mbk6PfxDtskVt3QX+kqlPeuJ8tlfDIS0B3CCwM7c6iHSkkvxNbUyk0scA2VmN1eMv8TyrTKT8hW57OEzczi5584hiZJAXJwnHY5gFqNqvf6wRpPuHE02nlnL0LFGnGcf5/DLd/nY3ryg4SwDKLnWzRZCGGeOxDLgzNFsN3sqHzy8hMYCTq6oDaGJNMEmpb46Mtt1qOS3mZnS90MJ5DRoSLvNsF5wTKM2e7S2CwmLi9y/x0e5RIIvX9W0+meAIgsFw4D8i/VBOctY4WVMjGkRrpZ4Ez4wk2hFKxnnlPu5CEycO7kYLAx3c/CJFRUzWqjolTYDZUefMUipS1l/98c9h9JSKFtjSRw9naTBxvl105vOhPGMx8NGRfMr04hynRUMT8fvuVulqrOBdjJTq0WiWq0AtwY+QE6ZEGeSZlUBHYyz+px0DIzsxjCV25pc/myDi3mqcow/VuF29n9shjaDUjFipgZoZl+sdzMtnnzQSm4yTBpZsyD6qsn7H1f+jKl5nuZOs4upXRxUfSmdAR5Tq36imcXNyaT7HFpHDJanWpRAbdnRAjs6rjqmNIBVF4C0Ha5BBeGkTXEhrfDAftEoDxsbr9vsw6etctEScZJseZfrgXDv5T3dryn1PpQTlprIMqimxw11/1MArpIZjD8dhdMxH/TEkIS7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(396003)(136003)(366004)(26005)(6506007)(122000001)(38100700002)(53546011)(2906002)(2616005)(186003)(6512007)(83380400001)(91956017)(4326008)(86362001)(31696002)(8676002)(64756008)(71200400001)(66946007)(66446008)(6486002)(76116006)(66556008)(66476007)(31686004)(110136005)(54906003)(316002)(36756003)(38070700005)(5660300002)(478600001)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zjl0cC9IYmtmWE5qVkNKaW5BZGVVVE16VmhYN3J1Vmd4ams1VEpMTkJWcVNP?=
 =?utf-8?B?KzRzQ0xlQmduTURQaVR0UmNsWVA3N3Z6aWg4dCtvUmNNZVV6QVp4UFJRMGVW?=
 =?utf-8?B?WG5rRUExU2pJZUpoeUZYM1B3RWF2M0N6cUdQY3Z5SEQvSnRsTzFnSEFmRzla?=
 =?utf-8?B?d0I2UWw2d1NRRVhVVmdkeXpHcHVKbEtnYWJiaVhaSXNIcmxySXBqV3NDbjZu?=
 =?utf-8?B?L1ZnRWdNOWpSL0JkTHlnMnRnWWovOFd5ZFRkS0xTWVlhazVqZWN5V2NCOFZt?=
 =?utf-8?B?aVFjd1VUeTduZHpDU1d4UEtscDJmZmZRcng5TmZ0OGQ4REIrNExRM09ETGlj?=
 =?utf-8?B?Nm5jMSsxWHJ2Tk8rZklQUWI3bUdEdVVkVTRnemxtdDBneTFsSDlZcm9UaUpR?=
 =?utf-8?B?eTBBdlZVWTF3M3BUSUJSRVhIY3JnNU1BZ0srZWdRWEhQbnE0NjhuVmRhODBI?=
 =?utf-8?B?d3Vrd0JKdVBqSzE0WEJCem1ZbTFCNEVkNFVQQjFTMXVPNnA5dnFPUW5qb3lP?=
 =?utf-8?B?T1ZaRXdVNUZZSVdCQ3J5dG5oVHl5bWkrRGpkYU1GYVhmazBiQTRHdzRXZjNm?=
 =?utf-8?B?NkJscms3QXBJUzN3Q0RObGtZZnBCTG1NY0g2ZEJGTjM4S0xLeWRjT2JOUlJ0?=
 =?utf-8?B?RVVUVS9nVUNUbGNGbGowbGRPbjRqWHo0ZTRoTDI2aEFxOVh4UHo5czdDSSsv?=
 =?utf-8?B?RnFvV0g5S1ROMWJybnZnd1l0SGR2STZxb0U1Mm4rb3hjSlY1Uk9LSWYxa1B2?=
 =?utf-8?B?ZXBKTWQrS0tjQUc3aThXVXE3ZFpzRnN6ZzlCZldlanYzeWt1S1NjSDhzZTBV?=
 =?utf-8?B?T3dvenJxM2l5cmN4cnVwYmVZZjY5R1VHanRaWmZHSDB5U0NnL1o5VkFRY09k?=
 =?utf-8?B?TFpxazgzS1hwbmZDTzQ1dWQxU0RYRjE5Yy83dWNmanJHMGdhdVhmS3l6WGJh?=
 =?utf-8?B?dXpTQm12OVI2LzJJbCtBRld5WG9nVkNYSi9HTHE3WUV0NlZkQWFTYjlhbU0v?=
 =?utf-8?B?ZmVPU3lCQWlNODlwWmpvYjJjRlAwVVlJNjgwd2Q2UnlQUlBIUmI4MHFiekdq?=
 =?utf-8?B?ckU0OVUwL3d1OVIyVVVnOUNVNlZEd1RGYjd4c0RlYU5IMU5SSzE2NkRTL3Bk?=
 =?utf-8?B?LzBkelFLSHcyVCtsK3ZpY3R1TmJoMkJpRnJ0YWdGQVY0dlE0ZmlZM2VreXNq?=
 =?utf-8?B?Wml3TlQwODRtTTR3Tk9GWVNzZjU0UWtZQTNxWm5XQ2RJSDlYS2t1TjVwN3hq?=
 =?utf-8?B?K0JHM3hiZ215UFd1aFNZNU5ueFdWMEhmVFU2em5Pb2pIK2pCdkRrRU9aN2Ni?=
 =?utf-8?B?YkNPeStOM2djNFNnUmJxeFcxZktKVDg0Q0dSdkgyajl3QmFKNG5rNURWZUtP?=
 =?utf-8?B?Mm8rREZtNFBqYlU1THNQTnVUV1hTWTdMVWpzS1JsUmFKa2hpcm13aU1GUnFJ?=
 =?utf-8?B?RE5oN2lqTllqek9TcWtZSC9qSHIvbU1wM3RFU2Y3MERLWEg5aFUvQnJVbzBK?=
 =?utf-8?B?NU9OS0RiTUtuVzZ5Ry9sRkpKS0M3YkVPYy94NjVseVJub1pXTFRHVU0wRTZi?=
 =?utf-8?B?R2F6TXdKbVZES0VCZ08rQUtCVlVjSWttREE2M3hDNE5TcUd6SGFJK2Z3NEVO?=
 =?utf-8?B?QXV0ekZ4MHVVQUw3T1VCTUNlVkhNTmJidzJpVjEwTkdvUVNoajliVlh6Zitn?=
 =?utf-8?B?YUNUWGtUcGZaR2RVOCtYMjQ4aEc3N0VpckhXeE9MV2ZFZHRuSDVwUi9JRDVD?=
 =?utf-8?B?ZFNKUnNPNkVVa0dvMnNVOGcyYnFxREhJK2x6cDJ5cmFOcURaeDNsbUJmZHAz?=
 =?utf-8?B?SGw4RGxzY0NuQWtxOFMrNW5nRTZOa0d2eS9yTzFzV0xoejF0djZFUEZwclRo?=
 =?utf-8?B?bDQycVpXWnZSeUdsWWQrWkUwZ1JMMjZPeVRrRnVZMithNmIzQ1VUTm4yQUhT?=
 =?utf-8?B?eG9yZzI4N2hPeWZDeXE0NnV0OVdDMkFKZ2NjWTJGZ3N5MElpTjJFbFFPZ2lL?=
 =?utf-8?B?OUdncU56OTZhQ0REK205MWxiRjFYaC95VnVoVXZ3Mnd4U0hUUjdhd0YzeHU1?=
 =?utf-8?B?NmR5VEkyaTl5T0sxcGFTNGJTWHY1ZkY4cjdjcGdnbWtBU1ZrSko4ekQvL3Fu?=
 =?utf-8?Q?6eg8fDwxuu/V3drjt5kDgzjO0?=
Content-ID: <00FE1074BA40B14CAD586B7F57AB5D36@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d9e80a-5c78-4eae-2fff-08da8b530ea2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 13:16:47.0246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ctFgnuiUZlm99eX8dB/jF8qahuBmIkd+T55UPiyvoY5/wkAGw8xdVG3sgnNn7UabfilaB+4rKU9I8kKEcYuwDwgBWmHn1282ZXc6YvAbqMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_061656_721422_887F962C 
X-CRM114-Status: GOOD (  21.78  )
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

On 31/08/2022 14:07, Yipeng Zou wrote:
> riscv:lib: optimize memcmp with ld insn

Minor nit: "riscv: lib:

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Currently memcmp was implemented in c code(lib/string.c), which compare
> memory per byte.
> 
> This patch use ld insn compare memory per word to improve. From the test
> Results, this will take several times optimized.

Hey Yipeng,
Could you share some more information about the tests you did?
The test results showing the % improvement would be nice :)
Thanks,
Conor.

> 
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> ---
>   arch/riscv/include/asm/string.h |  3 ++
>   arch/riscv/lib/Makefile         |  1 +
>   arch/riscv/lib/memcmp.S         | 59 +++++++++++++++++++++++++++++++++
>   3 files changed, 63 insertions(+)
>   create mode 100644 arch/riscv/lib/memcmp.S
> 
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index 909049366555..3337b43d3803 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -18,6 +18,9 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
>   #define __HAVE_ARCH_MEMMOVE
>   extern asmlinkage void *memmove(void *, const void *, size_t);
>   extern asmlinkage void *__memmove(void *, const void *, size_t);
> +#define __HAVE_ARCH_MEMCMP
> +extern int memcmp(const void *, const void *, size_t);
> +
>   /* For those files which don't want to check by kasan. */
>   #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>   #define memcpy(dst, src, len) __memcpy(dst, src, len)
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 25d5c9664e57..70773bf0c471 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -3,6 +3,7 @@ lib-y                   += delay.o
>   lib-y                  += memcpy.o
>   lib-y                  += memset.o
>   lib-y                  += memmove.o
> +lib-y                  += memcmp.o
>   lib-$(CONFIG_MMU)      += uaccess.o
>   lib-$(CONFIG_64BIT)    += tishift.o
> 
> diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
> new file mode 100644
> index 000000000000..83af1c433e6f
> --- /dev/null
> +++ b/arch/riscv/lib/memcmp.S
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2022 zouyipeng@huawei.com
> + */
> +#include <linux/linkage.h>
> +#include <asm-generic/export.h>
> +#include <asm/asm.h>
> +
> +/* argrments:
> +* a0: addr0
> +* a1: addr1
> +* a2: size
> +*/
> +#define addr0  a0
> +#define addr1  a1
> +#define limit  a2
> +
> +#define data0  a3
> +#define data1  a4
> +#define tmp    t3
> +#define aaddr  t4
> +#define return a0
> +
> +/* load and compare */
> +.macro LD_CMP op d0 d1 a0 a1 offset
> +       \op \d0, 0(\a0)
> +       \op \d1, 0(\a1)
> +       addi \a0, \a0, \offset
> +       addi \a1, \a1, \offset
> +       sub tmp, \d0, \d1
> +.endm
> +
> +ENTRY(memcmp)
> +       /* test limit aligend with SZREG */
> +       andi tmp, limit, SZREG - 1
> +       /* load tail */
> +       add aaddr, addr0, limit
> +       sub aaddr, aaddr, tmp
> +       add limit, addr0, limit
> +
> +.LloopWord:
> +       sltu tmp, addr0, aaddr
> +       beqz tmp, .LloopByte
> +
> +       LD_CMP REG_L data0 data1 addr0 addr1 SZREG
> +       beqz tmp, .LloopWord
> +       j .Lreturn
> +
> +.LloopByte:
> +       sltu tmp, addr0, limit
> +       beqz tmp, .Lreturn
> +
> +       LD_CMP lbu data0 data1 addr0 addr1 1
> +       beqz tmp, .LloopByte
> +.Lreturn:
> +       mv return, tmp
> +       ret
> +END(memcmp)
> +EXPORT_SYMBOL(memcmp);
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
