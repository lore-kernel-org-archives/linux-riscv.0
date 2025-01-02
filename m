Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E832BE77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/D8ndstYlztk/VCEBZHfc2bY0OGmtyOKgPviuRCWD3g=; b=MlVhAWOhER/uD6
	zAQ7B/1WfSpKvx90T2cE3f6h8Um2s+PwOu6iUEv4iob+XfrXqT8YNrAEdRXd6TIvtz7DvM/c/RqHv
	L2hN0+WuYHIyIWkQFmDxd84M4CV+Qef7TWQRV6c9yFEuEaE9Xmcu3iGaCl3PsKQP505i7cNXYxroG
	fGrCHfah/DWO6eqYJWfElc4sPAwxGBJ/7TXopzLaSkySVwEahWYAgoFKNckMVr5S3pG03hCryjMan
	aIrMNZ9FCktfLjo7JQKdDefR2AXjNZAiKRtd69N7EYaVwimkejgzXD81Gs5q1d7eXas4p2TGpAuLI
	lDb/5v0c3VokV6sVsAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMn2-0000000AekF-33GE;
	Thu, 02 Jan 2025 15:07:12 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTMmz-0000000Aeiv-2z6X
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 15:07:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8bbeJL3l+cNyzZcIrSx0WCLshKZXzVQXakDb956xGl+Fr9KfHTZ4AxNkGw3UQWlqdwD5NG9iP4IPP2yp9cccE2l//93TAgiVpq1U/n5YNZXxds2n0S//B6x6z9PIO0AneRBFlLdqlVbLB+Ywz+zXXcMxDaP4giF5cBRq7A4kIOhH57YQF+No3SqUZIqRRDApDjIE78XXwOjSjrN5JjwswdBlS5XBiPfuChVnJ3EJBWqYCaeIfHP3/maQZdvxwReV2s52iakxnXBiJNl92/DdJEeEgge7i+z95IqbRwoWPPgp0YrsqjrrWz8H4xOITmZllGy47lF2aFqO5gnBJZRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTZiPq7Nmt88nur/GJqXqnpDkkVyZhmwr83mBPudRrU=;
 b=P6enEtTffpyRITrEjlyFKjSC1cFUf3omCwNCqoUjJz0PJ9FFjkwv+B1ZoSjzUr28pXYbPhfKueV3BiOgx45rMF+l4To3s8o992/iZMRBV5WSaUsWgh/52FEVFCDikljngpWkKf8EEsl4MBIfSEInxjZKAmt6x/VVAmsIubVTe3qyVbjGhupX4Tkr78KHBmnQaY+WJqare/qAmEB7qNwN9pRsb28HkqTbf+L6x6gXh9h8TGoldp4BAgYfeZ312yXJl7WXh6/mV+1BGsZlfSewtmwwepHmn8ymdIWaJiQQR/TBMvaIQF0J1ADGIIxofls4GEm/j8Ifbki4U/L0kuUWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTZiPq7Nmt88nur/GJqXqnpDkkVyZhmwr83mBPudRrU=;
 b=P4VCVE8o0vqT3A+lg85TKEC3S29m8PssXA1A6a0uVGNoWyy2CGNoc8dI6uyO8dthCSGjwdmhrJMaCWxnzEMiBfWL50z0ZzTOZGgsqMwdO9fCRup3nENijQXT1DRKceBXscHZ3CiT8dUKC5NHceuQFLPgFLlPXK2qFFycvgp3hWw=
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com (2603:10a6:803:82::16)
 by FRWPR09MB7954.eurprd09.prod.outlook.com (2603:10a6:d10:173::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 15:07:02 +0000
Received: from VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7]) by VI1PR09MB2333.eurprd09.prod.outlook.com
 ([fe80::fef9:cf7b:cbc2:d3b7%3]) with mapi id 15.20.8293.000; Thu, 2 Jan 2025
 15:07:01 +0000
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
Thread-Index: AQHbXPqLn4y81XZt1kmuu+EQn2q/K7MDbzuAgAAMbO6AABMfgIAAAdGj
Date: Thu, 2 Jan 2025 15:07:01 +0000
Message-ID: <VI1PR09MB2333013AB5FF1C5FBC14312394142@VI1PR09MB2333.eurprd09.prod.outlook.com>
References: <20250102094116.3847894-1-vladimir.kondratiev@mobileye.com>
 <CAAhSdy0cBkogjR1DbcS9-TLRbKiDqVTydrYQCihnEHDRu69CoQ@mail.gmail.com>
 <VI1PR09MB2333299725201F26F23A803694142@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <CAAhSdy2P3AQckUXaH1XY2+zK4Cx=WYDsUUciODcLbka3z9q2XQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2P3AQckUXaH1XY2+zK4Cx=WYDsUUciODcLbka3z9q2XQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR09MB2333:EE_|FRWPR09MB7954:EE_
