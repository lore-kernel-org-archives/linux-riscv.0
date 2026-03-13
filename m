Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E78106FD89
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eA1CpvLbuxJR1e6mLsQsDFMT5Cvyso2jONuL9eiyvLs=; b=apTIxQaDh269OH
	Uk/dnfcOAFQZ0/X9HYUAOtaaROFQhCtiKV7xi0gbPBa7G5vHQ+Ak9IzWkXW4q3r42mTlxYZ+QvUUS
	FTfgpuY/sMOY2Zl8OlTbGl20sVZqB5ghcnW79oAL6bKN8axj2DQgKIYoTX8GnHFVqGNfXLj2sNLJt
	/xX2AkWcSfWYm/xw2tsEYT+ucgcCjsine29GB/CUmSr0RPkEAva3tXq/5fBhChvcayu2c5hnIiNtg
	ShtNl4CO/iR2qiKCfZYeayojdxhT2pg7h5QqQvt11ZKfKIKeZ2N1qBMnI9nQhNxJVUfURpwHWPZPa
	IZsgQYw4ImpBn91F3j0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vxv-0000000GqZ8-42t8;
	Fri, 13 Mar 2026 06:25:43 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vxu-0000000GqXz-0Efd
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 06:25:43 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-67bbea1e090so1043713eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Mar 2026 23:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773383141; cv=none;
        d=google.com; s=arc-20240605;
        b=LlgXk5LCzUl+I8Mj+q1G4nH1q52UdX8oryN1L6mUjbzCfuPNy9eC1RlIsSr/lJ4nJH
         qoBuw9UPfKNBGBAltu4DCvtKY0KjOWbRq+IhEbwKaQN+V4uAv9F6NkKXREEwvL27XQP3
         sXga8IyYzYKZcabea7ATe3rwwPR+uU2cpA0c32GcTgSE7EXo9AbYW1nNkxrUHyLCKNrG
         GvmOaFdSAjZfHbs50NSSekHABzeOFs2k41Hjlr/drrxwULkyhHEpxN6boRZW2Crmgdup
         Ii6vboYeN06ElV4IqZjRIoW2+0+Z2x7L5tEDxWYNivMXlQ63hb4bO7baG7yCiryCkTPX
         Ot6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1lv1ChK1Be6u3mlQsi10zwsgQz95EDY6vz+1pRNTi7M=;
        fh=cqL0HgRJnxfW43EUQsLwbykIsaw1FOjASYZiTEYsMik=;
        b=SHg50HMwvweV/2GqzvWSxOqBT6p8SHukVnTr3GJJ3GD7AOfDpKtfrK9wQ0lxdUqXiC
         ooGiCLzCKyfuTVGycvm1wHqT/D7QZBmAAHzWpBQ1fgZ13+vexy/Y1MBn/eDewu6khZUY
         tx5OoTGgTztFbu6QlHyh4fYFf090O9L0+1pZPv4ho+0iWYt3nKFQLXB1sANoFwicG/IM
         kGnHnmTjMk4xT3Qqrh9zQGwT7+kbgqzQ1TI0TtvWhcQEe9C8w29I9hatHBnjUxSKCTBs
         n4v00yTclqtE2/2DwnnqAraTXbqy249eLQwkh5miNpf6qDbNOT8/bkWKlgLftCn7aj6z
         n5/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773383141; x=1773987941; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lv1ChK1Be6u3mlQsi10zwsgQz95EDY6vz+1pRNTi7M=;
        b=O6oufNrGgbggdpSchMoydDZJLyQ0dIZ07ksMPSYLB2wmCJOjMyncIvNZmkfCLOf/fP
         ztHgCwokfl602Rs7gKabXbF419yVG6HNGwzLzGu1ym5Ik6ZiwUjvV1MPranoYl6uxWUJ
         epnzqZ4dAJHCLEVunWAUv5VVDU3HJksVuY8GM2NQWt/amn0usN4pxgueYoO/nFnrpaWk
         OyCiTwKHlT/NVTKsU5SCrY4eevw0AH+GPaLSkqTOrFzE26HSzoJ3G7ATwWEmVMpNxtjV
         qngi4/bVyZl1/6hyXNq6v89qns9za9PeDU61iegfhxpJQmy+5MZC6qiLH8tTKpzKw63c
         3GEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773383141; x=1773987941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lv1ChK1Be6u3mlQsi10zwsgQz95EDY6vz+1pRNTi7M=;
        b=L9nQ9LtKiPnMz4b7Yxgdsnt9kVd81BBEuIjQecQHQWjCptfOg6l02WpCGbw6TFpcqt
         d8d7sM9tiU546PBvygnNWLIOYfcAqCnnO/pz90q8XYEjhJ6PYj41m/a3BhbbPm4GXIAN
         3Om8tsGc0XvLP5CtT9Ls29B4Z3wB3fAgnUpIXfM+YNBdqj7uwTJqgZIyRPrPbJpyJotr
         UqtVovMmNzTCU9s4EoPo71oTGGWk9yyGusWEGwh3OgWMID61zZK9dhJ0jF0lrWkfFjcd
         qebZULnPLdO4kQNsIbZnvgyf6l+33sX7DV/Zuvh8oXpoiYoYiRCJj1tMA0hGuqi7S0m7
         f/2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWMVUIZjK1wMoM3w8eEboPzuJ5Dw5j23dWMHyUIdRjF97165m+O1pyA0S7pDbCdElay6CJnE1tVRwaNRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1akB12tGU/djh3hsJT3NsTihGK496PL6ZegNSw24ku8XzpDkf
	/IPpIRtH6puiX7wkZGkIXTQ5bSIQ2dYdHr+uAaBE2lNNtquYbotCHTemYL5qR0tO/9vZSCjg7NR
	RZETqUYeAbRDuKxsV+FjwHS5qD5UYJ3o1YWJy8Awl4w==
