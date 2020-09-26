Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5D8C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:26:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AE52076D
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 09:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LXxNIJEu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BQpfkfnB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="U8uo791Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9AE52076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yUcgLGwqt5MFXhiB4o/GWwUy3smj5MIAiiwTbWpmxMs=; b=LXxNIJEu6sdL5J77Jg2jfQkbP
	gqHmHDzdp6zMEkrzV6wYlfs9N1n7hXcz8ODZqPMPa1GNX6wii7CwLa+LVxMN0rgA0HYVEnaVxOPOG
	+h6+brrlrNkGOiZpkI8VzsxBrKgOAV37tQ4DekLkDylLKXkC4ARyl35skmCAZigZmU9X0tz9uLFrH
	9HQcKEUd4KubPbl+VIVmrUvCPQx4+8ihm8l32iaz8ZV1qvBIy/QHZcAi/cmuewyissjJNmDcQiM/I
	P2M2ffgEy2Pz8k5pcLvp5En0dxwgo91jvr486m5vPNQBYaoqZ8kqtLaBOfwGTYCxstNR4weYFdME+
	J8LHpPD3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM6Sa-0004ag-4Z; Sat, 26 Sep 2020 09:25:40 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM6SW-0004aH-No
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 09:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601112337; x=1632648337;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x/1g18k0KP6s02Yc3v7a7SWPdZ/LjQcuMc3TOCrVK2Y=;
 b=BQpfkfnBWwd3U6BAeeHAlfKtQrIHdYewn/bfF0qv2F3QE93QBNTpOI80
 QoNE13Zkv/JjqgWo2c2DNgc6IA5lcWmkVyR1GzLjcQ+h0sKXsLylxWiSA
 xFoX1dm4Wz6hg16wDwn5865OQS2TNWsNF9htXvFpkcqKumNQxDl2FF9Zi
 IJKT6ueR0Gj+cWJc1yzXc//w6FX67v5Lmit1lqOYiq9DgoNu52xyEgsjj
 Ot0A1ESpHUqqB0HstaJx7G+dSUdaA5QNmVbq4aktbff4RMJW2FUgNHEJ/
 O10Vh8ez8khQO4haonvnb0zvN8pmkfPeu376jr53vPdGRUeys1nnNCnUZ g==;
IronPort-SDR: IVBb45TCeQK/hX+5hCH/dfobAwi78m8xAgoeMtZLshJNDe3nCijPB5hksRSU7rHAzD6tv7trHA
 sCaEgiZxX9eFthwcVY0UAPUHZR5zm3n6r1K2OCQ/8g8wVrTWcu8K2vaC66ngXh4dj6rkvC5JDj
 ZRTj1A47e78B1cRqKLh2YrskLXJlW2UkRK0R6zppPKfGzR0j+b5q5b5zznZRFp8Ko4i8409iCa
 MtbLax9veHb7DMSQqLC5OoCc7DR8KsMP9p96r6z8TbbU8k7Y5jhH9f7+bgpnJsO8yGm5MBwXmA
 lH0=
X-IronPort-AV: E=Sophos;i="5.77,305,1596470400"; d="scan'208";a="149555784"
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 17:25:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5tTF3KHlSEbplLsjDOnjMDbsGZOXNp/nBOR32iNfrN5Te+x6Xpv0GrrrfTCDmd2mjhcJ9TDxoFEpiNsGBZpP+VkbIDh6gJBeb6p0OeEupPwiflwNZfKkP3jwkSB+yFUuUCZQfKjgRG+w111m6i62768n+ioLo2xFrwAH5nC3r/p+GJUiuuGGPGNVSaZbNo+1zqaFaEF6pVTZQh+TWRf4lheKYS7iNSUesMGYmz3U10x305R7u4EUIO1cccgSJMktWiQPbsxtMtf1iLZuVuMN2DBEEBINMvmIFhbSqX6yudG5WYNGN7fMmGhNxFzW81NoPnP/hUHPTcKSSN0SEvurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/1g18k0KP6s02Yc3v7a7SWPdZ/LjQcuMc3TOCrVK2Y=;
 b=OI5Z+/0IS5ER6+uiHIwG9TY+Bge3YhLP+vDYQ0okKLse9dBm5QCsAyKV2oE0e0LTCVQZ0jWv+Px0rx7vIxRAJPKHS0/Eam7HBLvguSonOT+3J8FqydXPqZPFD+ZBUJ9/tu4/IQ1rr3CCvs4tmu+IBKMejM847PMfYo9QCbwMJflzsgxokz8sXTCEdDyOnRW48u04NEGHOTpJorvSt/iGkOhGTH7NM8AeBiYZ+n3/WSFVuxl8J2YDFKTSS7LOdw8VRWo2rz7d6ZcBnEFGiO1tm5Kd4btvOFtW+IysL1gWAiiXL1r+g1lc8neXtyrblLyl0Zg6aWGMNnbWoK/KTvaWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/1g18k0KP6s02Yc3v7a7SWPdZ/LjQcuMc3TOCrVK2Y=;
 b=U8uo791QMM7n9W+JRpU1YnOSZcaFlEL+Bv5+NbIY4kqctvjC9rvS2SLrS1A0QbMbG/BXWjVmeUse++I+Kdsw4EdhRWwv46WcA3GFisKtxENDgDfkclBPHCarfbcpaPCIj4F9kpujfZ6hAedow7tSodfygJBU89jekTUlFb/M4HE=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0377.namprd04.prod.outlook.com (2603:10b6:903:b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Sat, 26 Sep
 2020 09:25:30 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3412.024; Sat, 26 Sep 2020
 09:25:29 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "palmerdabbelt@google.com"
 <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] RISC-V: Check clint_time_val before use
