Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EDDC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 08:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsxhubpvWAo8ncJX/Dk08+0Lr+FTcZN0pEi3skC6/Sg=; b=1STjebjx2dQOcE
	hsSPBNZnehAqcBxbYtM0VGNxg7S9kPlGNNXJQA36XF1L+nLBo6J3FrqVjs/848wsF+9NTlh7Z1T/9
	5JTG7Bqgsrt0K8+vojXmXD5Kyhfy8X7Utsr1PEzQ6pqS71D5rGHme0Sk8rOiJryK2r3CZJk7kPRqA
	drFTgUlSoH6SHM8czqcu+WmUoJs3nQ8y7Z45mAErfFMpdYghocoH95HxG08FEgbvThPHFF8GRbgAw
	/ciX8y011luXDGayS72l/IbJrGeT4CWe0dG55/nFupDXhiHGmn84Va5fDq4/0ppeVVxC2GYbg4JlN
	Xau2g53m09KkLnUrCMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRrOe-007iZu-Kg; Wed, 09 Mar 2022 08:10:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRrOc-007iZW-1c
 for linux-riscv@lists.infradead.org; Wed, 09 Mar 2022 08:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646813410; x=1678349410;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8q2wTzPXl4WA7iOodFymsGqJPQE5RwCkQxtdKeUuylI=;
 b=Z3jtdsrHtm4f4l7j/avGjMPQ+nPNOxVZCWVC2bQOmy0yJgRC457tOPa6
 GGvILlZiD8PJwLnRElVDdQy2ULrmYIeQzHAenOBheqGfMF0fbq2uznYOb
 9rItatJX4uTwUbOZdVUWZN9r9D/A/Dx+Hg8qtI/0d47tUCKSXvmOXQKOY
 S15nbGrKxHvKsG5uRFavep7Zac21SZZOunpr0NWVHAYguddOXJRvEXhkZ
 t/JC8Dq0g5tWIYHOZ77zZEflaX3g6hDBs+3jas7aipOTQSGQUXShVPzss
 JqRUiej9ZWEocb0AtVt/P+bIbNq+VyA+psCql3M9LC6XPIqvnavGaask+ w==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643698800"; d="scan'208";a="88325248"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Mar 2022 01:09:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Mar 2022 01:09:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 9 Mar 2022 01:09:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzIC2PK3+6R/2MtWb1AFmrNa0ZERrWec6VJnPklbG52LopSeFXCVI2fi2gXpULukLsLO73ExzZyWs7nW0cu2dxNhdktz7tWKJo4WmCw+vZtIiDX0bVS40dELfsif3FgPMQOPpWTSD+Ul2G1u0VSu7sPCqmJbgEFJ38/NX7DxOCexDKvkdLJE0ymD3GVWlGqp4Ql0jVrVpvDLhlZtO47mC1n5EJYBZuCJrvSng3MpUjKdYYbvU/5xksmPvzg8mK5WYz7RCguxrstIwa0ENi6FzO42V4Pa6+tZSuW62/UePqQKt3dHf/lU0EIowGaKLgHj3U4uPKOiO7a4ba7UnKS1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8q2wTzPXl4WA7iOodFymsGqJPQE5RwCkQxtdKeUuylI=;
 b=Sd14BWzs3oyCQbZDOcaBN1C6Fw3o5fZj/DMT0m7b5XXUisb15PZwdl5HKy6EvdcKxNSLjmScNmL6CaPALlwOkn/qD6dzcvHz9by6Sfrohs/BRl6zRpv1cN89J4J1RYLvYAYM7/M20rJYFG8YBKQflsSx/Q7eR3q5Fe22u1gn22SkzikVq7etmLAJmYviOxw+RFGVNUPSzsFng5T4gHJXAZQiAYMjMufPn306ftbc/TO7Fk1yz1rkhsj+ATSk+Io91pv9qWvZC5+A+X6FVEcaPbWnd+16NopGY6uLrc5wEl59/X4xpbdgC+Y6URqA6y1yj6MayNAg7wnBOqONeAAlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8q2wTzPXl4WA7iOodFymsGqJPQE5RwCkQxtdKeUuylI=;
 b=H5HLM7irdvgUZaCS/0heUVoyPyn2A6dYpetIGLwnGiiRal+fp5n616i3huBcR8HHlOVNrGzBmfsVQjiM6myZXhmqwjk7mViOI47txANzuJe9mNAcY9TpC2pM8YP6CIHjIsebumuW+Gh7fdf43HW/aSll3edaypc+Q2tp0m67ROs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BN6PR1101MB2308.namprd11.prod.outlook.com (2603:10b6:405:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.29; Wed, 9 Mar
 2022 08:09:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 08:09:49 +0000
From: <Conor.Dooley@microchip.com>
To: <linux@dominikbrodowski.net>
CC: <mpm@selenic.com>, <herbert@gondor.apana.org.au>,
 <Lewis.Hanly@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] hwrng: mpfs - add polarfire soc hwrng support
