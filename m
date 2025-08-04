Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AE8C87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGjqViL3ShQbw5xxSZjH202ofY59OaJlWQpN+PvPLU8=; b=cQuSfBGziCgXEU
	8oGwpx+peQMarWqXT1z03vuSQAn41i1KqetcWfCRK4efUh/eBFaEkPz/REIwYRuoIZB94vuoRh6K0
	aznzRCtiZbOJrt+bwDFLO5ytrezYdTHNOyXu6bJEWqtQGl7E9/fcQSEAFtB1bu5iG8fzTc8iKmDob
	0utgDVG9hG6bKG23xCOdkHVp3z0lMSueEzzdgxLcA3se1LT1cNjym2NOpYKK7d3tQB7k6fUMePW6u
	DSP7pVRCRhQ/KYMCVRW//Vz0Ijot6hean9llO0Cx64q7GDJnse3xCr0ea4ij5IsBjny7+soTMChcL
	wFhiqzPb2iU1j0E0TcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivGt-0000000AXNt-2iYi;
	Mon, 04 Aug 2025 13:30:35 +0000
Received: from mail-dm6nam11on20631.outbound.protection.outlook.com ([2a01:111:f403:2415::631] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuxg-0000000AV4f-0nUP
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 13:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIRH4VnFkDfKzSYfpMH+pu80290DLwM5DV+W3ryiUg0kBmJUe8Z55Icnrd2IFtBIRZNF88dClzLmwaz8EqZL8Hv5I42kYoj1k35TEdUrFwaiILE6jGFXVvVsnZZC8NmIPuFDoam0g34xSUN4d00NP6K2zlfp/FRjSNA3dF067Q7j1Rg0PaDSYXTXuKLk8ZBEWk6/mALN4oFo2EDwL5Sq0cosx5ZS7ieC4czR18QQYQUCO1LlN+6Jg24nMqyowFwHbp5pgdzTOGg1Ev8BYI9xmvloYi3u7g65FIflWPRIJFUjO0/46azjYnDWAIhurxejREn6/Gl2E1qJk0GQslP7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sByoKxKYd0XrD29l/E9BOiVSCQkqItu/G/WlGz0nQE=;
 b=XT4/QkE6N1xbNKE9hZfnR7rgu/2alwx1cUwTwBdqMf9XbKColC4dYhE8IhN5Fri4pIIvuEoP7tPI5cLykl+TzCyFwviJ/BkNQESMStltnEqKEOkuC2Woi8QggufFa88FULJTNUHUxGARJ5WxnLzrI41kkjZBS0FGDxSJg6xI1PbEOzL3cxnGSppCuVv74E75h1QbWUyFPjXYBn6Viig/FeNyRXF9yn0Z/IZGMWw5SfDtHacEfVL1XydFE1AOq6nCm8LkRrolS0WwuP1jHmB3KL23jmSfLcE6h5nwtnDlJKA1UJfnsKFdgiduPJkJdFLtykynJ3GISeDT36TGOAnGKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sByoKxKYd0XrD29l/E9BOiVSCQkqItu/G/WlGz0nQE=;
 b=rDIzyHDxVUL1x0CJVBtR3uyuPkjdG1CHVWPK2bLfyyeMF7vwaVFeL1NpG6yH1cYJo58uBm4zgVzGZ56DZZ3q8xjrJjpwqOnNg7wE5AXZaxOTaRPoo6O5JkUZgWBDVQ34/dOcljvUBYbR5lMVSTkEnFmsNLU+9mSLhJaUUqjKMNQ=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by MW4PR04MB7218.namprd04.prod.outlook.com (2603:10b6:303:76::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Mon, 4 Aug
 2025 13:10:39 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%6]) with mapi id 15.20.8989.017; Mon, 4 Aug 2025
 13:10:39 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
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
Subject: [External] Re: [PATCH v4 0/7] Basic device tree support for ESWIN
 EIC7700 RISC-V SoC
Thread-Topic: [External] Re: [PATCH v4 0/7] Basic device tree support for
 ESWIN EIC7700 RISC-V SoC
Thread-Index: AQHb3rESAJnHCmMu6EuhdqV2JGFLn7RN4TKQgAFx8wCAA2+O4A==
Date: Mon, 4 Aug 2025 13:10:38 +0000
Message-ID: <SA3PR04MB89312063FB96E85ABB6F3D3E8323A@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
 <SA3PR04MB8931098CC4A73E8FDD481DA78326A@SA3PR04MB8931.namprd04.prod.outlook.com>
 <2ed69301-f787-4257-8d44-a8544c1a43c9@kernel.org>
