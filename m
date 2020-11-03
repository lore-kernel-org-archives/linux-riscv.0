Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAB6C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:50:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FF232074B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 18:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gELzTlU5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="twgyqGnd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TR7AvTHJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FF232074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7fK6gazMHJ+qu9ARA6oYOrYwRxeYIj+OnjXsovg5c0k=; b=gELzTlU5I1/nvqYNjbP2gGIyb
	uxIMPf/Z/vG+yVELKFSVqLJtcfn5n7LZQXZCkc6RhfRe9znSbSXzNrrhPDhboPpTwGGuGNeDG/Y6z
	iSfTqdYa3zhUBC6smnGrL47X1dPpIzVyTP8vbB/3YHAJ5abZgOx8gUleCgK//vZdDro3w/PRKSygd
	MOhPci8L8ZJwMmuJ9JPbXL6h4oRQViFamGNEWI7+4YuFz5NTnnfQzQfWK05z/qVPl+AId/XMIvUbo
	/S7yL6S8bEGVn24bYCg9nZYdT6oCU3h0VkgDerK0gb1Yy8sUYIQ24Fcv4dKg53fs95kDvtBBkeQWs
	rEbZ0OjTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka1Nq-0002Nf-Ci; Tue, 03 Nov 2020 18:50:18 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka1Nm-0002La-NH
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 18:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1604429414; x=1635965414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s4ESc5UvxEmF2IcLqv2KPEYOJ2YumC1iWvUITlZsP3E=;
 b=twgyqGndBvmPozTCdgIM0cvlsDMuENPkm8DTUv8m5ktHRY7zIDNzc7vV
 yY02e56so/HhUULZfFLjepTIb34m09X/ap+VbtBgsshAqRuzWPSL6PGDt
 o+XDlX/zKBfRjos8/mTq4TAxw1/MM4Hq06TuC4qARq0snw92UG4LfKlDW
 n5BW6Zb2yUxNiJ31VCmi4W0y7p1rnVv7xCsjwyfzvOJgakTml+eoh1Zhl
 gy8SnY0Ra8iNiNZp/gvLQlxNsK9uWcxmwbEg3xfbAV+trFfDEzFoOeiIi
 aAg7cZu4E8+Bwj3lXTDxgycTZ8stZ5pZftvLpTuVQ6uAU+SHwkE9Jm4sr A==;
