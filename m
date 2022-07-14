Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D3CC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnHkk3BLg5gwPZ0BG8GOSfumpo2LVeEr+AxpW+aA7Ck=; b=Is2ZCczuBF8pwB
	9/+seCi2LMt9dEdLJEN+0yzmOIC1gdn2bn/8ROcyAhrLAygsuX9H8AQknHbKL5GHJhQum/AKIgRWQ
	DHefaRwpJjdF/79xDCD2axCgIGUYITv/Ubg23mVkUA2f0fkkBMhhHA8UzbJ5k/GoBeq83DMXCDsob
	pTROhWs+K1Ns96HaFSI46Ajg4yTpWn5m0jVq5rWTzgao9P9wVJP1WjerUm0rTnwJEH+7LZqReF+oN
	lDIR9pCTsxRZmHdb9/9HXRWZjoQyNxVwFr6Ls1XThrHQWkdNcO29nPcqnCQGbaROWcowZvdWllRHj
	2J72Flvfsp7PgMJKpiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBsPl-00BSfz-8Z; Thu, 14 Jul 2022 06:33:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBsPh-00BSce-RN
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 06:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657780409; x=1689316409;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Aq15QQ78OespS1xYK1MMcGM5VO3AYszRKxomlLvQwVc=;
  b=Pq0Hp4wZe/TZ4b8YE9n9+meLPGF1mFWOix2KIrFfyPhHkDBjjKWFzZGs
   iisGGfqwBu/0gLZGl9Ylcio2WSR13l8liItfzv05HWN+FqXK+IQkTAf0t
   lDzy3ZbsWssOVmb+uSMzCJuKoL+Yy1+LN4PQX/5ql39YhmQ9Sx1GJS0ma
   8SHA3xkCk5jie4czR1IBNWUOz2Z8KYHy/VP4XdmOkYCb2SGU6tqGNRRZF
   fwi//5Fd86M3DngIkqboKA51h1DDJWYD6rMUVu0721uezfpv4zHC2ELta
   49jjWSEItIXy1OEes5vxFqlIT9x/CVdNjVVm5bXnyEasM/4O55oxoLWmR
   w==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="167778585"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 23:33:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 23:33:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 23:33:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYGahwWYr7NybGhdvwniftej8JZ7MtL06FxSiKCM3WcVC3LasLiMwVr+aAEdzeY/CRa+QjD32a2Z04t+Xpt5UQXJVrFwiz0sSSBo+PbgXLqkbrvUmGc90YN6CTZlpkPeDcp3DLELTGoODTzZLmySNU6839pcSwRLmeFB/0USYd26ugV1ctpWb6CViEK4wgLEd8jVMcGBBokGg/3isligp1zUQ6J9OYkgiUB1lvVdzuxljkeuQ5XRZYfYMIlOkohNfF4ay7Zx4IB+t/azAglYyondoJDm6NtefkXKkc/K7bPgMUK5MbNMSTx2uaoCr3Fo5bPdWrSFdtuPMK/l/tlySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq15QQ78OespS1xYK1MMcGM5VO3AYszRKxomlLvQwVc=;
 b=nhjCmNvMyPENFaqqWNGItwFTecqR4HloAizxOzb7n64Zqy/4mOhsQWGjo+pFsuDWlEEzWZtelRwkzeK18Ts/BFPU+5HP+zBls3i0rOmzoFZ0VBu6kJkKaxYgrw0zfIIVDbs5dWdTXoZSllURg5M/povB2GTKhxvlwP/KNKw8RFU6iqGsAyaKh6Lb05Gct1J3tY9tFFQ3SwE/UHJrpaTEq6HFFjcDfsfg5WJ1Vjv6ULxzn8bSUfZvFRE1sqRgOVwt7mmueT5dhbASbsky4N+W2NU6dFvG38+Tx6cILrepxuxd+guZNCiRI3MwaIFxvJV25jPUknMAwjyJIfbCZTM+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq15QQ78OespS1xYK1MMcGM5VO3AYszRKxomlLvQwVc=;
 b=EMRBPHwC6EaGat9SPVo7kjC/dNuxWQb1Ssi5bebJ54dX1gS1IGSFZtOLqkKIkm/3zV8kvFdwTYvbwDYO8RQ5IteQXEje4CgeO5YrNlQKU9GHKwao9jgxqyiIbiOLL6f9D9IXaw/N65myLLU34zp2W+SBQvyl4HS2zmWrqNAm+tM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1765.namprd11.prod.outlook.com (2603:10b6:903:126::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Thu, 14 Jul
 2022 06:33:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 06:33:20 +0000
From: <Conor.Dooley@microchip.com>
To: <ben.dooks@sifive.com>, <linux-riscv@lists.infradead.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<sudip.mukherjee@sifive.com>, <jude.onyenegecha@sifive.com>
Subject: Re: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
Thread-Topic: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
Thread-Index: AQHYlwMbqI2/CI3nV0qrsFkrBd2gW619aUCA
Date: Thu, 14 Jul 2022 06:33:20 +0000
Message-ID: <97c2c085-a869-74d1-4acb-ceb1cc3b09b4@microchip.com>
References: <20220713215306.94675-1-ben.dooks@sifive.com>
In-Reply-To: <20220713215306.94675-1-ben.dooks@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ad46364-6d22-43e5-276e-08da6562becb
x-ms-traffictypediagnostic: CY4PR11MB1765:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pAmJ/4brLyl+lPzFMc8LDsZHZZmJMVbBUjRnJdZ7fLZquhNd0Pma9mv84XfNNN3FqNfEGUTXM3S006eQBzzmzUGpIBlRo8XNh9kbMk7X0Btnd5g/8ddLoi5XvDJDCNemHyRqxasMJlruBrysm9w5kGTN6eEQuRXAm00ppFQCfp1ZPZZug4LdNsBvbHipX+9vr4lD727HsF4AbTGJ6fGpx04DYPX4SgEb6hivTb0nNC5i0OmSPfm+uDk3NOnDT07jy9B32AajZfXMJJLQSygRaYKdOKm1Emw+5OxMkXqJH6HnVc939zKNO55IG9A6+R7KxGL7SFxnmhmi7cBlbIQrM7temAMbqV6Q5rZMVuGyilWxxCyqonOM9DH5BM1jyVx29PUG1RHAA6NIDXCZbkWibhOm4eqZJt8ZIqrRYAbuuX8TG3gfH9DRQNLTyECeS2aBC5q4TDCUzb8NpKEVoerNBDTysKN28snA/3ubknRdAoXBDifeSKpcO2XF4JhTi/mmLirAGn1QVkAnLdI04Y4wvSD6kpnzmIlhaRW660cvvG/zKmPkQ5UDiT2xbzoLzNtI1/yFk9RF5hWxlIERl1jbBs9XCFAzcwhmf4/MR0jcNBFm7d19hTiH8RGtPonX9LH7y++hTB1Tm1xHE3xA0Ti41qGKD3R9KKTxqXas9xE6FRDlaTpGdKIRp/O9jr38rsCMOmgumWpWgLRzsdcybTj7QCBp4TJjbarKrPr6mgqpeXeGkimR5xbn+GIkzCXuzuTDAXFkfBUijGaLxc5vsgchJYkvbBzC7Znk9Hkqsgr3tY0joBnZCok5Cu79AeSZTSzbMSAG2kLBJZqzlZf2i2DbqSY5zD2uXzYjWT9ASaF0ZfAHFy2DR8fTQQ6IqEefH3enoM/tFh2fVpfXSN3WOskkCo4Qj5p+cGEGpFo3TlwzkN8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(376002)(136003)(366004)(966005)(41300700001)(38070700005)(83380400001)(36756003)(2906002)(6486002)(478600001)(31686004)(186003)(122000001)(76116006)(31696002)(91956017)(38100700002)(316002)(66556008)(8936002)(64756008)(66476007)(8676002)(2616005)(66446008)(5660300002)(86362001)(110136005)(26005)(71200400001)(66946007)(53546011)(54906003)(4326008)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1Q4VWFsNjBvcmpoLzFZUERpTmVtY2UxYUt1QzZYa2ZFNnl1L3Z5ZDVWOUVH?=
 =?utf-8?B?ZEpKSGNJL1J1aXlaRUc5RU5SWEQ4Um5rMUxQS2Jkc1AwczVFdDlOeXNINGhR?=
 =?utf-8?B?MDdtL0d5eHQyV1lhOEU4S3lNT0orNEF4VlhaMkRzS1d1YUpUaEtIWXNsWlJy?=
 =?utf-8?B?d0VRSjdvdGRMdzgvSmJ3YUphYW9HV2tDdm05TUJMK09EN1FGay82MTJWeUtW?=
 =?utf-8?B?aVRacmJKSU1TdmtrRmxKOXFuQlpCUVd4U1NMcFRtRTBqZkFaajNWVDlrM0lF?=
 =?utf-8?B?YnBCN1Jwdzgyd25oRzZ1eG1lYmJMWGJ0aWJIdzNZM3pwU0lGRzJkQzJqbjdX?=
 =?utf-8?B?QjhDUjZZRHVGRmVCajhralBUL21BN0l5UjVNL205THBqWmwxcjFsS28rd0ts?=
 =?utf-8?B?NWhVVXp6bjB5dHFlN2hlQnIvZHdmTVZJdGd0dWY2OXJCUW9hSUFwZFVPcjhX?=
 =?utf-8?B?dDNhUmJEOVNBMTF5STZTUGVrNDBoSTlqb1ZkYkFoaFh5V0RDeG9ySWVUVVUv?=
 =?utf-8?B?b2VtVGNUeFNGYllDS3FOVG9RczF3THo3dzQ2aFFwZWtBS084Q1g4eFlEL3Ry?=
 =?utf-8?B?SjVtb3dKUloyT01SWldGS01IQWJiTnVycFVXU1RycEV0WnArOFcrR2NxbjBp?=
 =?utf-8?B?Yy9LZURUM0dBTVZPM2JQczV0bGMweWZBd0FFMjArNXFzTVZsZmRPeDFOeDZs?=
 =?utf-8?B?TmZUc0IxMEZLenNIR1haMmJOazJmNEtNYnRFSWhwVE84N0VZSm5GbTZvbk95?=
 =?utf-8?B?UFFiR1JMYkQ4ZEx5TGtIU0dyVnZERUoyYzhySFJtbmNrNHVJczk0VHdYZFl0?=
 =?utf-8?B?OXBva1dKRXl4Qll6cS92dzdsZnU1TU03WTB5YUcyQTZTOXliSmRGVi9RZ3Ey?=
 =?utf-8?B?ZFNLd0xpbVNpQkhZWGNmTGJoMlhpUUFYVjVMakE1R1hYbmNVVFJFZFJZbGtL?=
 =?utf-8?B?bXhKcXpOZ3d5UlVhdDdDaWw3ZzJZdmx4dzJZQWl2R29SMG1VUEhTOFRQZHdJ?=
 =?utf-8?B?aSs3dEF3bjJnSXV3bkpxVGRkZlZwYzg5VGc1WXJsK2FTZmF4UzlpWlFWenlW?=
 =?utf-8?B?eWs5S0E0STFNSXJPc2lmbUhZeXRmM0NraFo3Q1FzZmlxWkNmbGdaTmpIdG5v?=
 =?utf-8?B?UEFjVnBmbnd2RE5raUg4d1hlOVZpT3ltTjFTbHRRV3lZTktCSWhQekZOWVN2?=
 =?utf-8?B?L0VkUVU4bm0wakh1K2tzWk5KSWZFbk81cTdQc1p1QXM3bnp6Zm9NMEdONEVV?=
 =?utf-8?B?RlljNEdMMjQ0OTNrZk4xN3hYZUpJaWh2RnFqRTgxSXBhekJ0YUhOTVB1bXF2?=
 =?utf-8?B?bjA3NTVxZklQcHg2czNwa0N5dzJjeGdLeXcrU3A0cGs2R0JmYWZSREMxdUVV?=
 =?utf-8?B?dWE4eVNQZ3JKOW1iRytYY25FbWlXZzVNMldoVmNuYW9WcnAwajAvRzFRb2oy?=
 =?utf-8?B?OW5WTGxzb1NvL0Uvak10a2d5VlFYcjhPNy9aUFhXYW1uSnpjTm93R3FIem8w?=
 =?utf-8?B?VkVkTEozYnRJaEwxd08zNlJEZzNhbHdaMURWSkJlU3FtdStLVFF2YWtWR2xT?=
 =?utf-8?B?S1RtYWNteHgvRHpEcmN4bjFSSjI3cDNiTEE3ODNPaEcySWdiaytiK0x6Zitr?=
 =?utf-8?B?bmlaVGozSXpYem5VWS9WSXFsZWVjMGhjWkpUR3QxS0FJdzBaY1Y0S1o2dFBj?=
 =?utf-8?B?aHpIS3h2N0htMjRULzg3TlRKaDRGNWZiZ3hkU3JWMEFKYmZCNnRINmJhRlRP?=
 =?utf-8?B?cS9DNTgzOEtIWnREVUJ2anUrTElXbFBXaFBGRTJsRm1ldVhmTFVpV0FzZVJn?=
 =?utf-8?B?RlFNRG0zV1FIVGhhN1VzUHFISEVPaGFhVXBRS0JWUmRROU00VXNlM2NzOXQ1?=
 =?utf-8?B?cFJ2NStUSTN2NEJJdXE3Tk5qd3d4UURiSnJ3eGFuMEhjUERrTCtTN2tqTHh2?=
 =?utf-8?B?ZlRFdWJNQ2FMOVhTeTlHMm8ydUxKdkFOWnlBNXhvYkthOEhGUU1ySWxhV2Z2?=
 =?utf-8?B?VjRtQzN1VysySm9ETVpjbG5yNTVNaldyTGhMZVAzUzVTS0I2U2RBaEVXMWZy?=
 =?utf-8?B?d25ydTNBNlJBTkZiNXlRYzN4YTRYUFVxYmozOU5vU3VFN3hoWll4cWxmdktJ?=
 =?utf-8?Q?ANxwyt3c8qRUH+cPlGLUPT/Gw?=
Content-ID: <B59182CD02ED7045A7D3F0FFA3E2DAEF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad46364-6d22-43e5-276e-08da6562becb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 06:33:20.8375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kfnZXWhyq1FNdSBS9DoDD4nbnQjS9h/tYCZBzQFUw+IV86f7vnmf4/Kd6ZoCNc9YfZw0QNPRrAsKsob+vHFymFD1oRyBLcAbBgBTeqWRB4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_233329_977148_5E0A14AC 
X-CRM114-Status: GOOD (  17.21  )
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

On 13/07/2022 22:53, Ben Dooks wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Running sparse shows cpu_ops_spinwait.c is missing two definitions
> found in head.h, so include it to stop the following warnings:
> 
> arch/riscv/kernel/cpu_ops_spinwait.c:15:6: warning: symbol '__cpu_spinwait_stack_pointer' was not declared. Should it be static?
> arch/riscv/kernel/cpu_ops_spinwait.c:16:6: warning: symbol '__cpu_spinwait_task_pointer' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>

Hey Ben,
With this applied I still see a:
arch/riscv/kernel/cpu_ops.c:21:29: warning: symbol 'cpu_ops_spinwait' was not declared. Should it be static?

Seems to be in the same ballpack, so maybe you could fix that one too?

FWIW:
# CONFIG_RISCV_BOOT_SPINWAIT is not set
Thanks,
Conor.

> ---
>   arch/riscv/kernel/cpu_ops_spinwait.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
> index 346847f6c41c..c662a7cf10a4 100644
> --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> @@ -11,6 +11,8 @@
>   #include <asm/sbi.h>
>   #include <asm/smp.h>
> 
> +#include "head.h"
> +
>   const struct cpu_operations cpu_ops_spinwait;
>   void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
>   void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
> --
> 2.35.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
