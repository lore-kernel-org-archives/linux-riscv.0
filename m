Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB266F8A146
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9w0pjWMkxv1XWSZ6ee5UpHRj5GhGFMVtA4YeWZ0hxqs=; b=C4pnkekga2ZLa6
	9ALDMlvrulu9jLezEne2IQRzuLjbnAuMxYeYrApYUkB1S5au2jiRAES2QKV+juVxYe57xBrsGI3dZ
	5PZTrTEwtUl9l21sTjkz5HCaviRrYsKf4eht/RuNNG2CDXxQCTIKwbLbUkViQnF+zUwAaPJU/KzN+
	Und5xMgKYT3esD43ZHpC03ZK4mMWY22B+hAxn48UH0NkUmx5tR7Wqc9Y+JVH9bbl0zlWOEs6Ih0DL
	kVbC24YQqT+H6Kip/vHgLe4ZRnnLuFdoVg13LDMjc9freSO8UMXeZucDSWQkGQ5hfaknp3jYlCeLt
	iPlq8bN4PCvlUPk8mMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJkF-00000002ICo-1sez;
	Thu, 16 Apr 2026 10:14:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJkC-00000002ICM-3G96
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 10:14:46 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c741692db4cso166678a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1776334483; x=1776939283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5Zrp9xvS+I4fXIy8VYzclw9xOf2k/ka0uhcPGCfNmc=;
        b=jibdE19k7/pkK0+jE6AB1clfEiNMushwGTFRcoybdV+5BYafzKiqhww+9z92LsbQox
         vc3iNETjpcqruVWjEn3WUFTKCGjAC6IiJZJfZ9OGiiE9p2eruGbUE2lwDHWzQ/I3ewzE
         npnQa5fbbpvucxjUJb1MGUoQW1Cz7J/vOCKbdgc0xsnC/JQfGZW+0AYFaJ0IQnf2/8gw
         oQly9K3vO6jp9VTlDJBASh5CS+AaH6ouATc0qV+I0Zp1lzgMjfFEqYEoWELspYSuk50M
         /5CIgKIHQIhbyIDUV9flXihnwAh+0WPGLpHNCFfnj+sKTy1j06McqesijRmaz7AAKAXc
         L9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334483; x=1776939283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5Zrp9xvS+I4fXIy8VYzclw9xOf2k/ka0uhcPGCfNmc=;
        b=gvLKrfqRpTiZltXujk3uAreteaKCWaefUrREkHUrpS6bu3n4B/s/eVd/v5j3j9nZib
         tGx2GpilyV36Tmx1WrrZv8HVugEMkha0+8RselsdiUkms7o5MRpAeduPy6eVtr67OK58
         vDc79Wczwo32N3q0h0KUFsXMcfjSYRnclUW9ht16OYxE0hc73qyuCJu9NIGCG7a9Yn4e
         2+7f5jwijuzEvlCbwGry4XgZ4Wc66fV5RLH6apcmq5nw30fGSyM21MWnlFDRri4jHkm3
         SIP6xkn2CW5ve3HRG8A7WffWOFmBc0DtqyaK1DmA1HfulvFARl6dD9QrEKSwS5Vx1nnJ
         qfxA==
X-Forwarded-Encrypted: i=1; AFNElJ9pQeKUjlCvvFio+c0WUfU59xfma+1pns0vMn/bbfu6kxXIWKnJuJyKaZ7WiAFejxO6EK+vSkyHRtoXcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQkd3n1+ONwyPfOjDFnfF+68md67y9gMl3fYpiJQrZvEYAX6Qf
	yrABT+CSCuJ1uFcuzGz4mR8kNf4lRvGAb634xHgzcdrsUkbb1Ed+Bd9rRxAX5EKc944=
X-Gm-Gg: AeBDiesAUTjrBd6C29NyCliwBsy7fIRMF83AMJur0JaIgsGgCbnLtayAAf1B4rCzGMl
	M+uuczybkECeMbDPkQP3fxzlEV2DMSCyOPeOfDypP2+rL4eQdRy6YCMLD7MiXIaipIeiCSOwe/2
	HvATS8W+KxWmcKt8j6hYgkZoP77FEWTnmpdkbhbI/YvN69BTk7tssrTaX/dQe6xTHzaZL1FCYMg
	sO7wwylgLriO8pySOtsijyg5DcYQO7ccroowZV4KehMRY8cMre4uvJfc0kerWizfnynaPx+wjbE
	SczDsdBS8JhwwZaxmbm2OCpH/Wq/hpWV57EHa1ibosv2szJVWishs7MPyRInbf9j9Z3wY+d1R87
	yux/kyOQPo/CX4Xf/CZOS8WLNV5NUe60SL3Nrfe+G1X+V8lz96tWiS1MmWI3uVkwnYPweUMpo7g
	vGPXiAZMwwxwmUSp6XUK336jHcl4elRbh1jueCD3Ng62Dx
