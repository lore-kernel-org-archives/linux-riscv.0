Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6486FC35FFF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YM2S7zm7kBP8UvmN5UAonJIcTLCAfc/Q38+d1czxDqc=; b=L3TOCaql8ldjNE
	lgfmmd2TUggsTlky329hJETm0RtR8/om0pf7sx6Vg4WsTE6CRij2hDgAXBp1YdjIWazsTsmF4Icew
	mMq+iYylpMD3Co7VIe43CeSJEYYpVKmej10ME9wMNuj17d9P4ydv/8x9IaZmLW2x03+ZXKbhsd6Ho
	xxdwK/WQNlWA8vkBh4hLazjwxa7G4QYgK/vMcxXGKnOaHa3LaROJtbkjlvrSG0oHd/BltPgUZVgic
	o2Ws8vz0kW7wqhA2NXoHxUxmUCpdvbuFckDd+YzEPTp9xdeVoF7zUOJotqRYQhw/4tE5SlDnInrIt
	2ECJfrhn/qKdm/zON9Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaZC-0000000EfT6-3UBx;
	Fri, 21 Mar 2025 11:29:34 +0000
Received: from mail-eastusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c101::] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaZA-0000000EfSi-2KWn
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 11:29:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsnCbDaPW1W5x+BB/EZ7wRvoqjiMJqhQqFgnUJ7UuUxawVo1Ezd/1d1I61QRy4fHkmlI9JEU7xoVvSHQ3I1jf8PEF5u0gGtk09JsiW1ZJacZLlZ/Z+SzU89oQl5pu+sYk2rIqb2LOgCvgGreswOM4bl2xdEVIz307BntoAVDKCqDx+JxS7kcAbZ7dnSrL/VTHnepsBRxrpV+M0jAnZyaJlAi7BPn1iER1F1b0cCbrsc71M3wqd+Jx+Jl2sZ5r4/AO5awLLfp2mbqF4C8vk8WeGCPwwhg1wI7KhmeozXBVP9ezmUuYIGV6ozzQm6IWViPum5YFN8fR2SCDWOfoN0qjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEbSB53HLSTXXBdtLOBC/AcmJJnSRz/egLMsEr6ESYc=;
 b=VYhFLiYAiRTQa8iU+4Wlum9IvyhueTG/0+/4MYInYQhson22hgNYTa/nftIaAHehs41kR6ci+mQoVTWOGkbDuLA5ooVmPYYJGsILJ8VCrnayJ7oM/TgceHj2wvp0wvFv9L51uu0oMZxhr4HoRkNN9E7hGqq+SxwVilbnuFmvwDV03ed3ZK1X4yB38ikO4kJ0fPVSRYzpKMYku/hkldXojqw9vOkt9TL5Z8pvQ3DeA2KUzBGESlhlrZSABMZoXGPYPzZQC1rEMdtMQbBWXX8i/MWW/6NUK6p89rh9ZJK7sbN3Nxy9dl5H2TI+WQ8QZfPsBOf64/VRVxlJ1boH3EUpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEbSB53HLSTXXBdtLOBC/AcmJJnSRz/egLMsEr6ESYc=;
 b=Q6qGzNw/3pzBiAElJYP6F2Rbd0vcpD95Lo69tjs6q0pB/a5HtJ0P4M3xwIYsUu4LIb1fJIqWjDExrh/f3A13yghtVsbch3weZRX7bk77qu3DHsPVJIZq9P2Uaqre4zqpeVQedoqGfnQTBt6KCvvtELvoDlnVMVOGseRjcvnM6wg=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by LV3PR04MB9220.namprd04.prod.outlook.com (2603:10b6:408:26e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 11:29:27 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%5]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 11:29:27 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin
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
Subject: Re: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Thread-Topic: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V
 SoC
Thread-Index: AQHbmlSB2UmP2iM/Vkapdt2jPxVKBA==
Date: Fri, 21 Mar 2025 11:29:27 +0000
Message-ID: <SA3PR04MB893147FE3E09B43DA41A7DF283DB2@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
 <20250311-backdrop-porthole-440ae005e8fa@spud>
 <SA3PR04MB893164FCD6C4CB8924FC8DE583D82@SA3PR04MB8931.namprd04.prod.outlook.com>
 <20250320-uprising-couch-0af012a1fee6@spud>
 <f0dd950a-02a7-402b-a08e-015db458b273@kernel.org>
