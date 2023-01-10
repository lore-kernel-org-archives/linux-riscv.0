Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC3DC54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bK6uIG5N483nAIG28BeSh9fAwcFROoX11ArKdhuv2jU=; b=QOrwuwVq3wwXtv
	+1WhSugcovGbrSsfn0/pAm2T5RhnYq51Q2ku2NviKGMOzi5dWHwfbLLjvfD60PKxtmgusw/7bGk7V
	J07WZ13Fl2VTJ+6kahUl0KlVSaIAWf3f/LmvbZ1lt5a5Ee62oj6BreNo+7+QGljStVkQrsihKtiYY
	oxRk+maf1AokmYclpreixG7amO98IkfrwlanH+pOu4mYbbob60kI85tc0D0nzJ2pox4ABw+YWgbF7
	4p/g2XFW4/za23ZxgxKl7GtNZR+JZhYaR7qruUhOVLA8zGLSNSH0xADMFdTME3JwfwbJVdvT7vAVD
	5wtJ4XWWnyVHK+D5TuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFG2a-007QOC-BA; Tue, 10 Jan 2023 14:55:52 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFG2V-007QHL-TI
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 14:55:50 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E4ADD24E154;
	Tue, 10 Jan 2023 22:55:20 +0800 (CST)
Received: from EXMBX163.cuchost.com (172.16.7.73) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 22:55:20 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX163.cuchost.com
 (172.16.6.73) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 22:55:20 +0800
Received: from EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c]) by
 EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c%15]) with mapi id
 15.00.1497.044; Tue, 10 Jan 2023 22:55:20 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: 'Anup Patel ' <apatel@ventanamicro.com>, 'Albert Ou '
	<aou@eecs.berkeley.edu>, 'Paul Walmsley ' <paul.walmsley@sifive.com>, JeeHeng
 Sia <jeeheng.sia@starfivetech.com>, 'Palmer Dabbelt ' <palmer@dabbelt.com>
Subject: RE: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Thread-Topic: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Thread-Index: AQHZIcK6ZsWD3JJ42kmqEJAMT7JYfq6Xwm3g
Date: Tue, 10 Jan 2023 14:55:20 +0000
Message-ID: <739948a9f799485da88e0d7ed9f956e8@EXMBX161.cuchost.com>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
 <20230106113216.443057-2-ajones@ventanamicro.com>
In-Reply-To: <20230106113216.443057-2-ajones@ventanamicro.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.49.44.179]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_065548_233455_7F6E3D0B 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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


> 
>  source "kernel/power/Kconfig"
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h index
> 4ca7fbacff42..9834ba4ce3e4 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -29,6 +29,7 @@ enum sbi_ext_id {
>  	SBI_EXT_RFENCE = 0x52464E43,
>  	SBI_EXT_HSM = 0x48534D,
>  	SBI_EXT_SRST = 0x53525354,
> +	SBI_EXT_SUSP = 0x53555350,
>  	SBI_EXT_PMU = 0x504D55,
> 
>  	/* Experimentals extensions must lie within this range */ @@ -113,6
> +114,14 @@ enum sbi_srst_reset_reason {
>  	SBI_SRST_RESET_REASON_SYS_FAILURE,
>  };
> 
> +enum sbi_ext_susp_fid {
> +	SBI_EXT_SUSP_SUSPEND = 0,

Macro name with "*_SYSTEM_SUSPEND" is better? Avoid confusing with CPU suspend.

> +};
> +
> +enum sbi_ext_susp_sleep_type {
> +	SBI_SUSP_SLEEP_TYPE_SUSPEND = 0,
This should be SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM?


Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
