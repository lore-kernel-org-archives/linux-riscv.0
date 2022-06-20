Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F587C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/KsKcw5/wtwMOZGERdHiqye/+HOYNHVlhevwz/v5mE=; b=S9/vq/ep4ORpFY
	zsIQdmUM3Ycq3mGmiDqFwm6LKca++7EbI+nDJg+IL7ebZEGs2vzoCb6gv1/fjEyo9Lgpl55ur6Jnu
	hL1FSBs3NHH4jYo719zX+t0qQXhz92W+f3TTbo1q1DEIEdvEkqJfgr2ZSepDCP8qiueC1T2oNv9Fr
	zWnejSZRPpAQe/tH8SQj39xi0tzNJb+TE8n0dM2qRsoNFEhFZ2xU8t0gohiqABJ3rg5yon/3vJjzk
	qpE34vuKTZdhvh0hiKoUxaR+9agay2XHYL1Czu4y39f0IWu62ZxhwCVqmOFEkypWFmgLjZFcj7kcn
	+z7V3JHhRDZhJBf5rjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Jn4-001MC9-4w; Mon, 20 Jun 2022 15:58:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Jmz-001M9N-6U
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 15:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655740688; x=1687276688;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Y/djgT4iBBr/ArnH7FkGhAdyqkPJZ0/L/qncw9+btx4=;
  b=Yzr7/G4AcEMa32bRFNFZE1iwNWKkPrgzcN8RGBIJ8N+K6MVci8XgELHp
   mjsX++Wl8hGeiQlMiRP3qgH87oz9qpBJSB8/rRKG7tEUDHU7rX2D9VF+8
   f9x2/ngufAK4QDNk6urq7TFMoXJham3CZ1fXliosocoRkBMCquvwoaa4B
   A4lKkOeG6gRgwfkfwuubMKwAaS90VdDKy8cG4bU+K/NLpcRrQadVyGw+m
   mJNoYjEhlczOlB77EFECLHk7kyLBHthrbOl2kxTPCdh6kUhnsYSBPzw8C
   +GwTshh2D/JHNOpB01xHXUA3sFOMG3vxESrAXP3XMKvP/+jwhsC5yVF+/
   g==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; 
   d="scan'208";a="100863497"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2022 08:58:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Jun 2022 08:58:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 20 Jun 2022 08:58:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cL+ropdJ6rlf91+V9TB+UCQc8Wsiv9cE2jyM0eL8d0hy76lGKGI9qcD/rdWJqPkDbdeDAaUjl5FBhui+IFM2v9j1iSH/RTHFKlc831TEBVxSwrF2zuTJIRNCAOvXF6BWRHNpngyswZGwoDib1xpAZ5GlqPXpu5nAA0bjLtWgyuQlx3m+fbEMpq6LhRTIwaIzhAKQw6M5QaOMJVCBc2ZtWU4Cig5/HhrgFYAsc+S/gmmdvPsRQVNsK6REg+mRsIZ22QFPfSB9OLcfQOo6CcoPor+50UxeWC+AbLoODmhnmMn2OCbQ7rmfC9PbDWtK2xtkB9dmuGBUGsYWsnNS7+N+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/djgT4iBBr/ArnH7FkGhAdyqkPJZ0/L/qncw9+btx4=;
 b=K9IiPoiTDPn5JcMPsrHVAbU7++CR+GnEy09reArSAWCI/TuCyIsPZzduDPrr59kSL7vf97xPwGmKuKVs43myhU6oLboOHPU3y5ZeM4CH/fbdiLD0cbBdkmmiPpLz8WKzWPRBNjGWcXh+5wWs79IijLFYoIrGtpy6pSHE4m7HP5t+MIn+59zjKipPF4rec5VIttuHVY4UFBPe2yljax8EM3JihxbpD6Ag5RHy/86q+v1OFgmHv50JdguyZuRvMkYVdT+oG2tHfpJB+64MikOdN859J4ABNHogU3hQXIJ+VmmB5dXhKlmeNovTlhlrx19AwOyH291pfBkYLu3uOJ17jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/djgT4iBBr/ArnH7FkGhAdyqkPJZ0/L/qncw9+btx4=;
 b=IN2zbO9Psza4o+BBj/b8PyKN2e76CkBhpy02yfqCwC4iVX1P9qPn6hIN20s0BXPWGxKXWl/MXLv/62fvh8jiw4RETiTo6mRT7hhiyg7jymI8tHdJpaWmZtaWO0NrO+JbTGjCzQR1r9TfFBJWngU4oxk4z596nbJ9wwPtXJNel4s=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5507.namprd11.prod.outlook.com (2603:10b6:610:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Mon, 20 Jun
 2022 15:57:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Mon, 20 Jun 2022
 15:57:55 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <palmer@rivosinc.com>, <arnd@arndb.de>,
	<peterz@infradead.org>, <longman@redhat.com>, <boqun.feng@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5] riscv: Add qspinlock support
