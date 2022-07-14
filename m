Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLUz3lOGOXCDuyy9hC4rUjvdTyr2ADmgXoI5Q7ktj7I=; b=XpdMQKYq7/AF2V
	6P5UtUSoUh4ZCtm+ik/Q9s60xQey0ZbblWyyz9TcietvXSCZEv8VukQbKp8p13HlLa9qcnZehb55H
	oLTSw6XZWFyl5S5uRyYPMxhwu41gFHQGJCu0WRFQ+gL9FioQc2ddpnJ4bFd3m7AfEmNlOE7Ui+ZyQ
	PkfjcvL9wq5XA1uQNs5Ac7PCdjwhNzS2mNszsPaqem9tfMKc49l3eEPcObOfE6v2/1ImbO36U/pUR
	7Mkx3ENdRjG5wNoLG7NMb4Jk3xPGahi7QN9MT2V9+tn9TiTdjN/oHWW/hefzAd2QR2ebBW0Ma1IO5
	h06VOxFjIOudEl9fKptQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtTS-00Bvv8-5E; Thu, 14 Jul 2022 07:41:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtTO-00Bvrx-JE
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 07:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657784482; x=1689320482;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YYax/2p6Yia3mqV7DjiobfZ6mmggkAni89oXw07VG1M=;
  b=eQ8crehEkgJ0OyyH/FLc+U5HamceJlkLCdvutARouPxQUbtNc2B4G2xM
   4V9XjfipytVw3Rupna5Ctl5ydF53j2PAi81YMT8fBSeeECudfFBx6pO+f
   nVd4HrG4xXamZ5KG0EUYAxfgjvCljY8AwfW6mYUWbtLfm3YNHptuVXURE
   OX+z4WQFHpwQYHtpAdww1LwCicEa30mR/1Lv8++0KQL+3kkRmUFT8gPn0
   /PHJUPiACuLMKix+/LjKoH9yUTv5a02BnXmFwSQ0Pf8Gu5apAVQQIkyPV
   4tM/cGfIUloVYFRAVHxiNjoaEnH0XtPEDmGOtW7XpUAgHuSDummmTVg8w
   A==;
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="182111527"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jul 2022 00:41:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 14 Jul 2022 00:41:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 14 Jul 2022 00:41:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxJuUO72FE8d03pDA3mx6RuLZ5efAz9bxbdQtHgxE/wv5uZHWEb2USWkbsKLxwFjR9KAHiI8J2Bam5k2bqSFMxTAR5wOz0fBcV9FFm+XuDOD0mo5eptD2Xz6Y1yJSDX3GeC/hkjTKjjRopyFGBP6UC9tiBG5qe9z77OTAqTfyoVYATfuScmO0SjGJ1sWxkDflFRClYu4NG+Q04t+nMPJ9hAkVLLFeiJ2IXYAup2gzOqrSnxOB05jCPEmQXpg1RGCVi78ZY6Vr6/RVhO//Dt3eXZRxgRrGIMw3wKPi2N9PpA7H8MwJTh7oOrfQomi5s7Z//4o0dvybOzAselKKX04gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYax/2p6Yia3mqV7DjiobfZ6mmggkAni89oXw07VG1M=;
 b=UmZB6jPJ0edsUgQX86qwFnMGL1ihJ/JkppteZ+w0uvjHDKEP0Oak3WlEN5p9MlIqTYyjEsSlmEEK4lgYyBAP2amqUxsv7058k70wCUnPzFQ3Mj8H5IQHBC3vSNK0G8y66oKfzjxhs+w0qjy3pc1kY7Fn3MH3DKgFj2wdc26bZBXq0PFkvUXv+tguLjSUXV3DK/9fLMfWePP6e0RkbOAhSNYLUGYI4cCQVrsmcJ6aKXkdRSQ2fkvScxANqsZrYEkOBoDEWbDpRuhtGbrfZrn8c0Itec8dZVVCGlTbjwuPtAA9xHcmHKsrEj8steZ4yVdhMl2EL7FWs3pxWZSH/eQNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYax/2p6Yia3mqV7DjiobfZ6mmggkAni89oXw07VG1M=;
 b=QVVItRjqyleT21owTElYt+8zsWVMbT9Qh9ebaggSaoX2zxwq2ABybZILRRMRKPAmtS63Jjo3baqTzV1d3A69xTmSNvp6mcAEfoM10QyOwa1uWrAVnokntqNiuk5oeKWV79GMCiK2H6RIYgH7fZTt9pj/L7Mev2OfInCzm/B6JP8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 07:41:12 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 07:41:12 +0000
