Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C562DC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 08:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jO0POdoKv33H++P9P40gDgCTXMLs38TTUhb2ypZatAo=; b=wsyXVNW3HlR5YT
	5W6iAjPmzgr4ZS/U0K9C9sigO4AU6bVTlzeDHH7rP+nmiOiFELbwT0UyyDaoCRz/cJY5j+rYF8/XM
	wbKmdTyuZno18TkS0uHZAfSqg+FOkaVN+20QwofwQ3W6CoDywkf+d3vdTLJ9nmLUbVeXj5jCxQFLQ
	mVMt73btDXhasxL69dArTzbo7rdk4WnAV9UFJNh+24/7R84S4PpXJTTazoRGlxKpPKHXg7IjcohvJ
	4IkBj6QXdqC3KygNxxbZUkYA1YCxCFPco2kMu9PXfQ0Bl0q7mnO/GLjABMSh5D2nATcyoB5gWtqAc
	Fba/jzcDpRyXGYscR3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39TJ-0000000Cyox-1Yq8;
	Fri, 11 Apr 2025 08:10:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39S5-0000000CyhI-2KK8
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Apr 2025 08:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eAbxaSboH43W6drahySyZx9kwZs9jJ4QRwqToZCNLUI=; b=OvOrthfB3PwqFhfrhimi1Soc+Y
	Qhlud/i9ntRrWCeGPobdzf46bVyCfGs6Szps89WGSQymqil4ASrIo1u9oBGL9y9AE+LZxsMx7mmfn
	HjI/SA1T0C42BpSxmz5Is2BqBDmfoVFuwCaieghQ3KCBVeWl+wRmKjvnJZYNuI/Tn+WuFZSx1j9Q8
	+rCNbcV31pF8pxifadjG4u3FYd09RZ4ahhGMndk3MnG5r38b6z9D+2+RxOF786hJqnl22kLUc2uv2
	OLM/CEhvhONQKE0Xie2dgkNguqcVtFpaigN9cAZPY5IRMoFHi9ocitisg/uyPUUX9UwAZ2WrfbBTv
	0bsKc/Kw==;
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u39S2-00000008ydq-0Ptz
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 08:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oK9fZTELS03ruN1+33SD58ytxNTFWyDpgmFCz0tKaBmJs/d5FjKdw+LU/3PdruaWOj9PL2TGq0ybuxJNtofRunN97WLNphBgpMU0RVa805Ql6iFVrZ0/25ke/9ZEWQAGjrr+7zFXYFTe1juRtKHXfu5N9Y9j8m8uDRtZm26wNjRlwKaexcrUxaq5Wz7xzR/RuVQzj54VJyDDh5WhKHbcgaNVTb+HvhvBLCkWjtM85pU2Hr5WVn3grzQxNbU/8oDMP4Tb6fiLzWsWTke+A8jBZcZvw/iVxiVODnKNf1RX0Z0uSaM3IhoZmp7Kq5uCJnzDKlv/U9Tujx7ibFlACt/WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAbxaSboH43W6drahySyZx9kwZs9jJ4QRwqToZCNLUI=;
 b=bIsEqgu3m+PtU3uSnWcusrfAIx85Kilr2nE8LPLOoj9MH2WeQQ2G2JDFnYi6SQ7nJJKGDF8589Rul/ZHfCC3n9kg1BfZrLNLSohfgbF1/XLnnx4gPdEIShcRtBhIrNdx5+5h8CVezoVUcIrDUoGHE9wmP7ExaVh9lR8+6Oy73MR/sx1YYBioYALMy4zPh8QMxZOhofeKTMPj/ZklyCbmoDz50jt40iuVU46epRNiLWRqkHJw6IHg9i54UMFwkDaQsqJkO9v/o/V6Ri4vL94NUO/CONnKtsJG2KyaFriIi1RJ9MRvns9fwVXk0DqRcU13rC7e1TQOXBhjkpYvW+yldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAbxaSboH43W6drahySyZx9kwZs9jJ4QRwqToZCNLUI=;
 b=RXeGzFfgU5ePfO4OZXmNePa8BtvzvFjZ2pLyiZ2VwCq3DSpnSJShb7UUPS/63tsDyEskCZPp7StMd2fvIWidRHTsvXN88cGD/JnUFT9xHJFfdEnsmp43ofHzd5hwNRX3e93ojyV50Z3Am/vqsNTdo4AEfxsXyir2AjGsdOzvjkg=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by CH5PR04MB9549.namprd04.prod.outlook.com (2603:10b6:610:210::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 08:09:19 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%5]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 08:09:18 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Anup Patel <anup@brainfault.org>, Yu Chien Peter Lin
	<peterlin@andestech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Kanak Shilledar
	<kanakshilledar@gmail.com>, Samuel Holland <samuel.holland@sifive.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pritesh Patel
	<pritesh.patel@einfochips.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas
 Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
	Yangyu Chen <cyy@cyyself.name>, "rafal@milecki.pl" <rafal@milecki.pl>, Conor
 Dooley <conor@kernel.org>, Min Lin <linmin@eswincomputing.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/10] dt-bindings: vendor-prefixes: add eswin
