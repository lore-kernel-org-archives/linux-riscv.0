Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA23C61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXkRflzOGc2ukxCIch86o7iN+VAu9Qc0IU7fkRB5jH8=; b=bmFQMKi153pSfo
	U54vJMY9px2CkSjrfzYSjZlmZtpUOLSVglS4cwkNtwfi/ipbkx+CU/j2bBQJuV5z0y/XZSrTNK7WH
	Qq9VBuMrGSIJPrgkD27Q50xiUH48sUp8xmy8miOaCXP799vAblOnKb9tLP6C1OA/NQyioGX6gX+la
	vUx25yGNtM49DPu3IYP2v3C+bJ5YLmbMj2Ek/izcKkgIl2xAIVn3Pmzw5qcNQg4KK+7L/tujwvmOu
	4FiBR6QclXEhZkWXbatW3mJqKzR+CvB/re6u8RRobIxwCVeoW8HfXjQkjIwBOhpQh30u8Bl+IdMlE
	WM6BmvrntOiXv35+5JDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jBo-0000000EW0b-1eEP;
	Wed, 02 Sep 2026 11:31:36 +0000
Received: from mail-bjschn02on2091.outbound.protection.partner.outlook.cn ([139.219.17.91] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jBk-0000000EVxy-0tW8
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 11:31:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxAgdbfr7zVfxxzHvkrIANqA3KvdN6n3wLL5Ua99/bBYKQNNwq2xUxLFX6RVqz441pEwsRGzb4zHHiD12L+dULHwqscFODqJIedPuvMz1X/oyXV8lrFMrQl5hdqwpv6g5fP8myU7uQO5jc6QY5RvVznbTKYFI5JILEydyNaBEd/V+F7Lr/bew1VYtHELdLq/aIbAPXfkfZIpeSiLVS//zns8FfAHseCbpEzlj2PMiZyN4yE15IkAUuBBSrajingkMWXfzEZ7TTdw8xssaA5SXHZgr7WN6GcMxPuoiOdWJOJw1Z8auI0v1E411+g8Hh3dblctUblC+rsMla8dZhngRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnoHrfisfU/8C3vYwTTeMCSPsEC6rYuMd3GUIGBZ1Lk=;
 b=nIQpSAUl3BISR/gAkvrYVMXA5gA8oQ9YKHi2ZxxmkD28Oy//kIGig7SabM0ExGMen9s9C+oPHM383z7Ge92J3M3syV0JZ4JJi5qvNBlfWu8DVchsBy1L0BN+zG5W9JROJfnsHOiTaMTs1fhMLLVN14QnsfYLjc3GylFK1WS+PsbiWy0wxrrkUOGtzL8Yie/2LcGAsBEJUnGr0OB0g3aJuEzWbo6CULyhFF1AAj9aElQIf6a1fIIkvuJrASS2BbqoeS8EX3M+O6cX1gMMAK162Tygv+DIwj14u1P9EB5nS3ZvUorB5BzdaecU6gTpMW860deA7IJCdLvep5Ay+ENBfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0582.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 2 Sep
 2026 11:30:48 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::e644:7bf5:5a3c:e548]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::e644:7bf5:5a3c:e548%3])
 with mapi id 15.21.0315.011; Wed, 2 Sep 2026 11:30:48 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "rahul@summations.net" <rahul@summations.net>, "anup@brainfault.org"
	<anup@brainfault.org>, "lftan.linux@gmail.com" <lftan.linux@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"ulfh@kernel.org" <ulfh@kernel.org>, "pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: power: Add RPMI device power service
 bindings
Thread-Topic: [PATCH v2 1/2] dt-bindings: power: Add RPMI device power service
 bindings
Thread-Index: AQHdOJQ6V7p5EMG/mU2WFhqzO/X4Rba357KAgAM53ZA=
Date: Wed, 2 Sep 2026 11:30:48 +0000
Message-ID: <BJXPR01MB08380868E1DE7029DC52AB06F9B72@BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn>
References: <20260830152812.312663-1-joshua.yeong@starfivetech.com>
 <20260830152812.312663-2-joshua.yeong@starfivetech.com>
 <20260831-fluorescent-garrulous-kraken-74eecd@quoll>
