Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBB2C83F0A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hTSQxCOwZhNlhNEfAkDGrDFqErgKWakU/MKapvDKP0w=; b=ukCSjn72l69gVJ
	Gou50Oa0dRC4beFp0tR3Isr9FBmgrbXciKEqfwoSVJ62AUduvDEF7xbDrAbZfzcG2D2iXZ+dhgOWv
	wqMlbdtbDyYpUGNnQlieTnQb0fRDy7qattLc4QeHDR9zc+xW8hp/f/J1wwg1S4YhHDasFMfrfStoL
	tp2+2Cn0UNsMpg3OgcNE0wSmFlkD15zEJjywpIhUx4tGGw4G7PZ8vISvq6zcdmu6lvNCXAli6wVox
	CeqOTsq1wbJkL6Y25Gx7lHCUV5ogzhITa0WPFi2siTjfN9Ax1XmdnsWDYLFP35GMChw42YkxyTC4m
	y+6HA+aOLmDA82ImAQdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXFM-00000009FnV-3DrU;
	Wed, 09 Jul 2025 16:02:12 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVPy-00000008tlN-3ce8
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 14:05:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+9MQmkqYnK+F9TkErUgO7LeGFhTUvAENmwJ4vPnJscpjcGr6bjWS/IjL+98tp9zhGqCby+ltFXYNDFTnltBEy32qFoxS8DwLXwRRqfdD9fmJDxBUNhXY0h5Flgz3VicbrkMxs7Hdk9u4lDzaLX9eyoLCX7iox7kgTw0yof8D9eR+XzNlK01BVSENlPMnC03v+jBTk4pJzCKm8gRQo8oX+udw5qKNZX7ddJCVB0A+0Ap4GPNADV3wJBFltWn5cCRl99D5gIhyPAu4ntG8YgILPI6spAc6LtYO5s055l9taPcyfIJgjSwVI8/bi9WGr6k5G/99KzEMhhvKuLsWk822Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f4xHTHw7kt+dQ7RiavEr+ahy3okla4amEQBGdkpgtt0=;
 b=lARAnikNzwwr4EDjocYwIgv/6ax7VZ2DlrTleWxM6FT2tFDQ7u9Ipn4RWBNrQgrX2CSec5mkF51tbTLhIKUfk55pPqM3PyviKQlr4b/Jrx4A0v/MNv0+iXzizcNLU5WlPiriB2rayQFKD1QvV48m4pOBgvFBfDYaeh97KDOMGNh/f6HuXE3Z3NVUnuKPo2l3xMWsQWrR4UUhEkYz4DIIpJqUtrTcojZFBJo7tQ/IcmbYduzIO8eOf6cI4j/Rhf/Uuo0LJMMD+1Dtp+QQhH5IeERACJqvPKA8qe67TQvaYkF27K+hhcWk3E4wdyhvFRk4Y8qfwjLL3SBfut59ugtYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4xHTHw7kt+dQ7RiavEr+ahy3okla4amEQBGdkpgtt0=;
 b=LW44kW98vOOgyFBjZEX0P0Geikk1t8E6lmXjUKvJbPDfMbKWs2B8jqB92yiz7ziXv2/ROg5/nauh0UeodKpcpUE1dbBlD1w1myOYHnXf31MUgJfm9Sucd5ukYb3uYaNVVtRg1H6Aav0TofyxlpQt5CHVZAWGDzYPKZyeO/PJfK4U5sJsdUMvzoVcWyE/xefGw7J37AlLE0kfxj2VNARkGFZPNW5O1EUP8rcgQV7DRSbVNzvVAMMP91VJnOx7rZaGVNLvTboJXffNHaKjDpRnwqxXANx+f4c1s3TfMY1R/AeDjU0mkl7G9mIr0ZPU5TVoKwyyEfrL88fAuOtLSR2WVA==
