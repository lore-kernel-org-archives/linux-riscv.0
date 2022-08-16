Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8EAC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xATjBHxgUu+ztXd4O+NIlDbr/5RBmmhnvAjW26xb54A=; b=uIG9pyF0JZI4LE
	rmPTPH3aJ8PBxegua1BzMYaKV5cLjcbc5qVGPPM3IfD7y7lr6ZvJveuVGgL20ZLQKnijxfbI/lVEU
	c5T2m8A8t2x6TfTofvHkGZuIRDIwCuC1ywTtOQxvuOeO3Dg2YwyF/jduSNorFzyqM2c/NzsZj39eY
	ov9UHY7CiERy+As2Fzl92nEw0iYno7NAY8E9VjA69zI+U8xc759fs4ILlGkmIbsaDHunQyEhcJ6kg
	L3FK8Jf9UjxDNvjm4Em00gL4IjancefJIgf9+Ni1uYr0asLJGTo3V5GLuLxxPFf+/vKnocGUOWMrq
	BTRNXpdn/LNOu/K+EWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0MG-005HGZ-RJ; Tue, 16 Aug 2022 17:28:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0MD-005HE2-6Q
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 17:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660670881; x=1692206881;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XdrUdlZdARiEIINc9AK6XwrwQkV7pa5wT/UluAT7X9k=;
  b=PeaaSRBP6CWMzC5m6ERWlQ0/4U/iRdVDoxBp2ZGPo0Udpmh761m6/zRZ
   BqcS8+9mAgDcWTHvg9C6cr2u3/wGclq66/BLzBm9VwKSSdYE+g6O6QH+E
   b7Bmls9nLrNUZkFbwnFK2CFS0zF73n7aXI495UG0zFeqH5mGVLJ2IPznn
   ED5iIpdrQtasUcqaQalD2dxw2W0QBVa5uRDFeQkM2fp5D4MxUgiH7dESA
   Bh9m9XQiIV0MC9udKAU5QvYsqNNfoL4xqoPOuB+ufhdkKar/GeKTIwi0u
   znhba1exYrjMS/IblegAynKygJEWtfgIJpiNeea2dYgJfKKZco0W3Vcq2
   g==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="109306137"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 10:27:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 10:27:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 16 Aug 2022 10:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilRr0R4/DMN9tlVDMcDwwBNaEnL3SVgQX/sxt9vXG7Z89t+XB7Qw+65p7c6CfGrR+NhRGp100Xcr4A7D1rwlWr6H8sOI9QhNcByl8Z7ZIOGpaAvTIvUYUT7uxAN4ZjoABSz+V3IC7zp+Mr1SNG/RwaHuCG+JwVVsc3IhTgZJ8RMSvdbTo9bCCKftB0A6wJezsg1LHU3tJFrOD7zbxVlBTBwS3OWXAHpRf7x64ezTYIqtdWjGxCz31ewRm5RSs7loUT/L8V0kJMXkConj6GP6Iy7oLr8uLK6/E5VrmARm/P7moEuwnSQjhmo7Dm1rlmMFWTIL93diG2ShLQn9iemusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdrUdlZdARiEIINc9AK6XwrwQkV7pa5wT/UluAT7X9k=;
 b=S/6dPf2mqzUukO7nWZi+nEdVpQdcVV1XMqt2/N6zgXpEjlG0xuUxEYz7FZI1BXUNnqulRnKv5EHvLPy9hfyuBiIncyqbarQpPJj6wmxcoBG/VR4khuGj6PIYNzBQzjI1Kc4t+9yZQp0EoOAYbD2F8GHmvC5HEVazXTgmvA20BnY3BPoIOIA3K7EzkZ35crAG7LFLPfOrqlkR3xkAzyOfzyl05L2fTp3Vrje9dbhq/u/334g9tXRCKr44gk6Vp5MKOvaYIN60oWS17LLi/FHs6bVkFkjWA0YsIMnZkq7iJqEyWo98UcRUXMJ1ZupaBfI3hJWh7HxBtg6UpS/4IyqJKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdrUdlZdARiEIINc9AK6XwrwQkV7pa5wT/UluAT7X9k=;
 b=dMmEuiMRxSzBNAGiUICeXRxiS50jhg0Ib7VsJaZZ/0cdnse51ncceWOvGKdp2WKIfnJTbxly6KnPqfrujbpcftdvNF+ebL4SJZhBkqHzu1uAbgc5cTtp9O8S8cGBudKG3sqCdUOFBAGTKeQi74eqy0Qaorzvgxn4jBmsjzplHZM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB3340.namprd11.prod.outlook.com (2603:10b6:5:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 16 Aug
 2022 17:27:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 17:27:51 +0000
From: <Conor.Dooley@microchip.com>
To: <geert+renesas@glider.be>, <Daire.McNamara@microchip.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] rtc: mpfs: Remove printing of stray CR
Thread-Topic: [PATCH] rtc: mpfs: Remove printing of stray CR
Thread-Index: AQHYsXsoFy3MJzNmoUOb8KqziB5IwK2xyA4A
Date: Tue, 16 Aug 2022 17:27:51 +0000
Message-ID: <4d414583-1011-4f01-870e-5d3ad812109a@microchip.com>
References: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
In-Reply-To: <bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1fa2eb1d-276c-44b4-6a3a-08da7faca56f
x-ms-traffictypediagnostic: DM6PR11MB3340:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GPgqRfxzRYUYBnyoIzrm9/YVOuL6uTA5TC92KYJ+GNLpJJkvBFBYrLb4wNfSQn6Ax2pRqcMGYuOxr0MVlx1L1uQzVkfJmkpbpLW5jW1mjn1w87RIGja+lYmJurrHPAht2+yXt7iaQApPxMK6NUWpUWycaFAzm6qLrZI/a93c2oCtJe+Amjfu/b1dNFJQPoXeDqP82YMIoX9VGhok3cm3BTrl7yuWhxQh3DCpCobMLuvcwi7MiWKu577C4gvVdRCw1jHCC1mL5i+ts6q6wiGR1CoRqaCDGnK1/GWfzavNL5Z2aGKJ4EnC4axVoYsehJq2tTo+ww+GVJ3fOD4Zl+JN1Q5R6/cAQD7um87lEZOEFaGBvPUZYfSfgcZ2M0inSx242ZqiP/+VRIYFy52vKjSKOssGLu8EMYF7TXUHpw1r66/ylWHuTgjYXoBCqfmXl+erCCRMaQKDK3STJKS8JpLhFyvuPXWrjWdaEZBmgzOonW793gtccxz2BZZGm7PNPOyYg/0NCSc2NMbf12W+TQKemCyKVmDx447sKh7vqEWUAmyFXgBdg/ZKFFNLt37V9D/ynoOV8XPcyjgwpydf++jE8qEf2y+rKHflzIP1R1l/ZPf31BZd56poVDhJBsIszQW49QYIBIwU7wX00xnrSqQdJg6sjabJGNTelpBhjEK3oPPBKfteayKUkib4agY0xvQvDevHhbvKKHNjyGf0LgmOm9bZI5r2cA7T6WQNCbKa5rOUhmrQ5R5wQyxBx7g888M+jIPOuKGXnO9sSxLSRQG5g/BpuX/oYizzvp3NCbokMRAUUVgqRIYtkMU52JZ36zKLltUABcrEFAoeJxSGa9NJO/Rk0t7ljRSqZd66oJVyflNdG8quHEbe73XwpCIaW9Ph
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(366004)(376002)(39860400002)(6506007)(41300700001)(6512007)(2906002)(26005)(478600001)(53546011)(6486002)(5660300002)(8936002)(83380400001)(186003)(122000001)(86362001)(38100700002)(31696002)(2616005)(76116006)(31686004)(4326008)(8676002)(91956017)(38070700005)(71200400001)(66556008)(316002)(66476007)(64756008)(110136005)(66446008)(36756003)(54906003)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWlqb1dKWDVhZHM5Ynh0LzYvQVNBRDdnVElyUW9hOWc4ZWZCaEJzUHEvajJD?=
 =?utf-8?B?TEZqVC9KdWl1aktWZkxoUGZLYnRvREJSL1FaNjliYjBraU5mN0cvUU1vcGY4?=
 =?utf-8?B?OGlJbklIdkRPMkNHdFByT1dhakNtZXpIdVd6cGlOZ2NUTk96Wk5CS2sxUVhy?=
 =?utf-8?B?b2x6dDNCKzFvZlQwb2ttOWhDbCt2cUxBTzNva3UyS1N1V3BSL2VFYk0wVS9y?=
 =?utf-8?B?ZGd3WVgzMlVSUTV4K1BOTzBWWjcwZ2pTOWNMZDhKWnkwY24zaGxycXN0eUVl?=
 =?utf-8?B?K2Z1N2VBdjJSclF6cXBiRnNUQTJMOExHbHBRODkvTVI4UzRSNERtMEQ4TGhT?=
 =?utf-8?B?eUVqM09Dem9QWWFWQklMRlNLMzFpZXFoQW5nOHMwbTBpbVNBZkxmbkFEQ2lo?=
 =?utf-8?B?VUNVNW9MSU4vaElYSmc4TTd6SDB0V3NSdDc2VVdDMGp5M3ByNFBIYWdxRURM?=
 =?utf-8?B?OU9GUnNXRWorcmdKMFBtdGhQZTV5Q1lCWGdBV0pPTTBWeWM2OGNNdXRRbHBj?=
 =?utf-8?B?V1dZVkhKcEFvZ1hMUC9DZzFWSmM1c0wrdG1uYzlPeXlNbFkvSDZramRmTlUr?=
 =?utf-8?B?RmtmcDFNV1gvOUJtZmFJc2RtV0FDRDhYSnQzRWFxNVZWc2VFdEpaMFFHcU9Q?=
 =?utf-8?B?ZllmeU1vOXh4SzEwZ0s5NjJwSDd1THN1ZFNvMXBaVVhWTUEwNUhkREg0Q2Jo?=
 =?utf-8?B?Y2NGUi9mbWlkK2I0MkNFb3ltQmQxc0tXWlZhR0NmQ1dnZkt2RmxQSW14cUdT?=
 =?utf-8?B?b2pDTWRZcjhpdk05VzVIK1dKcTN2TlpJSHRmZHpYbEF6d3ZONCtHd2txMlpq?=
 =?utf-8?B?bG92NGhQci9zWGsxaVVCWXVVbS96NnVvMW1iRlU3N1J5VG9FVS9LbmJ2bjA3?=
 =?utf-8?B?T0tyWk0wS3I1TCtCUVRLRzFZc0ZGbUJzQ2JnRFhESTVIaE5hbUUwK0ZoTHNy?=
 =?utf-8?B?UnU3dlRnR29xQURLRzd1MWMySi9nNFhJTk1qR3JzU01rWXgzd0hEYVR4dVh2?=
 =?utf-8?B?OVBPTGIxWEQ5ZkxRRmp0cHRpSmNEcndvMU5NOVlabkY5TVJxTEdtRDZvd3k0?=
 =?utf-8?B?Sys0UmlZSDh2TUxOSWpxSDcvRCtrK3NvR1hMUUxtbXNHc3haUzZoMVdJZnd6?=
 =?utf-8?B?NXJiNi9aT2xicHhVejdQbkJSSlV6ZTU3ZUV4aTNPay9yNGVuZ1RYNTd2RWNF?=
 =?utf-8?B?NjU4Tk5hNWh2WmJnT0U2a3M3MHNaZ3lGWElONy8rU0NoTFdKZWpSOVNCcXFx?=
 =?utf-8?B?VUJPSjhQbjMzbU9QbTRTemtGbTZHaWZtYUkzMWJSYmVIMTA1K1dUdURVM1Jx?=
 =?utf-8?B?ZnVSUUE3QWpHWjc1c2l6L0V4SWQxUnZyTFU5Wncwa0p3T2szQ0RabXV1OWhE?=
 =?utf-8?B?UTYxY0ZpV0F2dUJkRUFQblhWMW1vUlZKRWhCVjZCMVpBSTJtTDFlWmRHdFV1?=
 =?utf-8?B?UHVTUUQxdlJ2NmpOdmx3RG5WaW8wQXFzaCsyR2c2NFlETGxoV2t4R0FCVDBQ?=
 =?utf-8?B?ckQzaWQ1YkFGWUhabng4YWp5ekI0OG15OGJHcGl1blF2MTJNUkNOZ2NoQTNY?=
 =?utf-8?B?cExpck0zNC9Zck5xejFvZ21OaTdvdjR2OWtIUGZ4cllSMjZGYlMvNFdNa1ha?=
 =?utf-8?B?M09OM2FaL09vTmJRSGdtNlZ5MVI3WVpjTG9sZlhqS3lpWG04TGpaTXV4TTVs?=
 =?utf-8?B?Z0huNUIxOFlyK1dkc1Y1R3R5ajhWWXloVUIySnA3TzhiS0o4U0dGbG0vMCtI?=
 =?utf-8?B?djBFRVdvbjM4TXE1UnhOVDFTc0c4RUp2Z0dMUmhRTU1KeGNkaGR0M2poYWZr?=
 =?utf-8?B?dzdFZkY2ekpNN0FlZlZPNmFKbWlvVVBnalFhOE9SSDJqcTAwZFA5dHRNODQx?=
 =?utf-8?B?R3p1Q1pMRjhPWmZ1aXEvaDM4RkZpZm5KM3VFaXpVamlKb3lOM2VPOHlRUitm?=
 =?utf-8?B?RmJrdVUyNHFYNUV4YUZuR2VodkZ2U1M5TDh1VU5YRkpnTEVadWlTS3RYUGpv?=
 =?utf-8?B?SUpXSEJJSkZhQldSNzBIdEJrclFJL2xmT3pTbi9NQUV2bnJSRlVxakpnMUhr?=
 =?utf-8?B?NHR6ZjJndklOM0tick9TSEpGWFpQUjB1ckJxRkRCUTUyMjl4MHFoZXpGUFA0?=
 =?utf-8?Q?nBgaN4uObqKA0EhlkgpZ/bXwk?=
