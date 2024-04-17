Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4522BC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 00:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njtrKVSR5Yk1nftF5dT9jU+B+OGcJUB06eQo0BCYlMg=; b=A57mA60KJgQrIqkTW8XBauLPKx
	TAq4w1GYWI0V9Grlyad6+nRQBQvyd1+ujEsh4CS4wRK1hOa0hT0Ab2btUkbrW5Tj0GvkI7B4TbPZR
	+LD3OvNKgVLdxNhOgMo8zwIAQmvGERO+ODWqxqsXBwS0BPx5ioZOfRIiKhzyg/OeziU6ec519H2zR
	AzdommKwMvLfV2QVPfC8Amr3TiM+Ui+mBqpHsxIPhg6XKHcFwLLCMSHurpl5rC1HJ/7mgrCH3WMdm
	YUDKK/oAsaKuFNZFC3ixNrUZ6r/ltjR53enexzfH1uVCRqKdPpggmLZWCBP/4Dz0+VNE1QtoGZQ0a
	Edqt+9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwt70-0000000EIWd-2Nsk;
	Wed, 17 Apr 2024 00:25:18 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwt6s-0000000EITL-2c7Q
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 00:25:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ecf3943040so4060733b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 17:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713313508; x=1713918308; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUu9r75IkkkPMJX8JtgPk9s/mlLbxcj8MCkbLeGGpmg=;
        b=Fkz5+lBcsHIyLCDI4qzXWnBkvs8wIYU8utd96Z3Gbo85NkIm98aDpgOYeeX1xmTD/x
         ZtnDyysPLqoPlU6sAE4RXyAe5fT89U005kibFIfoD+VS8F9t2LdtkYPwFWrEIOALIotU
         54vW5eQp9L0Y0v/ZwnlYk20OPYhISFwe0SvSiEyWxQWVWU3CRqB23PX5sFfjfLG752yL
         ZOLfMtTsFTPrHkycXWHlgJ0anHC+swWpnHul05nYE9TKT+VngEBd8WAyH1O2p3W6B1Dz
         cW9Q1vQ4je231UOgSPuNUvYzmXCsM+gbtc/XytqHtptjV/WORsrUkO26JApITetm2emA
         6hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713313508; x=1713918308;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUu9r75IkkkPMJX8JtgPk9s/mlLbxcj8MCkbLeGGpmg=;
        b=Lm/OapIcSLWZMmDRhd7UNhhHn4pjD3l0uytk8xa97XWu5t6Dpm7EZncSDbPKdiTAOj
         YBeG0deASbj+uYMfy0XTZpGbvEOmAl7JBXiMvY1ZAGSbMNpDxyw2DEGscCYb009IYYA9
         +6EDLp/go8e5IlURoxHzk5l5krjWBumkeCwAc1sHzXXagqWX6+oUYkoOtld1ID51JH72
         z9c3p/QVJ2snFpakV9SLdwaGD9B+IAgkaB4dhhD4e5SHSuyE/hNHzCFRuZ5w8cWcjnvA
         YAcmfOUFJA8NHhe9258xfD/fwU4l9+yu++K6JQeS2AwPnhE/fQWcVLpTcb73WiJN6Cgu
         dxQw==
X-Forwarded-Encrypted: i=1; AJvYcCULg1g5UJ+PVT7i2a4FNHFGe8QFWG0LrJNNHOULwa6HlNsLLT8uhOS1gteZ0CX4/EwWqELzRYiNDYHkl7UYuQOiEGWWLAIDfXaZUnYeytnK
X-Gm-Message-State: AOJu0YyLyJJOjsEhkZtNYxSMtYf36+jQf1XOtO4EgFSdx5NoTqkyMU41
	u1YIL+k+TWHibTdpAtqpmELHhFrewQoSNEaDYKnp1Qrgv1u5nYxgs1Lipa+zVp4=
X-Google-Smtp-Source: AGHT+IEjAhZVEZYdLBhENvub7H3p131EKgJJzeOWPQQXzU8sWnGpkTKyBYXR/NYgQcPVm7q8baUaNA==
X-Received: by 2002:a05:6a20:d492:b0:1a9:cd84:2f31 with SMTP id im18-20020a056a20d49200b001a9cd842f31mr13414753pzb.58.1713313508368;
        Tue, 16 Apr 2024 17:25:08 -0700 (PDT)
