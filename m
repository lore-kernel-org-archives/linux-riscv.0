Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1926EC61DD3
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hxEewZhJGMFw9zEOmd+jZ5gckc4lgw8P/tMubFWuGLY=; b=vn4VL0WKFqHh6i
	uWEMLJnOTXAUsyBuVWuH8LTqDMhw0jDrNqh45JolSYwGuLoHGBt7fasuu+dkAOdRsgwjC9hZa76zw
	OvbePG6BRBpRfEI3CY7vkq9p7HekhE5m7y3Nt8dAuoT285O92qALcY9v4NswMfEczJJ1WXo5E1exr
	dZG7Q424OIDJKKrbsoQ3mn5Fmkl+eCckqOIKjDYncDjWg3LQVEmxsGKVkIflbjBmiOW+4PhUksLgs
	lp6NYg/6YFDndxzAJHSDdwbDrEuPg8k1/xG8oTL7746NmuU54ddowHTDevscpDLFLLDSEaC2NK0VI
	hmZNCFGA4AtZosvxqwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24Ab-0000000H0iu-1zJX;
	Thu, 03 Sep 2026 09:55:45 +0000
Received: from mail-bjschn02on20722.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::722] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24AY-0000000H0gq-11PV
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 09:55:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kj2w1N14OQn+5s/n53K78LScKDm8jCB+CGPu0rPkKulEPnxJ5q6AuIa2s5yef9JjBa05vykwkeDuxfLWSxyxHTnuDZA/9n4HKbIK+vimAL+MQXZZRyHRLFPP8Amt4P3wse1yfKY+U7uim4LoFdZe4ld7pTQLvNT1cBLUIHzbxYP+437t4x5rpBE8k49Bvl+LphmsuR0PMrYA1Lzc4z3lTDWwzIddvRSlQgqlIe5yl8PDmiDoVbkiziHxj26Ncz5KH1uVPeuL4Uy6UHaCTRftTSEcGLuwiaaI8u4IANzB1G1UY+/NED++rcpx7Auv1/a/yaA8aVso43sUtSVXYvQxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMUbCGFbHKzgKxdr3JwQ7u3K9xateuCpYcMXZvpTrBQ=;
 b=Uex7eKgXjaW+WcPui6HX1mQNGbhjtJNhNH98GXMQwldTE5fSiTMxVN+Th/hyJXOWtVxqhrRXkw/XPuE+fcGfOPOQzi9XyzOp9Pfa+bLXsZvBTnEM18Xx0cAF6VT2A/r4AAd0/xiI+js1NNtg4HCCqU53fbUao1iDrIS8aDB/f6qmGUbML4mOAjsnnsnGUIfZBFevcJUVTudSKrZp3rgqsZQL3vH2mrJJ1NU7rt4vjjhSf2xFq3gq2A1VjY1M1fXwUzC5yfNAj6AuQdvfLODgKaW25sTTrXyD8RHzsWtYG9nrUVx6/rUZ+fQxCjPSCry/ash59Rb2RMTNkZODHDnOCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0887.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Thu, 3 Sep
 2026 09:55:17 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::e644:7bf5:5a3c:e548]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::e644:7bf5:5a3c:e548%3])
 with mapi id 15.21.0315.011; Thu, 3 Sep 2026 09:55:17 +0000
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
Thread-Index: AQHdOJQ6V7p5EMG/mU2WFhqzO/X4Rba357KAgAM53ZCAAUs+gIAAMDnw
Date: Thu, 3 Sep 2026 09:55:17 +0000
Message-ID: <BJXPR01MB083833106AEFCF27556751AEF9B62@BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn>
References: <20260830152812.312663-1-joshua.yeong@starfivetech.com>
 <20260830152812.312663-2-joshua.yeong@starfivetech.com>
 <20260831-fluorescent-garrulous-kraken-74eecd@quoll>
 <BJXPR01MB08380868E1DE7029DC52AB06F9B72@BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn>
 <85401168-1372-4904-b3af-cfcb837947db@kernel.org>