Content-ID: <58667C5BEC725345AE6338FBFFFCDE76@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa2eb1d-276c-44b4-6a3a-08da7faca56f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 17:27:51.2835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOdBLT4Aml/CFT7PRj5QMgVcm+Nb2h11xo3Al5qNxlh1x/nNA3UQlxQKUyvcDw3WFN2w/GDXn7M8Z/jJmU6FbOqHxOVgD5tXEmcfgMF9JEE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_102801_348165_D4B9CC86 
X-CRM114-Status: GOOD (  28.67  )
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

Hey Geert, thanks for the patch.

On 16/08/2022 15:18, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> During boot, the driver prints out a stray carriage return character.
> Remove it, together with the preceding space character.
> 
> While at it, change prescaler to "unsigned long", as returned by
> clk_get_rate(), to avoid truncating very large clock rates, and update
> the format specifiers.

If you manage to into Linux with a reference clock that high
let me know ASAP ;)

> 
> Fixes: 0b31d703598dc199 ("rtc: Add driver for Microchip PolarFire SoC")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Apparently updating the RTC when Debian userspace starts fails, causing
> an infinite stream of:
> 
>     mpfs_rtc 20124000.rtc: timed out uploading time to rtc
> 
> Increasing UPLOAD_TIMEOUT_US from 50 to 50000 doesn't help.

