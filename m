Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3523FCCA470
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 07:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isdnT73qGZaTBpkwTMAMc6F1J/U8IlANxISFmVuJcCU=; b=OQI0K8slJgcVwR
	iEPd8MWqjGjO6T4szBrki1MJScn+8vNr36dmdKEfGHHMsWhwjHRg3OSo3JYNWB6uhcdU8Xr21w+qp
	3cZonVfGrXdLQ8ppk+F+LQ+SdURQsreVv+DlOKv73QlbUjWnMtPJFtzIqG9J4Xkrf36afgTF5+1s0
	w21M50viWj+YsC6LltxHQs831ILdl8Kw+36GlyVlojq1QdRmvByD5dnCFNtLmAO9AiB2qqp5a6Z5d
	1SNbWM13pPPOUhpX596I2N6lhE19wU7+G7SS4TzrtsWTIIStWFCzBcoJWSvA9Pf1+VURIOl0EViRe
	oymT4NpJK+vUzH9RKeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61qu-00000001Qq8-05TK;
	Tue, 07 Oct 2025 07:11:16 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v61qq-00000001QpS-2ADO
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 07:11:14 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7835321bc98so5629007b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 00:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759821071; x=1760425871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cz8Uq6JRWEUUJyfozPnxNFaDcuM+MyDcm3nmjddxu90=;
        b=ZG0O+5QECsyhl3sSNNbMWL+TpuU69pa3XtHJmUhVL0S0tR9J7tfSax5J4VOCWdA4Q4
         /70M8u/1zeKZ8AaWKPVw9IIsylM6ffESqhojKVTUxdcqn8tcKpEGPK3p9NHJ1cLWEuBU
         iII1NgSOzeD5N3u9+tfc0A7qSK58wHgDOxWQLYOyNhFaB7m5U0vYi69fZDQ5ekfYAqgQ
         sc4UlqZMOYnTaWDd202GimceDNcHtlKY2s7ykmgxreUfdcgUSoLo8K9CA88HKdJzvzky
         I7YOvaZKxEiR1oKL1EbOrMzJZuajfZhWEqozhhzBmCc4xt0sfySuH3FBdh/DScXVGOcF
         zb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759821071; x=1760425871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cz8Uq6JRWEUUJyfozPnxNFaDcuM+MyDcm3nmjddxu90=;
        b=pIPbBdRVhYFqPYahrLc9TmezmBPZwXk8AmdCQWU79R+u+d+qantZcFfxrC8NBh0gra
         Z8jjWYicFwYcaOL6TE7VNbkQKWiiAKQiZmkE0xJwbSPm20DSTeo1BzTJnd/b7HYvZZUe
         HJVLdQ9kfon+ejx3MH0wFBCJtVnIPn5SZTc2OwLEm7vmVO4plMc5wgxlFJtScpvtN0qm
         oebLK+aqWE+s9nRL5zLwezeJaLotWPFVNj1ujGbXpcuqdaIsHBYaNSmkmIoFO5r6/cGU
         NAd3/8c6VGnSqLEtH97NKcV3sEGSCLu25VhMZS0Uz792KwnG10299rx6Tj2aISK34/KT
         BKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyoBgdo3jdrwO5GK34JZ3A8VAWkWzMHDJaLRzvk0MzRwmN3rpXVJFKMTmHkj1k/4eTHZNLfPnMZUvxzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNsOwjXcGkeAjbp9tHKX+e6820Sedt0AYlpP3ykYYFZHto1sTu
	r0oRxFuWk9rzcUhu7l1Uc9OCKFngEoYyA9pcvL1Lv0EyJGA+Fc6VFLOx
X-Gm-Gg: ASbGncugT0rHKfTS7RIujveC2YPjKMDqm2hwY2HdrseZIZTWZR0CjDZzPDZPLND//ZR
	7Kp3gy2GQFztZ1M2RimuK/opY8UL9arhwF+2/P4G7bbCj1SKo7F6rUOTU/N8zhcGd5RTMWN02jG
	GlGMcLV8lLSUCd8jOpd7MMRdH52Nm1/iiKOXlBqb+FZcWKLDpZlsaCjhG6jt14Ve/cE3LEZ3R+Z
	lZqsJzNngR76ZP16How3aabvo0z/5sdjUNMWK8dk2HkbUYowNan2C32hliP3BXCEmRROTOPqsEy
	BvPEkEQwfhn1vHJatmK2TuD+hVwftUZpaBcQPAqXNwQe54+44fSek3QCh8XUhRDYcRQwhkgSlXS
	hffYqhpV6nlBKzvDOe7CU9p/AMh0AW09rcglBIrMyD3kzUFaR
X-Google-Smtp-Source: AGHT+IHQPTeQxqIh3DmyDul63D0hdktzTIH+hAqRQcLBDO2L74AlzSZcN3PTvolNafM1O2PLFa55Ow==
X-Received: by 2002:a05:6a20:6a08:b0:2ea:41f1:d53a with SMTP id adf61e73a8af0-32b620d9121mr18200629637.41.1759821071157;
        Tue, 07 Oct 2025 00:11:11 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb0548sm14737938b3a.27.2025.10.07.00.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 00:11:10 -0700 (PDT)
