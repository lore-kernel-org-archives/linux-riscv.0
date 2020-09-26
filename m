Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D174C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:31:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA4F5238E2
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:31:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IYjanknW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YVUMSV8W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="eAkviBZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA4F5238E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xO7OmJDxmuIO89GvIREPca4yhIz+mP7iIcq9ZrODOZk=; b=IYjanknWeSoL1TPpiAZB7fseb
	dZc7MbbBb/uemAXvpRXGtjKMtywyU2ZyI/+wAvkB0da6Yf4GZCNB8/B7PfGOeh3iHU2vruy/ciHUY
	SnL5OJKnZ5r6QV+Vvqs6zOPp88DZj0q5cnqOvG0p8F4iBJ5AIC4tEqnmsvIPlX6YaD1BQWri82/UK
	EamDMG6NwU/CGmAlZT1UfveTyLINiJir0SkZmZ/VpP/zFUeDZuzJxbRLUQK2mWVm/8AOgXiGdOc6x
	HJn2dD4XjYFZ6dm1t9MioAB9zoLzE1Uj62rKOWil5LcGYchLOEDqB9vNXvs1yZbRw4gJGgWTDq0jn
	F4cMX/vZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM7UM-0000F5-PP; Sat, 26 Sep 2020 10:31:34 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM7UK-0000EA-DH
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 10:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601116293; x=1632652293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xhORag1YPWed45wSVhujbLKlybpepoW4rfY7VwIlpSw=;
 b=YVUMSV8WDQXAd0Ky2fbmQM1eYsNDGn/CXZP48k5zIScpAfBTfiyanCuR
 +dt/lM35BlJD9u2vDUVQe+Dr+pEecatbf5nePbmh5YqAQPkaa5VDHIfO/
 cWwMnUo6RF/1Bb1Pw9L0zLpu00eYNQEAFrsK3gHrEWk50Ejqop+/wtSpQ
 /LVdlIoRLk3JhpaYSmQYG7m9mga3NOIbDLLB8ZEIykorS+weWzDzT+PTS
 tc2uCrijylKL7QpD2JvW8ooRseRvllTRHfjm8g/JAFkx4SXvBZHYE4DCj
 d4GlqLVthpf253GJNPwKQup7C4E3Al1ODrlZP7nLXYwGKZoUgHFCo8G8o A==;
IronPort-SDR: ZHd6DDVZLrAwecLG5nOmkUf7ojotxS7T4OuVp26ZT7LTb3PpZhyyycmLLs/nAMrARw9a6f8d9g
 SqPs2v7WN19lxgQeqNbFC8JolUwoDLE5YCDj/hVd1QAc9ZZWUQB5dZFymBL4DxUSl+hiSNzfV2
 PpY6ACHKg4prlo3DxUqSSwvQkJQ3u0L7sLTgds/YI5oWw3VNsA8XzDlavkNNFb+PXEIqspjXUN
 xmZbHAQdVE0xUEwEb3QGKypIoAVrS3VZyyDCRGUpUlUin6n9KZlVtGdLvI3bqQRmuKoCzUL7BN
 9nk=
