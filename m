Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E06AC63697
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 10:52:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F200420DD4
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 10:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WCL30qtU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="komXGf22";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="HGk4nnLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F200420DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=1nZVL4Gvs5gT8kucSXfJ03aL9OGt+/QdLuiOQGT1E3s=; b=WCL30qtUIAVUcFkXtc6eyaa0H
	YHLQatHaFEL6kzO3f/g8kpDeYnzI4uib96ERV6QxmUbhS49esfmEtGiaBveIS7FAOOrLLrTlp4bkM
	xjl1WvaKg2mMAWpQOHcvr/zd4AL/23OuVavtl0c0vhn9xX73wg34+rurmLRqXlB9rlJ/FrjZLQPrb
	IrCgk3r/L0ZaA491gbErb7Z9W2nyk609KjQ8BN7bqU7eAH5K7JURJoHXZ+FgVsQBw2dRjHV0TWBMG
	NFnoyp2feuAfXKGsbGtGj8CS21ZmsmNOj263aAG5UuFhDyyj1JzkgP2keO0j+Y6GculP/JGQpgaXN
	jKrdtWc6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiEt2-0004BO-A8; Thu, 26 Nov 2020 10:52:28 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiEsy-00049s-Be
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 10:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606387945; x=1637923945;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=CjvzGvZgfUbDQ1Z8gZeKHotw0tNQ+GO1BnQxmZuFBjk=;
 b=komXGf22cRUTYCMSdwLQBvV60jxLoBiWuK6t0ep2Qqu4bIwqBs2TMbD7
 ok8WL9V5zOFKyBuJbM5xbOslB42LEJlf7mXSxq1h63uVAPr1JuN8e6HVT
 LnUSFhXuu5Hkd0fERjBIRSL7GvCXCjt5jC8EYfv1AfBfuQMosSU1Gtbjp
 YmYDs8djC12g9QFLBzVD/8+r7qLY0j2ZVMOrbFboDTjDdNX5kNQc9UyIJ
 6T2BCO2Cl4xP2LYcFmUFr8eZO4lv0eKO5n2qDTkpQdmdVfQ2YJe1CXCcj
 ciX6vyYHADYsoi1VOGVBrciFC7IBOBbe6XTSBSnSqT5GYtCCWwsqLqKXB g==;
IronPort-SDR: YF2W67jduX+3gUnE5YKBv4Ooq8OIt8OxKgQQcQyy+h0dLh/5kGjtFXTp5/Hno9/gRRgc0tdUMl
 JBIcEuKElFdXY194VUEICetf3qZ+ELSYWrtomXW26CSHXIS8Pc0IPbzyw0XHUujl3vGW6TSbRm
 Mlv0BtemFZiragvAMzmL6Qee1LlBBq8EmNQOJ/Kew7LnDQZ6Enpn3qW76QZ1IQrgEXVVXsiXC0
 z0o9LUOZdSfZwPoK8NslmCWVKUSz0algnWTWBbq4Eo+h+eCJNPlA+N9QyP7GS7ujejnhIT0d8/
 i84=
