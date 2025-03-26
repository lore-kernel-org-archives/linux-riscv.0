Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49513C36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baLxZ4/NvHmzH7t0CJ1AdjdjM5xmqm+8GClai66ks4I=; b=0C45WDmw3vCy9U
	PfWmNBajx6sISUne2yzS0P+x9MOYF5NaAkAD+htBAkasMyyb7NrJDfIC1Hem5UtbvPHM40Pafv1sz
	BJQxfGRYD2BJsr4hQ4qXNWTzC68cCUqCvBsMFujWC4TOfk0AbXlBOnfrjbQzO2FhEYfeWAzkZ2hwD
	wKNcBmkQhenLEKjEYh2T9mmiDejPbSYO7pm64l5SpG21Bl/XZm/rl6uP1iK8KTthxxGTZrdXfx/t7
	8Iudp7lqQ4HW1WIc+oKKycT3HGklNCN5awUKXoQi0MnB1XKp+taUg0KfPVnPycntNb2eC/FfeCEcK
	xfcLjxhlQ+vGXRmH5UlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRcu-00000008fnQ-1Taf;
	Wed, 26 Mar 2025 14:21:04 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRcr-00000008fma-2nxB
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 14:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ezazm97iV3odvAguouvZz5GQ3LRQIhlbaAjXeGkfr2BOPMQuuWTd6z2c6xTK6qpNIUtsb9snOMNWPTgpSQKyPsqy7hNihL7aCqbWtJXTEk2YeBHJFwzkh8a7YJeDjEz31RD6ya8+Q+QZrGybSiyr/PxM/m9wjJXZQAsOU45uNJemANWW3EnCKVuMEGoSHFjS1my3NPgjDulTpRalTr8R97WcB1HpVmu35Q8er/O3sGuCfPOFceuY2Ctr8wnFcTgw1Fvp7GecQa+MFXp9H6ak+nsdb8AYKI2C0baprN+7yTIviwgs0WTHog8a66yYAjSo367UmqcqBEI/VzRnY8gcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiuFwGCRg2uMlGNUuQjtAoEq7wPzDvcUxRm2RS22ZX0=;
 b=srrwxpAn07B8mmnfR+zFt+RfpdMzgnoCpaReg6KD7eAdWo2agNwKYLgIV7B6b/zrLV3PF7QOQm8eL6O6sS9VtBF+JOkuwLNGh9jNgARaLBcx6O23oVX3xxpwYX+DpyV26mM+D3KAGavYJzFzR+4XfAxpGg603NhuuF5w2Mkt/6OZPEC4Gh8xiF4a87hUNBKgoybmkUq+ccjal0rg6V8/41hUsBkrGXTlVTPy7JwyJIamQdV3BXguEMwc9XkekRd7eH4M2tNXwN6D3CoRnzznSETKfZSpZfTm2RZHCj6rmEZaLBJRiW5fWfdSgqMq062r1LRnXrzWVp7CDNavQhM7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiuFwGCRg2uMlGNUuQjtAoEq7wPzDvcUxRm2RS22ZX0=;
 b=riqQZPEpxQmcJAjbI3Yra6iLbxEq2yh5bh6FF19obEGixht1f6HlJsfsDWTQGi0Ehr3IdPomSycOMQLMJd4od3bVHulQ7uv7OlTkA9TwwYLjT4a6TJJNIEZ5qaLq4BWw08rAImrOfJ2j7rcvjFlYysV+4/T8pGGhibDYDA0Oeak=
