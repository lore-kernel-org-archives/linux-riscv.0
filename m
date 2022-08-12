Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450AEC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVSKe21Rj7zsinOwQYReo6YSyOsN+estwpJTXUjVF5w=; b=tSPmewsYoBiW35
	jneAF/taRsMEtPMTxf88jR+Qock1r8N8XLVZb7LpFRKCWJEkBnfjSyTr7ZOcJwW92gaRr6/x4QlKk
	YrIO5M7YEaPUnm4SS21IvEcz+z53THiW1qCWXI2lUzpZCvUMDE7sTDbkwyZqQ7odvDlw89BeFms1e
	SM5A8L6GZdhitUb0UsTLtdqGurlE7ZO2TdEnkgfcunlgrl8BhcKnF7ZMyRyBdlebdpbevisTE0qPR
	rpMlTqMWSYvP1UekBvfIPX9W+CNY6Pfy44n1l0zWcBBABRAuU9G1tKGjLyhtWHCr3UM6KA2GpTD9N
	TMBKPbfPpsgirgVHZg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXlE-00B1oo-7c; Fri, 12 Aug 2022 16:43:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXlA-00B1dI-9w
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660322624; x=1691858624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KbyWncIN09kWOteOHO3sLbGyvZUP7qp+fxoYHThB7Rw=;
  b=qm8Yv1HaqhraEstbQhI196zcbqPtdRxf9e27A+yJVpBgdbG/f0oid89B
   dpNbyCdkprfOsLdnUj/wX4F1uYSPHpxvLOTDVd7PMDdX6KU0aKuG4x1qy
   YZzmdJFN0hxW+EPhwjOWFN9vy6SufZyuSlOroIrGSrfspbpLCLloNU0bu
   gEIWOI7ql37TWyQ/cV70pl8MxhYLYP9kpOphaAmAP3jxv/mpbMOgM7pSG
   5BCXytvgGsiBs+/CwJU45wgFZYvC7cRZIUTsvqg69C0s+bhex0+xF0hHJ
   Xwj6IflkyfxHhgBjLk4eSnfDghnP4MtgbaZ5H9R1a78Il/OhOz7hoh0Ls
   w==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="172217712"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 09:43:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 09:43:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 12 Aug 2022 09:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsLWZ/RSx/yZq8BqP+zVCtnjXrdFoCYnMNga8Ek0d3zgO2lkTiBhFgWj2GEPp2TIL+nUlnpLEmyJc3BQx/bskkNDE2PDJ7CBKT+RTPQEVPCje9QwmcQvp9HBlF3kR8Lx2l71X1q5D+Z3qqq0D+wdFGRa/IRjd2PYTBXftyBkqdfrDIk8MX5FCwlDxoaT77rHKlHd7ezqJKXs0B/b70FO0Dms44Iw33MjhIWHgqO6zPk/u508F3Y0JGRQ7KvQS64AQ5jFnbQZhgbFa5mN64u50osYAbULwKsZkcH0Zrs1UKgm406KaZIGi0K5pwyYkkOllOKOOBpNwdo8zfwyh25bNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbyWncIN09kWOteOHO3sLbGyvZUP7qp+fxoYHThB7Rw=;
 b=mXbPKPC+6cYScPz+RsN+GVEEPpzqU05edzaL05YZzuF5AUK3UDrnI32NtjZgL4J/SAT0HZbi+h77zbFhNsed1IRd8ULoj+LJswGqGCSm6yoAkX6IJf5PUmVrK8ElFyheAlktXhPejrn3wlvDGQEwYs2k/T9sCG9OpVPryXQN7WNX5yk2GNUWX6dwsDzWH4Gmsaw3GxXEhAAstVUJGw9Z6lFfFu8LiwHDfUQR4nu0mCj+LmEaiOkzj/6ruUUuJlbf7M1gxNYBd6+hAKP3mQ+ZpAxg13FdoYrlqGJA6ukPAGbSAVFRTQszZCTsmZ7CVNklJJJGk61OcTyYJaL/CJCAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbyWncIN09kWOteOHO3sLbGyvZUP7qp+fxoYHThB7Rw=;
 b=uuD7aREPJBnRbM950feTLyngVLIFQkwoh3o8/qqro9IYuOUTm0GxSDh265QUcIsUMGXRgHKil0AmD+Yv6oQGoTAA6xAgAAsuGykJIq1d2dxmgr0J8M32UAYcR6/0pdwV4QgIMx0EWcFK9xJUeoyZMgVoDWJQ0qG6DmkKnukBTuw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1922.namprd11.prod.outlook.com (2603:10b6:404:100::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 16:43:27 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 16:43:24 +0000
From: <Conor.Dooley@microchip.com>
To: <robh+dt@kernel.org>
CC: <mail@conchuod.ie>, <ulf.hansson@linaro.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <yamada.masahiro@socionext.com>,
	<piotrs@cadence.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] dt-bindings: mmc: cdns: add card-detect-delay property