x-ms-office365-filtering-correlation-id: 87d6b3f8-7524-489b-e2b7-08dd2b3f1c9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?Windows-1252?Q?pvboXN4oXbYKfHAv1dwsT+qT5lkMfuePKUzfrKOX5Q1ebhZ8gbWnVHOy?=
 =?Windows-1252?Q?xquqAbyuDwah7eCb4Lo9VbiRamwl4e4Dc/UE5TDX0byDOPZX4NaR6mDQ?=
 =?Windows-1252?Q?3FAPH/4KQ2h899PEc2g0XLKK3ghNVC1YoT2qtp6iS15mxp9mdAP9Frj3?=
 =?Windows-1252?Q?Lt7OJoTkCPeiQUCuN2pGNk4IGduxNshbI8e2UsOJSk5lsv2wK23Yridk?=
 =?Windows-1252?Q?vIz21C9JbTHVFg1IijXv2IcPdMyMwHTJA4VTpW3ruWFo8LY2NNNe5Jj1?=
 =?Windows-1252?Q?qsIDElZ92gPMXY+TnzXFIUx9osu9FO06xrZQni1SoMia711xKEiBEUGh?=
 =?Windows-1252?Q?ee1h0Lhr5WVhVEQPTboNxTL1fbmNc35P7dXB507xKeCa7VOhSi3psmgI?=
 =?Windows-1252?Q?PglyyF3Lu8ucDe90EQjdtnDfKlX1pE1r6rCLpb86v9Wpbw84+mb30Q6B?=
 =?Windows-1252?Q?bm8BMIIVqWypjHjO6RWypFWCj59vooOXvVwFWplb8G21yzfkUUvZGXi0?=
 =?Windows-1252?Q?wlPqoaL0tASBUcMXk3+RYrmq8J/zDD76uVsymUCnVqONoSmZR2QahrK5?=
 =?Windows-1252?Q?q+QM8BafRDd22tAhXkamrnU+PuQgXrFZQu0krPI3xHf0OLEoF/Vel7TT?=
 =?Windows-1252?Q?xF/C5Cc4Y0OFo+DThfVo4046N2hxzYi8sgB/WHCzs/+82nQDmWfJ7mm4?=
 =?Windows-1252?Q?pXOle9lhImpSp+uPpZzJsTai4UvljJZNZ5sQURQyfe4qwa5TZknBwQub?=
 =?Windows-1252?Q?9iHU7GFD3LhJT71/3CasHoTTnCMn8Tx2+MOaV0SeFm2qBochDRZg5OQa?=
 =?Windows-1252?Q?DeqDEBTF1Z8RJ6EKYQmOJ7dU5o6gaw9P4Cgrizy4w4jqWWFnXy4pjTmR?=
 =?Windows-1252?Q?E4BG4vWaUh2CoYowEwJNayBnsyudBOqQB3exden34+VRAgr3G8vwDPwW?=
 =?Windows-1252?Q?nJEb9zgdZ8D5CrHKLcT49d2KurJbR1ZvYQqtH0Ymani1Q2wb7kaQqV4q?=
 =?Windows-1252?Q?3cFo48oAV+I08AuNoxloL26eq5yrUr9eFQ4JVRjCuPY2c5VHbIug8rrn?=
 =?Windows-1252?Q?y78HbWwjxDH0X0awT+yQt2U/6NOANek33CqNxpOF5pi4hFlTTZUBBKgU?=
 =?Windows-1252?Q?VebYZtkQ9aDOM6sio/qmMrJHz1vdkWH+u3gwysyco47OYg+cZKEe4Byg?=
 =?Windows-1252?Q?mDLESJOUB8DqZCN4lApmcpzK0mJqyeoBvKrINA42mWCqrJYi6G/4wiIO?=
 =?Windows-1252?Q?0FRoVaWPvk6/7RHiYEsJry+ahbQVXCzGg+5DD/wb9aUcMkRnaEwsKgEI?=
 =?Windows-1252?Q?moEwDJFbPJwzD/3CzZmhs+lzB2zHpVHPdldXYIOyumrwfOicACYnMBPy?=
 =?Windows-1252?Q?7eHewpmhuTCOwncCcKoJ2wBN1/XVCxkJR2/k7Tsy1oZtRs9naRHP+QyI?=
 =?Windows-1252?Q?WQs8+2jdNJ3NCMzeSCEC8AoGanF1yKjdepuRAeGtSQMvhgoVJ4k1A7EE?=
 =?Windows-1252?Q?JR464j+TgBsdzcBRcUjmxwfJanWPq8WSoNI9KtnzyvuJf4T5RCWoLNCU?=
 =?Windows-1252?Q?7Ff5vj36AkrHdmlq?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR09MB2333.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?GnQB2OnbtbayH1wCn47HJQkaYH6r2u+i02phaLpFLJsUFuFpiyThojJR?=
 =?Windows-1252?Q?Ass5Z+uuXBPkwN2dMd1WVCPQVfq5vvLUldj5rhlbVlMFw7pQ14p6H3Gk?=
 =?Windows-1252?Q?GQ5S9IdAXlJLoIh1KKtxyNBlSf18GieP8rCMUlwIemCFg6FOYlfRSZFd?=
 =?Windows-1252?Q?IFPTYIcKRd62mOi3UpryiRA5mM8u2oLDoEwES7PajmGHjeUQ+Wkp9bxR?=
 =?Windows-1252?Q?Bn2VqogwHnihF6gsqDNfF5hrYtG8oP2fetfa/2jf6PUc6vr945dHAP3O?=
 =?Windows-1252?Q?jUiNiAq9bI5XOyCi7NSD44AqBY/I7vUTpjDjWQPiY9OxRmT2k5X+NUIC?=
 =?Windows-1252?Q?P/LLnEj2VcX/NQ4A4iceb4hrIHwr9E+mNOvQ/kt1IN7IXbbiRhrGp4tf?=
 =?Windows-1252?Q?CXRYjFG0JhDO9xPid36E266PFwmDxoTF8cdW2VaBpVURgUd4yq9lhQgK?=
 =?Windows-1252?Q?fM6Lh/Vz3cWunpm2d071wVDEJIKVRF23rqEOT4eVl5mt6vJci2Qa4HnS?=
 =?Windows-1252?Q?ufAJQrx2fv9CW4xjTtNi1kL05gDYa00wiF3u5jAPHfBgwTP691veKJdn?=
 =?Windows-1252?Q?NPGlhfvanmVe1k4HaZeY4hTy2RO4EnbqGlX9+AcXcZth0larm6iNlc4n?=
 =?Windows-1252?Q?d47SxdvOF0yfhyGNxtwo22nKy0x70ZioXEw7zH2BkhKUh81ty7MgINfy?=
 =?Windows-1252?Q?GbQj2hpHTkfzela+G+PqbVrHpvsli3dUZwgCbsT08OL11+YRyg7wJhw3?=
 =?Windows-1252?Q?HwWXJnQRdZ5Qr6vfj+Sw8bYcbLUzVA2FqV6oguwVxF5sZkUab940gLBP?=
 =?Windows-1252?Q?Gef6XW44MDTw5ltGbWv+PHZBQNkkl4B1VrX/Ebw8Z7WeqEv6MCa1fsUE?=
 =?Windows-1252?Q?bWSMoCt6L7T/fNakj+UKvRgImjslDRWcKPnooWbkB/ChJa39iC9zoFw3?=
 =?Windows-1252?Q?XoWtvoQoGGsF//1tj6wsl4EoDF/vscIIKLyTLZFoJbgSv5odq4RgQCrt?=
 =?Windows-1252?Q?aVE6SPLmmxsXbesW6EyRR6B91HnQ56TL3YNSrco1fQ3i5CFafEqsGKJP?=
 =?Windows-1252?Q?mKbmA61N0xYzksVWekVUR3NZ4oSJx33ZO1Z8E64Tup00cFNSROmIxhXw?=
 =?Windows-1252?Q?0vFrDdv3OIF7lXZ90N4kmzkI+2tShVsXOd37W7do4TcrTMwEtYOgi9X3?=
 =?Windows-1252?Q?OTmbfKP0TtPBO5XQAUyYGWYRRra2VrnLmQ2XRFUgDjyUFPhneOQvG5yq?=
 =?Windows-1252?Q?WpQpLOqR4UNgoKZMrYqDtqhayFc8Gbjj9FnImIhlNbKYoAWYLUVJKadm?=
 =?Windows-1252?Q?SWU0lJ04gSmQZxb4C/p5n6IWomErWW3xeH0WhVXEbDqF9RMHaR3gyuYp?=
 =?Windows-1252?Q?JflGSW+VuRwXPK0jDWpLngUz7LoI/YbMcyG59LN3q/MWGwbirQaUFZgr?=
 =?Windows-1252?Q?t8nByN9QEDL3FGdm6dlBflatRgzbgtRQxce6sHhP7sYwMY5oJExtDJN3?=
 =?Windows-1252?Q?0Zs4jZk+7L78FWD3mIo8PpLAlD9MCZ90ad+Y3uj7ji1ChGv/uzPrn9nu?=
 =?Windows-1252?Q?HoucIngMRH7JGe99rBVcpicYzVBlm0/7bWJbm8P/+sF3dgpw4M4JgCyJ?=
 =?Windows-1252?Q?b3v2xs3INJyrDORsLTNm38qQJUdBccNRuDkzclVkIA9bll4aNSgj0U/A?=
 =?Windows-1252?Q?WeW4MtfeC4o1cQv0hJNjhsrd5j6L6mc4?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR09MB2333.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d6b3f8-7524-489b-e2b7-08dd2b3f1c9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 15:07:01.8949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJZ6F5QS9Y+hrvagF+12Kr9ET8PRTcyHpwj6BgYTlQtthwRxpiZ3Xjp9ogzKmSWbdCI4U2v7eXfnIXbcmmsMPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR09MB7954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_070709_965977_A5E44B36 
