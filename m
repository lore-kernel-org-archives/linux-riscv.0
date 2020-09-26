Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250BAC2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:46:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D2032389E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QXvQBR4o";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="gsO8Q1yt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="iGVmN5Lz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D2032389E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rfuz5e8A2eGsc1+/vwcfx5SkNJssfe/6ui5xFTX4D7E=; b=QXvQBR4oylFb9hMrqDDyyXlt+
	zydAwe1qIntRAkrjOGNazkBUOQP/Kb+ahR0xbpQO3+/KfpWHOQtqMYckkPmdGOOhAq2NIi26lXpQD
	txcYt7akalXyru42mwiR3/3h0DTp6IJSrbhA1h6kU5yaSC6YEmDijzcV7fEmvqJO/w/Mma0E0zL88
	074EToF3eVOyxDPSFhs/EytoChtoiSTE5SSXxtWSNVkLEJDXV5tml1OPgzM/hnvO2DM/o1gptcqPn
	aMPMstXQIiXrkYNz/CdwUqh7xCoM0Z1wUMdWp9xdXpd8pnYmTv17Rp43O2hh1yu/O7Gw3xOlwyGaD
	c8K+hbebw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM6mf-0005gs-T2; Sat, 26 Sep 2020 09:46:25 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM6mc-0005gU-S8
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 09:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601114319; x=1632650319;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eQ92xVBS6abZd2FKtuolJEogq61AL2uz/DvE0un+cG4=;
 b=gsO8Q1ytK6zXbdDxOAY71xT5672ts8AkF2nH68oTeTqBN9EGulKe0zDw
 ZQpmsg/MLYbmyZ+PMhzctOdl6fMxHs+7/y6XfUaQr+z/1Sus9cmlyRzWl
 dGlPnb3NmEGrmst9hMqTNUOfjR75yRNgqWPU4K1pn3f4t1HAJsiD6PsLN
 GfcV3xrDPYyZWly/u23wYpKe2ZJQZ9GGkbeFnXRqO7N0gNAQadLgV5SOn
 sYV+/UZEDU2XMA9JbKkVQ2mxe3PAC/fb8izIWCGSEPsz/oNhA9rVDXs0Z
 hdEoQ85eg6ZXw0F2juF8HVpTyOXiRymDDGGvRV9W3urn/i76wc23EMQrW A==;
IronPort-SDR: j2iaUQxMil6jXW2OXV7I/jjOK2os5l89eySxES1NO1x5XvpdQsCoir38CZTakYi2GkEzkt+HTd
 s6ew8vqSSp/BSDU6FdTJeoIga5lwzLDKPNgKaAmyLDPpy+39MvUMXWyT4igQMJaWlbsfVbO1c4
 qhtv0xDIu+/JGd/KrjLSef1Okr49vHE+VPzgx1ORPAb6YvSmrH+AgOJMLdH2IOqMgnl2okV7zv
 o3fQtQPqh736l88lS9wFduy6vpKsTD24oMuVeEFy8NysWIvL3UnTRx0gPJu3tMXzQXCGlKEON4
 sTk=
