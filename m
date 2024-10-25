Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC552D3A661
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+WIql1oFm5qdSQduMIFh5lOYo9K6YRNH0H3pvjcF/wg=; b=UzWs+33dh9mlSJ
	vZYCQ1g9fw076pg0aIKUFzgrzqP97armfRpldpfjjjAaVgHnZ+7bbMV3tuJDzcLBbQ+jql1fw9FYg
	XvMjOfHK4bKfF9HIw16LKzKB5nd+tjJ+P0/JOAVPQzT+wAlIx+m91z9ocxhvUFXSfre9PCtSEJ3Gf
	w7sH/oquKeX7MxqRHfH/BV3N3XOT4Z9d7SY9ncrrfI06zsPdYvGHt92aiEq4sf9dF9Ye73MVW9ves
	hjeX9aIjCqltSPlmtwWAjZfjy3JSnFwS74AL+2deU2SNotZfoIbDkTTXZ0+CjV8qnPUrYTWaloKyb
	NcQfcaehv3sLJXTJu41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oPf-0000000EyVl-2Mq3;
	Tue, 29 Oct 2024 15:45:43 +0000
Received: from mail-sh0chn02on20726.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::726] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Act-00000002Ky6-1sxn
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 03:04:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djPSxtmlsRp/RAFA5n+NtxVSuiFddBQaTK3/Z1jC4QwwGwirqw79HyYS5xLgesANzetpGxjQI7z6gwAcT7BADw6egAMzhnFn6HjfL8ZBCXTXENuEb2kEaeQPqTxMoT6DMTBJ9I3sYC55pWk98UnvkpsZY2bWGSkAoI7V6wbG9ne/kj4UB9gJYix1HVAvFqRhXwREYUbDFacThtWhUsrpPFIi98uMAlPHnkkdEEP3sRreJrEQ8abg1jdU1wQeHE6AYMZEt6wdRkYD14Qsw4dMjvZRj9dcIEiucZZLyNVvU1o1BawjqcuIObJ2+iYBIY+5lFcYlAkwO1aF1NuQUMfUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osQPJozO32lCIbWxjj6TRKMUy1jghkzN0XwLXCJkOTQ=;
 b=lsiESdwKQIYuMhJqQ4r4U1RIuW0hV2Z/eXRdVE3cbwXDDo5PkViP7YjWcSXLVu7DKIEts45AG3JHkmINcjjbCbTWgRS7cvJ2FIjcvo02JVs54Nb8d/bp9qOF885A3yeFP+mJdk1bxcRAJk4UmnE1ljsbATYFYM6OW9WuLQ5i4depxVoZmjXj5JTsG99clAVp8H9nrwfJjONODCiB0TEv/A38oB2y2qIyhOPNLT1rakVVUA99DSTWI/rcUR7FI0mfuO957HsG87wBtT7QJEryVIIGUQqCzeZAoQljuS5sTD85how8Ze07CqDa0lPZDMFF7x3AcW6DF+ShgEmyCiD9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1273.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.32; Fri, 25 Oct
 2024 02:49:11 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.8069.031; Fri, 25 Oct 2024
 02:49:11 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>, Hal Feng
	<hal.feng@linux.starfivetech.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Emil
 Renner Berthing <emil.renner.berthing@canonical.com>, William Qiu
	<william.qiu@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-can@vger.kernel.org"
	<linux-can@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
