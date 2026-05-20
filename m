Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5788ACD4F3C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbPfG0JPPlK9rAUaPwLfmEDgYgr1vF9CURkR/ljH7vQ=; b=Uv48fBc/vfJjFN
	jIni455AHKVs3oiaajEnnZKQMb7cdFBHp8bVKLYP8vtd5c7WgCx9X3NTericL/pR2xH6P2V2M3PVY
	uL9wXRNpRp2e7MN0GXKu8duJokljsziIQ4+2CTAo/go8/yjmk/GNTfsmq1iSAevtPvH0sWrwBJyyl
	0g6X77E2SryIQOC0fB8q0r3peDA13Q1NbQ8O+lW9gPVCi60qVPAW4wuHKnlTVm4XNi+DukT4qChl2
	tpBOX5NPwFicgpMjmxOwkCD3VuOU53eAvSsiIMs2XftLD0kWJQImH4+55kiNc284HaNnVdjBgJwxS
	rDgIxktytf8Neg0eOgVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhDa-00000004ihx-0xug;
	Wed, 20 May 2026 13:44:14 +0000
Received: from mail-westeuropeazon11023093.outbound.protection.outlook.com ([52.101.72.93] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPhDX-00000004ig6-1zu1
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 13:44:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXp4BIVPoAsJqTeAsCP0cbXNkVl+kDuLNKagWQ0yus6l5AWbT9AREc8WQiSZxoOVJkJ2vS0DvlSO3EoYUO/wdNSyvLECbIOQPqeWlkqCqd1BldWH7q0M+MK3Ek2utAFq9i4L6kizv7eFDNJgAJdbOudr3HvUX5hjlBRf4BVTRr0K/8APSaZEp9PxvutaKgMj79w6PP4cnqkPxLetZb1qspWAPTO3X4Sjl2JA8xyusi3bv2CQKA7nsTzmBX/adpsGU9fk1Bh/T0cNLTC3QPFLqw3uD18ndKlD2sNSrZyg0oHPa+ESwxW8EjeV3GcEnYH6CtbsoMcVmKQ2SpZm8sUS/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F8x16aNyNqFY5GrkExZoG2coucmU5ZPKxYSJMgj9h0=;
 b=b5Jpppg4hCPGxugO29yO/GENCehv5jo3k8YROgsA0E52tILX2/14OXrB/D99dmYjHzOIVTVlkkGV72D1Ak3chj58hszXFvfQMSjvkkwv0BKx59AL+nCgt2+VX/S+AQmn7RZifEpjtNySAw04rRbj0ODfbl+Bn+Gl02Dc2xXcs1Id692wwnSE2SxQDJuVt1VuM5jorq23V/70D5e1JddTQznysCwSl9t0NLMMzTJpz2mz8lEoar0/mLejgiye/KcNc2ZBbAkNe5f+rzGACS877DyNZsGHTf4E+GCdvzckMI0iz915Alxg1ffrjVoVShEVt4mjRFVWtxFOudPRlDIwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9F8x16aNyNqFY5GrkExZoG2coucmU5ZPKxYSJMgj9h0=;
 b=Kg7iBSd2izGgOBK5KHeG1vTadNSCpV7uGn15vaRpsAmjgssGW63gyJeppu/zdZRa96CaCZ4I7R8sruU440OeTX8gKwDAOMjBohX+T3ob2M84q64L/HNqa+beBeVupgo5AXmnsiNvA/WZejbsp2O8MjgtVJ6uup0xY3pgK1h8wr1oWuF/i5B0jjRtTJ33ITj0wgJdZdiPDyS6d84Th3TYoVaW3qQ+RDatJVhp2fTv8ihT52R67rroFVNOQOrkFzEf+JsiiaHHATsYVzbNi73YmT57aIM6B0seIQEK67NRVuRnENc1qtaS+bffPZnHzFD4jiZr9ZDz29BWBOy/N0kRjA==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by DB8PR09MB4025.eurprd09.prod.outlook.com (2603:10a6:10:12b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 13:44:04 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 13:44:02 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "pjw@kernel.org" <pjw@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Djordje
 Todorovic <Djordje.Todorovic@htecgroup.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Thread-Topic: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Thread-Index: AQHc4TShRVA0u1oQIEC9XFnIF1W2R7YMSXOAgAqxjYA=
Date: Wed, 20 May 2026 13:44:02 +0000
Message-ID: <12486c59-ecb6-4db6-b636-9859a6c41d66@htecgroup.com>
References: <53299395-2e6a-a9d2-106b-8b857f64f7ba@kernel.org>
In-Reply-To: <53299395-2e6a-a9d2-106b-8b857f64f7ba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|DB8PR09MB4025:EE_
x-ms-office365-filtering-correlation-id: ba605012-9c4b-4707-2863-08deb675da6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|3023799007|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: aH7q7L6IaTbX3ZZl1l/CnbhLXvFDzxwIzNAvAtuwcICRqwJFb57TCGw79YihWZtDctvHDAw3o5WhwKx+JSBTHnuhD1O0wp8ZU3Y1TPF4wAn+5D+Bw2DNN/GVnMMPzB0LHfX0yJwBaIZsLfSGzX1VjOz1k2cTZqeTdx5Pzkx2rwKUnrW3I2UObu8c4FbVjfPpIouZRXMCEBNhGQmqDIQiSthVpE+Ds4ccVlPV1hWofUGsLywCvGVV1NJ8R84BW/inhnuBHlModUWzK1/Xu2B2u/WNKAUBJMjOJVDYkKrvsIs4ClUpPaOU399IoYIrbuH5h/+TB44gqOfgF4Dqb2LrWe9RxQ2JTgOLGsPmVxXjpFOO3f4JHF2a985JM9vF8MeTE4BYdDhE+7wvUEqej/bpnzC16Wp3Tj4fsNH+guDI/ubny3lBRklC5HJf0yoIzd9dziXnEn+FD7XgfKvghRfINwSfQxdyM8b6Dyhvi2YqhbAtDf+AdgErfcqBUElbPLj6fm2IOorOCU8h5AoA57iDmh0sgVwid+k9nZrkiKj5afI57lAGJNyOr9M48xEo8XWJzEGxk5PGCfs9sVZYQjnMqLIexZkJklJckInSeOwG1Yce/JbL289Fge5dCI/diOeWp+icx7xyEJdHIHQQHcDJyp9beIkTP9h9IRnLjOudDamIauIY+oYAWsVx8iTAIjjAIBLURK4+pcqAS5lR7S1VTBv2+Q2rTOvhPFy2KIMLpYB9HPupa6FMYknSpKcjRC90
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(3023799007)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDh6d2YyQld5UWU0UDl4bHdOeVI0UTdDcGZxNEVrNGg4M1ROQmJxL0I5MDZn?=
 =?utf-8?B?UHlrZkpxa2cwV2RNaHFPSFc2VlQ1c0lOU1duaDZTYXB1WTRFYkF0emJCR25Y?=
 =?utf-8?B?MENucVdSYlRiT2d5a1JCWXc1dFFXYjRObVV4VWtQZ0YzYWs3bHJDakxpZ0Rr?=
 =?utf-8?B?ZERJK2M1OEk4cHdCbkxlQVJGSWZRUnlsV2pnelVEeFdPN3JZVC9zUWFnV0du?=
 =?utf-8?B?K1dBdkUrOUV1ZkMvUjc5Rmc4cG9raU4xYkpzbEYrZDFyTUVJbC9wd05WR0R1?=
 =?utf-8?B?eUdLRWlmcFBWOGpEM1JkZ2pkMHNQQU9HZHJQcFZhbDk2ZXpmRm5oM3ZqWEo1?=
 =?utf-8?B?N3BQdFdBYXdBaXFSN2hmcTJMVjJDMWFIemRrdUpNa01JREZpUHQxbWxzNFRR?=
 =?utf-8?B?NDNHRk9kUm9pZjlRZW5oZjZNck1jc0FsVzN3UUpNRzB6MEQ1bUZmNERNUi9F?=
 =?utf-8?B?a1JiZ2ZBWmJQK3YxYjVibjdPQXJNcjVnMkFOdk5FWGFpNHh1RlVOSVRxQmhK?=
 =?utf-8?B?N29GZVZkYytHalo3cUQyRG9jN0hoSlNhL3FNN3oxVE1TQnBEUEtYaitvZzBS?=
 =?utf-8?B?TWtSOFlXWFgyOC9IeEpWUTlmNGlQWDJ5OW4xaUVZcGJHS3JhR1pTTVRnTE5C?=
 =?utf-8?B?UVNvYmZQaHR1L2V1emtLbGNzYUV3cGxvbGNMUGdwWmo5Z2pTemI5NmVrRGtL?=
 =?utf-8?B?anAxb0ZvcHh0ZzhOWThXcEVmb1dNNjE5WnNTQzBpMGVESkRLSXpzZklob2Fn?=
 =?utf-8?B?WjR0V1hZc25zWXo5Q2pacXRlQlJWbEpJU2o2WHpETit6K3ZVa3VQdXRUU21P?=
 =?utf-8?B?RkdleXZKcW5iTzdqa0RyclZVTHE4b0U4WmJ2OThhSnJxZWpKenRZOXUrVE5l?=
 =?utf-8?B?TmlCcTFWRTBtM1F1MUt0V3hkaEl6TTB2c1YyYllJN29WbzNnOU1XUGRJQlFi?=
 =?utf-8?B?VjIwbWFIRUVQR0UraWZqT1Nyc3h4cHNZcXFpRG5WRDBqWndEeGt5WTh3Y0Z6?=
 =?utf-8?B?SXVURWNtYko3UjdYWEJnNDM1MStaRSs0dnQvZ0ZDSlIvL0RueFVkdXNZRWtr?=
 =?utf-8?B?Ukphbnlxc2ZNa0hIWGs5U3NJcktMNDVlRU5VRzFMNGF5U3RURmZQVUNlclBN?=
 =?utf-8?B?ME9EdDNNSEt1TmNlc2IrWWRCY3hsak0vYWt3US82K2ZMNzVXblFEamZIeERB?=
 =?utf-8?B?bm9GNVlFWFFDWVpFeU1BVWUwaFRPckw4eVQyU2hzbVlaYndTRXlmWmJSQy9I?=
 =?utf-8?B?REJ6dEJCTWpaTE8xTkNPOUpTSERJNkpRRDZWOG9RRldLYkRmYlRzVGNRMnpt?=
 =?utf-8?B?aTgxRXBkZGZzNkdhNlFaa2xQV3RtTWRyQVV6a0dQSm9IcWM2UGJ4dVNMMjZq?=
 =?utf-8?B?QmxzeWF0bTJ4ZjAvRFpZQjdBZTh3MXdjMyt1Y3NzVjA2VnlyREZuTDVNTWlr?=
 =?utf-8?B?clI2ODI3WHVIZVFSNFpEYlMzUUh1Y0RKOFE3K3NGbnlNTzFwNnltNTBzdUpG?=
 =?utf-8?B?djJVSzdvamxoWFhldE5KOTluVnFoWXlCRUVHNHd3ckFIMTRseHJRR01RTGlI?=
 =?utf-8?B?bGZPdmlMN0VWSE9BZys2elczU0hrdysvSExIUTNxdW4zeUxNd08veWFUVHNy?=
 =?utf-8?B?R0V1RWY5UFVhRUJjUUxRdzNaMTNlL2dETGdsMWR0ekV0RHYrTW1MdmF4dzhy?=
 =?utf-8?B?OUpxQlZoVUNISkYyUzYrdnJnVXEvSTRWeTcyd296TUp6ZUd2d3I2WFY0TUFQ?=
 =?utf-8?B?Y3NPWUMxeW5ra1E4bjJyYkN2ZkJkWjZ2bnpSa245cDBtdXorWml2U2lLaTlj?=
 =?utf-8?B?YmVtRS9sLy9HOGpOSW9lcW0xc2tKR0lWaVV3NndONWczMThudUJIZEZSTVRW?=
 =?utf-8?B?b01ocEw3ZHBnSC9JdTJZZDlCNEVXdFBDUWFSTnlwaGxKNTdDRFBtMDVEVnE0?=
 =?utf-8?B?UWFkTjRWaFd0SWtSdEVBYS9hZ1hxbmFOYkdMcTNnOXF6R0o0NkNJamJ0MFRM?=
 =?utf-8?B?S2V1V1VTTlpCS3Mvbm94RXgwRVlCMGdSK1ZwcHRTNDZxTHNMTlJoYnlPVGFw?=
 =?utf-8?B?bk9DRVFteVM3dXA1d0VNVUhvbStYMHUvdWJjQnBKakN6Ny9TcU5mN0hOa01Y?=
 =?utf-8?B?L1Iwa1BhT2RqV29lS3h2blpPUlVxc2srU0R4TE5TQXB6dUdkQ0prTHlQR0Fi?=
 =?utf-8?B?dG5sTEU5Qy9kTG9pVVRWdDZ0SjFhakxjaDQyTmJmeThVMytSNlplbjFsRS9N?=
 =?utf-8?B?TS9nbEtkeEpxM1RONnppaUtjS3VtcFV5bUwzaGxjajJET2JmNUlaaVcyVUZq?=
 =?utf-8?B?RHRUVkp4VFI0UitIbVdxc3Z0TEtZcEtaaDRIdXlyNlpjNW5hbGEyckh0RVph?=
 =?utf-8?Q?tSy9q4MkH821QSp4=3D?=
Content-ID: <2CEB7BBD98BB1249A121675D78871DB9@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba605012-9c4b-4707-2863-08deb675da6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 13:44:02.4426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpRFWFIzfIQxfvry+C0yZVCkpGCKfJaU+V4aZaUKxe1xXEw4Yi4L/eDnD+1OYmPZx3OKgN2CCNQODaHM/DxoCN3w9kDLNOoE4z0Ocjlq/Ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_064411_537489_3CF67AF0 
X-CRM114-Status: GOOD (  29.70  )
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

Hi Paul,

Thank you for taking the time to review the patch!


On 5/13/26 20:25, Paul Walmsley wrote:
> Hi,
>
> On Mon, 11 May 2026, Aleksa Paunovic via B4 Relay wrote:
>
>> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
>>
>> The MIPS P8700 has bugs with the WFI instruction.
> Has MIPS published an erratum for this?   If so, could you add a link to
> it in the patch description?  If not, could you please briefly describe
> the impact of the bug in the patch description, when WFI is used?

MIPS has not published an erratum for this. Briefly, a WFI instruction
after a mispredicted branch can result in erroneous address translation.
>> This errata uses the RISC-V alternatives framework to patch all WFI
>> instructions with the MIPS P8700 pause opcode (0x00501013) at runtime
>> when running on P8700 hardware.
>>
>> Two call sites are patched:
>>  - arch/riscv/kernel/head.S: secondary hart parking loop
>>  - arch/riscv/include/asm/processor.h: wait_for_interrupt()
>>
>> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
>> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>> ---
>> This patch was tested on QEMU configured with eight P8700 harts,
>> as well as on the MIPS Boston board, configured with a single P8700 CPU.
>> Errata application was tested by disassembling with GDB on QEMU
>> and inserting an illegal instruction on the Boston board.
>> Correctness was tested with a combination of kselftests
>> and torture tests (rcu, locktorture), along with coremark testing.
> This kind of test report is very helpful!  Thank you.
>
>> ---
>>  arch/riscv/Kconfig.errata                    | 11 +++++++++++
>>  arch/riscv/errata/mips/errata.c              | 14 ++++++++++++++
>>  arch/riscv/include/asm/errata_list.h         | 27 +++++++++++++++++++++++++++
>>  arch/riscv/include/asm/errata_list_vendors.h |  5 +++--
>>  arch/riscv/include/asm/processor.h           |  3 ++-
>>  arch/riscv/kernel/head.S                     |  4 +++-
>>  6 files changed, 60 insertions(+), 4 deletions(-)
>>
> [ ... ]
>
>> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
>> index 6694b5ccdcf85cfe7e767ea4de981b34f2b17b04..cbe90b19556203e1462cfb345b164c9061887e74 100644
>> --- a/arch/riscv/include/asm/errata_list.h
>> +++ b/arch/riscv/include/asm/errata_list.h
>> @@ -25,6 +25,16 @@ ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),                  \
>>           __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),       \
>>           SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,                    \
>>           CONFIG_ERRATA_SIFIVE_CIP_453)
>> +
>> +#ifdef CONFIG_ERRATA_MIPS_P8700_WFI
>> +#define ALT_WFI                                                              \
>> +ALTERNATIVE("wfi; .rept 7; nop; .endr;",                             \
>> +     ".rept 8; .insn 0x00501013; .endr;", MIPS_VENDOR_ID,            \
>> +     ERRATA_MIPS_P8700_WFI, CONFIG_ERRATA_MIPS_P8700_WFI)
> .insn only works on newer toolchains/binutils versions - this is why
> CONFIG_AS_HAS_INSN was added.  See for example commit
> dc20452e6caf962f04ede7f364267b0c37784ab4 ("riscv: Fix CONFIG_AS_HAS_INSN
> for new .insn usage").  Can you please fix this

Will fix this in v2!

>
> Please add some sort of code comment to describe why 8 MIPS PAUSE
> instructions are needed, as opposed to a single MIPS PAUSE instruction.
> An event that causes the first PAUSE to exit would then encounter the
> subsequent PAUSEs, at which point, there could be additional latency
> before the core can return to doing real work.  The P8700 Programmer's
> Guide mentions a maximum number of cycles per PAUSE instruction, but
> doesn't state what it is precisely.  Could you please add a comment here
> to describe what it is?

The number of PAUSE instructions was determined by testing on the Palladium
board configured with a P8700 CPU. Coremark performance was measured on
a one-core, two-harts setup. Coremark performance with eight PAUSE instructions
was equivalent to what was measured with WFI.

Kind regards,
Aleksa Paunovic
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
