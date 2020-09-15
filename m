Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E45C43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 05:10:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4062F20731
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 05:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BBHYX5SE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JZfiwvZB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="UPE6P12u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4062F20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=E2Xi85zHcClM+uV3+Y8wmQ7SZoZjN+U90LCg7gd6xl0=; b=BBHYX5SEwb7IcKtAXLhak1w0R
	Dj7Htnqoj/GBuP68MDIEDtA7U2/XYD4p7DgMBln4p9+SB0GMBWxWhi0rv/2D8NVtj4oVZpDr2aLLF
	xdY0g+GGfh8dvbEeGjZqWhSF7IcSkXXkutB4lLNAGy3H5sLsJ82JgGjJFYQdztr39Fu8ZDbZ4Z/bD
	3OoB8qN+xW5ssn4peBj/vOiEwK3QQmG41rglPWLe/lHDLTK+J5zPnsDtD5kUIo/L8pxYNnBLxf7xo
	fjW+9GvEhrJloi7sb31Dg80KpDt9vwu62CHq2m/OxsvcqzeFV0NAsvoCh0Ua+00uPKbJ+J5cn8P2P
	ySzS5MYXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI3EX-0000ZA-OP; Tue, 15 Sep 2020 05:10:25 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI3EU-0000YH-BC
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 05:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600146623; x=1631682623;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=R7OT3iYPVPhbBcOU3izDq4QNABAhzL5iGAQSty1Qcn8=;
 b=JZfiwvZB4gugujrtGFnbvpKvxjowaBl0LeRvnP0sHEnvnvh/vqW90iVO
 mAxjnD+Pq9sKQTgTtVIkdqF414zZ0Z0ZOoYIWCaFupjZm2llIhp6wT/Li
 rDMnoMC4tXJsrQxkUGK8uEdjuD9dIAlwkLVU93bPK7k6FMGKiDv+JHl0U
 0Jv85MZdqIo6JGaaMpB3bVua3k1goFEt8mPiEyMDNb/KwqyvFXckyS/2J
 4sCf+4z/kdlK4gX+fp7sB45ztuR0d5JNNsHmyQAx3nxuuBQ+DSFm3MD76
 +VS48Jm9m2SsusoyeCk7Z1J1NEUpkwhtmJ1h0EN0xNpWvw1XF+6E9nzRH w==;
IronPort-SDR: hpfiKN/fCKU8TfcEfNwplbAGfAZYVUFrLg5sVsukTdTENerEWlNB+bhvvyeShEwuxAW/VRE6wi
 /A+Z4ergAErGR1AXViIO3zOETTZ9COFEP4ibxq2EeTF8iUk0tOI4aoNnpf8YVnvmRvzcR7+e0w
 cp8XHGEFhCHgcaKUYoV128BYopuAJvBapa8T4mSiSqwLLG5Vdc8IVHZXCilRdOekdCD0bPRisL
 I9iFI7OYc7SRx0ew4SaT0PDCCqhqIROeErvSfTothKJNSUl27n0Csg+gGvOGwM/WjBXAu3njRS
 82Y=
