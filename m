Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BFDC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 12:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQqXTH713t4Wol5G7y6RgPS0bARY0x26GTb1u1j+5xM=; b=Iy20jsL/Dyw5Ar
	JeCOB6aI9R3Wr6tmBelzDDaKsNd4uwqnvNM4e//uAi0dADKKWS6a+1YpDNQsi14Ru+gqP5LHAmJd1
	qVkZP6aVkKN+jbE+kus8Y2XgCKOoRIDJjXYI/CB1OTi+NA2s76kZ/+VKy6LeB40U5m6co37dyLacL
	sEPcvss6I2L+hl94OUjNyx/bXp9PXGWR19Q9whayYPtase3R0BRwbPh8oiRNzjfi/ELRURbezX1RW
	VMgwlJKQgaw34tpC64kOg7GqmV+ItUU3bBGYR9kq2/+ju8qWHm4XQM7CTlObu0p+5xAX2T8zaarFy
	XKdhLo/Hv0IV+RZNvZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzzQJ-00GI38-2O;
	Fri, 19 May 2023 12:41:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzzQI-00GI22-1q
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 May 2023 12:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2sq4W/rCODeNJNUA/WbupX9JtJDXNH7vFoMEk1jd3fc=; b=rNX39F9sfQH8mVorMBYaNbq08F
	3qYTpTEf5rYIUI39opE4Vt5F6sjXFL//7XQryVQzPhvnl0nCbKGIMa64ZMdzUWW/7p3UasXGEvOtC
	o7wwLFZ381aeikueAMkg6jBbTh1KM5u6XPqlbgyaQeGDVAvXmff5y5F12KbWUMDyQe727uCA5dzF0
	SEAOXB6yDoTQ/WIQ/r/r9yVCNgmZoGHXEKD1ycyd7MN2tkl707KeYAVlEXl63KUU87YGAv06E4aYQ
	dMlYJf01w7SWU5g+pfyKwHJmthmssAwlHRfzYBLgL2sNGptalYonbZvRss+v0VbxGRc+mlHzr1hic
	0CVqMv4A==;
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzy4r-00FsCl-2m
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 11:15:21 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F0AC97FFB;
	Fri, 19 May 2023 19:14:27 +0800 (CST)
Received: from EXMBX065.cuchost.com (172.16.6.65) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 19 May
 2023 19:14:27 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX065.cuchost.com
 (172.16.6.65) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 19 May
 2023 19:14:27 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 19 May 2023 19:14:27 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Song Shuai <suagrfillet@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Song Shuai
	<songshuaishuai@tinylab.org>
Subject: RE: [PATCH] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
Thread-Topic: [PATCH] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
Thread-Index: AQHZij0JnSRR82RN7UivChxgOm4HvK9hcVtQ
Date: Fri, 19 May 2023 11:14:27 +0000
Message-ID: <9a274a44b61345e8aba747a44250c4d8@EXMBX066.cuchost.com>
References: <20230519102908.253458-1-suagrfillet@gmail.com>
In-Reply-To: <20230519102908.253458-1-suagrfillet@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.16.6.8]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_121518_319198_E6E674EA 
X-CRM114-Status: GOOD (  15.36  )
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

looks good to me.

Thanks
Regards
Jee Heng

> -----Original Message-----
> From: Song Shuai <suagrfillet@gmail.com>
> Sent: Friday, May 19, 2023 6:29 PM
> To: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; suagrfillet@gmail.com; Mason Huo
> <mason.huo@starfivetech.com>; Leyfoon Tan <leyfoon.tan@starfivetech.com>; ajones@ventanamicro.com; JeeHeng Sia
> <jeeheng.sia@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Song Shuai <songshuaishuai@tinylab.org>
> Subject: [PATCH] riscv: hibernation: Remove duplicate call of suspend_restore_csrs
> 
> The suspend_restore_csrs is called in both __hibernate_cpu_resume
> and the `else` of subsequent swsusp_arch_suspend.
> 
> Removing the first call makes both suspend_{save,restore}_csrs
> left in swsusp_arch_suspend for clean code.
> 
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> ---
>  arch/riscv/kernel/hibernate-asm.S | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/hibernate-asm.S b/arch/riscv/kernel/hibernate-asm.S
> index 5c76671c7e15..d698dd7df637 100644
> --- a/arch/riscv/kernel/hibernate-asm.S
> +++ b/arch/riscv/kernel/hibernate-asm.S
> @@ -28,7 +28,6 @@ ENTRY(__hibernate_cpu_resume)
> 
>  	REG_L	a0, hibernate_cpu_context
> 
> -	suspend_restore_csrs
>  	suspend_restore_regs
Good catch. This function is invoked twice to restore the CSRs. I am good with removing this function from here.
> 
>  	/* Return zero value. */
> --
> 2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
