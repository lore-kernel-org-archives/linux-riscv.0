Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A088CC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzV8ia2DPm5UXsxwuYUDdiIWyLtKYESNitl/qlJrvoQ=; b=3UklQzCOisfnhR
	u+coVHwR+8u7hChhhzQPyDcHkzPL8bSdgdB+YzNeTaLKLjnA/P+8RWe8rwyDvRpd0ldynlR54xoFN
	AoHUdi2+D4nm2LF3s/KnqsVxx0iaOypUar/4Fzh+JiuF48PRym3M2mdrsFs0iPXckvne198vtDmUP
	meMCnlGiGncaKug042TMRpNeXJ0fUzt0W9zQoN3cCp4fvKPUfzVnsNvAlNeNlJUOqPgu8c1YCqJZ4
	iRgKx1X+5eEGS0adibkJfQ0igNZMOUPw/wTyBUHTPKZDxdT1BIryOEm/AsGbUnLGrA+NjK+qpNOHA
	f7EAqbo9Cb/JKma9wINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MUg-00GFxz-AQ; Wed, 30 Nov 2022 12:47:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MUc-00GFvo-80
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 12:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669812435; x=1701348435;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7QuG9NWnIPHjp/GeTm2wDjFAagAzYKFtvacaiti+tPo=;
  b=Kvq8X2il7pQbpk6UmOkJ5IVk/mAe3snlczUQlFTlht6ElZpjx3JpLDxa
   UCfmHiKJQCL5oc5ddDHrYP6zgHytcOGyBwtu1VZq0LxKsIZ0vpDkjIdix
   kGViJvnsz+1GR2d2yGPeN3cTtmnetAgQCCxgizkYEeD7kkR43VUWgcbXV
   QwKFPrhqHv+2xs+VPPkiQF5MchbDa3UEYne8ECLRPDVpBUsMuq7yWYvuX
   w7mzYyQrYQ55GRPrnv5uqOcHQjJkQDpsbkLCh5mHUt3npFRuqodsf0LnI
   asjtWg4+trq0uqUQf/CopRc7RvBC9G02L4VA7p2jn8RIg7BcqCRR8rdin
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; 
   d="scan'208";a="185857584"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Nov 2022 05:47:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 30 Nov 2022 05:47:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 30 Nov 2022 05:47:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP0LMn0yeKR21Lt8679YHjV/FD5IvWJhW7PiYJTRdQGHy5RyA4BJXZtv6UB2ye1eZ0KscjPU3ytx5PEJ70vV5MGbwF1ut9b7oaI60emfwWpQ/8f4ILVFTD21fEXteXHgutu7oz0QWywwdfu2bdbo1DZ1FE+kmSuv/1l4qn+ZvC0XTabIm896K0CCVEgbRGcziOYTXekanFSZ97kbRb/rWRasf1rzFbpMYlXA7gbebsTofgKMYP0Xkl/UgNj2xbYeUJ81LFMZIssKvDSvveKll1c1MprlCUrZxdOQqBHj1PnckmcPpwJ/Ki3EmwRMVzgc31yajViZYTNpq6eqsn7CsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QuG9NWnIPHjp/GeTm2wDjFAagAzYKFtvacaiti+tPo=;
 b=DGvMjdWCoX4gOWLFW0AA5KLZmi7VpdTwlIzq8ffzct8z77f4Ueu6eMMzE2BgD+D/ZEDhm3Ozr9UmFp2Ai4sL7RKyHe5O64h8SYtMn8EcGvWZTBM992YLNZodyZgyHlesVghh6/tm9YBYqmEg7klc57GdYLmpoFks6SWBIrEq3akTLV7qxuAQfYz+/oSt9Tny7A/foLs/Zpy41kxWBbMJQDrXU0Mv2ouqOfgRZe0EQmOZjdId4vhoUNnNoa2pojtoHlpPV3S+af92fKzqM7n4wOsepbzpcJUYPbPXAMjlB9AM/w93UPKbShyGFZIH6tCVCb+8UjmZ1ES58bed37NN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QuG9NWnIPHjp/GeTm2wDjFAagAzYKFtvacaiti+tPo=;
 b=cqRlYmNvYji9rqABJqrGm4efSKoXPxNNRRSwmQZHTZ45lcG3juPnEmvmpnaiVO5/asZLpFpCIAobhAv5ilXVTinzPaaC8MpuMRKocSm2m4LOjLsnhvzyDPPBzR1c57GTDMfrf99OFa/dnKmHsPVs4d9x0fmYQKx5Pa1eZ0d+8Fc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 12:47:03 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f79d:bb4a:e2a1:7bb6%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 12:47:03 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>
