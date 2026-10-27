Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F9E606A31B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cDddT15H;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=IPxY5iRw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JWjqjscWRNCGwt2leBvlmeh5mhuggd6qd6wkweC5lbA=; b=cDddT15HsBwZGYfMv3IXp+fnYE
	GRIsaBdGI8dbvSt0kR9mZWc9C8v04uToHTHH88a2QM6j5FP791PTpLb8JEh16ed9eeG/P3UDAMV3k
	d5MtCmyJ47tzp1clUdwJ+Fc8NNEqTzmI/y/JbKm1KEVBaYuONSVoFjLoCMkr/scWZkUveR4qsMR1w
	LdepXyoB93kU8AoIhTwnNtwX+OQG5Ux7WQA40kvEJTNvvWTgZF/+hCUAQsYgMH5nbEnQlxY9LcZC1
	eXMpM5HsHjwheyBWMjGrUHuH/RAUGx9yJOEkpLhcuzFCqYweJMG6hPUl4Bh324pD9GuyteD4WdRl/
	fVQQmaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLZCX-00000003ku0-3XUt;
	Tue, 27 Oct 2026 04:54:21 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLZCV-00000003ktb-24ru
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 04:54:20 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1846bc43c28so4196101c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Oct 2026 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793076858; x=1793681658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
        b=IPxY5iRwJWp4VoGja8ADZ7Acxubf6cUUWirn7Of4dQY36/b8IkLoXQ5H7RrwsUIP5y
         rLkPk8JbtjEHaPFeVdgWeF1yWyXjK/PAErdrqc/NVVepZ79ss0M1Cwmgp86vb/rxIZLf
         u1MC0Ff4V/c7WARCEn6zEOtDqfzR3akfx64ffBB4MUBUNQA/V8x7PmD2OdodF/Cx0Tbe
         FaO0Khx4oXpbyNH7HtROPg9T5Gg8tVhU7nH1jrOc6F/0D06omeIYZ+d64X7QXaTHc7JJ
         EwywUzmGttwxf+pIp8YsD5NLb0xijXdAo+AVwnHFfhc2E0v3IgXo0PC1agXBpTs68oCX
         3G0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793076858; x=1793681658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CBXDyafbQ+bvJr1wyuJVzQYdGq8WtwM/OAYYzlYp/Gs=;
        b=Y/ixvuAc0wNu54fIhtc2nR5Z/cP2MsSM1Hr9DGTC7nOpK6ENq9Tq1iBmZeBHExhw8w
         VDIQo/Pic3oqvSW+gSlRfdYyCIf4aKXgnQYTGnV7y7BwJzSKgR3bGOkAXwkIt5qGx7Qs
         mqAKkAc1u77ATUgivWc7bW0K20NX99XMmvlbGHQITenX3WQmiQ2M+hRZoEslXLaBpSG3
         8+edKFDduZ++YEplnreoz0VVzJH1FDWTSY40WIFwwvpuaq+LFVYi4UtEcjlaJqaMBxOK
         c6k2adsNr87sQ3ib1LzHSfQOHPyGer7XPKgCGlvhGjF8gQb5FLEqsERBZvPIE2V2fiJu
         eglQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFG1uM1q4zank+aiBfvfA1Cdw8vOX9jWOVSJlEM/IfUyHPPHTVn6tq05/5cDrzk1RWF8NmyIapy/pwdg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLuYmQ2t7fcX9pcQzmZs8I03Wedhf0QAKcC0vjNVaKZNkAz4dkM
	LE8rqZ8geOhxJp4rWhb0VPYeWxrLhe53SMCnDzm+zleD/Dy8wfCu7zvljpXobZaYQcI=