I didn't see this once during development, nor when I tested before
I left work today. Tested when I got home, happened once the first
time I tried it & never saw it again after that...

I'll take a look this week and see if I can figure out a cause.

As I mentioned on IRC, I wondered if there was an interaction between
the HSS you're running & the reset controller series that you applied.

I looked back at the the HSS, and there was a point where it did not
take the RTC out of reset - but that predates the version you have
(0.99.16) by over 6 months.

I would still be quite interested in seeing if it repro's without
the reset series.


> ---
>  drivers/rtc/rtc-mpfs.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index f14d1925e0c94dfb..944ad10365164c4d 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -233,7 +233,7 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
>  {
>         struct mpfs_rtc_dev *rtcdev;
>         struct clk *clk;
> -       u32 prescaler;
> +       unsigned long prescaler;
>         int wakeup_irq, ret;
> 
>         rtcdev = devm_kzalloc(&pdev->dev, sizeof(struct mpfs_rtc_dev), GFP_KERNEL);
> @@ -275,14 +275,13 @@ static int mpfs_rtc_probe(struct platform_device *pdev)
> 
>         /* prescaler hardware adds 1 to reg value */
>         prescaler = clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
> -
>         if (prescaler > MAX_PRESCALER_COUNT) {
> -               dev_dbg(&pdev->dev, "invalid prescaler %d\n", prescaler);
> +               dev_dbg(&pdev->dev, "invalid prescaler %lu\n", prescaler);
>                 return -EINVAL;
>         }
> 
>         writel(prescaler, rtcdev->base + PRESCALER_REG);
> -       dev_info(&pdev->dev, "prescaler set to: 0x%X \r\n", prescaler);
> +       dev_info(&pdev->dev, "prescaler set to: %lu\n", prescaler);

TBQH, this does not need to be a dev_info() print. I don't think it
provides any value to a regular user.

Either way:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks again,
Conor.

> 
>         device_init_wakeup(&pdev->dev, true);
>         ret = dev_pm_set_wake_irq(&pdev->dev, wakeup_irq);
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
