Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E498E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 14:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpgJJbKFMtW9EzCXif0AG225Qiat+TFXaOUnwSvVqVw=; b=fULP/cNb5etwAV
	aYbyHDI4jJtXivlFBkQ0EClIip1exrYrPeO9WIm6iy6wdtWOwb8lowscAEW8UA/8anS57s7XEdk6b
	lfv/7o2faRQjjfDP2dRZOR9dxzJtoaxZf3wz/GUY83j+yxSNQwLIEjPB8dbqu8IDb+idB0m3llwTa
	qwSWa5NegSh2eZnMl78hdfO4g8yj1TkOsjrKIJtTQyDV5zpe4k74iqayso/omQtsbPjn+XSuv4wAJ
	HYot+lInL0628Hf0vG+kLj7DSf6HTw/Sd/8Wd338CQDulutXdEeBxJzOBhP1B0GtAXl1Dqhs1FMwd
	DxDg96R8VEisbKcsUw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLly-0000000AXy9-0rRA;
	Thu, 02 Jan 2025 14:02:02 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLlv-0000000AXxe-0Xh6
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 14:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pd+nLEcHbMLswJ6BY1VZUy+fwGS4wvwYOmJlcl6ndtjKrUWUPKqorfZKi6JYfWsZ5DYfYdNOpXE775IR75lrwO94ckzoRaMhjqtDV+oyaCMK0VRcJ7sUxSpMJMoW5KYf0+p8y/iLhOShYrJtys9Ho1MOkbQ83y3FGau2t5a32bTuEGJJxCfDdskvh9aaApZzhxwPjjQ7RXmpydpwxAC2Xzk7BAw9eBn22MwAznLjqIvkRJZM3wM6PSmsmMIgJ+Revs7BN6qisSdVRWHf3cq9QkOUyuDoGI+C4w0uhjsXzIcqTkJLnxLr/NFUpYVm/k/uXZAA2wAY3S15+AQuT6ij3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8DczF82UR0KQ6qgBRBqsL+MIe9QBo73JcKPeQNit1Y=;
 b=UFwyv2di0sBkCqfY28j3MI+OCZcfcI6Psmo/vTNnj9baLXsn0XIWz3vWRPMg9S778u0LtXvUVqEPgyQuOE7QYnFA+Fcv6MGypQK4736F5d4eCbxF26R59WW5Z1NoElhJO14MBXRwVodew5VRcO/9zkTqE6UL21qCKfkXazI/tfC2nCkJuDcIuXDlB6UG2z+2OC+N3gQp0vJe2zrxwIpGAL+jry98jWJweUvEk6OeuTDFjpngAoZWscicFhXMyiAsPe9K1i7/r303KGMoxzEeXgFZFVSYYqYhMsSJtVUZaymO/J9rHPZygeqjUCHsk72mHfrVyISHaKnbhR836oKs+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8DczF82UR0KQ6qgBRBqsL+MIe9QBo73JcKPeQNit1Y=;
 b=PJBGwIXQ/RpQeuBZ9fsTGhuvBc9kMbPS7J/qChCS3fQnAv+u0bFUiOIqJOmm2K9znOUjjuogNasBQ5sicjk48RoI5DwMs5PSGZo10bYnp63zWWZbJJUNZYf23pqSSkBxRkYEXHEVLrBWS+gQs/kkPe5WNyMuNnIDOj+8lMTGghg=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by VI0PR09MB7805.eurprd09.prod.outlook.com (2603:10a6:800:216::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 14:01:47 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%3]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 14:01:47 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] riscv,aplic: support for hart indexes
Thread-Topic: [PATCH 0/2] riscv,aplic: support for hart indexes
Thread-Index: AQHbXPqLn4y81XZt1kmuu+EQn2q/K7MDbzuAgAAMbO4=
Date: Thu, 2 Jan 2025 14:01:47 +0000
Message-ID: <VI1PR09MB2333299725201F26F23A803694142@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
 <CAAhSdy0cBkogjR1DbcS9-TLRbKiDqVTydrYQCihnEHDRu69CoQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0cBkogjR1DbcS9-TLRbKiDqVTydrYQCihnEHDRu69CoQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|VI0PR09MB7805:EE_