IronPort-SDR: 1oqvI1lEPl03WwEPWLOBtTSNYj5Hb38BRwdeAKgVkGtIV33aVxTv7KxlHeF6bGsy+fUxEH6JFz
 QYQNETk4aoSMD/8cOGRSrm9DL5r6cMiCHQ3s5MgFlMfuZ+UfIProHpyExjB2jcJzJ2cJobYA+g
 ImkVEDSQEhahqcK17woigtaB9KJWu2V6wXDoexHGdavVHQY8fnI8QaDZN6QRiO/ubYjLrvW01d
 D0NKYtqJTyeQlwIBaTNPPN1YIHAuKS+upEydv7ZpIkbd5wPdLbLwKZDquf6Q4jBpzwoJm2dd2k
 dOA=
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="102026131"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Nov 2020 11:50:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 3 Nov 2020 11:50:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 3 Nov 2020 11:50:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+jnZw3EZNH6icPizd6kJYtRTdMx1blYXE2am3Kl3fVJmQfY+PRhMI03p/J50gzEpobJTnZ0m9f9t34LIsREUlLiLJJEDUBQnfQQlIybQk5x2uBlnILMWLmQcSdNfrQv3QMXwZh2OHFNZIJxByg6QzEvcrE4GeC+tuXFUIf5PjhpJ/Dvi13qG5BI3rqL6odzZFG2XQOif+0sdM9tgUJT+jBR4i+j0UJ1m+bcHtzwh3lkWlYDc19PJcZJIChZR/FEjkG+TrDwq1W/Hrb0UlKx3CGSSHaDfmUyZYJWqOydm+aXZa+Dam+5f0/JH3DYwfQTLNI/pLrgERoggmOWlFQ3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4ESc5UvxEmF2IcLqv2KPEYOJ2YumC1iWvUITlZsP3E=;
 b=k3r9Vtp9+IVBQuTCxGNyzqv2rA02HfgTmW4ZfgW0wNq/zts0xYLBhFmBRP3ZcNwn8zo83XRgwDJmXMu+Upgddnq2H5JBeXZQs/sQentZVcI0ccUMteIQygWINo1aVN/IR+lPZJQv1KjWMopAlaphogWjhr8XaTCrdi011WfJNqolFM6r2+7yMqa4sk+5yYZm49Fm5KWlnRSQnKfX4zvFUBFseWzbqx4ThNJ9UDsJ+ttZsQXEbzi6D0lBLNUGDQtpY8lZ69zEI1L3efI+V+jEYGVepvmdcVvRdvEDLoc8NsCUjUBu5EY11+HuBo2PAke7SiPgkNtlEOqdEx7roFtOOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4ESc5UvxEmF2IcLqv2KPEYOJ2YumC1iWvUITlZsP3E=;
 b=TR7AvTHJuERMHKNjCfqsKFjs9xUkMY46Ej4agSylrpMhb05ZAOWdqMf7u3sx66fNELgDcx6A31qOeRMo8LvlrTYgC/JMAnJ38RNL2Q5aVeHuvvnrnAFB663+hzL6lzy9aYl5XBaU+Xf1xE0mxGbbiK/eB98hGnYLgEivfl05tng=
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by DM6PR11MB2762.namprd11.prod.outlook.com (2603:10b6:5:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.24; Tue, 3 Nov
 2020 18:50:10 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::8dfc:4424:3709:9e69%6]) with mapi id 15.20.3499.030; Tue, 3 Nov 2020
 18:50:10 +0000
From: <Cyril.Jean@microchip.com>
To: <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Topic: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
Thread-Index: AQHWrYIX44xaU0n+lU+FVu/TfSg/namv3J0AgAZYq4CAAIteAIAABVqAgAADSoA=
Date: Tue, 3 Nov 2020 18:50:10 +0000
Message-ID: <c137885d-374b-64ed-42a5-7e8efe004660@microchip.com>
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
 <CAEUhbmUm6EyP33FU1n4LhEk-xcBtR13-xS+Tpt76ug1HQv8CEg@mail.gmail.com>
 <e9bad05c-db34-ba2c-df5c-ff2f7f53e15b@microchip.com>
 <CAOnJCULkC65FgOakjPgoACdpiQFWTiEPCox3ayMWWZwVa91fVA@mail.gmail.com>
