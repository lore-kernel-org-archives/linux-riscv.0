Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF526C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMO+ZyWiUgoWM1BuPm6P+F6V6NG0gOkHpTfM6JkCyTA=; b=0wIYAI44irXpFF
	+d31VxE3mvjziOBZQR0i9O1GOkjxCx7RU8S15afqMe4RqatkRjg8VeAcYdPW0QDY1URCoaSM/J+JQ
	dlEi1+gWpOUz+QBvKeSdDJlPQX61qlxuE4bFcL01HyxEeXmYwRBobEPzJ+WLeB07WAX7SyIrS72Su
	IQTZPavnF3d9mU1xKJNGVjjB08XFHvcMOF/bM3NGZ3HdpXItcqHDglLkAqxZmnjI2GFndPBahoiHj
	4qBQducxs88gWnUzY4HzerXcRea3XjkPyS7uu+ItF7tBm1UeWoTIKWXAAa/5DPCxzye+67YCjrcjL
	uUPj6tliiF19W6B+xgWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVCb-00DlhT-Il; Thu, 05 Jan 2023 18:42:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDFKr-00G1DH-6p
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 01:46:46 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3ED0124E0FC;
	Thu,  5 Jan 2023 09:45:58 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 09:45:58 +0800
Received: from EXMBX161.cuchost.com (172.16.6.71) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 09:45:57 +0800
Received: from EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c]) by
 EXMBX161.cuchost.com ([fe80::f152:b9a3:2243:db3c%15]) with mapi id
 15.00.1497.044; Thu, 5 Jan 2023 09:45:57 +0800
From: Leyfoon Tan <leyfoon.tan@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ley Foon Tan
	<lftan.linux@gmail.com>
Subject: RE: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Thread-Topic: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Thread-Index: AQHZIDyGA1ZpH2MfF0y2uzSNVn9yRK6PDhHQ
Date: Thu, 5 Jan 2023 01:45:57 +0000
Message-ID: <bfd9b5ad438d43c5b44efe5c2ebf5d2e@EXMBX161.cuchost.com>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
 <Y7V4byskevAWKM3G@spud>
In-Reply-To: <Y7V4byskevAWKM3G@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_174641_014318_D38A9125 
X-CRM114-Status: GOOD (  17.29  )
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
> I'd like to suggest a change to the commit message:
> ```
> If "capacity-dmips-mhz" is present in a CPU DT node,
> topology_parse_cpu_capacity() will fail to allocate memory.
> arm64, with which this code path is shared, does not call
> topology_parse_cpu_capacity() until later in boot where memory allocation
> is available.
> While "capacity-dmips-mhz" is not yet a valid property on RISC-V, invalid
> properties should be ignored rather than cause issues.
> Move init_cpu_topology(), which calls topology_parse_cpu_capacity(), to a
> later initialization stage, to match arm64.
> 
> As a side effect of this change, RISC-V is "protected" from changes to core
> topology code that would work on arm64 where memory allocation is safe
> but on RISC-V isn't.
> ```
> 
> You don't need to use exactly that, but with something along those
> lines:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
Hi Conor

Thanks for your suggestions. Will send the v2 and update the commit message.

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