CC: <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<heiko@sntech.de>, <apatel@ventanamicro.com>, <atishp@rivosinc.com>
Subject: Re: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Thread-Topic: [PATCH v3 3/3] RISC-V: Ensure Zicbom has a valid block size
Thread-Index: AQHZA//L8KTmIEGzV0+hnjNXgPsPPK5WTjmAgADq5wCAAB3xAIAADnkAgAAGEgA=
Date: Wed, 30 Nov 2022 12:47:03 +0000
Message-ID: <fe2ecb8e-ac35-54e5-0169-a26ec281cb95@microchip.com>
References: <20221129143447.49714-1-ajones@ventanamicro.com>
 <20221129143447.49714-4-ajones@ventanamicro.com> <Y4ZhT3R34cE35a0K@spud>
 <3c64b508-a629-0c34-1119-e854b1968a2f@microchip.com>
 <20221130113314.jagmoosmx5ktwt6t@kamzik>
 <20221130122502.52w45qvxu73acfrf@kamzik>
In-Reply-To: <20221130122502.52w45qvxu73acfrf@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CO1PR11MB4963:EE_
x-ms-office365-filtering-correlation-id: 17e374c2-3997-4997-7567-08dad2d0fb4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L8FFf/KyWbQbD5oSd04Bb4SK6ZApO45n3ebYYTPj5moWfiGD2nvXNhaoSqrgBLY9a3bZbc7U9sPJ1RTgdftCXdxilXeYYm+pskwXRJ+D3b+P4bpf65WHBvzlw3l0WE2+n289UVt+3WfOUEiIQC5lYk94U9J2h/1iHriXtIJd4WNO7LesZQ67WVjKUhYuztolKQryRY9d1QwcBzUMHFFxqug/CzpqZTu9XXKhFQETK/xH/D3Pgt2WW3xgIvQUnnrEoOUvD7WSxiuyLHLa9BGj6PugkE6lxXnxFyZ3wppgzNjuagvGfZ4HefVb7lWQafdzhCWxo/p9qiSREd+llKPWj5VFs8T2qKfpqiDOBpxVnp6aAta05kN7oQ9HoCti85zfO71yyAzX1SBxl0D7bPEeCC62hJHYz0L06tLF7NlNb+cdHzHgOGZu6ZY+U5strKasGiQpBkYaEQRRAwWgIx0zn3m0lIKe7wUOMZiWjYexLKnJG5HeyVqLMUL6JzsxQM3/+r2ll2ZqTvke3Me583gRk8ew7v6NvL7F5A2u258KdiguMhVDbvbcIurrgeesrZmA4reovG8BFkuGqCMqdufAQ9hYDpdKT2I03LNhD+nxwrZhhYcrmLkURyZNAPN6clbCpVpteGL25jacTb3bX2V6bGLVuL1LrJFFFAfweWW0O/ppEkToN+0ATgRpjCCUOcQd8fRV3ZOk+YdoYp9TN8TktKtnHA85LEmD9CWYHG3KP2YZzFTPTKh8THev0Aut+2/s2dP3ol7nQ9kfY4ln5L1CO0fyWQlp29TDu4v1x2iK+O4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(5660300002)(41300700001)(54906003)(2616005)(6916009)(26005)(6512007)(316002)(76116006)(66556008)(66446008)(8676002)(36756003)(66946007)(4326008)(66476007)(122000001)(38100700002)(38070700005)(8936002)(64756008)(91956017)(2906002)(186003)(83380400001)(86362001)(6506007)(6486002)(31696002)(966005)(71200400001)(478600001)(53546011)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjFxTTFNeWlMNHpJeVJFV1cwbEVJVk50S1BOWmR3NFlEWU1CVm41VWFjcGs1?=
 =?utf-8?B?UW9CdjJISGJjMXdzSFlHSlZSeDQzS01FdTBQNVprb2RPVy9XNkdSNi92ZDZi?=
 =?utf-8?B?SjJWRFlvL3JEOEpRaWdKYnlXUElBenlLQ0FoVVY3ZXhpT0I3ZE9sMnkxQzI2?=
 =?utf-8?B?eUpzU3F2ZVRocHlybVdYSGwxNXNBdityQlRvcHcycUNGTGhCeEpBWnA4RDdz?=
 =?utf-8?B?NmJTU3QxU25MSEZYSVh4d2U0MFJaK0UxRnVoMmNKbjZUUkI5RVdncTJGNU1i?=
 =?utf-8?B?bE9sRXYvQ3dIdGVDa2Fja0FYNDk3YjdMZWNUbm5BM0NTd0VHdk5kbWJxNktp?=
 =?utf-8?B?eE5uVVNIbW1TNUpNcjJxNU4yZmV6MkoxTlBwdWZWOVl5cmRoUi8zK2NVR09T?=
 =?utf-8?B?OWR2NHhIeVZjU1NIaTdUS3NVV0U3cjVyakdKU1F5cWtMdFNKbnZwTFF4eUE2?=
 =?utf-8?B?QnVrT1hmLzkrMzhHc1kxRTU5R0NselRiczg5Z1ZnK2g1NU1mWllzaWJSL2d2?=
 =?utf-8?B?b1RRSElKM1pidVRwY1lJVFBaVjV2ODJLNkNZbm9KZENOaDVhMGJqNUJraENY?=
 =?utf-8?B?ZmF0SisxTHJOWEtsNzVXYWh5c0ZHUnpUWFVObEMwb1VOQ3oyUzRMRkhNaTBt?=
 =?utf-8?B?UmY4YUZqemNGK2pXU01rYUZnbWs1TXI4SkhJMGNUNWRaTVB4aVdPSUFLZDBv?=
 =?utf-8?B?eGJVSXI1VjB4SmtaSEp1Y0dvWjNGQjJoT0R4L0Z1S3hVTU92WU5aSGFWM3ln?=
 =?utf-8?B?b21LUzkyZzNzMmw2c05sTkRjdm9LbEp0S2ZTbllQb2VVVE0zWUpQVmtCSVlp?=
 =?utf-8?B?WVdHNUJ0VUFreEJXUGVtMkZ0cGJNb1M0MnlnWkVTUzJ0WlpTcy9YYWI5Z2d2?=
 =?utf-8?B?dHVBV2NBWVViTm5NS1NieElHWjBwU2YxY29zMk1yeXNiLzdjU2RhNTgySWUr?=
 =?utf-8?B?OXVmRm9hZ3NTOWZ2eEltblJzVnVHTVppVHRydFIwZXV2ZzFianBMcDFVcW1P?=
 =?utf-8?B?TnlOL01JcTR0ZHVxbDlTdkxUNmx3UW5wWkxRT3dyWnZvdHlxc2hmYVZrZWcv?=
 =?utf-8?B?bHVVVmFWL042NG5wUkUzV3pRYnJYak9TSTdIallUWmI4V1ByeGJrYjBxYnhZ?=
 =?utf-8?B?OWtYN1RqSDZPcTFiY1Uxa2k3ZVU0ODE2UTVDRUFGaWE3M25LRyt6SnNqajdm?=
 =?utf-8?B?ZTd6d2djdzI5djV5cWQrZ2wvUVhCc0FFWEhSL1ZqQ0dWbHBXeDNGVDNLNlAv?=
 =?utf-8?B?bktCcVdYMXhXMmxreEs1R01nUHN4ZkN1MmxBTWZoaVZzQk9GMW5DeUNFSW1K?=
 =?utf-8?B?aTJPWXN4MTVsNjdTcG5FOG1QT3VyK2twRk0xMjZ0cjM5ajhVNmQ4encvbmlD?=
 =?utf-8?B?cGYyc1ZTdFBnT2FnbGxIb3dUemRHd1FKcjR1Mi9BMmorSGRrV3JBY2FGc1lY?=
 =?utf-8?B?d2kwOUdta0Y5enZ0NzFKWkx1NG9zSkdXdURGMUZUa3NkSzBVb1ZLZERiMUdR?=
 =?utf-8?B?WFhjRk1ESmRaRGFhdzluemg3N29oaXRmclZDQlZiUmwyazgrRkdtVHVIYmRl?=
 =?utf-8?B?cVB1bDZpcWhQRERiU21va1JFRUxTNE15L2pzNng3cmIwVzEvUjJJZUJ3elJO?=
 =?utf-8?B?dEJHS2ZtUXNhVGZPdlBnRU5ENE9naDJ3NFNMNWNGL29hS1pacDJaamx5djVw?=
 =?utf-8?B?WEFjbFNjY0oyQzM3L2w0bmlCVkNHdEx1MnhOcFBQbDB5eHdJYlhHdi9aM0hs?=
 =?utf-8?B?SUhmMHlaOUUxVmhqdnh0bFlHV1MrY1VHcW54MDhTdHRXNXVjU1F6VzhUaTRH?=
 =?utf-8?B?TFpvNThaUXEzTnJUTGRKOUFkWUd0Y3hRK2Q0eG13N0IzQ2MrZjhYOEZlakto?=
 =?utf-8?B?Y1Bsa3hEYWpDRWgwdWtaMEJadC9NMWJHZ01PSHF2NnFJS3EyMnk4UjlRZVMx?=
 =?utf-8?B?Y1NlRE54OXBuSFk1ekdLcEw5Z3dwNFJhS2M4SDBTMnUwYkJqYzlzbUxlZGFG?=
 =?utf-8?B?RkhyVnJ5T0sxNzQxa3ExQ3NhK09lc2dITFJzOGNmRDBJa0FENENBS2xnTEwy?=
 =?utf-8?B?ZWVreU8zSWM1bkdvMTRtYmQ2TmgvdW9mZUNaUjdsQjFaUFB1aGZRekJnQ1JM?=
 =?utf-8?Q?AJ6E6YoGEPgaweX2+o4P0qkBn?=
