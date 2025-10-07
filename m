Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71992CCA476
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 07:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7L7JjMA5ea54YVqozBHcUFsCaGHBT5zEsekfNl09IE=; b=UrDvxukgdpvKB1
	GvuzUbODC38Rrs1bsIsPDtv7R7j2tSjhQw3mhVBPJl4nGRZ4yEjFB8PXNXjAuzo3gXbnJ/1yh9azh
	V0c1kM4hOxVUjGV1mdjgfIsEf0VLv61kwvIRo53JmLziYUTtbvWt5YA+e+Y4K/CMI1z9NJWjHebeb
	W4JuaoiOFKt+4uDS+0kmaxyjU65VFSxele8ARCOgn8p6O3a+7cboV4zNmlST0oqmpr829/yPb5Ekf
	hQONFujCZsJjfU3Ic0ZZHyQAJewYXQXnONEFx9Bjy5WXP5Sf1xNKijz62ur/LtkHZxHhBnzU7YPqr
	gEaHNIO6eH9uTjWEt5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62TQ-00000001T2Y-0vSk;
	Tue, 07 Oct 2025 07:51:04 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62TM-00000001T1p-36Q4
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 07:51:02 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-32ed19ce5a3so5609525a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 00:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759823460; x=1760428260; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhnA09TQ8hNY3ByOHoJEkbXhSQQgNq2Hl9f2lCZ+3kA=;
        b=Ejj0wl2k0AVM4JATZUhXxYes2iCRTG7y0GOihFuZGJdQLdkAcJlSZij78kCR8T9LcG
         4s8JXBWsjdnN9l7hwiso0hF1IPv/r1dzCRGVykBGzjHbtzURJAraLtOz+Ss7VNb6lfvF
         vZn95k35bKpBHG1hOjbICqaLCgw9T6oW4HK4yDx1bYL7Zcjyu+ehYCU9m2astm9MiG7f
         CjF1voq8Rvg3gHjPddfLlviJ5LU2fCdw0NlOUzFUnNMFcTBQcr5UeQkLUtpDt7f+yYc+
         Msjtg5EpjTnWqQOhj0to31zzJKRQRrrihktxrd/6///zlXvOGvnre/da2TSoQDiOz7/+
         yB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759823460; x=1760428260;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dhnA09TQ8hNY3ByOHoJEkbXhSQQgNq2Hl9f2lCZ+3kA=;
        b=xDQGGop+SK5CwsrEITXGf10LVYZ8z/2xhPZLWEjWbFH9cOpzjDgyf1/JS2N8GBYGXc
         pG6sjRlAZqKvoymN/7SYxQOi1GAm2Z9KJ0skTNwABp+xLYVxBj623WEowPa2nsJlHh+6
         4HG4cC5Igi17yLxCIhEsl/m/NXXRpAd+m3HD7JMzv1RtPDctXghYDp/ZoxOVrr+HqPMb
         O6LFz1xFPbA9sBgqj50cZ/XHPXPNS8khdQhRZ9P4LNds8qGdr5vizOiP53epfmTugmUi
         BrLulOzi6k3446ozsUbSgdAN3sfDavsPO/TfdIf7suZvIv6CHXmOKS1xOShuLfs6HYfo
         Uzcw==
X-Forwarded-Encrypted: i=1; AJvYcCUmIBgEwRzn6iXWWYTsTbC3EcPpBSwN0ILgmUjRhKCTL8NvxPP0fSi5Hk3jc0UnKzfTXCglkfXdVfF+xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4yHgAAQhzrkonHnqQJCp6d5goC6jrj2cvl6HHmboWfPoM7Jr
	CYj50jzfYbg18y+SwYKJtPHIs3SPeE24Hw6NFL7gOTpHnaYO0R33015u
X-Gm-Gg: ASbGncuTNelsjXsNVg3Fby/RT6+6QeP6uowjaOev7D5slp+aFDEIeHfsbaU+9G0+eTU
	RBPBguqxR9IldzHx+ZivlBgTFy/1hZy2Zhq4lgSB5bDUTfEF5DyK7984WRzqBjv5o/n3u2SlKH7
	waJdyx49bc7FKswJUEjHvXd0Y1UqVqt5NESgkeqdXuTiywqYG8sLqsHYAQbKkdOr8jtMuU1Tlp+
	dj81bU8y+1x2kktlHMEs/xyOioLWLNHspbLvWA+xbu5byfv4JVDhvnuYxf/KHoSwYAOHL/8FQk+
	SCnC9qSgyQvO7uZGMHay3NTO9ij5q0x9JoegGJZvJCvI5OFaFWMAeAIYiaQwp9ycAVVyO9TsNjo
	BM9g+YZT5PVlXkT/5JREw6i1nHLLdMug4dCHhdpplhMiXAwPW