In-Reply-To: <20260831-fluorescent-garrulous-kraken-74eecd@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0838:EE_|BJXPR01MB0582:EE_
x-ms-office365-filtering-correlation-id: eccdf268-a801-455f-6042-08df08e5a2e5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|10067099003|6133799003|3023799007|56012099006|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info: w0M5utVBP86hSzikSqvAne3/fit16/YM10XGS/Gy7O1k7nMjroCz+F5nxhGFsI1o9fcYEkoCNjLQj3l3CrU4HtAlZrDmK/700906LVINrVjW0oEA0p2jfZMZcAxbk7781TRPBdNrin1kPRTn2KMjb5n7DGzSVAHYzpW78rfM3Ya/XX7Y5L07zrBaYSqQ5JInHWoWGx1SSRwVqH1JQAPJCTG1Lhac3oPC2lAt0ZSRX9Ht/i7EzN6BLf/iIwMmvZTfhISZSNoi0AhHWbV4bPjW7JQAc4v/oUUIVP2G1E1cbTaaR9YpGW4V8Fn+8L8PokXLB+2WSRJ8L4Q7cRgHuK316yBoIaaROjORsegtmKPLa+lx2HJG/MWXWDBDR3ZiVFC7o81+w4mMQ+fO8l/Pt1XP7387B0CVfij6TeAcxLGKZhqZB6NAKJUzVzUNXzwZF4BZdtGL6uBBWdMOS2yx1C/axSDB2dmjx6Pl+1l9VmRAKzJYbpVN4maUkxw4i3V4iValjGQswUCdSjYUyPEIFdQc9PDAEceSw5c16kJKNkKPv+CwzlNBxp0u2lwCxJefJfcg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(56012099006)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WW5tSEUzNmJNRVVta3RyaTk5azFyWWwyMzNkeWp4d2tNeEdzc1VFQTM1VXNH?=
 =?utf-8?B?ZnovQ2hOek9lQUM1SHlRaGNEaDBTZ2VsMG1XQUZjMXdnZVJ6TjVqeU9WR1Nr?=
 =?utf-8?B?QXIvNitCOTBWdW5vSmtjOSt4R2RNYVE4enhOL09rOUJpQmZzVnIxYlBkSWNs?=
 =?utf-8?B?TVE2YWtwcVgrMjdrN3JGbVRSYi85TzY1OFBDNEoyUEFYNTl0Y0ZLem9nUEJy?=
 =?utf-8?B?emt6WWtVSzBSOFFYeHFWUWZUUlZQc0JqcmVudGJWTU80dHRHYXl6MzFmczAx?=
 =?utf-8?B?OE1nR3l6YlRyNWdKVjQ3M05CdEMvdkZ3aTZXQUFlc3hlT012TDIzTDR0VXpG?=
 =?utf-8?B?UUVmN0lLUzF6ZkwrbTd1WUI3Zy9lUU9NZ24xc0JMS2V3TU9oTnZNRTZlMHJ0?=
 =?utf-8?B?ZitGUWRvQkVzSEk0N01CS01wOGlucW9VM1NCOVVVQiswejhObUpHNmFsdUVp?=
 =?utf-8?B?K2FNbklFVlM5WnlJRkVCZTZkWDJvSm9ESThhY1NKTTdXRG9UcEtzNTVCYjlU?=
 =?utf-8?B?VmhTaUxkQmlXS2RsKzFDZC9yT25kU3JmT1NxVklMNFNsRkZxS21mcm1LQ0hP?=
 =?utf-8?B?emlSMXhjMzVNR0JvaTZXSE1aejlGcHluRXBmNEZpQmdsbGFQYUtzaGdXb0U1?=
 =?utf-8?B?RW00UVVoMmxKM051Y1BHOEFhWXFCbFM3TU52d0J6OFFiY2d5dlZwelJ5elZ0?=
 =?utf-8?B?amdxUXFySXcxOEhqRGxRRmxaZG0vODVjYU5QZkRVbVE2T0ZQNUVzem5NVUtr?=
 =?utf-8?B?Yy93Z0RoK3B2K0ZpSmdndk42MUVXaUI3SVFaVHZYUmozYTVoaytzeUpXQmdL?=
 =?utf-8?B?M0oyVXpBY3NyaGQ4MnpUMXNTaE5ielc4UzZIVXNTbUlEbHBVWFpOKzhqTkJ2?=
 =?utf-8?B?bWM1bEg0UkJkeFpaS2h3T3ZiKzZhVmNML05adUpxZTgrZGJpNklwcDg2LzRw?=
 =?utf-8?B?N1ZSQzBKbUdmbncwdTI0U29qLzVhdENac0k3WVNoRGNCUFB1RE84R3NMVXY5?=
 =?utf-8?B?ZkZJc1ZHLzJjd2dObzFiejM1V1gvM1pMUVlLWStyanFLa1JJNHhBcktaNGdz?=
 =?utf-8?B?cVRCK29SWXAwcWJxeFBTU0NOSG8xeFBtRjh2alRlVkZDUEZyWnVpNlh6N3N5?=
 =?utf-8?B?YUpIeVBuM1dNSEQ5aUJSV1FpWW5EWHYyanR2dFVKay9MOU1na0p3NlZTV3NN?=
 =?utf-8?B?L0ZPL1lsZ1l0VVY4MTlUbmJuVlVreGczWFhYVDB6N3NYZmF3L1ZTbDgrUDRT?=
 =?utf-8?B?bVN0R1Fjd0VpTnJRckVkbkMveEJyZzQyRFBrbmpEc0FLRFpqcm4zK3p2ME5R?=
 =?utf-8?B?c3N4OWhKZXBmaCtzeXRRczh1emxTMS81a0JqRXhjZVB5NGRETnFPbkZxTkMv?=
 =?utf-8?B?L1krMXNMSFhKM0VuK3pUZ01QV2t0UTZMaHhaZzMxVW0vSlF2cHhUUUFsZGdv?=
 =?utf-8?B?K1Q1cFdOTDZ3YWJnb2cvM01nK0NNalA5UThoa1RwMXpMYXgxd0pGYmRoZGJW?=
 =?utf-8?B?bElpbEFuUkxCTDFsUGx0MFVDdTNEK0dQcTMwTkNOL1hjYjRGOXo5OWpiVzVX?=
 =?utf-8?B?UTZlVEpWNjBYZ2UzemErSzhkbWw5UVBHT3cyQ2Q0MCtkd2NoSjhHa1FjMzEv?=
 =?utf-8?B?M0VqVHlxRERrVk5UY2tiL0NSL2ptV0FhdXZFVVZEa1N5Q3lOWkdYNkpKNmp2?=
 =?utf-8?B?aTJXajZ6VjhWdjcwTG5ScDBlY2NOT25UcnArMDk1Q2V1TGF0b1VzMXVQVG5h?=
 =?utf-8?B?TlBKeStKSzRFNXpGRlBPTWdjMnN2TzZUSCtnMnc4MkZHWExieHl6L2VvVzRI?=
 =?utf-8?B?RnBRRnRUa3BrbjlTa2FHL1krUkdOaVdiK1p3ZzlBK2dxbnlBY0pNSmZqNDAv?=
 =?utf-8?B?TTdRYWxWWnl4Rkk3cGtYYVZid05GUXovZWN0MHJPbEFOZmUrdTJIZFgvMFAx?=
 =?utf-8?B?SXdUcTRwRmZQMkxoUk1YUzJZUU14NEttZjREQ2FmUWFjVm04c1VOS1hUd3Jk?=
 =?utf-8?B?UGlId09BTnJ5MjdvakhweGlxakhMckh6VG9tR1RLKzVUL0hxMmtkWlJSQW5p?=
 =?utf-8?B?Vmk0WUFTdVVXbjdUbDNqV3Z1SWxQRWJNUGQwYjBrWktNS0t6cVFpdW9yZFpm?=
 =?utf-8?B?M2xqS2d5QnVhUzBSMTJaVDBnWXVSbFMzS2l0WUphaUtISnBqd3ZwNFlYOXBj?=
 =?utf-8?B?YUVFZkg2cXhBTmRwdFR2WW9kTE9kZGhFWFdBQXo0Q2YreFJmTncrVUtSREdH?=
 =?utf-8?B?MVJaWWFCY1d0ak5zY2FpNHpZYmJhTDlYWlJmWlNJVW5yZGgySU8zb0p2dlA0?=
 =?utf-8?B?MFFQL2gvYVRFV2piV1VCRWY4OGpJYmxkWTFHSHJpRkdBaDdBOHpLTWNLRVR1?=
 =?utf-8?Q?7ce2YXE8tpKDABbE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: eccdf268-a801-455f-6042-08df08e5a2e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 11:30:48.3140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4C7Tm7VPHnxdcFiOpuEaBqssE0Ey0VRFoA1CBUOWNjfajglzbFP92dlFGCOOG89YQYfjy+R3NfikLGJqz0IzuI8Zey6N70++wZQ0SJwY7MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_043132_418349_3CE282C6 