Thread-Topic: [PATCH v3 03/10] dt-bindings: vendor-prefixes: add eswin
Thread-Index: AQHbqrkGJfwKBoayPkqibQBseIrSMQ==
Date: Fri, 11 Apr 2025 08:09:18 +0000
Message-ID: <SA3PR04MB8931CE58B77461178FA2662883B62@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-4-pinkesh.vaghela@einfochips.com>
 <174430638306.431792.13578234809737502743.robh@kernel.org>
In-Reply-To: <174430638306.431792.13578234809737502743.robh@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=ad4383c1-4cc5-4fb7-b128-1a4a858532b4;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-04-11T08:04:48Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|CH5PR04MB9549:EE_
x-ms-office365-filtering-correlation-id: 4a97ba34-06c3-42f4-d644-08dd78d028c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?XUasaOJ9rjNtGX7QteXRHkOF/jCZMkfDqiC7420RczTakLzSNUwUb8WMu8cd?=
 =?us-ascii?Q?sfCuhfvCsJUxV5S/Cwm414i4YSdSUUYR8Be0whBYodoW1g8x8LqaDfDSuhK0?=
 =?us-ascii?Q?JbImhI4+YKGvjo00T460mFABbK8ZVnqd/4DUGxEHf6DZNLzZnhO+VfBgTAke?=
 =?us-ascii?Q?mV4713cd57QuJCxgBcHZUBCzlzA5k715P4S1Msu6f/I5Zs1f0wPfAsEC4J2A?=
 =?us-ascii?Q?7zXaMM62vmkp2eFlXwSb4Exx+12wLVdQjbIe8G9wWS+/Kcy6XEKCgbiCq8AG?=
 =?us-ascii?Q?ggWr1DPyP/MTy0HGGWEyEVF6Khi8Ycd66f8Zud4QDfyqGT1OLtAp6HvP6DQ2?=
 =?us-ascii?Q?bZOy0GxuCa5VUvGxWbQRLlr2sS7VFaByIctZiKB23cyAmI6lUfpiQQV+J7qa?=
 =?us-ascii?Q?BRMACYI10XuBTQ/tt358LetXJ1+gnTS67MI1egHCUR0IePwSpjVmszHQ14Rg?=
 =?us-ascii?Q?VVfeOUscLkBnhlzk5ZeDZq7th/WZ06dJwyVpT0bIjtiX7UVsbDHZfwYJC/8a?=
 =?us-ascii?Q?7HVpmQKzvdTNNDFmRsjcvhVhOos0amxNsqUj1ztTfM27FPbmKrWEsZg8v6iF?=
 =?us-ascii?Q?hhQDCkUHRMDf+s0iHB7j5ueoPRU/Bic6fb3j8IZtvLGemGnBoOv3gjm36u+Z?=
 =?us-ascii?Q?gdRt3JmJ8y4pBBBCF5uP5tuaNdCq5OWVFsWktO9KBfbgEbkzu14E9+yO3ovI?=
 =?us-ascii?Q?P2nKbXF9qKnGJrqozi188Xb252TQ871eCu0yXnWfLliX6eQG6JsrFbpcHJIh?=
 =?us-ascii?Q?ColccoCTJ6ZXtYTB8TossMlfbVLS8dAqXgCGvqI1UXoOXamQYMdb7XKhvQE6?=
 =?us-ascii?Q?zOnU0nVuCIGxbWp3Um+oIqBVDwckBmMlLO9GphCZaRYFirNw7BbEtptThBy9?=
 =?us-ascii?Q?w9JZ4g1nwds64RQA7GbVTIL2mXuytvKYhaeQeVF4NUhxRU6v1i9nymas5o++?=
 =?us-ascii?Q?EjPGoaNUKfjG23B+luwzv9mhMGWSChia/oH8V87O+PeiNLnmBXvCnJm6ot2t?=
 =?us-ascii?Q?Tgq3ahXzn7qfRLKPs8DNYIuFy8s7k2YoXQR+RwU7ineFkybL/c95rR5tAFfN?=
 =?us-ascii?Q?EB8ywQWvYxZZ634YzPtLpBwFMYytfU5C9xdPQuSNCSz1qB5oWi3FB/WPu3Cu?=
 =?us-ascii?Q?+Lg9L8Z5z72x6DJ7Mc8so1v0431qVDNJ5/926BGaMTad9Tg79I2GqsI6aCC7?=
 =?us-ascii?Q?V8GKvYmhlQTnebBunVKY+8UcMASiymroNXfLshvz2Uehle4jEar/4+3IMeum?=
 =?us-ascii?Q?7ZAkw2yn6GvT4WjSY5KGSIg343jUyR/YgMJ9vyVZJI4ehP6VcXd1dq2Z+le1?=
 =?us-ascii?Q?Ct+xynNdMqMWdm7aRK3g9aj5MDU8bnmBMai6C/yDfoRQhZEWve9iW02er4+3?=
 =?us-ascii?Q?0QyrQ5Ul7tQNBh0Q9G8rGao9OjjdDUNU5QnNfoTyezAfosIEBNts+F+ThUNz?=
 =?us-ascii?Q?wRneX/VPeKAqsyUp8/JxBybHrwo4WXu4z66OjD+qM+CqRFs/hDosMg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oXxtKbIriXW6uLqFVSAid2CxJVNmifGd2qiG5N54x4hbDBvZqu8Fsp3IH5f9?=
 =?us-ascii?Q?mCxaZAbL38V+7gVC2yErnWYtMsOP9STGBsSyGiFMxlN4e1Pat4kvvBw5N1rU?=
 =?us-ascii?Q?o2m2Lie3wpm0pdofPfR0I2yk+tAuXrvZ/5/+FbYnkgwpnjNletORkwiXCUQk?=
 =?us-ascii?Q?+aNKv8jZ0ufy+zQIAyeF/XVKakILW+lm69lXAdSQRyqAGe9aXQ2v9zBYwKaP?=
 =?us-ascii?Q?LoeqmHck2xFPzh5xXOsi5WbU2sVix0bB8/c2qCCW97agsV3Qp1U9t3PbZDVu?=
 =?us-ascii?Q?HYlzAvVcn8I1MetxRMDCJn5+fSBzbf16Hq1tWc5ktU+p1lLVWjSbaPqom1GA?=
 =?us-ascii?Q?FfuJvrO2Si4r793qUjO+JyO4XzzCrL2/9JWh7roShi8mj3dl1yHBN84nMhgx?=
 =?us-ascii?Q?f3PYl+ptOkkBKWs/C7eACrkh7kOOs+c+CGGamXCD2weK97uYDLoQ6JrINsaz?=
 =?us-ascii?Q?/8kid4rGCHkDAkBFRMkjDehwsqW4TZaMI1cOEM2bHhd3A+ebxzdzkWi/g49C?=
 =?us-ascii?Q?XtYUyoGIqB+8ZZpGBW4wu7y3I9vsl0byodm0MyxgJm29sKQx6ukaX/aAFqTl?=
 =?us-ascii?Q?Si1sXHFPELPf9hXZfMH8/YhHWKOY2PjrjYkBUK+fkYYN4CTuh9cfo4rOayt2?=
 =?us-ascii?Q?FLzwbxWYalCeIB0C8/sHZtQq/wnkAJ9tBB7o/LZai2z61WMVEo1jJyqCu7Ko?=
 =?us-ascii?Q?FsYTb9r1Vt80WMg/Q0uRX+3FwGc/xryyP4npgw6w8mkhp2vQYQRCUh4Zblxl?=
 =?us-ascii?Q?0yclrYrv+3GLE9U5ywhfRSG78PZ7WJWiVWXQTuHCmCNWi1A5HDmGVmUY9XeJ?=
 =?us-ascii?Q?tdJxfPgtpMJa+QmGTmJszHaz82cJmnOj05Peudc0DtIuHHr2Zuk13KqSHa6Y?=
 =?us-ascii?Q?ER5085E5UWvYn79ko0hG0RIpqInkFj6s+nV6+1BgtemHmKcl0hQVJVFdmzW+?=
 =?us-ascii?Q?TdhTzH4ecVHxXoFUaRdpq+ep3Su4Af6k/tJbaNuM3nssUj767J1/UUHOJbEF?=
 =?us-ascii?Q?vRGXOHx4A6CCZKfIX5jwyhN1G1biDxHyMwb8vPP7xBx+unDEsJ36r+1NtiRs?=
 =?us-ascii?Q?MKWlZsPt5Bkt/f6LGTQpl7qfPvx2gY+6fGh5ZDsu9aFYC3Cld4w6qpfUsxyV?=
 =?us-ascii?Q?NB/0zVnvmzcJfrkvy9ctk9hTzTUPAnLXxFfsBNz6EK4fzsH3YM4ODlsfR7Mm?=
 =?us-ascii?Q?nRKb4at2bdyCW8dDpCkSy5kiXpdX3DyCaIj1ee5x5TtNcGGbvF2X/4FV2kRC?=
 =?us-ascii?Q?oxs4CTlSY6wBTnGTYOvrFAxOdDdPvsMipQxqogm3DXy1ai1ifPR3PtAP1LBa?=
 =?us-ascii?Q?dKgfH3EGLQ+ojG0Dlr/hkUW3vryp29u+cy/n3wYlOLQFngO7rcbdqZh6Zyv9?=
 =?us-ascii?Q?Q4pbd+YJKu0bhaPyTmWYOnxQwOQ1WHYLXko9agAHSVu4CWbJDSTjZ5yyAOeW?=
 =?us-ascii?Q?Ht9DGmfgFtX3127gAXWgJaD5ngnUtm7zFjyexDErKzv15QVGajhdWOaY0wjX?=
 =?us-ascii?Q?D9p2k9LKtE4/CQ+yvWXjNTIaOFoBJ3FUcqqH21hiPoTXUhoA1y5RgChXMoL5?=
 =?us-ascii?Q?9+8atso97ZiQH87xLhLX3ZUzVC+3GUj3GSXxDiPQD0eTCrmICOFt+2TN8wzp?=
 =?us-ascii?Q?gw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a97ba34-06c3-42f4-d644-08dd78d028c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 08:09:18.8852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoIYa0quM+AUZxE7E1MBYRYW+05FZxH5QJbXUphJ9AFL8NRkXoBhsnEbGdfEq55nODOdJSfqU0O1GANKEjxxeQ7ZpzDFxbgHEQamSxiKfRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR04MB9549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_090926_445662_3180D82D 
