Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E04C001B3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tvvT3lo+wVPdN6TBGPL70Oe3X8/k1a/u9EcPQW9SrBQ=; b=gZHY7g25JP7cN4
	6ONdmmWpXC+COBQ68pcADOtHA7cLKoUtyLA6kH273GCfplh2NvmYqCoTmu8UdCfRElGQ6uUKa63l5
	wDYV/TOzwpvr6AGH0GtX/bQEZB7AxOSc/QIWzylrllR4U9WwRNMIB9Z30t5dwnvGMYH8YiqEflQwL
	R8BPo659n2HzyXfNXtqXardzgGrrR+Y26COcoois0SOaQUV9TFveohAbwVFQ9/a2nHgAudKeRA5VG
	Ssb9G8dAqb5Xz7jSHtU6QQPwQBHtmjiuJP4rvNhBPcHftpqv36ez+m7N2jpGZEz1GXz8eNOHyiIjX
	5Y6B665tUqJPwEUqcUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf8q-00DGeF-24;
	Tue, 04 Jul 2023 12:28:24 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf8n-00DGck-1t
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 12:28:22 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-63588812c7aso23787966d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1688473699; x=1691065699;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l5YpNQ9k3FxEI6NyEQ6O/c948FLcVDYur8dACWC8IMo=;
        b=MKbpxpd3h33Jur04KbPUrCLTlVIAAu5iv7+InZ2Ld/h7aQEoYZjAV/1l7GNlBXhBs/
         SBy7ElK8A3XM0+bIPwHaC+MmN5ZHDIgtcMt0tbcTmJ/TCFBrs4T9BMNP4X7XwieicLlM
         3Uf0jz/gYRqoPW9beXrjMAL/7Ilt9EiZwz9MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688473699; x=1691065699;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l5YpNQ9k3FxEI6NyEQ6O/c948FLcVDYur8dACWC8IMo=;
        b=XoFO36Y4sHUGVGTAFBZGH0ABJ/jobwfuarKP9WBHmjR5F6q+NpsCoYfi5QiwD7ngSK
         ydM9VhsJ0ZIDCYNlkmJm2GyFGwq/ZGLUfkk9peGlin6j5dOb2zMFKuHl4A9v8iW6qy+9
         atZRsWHjj4yUeURMQiAAT9YCw+lTO+/7LiQErX1MVj0qJ52N8LRfE+c3E2rJiOHXyEjT
         mtNe7FEMRTNN2o7zBOT1CIXxTGYbq2GoEOTOBLqsuY3iPluGfcBXFva8hsTnuUSvKkza
         /1vt/MEGUO7axwPIxKvSpujKXYlF92Oo61ONer7mnu6Xec49WNGJ25Mv0+Mw2WBx6ptK
         H9QQ==
X-Gm-Message-State: AC+VfDz3HjhQfnAB7+ft/OSqV+4xPe3Jqjqhm4jCseMj0yWdOsG5pyvq
	47XPRr3375SuAJ7330fciAjoig==
X-Google-Smtp-Source: ACHHUZ6ytBJOoBgDRsxovcaKyYEdk2QBLDw+FxvVzCXKV9CmY3KSb9amNV59gJ8MDByp7CHlrPVdRA==
X-Received: by 2002:ad4:5ba6:0:b0:623:5c93:77eb with SMTP id 6-20020ad45ba6000000b006235c9377ebmr22037706qvq.13.1688473699061;
        Tue, 04 Jul 2023 05:28:19 -0700 (PDT)
Received: from macbook-air.local (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id oj2-20020a056214440200b00631fc149a19sm1667137qvb.110.2023.07.04.05.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 05:28:18 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Tue, 4 Jul 2023 08:28:08 -0400 (EDT)
To: Alexandre Ghiti <alexghiti@rivosinc.com>
cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, 
    Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
    Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
    Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
    Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 08/10] Documentation: admin-guide: Add riscv
 sysctl_perf_user_access
In-Reply-To: <20230703124647.215952-9-alexghiti@rivosinc.com>
Message-ID: <72d2ad7a-601a-a06a-5587-3843971dddf3@maine.edu>
References: <20230703124647.215952-1-alexghiti@rivosinc.com> <20230703124647.215952-9-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_052821_738709_2B9AB38C 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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



On Mon, 3 Jul 2023, Alexandre Ghiti wrote:

> -=================================
> +perf_user_access (arm64 and riscv only)
> +=======================================

so I complained about this when support for this went in for arm64.

Why do we have two separate ways of getting this info, one for x86 and one 
for arm64/riscv?

Could we get x86 patched to use the same interface?

It's a pain for tool users to have to maintain multiple code paths because 
the various architectures can't agree on how to export this info to 
userspace.

Vince

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