X-IronPort-AV: E=Sophos;i="5.76,428,1592841600"; d="scan'208";a="147392479"
Received: from mail-co1nam04lp2051.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.51])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 13:10:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UshTl0oMzJNCTGJoImQvdgCi1TYNpDwbOpMrFCv7HFcdbSxo87sbqIswGuqtOdpnKYsM4ph2U1QkZKp2YwB6tnHd6iO7/kUpyO8u3bJ9780nG3irsHaOeHIPRB5GTE4eSsijEKLIyjXcV/vgpoEd3F3xXjDqfJoFzYnqyZkU8SV/p8Rq6IK5zmo6W144yucTOIl5mJMivXiCvcyH2jDVa9aJCXcA09SJqHB5UlqKwq3et0khq8kePpGj77eSmCoK8rXGNNbCpK95rgbb+Krg4jli0HlGNRKDRWCc6Fbt7etAFb6Ix08g+9IrTJrnHpbbpg3J3eU6qoRG8hkQYVi/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dby0e945/xQ2QpH+5BVGQ0wOkk72/Lena8j5AlCFv8=;
 b=k3r6OPRI2YXYdC5O+RXzhg3m41DekV88fe6iOedsqwWvEujdXZ2ILz1lsAB8NhEnUNtjhq4v+OEX819bhsad3GqXSWkzS5P4w5dISUE8g4zzjypAw+qGgebOoQgCLVdYwjCg86z/6nTS06sjA/ZV4mV9A+DStmUpI15vJXXZmhFL/YwoMbnPPXt92uiQGFCxBCFrbMhZYf7bxWPCeW4GYEPj60ilRJrapMJTLnvsVmzqnZUs45Z3TbBPMXWavkDM9NyfbI7weZQRajJsVPpg1PWEapoKmEt/H4JgTSbctouj0eFnuzvkG++acuO2nM6e3wkoYQMpKLXYdKMvpcociQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Dby0e945/xQ2QpH+5BVGQ0wOkk72/Lena8j5AlCFv8=;
 b=UPE6P12ueoGNuN4K/u3VvPPF7B6a9yqvTde+/+zv/DujvKAMQM4DBNQMFs+JyVuQUp9Nc3OtzGngO3uELmXtHB79MEX0wp4DO7NyO2viIc77iNexEJPUZCcc47DEOwH6URQ4/miHEpTFLxpvwlvFwl7WO+gBGSPQDjurEF3uMic=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1225.namprd04.prod.outlook.com (2603:10b6:903:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 05:10:19 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 05:10:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mohammed Billoo <mab@mab-labs.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Topic: [PATCH] RISC-V: Resurrect the MMIO timer implementation for
 M-mode systems
Thread-Index: AQHWirrpPJWbe2PlHEeKVCGYd69a+w==
Date: Tue, 15 Sep 2020 05:10:19 +0000
Message-ID: <CY4PR04MB37511903F5C1E0AEDE047974E7200@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200914165628.445087-1-palmerdabbelt@google.com>
 <CALkjhPqmJPxsayVkUbN1Z++1LEpPB88TWm7iux34JXeWJ7bFpw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mab-labs.com; dkim=none (message not signed)
 header.d=none;mab-labs.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 41aa853d-449e-4a31-6554-08d85935a3f8
x-ms-traffictypediagnostic: CY4PR04MB1225:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB122568CEF24FEF4F4788E60FE7200@CY4PR04MB1225.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wemttUPWri41kd8Y89ZNnr+AFq4x7+kxQOelAtCv7osjMcdcV/xdvykNysHh3SIev20xIv3a2tHgxHZ2wRQRmvroJiMUBkUJoqGM64x48yumjjRz0E2BKRiql09cGx746KVBs8cRhfKd9BVOelpVl/ZNyjvT8wDX2WN9CglNlDCN388tjbu+Wk7vA+PylTKeF44JvY/V+Yn22fc3hRXIrcn5uK+1jIyYZuyTHTBfuzeMkNbSdKlEbrqasBGRRZkCY4b0KItY0HwvTardEtgUWSYtLZRtBcYu1zMAM6phrKOX9pE4APqHhAM+yFjU3iu3u/ccJUX/a1aN3c5AcQ6tY7URub5BKWWT4HFowv02PubJTNkBr+YAoTCncEujkEZISmytw/Y6JfVJcaGfMHzE7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(86362001)(7696005)(186003)(2906002)(6506007)(53546011)(66476007)(64756008)(66446008)(66556008)(66946007)(76116006)(55016002)(91956017)(9686003)(4326008)(316002)(478600001)(52536014)(5660300002)(966005)(83380400001)(33656002)(8676002)(110136005)(54906003)(8936002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: dgnpU0ahaFhhEokPDBsS4/gq2UcaMPHkSiq8Ho8Cntv7ZC4/Ax8ntrsNlgnixSC2aKe/HcEm7fhWgJGl/yyl+8+899E98G0QyYf5ILFahSVzau9G8lvDl0PkfVJxdmKTiCbgujgTTo/uxA8mA5fBRbgcYKw6mUGLRunjathm5aTm9CG+htGgtkBTDSgjxwelhUP30VqziVciCPoY1I719UgXy5Rn72pPcZHk1p3mbFmnK1VQ9NbyX0cu5gn+LY4ug4H+aRfUN8bK1aY+AHFCWRhea86VqzGzSxvvcP1IuOoo2cgNx7BEE3N1gOnwyaFQj605eANlGUVO5kgOI3GA3PkUlGXPisJmJ1axP9c1zLmKlZ2MO/z+HF0GHr0n4MHsLEKAWMqrUilUtzrf1NHHc00uIx0dVqI57/mm+iqylu8+KXhzmv+8S+BY+QcFXDBliMphsKLswbZto/XPIeeAflegHMwI9n3i+DYg6OiXK/I/lbnxGK0EfT9S2RGM7ovMbt2S0JeiuZXENOShLd1l5b3chgjZqiUsBHnfHxGDu6sIdOh8OAv9a8/qgeHO6eF9uxpiSUS9Cjx2T3UO2Bwj/YotaWMx9Zt+FXzA7WlPmY9Zt828JA1NeRzTkZ2lipLurtY3Rjc4RU8I6GXQnowrPx5kBn3Devo//u6UGrywU5ilOsWROIxb6m+Px2hE/rVXVNDGkZlONkF4MQg473NKGw==
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aa853d-449e-4a31-6554-08d85935a3f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 05:10:19.0639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 624MDpyyBQt3nfytpPGv5icdfF7AS14Q0v+n/WHgV+KbRXVOzXE2kt3WbcEmpkRfJeo0kp9dzIjCQbSNQMD69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_011022_529286_0DC92493 
X-CRM114-Status: GOOD (  23.99  )
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
Cc: "hch@infradead.org" <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "kernel-team@android.com" <kernel-team@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/09/15 2:23, Mohammed Billoo wrote:
> I can test this for you. Can you provide a high level description on
> what you'd like tested (it's not obvious to me what impact your patch
> will have)?

Are you able to run a userspace on 5.9 on the kendryte ? How do you build it ?
All my attempts fail to run correctly for any kernel > 5.8.4.

> 
> Thanks
> 
> 
> On Mon, Sep 14, 2020 at 1:16 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> The K210 doesn't implement rdtime in M-mode, and since that's where Linux runs
>> in the NOMMU systems that means we can't use rdtime.  The K210 is the only
>> system that anyone is currently running NOMMU or M-mode on, so here we're just
>> inlining the timer read directly.
>>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>> I don't actually have a K210 so I haven't tested this.  If nobody else has the
>> time to I'll put together a QEMU that doesn't support rdtime in M-mode, but
>> I've yet to mess around with the !MMU stuff so that might take a little while.
>> This certainly doesn't seem worse than what's there right now, though, as
>> rdtime isn't valid in M-mode on the K210 (our only M-mode platform).
>> ---
>>  arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
>>  arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
>>  drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
>>  3 files changed, 70 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/clint.h
>>
>> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
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
>> + * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
>> + * any overhead when accessing the MMIO timer.
>> + *
>> + * The ISA defines mtime as a 64-bit memory-mapped register that increments at
>> + * a constant frequency, but it doesn't define some other constraints we depend
>> + * on (most notably ordering constraints, but also some simpler stuff like the
>> + * memory layout).  Thus, this is called "clint_time_val" instead of something
>> + * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
>> + */
>> +extern u64 __iomem *clint_time_val;
>> +#endif
>> +
>> +#endif
>> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
>> index a3fb85d505d4..7f659dda0032 100644
>> --- a/arch/riscv/include/asm/timex.h
>> +++ b/arch/riscv/include/asm/timex.h
>> @@ -10,6 +10,31 @@
>>
>>  typedef unsigned long cycles_t;
>>
>> +#ifdef CONFIG_RISCV_M_MODE
>> +
>> +#include <asm/clint.h>
>> +
>> +#ifdef CONFIG_64BIT
>> +static inline cycles_t get_cycles(void)
>> +{
>> +       return readq_relaxed(clint_time_val);
>> +}
>> +#else /* !CONFIG_64BIT */
>> +static inline u32 get_cycles(void)
>> +{
>> +       return readl_relaxed(((u32 *)clint_time_val));
>> +}
>> +#define get_cycles get_cycles
>> +
>> +static inline u32 get_cycles_hi(void)
>> +{
>> +       return readl_relaxed(((u32 *)clint_time_val) + 1);
>> +}
>> +#define get_cycles_hi get_cycles_hi
>> +#endif /* CONFIG_64BIT */
>> +
>> +#else /* CONFIG_RISCV_M_MODE */
>> +
>>  static inline cycles_t get_cycles(void)
>>  {
>>         return csr_read(CSR_TIME);
>> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)
>>  }
>>  #endif /* CONFIG_64BIT */
>>
>> +#endif /* !CONFIG_RISCV_M_MODE */
>> +
>>  #define ARCH_HAS_READ_CURRENT_TIMER
>>  static inline int read_current_timer(unsigned long *timer_val)
>>  {
>> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
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
>>
>>  #define CLINT_IPI_OFF          0
>>  #define CLINT_TIMER_CMP_OFF    0x4000
>> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;
>>  static unsigned long clint_timer_freq;
>>  static unsigned int clint_timer_irq;
>>
>> +#ifdef CONFIG_RISCV_M_MODE
>> +u64 __iomem *clint_time_val;
>> +#endif
>> +
>>  static void clint_send_ipi(const struct cpumask *target)
>>  {
>>         unsigned int cpu;
>> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
>>         clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>>         clint_timer_freq = riscv_timebase;
>>
>> +#ifdef CONFIG_RISCV_M_MODE
>> +       /*
>> +        * Yes, that's an odd naming scheme.  time_val is public, but hopefully
>> +        * will die in favor of something cleaner.
>> +        */
>> +       clint_time_val = clint_timer_val;
>> +#endif
>> +
>>         pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>>
>>         rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
>> --
>> 2.28.0.618.gf4bc123cb7-goog
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> 


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
