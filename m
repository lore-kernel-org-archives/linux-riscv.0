Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09C8C021A4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKGnMh1c+x3bo6+Jn4NgIlXF2DtOcIi+HspABbyItco=; b=ZWZG3v8Gqd3nPA
	35ErB6JvoqnYpbsY9INSrfQhywT2VGAee+UWpgU2eaHLUFR4HMF9PcOzD9pvrtdTBihx3c4T8fRim
	25CE9HSOqGQnXDhbl1FeoKS//5Ibvc8JcGC+wHepLZn2+6P98YHNVbzI77yauP+UwrDNNYwNgVW5q
	51wi+gCtmuEX6shwingKmnGBjTdIPxPBkgrLK23r7RzR+az1UMZaXlHDChT0GudhPtfThlKo8NRNF
	YWS6ZxYcqA3U5lXR/f+N6WCiuRk2j9zNSRIO4RosbxOHrkdp77++5Q8z+OtWgjE2Tnj1fzJiFrd3g
	jHtOf0xhYTMMUQvCQQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tit2S-0000000EWkz-44qa;
	Fri, 14 Feb 2025 10:35:16 +0000
Received: from mail-bjschn02on2072a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tit2P-0000000EWin-34Rj
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 10:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSgDhdvsNCuG7BsqxHb295+dpcf1Q2/qd8XxzPiRwWSAwEWkCb8ExCRIovow7aeaV/B8mlHsqA/3o2k8yc8SB8SN/BND+eLbcTYpB5EM/fX9n2g8ohS55PONuObCzQ/sW6GbUNizgW4iNOIXDdt3CMpIwQthhRvFJVIw07lxNycAGx+IlzgWeTzEf3IL1rc1xPRjIxKz4w4ybtX5D1E37XyaUhJUsOU2m6ib/RU4Mj3x5kHwxAEEhTJIKigB/m0epZcpvPFUlhxfQRifCgvt6z3qbdqz9LtKfObzQvYGnAEF1CBvq408aRFtUpZEiLLbrqi+Tk5P6zGoXaImYSQJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0kUl2hXf5YyJOI7tH71fpvKMA38Y64x98ry7fSNYl4=;
 b=SH9OcjFEQxsRMXT3kx6CeHuGsflCpzlJXkn2/bSvhx5j1vWPp22iTfDQizzj/pTJMuOqYq6T686sootTgE5lOMJmNxTa8NrfHvMwb6zBl/Vu1qYJplqvnIiA6nS7tX6aOM22VXaAhwllWZtROkCZR65flxEmwpDqIjR+qdp4ykxknzReVxU1v7/movtoi8k/o4bBNxzJZSArXQ9JFH854JF50z7uA7BtOkSoQHdYlW+/0027MIO8zGlbij9T/Iv3JJ0R+dJH7FvEUnthfuBmkRHaRwUzzIJ0V02cwOnVDPBdjjDo61yLhdPKCazLNYrDKVA7IeCqLTmvCHToADLWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0893.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.14; Fri, 14 Feb
 2025 10:34:56 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::3f35:8db2:7fdf:9ffb]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::3f35:8db2:7fdf:9ffb%4])
 with mapi id 15.20.8377.007; Fri, 14 Feb 2025 10:34:56 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: E Shattow <e@freeshell.de>, Conor Dooley <conor@kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Topic: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Index: AQHbZessMJgcIL10+UmGw9zpa2rChbMVwlmQgADRYoCAARlKYIADWKIAgAei6jCAAaJXgIAigW2A
Date: Fri, 14 Feb 2025 10:34:55 +0000
Message-ID: <SHXPR01MB0863D058F8E2F9C14DCE2B76E6FEA@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
 <20250113-mushiness-snugness-0f55574e3956@spud>
 <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20250114-recollect-dictate-104e890d116e@spud>
 <SHXPR01MB08631714C914911D343372ACE619A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <dd3aefec-0e1a-4025-812b-daa67a53f4ee@freeshell.de>
 <BJXPR01MB08553280FF7E342451053A6FE6E1A@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
 <bce19eaf-11bf-4ce8-bc15-dffb96cae9d4@freeshell.de>