Thread-Index: AQHbDP78QyTswaw7pki8MOjaOJeAtrKHr+qUgAHiDdmADWK8kA==
Date: Fri, 25 Oct 2024 02:49:10 +0000
Message-ID: <ZQ2PR01MB130747EE09D3CF9B2290B08FE64F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1273:EE_
x-ms-office365-filtering-correlation-id: 8ba113ad-7489-4ec7-fc5a-08dcf49f9a8a
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: 2hG00ziR9Iwr8yaD/Hl5a9dE7AG8JHwHVGAOAgM6WHlC2pJfWS7Os0CSxaS9Q1b14dBqT/FeAyleJFSsnk6i92mFbydnk8VXEu7QaVqC7FNLB06S0rJsdET5+ZrX1+535wdvSctGpwBEoluKNH2S/ACRrOvNUpQSJoj9TDOkMIerd0gkjH3mkGebXy9ZZYTh0V4pRW4X39j+iMHKXTuXZjtsVvR3wBtINyNdI+xQ1XOvRpKq7uDt3zGZmYptieriwgmpmXZsho65BQ1zExlMhL1L1AVPo4V85NYgCs6J6SrTSp0r7+B05vqH0I48IpAw7hSDSktJFsumAB7txqlF3gY+rEWZvMcDI4dn+RIgQkI6eWrtYNaIME6MLKjM3DvmIRS4fJ6ep/7DgU1UmG18uey9ZVfL0FSmAEbwjlcBdi1Ketz+yoxstNld741Yr+S+I0ZCW+8Yc2A41Dwswxp5N92NRCv5lUoPHQN8vZwCmCRItgLSekEZvEJmB/4OcjtcM18LG853PvsCLWz8ZPo4qb4Wtg0hZmovxp0rTJD876FTmuBipHmdic6dCJn+DCj666PVwCIRYoUqqzPxnTTWCJeNABI6iXgJunhLDlTwbnD62HCynD4MDVycNwXe9BF7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTlLak9BdzJiSE9qekhjcmVVR0kyVWQyeUk0NjFiWGhLakN4Ry9LV0JuMk5H?=
 =?utf-8?B?Vi9ZMnpTMFcrZnQ4OTdwV2tBTm9NeTFiYW5uZ2ZLSDRTWXczZjVWQVBHTXU5?=
 =?utf-8?B?WG0yYXhYQ1lBM3dSWS9ma0U1MlVoT1hCZnVFU1J6Y3o4cnN0YktOdWNQRlVq?=
 =?utf-8?B?STBjd2oyaDF0b1pXSlNheUl0K2dPNEJrMWNGeW40dlJCOVZ2b0FScUNYMzFx?=
 =?utf-8?B?bW5GbjNsZVZIdGw4RFBIOWhRUVB2aGVZNUpqVjNTb3Y2TzIyRVIxUjVHbUIv?=
 =?utf-8?B?TkNSVHVmYWQvc2h0Tzhad0tZanZIK2FFS29hOHRGVFA1dEJzNkNGL0tUUUVj?=
 =?utf-8?B?dG1rbHpVQXY0SzBoUDdXdUpKOWpmazFBSFBHNWtzYUxtU1V2S3dqdVJRNWt6?=
 =?utf-8?B?b3h6akZBOHpEQ1lOcVhNeFErc2w3blQxK0lHNUg4TEowUUJYaHVaWGF6UGZz?=
 =?utf-8?B?N1VMY1p2cisvYmIyWDBTcnZ0RTZpLzFpazdzMGtyRC9MaDlnUWppQXF3Q0Nl?=
 =?utf-8?B?V0tQUDBkV0ltWVU1cWJHVFoyNUV0a1hRVENsUTZqL2U4SDZmYUtYSWEzNXdK?=
 =?utf-8?B?cGlBbzQ1cFAwaHVvYlNNa0FvSmhjZytEdldCQi9WYWxCZVdMUkNnaDRXQVhy?=
 =?utf-8?B?SmI4OFdkbUVpbkZneE0vVUcyY0tKNTUzUmtXbk5OdlFBUUZxU3RweVdYYUgx?=
 =?utf-8?B?c1dHZ1lHd3lxNGgzK3d1NDVZeHAyNTJYVXlkMTA5dW9xamJjVVJCWjhVMWVQ?=
 =?utf-8?B?OGJ3dnFrWlRqVHBtN0ZtcUpYd1dVNll3WmxnODlYTENFSTVwSjVTQUw0VGV3?=
 =?utf-8?B?TEpxL3pBZi8vRlU3UmtGQ1pXUWJpTm9MekJ5VDQrcHcxd3YzRHdETTZKcURT?=
 =?utf-8?B?ZXIvR0ZiZlFsUUdhS2tSbGwwdG53Mll4Yk9Yamp0b21LMGdtQk1RY3BpTDMw?=
 =?utf-8?B?RnZ5R3pSeWZJNEhtTDFvM09RdzRyTmc4S0oyc29lM09hZW9hOXdiQlFMNWRN?=
 =?utf-8?B?bGdJSXJleVFuanZRZFpRSVcyR212SWpFWVYyYVc3T0ZMZmdsS0ExUWVQNFV3?=
 =?utf-8?B?Z3gyMFhveUhLTFRiaHJ5YWl5S3AzamU1dW1BQUZvL3NsLytGZHRBSUhtL0w2?=
 =?utf-8?B?VlZEamJ4S2lJUVl1WVp2KzlpSTVIa0VUNlhRU003cG5kYWJWYk1tTVRlRkVh?=
 =?utf-8?B?QUhaM0pqNE1RMzBISlZ6elFGVy9vaW4xdmFmTDRsTnRqdUdIN0ZiYktZeXNW?=
 =?utf-8?B?TlhOOEZSRElKTE9yajBSVHZSc2F6T3h6N2g3RGNYd3V3RmR0YW1xQ3cvNndD?=
 =?utf-8?B?TEE4SUoyeWZhdHVhM1JZWlZoTEpRNit6QXVtK1lpdGxaTVRFQzF0QlBtZXJ1?=
 =?utf-8?B?d1FROEUxVHNYcHFEQUVsK3VFL3gvZ25TMWhPajNRQnI3ZGF3UTlJUTFyTms0?=
 =?utf-8?B?NTVQZFR1SHdKMkZlYXQzejV4YkNFUHVqN01zTUJFNHU3SEJWOHIrMDUrN2M1?=
 =?utf-8?B?RkVid2lHajVMNDdVREcrTm0zNVQ4NUMwZDNUUjB3Vk1RT2tYMTMrdzREaXlv?=
 =?utf-8?B?QkdmMzlqRWRsMUhDVU5PMWVGeE5tRy80Tk1vanJUYXpkV201RWJtNDdXVXZ1?=
 =?utf-8?B?c2NJTy9DU3BRREZCTFkwVkpzNnVKTE1xNlFzMDhZSXBKaXR6TU9rNHdOUlVS?=
 =?utf-8?B?eDJwSUs4amxMRWlvMkN2UnAvdVlIdU41amZtcUNyeUVrWlhMR0tYQUltUXVh?=
 =?utf-8?B?SC8xNE54K25wVWUvSjN6bjFqR1JMM0kvUEMvNmJEeVZiWEt6M0R1SWk4Z0to?=
 =?utf-8?B?dzRLbEtrU1IxWE1qWkhWNzFBY3NmZGlKbEthRkxhTG1UUkszT2lJdmNBNmI4?=
 =?utf-8?B?NnF5Ti9yTy8xMzFIQ1BNWWg5dCtRT3BoTkM3WnA2RXVCbnZRb0ZwYXY4WmNC?=
 =?utf-8?B?UkxaWXRJT2Q4L2RIWmtXSjIwMmtLYUgyZzNWVmoyeENuTjNQdVMvaWpkcGNE?=
 =?utf-8?B?QTlzSzZtcjFBdXJ1d3lLZjNOd2FxbkJjbHJ2RlhTam51U2lhYkNwMnp0Wkll?=
 =?utf-8?B?Z3I0T1ZiOUc4Q2lPc3VRNUQydkhTODdDVE80ZDB2MWYvZDl3NUhWNTFOQitQ?=
 =?utf-8?Q?EQ9FIHaVAblsWGznocvTYW0Ml?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba113ad-7489-4ec7-fc5a-08dcf49f9a8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 02:49:10.9264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yr5SW64YL6nX7njidP6apN2z4wr+OH299/kRdiaFhUtylIRi0FlOVu/E8eqtEF5rg+5A8XiqaTbcZjelnux6xMxbHPYaU8RrBnyXYRNFdjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1273
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_200435_502287_499AB449 
X-CRM114-Status: GOOD (  31.04  )
X-Mailman-Approved-At: Tue, 29 Oct 2024 08:37:08 -0700
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

