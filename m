Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBECBC388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:57:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 629C8208D5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 07:57:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M7HTq4P9";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="cMjlUD6X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="FLUqc0ql"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 629C8208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=QuuafuJmin/V6TQz1MgYBp381Q16eKXMEcnyw1v1q8Y=; b=M7HTq4P9MT9g2KwrwoLKG7UBB
	dPbrlNROVpsJ8iEtIBmN/Mi2VIQh6ZCtWcVfzn9b8g4yNYtMg9yHodl1WmejpW9BX4O6eVxzbIk1k
	I801y4UGWewfJOxsvgtcFrciM56DNK7VgdHR94mph09f1xhW9qGQtGYd1QltJrR5cIIdDjJslzoJG
	acuPJmtCUQnsrUtnxAI29NSPLz4mo5E93GFJuHzsOjTK3HsINKVzd6b7hDXrjIrDKzZVHOU8wceyU
	IxtLFg1AgRiRY2vESE7usO+hAC2MO+Oz9IlcZn54/6QnHLZsMYm8H3ONc0NrCpLFBnee0JLMNSXY/
	ABub5jz7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdTxY-0000qh-5a; Fri, 13 Nov 2020 07:57:28 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdTxU-0000py-Bh
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 07:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605255174; x=1636791174;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=7HpTbNO57kfx5AxIAxoCg13MQQNHAzibGdXKiV0yh8I=;
 b=cMjlUD6XjM/KKWv+xWOMydS8BTdCyOD5ZLN3X7K2Pk3kyQowyB/npGrC
 c2Fpay49tPGpCBZcVRY9DHdquCAbYNDn/JXrc4bAnEMe92q/T/wTvgbiP
 Sqvt23E/KOFJ/HzsfhxF4qaJ6+RV3w6aNBMHNfHRfbS6oJUm8Xu9u77oM
 GUe4GhsjxoQ/PQVxuigBp4pnsTrB++9BgG+ghDs2bld6BHHJ1tKymKRsZ
 VG8KLXMu6DsbQe7oJl5tV3Drc8P9JzX8ucX+cc1KHr7YeezZSHd/SOF11
 v8nszfgGLTNVMKGIOhxGkR+AUuzexXY5EZfW0rzXn76awHx9Cu67/MlHn Q==;
IronPort-SDR: sszAPkhxhsoSo88ZPIik8Fc3MrMtn8Z8CxcVaSHl8AGkmr2SJ7GvS3iYjpbcGCvUEbNvxGO+uw
 O8CIhfPCZ7VbDjg+Sh/a8irgxAH2TemPROr3Q8fN7dk7NKMYm5AHRT/E09AOUhAsA9Qubz5Yoh
 lf4R0ePB3nEI5kilMIo/ia8oblj7eeE9SttaB0rku72+9lfQMwGhazjS+pYPwHT/75j+MnjhbD
 IU09o/aSsNV6/e0Cd+RgMLZXlm3+giIDSuLjFRsAdifDZ1rWNzbukr8g4ap+3pvBwI+yMyfHJ8
 LlM=
