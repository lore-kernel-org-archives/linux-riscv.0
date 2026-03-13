Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29BC105F782
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 09:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1mTFf4Swc7T2c1/GhMibeRwUoScRfsrPOqU6YSVa+0=; b=dP7Qzig9JLjDwS
	esw1Rot+QuGV6+2G1gUvQPKPRLLwUDO0SMZxDBs4tcS6h2lkeQQ30lgoXxBKmx4xaNKbcz5FmvQ1K
	G0ZqVeuOF9F+YwCMGNKS3wCGXsLOBJnCZYJ3mtWod+6JrPBD1zAicNj0iBnPs8Xst9rwNqzIIgHon
	fEWXw3WRs3hqlpDsKhke5BCaVqTD2GhG66VtW1zVUEPiDy0pdUTs3yBAyBZ5VDj6Yphw8twnig1Yq
	x3XxwRkrctMFCbF+37txDH8msdkmDtIVBktZt+YYwdK7WoqQinLfolXcgRZ/JMkJaYNnG19zesNf5
	lF67HUVCptockQp9EHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yWm-0000000HM19-3BOM;
	Fri, 13 Mar 2026 09:09:52 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yWj-0000000HM0l-3X06
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 09:09:51 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d76a331ebbso1300271a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 02:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773392988; cv=none;
        d=google.com; s=arc-20240605;
        b=TS4CKGc1aQAhhKKdkGH1QXHDOq+tKEuXR6B2TaTtGyQ4+vWk1xRCfCI5IH6x1FLkXI
         ySaMhw1gbj2cS4qcXcHi8RdAsCssnCq+9qLj9lQd6lINTdNTqgQpzuWQJuEJGPG07mek
         naQecEvquGOhx/O9xgvQg7749+zrgCpi0j8IthcnePYDsHDr/JK+gluAMcvg1cic1SSn
         IOuI19IvBdg3yFlZbzfqhA/Z9m+l9oMpzAl4x+8+201pu8kP4UgV0wZHJtrsNMdreVNL
         YRpBKvpm0K6b80W/m24hTZkbegYPSLF+MfAbvsKnIi4MDae1mEOa4mr2H+uJ9m6eYvHt
         nNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jD3yFgzucS1yBN+JcINxzltwlVIBO2L/z6C3mDwI3lU=;
        fh=W/J9g1xuiQkQ4p6yKefnrEkOhBsNWXfPlTA/gdQUcAk=;
        b=Fyiop4Y8nXo//1rZIXMGhvfPO98pwMe9234QT7wlgGvjvsaoMs6EFnyhZZcoP326ot
         ld/mWlDsTDCqWS6nf++8FgX0udZTP/6ZsU7JtsxCYsXqIu2nkpODz4s2DtYAIUtQPC9o
         1fHSvWtM9SVEhLGK4jZ9WEbaRuYZB6gKcjwVeJSW973GqLbtDEGiVcj2c1yOKwVtfA4e
         lqDVj0AaXJObVQLD5m0yW1Bndebre/KSGm1UNi4TSLNPDOHlmiZltPNXzsvvpZZnDosl
         WUTSPVduzGDShQv6MKyEIVjbwuAX5cbx6fuJ5cSk9uHzy5ocE9rTBIbsFALKFOOre3Jr
         Dn8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773392988; x=1773997788; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jD3yFgzucS1yBN+JcINxzltwlVIBO2L/z6C3mDwI3lU=;
        b=bpjG9mtpTHOmlJ+Msr30swgyPaCGpN9voYwHCVATwAEP4FuR7EvXa2DbHuJe5QGC0S
         roLp67r8xqnqQlJ4fTq//jOyYV9zd4nUSoY8QtRvuP+fKONipvywmWMDTd8woaL5w/pq
         CqCSilnqXNo3aBX69es7wu7/s2MkyyJ9o7Ymj6n5DDl0jm1hGN/qTKDudHgv5XQJD+oJ
         3a9arJV2HmB02yLbM0c+1o5iGDg1bjFUZdha30GXo+1oBzO/NwGSl4vlBH1CdfqV/JDm
         xasqsUE2Yk33YSK7XzdAPKuvY5CExMOON5sG8/gGlhh27D1xfd53HgRBIPhIVhcBaGf6
         gTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392988; x=1773997788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD3yFgzucS1yBN+JcINxzltwlVIBO2L/z6C3mDwI3lU=;
        b=NmsEd2AGBJ3VmIb830OIBytA10Ilc7f1o2p+a9MmZZZPOgK604l1a8HbtWWoHOjbPt
         wJqqENo7VhBWw5yFh1wfzeoQZHp3FS8IGZxi22u4SnCZM1ZOcc8cgZnjh3cRlmICtmNW
         BkRosNO3q27lkMh+l509bgyOaAUaOyzaFruLoP0yxTu8RUVgnKHUE+kNn0WHi2TYymH4
         uPT3KVUaDWcJ7X+iv6J4gZZ5ynIjNbd58Y+88hsmkEncOZ8frmuk7xsxEovwQdr5T70V
         jEBpuhthEvKm1tETZsahEcvyhUiUNMNwVufMfQ38p+oWMTbrdR6nDw80S43dQ7RnEDh/
         TnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF7bA7b2u6zc4/mNPS/kSHL2la0qxQFVwANUSSj4XQM4RQbliHcHN6zIRdWN8huxI2msAfHWZP95DcZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBEniQ3i9n0Jm3DcpyPkIgS8pwiapBnO9TvleJdoZTf5lCDygm
	WBwRjfyiXXhDNq7/qr2Y8TIZqvbsWKiQcu98uiOtHGEOMgWYG2M7uTdYJdXbtc9aLQdeCn5AK+P
	0+37EyrnkVQCZSbBxCQ9Or5OaCZqADRsmp0G8RIZ4Yg==