Received: from [172.16.0.69] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902684c00b001e3d2314f3csm10574125pln.141.2024.04.16.17.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 17:25:08 -0700 (PDT)
Message-ID: <aceaaeba-61cb-44fa-8639-e30a86ef8cd8@rivosinc.com>
Date: Tue, 16 Apr 2024 17:25:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] perf kvm: Add kvm stat support on riscv
Content-Language: en-US
To: Shenlin Liang <liangshenlin@eswincomputing.com>, anup@brainfault.org,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
References: <20240415031131.23443-1-liangshenlin@eswincomputing.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240415031131.23443-1-liangshenlin@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_172510_782738_16D6B6C5 
X-CRM114-Status: GOOD (  15.91  )
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

On 4/14/24 20:11, Shenlin Liang wrote:
> Changes from v1->v2:
> - Rebased on Linux 6.9-rc3.
> 
> 'perf kvm stat report/record' generates a statistical analysis of KVM
> events and can be used to analyze guest exit reasons. This patch tries
> to add stat support on riscv.
> 
> Map the return value of trace_kvm_exit() to the specific cause of the
> exception, and export it to userspace.
> 
> It records on two available KVM tracepoints for riscv: "kvm:kvm_entry"
> and "kvm:kvm_exit", and reports statistical data which includes events
> handles time, samples, and so on.
> 
> Simple tests go below:
> 
> # ./perf kvm record -e "kvm:kvm_entry" -e "kvm:kvm_exit"
> Lowering default frequency rate from 4000 to 2500.
> Please consider tweaking /proc/sys/kernel/perf_event_max_sample_rate.
> [ perf record: Woken up 18 times to write data ]
> [ perf record: Captured and wrote 5.433 MB perf.data.guest (62519 samples)
> 

I want to test these patches but couldn't build a perf for RISC-V with 
libtraceevent enabled. It fails with pkg-config dependencies when I 
tried to build it (both via buildroot and directly from kernel source).

> # ./perf kvm report
> 31K kvm:kvm_entry
> 31K kvm:kvm_exit
> 
> # ./perf kvm stat record -a
> [ perf record: Woken up 3 times to write data ]
> [ perf record: Captured and wrote 8.502 MB perf.data.guest (99338 samples) ]
> 
> # ./perf kvm stat report --event=vmexit
> Event name                Samples   Sample%    Time (ns)     Time%   Max Time (ns)   Min Time (ns)  Mean Time (ns)
> STORE_GUEST_PAGE_FAULT     26968     54.00%    2003031800    40.00%     3361400         27600          74274
> LOAD_GUEST_PAGE_FAULT      17645     35.00%    1153338100    23.00%     2513400         30800          65363
> VIRTUAL_INST_FAULT         1247      2.00%     340820800     6.00%      1190800         43300          273312
> INST_GUEST_PAGE_FAULT      1128      2.00%     340645800     6.00%      2123200         30200          301990
> SUPERVISOR_SYSCALL         1019      2.00%     245989900     4.00%      1851500         29300          241403
> LOAD_ACCESS                986       1.00%     671556200     13.00%     4180200         100700         681091
> INST_ACCESS                655       1.00%     170054800     3.00%      1808300         54600          259625
> HYPERVISOR_SYSCALL         21        0.00%     4276400       0.00%      716500          116000         203638
> 
> Shenlin Liang (2):
>    RISCV: KVM: add tracepoints for entry and exit events
>    perf kvm/riscv: Port perf kvm stat to RISC-V
> 
>   arch/riscv/kvm/trace.h                        | 67 ++++++++++++++++
>   arch/riscv/kvm/vcpu.c                         |  7 ++
>   tools/perf/arch/riscv/Makefile                |  1 +
>   tools/perf/arch/riscv/util/Build              |  1 +
>   tools/perf/arch/riscv/util/kvm-stat.c         | 78 +++++++++++++++++++
>   .../arch/riscv/util/riscv_exception_types.h   | 41 ++++++++++
>   6 files changed, 195 insertions(+)
>   create mode 100644 arch/riscv/kvm/trace.h
>   create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
>   create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