Thread-Topic: [PATCH] dt-bindings: mmc: cdns: add card-detect-delay property
Thread-Index: AQHYrcFxzXmqZluWDkK6zKWVpeVxJ62rZiyAgAADpYCAAA6JgIAAAWoA
Date: Fri, 12 Aug 2022 16:43:24 +0000
Message-ID: <fd3e5466-76e4-f678-5729-bfe9f2b0b811@microchip.com>
References: <20220811203151.179258-1-mail@conchuod.ie>
 <CAL_JsqLOGLZD6vrNPqDUqYypkz8xoCPJ4DA4JF-BrG=WHWPurw@mail.gmail.com>
 <46c51365-b4a5-9666-bc3a-24ff833d8fb2@microchip.com>
 <CAL_JsqKZ2N7rTb0Fm0Y8CjN8XrTkBsu2uU_TFfhU0iwjSz5row@mail.gmail.com>
In-Reply-To: <CAL_JsqKZ2N7rTb0Fm0Y8CjN8XrTkBsu2uU_TFfhU0iwjSz5row@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a6de2ba-219f-4b07-925a-08da7c81c66e
x-ms-traffictypediagnostic: BN6PR11MB1922:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LWe8LQAs85/7fSJXEEhpLxRo8bGtPbcbxr+8Gnso02kpwQZV73xvaaoqRTb2BIPKyqRSJqgzY26LMIhx0KItU3+56KjGzbQP4ozSDJk7+BPjKHKGYojr3lB7/sNHQk0pgTjN6dIH2YZDFUQcx/mkazAHV5rFwomYtUOMrsrVueYtqtke3VJKCbU9SuxYR6RNiRGoo80/N01+TBkrXGyNrR83PNK6PCpk7zWl6oJSIT2udWcZCWLSMWo//gkInrHgEqQBjAh/5JZ5zFU13iSEgJgTDB9r7EKqVUMrESESHKu/dIwRtyI+QrE0M+QghnIurWFURFoUsrHn7sY+Bh4ErCKsDov4eQNOhUVNkOQ5euAqqMVRvwN3CMJ528w9plRv2tk6X3f9rFQ2Le1cqO7oiuuJXEHP1qQbqLkISKb+7eOllAt6B/TRI9KrTYc8/HFgZXPRmHP1VJfsFlp6q4soMJZg35evU5NiukWf7WbjasKQrOhIW61sHNCWogoTMTt45vx/WCV+egp2qAhB4DUyaBhJVDjJlj5AGllFGFR6ltDt4wQE3n1dxs4o5OzpMrS9jaJSjDECoxwhAJikAki7TwqFeTlcZqVt3nGBhbjgyNY//0K8eqOQ+hCX867ITpTrniK1mxGU10VOpOZrpZI1P/GtPkVKJhF/B7RN2/5zaZrqp+E5J2kpEByrhzTPfqVzmBP7a4amdpVM2APIkP9h8K1VuR7LzozJbQ77ovBEbe2p6gsY29z5uhWFo7p9FoF1NEddv1tmVU9KIssb4jWA5uXSOrA+p3xpHuE1jNM+5q7x7HHq7SkpzhCTg9kNPPEK8jd74O0PnXFpZRb5sPRR0lSRdodNir/XZ7Y6g3DQqHQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(39860400002)(136003)(366004)(6512007)(31696002)(26005)(8676002)(38070700005)(76116006)(38100700002)(91956017)(122000001)(66556008)(64756008)(66476007)(53546011)(66446008)(66946007)(4326008)(71200400001)(478600001)(6486002)(6506007)(316002)(41300700001)(54906003)(36756003)(2616005)(186003)(2906002)(4744005)(5660300002)(31686004)(8936002)(7416002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2ZZUGd5SUtURDZqcjVVZUx3Z1dWTTg1c0dwUmhpUlNsZHoxNE5nYlFLekc0?=
 =?utf-8?B?R0lJcC8zMGZoSmpPb0toblFwTGdVQjl4SGpqU3VWN2d4TmVWbkREbXg5Nzcv?=
 =?utf-8?B?M1VaYmsxbTR6U3NHYm5iNmxkREt4OXVYZU9tdVdJK1U3V01Ob0x0UXlZNkJH?=
 =?utf-8?B?TEJod0Qza01xd0pycG42aFZMTzFqeEFNRU15MEZUai9uV1RlWVYzdzdqQlRP?=
 =?utf-8?B?OEludWNLdTIycFdFNWloS2dnYUw1SmRUMk9tZit1U0pRQ3BHL0dFMWg3dlJ2?=
 =?utf-8?B?TndYNk1JL3VzSmkyemZ3Qnp2M0tKdEV0cTZLc0JoVzZoMjR5MEhRL2oxak1V?=
 =?utf-8?B?T2ErN1pBdDQ0T28waFBxTllpQnpGbUtncW1ZQWwxN2tITlQzd0NyRkVpWERJ?=
 =?utf-8?B?ekxPKzZqZUJLWnFhbkxJbFZaOFM3ajBid1FYM1NZa2N2MW5zSkJqZmZ6RTVt?=
 =?utf-8?B?Z3haaGxCWmR0TjZDTU4yKzFDbkcxU1FHaG9lN0VTc2Vzb1pQd0IwS2pCc2RQ?=
 =?utf-8?B?YzdWeklNUHlncW55RXhvRW9CZTV5a01GNVRPZGpaTWdidEpvMDBKZEtYOU9v?=
 =?utf-8?B?Q1o4L001MzNIRUlrSGt2UHJPbjgwVlJLaDVPS3JHSzMvTmxKY1RiK2tYZFNa?=
 =?utf-8?B?Uzk5WTJ5aHNLMEMwWUVUWWhCQVhjM1hKbmJQMy9wd2dtd0dBcFhMYUUwZjJG?=
 =?utf-8?B?OFZLb2E2TW1iaVNTSjZndWdLK1VDR3Izb21pRHBCazBlM1huU2dFVkxHMDF1?=
 =?utf-8?B?TEtDTGhQMVNqa2J3RmVzMmlhbjZ0eHlINjk4Ty9xZjNNSk9PL1ZrQlZxYXJz?=
 =?utf-8?B?Q2tlL3lha0lmbXpqZklyN1NlNGNZRGJQTjFWRkEzOEQ0ZEdYNUlBYW5iM2Vq?=
 =?utf-8?B?RndTNWFyc2VNRm5ZSTNUdDF5a1RzemVScWdiK2xIRG9JbVAyaVpWdTBlVnZ4?=
 =?utf-8?B?ZTc1UTRJQ3RkNEIrK0NvTWFDYXFJV2hjVFlMN0dnT2NRbE5kVGZqd1A3QTlj?=
 =?utf-8?B?bnFzODNGN0twNW1lSE1KU2YxV0lpd0ZtTDJVS21PNnNMWjM0Y3ppc0F3RXlh?=
 =?utf-8?B?dEFETlAzOTdDRytUOFBrY0RJQzU0SlZtN0ZEK1BJdVRvM2JCTzliUWJxWHlX?=
 =?utf-8?B?MWhHZno4aFRXZmJYMVlTSklQZGtKZXExbzEyWjdvakZra2ZCVUpzT1NJblZo?=
 =?utf-8?B?em0rMkRBN2daR2Vkd1Y2bmUwcXdrK2NoR2hveko0ODhqUndzWmlPMW8vc2Z2?=
 =?utf-8?B?UEs2bkJjWjB6K2krak5uU1lMc2lFeTlEQkFCSEhicU1ubXNYQmFMa2ljSEo3?=
 =?utf-8?B?cWdPb05aMVFqd0E1c2hFcUZ6UzNZcGhmaEVTbmRhb3czbDlsMWtUdUxmVlNJ?=
 =?utf-8?B?OUVzVDVCN0JGMzcxV0RIUHlDeWM3K3MrN25ZTXZwcTZPdVdSaXBtZnZENHFQ?=
 =?utf-8?B?d3NCWDdiSXNHWkZxa3d2WmMxejM1REpzSll6bGQ2NnFtUTBMSGJ4TlJEek5U?=
 =?utf-8?B?Ky9rZEEvNlpJQlBWSXppdXhFdjBvRWFTYllkQTdpWlZjZWprbW5pc0IwWmkx?=
 =?utf-8?B?bkhRUVI5cEp4bU1RdkRaMmkvSFkwTGtHYkE0ZVJoTytOTTgwSWVrempIYXVI?=
 =?utf-8?B?K3E1TUdURTZSbTlLUW5Qc3FieHlORnhQdUM0dUlCS3FvRi91dDJadkl1R0hE?=
 =?utf-8?B?U0lwVjAyaXVabklmaGhvYXhDZ1VaUVpET3dKNE1FVUNINDAwd3JldVRmMmdq?=
 =?utf-8?B?Lyswb25XV2JyMmpQbzNPMlovSUZRbjY4TzdHcTM3KzRmR3YzOUZKM04veWkz?=
 =?utf-8?B?bkI3LzRPdTRGQngvUms5ZUpjaUpZOFFaS1NtMCtGTW5ZV0oySDNIVU9FVzhk?=
 =?utf-8?B?WHBMc1pEQWhzdFhDeUpZMVQwc1hhTE4zRGVZaklaYi9LdVJtclFJL0ppNFYx?=
 =?utf-8?B?amswNTllaXVtUnZBcCs5aUxDNkNDUS9ndWM3VWZzYjRnWnZNM2MweGtXSmV0?=
 =?utf-8?B?VTFVZkJ3bGYwQkpQZXQya05RRndva3VJQUhZM2hzaXJPRExKTndMSldwMk1w?=
 =?utf-8?B?Rjc4eVpHa3c2YWN6TkpOcUk0Uk9LdUVxR21vQVI5MmZVTEZiNWQvemRPZzJR?=
 =?utf-8?Q?vK18IHra0UbG2z7Gka6dfXnR/?=
Content-ID: <210F10C4E4B1384EA40528F9DC07D7EB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6de2ba-219f-4b07-925a-08da7c81c66e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 16:43:24.7482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PzuQKHcogdDJwpGLOxXBy29J4+4FUMWubfNL05XX5vRvlXzLClYllQlUVGSpokzX8bhFuaug1fU/aI/KsH34CgzxkebPVhnc7ZoiASSe7BY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_094344_452545_12AC016E 
X-CRM114-Status: GOOD (  15.19  )
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

On 12/08/2022 17:38, Rob Herring wrote:
>>> No, the common property 'cd-debounce-delay-ms' should be used instead.
>>
>> So it's a case of "what's in the dts is wrong so it needs to change"?
> 
> Yes.
> 
>> For the future, where is the line drawn between "don't break the dts"
>> & "don't use bad properties"?
> 
> Depends...
> 
>> Only if the property has consumers?
>> I don't mind, just want to get it right next time ;)
> 
> In this case, there shouldn't be any compatibility issues because the
> mmc core has supported the common property longer than the dts
> existed. If that was not the case, then we'd probably be stuck with
> the property in the dts file. That still depends on usage in the
> kernel or elsewhere, in dts files, stability of the platform support,
> etc.

Cool, thanks Rob!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
