Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E7C46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYH5g5lhErVnRpP+FICOHqv1EBMo4gnwLeLEAda7ZCM=; b=X883gFu/d4VzjN
	dJVTjZBay0RCoE/cyU5LQFd+Dyv+AvzoKs5FlpzRf8oYq6VzQlA3RG0ZoXSZmKr3FaaewmW2ex/dI
	PUEUAq8NETILklordFpUzJClxng+Q556pSgGGAKZKxfyXMrJM8VfJnz9BoQug0/y1wjiNIK3sK4eR
	EVWS93rG7Ullof+u4/1ibWFu9++00HmFLYdF3kXQv8uGv6QT/bSbJQI4GNkCCDfDdMUi6xbjfOYnC
	VFuDLMmFGf9A4dyxQE6TLXAZym/fB/tl1LSTOI88SVvw1wKgIfjb5JWkIAh5uc3mT9xr9LU4Aghu+
	zlQ8kFxT6y/Qhnu+l4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCc8J-00HaUd-VD; Tue, 03 Jan 2023 07:54:52 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCc7a-00HaBB-Q3
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 07:54:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7023624E0FC;
	Tue,  3 Jan 2023 15:53:39 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 15:53:39 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 3 Jan
 2023 15:53:38 +0800
Received: from EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c]) by
 EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c%15]) with mapi id
 15.00.1497.044; Tue, 3 Jan 2023 15:53:38 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ley Foon Tan
	<lftan.linux@gmail.com>
Subject: RE: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Thread-Topic: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Thread-Index: AQHZH0BUA1ZpH2MfF0y2uzSNVn9yRK6MUX9Q
Date: Tue, 3 Jan 2023 07:53:38 +0000
Message-ID: <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
 <20230103065411.2l7k6r57v4phrnos@orel>
In-Reply-To: <20230103065411.2l7k6r57v4phrnos@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_235408_398684_1931A451 
X-CRM114-Status: GOOD (  22.31  )
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



> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Tuesday, 3 January, 2023 2:54 PM
> To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>; Paul Walmsley
> <paul.walmsley@sifive.com>; Albert Ou <aou@eecs.berkeley.edu>; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Ley Foon Tan
> <lftan.linux@gmail.com>
> Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
> initialization stage
> 
> On Tue, Jan 03, 2023 at 11:53:16AM +0800, Ley Foon Tan wrote:
> > topology_parse_cpu_capacity() is failed to allocate memory with
> > kcalloc() after read "capacity-dmips-mhz" DT parameter in CPU DT
> > nodes. This
> > topology_parse_cpu_capacity() is called from init_cpu_topology(), move
> > call to init_cpu_topology() to later initialization  stage (after
> > memory allocation is available).
> >
> > Note, this refers to ARM64 implementation, call init_cpu_topology() in
> > smp_prepare_cpus().
> >
> > Tested on Qemu platform.
> 
> Hi Ley,
> 
> Can you provide the topologies (command lines) tested?
2 clusters with 2 CPU cores each.

> 
> >
> > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> 
> Fixes tag?
Okay, will send out next revision with Fixes tag.

Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot. ")


[...]

> >  arch/riscv/kernel/smpboot.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index 3373df413c88..ddb2afba6d25 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
> >
> >  void __init smp_prepare_boot_cpu(void)  {
> > -	init_cpu_topology();
> >  }
> >
> >  void __init smp_prepare_cpus(unsigned int max_cpus) @@ -48,6 +47,8
> @@
> > void __init smp_prepare_cpus(unsigned int max_cpus)
> >  	int ret;
> >  	unsigned int curr_cpuid;
> >
> > +	init_cpu_topology();
> > +
> >  	curr_cpuid = smp_processor_id();
> >  	store_cpu_topology(curr_cpuid);
> >  	numa_store_cpu_info(curr_cpuid);
> > --
> > 2.25.1
> >
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

Thanks
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
