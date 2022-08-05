Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B8C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 17:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ut1gKylpjREeHJnQ/Hy4lDDSnYxL80l6VxVpOcj13c=; b=PVJuKDTpaN7QF/
	uSbneWstmvfMI+5zoGBH7ATg+HYRHHVBJmjy7Qe/NCvE+zUp4p62nDDtXTgDvbRilzR/2uw8BNJau
	lFj1CGVv8+PWtGxXkEbWjKsiVQtI2GGOfMD7Fda/3QXCvwfSM5E/IALWu63jg6Txdi4SHwnyeVmcY
	LZKLjub4SF9EYenA6yB8XvJgjtB38t1f8858Uh1BNOFbSdnqTaX9du42hFJycAMaUGzE0SBe2Y0KT
	jwDdtt9fa8IcoZ9PRR8I1Ao9Mj1ZXZ41foTBOp4gx0VSHCzY2Ud0Sm1tQwH16hGUi820fByWo6xv7
	+gZ9gBwoMqWJipbAsuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1Oj-00HB6V-4B; Fri, 05 Aug 2022 17:46:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK1Of-00HAzY-M0
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 17:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659721565; x=1691257565;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Um6Des3su0bXy6hJFIaj03JZwSzy58PnUrA5NQ5k6V0=;
  b=g2cpOz8YNbzcZzOlKy5FzBvGz71mipy0np9PpsSO6fOAyNLwdGCRmkd4
   eJtiEXqZB8lXAzKdv9SRurhJ0KpyGf/WnoLflbQzzo3jziSESv7VTID+m
   /Zmr91j15LKriEzLlJsRy+TewtR/aacg3yGJtyqvBvfR+agNeyzoqc2Ht
   NKb+Euc2pDHWNv3olpGi8JFzcdTjE2fKubEql5sYWTEAjDA81BaTjoMhW
   vgW5jmyn3bPySnL1Tm1YdwxTJ0ul8Y7XzFGzxdAMqm+JbgFWrl9bWgiKy
   dYXBDuz+r8Z14IYveAIVpfTCbFZCVZIQSDa+faJ253r8UmmWdktVXhaQM
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="107787580"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 10:45:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 10:45:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 10:45:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJ5gjiS2SEr7Lqb+psEs3TRtMjtjhPEP7SgbJvCcqVqqYjgRPUh10bJcdZORdYvxL7BB7hlrCy4NafzEhCU+dvCqKXxLdCFKxqEpIkkXfZQYiCwmpCzEG8poYHh0BcOk688BkmwjRo3wxSF1VRGNl947RH9Gdwkf0JIedlFtWmvBtwDEdSmKdQKDbX4pFuEHJQUmGEYNs1QejW1aO4XUbqEQQPoMox5Zrl9tt4PChNzzrxh3vfyPbEI2O+Q791hM3MQy74ihp1TS8aHo48XB7uyXyFFfnpEOCxyWQM+hJGotV317r+oBVg+gGGq3SW5TH3HYp4HV6OVBJgwyeboUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Um6Des3su0bXy6hJFIaj03JZwSzy58PnUrA5NQ5k6V0=;
 b=YBC0wpG0cIJW+JnaTtmjomqD40BuJI+KOahaqmFatqkw7AuHwjCzlY/+l/nAVm0s+Jw29RB3XjfdQSKxWRB/fxXBxwbeE35++JR9A03wAe4N1GoPK9OVauVIcnMJrJtS+rHt31VRc4iFVwpmrMRnAYUUNoyx2q1eNRb8TqafMqfU3NQS00aaSmSsnWk1KugSYRtqdhnqDvC6oudk+1WXWUbDEaAmJ6f8WM39x4VTjJRI7vbyvUK4H/XyGxJihxy2vzxWHGcDFhV7pEKHtZgugkUEV+xX5yBeoK2PD9ZFzOn/4I5Lp4WuZV56qliF2qPgVyFV1RYtpwxfi3GuW9M6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um6Des3su0bXy6hJFIaj03JZwSzy58PnUrA5NQ5k6V0=;
 b=Gyokpcv0g4vLH7sDklARjUgUZ0dOCLWTG8xkpCg+/f4Cv4ncMkH+hsad8Otdu56DgT6FaO6uvYeQNk+QBF4vfbzytvPhu+4ge2aIb63JCeCJN/CeSGn4wEcJcZIAyCdXL6UgEE+uUwY6cUo67SxGzTLYsPMBxKE2sXRhf/TMtQQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB2925.namprd11.prod.outlook.com (2603:10b6:805:cf::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 17:45:51 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 17:45:50 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <aou@eecs.berkeley.edu>, <ben.dooks@sifive.com>,
	<jude.onyenegecha@sifive.com>, <atishp@rivosinc.com>, <anup@brainfault.org>,
	<sudip.mukherjee@sifive.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] riscv: ensure cpu_ops_sbi is declared