In-Reply-To: <2ed69301-f787-4257-8d44-a8544c1a43c9@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=cde35d9b-f522-4197-b54a-a4a98068453f;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-08-04T13:02:33Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|MW4PR04MB7218:EE_
x-ms-office365-filtering-correlation-id: 644561eb-37e7-462a-762b-08ddd3584ed4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WnlXRnU4aFp0QU8zN3JYQ1d0aGNkOGpHbXhzZ0tWVm5sK0xHb0pnaTNiQ1hP?=
 =?utf-8?B?cXM1YTVsRkNNOHBuM2t0cHpyb0VtRitTRXlNZGNYZUZXVGdOdlNDMGlTelJu?=
 =?utf-8?B?ZGlabisvaS9udVBCU2c0bFd2Y1JPdkkrcFFSZUxhK29vS1ZkWlUzZys1UE13?=
 =?utf-8?B?amVuWTUvRTlya2lOekxWSjk3dHorTmVnSk9CUVNwOGdiSXlENXh2WEgrenY1?=
 =?utf-8?B?cFBNd0FzWEdFdUpFeFJhRzFpc0pWV2k3ZXJIeHJEZkd5TG1ZbGhTSy9TcHNo?=
 =?utf-8?B?RFR6cmFUbm5jSjJTbU5WZENhN1FVTmo1dHBtYklNT1JyWEVCOHlFSkhlVEFT?=
 =?utf-8?B?OUxkOGkzL0dDYjlpRHZNZ0g5RjVvVG5hdTFyOXZYdGgwVmU3RXRZTTBKeVdp?=
 =?utf-8?B?eEhHWDdrLzNZMHVSb0RxQ09EZFRFdlRVVEtvQWMyRVBoeEtnbkFKSTdaRy96?=
 =?utf-8?B?T0NidVdDanJsU2dUQ3M2RFRTSmFDdjZJcnRkWkIrQW00V3lxT1VpcEw5alpS?=
 =?utf-8?B?MjV6dXNxZExTSGdZdlh1aC8vZUF4b3dpSm54NmpkdW9aeG8wN1ZkY1Z5ckVq?=
 =?utf-8?B?Qkh1Y092QmdIbG10b0tSWHh3OHR4OEtFWk9EWFoyakdrSVROcXBJOHRkRGNF?=
 =?utf-8?B?cWNLbEptT3VGcHBuMjhScXlDOTdCZTM1MkhJYW9ZbXpOQlJGTnRDcjVDdDJW?=
 =?utf-8?B?Wkl4M3d6bW1qTWpIaEdONG55OVJDQTBZVHlJRHdkbEFkUVlNTkZOemdZS0lS?=
 =?utf-8?B?Wk5sWllVTVBBb3JaMzRySFliNk1DZk5ZVW5pNTJiSTlEamRMU3M2S3lXWHBx?=
 =?utf-8?B?OWpaNFpXUnQwWkFnRTBrQ2o5ZHFWc3QvWlp5TXI3MEhpaTF6QldKVlM1ajls?=
 =?utf-8?B?eHpQVFduSFBtdkdiWHpHQUkyUHdVeUZwdnZKRTA0UDR0eDJOK1hHdXpsWHM5?=
 =?utf-8?B?RkhjWVVwV1BFQWhpWlgvYndDMmprVUtTTndPVmVEelY0b2dKYnJHaGNVVWZC?=
 =?utf-8?B?TWs5REY2TE02KzVXMk02SFlxbVJCNE81ZU1odThwa1JSakNiS0JFc09wY1VE?=
 =?utf-8?B?cWxqbEU1Qk8yeXJBVXA3emYzM2U4MVRYS0kybDlORzV0Yk8vbW04MTV0WnRP?=
 =?utf-8?B?Rzg1a0VLMUYxSCt0cEhvVXRHYnFJQUFXNlMxSm9OWlVMaDJyd2pVUFhRRC9N?=
 =?utf-8?B?NTUxWkRxMktFbG1mWlJQRHkwR1E3cGltZ0hvbzNzNkpDeldJeWxyNlVZcTdQ?=
 =?utf-8?B?OUhkVDl6ZGJnRkpZT3ZpTEduNmdvNHhvUEZrQlM2Q1JCcGJsQUt5UEJOV0Q1?=
 =?utf-8?B?b0k5NU1Xc1c2b0dIRXUvNFdDdENvZlhZM01SYkVMMDh4RnBUMWZWMitWN1Ny?=
 =?utf-8?B?NzdIMDlXeVoxOFVGakp2L2gyb1BCSS9oV29TQ294SmJraGZWRldoZkdNVkhW?=
 =?utf-8?B?REE0K0hYQmYzbUpKNGxZanJSNkNRaUlkcUwvdWFPb05RNzh6ZytUMW9Fckts?=
 =?utf-8?B?QWpoUHpGNUt6MVVQU0VXeTlyOEIzWVZnTFA5U29QT055SUg3cUQ0S1lMY0h5?=
 =?utf-8?B?akt6UFB6S0FFczFlVm53VThiWEk5c3hOYzE5bUw5TEdiY3EyM2F0UGJ5MFpy?=
 =?utf-8?B?aU5yNnVQbTVIa3FVQTVTYThZMUFEa2VnY1RoWklFeTdmeTBvblVlTDJkblZo?=
 =?utf-8?B?MWtGVXZkK05hNXJCbjdvdFluZ3IybXdKN0tvTDE4ZDV0TkkvdDY4M2RBRFJB?=
 =?utf-8?B?L0xsOFBDaHc2aWVIcDBvaThmTjJLcEZ0QU1ka0E5WjI3SmhZYmZMakNibzhB?=
 =?utf-8?B?R3BLTTJWb21hVGJlOE5CYXl1WkV0dGUxblFQdFpmMm5KeTVHaFFLR3hOZlFS?=
 =?utf-8?B?WWdRVVQycnJheWsyNXQ5cnVLbXMrbVUvNkZqelV2d3BZYUlKcTNqdXpONFVS?=
 =?utf-8?B?UWttK1BUQWFHd3U0UkVVenkzUWRES0QrL3JWQ21RWUY0Q1MwajBEeWl5K0ZC?=
 =?utf-8?B?c2ZSa2RSSVd3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2p3My82bTEyS3BHVFF4VnA0YmdsUElCaHBVQ25mVFAxSHZvWGt6d0ZOR3BG?=
 =?utf-8?B?Ym9UUHBQaHQwTWM1SkJHU28rMHFmM010aUlGRmQ2clhhaGtXSGsrVXRWMEpT?=
 =?utf-8?B?ekZOLzNlN2txNERRbHhmb2tRVmxLYmhzN3dkcjgwcWw1cDhJK1pDZmVDYml4?=
 =?utf-8?B?bERpRnRxZ3UwTnhBb2N0TXFLOS80QjNYT1krdUgxU2JBSmd3T2NNWVBwTEcv?=
 =?utf-8?B?N01oUWFUQnlFdlFjczZuQlBVSmpFN21zUFVoc0FvTGcvUGZmYUh3bXFHN3lj?=
 =?utf-8?B?Q0lualMyUXpqTHRhZU9mNG5ySjQraWx3VnJTdEpocFJnN0wvOVRzSmdhajNV?=
 =?utf-8?B?S3JPOGxVTU1OTFBZc1ZBU0plQ3I3UVpXa29hZnBlb3JHdjZDRlk3Q2lTU2VM?=
 =?utf-8?B?Wjg2SXFjblRIU3BDdlM4MENPazhldWhKaFNta0ZBdFBvSDdlNHVHRThvVE1r?=
 =?utf-8?B?dUZnbmdUdm5uSjBoQS8ybC9SZXRsNmwycjZncFNmSjZDWGlhNDF0UlRGQXNy?=
 =?utf-8?B?bVlKcHdoZVVxNmRXRVZvdjFFSzdaanQxb3RWdzFTdU10NGIwTmRDVEJDVFJ4?=
 =?utf-8?B?YzVjR3kvWHpBbVpOT0VSNFpSMVZvdy9iTnZQN2hRVUxDSnY2M0ZkdG5DdWRT?=
 =?utf-8?B?VTJYNlloNDBmUTVJbklpL282YUc1blZwMEkybSt0dzNFYmZUTmJqZXJHUFFL?=
 =?utf-8?B?MEJTNlo3UEYzdEgvMnRQNjl0MWZLMmd0bzNjT0x5V3ZCS0d6dkRzMGxBOVpL?=
 =?utf-8?B?T3Q2cWY1bDd0VW5LK2hibDl2RVhPK2x5SjhBcWs5eGhhS2ZUQUZLZHNiWFhR?=
 =?utf-8?B?NVJ3U3orWlRILzBLalozbTJ0Z25qSUkrOFdnd1g5OUpWK2haNWtFRDJ1U3JO?=
 =?utf-8?B?d3AxZ21oZGtlSE92dERKOGdGTDJjZkhHZ0RhR3pkU1lmMTBMUGR6OGFueGhi?=
 =?utf-8?B?Z2lYdzZ0Rmh0QlA4T1RXdCs2aDZyQUw1U3NEdERxa1NZSWNrTFpmOGc5K3Zs?=
 =?utf-8?B?bnBJcGI4ZWhwanI2RkU3MzNURkVMRjlkOE1RM3hDZ0FQdUJMdFMzZVBlUVZW?=
 =?utf-8?B?eTllTjhKWW9MdHF4cVMzT2dvVCtYUHRNWjN2VVNMU1plcFpHU2cxZVZQSG1Y?=
 =?utf-8?B?VUVsRzk0dmZrR2NYL0w2OHUzTEpQSTRPWFZha2crMkFhamJiTitpTGNNLytz?=
 =?utf-8?B?eEZpWmg3bjFaSGNVYlQ5USt1dXBXMS9mL2RKc3NRVEZka3k4c1o0bTcrdGgv?=
 =?utf-8?B?MXkzakxvN3lSYjBmUmRBSnFvOGVCb3REK01ncGFjcnZoZlJtd0NmTGhpRm1L?=
 =?utf-8?B?S0hTYnlIRUNuTE1xWkJzUkFHWE0vd1JUSUQ5SzB0WUJhN2NDMjdFWnhNNGtM?=
 =?utf-8?B?MGM5UWNjMXQ3WXdTK2pqYlJTdDRXNGVQdHlNYm9zMkdVMHFHNXBJRmlaTi9k?=
 =?utf-8?B?b2dvNTRCMmFzRUVHSmJPd085aUpabXR1TUVGVUl1VThlN1h0eGMxN1FkMm03?=
 =?utf-8?B?YVVVWVZZWTNRVmhCUmtyVVdqVTdDck1DaXdiQTJGeWpqekQzdTM1alNvc2dt?=
 =?utf-8?B?MVpGYUUrNVF2N3kzdVJidWs1N1EvVkwwQXVNdHdEU3F6d0MrREZEbVB5K3ln?=
 =?utf-8?B?eXkreFhYei9GUGZJY0lEWUhSdzNqOVFyak55NGthZjlGeE1SZHlZOE95N1FH?=
 =?utf-8?B?QzVMNkhSMFFsWGJvamprVVpGUFJVclhkaUdqWmJhd21wQ1BmUDNaWCtZR01l?=
 =?utf-8?B?WTFrWklEOHl2a25rRFc1T2FieW0zcFRveXR5aExUejFZWnB6b040K25GeXJO?=
 =?utf-8?B?citoaGZHWWRwNW1CdllBZUpMK0NrU3FRTkhvNlc1QUI0YzcvcFVuelNIeVM5?=
 =?utf-8?B?U2VId256VUxMeUNNaVNhelJ5aVhVK0tMeTF6MVUyN2dEclI4OFJSM2c4Z1hH?=
 =?utf-8?B?RFh2NktXZTQzYk1EUmRXRGZyOGRsdEY3ZmZRaTY4ZmxlTkVWaW1YOVhaL1Bs?=
 =?utf-8?B?WVNuakt1SE1uV0UvbUJEN1JBYzk1emtDL3VFTkkxRWdWYW9RTDJnVEczeWV6?=
 =?utf-8?B?bU96MGRiR2g3SEM5cnk2anhndzNhUXduL1VkOHFiWTN2VTlOZlgwMlJTbzZR?=
 =?utf-8?B?Ynp2L0RQRG8vdGVMUkN4RWR2WmRQcWVJaWhVM1hMR09ya09UVGZvWXhVYklu?=
 =?utf-8?B?UkE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644561eb-37e7-462a-762b-08ddd3584ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 13:10:38.9559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4Lab2NADvg9Y0IWuZODQ/xFSTtm6gMT9tVuuHP/4gHlPuMnq7jdU02Dj7pF2DC7/db+wrrar9qOlcfn2LYduuqo7CUoAxkrTYBZXv5E5n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_061044_249503_C524222D 
X-CRM114-Status: GOOD (  11.94  )
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

Hello Krzysztof,

Sorry to bother you. I pinged because we addressed all the review comments of V3 in V4. But on V4 we have not received any comments since last 6 weeks.
Could you please let us know what should be the further steps?

Regards,
Pinkesh

On Sat, Aug 2, 2025 at 2:05 PM, Krzysztof Kozlowski wrote:
> On 01/08/2025 12:34, Pinkesh Vaghela wrote:
> > Hello All,
> >
> > Gentle reminder to review DT patches.
> 
> 
> You already received review. Don't ping needlessly. Otherwise it feels like our
> review was worthless and you ask for some other.
> 
> Best regards,
> Krzysztof
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