X-IronPort-AV: E=Sophos;i="5.77,305,1596470400"; d="scan'208";a="152703438"
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 18:31:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSKhCIpCQWB44uxF4JOU3eFtpn6Lsxdo+MEYrgjMGfUSXQwi0WdqtWQ2H2obj1hcM15yeV6OMQvvsBV/QoOTMmZQGDeE8XjSCm4Gtj/LYYUerrI9M8xRrqj78LVmekL8f5eEb7DPQLWDZw9jD5p7WJ+DVz0PlaCk36ZQGb1n8/OKM6O3YPqvpKjEeNa0CCdxvfoPEqo7AzcrR+pt7cvhOoxI2z79tI1TOVD0o+bFGXgwbHUQ49K/A76JRvQ3HSpL2UO8zqkscqVSonmrsrySDfTitdOoao8mgkK3J3Nm51+NgNYhwDierql9k8Kcz4W9TBD+kgCZW3i1RkJn528nig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhORag1YPWed45wSVhujbLKlybpepoW4rfY7VwIlpSw=;
 b=AMjxnb0Za7y1jFyQYS2w2KG/HjraGC1Tmtl1bA/xkYr/qzfnIB/2BGgw26KwHUbuubztLpqacMunBMbf/JVWroiMPGwdRqusKX1lopB4bPFVbWKsMrP2kZYhlJQuYT/gdApbwq/ItNW6DiqNHGW7VdRE0+yE4thzR6kwjAbnn65TpoFRwQnkSWb+lN03bSVZWMxYDbg2P9JnJYE7MTPWOZtIdwKYO4KakG07OWXHuiaQxhqqEhPqMNYQ7MG/PQPsjCdhngTzlr3f1oO+2pLOTmzZtFCv4x4Quj8mVoJliCqb5Q5MIku8A+0cSR9RJLts0d6YQL8VSgCyn2kPu2asNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhORag1YPWed45wSVhujbLKlybpepoW4rfY7VwIlpSw=;
 b=eAkviBZ//0JY5DCYS6b/IfsQX1lcIjdEzY08lQsshGiMkEj6ENFrnHLarPdUQmcGE3UG1SqilK+N0dMf5t69rUuEexn2/SVZlTGXOCvel+YG5qYKQKkvCu9KfJdEfoA4GPXBdILF38IfbFkTptFBwF7KAfQp2XTDfWJbuBgqhCY=
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
 by CY4PR04MB0374.namprd04.prod.outlook.com (2603:10b6:903:bb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Sat, 26 Sep
 2020 10:31:29 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
 ([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3412.024; Sat, 26 Sep 2020
 10:31:29 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "palmerdabbelt@google.com"
 <palmerdabbelt@google.com>, Anup Patel <Anup.Patel@wdc.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v2] RISC-V: Check clint_time_val before use
Thread-Topic: [PATCH v2] RISC-V: Check clint_time_val before use
Thread-Index: AQHWk+71H95SGo2V/kutuSpuNsIDwql6uIQA
Date: Sat, 26 Sep 2020 10:31:29 +0000
Message-ID: <4950cd11fcf66bc3606f309d6289577b5dc65b2e.camel@wdc.com>
References: <20200926102158.828461-1-anup.patel@wdc.com>
In-Reply-To: <20200926102158.828461-1-anup.patel@wdc.com>
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
x-ms-office365-filtering-correlation-id: 3cd3b59d-cfaf-4f3f-5403-08d86207543f
x-ms-traffictypediagnostic: CY4PR04MB0374:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR04MB0374F274A95CF0FF3F14EA7DE7370@CY4PR04MB0374.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i66mQhETf45aiaZg7URva7hnWbFqyBPXUBDsD1dm2zDkvZX9GZe00kBmL7JawvvmCl3aXd1lQr/Yqh/dKPXxV2w2iNJmhV+zFZlm+xA6IOH0/uSCDRKxIinlv22KE//ZszCVHso8lGWzPRHzlb9rS/yxRcqaengRuv1wyc+jx0iQybzzFyk+/XLcRvSmjoKsaqKB6o9b8sH3Ieb2Mgy1HLNEEhwU12OzKIuJ8Kq94M2Z3DV5gWD1+ARj9idOuQbEqE8Mf0ufAGmO0NtgTwf9YF1Mo/7Pbbw2EEFGKqlVWQfwapSnrm2kOWpB3ItTw7X+midJERIwl5KEu2tgHZ2P/rUEc9nfZkIaAUR20PzJWiFKqX4+sS8T+8PQ7NS2RKfM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(71200400001)(91956017)(76116006)(86362001)(2616005)(54906003)(4326008)(110136005)(6486002)(478600001)(6512007)(5660300002)(66946007)(316002)(83380400001)(8676002)(66446008)(6506007)(66476007)(186003)(66556008)(64756008)(8936002)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: AxDvdIdeVB0tFAVdvayE0t+QDqCOK4Oz7uwcPgFA/g4tljK59URmpDePQwKMu2Pt1nRkb2oItuk1mJYsaIPf/qLsO595b0oUrX2dqqS+Hb1v29RZqxvlxQWxo5t1rKbHs73HMTpw2PuHNWTuqvBp8OCMR0sRsyi3fax43b79cs/6+TOYRX0NsWAUULH2tSC3SzK5o0aww3QMHqHFgaqE+1Gpp7kdh66rlkS3YWFzIY4ogPeBmI9nh6aDYeQrWG979xkTz+Jy3sBX0fwK/0yZgMGQCI2vCwHZoZ0Uabmd9PvfydF11syKYsU06nY1U6LqZvOFEgyO1mSXitIWOQnZdb4ht6TOGt1BvQKlCTL8BcYQg2cd0uszGGQLBEBV9lwbdudWLc/a39SG9ptg3t1lzYZ+gBkqI8XlkU0/tMX7Dc6fddZ1l+nZIvcOyDK2rgOcGGAreKlV/vkwNnDaPz0ZUe9C6osxzZ9PmxPgyFk+Gl6vs51Y0ctkfgh08d6QdMI7nTIFRK57JG2rMVSvfTkyDFWD+dLRn0o4p/fURBtECDmRWKKVh/jgOv/8aKqjCeTcanHmv2SESBkucxUkW1pZ4PCi1ciJoWPLQ61PQh4WgYzCoLsk7OL5aYO4lRx0WJm8wns6URVzzI+zTpJMcyjSVQh9cGnoHDSeNqqDu9Fna9N7SMdZH1Kpb3iDiaay1inRSTxArUZ2SmhAi+fYia/Trw==
Content-ID: <2089336F1208AF429C9A44A5BB755997@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd3b59d-cfaf-4f3f-5403-08d86207543f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2020 10:31:29.0134 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJWSl6n/zx0/r8Jpp/LCLfo7Xs8+N/Uuc4oZZHK7d5rV9gllCscp3LKXV555dl88YNI6mCoXrxIRi7R3J84+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_063132_678793_8FD106D1 
X-CRM114-Status: GOOD (  21.63  )
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

On Sat, 2020-09-26 at 15:51 +0530, Anup Patel wrote:
> The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
> because the get_cycles() and friends are called very early from
> rand_initialize() before CLINT driver is probed. To fix this, we
> should check clint_time_val before use in get_cycles() and friends.
> 
> Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
> for M-mode systems")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v1:
>  - Explicitly initialize clint_time_val to NULL in CLINT driver to
>    avoid hang on Kendryte K210
> ---
>  arch/riscv/include/asm/timex.h    | 12 +++++++++---
>  drivers/clocksource/timer-clint.c |  2 +-
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index 7f659dda0032..6e7b04874755 100644
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
> +	return 0;
>  }
>  #define get_cycles_hi get_cycles_hi
>  #endif /* CONFIG_64BIT */
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index d17367dee02c..8dbec85979fd 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
>  static unsigned int clint_timer_irq;
>  
>  #ifdef CONFIG_RISCV_M_MODE
> -u64 __iomem *clint_time_val;
> +u64 __iomem *clint_time_val = NULL;
>  #endif
>  
>  static void clint_send_ipi(const struct cpumask *target)

For Kendryte:

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