Thread-Topic: [PATCH v2] riscv: ensure cpu_ops_sbi is declared
Thread-Index: AQHYl1gqxhtoFcj1MEKKrzfweySof62gt7YA
Date: Fri, 5 Aug 2022 17:45:50 +0000
Message-ID: <0a5a15cf-92f4-3453-00c4-cfaf017ceb72@microchip.com>
References: <20220714080235.3853374-1-conor.dooley@microchip.com>
In-Reply-To: <20220714080235.3853374-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f1cd646-e2f1-48ce-46d1-08da770a562b
x-ms-traffictypediagnostic: SN6PR11MB2925:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ThOw59K0HdC3aahhQzvkvn703U6shFtMusLd/jc7YbTlVxpniQdRHjLKixqGxX4HTD/va/beQzAkk7CseNOZsXmUmlK354aKXMPSEZeRwEvLKhEs0qK+qkh7gSvyV+zWwKNiKh2A9Y90a3c9zpYApRMHhs27JMEPaLfkrUzp5TvoG92G0irKd+WeJoCGWXkegTa4OM3HoaAlDGSNGhF/y2HqiTwzl70Q/UqPFjMRNnP4TKT9b3s7TaYewRUA/SwHVNU9CoUUZ2cMIAfttBwXQaUsupuqqdvXRZ+xlwvePqqbyo5meZFaczlUAmdcLBaqYUX94HukvuwYkcYOScDjgZ7qvDAVsHtzU08wopaieZ2DkZfF/20OK20KJA80NdzCrxN2ujgleZLa+ZR2BGo6prhQU9UWlw9QXsqzaC6z7/iteKvpyxW5DqbBLmgj08Fs6Q4MZtWQz99V6Zh83B6j1Jtu7hJDilKNEkpKECOSc7pl9apAYCb/j/hthATYkax0K6z40O6fvLNnyAOUEzmli53K0R0qTgtfHbCxA14r9gNknolNUOOMyiH00SxiVwBPJ4Yg2aHx2OBNbTCQ7KJBYS7c6VY+6M2uV7q0Pa/o7XmcdSYiBx5pGBbn8ChhFkxL11S9bhW5L8b7AomxczIEhmKZodGDvjYA1WYkzglRW+rAovr/HB9DaZSDBNDFjSQEExq3Hi3BEnTdukxB4CUnpLHBQA5x+xbWwyZs//1MSztXDnLjl0x/hZJwaL9V7t1m0BoRgG8InOWZJ/oH9+enUkXbqNSYiR7hPN5brK3tmcou+m5QzsCL5xAS82TXgQc3JB1U2OOjzXw+fXceuwYjaJPlShQpdGquViFqkUcIVEsU/RiRRiKldm1v2AaFeedmM52T3mIOofQ2qPrMSO5ywpST84Wz4k3n4t8WaogivKflk36ZYeSJo2F/nJY02COx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(366004)(376002)(39860400002)(36756003)(66556008)(38070700005)(6916009)(5660300002)(8936002)(64756008)(6486002)(66476007)(31686004)(4326008)(76116006)(71200400001)(966005)(54906003)(478600001)(86362001)(91956017)(316002)(66446008)(2906002)(66946007)(38100700002)(53546011)(122000001)(8676002)(2616005)(186003)(41300700001)(6506007)(31696002)(26005)(6512007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEtYZnFESHh6YWxVbXg1Mlg3KzljSEVqTXhoU29saFoyYkQ1WTUwU1lUdnpP?=
 =?utf-8?B?Z3Rpc2FoaWRXYWo2ZmsyNDc4VGl5YlRXRWRLRHBXNGRoVDlna3VScjhaUlAx?=
 =?utf-8?B?LzZIL3NIWER4U2pyenJJZTMvRnhBbWkxRFI3ZWF0bEJpRmhiSlUxYlk5eUR2?=
 =?utf-8?B?dmhqWUg3Y1piUXRyU2FLNTVIcHlQT1JxelZQZnRITmg3ZGNDOFJ5R2xwN3h6?=
 =?utf-8?B?bDZLN1JMSGhuQWZTeHRMSmtCOFVhRXhxbGUzOE1pejU5TnFsakRRemVSeHhB?=
 =?utf-8?B?V3RzVUdhWmZtcDJMM3Vjc3JzYTltc1c4OXdZSVFLdmJENjVMMUtlUWY3YTNH?=
 =?utf-8?B?UVpvOFJ5VWdKZEd2VkVKUktxektMenQ0dVZoRUxHOW9YN295WCtqZE5QODNL?=
 =?utf-8?B?R0lvRVlBaVJpb29lRDZ5RG1wQ0JlVGdyMHpqL2FId3ZzNmFLUXlYR3Z0Yi85?=
 =?utf-8?B?Z1J6QkNaQU0yZGt1MTFtaCtvVDdWYkwxT3dwd0dYaTZsN2ZQNFh0SGRDVEJP?=
 =?utf-8?B?aWQ4cFFXRTI0MTVnbklnKzlzRDdGUG0wd2E2Q2YvNGlWSkNGMkdwZk1BWStu?=
 =?utf-8?B?T2NCcFh2ZDE0MGpqTVN5WE1DajZHd1h5UWlZTG4rQm5NeXp0Z09TN3U4UFBI?=
 =?utf-8?B?WXNUUnBzOVNUTDlmS2htckg2bUgvNFNId0dpc1UrTExZalREK0hmeEZRdXdz?=
 =?utf-8?B?Z2F2R1JSSWJRVjVQWnBPdzNNa1JnUERIRGMraVh4R3FPZm93bDJrSzBiQy9C?=
 =?utf-8?B?VUxGMnJyMHpWNHVtY09yVEdVVGNkSUI4Q2FYOEtoZWhoOVUyQUplbVBETEoz?=
 =?utf-8?B?OFU5UU9WZW05S283dEZOc0Q0UzBQQjhpU2hFMWJpK0VtTXZpREFBY2dYSEJG?=
 =?utf-8?B?enV5ZDM3U2xuK3daNUlXRVZXWE9aUU5kdmhEQitUUkJrVkduNFFudjgxWkls?=
 =?utf-8?B?dlBQenV5YlIzVHpWN3p3NVpNRk90c2FpQzI3NUZGU2FrK0N1VVJqQ2psNmli?=
 =?utf-8?B?a2w4Y0dBWENBajF1N21sb3RiTG15a1FXNWFnNWRqTU5rbjA4ZXZ4alk3c0Mv?=
 =?utf-8?B?TmhNbDBocndqT2hXajJZM0lhb0RJZEtHeTRyVlBzWWJMNWJmVlVGVVo3OFR4?=
 =?utf-8?B?WEJkcjVTSzFYWVgzVHl4OStuMjZEYTN3eDRnb3RGNjdOYldxcm5MbWJyMW1E?=
 =?utf-8?B?WU5MQ2lZR2s2RFU2QktOaGpCRnlNM2Nzd2F1a0pBeGg3VDUwQTdZalVkR0l1?=
 =?utf-8?B?MTBDQVI1eGMrSDJsUWN1RDJOYVJ2TFVXOUgreHQ4OEcyZ1UwZTBmWnVZOFZT?=
 =?utf-8?B?Q2lkMHJiQU8yVVYrSXZyK0prdVREQmY1RWZRSk5wakpRTUdnTWQrUmRTelNJ?=
 =?utf-8?B?NXp5S1d2NytLcC9NeXJoME1vUzNFQjV6ODZYcjh6cXVGaWdFcUpQQkpEcG9R?=
 =?utf-8?B?VzNaM0xEMldrVWJtN2lFNGhJbEZMM3RBUnNpTDZJY0hZSjVaanl6MG5vVDBY?=
 =?utf-8?B?aEZZTFQ4ZWViY05qaEdyN1NSaDNlSHlaUmJlTHlaUUwvdy9LbzdFdHlDMUps?=
 =?utf-8?B?MGhpQlpmYTNJZmYwVW52RTdtSVhJKzMrMFptVUlhWWxLaHhQcDYzWG9oZ29E?=
 =?utf-8?B?eFkxTzRpZDh4UXlOa1NOZG9vSDlqRVpVbXQ2L1ZzRmVHUmh1Kzc0WUNDMDl4?=
 =?utf-8?B?ekZJWERGaTNTUUZ0UGR1dWRnS0laMVIwaC8vN1duT1ZFbWNkS2VXVFVnSGQw?=
 =?utf-8?B?L0lNdlZiM2lrQU9RMndwV052SVlBQlVtR2F6NUhzQjRibjNEQ2g3MUlPQ2VJ?=
 =?utf-8?B?OGZYMUF3ZWE4VVN1Mm9tNlJhZTc0bGM0VVo0aWlSdDA0Q295ckxLdzkvUG9x?=
 =?utf-8?B?ZmdlankvdkZqbTZrZGh6VEdJcW5UamJOL1AxWFpEUTRralEyWHBhOWtQK25H?=
 =?utf-8?B?UGdVb25IckdaazY2NnRMU0hLUTh6dDNXeDZoOWJ1LzU3MnBOMVNhcmdMY2tG?=
 =?utf-8?B?VnhqU1k1RzlQdUVCdVFMVS9HOEdMRzk5WFFMUVdudkRJQ2dZNmhHd25rcWRt?=
 =?utf-8?B?VC9sMmIzaUN4SEZCZVRaWXd3VEJoYlpRTWhoV3hDSk45cHE2d0ZoSVJlTEt0?=
 =?utf-8?B?bE9wWG9Bb2JURkd5a0JrcFQyRmRDZ3dBZmd4bmVJK2hNdDQzeDJaVWxCV3lv?=
 =?utf-8?B?V3c9PQ==?=
