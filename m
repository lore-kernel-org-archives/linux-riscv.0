Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19FCC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 08:40:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 464BF20B1F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 08:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2FW7IM8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dp4yV1tW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="h1ck2jPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 464BF20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=pJiQDjtCUqfsNUQF4kGI2jKOrFS2vy7KMSdfUEC9zcY=; b=d2FW7IM8RNJbkhX6OipRex4gN
	WNhvZhpOttJxtTldG2Zm9qMc6hMnBfZFaOks4g0MZxmEOJBvU8/hDvnkuT12v4aI6iBol9LyxLY+V
	sMSvFhFa7QB/2P0BO/Q9YdORpr1KAg8SQA61L0EBg9JIYxO3Ils2zgtn/g0eGtY34H1Zy+9Ss0s38
	f1H9BhaPaitFpSeKTCTFqpk3tymMIqu5vt1uqitIUQYavT6JyFO7OrB4fTqHz4EOwNFthq7R6hkZb
	Ebty//yJLcrOGJcXQK1nyzzDmAPaRL6RcpfRxSYxmh/F9S5SoMBuFxEdLCH/yUoE5GfDAXJnZbZHB
	ZkLAa/tiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI6V9-0001Ym-6D; Tue, 15 Sep 2020 08:39:47 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI6V4-0001Xj-IL
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 08:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600159183; x=1631695183;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=EzlTGtYzz5/aEEAtQGLdEV58j1qaK8Ct/n9XTPoJ17Y=;
 b=dp4yV1tWUGif6ip8A7/sPj+YHc+NT92oVsZgrvLtAgx+yDzbrVRFHxIP
 RfpP8zhLdq37o1HW6mjWAqWXRWVwrZDNwl0hx1PWw70mWU6H1aS0rEgme
 zZwvV5GrgK3LrMNZe/H+WdUQEv1zoh9edxtNuXfewNzQBNdzwiV16Njs6
 NVW9wXjwkRyNTKNMOovWAXI8hBHfyYOhJepaA62YwsqrwBIDkNNzfZMoL
 CJvzR3D/krrZNIRsMbyVqHaeXJYxwbhrHDxbbfVQhYiSmqnBW3fa6WS/9
 0KqEdTfPxVVbOwhm0j2eSZHd9rmlP8RLqMapUjlnhsfN+Ad9ByzfKwcDT Q==;
IronPort-SDR: xESTqp14K+UHFjjDyJrRH+ioU0TDkk7WRGbxaZyPWElzcaB+jWN2cd9/w2zK24re6NgwCDXdky
 EZXNa1PapV9MnUUPZZuu4VvciVZj30Bba8ixA6gVWdlxkuV04fkXAW3gUIeVFfdmJSOo00OrzB
 1NaDAUYUKP6V5rxRg5Lz3vtWPLRIzvX9NRtLXYMmQKedli1pl6JHa3LhueQlQEsGblayf66WDd
 DFYxXwZGgI7bqXuRsfhdP9aFfzvG6WUr2hA3JToUSSk8ADqqpdLKYNIfKUpLNSduvl+1yGqAz6
 pPk=