From: <Conor.Dooley@microchip.com>
To: <ben.dooks@sifive.com>, <linux-riscv@lists.infradead.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<sudip.mukherjee@sifive.com>, <jude.onyenegecha@sifive.com>
Subject: Re: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
Thread-Topic: [PATCH] RISC-V: cpu_ops_spinwait.c should include head.h
Thread-Index: AQHYlwMbqI2/CI3nV0qrsFkrBd2gW619aUCAgAAPogCAAANTAA==
Date: Thu, 14 Jul 2022 07:41:12 +0000
Message-ID: <283ea0b7-2ff3-a02b-70f3-b056e077962e@microchip.com>
References: <20220713215306.94675-1-ben.dooks@sifive.com>
 <97c2c085-a869-74d1-4acb-ceb1cc3b09b4@microchip.com>
 <b97e3fd0-87dd-0ad1-2a4b-e1050c063e07@sifive.com>
In-Reply-To: <b97e3fd0-87dd-0ad1-2a4b-e1050c063e07@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6469b01c-e852-4024-ba31-08da656c398d
x-ms-traffictypediagnostic: PH7PR11MB5793:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X1zHr5H4iIm0fcA7DD8gSBlE5SxtYbY4akFFQiV+Ws3zwpfRLkecNDcbYEkfTN5ciFqEbhaHrYl4GxG4K79WiKcadeZW0junElGjz1fc0GTrapST08HAFm9MijoNVc9Wtyxw379SgkjJIyZI0IilP9RkoSyQk5TS18KDzQlf118Xj/tO6vt/cJec313IQrIpsiMeVhRhc9QVvGdNVI4FZGQUvx+52dUY5xhY64nxL9G/pudIwo4OVGlzzhs9AVGeitHh4FIc/FFF/casN+pL+4xGIXU2gFyHRWOrk6KHIAJNLTYR6NOUpsTzNedyBp9TlO5PoPFtzMbcO5cO3Kblkk7THazO+nBO11tMVsXjZMSffgH0bDuD3J3JZhsqcYDNtNAUiunnhEEr/HW7H65XQQAatN+96uE0QHZdqcFCP8gxDCbnowaD4RcnWtN7gzAN+fwxpTdqARgSCnNPrKetM0Ou2tgNdyTzCU4fIZdHVcsTnFBxMpOUytZywRmxETjy779izr6fNrYQoSc3gAJcOPdmGyo0N5k6PMaylJqeY/SUYHa1CJCrSch9KaH4Qf18gkd05r2iuaDkfw4po/245UVw0BALe45rCv9yDVJMugM6FLFzNBM7TCMhPY3XLsCXS9cZxv0kQcFkH4bi02R3DGaoaQjEOlWBl/C+jKYke32Rft1MWcoHE8T24J42JExCTM7r5+0JQlIrSzRUH1IPAgEM/15wRzGi1f0xfiOXl1DO6Y/W72/pSQGBEI7zGOO8P0lBJCp0CQFHQF674vvccycX184XO74OQZW3KuY0CAjUT86XhrW0GGvq1hAbJKl0kzouolCwSmC1AnNB+H8XIAHyUaYVs8bVx8JbKR3mCRTBG4RSFSmUT/mXAwK9DbTV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(366004)(396003)(86362001)(6506007)(8936002)(110136005)(54906003)(31696002)(5660300002)(316002)(83380400001)(6486002)(478600001)(186003)(2906002)(66946007)(2616005)(41300700001)(36756003)(31686004)(6512007)(71200400001)(26005)(38070700005)(76116006)(66476007)(66446008)(91956017)(53546011)(122000001)(66556008)(38100700002)(64756008)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUkzWlVzT2UvYlNrcEN2VUdEYUxXQW9sRm5yaXVjT3duUzI1cHkxbXFtbzBL?=
 =?utf-8?B?dWxGUjhHcFJYdFN2aFhFYXAzdDZ0RG9FeHRtS2pkTm5ISEpSbnhZeXZteDFD?=
 =?utf-8?B?aW5RemFJZzAyeGZJVjRrV1hBeE4xMkxKWkJNaDVMV3ZmUEVxbmlMRTVOTXJl?=
 =?utf-8?B?dWpqZmlhSzFhck5UOGJMYUFZZE5rbmhFUHpIdEt4bTBya1dSb2xRK29CMmRP?=
 =?utf-8?B?cWZ6SWZCZXE5ZU1UQ09jbXdFcy9TOEtRViswTlRCZ2J1TFdCamE1YnE1YXpx?=
 =?utf-8?B?Q293aS85V2cwRG93QlQyd3VNQ0xZMTFTdUZhdmhiRnA4RDA1R21GdE54N25I?=
 =?utf-8?B?U2szeXRwaVdPY2o3QkE3ZHFubUdLZFNzbmlxWk4xUSsvcElOTVdKNWZOZ1Nn?=
 =?utf-8?B?ZlVzU3hYUkw5NUYyM2dJOHRKc3lkUnJZdElkdzVKQUdVSVBKZXR5aS83clFO?=
 =?utf-8?B?SkJsWmx4SEtpcjhmSDZycVRhWUo3ZWJ4dE4vMUhpQ0x1aHlJbkZ4WlhUL3Bw?=
 =?utf-8?B?elpqY3N2TVJKVk8rRTVvbHU3bkc2NXRyTTg2bWw2aisyTkJoWVJjSVd6NjJL?=
 =?utf-8?B?a0E2bTR3N2I2UlgwOFBLMk5rclpGN2lnZGs5T1NCWjVXdkFXUmlzYmM4Q3NE?=
 =?utf-8?B?b3poa2NVaDJEOU93b2hyTTFZSFJUVVVydU9hcU1pbHg0Y2UxbXpnWkJ0QTNH?=
 =?utf-8?B?bjA3RzBnZEdvTkVmYklLVWtKaHQrT0FidHp5QnNvRkF1Ukg0Q2VlaWhabDJC?=
 =?utf-8?B?NE9tcXQxdm8rTHBYbVNySnpiV05DVWZMY2xja2cyYk5WSUxJVkpZYzNWVXB0?=
 =?utf-8?B?NlF5Ym1FNXgrdXRhWUJHSDRIclZFeFFYUU55QXB2TjlpVXRGK2JaUHdPS00w?=
 =?utf-8?B?QzljWW9HU2hTbjBjMGN3clRpMnc4S0hZdmNUbmI5MC9pblRXUHdLbzFremgv?=
 =?utf-8?B?VTJDUzlhdy9RR1JkYlgrWU5OUFlEVVJ3UzdncjUzQTVtR29TYUM0LzJwWXNG?=
 =?utf-8?B?NzNzSkg4UmtQd0FaRnFKNXJqZHFBclRTRmtqSW5zVVZ5MW50MVk1UXJ6TUlF?=
 =?utf-8?B?Nkk1c3pXNUYvWjJuWmRZTFh0dXNjaVd2dndGeHhBa1kvNzBRL2VMWlBRYk5W?=
 =?utf-8?B?cFFnbmdOTnFDc05ERVZOSkkwSGNKRmFTZkpzYVlDMXV6QWRpWFhCdXlEdXpH?=
 =?utf-8?B?eloxQ0cxMUxWM3Bnb3JIQkdrVllIMWpGaTZkUzBMbytPbjdZcEF1NnVYU1FH?=
 =?utf-8?B?WkRva1Ira0p0Q0hRdjk0a0NhZURId2NBekJReCtGKy9CVkg0ZzdUU1FrWUs1?=
 =?utf-8?B?djY5R1JLemY3eW5pOWVoUGZwd1AxNTRWbEFsZHFJdzE3K1JLWXpRSzdxUGxq?=
 =?utf-8?B?RDRmeW9ITGMzUHVFcElLY0NZLy9XOWNOY2p1MXo0V2NTU2luck03VFJpZ2ta?=
 =?utf-8?B?VWp1RDFKdDhMM25lQlNROTBCQWNRb3F2Tk9VWTdibk1tTUZKSkF5UENQaTJJ?=
 =?utf-8?B?YTRTZ3YyNm14Y1JST0pKUVpCQUxaeGE0bm9pR2JNSUU5azhIV2pZMngwbVov?=
 =?utf-8?B?R0k5eG1OMzFtSDZYMHg1cGhXUWRValZMbm9FdHNGbnFNUENyazl1SDZZajJp?=
 =?utf-8?B?QW1Vd0tVSDVNcVRvck1jdE01bFA0Y1NYdVFuSmZtSVk5MEh1NDRtYjJKckl4?=
 =?utf-8?B?TnNkUjM5aCtabEFCd0luVTlKRHhMZUUwUDJzd2tnYVgyNStuZlpHQTQyS0dP?=
 =?utf-8?B?RUZQT2JDRFF0bjVkMHF3YWY5dnIwYjc2N1JuTHlIbW04R1dUSFlhR2JMT2tM?=
 =?utf-8?B?TDEzRGZJY2FpZ0JoU0NJVldWQ3ZkQzhuZTNNdXFlM3BLMjIrUzlqVm9sU2Js?=
 =?utf-8?B?MUEzQjhjL0tHdnVOWVNKYmxkL0ZjSnBQS2MvVjlTd1JQS0gvT2pOVk9MUE55?=
 =?utf-8?B?R1QwRHBZVW1ldzh4VHIxRUV4ZlMrd0pWcHZVRFR1dWRZV1E3Z3ZIU1BwTXZJ?=
 =?utf-8?B?T3hjdFNPUEVpblZYQ2xsZTRZSnQwKzBLUlFJWGNhRlVJdHloZml1Q3FvYUx5?=
 =?utf-8?B?SkJKV2R3NE1MTmVNSGpPZVNwQmxOdkcyYUdja3k4empLc2NNNzYzcG14eEN4?=
 =?utf-8?Q?Tv+MXuXIF380XhV34IqDvjku5?=
