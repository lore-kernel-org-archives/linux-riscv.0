Return-Path: <SRS0=FwEc=FV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B05FC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D685423600
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Dec 2020 08:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D685423600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=gHANiMzztunqbdzMgtzJ3oFfVbLF1q2o+JJ9RD5c0fs=; b=VSU8x2HG+pbC/txRNBNJ4IzdF
	Xv9501FpD5QUe9NctbdW4dmPBTElSbNrvtahZ1R0luQa0muKwJ897ebQfm+HKrJnkvJLxhTirwALE
	bUlAJNZm0SsY9NLyI9g13+bdEMFf7QresJDsHVmhCV3/MJANg2oSXYqzwfbUbhqpfGH+MjuL5R1II
	pHJXFF1WDzknvzO3ZsCTzcOa4EKYugBZ1cDjbH8OlCAzayPZwzKmaqoYAY7DMXYtNzTa9+aBMtAJf
	gA7cfhaLxlVo9bs7vg4zFewc+goxsskb64VRF+kpngi+vgBoUwmaT5soA7H1Gl452y+8MNWzOJtA5
	/ohRF7vqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpoQH-0002en-GF; Thu, 17 Dec 2020 08:14:05 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpoQF-0002eE-0z
 for linux-riscv@lists.infradead.org; Thu, 17 Dec 2020 08:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608192842; x=1639728842;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=0/Vr6Xs1kMoy/n1g9O3txWGnkwftTcE+kDrjmfYBR9E=;
 b=i4IyojH5shw9vpY0lzqDOxWhggj0sooDrri2LwEVNFaE1oy3Sp3UbvnX
 gi8KE1Psa5/qGq8o88xZwyasn8xYTVngz64FPl5A1WOGZBmxeBGSDYkYa
 h2X4/iWYkidIjyRqx1KmKIKERKvEmycjKnt1TkijsxQJztFewesYyffld
 dMpy6SbSqwMyfGoDso+RgvKNRq0wOtSgrc38zabDQEzz3JNd56PL1t7WG
 yGcHN5ipEZ3s2sVDX/aE3JUQ12DLhrSayj55hRQS59Wk6wMPNk3fAC9OM
 uYLggvo47ULMtgQhsbrM+cT7bi0P2jgQdqIKTaN5j8CCQj9MovQkRrLz/ A==;
IronPort-SDR: Docz2HKqtL7K9WY2iNhRRPlx5NNCKwSJRNIDBObaeRCLpB9bn7diviKIcLcf/I8QMBv0H5IS6A
 vYwVvV4ogy+qS84wl6Haz7GNWVJMZFIDrkFw+vjPp1c6Hhw8ag8r0dboLShwhIMaxhf34FNEhk
 AqOIN3vAaHYT99Y53iZGzdCPMM/oE4VH8KJnIihzDJj5i/F8KpCIIPd93ZhwoERm8CYVt0bdtz
 9VF4hoorWpwahWnZEOFsCyn12yymOWvtATHHdslrfR6g69XxqGsgsFzfuSnA9Ch0gChJ3BGJlc
 oR8=
