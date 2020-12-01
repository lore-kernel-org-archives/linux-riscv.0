Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7251AC64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 15:54:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F72420870
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 15:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FJJA9/3H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="jEzC3SZ/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="NPE+SbvT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F72420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xfcUXfMk9UCzNpgTNquSw2oxekzZutiMS5PcjaKIot8=; b=FJJA9/3HZAs0oNLd5QnPe/vMY
	cc9Mv5F0oS+eLqFWCFYhKe7n4HUhcx60mZrO1RY7reeS5UmA/e2ZUmjqOXoGmF69kBE3T6HHoPnTg
	3Cs2PyRLuIvXQiIjGQFyZWukw62VO6co6xooFs/NuuM/5fauCaoiz06RS79V55fQePYsFsoGpV95K
	Le8ruyE7XJq9OT1/9heR9xE53b3gXgppEx/wNRuvyQ3crqjBFSoTaqolCXjs85GPLzvhvFZVxe730
	UbX7faaSA1QOSBhddGlx6KxYLstCmVGiRjtiuq5deU4skpavAYjV6lekQKCGydmdwQXOvvGTTii74
	UFBOhx//A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk7zE-0006La-JC; Tue, 01 Dec 2020 15:54:40 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk7z9-0006JV-9S
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 15:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606838075; x=1638374075;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0iI3nCLQmr6oHq6LLdhRPjxVIQBiJzcvcND+v3oL2uw=;
 b=jEzC3SZ/Rey+hLYe6O1GflAVw5OSixKAnOGoGianWnsqhJgsaLUOysWC
 m6BlRRkViAejuyvE6aSgbHiAt91QR30if3+K6q5rIe4ik+mQg5wIdD0nR
 6pXUadKngQ22VZGvudPuzQu2yB0E2g/fPemyJYZmrhHymAbJqTBzpiWib
 c6OfDktku9IKWPLooG8n+sazg3Esi3rPaUrIlb97PwMcVFl91SmaQLg80
 8oMgyMxsqQdU2t+6uLfTcTK+8Sj//1ndi+ohkxNkJYBp8h5EdI7bbcvul
 mHpzmy+xWYs9SmA0qV1qnwMZLz58/PhC6alycGqFQtxKwOKYk5Shns9ON w==;
IronPort-SDR: L08oPAQ2yEe70T1xriNxLmOWRNAIMVLKJsl9Ke9WJ3z3KTYC1ApFOH0ob8SU5FtKpZBKGfzWR/
 Rwhd60UGYPPg3kjHRHKKvX7WcaoKp/EuIP9sBfgCUJS54Hn5eP8F7A707gpKAoutVdobECMYH0
 c0Hy/l1m6PG/SMjsd7p7sBRHwvMVNc1IdNZqJwqhT6ESHGFhUE0FY4LGPodMHIFBJeXFPRd3sj
 c2K3pE5CCEbatJpkfLLYN9Deavxz7318MecOLX//1m9AcBiZDu6BaxQH8Dx6FjnG+I8xJZgVZb
 lJc=
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="98154989"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Dec 2020 08:54:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 1 Dec 2020 08:54:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 1 Dec 2020 08:54:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGxOXrIgdC6WDBK/Z0P0XWKJhCZPtOAtG4tUe368wB9mG6KbIE9Z/IwGv0nLxE5DpLkrXXoeT2huAVE7eCnyyNH/9Yzfpm3+sionoZw+3yqDqochet4Ps7wCZztDmhUDlzfDKYqSYUkGmK2xZK5uWWaPNerzyrTNxssQrtrp0tebLL+z7nAsZQG3vmKBRqY4b9/YwLVwDChEpbG+Pu/CdjeGgqOU8nchK9f1t5K7/0hrc7ez1T4vHa7NygGwq7gbIZDcpL4Pch/Y9ZpxvNq8h/e3CawZpYCwQWrWtoxw1Rjty7/bk2qqkzoolWBxuIzOhFB0vC8xTg62n645XEwzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iI3nCLQmr6oHq6LLdhRPjxVIQBiJzcvcND+v3oL2uw=;
 b=bFCsUQPKInurgxsWjO3X6Ss4KsjpZR3nk0dPpHIwIEoBTqeVUmButJHzi8Xw/svgYavjD1ZuMls56j9PcB7IVqlc7BKaqfQl+l5DLO6RYC9a/qXyQAZlsMgXOU2S+x+fVZPChj4vLGbgHrCURWAfzTh+0yqGOGQydSnimneZnqxBi4KKGNLp0w4VRuVLYfYpGwize9Cac1YB9vAVDFC4bQmduLx+nxDovlSe8B4rEKovjuhpRBh4cRYNV5W5dPQ+GlMJH0EuZPmkiztyL61Aen7uLyK+XkTwRbJapXTVO6WOsGxIZ8AaTZLbyFTT47pfTr8wWk1/ipAZmN8Kxb9sCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iI3nCLQmr6oHq6LLdhRPjxVIQBiJzcvcND+v3oL2uw=;
 b=NPE+SbvTdd85qLGyUOMcnOLEphhoNezix+JcFsWbG3jZq5FZgGSUt2M/DARcWlHnQCHi9GENyojijrisKk8gLNtfctSPAqz2PUd8gzcE7Jc6KiyG4hMMPxa58Ug+7Ag7jW9Q07U6bwT+DJNAxahDmuOVw4kZNYlzYfmZLlBLM2w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2301.namprd11.prod.outlook.com (2603:10b6:301:53::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 15:54:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a007:19e8:3f74:b14d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a007:19e8:3f74:b14d%5]) with mapi id 15.20.3589.037; Tue, 1 Dec 2020
 15:54:30 +0000