X-Gm-Gg: ATEYQzyYAumpM3F1HCDzNPzS3M2ABN5mTop4yK45LKCxEvZoZ+ey/na1UPnSCKaacAc
	M7lkbqTYAkW9v2kkcBB3YvG99O2PDzoNs4YmjAexYjSCZfQOPrWLiNC7vWylxEOScAAgvg1n5dr
	0+YYciTwN6w6B+T2ivSG54Trmsgy24+GzLzgfRve4YNagpbgJgV0W69FcUB0fQkyN2M1VYTxKbf
	CLrxkGof4BVIcjzrEICqk0LIKXWoy29mgZyeL71rixHtWZeKvmOQq5hEQMwTVdgpvs4+4D+Sil1
	2knRvChtGdMGWGv3RVr9
X-Received: by 2002:a05:6820:4b18:b0:67b:aac1:5054 with SMTP id
 006d021491bc7-67bda9bde9cmr1411972eaf.27.1773392988346; Fri, 13 Mar 2026
 02:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABvJ_xhtx1Ym8qyr6HsLWnkV6_c=V7TpKOYY3L-gKnVDr87rcA@mail.gmail.com>
In-Reply-To: <CABvJ_xhtx1Ym8qyr6HsLWnkV6_c=V7TpKOYY3L-gKnVDr87rcA@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 13 Mar 2026 17:09:36 +0800
X-Gm-Features: AaiRm53Rf3qyp9z5prSBdOPVYkZF3JrpTmA7b0Mkkg8QqNyn4AH2_emy-F9ES1w
Message-ID: <CABvJ_xj+FtKgLN1Ur36ks7OLNWCy9-AotbfhsF6m1H4ycUSznA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] rvtrace: Add trace ramsink driver
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_020949_944708_D4AA0857 
X-CRM114-Status: GOOD (  34.12  )
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
> diff --git a/drivers/hwtracing/rvtrace/Kconfig
> b/drivers/hwtracing/rvtrace/Kconfig
> index ba35c05f3f54..0577f9acb858 100644
> --- a/drivers/hwtracing/rvtrace/Kconfig
> +++ b/drivers/hwtracing/rvtrace/Kconfig
> @@ -21,3 +21,12 @@ config RVTRACE_ENCODER
>   default y
>   help
>    This driver provides support for RISC-V Trace Encoder component.
> +
> +config RVTRACE_RAMSINK
> + tristate "RISC-V Trace Ramsink driver"
> + depends on RVTRACE
> + select DMA_SHARED_BUFFER
> + default y
> + help
> +  This driver provides support for Risc-V E-Trace Ramsink
> +  component.
> diff --git a/drivers/hwtracing/rvtrace/Makefile
> b/drivers/hwtracing/rvtrace/Makefile
> index f320693a1fc5..122e575da9fb 100644
> --- a/drivers/hwtracing/rvtrace/Makefile
> +++ b/drivers/hwtracing/rvtrace/Makefile
> @@ -3,3 +3,4 @@
>  obj-$(CONFIG_RVTRACE) += rvtrace.o
>  rvtrace-y := rvtrace-core.o rvtrace-platform.o
>  obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> +obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
> diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
> b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
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
> +#define RVTRACE_RAMSINK_STARTLOW_OFF 0x010
> +#define RVTRACE_RAMSINK_STARTHIGH_OFF 0x014
> +#define RVTRACE_RAMSINK_LIMITLOW_OFF 0x018
> +#define RVTRACE_RAMSINK_LIMITHIGH_OFF 0x01c
> +#define RVTRACE_RAMSINK_WPLOW_OFF 0x020
> +#define RVTRACE_RAMSINK_WPHIGH_OFF 0x024
> +#define RVTRACE_RAMSINK_WPLOW_WRAP 0x1
> +#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT 0x4
> +#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT 0x8
> +
> +enum rvtrace_ramsink_mode {
> + MODE_SRAM,
> + MODE_SMEM
> +};
> +
> +struct rvtrace_ramsink_priv {
> + size_t size;
> + void *va;
> + dma_addr_t start;
> + dma_addr_t end;
> + enum rvtrace_ramsink_mode mode;
> + bool stop_on_wrap;
> + int mem_acc_width;
> +};
> +
> +struct trace_buf {
> + void *base;
> + long cur;
> + size_t len;
> +};
> +
> +static int rvtrace_ramsink_start(struct rvtrace_component *comp)
> +{
> + int ret;
> + u32 val;
> +
> + val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> + val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> + rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> + ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> +       comp->pdata->control_poll_timeout_usecs);
> + if (ret)
> + dev_err(&comp->dev, "failed to start ramsink.\n");
> +
> + return ret;
> +}
> +
> +static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
> +{
> + int ret;
> + u32 val;
> +
> + val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> + val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> + rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> + ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> +       comp->pdata->control_poll_timeout_usecs);
> + if (ret) {
> + dev_err(&comp->dev, "failed to stop ramsink.\n");
> + return ret;
> + }
> +
> + return rvtrace_comp_poll_empty(comp);
> +}
> +
> +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf
> *dst, size_t size)
> +{
> + int bytes_dst, bytes_src, bytes;
> + void *dst_addr, *src_addr;
> +
> + while (size) {
> + src_addr = src->base + src->cur;
> + dst_addr = dst->base + dst->cur;
> +
> + /* Ensure that there are no OOB memory accesses */
> + if (dst->len - dst->cur < size)
> + bytes_dst = dst->len - dst->cur;
> + else
> + bytes_dst = size;
> +
> + if (src->len - src->cur < size)
> + bytes_src = src->len - src->cur;
> + else
> + bytes_src = size;
> + bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
> + memcpy(dst_addr, src_addr, bytes);
> + dst->cur = (dst->cur + bytes) % dst->len;
> + src->cur = (src->cur + bytes) % src->len;
> + size -= bytes;
> + }
> +}
> +
> +static size_t rvtrace_ramsink_copyto_auxbuf(struct rvtrace_component *comp,
> +    struct rvtrace_perf_auxbuf *buf)
> +{
> + struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> + size_t size_wp_end = 0, size_start_wp = 0;
> + struct trace_buf src, dst;
> + u32 wp_low, wp_high, trram_ctrl;
> + u64 buf_cur_head;
> +
> + dst.base = buf->base;
> + dst.len = buf->length;
> + dst.cur = buf->pos;
> + src.base = priv->va;
> + src.len = priv->size;
> + wp_low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> + wp_high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> + buf_cur_head = (u64)(wp_high) << 32 | wp_low;
> + trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> + if (buf_cur_head & 0x1) {
> + buf_cur_head &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
> + rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> + RVTRACE_RAMSINK_WPLOW_OFF);
> + rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> + RVTRACE_RAMSINK_WPHIGH_OFF);
> + src.cur = buf_cur_head - priv->start;
> + size_wp_end = priv->end - buf_cur_head;
> + tbuf_to_pbuf_copy(&src, &dst, size_wp_end);
> + }