In-Reply-To: <f0dd950a-02a7-402b-a08e-015db458b273@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=cc75f644-cfc3-434d-8b0f-f26a8901dd62;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-03-21T11:26:10Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|LV3PR04MB9220:EE_
x-ms-office365-filtering-correlation-id: 10c1973a-ab17-4ffc-02ee-08dd686ba38b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TXNPVTRQMWxsMFRnWTY2QkNYVCswd2dDUUhKbXczdVZjQjl5bUVnREFxMzJo?=
 =?utf-8?B?TEd1TUViUDRHU2VuWGJhcEtKTFEveTNCK29HOWlWYVRVWWs0L21UWW04ZmJK?=
 =?utf-8?B?dTFQYi9WWWUzYlFpOGdBWERxb2hmRmVwNWRFU2hBWjJuemtnekZZUHp3di9x?=
 =?utf-8?B?d2NZZEVQYVFPQVVDVGVjQjcvRklmVnJUOFdGQVJjNitiMVlTa0o3ZXFxdndz?=
 =?utf-8?B?NmVJN0hERkxQRTlxaUVpbTgxMkZETWZxRTE1VzJwZTY1RTJmV1gzeGl2QVp5?=
 =?utf-8?B?VEdIVUU1K0hKNmR4b0JIdjE3U3RTREtVVWNKRnNUQzVmd1Zsb3JUc3hLbEdy?=
 =?utf-8?B?ZktGZXRNdGVnT0VOeEVFTTVWQ3hGcjhTTlppcFp0bDR5RzFuWi9ySUJQZFpq?=
 =?utf-8?B?S3p6KzUwUjhtZ295djFpMEVJM3JkSS9xMjRUMWNPVHJpdGo3aTBSd0VvZjcz?=
 =?utf-8?B?K1BvWnZNUG4zdXdHTjhBVUVyTmpqOWpvZ2srSHlGNXRzT0I2WWNWNWlpZSsr?=
 =?utf-8?B?L202SmRmK0ZMTTk3Z2VpY0IvTENjc2FGcklVVGxGVDN0b0svY2hrSWo2NHcy?=
 =?utf-8?B?VXErSE43ZU93RzBHd09oY09CQVU1bUo1aVh3TGFMV1haTmk1YUhZZ2pQVzVu?=
 =?utf-8?B?Mzl4eW85NzE2L1hRTEsybEhPcHlOaXRqdm50c2RGaWNNejVMemdTdmp4eHhY?=
 =?utf-8?B?eDJlTkNjRzRhYXdOdXhyckVXV04yQWNibUk3cTJERmM4WXZtOUFPVGNqeGwr?=
 =?utf-8?B?WFlTclRZaTFTL0FZcWlZZDFkRU9LVzVKMkxRUHp1VCtxd2ZjWlF2YUV2ajRi?=
 =?utf-8?B?YjZoSzdCbzhWQy83M1oyd1pQWXB1bzZ0S0lUV0lIS0doTjdTTTFrZGI3TTFZ?=
 =?utf-8?B?bE1OT3cyREFrWlArSU1sbDd1Z2ptRTFPbUZDSnZteDhCZitueDRROVNzcXJk?=
 =?utf-8?B?Q0JtUEU1TkN5MjhHNkZFS1Z1ZjBMMXZVRUdJcnVYcnhXOTJLYkpSYzFkUkNt?=
 =?utf-8?B?M09VQWk4S1crbmQ3R3BFUnY5MndmTGxzRXdib1UyaE9uV1ZwMmxjUFFKOHdr?=
 =?utf-8?B?aGlXK2dVUHkxTUxFQkhoYzJzTEZlU2g1YkdzbkdJNGZiLzZlajNZeTFEWWN4?=
 =?utf-8?B?eVdwd2xCTkpGcVBZU21pbkx1VHp2VWhQK3Z4MWlEczdBUTAzRVpWZTJoZ2Na?=
 =?utf-8?B?WTRiS0dnTDRHVjhGenFTZllSaHorNEZLOUZ0azJORHloT3N3NEpaSVhtN20v?=
 =?utf-8?B?Y3VFTGJEeDVKc0RJaVRhUTFtb0l1Rkl1Z3dNNXJwaWd6bVZpOGh5RVVRVjFJ?=
 =?utf-8?B?d1RQTDJmNTVpZWozZWpZeHpySzlQb1NIK3JxcnRPM2tBOGlaK0d1WTVscnBZ?=
 =?utf-8?B?Q3VtSjB3Uy85ekxYNGl3aXVoWHYyK2JiMWkvTWNoenJPSXJJbnB0c1g3c1gv?=
 =?utf-8?B?b3BFUk9OVExvRTRBSjdKRTN1L2lTVWc1SlprcmdvWlZMQW8xSjJIaHJHT1V6?=
 =?utf-8?B?OE8vMHdSMUF4WWRjT0xudUlwSmJPQ0pUNWZOWVhoNkFKRm0wcU4vOHRwRUJk?=
 =?utf-8?B?UmZLdUFuT2RGbXdKeklPSDdtRHVkcWsxVkpZbmNxWWptckZDSEZwNFFBdDZH?=
 =?utf-8?B?c0hOZmFFSVkyazdEdWpPbHUyQTdjTEd1VXl4R1hZU21nTWlJYUN2OFJ3U254?=
 =?utf-8?B?QzZOV2JoTFNFa0g3bzJNajdjeGNPY0toK05xcGlFdlJEZng1WEhZSHdhRVBJ?=
 =?utf-8?B?VkJwc2hqODdnUTlIaVlUWG5zQzkwdWU0ODNuVWx4WHowQ3lXN2Z1Q2dpUzl1?=
 =?utf-8?B?MmM1MjhiOG0zVDZNamJmZkpXalFEeEozSEdVYTZwanZvNVV6djNMamJXaEU0?=
 =?utf-8?B?Nzk1SkppZmdxOFNob2UydU4wT096Qmx1M2VkRVRsTjFvOEhVVHhGNEIyVllj?=
 =?utf-8?Q?PaKMWNVhSEQ/dk/rCRDgYilBcCLkhYmL?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGEyU0hVM1VMbGcvNWxvNHgyQ3pva0tvMk4zbVpmVEdyeVlyUUwwVWo0a1lZ?=
 =?utf-8?B?OU1weTdjaEpHOVhVOTI0RFlwaVVaZGlvL3k4VWdNMWhYNWgzUnBqWHFmTy95?=
 =?utf-8?B?NlZjUXR2NHVjbFhKeGRNdFhXVG5XTTE2S2hLSWVlcWxmV09WUVRoWkRQa05L?=
 =?utf-8?B?dmxhcXRNenVSMTZIbFFRM25WK1JnNEN1SWk5VnZyWEtKS2lHQU5xTlNGU05k?=
 =?utf-8?B?ZWxhOUo3ckhRQk96aFlMRExja2xaODZZeExEWHhxVFdVYXNkRFhaQTVTT0x2?=
 =?utf-8?B?U3k1OUlxOFFIRDMyTUZiaWlTT1VRa3gxbUp5azB1Uzkrb25idk1XbHZVR0JX?=
 =?utf-8?B?dWxnNnhPRTlWRzYvQjFZS1E0cVorVHMvZCsvQ2F4clZaRk9vYXkrNi96MGE5?=
 =?utf-8?B?dkxXOUlsNG1scmpTSG1JdnZlUDlwMlMyOEM1RVpBQSs3YmNiS3g1S09lQlVy?=
 =?utf-8?B?QkhudHZGeFVQaU9CeFpxM0xPVWt0bnVQVDJEeVNXSDhGRjNzMExncnZINzNm?=
 =?utf-8?B?MnhxYzlSN3ZhQ3VHcmdhQ1YwSU8xU3Jwa0lIeW0rc094OStPUnZWd0NzV0Iz?=
 =?utf-8?B?M0hoc3hURzJxRHRtcHhSMEEwMml3WEsyZU9hTzNWbkgvTWVPN0szZ2xDTUkw?=
 =?utf-8?B?Y2xpM0MvcUcvM3V6OGJKM09IWDJaN2laekFJSld1by8zZmNtNXVpYUhZYmht?=
 =?utf-8?B?alVJdFZJTk9ualArRm9GZzh0blRxd1kySVo5bFhLVDJZWW1QVEJrVGQyY3l5?=
 =?utf-8?B?bmFGMlZuVFZ1dWp4Y1BKTlBHdkNmMXA4VGhMZ2J3QjBvRGtRQy9YVmtUMDl4?=
 =?utf-8?B?bUQ1VGZjZFRiSWdIeXhCTVpMK1N3SEtwWUhXM0RENGYxdVlYd0tteEFKVFh6?=
 =?utf-8?B?N1dTMWZvcFo1TDZVMU45MFBjMjZGanFVZHJVSlAzT1VFZ0hUdmczb1dQK1N2?=
 =?utf-8?B?V1NnczlpditFQXZLUDhHSnVZY0MyRWw0dWs3R3p2c2NhMkY0MjF0QXpRUXVU?=
 =?utf-8?B?R0srQklleG5kZlFPY0d5ZG1uLzNFdk9jOFJ2ZnVNYkNMMlhmZmZpU0lZa1Ni?=
 =?utf-8?B?QVJiZGJxTVFTMDZKYytkRGJYOEhkd2s1SWJJVDJ2bW9zS3hsRWtXWjVpNG1n?=
 =?utf-8?B?Sm5jRnJaTnBoQ3kxY0x1d3NwRGpDOU9FSW5RSno4eVgyNk9hZ0pTcmlLMDZm?=
 =?utf-8?B?QjJBTk13UjZ1Z2xpTHMrNU9uMFJJeHJxd2cvRHJIUmwvWU4xNFlrNm5tWEE0?=
 =?utf-8?B?YW14QmdERThYSXhyRUtOWks2RUtUQ3Uxb2hFd0hYRHgwTFA1U2x5c2xwUHVz?=
 =?utf-8?B?RVBIdGlIUDFmQ211N3IxUVlvNWtjMmRVdTRZT1FMb2lxYmt6S2ZWcTZ0cWZx?=
 =?utf-8?B?UlNwcnJLMFRSUjJCR3JMWnFmdUZFRkcrYXd4Q09RcGI1SEMrVHV1Y3lHU3Vk?=
 =?utf-8?B?NytEaXkwNHRmckpvcDIxT0lQUU90Vngvemtua0liZSt2U1MrV0RpN0NKZVRQ?=
 =?utf-8?B?NVRPWTh1cFppd0Z4aS9WYWltdG54dVFERjFPdkY0eHZHMlcwclN4L0s4VXV1?=
 =?utf-8?B?UVlMNjErUXEwUDYrVmlNSlBZSlpWTTJHdzdQMXdUaFVyakJadCs4dUVoSFV6?=
 =?utf-8?B?Qy9wRTFZeFB1TmZvNXF3ZUlSdy9PQ1JPUFd3eFo3OEd5N2ppckZTelZwMzlI?=
 =?utf-8?B?UXF4N1R4enZGYVRHUXcwNlA2aWVsSVI4YkU4WnVEU3hsWFFVN3p6SExnTFNR?=
 =?utf-8?B?SHhyOEtWS1pXVnovSFZPSS9mZ1g0ZmZBZ1htMU53OVhVNkgvODFWc3FySkor?=
 =?utf-8?B?WTJocWNsaWYrOUhKTCtxQzk4ek5IV3ZOS1BTVnhmUmxmbjZYbnFoMEJwWXlC?=
 =?utf-8?B?b3hnbkdxenl4VmVGQ2tBTHZMY0ZoYVhqYnR5L21KSFFvR2lqMTZ3YXNXVy9P?=
 =?utf-8?B?VXFSYWlYRUNXYzlWd0JuRlF6a01pTDVnbjdsL2p0R1FWbnA1Tmk2a2w2Rkgw?=
 =?utf-8?B?SWk0MVJFWHNrTkZySDJlMTJYNnpNVW1tR2tGcUY1ZE5FMFJSMVVWQjZWZFhv?=
 =?utf-8?B?NlM1cTJiUlZSZDFuMGUyMmNjMzFxdUJDdWJnbEJRaXovYnRHQ3lHZ3FXYkU3?=
 =?utf-8?B?ZUFYSTVGRkg2Y0FQM2RERG5mYnBlWlovWkl4TlhjMWRvK01ScUkzNVpEWDhL?=
 =?utf-8?B?cGc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c1973a-ab17-4ffc-02ee-08dd686ba38b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 11:29:27.0725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJJbam/qLxA1GenDFF0iHQvaI0Q9aPH4ee2Xen8++iYfGz1d1eFo1IQ5E7fwV7wI2x0udMwzEKUKShEbePFEEd6Mnnfj/DZnyzvdHyum6Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR04MB9220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_042932_595890_05105203 
