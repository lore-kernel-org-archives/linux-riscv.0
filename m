Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EFDC9830D
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 01:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBgXfjbRsq3DwRdsDfB1W48eurpFVwMxa2kg1nJnhWk=; b=R5IQ/xEVafZeyH
	RHITfxoZ1xMDDCYULaVGMB5geBfkBCPVYi5XmamJny1asDDnBNiXJARnqGrOBH0ANFoEXgQvgMs2D
	cHQa4sPMLb1CSm63keKdFpq7Qtd9ZrxE5wuk+Dm7vOpKgFdhd+bk9VFMoUYItLfcHyzfndb88/CWf
	/u8M5RMNx/P/UkROQbYuVdtPsMB2ApFKD7S9/8ckq6/uKDKf95/YVWChDfVHQ+q6ygBy7Ydev82YA
	ZsgRZ1jM2RQHZER4RxZ//D4mgsrtLFeMfCJwhnCJTrtgScAx/14zFTUY9yNXN4ye09aKyno4nUO27
	z94B+x9yb02/KQ1kqVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YO1-00000009oEv-0uG2;
	Thu, 24 Sep 2026 01:36:33 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9YNx-00000009oDK-0Npn
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 01:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790213743;
	bh=8lg/8NVROPsLq9SQUlJ7Qza84oerPlZNSR9NZZFHW34=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=xd6gZ8Np1gtwVkyipHb2p4kSKo9G+zbnXZFqhy5jVrmCUHgCIdihp9GoObVMQYnQk
	 fwpFgzx09SvYlX3CvH6i25dFMiCb5K+6RHwwV7VlPcEvQOq+y2QWLX+TJa72WfJ/Pr
	 hb8Kq7sUx8TJv5EcxSpDtKHCfA49HzdDFciY1ppA=
X-QQ-mid: esmtpsz11t1790213741t52c099bd
X-QQ-Originating-IP: /X6ez5xp1h+VSUPPiZ6rSEEGIxEJbjPMe4Up9dUSlbg=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 09:35:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8236474117218957168
Message-ID: <F0C528282F529674+89fb7412-4858-47c3-b344-c53986aaef10@linux.spacemit.com>
Date: Thu, 24 Sep 2026 09:35:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/14] gtrace: Add perf driver for tracing using perf
 tool
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
 <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-12-mayuresh.chitale@oss.qualcomm.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NuZvjORXcxgLG8Q9nSkncOatCvfO3Sc96wRChduE1tUFu8o1fsIHcfoa
	kpNNQfvhDdRGuUf22gwMeGNYVTm4tva526yYD85sHDZGdgdc71XOXgVLJdA0Q4IEAAIXziC
	oqLw8+DwCxflAhkJizzGmJnhMMWR6o0u6I+fUWG165HNQQGc2zVBngRSd0b04VJ2GqHT8Xn
	JncF6YH9w1Cb7OyfCiMUr4vALnQaEkhFmlAvqko7tSTKgXbyrI53owzmeDznBw4PSMTqthI
	U4M32JfBY6BTkv6k46pQwQjuI5BN1O44p2HP40wZgf4T+Ahu+zsGYN6kvJeDbFvyCrfPhj3
	cEoi4k6AejwzXgtb8dbq1POgN/1Irf4+MEs6CytKPJwD7uTXVGBSaG+MR0KIBZwe96JrHxA
	3QOIQ9LGrVHWacpmUW0JaAn3/GZbXeh2zL5wFV22j42bDOxiuT02K5d1+4VWP5CWcaA00x0
	CeyO6kV+ihuT5AyLxROF5Wg9vi4QmJEUjC/LbyhmfnYUHT+jxoHggAXIVMBDTnHGv1n3zBS
	jFrIDcfG9RR+JKfVjESD67wObXfepT+nfFViEe496raPeykZ6qK9wqGk65aVRZKjMajC2C1
	cYr/N0A3mom6t/5FvV5qgA8UiDSw/mBEHFiOdiwXh91R909ikvSnNfJ2iV8VCg/OoNmw44R
	5uwnMBrUA2Bybp+p0M26lOje1dSd0pxVZ4I8u46DWa1VkZbVTWla7KzJQkF/xcGcGyUSoLN
	xk8+taGcnhIgrcsunJRJFuwVZY3j2yVL6G+c0JgoFTwNCWFhxNJoYX8oeDpcWMu26JGfpT/
	qlUTb9CnBmEkeMIkuyKWpNLTm58pOIGw3gkL08ixCUa4WACxDzTBJqu88Bm5zY+Y6SqJsPx
	CNpcqMNXvYWgCh9ycPl58huvSs89tNL6M5GHB11FMH3F9THTA532urTftsLNQCibhwqYOw/
	VaObxSgU24g2ZJq6PjvVQOSqivnTSTCmtBRH1etb3pS8mNgOC8ZMmXcs2eo1VTsjliUywuF
	Z4NSj2h9QOSCJPA8vkrP+MkF/Xsg9CGcyFhe6B7xx1uN96hzHF
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_183629_873988_56ADEFBA 
X-CRM114-Status: GOOD (  38.91  )
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