X-IronPort-AV: E=Sophos;i="5.78,371,1599494400"; d="scan'208";a="154747527"
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2020 18:52:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vjw6B2jwaC1kpHhY/0iSSYEQhMmU050iqz7miZADVyHYlEPRYP5XREPFzS77R43q/C+gb5ufLiDMGSGPc6ESDx7Ie7J7eXq00z9+Au0KBUVU180xK5kYni7eJveJkS5VdO6sDZxMrdVCDUFDLuYoBKhl79//9mNyk1opN19m5hGx/it0pJKNPaTdAW5LiEJ0scnXtBokQ4Mr2kn29miebnUTPyce3iBgkqIl3z0fvhLC0wYQZd3sRj5yClrRmxOIoHrJ+ZF0hbSTkFpZAVGwMmMpEXrxA1vcxBHaUzv9WwRY+Vq5pooZoDTrJbXY/slL9SlY0B8v9ziDsZyurBNLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDZPOWiqdV27x9Ref+8xiJQ9H1u9hLn9SFGX8aMCwz0=;
 b=f/pDq98io7S/ure41rcavnRHpNX35pmigsM0fnvU1TfMtpfb3sw6vC4fhRzi5iaCW682F4KmyddYk6N5jBbaeOLaVzYy7ra2+1oMaDFwe6gL5Cqd9wtNaZ4OPDhCNPBIQVrzPF0Lkje/vfWwcobNg3uXYTKCDwdWTxIooRKTG/qtRpbxjkBpKyy0pksSyFFkZlh3xXjXms7CXO771gHgtk6CU7Q/WFpmqYOMgySDOkgyamfqo00tOrCI9BWEwPIVaZfRLbFnIXNDgoVdcGAhwPN436qIgvpX24fZuepqSxhNwZy9Riq3ZWyd+xu8CjG/P2ABkRKavdvGLyBXC678Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDZPOWiqdV27x9Ref+8xiJQ9H1u9hLn9SFGX8aMCwz0=;
 b=HGk4nnLVUlXWFXLDGReY6Qh1iXw1FI9Wu9XCCunt/uPWCQHsqFpwXao08XaLrOO/Mxv6UloTpBgB/g55UsNuQF9sNVPTkgB4zkB43YHM0IApZbca7jiJKnPfMyERSJLEczOiCtDsovAZR0wQoS1WGyykfyC6t3FD6Nu/Nq72JVc=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6508.namprd04.prod.outlook.com (2603:10b6:610:6a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 26 Nov
 2020 10:52:18 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Thu, 26 Nov 2020
 10:52:18 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 09/21] dt-bindings: Document canaan, k210-fpioa bindings
Thread-Topic: [PATCH v2 09/21] dt-bindings: Document canaan,k210-fpioa bindings
Thread-Index: AQHWwhuTTl+n9RngRUi4SREztTsSrg==
Date: Thu, 26 Nov 2020 10:52:18 +0000
Message-ID: <CH2PR04MB65227207B4BAF30171E29ABFE7F90@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
 <20201124043728.199852-10-damien.lemoal@wdc.com>
 <CAMuHMdXov3Dr7EmAeE7yrKRmtu_L3539u9cjeiGiaRu32YVPQQ@mail.gmail.com>
 <CH2PR04MB6522F476C51D4C65F116BE9EE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CAMuHMdU_3B4jogmeisykbeH8QCbUrKMM3Zd8qHftdGGKYbtJoQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:7477:1782:371:aeb9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7012d63f-efdb-4388-008e-08d891f9584e
