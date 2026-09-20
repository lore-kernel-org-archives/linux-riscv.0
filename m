Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6C4C982D0
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rwon0OkARq0lz6UGjepKWJ5NMLcvd0hdZFGAeVAdmIM=; b=wxt2jE7VwhLt+s
	RgvIewUiXHqdglARHnD7FTAnU33ZcFPkl/zZbVn7gaGatdkO5LdC/PpmHMBzCd7baGuXvamWvfp0S
	4eSBW7dYyoEkdzJRg6o456EtXlMNVqQoAqplIEB7LxLwZGkmlH5OZyzLf1Oy2Vcog35koRnbsRvH7
	9rA3YzQ8Ev/xFlzaj3uG/UCrt/hAD5fyX1SusHL9Iw3/6qEM4jRPE4eQJRKz8SXRzi9M2uJEY98YV
	tbwKo2nOoMSExLxRiPBq/B78oJhwtI7TiBfGI4/rJQtLYgQCT59MeL3+tqe6VuPHVAILlFdcmF6tf
	SdhZJ/ziGCCVDKlqAtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FFg-0000000HIeP-0mMn;
	Sun, 20 Sep 2026 10:58:32 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8FFc-0000000HIdA-3StT
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 10:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789901863;
	bh=RkSqgdLhQ8e5Fcv8nT2UXcPrVXEP8RQT3eV54oY4OAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=JaJ4/KbnY2isl8cUnEgjaZqN3wZwz6imkpsQmtsO0J1OwI8SfWU1cAjfUhbehZRcc
	 CsvI+H+IEAYVjs4uYw/FU1hLc+bLfeN5n3jIG0atx7EvOBurTViID2sOIefssAWiVH
	 qzBpdW/vNzfwy+X6qAwfj6qi/NiGTbrpx6JOcxlY=
X-QQ-mid: zesmtpsz2t1789901861t447a4279
X-QQ-Originating-IP: cGz5GfPNM4F41PHQGZc7YNQgQDpaX72X8PNAZ//PIzM=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 20 Sep 2026 18:57:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1403582578887020598
Message-ID: <B7328085242CCEBC+79e771a5-04e6-4265-ab84-6c2848c0aa3c@linux.spacemit.com>
Date: Sun, 20 Sep 2026 18:57:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NzSDQCFWCzVTvVbh8Fc3jNFekLiDqL+b931+ytD8Vuw3N5hbsY0WAc9A
	lTha47xTXY4UIcgfZ9I6hJbjgFKUTX0zYXBndaYiMYKQl9iOgW34oamWPvXzLx2l9hklaNL
	p2t076edr+U5jSuT6s9GSBElW/L6G7WwPr2W3C5SeuODx5O2WmlPCHA1WXDh0Q69t4IHV3z
	nC27p2PGdfSTu0dp1/+Z4hYpvTz+vilo9ruIws4EWc8BJhOY3FhWBAbkMMFiIW7iobqWBhY
	6qjuLbxHqr1Gw3pDcO2pZpdj1DVlLPrdEIkYOobdVG49nzNrFjNdSIBSZ9XvUV0/ALPvDZu
	EaFLSHj51O1SGAjxDONyiJvBLkWinfkpxSwB6PvqOF5S75ZMENG4OH8Dqus6NbX0XTB1/mJ
	3BdpTxVdebpvwsbd00PcXn8+SJ9z7Re6SVvx2E+Hr1RK3tMh7hbO57MAk+zo9fnKN6Ij+zR
	DkAbMD00OG8d5uxsNEWEARFz5tu7UJGU8uu5tjyMKkNbpwBxzUqkI/4vx7SdGSHEOj0suGb
	GZYtQ+T5Nn8Ok8/h0u+cXhGXWZyuNm9VH9Uyucio11yYDHT/Vbo00Xb9HKRan3HbFukG1Lu
	dXlahJQyGuah/e63hGzKGLz1sbYxpavxPK9YDqVlb7SmAycgLsY4Iat6752b9eiP5if49Yu
	JXSx9VzY/8EB4+/uknAX8M787Zii7l01Sa++DBISpPH+LbZZZf49Wemydzd6WExyJGcOf3j
	tRctQpgB1e3j1u/TDf7tWLteKTUvWDKQ7+jW+OngMAsVzue/Zwp/9RLBmFAebS4KBTP3tbh
	duUk7nv1O6Ne5qqTzkN2mSFgqrZI1Poy/NBkIGQkelNSNp11AzFgDQGiav2Bc+XzVTyDgbw
	PWjgBT62SKzwWGg06iJoXEGpmf0wPYSDGX/NIcUdre5qKKDiZTfPFxAgj8fTT2jMeZ2+e3U
	ZOgPTehSMV+qig7eIqUgUc1ZOErxbRa8G2HUQISZoC6pbQw5T9IBvsVbkav8d5j9b7rhCPK
	HbKV255T0Tm77ZSKfYWxgeu8YH0pd/oGdWK/0zMA==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_035829_663466_E1A503B5 
X-CRM114-Status: GOOD (  35.49  )
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