X-Received: by 2002:a17:902:db06:b0:2ae:47b0:dc80 with SMTP id d9443c01a7336-2b5eaa4f615mr26842025ad.11.1776334483293;
        Thu, 16 Apr 2026 03:14:43 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW ([136.226.240.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478109a4dsm51692545ad.18.2026.04.16.03.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 03:14:42 -0700 (PDT)
Date: Thu, 16 Apr 2026 18:14:25 +0800
From: Eric Lin <eric.lin@sifive.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Liang Kan <kan.liang@linux.intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
	Nick Hu <nick.hu@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH v3 07/12] rvtrace: Add trace ramsink driver
Message-ID: <aeC2gUsXGy3mr8Zo@EricL-ThinkPadX1-TW>
References: <20260225062448.4027948-1-anup.patel@oss.qualcomm.com>
 <20260225062448.4027948-8-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260225062448.4027948-8-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_031444_852094_B21CA8E9 
X-CRM114-Status: GOOD (  36.52  )
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

On Wed, Feb 25, 2026 at 11:54:43AM +0530, Anup Patel wrote:

Hi Anup,

> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
>
> Add initial implementation of RISC-V trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
>
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/Kconfig           |   9 +
>  drivers/hwtracing/rvtrace/Makefile          |   1 +
>  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 322 ++++++++++++++++++++
>  3 files changed, 332 insertions(+)
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c
>
> diff --git a/drivers/hwtracing/rvtrace/Kconfig b/drivers/hwtracing/rvtrace/Kconfig
> index ba35c05f3f54..0577f9acb858 100644
> --- a/drivers/hwtracing/rvtrace/Kconfig
> +++ b/drivers/hwtracing/rvtrace/Kconfig
> @@ -21,3 +21,12 @@ config RVTRACE_ENCODER
>  	default y
>  	help
>  	  This driver provides support for RISC-V Trace Encoder component.
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
>  obj-$(CONFIG_RVTRACE) += rvtrace.o
>  rvtrace-y := rvtrace-core.o rvtrace-platform.o
>  obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> +obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
> diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> new file mode 100644
> index 000000000000..5393423c8f28
> --- /dev/null
> +++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
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
> +#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
> +#define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
> +#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
> +#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT	0x8
> +
> +enum rvtrace_ramsink_mode {
> +	MODE_SRAM,
> +	MODE_SMEM
> +};
> +
> +struct rvtrace_ramsink_priv {
> +	size_t size;
> +	void *va;
> +	dma_addr_t start;
> +	dma_addr_t end;
> +	enum rvtrace_ramsink_mode mode;
> +	bool stop_on_wrap;
> +	int mem_acc_width;
> +};
> +
> +struct trace_buf {
> +	void *base;
> +	long cur;
> +	size_t len;
> +};
> +
> +static int rvtrace_ramsink_start(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> +			       comp->pdata->control_poll_timeout_usecs);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to start ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> +			       comp->pdata->control_poll_timeout_usecs);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop ramsink.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}
> +
> +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size_t size)
> +{
> +	int bytes_dst, bytes_src, bytes;
> +	void *dst_addr, *src_addr;
> +
> +	while (size) {
> +		src_addr = src->base + src->cur;
> +		dst_addr = dst->base + dst->cur;
> +
> +		/* Ensure that there are no OOB memory accesses */
> +		if (dst->len - dst->cur < size)
> +			bytes_dst = dst->len - dst->cur;
> +		else
> +			bytes_dst = size;
> +
> +		if (src->len - src->cur < size)
> +			bytes_src = src->len - src->cur;
> +		else
> +			bytes_src = size;
> +		bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
> +		memcpy(dst_addr, src_addr, bytes);
> +		dst->cur = (dst->cur + bytes) % dst->len;
> +		src->cur = (src->cur + bytes) % src->len;
> +		size -= bytes;
> +	}
> +}
> +
> +static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
> +					    struct rvtrace_perf_auxbuf *buf)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +	size_t size_wp_end = 0, size_start_wp = 0;
> +	struct trace_buf src, dst;
> +	u32 wp_low, wp_high, trram_ctrl;
> +	u64 buf_cur_head;
> +
> +	dst.base = buf->base;
> +	dst.len = buf->length;
> +	dst.cur = buf->pos;
> +	src.base = priv->va;
> +	src.len = priv->size;
> +	wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> +	wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> +	buf_cur_head = (u64)(wp_high) << 32 | wp_low;
> +	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);