X-Google-Smtp-Source: AGHT+IG905MGBQ32Ub4ShnX9AGf28crwYHhnuKiGoa/Yd7ia0xUTqXMWebVlHOFKhP/du1dc9C6gAw==
X-Received: by 2002:a17:90b:1f89:b0:32e:96b1:fb70 with SMTP id 98e67ed59e1d1-339c2720c9fmr21575430a91.12.1759823459801;
        Tue, 07 Oct 2025 00:50:59 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339c4a68deasm13196357a91.25.2025.10.07.00.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 00:50:59 -0700 (PDT)
Message-ID: <9422ba89-a6ba-4168-98a1-6d4275698430@gmail.com>
Date: Tue, 7 Oct 2025 00:49:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] rvtrace: Add trace ramsink driver
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
 <20251002060732.100213-8-apatel@ventanamicro.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251002060732.100213-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_005100_899729_8A765FC4 
X-CRM114-Status: GOOD (  28.71  )
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
> Add initial implementation of RISC-V trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   drivers/hwtracing/rvtrace/Kconfig           |   8 +
>   drivers/hwtracing/rvtrace/Makefile          |   1 +
>   drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 198 ++++++++++++++++++++
>   3 files changed, 207 insertions(+)
>   create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> 
> diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
> index ba35c05f3f54..aef7e9989165 100644
> --- a/drivers/hwtracing/rvtrace/Kconfig
> +++ b/drivers/hwtracing/rvtrace/Kconfig
> @@ -21,3 +21,11 @@ config RVTRACE_ENCODER
>   	default y
>   	help
>   	  This driver provides support for RISC-V Trace Encoder component.
> +
> +config RVTRACE_RAMSINK
> +	tristate "RISC-V Trace Ramsink driver"
> +	depends on RVTRACE
> +	default y
> +	help
> +	  This driver provides support for Risc-V E-Trace Ramsink
> +	  component.
> diff --git a/drivers/hwtracing/rvtrace/Makefile b/drivers/hwtracing/rvtrace/Makefile
> index f320693a1fc5..122e575da9fb 100644
> --- a/drivers/hwtracing/rvtrace/Makefile
> +++ b/drivers/hwtracing/rvtrace/Makefile
> @@ -3,3 +3,4 @@
>   obj-$(CONFIG_RVTRACE) += rvtrace.o
>   rvtrace-y := rvtrace-core.o rvtrace-platform.o
>   obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> +obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
> diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> new file mode 100644
> index 000000000000..7bd0cf1e4dfd
> --- /dev/null
> +++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> @@ -0,0 +1,198 @@
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
> +#include <linux/dma-mapping.h>
> +#include <linux/rvtrace.h>
> +#include <linux/types.h>
> +#include <linux/sizes.h>
> +
> +#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
> +#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
> +#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
> +#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
> +#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
> +#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
> +#define RVTRACE_RAMSINK_RPLOW_OFF		0x028
> +#define RVTRACE_RAMSINK_RPHIGH_OFF		0x02c
> +
> +struct rvtrace_ramsink_priv {
> +	size_t size;
> +	void *va;
> +	dma_addr_t start;
> +	dma_addr_t end;
> +	/* WP from prev iteration */
> +	dma_addr_t prev_head;
> +};
> +
> +struct trace_buf {
> +	void *base;
> +	size_t size;
> +	int cur, len;
> +};
> +
> +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst)
> +{
> +	int bytes_dst, bytes_src, bytes;
> +	void *dst_addr, *src_addr;
> +
> +	while (src->size) {
> +		src_addr = src->base + src->cur;
> +		dst_addr = dst->base + dst->cur;
> +
> +		if (dst->len - dst->cur < src->size)
> +			bytes_dst = dst->len - dst->cur;
> +		else
> +			bytes_dst = src->size;
> +		if (src->len - src->cur < src->size)
> +			bytes_src = src->len - src->cur;
> +		else
> +			bytes_src = src->size;
> +		bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
> +		memcpy(dst_addr, src_addr, bytes);
> +		dst->cur = (dst->cur + bytes) % dst->len;
> +		src->cur = (src->cur + bytes) % src->len;
> +		src->size -= bytes;
> +	}
> +}
> +
> +static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
> +					    struct rvtrace_perf_auxbuf *buf)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +	struct trace_buf src, dst;
> +	u32 wp_low, wp_high;
> +	u64 buf_cur_head;
> +	size_t size;
> +
> +	wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> +	wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> +	buf_cur_head = (u64)(wp_high) << 32 | wp_low;
> +
> +	if (buf_cur_head == priv->prev_head)
> +		return 0;
> +
> +	dst.base = buf->base;
> +	dst.len = buf->length;
> +	dst.cur = buf->pos;
> +	dst.size = 0;
> +
> +	src.base = priv->va;
> +	src.len = priv->end - priv->start;
> +	if (buf_cur_head > priv->prev_head) {
> +		src.size = buf_cur_head - priv->prev_head;
> +	} else {
> +		src.size = priv->end - priv->prev_head;
> +		src.size += buf_cur_head - priv->start;
> +	}
> +
> +	src.cur = buf_cur_head - priv->start;
> +	size = src.size;
> +	tbuf_to_pbuf_copy(&src, &dst);
> +	buf->pos = dst.cur;
> +	priv->prev_head = buf_cur_head;
> +
> +	return size;
> +}
> +
> +static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv;
> +
> +	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	dev_set_drvdata(&comp->dev, priv);
> +
> +	priv->size = SZ_4M;
Can we make this size dynamically determined? 4M seems inadequate. This is
exceedingly so if the RAM sink is linked to a funnel, where you can have
many harts dumping traces into this sink.

