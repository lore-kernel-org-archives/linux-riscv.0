Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E635ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 10:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFebPbTnPRp333B5iia8349AYjgfFCl7+K3cUqOv1Is=; b=aLmPdDyWmRZegu
	3gLf2w2tmDjuFSfHhVyqlEJcJrAyD26wguPMpHjM0XhsTwLx9Fh8Wd8fc3mSdWruRntEcavCsPcjo
	1vLZ8tCoWiDBDlN4P67UNuTB7SmnVINKMMHAa4LhVX4xICkkdf9rdLDLfhFxpp4pwuS5nf87+17q0
	NSeGnqmTbdyuWcEUo6Gj6fiXd8ZaDs/cJjpesYW3taRuMyk8dDDV3qtDxQEkgImh382CUzpgSYDAf
	YvipXjkHIKNsRO8qpeNXMBW7V6ZJizbpcGeTs6mljfK/NdG7TfawrMQuRh97xtoVqgwYVxiwnwexq
	Ngj8ME6eIQWlDXwD8nIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ89W-00BxBA-1r; Fri, 16 Sep 2022 10:00:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ89S-00Bx7m-0Z
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 10:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663322449; x=1694858449;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=MrmcAjELdVddw7QyY8w7pIIGTqHxCo6elA8WTqsuaaI=;
  b=p3cZxrjCOpznvBH3c5LAYainVh/4N8QM8AznC1yRcEB1baPK+Ut+QGby
   guJ3E7nmeKI0VGufjeR0zZRtDtju9d5aJ/j2jriUVQ2vc5Y6GYUJnGGPr
   wh8BwfLe/9BdYDiA/pkXrRzTT4A3Lgtw/mz0kR5PCpPGtdHb0idrfgyFI
   s6g6uwzKc1J1lpeaFqLoU5VdJb2Ue66x3bkCK94b7Fq0JE3kdJsf8JSgp
   G/yfiAh2VUC6bO/IPZQuJmycfTf4wOydjtgELgCZzRxk+ByOElVfpC1+P
   d51e91AfiDpeAy0JdEpHean0UpD//xrFS1+Ag47of8A1jJJfRWFuhnJEx
   g==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="177473178"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 03:00:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 03:00:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 16 Sep 2022 03:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKmLJFKtc180GxEvfxK+Sfr5kZs5dp8xMkmeUTB+6s7l8cC8jHufIdHOnnX7c7QArAh+dfSRU8FSV3elzkm5lZ6QnvIyr+vYANnfQ3FCxZVQhjCNUsGEp/cJiB03cBkq7Vkz+iRpMojLX04k//gjquv1zWjXdEZ0oC+Nt3cVfJr3kSB7qNiG7KmsI+yHbVYhyJrgBOZZL7MULGRF9gCoVSGC0kUNSdKelk5FJ9ha16UC5pe2+ASfnkF3EQqyPDkhwjIrJ1HjiI4lB178LB9E5mCrrAMwQqCnr2T3lJvyBDCphNqrgCcZ2Gc4huHBMXrAq/DbYV7ZpktbW9PfyrVpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrmcAjELdVddw7QyY8w7pIIGTqHxCo6elA8WTqsuaaI=;
 b=jGdmQ7DpYhpG37Rfe7cwPDHQBTASRU1E2u9XFKz7FPeK54neP176BtA2FYExDbBony1P41129udQiWOE3v7ctlZ6SF5OgOO6896yUHeVW+v8xs7rIP+dhZa18f/lxZQ0/1t0sym83NXFf7LBAVxmg96S+T1sgtqRnSekFarHWCEmTHzUWQuiPZLDPVwQ6TAW4JhrmdYx9IZcuqFgUgaAy0LWhdc4fUxoLBPZVhwHw4Brhc+sdhgjSAmkcDeZZVdMM7fRscUrZoPVV2lzyKyUFsPFgMwzARmdeoYjC0tEBbMZ3RzzBFnFWBZu0JvphbJkYwy4n6zRBpVx97brPUQIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MrmcAjELdVddw7QyY8w7pIIGTqHxCo6elA8WTqsuaaI=;
 b=BMI0qhwL5TeM5O9oULNw1raI7USJHuV+pQkDCaTiLnAydn56n8GXVjNQHpzEXQINFsX49jsFe+SdKMkQHKujDBbshn8hFtr/eRUKVc+m0tIWLM145oYn11fOXDct8hOMmjC31K/GTe4IKssGhAmV5sobz7xlYZuCi7onVjuE5+U=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by DM8PR11MB5623.namprd11.prod.outlook.com (2603:10b6:8:25::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 10:00:35 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::b5a8:a5c9:beb5:70b0]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::b5a8:a5c9:beb5:70b0%4]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 10:00:35 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Add support for Ztso