Hi Anup,
I have two questions about the handling of the wrap case.
1. If I understand correctly, the perf_aux_event has a flag,
PERF_AUX_FLAG_TRUNCATED, which is used to indicate whether data loss
has occurred within a record slice. Users can use perf commands such
as perf report --stats to determine if the trace log contains the
complete history. I notice that this driver currently sets
stop_on_wrap=false unconditionally, which means the hardware will wrap
around and overwrite old data when the buffer is full. However, I
don't see PERF_AUX_FLAG_TRUNCATED being set when wrap occurs.
According to other drivers (e.g., ARM CoreSight ETR)
ERF_AUX_FLAG_TRUNCATED should NOT be set in snapshot mode because:
a) Data overwrite is expected behavior in snapshot mode,
b) Setting TRUNCATED prevents the perf core from re-enabling the event
Is the current implementation assuming that this driver only supports snapshot?

2. Currently, perf tool snapshot mode requires users to explicitly add
the "-S" option to perf record. If this driver only supports snapshot
mode, do we consider either:
a) Reject non-snapshot mode in rvtrace_setup_aux() with an error
message like: "RISC-V TCI requires snapshot mode. Please use: perf
record -S ..."
or
b) Emit a warning when snapshot=false is detected: "RISC-V TCI:
non-snapshot mode not supported, forcing snapshot mode"
This would prevent users from unknowingly losing data when the buffer
wraps around in non-snapshot mode.
What do you think?

