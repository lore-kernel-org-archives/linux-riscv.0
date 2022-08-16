Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB97C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeBrIEhNVpprhJS9z7TUhs3NzQUgSz+UwHB/pNNvt0c=; b=f5qY1tptIGJ3Dz
	qQnVP1LEOGotDiGJWBRmKZ5zbdHENh6MEUneGDiuIub3RiBMVxKk2V5uI1vxZbdRlfS4t7mv9MsJj
	++PsofzYkdEM+WqFETVU0qw8zpLNY44vdag6Zb6Cr/TaYGEK4Pd4HQC2thu02zG/ODlyOdrEIoRLc
	QXykMYaT39UWh0oqk9H0fWT94p5DYZb7YYcvBXod1EpZSi3OaXeBBMorraejEtjSRXdA9GSjw6TYo
	CzvYO4iviExE2h49bRTdYPwAVNczJRKViydkCCoIWC3KosZ7oyMVsEZ0t9B5C9Cu35fl3S5bNq8CH
	kvYQ2hDei9+iIvP6EZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzma-004qtl-5C; Tue, 16 Aug 2022 16:51:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNzmW-004qqS-8I; Tue, 16 Aug 2022 16:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660668668; x=1692204668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0dW7jiNnrdXixWopBiPkYKvyt5YusbK8gTjn13X4Lj0=;
  b=ZiuG45DkVjWBvu42Ele2fUHuNuV4DbmgblYILyM+KxwTme6dKh82iODP
   XTJj7MPfWrKeDxE6WaIsVGhdCkKvLgD3V1FlqDFV0k+j19TVtjzZhClb0
   ClXO/qVSz3rzN2dis+rvp1Jt2FyuhOzJOB9CkRXACZnjE94b2b6uf6o1c
   g2+G/p22RzddjN7PCFOOdiTAsQszd4SNddpJKxiTWSxqSzeJ1Hdee9GAN
   WHtvn4hF42Hb8zJ/pQgeqnQI2bfa5rghn5UN+S7fMsZSm/4wxEqTNeA5k
   HUJawvkRsOG3M8OjZnTMvfdYly4qVSOgMKzUK2flQVEnT6hBCUGobLKm8
   A==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="176627365"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 09:51:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 09:51:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 16 Aug 2022 09:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0SctkJF0aYL+GLNe43wsxFpcjdBHA9quAxgfq8kk7Yaxz8jC5vKZ9PNW1HY4VJGrtnSuGvGg49jTDglgKyqvwspTR34xLW7heY81+eUbfHcYOqonE+O9fnWN4w3zFBb0F6mR9JZwvxDWuEZ+66a3qWfO2EE8PlFmshmHcOVbdw8rkolYqrwTP6kMWOd+8Y3udR47sXnlActefEgMW1p/mGQlUlW60SuYVLWjUGhZSq7+x8tyZP0hgK4+F88kDRXkrsqrRBF3unqRWGQZhCgIeYGOkREcI5t0Qoq2mv4ZOdaCrBFuNxk+aemFXbVQK0B63vMf/D1zu6qJkXirOll6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dW7jiNnrdXixWopBiPkYKvyt5YusbK8gTjn13X4Lj0=;
 b=dumf6zeKTQUtfcoiPtoEmvzQIYR4jSOdjI59LsVsFOy/kHTH+hhCttbj7qmPcqLnaWSCMtYXMCXQ3ViY2qAYYZmOlB0zJtINsnYQ8dLyIfILYWeTP0JZ1u+1Vv1NQgP3/62oH/eSBPX+/36iO2cfOXsfxZCV9bfEuKquILOOlhvJISpfKrmHUM+i+6+y0yC+YYx5r2MF5Sb8x2fgxplpFzOK5iP2Ffu85gpKmJuXXBxKPCIKcdepSyfPUuRDuhhYNZE+1RJWLWBvKr+FS1LsanPmrV3LqHDRzUc2Gun34AaGKZBDN6rzJ1GjV23J54/92oggjxmYNazZGhUyJWb6qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dW7jiNnrdXixWopBiPkYKvyt5YusbK8gTjn13X4Lj0=;
 b=vGwawzSFq/t50uaPSE8sYN7YHGiK/nNCAUWEEYdyz6ElkjB0jYgcWR8AiRdmQBVoePGDr+nBSELudj/uUVTtk2nqQF2RWUiFg9VSnlK1zIViQv0+m3UXLldo+P9GMtIjeQh7d34nr/R2x7JCW5WOIk+8pVWfK76fxUKBxc7Xwmk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 16:50:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 16:50:56 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <Conor.Dooley@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <daolu@rivosinc.com>, <jszhang@kernel.org>,
	<palmer@dabbelt.com>, <re@w6rz.net>, <apatel@ventanamicro.com>