X-CRM114-Status: GOOD (  25.97  )
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

On Mon, Aug 31, 2026 at 11:38:07AM +0200, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Sun, Aug 30, 2026 at 11:28:11PM +0800, Joshua Yeong wrote:
> > diff --git a/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
> > new file mode 100644
> > index 000000000000..2b7df66ba172
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>

Ok, I will drop the redundant "bindings" word in v3.

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/riscv,rpmi-mpxy-device-power.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V RPMI device power service group based message proxy
> > +
> > +maintainers:
> > +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> > +
> > +description: |
> > +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> > +  messaging protocol which is modular and extensible. The supervisor
> > +  software can send/receive RPMI messages via SBI MPXY extension [2]
> > +  or some dedicated supervisor-mode RPMI transport.
> > +
> > +  The RPMI specification [1] defines device power service group for
> > +  accessing and controlling the power state of platform devices managed
> > +  by a platform microcontroller. The SBI implementation (machine mode
> > +  firmware or hypervisor) can implement an SBI MPXY channel to allow RPMI
> > +  device power service group access to the supervisor software.
> > +
> > +  ===========================================
> > +  References
> > +  ===========================================
> > +
> > +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> > +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> > +
> > +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> > +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> > +
> > +properties:
> > +  compatible:
> > +    description:
> > +      Intended for use by the SBI implementation.
> > +    const: riscv,rpmi-mpxy-device-power
> > +
> > +  mboxes:
> > +    maxItems: 1
> > +    description:
> > +      Mailbox channel of the underlying RPMI transport.
> > +
> > +  riscv,sbi-mpxy-channel-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> Why isn't this just phandle to mbox? Or even implied by mbox channel? As
> your example shows, having same value in two places points that it is
> redundant.
>