X-IronPort-AV: E=Sophos;i="5.77,305,1596470400"; d="scan'208";a="251722611"
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 17:58:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzdJxUV/YDsijLnHF+nyKrEU/IrZjCtZpsxm4z81bWsS/RKqb6ce+mGS5plnu3wJf+cmkOWMhoPrY5vhqD/GC0tLMzDlMUJ8Hsxux3HExIn2jE+YRhURwYQy8uUgi9k781vdeD5hks/YfU6iLDYMLdWS4XhnHYrEOxxD+POdGObex3NBuDXU9d1RXJc4CypYnYaT3jmAfTTaqDjRAHX6qk9x2t9t6dYQY4BA/AaC74iIQSVBPMdNTpgAiQhZDpiHuGfH0xN+Fcg0skWJjLheCd/ZUwwpcdA8MTWZOzt44GUuMXwU8/JOKP4SuWLrCLYSQDqBcl1HjFc+S2rRvDyLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ92xVBS6abZd2FKtuolJEogq61AL2uz/DvE0un+cG4=;
 b=VwEsE52W8KjVlR50LjU1nzuECnQ9BgsJS8lnS59Z4dOGdxYpEYv8Lj/K3xDGtl6P5jP0s5ieEAjhnhrG2J58qFcJFSHizt0vZcYRL2qZsPwtc60S+Y3BcSFjNL+RdDRJvzT0vAOO/wbC2heYrJzPqAWZJNm655dHQ5JfrucvXk4lpfkbX07sC4REpxgwTTkxIp9bRDNbBnCAigiex4ghnhrWt8esJSf3EwIkkEs+gO9hLIJUtqpGz3Ji1tO9CPqvL4ypqdWGZssHN/uq4ZYBQ1Ax/TmS49T4nRrNKd5JY4JsymaO3RB7JLGPoLWwNi96kfVx+T6xb3neow0QNCZL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ92xVBS6abZd2FKtuolJEogq61AL2uz/DvE0un+cG4=;
 b=iGVmN5LzTCp0p91SOStkn671JCm9fGOO8mwtMxPRWtbxnKP5q5jYxwE0eM6R69TA9sx5c9vDX1V/tVOiQ7dt65RfDxP+DKqsN4uHb2/waQLa+nC35HwBf/msUsZgB5E1xca6xQSfInglzW9OkPpjPKnDLabfCl7W+1KW24T+8Yg=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB1030.namprd04.prod.outlook.com (2603:10b6:910:56::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Sat, 26 Sep
 2020 09:46:17 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3412.024; Sat, 26 Sep 2020
 09:46:17 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "palmerdabbelt@google.com"
 <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
Thread-Topic: [PATCH] RISC-V: Check clint_time_val before use
Thread-Index: AQHWk9aYSJLcKwhKG0OB2/Vy4ql06al6pkQAgAAB0ICAAAQAAA==
Date: Sat, 26 Sep 2020 09:46:17 +0000
Message-ID: <0e1990c99bf2a342cd2e78ec7ecfc2fdecaf67fb.camel@wdc.com>
References: <20200926072750.807764-1-anup.patel@wdc.com>
 <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
 <DM6PR04MB62017875C739101DF83280ED8D370@DM6PR04MB6201.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB62017875C739101DF83280ED8D370@DM6PR04MB6201.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-1.fc32) 
authentication-results: sifive.com; dkim=none (message not signed)
 header.d=none;sifive.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: da2abd71-4d8c-4ccc-879e-08d8620103eb