In-Reply-To: <bce19eaf-11bf-4ce8-bc15-dffb96cae9d4@freeshell.de>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0893:EE_
x-ms-office365-filtering-correlation-id: af090848-745a-4c9e-6221-08dd4ce33955
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: BQCR4yjXKWPAoCibA0/DKknJAH1N/eivR1Zz+VIZCrqXK07r8b5h4m19UzSU51m5X6xjbtSuvy/kNm9cVBN6/Yz9pw47PgxCIY6kcnhylX3RRdM/inTPL07V4rG562P7nJktmrZ73CaU7IacvEir3Xguz6fo+A/BJf7UMTc99+kp8wAsBTxclTMreceBwyIGEfXwNME7XtRC+sidYtMYvttFfEDOZ8Utt1biZS1DfoT6yejhJg2ktc7w9pKkIn6NWilVVgMd033/UQHqMCNOUA6eav2AaJwcbSrqbY7wYDsPk6T3zIR+WjgWwlkUUO7pRrHAOL5k6Z359Guq2/kq31jlpf5B9uj6i+kdvsF/sgSXps32R54c8bxsQgtJyK4ycdYEIbZCpq67fyEgl9jRraYkmy83OFLIvvbZEb49UYwM9hXWguI0YC8vweE367os/QogPZ4Y2wgFXU6V8uMCPPQ+n2peNVaC89YjGBNIPGYPECZ1pCqIRKahqVUfD+62Y+pDvmfXaLdHJHuP7k3HRTI1FiIXKG3MuroLQv4f1ZdUWhjwRAVhUqZhSDJRDhAJQFuSewh56JiCTlGtGjCKnOpVQZOD2lmnv8xGQzlp5vM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDBFMXVpTFdpb2o0aHU4c0xvRWNDaStHMm80S3JLZXY0R2x4WWhQMTBhTUdO?=
 =?utf-8?B?eGlsRFUyNzgxS3YwWndXOG5lZEhvUnhvWWVoaCtTdDVKZFJmZVppSkpGZytF?=
 =?utf-8?B?M09tTXo0S2VTQ2hxYWlWZEs1eU5SUm51NVdhOHlLMElyVmZldFJBUkpnL0pP?=
 =?utf-8?B?T3pvOVZ1YXk3RzM0NmhKQTZFQnVZalRERG50eXFzTmJLMVZubk0rU0RrUGVj?=
 =?utf-8?B?bEVlWEF4elpwcElDWmhKbFlNckhYWVZxa2kralFvRWEybnhSQW5VemNSNjc3?=
 =?utf-8?B?NnZOSjhieDBpQ2pqTkU4RVYzT3RKdnZycHk1MTcyV1RKMTIxSEVsaWRiUzhz?=
 =?utf-8?B?QWdPWmZ5T00rRHpZU3E5REZjdzZRSDZLUzB6ekRQRUNwT3VkaFdNcEZmUldB?=
 =?utf-8?B?T004bkhuWklqdlovYnFvODI0M3ZvdUlYS2RndE5WVWVxM0UxL1VrRHJXYkZ6?=
 =?utf-8?B?WjMyVzh3Z2ZsS3RYSnR4UjJnQmVrSHZESEo5Ylh1TXFndC9xYUhmTHllR0JQ?=
 =?utf-8?B?bm5DQXg5SjlsZ0lkNjNJcHdJU3VCdjNoWUZYd0EvekcreTdqcGx5U2pjUytO?=
 =?utf-8?B?am1RN245NXBwejI0VUdxVHh1by9yejRuY0IrOUJ6ZjVEcnZLdUJjNkhyNFlv?=
 =?utf-8?B?ZEJiaGVjY1B2ZzFUZlUxTStwdmxSZCt5QUwzKzNGTDh0Y1RGQkFoTmJHa2lC?=
 =?utf-8?B?TlRacEFSZlFNWi90Ync5dWp4dGNROTRkQnVFV1RMZ1F3V05NSEd4M0RiSHEz?=
 =?utf-8?B?RmdsWG10MmxKTnZKcmt1T2RTUEpiMU9ZMjRQNTRzT3NmbWorQUx1aEhsZ1Zy?=
 =?utf-8?B?WUEzUkVSL3ltU0oyeHJrRTZpc2hNcGJ1ODVyL3AwRzFDbGxvNG1IbXV3c1Nh?=
 =?utf-8?B?RXpBZzNvaVJkWnpUWFVaenZ5YldIK3dXMFc4NUtacEZDRVpEZWRYWUtHT21a?=
 =?utf-8?B?di9wWjNmV2V6OE9uUVBhdi9ueW9SVHZkR2FyNjg0cGpsVEpLUHhkUlpYMzd3?=
 =?utf-8?B?bnc5TkpuajN4RDVSWi9Ya2xOenpaQ0FaUWxwU3drS1p6RDNUNUZuamdESEV4?=
 =?utf-8?B?a1ArMW1Ub2toZGxhaUhSSVhZVUhQOTZBN3NkeHkrVjh4Z0pTN2FhQnNUY0hr?=
 =?utf-8?B?WXlBTlUrR1BOUTBsMFZRMkhmaTM1MTFwRzZXQmcrQjJxSVBQQk9pcTQyTFpw?=
 =?utf-8?B?SnJGclVEczZyTno0NkpSZGpRTnUyaS9GeHB5ckVpYkhJWE1obS9kU2E1a1Uz?=
 =?utf-8?B?eG8rdzcvbXFEdE04TzAvRGhGVjdpTVJseE9hM2pBR1N6djdFMjlDVFM4am41?=
 =?utf-8?B?M1U4S29pL2x5OXdrSDliNjhYMlpYdFIrT3VXOXJCVUt2UmtzcFk4b0E5NURG?=
 =?utf-8?B?ZlVTcFB0aDdMTFgwUmZ6WDZnd09mcjRmWmlpT0M0aTJ0RHpZNlBaNVUyYmZO?=
 =?utf-8?B?STFzM3JYKzRiZEJhZnBRdDV6Vm56Ukx6QVBnbElnTjhxekVybWpuZDJ5L1lq?=
 =?utf-8?B?STNueGRVWExuaFd0eFh2TFBIazdEaWtVRnlwQ2w1aFRvb1VwTjB5VFVYM2E4?=
 =?utf-8?B?RVJuMHAzMTF5d3dWKzE2QnVLakFIVkFHc2hIbjZubjNUbi9lVXo3Z1RSeE5U?=
 =?utf-8?B?WFltb3JsSGZZNko4Y1l1Vi81bSt0YVFKTEkyZ2JsNURTVzBDRGpvOGxONmFH?=
 =?utf-8?B?YXdCZmtGQlE2L3p4WTFBQ3M5ZnJ3UnFqa1lsdlJBZnM4TVdHbjQ3dnEyNWhx?=
 =?utf-8?B?Z2x0ZFJZblZYbnIvTm5QUklSbzFma2FiVDhwZ0NoZnNyS0Y1dHZvWjZVM3JB?=
 =?utf-8?B?eHdZcVByZmhUTGlBWEYrcnhYMHBCTG84aTJyT3N5MmVyK3liZHFzcU5RQjRa?=
 =?utf-8?B?NVV0TmpOQWtGYVdGTjN5Sm1SU2E5T3hpYXdUTWFKSW9xMTZMQ0pMU1ZtcmxL?=
 =?utf-8?B?cUF6UTg2ZUpuU3JUMUFpbGV5VEhhNGZOVVVmN005L1JvWXk5M3R4RWpHUE5Y?=
 =?utf-8?B?cXNrck9wQmZRaTk4amczV0N6SklIRGpjYWJEclNHNEUyL2JSN2hLOUttYXhx?=
 =?utf-8?B?WUNNMkxuU041ZUdZOHZtVGtLQVIxV3R6bmxUdmNFYThGREtITlJpNUx2NUpD?=
 =?utf-8?Q?PXFaWVogk+7PGdnaQ+yOhwMzf?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: af090848-745a-4c9e-6221-08dd4ce33955
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:34:55.9288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Xuan+tkDgG8jTWCDXlpI22PAncGP6pFZC6rXPSaZ5aU79/dDXCKfoTOD/fzWRMp5BsjFbXh9cIUm5QgV8cN4cMwXtgtlubC3lFM3OFBFr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_023513_925867_7D071E4A 
X-CRM114-Status: GOOD (  46.91  )
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