X-Gm-Gg: AYBFou1H4VNew5/o8JO8Ss9Ow8JNZeq+5arQKJZ+3fx5CJU/XRcC1O3R060eaKcNi0h
	plIwjF7753xBe74daW95B8FrHGOjhdNYzhNNlENiFTw3iSA7ay2Lhud1vMabgVwgKxhRBGh482l
	QGtoYvdqbex8/Gqs35RRbRHpilxE9SLjwEPWvhkb1U8qwupTb4xNQV9r3yw1dTB0yKZ3tjUiSTJ
	jPSLVWgeMuWmpZqVrwXUOX0KeriI8Z3JVSZB82bCLt45NlipuTIIyPHyMtDXMwJcfA94HJ2e7g9
	IyEr4bpOj5m6dtTpDk7OMif3DG3sTOcBU0Nm5DVwRCMxKsv4AWFUeHaQyYcbkM7sVS4zmo8DmqW
	3uwbv56NuMJvJe57CScV5oC+/ueZZgZ5dSKc7SkWEkyp9FHDiChrPid+OfRpUlO+VCfLncgJPKW
	nk4RoYoOLpjfnuat4/TcQPJQMycVYlavfHW82wly85INSorsFGJ0ceKKczXwaPPSYgI7yhh/DP2
	xI1pp/PfZRGqlgw/sW4WhP50HM6IySUQ0ew7e3dMxx2EzALPQfPZoanHwi/ARIcCSN7aIxy6Sf+
	fBemRN4lW7nqMYo2CHUOp2txPEkv1WQ4Vk4QMvQi43g6jA==
X-Received: by 2002:a05:7023:909:b0:144:eab0:9cbc with SMTP id a92af1059eb24-199376e0835mr15075491c88.37.1793076857722;
        Mon, 26 Oct 2026 21:54:17 -0700 (PDT)
Received: from lliang-1876.localdomain ([136.226.240.173])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm30437451c88.7.2026.10.26.21.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:54:16 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:54:05 +0800
From: Leo Liang <leo.liang@sifive.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>,
	Anup Patel <anup.patel@oss.qualcomm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
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
	Zane Leung <liangzhen@linux.spacemit.com>
Subject: Re: [PATCH v6 03/14] gtrace: Add RISC-V platform driver for the
 gtrace framework
Message-ID: <auAubdjHl1V4h16N@lliang-1876.localdomain>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
 <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001052243.3042627-4-mayuresh.chitale@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_215419_548610_73DFE910 
X-CRM114-Status: GOOD (  20.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 01, 2026 at 10:52:14AM +0530, Mayuresh Chitale wrote:
> From: Anup Patel <anup.patel@oss.qualcomm.com>
> 
> The RISC-V trace components defined by the RISC-V Trace Control Interface
> Specification are memory mapped devices which are organized in a
> graph-like topology and described in the device tree.
> 
> Add the RISC-V platform driver for the gtrace framework. The driver
> parses the RISC-V component topology from the device tree, discovers the
> type and version of each component from its IMPL register, provides the
> RISC-V register level control ops and registers each component with the
> gtrace core.
> 
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/Kconfig            |  15 ++
>  drivers/hwtracing/gtrace/Makefile           |   3 +
>  drivers/hwtracing/gtrace/gtrace-of.c        | 126 +++++++++++++
>  drivers/hwtracing/gtrace/rvtrace-platform.c | 186 ++++++++++++++++++++
>  drivers/hwtracing/gtrace/rvtrace.h          | 121 +++++++++++++
>  include/linux/gtrace.h                      |   3 +
>  6 files changed, 454 insertions(+)
>  create mode 100644 drivers/hwtracing/gtrace/gtrace-of.c
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace-platform.c
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace.h
> 
>
> ...
>
> +
> +/*
> + * Parse the "out-ports" graph of the component's device tree node and allocate

typo: "in-ports"

> + * pdata->inconns.
> + *
> + * Return: 0 on success or when there are no input ports, -ENOMEM otherwise.
> + */
> +int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
> +{
> +	struct device_node *parent;
> +	int ret = 0;
> +
> +	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
> +	if (!parent)
> +		return 0;
> +
> +	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
> +	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
> +				      sizeof(*pdata->inconns), GFP_KERNEL);
> +	if (!pdata->inconns)
> +		ret = -ENOMEM;
> +
> +	of_node_put(parent);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(gtrace_of_parse_inconns);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