They look alike but they are in different namespaces, so the two values
are not the same number. In this node "mboxes" points at the RPMI shared
memory transport, whose #mbox-cells is 1 and whose cell is an RPMI
service group ID 0x9 for device power. "riscv,sbi-mpxy-channel-id" is
the SBI MPXY channel number that the SBI implementation then creates for
that service group. The node therefore describes a translation
rather than a duplication, consume RPMI service group 0x9 on the
transport and expose it to the supervisor as MPXY channel 0x1002.

The 0x1002 that does appear twice is spread over two nodes with two
different audiences, sitting under two different mailbox controllers:


    rpmi-shmem@12c10000 {            /* RISC-V machine mode only */
            compatible = "riscv,rpmi-shmem-mbox";
            reg = <...>;
            #mbox-cells = <1>;

            power-domain@9 {         /* read by the SBI implementation */
                    compatible = "riscv,rpmi-mpxy-device-power";
                    mboxes = <&rpmi_shmem 0x9>;
                    riscv,sbi-mpxy-channel-id = <0x1002>;
            };
    };

    sbi-mpxy-mbox {                  /* RISC-V supervisor mode only */
            compatible = "riscv,sbi-mpxy-mbox";
            #mbox-cells = <2>;       /* cells: channel_id, MSG_PROT_ID */
    };

    rpmi-device-power {              /* RISC-V supervisor mode only */
            compatible = "riscv,rpmi-device-power";
            mboxes = <&sbi_mpxy_mbox 0x1002 0x0>;
            #power-domain-cells = <1>;
    };

A phandle from the supervisor node to power-domain@9 would resolve its
"mboxes" to the shared memory transport, which is not something the
supervisor can drive. The windows are owned by machine mode and the
only RPMI mailbox Linux implements is "riscv,sbi-mpxy-mbox". The
supervisor reaches the platform controller through the SBI MPXY extension and
that ABI addresses channels by number, so the channel id has to survive
as a plain integer on both sides of the SBI boundary.

You can have a look at the diagram in RISC-V ratified specifications in
https://github.com/riscv-non-isa/riscv-rpmi/releases/tag/v1.0 -> riscv-rpmi.pdf
in Figure 2 High Level Architecture.

> > +    description:
> > +      The SBI MPXY channel id to be used for providing RPMI access to
> > +      the supervisor software.
> > +
> > +required:
> > +  - compatible
> > +  - mboxes
> > +  - riscv,sbi-mpxy-channel-id
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    device-power-service {
> > +        compatible = "riscv,rpmi-mpxy-device-power";
> > +        mboxes = <&rpmi_shmem_mbox 0x9>;
> > +        riscv,sbi-mpxy-channel-id = <0x1002>;
> > +    };
> > +...
> > -- 
> > 2.43.0
> > 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