Content-ID: <9242D1E90855AD41957BD6E64F50EFB8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1cd646-e2f1-48ce-46d1-08da770a562b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2022 17:45:50.4932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YvKwiKjlsBjFT5udtYhpGkA9PPznn77pY7EPtwvtMxWKO4y1D4zRZSLpLID3tyLQmGTE9GPj4HX74H8yNGCEumNteGyP4Z9jIsM2eRWSgpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_104606_074582_9D7F763B 
X-CRM114-Status: GOOD (  14.74  )
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

On 14/07/2022 09:02, Conor Dooley wrote:
> Sparse complains that cpu_ops_sbi is used undeclared:
> arch/riscv/kernel/cpu_ops_sbi.c:17:29: warning: symbol 'cpu_ops_sbi' was not declared. Should it be static?
> 
> Fix the warning by adding cpu_ops_sbi to cpu_ops_sbi.h & including that
> where used.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Bump for this and the following other sparse fixes:
https://lore.kernel.org/linux-riscv/20220714071811.187491-1-ben.dooks@sifive.com/
https://lore.kernel.org/linux-riscv/20220713220645.105138-1-ben.dooks@sifive.com/
https://lore.kernel.org/linux-riscv/20220713215306.94675-1-ben.dooks@sifive.com/

Thanks,
Conor.

> ---
> 
> A trailing > broke the CC list, resending as v2 with just the CC
> list fixed.
> 
>  arch/riscv/include/asm/cpu_ops_sbi.h | 2 ++
>  arch/riscv/kernel/cpu_ops.c          | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
> index 56e4b76d09ff..d6e4665b3195 100644
> --- a/arch/riscv/include/asm/cpu_ops_sbi.h
> +++ b/arch/riscv/include/asm/cpu_ops_sbi.h
> @@ -10,6 +10,8 @@
>  #include <linux/sched.h>
>  #include <linux/threads.h>
>  
> +extern const struct cpu_operations cpu_ops_sbi;
> +
>  /**
>   * struct sbi_hart_boot_data - Hart specific boot used during booting and
>   *			       cpu hotplug.
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index 170d07e57721..916b71f5dfb9 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -9,6 +9,7 @@
>  #include <linux/string.h>
>  #include <linux/sched.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/cpu_ops_sbi.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
