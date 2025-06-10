Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2F3C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmaVz0aIg1e5c05+yufPKu8TR35iP2JUSbZE+OTztO8=; b=dzbAjWYvcLtrBV
	rMR6hcPWHb1Z+mDBpRyhoMTYGn96mPybp3Dr+0q6binFbBGd8sx6B8j5BwBRq+OpISVudFNLyMQQe
	FyfAjM/lsl/mBiJt5eFVmk0EaBYnraZjjBES3N+y7ucVb40H4YtD0rBIywTQJkdqTOBO4hcEUdxzi
	US+reiOLvlPq3alkbANg0UbVkqHqUhnbTGllsuwHlSuqxQ4DUg2GlUd9hfRoeEebbwlZuNVYZXygp
	0Klax8mNwnbKcBEdm2n0fzWEbcXdUF7tkY/aYU0hKFWiI8IpqEACgd+sT9PwkXI+1o/I1YGdP/PHI
	82I86LaOrISrP8oI1Fsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwpa-00000006bxJ-1b96;
	Tue, 10 Jun 2025 11:07:50 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwUu-00000006WjR-2nnV
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:46:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUZOiePJ1mfhx86pFl4oSkqyxVMB6TxN1muQbYaM0NPOuOMWXRr/NmqtZyJm/Hd1k9Jn/hxE6UQ4rJQypf70Gf3NfhJJQ19lfa/rS7JvnHVYNVtNmdQfSuj9fC3+BlCUMjXe5+LJmPrmMjlu/M1SJ2nKxljFrbKRr1UUV3+Uy79d1UF5guu95luHFMuvRRUG+hOVZDDpWcwZKT8Dw2paylA55oOqho4cG6s+fP5TM2S9tSlM+AvFQebsdVDYnb2qXuZyATopgPd9sUzW5fcRHoTagdRhRxjZDwo1gSEPvuR+ddg4gKLDNAkeg1CmvA8oZ08SQheGoEXjK0/b+E51vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtw+HUu5aMz3hd6YbFmPh/2C77EoJe+9w/0BElDp3V0=;
 b=bBBEzIQSqvDoAd39j5nsyVDnk3ODjljS8VoT+RcHrpvExKob2HHSmQw/Yi8LN3gZwcHUHFCJNxUt4qdHnUL7E8QBecevHH26X5z+Suu9pzmMdhrRSVahnNGkjMAEkQoXXRDTI3AaRSmdmof9vefmOPSaNJ4xjQbWSK3tyfPSMTs/MekJfuWuKI1+eyoQ3CmEl/VS1q1WZhz3UQmY1Xz9c/ke409yQ6BadfZjjY/KpimZOtGg7QcDW6UCAlgk8i2/aKP0FWZVx38JvzEkFG2PCm111zpfrIOCjyvyMVjc6sjom4wAxmZGy3qthNRBpACQdtHpyPNl7sGSx/GCaKr81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtw+HUu5aMz3hd6YbFmPh/2C77EoJe+9w/0BElDp3V0=;
 b=OOw1xfAjHurbfWWGQ8vzrmC6S6Nz76/iJU2ZlumEe0OD1bRAjAwtPrMIRSIDTJ/NYFDO+b6hduxwAQT7SxwAWFkBAYym/ezMEYApHTUEeCYB4u82hlZKIPl7NOA5phifp/wQYWj5mFTC1SU0bY3z1bCo3tWp7ZjdrxSwzHhilFs=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by AS2PR09MB6341.eurprd09.prod.outlook.com (2603:10a6:20b:57b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 10:46:24 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%6]) with mapi id 15.20.8792.039; Tue, 10 Jun 2025
 10:46:23 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
	<unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, "Rafael J .
 Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Thread-Topic: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Thread-Index: AQHb2e9dx3+lqnXWh06WW4bwNfR8k7P8K5cAgAAIhUo=