X-CRM114-Status: GOOD (  10.73  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>Here's the text from "4.8 Interrupt delivery directly by the APLIC" of
>the AIA specification:

>"When an interrupt domain is in direct delivery mode (domaincfg.DM =3D 0),
>interrupts are delivered from the APLIC to harts by a unique signal to each
>hart, usually a dedicated wire. In this case, the domain=92s memory-mapped
>control region contains at the end an array of interrupt delivery control =
(IDC)
>structures, one IDC structure per potential hart index. The first IDC stru=
cture
>is for the domain=92s hart with index 0; the second is for the hart with
>index 1; etc."

>The AIA spec clearly says that for APLIC in direct mode requires
>sequential "HART index" starting from 0 so that IDC structures can
>be located using the APLIC "HART index".

Hi Anup,
I am reading same text but interpreting it differently. I understand it thi=
s way:
for every hart, there's "hart index" that may be arbitrary (unique in domai=
n)
14-bit  integer. Then IDC should be accessed using this index. I don't see
anything that prohibits sparse array of IDCs.

To support this, #4.5 "Memory-mapped control region for an interrupt domain=
" says:

The array of IDC structures may include some for potential hart index numbe=
rs that are not actual
hart index numbers in the domain. For example, the first IDC structure is a=
lways for hart index 0,
but 0 is not necessarily a valid index number for any hart in the domain. F=
or each IDC structure in
the array that does not correspond to a valid hart index number in the doma=
in, the IDC structure=92s
registers may (or may not) be all read-only zeros.

This suggests 0 may be not a valid hart index, so clearly some gaps are all=
owed.

Thanks, Vladimir.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
