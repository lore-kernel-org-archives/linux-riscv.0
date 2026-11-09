Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F18606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l/Ak40Lr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kbteH9x8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uWMiW03RleywNM6Yla78hWDvanN2mQdAonhsjgE7Le0=; b=l/Ak40LrPEbYgak0Z0mER14E56
	lvdwFADacfJFDYQuZk8qIa9u0Ofh3S1+IrCP/W3ljFcRbFmrSidVglLlAEAJ1UuWR0Xmd6mFBXzor
	5TzcXgtERQOiBj/Yr/YRbF0IX3shYzVFYciBrr45IKp/oxC6kXqF0wzeyUQJNoO2oJrkxxlxFy5pT
	NoMtohchAjPciwuuiz/7Xxo7efBOM0dRc9MmJvSLV+0j323baBmTVtf3xFIFZeFyNETkUEdnkjuBm
	Q4nXJc70TaYAB2c+c382h4PhMga42D3PD8Ev+zI+vXRfkvrMZ/HCMzBJdmpmI/zsmHWUwjvx0+uXi
	0UMrEuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJkx-0000000HYsw-0EOA;
	Mon, 09 Nov 2026 07:25:31 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJks-0000000HYsS-155R
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 07:25:29 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ed06b725fdso3794415ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 23:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794209125; x=1794813925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m2+HhGSoLvri6g/jgXlGvQXUh65ejG4bbvdXJ+M0m3A=;
        b=kbteH9x8cm2iAO1s9uohTGhID7Xkx9VVUWofDtmGU4e2f1SOMeeg+o6fUx2kRYuwJB
         XNMmKMRbV9kqZ9z1ePeW5W0gMXBrm05EsDVp/JVgE3WPpuEozYdvp+lmKUnvpYQeI8PD
         8bAK80PcTP59MZSTX+4M+rvPe6pFllzuumnMjhRcftzwOXkr1WZbnPwp7deSfPvNyJEt
         8mpyMOeFfk83+OpEfYXlyxoRDict6yxcmYa9xwwIJWRs5Drek/4PtlwFE1WFt78keAQm
         Rk8Iw+SM/UFhUILqXLMEMsBbI3pmg9S+NrSyKS0nHmQyPWf2FZF2ASbhEZO+HbD9us9e
         G2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794209125; x=1794813925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2+HhGSoLvri6g/jgXlGvQXUh65ejG4bbvdXJ+M0m3A=;
        b=nbUJhHrSGQ10skeVfhLWhrAy7B+gB2jv7q7DWivtI8H0jv3VDyfnYs5faPs8p6N9Hw
         y9VMtjvV9LatuqkowB0rqtQ1wZwNLTYCQxfX/U6R34au3ER2F3wWlo8TP/TUFl4ALEUy
         dL0C6HrJGgm5sAy9HZeUqvRPPLKpbyoGaqq9iptHKiR2U2uQBv4bfmJ+iPWf2oe2mAwj
         J7eTg8r+gljPzHZB/urk0M/oRH/S15QQpJBHvyf6EWrlDO2gKgD7rEQMuxu8+sZG2fQl
         P9XyFsSZQBvOnJJoU2K80sCgEIhzyHEiS2xlLI1weVA2CR0uIQOHCPp3biTUorreQm4G
         RXcA==
X-Forwarded-Encrypted: i=1; AL+hErFmI+MdQGJP7WuUsJCYEA2v+M9UszoVtvFlhBjMh1wuV3bm8hz6Adauc/qvMCWhGdmqIQZGZorRa595IQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8shDaLWJaxKF5323atVKkfOFJPO1kiI3f4pBH/9wMfwoMyI47W
	SBxMd9LO+gpVv8iKeMYcetDA/q/VAH1pFeIJLhosYWv22NnLQaeaR77P
