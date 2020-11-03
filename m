Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC35C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:19:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69F9720757
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xa+zJET+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KdVqqy8m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="huqthp2O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69F9720757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zFJz2XnpcbGElLJ1/IkQVQXjezBkRv7yjMcfzS2ydvg=; b=Xa+zJET+UJkyTAgNEzFacKNxj
	UGfVx/y108sGeUl37JRskQKeHhuZ8CL5zUDvbhHmXJodQ64p5f2UStzMbdc1I/6aG7bX0z4qdRKT2
	lBQIvZY8pG1Qq9/bhj7Q+Ecn+EovP9vq/i3oloxO00/xFKFTSodf9HyxuvsQCkrM3NJ1V+uiXkFw0
	DSwWOoU2nmwJX1s5i93gm4l2N6nuRew6tpqiZzy9scKHWs/bIGZWcLb5okpBocLy2gRHFJk1S6Dmw
	h4LFarOmFJpofaFPTURstnNcNY4OUVpEF9B6kRun6hwQy07mGiO7dNmA+JB2BdJgkwXj1/VqetirW
	slkTXSVLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka0tw-00033D-Ew; Tue, 03 Nov 2020 18:19:24 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka0ts-00031o-J7
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1604427560; x=1635963560;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IXj6XTzfpqHrPGjJWRvZueeoA+ugwaMaONQZQxyElJE=;
 b=KdVqqy8m/eXR7qydZ20DoSA/uit+FieQWElUghE82xgFpBaVXVIMrvIL
 ESNICGVW80uUV8KQU/MTBxW9Jsooiui+CVcfKYFgSABSdnpmC0Y9MrUFc
 V2JNtJZCCERN5EnkgDFnE9pZ1HJm8Hd+VjXH/ZtdqeBqJ75Cpl0TmyjeG
 kR9mBM86DTLoVZalAIYewbt6L+TzvDuse6nRL7ed0hGW6dA1sZ0b5dUMg
 VyxY8MlCIgc7mUTCY7LNuSUnecVxAI1hNog+JPBh3IRLn9VKqo5Xr/GGu
 14jlAix7GntF7TA3fqwOvwyVfYSw479eKkMVjoH/O1EX+6H5qMwL1PUAe g==;
IronPort-SDR: TURRtInihp1DCR2MZfA4kVJgTRZwlRwisTJF+6sH/N475xzrXnrnDvu1j2zQSEdBxaFo2qWntd
 u8b+ucAw7PGCZoaMhlJ4mJgC56CkaPxQIE2iYNZ8pdVMKdETgfvTgXu+dpmBV4/U0pYiPkoxmT
 NNkmT5e01HFusvQrCgl3rZtkcg5bXFqQOkttVCjezx4ycOdcINk63V7X7R9hkC9QPP+rj0rW/q
 u+fgNLpslfVPZW6dsy6zrh7dAYbdYDMVkd/tAMlHJekZwOy8rskSK6zvKpy0fJK5MM+Pr1B8gg
 +9g=
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="102022197"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Nov 2020 11:19:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 3 Nov 2020 11:19:16 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 3 Nov 2020 11:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV563Cb+U8NcX+3u8v6AcheOb4G6BymR0CB35qX7v9ucKbXI4rwhdJtHzN3OMAd3tFnb6me1ytPrZWBaZmsDNW7BRCFhv6tJCcpsFUG6EEVYeg1hYwDvXv8jFMkfPsrekfrCryhIJmAozFQwdI55znnRAbGW7K9r92czpRziP7oj0ks1SQb/JluFZdur7IhmXNPgHvqvfbxFtvO7C9bVrpColZep8U+W6vnOVf1sjg9gdixxLn8UWVC81D+9Ezxy9ApLOE2f+qeDNcmwfSIshE5UdLskRF8PzOzU42yx8thGtoNa4o7mw/QczYZP9VO+8VMJFKjTJzYIyIFEQEfHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXj6XTzfpqHrPGjJWRvZueeoA+ugwaMaONQZQxyElJE=;
 b=ML++hixd2LHtGGbmXVDZgQrlti1cG+MKBQlncOvLmCK+4dG/SPkyAhv1/ZyAmvdPDU0KXERFs5+xWIb1yDqHCrwsa80q78gg2Zaf+07wihBUTtT8zGlQFPXd+pFZN2w5oDAtQlWhatODJ4TKY8a4XhUV3jza+phXnP5beh7HEgwKJuzAJXnfiWIfBFDoAb5vOFgsF27hJQxKHJDjNQ41QaPIBq2qvtaPNQAyjCSacQqbx4xb3/MdtoBfoPNTG2jk0qfgPvEN4FB6SboESGPGhKau5KZG57xwO8DYOnRZSE6I7bBgagpBygNcmJd3uXO1oaOHnZpzNIUrlaRtc8/N3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXj6XTzfpqHrPGjJWRvZueeoA+ugwaMaONQZQxyElJE=;
 b=huqthp2O1DcRTVGxJo+ZqHCTEKaFGhGtbDsGEs9y95XKZW/iIxgqFiV7xsxq4OhIp07dNNVpwBWweO+z+pA2+FnThF8lE4Xw8iIaO4hZKz1x7/5ICNAljasrA/YiZOujFrmshFDANQ1AGYZyHD/jWQxZoOg4Ue2pXKzd+g5KuOU=
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by DM5PR11MB1386.namprd11.prod.outlook.com (2603:10b6:3:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 18:19:15 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69%6]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 18:19:14 +0000
From: <Cyril.Jean@microchip.com>
To: <bmeng.cn@gmail.com>, <anup@brainfault.org>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Topic: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Index: AQHWrYIX44xaU0n+lU+FVu/TfSg/namv3J0AgAZYq4CAAIteAA==
Date: Tue, 3 Nov 2020 18:19:14 +0000
Message-ID: <e9bad05c-db34-ba2c-df5c-ff2f7f53e15b@microchip.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
 <CAEUhbmUm6EyP33FU1n4LhEk-xcBtR13-xS+Tpt76ug1HQv8CEg@mail.gmail.com>
