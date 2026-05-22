Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F2DCD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 19:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYNom7ektTAnQgt/KlGzG5fOZFQVJluVoOaQa5Nu4z0=; b=VZtS9Fzy7DFf8B
	yoYa45V3XbonfOMREx+DUEFL2n5nQGLvM2hzUw/0dpXkliOEoqhio6uwb37PsunR36kndNmqXoJz7
	CgmNM9KEcimTMOrhavqx6lM1jkY2BApBvfP8NMGN1U3w+hAHL+RXPJieHJpZj6tNQuvbHD/7h7mx8
	YhaqMkExJgELpTzedMro7M/I8J+efNjNZSplZOyidLEQwBpgRUCUNgXA51Mkyh86isNnxS3Rq6wCs
	L30o7w0auYsapGELeIPBwVsAMybalXXQxLJa0SEgZP+a0IB8QAbK4Db0onxAxH+lEdsVyYlmHvhrC
	o2t8oRVgeZYu7nWndUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVxz-0000000Bp78-1q7B;
	Fri, 22 May 2026 19:55:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQVxx-0000000Bp6e-133w
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 19:55:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so22459315e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779479727; x=1780084527; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vC76+wE+m69DnNHzueD5T2LV/NT7LEvFIu8/P6enzg=;
        b=fOeb9Kkp9eU8D7Qt31BniV6Gpkjte9cmMERjgj7oEvtE6iOYGwyHClzQUb5W3N10aT
         XxpLqxIYmDRiBqDm3wiT5aZeoHUY6QdJwWCV7NzV5y9sr0F7tM0l9NamvHlUgWUYYb+2
         gJ03W06+S5Mx7yYOaGkp9ub+4GX4cz7J7Vor9ENsRmn+85h12/pI8EdiLxsT+zlHY9j+
         TLylqp/QndM4kvOU68skwwWX3bM46EzEk/7b595LQ1uFhc5S03onBtF68g0W96M8xvTz
         ArkBZkKusq/9MR/4p0GljO9ydpsYkv9KyYHDBsnIPMal7aqWddKT5Ila4b9rOdI1nBAf
         CRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479727; x=1780084527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vC76+wE+m69DnNHzueD5T2LV/NT7LEvFIu8/P6enzg=;
        b=oy/7pse41i+I3usNL1xgILFj0kRifkXJh8RoneID26dk7IJCva9I7IknW4RnpNiZC2
         tLxdqRODpTvthhjAsktryX5T87CkNvsKj8Tagm1kaom05KAPp9e4IFwTXSSiA+ukVWgP
         6RkLQY7K1wDlwHNnvAPH7Z9TzNh3xm24tdrWp6aXgnIcddJJzkcyix93TruHvmjPpap+
         asp9/FFtYJkt5fwT/rRvdEwp/U5ckZZAYM5LJX74n/KN+KW2xFiOU477ybFlsy4M82Na
         kJtk+7tGrzz+KHBT4gzujIs8OnHzUgIo95lnxYcFBLRXaayKdNWpH81yi/bGxPb5/o1D
         1+UA==
X-Forwarded-Encrypted: i=1; AFNElJ+e2+ORs/Jvl4dhgTBpzSsDw4TEn3RHlx5vUhu4xpX4gZpub45sAsGj9jPViTMM5W+6Sd4vLWYSf/Rr3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo15C45DbIytMIQseEmxdYltOrSuQVjpoLlHdc526+DOgoUwdU
	DC73wDpZ6j+g0+ejpWoq4k2k9Xey3rkH70Au3n5rDfRAsDJpluqju2N7GtmamdSTlmA=
X-Gm-Gg: Acq92OEXlxX7XgnKstzwGcY3Tk5zzfqP/iPUaOKMoemW0D5asDdR3Vt73IZHRadKeuI
	n7feZ5gB+j6OTr0gSsBsR1GRj6dC2uVxUGIW3tQpuDZMqy1xX7myIxR9W28HbsKfjsrDRTdxKZU
	zEVgOEklZjZ2L/7ZLisnMEXtT1CXa1KUjoipfJhAd7JE0iXozBr+/B2yagsTNhhSG1mqGfJUWsW
	ziTTJEyn1N36KCxIohTUUQD+exQHDeFJk5N1a7TM0Me8iSIwuNBFr2DgT1M6c9GFihd5YKDa7ep
	spdPVNRf7rCFu1Raj0kvVCJLBwQQBy4OLXAgEMiAxCknbnnF5HbXOAKy/OUBuT6Z/Z+vl/xB5ps
	XtB2dHOJ1UlHUNlcvCHcZqHmQI0llnEvcdx/V3GCnUza3bMRsNA5HZB/FGL0zHMUXGJd2+ynYl2
	hkIfwQkCPbKH/eIOF6eBLt+mZrFoY=
X-Received: by 2002:a05:600c:8b41:b0:490:4a1b:d8d4 with SMTP id 5b1f17b1804b1-4904a1bd912mr27811225e9.27.1779479726825;
        Fri, 22 May 2026 12:55:26 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d44f6sm32907425e9.8.2026.05.22.12.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:55:26 -0700 (PDT)
Date: Fri, 22 May 2026 22:55:19 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
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
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/12] rvtrace: Add functions to create/destroy a
 trace component path
Message-ID: <ahC0p0QTCQiFG-SX@curiosity>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-4-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-4-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_125529_311948_EF75994A 
X-CRM114-Status: GOOD (  21.58  )
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

...


I have been playing with a bit more complicated rvtrace graph with one
source (encoder) and two sinks (ramsink and simple test atb bridge sink)
with the following encoder output ports:

:    trace@c000000 {
:      compatible = "qemu,trace-component", "riscv,trace-component";
:      reg = <0xc000000 0x1000>;
:      cpus = <&CPU0>;
:
:      out-ports {
:        port@0 {
:          reg = <0>;
:          CPU0_ENCODER_RAMSINK_OUTPUT: endpoint {
:            remote-endpoint = <&CPU0_RAMSINK_INPUT>;
:          };
:        };
:        port@1 {
:          reg = <1>;
:          CPU0_ENCODER_TEST_OUTPUT: endpoint {
:            remote-endpoint = <&CPU0_TEST_INPUT>;
:          };
:        };
:      };
:    };

In this case the first output port is enabled, but the second one is
not.

> +static int build_path_walk_fn(struct rvtrace_component *comp, bool *stop,
> +			      struct rvtrace_connection *stop_conn,
> +			      void *priv)
> +{
> +	struct build_path_walk_priv *ppriv = priv;
> +	struct rvtrace_path *path = ppriv->path;
> +	struct rvtrace_path_node *node;
> +
> +	if ((!ppriv->sink && rvtrace_is_sink(comp->pdata)) ||
> +	    (ppriv->sink && ppriv->sink == comp))
> +		*stop = true;
> +

IIUC the root cause is that rvtrace_create_path from rvtrace-perf.c,
where the second argument is NULL, selects the first reachable sink.
The function __rvtrace_walk_output_components() walks pdata->outconns[]
in order and stops at the first component where rvtrace_is_sink() is true.
In the example with two sinks we stop at ramsink. As a result, the second
sink is not added to the list and never enabled later on.

> +	if (*stop) {
> +		node = kzalloc_obj(*node);
> +		if (!path)
> +			return -ENOMEM;
> +		INIT_LIST_HEAD(&node->head);
> +		rvtrace_get_component(comp);
> +		node->comp = comp;
> +		node->conn = stop_conn;
> +		list_add(&node->head, &path->comp_list);
> +	}
> +
> +	return 0;
> +}

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