X-CRM114-Status: GOOD (  24.81  )
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

Hi Krzysztof,

On Fri, Mar 21, 2025 at 3:07 PM, Krzysztof Kozlowski wrote:
> > On Thu, Mar 20, 2025 at 10:39:52AM +0000, Pinkesh Vaghela wrote:
> >> Hi Conor,
> >>
> >> On Tue, Mar 11, 2025 at 11:38 PM, Conor Dooley wrote:
> >>> On Tue, Mar 11, 2025 at 01:04:22PM +0530, Pinkesh Vaghela wrote:
> >>>> Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> >>>> P550 CPU cluster and the first development board that uses it, the
> >>>> SiFive HiFive Premier P550.
> >>>>
> >>>> This patch series adds initial device tree and also adds ESWIN
> >>>> architecture support.
> >>>>
> >>>> Boot-tested using intiramfs with Linux 6.14.0-rc2 on HiFive Premier
> >>>> P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> >>>
> >>> There's no git tree in your MAINTAINERS entry, nor mention here of
> >>> what the story is going to be in terms of sending patches to Arnd.
> >>> Who is going to be doing that?
> >>
> >> We are not currently set up for sending signed pull requests, so for
> >> now we plan to send changes to Arnd as separate patches.
> >
> > Undesirable, but sure. You didn't answer the first part of my question
> 
> Just to clarify - separate patches as separate postings to soc@ after the review
> was done on the lists and then you applied them to the tree Conor asked
> below, right?

Correct. Once the patches are reviewed, will send separate patches to @soc
and then apply to the git tree.

Regards,
Pinkesh

> 
> > though, and there's no git tree listed in your v2 series. That part is
> > not negotiable, you have to have one and get it included in linux-next.
> 
> 
> 
> Best regards,
> Krzysztof
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