In-Reply-To: <CAOnJCULkC65FgOakjPgoACdpiQFWTiEPCox3ayMWWZwVa91fVA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [86.40.244.225]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd6add71-0e5a-4eca-d31c-08d880294a88
x-ms-traffictypediagnostic: DM6PR11MB2762:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB276215F19FB47D74A1ADC0CB9E110@DM6PR11MB2762.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5TRDpjC4aXteflKUMRMDeATefUTIMyfDC8eOlLT0gAVnpWK8pivUBeKGNJmDIfOUPZ+pzw0T4s9KQSXvdkOd6IwKrQHsx0AuszLYCi0T+I2QJgqG8bcFnxRc0KPYl9otUCjGRKjG7kQV3FU6wNZLxtrMLAPKIKWWjS755i4u1WFbDCA/G1/RYtKTNPvUYLSsF8+iG5ZX6LRIx0rRZsAbrHkNBBD7pd0I9nSrFXYLUbGJPhVahKbtz3rO67vqt3yFkZyOdLE5mYXUHL2o2YexpQ+VlUww8HZlb4M84fzotkFtFpS9fD82jEHNQFKSazVXYvaXV48+6UUoSFJGBfIUQAgurPH8n1NiBK6UBswEkk/hn4Ohqd8T1J54bcQoast
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(39860400002)(346002)(136003)(54906003)(66446008)(186003)(66476007)(86362001)(71200400001)(7416002)(2906002)(316002)(5660300002)(6512007)(53546011)(26005)(64756008)(66556008)(6506007)(107886003)(2616005)(31686004)(83380400001)(91956017)(8676002)(36756003)(8936002)(4326008)(6916009)(6486002)(66946007)(31696002)(76116006)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: yRA5LJrw/zhpy3+j6IJIUIMaIVTwmbcxNzq+5opqW6nAPjWQCoV6e+wgSEyrm83VRaQIJoYrE3yepKX2fvhb320tmtIL+TNHz5OQWV28bxe4qGpgXxw75SlXLIKIt/2FPRFWhOgD44ie/vEgKUejhebTL4w0WHwSFMlUp7VViiW2DYASfmlgAfbG4005GaX6IbAMcUUJzGBMGGP+0exXGMsL+BKgydfd+lXauKDi3ZPNoB5ravD4tTvj8aVAcQ6rcUIcbxIJKzyAe/DeQE1jmGhng9ci4CAXb1RMweiZ0SdTizLL62DjEC/sp1kIxIkfJIkm0hh+MaPS9CQ5GJ+etbXyCo+Brc1KqwrHfI2kvBRd1ivfbJSDk/oqux0GCteUIX4kXDKr9eSzIj4CX/iQlWQEPlbbdcuf55Jc4mV/QOR55TplLy3Bx6o6LtCO3h4VQ8GJ1DyobgE7jCNzb+R4wRo83h2B/ibU22d8D9WnrhiwsbFN1kdzdputf9AXXFsMBkk8lwxVkZL+K+qH409uAhLlecZUcvabbti3IaMEJhmkD/thiB/tRSjZ31RRspKOyaAnI372j28Z0z+w9eqh513toyJe7QrFEsJ1tR4CK3crMtcnGEWjYG94K+AxvRK/8LQddaSgEwTytk05pSgcvA==
Content-ID: <8CE7B812EEA3604EB13D62DA3714E4C5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6add71-0e5a-4eca-d31c-08d880294a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 18:50:10.5010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /6gohuHHZOH47/w0iPXcyJFwPmIMDwX6olVzdPfvHqM/ijWuzzLWD+ZzfqPKhbmkrTag2uq9JEbYGveDNl37Tak4p8Qi6O7cnaUg6hDJeC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_135014_934811_460AEB21 
X-CRM114-Status: GOOD (  14.78  )
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
 Daire.McNamara@microchip.com, anup@brainfault.org, anup.patel@wdc.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, robh+dt@kernel.org,
 alistair.francis@wdc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, bmeng.cn@gmail.com,
 Padmarao.Begari@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/3/20 6:38 PM, Atish Patra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Tue, Nov 3, 2020 at 10:19 AM <Cyril.Jean@microchip.com> wrote:
>> On 11/3/20 10:00 AM, Bin Meng wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Fri, Oct 30, 2020 at 5:08 PM Anup Patel <anup@brainfault.org> wrote:
>>>> On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
>>>>> Add initial DTS for Microchip ICICLE board having only
>>>>> essential devcies (clocks, sdhci, ethernet, serial, etc).
>>>>>
>>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>>> ---
>>>>>    arch/riscv/boot/dts/Makefile                  |   1 +
>>>>>    arch/riscv/boot/dts/microchip/Makefile        |   2 +
>>>>>    .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
>>>> I suggest we split this DTS into two parts:
>>>> 1. SOC (microchip-polarfire.dtsi)
>>>> 2. Board (microchip-icicle-kit-a000.dts)
>>> I also doubt what is the correct board name. I suspect the -a000 comes
>>> from the SiFive board name convention, but does not apply to the
>>> Icicle Kit board.
>>>
>>> @Cyril, please confirm.
>>>
>> Correct. Sorry Padmarao, I missed that one.
>>
> Ok. I picked that one from U-Boot. What should be the correct board
> name in that case ?
>
> microchip-pfsoc-icicle-kit ?

My preference would go for microchip-mpfs-icicle-kit. I prefer "mpfs" 
over "pfsoc" as "mpfs" is the part number prefix for the PolarFire SoC 
device family.


Regards,

Cyril.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
