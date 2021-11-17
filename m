Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E6DC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 12:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85DB46321B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 12:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85DB46321B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9eJ5aFodE1CTJpCMGBv9gP5oT0byTlZpMZt0FN9Q7o=; b=G43BB40N/8BZCU
	+D53Zx6nM833R+cqw8r0OuPfLVkQ9F6BYgC4t8T/EQX+crTFf5etMBVB9jNINTLC3vqPwVEHPh8yG
	RriC13SYzOwK2WSDV/JYK+sltMlTDkTbNZi/5IJGoFewM1jcUQpUNOydzfnB5zgqFRwqBqKV2yJer
	b/TVyJ4OR6sXjPETZG3pIrsHcSa3bhSy+pIVEo1wB08Ze2U4P1X5mlMhda5Ja3KbWqxKDbH9OW0op
	zLtQnLFZefg6bHIjeaJlAigUBlSWQbLqQHPViTxfGzTNonlDN1fjcJDdxAzd7cQZP0urjfIjJCSE1
	Tby1WlFzpsuPeONucVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnJt8-004hmH-Lb; Wed, 17 Nov 2021 12:18:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnJt5-004hlg-Fw
 for linux-riscv@lists.infradead.org; Wed, 17 Nov 2021 12:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637151483; x=1668687483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NgeZiNtO/lmNVkr5nEd8PQRdQOAs210Ya6c7JNuQbb4=;
 b=GcvP1z+bpOOCz/m7SIfb1hkuID5SdUzF/HMRx8wUnMbVFtm6OLrXnI5W
 6ZWigHrZOSAIyoMeGE/Lzdnf5MaOfzpIRkUlONUh524pKpvitp17CkQW2
 InYJ6LY3+/aPTNVvzGNOI9qjF5pvJEalTRCCF63tNRFDPSG5kPHlCbvyn
 yeE7UwWyyTfyfdDDA7QpPYcVr+a3pmj0IiSf4ihSpGiUi0ntyDmXsT06t
 K4P73UacsqOS+T1L7G+Uby+qRORNpfMohM2M1+XF9I81LyK1hBi+7w1m3
 xxaQVUrWkb4lLNyrP2Af2uav4Jl0Jx3GWExR70aEhBotl/VUuNTz+y7Kk g==;
IronPort-SDR: gZNncq9HmS8qohCt5pygXsctzLHsiGN/Azwn6o0REPTliOATxcfNMyRpf7KFnvXpZeXxcQCvkS
 fS0ObI41N9lQekjfYp2ZbUrdOGnAuxLv4XmoNXgTsuZ65AYNkzActEJQ3uk8CfBX07bZa36fL9
 pPOPP+JszuDO9g/dS7nSUhOlGDU/ERU6FLmFdU2zGikLzQsKIurY+tsTPM52VhaSJ9YMnAizOz
 XZSc71aOWNUFA53zeShL/vsP2BqgC6Qf/yfIftDmqf+iG0fyxXWDHxE9TGKOKbHSSOCQIn35+6
 Yz5HNZHcInuTzcv7VLXwESrg
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="139421958"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Nov 2021 05:18:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 05:18:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Wed, 17 Nov 2021 05:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACHzfojvXkkP49kaDGLdkqrIc3O6EnudXuGQOSg1M7O6hkvAMJrY2UbCcVs4uZdlvGH4wr5GhTeZyIX/Y/zJYaSUZ61bIx7qU3WJLApTbphKE4Fl1KnAMeeFtcIVLAopREYmX7+O+mUzwhnKFBxcTkYn1dfEX/1NLYKqaFQ6dYpq9CAym+j7XDcLKU0rQXX/fkuCw/KBggaNqjQrQf2QX7BavabLT3780bmnA06v6zs3bzFc+++m5CZzmlrPpordDNjS73/whUSTYoYs6rccuSPO1Rx1HgXeT+czHhWHek6k3vMX0FRDVLS23qfEX4yGQLcFBzkUBLrYBZl5zmL1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgeZiNtO/lmNVkr5nEd8PQRdQOAs210Ya6c7JNuQbb4=;
 b=H1WLzsjXkPI/GzAzgRFJArMqyFbqJ78kZjAhk4x29wBMpoyvkFSdi1ZqIlNm+G1DkQ1DNeJx85i7ApzglF71RKxFsSknZjS2hzlq/RbJ0Kgaznb77Te3AoM3cTK29XfH5pzjRQESVFjZiQcq0KCrGnw5kwnaoxVLLraY+EXb1PcWNJTMvOhQ2xA4Oy9LFXhCs5ubYOXj7ZSo5e19SZAxQPxw9BxXxBWuBx3GRb7Cfp3872Tecbn8BLMxUKGKZNedXnIds61plDj+pSYj4F5XkIgmCW1qEjQSqUHc8tTkXYtCI0vc/6E6JoCEtuyKA829d4qULNtphC6md5s6Oo3Pxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgeZiNtO/lmNVkr5nEd8PQRdQOAs210Ya6c7JNuQbb4=;
 b=cfBeowPiqO+oj+2yY3C24NAH89Qoo3dZBrbGU4vxv2dOfNYb0wgWisI+jJqQsmJghIZJG+NixAeULBJsB1iESBCZiRilvn/89MEIIVyzem5H/2R4FSkKK5xid0cWo7h7uO8KTGenZDZRQp/EFYWF8QaNMYesWZluNLqgQBameU0=