> +	priv->va = dma_alloc_coherent(&comp->dev, priv->size, &priv->start, GFP_KERNEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +	priv->end = priv->start + priv->size;
> +	priv->prev_head = priv->start;
> +
> +	/* Setup ram sink addresses */
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
> +	/* Limit address needs to be set to end - 4 so that HW doesn't cause an overflow. */> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->end - 0x4), RVTRACE_RAMSINK_LIMITLOW_OFF);
Should not hardcode 4 as the trace write width. Control Interface Spec
chapter 7.1 has the proper instruction on how to probe for this width:

"Not every value may be settable in trRamStart/Limit registers. Value
  written may be trimmed (for example aligned on a particular 2^N boundary)
  and a trace tool should verify values being written"

> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +
> +	return 0;
> +}
> +
> +static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +
> +	dma_free_coherent(&comp->dev, priv->size, priv->va, priv->start);
> +}
> +
> +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_ramsink_setup(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
> +
> +	ret = rvtrace_enable_component(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_remove(struct rvtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_disable_component(comp);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to disable ramsink.\n");
> +
> +	rvtrace_ramsink_cleanup(comp);
> +}
> +
> +static struct rvtrace_component_id rvtrace_ramsink_ids[] = {
> +	{ .type = RVTRACE_COMPONENT_TYPE_RAMSINK,
> +	  .version = rvtrace_component_mkversion(1, 0), },
> +	{},
> +};
> +
> +static struct rvtrace_driver rvtrace_ramsink_driver = {
> +	.id_table = rvtrace_ramsink_ids,
> +	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
> +	.probe = rvtrace_ramsink_probe,
> +	.remove = rvtrace_ramsink_remove,
> +	.driver = {
> +		.name = "rvtrace-ramsink",
> +	},
> +};
> +
> +static int __init rvtrace_ramsink_init(void)
> +{
> +	return rvtrace_register_driver(&rvtrace_ramsink_driver);
> +}
> +
> +static void __exit rvtrace_ramsink_exit(void)
> +{
> +	rvtrace_unregister_driver(&rvtrace_ramsink_driver);
> +}
> +
> +module_init(rvtrace_ramsink_init);
> +module_exit(rvtrace_ramsink_exit);
> +
> +/* Module information */
> +MODULE_AUTHOR("Mayuresh Chitale <mchitale@ventanamicro.com>");
> +MODULE_DESCRIPTION("RISC-V Trace Ramsink Driver");
> +MODULE_LICENSE("GPL");

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