Received: from VE1PR09MB3261.eurprd09.prod.outlook.com (2603:10a6:803:11a::20)
 by VI0PR09MB7143.eurprd09.prod.outlook.com (2603:10a6:800:23f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 14:04:52 +0000
Received: from VE1PR09MB3261.eurprd09.prod.outlook.com
 ([fe80::bb1d:4999:85b7:cc11]) by VE1PR09MB3261.eurprd09.prod.outlook.com
 ([fe80::bb1d:4999:85b7:cc11%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 14:04:52 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "ajones@ventanamicro.com" <ajones@ventanamicro.com>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "conor@kernel.org"
	<conor@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"palmer@sifive.com" <palmer@sifive.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "robh@kernel.org" <robh@kernel.org>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Thread-Topic: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Thread-Index: AQHb5dxjaqbHoDAWk0qz9dJPHr4eTrQVK5UAgAADr4CAABUIgIABblaAgAApQACAEw1FgA==
Date: Wed, 9 Jul 2025 14:04:52 +0000
Message-ID: <2859ccc3-49f6-47cb-aff9-62704c2356be@htecgroup.com>
References: <20250627-4830df29795364099432e6ee@orel>
In-Reply-To: <20250627-4830df29795364099432e6ee@orel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR09MB3261:EE_|VI0PR09MB7143:EE_
x-ms-office365-filtering-correlation-id: 34c4623f-3ad7-4241-3b16-08ddbef1931e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bDA5a1JuT3RlNXY2NExZcVc1TnpCZnJ2RWY3RXJBNktqK0Nxakp5TTh1ZVVw?=
 =?utf-8?B?citzRmYwSjVsM3RVb3pIZ2ovNXBTeWt2alhWTVpPRVEzSERyUVdJdjNvdUZs?=
 =?utf-8?B?SnhqampEdHJZSXFwbGc3WUppUXFqMUNNRGIxTE9IbmxlRSthcEV6ZUV5M2F4?=
 =?utf-8?B?b1FHcXB1NDlGM1RiRnlpdTZoMDJaaTdxZ0N1TmVqQ0kvakZLVU9Wa2RxSC8r?=
 =?utf-8?B?d3FRaVpBeS9TWHNOWCtrT0ZZVUZqaTRUL3R2VVJXL3pydnFGUGNBVldHdFQ5?=
 =?utf-8?B?bDR1N1dDeG1XWEhZN1F3MHErbmRYSTFkVXJrNzgramVMNXVHVmVDdDAzYSs2?=
 =?utf-8?B?cVY1R1U2WHBVVkxrYmlwdjdjeENFekFqMTZBVjYxOWFyZDlqaUMyOTljRGxk?=
 =?utf-8?B?SXBXdkNKT3pZZWZiMFoyUlNQbGRTZVBwNjBxbVY2cjRSemtaWHNUaHhHbm5o?=
 =?utf-8?B?VkUyQ041Z3dNdys5RktTck5CZDFSUmZ6NDFlSzFVSVJUV1Z4L25ib1B3R0Fu?=
 =?utf-8?B?OWczenRGdXlIRFZoY1djeE9zdEUvREZvd0pJUnFFQTNkc2tjWHBYaEpRTGRl?=
 =?utf-8?B?N1h2SXE5ME1ERSttNnFMUUR0dnRYYXBxUFh2bDY4VmVucm5iQjZtUWt6WERq?=
 =?utf-8?B?b0ZQSnJpTUFVM2cwcDh6aVBZNmtSbzFLSmUwOUoyTXdPQ29vb052eS9wK2Nt?=
 =?utf-8?B?RFFMUEh1Vm4vWGVPalI1anhhTXVISFVwKzZpbVErOG4zUVBUSkxQRm5PRVVv?=
 =?utf-8?B?TituSmFFMndPNzNkVlpxSi9uVHJuZVdYK1d6SEo2MTZDZHpJd2ppL2gwNFB2?=
 =?utf-8?B?V3Z6dkkzeFNtcC9oT0lrUU1IOWVRWWowUWZtVHRTUzUvbk1WbGtXeGsvZUYw?=
 =?utf-8?B?RGI0S2tRVmgwNVJvS0luMTUvU3gzbGJuMEZELzQ2eU9VTGk1blVFa0NLM1Vj?=
 =?utf-8?B?S3hrbHowVzNYSlR3VHQ1ajNVRWRDMUI0YlQ3M1Y5NXJXaS9yK0p5dExTVndm?=
 =?utf-8?B?L0IzNXEyTGtzZHFLaWtrN2hLREVMQmxMZW5nMi9yTFBiVGRsZzI2cWJrMHl1?=
 =?utf-8?B?YW5aOXQ2aWF6M2RJNVUwNnBScHdpb1F4Y0U2cDA2enJHN01Zdml3bWI5ck9W?=
 =?utf-8?B?QlVDUHZqM2R2Y3lpYUNhR1lFTXRQUHNFd09IWGoyOVJPcGxaQm9OaWRNelBu?=
 =?utf-8?B?WnYxOWswNmU0dmtjWnJ3b1JXQVd1NWpDbStUU1FJTEt4NWpMNGxPQjRWdTJ5?=
 =?utf-8?B?bXZVVGhSSXg4dGkyc0JuamFPc3lGSnNQUDNaR3JET1JUYS9XclQ1QXZuOSto?=
 =?utf-8?B?aVphL2JNYkZWaDMvR3U1L2EyVTIzN0lyam9tQ0pmeDVsQTY5VFBqbzBVUk8w?=
 =?utf-8?B?QTBBcFBSaDFOUDMvZmhydjd6YlF6cERKaVFWR3VlTWk3QlVCcG5jR3haY0xF?=
 =?utf-8?B?VjJDZVpyUXIyMjNsWmo1VSs0R0FjRythWmJGMTdhTzdkdUZDd0crREFTUFhZ?=
 =?utf-8?B?Z1BTVEJYS1Q5dTJrbHBPVHplWXhKMEowUEJJM1RmK0JQeGNZTXozTEVqa3JJ?=
 =?utf-8?B?c0hVUEdweWh5K055ZzVtTk1zWHRjTC9HZFJhdldaYmt1RXdzYUFyN1BsTVlk?=
 =?utf-8?B?OWNWYXAzcFNTUmJVbHFOTkVHeTZjZm14STJ0V3d2UkZSci9FRmtKdE00L2xQ?=
 =?utf-8?B?aEJNa0FRNXE3d0VjN0l5Q29FRW1QSEdHZGtSM3RaU2tIa1pSbzRTQ1lkakVS?=
 =?utf-8?B?STl5SThkVFFvOVk3SXlTR0w3R1NwdmhJWW5wT2xZRXFiRmF0UVFLZEJsVjhs?=
 =?utf-8?B?Q0U0ZDVpYnREb3dqQi9peEVvWDYyalhPRzZhWG96b2tUSUZaNjJmWVFseEd4?=
 =?utf-8?B?R0VZZG9leTJvSmhRVjFzQnRJZU5lZmRjUzZVYllXb0JSMDF6LzRPcXZUUnhS?=
 =?utf-8?B?b21qNExlVkNwS2paQ3d2cnZGMTVWb0Rza0xYWWlFWG1CTU8rMVNmY2Y3d3JD?=
 =?utf-8?B?Yjl6VnorZjZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR09MB3261.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlpRZTZkU2RHaWtrL3IzM2xSWkxPWDFBWitwRjlUeUdCdFBEZEJxbzdPODhM?=
 =?utf-8?B?SzhOT09Rb3FxRmpkd3FIbFNnOXpRMXFjUEpjZWhBUkdZNkw4OWk3K2xEL3lN?=
 =?utf-8?B?VURTbHZ3Z1pFczFHVjNZNTVVaG1QbFRKUDRPZHlYM3dyQ01zeHYxVXBEL3d1?=
 =?utf-8?B?dEh4blU3bmEzaGtSRk1GMElyVk5Ic0haQ3plcGpodWF1eXZKTC9LVS9BRWhH?=
 =?utf-8?B?a21TOFdlb0hRZ29RMjQwRVJkOE03NGR1TjgxZmI4WVJwL1ZRV3pFakVxaGl2?=
 =?utf-8?B?djJCK2RDUjFaSE1mdzArM3ZMbVBNc1dpTVBKOTFLZkFocjRSVmJtc1htRHQ0?=
 =?utf-8?B?ZzNnV0Y5b3VLM1BhbFcyYXNuTk96c01MV3NiWlF0cmlsMkk0TWF3MDdsU0Zv?=
 =?utf-8?B?Z0RhMk5yUTJEclZWa0NHaHdCMVAxK1NCK09iWkE5MmJ3WWFuWVVvU3ZkRmVT?=
 =?utf-8?B?cEJTS1oyNWU0OG81TTRFWXdOWjc5cjBzeGdrTTN3NDFoTlNLbW9EU0lPMUJQ?=
 =?utf-8?B?elNOWXMvMnNLZ0pyYk0vV1JHd2p1SWRtNmNUWkNGWUh1cndrQkhkL0ZKbnFO?=
 =?utf-8?B?NVFRLzNsOGJ4SmFpY3NoWnI2V1BMcThtV0xKTklYbEF0aWJSb082a1A0dHox?=
 =?utf-8?B?WjFyZ0VQdmRSOXNNdDNVNWRxejgxN1Awa0hJUlpOTmN2NFZ4cnJYdnczSG1i?=
 =?utf-8?B?TFNRbGgrVUVMRzJUcFYxYXhFbFlEOHhKQWVYS21zdGRHZHA4ekUzM3dQOHB0?=
 =?utf-8?B?S3RVN1lvcDE3RENHckVaRmt4Z2RPZmU5dHMwVlJuT0xmci9qWkdVTDcxRWtC?=
 =?utf-8?B?YktEUGpPYzAxd0VHRElnZDJ3ZDVjQXB1VVl4ak4rYU9QNkdIdTF5SGw1RTN3?=
 =?utf-8?B?VVl0WE94TWdwTURaeWcyU3dwNS9UWjZ4aFczKzVuQ3BIcXlkL0FNQ0JKZkZD?=
 =?utf-8?B?VXJIc3N5UFY1aVh1WVlRKzZmdGt0TUFRWHZEQU1za3hQc3dtTSs4TUljQlBJ?=
 =?utf-8?B?amV0T1lQYlZpbldJTmt2dW5pMkY3Y05WaW5JTDQ0SjZkT3Z1NjNza0JTOVRR?=
 =?utf-8?B?ekYyREF3V2xYT3RrR3lOTzd4a0VjMFZ0Vnd2M0QwNHRqMmd1Zk9YTGJRb2xt?=
 =?utf-8?B?V3JPNE55bVhKUXB3K2tHVlc2SFVSUkNEN04wMDNUUWwva3dCSnYrUzFkcVN1?=
 =?utf-8?B?cjBsUk93UURZL2pYbWJuN1JwdlNYaWdpbjdBT2lLWGEvSjE1T3JUMCtsZXVB?=
 =?utf-8?B?UXZ4T1FVZXJWYU9NalhEMVhidVU2T0RPVTFWL3RKWVpiZW9lMWQ0Z2ZqMW5D?=
 =?utf-8?B?ZWhNN2hkYW9UeUFxazZrRGtBaENIcUlYRzlub0JRYmxVY3MrLzB1WmxKS3Ew?=
 =?utf-8?B?OTZ3ODZpLzdLVDd3dVZwMWJ0Y3lMdkdlZU1HeWRhQURUbEtoajdGYkZoSFls?=
 =?utf-8?B?Qy8wcVZlSWEzT05FSnU0LzYvbitkT09KeWdMajArV1pLR0pDZ2t0VDV1dUlQ?=
 =?utf-8?B?Rk50S2U0cFlIZzBSZzFCLytLQzBPTThmNTRhenh4dERvc2Z3d0ZSem9HVWhj?=
 =?utf-8?B?YnhQV0F1RHNpV1hNMEdMVWtYYlFkc1liT0ZncDBNcHFiWjRTakcweExFdzZk?=
 =?utf-8?B?SEoydzd4ODZTOFFLelFZTlAwMUZrSGZjRnNESjlNb0pXZWdCZWFQd3M0VjIz?=
 =?utf-8?B?ZVA0VlllQjJQS3BQWURJR0JZbkVoK3JkMUhpNEZieGVNTGtFVFZSbTY5UU9s?=
 =?utf-8?B?OEZtb2tLSmQyZVVLemJBd0xIZmdjOXh0UERKa3I0NkVLbXhCb2doQ21Mb1p1?=
 =?utf-8?B?MWQwd2NGRzV0VEpmTWpIRHVWWUJ2Q25rMEIxbENXTk81Tjhod0IwVkREamcw?=
 =?utf-8?B?MlZCcEpMOWpCbGxCSUNjeTNmR3lIeHQyK250OVVvbXVqZDN6NjBNQW5rYVIv?=
 =?utf-8?B?UmpMb3ducVk2Zm1JTEhCcStGS3FrV2NCUDZzMmZRT1hwV2FxbFFpYU11RTFU?=
 =?utf-8?B?TnFVcTF5cEhYQTZtdjZ6Z044YXFNQm1BOGFQZUJOQVFTOWErbzByS0dhaWZS?=
 =?utf-8?B?My80VmFPTDZDUng4cHRaQ3MvcTUrU1J1N0JZdUFBcWF6UURoR0pjN3dLbzB2?=
 =?utf-8?B?TncwYkY3YWtHRDAwLzQxN3kzSEYvdzhrUGdOMTRhMUxwRDdjRGx4Y1Q3VE81?=
 =?utf-8?Q?BI9gBC7kyfB+eDBMqpLAGFA=3D?=
Content-ID: <8AFB8758DB70A441B003FACA08EA07FF@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR09MB3261.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c4623f-3ad7-4241-3b16-08ddbef1931e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 14:04:52.0571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agSow0lA2asTVLhVhTeYvGDhrkA+1r/KuD1+Q3XfPxwArdHmB1ur8WbD4KSNKnY165s16jYJvcw4hZH0KWVFpgwhKheR9rrrWQlJY+CdskI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB7143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_070503_072738_54616DA7 
X-CRM114-Status: GOOD (  18.48  )
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

On 27. 6. 25. 13:08, Andrew Jones wrote:> On Fri, Jun 27, 2025 at 08:40:53AM +0000, Aleksa Paunovic wrote:
>> On 26. 6. 25. 12:49, Andrew Jones wrote:> On Thu, Jun 26, 2025 at 11:34:21AM +0200, Andrew Jones wrote:
>>>> On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
>>>>> On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
>>>>>> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>>>>>
>>>>>> Use the hwprobe syscall to decide which PAUSE instruction to execute in
>>>>>> userspace code.
>>>>>>
>>>>>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>>>>>> ---
>>>>>>  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
>>>>>>  1 file changed, 17 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
>>>>>> index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
>>>>>> --- a/tools/arch/riscv/include/asm/vdso/processor.h
>>>>>> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
>>>>>> @@ -4,26 +4,33 @@
>>>>>>
>>>>>>  #ifndef __ASSEMBLY__
>>>>>>
>>>>>> +#include <asm/hwprobe.h>
>>>>>> +#include <sys/hwprobe.h>
>>>>>> +#include <asm/vendor/mips.h>
>>>>>>  #include <asm-generic/barrier.h>
>>>>>>
>>>>>>  static inline void cpu_relax(void)
>>>>>>  {
>>>>>> + struct riscv_hwprobe pair;
>>>>>> + bool has_mipspause;
>>>>>>  #ifdef __riscv_muldiv
>>>>>>   int dummy;
>>>>>>   /* In lieu of a halt instruction, induce a long-latency stall. */
>>>>>>   __asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>>>>>>  #endif
>>>>>>
>>>>>> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
>>>>>> - /*
>>>>>> -  * Reduce instruction retirement.
>>>>>> -  * This assumes the PC changes.
>>>>>> -  */
>>>>>> - __asm__ __volatile__ ("pause");
>>>>>> -#else
>>>>>> - /* Encoding of the pause instruction */
>>>>>> - __asm__ __volatile__ (".4byte 0x100000F");
>>>>>> -#endif
>>>>>> + pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
>>>>>> + __riscv_hwprobe(&pair, 1, 0, NULL, 0);
>>>>>> + has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
>>>>>> +
>>>>>> + if (has_mipspause) {
>>>>>> +         /* Encoding of the mips pause instruction */
>>>>>> +         __asm__ __volatile__(".4byte 0x00501013");
>>>>>> + } else {
>>>>>> +         /* Encoding of the pause instruction */
>>>>>> +         __asm__ __volatile__(".4byte 0x100000F");
>>>>>> + }
>>>>>> +
>>>>>
>>>>> cpu_relax() is used in places where we cannot afford the overhead nor call
>>>>> arbitrary functions which may take locks, etc. We've even had trouble
>>>>> using a static key here in the past since this is inlined and it bloated
>>>>> the size too much. You'll need to use ALTERNATIVE().
>>>>
>>>> Oh, I see now that the next patch is handling the kernel cpu_relax with
>>>> ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
>>>> a syscall inside cpu_relax though either, since it gets called in loops.
>>>
>>> (Another follow up to myself...)
>>>
>>> I guess with the vdso cached result it should only be a handful of
>>> instructions, but it still seems odd to embed a call in cpu_relax.
>>>
>>
>> Hi Andrew,
>>
>> Thank you for your comments!
>>
>>> Thanks,
>>> drew
>>>
>>>> It'd be better to just call the standard pause (0x100000F) even if it
>>>> does nothing. Or maybe there's some define that can be added/used to
>>>> select the correct instruction?
>>>>
>>
>> We did try using an ifdef/else in v3, but since that would have to be marked
>> non-portable, we decided to go with a hwprobe call.
>> Since the MIPS pause should behave as a nop on other CPUs,
>> would leaving both the standard pause and the MIPS pause calls be an acceptable solution?
>>
>> That said, I am not sure how this would behave on future MIPS CPUs in case they support both encodings.
> 
> We should probably avoid assuming that undefined custom instructions will
> behave as nops everywhere, meaning it should remain guarded. This seems
> like a problem we should try to solve before we get even more pause
> instructions or whatever that need dynamic selection in userspace, but I
> can't think of anything reasonable atm. For now, we may need to live with
> vdso hwprobe calls in places like cpu_relax. I'll stop complaining about
> this patch as I can't think of anything better.
> 

Hi Andrew,

Thank you again for your response. 
 
We talked in an internal meeting and we would be fine with not touching the userspace
code with this series (just deleting this particular patch), 
if that's a more acceptable solution. I am not sure how else we could proceed?

I am CCing the others who participated in the earlier conversations.

Best regards,
Aleksa

> Thanks,
> drew
> 
>>
>> Best regards,
>> Aleksa
>>
>>>> Thanks,
>>>> drew
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