X-IronPort-AV: E=Sophos;i="5.77,474,1596470400"; d="scan'208";a="256126447"
Received: from mail-bn3nam04lp2053.outbound.protection.outlook.com (HELO
 NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.53])
 by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2020 16:12:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8kthuaZQLtrcuWJrckWi8GXxsIRkSzSpo6kkH2PCu7w6e/26Zu0hdNoFIdUehvxSHGtxWPW5Os0/JG3+brMzp8wEhbCOju351gJZnGOOusSiSEaRAeMii6GFqgNosIsEBS+YBAvpvmuIIKJ6PtXnTSWDZ4+9YHHOWQ0H4QZvKVsTMGaBUp9yj7A4/hrRW6mBsqOH+Vu5gZtvQQi/IjMBWdW7xQZ2XG2HLJtUU/ClE+W19s4LPPR+hGGU/p7Cks84pas8sbjqcRnvylE0qzh/EO2+8nB0IwLZtx+tCnMx/y35laFM5cbe9ZojhWCn8X+71OZeICSOijfkQXzBzh5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HpTbNO57kfx5AxIAxoCg13MQQNHAzibGdXKiV0yh8I=;
 b=KYhmlMzDxLTh0kMRuqUAupx08kPeUHvVtorzTVoX8c/LNqwH2t3FziFlrbJzL2GufFpJwHZPlCmYKgoYnXQD/oJ08Gr1ZjVZzXfmjHDICcA4ebBPLV0KIUQ8ZfU0nuRFqJAabCHaHgMnpHOzyUI9HrS9py1Ppmqn/YrJImnGej+RfBa2iTjSY8eMNFgVueTt0/nA+cGhHJw+kb5hhew/Da/iKqHuT3kJa4YWL6g//AH5xjA1QtgQ6W72tzOhw4b4eeZkK/lLKPuArEn/h0lUgLnfz4SZ5HNsy2ANUbmuIsOXagWn4gUzu5JCUk0HnRpvWF6j7nB+uNVUMsqCIotBZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HpTbNO57kfx5AxIAxoCg13MQQNHAzibGdXKiV0yh8I=;
 b=FLUqc0qldtYaCTaNxcNEUUh4SCHyUDaCuaPu2YlAc9xziXIulSL4T7X/yKZV4zO71jx29CjvRu5lE4Rb1UEIGVkuZEcFdzAyLWGwe0cm6o5rOEEJgc1CH5AlJ3JLw8OG09Cw2Nu8cBf8dei7j56MqMIQ5mZ3y5nJhabsg1Ct+cU=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6352.namprd04.prod.outlook.com (2603:10b6:208:1ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Fri, 13 Nov
 2020 07:57:19 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 07:57:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Rob
 Herring <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Topic: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Index: AQHWtN4Q9ZnQv+4b30qO975eAugUlw==
Date: Fri, 13 Nov 2020 07:57:19 +0000
Message-ID: <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
 <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1511:21c9:a204:82eb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 02dd4532-12d1-49e6-ac24-08d887a9bf16
x-ms-traffictypediagnostic: MN2PR04MB6352:
x-microsoft-antispam-prvs: <MN2PR04MB635229ADBA1001DB7C53FB57E7E60@MN2PR04MB6352.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lQ2wwOmIgsBEenTxpApcCLerkPG0gyQXJgdR81OePOYASAd675W/aKSvluhO2WLg/p83VE9u1ZTXduFT1IRbfk4vDgUGEO0DklK7F8Zc0UZ8Fmq9jiBmqwoYnhJqJ084KTpPEtVXlgH2S8bexiPzbBh39M7IwQdByYhfgK9sj3WpqnD9RdJH2q5sYFnklc+BYdJPbDRvmh/SJAOBRHcjLJyBe2SHyMEYyW13/wykgD0YeNO3OTJDhzMrqILcfJ/qq1UUR+R6x4CMT7u8LWWhsYSF/dS5xeyGhkJZnIh0w2QKEc4IoLKmINTZDEg9MZEpus2o/oxbQ9G4zsu3VTU5SA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(86362001)(6506007)(66946007)(4326008)(110136005)(55016002)(5660300002)(9686003)(53546011)(316002)(66446008)(76116006)(33656002)(64756008)(91956017)(52536014)(71200400001)(66556008)(83380400001)(186003)(4001150100001)(8936002)(478600001)(66476007)(2906002)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: TJzfr2GmEGwzYXUAu8EpndEb8zOy2nPTt0g4aUO94ZjKXP+Z9LNqbMUHk9UJqEEiSiQrcbKT++N5PymBobjrmrfRX39eZcNkBKsee5u0Dfej8IU+kT8gtzLdeoYZO1dKg2p09rIxB7Jfo8YcAkwMRqoJijczHEy40Xy84n9utWD3jGljfaJYiLT+Ydhxs9xH9DsgqvyABzua19zWCpXcKNgul1vzjpMQJQ259JdVzLgKrceexiOrxENDt8EpVJjrD02CtK11aJ9edqx4fNbsCL++SB1xLjev5N6Kas/jCCFTPa/nzV7UvLKDmRem7eAP5aKudgX9dqPiBxGKpsX5UukGMOK1wh22mzqwMA1ajYFJINZSlfE1LAn2W7rcftrdBd8zXaSdahN6S+fHUYjK1627O7rSnuTpd6YxcYKiRYasy0lpq9A+FVeuLnUk/ZGsUYqHcZ3n0XmQIWku0t4QNuFPP+oNGlKsjLxNG1s+vROuADPyQ7Z30p/hy8IpZs4hKeUJrglsSQIAgr9UzHi6CcMBAXPlCkJOPRKvf46SfjUonGfjO4xu9a/zts63pD0jgvZIcZFSP30hudpiXM4qUqAiDplcHrOObso3x08fk6LES3DukLQUeQIZ8KrJDa6zrWhDUMXjIpRFGxQpK2prixtyU5xIkmWVCtmLcOBhsA/Yxf3za1EQCxFopsCQV0w2pirLzGK/XHqztqZmJMk7EA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02dd4532-12d1-49e6-ac24-08d887a9bf16
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 07:57:19.7006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uZE2tqsk366Hb220buUaqu/UaZQV/VroNjeWNdSenoBxvKhYc9Wh2dcm4hA6p3zObTjHQzliiZ2Kqe8mWv4YjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_025724_629576_C4F6A430 
X-CRM114-Status: GOOD (  23.94  )
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

On 2020/11/13 16:53, Stephen Boyd wrote:
> Quoting Damien Le Moal (2020-11-12 23:40:17)
>> On 2020/11/13 16:31, Stephen Boyd wrote:
>>> Quoting Damien Le Moal (2020-11-07 00:13:56)
>>>> If of_clk_init() is not called in time_init(), clock providers defined
>>>> in the system device tree are not initialized, resulting in failures for
>>>> other devices to initialize due to missing clocks.
>>>> Similarly to other architectures and to the default kernel time_init()
>>>> implementation, call of_clk_init() before executing timer_probe() in
>>>> time_init().
>>>
>>> Do you have timers that need clks to be running or queryable this early?
>>> This of_clk_init() call is made here when architectures need to call
>>> things like clk_get_rate() to figure out some clk frequency for their
>>> clockevent or clocksource. It is OK to have this call here, I'm just
>>> curious if this is actually necessary vs. delaying it to later.
>>>
>>
>> I think the clocks could be initialized later, but at least the CLINT will
>> depend on one of the clocks, same for the CPU frequency information. So need
>> checking.
>>
>> What this patch fixes is not the need for a super early initialization though,
>> it is that _nothing_ was being initialized without it: the clock driver probe
>> function was never called with the current riscv time_init() as is. I looked at
>> other architectures and at the default kernel time_init(), and mimicked what was
>> done, that is, added of_clk_init(). Is there any other way to make sure that the
>> needed clock drivers are initialized ?
>>
> 
> Yes it's fine. Just the commit text reads as "If of_clk_init() is not
> called in time_init() then nothing works" which is true but made me
> wonder if it was because it needed to be super early or not. The commit
> text could be a little clearer here.

OK. I will clarify the commit message in V2. Working on it now.

> We don't have any good solution for a fallback to call of_clk_init()
> somewhere later. I do wonder if we should generalize this though and
> call of_clk_init() from start_kernel() directly via some Kconfig that
> architectures select if they need it for their timer and then move it to
> an initcall if architectures don't select the config. Or throw it into
> the of_platform_default_populate_init() hook if the architecture doesn't
> need to call it early.

This last idea seems reasonable and probably the easiest. And I think it could
be done unconditionally even if the arch calls of_clk_init() early as the
already populated clock provider nodes would not be initialized again.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
