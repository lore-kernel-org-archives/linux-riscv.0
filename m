Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308ECC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 06:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hg0p1K++G5eQdrv5WfsluNmOP8Cp+C2vSTPBtWcubeg=; b=K1TGwfpbjvotbD
	sP0fYIoVSXHla5eRcA4CLGwkaIrGSQVJhnXNm2o1Yl2voKVxAlz76Eu4z67azwCdEGx52b/B2+UGs
	QTpVgTjCFRaBagloZx7jMV/h2UXknxW1pw4OBirTLZ2nFZXEENriOAAVc7QLYFeZXKPa1iZTv+7wU
	Aih+l3aVLITDcN2Z1YKMRjRTPO9TXfwMEtmFMxWUv+zWQ2Qx4/+2d5GrCch6S31nR3kJLgT8B5yp5
	uPaAvjeZ9kCRnZTy/LDCP0YbLxxm/Io9NcOsRGGpOqxi2/g5nKbEHolykzWZBW1TZEOCDKNYQAhoG
	LBcpYqaK9O2W+HaeaoYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA2BD-00000005EpX-1VhL;
	Thu, 23 May 2024 06:43:59 +0000
Received: from mail-bjschn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::715] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA2B9-00000005EnE-3HfB
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 06:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anBPIvMnqhumyb1kJld077qc3G+RhBCNsy4e9KotM5rpo9qOaOqDabenj194JJWj1mrfj6aQJ6V+AnJlkfmaHSXBjN/NfsCUHJEkJtoQlgM2P3mlhVzMfPRmeuFYWqjZhLEt/dSXBfuCXEg9uPnY7Xd93oS6AnbCjpggh9XeM/yebhjUvBLvt23ZurrEH/ZNuSscJhXcrhxIsGK37olg4BIED8VO1NTFnAcn53AHogHsXGMKylLoa3k0XkQVYT9agREFpUjMRlMCnBrjur5sUngYgufVP3V5rd3z20xld+CLH7BkuPZkeZ/6iXF+NbaVKM3Z2Ak+aKHOf68vfz6m0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH1HqNKdSTgYxICmTlWayH/uqtwyXl6FmV6WcIknWAw=;
 b=UB9mvlWG1jtnfFkqdAqTT3VJjrwOKDatyF4Ok2+u3z5AYJhnsHYzP3drMk3Fw+KUZ5uImymLFVrqrd9NncP+yr8BY0vA8LacrNNQ34YkkPmRbzukBW1uoMld3ZHS1pkZOIp2ellDauslx709msXeFCKNVNM7sc7qOa6ZCuO8CtQS4cfIBjGHMkcJ36I4ZDG7mJMgOKXPo/eTjwmfXFTGepTV0/FWD/wgCC017NoFGCMusNRR5LmXBG4D+fjOQgUL7e/xTjsfKzgqmmoLaTC61k9SxwR6+hdzZRtmB3M4VyQcgCsiScEUdoJ+3vtu1GMcn8E1FvSaM96H6c582L+Crw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1308.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.38; Thu, 23 May
 2024 06:43:44 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::61c0:a8fc:1462:bc54]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::61c0:a8fc:1462:bc54%6])
 with mapi id 15.20.7587.037; Thu, 23 May 2024 06:43:44 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] riscv: defconfig: Enable StarFive JH7110 drivers