Content-ID: <5DF68F140CA9834AA3F00963565A3A47@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6469b01c-e852-4024-ba31-08da656c398d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2022 07:41:12.2339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8I86jULOKgHfAIc/ROJ4mffqg2Cc2ue2wnGmPxwkR5sApyF2FYv1kux4qBlpzs5IJBEJTqgmE5yUY6O+XSSm+mpYh8gxzFzRrbzh8GtMxc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_004122_667963_215F3435 
X-CRM114-Status: GOOD (  12.93  )
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

On 14/07/2022 08:29, Ben Dooks wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 14/07/2022 07:33, Conor.Dooley@microchip.com wrote:
>> On 13/07/2022 22:53, Ben Dooks wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Running sparse shows cpu_ops_spinwait.c is missing two definitions
>>> found in head.h, so include it to stop the following warnings:
>>>
>>> arch/riscv/kernel/cpu_ops_spinwait.c:15:6: warning: symbol '__cpu_spinwait_stack_pointer' was not declared. Should it be static?
>>> arch/riscv/kernel/cpu_ops_spinwait.c:16:6: warning: symbol '__cpu_spinwait_task_pointer' was not declared. Should it be static?
>>>
>>> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
>>
>> Hey Ben,
>> With this applied I still see a:
>> arch/riscv/kernel/cpu_ops.c:21:29: warning: symbol 'cpu_ops_spinwait' was not declared. Should it be static?
>>
>> Seems to be in the same ballpack, so maybe you could fix that one too?
> 
> I've done that as a new patch in case it needs to be moved.
> Not sure head.h was the right place nor where it ended up.

This is a rabbit hole man. I found another one while checking by
build logs to check that that one had been fixed. I'll send a patch
this time..

For this one:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