X-Gm-Gg: AYBFou1es2iH7mJX3MzZrEmkkj3VKFI5MtH2vno4oS040bhD2wfNy+Q5jQ+23ElR+6D
	pCT9F+qjtrhFRXJOF1Op46pQqB4/djPoY83lHolngp1PlJx84zptI807w4mctgU4RTWq4raw+Uj
	jbiZa7fjOfxLKu0Od2KQqyuM5G8fY+zP11iwMwksvyla/xQyVikdCIIoX2rFXZ+bXUZi/cyJo+X
	p3GRJxEVZKFH6BdEibxah8ygk/R8ibUutK0slj33jxiNH8VX31eRhRJcp0ST+v8K1QoHL4l70sY
	MyWYzC7s8g7ZurGUeCGPeu7fIHwOHEXNBS3qyj5Ncw/0HicXlrPdbYbdq5G9XpYocYOjqRhfcl+
	4w47RFXnTS+bY8qhuhZsVhR3doFQmNI0ypPfcK4+rKIIFMqZ17Z2TtWuw2i0lmtdsaw0DmdCFUW
	7r1KT5E5dq1tKMS5spIHH6hLz6jW97SNw2sCeN+dErKEPnNGqFECQFpQPMO39+tv0V0YrRbtp3e
	ZT9jqIgzDPQd3tP4qTsJH7ISqLEOG8mBrM2SVtLaM4W5T9JnjLF21VwRBckD6XGXuFQkBYxBd6k
	nusq/wqT+CPexmmO7D8F78AkpHCxEw2rGfjLoaewTnHxevLE
X-Received: by 2002:a17:902:f70f:b0:2e9:528c:b9ea with SMTP id d9443c01a7336-2ed8373fe40mr22868395ad.11.1794209124729;
        Sun, 08 Nov 2026 23:25:24 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e7416sm8144945ad.17.2026.11.08.23.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:25:24 -0800 (PST)
