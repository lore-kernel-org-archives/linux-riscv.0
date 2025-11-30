Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54FAAD111A8
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Nov 2025 07:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qu74LpcO0+XiheHeusOtC1Kxl6IX7KadmG61mUi4qw=; b=mPicBGlaonLJqu
	ubQiDpOrpuhz8RI63+MGHxEgPZkGTv4dXVi7QMEXKScYgAtogzBbTx1A+SO/JMhCC3QpQZ6tgi+yF
	BhUBbw9GMAAj+++CSjRGO94JD8wZdUma13EUsDASL9j39g2qYXHbm0+IxXFIE02AS6vCuMK/glLRV
	wLyLDfr8ENkhrpPZaqInz1sjBMopFRGNo10iX9TEZvi32XdNWilqjb1d9IsmusktVRLH688dQCc4B
	fnKcc2uC7nY27/RQIehH0X1M4PtgxVUMNvSlSIddmExuxqlZhBlwb9E5D4DtxoU+2fWXzuailMHUb
	CNrr1lZ6PLukTF5DSCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPc9h-000000027v3-2ZJ8;
	Sun, 30 Nov 2025 07:47:37 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPc9f-000000027uc-0KuU
	for linux-riscv@lists.infradead.org;
	Sun, 30 Nov 2025 07:47:37 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2956d816c10so35080475ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Nov 2025 23:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764488853; x=1765093653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMz7/I31vULNcXSLjphmBDw8pJN8azXEYtV3XhWvRkg=;
        b=KpW0BrGcqbWTxaPrh+8WjVy+QPFjBMUvz0Pc/No7kXtSodm1eSEAzgQSuXQqnY3d9g
         xyDTboOAcDpyvbfQtUJ1VPZE/6p41CahkeDF3VOTK0gy5lOhg+d0udeumhWmiV5Ix+AN
         pgrYce/pMYmYk+t2eaJk5dpp7lfxNBwQgl/0I51jYazF7MCL6b64tTCswEYb+4BFtuuL
         /GVVqapW7i4MM9LSkhjAuDuAFNLKsNXGugrDpDM+hhoH6HHwgmPBSINaGHDEh7187T/G
         MP3GgNgulpukaT1WtKCiUeaTy57sPigaBXjTWvjjmE4U/BJRl/rBm+AeflknN9C6dxhp
         PbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764488853; x=1765093653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMz7/I31vULNcXSLjphmBDw8pJN8azXEYtV3XhWvRkg=;
        b=WFOYkya7NYPxactMB1jObFPExYkf9KNIW76NoOE6uRSEGJTWcfPbXudl2V2SwJjgl8
         Zelxu4xaMOQbtUyw4OR1qTm2Ylt1ojCgh3uxH/XKxkCNpwMSUugHnzyLLWfkAMrr1Kgh
         +0lQgnXtMHZzaFQqaJXd/+J2d2SpRWeH6IOBE1EnrLu7U4FejUyZbycvx1fFzpkAmAOE
         uT/MCVt00KjHl/If91qClSIsvouWw0wzKpt3Hnp2/xdCMGN8uQ0OWDMfAVRlHWkwa+Tn
         X3+pdC4jpH5trngd6KuBF/lEYQIlNE/e+F2iiSZgCrQP6qPQCNS5ctLKpaDzvz5ToUuj
         p3Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWVmA5aCM8jHM7Q+Xy1OAyOct1O1YbZWhwX5nq+vb1M03hPsZwgp8mlQGq7FlSa168LMcBdJyfo/OJ9gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3sLUIKf9PCtO9XyiKLbcjGU6q8b1Vz3wrJftamWpxrT/DIKs+
	U9HjX/fom3G1+fKc7verT8wNM/hUk2n8C39snrJxiFM3TzW9zfLIvhs9