Thread-Topic: [PATCH] RISC-V: Add support for Ztso
Thread-Index: AQHYvn61IrK+ZLFpoUqIjb9+jSm7uK3h6UGA
Date: Fri, 16 Sep 2022 10:00:35 +0000
Message-ID: <c8004a8f-235e-083c-2dcb-7fa746bad421@microchip.com>
References: <20220902034352.8825-1-palmer@rivosinc.com>
In-Reply-To: <20220902034352.8825-1-palmer@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5160:EE_|DM8PR11MB5623:EE_
x-ms-office365-filtering-correlation-id: 5fb6ad06-3f3e-4ae4-3374-08da97ca4ce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9T19Qg6M8G6COVJVyBU9Z/gBvfws4DZjX34EXBfP0yIRZjvQRs1XcY4ZIV+JKsPEDGye/7KPMZsikA6Gd2b9DcCTnISzcRVQsRdX8ertVGFkVRNre4uFah/0UoJbwOrlgEyLGIfAviKeWxkyW9e8pjOZzmND0yB1HZjJ5dF64sflVzeIMcuGGMQ13htACnl/ZcCQN7YnCpI5FhJsJwrPIbeVkdETPUDtk4XS5NPOuo0hC1za6f398MHaFE3ZoEysoxesjRwK6IgnKzWRv0ar5joorGqYZ7giOvSub7AueSU//fkgCpr+KgvO8b+v7cuLRDqr16dQTGTFPdGqw6IhoZ2wk0DvKXWb2Rk1Kh1fPjDyoZlhFYHZ0r9yMs5s6S5tYQQ5raYH5cxiwSt4F24XAfYfBeS+wOmSzPSGJwUO6k/53qsLJWRTNq3t3dMkWyR7godoRln3XxwdjLDKjdQK+5crHv7HMYbGgsVwv1tLO3jBvWqC0iBlYOHW8iNhx+bneyLTLD6yy5QxZI6PEfbOEu9xO0ciM7sTMvrJrJ2r9wmrQdEN+Psfo0xLPD6PzS0VAR2Qql+KZ5yEOHMD1KfpsfbCLtdCTxW5UiAs88zqi7RL9tOQQu8kx+RcHXEhp6u3J0A3PUQErni6/Gy58bmWk979SMaszR+fPZ7IU5hdrj30AUxVuhuuXcaUDuxYn6PQ09uiTK4yEwtpIRDos426UndrN5ltzd6BUBCn69jTwwEaHs/5Sob4uUaQEdZAHM/sOGA+RmHBpHw8Ord2F1FvNulSCBd+raVJBi6a630uBs4me3a6KSHNL8S+DJIISl0lufUxmxzeRP5zK4WlSonAA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199015)(2616005)(31696002)(36756003)(86362001)(71200400001)(110136005)(38070700005)(6486002)(316002)(122000001)(38100700002)(53546011)(31686004)(6506007)(478600001)(8676002)(26005)(6512007)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(8936002)(41300700001)(76116006)(5660300002)(2906002)(186003)(83380400001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTdqT0krbVlDcytFZVpYZm9hMWcvQms1WDBQeDZtLzhwUlBaZEVyQUhyWVVD?=
 =?utf-8?B?SkNHUlJ1VDQxUHFFemE1TGhobjI0bktacEdCWGVPUTlCZi9wbFhYenRxN254?=
 =?utf-8?B?bEV4V0V6ajkrQ1pCb2ZUYmlwSG53TTRNRWZnVGR3RW9YZVBTNzBVdDZWSHda?=
 =?utf-8?B?YmdaTXY0TThNYURnbFVHc21ORUI0RkVTekx5S0JLenkxRE9MTzBqSUFMMjlz?=
 =?utf-8?B?RENIRkFBMkU4UWVjTDJuNml0K2JScHJmbjFxNkVidUZpV2RVVXQ3amJjT1By?=
 =?utf-8?B?ZjhDWkswNFNZNFU2TUZVRXVQVjQ4M2pTS0hkR20wZjB0TEpTZEw1RlZUU1N3?=
 =?utf-8?B?aWZQbFdwZVVCMmhQTzBIYjZRbFNiTGxuNVBxZUNzV0R6WnNqZWx5dFRDQ21x?=
 =?utf-8?B?bGFaRHVjQ3h2c1VuODhvcTQ5ZG5aUXBkbFNGcyt1TTR6MUNGbzM3ZW5ISDJN?=
 =?utf-8?B?NUNXZnF6b0p3RFd3MzE0cSs2N3drVWZvVUlHei81am5EbWNSeGpFaDdBRmxE?=
 =?utf-8?B?YVZHM1JhUVFKR1h1OHUwNkFTUlNQZGdmQmo2K1hvSmJhUm9vcnNsRkFXalpZ?=
 =?utf-8?B?ZjhOOWZ4VVZxWm9CZG9ucDJsZHRnSTdiSkpwNkF4T2lKL0VsKy9ha1ZBMFV3?=
 =?utf-8?B?L0pFWlFEZmx5dzVTcmp1eEppaCs4Nk1Da0kyR0Vobk4vZnhOVEdRY3NVZGtH?=
 =?utf-8?B?Y1BTSUM1WkZYZ2dIWTg3azAybjRNUVBPRFdialF2Z0JUT3VIYnMwQU9ZcnBV?=
 =?utf-8?B?Vms4dXpQTVQ1YThOOFljT3g2bnZzOGtPK3oyU1ZvR1ZDVTlqdmhOS2dwZjhq?=
 =?utf-8?B?L0NCTFhRNmd2TjhXTmREQmxEd0R1QldUc0NpSjFiRmtPMnBqNFFxWE1PeHY1?=
 =?utf-8?B?Z1k1Ympackcxd3ZOR3VZK1paTjNjUm1uSnFMbmxXVWJWbDZ5UmR2eVBUVXhN?=
 =?utf-8?B?Y25Uai95Vks0NlZpb1J3WnRHZHZ0UjJtdGMyUmZjV0FRVkdOcHorTkdiYlNn?=
 =?utf-8?B?R09pYkJmT2RYQVBQWnduL0JlZnIxbWsxNXhuTEVmUnB4SDVIb2dxc1dESC9O?=
 =?utf-8?B?UjlpcmxyR0gxa05EN0dURkM2OS81MnBSRmR0SGlzZlVsNGdTYjhQQ3VIUnJK?=
 =?utf-8?B?ME9XRjhkd2hiT3NCTkMyZjRtNU9qT2x1RVhnVk42WFJVYld0QTh0YnBxRGNG?=
 =?utf-8?B?RFE4TWdqT2hPL0U4a3Y0R2M0czFVc09RdHlLMzJFRW0rNVIrZW9mM2dMa0FJ?=
 =?utf-8?B?NFZCS0FpanA4UU5rOU82TWRjUTlwZXR1ZnNNWkJrclZGQ3VzQnVDUzFEL2xz?=
 =?utf-8?B?TThiWHNEQnllZk5lcVJGazVGRFB1b2t3Vmg1RDhpOXhMcjBSWHlESTQ4b0ha?=
 =?utf-8?B?cjVwUGZKaTZobWFQZ2NVZG1rTkx4OGRHOE9ZbjhxeVRpQXdZWi9taWhDelN3?=
 =?utf-8?B?WEsyUEsyVG1jajlXU0JtekdvYnM2REFpeC9tUFNHSVkvQlZCTGVSWVN3cDJP?=
 =?utf-8?B?Y3BCQnp1SkJJMHJlb0lJOWVPdkZpdlBQdU1OTVRxdDI4MmVYUWpmVXBFK2lo?=
 =?utf-8?B?RGQrNERSK1lCbjBhYlJrWmM1RFBJTGREWXh3OEFtRmtmU1ZuMThPZGRlOG9R?=
 =?utf-8?B?WkwwMzdoUWhnbFZnd2FFd29qaWd5NU8wNVh6NjdDSUxINVJSOXc2RFl5VDJz?=
 =?utf-8?B?V2R6emtaSm8rcXBMUEVQL0wzTTVHamRUeUVYK3pzR3pEMHUySGRWbzM5b1VE?=
 =?utf-8?B?WGJkUGZyVkJGVEVDemxUc2NtQWJ0MzZiRVpvb3QwNE5Jd0pzaytHdEZIT0Ft?=
 =?utf-8?B?MEpxNTRYTWs1NEJUbkVhbHloQWVQZHc0dFh2NHltYzd1MzNyTTEvVzVPOW5R?=
 =?utf-8?B?MzZzVXEwbWpUU3h6ZGdZOXl6bUZWYWdvL0dtRDV2U2VXZ3Uxa0lRaTc0VVF4?=
 =?utf-8?B?N0dIU3hJNEJFY2UxeitkOURHTU5DeFl2ZDg2dzdDKzltdlFXRmUxUmtmYS9L?=
 =?utf-8?B?b3BYZ2NDdndUYk5Mczg0WkF5RG9rR1REMmcybXd0Z09PNU9ER1doYko3UjdO?=
 =?utf-8?B?TW9VSG0vY2c2a2dqUjc0TUs5eS9WUHRodUVWZ256N2xNSzdTV1JTSmp4dzdY?=
 =?utf-8?Q?NUDmHtmo+Zz/sI4E07hBMZrVh?=
Content-ID: <DF06DADDA38F244E94BD487DAC37BD57@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb6ad06-3f3e-4ae4-3374-08da97ca4ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 10:00:35.5416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e1Q46V7bGR9+Mj0+CYTUZtGuTHtpagGUN0DYm56FHU9De6IPBCTbJfjpVYjQQ/f3JNm/e69NJog3iLxiTzlVVY3L5kNImyAwKTIwlwtQsf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_030050_345283_D2E0E6BD 
X-CRM114-Status: GOOD (  13.57  )
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

On 02/09/2022 04:43, Palmer Dabbelt wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The Ztso extension was recently frozen, this adds support for running
> binaries that depend on TSO on systems that support Ztso.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

>   /*
> - * This is used to ensure we don't load something for the wrong architecture.
> + * Binaries that assume TSO cannot be correctly run on non-TSO systems, so
> + * prevent them from even being loaded.
> + */
> +#define EF_RISCV_TSO   0x0010

My only comment, and I asked this on the other patch too, is why is this
not s/EF/ELF like the other defines in the file?

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