The trram_ctrl is not used. I think we should remove it.

> +	if (buf_cur_head & 0x1) {
> +		buf_cur_head &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
> +		rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPLOW_OFF);
> +		rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPHIGH_OFF);
> +		src.cur = buf_cur_head - priv->start;
> +		size_wp_end = priv->end - buf_cur_head;
> +		tbuf_to_pbuf_copy(&src, &dst, size_wp_end);
> +	}
> +
> +	src.cur = 0;
> +	size_start_wp = buf_cur_head - priv->start;
> +	tbuf_to_pbuf_copy(&src, &dst, size_start_wp);
> +	dev_dbg(&comp->dev, "Copied %zu bytes\n", size_wp_end + size_start_wp);

Currently, rvtrace_ramsink_copyto_auxbuf() only resets the RAM sink
Write Pointer (WP) if a trace buffer wrap has occurred. If no wrap
occurs, it copies the trace data from the buffer's start address to
the current WP, but the WP is not reset to buffer's start address.

This causes an issue during process context switches. When a traced
program is context-switched out, the trace data is copied to the
perf AUX buffer. If the WP is not reset at this point, the next
time the program is scheduled and subsequently switched out, the
function will once again copy from the start of the buffer up to the
new WP. This unintentionally re-copies the old trace data from the
previous scheduled slice.

Regards,
Eric Lin

> +	return (size_wp_end + size_start_wp);
> +}
> +
> +static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
> +				     struct rvtrace_ramsink_priv *priv)
> +{
> +	struct device *pdev = comp->pdata->dev;
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +	int ret;
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
> +	/* Set DMA mask based on the maximum allowed limit address */
> +	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
> +	if (ret)
> +		return ret;
> +
> +	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +
> +	priv->end = priv->start + priv->size;
> +	if (priv->end <= start_min || priv->start >= limit_max) {
> +		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> +		dev_err(&comp->dev, "DMA memory not addressable by device\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup ram sink start addresses */
> +	if (priv->start < start_min) {
> +		dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\n",
> +			 &priv->start, &start_min);
> +		priv->va += start_min - priv->start;
> +		priv->start = start_min;
> +	}
> +
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	rvtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
> +	/* Setup ram sink limit addresses */
> +	if (priv->end > limit_max) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &limit_max);
> +		priv->end = limit_max;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
> +	end = priv->end - priv->mem_acc_width;
> +	rvtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	rvtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	end = (u64)(high) << 32 | low;
> +	if (end != (priv->end - 4)) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &end);
> +		priv->end = end;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv;
> +	u32 trram_ctrl;
> +	int ret;
> +
> +	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Derive RAM sink memory size based on component implementation ID */
> +	switch (comp->pdata->impid) {
> +	default:
> +		priv->size = SZ_1M;
> +		priv->mode = MODE_SMEM;
> +		priv->stop_on_wrap = false;
> +		priv->mem_acc_width = 4;
> +		break;
> +	}
> +
> +	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> +	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
> +		 "SMEM" : "SRAM");
> +
> +	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
> +	rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	ret = rvtrace_ramsink_setup_buf(comp, priv);
> +	if (!ret)
> +		dev_set_drvdata(&comp->dev, priv);
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +
> +	dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->start);
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
> +	ret = rvtrace_enable_component(comp->pdata);
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
> +	ret = rvtrace_disable_component(comp->pdata);
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
> +	.stop = rvtrace_ramsink_stop,
> +	.start = rvtrace_ramsink_start,
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
> +MODULE_AUTHOR("Mayuresh Chitale");
> +MODULE_DESCRIPTION("RISC-V Trace Ramsink Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