X-IronPort-AV: E=Sophos;i="5.76,429,1592841600"; d="scan'208";a="151766901"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 16:39:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIf+fOh3y+cbdXYDxh0CwRU8w4OqlRdQdcWhjl6wu4DrzWL9K8A4Xbn64kJaiEMnUYFhh2RGYEyC+yoB2zwuWWDeRn1ZQyTPTpFL8JOV0ftZT7KW0krmxTfRNmw4/WfvXlH99Onf6JSDU+7r2qBmH/tXADbjQqAjn9ZVoaleSfM4Q+t5UTY7NWOVJQ24ZRnTdXrpjL9pcwgcM7K/AChyuYnX/70hAEpy1ymlPAnxPiwQPLjWWgblMTyEAdv2hWNcufJVsVU8f1BDqll6EEUk8+woQbQ2IOwBV0w/BYUsgJcGVB/Sa0J7fqVfe0bg3KZIBNKGpyzUdmgAC8z+2nc15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrMCNPM6KLq8y3Q7BW1Ig5r4g7gQu0Uk5uAfZMhFtWU=;
 b=Ar52OCvpM2Ozi61Tngt1+h6kYgmEKecW6g7zCvAmiS1iRTc8fCEYoJmaBa0n+VHYGgrTl+k1bUgZhAm0RKVGkm2+o1Vt8f8wv0oHKaAKBsTE+U3te054G/ekjTBMfZoeo408YUDMD8WL2ebhcMtCGupHsJymAE1WxW3iNO3BG0PchoEY7IL2xpKje9KhDcombZT8y/x1MoNzOvIw83KIsHLu2EXM1fBH7EmieyIBxTAiNOHXYfKcDGWnQz6+vnyFrwMwOOi/Ikfi8hzXDMgbmTMttApY+eAV1+Oy5XYW3r9rqx1zOGfspUsi3BLI70fSJXWY2DzyK54QLXAyB84eEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrMCNPM6KLq8y3Q7BW1Ig5r4g7gQu0Uk5uAfZMhFtWU=;
 b=h1ck2jPzCd9eGS3TqArCHQRHCvsiiw1wkdRbVVXQCDe0NlkKHJ7gYgpDFn3m8W01YmRQBZTYynWfdAgNS/1lY8IMSqBXsZ3ouC7ACc00ezFoyFB+IbQDcPSZcjDbL8R3fVStc+E3PS4AvctK2ZA+jAv661SUKgS3HVKO+zq90ec=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1031.namprd04.prod.outlook.com (2603:10b6:910:51::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 15 Sep
 2020 08:39:31 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 08:39:31 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmerdabbelt@google.com" <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrpPJWbe2PlHEeKVCGYd69a+w==
Date: Tue, 15 Sep 2020 08:39:31 +0000
Message-ID: <CY4PR04MB37513F30C0B4DE765361DA53E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
 <b31c2141f5b5d1e2f9754b84236a4751cb4d6b21.camel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56a4a3c9-a31a-4419-b959-08d85952dd97
x-ms-traffictypediagnostic: CY4PR04MB1031:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB10317D7912E06036E11E0E11E7200@CY4PR04MB1031.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vRgcibdez3CoaMhFPDIHkc1GLli6FhIA0DEvlWjYVLvVuGIqSBa9W74Vdvo1UzbI4qN58jGCJBOfeMKzUeMRimF0K+Z6c/zVzUMV8XUKaqSC3c+q5A+bgefAUboOOJtXUXovweebt4+JAj9ODa1/uU73Pmzfe4RYenJABtnqWVKdvwNv0ecjcVEwYcnkms1Zl8PwVumlJduulg+KfUWeNH7w32BRxod4fxtQcsyb1/OHzyZbUT+y9uS4dhz28tt/uNRU1mjIPnoxOb5k1TXI6ujZsOQ0jBC0ujlDKmol5Q/JVUh372Svt4WGIsZbYWei
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(110136005)(33656002)(5660300002)(66476007)(7696005)(54906003)(478600001)(9686003)(71200400001)(86362001)(52536014)(4326008)(2906002)(83380400001)(186003)(64756008)(30864003)(66446008)(6506007)(53546011)(66946007)(76116006)(91956017)(55016002)(66556008)(8676002)(8936002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lpjqxxDuO2puiqeO4CNC+32arcUNyVlE0pFqxe6+Dk54r4OeAXryUGTprr/M3x/qx5URDGTTzVO44pEwMYtSZmTT+u/ApyQ0MbNSr45Orfzh0Y/R8Nl7YdXcHh8Qqkvx597X//1p0e+8hj86NDE12vDdNcOrXN1bYq3/v4VzQA6LEcoLlpjzRCPhKcdBgdI/qIdSHALpwm9S4kqk8ZVPpTcedGkYF0TDunCz4oSm9qwY/R2GpoG6hERnwJR5MB5xNWiXyE2/sOVtvo0aYMy9iPJB47a1FL30HQjnPi9XiwixQX3oajgp9HDjSNzkCYcCLaashNsC0zQLFPszhfYoPsk6MXGXBzvgDysP7UOdW7Ebrz4W54+V7aGSBXGTMy0466dpMDb9f92xW24h85K11PgBRLpX/BVatE7gjz3CKCZOFmI3gr91GcGECbeq5gfDoxTGxIJWCBT8N3vYz6fhjBvNqik351evlR1xCkcHTdJggRfeRDyrbj4wTXjQYLtrH63YStN0s9hZwtJnwRH3B2FNtl7GFz9LPxVy0bkF1BocKbiCF4jZkhJpCXxhtcc6IGfoBw3rb7zmoXzRaom7u9R5p0TEcGQQzu5oig8gCVvPKC5DkYPUlsx8Eq7vblWyluX1TbmdkEBEgsHon1ukqZDnc0LtX68ykn7ae1XLZzIeEadCoMsoXnChMAcYwxvH7Ix8Xhnm6OMm72yVQq8VJQ==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a4a3c9-a31a-4419-b959-08d85952dd97
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 08:39:31.1314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0Ef27tYcIke1HyIwmp175YKblPZsJ6BlZJuc4fiMk0B7VZhuHpxSmqe25XrcaXUgEQHZ9RoDrbwvAJqEAILdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_043942_849095_F3F4FB4B 
X-CRM114-Status: GOOD (  27.61  )
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
Cc: "hch@infradead.org" <hch@infradead.org>, Anup Patel <Anup.Patel@wdc.com>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/15 17:25, Damien Le Moal wrote:
> On Mon, 2020-09-14 at 09:56 -0700, Palmer Dabbelt wrote:
>> The K210 doesn't implement rdtime in M-mode, and since that's where Linu=
x runs
>> in the NOMMU systems that means we can't use rdtime.  The K210 is the on=
ly
>> system that anyone is currently running NOMMU or M-mode on, so here we'r=
e just
>> inlining the timer read directly.
>>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>> I don't actually have a K210 so I haven't tested this.  If nobody else h=
as the
>> time to I'll put together a QEMU that doesn't support rdtime in M-mode, =
but
>> I've yet to mess around with the !MMU stuff so that might take a little =
while.
>> This certainly doesn't seem worse than what's there right now, though, as
>> rdtime isn't valid in M-mode on the K210 (our only M-mode platform).
>> ---
>>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>>  3 files changed, 70 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/clint.h
>>
>> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/cli=
nt.h
>> new file mode 100644
>> index 000000000000..0789fd37b40a
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/clint.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2020 Google, Inc
>> + */
>> +
>> +#ifndef _ASM_RISCV_CLINT_H
>> +#define _ASM_RISCV_CLINT_H
>> +
>> +#include <linux/types.h>
>> +#include <asm/mmio.h>
>> +
>> +#ifdef CONFIG_RISCV_M_MODE
>> +/*
>> + * This lives in the CLINT driver, but is accessed directly by timex.h =
to avoid
>> + * any overhead when accessing the MMIO timer.
>> + *
>> + * The ISA defines mtime as a 64-bit memory-mapped register that increm=
ents at
>> + * a constant frequency, but it doesn't define some other constraints w=
e depend
>> + * on (most notably ordering constraints, but also some simpler stuff l=
ike the
>> + * memory layout).  Thus, this is called "clint_time_val" instead of so=
mething
>> + * like "riscv_mtime", to signify that these non-ISA assumptions must h=
old.
>> + */
>> +extern u64 __iomem *clint_time_val;
>> +#endif
>> +
>> +#endif
>> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/tim=
ex.h
>> index a3fb85d505d4..7f659dda0032 100644
>> --- a/arch/riscv/include/asm/timex.h
>> +++ b/arch/riscv/include/asm/timex.h
>> @@ -10,6 +10,31 @@
>>  =

>>  typedef unsigned long cycles_t;
>>  =

>> +#ifdef CONFIG_RISCV_M_MODE
>> +
>> +#include <asm/clint.h>
>> +
>> +#ifdef CONFIG_64BIT
>> +static inline cycles_t get_cycles(void)
>> +{
>> +	return readq_relaxed(clint_time_val);
>> +}
>> +#else /* !CONFIG_64BIT */
>> +static inline u32 get_cycles(void)
>> +{
>> +	return readl_relaxed(((u32 *)clint_time_val));
>> +}
>> +#define get_cycles get_cycles
>> +
>> +static inline u32 get_cycles_hi(void)
>> +{
>> +	return readl_relaxed(((u32 *)clint_time_val) + 1);
>> +}
>> +#define get_cycles_hi get_cycles_hi
>> +#endif /* CONFIG_64BIT */
>> +
>> +#else /* CONFIG_RISCV_M_MODE */
>> +
>>  static inline cycles_t get_cycles(void)
>>  {
>>  	return csr_read(CSR_TIME);
>> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)
>>  }
>>  #endif /* CONFIG_64BIT */
>>  =

>> +#endif /* !CONFIG_RISCV_M_MODE */
>> +
>>  #define ARCH_HAS_READ_CURRENT_TIMER
>>  static inline int read_current_timer(unsigned long *timer_val)
>>  {
>> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/tim=
er-clint.c
>> index 8eeafa82c03d..d17367dee02c 100644
>> --- a/drivers/clocksource/timer-clint.c
>> +++ b/drivers/clocksource/timer-clint.c
>> @@ -19,6 +19,11 @@
>>  #include <linux/interrupt.h>
>>  #include <linux/of_irq.h>
>>  #include <linux/smp.h>
>> +#include <linux/timex.h>
>> +
>> +#ifndef CONFIG_RISCV_M_MODE
>> +#include <asm/clint.h>
>> +#endif
>>  =

>>  #define CLINT_IPI_OFF		0
>>  #define CLINT_TIMER_CMP_OFF	0x4000
>> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;
>>  static unsigned long clint_timer_freq;
>>  static unsigned int clint_timer_irq;
>>  =

>> +#ifdef CONFIG_RISCV_M_MODE
>> +u64 __iomem *clint_time_val;
>> +#endif
>> +
>>  static void clint_send_ipi(const struct cpumask *target)
>>  {
>>  	unsigned int cpu;
>> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device=
_node *np)
>>  	clint_timer_val =3D base + CLINT_TIMER_VAL_OFF;
>>  	clint_timer_freq =3D riscv_timebase;
>>  =

>> +#ifdef CONFIG_RISCV_M_MODE
>> +	/*
>> +	 * Yes, that's an odd naming scheme.  time_val is public, but hopefully
>> +	 * will die in favor of something cleaner.
>> +	 */
>> +	clint_time_val =3D clint_timer_val;
>> +#endif
>> +
>>  	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>>  =

>>  	rc =3D clocksource_register_hz(&clint_clocksource, clint_timer_freq);
> =

> I tried this patch on the Kendryte, on top of for-next and on top of
> fixes (not sure which one is your target). First of all, with for-next, =

> I get this compilation warning:
> =

> arch/riscv/mm/init.c:44:28: warning: =91pt_ops=92 defined but not used [-
> Wunused-variable]
>    44 | static struct pt_alloc_ops pt_ops;
> =

> Now for the tests:
> =

> (1) With for-next, no patch applied I get a crash. Expected I guess...
> =

> [    0.000000] Linux version 5.9.0-rc2-00022-g3a822d8ea3b3 (
> damien@localhost.localdomain) (riscv64-linux-gcc.br_real (Buildroot
> 2020.08-368-g9148de6052-dirty) 9.3.0, GNU ld (GNU Binutils) 2.32) #93
> SMP Tue Sep 15 17:13:25 JST 2020
> [    0.000000] earlycon: sifive0 at MMIO 0x0000000038000000 (options
> '')
> [    0.000000] printk: bootconsole [sifive0] enabled
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000807fffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000080000000-0x00000000807fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000080000000-
> 0x00000000807fffff]
> [    0.000000] riscv: ISA extensions acdfim
> [    0.000000] riscv: ELF capabilities acdfim
> [    0.000000] percpu: max_distance=3D0x18000 too large for vmalloc space
> 0x0
> [    0.000000] percpu: Embedded 12 pages/cpu s18400 r0 d30752 u49152
> [    0.000000] Built 1 zonelists, mobility grouping off.  Total pages:
> 2020
> [    0.000000] Kernel command line: earlycon console=3DttySIF0
> [    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096
> bytes, linear)
> [    0.000000] Sorting __ex_table...
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 6192K/8192K available (1287K kernel code, 117K
> rwdata, 178K rodata, 301K init, 97K bss, 2000K reserved, 0K cma-
> reserved)
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> is 25 jiffies.
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] riscv-intc: 64 local interrupts mapped
> [    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts
> with 2 handlers for 4 contexts.
> [    0.000000] Oops - illegal instruction [#1]
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.9.0-rc2-
> 00022-g3a822d8ea3b3 #93
> [    0.000000] epc: 000000008000d5c8 ra : 000000008000d4fa sp :
> 0000000080183f40
> [    0.000000]  gp : 000000008019d350 tp : 0000000080187a00 t0 :
> 0000000000000019
> [    0.000000]  t1 : 0000000000000018 t2 : 0000000000000001 s0 :
> 0000000080183f80
> [    0.000000]  s1 : 0000000000000200 a0 : 0000000080196070 a1 :
> 0000000000000000
> [    0.000000]  a2 : ffffffff80183f50 a3 : 0000000000000000 a4 :
> 0000000000000000
> [    0.000000]  a5 : 0000000080168f70 a6 : 0000000000000000 a7 :
> 00000000000001e4
> [    0.000000]  s2 : 000000008019d0a8 s3 : 000000008019d068 s4 :
> 00000000807e0b00
> [    0.000000]  s5 : 000000008019d038 s6 : 000000008019d030 s7 :
> 00000000800123a8
> [    0.000000]  s8 : 0000000000000000 s9 : 0000000000000000 s10:
> 0000000000000000
> [    0.000000]  s11: 0000000000000000 t3 : 00000000801b42a8 t4 :
> 0000000000000068
> [    0.000000]  t5 : 000000000000004c t6 : 0000000000000033
> [    0.000000] status: 0000000000001800 badaddr: 00000000001b727c
> cause: 0000000000000002
> [    0.000000] random: get_random_bytes called from 0x0000000080051df8
> with crng_init=3D0
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Fatal exception
> [    0.000000] ---[ end Kernel panic - not syncing: Fatal exception ]
> ---
> =

> =

> (2) With for-next, patch applied, I get a hang:
> =

> [    0.000000] Linux version 5.9.0-rc2-00023-gacd1158869ad (
> damien@localhost.localdomain) (riscv64-linux-gcc.br_real (Buildroot
> 2020.08-368-g9148de6052-dirty) 9.3.0, GNU ld (GNU Binutils) 2.32) #94
> SMP Tue Sep 15 17:15:59 JST 2020
> [    0.000000] earlycon: sifive0 at MMIO 0x0000000038000000 (options
> '')
> [    0.000000] printk: bootconsole [sifive0] enabled
> [    0.000000] Zone ranges:
> [    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000807fffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000080000000-0x00000000807fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000080000000-
> 0x00000000807fffff]
> [    0.000000] riscv: ISA extensions acdfim
> [    0.000000] riscv: ELF capabilities acdfim
> [    0.000000] percpu: max_distance=3D0x18000 too large for vmalloc space
> 0x0
> [    0.000000] percpu: Embedded 12 pages/cpu s18400 r0 d30752 u49152
> [    0.000000] Built 1 zonelists, mobility grouping off.  Total pages:
> 2020
> [    0.000000] Kernel command line: earlycon console=3DttySIF0
> [    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192
> bytes, linear)
> [    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096
> bytes, linear)
> [    0.000000] Sorting __ex_table...
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 6176K/8192K available (1291K kernel code, 128K
> rwdata, 178K rodata, 305K init, 97K bss, 2016K reserved, 0K cma-
> reserved)
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay
> is 25 jiffies.
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] riscv-intc: 64 local interrupts mapped
> [    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts
> with 2 handlers for 4 contexts.
> [    0.000000] random: get_random_bytes called from 0x00000000800019b4
> with crng_init=3D0
> [    0.000000] clint: interrupt-controller@2000000: timer irq not found
> [    0.000000] Failed to initialize '/soc/interrupt-controller@2000000'
> : -19
> [    0.000000] timer_probe: no matching timers found

Is it needed to fix the device tree ? That was working before.

> [    0.000000] Console: colour dummy device 80x25
> [    0.000000] sched_clock: 64 bits at 250 Hz, resolution 4000000ns,
> wraps every 9007199254000000ns
> [    0.000000] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 15.60 BogoMIPS (lpj=3D31200)
> [    0.000000] pid_max: default: 4096 minimum: 301
> [    0.000000] Mount-cache hash table entries: 512 (order: 0, 4096
> bytes, linear)
> [    0.000000] Mountpoint-cache hash table entries: 512 (order: 0, 4096
> bytes, linear)
> [    0.000000] rcu: Hierarchical SRCU implementation.
> [    0.000000] smp: Bringing up secondary CPUs ...
> [    0.000000] SMP: IPI inject method not available
> =

> =

> In both cases, the timer does not seem to work at all (see the message
> timestamps).
> =

> Exact same results with your fixes branch too: hang with the patch and
> illegal instruction without it.
> =

> Something is broken.


Note: just to be sure I was not doing something wrong, I use the same build
environment to check with a known good kernel (5.8.0) and I got a clean boo=
t up
to user space. Here is the boot log:


[    0.000000] Linux version 5.8.0 (damien@localhost.localdomain)
(riscv64-linux-gcc.br_real (Buildroot 2020.08-368-g9148de6052-dirty) 9.3.0,=
 GNU
ld (GNU Binutils) 2.32) #97 SMP Tue Sep 15 17:30:04 JST 2020
[    0.000000] earlycon: sifive0 at MMIO 0x0000000038000000 (options '')
[    0.000000] printk: bootconsole [sifive0] enabled
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000807fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000807ff=
fff]
[    0.000000] riscv: ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: max_distance=3D0x18000 too large for vmalloc space 0=
x0
[    0.000000] percpu: Embedded 12 pages/cpu s18336 r0 d30816 u49152
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 2020
[    0.000000] Kernel command line: earlycon console=3DttySIF0
[    0.000000] Dentry cache hash table entries: 1024 (order: 1, 8192 bytes,=
 linear)
[    0.000000] Inode-cache hash table entries: 512 (order: 0, 4096 bytes, l=
inear)
[    0.000000] Sorting __ex_table...
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 6312K/8192K available (939K kernel code, 127K rwdata,
169K rodata, 297K init, 97K bss, 1880K reserved, 0K cma-reserved)
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25
jiffies.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 65 interrupts wit=
h 2
handlers for 4 contexts.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] harti=
d [0]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff
max_cycles: 0x3990be68b, max_idle_ns: 881590404272 ns
[    0.000014] sched_clock: 64 bits at 7MHz, resolution 128ns, wraps every
4398046511054ns
[    0.008239] Console: colour dummy device 80x25
[    0.012481] Calibrating delay loop (skipped), value calculated using tim=
er
frequency.. 15.60 BogoMIPS (lpj=3D31200)
[    0.022682] pid_max: default: 4096 minimum: 301
[    0.027299] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, l=
inear)
[    0.034417] Mountpoint-cache hash table entries: 512 (order: 0, 4096 byt=
es,
linear)
[    0.044873] rcu: Hierarchical SRCU implementation.
[    0.049771] smp: Bringing up secondary CPUs ...
[    0.055055] smp: Brought up 1 node, 2 CPUs
[    0.059445] devtmpfs: initialized
[    0.065609] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f,
max_idle_ns: 7645041785100000 ns
[    0.074633] futex hash table entries: 16 (order: -2, 1024 bytes, linear)
[    0.084141] Kendryte K210 SoC sysctl
[    0.097636] clocksource: Switched to clocksource riscv_clocksource
[    0.235346] workingset: timestamp_bits=3D62 max_order=3D11 bucket_order=
=3D0
[    0.242991] 38000000.serial: ttySIF0 at MMIO 0x38000000 (irq =3D 1, base=
_baud =3D
0) is a SiFive UART v0
[    0.251551] printk: console [ttySIF0] enabled
[    0.251551] printk: console [ttySIF0] enabled
[    0.260079] printk: bootconsole [sifive0] disabled
[    0.260079] printk: bootconsole [sifive0] disabled
[    0.271932] random: get_random_bytes called from 0x000000008005075c with
crng_init=3D0
[    0.280470] Freeing unused kernel memory: 296K
[    0.284186] This architecture does not have kernel memory protection.
[    0.290631] Run /init as init process

+---------------------------+
| Kendryte K210 NOMMU Linux |
+---------------------------+


BusyBox v1.32.0 (2020-09-12 16:01:20 JST) hush - the humble shell
Enter 'help' for a list of built-in commands.

/ #




-- =

Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