X-CRM114-Status: GOOD (  13.43  )
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


Hi Rob,

On Thu, Apr 10, 2025 at 11:03 PM, Rob Herring wrote:
> On Thu, 10 Apr 2025 20:55:12 +0530, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > Add new vendor string to dt bindings.
> > This new vendor string is used by
> > - ESWIN EIC770X SoC
> > - HiFive Premier P550 board which uses EIC7700 SoC.
> >
> > Link:
> >
> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.
> >
> eswin.com%2Fen%2F&data=05%7C02%7Cpinkesh.vaghela%40einfochips.com
> %7C87
> >
> cd3ca4575c4f4e664908dd7855c0a2%7C0beb0c359cbb4feb99e5589e415c794
> 4%7C1%
> >
> 7C0%7C638799032006858529%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1
> hcGkiOnRyd
> >
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> D%3
> >
> D%7C0%7C%7C%7C&sdata=lkMx%2BsV%2BmsaAdojVnWDZAvQnY1rR%2ByS
> 4VB%2FK7JxCS
> > Iw%3D&reserved=0
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/interrupt-
> controller/econet,en751221-intc.example.dtb: interrupt-controller@1fb40000
> (econet,en751221-intc): 'econet,shadow-interrupts' does not match any of
> the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-
> fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*',
> '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-
> single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-
> encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.*',
> '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.*',
> '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-
> ._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', '^acbel,.*',
> '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', '^ad,.*',
> '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^adieng,.*',
> '^admatec,.*', '^advantech,.*', '^a  eroflexgaisler,.*', '^aesop,.*', '^airoha,.*',
> '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*',
> '^allegromicro,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^alphascale,.*',
> '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*', '^amd,.*',
> '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.*',
> '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*',
> '^anvo,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,.*',
> '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^ariaboard,.*', '^aries,.*',
> '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^asahi-
> kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralabs,.*',
> '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea,.*',
> '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia,.*', '^axis,.*',
> '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^be  acon,.*', '^beagle,.*',
> '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*', '^blutek,.*',
> '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bsh,.*',
> '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '^calao,.*',
> '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.*',
> '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^cdns,.*',
> '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,.*',
> '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzhou,.*',
> '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^cirrus,.*',
> '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*', '^cnxt,.*',
> '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,.*',
> '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', '^creative,.*',
> '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^ctera,.*'
>  , '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cyx,.*', '^cznic,.*',
> '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell,.*',
> '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^dfrobot,.*',
> '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^diodes,.*',
> '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*',
> '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*',
> '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-systart,.*',
> '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees,.*',
> '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^elgin,.*',
> '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^emcraft,.*',
> '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enclustra,.*',
> '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*',
> '^epcos,.*', '^e  pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*', '^ettus,.*',
> '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*', '^excito,.*',
> '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,.*',
> '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '^feiyang,.*',
> '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^freebox,.*', '^freecom,.*',
> '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^galaxycore,.*',
> '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*', '^ge,.*',
> '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^genesys,.*',
> '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,.*',
> '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldelico,.*',
> '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grmn,.*',
> '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*',
> '^hardkernel,.*  ', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschmann,.*',
> '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek,.*',
> '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '^hpe,.*',
> '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*',
> '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i2se,.*',
> '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '^imagis,.*', '^img,.*',
> '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*',
> '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,.*',
> '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^inspur,.*',
> '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inversepath,.*',
> '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*', '^itead,.*',
> '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.*', '^jedec,.*',
> '^jenson,.*', '^  jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '^joz,.*',
> '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*',
> '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^kionix,.*',
> '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*', '^kyo,.*',
> '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lckfb,.*',
> '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^lenovo,.*',
> '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*', '^lincolntech,.*',
> '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*', '^linux,.*',
> '^linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logictechno,.*',
> '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,.*',
> '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,.*',
> '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix,.*',
> '^maxim,.*', '^maxlinear,.
>  *', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*',
> '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*',
> '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*',
> '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrystal,.*',
> '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,.*',
> '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^miramems,.*',
> '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*',
> '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*',
> '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*',
> '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*', '^multi-
> inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myir,.*',
> '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*',
> '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix,.*',
> '^netxeon,.*', '
>  ^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing,.*',
> '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing,.*',
> '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.*',
> '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', '^okaya,.*',
> '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.*',
> '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*',
> '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*',
> '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddisplays,.*',
> '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmaker,.*',
> '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*',
> '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*',
> '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*', '^plx,.*',
> '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^p  olyhex,.*',
> '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*',
> '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', '^prt,.*',
> '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qemu,.*',
> '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^quanta,.*',
> '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,.*',
> '^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', '^renesas,.*',
> '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '^rikomagic,.*',
> '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ronbo,.*',
> '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '^samtec,.*',
> '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*',
> '^schneider,.*', '^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seirobotics,.*',
> '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercomm,.*',
> '^sff,.*'
>  , '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shimafuji,.*',
> '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens,.*',
> '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs,.*', '^silan,.*',
> '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^siliconmitus,.*',
> '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,.*',
> '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skyworks,.*',
> '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^sochip,.*',
> '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*',
> '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spinalhdl,.*',
> '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^st-ericsson,.*',
> '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*', '^stericsson,.*',
> '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*',
> '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*',
> '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*', '^tcl,.*',
> '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^technologic,.*',
> '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*',
> '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.*', '^thingyjp,.*',
> '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.*',
> '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '^toradex,.*',
> '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*',
> '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.*', '^tsd,.*',
> '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,.*',
> '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^uni-t,.*', '^uniwest,.*',
> '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^vaisala,.*', '^vam
> rs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,.*', '^vicor,.*',
> '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,.*',
> '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^voltafield,.*',
> '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wand,.*',
> '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexler,.*',
> '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*',
> '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winstar,.*', '^wirelesstag,.*',
> '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers,.*',
> '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^xinpeng,.*',
> '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yadro,.*',
> '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.*',
> '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*',
> '^yuzukihd,.*', '^zarlink,.*', '
>  ^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmagic,.*', '^zte,.*',
> '^zyxel,.*', 'pinctrl-[0-9]+'
>         from schema $id:
> https://nam04.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicet
> ree.org%2Fschemas%2Fvendor-
> prefixes.yaml%23&data=05%7C02%7Cpinkesh.vaghela%40einfochips.com%7C
> 87cd3ca4575c4f4e664908dd7855c0a2%7C0beb0c359cbb4feb99e5589e415c7
> 944%7C1%7C0%7C638799032006878189%7CUnknown%7CTWFpbGZsb3d8ey
> JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiT
> WFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=pzMClfDGuAFiIexgRZJo
> 7JZpMuGIUzeHj2hXghDFiHA%3D&reserved=0
> 
> doc reference errors (make refcheckdocs):
> 
> See
> https://nam04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch
> work.ozlabs.org%2Fproject%2Fdevicetree-
> bindings%2Fpatch%2F20250410152519.1358964-4-
> pinkesh.vaghela%40einfochips.com&data=05%7C02%7Cpinkesh.vaghela%40e
> infochips.com%7C87cd3ca4575c4f4e664908dd7855c0a2%7C0beb0c359cbb4f
> eb99e5589e415c7944%7C1%7C0%7C638799032006888279%7CUnknown%7C
> TWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJX
> aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mC
> 1yzKGp4zGCCVmpokRiTcl3mEsm1mYLuylQM3t2Tng%3D&reserved=0
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above error(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your
> schema.

Thanks for your time.
This warnings/errors is because of "econet" is not introduced as vendor in 
vendor-prefixes.yaml. We also observe the same warnings/errors on latest rc1
without our patches.

Regards,
Pinkesh


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