> 
> 
> 
> On 1/22/25 02:41, Minda Chen wrote:
> >
> >
> >
> >>
> >> Hi Minda,
> >>
> >> On 1/15/25 02:58, Minda Chen wrote:
> >>>
> >>>
> >>>>
> >>>> On Tue, Jan 14, 2025 at 05:42:28AM +0000, Minda Chen wrote:
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
> >>>>>>> StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP
> >>>>>>> block that may exclusively use pciephy0 for USB3.0 connectivity.
> >>>>>>> Add the register offsets for the driver to enable/disable USB3.0
> >>>>>>> on
> >>>> pciephy0.
> >>>>>>>
> >>>>>>> Signed-off-by: E Shattow <e@freeshell.de>
> >>>>>>> ---
> >>>>>>>    arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
> >>>>>>>    1 file changed, 2 insertions(+)
> >>>>>>>
> >>>>>>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>>>> b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>>>> index 0d8339357bad..75ff07303e8b 100644
> >>>>>>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>>>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> >>>>>>> @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
> >>>>>>>    		pciephy0: phy@10210000 {
> >>>>>>>    			compatible = "starfive,jh7110-pcie-phy";
> >>>>>>>    			reg = <0x0 0x10210000 0x0 0x10000>;
> >>>>>>> +			starfive,sys-syscon = <&sys_syscon 0x18>;
> >>>>>>> +			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
> >>>>>>
> >>>>>> Why weren't these added in the first place? Minda, do you know?
> >>>>>>
> >>>>> The driver only require to set syscon register while the PHY
> >>>>> attach to Cadence USB.(star64 board case) The PHY default attach
> >>>>> to PCIe0,
> >>>>> VF2 board
> >>>> do not set any setting. So I don't set it.
> >>>>
> >>>> Does this mean that the change should be made in files where it
> >>>> will only affect
> >>>> non-VF2 boards, or is it harmless if applied to the VF2 also?
> >>> Harmless. The PCIe PHY driver still set the PCIe mode syscon setting.
> >>
> >> Sounds good to me. However some tangent topic related to this series:
> >>
> >> Our questions and answers in this discussion are a representation of
> >> what is missing from the documentation.
> >>
> >> What do I want to know? :  "pdrstn split sw usbpipe plugen" abbreviation.
> >>
> >> What are the full words that is from?
> >>
> >> I will guess the words are:
> >>
> >> "Power domain reset negative? Split... Switch? USB pipeline plug enable?"
> >>
> >> When this is explained for me I will send a patch to add information
> >> into documentation at dt-bindings/phy/starfive,jh7110-pcie-phy.yaml
> >> file. I know that the functionality is already said in discussion;
> >> What I want are the full words to expand the "pdrstn split sw usbpipe
> plugen"
> >> as any abbreviation would also be expanded and explained in
> documentation.
> >>
> >> It would be difficult to improve the documentation before our
> >> discussion about this series here. Now it is clear what questions and
> >> answers are missing from documentation.
> >>
> >> -E
> > In my view, pdrstn split sw usbpipe is bit17 setting. Set to 1 is mean
> > split the PCIe PHY from Cadence USB controller.
> 
> Hi, Minda. Yes, the functional description is very good.
> 
> What I want to know is the language "pdrstn" for example, was this from
> StarFive and someone you can ask what those words are ? Else is it from
> Cadence and I should next ask some design person from Cadence company? I
> want to show in documentation what is the long word (or many words) that are
> changed to short words and become "pdrstn split sw usbpipe plugen".
> 
> When I read "pdrstn split sw usbpipe plugen":
> 
> pdrstn = ?  I do not know, it is different than any word I know. This could be like
> Power Domain (or Power Delivery), Reset, Negative... Pulse Data Rate
> Standard... Plug Drivers Transmission... it is non-sense to guess. I prefer in
> writing documentation to give some information that is accurate.
> 
> split = split. Ok. I think this is true. You provide us code and good description that
> bit17 setting is a "split" action so this is easy for understanding.
> 
> sw = ? maybe this is "switch"?  or "software", "southwest", "signal watch",
> "sine wave", ... probably switch.
> 
> usbpipe = 'pipe' is a connection. okay, this is acceptable. It is a "pipe" connection
> of Cadence IP block with a different part of JH7110 design (PCIe?)
> 
> plugen = plug enable? I do not think of any different possible words for this, so it
> may be that.
> 
> I am aware this request is not any better for us to understand the code.
> We do know what the code does - Thank you, I appreciate your time! The
> English word choices are not very interesting (?) but I want to be accurate for
> documentation.
> 
> Someone at a moment in past time decided "pdrstn split sw usbpipe plugen" is a
> good description for this. Who is that person? What are those long words they
> did change into confusing short form? :-)
> 
> If you can ask around and maybe someone at StarFive does know?  Else you can
> confirm that it was something "not documented" and I will explain in
> documentation that it was "not documented" this exact source of words for
> "pdrstn split sw usbpipe plugen". We can substitute a functional description with
> or without a source of the words.
> 
I think set it to "not documented" is Okay. The JH7110 USB system Designer
has left from StarFive. So I cant give more detail about this.

> Best regards,
> 
> E Shattow
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