From: <Conor.Dooley@microchip.com>
To: <Damien.LeMoal@wdc.com>, <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] mbox: add polarfire soc system controller mailbox
Thread-Topic: [PATCH v2 1/5] mbox: add polarfire soc system controller mailbox
Thread-Index: AQHWx9GEFTONGkHUEEK7u8XSwGTWUKniZN2A
Date: Tue, 1 Dec 2020 15:54:30 +0000
Message-ID: <68f64366-bcc9-df51-1061-dc8b7adf5ddf@microchip.com>
References: <20201201110242.28369-1-conor.dooley@microchip.com>
 <CH2PR04MB6522B0B3F824BFB01EE0C635E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB6522B0B3F824BFB01EE0C635E7F40@CH2PR04MB6522.namprd04.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: wdc.com; dkim=none (message not signed)
 header.d=none;wdc.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c65480c-f9b3-4ab6-b2f1-08d8961163b0
x-ms-traffictypediagnostic: MWHPR1101MB2301:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2301089768FF87AC2AD84D3198F40@MWHPR1101MB2301.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4SZEKmOG3xhWZ2MtciW0r5hdj/k1uiFg+zA9obd8Hfg5wsFv+00zxwf3f/glnlYd0Jws6VhKJclvi/8hcHHmQwdRIpWhoqivfguYNazAG9Bllglr7jWwVnm7wt6TXrAMkqJ4rcyOiIBrgOiEnEyp4KBzCPB4g0gjo7J0Ruypl9YIU1bHYCCkNEYvviTyGRuA0HcHBXDkT6LE5hQbEZzIAX7hQv1BhJHIcE8qYMtiVRPCg7Oq/580fN3DPWannBWJWX57d0SiMys+y0F77xoQzE0TTdjZrotsaQq0MJxN7UBMV45Ktjq+fuVYHnkdq4fs6/49U8EuMbnUZ8ghAjVKsgc8bmatR2VmU9DH/CCNl67NgELXbotPfk1TniIgqJdR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(136003)(346002)(396003)(366004)(186003)(6486002)(8936002)(86362001)(2906002)(76116006)(66946007)(83380400001)(478600001)(6506007)(53546011)(15650500001)(71200400001)(91956017)(2616005)(31686004)(64756008)(110136005)(54906003)(31696002)(4326008)(26005)(8676002)(5660300002)(36756003)(66446008)(316002)(7416002)(66476007)(6512007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?N2ZrM2srdVRjOU93SmVlaStDU2dWVDBVOHZHaWtaRjJsQ0YrcENtMFVrd3V0?=
 =?utf-8?B?azZOQmJ3ZzgyYUJsWlEva1BjSUxtb0pIMFZhcUJheEtBK0g1TG9IYUJxR3Nr?=
 =?utf-8?B?dEM1bjBYZGxCNkIyUmNDejVlZThyT2hvQ1JQR0FJaVREd04vbVNUbkxhSG1Z?=
 =?utf-8?B?ZW9GZUtNYjlCOTF5OUpUS0p1NDZKVmNlV0cwTy9MMDZCeGdvSGFOVFI3ZW44?=
 =?utf-8?B?RURTcVd6S01ZUlFyNWQ3T3I1SkQzc1IvVEZvR1RuWldtcEI1aUVHV2pQdHdy?=
 =?utf-8?B?cGVRQS9vbUc1UEgzcWxnWFZybmxCWFlTaFllVCtMeHpSL0lkc1pib3hid1JG?=
 =?utf-8?B?ZG9Sc0JIcG1yRVMwNk9wZVZ5aDJWR2toY2loMXNJV25rNlBQL0pCdTV1RGov?=
 =?utf-8?B?TVNBYkFxanFuWDhPbU43VHhQU1BWTmpLaXVONnVYZVdSOGt0SmNjdFZkaVNV?=
 =?utf-8?B?U1ptMVNuY3hCemtqMTl4RlJKeWEyZlNvbW1MbmdjYTVDQXQyTmZVcWNSTGln?=
 =?utf-8?B?d1JvQXVmQ0hqalltNDF2Vk5yb2E3M0tNQVlnTEpkcko1ZVUvRWtKandpaGNt?=
 =?utf-8?B?dG4vRlAvdTM4d3ZKemFpOS80aGRtd2k1MnZyeUkzUzdrNHcxNVJ6eWVuOTNC?=
 =?utf-8?B?aDh6OHBNQ2pPMDB0WmhJSW4xYzN4MXljSTBHTXRLdUFmRVJ5eVc1SnVMbWlp?=
 =?utf-8?B?aVFVWXFMWlZJbVd3V1pSQWpzbm55SjRpSG5wMEVYanRpdHluU214bFhMSit3?=
 =?utf-8?B?QUhjT1cwQ3BQNzc0QkRWalYyR0h3SGVhdEo1QkZEeEZlZjlSL05RWGI3SUh6?=
 =?utf-8?B?TGNOS25wZm02MlR2VlVTZ0NVL2NzQUxMWWZJK21sMFJyL09NSi9rNFVWZnVC?=
 =?utf-8?B?SG8xbkVJOXZoZVFHQVNvUGtRQ3g1MmlkNnlWRXZiOGozOGR4em5Sdmg3S3RM?=
 =?utf-8?B?L0kySnFsV2dVNmF5L0xKNi9tY0N0dDdOOXhMTVN1aFRic1k2bE9yc2ZZZGY3?=
 =?utf-8?B?ME1SRTVDanovQUxESnc3MWhpS1dPOUF2WFJ0Vm1UNVBwek1iYmlUSmNWdlFv?=
 =?utf-8?B?NGU1RXRYVVVmek4rVVpKaVFWaXgxT1lnc3JkcjJMSG81QVRHbUNOWXRqbTJr?=
 =?utf-8?B?YzdzQ0l0SDVVWGxZN0pxSXNDZ2VGVjFzVExORTlVVWluZFpzakxSK01PVUFH?=
 =?utf-8?B?V2MwODhXMlh6MWo3aVk5UFdTUktKTUxZT2xieGFTS0xlbXpieTBiWjFDMEdn?=
 =?utf-8?B?TnFLUzNJMDgzQWxkT1B0ZlBsWlRYRVVIUEozL3dxK1VRcXNzOFN6Q0lXYmZ6?=
 =?utf-8?Q?0kEcSWVVZQ8oU=3D?=
Content-ID: <617D0DCA480C2045A16A175FB4EF5A0D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c65480c-f9b3-4ab6-b2f1-08d8961163b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 15:54:30.3671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPv0L2qXGK+Z8s7sWiV2dZ38woMfGLkLi74ZgE5fFnukHiVDro+EIbf9i/0lIPPGkt4MU+zn7OnkBBVBUbMOEFRQbPVyQxXcLS2asB6ClpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_105435_697862_BF72429F 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: Cyril.Jean@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, Anup.Patel@wdc.com, Atish.Patra@wdc.com,
 Lewis.Hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 01/12/2020 11:55, Damien Le Moal wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On 2020/12/01 20:02, conor.dooley@microchip.com wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> This driver adds support for the single mailbox channel of the MSS
>> system controller on the Microchip PolarFire SoC.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  drivers/mailbox/Kconfig        |  12 ++
>>  drivers/mailbox/Makefile       |   2 +
>>  drivers/mailbox/mailbox-mpfs.c | 285 +++++++++++++++++++++++++++++++++
>>  include/soc/microchip/mpfs.h   |  51 ++++++
>>  4 files changed, 350 insertions(+)
>>  create mode 100644 drivers/mailbox/mailbox-mpfs.c
>>  create mode 100644 include/soc/microchip/mpfs.h
(trimmed)
>> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
>> new file mode 100644
>> index 000000000000..e1ecf3081312
>> --- /dev/null
>> +++ b/drivers/mailbox/mailbox-mpfs.c
>> @@ -0,0 +1,285 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Microchip MPFS system controller/mailbox controller driver
>> + *
>> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
>> + *
>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>> + *
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/mailbox_controller.h>
>> +#include <soc/microchip/mpfs.h>
>> +
>> +#define SERVICES_CR_OFFSET           0x50u
>> +#define SERVICES_SR_OFFSET           0x54u
>> +#define MAILBOX_REG_OFFSET           0x800u
>> +#define MSS_SYS_BUSY                 -EBUSY
>> +#define MSS_SYS_PARAM_ERR            -EINVAL
>> +#define MSS_SYS_MAILBOX_DATA_OFFSET  0u
>> +#define SCB_MASK_WIDTH                       16u
> Value identation seems off here. Aligning it would be nice.

Not really sure why thats off, its off in my mail client too but it's aligned when I apply the patch from the original text file, or if I git am the emailed patch.

I'll address the other comments in the next version.

> --
> Damien Le Moal
> Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