In-Reply-To: <85401168-1372-4904-b3af-cfcb837947db@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0838:EE_|BJXPR01MB0887:EE_
x-ms-office365-filtering-correlation-id: d14e6150-9a89-4d20-4467-08df09a17573
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|38070700021|56012099006|6133799003|4143699003|10067099003|22082099003|3023799007|18002099003;
x-microsoft-antispam-message-info: Q5v7lM87VrfK9YI+7orze9kg3ant22ovfJOEGRlJu/ewshqnQPWlROdk1Vt8LPuBlWprjTF5kTnUhsgR++Q+F1moMoX9py2qQueiqwBFgXhBvUmVE1VJpR9vut307HzObpRTl8EDr8yXCHBqaCAIsm9B9nudC2XaA9GHWFwCO2Cm5HQ1dKJBIV9DtqcAL4Ww8lb0gwEKm+FdqKXufeVqWmW224r3X//FtE6UTNDpKBR2Z91kTqaI4OSZmGf1zV/bdzRFJfjc4pG7O10hekwDy7tNqz1WaFnwmH8r0rCVsVLwjyNt/Wh50EisBSlaWSUBzP/tP9DZjRr4y9P7eAmjlcIRFoSU7qIC2WOBnKMpNyI35a/NkA/lOKKuQTFGmodkqLo/1Go3bHonFLDXIwgxMZkELYZTYjkQeVokliXKGeb7aL69Ju3Mt5NI7+hVziBElxuA+N3XbmI6vI7aGi8JfPoQWA7XyyzO3j7fG2omm2vvaGJvzKM28nEU56zxxmpTlqPnOc6gKzg7JAFWqU9tSe6MXGSlIvgbQkIqP79wx5LOYGWKzadoh3I5OJ4Z6c3O
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(38070700021)(56012099006)(6133799003)(4143699003)(10067099003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1hIcXN6RlFXelFtT2t0VW81QWFjN2N0QWg2M09rSHFSY1RZdW5TNW9CYXYv?=
 =?utf-8?B?ampBWVZhYmpDenJ0eHdFdnlvQU4venlhSFlEcSs5QnRNRG9mMkJiNitEUllh?=
 =?utf-8?B?NGRPZHhKck1NRHZoRmZEZXdyKzJHalJVWHVsYllzSEs5UmVXM201dktNdUpu?=
 =?utf-8?B?SkptV0VDWXRUTE82dUJVZW5CVE1OOVh1Vm1JdFZNNTEyMURzeUJralIyTUlN?=
 =?utf-8?B?OVZBQUNUQ3VtOGR3V1FLZHdSUUJwRStZR3FJbjQyWDFXRzlRRXorSGJ0V1lZ?=
 =?utf-8?B?VC9OKzJHdGxtZVFOZVVVZHVoMmgraXVobmxFbUxId2hGU2doRXZOdnliaDRs?=
 =?utf-8?B?amdvaCtia2VlWW1FTnZYV2xRN1U3ampzYlp3QStmUU00M3EyR09RWmpZaU1n?=
 =?utf-8?B?SDB2TzQvRHRVZGIxN2pTSTNzeE4yNU5jYXhLcTRJSWJXTWIwckJ2UG5CcHNU?=
 =?utf-8?B?Z09QM2lqakFYbHRTeDZFeHdqTTIzU1B2WmlKUC9SVXoxeDM2MlVpMUN4aHJ5?=
 =?utf-8?B?bEV4bjFMVVRNZnpUQ1MxYzlVcGV4d2VFU3c2UDVFa3UrQmRXS0ZpaHpZS2pp?=
 =?utf-8?B?VUlVSVNmNllhbmpWSTRkbnVXR2dOSjBGUWZnTXl0UTZxQ2pia1FvWFpYdUZR?=
 =?utf-8?B?TExhTEdCdVRnMDVhb1ljWWdlNzJIVjBkOUhPNGFkd0Yvb0dDZUtkRHJxVW9L?=
 =?utf-8?B?M1NhSlZuMCtGVFYzWkJUVVVQVXRXTi9PUUFsRHRmdXd4RDFmeUc4Qng5OWww?=
 =?utf-8?B?QndVcktYMXJNZGxlSWV6dXFpR2E1UW1JTW5NTk1GdThrdTUvSE5EdWFHRGtn?=
 =?utf-8?B?dDdTZlo4VEJQYUMxQ3F2UWRMeWpZTnpTdkQ1M3o3L2IydmszSkJBb0hvTTRm?=
 =?utf-8?B?UWhZSE4yNG1abTlYcHVWTHc2a0x3OEwzaG9VUEJ6VmVlUHllbVhYek14UWJF?=
 =?utf-8?B?dkVjU09IbFNwWjFwcm5RaFU2YkQ0bjh5eUpsSldQejBzOVVic0YrVHczNXVN?=
 =?utf-8?B?YUxOU3ZDOEQrMXI3aXRoOGIwZ2JuUFJmU3ZyRWx0NUZqNGJKcWJETzJDREd2?=
 =?utf-8?B?NlFpc0FiYUlHNjZNa3dxT1ZhVENwcUY1ZUQ5Z3A4dlJUSXl0ajRta2piYjho?=
 =?utf-8?B?c2pCVjIrTWlSK0Joemthbk55R0x2Z0hMQWVOOThBWWFkZ3JiN2swalVxaGh3?=
 =?utf-8?B?QVgxR0J6ZExTOW9JSWxyWVFYSmlreXFUUy85NUp3Q2M5cVJDa1dBR3BmdGx4?=
 =?utf-8?B?dTVISXNlU012WkZycTNYSEJRdTZjU1BRNjR1YTVILy9EMncwalJUUnFGaUVq?=
 =?utf-8?B?SGw2YXNNU0ZJV0Q3VmZxcFo5VG1CMHV3UStIMnFCUHE0SkpqM3IzR3Rid20v?=
 =?utf-8?B?ZzJlSHd2Y09PUnVlWVh2czdjc1NiNWdlZXVjMVJXaUc1OCtxb05oMFEydTNo?=
 =?utf-8?B?WXhZVVR2bklvZ1FKQTRpcXdBUFpISk1XelJ4UFY3b3J4ZWlTdTM2QUh1amdH?=
 =?utf-8?B?blVuMXEzNU5OMmNpM2g5dEE0dnBqK2EzZFJFaTFBdVpIMC9nTUpidXlJTHZN?=
 =?utf-8?B?bXZjalZlUGlMUlZrOG5FVkx5WHBxeE5aanRwamcyWDVMSUxlUDZVdlozN0Ir?=
 =?utf-8?B?Q2Z0MVJoU2tlUUp6NXNML2srS3NBNGJzd2FWVnFxbGlyN0pZUER6ekxBdkZJ?=
 =?utf-8?B?Z3ZMK1IyMmd3QzJ4UWtHVkZ1bldPTm9peUZBSWxnWWd6WmRKdlppTldkU05j?=
 =?utf-8?B?aWZWSU5MaVZ1bm9Qa2ExUGNOQStPa2FhOHkwNnphdWdaUU83VlJjQ1RXOXV6?=
 =?utf-8?B?UFVVNzlFeDVkWXI1S3h2dUxSQ01CWmpjaldwT0ttNm1KUXViYWVkVUdNWWxn?=
 =?utf-8?B?VnFDU0EzaGhiblo2bWExOVlwOU93S0tjWlZoNjNDN1FIMVJEYVR4dnlXQ2hn?=
 =?utf-8?B?cGxVWmpqd3pZWlczZjFrZnVFR3JzYzd3N1VRZENubnRUaXZXbHlYbkU1Y1ZR?=
 =?utf-8?B?dnFVVGRnYUhUYlR1cDkxOVJaK2lBQzF4RFN2ekNLaDJta0Jqbm9iKzhTMDZ0?=
 =?utf-8?B?VUQ1L0hUT2RVY1gxZ0lSeHdsT21ZaWxwQkg3THhXb0NPd3JPZllwNkNCZldI?=
 =?utf-8?B?V2MwdlE5VkxsWjZjbmxwTnFRaVF6L2NES0ZKbnowZEJjTWhpZzVMempHMGRT?=
 =?utf-8?B?WFZKSEpldWVFdy9nWWNXWWFEMkk0SkVkRHlYQThjbXI4andmblo2Mm5mSEl5?=
 =?utf-8?B?MVpuaUlGV3NEYUQzWmQ0T3V3RG43T3huSENrY3hiUmFsTUZGNnlZQVd5MEZs?=
 =?utf-8?B?NHhZaHA0ZTRPVkpxZlFwNFYxZk12U2w5clM1cFdoODcxL1dHNnJTOUNobHp4?=
 =?utf-8?Q?U8QPR3j8c/QUXm4o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d14e6150-9a89-4d20-4467-08df09a17573
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 09:55:17.4272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0AjDrVOFoLXuB0kVsRipkcoyI/Toq4hU3p82gH/LGZOuBdZPvOwfbyB9jYb7eGx6a8LCyuAcJ0kG50Ps2CPRQPQkuCaRPBbWyI7Ka2T1is=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0887
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_025542_441192_B73165B0 
X-CRM114-Status: GOOD (  28.88  )
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

Sorry I miss out on your feedback.

On Thu, Sep 3, 2026 at 08:39:33AM +0200, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 02/09/2026 13:30, Joshua Yeong wrote:
> > On Mon, Aug 31, 2026 at 11:38:07AM +0200, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >> On Sun, Aug 30, 2026 at 11:28:11PM +0800, Joshua Yeong wrote:
> >>> diff --git a/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
> >>> new file mode 100644
> >>> index 000000000000..2b7df66ba172
> >>
> >> A nit, subject: drop second/last, redundant "bindings". The
> >> "dt-bindings" prefix is already stating that these are bindings.
> >> See also:
> >> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> >>
> > 
> > Ok, I will drop the redundant "bindings" word in v3.
> > 
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
> >>> @@ -0,0 +1,65 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/power/riscv,rpmi-mpxy-device-power.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: RISC-V RPMI device power service group based message proxy
> >>> +
> >>> +maintainers:
> >>> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> >>> +
> >>> +description: |
> >>> +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> >>> +  messaging protocol which is modular and extensible. The supervisor
> >>> +  software can send/receive RPMI messages via SBI MPXY extension [2]
> >>> +  or some dedicated supervisor-mode RPMI transport.
> >>> +
> >>> +  The RPMI specification [1] defines device power service group for
> >>> +  accessing and controlling the power state of platform devices managed
> >>> +  by a platform microcontroller. The SBI implementation (machine mode
> >>> +  firmware or hypervisor) can implement an SBI MPXY channel to allow RPMI
> >>> +  device power service group access to the supervisor software.
> >>> +
> >>> +  ===========================================
> >>> +  References
> >>> +  ===========================================
> >>> +
> >>> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> >>> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> >>> +
> >>> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> >>> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    description:
> >>> +      Intended for use by the SBI implementation.
> >>> +    const: riscv,rpmi-mpxy-device-power
> >>> +
> >>> +  mboxes:
> >>> +    maxItems: 1
> >>> +    description:
> >>> +      Mailbox channel of the underlying RPMI transport.
> >>> +
> >>> +  riscv,sbi-mpxy-channel-id:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>
> >> Why isn't this just phandle to mbox? Or even implied by mbox channel? As
> >> your example shows, having same value in two places points that it is
> >> redundant.
> >>
> > 
> > They look alike but they are in different namespaces, so the two values
> > are not the same number. In this node "mboxes" points at the RPMI shared
> > memory transport, whose #mbox-cells is 1 and whose cell is an RPMI
> > service group ID 0x9 for device power. "riscv,sbi-mpxy-channel-id" is
> > the SBI MPXY channel number that the SBI implementation then creates for
>
> But SBI MPXY is also a mailbox, so you are encoding mailbox channel with
> a different property.

It is, but this node is on the provider side of that mailbox. It is
consumed by the SBI implementation. It takes RPMI service group 0x9
on this transport and expose it to the supervisor as SBI MPXY channel
0x1002. "mboxes" is the transport it consumes, the channel id is the
channel it creates, so it cannot be a phandle.

The SBI implementation may be an HS-mode hypervisor rather than 
M-mode firmware, and then the two nodes are not in the same device
Tree. The provider is in the host DT, the consumer in the guest DT. 
The channel id is the pre-agreed handshake value between the two, 
assigned ahead of time so the guest DT points at the right channel either way.

>
> > that service group. The node therefore describes a translation
> > rather than a duplication, consume RPMI service group 0x9 on the
> > transport and expose it to the supervisor as MPXY channel 0x1002.
> > 
> > The 0x1002 that does appear twice is spread over two nodes with two
> > different audiences, sitting under two different mailbox controllers:
> > 
> > 
> >     rpmi-shmem@12c10000 {            /* RISC-V machine mode only */
> >             compatible = "riscv,rpmi-shmem-mbox";
> >             reg = <...>;
> >             #mbox-cells = <1>;
> > 
> >             power-domain@9 {         /* read by the SBI implementation */
> >                     compatible = "riscv,rpmi-mpxy-device-power";
> >                     mboxes = <&rpmi_shmem 0x9>;
> >                     riscv,sbi-mpxy-channel-id = <0x1002>;
>
> ... so 0x1002 is:
>

This is an configurations that meant for SBI (Machine Mode in RISC-V),
like  TF-A mode in EL3 for ARM platform. It may not be expose to 
device tree on linux / client side.

>
> >             };
> >     };
> > 
> >     sbi-mpxy-mbox {                  /* RISC-V supervisor mode only */
> >             compatible = "riscv,sbi-mpxy-mbox";
> >             #mbox-cells = <2>;       /* cells: channel_id, MSG_PROT_ID */
> >     };
> > 
> >     rpmi-device-power {              /* RISC-V supervisor mode only */
> >             compatible = "riscv,rpmi-device-power";
> >             mboxes = <&sbi_mpxy_mbox 0x1002 0x0>;
>
> exactly this, no?
>
> >             #power-domain-cells = <1>;
> >     };
> > 
> > A phandle from the supervisor node to power-domain@9 would resolve its
> > "mboxes" to the shared memory transport, which is not something the
> > supervisor can drive. The windows are owned by machine mode and the
> > only RPMI mailbox Linux implements is "riscv,sbi-mpxy-mbox". The
> > supervisor reaches the platform controller through the SBI MPXY extension and
> > that ABI addresses channels by number, so the channel id has to survive
> > as a plain integer on both sides of the SBI boundary.
> > 
> > You can have a look at the diagram in RISC-V ratified specifications in
> > https://github.com/riscv-non-isa/riscv-rpmi/releases/tag/v1.0 -> riscv-rpmi.pdf
> > in Figure 2 High Level Architecture.
> > 
>
>
> Best regards,
> Krzysztof
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