Message-ID: <793a00d6-a1ae-4928-a326-3d276a30bdbd@gmail.com>
Date: Tue, 7 Oct 2025 00:09:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] rvtrace: Add trace encoder driver
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar
 <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
 Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>,
 Liang Kan <kan.liang@linux.intel.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
 <20251002060732.100213-6-apatel@ventanamicro.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251002060732.100213-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_001112_843146_68983E9F 
X-CRM114-Status: GOOD (  25.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/1/25 23:07, Anup Patel wrote:
> From: Mayuresh Chitale <mchitale@ventanamicro.com>
> 
> Add initial implementation of RISC-V trace encoder driver. The encoder
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   drivers/hwtracing/rvtrace/Kconfig           |   7 ++
>   drivers/hwtracing/rvtrace/Makefile          |   1 +
>   drivers/hwtracing/rvtrace/rvtrace-encoder.c | 107 ++++++++++++++++++++
>   3 files changed, 115 insertions(+)
>   create mode 100644 drivers/hwtracing/rvtrace/rvtrace-encoder.c
> 
> diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
> index f8f6feea1953..ba35c05f3f54 100644
> --- a/drivers/hwtracing/rvtrace/Kconfig
> +++ b/drivers/hwtracing/rvtrace/Kconfig
> @@ -14,3 +14,10 @@ menuconfig RVTRACE
>   
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called rvtrace.
> +
> +config RVTRACE_ENCODER
> +	tristate "RISC-V Trace Encoder driver"
> +	depends on RVTRACE
> +	default y
> +	help
> +	  This driver provides support for RISC-V Trace Encoder component.
> diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
> index 988525a379cf..f320693a1fc5 100644
> --- a/drivers/hwtracing/rvtrace/Makefile
> +++ b/drivers/hwtracing/rvtrace/Makefile
> @@ -2,3 +2,4 @@
>   
>   obj-$(CONFIG_RVTRACE) += rvtrace.o
>   rvtrace-y := rvtrace-core.o rvtrace-platform.o
> +obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
> new file mode 100644
> index 000000000000..45d1c5b12c51
> --- /dev/null
> +++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/rvtrace.h>
> +#include <linux/types.h>
> +
> +#define RVTRACE_COMPONENT_CTRL_ITRACE_MASK	0x1
> +#define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
> +#define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
> +#define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
> +
> +static int rvtrace_encoder_start(struct rvtrace_component *comp)
> +{
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +				RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 1,
> +				comp->pdata->control_poll_timeout_usecs);
> +}
> +
> +static int rvtrace_encoder_stop(struct rvtrace_component *comp)
> +{
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	return rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +				RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT, 0,
> +				comp->pdata->control_poll_timeout_usecs);
> +}
> +
> +static void rvtrace_encoder_setmode(struct rvtrace_component *comp, u32 mode)
> +{
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= (mode << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +}
> +
> +static int rvtrace_encoder_probe(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	rvtrace_encoder_setmode(comp, 0x6);
> +	ret = rvtrace_enable_component(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to enable encoder.\n");
> +
> +	return 0;
> +}
Trace components needs proper probing before use. Refer to Control Interface
Spec: https://github.com/riscv-non-isa/tg-nexus-trace/releases/download/1.0_Ratified/RISC-V-Trace-Control-Interface.pdf
Chapter 5. This versioning applies to all components, e.g., sinks/funnels...
The driver should check the HW impl version with what it supports, and
rejects registering the component(s) if not supported. Chapter 5. has more
details.

> +
> +static void rvtrace_encoder_remove(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_disable_component(comp);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to disable encoder.\n");
> +}
> +
> +static struct rvtrace_component_id rvtrace_encoder_ids[] = {
> +	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
> +	  .version = rvtrace_component_mkversion(1, 0), },
> +	{},
> +};
> +
> +static struct rvtrace_driver rvtrace_encoder_driver = {
> +	.id_table = rvtrace_encoder_ids,
> +	.start = rvtrace_encoder_start,
> +	.stop = rvtrace_encoder_stop,
> +	.probe = rvtrace_encoder_probe,
> +	.remove = rvtrace_encoder_remove,
> +	.driver = {
> +		.name = "rvtrace-encoder",
> +	},
> +};
> +
> +static int __init rvtrace_encoder_init(void)
> +{
> +	return rvtrace_register_driver(&rvtrace_encoder_driver);
> +}
> +
> +static void __exit rvtrace_encoder_exit(void)
> +{
> +	rvtrace_unregister_driver(&rvtrace_encoder_driver);
> +}
> +
> +module_init(rvtrace_encoder_init);
> +module_exit(rvtrace_encoder_exit);
> +
> +/* Module information */
> +MODULE_AUTHOR("Mayuresh Chitale <mchitale@ventanamicro.com>");
> +MODULE_DESCRIPTION("RISC-V Trace Encoder Driver");
> +MODULE_LICENSE("GPL");

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