Date: Mon, 9 Nov 2026 15:25:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "GUO Ren (XuanTie)" <guoren@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, Chen Pei <cp0613@linux.alibaba.com>
Subject: Re: [PATCH v3] perf vendor events riscv: Add C-SKY C930 JSON file
Message-ID: <avF0-Rp6w1g3ZN9M@inochi.infowork>
References: <20261105-csky_c930_pmu-v3-1-3f33e6b3d259@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105-csky_c930_pmu-v3-1-3f33e6b3d259@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_232526_341717_EA9D5795 
X-CRM114-Status: GOOD (  25.99  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 06:31:20AM +0000, GUO Ren (XuanTie) wrote:
> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> Add PMU event descriptions for the C-SKY C930 core so perf can list and
> select its hardware events by name instead of requiring raw event codes.
> The events cover core counters, branch prediction, instruction fetch,
> integer execution, load/store operations, vector and floating-point
> execution, caches and TLBs.
> 
> Add a mapfile.csv entry matching mvendorid 0x5b7 and marchid
> 0x8000000009201600, allowing any mimpid, to select the C930 event table.
> 
> For example:
> 
> perf stat -e cache.l1d.rd.miss,tlb.l1d.miss ./workload
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>

LGTM.

Reviewed-by: Inochi Amaot <inochiama@gmail.com>

Regards,
Inochi

> ---
> XuanTie is the RISC-V processor brand of C-SKY Microsystems Co., Ltd.
> [2]. JEDEC JEP106AB lists C-SKY Microsystems Co., Ltd. as the manufacturer
> associated with ID 0x5b7 [3]. Accordingly, use C-SKY in the patch title
> and csky/ as the vendor directory.
> 
> This revision is limited to the PMU event descriptions from v2 3/4.
> perf selects the event table by matching mvendorid, marchid and mimpid,
> so the DT binding additions are not required for this patch. The
> derived metrics patch is also omitted from this revision.
> 
> Changes in v3:
>  - Repost only the PMU event patch. Omit the DT binding patches
>    (v2 1/4 and 2/4) and the derived metrics patch (v2 4/4).
>  - Rename the vendor directory from xuantie/ to csky/ and update the
>    mapfile.csv entry accordingly.
>  - Change the patch title to "Add C-SKY C930 PMU events".
>  - Drop the topdown.* events, uop.spec, uop.ret, ieu.de.inst_cnt,
>    ieu.rn.inst_cnt and vfpu_ex1_rep.
> 
> Changes in v2:
> v2: https://lore.kernel.org/linux-riscv/20251121063439.2545-1-cp0613@linux.alibaba.com/
>  - Vendor name update.
> 
> Previous versions:
> v1: https://lore.kernel.org/linux-riscv/20250910121121.7203-1-cp0613@linux.alibaba.com/
> 
> References:
> [1] https://www.xrvm.com/product/xuantie/C930
> [2] https://www.xrvm.com/declaration
> [3] https://www.jedec.org/standards-documents/docs/jep-106ab
> ---
>  .../pmu-events/arch/riscv/csky/c930/basic.json     |  82 ++++++++++
>  .../perf/pmu-events/arch/riscv/csky/c930/ieu.json  |  47 ++++++
>  .../perf/pmu-events/arch/riscv/csky/c930/ifu.json  |  62 ++++++++
>  .../perf/pmu-events/arch/riscv/csky/c930/l2c.json  |  62 ++++++++
>  .../perf/pmu-events/arch/riscv/csky/c930/lsu.json  | 137 +++++++++++++++++
>  .../perf/pmu-events/arch/riscv/csky/c930/vfpu.json | 167 +++++++++++++++++++++
>  tools/perf/pmu-events/arch/riscv/mapfile.csv       |   1 +
>  7 files changed, 558 insertions(+)
> 
> diff --git a/tools/perf/pmu-events/arch/riscv/csky/c930/basic.json b/tools/perf/pmu-events/arch/riscv/csky/c930/basic.json
> new file mode 100644
> index 000000000000..a65b90a682ab
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/csky/c930/basic.json
> @@ -0,0 +1,82 @@
> +[
> +    {
> +        "EventName": "cycles.hart",
> +        "EventCode": "0x00000001",
> +        "BriefDescription": "CPU cycles, incremented on every CPU clock cycle"
> +    },
> +    {
> +        "EventName": "inst.ret",
> +        "EventCode": "0x00000002",
> +        "BriefDescription": "Instruction architecturally executed"
> +    },
> +    {
> +        "EventName": "inst.brjmp.spec",
> +        "EventCode": "0x00000003",
> +        "BriefDescription": "Control transfer instructions"
> +    },
> +    {
> +        "EventName": "inst.mispred.brjmp.spec",
> +        "EventCode": "0x00000004",
> +        "BriefDescription": "Control transfer instructions that mispredicted"
> +    },
> +    {
> +        "EventName": "cache.l1i.rd.access",
> +        "EventCode": "0x00000005",
> +        "BriefDescription": "Instruction Cache accesses"
> +    },
> +    {
> +        "EventName": "cache.l1i.rd.miss",
> +        "EventCode": "0x00000006",
> +        "BriefDescription": "Instruction Cache misses"
> +    },
> +    {
> +        "EventName": "cache.l1d.rd.access",
> +        "EventCode": "0x00000007",
> +        "BriefDescription": "Data Cache load accesses"
> +    },
> +    {
> +        "EventName": "cache.l1d.rd.miss",
> +        "EventCode": "0x00000008",
> +        "BriefDescription": "Data Cache load misses"
> +    },
> +    {
> +        "EventName": "tlb.l1i.access",
> +        "EventCode": "0x00000009",
> +        "BriefDescription": "Instruction TLB accesses"
> +    },
> +    {
> +        "EventName": "tlb.l1i.miss",
> +        "EventCode": "0x0000000a",
> +        "BriefDescription": "Instruction TLB misses"
> +    },
> +    {
> +        "EventName": "tlb.l1d.access",
> +        "EventCode": "0x0000000b",
> +        "BriefDescription": "Data TLB accesses"
> +    },
> +    {
> +        "EventName": "tlb.l1d.miss",
> +        "EventCode": "0x0000000c",
> +        "BriefDescription": "Data TLB misses"
> +    },
> +    {
> +        "EventName": "tlb.pf.access",
> +        "EventCode": "0x0000000d",
> +        "BriefDescription": "Prefetch TLB accesses"
> +    },
> +    {
> +        "EventName": "tlb.pf.miss",
> +        "EventCode": "0x0000000e",
> +        "BriefDescription": "Prefetch TLB misses"
> +    },
> +    {
> +        "EventName": "cache.l2.access",
> +        "EventCode": "0x0000000f",
> +        "BriefDescription": "L2 accesses"
> +    },
> +    {
> +        "EventName": "cache.l2.miss",
> +        "EventCode": "0x00000010",
> +        "BriefDescription": "L2 misses"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/csky/c930/ieu.json b/tools/perf/pmu-events/arch/riscv/csky/c930/ieu.json
> new file mode 100644
> index 000000000000..7ee0c8e43411
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/csky/c930/ieu.json
> @@ -0,0 +1,47 @@
> +[
> +    {
> +        "EventName": "inst.int.alu.spec",
> +        "EventCode": "0x00000045",
> +        "BriefDescription": "Completed ALU instructions"
> +    },
> +    {
> +        "EventName": "inst.int.mul.spec",
> +        "EventCode": "0x00000046",
> +        "BriefDescription": "Completed MULT instructions"
> +    },
> +    {
> +        "EventName": "inst.int.div.spec",
> +        "EventCode": "0x00000047",
> +        "BriefDescription": "Completed DIV instructions"
> +    },
> +    {
> +        "EventName": "inst.int.csr.spec",
> +        "EventCode": "0x00000048",
> +        "BriefDescription": "Completed CSR instructions"
> +    },
> +    {
> +        "EventName": "ieu.is.siq.stall",
> +        "EventCode": "0x000000c0",
> +        "BriefDescription": "Stall cycles in SX pipe"
> +    },
> +    {
> +        "EventName": "ieu.is.miq.stall",
> +        "EventCode": "0x000000c1",
> +        "BriefDescription": "Stall cycles in MX pipe"
> +    },
> +    {
> +        "EventName": "ieu.is.biq.stall",
> +        "EventCode": "0x000000c2",
> +        "BriefDescription": "Stall cycles in BR pipe"
> +    },
> +    {
> +        "EventName": "ieu.is.lsiq.stall",
> +        "EventCode": "0x000000c3",
> +        "BriefDescription": "Stall cycles in LS pipe"
> +    },
> +    {
> +        "EventName": "ieu.is.vfpq.stall",
> +        "EventCode": "0x000000c4",
> +        "BriefDescription": "Stall cycles in VF pipe"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/csky/c930/ifu.json b/tools/perf/pmu-events/arch/riscv/csky/c930/ifu.json
> new file mode 100644
> index 000000000000..a8fedd95659a
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/csky/c930/ifu.json
> @@ -0,0 +1,62 @@
> +[
> +    {
> +        "EventName": "inst.mispred.branch",
> +        "EventCode": "0x00000018",
> +        "BriefDescription": "Conditional branches that mispredicted"
> +    },
> +    {
> +        "EventName": "inst.mispred.uncond_branch",
> +        "EventCode": "0x00000019",
> +        "BriefDescription": "Direct jumps that mispredicted"
> +    },
> +    {
> +        "EventName": "inst.mispred.ind",
> +        "EventCode": "0x0000001a",
> +        "BriefDescription": "Indirect jumps that mispredicted"
> +    },
> +    {
> +        "EventName": "inst.mispred.ret",
> +        "EventCode": "0x0000001b",
> +        "BriefDescription": "Function return instructions that mispredicted"
> +    },
> +    {
> +        "EventName": "inst.brjmp.branch.spec",
> +        "EventCode": "0x0000001c",
> +        "BriefDescription": "Conditional branch instructions that speculatively executed"
> +    },
> +    {
> +        "EventName": "inst.brjmp.uncond_branch.spec",
> +        "EventCode": "0x0000001d",
> +        "BriefDescription": "Direct jumps that speculatively executed"
> +    },
> +    {
> +        "EventName": "inst.brjmp.ind.spec",
> +        "EventCode": "0x0000001e",
> +        "BriefDescription": "Indirect jumps that speculatively executed"
> +    },
> +    {
> +        "EventName": "inst.brjmp.ret.spec",
> +        "EventCode": "0x0000001f",
> +        "BriefDescription": "Function return instructions that speculatively executed"
> +    },
> +    {
> +        "EventName": "inst.brjmp.branch.tk",
> +        "EventCode": "0x00000020",
> +        "BriefDescription": "Branch instructions that resolved to be taken"
> +    },
> +    {
> +        "EventName": "cache.l1i.rd.miss.latency",
> +        "EventCode": "0x000000b8",
> +        "BriefDescription": "Cycles where frontend issues no instructions due to L1 instruction cache miss"
> +    },
> +    {
> +        "EventName": "tlb.l1i.miss.latency",
> +        "EventCode": "0x000000b9",
> +        "BriefDescription": "Cycles where frontend issues no instructions due to instruction TLB miss"
> +    },
> +    {
> +        "EventName": "inst.mispred.brjmp.latency",
> +        "EventCode": "0x000000ba",
> +        "BriefDescription": "Cycles where frontend issues no instructions due to branch redirect"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/csky/c930/l2c.json b/tools/perf/pmu-events/arch/riscv/csky/c930/l2c.json
> new file mode 100644
> index 000000000000..4a8698cf5637
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/csky/c930/l2c.json
> @@ -0,0 +1,62 @@
> +[
> +    {
> +        "EventName": "cache.l2.wb",
> +        "EventCode": "0x000000a2",
> +        "BriefDescription": "L2 Cache write-backs"
> +    },
> +    {
> +        "EventName": "cache.l2.rd",
> +        "EventCode": "0x000000a3",
> +        "BriefDescription": "L2 Cache reads"
> +    },
> +    {
> +        "EventName": "cache.l2.wr",
> +        "EventCode": "0x000000a4",
> +        "BriefDescription": "L2 Cache writes"
> +    },
> +    {
> +        "EventName": "cache.l2.refill.rd",
> +        "EventCode": "0x000000a5",
> +        "BriefDescription": "L2 Cache refills caused by read"
> +    },
> +    {
> +        "EventName": "cache.l2.refill.wr",
> +        "EventCode": "0x000000a6",
> +        "BriefDescription": "L2 Cache refills caused by write"
> +    },
> +    {
> +        "EventName": "cache.l2.wb.victim",
> +        "EventCode": "0x000000a7",
> +        "BriefDescription": "L2 Cache write-backs caused by cache replacements"
> +    },
> +    {
> +        "EventName": "cache.l2.wb.clean",
> +        "EventCode": "0x000000a8",
> +        "BriefDescription": "L2 Cache write-backs caused by CMO or external snoops"
> +    },
> +    {
> +        "EventName": "cache.l2.inval",
> +        "EventCode": "0x000000a9",
> +        "BriefDescription": "L2 Cache invalidations (by CMO or external snoops included)"
> +    },
> +    {
> +        "EventName": "cache.l2.refill.inst",
> +        "EventCode": "0x000000aa",
> +        "BriefDescription": "L2 Cache refills caused by instruction cache load miss"
> +    },
> +    {
> +        "EventName": "bus.access",
> +        "EventCode": "0x000000ab",
> +        "BriefDescription": "All requests sent to the bus"
> +    },
> +    {
> +        "EventName": "bus.rd.access",
> +        "EventCode": "0x000000ac",
> +        "BriefDescription": "All read requests sent to the bus (prefetch included)"
> +    },
> +    {
> +        "EventName": "bus.wr.access",
> +        "EventCode": "0x000000ad",
> +        "BriefDescription": "All write requests sent to the bus (eviction by the current core included, but eviction by external snoops not included)"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/csky/c930/lsu.json b/tools/perf/pmu-events/arch/riscv/csky/c930/lsu.json
> new file mode 100644
> index 000000000000..eb8d2351dff1
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/csky/c930/lsu.json
> @@ -0,0 +1,137 @@
> +[
> +    {
> +        "EventName": "inst.load.unalign",
> +        "EventCode": "0x00000083",
> +        "BriefDescription": "Unaligned load instructions"
> +    },
> +    {
> +        "EventName": "inst.store.unalign",
> +        "EventCode": "0x00000084",
> +        "BriefDescription": "Unaligned cross-page store instructions"
> +    },
> +    {
> +        "EventName": "cache.l1d.wr.access",
> +        "EventCode": "0x0000008a",
> +        "BriefDescription": "Data Cache store accesses"
> +    },
> +    {
> +        "EventName": "cache.l1d.wr.miss",
> +        "EventCode": "0x0000008b",
> +        "BriefDescription": "Data Cache store misses"
> +    },
> +    {
> +        "EventName": "cache.l1d.refill.inner",
> +        "EventCode": "0x0000008c",
> +        "BriefDescription": "Data Cache misses with L2C hit"
> +    },
> +    {
> +        "EventName": "cache.l1d.refill.outer",
> +        "EventCode": "0x0000008d",
> +        "BriefDescription": "Data Cache misses with L2C miss"
> +    },
> +    {
> +        "EventName": "cache.l1d.wb",
> +        "EventCode": "0x0000008e",
> +        "BriefDescription": "Data Cache dirty cache line evictions"
> +    },
> +    {
> +        "EventName": "cache.l1d.wb.victim",
> +        "EventCode": "0x0000008f",
> +        "BriefDescription": "Data Cache dirty cache line evictions caused by new cache line refilling"
> +    },
> +    {
> +        "EventName": "cache.l1d.wb.clean",
> +        "EventCode": "0x00000090",
> +        "BriefDescription": "Data Cache dirty cache line evictions caused by CMO from another CPU or snoop from another CPU"
> +    },
> +    {
> +        "EventName": "cache.l1d.inval",
> +        "EventCode": "0x00000091",
> +        "BriefDescription": "Data Cache invalidations caused by CMO or snoops"
> +    },
> +    {
> +        "EventName": "inst.ldst.load.spec",
> +        "EventCode": "0x00000092",
> +        "BriefDescription": "Completed load instructions (prefetch not included)"
> +    },
> +    {
> +        "EventName": "inst.ldst.store.spec",
> +        "EventCode": "0x00000093",
> +        "BriefDescription": "Completed store instructions (CMO not included)"
> +    },
> +    {
> +        "EventName": "inst.ldst.lr.spec",
> +        "EventCode": "0x00000094",
> +        "BriefDescription": "Completed lr instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.sc",
> +        "EventCode": "0x00000095",
> +        "BriefDescription": "Completed sc instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.sc.pass",
> +        "EventCode": "0x00000096",
> +        "BriefDescription": "Completed sc instructions that pass"
> +    },
> +    {
> +        "EventName": "inst.ldst.sc.fail",
> +        "EventCode": "0x00000097",
> +        "BriefDescription": "Completed sc instructions that fail"
> +    },
> +    {
> +        "EventName": "inst.ldst.amo",
> +        "EventCode": "0x00000098",
> +        "BriefDescription": "Completed AMO instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.load_acquire.spec",
> +        "EventCode": "0x00000099",
> +        "BriefDescription": "Completed load acquire instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.store_release.spec",
> +        "EventCode": "0x0000009a",
> +        "BriefDescription": "Completed store release instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.fence",
> +        "EventCode": "0x0000009b",
> +        "BriefDescription": "Completed fence instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.fencei",
> +        "EventCode": "0x0000009c",
> +        "BriefDescription": "Completed fencei instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.dvm_sync",
> +        "EventCode": "0x0000009d",
> +        "BriefDescription": "Completed dvm sync instructions"
> +    },
> +    {
> +        "EventName": "inst.ldst.vec_load.spec",
> +        "EventCode": "0x0000009e",
> +        "BriefDescription": "Completed vector load uops"
> +    },
> +    {
> +        "EventName": "inst.ldst.vec_store.spec",
> +        "EventCode": "0x0000009f",
> +        "BriefDescription": "Completed vector store uops"
> +    },
> +    {
> +        "EventName": "inst.ldst.float_load.spec",
> +        "EventCode": "0x000000a0",
> +        "BriefDescription": "Completed floating-point load uops"
> +    },
> +    {
> +        "EventName": "inst.ldst.float_store.spec",
> +        "EventCode": "0x000000a1",
> +        "BriefDescription": "Completed floating-point store uops"
> +    },
> +    {
> +        "EventName": "inst.ldst.spec",
> +        "EventCode": "0x000000b3",
> +        "BriefDescription": "Completed instructions executed by LSU"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/csky/c930/vfpu.json b/tools/perf/pmu-events/arch/riscv/csky/c930/vfpu.json
> new file mode 100644
> index 000000000000..e60dea102862
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/riscv/csky/c930/vfpu.json
> @@ -0,0 +1,167 @@
> +[
> +    {
> +        "EventName": "inst.sca.fp.arith.spec",
> +        "EventCode": "0x0000005b",
> +        "BriefDescription": "Completed scalar floating-point instructions"
> +    },
> +    {
> +        "EventName": "inst.fp.arith.half.spec",
> +        "EventCode": "0x0000005c",
> +        "BriefDescription": "Completed half-precision floating-point instructions (both scalar and vector included)"
> +    },
> +    {
> +        "EventName": "inst.fp.arith.single.spec",
> +        "EventCode": "0x0000005d",
> +        "BriefDescription": "Completed single-precision floating-point instructions (both scalar and vector included)"
> +    },
> +    {
> +        "EventName": "inst.fp.arith.double.spec",
> +        "EventCode": "0x0000005e",
> +        "BriefDescription": "Completed double-precision floating-point instructions (both scalar and vector included)"
> +    },
> +    {
> +        "EventName": "inst.rvv.arith.spec",
> +        "EventCode": "0x0000005f",
> +        "BriefDescription": "Completed vector arithmetic instructions"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.spec",
> +        "EventCode": "0x00000060",
> +        "BriefDescription": "Completed vector arithmetic uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.fp.spec",
> +        "EventCode": "0x00000061",
> +        "BriefDescription": "Completed vector arithmetic floating-point uops"
> +    },
> +    {
> +        "EventName": "inst.rvv.arith.fp.spec",
> +        "EventCode": "0x00000062",
> +        "BriefDescription": "Completed vector arithmetic floating-point instructions"
> +    },
> +    {
> +        "EventName": "uop.sca.fp.arith.bf.spec",
> +        "EventCode": "0x00000063",
> +        "BriefDescription": "Completed scalar bf floating-point uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vint8.spec",
> +        "EventCode": "0x00000064",
> +        "BriefDescription": "Completed INT8 vector uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vint16.spec",
> +        "EventCode": "0x00000065",
> +        "BriefDescription": "Completed INT16 vector uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vint32.spec",
> +        "EventCode": "0x00000066",
> +        "BriefDescription": "Completed INT32 vector uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vint64.spec",
> +        "EventCode": "0x00000067",
> +        "BriefDescription": "Completed INT64 vector uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.fix_point.spec",
> +        "EventCode": "0x00000068",
> +        "BriefDescription": "Completed fixed-point vector uops"
> +    },
> +    {
> +        "EventName": "uop.fp.arith.fdiv.spec",
> +        "EventCode": "0x00000069",
> +        "BriefDescription": "Completed floating-point division uops (both scalar and vector included)"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.idiv.spec",
> +        "EventCode": "0x0000006a",
> +        "BriefDescription": "Completed vector integer division uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.zvkn.spec",
> +        "EventCode": "0x0000006b",
> +        "BriefDescription": "Completed zvkn-type uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.zvks.spec",
> +        "EventCode": "0x0000006c",
> +        "BriefDescription": "Completed zvks-type uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vmulu64.spec",
> +        "EventCode": "0x0000006d",
> +        "BriefDescription": "Completed UINT64 vector multiply uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vmulu.spec",
> +        "EventCode": "0x0000006e",
> +        "BriefDescription": "Completed UNIT vector multiply uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vdot.spec",
> +        "EventCode": "0x0000006f",
> +        "BriefDescription": "Completed vdot uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vfmul.spec",
> +        "EventCode": "0x00000070",
> +        "BriefDescription": "Completed vector floating-point multiply uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vfadd.spec",
> +        "EventCode": "0x00000071",
> +        "BriefDescription": "Completed vector floating-point add uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.perm.spec",
> +        "EventCode": "0x00000072",
> +        "BriefDescription": "Completed vector permutation uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.redu.spec",
> +        "EventCode": "0x00000073",
> +        "BriefDescription": "Completed vector integer reduction uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.fred.spec",
> +        "EventCode": "0x00000074",
> +        "BriefDescription": "Completed vector floating-point reduction uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.mask.spec",
> +        "EventCode": "0x00000075",
> +        "BriefDescription": "Completed vector arithmetic masked uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.vlmax.spec",
> +        "EventCode": "0x00000076",
> +        "BriefDescription": "Completed vlmax uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.agnostic.spec",
> +        "EventCode": "0x00000077",
> +        "BriefDescription": "Completed vector arithmetic uops with agnostic strategy"
> +    },
> +    {
> +        "EventName": "uop.rvv.arith.idiv_direct.spec",
> +        "EventCode": "0x00000078",
> +        "BriefDescription": "Completed vector integer division uops that produce special result"
> +    },
> +    {
> +        "EventName": "uop.rvv.vadd.spec",
> +        "EventCode": "0x000000ae",
> +        "BriefDescription": "Completed vector integer add uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.vmacc.spec",
> +        "EventCode": "0x000000af",
> +        "BriefDescription": "Completed vector integer multiply-add uops"
> +    },
> +    {
> +        "EventName": "uop.rvv.vfmacc.spec",
> +        "EventCode": "0x000000b0",
> +        "BriefDescription": "Completed vector floating-point multiply-add uops"
> +    }
> +]
> diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
> index 87cfb0e0849f..372833e0a78e 100644
> --- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
> +++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
> @@ -21,6 +21,7 @@
>  0x489-0x8000000000000[1-6]08-0x[9b][[:xdigit:]]+,v1,sifive/p650,core
>  0x5b7-0x0-0x0,v1,thead/c900-legacy,core
>  0x5b7-0x80000000090c0d00-0x2047000,v1,thead/c900-legacy,core
> +0x5b7-0x8000000009201600-0x[[:xdigit:]]+,v1,csky/c930,core
>  0x602-0x3-0x0,v1,openhwgroup/cva6,core
>  0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
>  0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
> 
> ---
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> change-id: 20261105-csky_c930_pmu-0eed57291f30
> 
> Best regards,
> --  
> GUO Ren (XuanTie) <guoren@kernel.org>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