X-Gm-Gg: ASbGncuvzdkEwQoLDLNvZ5qLZTaGyd+w5Lbs9eokHWuwD1pB3OhHwpi6yRRPlp9sd4O
	sXV6CilWJrhUxeWHoDJYosvRNiYvPTOtnAJ0fKPdjW6wS5GTukc1ddV05ulxT1PPVxwzOIWqkXi
	JrWsR9dJ45fl4vwK4hqxgl/AYWrhmezBSO6XVOhFtBxP+IosWnbErGnHQ8GhLKhDyNwFWjohaTM
	QRsj/tDaUTCEXlUj4HS5uUehFyOdMPeErPjmz/NCwFSgeycWMCNQEnu1YRmjlUu58/tqw1K0phF
	uqeouKIJKD5PYsif6bftXj7JkX11XHRHVB3eLIU2Dvi95WHgJ5cE6jZUIWW5kkolGqD4XlHfIbW
	FojCk5fUZTFiej3jRPpJRsZTFWuxjC74uD8KB1P1FTs47vcjKkzG2km8knbCk4HOuze8YQZ8hvn
	XOfPWBgXRRPxpz
X-Google-Smtp-Source: AGHT+IFnsg6lvBgHv0uVnuDXa01/Q8nuA7CaFKt7HKnSprbW5Bz97Z1RPpsVroxJIvb/eUosWYvNLg==
X-Received: by 2002:a17:902:da4d:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-29b6bf5c107mr377978425ad.42.1764488853387;
        Sat, 29 Nov 2025 23:47:33 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40021sm90300855ad.68.2025.11.29.23.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 23:47:32 -0800 (PST)
Message-ID: <26475221-f852-4d76-80dd-43f04f9e7ec4@gmail.com>
Date: Sat, 29 Nov 2025 23:45:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] rvtrace: Add trace ramsink driver
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
References: <20251101154245.162492-1-apatel@ventanamicro.com>
 <20251101154245.162492-8-apatel@ventanamicro.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251101154245.162492-8-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_234735_193906_0D14A625 
X-CRM114-Status: GOOD (  37.58  )
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

Hi Anup,

My comments below:

On 11/1/25 08:42, Anup Patel wrote:
> From: Mayuresh Chitale <mchitale@ventanamicro.com>
> 
> Add initial implementation of RISC-V trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   drivers/hwtracing/rvtrace/Kconfig           |   9 +
>   drivers/hwtracing/rvtrace/Makefile          |   1 +
>   drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 262 ++++++++++++++++++++
>   3 files changed, 272 insertions(+)
>   create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> 
> diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
> index ba35c05f3f54..0577f9acb858 100644
> --- a/drivers/hwtracing/rvtrace/Kconfig
> +++ b/drivers/hwtracing/rvtrace/Kconfig
> @@ -21,3 +21,12 @@ config RVTRACE_ENCODER
>   	default y
>   	help
>   	  This driver provides support for RISC-V Trace Encoder component.
> +
> +config RVTRACE_RAMSINK
> +	tristate "RISC-V Trace Ramsink driver"
> +	depends on RVTRACE
> +	select DMA_SHARED_BUFFER
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
> index 000000000000..676344c9387c
> --- /dev/null
> +++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#include <linux/device.h>
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
> +#define   RVTRACE_RAMSINK_WPLOW_WRAP		0x1

nit: wrong spacing

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
> +	long cur;
> +	size_t len;
> +};
> +
> +static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
> +{
> +	return rvtrace_comp_is_empty(comp);
> +}
> +

We should first set trRamEnable to 0, poll it, then poll trRamEmpty. It's
essentially the same as encoder, so perhaps move it to core.c. Here we're
just checking whether it's empty, which is wrong. We're also doing similar
things in encoder.c Should fix that as well.

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
> +	buf_cur_head = (u64)(wp_high) << 32 | (wp_low & ~RVTRACE_RAMSINK_WPLOW_WRAP);
> +
> +	if (buf_cur_head == priv->prev_head)
> +		return 0;