Hi Mayuresh,

On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> Add perf driver for the gtrace similar to ARM Coresight and Hisilicon
> PTT drivers. The driver adds 'gtrace' event descriptor which can be used
> by the perf tool to record the trace data. The actual data format depends
> on type of encoder device and optionally the PMU specific trace format
> type.
>
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/Kconfig       |   1 +
>  drivers/hwtracing/gtrace/Makefile      |   2 +-
>  drivers/hwtracing/gtrace/gtrace-core.c |  15 +-
>  drivers/hwtracing/gtrace/gtrace-perf.c | 347 +++++++++++++++++++++++++
>  include/linux/gtrace.h                 |   3 +
>  5 files changed, 366 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/hwtracing/gtrace/gtrace-perf.c
>
> diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
> index de4a3b533591..e5b62d65e2fd 100644
> --- a/drivers/hwtracing/gtrace/Kconfig
> +++ b/drivers/hwtracing/gtrace/Kconfig
> @@ -3,6 +3,7 @@
>  menuconfig GTRACE
>  	tristate "Generic Hardware Trace Support"
>  	depends on OF
> +	select PERF_EVENTS
>  	help
>  	  This framework provides an architecture-neutral kernel interface
>  	  for hardware trace drivers. It builds a topological view of the
> diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
> index 3e0c68d1b632..aa044fdc787b 100644
> --- a/drivers/hwtracing/gtrace/Makefile
> +++ b/drivers/hwtracing/gtrace/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_GTRACE) += gtrace.o
> -gtrace-y := gtrace-core.o
> +gtrace-y := gtrace-core.o gtrace-perf.o
>  
>  obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
>  obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
> index 53a3679ba69f..102251f6a5a7 100644
> --- a/drivers/hwtracing/gtrace/gtrace-core.c
> +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> @@ -714,13 +714,26 @@ EXPORT_SYMBOL_GPL(__gtrace_register_driver);
>  
>  static int __init gtrace_init(void)
>  {
> +	int ret;
> +
>  	gtrace_init_type_idx();
>  
> -	return bus_register(&gtrace_bustype);
> +	ret = bus_register(&gtrace_bustype);
> +	if (ret)
> +		return ret;
> +
> +	ret = gtrace_perf_init();
> +	if (ret) {
> +		bus_unregister(&gtrace_bustype);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static void __exit gtrace_exit(void)
>  {
> +	gtrace_perf_exit();
>  	bus_unregister(&gtrace_bustype);
>  }
>  
> diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
> new file mode 100644
> index 000000000000..ed9155bbbdb7
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/gtrace-perf.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/list.h>
> +#include <linux/mm.h>
> +#include <linux/init.h>
> +#include <linux/perf_event.h>
> +#include <linux/vmalloc.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/slab.h>
> +#include <linux/stringhash.h>
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <linux/gtrace.h>
> +
> +#define GTRACE_PMU_NAME "gtrace"
> +static struct pmu gtrace_pmu;
> +static DEFINE_SPINLOCK(perf_buf_lock);
> +
> +/**
> + * struct gtrace_event_data - generic hardware trace perf event data
> + * @work:		Handle to free allocated memory outside IRQ context.
> + * @mask:		Hold the CPU(s) this event was set for.
> + * @aux_hwid_done:	Whether a CPU has emitted the TraceID packet or not.
> + * @path:		An array of path, each slot for one CPU.
> + * @buf:		Aux buffer / pages allocated by perf framework.
> + */
> +struct gtrace_event_data {
> +	struct work_struct work;
> +	cpumask_t mask;
> +	cpumask_t aux_hwid_done;
> +	struct gtrace_path * __percpu *path;
> +	struct gtrace_perf_auxbuf buf;
> +};
> +
> +struct gtrace_ctxt {
> +	struct perf_output_handle handle;
> +	struct gtrace_event_data *event_data;
> +};
> +
> +static DEFINE_PER_CPU(struct gtrace_ctxt, gtrace_ctxt);
> +
> +static void *alloc_event_data(int cpu)
> +{
> +	struct gtrace_event_data *event_data;
> +	cpumask_t *mask;
> +
> +	event_data = kzalloc_obj(*event_data);
> +	if (!event_data)
> +		return NULL;
> +
> +	/* Update mask as per selected CPUs */
> +	mask = &event_data->mask;
> +	if (cpu != -1)
> +		cpumask_set_cpu(cpu, mask);
> +	else
> +		cpumask_copy(mask, cpu_present_mask);
> +
> +	event_data->path = alloc_percpu(struct gtrace_path *);
> +	return event_data;
> +}
> +
> +static void gtrace_free_aux(void *data)
> +{
> +	struct gtrace_event_data *event_data = data;
> +
> +	schedule_work(&event_data->work);
> +}
> +
> +static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *data,
> +							int cpu)
> +{
> +	return per_cpu_ptr(data->path, cpu);
> +}
> +
> +static void free_event_data(struct work_struct *work)
> +{
> +	struct gtrace_event_data *event_data;
> +	struct gtrace_path *path;
> +	cpumask_t *mask;
> +	int cpu;
> +
> +	event_data = container_of(work, struct gtrace_event_data, work);
> +	mask = &event_data->mask;
> +	for_each_cpu(cpu, mask) {
> +		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
> +		gtrace_destroy_path(path);
> +	}
> +	free_percpu(event_data->path);
> +	kfree(event_data);
> +}
> +
> +static void *gtrace_setup_aux(struct perf_event *event, void **pages,
> +			       int nr_pages, bool overwrite)
> +{
> +	struct gtrace_event_data *event_data = NULL;
> +	struct page **pagelist;
> +	int cpu = event->cpu, i;
> +	cpumask_t *mask;
> +
> +	event_data = alloc_event_data(cpu);
> +	if (!event_data)
> +		return NULL;
> +
> +	INIT_WORK(&event_data->work, free_event_data);
> +	mask = &event_data->mask;
> +	/*
> +	 * Create the path for each CPU in the mask. In case of any failure skip the CPU
> +	 */
> +	for_each_cpu(cpu, mask) {
> +		struct gtrace_component *src;
> +		struct gtrace_path *path;
> +
> +		src = gtrace_cpu_source(cpu);
> +		if (!src)
> +			continue;
> +
> +		path = gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
> +		if (!path)
> +			continue;
> +
> +		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
> +	}
> +
> +	/* If we don't have any CPUs ready for tracing, abort */
> +	cpu = cpumask_first(&event_data->mask);
> +	if (cpu >= nr_cpu_ids)
> +		goto err;
> +
> +	pagelist = kcalloc(nr_pages, sizeof(*pagelist), GFP_KERNEL);
> +	if (!pagelist)
> +		goto err;
> +
> +	for (i = 0; i < nr_pages; i++)
> +		pagelist[i] = virt_to_page(pages[i]);
> +
> +	event_data->buf.base = vmap(pagelist, nr_pages, VM_MAP, PAGE_KERNEL);
> +	if (!event_data->buf.base) {
> +		kfree(pagelist);
> +		goto err;
> +	}
> +
> +	event_data->buf.nr_pages = nr_pages;
> +	event_data->buf.length = nr_pages * PAGE_SIZE;
> +	event_data->buf.pos = 0;
> +	return event_data;
> +err:
> +	gtrace_free_aux(event_data);
> +	return NULL;
> +}
> +
> +static void gtrace_event_read(struct perf_event *event)
> +{
> +}
> +
> +static void gtrace_event_destroy(struct perf_event *event)
> +{
> +}
> +
> +static int gtrace_event_init(struct perf_event *event)
> +{
> +	if (event->attr.type != gtrace_pmu.type)
> +		return -EINVAL;
> +
> +	event->destroy = gtrace_event_destroy;
> +	return 0;
> +}
> +
> +static void gtrace_event_start(struct perf_event *event, int flags)
> +{
> +	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
> +	struct perf_output_handle *handle = &ctxt->handle;
> +	struct gtrace_event_data *event_data;
> +	int cpu = smp_processor_id();
> +	struct gtrace_path *path;
> +
> +	if (WARN_ON(ctxt->event_data))
> +		goto fail;
> +
> +	/*
> +	 * Deal with the ring buffer API and get a handle on the
> +	 * session's information.
> +	 */
> +	event_data = perf_aux_output_begin(handle, event);
> +	if (!event_data)
> +		goto fail;
> +
> +	if (!cpumask_test_cpu(cpu, &event_data->mask))
> +		goto out;
> +
> +	event_data->buf.pos = handle->head % event_data->buf.length;
> +	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
> +	if (!path) {
> +		pr_err("Error. Path not found\n");
> +		return;
> +	}
> +
> +	if (gtrace_path_start(path)) {
> +		pr_err("Error. Tracing not started\n");
> +		return;
> +	}
> +
> +	/*
> +	 * output cpu / trace ID in perf record, once for the lifetime
> +	 * of the event.
> +	 */
> +	if (!cpumask_test_cpu(cpu, &event_data->aux_hwid_done)) {
> +		cpumask_set_cpu(cpu, &event_data->aux_hwid_done);
> +		perf_report_aux_output_id(event, cpu);
> +	}
> +
> +out:
> +	/* Tell the perf core the event is alive */
> +	event->hw.state = 0;
> +	ctxt->event_data = event_data;
> +	return;
> +fail:
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static void gtrace_event_stop(struct perf_event *event, int mode)
> +{
> +	struct gtrace_ctxt *ctxt = this_cpu_ptr(&gtrace_ctxt);
> +	struct perf_output_handle *handle = &ctxt->handle;
> +	struct gtrace_event_data *event_data;
> +	int ret, cpu = smp_processor_id();
> +	struct gtrace_path *path;
> +	size_t size;
> +	u64 format;
> +
> +	if (event->hw.state == PERF_HES_STOPPED)
> +		return;
> +
> +	if (handle->event &&
> +	    WARN_ON(perf_get_aux(handle) != ctxt->event_data))
> +		return;
> +
> +	event_data = ctxt->event_data;
> +	ctxt->event_data = NULL;
> +
> +	if (WARN_ON(!event_data))
> +		return;
> +
> +	if (handle->event && (mode & PERF_EF_UPDATE) && !cpumask_test_cpu(cpu, &event_data->mask)) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		perf_aux_output_end(handle, 0);
> +		return;
> +	}
> +
> +	/* stop tracing */
> +	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
> +	if (!path) {
> +		pr_err("Error. Path not found\n");
> +		return;
> +	}
> +
> +	if (gtrace_path_stop(path)) {
> +		pr_err("Error. Tracing not stopped\n");
> +		return;
> +	}
> +
> +	event->hw.state = PERF_HES_STOPPED;
> +	if (handle->event && (mode & PERF_EF_UPDATE)) {
> +		if (WARN_ON_ONCE(handle->event != event))
> +			return;
> +		spin_lock(&perf_buf_lock);
> +		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
> +		spin_unlock(&perf_buf_lock);
> +		WARN_ON_ONCE(ret);

In order to be compatible with Coresight Sink, I would like to change it like:

```

struct gtrace_component *sink = gtrace_path_sink(path);
spin_lock(&perf_buf_lock);
size = sink->copyto_auxbuf(sink, handle, &event_data->buf);
spin_unlock(&perf_buf_lock);

```

> +		if (READ_ONCE(handle->event)) {
> +			/* Tag the AUX data with the format reported by the sink. */
> +			perf_aux_output_flag(handle, format);
> +			if (size > handle->size) {
> +				size = handle->size;
> +				perf_aux_output_flag(handle, PERF_AUX_FLAG_TRUNCATED);
> +			}

This part should be moved to sink->copyto_ouxbuf() internally.

> +			perf_aux_output_end(handle, size);
> +		} else
> +			WARN_ON(size);
> +	}
> +}
> +
> +static int gtrace_event_add(struct perf_event *event, int mode)
> +{
> +	struct hw_perf_event *hwc = &event->hw;
> +	int ret = 0;
> +
> +	if (mode & PERF_EF_START) {
> +		gtrace_event_start(event, 0);
> +		if (hwc->state & PERF_HES_STOPPED)
> +			ret = -EINVAL;
> +	} else {
> +		hwc->state = PERF_HES_STOPPED;
> +	}
> +
> +	return ret;
> +}
> +
> +static void gtrace_event_del(struct perf_event *event, int mode)
> +{
> +	gtrace_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +PMU_FORMAT_ATTR(event, "config:0-0");
> +
> +static struct attribute *gtrace_pmu_formats_attr[] = {
> +	&format_attr_event.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group gtrace_pmu_format_group = {
> +	.name = "format",
> +	.attrs = gtrace_pmu_formats_attr,
> +};
> +
> +static const struct attribute_group *gtrace_pmu_attr_groups[] = {
> +	&gtrace_pmu_format_group,
> +	NULL,
> +};
> +
> +int __init gtrace_perf_init(void)
> +{
> +	gtrace_pmu.capabilities	= (PERF_PMU_CAP_EXCLUSIVE | PERF_PMU_CAP_ITRACE);
> +	gtrace_pmu.attr_groups		= gtrace_pmu_attr_groups;
> +	gtrace_pmu.task_ctx_nr		= perf_sw_context;
> +	gtrace_pmu.read		= gtrace_event_read;
> +	gtrace_pmu.event_init		= gtrace_event_init;
> +	gtrace_pmu.setup_aux		= gtrace_setup_aux;
> +	gtrace_pmu.free_aux		= gtrace_free_aux;
> +	gtrace_pmu.start		= gtrace_event_start;
> +	gtrace_pmu.stop		= gtrace_event_stop;
> +	gtrace_pmu.add			= gtrace_event_add;
> +	gtrace_pmu.del			= gtrace_event_del;
> +	gtrace_pmu.module		= THIS_MODULE;
> +
> +	return perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
> +}
> +
> +void __exit gtrace_perf_exit(void)
> +{
> +	perf_pmu_unregister(&gtrace_pmu);
> +}
> diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
> index bc82814e2738..439e2f091d4d 100644
> --- a/include/linux/gtrace.h
> +++ b/include/linux/gtrace.h
> @@ -317,4 +317,7 @@ static inline void gtrace_unregister_driver(struct gtrace_driver *gtdrv)
>  		driver_unregister(&gtdrv->driver);
>  }
>  
> +int gtrace_perf_init(void);
> +void gtrace_perf_exit(void);
> +
>  #endif /* __LINUX_GTRACE_H__ */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