Content-ID: <F60AA5F3BB04184791B56DAABFBCEC3D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e374c2-3997-4997-7567-08dad2d0fb4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 12:47:03.7197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ui9wew1mrbOO0Uan5kIbCd+ZHv3f8XAAwhJ9dDKbOX0N4eDMawk7editRQwxfQlmM1InO+DghTkm1A7TZjP20HiDVqojEm8zTTPDSFUgbSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_044714_686931_4EB7112E 
X-CRM114-Status: GOOD (  24.86  )
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

On 30/11/2022 12:25, Andrew Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Nov 30, 2022 at 12:33:14PM +0100, Andrew Jones wrote:
>> On Wed, Nov 30, 2022 at 09:46:20AM +0000, Conor.Dooley@microchip.com wrote:
>>> On 29/11/2022 19:45, Conor Dooley wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Hey Drew,
>>>>
>>>> On Tue, Nov 29, 2022 at 03:34:47PM +0100, Andrew Jones wrote:
>>>>> When a DT puts zicbom in the isa string, but does not provide a block
>>>>> size, ALT_CMO_OP() will attempt to do cache operations on address
>>>>> zero since the start address will be ANDed with zero. We can't simply
>>>>> BUG() in riscv_init_cbom_blocksize() when we fail to find a block
>>>>> size because the failure will happen before logging works, leaving
>>>>> users to scratch their heads as to why the boot hung. Instead, ensure
>>>>> Zicbom is disabled and output an error which will hopefully alert
>>>>> people that the DT needs to be fixed. While at it, add a check that
>>>>> the block size is a power-of-2 too.
>>>>>
>>>>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>>>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> This seems to be failing on nommu :/ I've got host machines issues so I
>>>> could not reproduce it for you lcoally and paste an actual log, but if
>>>> you build rv64_nommu_virt_defconfig I think you should be able to
> 
> You mean a 64-bit build with 'nommu_virt_defconfig', right? There isn't a
> 'rv64_nommu_virt_defconfig' that I know of.
> 
>>>> reproduce.
>>>
>>> The actual error is:
>>> riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/cpufeature.o: in function `.L0 ':
>>> cpufeature.c:(.text.unlikely+0x8): undefined reference to `riscv_cbom_block_size'
>>
> 
> I can't reproduce this. The following commands work fine for me
> 
>   $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build nommu_virt_defconfig
>   $ make ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- O=build -j$(nproc)
> 
> And llvm also works
> 
>   $ make ARCH=riscv LLVM=1 O=build-llvm nommu_virt_defconfig
>   $ make ARCH=riscv LLVM=1 O=build-llvm -j$(nproc)
> 
> Additionally, I can't see how riscv_cbom_block_size wouldn't be defined.
> It's exported from arch/riscv/mm/cacheflush.c, which is always built,
> and no ifdefery wraps it.