Thread-Topic: [PATCH 1/2] hwrng: mpfs - add polarfire soc hwrng support
Thread-Index: AQHYMjlJ95Z0rSRlp0SX3uhZT+zi0Ky1H2gAgAGXPQA=
Date: Wed, 9 Mar 2022 08:09:49 +0000
Message-ID: <d5a29b8e-b847-b176-5e94-720486b6d09e@microchip.com>
References: <20220307154023.813158-1-conor.dooley@microchip.com>
 <20220307154023.813158-2-conor.dooley@microchip.com>
 <YicMBhn81HmtJMiF@owl.dominikbrodowski.net>
In-Reply-To: <YicMBhn81HmtJMiF@owl.dominikbrodowski.net>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8f7009a-8828-463d-3314-08da01a42e71
x-ms-traffictypediagnostic: BN6PR1101MB2308:EE_
x-microsoft-antispam-prvs: <BN6PR1101MB2308BD6B27804F2F9A59B299980A9@BN6PR1101MB2308.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6lEKjxHlO+V6zW8mlummZ55y3jAsuOeZ5CwgRaGdO7Q0ssp0Ymh7bItbT5XAFPbt2SZH/YjhDDGzkEvJdU2InNu0WtmLgrZjsBMCGSPY44gkjcshumJCzhe6WJx17DjbR8AR8ZC+uXjKvbl3l+nLAjeVbn/kDPHooGE+cCY8+4ZwSq3Zvc4poo+Lw0yrLeWxJhg6bo1awUbbRfgd2+1GVVWo5I0E55Fz/g+YHWBjIVsNvMecDoPgIrS25Iw1vEl41RydWDOuL2zSYwROOc7LVNTI3dkVCNhDtfvSgG4/QJcqwfbf3hMtOLgAHvmTmR75sxR4INkmSKfJRJUEK2eauQRrQCoHYXT2tpLqPg5yNEz8jBEFknjM6Q8ThXVRAI7uTHujizuHoloTlv+0FxBvuQa3tlVF+af/MQW+jTgXtxbDCG5csmlXMk65P8wj/KgwRN8JOoqzFokgZ+DhkJWdYtKsmxQ66fZaOn+jvjp7d8xkIuNq3KgqchQes6IQ/8DhzP3VMDpVjnDORLnecP92XjRhn34A5JXdphbnHOBVcSrz1H7QTnzUUlRnbceKhFRasZPAluqVdDfSuSIYKffuiHhVlGxexX+QcgiYJl7MRrKmx5h2F5UI7KwnR0SNPXwZ0o2yTQXQXi/3ke46lG4fPqzQVsnaRUbMMLtdq4eUhOG9pSxQRnv+mus/utT2T4J5I9+rJ4LT6iJN0XVT0b7bKNDSw296LGjqcd3o9ONcgC3EXay9cr49fEogf68OHeJAx05veE6OTKfEr5QDbmmaGqrGlG/5feyZC2kKlj0Arw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(966005)(31686004)(6486002)(6916009)(54906003)(71200400001)(316002)(38070700005)(76116006)(91956017)(8676002)(66946007)(66556008)(66476007)(66446008)(122000001)(64756008)(4326008)(8936002)(6506007)(5660300002)(2616005)(186003)(26005)(83380400001)(53546011)(36756003)(6512007)(86362001)(2906002)(31696002)(38100700002)(43740500002)(45980500001)(10090945010);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVhBSEd1NFQrc0tQSW1PQzdmMHdZRXZUTnFxY2lYcDhhejZXVGMyWkZJN1Vm?=
 =?utf-8?B?amp5d0dMV2lmMDlaMjBxNEZuNk93cnZXOEdMVzExUEhlVFk5aXV3TVVGbzBn?=
 =?utf-8?B?d3M5amdGTEUzWnZZQVRQMHJCYXhTcUNJQmR4SktHalFZOWwyQS90NzZtZTQx?=
 =?utf-8?B?akVmTFZaZHVtdm4rUE1LdFY2OW9yUld1VzNObitsMXF0RmNlRjIvamlWRDdW?=
 =?utf-8?B?dkJ5bzFFMkFabXdyTFdKSVkweVIxZFdUQkNmcWI4LzhxSWwvZTIzNFR2U0t2?=
 =?utf-8?B?b2NROG1rRzRyQmVsYnN2SFgwSi9qNlExWVZFS3ZqQ0VTZ2w0cmt1b2JOeUNT?=
 =?utf-8?B?MGNxZStkUUxVcnFIK0diRWlTRjFKT0VWcE12Nkh2SjdJeEJ5UVFHeVQrSlY3?=
 =?utf-8?B?RVFNZHhWRFhTWmNHWndFQXBZUWZGUFdVM1ozam9lVWQ5SzVuSFhNbnNIaVN0?=
 =?utf-8?B?U0pBS2ZzcVhuMlpMRDNoQWFQOFVybUsvSGt2aEdseWx6eWx4NDB4RXQzdlA3?=
 =?utf-8?B?ektSM2dWU3d1K3NSQ3NsYllZSXNCd3llSFhvUzJlMWRFQVFvUks2S1RRZ3hN?=
 =?utf-8?B?RU9kS24rYzJVcW5TQzI0ZmdBeGNLcU56TktCRi96U3lZQXVPTnQxQStONXJp?=
 =?utf-8?B?SDQvTnBZRVAzUzV6Ti9FZjV2VXV4VHB6MWtRK3hvRHRlVEE3YWNMbGlDVjJV?=
 =?utf-8?B?RC9mNFhYYmR4ZDlFTDJIZUZEQTZabUJBd0pzTWNacUhndHlpSm5RK3FWWWpa?=
 =?utf-8?B?a2IzSlQ1SVdUcC9SL0wzWFF3VG5GVHBKWFBWTVEzWWNNSkpodXV0KzVVamoy?=
 =?utf-8?B?OWk1ZDdMMWFXVjNjZVMwY0pCL0FYb1lvMk44RTV4Tnc5VkpkUllFYlBTdERR?=
 =?utf-8?B?WkViUTFCVlNwZ0NEMGNZRnE3bkJJQytvMENzWWpTY1pVaTVvY2NqZHQ2K0xo?=
 =?utf-8?B?TlkvczJYTzZaZlBxWmZFS1VtSzV1bnNDRFlDN2lLcHdzdkVXNlpTaSszeVpV?=
 =?utf-8?B?cXN6Wld2L0QvVEpxQWVpTGt0T3JQNUJ3NWZIRzFWblFtNjdEZldMU3dORzhu?=
 =?utf-8?B?ZnU0Z3p4WXNoREZSL0VVWmVvWDhpMlM0Z2czZmFkQy9rUTc3Yit4U1h4TllJ?=
 =?utf-8?B?TS83REs2ZW5qRzE0OVFNc1BlWEdaTURqQ1U0NkhMZEJMSHNhQzRidzJnSlRh?=
 =?utf-8?B?OHVnRU5GaGlzYzNLM0hLMkRJeGhtUmI0QTlCbThycDI1TnMxV2ZRSGtKYmtt?=
 =?utf-8?B?ZW9qUFN2TUJaYmNFYUxiM1BSWHkxcVkwazFOMTVPclJOSkFXNytZNnFXdEQz?=
 =?utf-8?B?cWlVcE5HRTNkS0RkS2VOeVJQWHB4dHNkUzJxRnA1WUhLYUplZFhYaFMzUGlm?=
 =?utf-8?B?bFF5L3J6SjRod0xXbWVaYU91S0lJMWhMdnlKcC9rcTQ1ZXZ1UElHeWVabGFK?=
 =?utf-8?B?eFlvdldPdUlWL1JnNXBSZVJ6eGtoU1E1SjluY2ZWcmNLb1hNcXRXZkhLNFIv?=
 =?utf-8?B?M1hSTythQzlnZkYyNzRMaE8zT1VzZ0dUeVA3OXErQ2NJTWNKMDB6VlJpeThI?=
 =?utf-8?B?eFk4TjZOaWg1WWx0Mm5BM09zandJVThuMlZ1akQ5Q1A5eE8wRnMreWUvZ3Fq?=
 =?utf-8?B?QzgvdUNiYkJjdlB4aHU4d2s5dkp3N1IxR3orWWVnczlKYldZOFFPK3RhRlRQ?=
 =?utf-8?B?dU9tZ2dwT01COFNJeWlvYWZhb0taeFVWU05DYjJUQklhWVoyZjBEeGtmV1BR?=
 =?utf-8?B?RlowKzgwNFZVbjZ1dGlxMmZMa2pxWDBUUEJPVlJFbVd3UTZCUm0rU1JrRXJN?=
 =?utf-8?B?aG5QcTJrY0FKTG9qWXd0Y08wYXRXcTBWUzA0QVFWMm1lNTFsbUlxdHdmU2hJ?=
 =?utf-8?B?L2lpZ0tDeHcvK2ZWUUIzWG9NczM4T2YwSC82Z1Y3Z0l5MjEwUWVyK2xJdFhn?=
 =?utf-8?B?K0xLRFc5dW13TUMwUkQ4TTBab045ZUsvMHdmSzRSSDQvREhLbHFHMjljbGU4?=
 =?utf-8?B?bS85enBBL1lsNXRnM1hkOTRmNWh1VEY2cVNia3FPckFOOWJTbG1LUUtBdkhk?=
 =?utf-8?B?U0pQbjlXdUhDZnJMb3IxeXZ0cjNzb1d4YjU5Smdvd2ZSMUlyOXZySjlFSnFY?=
 =?utf-8?B?a1NLaHF6UEI5YVFTZFZhMUZsNVRLbGtBTitXdW5DU29VamtNTlhlOVg2VkVD?=
 =?utf-8?B?R0Q5SDVEM05HbER3M0pObkY2UTVrQ1hXbndCblc4MDVhTnZseXhWOWIyUmxJ?=
 =?utf-8?B?NGhERGZMS1NndjRGU2N5SVl3cDlRPT0=?=