x-ms-traffictypediagnostic: CY4PR04MB1030:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB1030843F1596D6B029CAD4FDE7370@CY4PR04MB1030.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CbANwWAnDqKX2dBTRO4apoEe0skoMxd5zxT1b4ujyxTOpuS8y2fZUHnBSmYzod+g63m1j7i63mNeLI83/axn9e+vhzhZwtLTU3XJGG6vsauWcWKNiUxWhXIwukGjU1wVEnpcmV35urddwoVnOy693xIWvfW1AbYNC6rtKpH7wVzMoE4pCdJtpdk8ahAoqzwcb8N16kJabEW+Edwp2KuT8tyZ6vbpKKzX2lCPsCie+EzIiJ21ReasfH6B/QaaGU7Ghhm/70j3X0LPKReaTKq/eK+VSv5OkBEusXuiQs0f8UjZV2JTSwZor3uQsoRcptmcl45LkRmy+I8OC2ntjq4EEP7tk/0Qcw3e3/WoBmLgsbFA113kOUsSB7h29NusguxC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(2906002)(316002)(6486002)(4326008)(54906003)(110136005)(5660300002)(2616005)(478600001)(66476007)(71200400001)(66446008)(64756008)(66556008)(76116006)(66946007)(91956017)(186003)(6506007)(53546011)(6512007)(8936002)(83380400001)(36756003)(8676002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: jw3ohs00kSqOw/qrm4s03WvJUuJrYKhW1lcN98J1pLD1t6eNUCd9rTfi8jG8VX9skyM49vFmin/HMVhJ1I2RAhDPWvN9DR1RnM2tlc+20M7cKB82B9osb1yPONJpUHoegqheRrAjljPZ35AW3+kq6+mFYpEe+LJwBYUAr4zzG3hY0+ztFbcGdcqsgRrG8XtuPbUajVnwC3b5uX+n5rY/xI627EF5B2hrSbxAEtnC6o7m2L7mR0RoihIn6pjdYIh7FfbB/VZ4HfJyEVqqQi2OtNyEeNPhkxLedoVOTo5GS9DE4/23qjLO/1ja+ik5apNWMLI+2ECmHP0NXf5xtIuqKUGlvkp8TOAWHFZxILmqBVfkJRFweKfvPaYAiR4fXkJrYVMZm1xmlOzy0AQCYUKVqfuHsdhACu4tqbmRagzq04JJCyiPOQovFp3J256xGgtoyoQKUvkJqXVHOTHRQxd61XIErwv9D4shUbxGHOXmY+o3jiDqdHQxAAGcJ5nJuysTXC0syZKmEHyNIfep+NkI2ts/kLcSqhLLQaHM2clQSt3wdSVs6XgWIxz9hvIEiK1iq3iUuDVCzSUOvw0dATABSYp/uRQ9zw3EQODgr580IEhAprF1LDeQvkvH79XZNTqTIPEFCrGoga14mKkjZATSdph+SMJcmyCUx900aa7A0vL5B2BPWEPa6h6Ng/6FGwQHCInPunrU0ixyRKZLJwg11w==
Content-ID: <9646FE83BC4B2D4DA08E2068DA4BBCA3@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2abd71-4d8c-4ccc-879e-08d8620103eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2020 09:46:17.2212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGwdFFObzBjkNaoxUitWVLE2zA9TdtrD+dZ9kpTYwgNjDaYaUNLoNeeGaXqLbiFmJFkFi2/WZCoru369Z7hF9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_054623_129767_9F669D7D 
X-CRM114-Status: GOOD (  27.95  )
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
Cc: "anup@brainfault.org" <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 2020-09-26 at 09:31 +0000, Anup Patel wrote:
> > -----Original Message-----
> > From: Damien Le Moal <Damien.LeMoal@wdc.com>
> > Sent: 26 September 2020 14:55
> > To: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > palmerdabbelt@google.com; Anup Patel <Anup.Patel@wdc.com>;
> > aou@eecs.berkeley.edu
> > Cc: anup@brainfault.org; linux-riscv@lists.infradead.org; Atish Patra
> > <Atish.Patra@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
> > 
> > On Sat, 2020-09-26 at 12:57 +0530, Anup Patel wrote:
> > > The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> > > because the get_cycles() and friends are called very early from
> > > rand_initialize() before CLINT driver is probed. To fix this, we
> > > should check clint_time_val before use in get_cycles() and friends.
> > > 
> > > Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> > > for M-mode systems")
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > > ---
> > >  arch/riscv/include/asm/timex.h | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/timex.h
> > > b/arch/riscv/include/asm/timex.h index 7f659dda0032..52b42bb1602c
> > > 100644
> > > --- a/arch/riscv/include/asm/timex.h
> > > +++ b/arch/riscv/include/asm/timex.h
> > > @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;  #ifdef
> > > CONFIG_64BIT  static inline cycles_t get_cycles(void)  {
> > > -	return readq_relaxed(clint_time_val);
> > > +	if (clint_time_val)
> > > +		return readq_relaxed(clint_time_val);
> > > +	return 0;
> > >  }
> > >  #else /* !CONFIG_64BIT */
> > >  static inline u32 get_cycles(void)
> > >  {
> > > -	return readl_relaxed(((u32 *)clint_time_val));
> > > +	if (clint_time_val)
> > > +		return readl_relaxed(((u32 *)clint_time_val));
> > > +	return 0;
> > >  }
> > >  #define get_cycles get_cycles
> > > 
> > >  static inline u32 get_cycles_hi(void)  {
> > > -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> > > +	if (clint_time_val)
> > > +		return readl_relaxed(((u32 *)clint_time_val) + 1);
> > > +	return 0
> > >  }
> > >  #define get_cycles_hi get_cycles_hi
> > >  #endif /* CONFIG_64BIT */
> > 
> > Applying this on top of rc6, I now get a hang on Kendryte boot...
> > No problems without the patch on the other hand.
> 
> Not sure about the issue with Kendryte but I get a crash on
> QEMU virt machine without this patch.

With this applied in addition to your patch, it works.

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-
clint.c
index d17367dee02c..8dbec85979fd 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
 
 #ifdef CONFIG_RISCV_M_MODE
-u64 __iomem *clint_time_val;
+u64 __iomem *clint_time_val = NULL;
 #endif
 
 static void clint_send_ipi(const struct cpumask *target)

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