Received: from DM6PR11MB3258.namprd11.prod.outlook.com (2603:10b6:5:e::27) by
 DM6PR11MB2795.namprd11.prod.outlook.com (2603:10b6:5:bf::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.25; Wed, 17 Nov 2021 12:17:46 +0000
Received: from DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::7434:aab3:637a:66f6]) by DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::7434:aab3:637a:66f6%5]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 12:17:46 +0000
From: <Daire.McNamara@microchip.com>
To: <Conor.Dooley@microchip.com>, <geert@linux-m68k.org>
CC: <linux-riscv@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <Lewis.Hanly@microchip.com>, <linux-rtc@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <atish.patra@wdc.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <Ivan.Griffin@microchip.com>,
 <devicetree@vger.kernel.org>, <bin.meng@windriver.com>,
 <a.zummo@towertech.it>, <jassisinghbrar@gmail.com>,
 <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
 <robh+dt@kernel.org>, <linux-crypto@vger.kernel.org>,
 <bgolaszewski@baylibre.com>, <gregkh@linuxfoundation.org>,
 <linux-spi@vger.kernel.org>, <krzysztof.kozlowski@canonical.com>,
 <broonie@kernel.org>, <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Topic: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
Thread-Index: AQHX1LJ2/BRZZb83x0iYi6b9K34Zn6v66E+AgAHqWICAAArPAIAH5wOAgAAKzwCAAuGSAA==
Date: Wed, 17 Nov 2021 12:17:45 +0000
Message-ID: <22e550697eaf362e6c47f6ce0da7182ceec2d44d.camel@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
 <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
 <0e379411-2469-8c78-1a3f-0645579a967c@microchip.com>
 <CAMuHMdULO5gJcbnsDzZcVShmYkByyM30f9nYyDD8e4PJ6nrnCQ@mail.gmail.com>
 <e91ebf36-5a8b-9d9f-d4f0-aa9e38e7a41f@microchip.com>
 <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
