Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44251C4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 00:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcdvZ/U1ONCXcVDLg/SJi42BmMPBFgWhsXV/NkWs074=; b=3Y3cCVyAbkSCoU3bmPZFa1AkTT
	Mmpk0HnJQ8zhgIdfbjJ27kNhU3BNheG/Wc1RyJe7KYozVYcrT81h4p52JtPcXeM/iCwNM3knvXrUZ
	eYAkMdkobebeGHazQpmdRAcyoM8bZHPujshqXYcZl/O3ahBlyrgdQGfkjdupsvzAMdRBu2rtp81E5
	CxVj9OLdaICen9xKvXgQ50HvRA6fkI33ormgEyaSLTs2/cgGHeZyGAolTtUXDb1eb0rtbUnuPCd6x
	btvcokLg3KXNl0zoVHODaeEdKDHy91KWQ0IASt3t2T6fVL/u3kC2YXPNMKVcTumEShh6DLFuarKCw
	3m+Xt+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s339T-00000000qF8-2C0O;
	Sat, 04 May 2024 00:21:19 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s339P-00000000qDo-426A
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 00:21:17 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f3e3d789cdso229383b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 17:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714782074; x=1715386874; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mExYRTNhcQJivK/lzJ+guJ67JEQzBM0WEToTFcMEnRY=;
        b=CMcKvaB69y3UTEjx16IXfuQD5UsMWnmngLYLr4kjvh43vTYC3qjrhvDkdfoSTDy7IJ
         v/ENVlg/6XaI1wuAx0ahBNRr0W1xdAr05Pa2bMRj1WNJtnSoMcLktA7w9wpsKQO4qSCs
         lzMNwfHOwt5lq+VNqwoTh0vjj4AdQ0Byz3RL1LSGMAY+puTq/O361Uo7SY56NRvIMi+6
         rebzn0eQUIfLpgQNPveG/ZmLuPpW5j7ppuBtiK00ge2D5dejmRnxuIsn9N6ZeVPpO2n2
         yuZIv4YuSy+VSBCgt/IQBnAPg39b/PLbXvymzZtPhzNJeRM5A9KFdXoRO/d7QuNsXnNy
         zcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714782074; x=1715386874;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mExYRTNhcQJivK/lzJ+guJ67JEQzBM0WEToTFcMEnRY=;
        b=IiNznkf6V579Fzy788JoNoh7WprVn721HhMFKZRZnZtCbZfjBlxc1DLhIxsqHsMbgV
         kIW2J1c85c1CR5njBhEpJ7hgRhgXlZdBRnYyvZ1YPu1/AvAPxCeZC6uDgKH6Akv/BLVf
         Aa92Udq/Bw629Tfdmxquy/I2XqxAAjy2fPi7f94UgFukbDMoiwv2l3Q2QX/vHCQKOBoz
         RYoftocdUtHRlPszy9itVhX0nmqJDVEM+8gj/OSUUYFX/rXmBlBnT0L1tn4YUEazADc7
         y8jwbmQwTd5LOZk3ODjM6GYggz9sW8DvLgVawCBWDdlmwTf6gHf7wvgicpei3HUdMxhR
         14Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVi/Phj4LBJ9Xg0O+/Qorsn3tCKXBQ1FjEP5IbDYZ10ct1z78d0a0OA06OlxgxYvOUdSyzfaUhLtz5Ym+4lh/zLQqlMFXBEIzd10SaEWFRd
X-Gm-Message-State: AOJu0Yx5HAbB50d5v1T1Zu2yrIUTquLrbkrY9yC2plAavyOU8/KB1LNG
	uSW1GPoXhmwKGM1E9XPq72DgFE4niRs1gQdmtq4fVegKotEXhe+4OtG1MKVV1Z0=
X-Google-Smtp-Source: AGHT+IGZf/8IelKf0czmAZbhy0hrD9SWBcxRv4s/ubA/Z/GizLTlA3Rlj38uvnI3jMFEAyUVqxo+Ww==
X-Received: by 2002:a05:6a20:1012:b0:1af:7bc2:fccc with SMTP id gs18-20020a056a20101200b001af7bc2fcccmr4664171pzc.35.1714782073814;
        Fri, 03 May 2024 17:21:13 -0700 (PDT)
Received: from [172.16.0.22] (c-67-188-2-18.hsd1.ca.comcast.net. [67.188.2.18])
        by smtp.gmail.com with ESMTPSA id j18-20020a056a00175200b006eaa21301a7sm3646412pfc.162.2024.05.03.17.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 17:21:13 -0700 (PDT)
Message-ID: <66b91a63-a953-4bc4-9024-b5b1defa9857@rivosinc.com>
Date: Fri, 3 May 2024 17:21:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] perf kvm: Add kvm stat support on riscv
Content-Language: en-US
To: Shenlin Liang <liangshenlin@eswincomputing.com>, anup@brainfault.org,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
References: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_172116_246570_FB98E1DF 
X-CRM114-Status: GOOD (  17.25  )
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

On 4/22/24 01:08, Shenlin Liang wrote:
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
> Cross compiling perf in X86 environment may encounter issues with missing
> libraries and tools. Suggest compiling nativly in RISC-V environment
> 

Indeed. I am able to test the series with native build.
For the entire series:
Tested-by: Atish Patra <atishp@rivosinc.com>


> Simple tests go below:
> 
> # ./perf kvm record -e "kvm:kvm_entry" -e "kvm:kvm_exit"
> Lowering default frequency rate from 4000 to 2500.
> Please consider tweaking /proc/sys/kernel/perf_event_max_sample_rate.
> [ perf record: Woken up 18 times to write data ]
> [ perf record: Captured and wrote 5.433 MB perf.data.guest (62519 samples)
> 
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
> Changes from v1->v2:
> - Rebased on Linux 6.9-rc3.
> 
> Changes from v2->v3:
> - Add the missing assignment for 'vcpu_id_str' in patch 2.
> - Remove parentheses that cause compilation errors
> 
> Shenlin Liang (2):
>    RISCV: KVM: add tracepoints for entry and exit events
>    perf kvm/riscv: Port perf kvm stat to RISC-V
> 
>   arch/riscv/kvm/trace.h                        | 67 ++++++++++++++++
>   arch/riscv/kvm/vcpu.c                         |  7 ++
>   tools/perf/arch/riscv/Makefile                |  1 +
>   tools/perf/arch/riscv/util/Build              |  1 +
>   tools/perf/arch/riscv/util/kvm-stat.c         | 79 +++++++++++++++++++
>   .../arch/riscv/util/riscv_exception_types.h   | 35 ++++++++
>   6 files changed, 190 insertions(+)
>   create mode 100644 arch/riscv/kvm/trace.h
>   create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
>   create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