Date: Tue, 10 Jun 2025 10:46:23 +0000
Message-ID: <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
In-Reply-To: <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|AS2PR09MB6341:EE_
x-ms-office365-filtering-correlation-id: 19472622-1380-43a7-572d-08dda80c0b41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?zYw0y8MBbz+ZG8eid3i7DEOLLTIyroAU9FW3PQaFDAlICGJxymeBdvkw/K?=
 =?iso-8859-1?Q?WWK87CnGSVUPJ9TqTJG2R74h1xF3Gyjla8FFifMJck1BUnay4yorj+gg8N?=
 =?iso-8859-1?Q?bEt3dv/yKBYpQsGXcqROMSrTqN1P0xE4jX1a55jTwxSA9UO+2nseYpaV44?=
 =?iso-8859-1?Q?uLcSFnGcbU55LbH8/adT5OefCxY13tHw/v+7uc4bMAw6LM9rmS0dgOvKpv?=
 =?iso-8859-1?Q?cnN87AhFslkd6EfQk8n5Z3dHtErt8CHupTpGLH7gRsr8NGlrLFs7MAsmIg?=
 =?iso-8859-1?Q?D2Ug3TOFkhkAm2GOn1+pQQgoATbRZrcsc/sUjpOPYEDUoIDTkx8eQfIFA2?=
 =?iso-8859-1?Q?GCDrE+9ZvdcqPauEQBxX2PMbRoUlwcNH/RaPGYfXRKaA0RIHntNgQGTtE1?=
 =?iso-8859-1?Q?jmWiTmqhA0gG2zZ6SUGdFeGiN57rjcjLVZeBjBssgu87iwGEycV9JxgxTv?=
 =?iso-8859-1?Q?eWRODIi8F5nYUtG6FbFlG5dSOVcARFPBhITSs7op83sUcsv2nlDid5IX7z?=
 =?iso-8859-1?Q?NWDOSTTX/KJVhcrU2TNU+SbtU8rB/tpJT5vG8dkOb0MuDEgSc8czcz+TPu?=
 =?iso-8859-1?Q?2XA/NOVMKfCCrZP/USKn1L/9OGGVZa/APf3jL974cy0WY7jxGV0qAAz7Vh?=
 =?iso-8859-1?Q?ZmutwRUylDwaXdo77PNHxDYw2KVTGKtee+pHr4aCbtpHQ6cM8Ouo9liX9F?=
 =?iso-8859-1?Q?Hc11CfU44q3ZCfBchX42LOt+YLbUkvJo7tu6oIwLa6yNrIqYRGV8SC8ijw?=
 =?iso-8859-1?Q?Jlffu6dQdH10xcA6rzuAiVrp5ApBsK5Jos9YLlADm5jZJsfg5MZ7R4dPiJ?=
 =?iso-8859-1?Q?mNMyzIrBtAQDT2Pb9o3nEmyCMY0BxCo5h0+mg51O15OtszAHOHpp/hv8c9?=
 =?iso-8859-1?Q?7Rd9pC8ZP2p9uGtkq9pe07lr2ka6wdXTCU+xonTevVq0TGE23f8r3DDfCM?=
 =?iso-8859-1?Q?zFoy2zZH2JG7tCmOUk9+dXpyyGsZxTcsSJbfWtcLZq7hlI4AFKWAFPv8no?=
 =?iso-8859-1?Q?Y9rpYkGkLN+bo5v907gzWEMRj8aupEcFWrYWROrQrgnVFm+PlQ7Kt+0B/v?=
 =?iso-8859-1?Q?LXvFTLf2Qcx8TgcNMgaX2IviS+d27Mp5BJop85w4CZULsHQf6gyogAyFih?=
 =?iso-8859-1?Q?pDLHkU0jy0bqmtXPfCKKe+KI30husv0exBIii2B6wQXitTeWQ0BLcuBZKx?=
 =?iso-8859-1?Q?wcXm9giELafNNf3/BNb8HeY3Obnpex7v5pYBJclCm0hJSn2cwVpRshpU2n?=
 =?iso-8859-1?Q?vp7mU2yI6zDfTo0rClrz5v16nUaihce+HCoqhhMjcrmZHYXyhqLXyRYFMX?=
 =?iso-8859-1?Q?0vZBaN4RtN60Tf/erOzasgPHvcoteAUjw90IOfeRIVAsExHmbE6rajO3ao?=
 =?iso-8859-1?Q?TUTT76T1vcYhE0xpP4AeQGgZyvjq/eMrsivgPJPfghsHfm+QKyeGq0bpPx?=
 =?iso-8859-1?Q?hqTN2pC10wp19rvyfPxZk7BhrblXcjqw4WSHr0g4/7scZD+UVxhUA/9orS?=
 =?iso-8859-1?Q?ISB1AdUAgHdNln2HVxyUFGF2/YcgGVdWBhHlBXqU6ljsf6y5jWRdIKRSiu?=
 =?iso-8859-1?Q?BvHeswY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IScCwTFYjKSknx4vuDc5wtGgNiIxfp5mgGZ7VYYYOJoCboTXnhwVzBeUf0?=
 =?iso-8859-1?Q?MJ4xXRUUNMrmqf/TghCx1s7oNFo1BHNnHx4vnuZb9VfWDbBsBgy9mes6xN?=
 =?iso-8859-1?Q?568eo9AaWTModDBcJGNhBLRUqA2Iif50+I6kbdQexAiqW2yg7pUG+Q64bo?=
 =?iso-8859-1?Q?eNNfNrYjqdZwXiY27pBS/nLQuQ0WfbwhYAkU7KYj8D8AjE5j9Y1bGyPZZG?=
 =?iso-8859-1?Q?ul1x6hIJb3db3e+372HSmdBBzLRMnqrwHodev2ChTcweBognd1HpLJ9NGq?=
 =?iso-8859-1?Q?gBd2V5xTWyyVAvpBL91IONw+S3VrC0wGHd873Wh7+n9Lha3B/vjpdA56qx?=
 =?iso-8859-1?Q?hbOTz+RN2Q5XP3QRkNvNpaloiphvCnqB8PcFbHKroGHpzpOst3ZrbBtQkk?=
 =?iso-8859-1?Q?QlSscZ0ipuWxt8JfOiD0JmDg01Rvn0rj7gWaYKvHlKafBRTPDMQjROwuYQ?=
 =?iso-8859-1?Q?WR41D0J+gPQxFmRE/xJBgkqNjW8Jw1VLu+DcGv13iKm2Cpp142K1oezwy4?=
 =?iso-8859-1?Q?NKHgUt64Nl7fGp5JMy5SAuMS7uiLm9OMO1aHmwNW0P75xAisw5RtvlKGzc?=
 =?iso-8859-1?Q?1x05oHGH7kZNuJe3dZT6Ip7YXAZkOcNh15exDOqNEEPW0Y19hmHJfkGPTb?=
 =?iso-8859-1?Q?KgxgEHNkFA4dTm1DMyr9NCVIIoTZ5QzkUZRyM/RUSZ1Wgvg/rsmf5Ixv7F?=
 =?iso-8859-1?Q?4m4QAFwtE6TxIBjeIX7aU/GOImVHdQpEr0CDXOLdz87YEkh1G0bTeRh26t?=
 =?iso-8859-1?Q?5haS1d3OzFxeWszljjeDkRCVF/WNxSQTBLUo+CkCMSqDQVBOuYXZArp4Fv?=
 =?iso-8859-1?Q?5XveJao6HdrustkI63NK7Eo63kNQKWEWHsKjeM2bOWp0Kk4z7pe+5uBzoY?=
 =?iso-8859-1?Q?8rwleXQhdQeD1c2yjU3E8tPpk00sBsHgcw261KTKgYZRCGE/F9EXIOTslZ?=
 =?iso-8859-1?Q?gKV6ED2TxvYi6RQ6PNAPnZf1an22GEQeBd7YQfaMxFfucfSZmON8PgltWK?=
 =?iso-8859-1?Q?LlmkphSwbWrRA1jW46xc7sA80zRH5HdwZWpsfzPtN7bWM3zVOiziYQr3jl?=
 =?iso-8859-1?Q?IPWPwPlIFWiXV96rt6feDak+EG8l+faaSSKG3sFG5WnGjF5wHkhnWDJA5D?=
 =?iso-8859-1?Q?ULh+WFk8JdSgeTeTKT+ymSN3HUxf0XivRsrhSkIPpBfBbV2roCbQ/hb/XD?=
 =?iso-8859-1?Q?Hwy0+DolGJB2DHjl7dNUM4wzbG/aUhrfWjEE6thazWKfhDAPrZaggk2oFK?=
 =?iso-8859-1?Q?j79bk4R8Jmu1JK2q7m5W1l9zXIFy4L3SfhCFUAFdvuPqUOfausGc/V4hrm?=
 =?iso-8859-1?Q?C4MjxjptNNS7NZLtiGaMVA9aIJhOFFi7B5V1dZJWpJs4W7GlmfwlkmoTTj?=
 =?iso-8859-1?Q?Jy13eya3wONS0I5kK6fSjhLUVQYD1/qSCwxoL9AjW5YfWazeI03p14l1he?=
 =?iso-8859-1?Q?ACPVr2G4q1U7n/MMSOaCNh8DMb6FYIKeFBbOkDXJjnzRXIco1IQ7uOzbVt?=
 =?iso-8859-1?Q?pQDl0t4dit+meknLmfpTl08p6L8MuAXmIeEQj5aMqggxsvLyMaKqGTEjfY?=
 =?iso-8859-1?Q?PY6pLhVfA9LraIuxV3CV2KsBnwpLJoCrV+WNGEoBosbrhJvchOJ38w071r?=
 =?iso-8859-1?Q?3+6fdf1MGCPhfP+HtMe7uLACvjeLwAIEsq?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19472622-1380-43a7-572d-08dda80c0b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 10:46:23.8183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0rKcDCEuKDmPONzJJHFspvuXBM0rQhpy2Ykb1V4j6TjEXEoGAvrt9gMWBUozFixLVhdKmO8T7k615jt830Fb5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR09MB6341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_034628_731478_4466B667 
X-CRM114-Status: UNSURE (   5.84  )
X-CRM114-Notice: Please train this message.
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

>> +#if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
>> +/* generic/MIPS variant */

>I do not think there is a must to add these defines

OK, if there is no objections from others, I'll remove it. To clarify,
we're about removing both #if defined(CONFIG_MIPS_P8700_ACLINT_SSWI)
and #if defined(CONFIG_THEAD_C900_ACLINT_SSWI) ? And, I'll keep logic in Kconfig to select whole .c file if one of variants selected

Thanks, Vladimir
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