Thread-Topic: [PATCH v2] riscv: defconfig: Enable StarFive JH7110 drivers
Thread-Index: AQHan2f+dTqNcDaH9UC7OuxV5lQFN7GkdQeg
Date: Thu, 23 May 2024 06:43:44 +0000
Message-ID: <ZQ2PR01MB13074FDA8D19374206BD8AAFE6F42@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20240506034627.66765-1-hal.feng@starfivetech.com>
In-Reply-To: <20240506034627.66765-1-hal.feng@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1308:EE_
x-ms-office365-filtering-correlation-id: d5d6c4ad-0c2f-467d-3d61-08dc7af3b10a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|41320700004|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: YPedYzMRsNeqHLuimfk13oZx2x+zYZU951nbf3voS6JjCuAr/8JZkYT9pTwnj2/zzxIHLbXE83Q3Up4MaJQOM4iyAJ3OeyfH4YeQPZIoQckZVQDjYnft6mh2GTrIS51zUDd13ghWO6rZKrlkKDHsbF3tREOyEcqCXkmaXMXF4o/Jwm3xzTKpP7ONGuX8bGWHZEJiv/JWS4HOJYtbTMi/oerAyrXoUbFibWVCdGfUqeq0yqq6P+rMKPoNtDoO4mnqJIB5JLOaxCtKh1782SBonGtTU69hKBMmOGDn0tuMuO5OmemcFvIGe4BLLv8776K+f0JuVolBrESuZdNj6OmiyqFhWC00xFxOx+FDWSxzrGvQKPDxhZRiO8gRcTzR6KpT4KyncgsTMG7to+mv7kT/1xyUmX5d1C7vmkEKt8N2DjhF394iXPkM/sj/jNuPgc6/VDGYIeGbtRpTd3Pi3hIMPZ3ejOyswChDcHO0R4VrLGee9l1hm+dRb0TP4Ri16usZ9tOqhdtWtIcCPhu8c0OETIEJ7506F50ZMbSl4nmABt7gSlnUa2iAff9F2gqwQYoFvdll2S/HxkFUasNFiCNxJvnZr4UzyXTjWYbR+nbV6S1QAcpn3zYwQACcRSytqq52
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0P5GLex1QMKKlw/YJm2Xmo0jQ26jMbMWVjvq7AFQ4bJqB620H/Um0W9bSKfz?=
 =?us-ascii?Q?kwGJgIwoGVrqavbSMXGENOOv3cXTft3TOX+KeOmXfhjPhHpxXh/cs46Ekrzb?=
 =?us-ascii?Q?R5bJveCP/mXub6f3Wh8cW03eidGO0tWV224j35nKl+wNzEL+LShOuVsD7Msq?=
 =?us-ascii?Q?/dEQxRwjmOqiSuYZmIpjRxI3X+m1H6GaSUi55s6eoMqudobPAVcbnsdxB/oK?=
 =?us-ascii?Q?flonOnuRXBfWVUEjDE+LUlayh1k6syF6SIhPRIMgBt1JpidXaRnnTeCHvxZn?=
 =?us-ascii?Q?oWO/5cRmwh2DOVi7BEA0KLM2nwMqwjqD42Vj6jyfrTNUY2OWJ4Y5gJGXOdzb?=
 =?us-ascii?Q?1kwKBkQbKMcPJ0v4RrJSZHD2csdwWa4V6/xojj4KYgHADxpWB7QfabLyAOnq?=
 =?us-ascii?Q?cN8B0UMk4iwqH9KUTR3CwWUEzdDvmMWaoey/VezIaO7kGu+2+M+lSheH0U4m?=
 =?us-ascii?Q?y60fB6nD/61VsT3uBQYY37dyrPhdEutJVmFTib7Gibxv4ErD6LduPJjW4h3c?=
 =?us-ascii?Q?slevAHBmhpt3pvVr7qV3gyKbenwHyCONCksPC+MnEBsGQvpFZd1TONs1DM0+?=
 =?us-ascii?Q?bN23UwgEnXRQfBzSbRBwP5NCL1u/XDFKrsoa/QEAKRO4enljnDME1tRWiQkq?=
 =?us-ascii?Q?3vwHoGmfR4ilGS+Pd53bGNaHiUODbpLi203Je0H0tO9nq4h76wMkiRtpwXXX?=
 =?us-ascii?Q?aTRIV+S+WanbSAoar7Uqps/P+6TJh/NaO95LpXa400P+BXFZWci1ZdUZp50a?=
 =?us-ascii?Q?5TPlECEJZ1HvsmOORbA5aYo6YEYS2o+Pztflu1T3Axb9QQZtkJhpU80aMOZF?=
 =?us-ascii?Q?rNEq340OceeUqm9WIN/gvytRFElfktkFkFmq/z1aCWbsbqIo0sw/fXsol9Kk?=
 =?us-ascii?Q?9W2UvI0lHY3MaqtDuadcecsITatWzxFWPRfcGPsFIv7RqUpaiIOhcCZyf8nt?=
 =?us-ascii?Q?Kt6Gno4u4yRq2TOuH51ca0vOBgwoixlt9IuIwG0vXNV5i6Dd5jdhZCu0gOkE?=
 =?us-ascii?Q?NfQvxmS8jd6V6H9N22h38SUGhc2r411RrlI0dTqjzApEogWNIScJzxCce9ND?=
 =?us-ascii?Q?oIIxiEusDjM0biL7ymeo1vx3W8329Fl/aid5yRTcP031QgRqOi+nF+LZ0ehr?=
 =?us-ascii?Q?u94GxL7qucOUftfhsSD4eqEUTVm01KG/Af1k5DXrticg5/21xeR7zDOAiUni?=
 =?us-ascii?Q?JM6q/M3wZEhlwFzwHJw/3dpLn9UrQ3viY3ExaXDVPVMsJfZV/CkPFiv9QnBY?=
 =?us-ascii?Q?4+AI/TxVCfA9mV6JBQ2qGZGzKdLiCtj3STtXznUcmFd78bG16kF6rs5eqa61?=
 =?us-ascii?Q?+FymoZ1kb6e/peFPnrqaByIaidaVK527XGYmImgx8zZ2s34VkPdA7B6uGoEX?=
 =?us-ascii?Q?L59xERyRhvkPGvX4OE55A7SDpe3USL7FZ5nsYjQEK1/TfhsbvYr1aDP9NcuF?=
 =?us-ascii?Q?Eds3YGYTsGUZSXYionwT2rgfkAuskRJDz5YZTLzo6jvZf/gooe3UVtVGHNxY?=
 =?us-ascii?Q?qIQ1evjON9ax2P7yXfRlX/4x7EnQwfkvfH9ORiYZvVGvagw97lwAn0Zax2qK?=
 =?us-ascii?Q?7/rRX90BVaS63IK28W+A8+H8iyaYhNRVlvITf2Kk?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d6c4ad-0c2f-467d-3d61-08dc7af3b10a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 06:43:44.5440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L7eQd0XALRE3QjXfMrGzsUcN7q6T0S/eRbHybtYUtk6xtD8J/3zTVQIl8jU0e2mQpiK/v5nV/I/e8a9ZM9aTgktmaKku/Lacwg1O90JIOso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_234356_701798_13AACAC4 
X-CRM114-Status: UNSURE (   7.55  )
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

> On 06.05.24 11:46, Hal Feng wrote:
> Add support for StarFive JH7110 SoC and VisionFive 2 board.
> - Cache
> - Temperature sensor
> - PMIC (AXP15060)
> - Restart GPIO
> - RNG
> - I2C
> - SPI
> - Quad SPI
> - USB & USB 2.0 PHY & PCIe 2.0/USB 3.0 PHY
> - Audio (I2S / TDM / PWM-DAC)
> - MIPI-CSI2 RX & D-PHY RX
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
> 
> As more drivers of StarFive JH7110 VisionFive 2 board are upstream, add
> support for them in riscv defconfig.

Hi, Palmer,

Will this patch be applied to v6.10-rc1?

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
