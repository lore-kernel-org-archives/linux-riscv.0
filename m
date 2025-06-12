Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B15C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfpGzAVwY70dTC6F+FQWfqjqAhxmbI/Sgyzc8Ed/uTs=; b=XQu4b7TYq33kgE
	PNGFS6krvMfXF1KS7IJEOEt7TdK2YMew7VJAAy6bhB4QV7t2QCn/yrL+fb4nbSaX07nBX9u2LsUUt
	usw8T00g5nW94Yn2l6aVNcuI7iQqMs9o+qLkeQC/OD6wTxtDheVs9HUYKXgRltsKgY1iETl7nykRP
	bOEg+rBtIZC6EbyPe9BFIK7OTRzqx25sISjPrcgtxm8DNQhO62w0x/Gc1WcwMqy2RM6ZXsuLRCfdz
	7H+cZNZF/9cz4haMZxMDvPUn0go13X/eMBLYuogl9CsdH+b76F5ZgLn64Apf1ibuB6BHMGqcsdzdq
	FDZ3RkDt+eBPMcVEuwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpS-0000000EHOY-2DC1;
	Thu, 12 Jun 2025 19:43:14 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj4l-0000000De1S-1FKf
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 14:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm5cWy4dTSGiNX69FKVSL6mZ6FT4cuDpMNxC8aSAyvyuUCcdBhCLczC3jS1iXWwFFH9hWox01s4We7QehTeYVq3zmopArjCglPdltALon3+WtMEppFh55kr1d62vOaWAYm9Xaj1zzUf3H/3JMrNz7z7mfYgh4DcGB5dt2rtFQ2uoiGarrTOf/bGOWQA/uW8i51bVfl/JuR9JyTHKv1bwerCEiH1gJYVS3RX4dNfYAN3Bw4X9P/oNkUPn6Lfh3E+NBtpIrrwcTRVwnx8ZRdVwvdGErLm0lNpGktv5hqSWRvRWV0G5AOd6Puh+r06ZR3D5TmVP95Qmi/xueBibodMCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnJKS+ybQvf3IOEib2d/1cmb86W36BqY9S9Ybjkg6v8=;
 b=hO/ZdOROZF02Wb4RwsvMXcuIS5psJBAj458BUc+R46/HE7lRMf26qhXbnvKGeMGDFY48dg19Qgkm6Eji4F6jOb34fvB9PRw/k7bDcfhWuRw7U00gvAdKZRTHcJT64jO4cVhzw82Tq73J7TbaGviBQMAEfofs1zPI5mnKAZ1k0wd+57xmze/Gek3EgDtMyNLrAnfgUSDcq3Wn9QZI+QuGAvgT6RHSYO+G09PSGKVZa1b9kU3zFjCFIavTKFh2Sys7b8U5xs7yFgtISMVSztWExOBdiounUbRDdU5Qqx0uaZ9KBPtYyliHZ5O5/cV2pRWy++f4rDPVmWKPRdFCPdlX/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnJKS+ybQvf3IOEib2d/1cmb86W36BqY9S9Ybjkg6v8=;
 b=AA/tt+qoCGmctV243K2HOqSO4KNSCE2tPbr/7A5t7GXvLat6zJCpvdmqBvsrXRNRsn1PbURwRSgmEeGv8QJcz2gp6udzr/VRR7eAa1Djdyc3Xf+FvY/QIv5Y0itYTOm5fOpepf7n3Xi9Q/9rELUf5KC73CcWUokYI6risGVFqqo=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by DB8PR09MB3817.eurprd09.prod.outlook.com (2603:10a6:10:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Thu, 12 Jun
 2025 14:38:36 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%6]) with mapi id 15.20.8792.039; Thu, 12 Jun 2025
 14:38:36 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
	<sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
	<rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Thread-Topic: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Thread-Index: AQHb2e9dx3+lqnXWh06WW4bwNfR8k7P/gQcAgAAY69Q=