X-Gm-Gg: ATEYQzxnVxHk0oSfhMmS25ERqfrdFjDkjR6aSZf6kdn29HV3aA/MSTpGsrv6srtyzRc
	vEh6GRLHLf+qNROOMD4rkRvd2xaZfhgB5AXKNM5WfUUvvqFGCQp2rjm8y98s45lZsp2LBB3sNgz
	OlKDm6VnflHYlLXQOtEBcW9BCTGidp6JPIQh8SCW6vjJt6tdvCRyBB4RbKE06UDHn8X24G6258x
	ttcCOIiMxyrrEXnAeEYgQujh/8KIV34krzuNVYMbiPz5fYfgzAViQtkVYomsyoM/0XSC2GyC9/R
	nBjcO/TPOg==
X-Received: by 2002:a05:6820:169e:b0:677:a19a:55b with SMTP id
 006d021491bc7-67bdaa8fa72mr1455444eaf.72.1773383140778; Thu, 12 Mar 2026
 23:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABvJ_xibk20PbZqk0aUwQ8tsSxte8txe=CV+PMnLnD-ojksv8Q@mail.gmail.com>
In-Reply-To: <CABvJ_xibk20PbZqk0aUwQ8tsSxte8txe=CV+PMnLnD-ojksv8Q@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Fri, 13 Mar 2026 14:25:29 +0800
X-Gm-Features: AaiRm53wQ2dMf8yly9LJKQQq34H5hIlI6MOnbXQQEbUZ46QlnFFShdCqYSvoNcw
Message-ID: <CABvJ_xjrUKyGUkbzhAX6DwwwZ3dJU7KThrO2Tz_MKL4T1Y+KDA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] rvtrace: Add functions to create/destroy a trace
 component path
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
X-CRM114-CacheID: sfid-20260312_232542_134590_1A021C6E 
X-CRM114-Status: GOOD (  31.60  )
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
> Trace needs to be configured on a chain of trace components which are
> connected to each other. These chain of components is also referred
> to as trace component path. Add functions to create/destroy a trace
> component path which will be later used by RISC-V trace perf support.
>
> Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/rvtrace-core.c | 223 +++++++++++++++++++++++
>  include/linux/rvtrace.h                  |  43 ++++-
>  2 files changed, 264 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c
> b/drivers/hwtracing/rvtrace/rvtrace-core.c
> index d69c2236493a..5f40bad215e0 100644
> --- a/drivers/hwtracing/rvtrace/rvtrace-core.c
> +++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
> @@ -229,6 +229,53 @@ int rvtrace_reset_component(struct
> rvtrace_platform_data *pdata)
>  }
>  EXPORT_SYMBOL_GPL(rvtrace_reset_component);
>
> +static int __rvtrace_walk_output_components(struct rvtrace_component *comp,
> +    bool *stop, void *priv,
> +    int (*fn)(struct rvtrace_component *comp, bool *stop,
> +      struct rvtrace_connection *stop_conn,
> +      void *priv))
> +{
> + struct rvtrace_connection *conn, *stop_conn = NULL;
> + struct rvtrace_platform_data *pdata = comp->pdata;
> + int i, ret;
> +
> + for (i = 0; i < pdata->nr_outconns; i++) {
> + conn = pdata->outconns[i];
> + ret = __rvtrace_walk_output_components(conn->dest_comp, stop, priv, fn);
> + if (ret)
> + return ret;
> + if (*stop) {
> + stop_conn = conn;
> + break;
> + }
> + }
> +
> + ret = fn(comp, stop, stop_conn, priv);
> + if (ret)
> + return ret;
> +
> + return 0;
> +}
> +
> +int rvtrace_walk_output_components(struct rvtrace_component *comp, void *priv,
> +   int (*fn)(struct rvtrace_component *comp, bool *stop,
> +     struct rvtrace_connection *stop_conn,
> +     void *priv))
> +{
> + bool stop = false;
> + int ret;
> +
> + if (!comp || !fn)
> + return -EINVAL;
> +
> + mutex_lock(&rvtrace_mutex);
> + ret = __rvtrace_walk_output_components(comp, &stop, priv, fn);
> + mutex_unlock(&rvtrace_mutex);
> +
> + return ret;
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_walk_output_components);
> +
>  struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu)
>  {
>   if (!cpu_present(cpu))
> @@ -452,6 +499,182 @@ void rvtrace_unregister_component(struct
> rvtrace_component *comp)
>  }
>  EXPORT_SYMBOL_GPL(rvtrace_unregister_component);
>
> +struct rvtrace_path_node {
> + struct list_head head;
> + struct rvtrace_component *comp;
> + struct rvtrace_connection *conn;
> +};
> +
> +struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path)
> +{
> + struct rvtrace_path_node *node;
> +
> + node = list_first_entry(&path->comp_list, struct rvtrace_path_node, head);
> + return node->comp;
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_path_source);
> +
> +struct rvtrace_component *rvtrace_path_sink(struct rvtrace_path *path)
> +{
> + struct rvtrace_path_node *node;
> +
> + node = list_last_entry(&path->comp_list, struct rvtrace_path_node, head);
> + return node->comp;
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_path_sink);
> +
> +static int rvtrace_assign_trace_id(struct rvtrace_path *path)
> +{
> + const struct rvtrace_driver *rtdrv;
> + struct rvtrace_component *comp;
> + struct rvtrace_path_node *node;
> + int trace_id;
> +
> + list_for_each_entry(node, &path->comp_list, head) {
> + comp = node->comp;
> + rtdrv = to_rvtrace_driver(comp->dev.driver);
> +
> + if (!rtdrv->get_trace_id)
> + continue;
> +
> + trace_id = rtdrv->get_trace_id(comp, path->mode);
> + if (trace_id > 0) {
> + path->trace_id = trace_id;
> + return 0;
> + } else if (trace_id < 0) {
> + return trace_id;
> + }
> + }
> +
> + return 0;
> +}
> +
> +static void rvtrace_unassign_trace_id(struct rvtrace_path *path)
> +{
> + const struct rvtrace_driver *rtdrv;
> + struct rvtrace_component *comp;
> + struct rvtrace_path_node *node;
> +
> + list_for_each_entry(node, &path->comp_list, head) {
> + comp = node->comp;
> + rtdrv = to_rvtrace_driver(comp->dev.driver);
> +
> + if (!rtdrv->put_trace_id)
> + continue;
> +
> + rtdrv->put_trace_id(comp, path->mode, path->trace_id);
> + }
> +}
> +
> +static bool rvtrace_path_ready(struct rvtrace_path *path)
> +{
> + struct rvtrace_path_node *node;
> +
> + list_for_each_entry(node, &path->comp_list, head) {
> + if (!node->comp->ready)
> + return false;
> + }
> +
> + return true;
> +}
> +
> +struct build_path_walk_priv {
> + struct rvtrace_path *path;
> + struct rvtrace_component *sink;
> +};
> +
> +static int build_path_walk_fn(struct rvtrace_component *comp, bool *stop,
> +      struct rvtrace_connection *stop_conn,
> +      void *priv)
> +{
> + struct build_path_walk_priv *ppriv = priv;
> + struct rvtrace_path *path = ppriv->path;
> + struct rvtrace_path_node *node;
> +
> + if ((!ppriv->sink && rvtrace_is_sink(comp->pdata)) ||
> +    (ppriv->sink && ppriv->sink == comp))
> + *stop = true;
> +
> + if (*stop) {
> + node = kzalloc(sizeof(*node), GFP_KERNEL);
> + if (!path)

Hi Anup,
It looks like there's a typo here. I believe this should be if (!node)
instead of if (!path).

> + return -ENOMEM;
> + INIT_LIST_HEAD(&node->head);
> + rvtrace_get_component(comp);
> + node->comp = comp;
> + node->conn = stop_conn;
> + list_add(&node->head, &path->comp_list);
> + }
> +
> + return 0;
> +}
> +
> +static void rvtrace_release_path_nodes(struct rvtrace_path *path)
> +{
> + struct rvtrace_path_node *node, *node1;
> +
> + list_for_each_entry_safe(node, node1, &path->comp_list, head) {
> + list_del(&node->head);
> + rvtrace_put_component(node->comp);
> + kfree(node);
> + }
> +}
> +
> +struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
> + struct rvtrace_component *sink,
> + enum rvtrace_component_mode mode)
> +{
> + struct build_path_walk_priv priv;
> + struct rvtrace_path *path;
> + int ret = 0;
> +
> + if (!source || mode >= RVTRACE_COMPONENT_MODE_MAX) {
> + ret = -EINVAL;
> + goto err_out;
> + }
> +
> + path = kzalloc(sizeof(*path), GFP_KERNEL);
> + if (!path) {
> + ret = -ENOMEM;
> + goto err_out;
> + }
> + INIT_LIST_HEAD(&path->comp_list);
> + path->mode = mode;
> + path->trace_id = RVTRACE_INVALID_TRACE_ID;
> +
> + priv.path = path;
> + priv.sink = sink;
> + ret = rvtrace_walk_output_components(source, &priv, build_path_walk_fn);
> + if (ret < 0)
> + goto err_release_path_nodes;
> +
> + if (!rvtrace_path_ready(path)) {
> + ret = -EOPNOTSUPP;
> + goto err_release_path_nodes;
> + }
> +
> + ret = rvtrace_assign_trace_id(path);
> + if (ret < 0)
> + goto err_release_path_nodes;
> +
> + return path;
> +
> +err_release_path_nodes:
> + rvtrace_release_path_nodes(path);
> + kfree(path);
> +err_out:
> + return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_create_path);
> +
> +void rvtrace_destroy_path(struct rvtrace_path *path)
> +{
> + rvtrace_unassign_trace_id(path);
> + rvtrace_release_path_nodes(path);
> + kfree(path);
> +}
> +EXPORT_SYMBOL_GPL(rvtrace_destroy_path);
> +
>  int __rvtrace_register_driver(struct module *owner, struct
> rvtrace_driver *rtdrv)
>  {
>   rtdrv->driver.owner = owner;
> diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
> index d6be6e3cc10f..00b63fa22da9 100644
> --- a/include/linux/rvtrace.h
> +++ b/include/linux/rvtrace.h
> @@ -8,6 +8,8 @@
>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/limits.h>
> +#include <linux/list.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  #include <linux/types.h>
> @@ -72,6 +74,12 @@ enum rvtrace_component_impid {
>   RVTRACE_COMPONENT_IMPID_MAX
>  };
>
> +/* Supported usage modes for RISC-V trace components */
> +enum rvtrace_component_mode {
> + RVTRACE_COMPONENT_MODE_PERF,
> + RVTRACE_COMPONENT_MODE_MAX
> +};
> +
>  /**
>   * struct rvtrace_connection - Representation of a physical connection between
>   * two RISC-V trace components.
> @@ -239,6 +247,10 @@ int rvtrace_enable_component(struct
> rvtrace_platform_data *pdata);
>  int rvtrace_disable_component(struct rvtrace_platform_data *pdata);
>  int rvtrace_reset_component(struct rvtrace_platform_data *pdata);
>
> +int rvtrace_walk_output_components(struct rvtrace_component *comp, void *priv,
> +   int (*fn)(struct rvtrace_component *comp, bool *stop,
> +     struct rvtrace_connection *stop_conn,
> +     void *priv));
>  struct rvtrace_component *rvtrace_cpu_source(unsigned int cpu);
>
>  struct rvtrace_component *rvtrace_register_component(enum
> rvtrace_component_type type,
> @@ -246,17 +258,44 @@ struct rvtrace_component
> *rvtrace_register_component(enum rvtrace_component_type
>       struct rvtrace_platform_data *pdata);
>  void rvtrace_unregister_component(struct rvtrace_component *comp);
>
> +/**
> + * struct rvtrace_path - Representation of a RISC-V trace path from
> source to sink
> + * @comp_list: List of RISC-V trace components in the path
> + * @mode:      Usage mode for RISC-V trace components
> + * @trace_id:  ID of the trace source (typically hart id)
> + */
> +struct rvtrace_path {
> + struct list_head comp_list;
> + enum rvtrace_component_mode mode;
> + u32 trace_id;
> +#define RVTRACE_INVALID_TRACE_ID 0
> +};
> +
> +struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path);
> +struct rvtrace_component *rvtrace_path_sink(struct rvtrace_path *path);
> +struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
> + struct rvtrace_component *sink,
> + enum rvtrace_component_mode mode);
> +void rvtrace_destroy_path(struct rvtrace_path *path);
> +
>  /**
>   * struct rvtrace_driver - Representation of a RISC-V trace driver
>   * id_table: Table to match components handled by the driver
> - * probe:    Driver probe() function
> - * remove:   Driver remove() function
> + * probe:        Driver probe() function
> + * remove:       Driver remove() function
> + * get_trace_id: Get/allocate a trace ID
> + * put_trace_id: Put/free a trace ID
>   * driver:   Device driver instance
>   */
>  struct rvtrace_driver {
>   const struct rvtrace_component_id *id_table;
>   int (*probe)(struct rvtrace_component *comp);
>   void (*remove)(struct rvtrace_component *comp);
> + int (*get_trace_id)(struct rvtrace_component *comp,
> + enum rvtrace_component_mode mode);
> + void (*put_trace_id)(struct rvtrace_component *comp,
> + enum rvtrace_component_mode mode,
> + u32 trace_id);
>   struct device_driver driver;
>  };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