x-ms-office365-filtering-correlation-id: 134b83e1-a3dd-4bb5-0490-08dd2b35ff4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?gLvIDg33DiYHSXD1J60RjeJLUNlWajbE8DLAzdC/k0pQi79ktt0eOmxSRF?=
 =?iso-8859-1?Q?NrWPkmVV9J96WcJf+6yp1JrUaO5mCGZUJjksSE7X375ozUeVSLL/EWA7FB?=
 =?iso-8859-1?Q?enw9u+po6V5gBxPg4YuQ0RgggceCDPv3fg8ayFkdkHyggElebcj3T/NBL3?=
 =?iso-8859-1?Q?DjPaOnLrtW14snBL68wnCpG8A328E3gdqZzzjnrA8vNdq293SfMC9JXxzD?=
 =?iso-8859-1?Q?XWIzFPVSrHvpaIC1TcmUnnhJaLR1gj7haKuoLtECw5MNoAE4FTHWM3R7Ot?=
 =?iso-8859-1?Q?B+b8laQD+rVPESqH8JNquErtuSLy5zzXxe88tLAJ/CW+yrfQFp7u6EVj7/?=
 =?iso-8859-1?Q?NEVBxLrxdO6aJ6wDEA8iDphyVY/776sEMtasNS8AdtN89FxZmbwn6+DXMa?=
 =?iso-8859-1?Q?o+t0a2/3keBSs+0Zz3sTmZcoqS0+w0FXgPJ+HcNoDeouVFhkxqgcJzfuS2?=
 =?iso-8859-1?Q?5dAv4hsy4fr6ZSLpLkkskftg1/JXCpnGBupYYOBCh23nvRpJoV1biSHhbi?=
 =?iso-8859-1?Q?Wx795VJfuMkqGbxUxyqwml89r6V72eTOo5S75hYkK1Teopq7sfHIKhzRwq?=
 =?iso-8859-1?Q?0BqUwMGU8/W7eqqGQwF1l12TdCTxKnRw8fGKImk6KkhEeCZnHfrHcQyY6w?=
 =?iso-8859-1?Q?4whS5EIXHmSyby+ISf9z0z95emx3cKdJ0xEtbVc2+AKr9is9uueeXEsDD5?=
 =?iso-8859-1?Q?va/r4/zHYwseo7RjVqQ5SO51tCGJv5lFNYA07a1X4gh+pLZDqmRp9dVpvZ?=
 =?iso-8859-1?Q?mZ0f3WjflKoXCe9cRnsWsH42+lMnel3VsGEoEHTGo0nkGEsZ5pGUjdF8ae?=
 =?iso-8859-1?Q?GssJQC9shwjPU7S1XIwfjvVzEGOFvneUaRAIjShPg4M6kcKBDJP89AMyji?=
 =?iso-8859-1?Q?SbXXtBu+uujljBKRGBDFYfJX2OutLbQRiYjx7ME83smjPumXQxxbWP1rOW?=
 =?iso-8859-1?Q?vQH18w4tV7viJbsxIDWeh78RH+HfghRfyF3uqWEwyof4h57En8gPTuXzoU?=
 =?iso-8859-1?Q?CESpZTxsZRO+e7IpzVtEww5UJK5dHc06PibOjtdSmCVlz11PTE+HDgpbOM?=
 =?iso-8859-1?Q?NAdgrOGLw5bcPzVEJkumlVR9Qrm+Km/l1KW7t3SWRcOFHuBKXcGJ8CRrGI?=
 =?iso-8859-1?Q?xwhQnsE6AcLwE5sjyDXuRfdymhVNL/NIeu2IQtDz1K8HqNy8kQA45jQ8mh?=
 =?iso-8859-1?Q?CRkZHAbmZ2tvq/XnJSqyAzgWY3bvm3XJVVHpyiCWtTQbJgq7STma4JdKGP?=
 =?iso-8859-1?Q?EQajMNtCWyIsNDwA5KEOpNcuKJMvfdtLFHCuktbiwRCHtYKOTPtF77UlkB?=
 =?iso-8859-1?Q?O/yZPFezlM3R1eZiOte8tvIBCa18DyGMRUJqKacuS5OCgxKBBmZRwHsLQo?=
 =?iso-8859-1?Q?fek350Wo/f2/UsEuckl+OZ/qsjBzkWNjO2rpO/aNbPB/CZLUq/qAHI0kkj?=
 =?iso-8859-1?Q?IZk5b03qAC5fZPp446d59q3vn2AmyMQHPjPhHR6cFGpnPK6+P5L2bWz53v?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lbyT6dXIb6JiHhuK5vdrrmNUNztsL43vEnfrEiMhaakCVeGio2gLwtfwSQ?=
 =?iso-8859-1?Q?Z57U7Tp3EGeRRETCnjawbabZERfbJKlNgj8WoU32jw4hBXcy55RtCC6GyC?=
 =?iso-8859-1?Q?Mt7KQkwgd57zA/IekoD+OaZxgJPbDaFMFgKaSTLUwqPLZMWeCk1Rf4fsQg?=
 =?iso-8859-1?Q?YmbdyzT1ICfe8X9J7mJGhnwe9OSIbPpNJb5ogww9ueoEqrdkOxs3LonTJ2?=
 =?iso-8859-1?Q?iYfsJp9hQC9FN0nAHMXpllEnbEhvwDO87cEgviC3gn3L3dZTUGZelbUbic?=
 =?iso-8859-1?Q?P0TQRMqqhllXfGk8A8r1PY1ffQxFGRtRERqmB7cB2bvcwjfwpSU2QXibf9?=
 =?iso-8859-1?Q?lsZiou44xnZqj5cMdTKE40hjtgKaBb1oLQiD8+d8YVObkngir3Gm+VQXa9?=
 =?iso-8859-1?Q?dqHon7sSpWlJ5fZhHnOUuY6nog5lYsMvGbAjxLx8vlBKHJjKO1R3tFjy9Z?=
 =?iso-8859-1?Q?7HjcuqLjSQNUD1+xPe9kvoMaXT724M4TDmURdTUW1y06/RGVlHLcG6Pjq1?=
 =?iso-8859-1?Q?D/F8UInjJ0EPDtnsZQs2R7FAn4RGb9booC2VN3grSy1DcfmRgAkQ1IxUyE?=
 =?iso-8859-1?Q?YX2w65c7cheKjrM98qwB27V01cO7rL47fqXOQbw2WrySgGiv2j9f4/49jE?=
 =?iso-8859-1?Q?H+z4ho/drt/O0NAQS2GkzhKoBG4gztu++4uNWWFKDxYHTkTrXHxtM1Jy6/?=
 =?iso-8859-1?Q?2y0qEJQUdfqNOJxwE0rNtusDcUrcP5ouOlRfj+0xuWsNBCKR3CyalhbxSp?=
 =?iso-8859-1?Q?pENlkw/6/oYcy9RJQ24uhNe2G2h4z21iW8iKYfrq00y9GGSHjJGoYW6SQT?=
 =?iso-8859-1?Q?wO+nDahe8N7uk/D+OWLx5E60TSoSjlGPnpWnXeT72zhbjLs9eP36M1MoDm?=
 =?iso-8859-1?Q?iU34Q0fmDahuZhaOFbBwemRd7hNDrKEiIPMmUh+th2SRbK9Ke7xNMmbvDo?=
 =?iso-8859-1?Q?oRpriMWmhVKTcdBmDEicKvfZtmNgimxxJvGcc/XMWBdz26omJDt7BjuvrR?=
 =?iso-8859-1?Q?9xeQk8PaCUltd4rSja2sRWphG1fwwlbkPPJeEDKNNHL9wapPCEtFylE6lY?=
 =?iso-8859-1?Q?ZWdkHGRp+nC5BCewhD9U8JeDC5Jd4VgilmrfiK2HjRhtQxYqae99GRU0HJ?=
 =?iso-8859-1?Q?UO6Sq91DfeiqICAm3iIr2V1D8KO10jpYtbttC3CKKr5UfkwikLIItDfDZc?=
 =?iso-8859-1?Q?w3xPof6wcq/C3GblLNl7FXDKnVD/mBh748Lqs5etYPG4hEiAQf0vRMBfBe?=
 =?iso-8859-1?Q?4RNAF7dfsQaof8mhubnqkPbnBftM2fbzmPzVe8hVJRNfYrFOvR6Xh0Qdp/?=
 =?iso-8859-1?Q?Oq+dYld4Rn6Qa0lWXIHx6lO5dswgnIETPZeMYnvvaDyPgG73rHOOurPqcm?=
 =?iso-8859-1?Q?ZdvWFEZHXlrf0c6+4ZdTC/FLl0XX/Korbr5Qkm3OdDCYn67rDDDMzzE/U6?=
 =?iso-8859-1?Q?VXIYUT+DTE4UYxkge6oU5XYtnkENfmtOjcIjCgqGT3UtxtD+tSvDEnul8l?=
 =?iso-8859-1?Q?X177PaTTFIAExyOx2EAcyz0B8DN3yFa4oDijY7c/wskTzOyTejQ6sucWWt?=
 =?iso-8859-1?Q?DgOuBOTmaVxnVJVPozFtuAOigicnvVSfdpqu/842GSy/4FzzGEd5BUW/UQ?=
 =?iso-8859-1?Q?ZlcL8qd5eW/i17lZ7yDkIgriozWOaVDGHM?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134b83e1-a3dd-4bb5-0490-08dd2b35ff4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 14:01:47.2601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsMzQ0CidL3iwQQKFtMiAvLp09F0kd//aKfoKy6b52hqOWWUurvIzBjhqgXEVGXWfRBgKZFhgO9k97UdiWX00w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB7805
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_060159_360933_58DCDCEB 
X-CRM114-Status: UNSURE (   8.62  )
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

>The APLIC domain in direct mode requires "HART Index" to be
>between 0 to N - 1 where N is the number of HARTs targeted by
>the APLIC domain because the APLIC IDC structures are placed
>consecutively in the MMIO space and located based on "HART index".
>(Refer, first paragraph of the section "4.8 Interrupt delivery directly
>by the APLIC" of the ratified RISC-V AIA v1.0 specification)

Hi Anup,

Sorry, perhaps I am reading spec the wrong way. I don't see where
spec required this:

>"HART Index" to be
>between 0 to N - 1 where N is the number of HARTs targeted by
>the APLIC domain

I have a real hardware (MIPS P8700) where APLIC is in direct mode
and hart indexes are same as hart IDs, masking out cluster number.
These hart indexes as I mentioned, "0x00, 0x01, 0x10, 0x11" etc.
For delivering IRQ, for example,  to CPU2 I need to access its IDC
by hart index 0x10. Current code uses IDC at index 2 and hardware
don't work this way because there's no registers at this address.

If spec indeed requires hart indexes to be in range as you mentioned,
such hardware is not spec compliant. Is it the case?

In addition, as spec says, hart index may be different than its hart ID
and I don't see any provisioning in current code to supply this
hart index.

What am I missing?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