Subject: Re: [PATCH] riscv: Ensure isa-ext static keys are writable
Thread-Topic: [PATCH] riscv: Ensure isa-ext static keys are writable
Thread-Index: AQHYsY2eGYLw8iAi7E2kcFjuy+7hb62xua4AgAADnQCAAABOAA==
Date: Tue, 16 Aug 2022 16:50:56 +0000
Message-ID: <88a888fe-afbf-3579-73d2-9c95bfcfda55@microchip.com>
References: <20220816163058.3004536-1-ajones@ventanamicro.com>
 <bef1a711-506a-d07b-dbd6-3a0c5f90aef2@microchip.com>
 <20220816164950.vyo7iiiehhhasxpr@kamzik>
In-Reply-To: <20220816164950.vyo7iiiehhhasxpr@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abcff16c-1d1e-47f2-bc49-08da7fa77d79
x-ms-traffictypediagnostic: CO1PR11MB4964:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8ROf9cQ2Skks8A04Gi3Wo2G9jLBXSrhtlWqbQDeaSXEgiFMoWeX22CengqvI9wkC3abdqfPDqq5PhGrs7oHqu2vmrwrp5AQ5CRFqf0fB3fYCboYuIioPCturrN8xfPt7zAycpjnmbS+HotgLnr3PKRvzihHZK0ZAY1linqfzzcX5bKFPPL5ZfnwgoC/qD3NpIT+drOBPY/7crqZiMTwtD3dBY6vF5Cz4mXC9pLKPGcWZhY1oD05SQ3rmLIbYUTbsyF9vBpUd2uZHGehgs9GfA5wSkNd38/IaYRCgn6Xn6wPMlXcRzWPiL66XlMg7RHqpyPVWXT/RVYM05XiKprSBTob6SF4MXaPTDEF8iMJrOc3KZT++FXDlGhz6ulhbGAnqh9we+SYH8eNAqtei0HX6LO2WUQLK5yqglSOOfRtdD+jlDsR6tHG5JgAeoHbRwqkJ/2lLBrongYA2ZbbRUZvjnToFYi69y7DbwsfPpy4vY5TXpSoAYSu89mhqO/yGaizUYHA8cFNN4SshCXxdVaHoBq0h3XNXJv4ZTp1K1inmi3rnbS/Ae1Z4HTF+jL5tMTieIWYyUSY8qIJImAUybtGECP6ow2Uy8Ns/44ulhwfEGAw5bATK+mEUYaMMyTeLlFkMUHNj/OEK+XTuyWPodj6bE44YYdt+ypwU4zZ40KBoNF94GJfETl7NN4dJCY+88H9l6CVlyTvq9BkbK1YB6Yr1OCpkO8D1kgGNGXF1jTFPLJL/h/Gu8YNNl+obfWstdF65nI6u92Dgw2gHeTSydrpSnRRKmXzeCdtN54F/jsJtPzPcsmKxL0xZ77Pr108LMz6pv/e/jlCKAjxfe02Sc+f/HvRzUdLCx17SBoip9I21VPBADk4hGmwhIxJfHBDekp0175FrjdeMzdJRK7bxjySjIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(39860400002)(346002)(396003)(136003)(4326008)(83380400001)(71200400001)(110136005)(478600001)(41300700001)(6486002)(966005)(54906003)(8936002)(66556008)(66476007)(8676002)(64756008)(5660300002)(316002)(66446008)(66946007)(91956017)(76116006)(2906002)(53546011)(122000001)(31686004)(36756003)(186003)(38100700002)(26005)(2616005)(6512007)(38070700005)(86362001)(31696002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXRUa3JENVZ3QUs4VDVPZjUwdkFBam0vQ2NuNW9INFQvcGhOaVN4QS9sOEFP?=
 =?utf-8?B?OThvUERaYXJldC80ZTdDQnFCRlhkVnFhZUp6VlJUbCs1MTlGKzFWOTh3S0sw?=
 =?utf-8?B?MjhKU1NpaFQwTjkrMUw1Q1NsSUJXRzFvakNCVTNjSk9mL1psa09HWXZlZ0lC?=
 =?utf-8?B?WWpmL2R4UHdvbzZUY1k3b1VpR0lqaE5IQThQUFAvbmxEa1ZTcE43ZG9MQ2h1?=
 =?utf-8?B?Ui93WnZEM0tVWS9lSGhwRFVUZksvNW9TUE9qZ3V6eGhsak1BeDZxV0VzQTJk?=
 =?utf-8?B?cDhpZkZrVW9hUksvSWxpNlp6YUkrTC9IQXpvTE9lRFpwUjZCU01iNldGYzlo?=
 =?utf-8?B?eGQrcnpYTkNnNkZCaGVPOTRJU3JwYVBHZHo0TlZxWHBaTDVnQ1JaNmE1R1BG?=
 =?utf-8?B?SXRzaFFvNG03WXhXV2k4RkpINGdFWElpRksvT1ZZbFl0UVZrdUV5ZFRUNDll?=
 =?utf-8?B?VVFLUzFCRkFqYzdxT1dNT0R4Zm5LYzUrWm9RVFVLVTdHQU9aRU8xS2FMdGRV?=
 =?utf-8?B?RjFyZS9VbnFUSWZldDYyZkp5WXF6ZitMQk5odDJIQ0xnZDNBNUZoY2FGQUM0?=
 =?utf-8?B?Nk1UTlJiMWtXYkJ5eHFTSmYzZXRuUXJTMmF2K2FjSUptK0pXeUtETjVTN2xC?=
 =?utf-8?B?SEUwektIQnB4SlF5TmxYTUR3MzVrZngxdjNIaWZvK1FOVjhsdmIxUVdNc09B?=
 =?utf-8?B?L0kxTk9Hd3kyazBTZHVpQmtScE40Z3oyb1Y2YUtha1Z3cU13ZWZwQVhiUFhu?=
 =?utf-8?B?bCtDckt5bFZsR004cTRKcmFUaGVIaGZ5TnBseDVaR0NoL2pMWHZhM3gvcVJp?=
 =?utf-8?B?YmljcWRZUmZyekdRdTdEeFVxMmZXSUVMNVgyTjJDalFBTjd1QldXeVNXbEpI?=
 =?utf-8?B?ZFZIejI1SmFBZ2hWY2ZEcnh1eVpFQmx5L21EbHJqNkw0MUNwUzZXYlRzdEY1?=
 =?utf-8?B?ZjhOYjdJUlJMZzlaZ28vZEl6SDVSNUFKTUVqcllMOVB5R0w5bzdJRjA4UVdU?=
 =?utf-8?B?Z05ETk1QaUMxMFR3Vkt0RTdqZFZZd2pFc29lcU9SV09NdUFLYzJJM1NUNEtr?=
 =?utf-8?B?c1N4cVNtWWIwM2NYcmdtR3FPZlpuMG5YWXJEdU0xczROMUZGai9RK1lIREVR?=
 =?utf-8?B?QUlmU3FISjkzUUh2YkRnUzFLV1I2TFVFdmREdzErekI2d2RpbXBHVUhxMTJr?=
 =?utf-8?B?UHZwQ2RqUGRUZTlNTWpYc2s3UTlvTUhwblJwTWRNQ3NjTE5ObUp5MjFQbW5j?=
 =?utf-8?B?RjVGeGpGMkZBc2hmdCs2VDRMUXQ4cjZzNXRDRGRLTjhCSlVXWGovakg0TWJx?=
 =?utf-8?B?TU9GUW5SY2MyMnZ1N2VydUo0NUNvWHVKamhhSEZrVDkwS3o4blNVYnF2Z2ZC?=
 =?utf-8?B?MkF2Q0QraUozak9zWHZJVmg4M011aHNXTXdseXZrYjFWbXVqNnpJQzVJVEYr?=
 =?utf-8?B?cStOOUtRVGNvNThPQWRVT1d5b01oWkNRZjRpcUZTT3B3N3k1cFBDbEl3M0dy?=
 =?utf-8?B?TVhKMW9GTWV2VVNtMGhJR2hXbHExQ0IwaklOckFRdHpQVnhlOXJOQWZqMjY4?=
 =?utf-8?B?c1QvOHJmNFpLMlh1ZnI4TU1zNXl1WTZiV1BQbDZKeXJpV1dHdG80UnRxR1dp?=
 =?utf-8?B?WVNwM0grdWNPbFU4NEdrRjF6ZW9MMmg1ZnR3U0VjV0N3eU5mN3k3RGRBeXk2?=
 =?utf-8?B?T3dVeEMwY3krUFEvRTk4U1ZpOXdwMUovOVVhUFVsdzVsbHBmNkxWYzJoQVVo?=
 =?utf-8?B?bXJKNHNPZFdSbGpWTjBLNXh1allkUUVUSVEvMUg1YlBuSU96UExoQ1R4Zkt1?=
 =?utf-8?B?MVVsTmFybUFucXEzMCt0Nk8xcHVsL28xck0rRnNCQ0ZTTitYZUg5eXIwVkZX?=
 =?utf-8?B?K0xrOW5vOEZidkFhUTdrK3B4OFB5bFhFc05OSkJaT2E5eGduMGdiampld0xl?=
 =?utf-8?B?dFEyOHlWaFZVcXZwZFhNamZVQTcwYjczUzE1dUh6Q0ZTbDN1eHpyTDBpcC9n?=
 =?utf-8?B?aS94cVNLMjRGWXBJWSthYk1uRmpFUTV0K2NHQTJZSFZJa1Nyaitzd1E2bHZD?=
 =?utf-8?B?Z0htVGovWE56cnJPMU9YL1NYQXlTemxFbFpqeXdCeDZzK0tpcVVEbWxhRTZ4?=
 =?utf-8?Q?A/t1AyS5m/wRVaintNzeuxIjy?=
Content-ID: <36B789116EC393469E0E7C8A3B4B4B3A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcff16c-1d1e-47f2-bc49-08da7fa77d79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 16:50:56.7117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xq34sze/NFDdQ4rFQqLrj6p2Ky9lI28uSPKtKxNjXsaZh4TtxNarm2iDhjTmc/gayqRgF68AlLcwWSuqYBcebXwN3lJlLFJizM2q70+Dor4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_095108_580197_E83DE8DE 
X-CRM114-Status: GOOD (  16.96  )
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



On 16/08/2022 17:49, Andrew Jones wrote:
> On Tue, Aug 16, 2022 at 04:36:55PM +0000, Conor.Dooley@microchip.com wrote:
>> On 16/08/2022 17:30, Andrew Jones wrote:
>>> riscv_isa_ext_keys[] is an array of static keys used in the unified
>>> ISA extension framework. The keys added to this array may be used
>>> anywhere, including in modules. Ensure the keys remain writable by
>>> placing them in the data section.
>>>
>>> The need to change riscv_isa_ext_keys[]'s section was found when the
>>> kvm module started failing to load. Commit 8eb060e10185 ("arch/riscv:
>>> add Zihintpause support") adds a static branch check for a newly
>>> added isa-ext key to cpu_relax(), which kvm uses.
>>>
>>> Fixes: c360cbec3511 ("riscv: introduce unified static key mechanism for ISA extensions")
>>
>> Hey Drew,
>> How about adding:
>>
>> Reported-by: Ron Economos <re@w6rz.net>
>> Reported-by: Anup Patel <apatel@ventanamicro.com>
>> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Sure, should I repost or can those be picked up when/if the patch is
> picked up?

Oh god no, don't repost for that alone.
Sorry, should've specified.
Conor.

> 
> Thanks,
> drew
> 
>>
>> Thanks,
>> Conor.
>>
>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>>  arch/riscv/kernel/cpufeature.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>> index 553d755483ed..3b5583db9d80 100644
>>> --- a/arch/riscv/kernel/cpufeature.c
>>> +++ b/arch/riscv/kernel/cpufeature.c
>>> @@ -28,7 +28,7 @@ unsigned long elf_hwcap __read_mostly;
>>>  /* Host ISA bitmap */
>>>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>>>  
>>> -__ro_after_init DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>>> +DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
>>>  EXPORT_SYMBOL(riscv_isa_ext_keys);
>>>  
>>>  /**
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