> On 16.10.24 22:16, Vincent MAILHOL wrote:
> On Wed. 16 Oct. 2024 at 14:05, Vincent MAILHOL
> <mailhol.vincent@wanadoo.fr> wrote:
> > On Tue. 15 Oct. 2024 at 18:33, Hal Feng <hal.feng@linux.starfivetech.com>
> wrote:
> > > On 9/23/2024 11:41 AM, Vincent MAILHOL wrote:
> > > > Hi Hal,
> > > >
> > > > A few more comments on top of what Andrew already wrote.
> > > >
> > > > On Mon. 23 Sep. 2024 at 00:09, Hal Feng <hal.feng@starfivetech.com>
> wrote:
> > > >> From: William Qiu <william.qiu@starfivetech.com>
> > > >>
> > > >> Add driver for CAST CAN Bus Controller used on StarFive JH7110
> > > >> SoC.
> > > >>
> > > >> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > > >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > > >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > >> ---
> 
> (...)
> 
> > > >> +
> > > >> +       if (priv->cantype == CAST_CAN_TYPE_CANFD) {
> > > >> +               priv->can.ctrlmode_supported =
> CAN_CTRLMODE_LOOPBACK | CAN_CTRLMODE_FD;
> > > >> +               priv->can.data_bittiming_const =
> &ccan_data_bittiming_const_canfd;
> > > >> +       } else {
> > > >> +               priv->can.ctrlmode_supported =
> CAN_CTRLMODE_LOOPBACK;
> > > >> +       }
> > > >
> > > > Nitpick, consider doing this:
> > > >
> > > >   priv->can.ctrlmode_supported = CAN_CTRLMODE_LOOPBACK;
> > > >   if (priv->cantype == CAST_CAN_TYPE_CANFD) {
> > > >           priv->can.ctrlmode_supported |= CAN_CTRLMODE_FD;
> > > >           priv->can.data_bittiming_const =
> &ccan_data_bittiming_const_canfd;
> > > >   }
> > >
> > > OK.
> > >
> > > >
> > > > Also, does you hardware support dlc greater than 8 (c.f.
> > > > CAN_CTRLMODE_CC_LEN8_DLC)?
> > >
> > > The class CAN (CC) mode does not support, but the CAN FD mode
> supports.
> >
> > So, CAN_CTRLMODE_CC_LEN8_DLC is a Classical CAN feature. Strictly
> > speaking, this does not exist in CAN FD. Do you mean that only the
> > CAST_CAN_TYPE_CANFD supports sending Classical CAN frames with a DLC
> > greater than 8?
> >
> > If none of the Classical CAN or CAN FD variants of your device is able
> > to send Classical CAN frames with a DLC greater than 8, then this is
> > just not supported by your device.
> >
> > Could you share the datasheet so that I can double check this?
> 
> I received the datasheet from a good samaritan. With this, I was able to
> confirm a few things.
> 
> 1/ Your device can support CAN_CTRLMODE_CC_LEN8_DLC:
> 
> This is shown in the datasheet at:
> 
>   Table 3-52 Definition of the DLC (according to the CAN 2.0 / FD specification)
> 
> DLC values 9 to 15 (binary 1001 to 1111) are accepted by the device.
> When sending and receiving such frames, can_frame->len is set to 8 and
> can_frame->len8_dlc is set to the actual DLC value. Use the
> can_cc_dlc2len() and can_get_cc_dlc() helpers for this.
> 
> 
> 2/ Your device can support CAN_CTRLMODE_TDC_AUTO:
> 
> This is documented in the datasheet at:
> 
>   8.8 TDC and RDC
> 
> This will allow the use of higher bitrates (e.g. 4 Mbits/s) in CAN-FD.
> You can refer to this commit for an example of how to implement it:
> 
>   https://git.kernel.org/torvalds/c/1010a8fa9608
> 
> 
> 3/ Your device can support CAN_CTRLMODE_3_SAMPLES:
> 
> This is called triple mode redundancy (TMR) in your datasheet.
> 
> 
> 4/ Your device can support CAN_CTRLMODE_LISTENONLY:
> 
> This is documented in the datasheet at:
> 
>   3.9.10.2. Listen Only Mode (LOM)
> 
> 
> 5/ Your device can support CAN_CTRLMODE_ONE_SHOT:
> 
> This is documented in the datasheet at:
> 
>   6.5.3 Single Shot Transmit Trigger
> 
> 
> 6/ Your device can support CAN_CTRLMODE_BERR_REPORTING:
> 
> This is shown in the datasheet at:
> 
>   Table 3-24 Error Counter Registers RECNT (0xb2) and TECNT (0xb3)
> 
> 
> 7/ Your device can support CAN_CTRLMODE_PRESUME_ACK:
> 
> c.f. the SACK (self acknowledge) register
> 
> 
> So your device comes with MANY features. I would like to see those
> implemented in your driver. Most of the time, adding a feature just means
> writing one value to a register.
> 
> Please let me know if any of this is unclear.

I will confirm the above features with my colleagues. If these features can
really be supported, let's implement them. Thanks.

Best regards,
Hal
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
