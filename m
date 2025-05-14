Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C79BC3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aR8RMFL4qxNQtfzu89UeqtCi89+ITFgGySR0SzAqxQQ=; b=f5rn91MsAi8gfp
	wq/0jvWd8huuQDeyLj2l0H2cDaaaIEpY1UJziWtBBQZD7C3X9xNeOr7szcpxEL9jXKruEleJVWYlN
	pVdeP8PAEmB10EUzvlyFpcUr9+25ATX7GkoTcWDXR9w2IA6vICsrlYHmdD5qguVdEE+RpuWNMxJg6
	WiGqwjdxnBEwaCoQtTgeXH6Mi2u3qDFybjIjWF/a7PCdrQKsxFzVFI9VyKDBLdPKCZxgwa6rv4MoA
	3xSgUckrojPGcWUKuF2k1YazS1BdpRr5zA+PUWnktcRxCHlGZxxNMaat8oZHu4Iu26dP4Lll3CWza
	FDLzp8cSu+AUdQt6nMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDuP-0000000FZJV-0gUZ;
	Wed, 14 May 2025 15:20:37 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDdI-0000000FV4k-3xen
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 15:02:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkqJNbqjw8B5I2F0BthsFe4GckuhxZAJ37o9N3h++jul3J8N1hAagy1fXIVAVtGluEqZ0dFoSsT4oHE1HRqN3iP2f+V47nYfIEwa2F3Z2rc98InnPbRe8llAO1aHrKCl11LPzkk/6CuWupoouvJlNa9xfK/evCz2DX67VbitqATEYRsPbxkctjNPjqTnpve2rnCOTaA1bS0yJSnHw+TVNYJVPZ8FKxv8orQoNJwoXWDRETjows9h9Kby0xJt/8L07R1CYN8+ditb3XBU7tm4+Xmpf1YSALrHNHMdl2FxQB9BpK4IXkKtLyzrcva+ICU6XUCPdnwLdy01cTcwDjeAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWTNsWsONHS9P+TZtcWaMAJnluk61TLE4XNR3peqmrQ=;
 b=CVHLaQyNhM0s4TkLTgdeziQl5yGQt/Zv7+5xRphEp1WiLzOI9De0KoTfQbfsSvUH+Nw1K2OGyhJZOI8SSg/YqHvTuv11fls2Yn/BL0k/0QRua7+wocMZK7ZJUmEX6pPJbs6T+yBbM5E5q2NHC9LeF9D7KNRDcuNOxQ6DTGgK8PHUC3aaZqmAeYqP6iEjGcH97B3MNFQCgQvab0FxHe89x7NmAdvfUftnKS4J1ql3h1sNxnmEciqulrBxPsDKngwiTMlpJRV+gXVcB6GBA+AkY632hlVz1Xy56QDYszwJ7jQq5P+ZQ+h0i+rfY+xIGTQU90MDVY+7SfdkHDWmph1Ohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWTNsWsONHS9P+TZtcWaMAJnluk61TLE4XNR3peqmrQ=;
 b=Q8HKOy56imX5eilGmrniAW0YeVGY63GRLTVBFut95I/bwMkUtcLEBhwVraf/eipYlNi9z4Y73EIKtEcslHCGdPb18br6iPQsUX3juHWbBjm4uI7c9RbF8fozhqU8XSOeksesGLCJdZVbjLdVFFVqg3NApbLeuIJyOh4La0nV4lZh+12n/jIsmSGeqTbGB+6VKQIKyZjidOZz0rmw9wXV+EVWqlJ9LqDzXMA1lhEXjRsTqw67NehqNT91jW52L9nt3pp/J+QEJW/Egendh0f6ij7BRzir/+OjnXAGxke+ozw6X9x9kzBghBth2LxJ1sYccXbHhAetCib5TdRwVpL3ew==
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com (2603:10a6:10:47f::9)
 by AM7PR09MB3831.eurprd09.prod.outlook.com (2603:10a6:20b:105::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 15:02:51 +0000
Received: from DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95]) by DU0PR09MB6196.eurprd09.prod.outlook.com
 ([fe80::a9c6:101d:ef46:7f95%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 15:02:51 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "arikalo@gmail.com" <arikalo@gmail.com>,
	"conor@kernel.org" <conor@kernel.org>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Thread-Topic: [PATCH v3 1/2] dt-bindings: timer: mti,gcru
Thread-Index: AQHbtElBfdhbNmzjHUemgxt7b8uhI7OyWnYAgB//fAA=
Date: Wed, 14 May 2025 15:02:50 +0000
Message-ID: <3a73625c-63d7-4ed4-98a3-84d7d26e8484@htecgroup.com>
References: <1b72b68a-ad20-48b9-9a8e-c58ad6b15017@kernel.org>
In-Reply-To: <1b72b68a-ad20-48b9-9a8e-c58ad6b15017@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR09MB6196:EE_|AM7PR09MB3831:EE_
x-ms-office365-filtering-correlation-id: 4117f52b-ae35-46a5-ae50-08dd92f8659d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?QkErY2ZtNm9tU1pVUG84OG80V1dzYVRUMUduUm1pa1RCbE9MekozT1Aybjgv?=
 =?utf-8?B?TVN4Z3IxYno3YTJOUFRKNDFNTGR3cTNVQzJGakEveHdBVHB0YVYyaHlXRk1Q?=
 =?utf-8?B?Z1dKTXVLd0h3djhQYXJjL1RPSTQ5YjVNTWxNdmRMcEdadXkyMVdZL1JIMCtv?=
 =?utf-8?B?SndTS2NjN3M2NTBrZUVURjJmUmVtRFAwdGt0ajJTalJkUjRLRjQ3R1NLRnBh?=
 =?utf-8?B?OGZBR2swNHY5K1JyWTlIeTZDaElFcFZDWVJ0RnhaZUk5UFlVQnZFUUFMNFp0?=
 =?utf-8?B?d2FLcGgzT09RSnJkc1dSNzNsNFNjSkJ1UTl5ZTdHa3ZWemVBbVRKaWRNRUp2?=
 =?utf-8?B?RE9iNXY2ZHBVQ3kyZXJYdGNUQWhrckhzV3dLQkxrUGxCdVZkcGVtNEU2SWps?=
 =?utf-8?B?REhPWWI4R242dnFSYld2WHhoTUtCYjdFSGFQdW45dmFnd1FCMkVkeUJWaEM1?=
 =?utf-8?B?bUMwQVdMUTBJbmFGUGl1dGhjenVpK1JSWGE0L1dLVVNnMVJMYnZtWjZCa1Fu?=
 =?utf-8?B?cFlEWGNPcWxZTjFqaWI1YzRkUU1oYlFVQldUZm9TQmp2TExtUlJKc085VmdF?=
 =?utf-8?B?b3M5bHlPdnVyWjJsUjlwanJNV05weGZqWjhYbnQxS0JKdG5QM2dxWUpsODJT?=
 =?utf-8?B?dXdhdFY1bC9HV09zQjhzUTlOR2wyUkVGYUwyRU1LMktucGFvQ0ZqaEE5dlg1?=
 =?utf-8?B?YzRXd0hqL0psUjAwZjVuazlqMi8zc05Ua3J1cUNvRm9XRmhaNEQ2VmZGSlla?=
 =?utf-8?B?VWwvTGhVajhYMWxiSGIyVnBtMzl0WjlGOU9McldPeFYvbXA0VWhmdmZPVDU3?=
 =?utf-8?B?cGh2Q3lGSXUvR2QyWDBQTEM2dWE2R1J3WklNVnVVZ2s5RlYwd21tL3QvdnEv?=
 =?utf-8?B?M1ROK21rQmJyOVBsUkV0OGFqTUc2L1V6S1ZtaDc5Z1lhSysyTEdab0twNm9v?=
 =?utf-8?B?bzRoTm9JWnZwSWdOT2M2WHlCV3ExWUR3VSt0akRTNEtOTzZBYUZ0bDJyTDY1?=
 =?utf-8?B?NU1ZRFhqa2czU1pYa21NeUdMREN2SW0yUlZwU0ZHRUYrb0lBWVN5SEZKZU9R?=
 =?utf-8?B?VXBBYVpyZ1BueGxEVDJmdUpHODBjL2JSb1J4ZVZUMjB1OW1hU2hTWE9HdXh1?=
 =?utf-8?B?RmRFK1dod1JmamR1czJVRmtMM2l3T1NGamduaXRXNzl1M1E0aU1zd081MkVz?=
 =?utf-8?B?a3FMaWZGQzhkWmdoNVpLNlpKV1YzQlkzd2ZrQnl2NFdpbHNJZWlrLzFhMndw?=
 =?utf-8?B?WktncnhuT2pzK0pERU00Z3Z3SXlyYzZoTEUxR1Y2TlM2aWdvR0h2dEJCalpx?=
 =?utf-8?B?dWxKWDRFWGNqWldSYnUyTFA0UWpGTkEvY3Bxa2t5cFFSemZ0TW5mVU1YMFcr?=
 =?utf-8?B?bnEvaDR1VVRUKzlUTFpncVpIT09mc2FoajRmZGRwVmVHSDYvNEQ4M1pkM2NY?=
 =?utf-8?B?eWZ4QzNuc0NsUUJReFZ3eFkyTUZaSm9SdzNVK3ZXWGZJZFRQY2dnZFh2T1Np?=
 =?utf-8?B?Sk9BU1RTamdBSXMrSHdjSW8xSGhPd1BwOElYM0xuWnVPdHhtamJZejRCMk9B?=
 =?utf-8?B?MjFzVStXdXhVclBWM2FNdXZiSlZmeTRiem55ZVdPWTRhVi84NjhYVjg4TFhu?=
 =?utf-8?B?WERRMmtldmVVdEtTNnA4empWR2pISi9PRk9QM28rOGJ1WFFCSEd4R0x1WnRF?=
 =?utf-8?B?aUQ4dmNjdVBXeGJIdURvbC9tSDloZWhVZDNFVGg4c2VQNnlMbTBmRzFlcU5T?=
 =?utf-8?B?UEZCVlBaN3VrRlI3SlgyK1FvSERidGNWU2ZmMVRyenJkbFRYbXdaK2k2djBM?=
 =?utf-8?B?UFhVWXNvblpVWlJhWUtlMExCU0JkeGYrMFN0MXA5K0dqa0xFZHdaeHlBVDVE?=
 =?utf-8?B?TTZRbUQyclNqL2gzNW93QmwxWHUvTEJCTmp4SXE5ekROK3c3VTdwaVpwOFRY?=
 =?utf-8?Q?q3T+PHpi+ic=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR09MB6196.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjdvREEvSWZQajR4TEZtZ1crYlk4azU0dmx2bjBuZ2RPWTlGQkZRWFVzbWt4?=
 =?utf-8?B?eEJpUnlxdG9zd3VRaEtDbWhmTXJvN3BXcys5Slo4ZjhkMzhRZ05rc1ZRNmZh?=
 =?utf-8?B?aThjQ1M4SS95SVRxNFNMSGNQSWlrQ1c3elJMSWpXWGpEblhRa1JhZk03ZEJp?=
 =?utf-8?B?R3dUMkpTTExKektHZE4xa0hrOTJDQ3N1VkR5bytjQWR3b1VlWlRRN0owVk5I?=
 =?utf-8?B?NzZUTzRrYmpkbkZwb0pMYW9Na1g0RC9zYW9NMlVEdWEybVhHaVIxaXVZV2xk?=
 =?utf-8?B?Z0s3aTNkQkdlT2VveElwKzhNVmdRSDdjQURLMTVZR3FaT0F4VzMvT1dObU9o?=
 =?utf-8?B?MmJZdjR5MUZKS2Y2QzZVRW12YmNKY1R3VE0zV0VuZElMLzlQNEpQTzROZTg0?=
 =?utf-8?B?V1dBd3Q4SnhkeXV3NFVRK245Ylc0T2xkU0FEQ1ArZndrNGo1dVVkWTRLQ1I3?=
 =?utf-8?B?aFdNaEV4Qk8xVkJQbGRNU2pKT2J3RXA4K0hRTjVVUHVDY2lLM2h1dHNMdnZi?=
 =?utf-8?B?YkJtRWhEd2lRL044eFBPUW44VTA0THZLQmVkemY3QzlPRk1EZzFLTUlTdE8v?=
 =?utf-8?B?TTlDQndQVEc5aTc5Y0NZRVdSVHBMMlVaNlc0dmdqUUpndVBraWNuTU4yb3M1?=
 =?utf-8?B?WG5nbHJ4VHIwQmV2alBENU1Ra3NmUmVtRS9tYTU0MVFRWDRNbzByaTloV2tS?=
 =?utf-8?B?QzgyMUVmMXdiZWpHZnBudDl2S3NweTNnRmJjS0JiZjFOckFRVXhMWk03NjFy?=
 =?utf-8?B?NWpmVzNhcUNWNGswSzdINWkyNFI2blZWVlRwL3o0YWtERnF5ODVTKzF3cmxP?=
 =?utf-8?B?SVVtUW5hSU4zeHBKTFdUWExXRTB0L2VLSUxRSlJtTEF5UzE3YUpiZVI4TU0v?=
 =?utf-8?B?MTZROG4rVzA1S3NLanJWNUVFQTdWT3Q4ZUpSSnEvQ2JxN3lrVUJsd3VzNHZC?=
 =?utf-8?B?R3poNWVjcS9DWGptWUU5Tm1mUTgxeEdYc0NsRUYrODZYb2Fwb2hFdE56R3kr?=
 =?utf-8?B?ZWwrTDJmNko3UzcvWElrcTdKcGU5T2JOdWJGOGdVY2l3eTJjRDVVOEUza1l2?=
 =?utf-8?B?WnR2aUNOUVNVNDVRbWVKTHgvdHRCVGtlVWxBWElRbGxUZm5GWDk3V1ZRVXNH?=
 =?utf-8?B?TUdHRkxHZHViRmNta2ZnVTErT0ZlRUdlblM3Vk5RdzNybUk4bkxWVm5nbFVm?=
 =?utf-8?B?cWpOMVpmd2ZzcVNTSEpNeFp2eUdGQTlQWDJIRzNzQ3JWdDBDdE0vTWp2QXhR?=
 =?utf-8?B?RjNiSytBM3N2VTNONFFGNG5oS3VoSkdiODMwbzBjSXVFbjFwSmNpVDgvVUhI?=
 =?utf-8?B?M2hmb3oyOWo0SGhiL3hIVDFzQ2xpZ2M5c2kzUXh4M2dsMUtxY3hLdXpzYk9y?=
 =?utf-8?B?WXI5cEg2SE15NnpwVzNSd2hrTll4NEd0RzdXZnF0NzlReDZLVzBPdFgzSDll?=
 =?utf-8?B?alV4RDVORDJPaE5CeUhTNjhVMXk5SVVwMTRvZU9pV0czNW1ZUDM2bFRiYUVz?=
 =?utf-8?B?MC8wWkdDclpld0RDSmZPUkNFVjd3L095c0p3MFBVWnUrbytTZ3F4MVhKUmxw?=
 =?utf-8?B?Q2xhcThxMHVPbncxVis1dCtQeFVxY1hhNGFNRXU5cG8vQnpyaHNUaVFvM1Jv?=
 =?utf-8?B?WExFOVFjcEFkMWJwL25GeTlOQmpESnlacmpOeHhmdEt5cG5pbEFWaDBiMjR2?=
 =?utf-8?B?UXpiTHlqamE5UUV0WmJhbzA5T0hJTTZpb1h1Y25QZjhUYTRzTGI3cklEMUJW?=
 =?utf-8?B?REhDekEvZ29BWjl0N3c2eEE2aWVUc1o4RVhPc3AyR1gyVG52VmNPVG84aGZP?=
 =?utf-8?B?dHJMZGJQb1VlQkZ1L1FGQm9kTnhpYXRFWmpoWXVNOVo3UzlnYVBjWXI4YkRJ?=
 =?utf-8?B?YzgzRmp0cFJibmVRYXZsOHVIT01vbzZ1ZlE5MGZyOVk1aDZKS3E4bVByREk1?=
 =?utf-8?B?S0I0U2ZwVGhXMW1rZjllWkRyQy80SHYzU25hQThBdURUZlFKcU82Ky9Zb3Nt?=
 =?utf-8?B?clMycERHREh6R1lXbG11N1VHUWpnV3hGU0lmRVUrNk4wZWs3V2VTU0VvZFcz?=
 =?utf-8?B?eWpXQjJ0cDUxN1VLb21OSDczTU5PQ05pR0JpT1pJT2V1L0pjMnd3YXlDWGwz?=
 =?utf-8?B?M0h4cW5PTTVSMVRLUjVBdnBkNmpoa05qQVN1ZTZ6U0JaTERBSTBTK0hCY0NS?=
 =?utf-8?Q?IRvXi5p2nUfnZTQQ7GxZzdQ=3D?=
Content-ID: <19166B662D9A594983119A86A6C906B2@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR09MB6196.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4117f52b-ae35-46a5-ae50-08dd92f8659d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 15:02:51.0440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILNcuwW0l8p8BdVpMSHKTBDEP0tptvXyCi6qrueMuhPERtD/06M3UAw13HtyXXA032aCDX2TJKQrbBa2uu3BBU/RcbKJ4Dpn1uf8nucQ1Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080257_150021_A16E441E 
X-CRM114-Status: GOOD (  25.45  )
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

On 24. 4. 25. 08:24, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On 23/04/2025 14:14, Aleksa Paunovic wrote:
>> HTEC Public
> 
> Fix your email systems or use b4 relay.
> 
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
>  
Thank you for the tips. Will be using b4 relay in the future, starting with v4 linked at [1].

[1]
https://lore.kernel.org/linux-riscv/20250514-riscv-time-mmio-v4-0-cb0cf2922d66@htecgroup.com/

Best regards,
Aleksa Paunovic
>>
>> Add dt-bindings for the GCR.U memory mapped timer device for RISC-V
>> platforms. The GCR.U memory region contains shadow copies of the RISC-V
>> mtime register and the hrtime Global Configuration Register.
>>
>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>> ---
>>  .../devicetree/bindings/timer/mti,gcru.yaml   | 47 +++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/mti,gcru.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/timer/mti,gcru.yaml b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
>> new file mode 100644
>> index 000000000000..6555dbab402e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/mti,gcru.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/timer/mti,gcru.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: GCR.U timer device for RISC-V platforms
>> +
>> +maintainers:
>> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>> +
>> +description:
>> +  The GCR.U memory region contains memory mapped shadow copies of
>> +  mtime and hrtime Global Configuration Registers,
>> +  which software can choose to make accessible from user mode.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: mti,gcru
>> +
>> +  required:
>> +    - compatible
> 
> Drop select, why do you need it?
> 
>> +
>> +properties:
>> +  compatible:
>> +    const: mti,gcru
>> +
>> +  reg:
>> +    items:
>> +      - description: Read-only shadow copy of the RISC-V mtime register.
>> +      - description: Read-only shadow copy of the high resolution timer register.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    gcru: timer@1617F000 {
> 
> Lower-case hex in DTS, always. See DTS coding style.
> 
> Best regards,
> Krzysztof
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