Thread-Topic: [PATCH V5] riscv: Add qspinlock support
Thread-Index: AQHYhL4f4Ilerb/kb0KG65AHApdLRK1Yc4QA
Date: Mon, 20 Jun 2022 15:57:55 +0000
Message-ID: <a498a2ff-2503-b25c-53c9-55f5f2480bf6@microchip.com>
References: <20220620155404.1968739-1-guoren@kernel.org>
In-Reply-To: <20220620155404.1968739-1-guoren@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d1e6352-93a0-4e74-803c-08da52d5a3ca
x-ms-traffictypediagnostic: CH0PR11MB5507:EE_
x-microsoft-antispam-prvs: <CH0PR11MB55076FCB2C3B086F034560F398B09@CH0PR11MB5507.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 469puQ15gviT2ttt7NNSb0jaqzZ1T4piUVg9wPDmGE84Wfd1DQe7Ht+ytCoSVeSkIXdwy9kjPkLbudbtGJIU3s+x+W+Cry6txkqd873qqXcOIeKD4nbVxQ7IrdwvCmJr+uMrOrAb/6PpxrenoVMYHk3TF0lTUkNDcT6yjcSp/aaBlV0AfeDowDyU03+n+LJqX5UcMA07qePCQsqLImCH+aD6Gp2CZsUX1XIDclReGhJp+IWaoVDQ/U7SHqAmyOwqfkq7KJcZyp40YO/FI43D/kom+lq3CKTX2MD/TUArjkzGvdAv/H/IDFd7vt8QLxBWNTCY3t+GV6zXOINRDh614BhvguxB4G16nF59pUtT1oTiazB+y2tI8BcsOT0QzzV4T9gTgpo5qvm4ibG9fTZ1TOmNULmrOAtJPt5yxjmUqS9dgnYH/ryPRvjAGzNdVGcrErq2tvsSoHeDeJb/hSnplN9SeOwb6exyoH5fzoqBcVxw5wrb0XsTuh2SP/r7MXvJZ2SUI+zmhTCh6dJL/xOd+dYrspXgAFtuuwGchsYoyml6qnND05hnRWT2969MJgiowjEcNMZD0NaOPV3ZnLeydBwepk8X9J7OsMMg9D4z5CAwGFDsVKiwGMeM46h2UcJAyGmmxvEDdeMY88c8u3VeqxQ1xfvZSOdDr+gGczww9YheK7fkoEaEsqCpdnUIFuc/F8SQm/pTPQSutv/5yr/P3w/CR9Bp82pOcKRLXmKu/m3yD3b81yHt63lMtiEvJ5KUU+xTCqDYdXQvQ9GE9gyLS+xiGKuGCkdmyOeXXCQNErtyR4qZnk7EsMLM7d0Njx45suU6rDqnMQ41mouaMskYbbmpky6OsqkbA5bHQtbzXyTh1B4FaCxNat0B7cJlJYpWpRURB9YmG6lRiHrR7A/fyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(366004)(346002)(376002)(2616005)(36756003)(71200400001)(66446008)(66476007)(186003)(5660300002)(64756008)(478600001)(966005)(7416002)(66556008)(31686004)(76116006)(316002)(6506007)(6486002)(66946007)(8676002)(53546011)(83380400001)(110136005)(4326008)(41300700001)(2906002)(26005)(122000001)(8936002)(38100700002)(31696002)(86362001)(6512007)(91956017)(54906003)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjhQV1RvdkpXeEVlMWpXdWEwNjIwb0gvK0E3eHpmeE00dW01dWpLMitoSElH?=
 =?utf-8?B?bDN3UXd2TXBOcXRzKzBKSW1nc2dUUWJ0SUd5cE1IckJCSjg4YUlmWEFTVlFx?=
 =?utf-8?B?SHNIRmJNUVV3WmV1VzA2TzFzUkNITG1HeTdsQWhiNzNhamovK0NNTjMwUERa?=
 =?utf-8?B?dklyWExYL3RUMVNOQ1dSbE85VjVHUE5NbURIUk5hODZKdWx6alBvT1ZiZUkv?=
 =?utf-8?B?ZkVyNXh4ZzBFYXlDMmtnMkY0OUFleFpleHljdnBXbGtRaUVTUWhHRnA2Vzd5?=
 =?utf-8?B?N0pVOWplczNqR21PeWhXQnhkc2Q2bHZmRmdHWGpGM25PaFMzaVRxSThGTUNY?=
 =?utf-8?B?aUZJd25NWW1NZEcxcGo5RTdoV015bFpHQTRwK3A5UWJMeEZHcGhFTW1KZS9M?=
 =?utf-8?B?MjlRVGFNRnV0cUkrVFFIaS9ab3c2cWFMWktmR21WMVdjSFJqY3E4SjYxZWJI?=
 =?utf-8?B?Z3RmcGJTMTV0OVR6eHNnSmZqNlNtSUpVSXFEOGN0bWZnR0UyNW5BNW9nVmhX?=
 =?utf-8?B?OENNQTJ6Y05maWVuUndMVGIyZnZmSzFjcm5LR2orZUNkZVB3K2xyK3o2K1VT?=
 =?utf-8?B?d043bldJbUxqVm9rcEZRTHE0NFh3Y2Zsb0doZXU0dHcxUE9SYXJYYldpVk9u?=
 =?utf-8?B?a3dCSGZ4TThudmhhcjdiTWVzeEQzL093dWx4b1MwZUltQS9XMDRDVHNCeG1N?=
 =?utf-8?B?dVd5aUlVWkQrREdqK3BCaHRZb1Z6UHZvQTJHaVJwMWo0RmJ1NXFISGZpMUpu?=
 =?utf-8?B?aUtFb2xpcGIrWlY3OUpDSkl6bUJWYjg1NFdNL1dURzJibCs0R0h2V2FKcE0z?=
 =?utf-8?B?Q2VJbyswcWk1c0lIeWJhdEprWW9OeTBNdTJlb1NveE9FTWZwV0ljZG80aVda?=
 =?utf-8?B?anc5SGJCUnF0MnVJN0hiTHJZRWxmeFpGR01OVmtESlJYbUN3SlhJNzU4WFZt?=
 =?utf-8?B?YWpCSE8xUmszQmRWTjFlejl4ZzUxc2RtQVlvbVVNOVNSOUVpTktQRnNXaEQy?=
 =?utf-8?B?SnVOUkRCQWJyWU9CTG1XaFBlWjh3TFN6b0grNHFob0EwTHlEd3B3bExaaFVB?=
 =?utf-8?B?ODljUGp1cU1VSFJkMFBWOGhsTUNIZU40RnJvNjlEaXUwMEhYL0doVDFWVlNm?=
 =?utf-8?B?cmZDcFprZDErL08vZXBqVnc3MWExV0hMTWc3bEhqQUJVWkk2VmlCYlh6dVlB?=
 =?utf-8?B?MTkxK05Rc2lqamVYSUY5b2hGUXpYYUs1ZDJjRk9PWVNxREliRDM3SWFaOTNB?=
 =?utf-8?B?SW9xaURMdXExK01yVFROTG9VU0hMQlp1ejNSeDNlMi83M1RmMWdwRVRJS254?=
 =?utf-8?B?eFBNWnNBQmxmanFnTmd0MWJqUmlnazN2alcySkYzSDBESEtGRlBrK2txNU5O?=
 =?utf-8?B?OHBtMUY3QzZHU0dFWU9FaTdmaFFIbG02amVmam5pVUJKdjM2RFpHUGdQa0tB?=
 =?utf-8?B?ZFVGRWVuTGhZNkNHbEhKMmRPZG43QXVtWXdzcHdMbXQ1V0lIR2pMZ0tlL1Vi?=
 =?utf-8?B?NG5DdEU0enROd0hueFlVUjV5MDgrT09tYkNJRWE4ZGwzMmk1VTNBQ2R5ZURI?=
 =?utf-8?B?UERnYXhEQTZZL3R4cVRlQmlhVXVsU2IzZDdRK0tRSHpKYnF1N3kwNGlQS1Nr?=
 =?utf-8?B?bkxqRksvSGxseDdwMXVLVncwbG5yQkFXYXRpMDBweDdmcm1KR0FBdFpiWnFZ?=
 =?utf-8?B?MTk0WnFiUGFINFowclViRWlJVjNFaTkzVlFib3lrYVEvWnZCYzgxaGJ6Ujg0?=
 =?utf-8?B?UUtJU29LTjhTQzQ5d0JOTUVxSmJCdDJzOW9UY2dIUjFWU0FXV21kcHlDcHVx?=
 =?utf-8?B?TVc4NER6NGJ1bXdlQTBxTHg1Wk50UDBQaXZ3RlRqY2E1dUExNGJMLzcxT0pE?=
 =?utf-8?B?QmdDYlpRTXVTS0ZKUTVYcVBDVUtxZi9sSExqTzBXTjY5N0FmMncwTXVpOHVH?=
 =?utf-8?B?RzJ1UUYzakd2TnlvQXJvQlRxSFRncEFOZDIxZHdlcmQ4VGMrY0JZRlh0cUZS?=
 =?utf-8?B?YWhHa0Q5ZGtBeU5jMURVRUY3eEMxODJBSTc4RmJsRDkvNUV3RnB5NzZrWjZJ?=
 =?utf-8?B?MkJvYnR5UWszTzVVcU9kU3FsbFdRRlQzZkFWOStkeDBuTWVyN3F4emlxeDBX?=
 =?utf-8?B?SmprbWQ3R1BCYWpzWGxlUi9ZbjNNL0JZSDRKZ1FrSy9BWEFlVU8vb3Y1OWs0?=
 =?utf-8?B?WHAwTXZoUHorK3VUbnBPMERVYzhkSWQzU0oxb0NUTzQrYzF5anBQUFUrQS9n?=
 =?utf-8?B?U09HRDZ2OUc1dDFaZDFsdjcyYy9mMFBtSC9pM1B6Vzl6TkRNRW1VeHk0K2RI?=
 =?utf-8?B?V3FWaS9mcnBBM2ltNlcxSTBRdnpEY21aenZNY0lscnVaM1lhalZCRnB0bXFv?=
 =?utf-8?Q?ni8hvXt1kzx+hu9Y=3D?=