Received: from CH3PR04MB8928.namprd04.prod.outlook.com (2603:10b6:610:1a8::13)
 by SA0PR04MB7258.namprd04.prod.outlook.com (2603:10b6:806:d9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 14:20:55 +0000
Received: from CH3PR04MB8928.namprd04.prod.outlook.com
 ([fe80::4f66:da1e:f120:fe35]) by CH3PR04MB8928.namprd04.prod.outlook.com
 ([fe80::4f66:da1e:f120:fe35%7]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 14:20:55 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland
	<samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin
	<linmin@eswincomputing.com>, Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Yu Chien Peter Lin
	<peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, Kanak
 Shilledar <kanakshilledar@gmail.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia
	<a-bhatia1@ti.com>, "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel
	<anup@brainfault.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/10] riscv: dts: add initial support for EIC7700 SoC
Thread-Topic: [PATCH v2 09/10] riscv: dts: add initial support for EIC7700 SoC
Thread-Index: AQHbnlpJAxCbmoe3Q0yJsu8THnQSew==
Date: Wed, 26 Mar 2025 14:20:55 +0000
Message-ID: <CH3PR04MB89282DDB25C289C34581DC0083A62@CH3PR04MB8928.namprd04.prod.outlook.com>
References: <20250320105449.2094192-1-pinkesh.vaghela@einfochips.com>
 <20250320105449.2094192-10-pinkesh.vaghela@einfochips.com>
 <CAJM55Z-LUoeh0pSDnPKpduub_UBOPeg4g3t20JA0GBosJKuiAQ@mail.gmail.com>
In-Reply-To: <CAJM55Z-LUoeh0pSDnPKpduub_UBOPeg4g3t20JA0GBosJKuiAQ@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=10ce00ce-4735-48a5-a8ad-c529814dfc5b;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-03-26T14:11:36Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR04MB8928:EE_|SA0PR04MB7258:EE_
x-ms-office365-filtering-correlation-id: 32685e80-540c-47c8-0c9b-08dd6c716bc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZGNrcjRILzl0SmQ5NWJJQU1YWTczdk5HKzE0MVA3UFNnZ0VVbnd1YlJXcnN2?=
 =?utf-8?B?WElwblJrK0w4SEZqY1hOWkUyRGd1Ykp0eEtEQUFKYXJaamhsQ2lNcVovZE9a?=
 =?utf-8?B?TDlXN01sUmVNNVh2OGVjaUE0R1pDOTQyekhweWE2MXJESDJRMUgxekNCdlox?=
 =?utf-8?B?WDFmZTMwOXppb0lmY0hYeW4vUmVWWFlzK29sRXBCa0tUb0ZPU200S01Gdmw1?=
 =?utf-8?B?Rms3S011WGFmeXJ2N1h5SUpCYXRqaXFFQmtSRS84Q1hhclNSWm5VL3l5ZzhV?=
 =?utf-8?B?T3E4OFl0b0M3SHNST2dRMW8yclVZbCthQ3pJZ1ZhQXJpeUtwdGF4SitQL2NG?=
 =?utf-8?B?NkZuSlFsTDN5djBTbndNMGpVZklONDk1b1hmUFBxTE4wd20zZGFEZElURXo0?=
 =?utf-8?B?Q3paV0s2L05ucVBQOGFLVlhqNTZ6WEU1NGtQZVJyR2ZiQS9jTHYzZk9KdWpj?=
 =?utf-8?B?b3dhOFhmWFc0a0x4RFZ4Rkk3c1VLcUJ5K25JQUZrK2VFdzgzRWN6RklSMUZK?=
 =?utf-8?B?QnZIWFFDTGh5SFlRNVZyVmJKVHRjSURnVkpUT2JIZzl0N2lLbHRrRFFKYlVw?=
 =?utf-8?B?WkFsRHhic1BUeHJkdk5QU0s2a3E2MzVWdEdsL1I0SXVVVXk3clJLQXo5bHZv?=
 =?utf-8?B?cEhLNHlPVmhCOUNSNlpROHJaRzEzRDRQREhVNWdIaW9mcVN5Ym4rV0M1MUN4?=
 =?utf-8?B?a1BrVWd6OGQrV1BQSlR5OFZERFZ3UWxtNyt2WnF1SlIyMmtseUJpUnlZbU9G?=
 =?utf-8?B?UVpQOFJkVUlGYTVYSUdLK1pvWEJCSlZBa01WalYrUXFpNmQxenFXTHl5dWtp?=
 =?utf-8?B?dnNDaEQ1N2VyWWhYcDM4TTA0ZzJKNzR5N2NJUzBrSnZhU1ltV2NEUmVuRWIr?=
 =?utf-8?B?ZlllbmZ1TTdZcnlLbE8vaE5qV3RpWFh6NDVNeVdKZUtoQmN4dGo1WXNvUzJk?=
 =?utf-8?B?QUMvNVNlVUxyUWpmTk9Wc1ljamdHaVAvZ1JOT0w3M0hwZ1Y0SHJFdmYzSG00?=
 =?utf-8?B?SVBiM2hQVTl6OFVHWUp2T3RPMkxRNGViVm5wZWsyZTJhT2FtdlRUT0ZKY24v?=
 =?utf-8?B?cTdxNmxHdzZ6RTdiUzZ5U0pxV0xvUHhtUW9sU2krdkRhSmE3SkFMVjRlL3BX?=
 =?utf-8?B?TnVwZGhPcVpwUEl4T1hOMmRXRjF2eFhCTlgvZ2RScUFWdm1rQnJ6alppdk1T?=
 =?utf-8?B?ZjNxdDdaUnYva2ZPNWUxem0zQWZOUlVBM1I4WFdXMGFaRVFYeVRPWVlLbkR3?=
 =?utf-8?B?QVRmRm1VMlVXeTRKdzlpVW91UXFtTmNUNWRNN29PdEJtTXFiQVl2TE5pM2o2?=
 =?utf-8?B?c1FDczdNemc0ZDlxVGZGdU8xY1pHdVFJc3Qzdm8yTGh1V1NxUXBxTnR1cita?=
 =?utf-8?B?ZjN2aFpIcG9CejIzOGFlMmdyVEpLaytUT05mNWtIRzd0YXhxa29VWEgxZHVN?=
 =?utf-8?B?TEYxT1NDcGdWUlVVbjhwTzRNdTVVL2F0MnVCQThEa2M5VGlmQWhGM3BsRjBa?=
 =?utf-8?B?QzhlYUI3UXp5S1I5dDVYZ2dsT1I5TG9KYi82WjRrQmU5WFo4VlI3elVtNkVB?=
 =?utf-8?B?RVJIcFN1SXRLbkhBTGxZeGtTYkRYcm5qUmlVY05BVkNvK3B0L1hOaFNxS08w?=
 =?utf-8?B?R1h5TlJBN0hYdUJGQlZQT3ZidDBsbGxDMmRBQURzTElmcnJZcmFTeXF3dzJh?=
 =?utf-8?B?dGgvRDB2TFk2bmNLZVJ3cmVmM2ExZ1ppUjNUeW9iZW5nZVlDRUpFOW1XdUF6?=
 =?utf-8?B?dW5hc2JBTDdYTDZ5NHdQMGZZUFBXcUowQTZlTTUzVlpGS1RzVmlvVkk3RUxi?=
 =?utf-8?B?Wi9ZRHdUV1AyWW83WkdzRXowbmVhUThqeDZTd2Z0cVRrNEtkZjlQNmRXSUpr?=
 =?utf-8?B?cy9OOHkrbEI0dklXL3VnWFgvaVVTdVIzSEdoNDJhbXd1L2ZqT1pvY1BpVHNU?=
 =?utf-8?B?REhNVjcxcTU1Zll1MUpKTTBOMjJZR3Y0RkpsZStReTBWK1Nwc2EwSzlOenRq?=
 =?utf-8?B?UGN3eVdrWUNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR04MB8928.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTNsbXRVUWg3Y3BkWU9LaUIwV3l1dFlDd0s4ZkdzUERQem53R3VxZWdjQm9v?=
 =?utf-8?B?RTFSaURuQTNSdGFndFpvWWpnSEFURXZpYVhaYUROUFcrdnhhWG9EK3BIem9j?=
 =?utf-8?B?eDk3UDlPbGJQcVZ4Wm5aUGI2RmY3V1ZKRmkyMUZWN2ZhMmhvNUkyZHE2WExT?=
 =?utf-8?B?ZUZKcXhiaDF4dVFVa1BHRkxUaGNHZDRzdFVObVZheXJRQjBNWXlSZjhxVm93?=
 =?utf-8?B?QitWczZrZzRWVVRnK2VMNFlOcWhkSEhpVHJQcXVOZC8zV1gvUEV3U1ZlMXdN?=
 =?utf-8?B?MUFYcXg3eTg4MkxHRjloVys5c0xlSXVLeC8rcHBjZ2tmb0tBV1lKRUcxM0VP?=
 =?utf-8?B?cHhCUThlQmptNnhIdExncTBtUHVaK1F6TVlCN2lxL0RZTTNOdGczTFlXRHZh?=
 =?utf-8?B?TDBnZzdtYzNIenlCMFpDdUpabFZ5MWJmWHlCL1VRTkdEYVB4ZjZYUy96UWtq?=
 =?utf-8?B?clowRk1DZmc3RzVZMkRQV29IR0QvanZYM2FHUEpMajVMVzJMZWJCb1dOV3d3?=
 =?utf-8?B?Z3doTU5FYnRyWEc3R0F4SERWSXlEYXgxZ3FyRVlldTBaM2hJdW5vL0FJMzZt?=
 =?utf-8?B?M1NUMVFIRlVNazhiaTJqSEdPTVhMdDNWWSt4RGdrU0l4YmZLTG1yWUNZQ3V4?=
 =?utf-8?B?VGoyaHNYNXp6VXlVRkhRRkNSYWZsZndTb2ZGeFNtRTBiWE5pZkcwcGtCTzdl?=
 =?utf-8?B?bkxyNzZjTkNoeC9Cd1llR1NxN0dLWE5nZGViQklhcEM4d3oxRC9vYjlicjVz?=
 =?utf-8?B?NSt4L0FOSmRiS2JkS2xQcEp1MnBwRytINEVpRVZCTDRxd3pGRVJuU2pZV3Mz?=
 =?utf-8?B?Yis0dFNKVWdsWXg1WVZncC9DRW9VQU54dnJGVE41cG9ITTQ2V2NXQTRLaFU2?=
 =?utf-8?B?OHpJQVpNV0RaMmJmQUdoTEFhZjhlTnRzOU41c3FvdG9FM3lwelRIQzR4OVdu?=
 =?utf-8?B?b0JJd3BobGtaVW1Da092Ui9adDJ1Rm56TWtBUC8wdWtteEpLejVFaXhtb2ZW?=
 =?utf-8?B?ak5NTUdIelVOWFIzR3dxK1drTTdqZGhtQnhIbCtBYS9LM09hYmNrV2h4aGFX?=
 =?utf-8?B?NExnMGhiei9XMzZrSGxRTEpFK2RHaWVSc01Sa2c3Q0Y1SXNUMmlaK0tmb3k1?=
 =?utf-8?B?dEw4MzNmOEk3RFo2bWsxLzA4L0dYSjlJK2JQYmFMdWRvRVkrNlVkQWhrYlpZ?=
 =?utf-8?B?elBaRDdDaFA4bEJMWDNMd1djZCtWU3ZKa1Nwd0tSQzRuMURzUXd3YnpyZnFj?=
 =?utf-8?B?SlpkenFLZEMwbjFVcEx5UUsvM3NBZWZvSnpwVzVhMEFlVHFaTXNxNXhNdjdL?=
 =?utf-8?B?R1BkaEg5bmdCa3hPWk0vLzZZQlRPc3ZsdWx5TG8wQzB1ckdkcjJqRU9GWW5M?=
 =?utf-8?B?aFdyVU9xcEtBRmxVdllOUE91SWlCQmNReXRHWDUwZzIwT2NHTmVqbW9GL2xP?=
 =?utf-8?B?RHhLTjFJM3hHOEpSZkNpamg0NXJaNVlNbXdUSWdPVk1sSE1nVEJSZk0vK3dH?=
 =?utf-8?B?UVA2K1BYMTNDa3llRkdSYmlDTnR0a0JHQml5NDUvbU9lcE1GRU1ndmlkSDFh?=
 =?utf-8?B?TkwvTVBKZ2VlUGZUR3FxRENMWTcvWVk5WlU0TXlwNktzS0NLZHpUTnMxc1Js?=
 =?utf-8?B?dzkwQjJOeXI3aS9XRzZrTU05ZEs2KzE4cmREL0NrZGdWNkx1cDN5Z3dDZ2dD?=
 =?utf-8?B?Qytpd0VsRUJlZDF3NU9YMzVjNFNxYUUwbnJ1OHdJMG55UzljTm1ZRU96LzNH?=
 =?utf-8?B?ZG9jVTZBeXhjbklvSjJiUzJiVk5YYlpJMjlaVVFIZ0UwL2lCaXBFem56MUlC?=
 =?utf-8?B?c1hzME5KdVJPU1ZxRzRQMk92enYyWnFlSlRaemIvZ25zcDBJK0l6U0dxT2NH?=
 =?utf-8?B?YlFvRlFBSUhZb3VCN29nOXIrZkpJaGh1MFVGTEpTRE5LcnloaCt6dEd1VEVU?=
 =?utf-8?B?bTFFd2QrSXdBQ0FJTzBha3UzMGlvbDdZSS9HaFpPUHhHNHdDZzdjSUpOUVlI?=
 =?utf-8?B?eW5BeWhuczErZm13RjZnbXVHajRLWDZ0ZXF6WGhjVFVvWmFKRVhlTzZvOGdQ?=
 =?utf-8?B?VHd2cUQvRE9kemRBZ0ZDNFdJZ21Bc2RwNWxCUUhhZVNQK1M1d2laaTZCL2xI?=
 =?utf-8?B?TFUrL0ZRR25ac3QxeWxuT2hOVm1TZU44T2NBcFZvMVlhd2VsbDlBeENsL1lz?=
 =?utf-8?B?NWc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR04MB8928.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32685e80-540c-47c8-0c9b-08dd6c716bc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 14:20:55.1428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MzDHadrxWb8Uxjws8cKAN+V1H/CwnKeQm53QW3Lk4o3II/Y5mnoxEikQ7EyBWSe71VJJidhD//H3u/i9cwyRK60QxauM2Nd5abAFz7r9+94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_072101_768310_4F7EDEC3 
X-CRM114-Status: GOOD (  21.00  )
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

Hi Emil,

On Tue, Mar 25, 2025 at 7:06 PM, Emil Renner Berthing wrote:
> Pinkesh Vaghela wrote:
> > From: Min Lin <linmin@eswincomputing.com>
> >
> > Add initial support for EIC7700 SoC that uses a SiFive Quad-Core
> > P550 CPU cluster.
> >
> > This file is expected to grow as more device drivers are added to the
> > kernel.
> >
> > Signed-off-by: Min Lin <linmin@eswincomputing.com>
> > Co-developed-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Co-developed-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> > Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > Tested-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > ---
> >  MAINTAINERS                            |   1 +
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi | 344
> > +++++++++++++++++++++++++
> >  2 files changed, 345 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > fc3c9191b00f..2c29023c6725 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8578,6 +8578,7 @@ M:      Pinkesh Vaghela
> <pinkesh.vaghela@einfochips.com>
> >  M:   Pritesh Patel <pritesh.patel@einfochips.com>
> >  S:   Maintained
> >  F:   Documentation/devicetree/bindings/riscv/eswin.yaml
> > +F:   arch/riscv/boot/dts/eswin/
> >
> >  ET131X NETWORK DRIVER
> >  M:   Mark Einon <mark.einon@gmail.com>
> > diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > new file mode 100644
> > index 000000000000..9cef940f07e4
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> > @@ -0,0 +1,344 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2024 Beijing ESWIN Computing Technology Co., Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +     #address-cells = <2>;
> > +     #size-cells = <2>;
> > +
> > +     cpus {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             timebase-frequency = <1000000>;
> > +
> > +             cpu0: cpu@0 {
> > +                     compatible = "sifive,p550", "riscv";
> > +                     device_type = "cpu";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <128>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <128>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv48";
> > +                     next-level-cache = <&l2_cache_0>;
> > +                     reg = <0x0>;
> > +                     riscv,isa-base = "rv64i";
> > +                     riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> > +                                            "zba", "zbb", "zicsr", "zifencei";
> > +                     tlb-split;
> > +
> > +                     cpu0_intc: interrupt-controller {
> > +                             compatible = "riscv,cpu-intc";
> > +                             #interrupt-cells = <1>;
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             cpu1: cpu@1 {
> > +                     compatible = "sifive,p550", "riscv";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <128>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <128>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv48";
> > +                     next-level-cache = <&l2_cache_1>;
> > +                     reg = <0x1>;
> > +                     riscv,isa-base = "rv64i";
> > +                     riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> > +                                            "zba", "zbb", "zicsr", "zifencei";
> > +                     tlb-split;
> > +
> > +                     cpu1_intc: interrupt-controller {
> > +                             compatible = "riscv,cpu-intc";
> > +                             #interrupt-cells = <1>;
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             cpu2: cpu@2 {
> > +                     compatible = "sifive,p550", "riscv";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <128>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <128>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv48";
> > +                     next-level-cache = <&l2_cache_2>;
> > +                     reg = <0x2>;
> > +                     riscv,isa-base = "rv64i";
> > +                     riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> > +                                            "zba", "zbb", "zicsr", "zifencei";
> > +                     tlb-split;
> > +
> > +                     cpu2_intc: interrupt-controller {
> > +                             compatible = "riscv,cpu-intc";
> > +                             #interrupt-cells = <1>;
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             cpu3: cpu@3 {
> > +                     compatible = "sifive,p550", "riscv";
> > +                     d-cache-block-size = <64>;
> > +                     d-cache-sets = <128>;
> > +                     d-cache-size = <32768>;
> > +                     d-tlb-sets = <1>;
> > +                     d-tlb-size = <32>;
> > +                     device_type = "cpu";
> > +                     i-cache-block-size = <64>;
> > +                     i-cache-sets = <128>;
> > +                     i-cache-size = <32768>;
> > +                     i-tlb-sets = <1>;
> > +                     i-tlb-size = <32>;
> > +                     mmu-type = "riscv,sv48";
> > +                     next-level-cache = <&l2_cache_3>;
> > +                     reg = <0x3>;
> > +                     riscv,isa-base = "rv64i";
> > +                     riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "sscofpmf",
> > +                                            "zba", "zbb", "zicsr", "zifencei";
> > +                     tlb-split;
> > +
> > +                     cpu3_intc: interrupt-controller {
> > +                             compatible = "riscv,cpu-intc";
> > +                             #interrupt-cells = <1>;
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +
> > +             l2_cache_0: l2-cache0 {
> > +                     compatible = "cache";
> > +                     cache-block-size = <64>;
> > +                     cache-level = <2>;
> > +                     cache-sets = <512>;
> > +                     cache-size = <262144>;
> > +                     cache-unified;
> > +                     next-level-cache = <&ccache>;
> > +             };
> > +
> > +             l2_cache_1: l2-cache1 {
> > +                     compatible = "cache";
> > +                     cache-block-size = <64>;
> > +                     cache-level = <2>;
> > +                     cache-sets = <512>;
> > +                     cache-size = <262144>;
> > +                     cache-unified;
> > +                     next-level-cache = <&ccache>;
> > +             };
> > +
> > +             l2_cache_2: l2-cache2 {
> > +                     compatible = "cache";
> > +                     cache-block-size = <64>;
> > +                     cache-level = <2>;
> > +                     cache-sets = <512>;
> > +                     cache-size = <262144>;
> > +                     cache-unified;
> > +                     next-level-cache = <&ccache>;
> > +             };
> > +
> > +             l2_cache_3: l2-cache3 {
> > +                     compatible = "cache";
> > +                     cache-block-size = <64>;
> > +                     cache-level = <2>;
> > +                     cache-sets = <512>;
> > +                     cache-size = <262144>;
> > +                     cache-unified;
> > +                     next-level-cache = <&ccache>;
> > +             };
> > +     };
> > +
> > +     pmu {
> > +             compatible = "riscv,pmu";
> > +             riscv,event-to-mhpmcounters =
> > +                             <0x00001 0x00001 0x00000001>,
> > +                             <0x00002 0x00002 0x00000004>,
> > +                             <0x00004 0x00006 0x00000078>,
> > +                             <0x10009 0x10009 0x00000078>,
> > +                             <0x10019 0x10019 0x00000078>,
> > +                             <0x10021 0x10021 0x00000078>;
> > +             riscv,event-to-mhpmevent =
> > +                             <0x00004 0x00000000 0x00000202>,
> > +                             <0x00005 0x00000000 0x00004000>,
> > +                             <0x00006 0x00000000 0x00002001>,
> > +                             <0x10009 0x00000000 0x00000102>,
> > +                             <0x10019 0x00000000 0x00001002>,
> > +                             <0x10021 0x00000000 0x00000802>;
> > +             riscv,raw-event-to-mhpmcounters =
> > +                             <0x00000000 0x00000000 0xffffffff 0xfc0000ff
> 0x00000078>,
> > +                             <0x00000000 0x00000001 0xffffffff 0xfffe07ff 0x00000078>,
> > +                             <0x00000000 0x00000002 0xffffffff 0xfffe00ff 0x00000078>,
> > +                             <0x00000000 0x00000003 0xfffffffc 0x000000ff
> 0x00000078>,
> > +                             <0x00000000 0x00000004 0xffffffc0 0x000000ff
> 0x00000078>,
> > +                             <0x00000000 0x00000005 0xffffffff 0xfffffdff 0x00000078>,
> > +                             <0x00000000 0x00000006 0xfffffe00 0x110204ff
> 0x00000078>,
> > +                             <0x00000000 0x00000007 0xffffffff 0xf00000ff
> 0x00000078>,
> > +                             <0x00000000 0x00000008 0xfffffe04 0x000000ff
> 0x00000078>,
> > +                             <0x00000000 0x00000009 0xffffffff 0xffffc0ff 0x00000078>,
> > +                             <0x00000000 0x0000000a 0xffffffff 0xf00000ff
> 0x00000078>,
> > +                             <0x00000000 0x0000000b 0xffffffff 0xfffffcff 0x00000078>,
> > +                             <0x00000000 0x0000000c 0xfffffff0 0x000000ff
> 0x00000078>,
> > +                             <0x00000000 0x0000000d 0xffffffff 0x800000ff
> 0x00000078>,
> > +                             <0x00000000 0x0000000e 0xffffffff 0xf80000ff
> 0x00000078>,
> > +                             <0x00000000 0x0000000f 0xfffffffc 0x000000ff
> 0x00000078>;
> > +     };
> > +
> > +     soc {
> > +             compatible = "simple-bus";
> > +             ranges;
> > +             interrupt-parent = <&plic>;
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> 
> Hi Pinkesh,
> 
> Thank your for the patches!
> 
> Should this not be marked dma-noncoherent to avoid having to mark each
> peripheral as such?

Thanks for your feedback.

We have not added "dma-noncoherent" because there are no DMA-capable
peripherals in the devicetree yet.
We planned to add this later when we add any DMA capable devices
i.e. sdhci, gmac, sata, pcie, spi.

Do you recommend to add this property in current version?

> 
> > +
> > +             clint: timer@2000000 {
> > +                     compatible = "eswin,eic7700-clint", "sifive,clint0";
> > +                     reg = <0x0 0x02000000 0x0 0x10000>;
> > +                     interrupts-extended =
> > +                             <&cpu0_intc 3>, <&cpu0_intc 7>,
> > +                             <&cpu1_intc 3>, <&cpu1_intc 7>,
> > +                             <&cpu2_intc 3>, <&cpu2_intc 7>,
> > +                             <&cpu3_intc 3>, <&cpu3_intc 7>;
> > +             };
> > +
> > +             ccache: cache-controller@2010000 {
> > +                     compatible = "eswin,eic7700-l3-cache", "sifive,ccache0",
> "cache";
> > +                     reg = <0x0 0x2010000 0x0 0x4000>;
> > +                     interrupts = <1>, <3>, <4>, <2>;
> > +                     cache-block-size = <64>;
> > +                     cache-level = <3>;
> > +                     cache-sets = <4096>;
> > +                     cache-size = <4194304>;
> > +                     cache-unified;
> > +             };
> > +
> > +             plic: interrupt-controller@c000000 {
> > +                     compatible = "eswin,eic7700-plic", "sifive,plic-1.0.0";
> > +                     reg = <0x0 0xc000000 0x0 0x4000000>;
> > +                     interrupt-controller;
> > +                     interrupts-extended =
> > +                             <&cpu0_intc 11>, <&cpu0_intc 9>,
> > +                             <&cpu1_intc 11>, <&cpu1_intc 9>,
> > +                             <&cpu2_intc 11>, <&cpu2_intc 9>,
> > +                             <&cpu3_intc 11>, <&cpu3_intc 9>;
> > +                     riscv,ndev = <520>;
> > +                     #address-cells = <0>;
> > +                     #interrupt-cells = <1>;
> > +             };
> > +
> > +             uart0: serial@50900000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x0 0x50900000 0x0 0x10000>;
> > +                     interrupts = <100>;
> > +                     clock-frequency = <200000000>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             uart1: serial@50910000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x0 0x50910000 0x0 0x10000>;
> > +                     interrupts = <101>;
> > +                     clock-frequency = <200000000>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             uart2: serial@50920000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x0 0x50920000 0x0 0x10000>;
> > +                     interrupts = <102>;
> > +                     clock-frequency = <200000000>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             uart3: serial@50930000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x0 0x50930000 0x0 0x10000>;
> > +                     interrupts = <103>;
> > +                     clock-frequency = <200000000>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             uart4: serial@50940000 {
> > +                     compatible = "snps,dw-apb-uart";
> > +                     reg = <0x0 0x50940000 0x0 0x10000>;
> > +                     interrupts = <104>;
> > +                     clock-frequency = <200000000>;
> > +                     reg-io-width = <4>;
> > +                     reg-shift = <2>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             gpio@51600000 {
> > +                     compatible = "snps,dw-apb-gpio";
> > +                     reg = <0x0 0x51600000 0x0 0x80>;
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +
> > +                     porta: gpio-port@0 {
> 
> Maybe these labels could be something like gpioA, gpioB, etc. to not be
> confused with an HDMI port fx.

The gpio node labels are based on the example provided in
"snps,dw-apb-gpio.yaml" dt-binding and other dtsi.

Could you clarify more on how these labels cause confusion with HDMI
port as I don't see any example for HDMI port using name as porta, portb?

Regards,
Pinkesh

> 
> > +                             compatible = "snps,dw-apb-gpio-port";
> > +                             reg = <0>;
> > +                             interrupt-controller;
> > +                             #interrupt-cells = <2>;
> > +                             interrupts =
> > +                                     <303>, <304>, <305>, <306>, <307>, <308>, <309>,
> > +                                     <310>, <311>, <312>, <313>, <314>, <315>, <316>,
> > +                                     <317>, <318>, <319>, <320>, <321>, <322>, <323>,
> > +                                     <324>, <325>, <326>, <327>, <328>, <329>, <330>,
> > +                                     <331>, <332>, <333>, <334>;
> > +                             gpio-controller;
> > +                             ngpios = <32>;
> > +                             #gpio-cells = <2>;
> > +                     };
> > +
> > +                     portb: gpio-port@1 {
> > +                             compatible = "snps,dw-apb-gpio-port";
> > +                             reg = <1>;
> > +                             gpio-controller;
> > +                             ngpios = <32>;
> > +                             #gpio-cells = <2>;
> > +                     };
> > +
> > +                     portc: gpio-port@2 {
> > +                             compatible = "snps,dw-apb-gpio-port";
> > +                             reg = <2>;
> > +                             gpio-controller;
> > +                             ngpios = <32>;
> > +                             #gpio-cells = <2>;
> > +                     };
> > +
> > +                     portd: gpio-port@3 {
> > +                             compatible = "snps,dw-apb-gpio-port";
> > +                             reg = <3>;
> > +                             gpio-controller;
> > +                             ngpios = <16>;
> > +                             #gpio-cells = <2>;
> > +                     };
> > +             };
> > +     };
> > +};
> > --
> > 2.25.1
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
