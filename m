Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92718C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ef++GPVwl8UgSILtzaCTQYFoG+ZXL++p4sBKUsd/x48=; b=GzrWEca9GBfz4N
	i7/rpuaVEkZ0witgdtY1VqzptOnJRnEqZ7gaXH8uwhqzfwkzRqK6DPBcl57j+dQ4bE8r8GpwJLRwN
	vMQC3GKDG+ehVIowDIOyRCLQ5HvqODMjjR8SmAZV6CqYNDXmW73nH+Hs26S2/aB9OwrT77n62eGA6
	d8fL44k+1XaTPr1WL4WKQJfFGdVruLpuS/8gQM31DU2VBe26amZAJS44J69Eaqy6p7Ond2N73kbmz
	f+6yC4vcD4YUOOGjwoHADaqqbps2zK+SJdf4R3baKb8GhUYtE02dPgoxdhKVEMPsjEwzuzeg3kZIa
	qhgnXj9g1BQvqgLnsueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8X2-00766e-98; Thu, 24 Nov 2022 09:28:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8Wz-00765I-HZ
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669282109; x=1700818109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LUokDyXQ5ExiyeCZJMF66xAlop2/Sr5qt8SvDLkcOLk=;
  b=2E+qU7gbfypE92ibb4KvDO5BIKrZZlkpVs9Ko0j1snPTOhRaViw5nQM9
   11KSICkY3Qi+Gu9JjXI70UWTLBdKhrDEuZ7ADhy6DI5qxhoC3msV5bnMn
   713SzMJoatAI1sph/nHMbf0DO4d5kbwAqa8l1g56SKp3u8z6Vy61mMVyw
   fXNyE4RXfXPVj525oD7Tob5Z4F3GPLzAfgSj5xXvDaLqis1wijyasbVc+
   2GjVoB8+NQGvSGF8s4Tb/abJBgv+V+WmObbnKNbbc2BrFtUZa7ZLlNzlX
   4lJZcSSaTaTI2TC1ZNMA0o6UzrbJAW0fPIX3i6rcwf4fi6jmxSMd/x8n0
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="124924007"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 02:28:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 02:28:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 02:28:25 -0700
Date: Thu, 24 Nov 2022 09:28:07 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Walker Chen <walker.chen@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	<linux-riscv@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 3/4] soc: starfive: Add StarFive JH71XX pmu driver
Message-ID: <Y385J2m5YByyAz0g@wendy>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-4-walker.chen@starfivetech.com>
 <CAJM55Z9jfpOW49Z5cdR18T0w4Ae6CQAYF-AsCD8eOcPczwgoZA@mail.gmail.com>
 <6303c341-a691-fd52-2861-74e9d3ea09c9@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6303c341-a691-fd52-2861-74e9d3ea09c9@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_012829_672492_FF9D2461 
X-CRM114-Status: GOOD (  18.80  )
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

Hey Walker,
Just jumping in here...

On Thu, Nov 24, 2022 at 05:08:57PM +0800, Walker Chen wrote:
> On 2022/11/19 2:31, Emil Renner Berthing wrote:
> > On Fri, 18 Nov 2022 at 14:35, Walker Chen <walker.chen@starfivetech.com> wrote:

> >> diff --git a/include/soc/starfive/pm_domains.h b/include/soc/starfive/pm_domains.h
> >> new file mode 100644
> >> index 000000000000..a20e28e9baf3
> >> --- /dev/null
> >> +++ b/include/soc/starfive/pm_domains.h
> >> @@ -0,0 +1,15 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + * Author: Walker Chen <walker.chen@starfivetech.com>
> >> + */
> >> +
> >> +#ifndef __SOC_STARFIVE_PMDOMAINS_H__
> >> +#define __SOC_STARFIVE_PMDOMAINS_H__
> >> +
> >> +#include <linux/types.h>
> >> +
> >> +void starfive_pmu_hw_event_turn_on(u32 mask);
> >> +void starfive_pmu_hw_event_turn_off(u32 mask);
> >> +
> >> +#endif /* __SOC_STARFIVE_PMDOMAINS_H__ */
> > 
> > The header and functions within are named very generic, but
> > implemented by the jh71xx-specific driver.
> > 
> > Also who should use this header? These functions are never called by
> > anything in this series.
> 
> These two functions will be used by the GPU module. Only the power-off
> of the GPU is not controlled by the software through PMU module. So
> here the functions are needed to export.

...the general policy is to avoid adding things without users. I think
they should be kept as static functions for now & when your GPU driver
is being upstreamed you can expose these functions. That way your usage
of them can be reviewed with the appropriate context.

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