The base commit matters here, it picked riscv/for-next as the base for
this series. I guess this depends on some stuff that's in fixes only?

>>>>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>>>> ---
>>>>>    arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
>>>>>    1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>>>>> index 220be7222129..93e45560af30 100644
>>>>> --- a/arch/riscv/kernel/cpufeature.c
>>>>> +++ b/arch/riscv/kernel/cpufeature.c
>>>>> @@ -9,6 +9,7 @@
>>>>>    #include <linux/bitmap.h>
>>>>>    #include <linux/ctype.h>
>>>>>    #include <linux/libfdt.h>
>>>>> +#include <linux/log2.h>
>>>>>    #include <linux/module.h>
>>>>>    #include <linux/of.h>
>>>>>    #include <asm/alternative.h>
>>>>> @@ -70,6 +71,18 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>>>>>
>>>>>    static bool riscv_isa_extension_check(int id)
>>>>>    {
>>>>> +     switch (id) {
>>>>> +     case RISCV_ISA_EXT_ZICBOM:
>>>>> +             if (!riscv_cbom_block_size) {
>>>>> +                     pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
>>>>> +                     return false;
>>>>> +             } else if (!is_power_of_2(riscv_cbom_block_size)) {
>>>>> +                     pr_err("cbom-block-size present, but is not a power-of-2\n");
>>>>> +                     return false;
>>>>> +             }
>>>>> +             return true;
>>>>> +     }
>>>>> +
>>>>>         return true;
>>>>>    }
>>>>>
>>>>> --
>>>>> 2.38.1
>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> linux-riscv mailing list
>>>>> linux-riscv@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>>
>>>> _______________________________________________
>>>> linux-riscv mailing list
>>>> linux-riscv@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