Date: Thu, 12 Jun 2025 14:38:35 +0000
Message-ID: <AS2PR09MB6296B52C0B28C0ACF9D3D5E49474A@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <87ecvpru11.ffs@tglx>
In-Reply-To: <87ecvpru11.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|DB8PR09MB3817:EE_
x-ms-office365-filtering-correlation-id: eb9ffc85-555f-49ef-220d-08dda9bed051
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?YKv58VlC5SjALnTgJxpvRf9uIwWerJZkHxtUNlfQMF2PEFiVGhkpcXEr2p?=
 =?iso-8859-1?Q?SMU9Yn4mf2ha4B8QxwoE0dLzyiCjhLRgYOOIEKrc4zLybmp+WC81b3Pugf?=
 =?iso-8859-1?Q?SHN1GaZwxGL4T+C+sAvzaGGdcDYsmmDuVkpWfnbCGb+OSgN2jN2vr6CeEl?=
 =?iso-8859-1?Q?chHNd3k6RbszAJKOlcjXZ0vSYTQc6KYwFapfW7qGKRfGn0FlLiDCcfm2wX?=
 =?iso-8859-1?Q?4rEjtSopVY+SDWOKz4J0bXdadidnmnagrMdV3CuFEVAnYWzhjqaEu7X4Bm?=
 =?iso-8859-1?Q?KMR/uT11eYSZ4qgcEroK3IoQLZUkescqDj0fqDdME/nruBg7sIWopnxezh?=
 =?iso-8859-1?Q?N5Dues+T7xbLJu5HqNzCg5eKW9ij6fY99YL2pW4gPzjRd5bcTLapYF69L0?=
 =?iso-8859-1?Q?77rv0E4iLQGkaDtwuDckwHf86btprmMiBhQu6Y1Mhzpi7L3/0u5ng9ytwm?=
 =?iso-8859-1?Q?W2ZhfTrbXasbSogSgYbKzv/OP+O4ou6gKd1oyaUAFzclVYt4k3EhaLNYDq?=
 =?iso-8859-1?Q?oIB9q1hyXRrNHXqD0eRA0y9DYiO/kvjmxeliAmEoGHrHY9dki9BpFGljkr?=
 =?iso-8859-1?Q?iHCnR0pOGi+WUjxrfV1NS8GiOs8+gQM1U6GfLuFBMC7vVjOkHj97sIVyQm?=
 =?iso-8859-1?Q?vh8eEaw6FPQulSNoFKHvxcUU1M3at5ppKrjF1BGIg+kHhMGuW4eNyb7Q7F?=
 =?iso-8859-1?Q?IynwqzkamtjjKo9l6oToeyPOktqozjjbgfDRleai0PPD/lNeuen2Cl+6/r?=
 =?iso-8859-1?Q?YrA6Z1RJAV1rldMrbQskQcbBt5tUs0lBdiGJT7i37jfcSF2gM2GI0tInni?=
 =?iso-8859-1?Q?+hi404tG7WH8Qw8FGLaPCWkryWGuLHJ/ayBVh/u5E/weH8zT3F9wJdHp4n?=
 =?iso-8859-1?Q?2aq+rFVfYxLLmhRDg+RItiulXBwI6CHXeNgunqsBlup3gcTDnoWYjfFLYr?=
 =?iso-8859-1?Q?2vy6INEPLgOI59MflHbgrmsRR++tiw7vMF24RR7AJgxBW1Bg7Y3tLuKeRH?=
 =?iso-8859-1?Q?+MTTIPjei6akDGK1R5yujWO8936U3Hm234Zxxn/IU+tgjCEreNp71MVwtC?=
 =?iso-8859-1?Q?kkuC5ZSsLgal3Zt+xHdOIhvW1BY8m/yHY1SVpxpeHic4lCwCu+GZ6ve6pq?=
 =?iso-8859-1?Q?k8fJad70YQOtd3pbZe0To2Te8eR/g6J0MHl5R8gDgDGDbIFR9NpNuMc7YN?=
 =?iso-8859-1?Q?BDaLfFvEv1f3+agcngTBgmBEOJeRKJmuK3HT62DDJnH1lmi0xakNYg/+1J?=
 =?iso-8859-1?Q?Sgs5iGFX8+2ceRgiAGhS0B6dBLUltXgSRiVS2c+4f5NgX2wJVdx0VW3x7d?=
 =?iso-8859-1?Q?fyJ5riKNzLZKqNrKgvkUwcel0ski9ZwcU4Ydl0fzHRnvVlnCOHyyyfQVEU?=
 =?iso-8859-1?Q?m8yzbMt6e92Vnocw6lXn+a0Ut6pWT7pp23FyfITmXCno7xotenku9SPqud?=
 =?iso-8859-1?Q?iazIFyy815j3zngv0dJZSiUxDSaBbTDB9+6inN7ohjQWjRoQwSaSbkLZBI?=
 =?iso-8859-1?Q?mN6+zaexoQIA+eihAJV0x6Na43Dfp3izJAiNmHxrqmb46PwuKYhI8QTj9t?=
 =?iso-8859-1?Q?FQEvkzM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?cty5tFu4Qn6QWe9OspZFdqIRmbl4my4UK36pt/V/6ugVndE+mHMbxEDHmx?=
 =?iso-8859-1?Q?TuRu+5XL5WalRH56FvjqBsqRtK+t/gzU+PbNY0xJlFIDzaOGlss1sWmYw1?=
 =?iso-8859-1?Q?fzIxugKF49wsjaY8AzdmLu84y5WnM3AoNkFL+susRqmkSoDzRcfhbx4/HX?=
 =?iso-8859-1?Q?3x7q03l1zNp6/NysYShkEGPBFimmhvHjobwydMJWvaTLaW3jZy1LfvMB0Y?=
 =?iso-8859-1?Q?Wx6B9QXUob7GRlqS6n7wp+S3Ljw5EMvScMWTrfv6KIrOQ38wCDLCBrgKHc?=
 =?iso-8859-1?Q?53yUvh7vrns+lK1vacKuIM58I5rsRLKf/mY9RJLUhwr8N6lLjopXRLTMy1?=
 =?iso-8859-1?Q?VUJb6h/y7ObGZkDSqUN0Q1AGUjExDF61cqstbBOTbyp3iT2Cj5ot1WW/c3?=
 =?iso-8859-1?Q?TawT7tm5DywLqvZVflxUM52IxlNneF5DWQAhVzZu8kt0wRQxOA9hOih656?=
 =?iso-8859-1?Q?A6K1aZe1qFFo9IMKVWyfRO0/obsAfHwN5vTttCCs3KyeuMtHeGuaNA+CtP?=
 =?iso-8859-1?Q?Z2qCcjYqcCvASHfHQxcUtFha2dHwctXAbSmnTip8hdksLbYu/TmImDzqW2?=
 =?iso-8859-1?Q?3Wn5mLIIy98x3+pkr5swVf4lKYBnM6WgRsUtHSgqOSC3znNMWz0t6ZYgNN?=
 =?iso-8859-1?Q?WVS/fAXmJYZUHBEI1vzj/JP0/8nPiAUgZ3haAPzKCVxFkN1kwUiA2FcadF?=
 =?iso-8859-1?Q?BxHivSV7ziG8soauh13rdcCOqCawWb6mHRRXYMcDr42PtM9q1DEK2M3YiR?=
 =?iso-8859-1?Q?aF7jI+Q+VzdcM8TQA7OlTo8NR9IWAk4/0WEqI/iNlgty3xmuHmU2F/QIo1?=
 =?iso-8859-1?Q?ZlS04K77vBU8OD77IGxvgofLR1XZrYviPG3UONn+4ttAcjG5BjaDwacviF?=
 =?iso-8859-1?Q?YMTxiF1sdqAvBelHDfsJerDRo+N0sAu3sJ+y9QoRwKG/bJscPy06/+bJtr?=
 =?iso-8859-1?Q?lOQU/VIqiFXYffcA66q+RSLJxqkpBHgvBwG9NZV8R0LbiT74QlI+e5KTSv?=
 =?iso-8859-1?Q?fH5WCAx9EloniqLghg3oJaaNRVi0byyXvX7dnPC5amVEStTurmRHpuiE63?=
 =?iso-8859-1?Q?tGIoAccrwZ8YLRoQ3DyRhejThrsSJj2lj86Oo826AJM1uWtNie/c5iSqbc?=
 =?iso-8859-1?Q?LF/NlXUHtoXev7zng8scBCeIUnwD+6ReasS1VMB6p8KIlRWYMtRQBZXDFP?=
 =?iso-8859-1?Q?brAh4n4iAaYGRPQbvRjEESMi8MMdaZm8TAxsiH2V0Bq3A70RxjBSAGK7ev?=
 =?iso-8859-1?Q?YNro92cgPcA3OLu6LDBTkumxB1vy6qiKhTiX7wJD3WVbHLA+hArFK0gI4I?=
 =?iso-8859-1?Q?SSQ23zSXTm3T4OauopC565uPUFnuVHtm/o72OBd+4FaUa94n2O8a0Nz0p4?=
 =?iso-8859-1?Q?O2rpxtmk7WgNfZmb7QRQTIOBQf91TdMnKTZFy0/ziEwWE9H5bKRauwExgn?=
 =?iso-8859-1?Q?gNPB1b5TfBzKl4UuvuR3temM3lFjT2NEz2eJ5Lpg/2kX7J377AxNwrTFGu?=
 =?iso-8859-1?Q?FKtCAKnwXHpfrOBkOG6T3AbmWe+hDrY68zPd2Wrmfe5OOcRMFTHoNVGzHb?=
 =?iso-8859-1?Q?H6Va6ny2A5nTocJMSywt56EgReRB361AjCEARuvnS6OEfTI9I58roj2Hja?=
 =?iso-8859-1?Q?R1qC6QvIflYA2NqE6DHG34BWn/En+6MTHl?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9ffc85-555f-49ef-220d-08dda9bed051
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 14:38:36.0145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Shz9jOvHuxnLbvt9GnALMXJAgUC/koJ55t1VSRNYsTciENY1z8+jwhrL6DkIM2AoPo9xULMOR4/E1RYQEjv7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB3817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_073843_498596_769D85B3 
X-CRM114-Status: UNSURE (   8.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>> +config ACLINT_SSWI
>> +=A0=A0=A0=A0 bool
>> +
>> +config MIPS_P8700_ACLINT_SSWI
>> +=A0=A0=A0=A0 bool "MIPS P8700 ACLINT S-mode IPI Interrupt Controller"
>> +=A0=A0=A0=A0 depends on RISCV
>> +=A0=A0=A0=A0 depends on SMP
>> +=A0=A0=A0=A0 select IRQ_DOMAIN_HIERARCHY
>> +=A0=A0=A0=A0 select GENERIC_IRQ_IPI_MUX
>> +=A0=A0=A0=A0 select ACLINT_SSWI
>> +=A0=A0=A0=A0 help
>> +=A0=A0=A0=A0=A0=A0 This enables support for MIPS P8700 specific ACLINT =
SSWI device
>> +
>> +=A0=A0=A0=A0=A0=A0 If you don't know what to do here, say Y.
>> +
>>=A0 config THEAD_C900_ACLINT_SSWI
>>=A0=A0=A0=A0=A0=A0=A0 bool "THEAD C9XX ACLINT S-mode IPI Interrupt Contro=
ller"
>>=A0=A0=A0=A0=A0=A0=A0 depends on RISCV
>>=A0=A0=A0=A0=A0=A0=A0 depends on SMP
>>=A0=A0=A0=A0=A0=A0=A0 select IRQ_DOMAIN_HIERARCHY
>>=A0=A0=A0=A0=A0=A0=A0 select GENERIC_IRQ_IPI_MUX
>> +=A0=A0=A0=A0 select ACLINT_SSWI
>>=A0=A0=A0=A0=A0=A0=A0 help
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 This enables support for T-HEAD specific ACLI=
NT SSWI device
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0 support.
>
>That's just exactly the same thing twice for no value. Just rename it to
>ACLINT_SSWI and have a list of supported chips in the help text.
>
>The only issue with the rename is, that oldconfig will drop the then
>non-existing THEAD_C900_ACLINT_SSWI entry in the previous config. That's
>not the end of the world and if really desired this can be solved by
>having:
>
>config ACLINT_SSWI
>=A0=A0=A0=A0=A0=A0=A0 bool "RISCV ACLINT ...."
>=A0=A0=A0=A0=A0=A0=A0 depends on RISCV
>=A0=A0=A0=A0=A0=A0=A0 depends on SMP
>=A0=A0=A0=A0=A0=A0=A0 select IRQ_DOMAIN_HIERARCHY
>=A0=A0=A0=A0=A0=A0=A0 select GENERIC_IRQ_IPI_MUX
>=A0=A0=A0=A0=A0=A0=A0 select ACLINT_SSWI
>=A0=A0=A0=A0=A0=A0=A0 help
>=A0=A0=A0=A0=A0=A0=A0=A0=A0 This enables support for ACLINT SSWI device on=
 THEAD C9XX and
>=A0=A0=A0=A0=A0=A0=A0=A0=A0 MIPS P8700 devices.
>
># Backwards compatibility so oldconfig does not drop it.
>config THEAD_C900_ACLINT_SSWI
>=A0=A0=A0=A0=A0=A0=A0 select ACLINT_SSWI

Thanks, doing this. Indeed it is more compact and clean.
Submitting v3
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