Content-ID: <64F8B602B64A9A44B482B8490383F88B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1e6352-93a0-4e74-803c-08da52d5a3ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 15:57:55.5346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxb5DlhWtWLsa9Q74gMxWkqE/wEuQWqftsA7vqos9kC4NSdPfnRtb1b68loH5erQrVFQsIhwXLudyXxAvM16w8uXFQjX4O6kZubkETgFank=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5507
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_085809_385947_29037B75 
X-CRM114-Status: GOOD (  25.75  )
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



On 20/06/2022 16:54, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Enable qspinlock and meet the requirements mentioned in a8ad07e5240c9
> ("asm-generic: qspinlock: Indicate the use of mixed-size atomics").
> 
>  - RISC-V atomic_*_release()/atomic_*_acquire() are implemented with
>    own relaxed version plus acquire/release_fence for RCsc
>    synchronization.
> 
>  - RISC-V LR/SC pairs could provide a strong/weak forward guarantee
>    that depends on micro-architecture. And RISC-V ISA spec has given
>    out several limitations to let hardware support strict forward
>    guarantee (RISC-V User ISA - 8.3 Eventual Success of
>    Store-Conditional Instructions). Some riscv cores such as BOOMv3
>    & XiangShan could provide strict & strong forward guarantee (The
>    cache line would be kept in an exclusive state for Backoff cycles,
>    and only this core's interrupt could break the LR/SC pair).
> 
>  - RISC-V could provide cheap atomic_fetch_or_acquire() with RCsc.
> 
>  - RISC-V only provides relaxed xhg16 to support qspinlock.
> 
> The first version of patch was made in 2019.1 [1]. The second version
> was made in 2020.11 [2].
> 
> [1] https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/#r
> [2] https://lore.kernel.org/linux-riscv/1606225437-22948-2-git-send-email-guoren@kernel.org/
> 
> Change V5:
>  - Update comment with RISC-V forward guarantee feature.
>  - Back to V3 direction and optimize asm code.
> 
> Change V4:
>  - Remove custom sub-word xchg implementation
>  - Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in locking/qspinlock
> 
> Change V3:
>  - Coding convention by Peter Zijlstra's advices
> 
> Change V2:
>  - Coding convention in cmpxchg.h
>  - Re-implement short xchg
>  - Remove char & cmpxchg implementations

Hey,
How come the changelog is inside the commit message?
I assume its a copy paste error..
Thanks,
Conor.

> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/Kconfig                      |  9 +++++++++
>  arch/riscv/include/asm/Kbuild           |  4 ++--
>  arch/riscv/include/asm/cmpxchg.h        | 16 ++++++++++++++++
>  arch/riscv/include/asm/spinlock.h       | 12 ++++++++++++
>  arch/riscv/include/asm/spinlock_types.h | 12 ++++++++++++
>  5 files changed, 51 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/spinlock.h
>  create mode 100644 arch/riscv/include/asm/spinlock_types.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 32ffef9f6e5b..3b0b117b4e95 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -333,6 +333,15 @@ config NODES_SHIFT
>  	  Specify the maximum number of NUMA Nodes available on the target
>  	  system.  Increases memory reserved to accommodate various tables.
>  
> +config RISCV_USE_QUEUED_SPINLOCKS
> +	bool "Using queued spinlock instead of ticket-lock"
> +	depends on SMP && MMU
> +	select ARCH_USE_QUEUED_SPINLOCKS
> +	default y if NUMA
> +	help
> +	  Make sure your micro arch LL/SC has a strong forward progress guarantee.
> +	  Otherwise, stay at ticket-lock.
> +
>  config RISCV_ALTERNATIVE
>  	bool
>  	depends on !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index 504f8b7e72d4..e066ccab6417 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -2,10 +2,10 @@
>  generic-y += early_ioremap.h
>  generic-y += flat.h
>  generic-y += kvm_para.h
> +generic-y += mcs_spinlock.h
>  generic-y += parport.h
> -generic-y += spinlock.h
> -generic-y += spinlock_types.h
>  generic-y += qrwlock.h
>  generic-y += qrwlock_types.h
> +generic-y += qspinlock.h
>  generic-y += user.h
>  generic-y += vmlinux.lds.h
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 12debce235e5..f7f8e359d3ac 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -17,6 +17,22 @@
>  	__typeof__(new) __new = (new);					\
>  	__typeof__(*(ptr)) __ret;					\
>  	switch (size) {							\
> +	case 2:								\
> +		u32 temp;						\
> +		u32 shif = ((ulong)__ptr & 2) ? 16 : 0;			\
> +		u32 mask = 0xffff << shif;				\
> +		__ptr = (__typeof__(ptr))((ulong)__ptr & ~(ulong)2);	\
> +		__asm__ __volatile__ (					\
> +			"0:	lr.w %0, %2\n"				\
> +			"	and  %1, %0, %z3\n"			\
> +			"	or   %1, %1, %z4\n"			\
> +			"	sc.w %1, %1, %2\n"			\
> +			"	bnez %1, 0b\n"				\
> +			: "=&r" (__ret), "=&r" (temp), "+A" (*__ptr)	\
> +			: "rJ" (~mask), "rJ" (__new << shif)		\
> +			: "memory");					\
> +		__ret = (__ret & mask) >> shif;				\
> +		break;							\
>  	case 4:								\
>  		__asm__ __volatile__ (					\
>  			"	amoswap.w %0, %2, %1\n"			\
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> new file mode 100644
> index 000000000000..fd3fd09cff52
> --- /dev/null
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_SPINLOCK_H
> +#define __ASM_SPINLOCK_H
> +
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +#include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
> +#else
> +#include <asm-generic/spinlock.h>
> +#endif
> +
> +#endif /* __ASM_SPINLOCK_H */
> diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
> new file mode 100644
> index 000000000000..9281237b5f4e
> --- /dev/null
> +++ b/arch/riscv/include/asm/spinlock_types.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_SPINLOCK_TYPES_H
> +#define __ASM_SPINLOCK_TYPES_H
> +
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +#include <asm-generic/qspinlock_types.h>
> +#include <asm-generic/qrwlock_types.h>
> +#else
> +#include <asm-generic/spinlock_types.h>
> +#endif
> +
> +#endif /* __ASM_SPINLOCK_TYPES_H */
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