X-IronPort-AV: E=Sophos;i="5.78,426,1599494400"; d="scan'208";a="155381829"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hgst.iphmx.com with ESMTP; 17 Dec 2020 16:13:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpzFKDWRyYBV3/UrcheROy1/f2K7xK8SyPzr1AJ+w1Fyki/kDa+oyxFs4Rbs3N/RjZS/M1YOUzdvgS7+2KPKX/f2Vqg0cM5t5PLCYffcZn9AXRoUPjJWtsAfVgig5D3RXaRI1clpDK4uXbn78511s6kCXVyyNfMeNmIWr0oJCBkVKNgpW6vj8FZMr02/9dWvWKifpHCVWXuSVlaNSn+YP63pEf8D6D98wAu7jd7ozpaFuJMeemkmYZWcBFVHMRACuaoRGMRhOjal4FWYto6DClITFDbEcTeAM2JN6cmA5SkWcIM6gG9KWB4xqWqhAX7R0/qNKjHxniBKJDglQwgYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKpvxHzIiJpe8XJzwMc7CtVswnfS/qlTHF6SUOd88DU=;
 b=asDnG8Xnc61o+/vn+Rhx5XOr1YSeCXDQLgDp93FlzgxI0ZQAjpnk5Ue43NGqh5YNd/+rIMk2r4dLUOnQTPC9wn2j7by1956s8GIoAPFyZHKYpOQtVxXgUcnBeahcj3jBhUcz7OPTr4/5Cu4kZcnhch5i7EyqgNBi48HCCCQ3KyyZeyRpTHL0Wxf7dmNDJtU73osZvLwTfrckzxqw3ZQu7dlsChly7dcc2u5T8PrnhUQOWlbHbvwt8wrOon+EnVVWqBuqIgpRwIhnkbztTuolCsZFW9C/MZ2MF+PGwi7iAlXGblDq69U1ydS7UtC7afSzCwlnsxTZYRVWarApRt/kTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKpvxHzIiJpe8XJzwMc7CtVswnfS/qlTHF6SUOd88DU=;
 b=OO0E027HPlsT0iBH0ldqie22ieJxhGDuHwrv618zVstVzgwwZmCOa5LuxjY3sCm6ujyBfAvBvSwZrS+oMjB8slkOKeg/j2IQ6lAMkgBHJUv/Gz6i9E1QAr6KVdE8RV/NyQ2wa0WLuzJedwFtsu9WYPBXafBGOK4sN+28gWTNGt4=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6997.namprd04.prod.outlook.com (2603:10b6:610:9d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Thu, 17 Dec
 2020 08:13:57 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%6]) with mapi id 15.20.3654.026; Thu, 17 Dec 2020
 08:13:57 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Topic: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Index: AQHW0VcKSUc5JWucbkupBqEzxYwjig==
Date: Thu, 17 Dec 2020 08:13:57 +0000
Message-ID: <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-10-damien.lemoal@wdc.com>
 <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:a1c8:1127:b41f:9459]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: de2fa854-4471-4fd4-8809-08d8a263b3a1