In-Reply-To: <CAMuHMdUQRJHkbwj++jJBMG7QqLd5_bmzUrMzyxEd92bgZbvDYw@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 314cde23-6dfb-4be4-a78a-08d9a9c44392
x-ms-traffictypediagnostic: DM6PR11MB2795:
x-microsoft-antispam-prvs: <DM6PR11MB279568394784BA2DB3BE8D22969A9@DM6PR11MB2795.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Db4djyYtS2i8yQmN7pnMCjgbeBY+/YgflKyy9Hp9b0beo6TKQGsK1STEGmAJwGmFOn0s3/OZdMs4b/sfO26iUeg0mXFXDvoqSQ763+ZaN5DGNOpJ+LlY9Uvayo1aya0H+DjNUH2tOswne/0K2a8lFiSK0XKzAD42QmzssWDErfyq2MNNZM9ooG9z3hk0O6293O0iTnXrpWeizHK2OYslhnC9NBghsabyYwixVwNH+FYbcD2fpTf5FGN5o5VPnTrrxogHll0KF6G6/NtQVRBMkRl1HB1MIwUzX0/g5sc7glyTXAx5S++vAC0qpooyXujDGpvmS3Of1BIzV64k+VlKPJfqaedFgEK/bFg+MTaW1eAs0w3JYeb1UhQ4WvqlT9UG6ztmipNLl3NC7Ou0qz3C64Z3LP9Z9m0/PbMwL+q97SohORznkU6RisPlWeOLL3kUAXrvCKQhXEjN6UWakfsHjdxbAe+wjyPQ2hSujUyqUbwBltAYuE/g8yQW/2uPF0xcRoBizQ7VlysyPJh0icTFMSZW7TAsiSvBWelJgILZV1HnOXn0Gi1RQnc57dgmdb6W0SY0y8hxAb8u73mJ20Ez3rqAb0tnQzMnTCvzd5/nbt7WNQPuUAccCMYTlNVylKsmRy/ANvu0DR6XceSpHC8Nhgz8SmglH4ruSlelj73we4SIFsT62BhmBpTRid1p2FblbVblCdNXPqa39tg1z3Ofg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3258.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(66446008)(7416002)(66476007)(508600001)(6486002)(66556008)(110136005)(91956017)(64756008)(186003)(26005)(66946007)(54906003)(71200400001)(53546011)(316002)(8676002)(6506007)(83380400001)(122000001)(6512007)(36756003)(15650500001)(38100700002)(4326008)(86362001)(2616005)(8936002)(38070700005)(2906002)(5660300002)(4001150100001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1dpQ3J6YmtjLzRyRk4rdFlWNVZHQURySnp6R0tzeXg4QkFIT0dLbHZYNXk2?=
 =?utf-8?B?WTBaSjFtYU8zZnF0UmZHbHZBN2NpWGZLaWdkR1ZJMThrajJpYkNXcUZNWEJz?=
 =?utf-8?B?RkxTdnlrNHh2OURMVUQ5eTdaRW1xTTZEcmt3a2x2UTlsQTJGN2ZCaFNIZnAv?=
 =?utf-8?B?UXNsaFRscnBqOVJ1emxlM25LQStDZVg4L1k2SnVjRFphTm1xU25aeVUyZHpF?=
 =?utf-8?B?MG1hUjYxN3UyVHMwNWVUYW1VSXhPMmR6WEcwZXpVS1RXdE5laVRPbTRwUlJ2?=
 =?utf-8?B?d2l0eEVoVU1DdXBaZmg2cCtIMng3STVyMXJxOEpXc0xoNGt3VXduZlR0SlF5?=
 =?utf-8?B?SVVya25na1dZaFZyLzkxRHNXVnZzL3Z6ZU5IaEs5MTZmTTcvaUxPUlkweUR3?=
 =?utf-8?B?QnM1MjhTZlM1aWZ0TlpYNnhDaG5zcTBWKytyT2FQUnY5SHRZM1lYV1hrRGNa?=
 =?utf-8?B?VWp4bTBHSk5uSXVueTF6L0FCcTlIV0c2dlkwZ0xXZVo0Q1hUMSt2TWliR2R4?=
 =?utf-8?B?M0p4WEZsMmpONUtKQlVsTGJmY2FyZ1l2ZU5CTldrd3E3cm56S0czcjVxSTVy?=
 =?utf-8?B?dEx5WTIxSW14SkU0N3V4QnVnQnBCbDc5dW14VG9YbHozMkhwREMwbFZCakJj?=
 =?utf-8?B?ejc0Y0VtSFNpbGxDV2JXaTFNK01xQ3RMNW1ySE5penlQL0lwa2s3ZG1BVFJz?=
 =?utf-8?B?blVTZC8xV2xVUjBUSjEyYVJ2dFZFU0w4RHZyMmtiQndiOFZQOG96c0xIa0sr?=
 =?utf-8?B?Q0g2V1VLY3h0QnlBWktmOGExK3BIV3ZhWmxjMXhPVjZJaDVaR3J4T091N0J2?=
 =?utf-8?B?SkV4dUZDSW9UaHBNUVhJNmlEdzRIVmhNNmQ5T1RNWldPTXpmdzk4M05yc3V2?=
 =?utf-8?B?dHlCb1k4WlpOOFRKaFVFRUV6MWJTMVRPNkliQ2oxZFZwVHM3aTB4WDZkYXE1?=
 =?utf-8?B?YWx5RzFBUzBKT3lwL21XaTF3WWRyYUU4UFhZcGN2ampzZWc5WC9NZTh4LzF0?=
 =?utf-8?B?WWlnS2pLUURtZXlhVkFLUHR1cGM3Znk1UDRCUmkzOVNQSVJUTXhidG9SbmxF?=
 =?utf-8?B?VGtrV3dGMVNKOWNjMDdVaDR5VDRsYVZGdXFaSWphTk5EUHhnVFp6dWJKMURI?=
 =?utf-8?B?Zml2K3RsMXhCVlhRTklCV2J1SVNEQmFEcnVpMmpZVFZocTY4ME1uRHM4VGNl?=
 =?utf-8?B?YmNtMGtpTVJIaHNvNVhpdUdmS09CSGJPb1NWMFBZSUphLzh1UjJBVWkzYmlv?=
 =?utf-8?B?ZDZUbGxoNzJ5Ky9zVXh2VERDd3lKU2N6bGF2TGo4bCtSTk1yYjEzVUFNVW93?=
 =?utf-8?B?VDRCTGJFc1ZuSEIvYUR1VUFPT1FkcGw0bEtWNmpQczZHOTQ3d0UzeW9nTmpq?=
 =?utf-8?B?N2pmQnQ5R2JvZk4xTmdHTVV6K2Y0cG0rS2FoTHdobTkxeHRFTndMQ2ljRlZ1?=
 =?utf-8?B?eDJ5TEJNNEVwVmhYTG9Kck1zR1FyM1BOazMzbUNNbzZqTHpqVlIzUE41ZHRI?=
 =?utf-8?B?M1BrblY1NzUzVnhQelkycG5RbG9RTFlzY2NKcUtGVjJLNVJjRk5QMjNjYmVo?=
 =?utf-8?B?UHhVK0xpeU41Ykd3dVpDRFlPUTVuQkxJVUswc1lpUjZnVFZ2ZU5aajZINFg2?=
 =?utf-8?B?bGwySHVmZ2twVDE1VzVJQ0JGQllpTTcybHFQTGhLUnhOQkFzbFJRYkphaGFm?=
 =?utf-8?B?VFcrVG10b2dwSFgreFM5U0o0QUk5bFZOb2R0SXgrSW1haFY2dkNBQ2VzNFdQ?=
 =?utf-8?B?ZjZrQlFnZ09NYWorb2tzblp3V0tLOTc1UE15VnAycHpiSWlpTFpuR0NLREx5?=
 =?utf-8?B?M1dVQXRmRVFvWnd1QmZBektRam9aMzdQZDBHeFRyczE4eWNCOGorS0NnY0Vl?=
 =?utf-8?B?aVBPeWl3a1hzQzd2VjJHOUYzVkJIVjl5R1lHU08rSFVKcWQwSDNzY0VtaGxv?=
 =?utf-8?B?djJ0V09xK3VYR3NiSkJmTDJkdVFGZ1c5bVkvdURVdnNWMjBJLzhFcjh4STVR?=
 =?utf-8?B?TlRERi8vQTB2akRQNG8xWlIzNVdmMjdnWFdKakw4ZnkxMkN4TVR2LzBIZFpX?=
 =?utf-8?B?R3Z4bG5LaWlyQnUzNU9ndVNtWmNXWXEzaE0zNXNlOW5kck4xbWsvNkp4Ukoz?=
 =?utf-8?B?Q0lBWUNkeWFzcXh4V08xaDZVbmk3bjgxNVh5NEU2VHR6K3dhMFB2MGJQbUxM?=
 =?utf-8?B?R1JtRW5vWFMwL2FibE9qZUxCV2pEbVorYXFJWExpTmdOVzgzM0RSK3ZXZDh0?=
 =?utf-8?Q?u2/LqK652g6uHRz/ac1WpMy3IKpCraYb6ATFC6t9QQ=3D?=
Content-ID: <C9975CE6D666A74B8B8BE881E2A0E2B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314cde23-6dfb-4be4-a78a-08d9a9c44392
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 12:17:46.0375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5LbT3phFs+VfwQ1IN0pLd0H9mYEv0YAQlk7U8oqp8pU5CHWUIt/kPOP0Ao9AhaNLErSwLkRDvwXJCIk4ztna1Dx0MTkWa7kz0ywSRM9uzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_041803_757461_8D0A524C 
X-CRM114-Status: GOOD (  20.81  )
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

On Mon, 2021-11-15 at 17:17 +0100, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> Hi Conor,
> 
> On Mon, Nov 15, 2021 at 4:39 PM <Conor.Dooley@microchip.com> wrote:
> > On 10/11/2021 14:58, Geert Uytterhoeven wrote:
> > > On Wed, Nov 10, 2021 at 3:20 PM <Conor.Dooley@microchip.com>
> > > wrote:
> > > > On 09/11/2021 09:04, Geert Uytterhoeven wrote:
> > > > > On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com>
> > > > > wrote:
> > > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > > > 
> > > > > > +&gpio2 {
> > > > > > +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT
> > > > > > +               PLIC_INT_GPIO2_NON_DIRECT>;
> > > > > 
> > > > > Why override interrupts in the board .dts file?
> > > > > Doesn't this belong in the SoC .dtsi file?
> > > > The interrupt setup for the gpio isnt fixed, there is an option
> > > > to
> > > > either connect the individual gpio interrupts to the plic *or*
> > > > they can
> > > > be connected to a per gpio controller common interrupt, and it
> > > > is up to
> > > > the driver to read a register to determine which interrupt
> > > > triggered the
> > > > common/NON_DIRECT interrupt. This decision is made by a write
> > > > to a
> > > > system register in application code, which to us didn't seem
> > > > like it
> > > > belonged in the soc .dtsi.
> > > 
> > > So it is software policy? Then it doesn't belong in the board DTS
> > > either.
> > 
> > The write (if was to be done) would be done by the bootloader,
> > based on
> > the bitstream written to the FPGA, before even u-boot is started.
> > By
> > application I meant the bootloader (or some other bare metal
> > application), not a program running in userspace in case that's
> > what you
> > interpreted. Am I incorrect in thinking that if it is set up by the
> > bootloader that Linux can take it for granted?
> 
> If it is to be provided by the boot loader, the boot loader should
> fill
> in the interrupts property, just like it already does (or should do,
> if it
> doesn't) for /memory and chosen/bootargs.
Whether a given GPIO is routed via a bank where it has its own
interrupt line or via a bank where it shares an interrupt line is an
SoC capability.  A particular routing is instantiated by a particular
board (e.g. Icicle).  A custom bootloader feels like complete overkill
for this job.
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a
> hacker. But
> when I'm talking to journalists I just say "programmer" or something
> like that.
>                                 -- Linus Torvalds
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