Thanks,
Vincent Chen
> +
> + src.cur = 0;
> + size_start_wp = buf_cur_head - priv->start;
> + tbuf_to_pbuf_copy(&src, &dst, size_start_wp);
> + dev_dbg(&comp->dev, "Copied %zu bytes\n", size_wp_end + size_start_wp);
> + return (size_wp_end + size_start_wp);
> +}
> +
> +static int rvtrace_ramsink_setup_buf(struct rvtrace_component *comp,
> +     struct rvtrace_ramsink_priv *priv)
> +{
> + struct device *pdev = comp->pdata->dev;
> + u64 start_min, limit_max, end;
> + u32 low, high;
> + int ret;
> +
> + /* Probe min and max values for start and limit registers */
> + rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> + rvtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> + low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> + high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
> + start_min = (u64)(high) << 32 | low;
> +
> + rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
> + rvtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> + low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> + high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> + limit_max = (u64)(high) << 32 | low;
> +
> + /* Set DMA mask based on the maximum allowed limit address */
> + ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
> + if (ret)
> + return ret;
> +
> + priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
> + if (!priv->va)
> + return -ENOMEM;
> +
> + priv->end = priv->start + priv->size;
> + if (priv->end <= start_min || priv->start >= limit_max) {
> + dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> + dev_err(&comp->dev, "DMA memory not addressable by device\n");
> + return -EINVAL;
> + }
> +
> + /* Setup ram sink start addresses */
> + if (priv->start < start_min) {
> + dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\n",
> + &priv->start, &start_min);
> + priv->va += start_min - priv->start;
> + priv->start = start_min;
> + }
> +
> + rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> RVTRACE_RAMSINK_STARTLOW_OFF);
> + rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> RVTRACE_RAMSINK_STARTHIGH_OFF);
> + rvtrace_write32(comp->pdata, lower_32_bits(priv->start),
> RVTRACE_RAMSINK_WPLOW_OFF);
> + rvtrace_write32(comp->pdata, upper_32_bits(priv->start),
> RVTRACE_RAMSINK_WPHIGH_OFF);
> + /* Setup ram sink limit addresses */
> + if (priv->end > limit_max) {
> + dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> + &priv->end, &limit_max);
> + priv->end = limit_max;
> + priv->size = priv->end - priv->start;
> + }
> +
> + /* Limit address needs to be set to end - mem_access_width to avoid
> overflow */
> + end = priv->end - priv->mem_acc_width;
> + rvtrace_write32(comp->pdata, lower_32_bits(end),
> RVTRACE_RAMSINK_LIMITLOW_OFF);
> + rvtrace_write32(comp->pdata, upper_32_bits(end),
> RVTRACE_RAMSINK_LIMITHIGH_OFF);
> + low = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> + high = rvtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> + end = (u64)(high) << 32 | low;
> + if (end != (priv->end - 4)) {
> + dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> + &priv->end, &end);
> + priv->end = end;
> + priv->size = priv->end - priv->start;
> + }
> +
> + return 0;
> +}
> +
> +static int rvtrace_ramsink_setup(struct rvtrace_component *comp)
> +{
> + struct rvtrace_ramsink_priv *priv;
> + u32 trram_ctrl;
> + int ret;
> +
> + priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> + if (!priv)
> + return -ENOMEM;
> +
> + /* Derive RAM sink memory size based on component implementation ID */
> + switch (comp->pdata->impid) {
> + default:
> + priv->size = SZ_1M;
> + priv->mode = MODE_SMEM;
> + priv->stop_on_wrap = false;
> + priv->mem_acc_width = 4;
> + break;
> + }
> +
> + trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> + trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> + rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> + trram_ctrl = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> + dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >>
> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
> + "SMEM" : "SRAM");
> +
> + trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
> + rvtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> + ret = rvtrace_ramsink_setup_buf(comp, priv);
> + if (!ret)
> + dev_set_drvdata(&comp->dev, priv);
> +
> + return ret;
> +}
> +
> +static void rvtrace_ramsink_cleanup(struct rvtrace_component *comp)
> +{
> + struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +
> + dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->start);
> +}
> +
> +static int rvtrace_ramsink_probe(struct rvtrace_component *comp)
> +{
> + int ret;
> +
> + ret = rvtrace_ramsink_setup(comp);
> + if (ret)
> + return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
> +
> + ret = rvtrace_enable_component(comp->pdata);
> + if (ret)
> + return dev_err_probe(&comp->dev, ret, "failed to enable ramsink.\n");
> +
> + return ret;
> +}
> +
> +static void rvtrace_ramsink_remove(struct rvtrace_component *comp)
> +{
> + int ret;
> +
> + ret = rvtrace_disable_component(comp->pdata);
> + if (ret)
> + dev_err(&comp->dev, "failed to disable ramsink.\n");
> +
> + rvtrace_ramsink_cleanup(comp);
> +}
> +
> +static struct rvtrace_component_id rvtrace_ramsink_ids[] = {
> + { .type = RVTRACE_COMPONENT_TYPE_RAMSINK,
> +  .version = rvtrace_component_mkversion(1, 0), },
> + {},
> +};
> +
> +static struct rvtrace_driver rvtrace_ramsink_driver = {
> + .id_table = rvtrace_ramsink_ids,
> + .copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
> + .stop = rvtrace_ramsink_stop,
> + .start = rvtrace_ramsink_start,
> + .probe = rvtrace_ramsink_probe,
> + .remove = rvtrace_ramsink_remove,
> + .driver = {
> + .name = "rvtrace-ramsink",
> + },
> +};
> +
> +static int __init rvtrace_ramsink_init(void)
> +{
> + return rvtrace_register_driver(&rvtrace_ramsink_driver);
> +}
> +
> +static void __exit rvtrace_ramsink_exit(void)
> +{
> + rvtrace_unregister_driver(&rvtrace_ramsink_driver);
> +}
> +
> +module_init(rvtrace_ramsink_init);
> +module_exit(rvtrace_ramsink_exit);
> +
> +/* Module information */
> +MODULE_AUTHOR("Mayuresh Chitale");
> +MODULE_DESCRIPTION("RISC-V Trace Ramsink Driver");
> +MODULE_LICENSE("GPL");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