x-ms-traffictypediagnostic: CH2PR04MB6508:
x-microsoft-antispam-prvs: <CH2PR04MB6508B1AD435903275AF6BED2E7F90@CH2PR04MB6508.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vX3SWZBw9sYCVRnArr2zdr2ndYXRQ/xE4TJDJmn8HUhxQDOulserMZaYc57ZDRhVT/bgLbgqgBu6SZV5e0ss65vQm/MJlS1a1sMH27vGrKCkYiCNMmEGhFC6rF7M04EV3IkIS4Vz/UEoDj7ohOJSsF5ytOr24tbZxR2yU8PA0QmCbOmffUxF/2uGld8dzQ9gc/dsl24i7PvIMv1j2If/WEgUz/NUYYbcFn1V3VoWBwNr9zJjeYtOY1SDRzPb42A3GChmZIxekH6qXeSwuDLJoACwhji6qRq7hImyR2XrEfEUazYrLj4zQx+gK3U1p3fQFU85Kf5obMnh8ZdTKvDsXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(8676002)(5660300002)(9686003)(7696005)(86362001)(71200400001)(53546011)(4326008)(6506007)(8936002)(52536014)(6916009)(66446008)(186003)(66556008)(316002)(64756008)(66476007)(76116006)(2906002)(83380400001)(54906003)(33656002)(66946007)(55016002)(478600001)(91956017)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?e+zuw6u+tRk2MG6ewph23SS1QqbFmt1ENaeXKyID45nHXgHnlN8EgOjXdqcG?=
 =?us-ascii?Q?LHSa9VsXvK0hjMZJx/Zystg6vaTJPwL5xzpJfN+jFYKMlWamg6L3+xxIPgjT?=
 =?us-ascii?Q?FKWYzOhLhAU76MuDJs9qdkMwZBxx+lDf63ityppOzDvHjKiGec9ddguuPyfC?=
 =?us-ascii?Q?hRC8yojFVnaXcYZuk5AJIsi0DSXhLS8u2iVv46JpuwQLKmsJPhwdxP9LP8cd?=
 =?us-ascii?Q?HjfhTp59dFlgbCpoIhSsvoJMwWHa5gO3WYI/4qFrYfdrSE8b71N0/AEZVBOX?=
 =?us-ascii?Q?3tC0R1iG/uonGsFwseVc2yYveHZod4alb3pJ4IV8JJhm16S6at5WgNQWoeup?=
 =?us-ascii?Q?i+fm6SA1yyw0qWHgYdhQmejCeLgiEbo7kWqQ6CwcsPpfAud+ZJGWTBE5by30?=
 =?us-ascii?Q?HDVn+c39YqC6Kg/zg54TCFVf3+cQkXI6x3eDUTIHlGwQYoFM1V6STa6Z1Ptj?=
 =?us-ascii?Q?LFM4s2QfhAGcR0Pj2JRsT6iZW84awBJk6v995iEdGfAPL/krmieHfJSMMgLH?=
 =?us-ascii?Q?Q+G2BhDMbyMMNT8MJ0gfdhAWoySVa7uAw1789MujyYO0fWjT+bTfNY5HjkcG?=
 =?us-ascii?Q?TZc/ihPCdwU2OdDoDnMyZGHItbtZkULHiy2xylCL+G/nr/ZYD7Bt/1nbTKT1?=
 =?us-ascii?Q?Lr6SjcNzrvILFmpl4hnx2n8L6/tAIUpge8ryd0eJiGmyFcV9QladESC7Jrrh?=
 =?us-ascii?Q?kuarizgtvdJGE4MoCaEOsZwYe9AGnV5g/SCECqrHy8kmDBRbmABRyTcjXAXx?=
 =?us-ascii?Q?WBKtwbKi/Ai5VbrgCQD0fjoAMVSKd1HSZytSuxZyZXsC3wqOvWBkgmzn+llH?=
 =?us-ascii?Q?3jxPXFbc6oNlHqusiVXqoCZpB+5BwcRW4Jne9bg+CgjnxcgpkbJVGsxq1mVU?=
 =?us-ascii?Q?NI52t5sVd6HGoUAjL7oaHd7J6hmf0rZ1OkYJvGx2AqGgSmwaifvQfer4vKFT?=
 =?us-ascii?Q?4E5/NgYhpVjsUz5DB57eU99iBVWiAH3vO0CX6OfTIE25C4Gus4t4LfKoZw4V?=
 =?us-ascii?Q?fDEKF6XuquCm++woahQTXUvYdsPjBvG1gD7gHNv9IdiFtACOL9QJWLiyMv8e?=
 =?us-ascii?Q?59hCnFLG?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7012d63f-efdb-4388-008e-08d891f9584e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2020 10:52:18.5882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVpw+o0/qaizRU60eXW8gYUumd+HIq4dl0jsgmE9AHBdFbqstjVFsG4eePmDLseByK0itNJsywatp2kJECOmKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6508
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_055224_782580_6656EF3D 
X-CRM114-Status: GOOD (  16.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/26 19:43, Geert Uytterhoeven wrote:
> Hi Damien,
> 
> On Tue, Nov 24, 2020 at 11:05 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>> On 2020/11/24 18:49, Geert Uytterhoeven wrote:
>>> On Tue, Nov 24, 2020 at 5:40 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>>> Document the device tree bindings for the Canaan Kendryte K210 SoC
>>>> Fully Programmable IO Array (FPIOA) pinctrl driver in
>>>> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml. The
>>>> new header file include/dt-bindings/pinctrl/k210-fpioa.h is added to
>>>> define all 256 possible pin functions of the SoC IO pins, as well as
>>>> macros simplifying the definition of pin functions in a device tree.
>>>>
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>>>
>>>> +  canaan,k210-sysctl-power:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    description: |
>>>> +      phandle of the K210 system controller node and offset of the its
>>>
>>> of its
>>>
>>>> +      power domain control register.
>>>
>>> Your k210-sysctl-v15 branch has a bogus trailing space here.
>>
>> Oops. Forgot to push the fixed up patches. Just did it now (forced update
>> k210-sysctl-v15).
> 
> $ make dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
> Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml:59:1:
> [error] syntax error: found character '\t' that cannot start any token
> (syntax)
> 
> DT binding files should use spaces, not TABs.

Arrg... emacs again... Need to configure it properly to use spaces for yaml
files. Will fix this in v3. Thanks !

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
