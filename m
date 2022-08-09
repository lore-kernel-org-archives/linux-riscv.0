Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859D1C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 18:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqsUe2iz6oHqYBEmdi+a5ZZ0YWjwrxkPVtT7dlOEgQQ=; b=32d/k+E6GC3guh
	jmoAgPUKbRcPCgvInsKMT3qpEt0dqFIxHatnV2c5a5jDFkG+ELIBMdNZ8dp2A8UJLwetb92CRbv51
	PBP41CEa4YRm5GH1Bkn6QVw7TuGCeTsfBd54qZTECajvD1vV3Qq5DDn6YVSTpljXU6QIIMzPZPJ0E
	rWabpPlIujIj5GzJ6hTq/4/dkBELT5rkVZhdNP6g5CS75tdLNIYzv1wodnk6c2OBtAMb0ivRa5tN4
	iunzDa7Jin/CV/UELL5ed8sVSiD+cKX+Cvp4IrKizuXrMZ4h9b73eEooxIcijQ2N2WXkcf4+Qmo5W
	hfeEBs2LhfmPsMfRzyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLU6I-005ZZR-8M; Tue, 09 Aug 2022 18:37:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLU6D-005ZWI-RG
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 18:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660070225; x=1691606225;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oa+JS2vzNWPUbk22H8ZYSLpSJlnr+TTLiOt0aBSL1/0=;
  b=O8eMUtysUTbEcGup6JcyXT3uotvAkGL/LTOxuqPeZncIldCOYMNTdGhq
   IGO1M3IjtzuIeuVXDg3i7mF+KGKywN7u0k6M2eufRrl1EwrONecFvluE9
   SgiHPeQ4Io49OtsjdaBoz6YOf5BOZLGN1XQ68GUgID/J1upJP9hVtpPxg
   vdMJn64Umv616dcTwOtQOqldKVMPCBVup2vXBZE36RmZ9Z06qlZBSoiO/
   2BpARqaL8zPIvpSX0f3veD86KxwJiZP6B3KITnirzT3QARK5KApivwkMJ
   q5aejbIBg3BJA7VFErQbdYlMPwx02jt/Zrz2wnHUKzOuGI1Lvhv8eanI7
   w==;
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="175725462"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2022 11:36:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 11:36:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 11:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEFB1nSVcXrSVV1MxHeCmBYqA49fD3ga8kJz2KIkRH86KF6nwcovPBEnObEXGhnsowbvMDnpTINX7IhN5zxCPHnDruuBicp0h0GA/VgHuoaNFna4fXSEOs/gS9afDDqsKPDQ91RyY70pwsTOaIWLmYNXgKSzoko6KV+4034+Ik3gGKrtlDh9C3FLayiQQfsMfJRdOP49gXIexGrTGfLQES2FUy4/qJMpebUwccStT/DqaUSJSxRBsxaCndaXGd6L34GjLPY1CmKtYNopAKRGZQvMq2l+cUlvzuDBEm2oFL3oBMfgtMRYj6Cyuq2BBwj5yxF2tywOQtiQIcoRzs02oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oa+JS2vzNWPUbk22H8ZYSLpSJlnr+TTLiOt0aBSL1/0=;
 b=b3aaHkJSazeW4Q3KE1ZcpXj3BmaiffZOpqVDt+5Dvikj1CJS8/63/3+baMOEc4JQ9w3Rg2gcAkwQCGz6X2REgOtkUfR6iCFKjaNqF6L/DejncWPpMk85zmUbylsH8skPwxWOYyBMsvACqzpjGJ3WvDjrKy/kf0xkRwsMF9SqG8e64xrKQEOISZKkMLMZB2hyRPUKmQUkC6Cb+R7hpGQBvx1RVLZqqeAGGRbupVrmIKNALjpzaJnQwJdHkjVKNmr3H1aIzUV4NNSgunYcvSWsuS1/6HJAL7Qka57rek7BBw8PzU6U6HErvM9ijPs6BwKE+wIed1sHU0tb/JahazD6DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oa+JS2vzNWPUbk22H8ZYSLpSJlnr+TTLiOt0aBSL1/0=;
 b=B0UBv3JwM4X608akkyEY61SupfbIm0rz0ldtxdOppwlv+nqrZLIq+hl70k6hXxxFN2acwGQZW7qNMOVa0kHmP8fowEQo6CF4OhngYtI3laCd15esRkXjsHV7gE60N3PybybSG8qwuQEShKYEtNER+F3uUVqsxZHAnvdvQ6My5P4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB0069.namprd11.prod.outlook.com (2603:10b6:910:79::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 18:36:46 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 18:36:46 +0000
From: <Conor.Dooley@microchip.com>
To: <jrtc27@jrtc27.com>, <robh@kernel.org>, <palmer@dabbelt.com>
CC: <tglx@linutronix.de>, <maz@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <daniel.lezcano@linaro.org>, <anup@brainfault.org>,
	<guoren@kernel.org>, <sagar.kadam@sifive.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Topic: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Thread-Index: AQHYqOiQvE59vmIAhkiZ1sZQKraNy62li3AAgAAHfICAAQ/4AIAAST8A
Date: Tue, 9 Aug 2022 18:36:46 +0000
Message-ID: <61829ccd-20d7-e2f0-0a6b-bcd0e076b9ea@microchip.com>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
 <94fe7e46-6156-1cc5-a4dc-1eee78e99bc4@microchip.com>
 <20220809141436.GA1706120-robh@kernel.org>
In-Reply-To: <20220809141436.GA1706120-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5200e0fc-52cc-4f1e-1f81-08da7a361d4b
x-ms-traffictypediagnostic: CY4PR11MB0069:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pPmyie5jB4KKXBNHfTJyUcDjmhHFWiGYr1+YPEVmh3dP+Wiabu7vVDFzlRYRdVsDkBY+e2CQEuna8P/OXgW2J2LjACF79fVYQIn8WAZyF880HudEBVdJ46cUV977G9pYZm53rcZhAp7vvQJMyygHpGBWBkN2oNMYaBliB+Vt/5ggEadOoGsz/KLn8X8G9la27TxV+hOhdGO+PWkpelHON9gWDJP7aU0JZWXQ1G6S6Q2UH8CagMwd054aveEc/uLfh1C+EHN5zbwzYclovxxVxVQvF37oXzkzSU8IRvnRVEXwzVJ/7QlJKwsdC7JLszgMBYRqiC/yRbrF221XFpnZPu4zqCd+hhayTOj3jnbsqnkf/DCge5pVuc4UNapiYe4ImYAsLdtu4KPPRRKXgO6ddwWQxorFi/HZmP9MHuDi3KW2u9qRbtS5/lzPZtmS/ctFTbM6kby7I9GJCKugxarPz0PVElMwyqKjmpp9xYn1YVEK6bfuotHz721Wj4znPxAA0BzHkEUVSD9Nsw9mfrt0uLUwrseftY72WmcaR5oiF3pzfCu13Eqo080O5MiDyktK6fYnn2d/DsmCHzuDDL2Dn5vc8Kp5AlfK+spfPpp8KjJBpfzGa8m/F4ZtvClf4qW4retIDPBLnKNIh/ibSGsBc6I4hhbtcNdQOUS4kOB/iurQUveZn4ZHAx3f90srocSK+Q7lzoSV+XU6Ag3aLUb1nryol1GlG9x3jWS25aS5O+IwJVDRMRUcy0J0hzeFPBcW+A+CduF+5yLIVlbFp+wnaZm0KddwVTMquQ1rf6atKAn5/yHB+PLA6cEje6o6a8Tch3lfDLd7d7g7cj1ETyUcv45vSJb/ZdCcIwa5ZapIMaHcfcTN4zUOiAOVotanL8w7SAsKyB4UUHlhFXxeudTqng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(366004)(396003)(136003)(66946007)(38070700005)(83380400001)(186003)(2616005)(71200400001)(76116006)(31686004)(316002)(91956017)(36756003)(110136005)(54906003)(6506007)(4326008)(6486002)(53546011)(6512007)(2906002)(31696002)(86362001)(26005)(8676002)(478600001)(64756008)(66446008)(66476007)(66556008)(8936002)(5660300002)(38100700002)(122000001)(15650500001)(7416002)(41300700001)(45980500001)(43740500002)(569394003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGFSWTlWNGM4eHJXTFRYZ2JBQmtkWGcxQlBMZjJxb29SeEhMc0JQa05qczcx?=
 =?utf-8?B?czkzalNzNU5wb1lSYXllell3TGgwanp1YWhsMzRJZTVjb1VGSldMV1FUTzV2?=
 =?utf-8?B?RTU3aWhXbzBJS2JnZE1rYU1IaHNxeVh6dDZVSS9JRnFHS211M3RkRzEwbUk2?=
 =?utf-8?B?a2RXb2gxNzJvTjdFb2ZIdjFDajE2Z2VuTHRuc3d2c3pWT0YwLy82alR3SVZJ?=
 =?utf-8?B?ZlJhNWZ0TDJkOCtCMkdzNzNIZVRjRWxtZVNnRVlyOEY2cUh3TGZYZGpkclRF?=
 =?utf-8?B?RW1xWEZWQkhTT1Z0UjVhMUlaNlNQdjRoYldZSmtqakNuN0JmcDFCNHBoR1Yw?=
 =?utf-8?B?MmxWblUrRFA5Q1VQRW8rZVdSY0hnbTRrbUN5aGpOQjhqakpyWCtIeVBCL3d2?=
 =?utf-8?B?Mkl5SUQ5SHBaN0Q5dGoxbmZKYmNpWm1qT1NGSis5ZGF2UFE3OFp5azJtOVZy?=
 =?utf-8?B?OHlZeHl4enZjanYrdDluWlp4WVhHcUtoR3VKeUlRMmRiaU0vZ1Q5UFZQM2Ji?=
 =?utf-8?B?UkZWMXdhNXVqbVoyaHZxQXkwdXY2MVhmUStCYWN5RS8zNTFpcTVPSm1GQ0xC?=
 =?utf-8?B?NVZjQTZwYk1Ca3A2OGdoQmkrdllqVG56N3RMZlhsWGpwcFMrN01KTEczQ0o1?=
 =?utf-8?B?QkkzU0hRWGc0Vjd2MzZVUEs5NzRhR1doazhGRFZvNjEzeExzczZjNFUwenRI?=
 =?utf-8?B?Nis3T1A1dGhZanhEZ1ZOZXFkRjB4L0ZsYWd3ZEhIQ01QcjFrV3lzdGRhdlhv?=
 =?utf-8?B?NCsxL3lvdkJMVm9uN0FQY3NzSFo1Rk9JUE9PRkgrWllNV1hUTWxvVW94VTNu?=
 =?utf-8?B?bVZjc2ZWNkM1ODhwNXZZUkQ1eWFxdm1FMk1Qcm5QcjJJbm1KK2lqOFpjMys1?=
 =?utf-8?B?ZVNlRUhnZHNQU0JVWUx4eDkrdjNFUG9YeFNZbWZBaHFqYXQwbTJaUFhUbzRV?=
 =?utf-8?B?dW1sa081ZUs1TzlPUWJ0RUF3elR2ei9SSnlkaDlFclhPeHc0SkNHdEtaN3k4?=
 =?utf-8?B?Y01YaGpwSkV1ZlpVUFRaNTVjc2YxeEZsc3pLN0dMQVYzY05SbElBZlo0MFhI?=
 =?utf-8?B?eUJJa0FMRXVpVy9uNzNXcDNnRC9wTEVabXM2VWF2emlXZFAwUkJLWFY2NWNp?=
 =?utf-8?B?RFdRV2JRRzFCTFptRHNHL09XdWJGcVN6U3RjQ2JGbkRIeGhHWmt5R3g1d1Jv?=
 =?utf-8?B?V25Ec3p4M2xQM01FY0VkT1hyRGV1MkY2akhFcENDYmVyZGYvUmpOdlFrQzhT?=
 =?utf-8?B?WEhSR3lCQ0tHQy95UEhqSEpwV3V1eVJGYkJlTmNQNzZHdnJxMks3NXRRVTlH?=
 =?utf-8?B?TlYvbjhwSUtZQmNBMy9TcXJGVnlIWVpqLytDVlozK3pBdXZuMVJqSW95MDMv?=
 =?utf-8?B?dG5rNVp3b3VSb0YzYUpseU1VTmlGeU0wU0lUUUM5MUliekxsMkZZbEpRdFdw?=
 =?utf-8?B?OWlBcDJKNGhDanYxeUVCcjFHRTVETVhPeWZIL3JGOVh2Wm1yN2U5dmRiSnhK?=
 =?utf-8?B?K2o1Y0hzZHh1S1VUeGhHd3E3R010aVRPZTMxUDg4OXVnUytaUkVTQXA2NjNz?=
 =?utf-8?B?QXlyMjg0QVVJZVoxM0g4YnBPbElzbldBd0VkaHYyRGdsQWQ2NmtFWm1BU2xL?=
 =?utf-8?B?OFFiNHZZcHdPT21Zc3MrNFdyVWgwR0NhSCtSWmV6QUFDcVJTZkoyTnpzQzQv?=
 =?utf-8?B?UWZtTXFTcjlqc0xOQ3VQeTlpbWR6a29WS21KS3FVelBIMWJDSUtCa3lLd0VX?=
 =?utf-8?B?d1dVOTk1Wjk3RGhkNm55NHpTUk5wdWZ1cmNlQlYrTFpDMDhYNUJYSXcrTWxK?=
 =?utf-8?B?YTdvUGc2ektDMzhqa25TVElZSE4zdlpkU1l6b3dlZSt3cDEvVkdWTEdLTTNK?=
 =?utf-8?B?bDlUZ2ZCS2h6SEFPZHA5U2c4aWJ2Y0pTVWh1UkdZSVZ3TEUxdk1vdnk0WHlS?=
 =?utf-8?B?U0lJNlkwaDlwY3U0UStJckNaQzJHb1ZER0dFendITG9jN1pGZ05tS0pHeFQ2?=
 =?utf-8?B?bm50bHZGNzJOYXBMTS96OXZYdjBDZWNZRHdPdDBzNnc4cExuMG9NcGEzV2tD?=
 =?utf-8?B?RzJZTFJOUkU5Nk8wNTVTT2NSS3FvSGw1UXRCRjF3K09UaGFna25LS05IZzNa?=
 =?utf-8?Q?Gxk8p4Uv+Rt5Kou6ZCpNqDK21?=
Content-ID: <C485E8E9E8BEF646B41C637E9D9476BF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5200e0fc-52cc-4f1e-1f81-08da7a361d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 18:36:46.4319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zveljDAZtBIuN9wNCCe3gTo/o6QEvwIT3RZ3F+eQQZYggK/YTnRVvTQs+RCUBhgbfEGg9mDka3cuHwSLr1abBbJi8gd7P+y+wpmbNb+bMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_113706_175415_6957D67A 
X-CRM114-Status: GOOD (  20.40  )
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

On 09/08/2022 15:14, Rob Herring wrote:
> On Mon, Aug 08, 2022 at 10:01:11PM +0000, Conor.Dooley@microchip.com wrote:
>> On 08/08/2022 22:34, Jessica Clarke wrote:
>>> On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>> The final patch adds some new ISA strings
>>>> which needs scruitiny from someone with more knowledge about what ISA
>>>> extension strings should be reported in a dt than I have.
>>>
>>> Listing every possible ISA string supported by the Linux kernel really
>>> is not going to scale...
> 
> How does the kernel scale? (No need to answer)
> 
>> Yeah, totally correct there. Case for adding a regex I suppose, but I
>> am not sure how to go about handling the multi-letter extensions or
>> if parsing them is required from a binding compliance point of view.
>> Hoping for some input from Palmer really.
> 
> Yeah, looks like a regex pattern is needed.

I started pottering away at this but I have arrived at:
rv64imaf?d?c?h?(_z[imafdqcbvkh]([a-z])*)*$

I suspect that before "h?" there should be more single letter
extensions added for completeness sake. So then it'd bloat out to:
rv64imaf?d?q?c?b?v?k?h?(_z[imafdqcbvkh]([a-z])*)*$

I checked a couple different "bad" isa strings against it and
nothing went up in flames but my regex skills are far from great
so I'm sure there's better ways to represent this.

Anyways, this pattern is based on my understanding that:
- the single letter order is fixed & we don't care about things that
  can't even do "ima"
- the multi letter extensions are all in a "_z<foo>" format where the
  first letter of <foo> is a valid single letter extension
- we don't care about the e extension from an OS PoV (this could be a
  very flawed take...)
- after the first two chars, the extension name could be an english
  word (ifencei anyone?) so it's not worth restricting the charset
- that attempting to validate the contents of the multiletter extensions
  with dt-validate beyond the formatting is a futile, massively verbose
  or unwieldy exercise at best

Some or all of those assumptions could be very very wrong so if {someone,
anyone} wants to correct me - feel ***more*** than free.. 

Thanks,
Conor.

patch would then look like:

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..1e54e7746190 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -74,9 +74,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    enum:
-      - rv64imac
-      - rv64imafdc
+    pattern: rv64imaf?d?q?c?b?v?k?h?(_z[imafdqcbvkh]([a-z])*)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