x-ms-traffictypediagnostic: CH2PR04MB6997:
x-microsoft-antispam-prvs: <CH2PR04MB6997DD8EBE9E9401C3E459F8E7C40@CH2PR04MB6997.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eTkdTxnLxwsMGkLB99Q2LfvaHD7MKg5V+NAQdRPPWqsaaaZlINPbQ+i/PtEq22LWMHIS2mKqKJZI/kIy+W4qaU4cs0GarGXaWXKP/39sU9BMi2cXjnc0EYy/DGPQ6A/E3O5DAICxZRe/JFG+phS2QlwGvrzPd2e1OjqiAWYhjkG19xRvbdEbD2h8V4/M25Ex5fwlQ7nmCSKgZ3eiFuwWaSovTU1AvwPXpabQOZEtaIicyuLn19WQV/n0BkouHCEbcnu03kBL/rbHnoKdKss37XGIDei0Y6g972d0wFkMlbwg6e8NREU13JwuZ+pltZJgE4iPTR+fRZx1ns1wL0Y6UA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(66946007)(76116006)(478600001)(110136005)(86362001)(83380400001)(91956017)(8936002)(7696005)(71200400001)(53546011)(64756008)(66476007)(66446008)(33656002)(66556008)(52536014)(5660300002)(316002)(7416002)(4001150100001)(8676002)(6506007)(4326008)(9686003)(186003)(55016002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iDpc/MkgcenaDXk/smRtaf/pjPIF1ISAU0MfLEU+qYDQAjq86CfuwJVV1Ai8?=
 =?us-ascii?Q?t89EgHbPhvZ7EwazEK98qJG/J8A7hPx6IJ94VPDUa/X+ykr04aaYGCRCO5pj?=
 =?us-ascii?Q?be3cU/Q1hO7G4fl6VzHIJJT3XOFBEu5xIy70dHSC/++P5LQbzFz+hbBDgRzv?=
 =?us-ascii?Q?YIoslubMeImBLwMiKEbKqt2j+VAkPScdQKZfx6LDDeKcsHCHOr0/Oz9qTvC6?=
 =?us-ascii?Q?UlQws1e4rDG5UVW+zvu4Bs7aKKEaK7sDNvguvA+bkLYppQD7+7wmkPP+xHzi?=
 =?us-ascii?Q?pAc+SP+w/Lm/NoxwecxJFmhAzShLS3861bhQHlL5sI9JTpzKytxkoB4TfetS?=
 =?us-ascii?Q?GANVI5gMA+xOwaBSDGrZ7YauwqmxYK8rS1AG9AUfL77ZR+QsKCezdxhOftCW?=
 =?us-ascii?Q?ZpjP9RmDjpHXRSKe0W538NrRrqY1OfBOBfPwqIEyCoS8JFd+QV41syI4edyx?=
 =?us-ascii?Q?s/v24odnspSxeOVL/+19TgmTF5w1RDx3rZSF0nSfxRrXIxEWvtPEoiNxDo3I?=
 =?us-ascii?Q?S3vKClv1RqGsj8pKg79DiwqKqXZ1pdrlWmRd76o6u70+aFVWpygJD7+CwCNy?=
 =?us-ascii?Q?qerQW568OmoqTHqG6H/uzBPdA77+qizGGVPapJrmR3viGaKG439HWA5cQyk5?=
 =?us-ascii?Q?jMeSDsVb3ADiBQwbwPXz6GmUrpBem16uy8mXl7FKZOUFbx6xxD/IRtvsbeNI?=
 =?us-ascii?Q?Ma7/WVP2S5oKbf7pfnmxNTV9jbtKu7hREHUJHsI/cYBFI48fZm0iUXZ+9qUJ?=
 =?us-ascii?Q?U+G0mDCgOIX93QzrYe8e1Qw2ghOwxicM5MgT/Sqb/ZurKgEMziTRsCKHoWkI?=
 =?us-ascii?Q?odDyAp0Ouoc4PyR8sXoh7b3bZReDrIvf5Mj09a8ggrYDI8ioVrXCecmFoU3f?=
 =?us-ascii?Q?f2laf7FfpsanQRohMUi01W9svgsNrJtho9pbC8ah3fanTQxbqGYu/sez7/+z?=
 =?us-ascii?Q?W4wS0xwZqPPHX7hYqSdcHTDw+E8GteSDWEFjnmmTeorRBcSFaZZoU/VUTzuW?=
 =?us-ascii?Q?XvSQaobo7tqelGvask2S1S/zuJGAu5iddtamK0zpwdLVVF5HjzOIul46NhD/?=
 =?us-ascii?Q?gB1CJIcY?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2fa854-4471-4fd4-8809-08d8a263b3a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 08:13:57.0930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVCPjyZFQbjQQnVQsatYVbGYzdtsfXOhbF1uJlCILoE8Fv2/HnuArdY9mkAUJHr4oBp10TyTSUZBt7OAakI5Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6997
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_031403_411363_419ED70A 
X-CRM114-Status: GOOD (  17.49  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/12/17 17:10, Stephen Boyd wrote:
> Quoting Damien Le Moal (2020-12-13 05:50:42)
>> diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
>> index 5a2fd64d1a49..b2de702cbf75 100644
>> --- a/include/dt-bindings/clock/k210-clk.h
>> +++ b/include/dt-bindings/clock/k210-clk.h
>> @@ -3,18 +3,51 @@
>>   * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
>>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>>   */
>> -#ifndef K210_CLK_H
>> -#define K210_CLK_H
>> +#ifndef CLOCK_K210_CLK_H
>> +#define CLOCK_K210_CLK_H
>>  
>>  /*
>> - * Arbitrary identifiers for clocks.
>> - * The structure is: in0 -> pll0 -> aclk -> cpu
>> - *
>> - * Since we use the hardware defaults for now, set all these to the same clock.
>> + * Kendryte K210 SoC clock identifiers (arbitrary values).
>>   */
>> -#define K210_CLK_PLL0   0
>> -#define K210_CLK_PLL1   0
>> -#define K210_CLK_ACLK   0
>> -#define K210_CLK_CPU    0
> 
> This seems to open a bisection hole. I see that ACLK is used in the
> existing dtsi file, and that is the same as CLK_CPU, but after this
> patch it will change to not exist anymore. Can we leave ACLK around
> defined to be 0? I imagine it won't be used in the future so we can
> remove it later. I can then apply this for v5.11-rc1 and then merge the
> clk driver patch in clk tree.
> 
>> +#define K210_CLK_CPU   0
>> +#define K210_CLK_SRAM0 1
>> +#define K210_CLK_SRAM1 2
> 

Patch 6 of the series removes the use of K210_CLK_CPU and K210_CLK_ACLK from the
device trees. I added that patch as the DT modification proper comes only at
patch 16. Maybe I should squash patch 6 into this one ?

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