Thread-Topic: [PATCH] RISC-V: Check clint_time_val before use
Thread-Index: AQHWk9aYSJLcKwhKG0OB2/Vy4ql06al6pkQA
Date: Sat, 26 Sep 2020 09:25:29 +0000
Message-ID: <1ee25b9bca3956d15a4a0dbf83f43d1ead454220.camel@wdc.com>
References: <20200926072750.807764-1-anup.patel@wdc.com>
In-Reply-To: <20200926072750.807764-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 4ad41837-9687-4f3b-50a6-08d861fe1c66
x-ms-traffictypediagnostic: CY4PR04MB0377:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB0377D1FE9ECCF54D3718AF20E7370@CY4PR04MB0377.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qwZ7qGb1Q4qweO5I+pLeV3zFWBKeWryRx6NVQ0s+AMEYvKoyqSZwU3S/k0iFGUo1cab0aFeOLwSYgA6K1E87wXiiGZJoX4LtD+6eUwTdUl1W1NCtvvwKH5YEyxKcG+e4OysQ7C5ouPKDW0m0QUYGR2nJMolSba9un1NyGOuf5P5tHERi4njSGpbO/axlkH5yo7wfuRJI3n7paYm/PP7BHDbbhrDAw3x8WyG7pZem1gDlpX/Cm5c5cB1UD8M/snCY+b/UGdJnT1gKFxS8i1UF8LnwlFXhDKDSky5hW8E5Zbz3p/DcuPdoj30/WToNTEqWWjcgRgqU18ivXZk8zEICpnopyRkBg0j2uvw1j63rxjS0DNVyZuA6qFjdbpY73nPr
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(6486002)(76116006)(83380400001)(71200400001)(64756008)(6506007)(478600001)(66476007)(91956017)(66556008)(66946007)(66446008)(4326008)(6512007)(54906003)(2906002)(186003)(110136005)(36756003)(2616005)(5660300002)(8936002)(86362001)(316002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KRO+CpZM9B0Xx13pnlQ2GhG9WzCwMiPcZ6FN5YGkyD5VYHZLA2W+bLIyIqCMHT9s9sYfouezvRRniyynPj7tcRWzq8RALi6Jm/1c9dURg7AXtbdq6HlBH73+NxKWLtzdJCNidACAAo7Er1rwuHIbAP4SlRnyDwU9XHsuL93iA3CSvbx7QVj+jfvAGwdZq8gV/fukPdo2HxaeFb6kmh0eNp2s380isfjmG6UYnEuhwF5ke982tzmLeLqwRXYYF+rM812z0eWMjzt+R2NHEvdRZp4Z9y/CamB0Lv/ZREeQ5bOV9x9Y66rgK0dg7fM9NqR72XjJTriyJvgdU0z0hG7VXdAFRLQ2+WDGSWOLbLwT/0wGUnojC8wt5vaPGgkppz+70lVAOxCXYJ0GC1+blvEfU6nylTs8S5m2KrPcc7aadXyPgyVi+oIK48tn/pCbVuhrH/6lfXPETGeQXK9lNdE6GoAmf+mkG+x2YNKCgOv8vGpo+vBY1wPJw1pX8oXpjZK4JmupAcceqE5PrJ1ZYBz01Z6OEU6Ld4KO4NOA50S6uAwRwz1PTxe1qvK2BdPJ6sW2fNJ8zcf8YIlpYs7wjbqEO+TqP52dJ9EKcl3qWL38Urk1pStP+LKq21bgcriqI+nAzBi9B/WxehUWr3zCpTUZiWLucEoaobNq6dk9b5kD8LUMNT6iryNFsxAAbBv5u5jwKcr5nfeIKNIeJo9dxGz8mg==
Content-ID: <5016A745084CBB4EBFE61EE7EA0C8D2E@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad41837-9687-4f3b-50a6-08d861fe1c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2020 09:25:29.7280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hLOOvnNK3B6imgiN1+EUfQS6/4nj44Z8HlYQcPFHJWEZ612TYmJT+IQUKfYgoBLLr3Uis4HF2Q+UQhCYVawhCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_052537_066445_222A42DE 
X-CRM114-Status: GOOD (  22.10  )
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

On Sat, 2020-09-26 at 12:57 +0530, Anup Patel wrote:
> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> because the get_cycles() and friends are called very early from
> rand_initialize() before CLINT driver is probed. To fix this, we
> should check clint_time_val before use in get_cycles() and friends.
> 
> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> for M-mode systems")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/include/asm/timex.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index 7f659dda0032..52b42bb1602c 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -17,18 +17,24 @@ typedef unsigned long cycles_t;
>  #ifdef CONFIG_64BIT
>  static inline cycles_t get_cycles(void)
>  {
> -	return readq_relaxed(clint_time_val);
> +	if (clint_time_val)
> +		return readq_relaxed(clint_time_val);
> +	return 0;
>  }
>  #else /* !CONFIG_64BIT */
>  static inline u32 get_cycles(void)
>  {
> -	return readl_relaxed(((u32 *)clint_time_val));
> +	if (clint_time_val)
> +		return readl_relaxed(((u32 *)clint_time_val));
> +	return 0;
>  }
>  #define get_cycles get_cycles
>  
>  static inline u32 get_cycles_hi(void)
>  {
> -	return readl_relaxed(((u32 *)clint_time_val) + 1);
> +	if (clint_time_val)
> +		return readl_relaxed(((u32 *)clint_time_val) + 1);
> +	return 0
>  }
>  #define get_cycles_hi get_cycles_hi
>  #endif /* CONFIG_64BIT */

Applying this on top of rc6, I now get a hang on Kendryte boot...
No problems without the patch on the other hand.


-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