cur_head == prev_head could mean that we've wrapped around and stopped at
the exact position. Thus, we need to check for the wrapped around bit. If
set, then this case can be merged into buf_cur_head <= priv->prev_head
below.

For cur_head > prev_head case, we also need to check for wrap-around. If
wrapped-around, we actually filled the entire buffer, not just cur - prev
We also should consider the possibility that the buffer has been wrapped
around multiple times. In all cases, maintaining a prev_head seems to
complicate things, so why don't we just reset the WP to priv->start each
time we start the ramsink component and get rid of prev_head? This way,
we'll always have cur >= start, and depending on wrapped bit, we either
get the whole buffer, or cur - start.

> +
> +	dst.base = buf->base;
> +	dst.len = buf->length;
> +	dst.cur = buf->pos;
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
> +static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +
> +	/* Probe min and max values for start and limit registers */
> +	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	start_min = (u64)(high) << 32 | low;
> +
> +	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	limit_max = (u64)(high) << 32 | low;
> +
> +	if (priv->end < start_min) {

Where was priv->end initialized before this check?

> +		dev_err(&comp->dev, "DMA memory not addressable by device\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup ram sink start addresses */
> +	if (priv->start < start_min) {

No checks for start_min >= priv->end?

> +		dev_warn(&comp->dev, "Ramsink start address updated from %llx to %llx\n",
> +			 priv->start, start_min);
> +		priv->va += start_min - priv->start;
> +		priv->start = start_min;
> +	}
> +
> +	priv->prev_head = priv->start;
> +	priv->end = priv->start + priv->size;
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
> +	/* Setup ram sink limit addresses */
> +	if (priv->end > limit_max) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
> +			 limit_max);
> +		priv->end = limit_max;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	/* Limit address needs to be set to end - 4 to avoid overflow */
> +	end = priv->end - 4;

Should not hard-code 4, instead, do write32(0xfffffff, RamLimit), then
ffs(RamLimit) to probe for the the write width, aka, "A" value in Table
47. Typical Trace RAM Sink Configuration in the Spec.

> +	rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	end = (u64)(high) << 32 | low;
> +	if (end != (priv->end - 4)) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %llx to %llx\n", priv->end,
> +			 end);
> +		priv->end = end;
> +		priv->size = priv->end - priv->start;

Actually the RamLimit read is not the real limit. It's Limit - "A" (the
write width).

> +	}
> +
> +	return 0;
> +}

I think overall we should simplify this setup_buf function. For RamStart
alone, there're alignment + min_addr requirement, which is very unlikely
that the lowest valid address happens to be within the range that dma-
allocated in the caller (when you need to adjust priv->start). Thus, to
do it properly, we first need to detect the min_addr + alignment *before*
dma-alloc, and pass such requirements into dma-alloc, then depending on
what dma-alloc returns, detect the "M" value by interrogating RamLimit.
I'm not sure if dma-alloc can be passed a hint address that whatever
returned must be higher, and whether it can enforce random alignment, so
may be we can just program RamStart/Limit based on what dma-alloc gives
and error out if value is not retained. We do however need to probe for
write width ("A" value). It's usually 4 or 8, but it does vary per-impl,
and remember, the total buffer size is still 1MB, not 1MB - 4 or -8.

> +
> +static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
> +{
> +	struct device *pdev = comp->pdata->dev;
> +	struct rvtrace_ramsink_priv *priv;
> +
> +	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&comp->dev, priv);
> +
> +	/* Derive RAM sink memory size based on component implementation ID */
> +	switch (comp->pdata->impid) {
> +	default:
> +		priv->size = SZ_1M;
> +		break;
> +	}
> +
> +	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +
> +	return rvtrace_ramsink_setup_buf(comp);
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

In probe, we should detect and set it to SMEM mode. The default is SRAM
mode.

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

Should have a .start function like the encoder (setting trRamEnable),
and reset the WP to priv->start, as suggested above.

> +	.stop = rvtrace_ramsink_stop,
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