On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> Add initial implementation of RISC-V E-Trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
>
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/Kconfig           |  15 +
>  drivers/hwtracing/gtrace/Makefile          |   1 +
>  drivers/hwtracing/gtrace/rvtrace-ramsink.c | 320 +++++++++++++++++++++
>  3 files changed, 336 insertions(+)
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
>
> diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
> index e3a621b59913..de4a3b533591 100644
> --- a/drivers/hwtracing/gtrace/Kconfig
> +++ b/drivers/hwtracing/gtrace/Kconfig
> @@ -41,3 +41,18 @@ config RVTRACE_ENCODER
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called rvtrace-encoder.
> +
> +config RVTRACE_RAMSINK
> +	tristate "RISC-V Trace Ramsink driver"
> +	depends on RVTRACE
> +	select DMA_SHARED_BUFFER
> +	default y
> +	help
> +	  This driver provides support for the RISC-V trace ramsink component
> +	  which is defined by the RISC-V Trace Control Interface specification.
> +	  The ramsink is a trace sink which stores the trace data generated by
> +	  the upstream components into a system memory buffer. The buffer is
> +	  then copied to the perf AUX buffer when tracing using the perf tool.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rvtrace-ramsink.
> diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
> index 10a74f852115..3e0c68d1b632 100644
> --- a/drivers/hwtracing/gtrace/Makefile
> +++ b/drivers/hwtracing/gtrace/Makefile
> @@ -5,3 +5,4 @@ gtrace-y := gtrace-core.o
>  
>  obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
>  obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> +obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
> diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> new file mode 100644
> index 000000000000..7ed25cf364a7
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/gtrace.h>
> +#include <linux/types.h>
> +#include <linux/sizes.h>
> +#include <uapi/linux/perf_event.h>
> +#include "rvtrace.h"
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
> +	u64 prev_wp;
> +};
> +
> +struct trace_buf {
> +	void *base;
> +	size_t cur;
> +	size_t len;
> +};
> +
> +static int rvtrace_ramsink_start(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = gtrace_enable_component(comp);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to start ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_ramsink_stop(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = gtrace_disable_component(comp);
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
> +	/* If destination cannot hold entire source buffer then write only the latest data. */
> +	if (dst->len < size) {
> +		src->cur = (src->cur + size - dst->len) % src->len;
> +		size = dst->len;
> +	}
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
> +static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
> +					    struct gtrace_perf_auxbuf *buf,
> +					    u64 *format)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +	struct trace_buf src, dst;
> +	u32 wp_low, wp_high;
> +	size_t bytes = 0;
> +	bool wrap;
> +	u64 wp;
> +
> +	dst.base = buf->base;
> +	dst.len = buf->length;
> +	dst.cur = buf->pos;
> +	src.base = priv->va;
> +	src.len = priv->size;
> +	wp_low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> +	wp_high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> +	wp = (u64)(wp_high) << 32 | wp_low;
> +	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
> +	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
> +	if (wrap) {
> +		gtrace_write32(comp->pdata, lower_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPLOW_OFF);
> +		gtrace_write32(comp->pdata, upper_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPHIGH_OFF);
> +		src.cur = wp - priv->start;
> +		priv->prev_wp = priv->start;
> +		/*
> +		 * There is no way to tell if trRamWp wrapped around more than once. As a
> +		 * result priv->prev_wp can't be used and the entire buffer must be copied
> +		 * even though some data might be duplicated.
> +		 */
> +		bytes = priv->size;
> +	} else {
> +		src.cur =  priv->prev_wp - priv->start;
> +		bytes = wp - priv->prev_wp;
> +		priv->prev_wp = wp;
> +	}
> +
> +	tbuf_to_pbuf_copy(&src, &dst, bytes);
> +	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
> +	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
> +	return bytes;
> +}
> +
> +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> +				     struct rvtrace_ramsink_priv *priv)
> +{
> +	struct device *pdev = comp->pdata->dev;
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +	int ret;
> +
> +	/* Probe min and max values for start and limit registers */
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	start_min = (u64)(high) << 32 | low;
> +
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
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
> +	priv->prev_wp = priv->start;
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
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
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
> +	gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
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
> +static int rvtrace_ramsink_setup(struct gtrace_component *comp)
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

I think `trram_ctrl` should not be written during the `probe`. We may modify `rvtrace_ramsink_priv`

through sysfs or perf events.

> +	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> +	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
> +		 "SMEM" : "SRAM");
> +
> +	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
> +	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	ret = rvtrace_ramsink_setup_buf(comp, priv);
> +	if (!ret)
> +		dev_set_drvdata(&comp->dev, priv);
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +
> +	dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->start);
> +}
> +
> +static int rvtrace_ramsink_probe(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_ramsink_setup(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_remove(struct gtrace_component *comp)
> +{
> +	rvtrace_ramsink_cleanup(comp);
> +}
> +
> +static const struct gtrace_component_id rvtrace_ramsink_ids[] = {
> +	{ .type = GTRACE_RVTRACE_RAMSINK,
> +	  .version = rvtrace_component_mkversion(1, 0), },
> +	{},
> +};
> +
> +static struct gtrace_driver rvtrace_ramsink_driver = {
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
> +	return gtrace_register_driver(&rvtrace_ramsink_driver);
> +}
> +
> +static void __exit rvtrace_ramsink_exit(void)
> +{
> +	gtrace_unregister_driver(&rvtrace_ramsink_driver);
> +}
> +
> +module_init(rvtrace_ramsink_init);
> +module_exit(rvtrace_ramsink_exit);
> +
> +/* Module information */
> +MODULE_AUTHOR("Mayuresh Chitale");
> +MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
> +MODULE_LICENSE("GPL");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