Content-ID: <71D0061DF3997A409EA84F8C1C24A016@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f7009a-8828-463d-3314-08da01a42e71
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 08:09:49.0687 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7JtMangd8mWMbLMEmQNuDwGyfRpuSDhJdhQRKg2JLFRg8hX9c+oe8cuTXUHG/gCIWL7bgn7A+7XWxU2JTN2PCJKhzWdtobFCCdpfK3WfTPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_001010_234879_F19371FF 
X-CRM114-Status: GOOD (  21.87  )
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

On 08/03/2022 07:55, Dominik Brodowski wrote:
> [You don't often get email from linux@dominikbrodowski.net. Learn why this is important at http://aka.ms/LearnAboutSenderIdentification.]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am Mon, Mar 07, 2022 at 03:40:23PM +0000 schrieb conor.dooley@microchip.com:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add a driver to access the hardware random number generator on the
>> Polarfire SoC. The hwrng can only be accessed via the system controller,
>> so use the mailbox interface the system controller exposes to access the
>> hwrng.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   drivers/char/hw_random/Kconfig    |  13 ++++
>>   drivers/char/hw_random/Makefile   |   1 +
>>   drivers/char/hw_random/mpfs-rng.c | 103 ++++++++++++++++++++++++++++++
>>   3 files changed, 117 insertions(+)
>>   create mode 100644 drivers/char/hw_random/mpfs-rng.c
>>
>> diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
>> index 9704963f9d50..69f1fd538589 100644
>> --- a/drivers/char/hw_random/Kconfig
>> +++ b/drivers/char/hw_random/Kconfig
>> @@ -385,6 +385,19 @@ config HW_RANDOM_PIC32
>>
>>          If unsure, say Y.
>>
>> +config HW_RANDOM_POLARFIRE_SOC
>> +     tristate "Microchip PolarFire SoC Random Number Generator support"
>> +     depends on HW_RANDOM && POLARFIRE_SOC_SYS_CTRL
>> +     help
>> +       This driver provides kernel-side support for the Random Number
>> +       Generator hardware found on PolarFire SoC (MPFS).
>> +
>> +       To compile this driver as a module, choose M here. The
>> +       module will be called mfps_rng.
>> +
>> +       If unsure, say N.
>> +
>> +
>>   config HW_RANDOM_MESON
>>        tristate "Amlogic Meson Random Number Generator support"
>>        depends on HW_RANDOM
>> diff --git a/drivers/char/hw_random/Makefile b/drivers/char/hw_random/Makefile
>> index 584d47ba32f7..3e948cf04476 100644
>> --- a/drivers/char/hw_random/Makefile
>> +++ b/drivers/char/hw_random/Makefile
>> @@ -46,3 +46,4 @@ obj-$(CONFIG_HW_RANDOM_CCTRNG) += cctrng.o
>>   obj-$(CONFIG_HW_RANDOM_XIPHERA) += xiphera-trng.o
>>   obj-$(CONFIG_HW_RANDOM_ARM_SMCCC_TRNG) += arm_smccc_trng.o
>>   obj-$(CONFIG_HW_RANDOM_CN10K) += cn10k-rng.o
>> +obj-$(CONFIG_HW_RANDOM_POLARFIRE_SOC) += mpfs-rng.o
>> diff --git a/drivers/char/hw_random/mpfs-rng.c b/drivers/char/hw_random/mpfs-rng.c
>> new file mode 100644
>> index 000000000000..a103c765d021
>> --- /dev/null
>> +++ b/drivers/char/hw_random/mpfs-rng.c
>> @@ -0,0 +1,103 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Microchip PolarFire SoC (MPFS) hardware random driver
>> + *
>> + * Copyright (c) 2020-2022 Microchip Corporation. All rights reserved.
>> + *
>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/hw_random.h>
>> +#include <linux/platform_device.h>
>> +#include <soc/microchip/mpfs.h>
>> +
>> +#define CMD_OPCODE   0x21
>> +#define CMD_DATA_SIZE        0U
>> +#define CMD_DATA     NULL
>> +#define MBOX_OFFSET  0U
>> +#define RESP_OFFSET  0U
>> +#define RNG_RESP_BYTES       32U
>> +
>> +struct mpfs_rng {
>> +     struct mpfs_sys_controller *sys_controller;
>> +     struct hwrng rng;
>> +};
>> +
>> +static int mpfs_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
>> +{
>> +     struct mpfs_rng *rng_priv = container_of(rng, struct mpfs_rng, rng);
>> +     u32 response_msg[RNG_RESP_BYTES / sizeof(u32)];
>> +     unsigned int count = 0, copy_size_bytes;
>> +     int ret;
>> +
>> +     struct mpfs_mss_response response = {
>> +             .resp_status = 0U,
>> +             .resp_msg = (u32 *)response_msg,
>> +             .resp_size = RNG_RESP_BYTES
>> +     };
>> +     struct mpfs_mss_msg msg = {
>> +             .cmd_opcode = CMD_OPCODE,
>> +             .cmd_data_size = CMD_DATA_SIZE,
>> +             .response = &response,
>> +             .cmd_data = CMD_DATA,
>> +             .mbox_offset = MBOX_OFFSET,
>> +             .resp_offset = RESP_OFFSET
>> +     };
>> +
>> +     while (count < max) {
>> +             ret = mpfs_blocking_transaction(rng_priv->sys_controller, &msg);
>> +             if (ret)
>> +                     return ret;
>> +
>> +             copy_size_bytes = max - count > RNG_RESP_BYTES ? RNG_RESP_BYTES : max - count;
>> +             memcpy(buf + count, response_msg, copy_size_bytes);
>> +
>> +             count += copy_size_bytes;
>> +             if (!wait)
>> +                     break;
>> +     }
>> +
>> +     return count;
>> +}
>> +
>> +static int mpfs_rng_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct mpfs_rng *rng_priv;
>> +     int ret;
>> +
>> +     rng_priv = devm_kzalloc(dev, sizeof(*rng_priv), GFP_KERNEL);
>> +     if (!rng_priv)
>> +             return -ENOMEM;
>> +
>> +     rng_priv->sys_controller =  mpfs_sys_controller_get(&pdev->dev);
>> +     if (IS_ERR(rng_priv->sys_controller))
>> +             return dev_err_probe(dev, PTR_ERR(rng_priv->sys_controller),
>> +                                  "Failed to register system controller hwrng sub device\n");
>> +
>> +     rng_priv->rng.read = mpfs_rng_read;
>> +     rng_priv->rng.name = pdev->name;
> 
> Is there also some quality estimation, or should this hwrng only be trusted
> if it passes validation by userspace?

There should be a quality estimation, I'll add one in v2.
Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