In-Reply-To: <CAEUhbmUm6EyP33FU1n4LhEk-xcBtR13-xS+Tpt76ug1HQv8CEg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.40.244.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc111bcb-46cd-4f44-4530-08d88024f885
x-ms-traffictypediagnostic: DM5PR11MB1386:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB13864421CC560F4D458014509E110@DM5PR11MB1386.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5LbxqxB51hq0Rou/ODDogjojGgVEfTHTy1c7BHnNAhDe8NoQJqjjPk7PwMPk98eqldEbjCYEuYi7zqgLgM+lSbQdtkLjMoEvYPWnfeql5KgAXvRypOfI5UKLVk9w5e5xoMWPSpF/VfQR/MJZN0bOgE+vizcumc9DfXB/OZqpBxmAk8XGs8Xf38tukMFaMQ29cQ5olPSxCbS9m1bUrOJ8Dzz9034CC5q4Gs2+hsP5TwrVZ8/oED0a0xY2gq9ByHjxU0tNvmAMv6FmObBXTmvtFPmBkrN+53i+NjoEbPdgZowzz0uBKDPDHe9p00qrH2VH3UNRMPgwmKmBUc4JgqkhEL5/mVg5mBjE2K468bwH2f985DGxvranVdvA3rv6rRNe
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(396003)(39850400004)(366004)(2906002)(478600001)(36756003)(4326008)(86362001)(31686004)(316002)(4744005)(186003)(7416002)(110136005)(54906003)(71200400001)(8936002)(83380400001)(31696002)(6486002)(26005)(8676002)(2616005)(5660300002)(6512007)(107886003)(6506007)(91956017)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(53546011)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HIZX24S4e/KGOkvI8Lt3VVuyEH6XUipuVCMyV3/rY2AxkWHRoqebqPmBNyTbJJBleReou8QXW6487du8Q8xJsTM467kfO+/yzKrnrmetEgvwfbufcO8TPh1Idgto9zWh7SxA9YnR3y7/SFfmRy5uYJOtlT9A9+FuNc2bppAIjNPGW/cPBFqb0R38SAECjjzuDAENc6Mzaco8lXVrGUNUJK02ymuoAB6YFcgcCkI5RgGkaRm0LM9b5PX3cFhZf2MWk+H62cLGWdoURQGBVH6vQkqNlnKeTreiZM/b2HuSgFqOfsc0WpMmHgjA9YvNyInvzjBxcHcBk2mzSeqtyVyjTQwBMZ80Cs91sBuDk3zvRPFF0rBRGHnpR3mZOyZ7SRH97NSoYIAC+Y0yr1Mt5APhHJnITBQA3UNQVJKVgajdzz5dfUxm/gNsCTNMO0Xm316RlBB6PlBvr8nIlqHAFxNOA9ksmxXS59I1sgtJf7pQRqrWtMdwsCRsolyVl18LtnXZQk7OQ20JQQXqKgABRntUyQwJJ8Qo1BBKZu111ljM2gSejSKmWvdD+o7y1FbPIHBdXfnm2bwb5xwMOnfmehu9E3EUOSq+mH9xmivUSuL4Xmi61sQTNO8YqIWqS34GO0Tf1nPyGBOibibeicphgM2vZw==
Content-ID: <B899B950803CC84A8CFEE5D1426A3BD3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc111bcb-46cd-4f44-4530-08d88024f885
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 18:19:14.9166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2MThLvFPaKsI/Xy+QSWJCZlTGoFZ/O3zHAbincCQyELmEstbyeDBl3FPYREx34Lpwwd5DJ2uX/TPf4clCG4kPXR1U+iDr/+kyN1b0JkcO7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1386
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_131920_781548_69880AE9 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Daire.McNamara@microchip.com, anup.patel@wdc.com, linux-kernel@vger.kernel.org,
 atish.patra@wdc.com, robh+dt@kernel.org, alistair.francis@wdc.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 Padmarao.Begari@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/3/20 10:00 AM, Bin Meng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Fri, Oct 30, 2020 at 5:08 PM Anup Patel <anup@brainfault.org> wrote:
>> On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
>>> Add initial DTS for Microchip ICICLE board having only
>>> essential devcies (clocks, sdhci, ethernet, serial, etc).
>>>
>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>> ---
>>>   arch/riscv/boot/dts/Makefile                  |   1 +
>>>   arch/riscv/boot/dts/microchip/Makefile        |   2 +
>>>   .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
>> I suggest we split this DTS into two parts:
>> 1. SOC (microchip-polarfire.dtsi)
>> 2. Board (microchip-icicle-kit-a000.dts)
> I also doubt what is the correct board name. I suspect the -a000 comes
> from the SiFive board name convention, but does not apply to the
> Icicle Kit board.
>
> @Cyril, please confirm.
>
Correct. Sorry Padmarao, I missed that one.


Regards,

Cyril.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
