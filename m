Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE64C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BC9eYtXuMElrielFER4fUolhoiPNlt0M99OXQnXMMg=; b=v8jgNC9EvQdG7w
	19jiOJVUPfYZqDuv9GMjiterrCVKIlAZ2G67dcu6jNL/RBfeMzQF2RR0DSbGaz8iJX7a2KR0+dGd2
	XJaOfVCksZ7/YUA+QwgCN3RDHsDnkRJHFcmJOvJOboV8HsgMCNWNTKoc1CNgzILK1853CIRIHbwrH
	UcvnqYxjAn4I1IQUHEGDjmUXXMfeAvo67h+r9RgWyZFXJZXa3uvKY6hE1xUXRaQEZE2358EjVlTET
	1cJrUG7nF8Rm+MscVk6gcRz8aeVfaiFZZ6pai55M7dxgjmJJo+tywz7aMCGM3y3kMQgmTJxt4U++S
	rl7NeEcifM0kR3cqA7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWUG-00A1Io-6U; Fri, 12 Aug 2022 15:22:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWUC-00A1FA-4c
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 15:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660317728; x=1691853728;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=6dWvXEJf5PD2Yt4D9hDV9zt1ErRHZm3lJ2yzNN0rO/A=;
  b=PQJL4OB5ja3DJ+ymyxG0XrLwj2d3OlLyCZB9negkX4xbqcI7zgUf2OfI
   o0nYQLz1TvqUF81jp/j3klG0Bs2MgdFEJD/WyLpLK4cyf/wqV9sS7/YGl
   2nr67XpLMv/VvLF1fWrJ0DP0pIxMdvk7frADoeYi0t8zGnBJIN4mZUvIH
   KfWSgqKP07G6oC2/ByaozGxZKdHpexz3ds/8LKp8adkIOARE717sgfIc/
   0S0RN1qo+S0/jRQzuRdixAF2h0Uzml4t/8RXn6I7pTAn1jSMcmpVhqBD9
   BavMQI3pQiICzwsXZvjJKFAo6Z20vflv7/4NFJODXTAxfMrloAi3AlUda
   w==;
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="169052436"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 08:21:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 12 Aug 2022 08:21:53 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 12 Aug 2022 08:21:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7YL7XXyvZKI0ClsTq84Q7R+gy5gN7INZ/8YppQP8zbO5NW34JvJWV8U/4LNYDIj0StRvbUeHNVsJlYPqm2/rTmfY/1AgV+3Z0EayUFAWWs13yoykcg1dT0EjIgRwx4USN4AVzDfpIXh2kPRsX8BZybl+hnLwJeP3lRWbVrBKZ3zOgeIsL3WVNhmn2oVLq0DAvG1E4q4I4h+w44KLG0XgYJ2TewyTyQVkTJAIi+U8Tme2ETqZoCdOLFGf7vYZRuvVkmugwTRzHdqp2Cd3OD+5A2G9MgcyKxeQS/r318ccHblvnWbj7V8VZgapBcKtrW8dpG9b2NHCzT+WLNAoUcwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dWvXEJf5PD2Yt4D9hDV9zt1ErRHZm3lJ2yzNN0rO/A=;
 b=HpOXSOpeOZFzIcOu5r3sDpy0kUTIyuEdtK2OvAu/uSrmX2ZUHMkd2joT1wQVLBJTGBsk7yZSMOrWc/AEFSxC8jlMEFAX9FtNUUFEE2zAYwbsjCiEAG5eZvQRlueOi2dPpr6+e7xMQG3wIAbVo9a9mboYDEkHNiBNKXJloKOsuluRsc3YFiZMSFvfg3iJJJ1Z+nINJh+5WViu5Cv4k9P5tCBTgcpmVhsEssAdCxa94ZboO6z8MECuMtqDwzaVSiimgEJ+lpVzTaIeVWoiwD66tW6BEPQKOPeO4OVQS8bGVUTb5a2M+0ob19T0c9NzT24F+SontcuS2Ds2yRSzjrA7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dWvXEJf5PD2Yt4D9hDV9zt1ErRHZm3lJ2yzNN0rO/A=;
 b=tfrm7puMDQ9BHYSCCG6G28/zaHbr1IuXUB5B5UyGKHW8NaT8xJRKfdOk2aBLCc8tqOPlpbeXN+mKuPzBt6XBaJ+UblCIvACmccfivDKhWokmW9EMIhDlmm6nnybU7PsIX8DXy5h4M/W5LG0+MoNaj16WGzFNpGYRd57NkFf0B+c=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5453.namprd11.prod.outlook.com (2603:10b6:5:398::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 15:21:52 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 15:21:51 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: Don't truncate a hartid in the cbom-block-size
 mismatch warning
Thread-Topic: [PATCH] RISC-V: Don't truncate a hartid in the cbom-block-size
 mismatch warning
Thread-Index: AQHYrldYWiMQH9oVQEapU78+hy9wGq2rYc+A
Date: Fri, 12 Aug 2022 15:21:51 +0000
Message-ID: <1837307d-7dee-d118-6e2a-7063491d23a5@microchip.com>
References: <20220812142400.7186-1-palmer@rivosinc.com>
In-Reply-To: <20220812142400.7186-1-palmer@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8a496587-97f3-4d62-2ff7-08da7c766201
x-ms-traffictypediagnostic: DM4PR11MB5453:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QaNS5TKCERR9YvgA4RBjjnQuaPzYQU0ruTlbra/B8khnR9CjHPPLglkPTCRKPj6ORrg6huunxoNFsHax7SmtTzlOefMMrf4jRY7RUxd7aztePHscuZMvhHcfK8cj4Fgv9IomwY1DirhYpZkuxbx7HO3IC9PtJ9RyY0hLc/ybNv0Jd/NyyoiMVUdChCziZ4es9iWwYzLQS4AyVGT8wXqC0lzzwXgv2vfUg2vObPUCS/FQsw7uIHMw6BO7NvlOSDk0dC6dJeZxTSZMiafmnRVPLk/Mi+LdLIHZMsoh8WPjJRr3e68QR044JpIc5S6vCQ9Q5WfAzo5k9JztB4G3nuc4qTNqKQXIUyxshJjIvf95IUK6yuyC53Ifdaws+HW4iIP4UNSDP88k/yjNdXvo9rfKj7v5t9+C/FqX0rllAXNsz+NcJFGy3JcQlT7tlrj6g6HM8YibLNTmGFPyC8yZMh9/ZXWkxvwKJF/OtU44Kl1rrgkD2MsnKLPmX8EaGRHEl8fgqH+sMr22I4ndXFiX+5Y3uoPMKJZojoqQ7r/gEuRiBZiXnnKWUICcwoy6zV1hMeulQLRoqU4ipWURIIZZBz+UGE0Fp5ve1V3Ty2Z2QsU1S4xA0puGXHitwg+VtAZiTG8nEdehgVZas6YKUI/qv5GC65SunHJ876OlpFqedhnFk8v0e/wOUngputbZCaOHxAaVaGziP0gkArf9JasnzIGoJn2EKZuJhfUgvs7EPEhqesquCWYIESpshP2tdRSc3F3u4Diz0uoW6D5y9K+7+/0L7OfqS289m+JX4seYKt7fk4+eNR5jHf1Iqs9EndWN0kZCIJp7BL40Rht40yZpj7Plz9KwHrc0G2yb29PBHLA4ANCy0XjTj2qNjSCs34LjwAWBUr5LMeUzInA6PD+iusXSyQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(396003)(346002)(136003)(39860400002)(41300700001)(186003)(71200400001)(86362001)(53546011)(6506007)(2616005)(26005)(36756003)(6512007)(83380400001)(110136005)(31696002)(316002)(91956017)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(2906002)(6486002)(5660300002)(478600001)(966005)(8936002)(38070700005)(8676002)(38100700002)(122000001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkYxckFMdU1IekNJY2ZvWUNTajJhMEc4bURUbnc2UWxNRm1XK1d4MlhuVGVE?=
 =?utf-8?B?SVBPK1BNb3hvampJQlZLWGtaMFNFdmxPQWNyekw5VW5obTg3c1FwT3RtNnhN?=
 =?utf-8?B?MzVNeGZIK0hvL1RzcVA4NXhQdkZRUEVueEpMczVZNkQ0bnREVjg0MVYrbTVR?=
 =?utf-8?B?eWZGRU15elNSOG5iKzVVZWNWSHpCSGdoZkhsTXV3MVNSZXlCSWdmdmJJT0ZR?=
 =?utf-8?B?YlRCdlpzM0wxQ3YrS2p4S0JVZUJZa3hDdFAvaEMrNm5Lc05ZLzR6aHZCcGI4?=
 =?utf-8?B?dVEwQ3BWYWtMYU1KQzRyT0cyZ1FXY2lSMjRlRlU1OWxOeXM2TExwdGNCdkhH?=
 =?utf-8?B?SUFUL21QVHRsNjVIUy9qNGtkQjlqUmlxejkzOXY0blBQQnpGS2plWkZ2d29F?=
 =?utf-8?B?S0NkeWFxU0g3S1JRNC95YU5DMW5BVGdMb1ZBdE1kQWpyU2Y5WG5aZUdMakcy?=
 =?utf-8?B?QU9NeTkxL2RrcVA2bG1xMTE3YzgraUpZdXBOTDdNaStnRFJ1L1Y1dE9SUHVk?=
 =?utf-8?B?cjM4TGx1YjdEcmFQMXVSZE9nU0pTbFdTa2Q2NVoxZFZRaGRxZE9tR0p6UG9t?=
 =?utf-8?B?K3MxTDBVeVYzbGlzZXR0MHh0VHBRRnBXNmt1alBxWmdaRW9wcXhUZGhGL1hO?=
 =?utf-8?B?TzVRTmZDbEFoZ0lETnJYS1BCc3d0V0lUS1Q5TkIrQVNwbktxYkc4N2p0NkFP?=
 =?utf-8?B?K3N3b2JPZmxyQnVmL05odVk1RjZrZWFOSGU5Y3F0V2dzS0paaDJnc0ROTldp?=
 =?utf-8?B?Qzh6U1d4b2ozaDZZMnFtVjF4NmxKMnBpWWJ4ZWFXMjY2TWxFQy9uUUR6OEhp?=
 =?utf-8?B?K3VoNm90UnExSmg2bWlyNFNXVHJiNmxjekI1Rk1iNlo1anp6QUlJTUJKOXJq?=
 =?utf-8?B?SHhsRWU5engvMmtRVjJVRnZFNmUzMnlNb0RNbm93U1F2Nk1YUEswRnBFZEty?=
 =?utf-8?B?eC9FUENIMFR5YUo0OFdZazRrUHRTVWJubXBOTkY0YWhoR2RJaTJQVjArNWZu?=
 =?utf-8?B?Q1Z6eTV0eEpJT2JpOCtoWHp1U0t3UEphYUUyK1pxMjBvUysreHJmLy9lMnhX?=
 =?utf-8?B?V2NlSnhySmF2WlZqcmhLZUZUQ3d3VFpnaE5jVlExNjFJa0d2ZTVPWmlKUTdH?=
 =?utf-8?B?OG1DSzF3b05GVGNlSlY2YUpYNkFHbU43bXBSeVg5bXRBRmwyemFScEU4UGZH?=
 =?utf-8?B?Ukt1emxtd3ozRWozb1pzanJjK1NUNXBnL1gyempSMWdHVmN4YW5xUWdjOVFZ?=
 =?utf-8?B?Nyt5ako3ZndVTHE5UnYvaGlaU1JIQkNCVm16dm5NZkd1c05zQk1XSWNqcmR5?=
 =?utf-8?B?VGxDbjdaZXNVQ2NUckNjaHJmek9wcnU5d1phM3NOTTZpVUJTL21ncGtVankr?=
 =?utf-8?B?aGpwZHowVUg2TFhONEdtckVLZ3FUOXc5Rm82SWtCT2NvbGllcC9IRVFJUGxR?=
 =?utf-8?B?ZUlVRjBnSHFMQUFHYVBwSWN6SzIwcGF5K2lQa2xPYlFuOFVCOERRaE5oM2VO?=
 =?utf-8?B?L3liOWNKWjNFTUQ4cERXOWJhZjJ4blhLQW5DWXQxd01DciszMTZBK0EzTjhD?=
 =?utf-8?B?VFZSZHNKWEVHVVpFRDM3VklqdzZPUUR0elNLN1R4ZlE1d1Y3STRmMStoa0Fk?=
 =?utf-8?B?bTNENnBnZnRqT3RoOGQ2L3o0cDdDMGpzZHRqdllRckxMYnJTOEZBdUMzVS9n?=
 =?utf-8?B?Y3lXYkw1Q0dtOTNtNEpFUFBkdktHdDFOcVArb0tPbUoycGwxYWVDYldsQTRv?=
 =?utf-8?B?Q1VPSytSTDdmOCsrd0NjNFZpTTV0eXRvM1U1UFN3Z0xZR0ZSa2dKNE1TNFNa?=
 =?utf-8?B?QkMzeFh1aDlIOWVGQnI2K0RReHl6VG9PTVVTU3F5VTk3NlFCY0FkbklEeUJM?=
 =?utf-8?B?RlhZTUZtQ0EzSkFYSlAvMCs3V1RYTkpCTzFQSEY2Q1NWalJ0eXFNUVlYTnVo?=
 =?utf-8?B?OUlYYTJnYVZGVGtsdnZGMmU3SnpsYzZGRUZvcDJoUm9ZcFZVeXJEYmpreTNw?=
 =?utf-8?B?dVNwMTZpWVhlL2llZTM1UWl6bG8rT0p0Q2Z2elF4OE5Lc1JYdGx5ZldsRUVl?=
 =?utf-8?B?MGdRcCtMN0lWcE5aMHZlK2hVZWNJdnpXSWxxRTNtVzBjQ1lnVWZuc2FubzN4?=
 =?utf-8?Q?0mIz33TA86Sx2HPTobJaNr+oE?=
Content-ID: <716D6E0120463044918EB8F0D602E818@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a496587-97f3-4d62-2ff7-08da7c766201
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 15:21:51.8420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4aZGl6C7o9KcoWR0I/cpPTXfnGS4ccgRCKIibDLoorLpddXrbNVbkefUcyjJzv3LvEATLsJxf3pts2tfMrLxDCR2QXf1bve3cCCzYk3BRkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_082208_562507_502E72E9 
X-CRM114-Status: GOOD (  17.63  )
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

On 12/08/2022 15:24, Palmer Dabbelt wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> I forgot to update this when sorting out the 64-bit hartid code.

As much as to test your script as anything else & with cbom_hartid
initialised:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks. 
> 
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index cd2225304c82..61a4337cf7b1 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -83,8 +83,7 @@ void riscv_init_cbom_blocksize(void)
>         u32 val;
> 
>         for_each_of_cpu_node(node) {
> -               unsigned long hartid;
> -               int cbom_hartid;
> +               unsigned long hartid, cbom_hartid;
> 
>                 ret = riscv_of_processor_hartid(node, &hartid);
>                 if (ret)
> @@ -103,7 +102,7 @@ void riscv_init_cbom_blocksize(void)
>                         cbom_hartid = hartid;
>                 } else {
>                         if (riscv_cbom_block_size != val)
> -                               pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> +                               pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
>                                         cbom_hartid, hartid);
>                 }
>         }
> --
> 2.34.1
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
