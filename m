Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ECEC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMDB5ga0BY2LSw5CLUexgh02lCnAAAUof5xf/EMw3do=; b=rdi+mvcrrJqWip
	akinywr+T/mt1bv7tT1eP9UMvw7++oQAeK/u9DQkxIEeCjU8AXC7oVObajE9kBo9vgHYqfBLwUg7F
	XvMZJ9RsuXxWYk/UN6CJpJ4walyBqLtR5ZQZymRCTK6tr4hmgsz5HFnMMYf/vb9GYdItxIeuITSBD
	I1YD+L803WnUFPtjTQNlXoBRx46nklD+Z9J9ZqkQMz2NG7J8yjIZ3WzAJYR80eQ2dZ+/hekHvBJrD
	u9qr+/PyA6+ljY61AELU2XxMYOT4v+KoK2SkAIN/6Qs0ZyEkzCERrEhWQ3xWJlyDRAqr3jaegZbEd
	wpQtkiUUGooLVJplUsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NdX-008A3r-0A;
	Fri, 10 Nov 2023 09:17:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1NdU-008A2a-1I
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 09:17:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-28120aa1c24so1560485a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 01:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699607825; x=1700212625; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JNAKGQcfwtX1sEelGFUcCMMKPbFCHvv7FrRIow0M5oA=;
        b=S0sG2K1tzkW4Hh6KTpszOtbEi/X+94tvt5mUNK3kXloil5phAFwaype9QTPe3WLCZJ
         Ldm+NXK8dyXSgO8TndufOPFAHAUTRFMVf9ikcydNX5Bt8xgnsRkOoKsYlMA4muY6F6e4
         EJLJMa97blqE9gLRzUkqsGhe+Zl1te0KpH9D+w3oWwVLpkpTn+1ECamWbhhDVQvDoSmO
         H297nu+wzPQLwgZMB/D4e567X8ywkjp1fN+XT1WZfclk3R/AkDH1TGOqU/dtF2Fj198B
         cU7i7BJ3gmRF9AIld3MFuKVQ8vwEteMZ3GQ4b483Aok0G7cTLEyntJiPvO39uUyQUlLi
         BjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699607825; x=1700212625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNAKGQcfwtX1sEelGFUcCMMKPbFCHvv7FrRIow0M5oA=;
        b=U2WKga4qxJzW1DFP0ltoSRXYacRA4KoP/FpzcdRn4u8jH5P5gcRMXl5p7kcBs+jhn6
         V812NALzyio6xyFPrDWdUdY9Ko8Xkmnc7qOzLSYBC/mz0YDY/nWgrJdus70vAVta0uo0
         wnkOCe2HtVE9QUU4mF4DoHVtbstAO63QQhCGdvIzpmapg8uMiMc5LCNXCGPTDEtfIB6o
         cHMnA1/GNnxRjYLICGlqFFTEhzqgv8tqsiRYqkOgKe8A6JGYfiloEZq79SKPxc7r9b23
         eo4/cnSyQ2jxBxPlmxgw6isg6QRxfFrNRbxMqtfv1BFONXFZwbu9gNjVm0+YvelSbAXy
         2fhg==
X-Gm-Message-State: AOJu0Yy0cInjNsBHImmDiOFCeS9iPWmxFfn7E01fhK/cbaLmZ6ZeObGH
	m3GXqlnhKnSxoMufj2zxkKTIxQ==
X-Google-Smtp-Source: AGHT+IEex3kLeiwKyEz2es872zjMNmrevn40/2l4PbaRjQ1owa57zfxwzE3YTcFU8WWcXat6tXWPLw==
X-Received: by 2002:a17:90b:4b82:b0:280:74fc:ac2c with SMTP id lr2-20020a17090b4b8200b0028074fcac2cmr4523903pjb.13.1699607825201;
        Fri, 10 Nov 2023 01:17:05 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id m17-20020a17090a7f9100b0027ce254fed8sm5666457pjl.0.2023.11.10.01.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 01:17:04 -0800 (PST)
Date: Fri, 10 Nov 2023 14:47:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	lenb@kernel.org, robert.moore@intel.com, lukasz.luba@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	beata.michalska@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v6 3/7] cpufreq/schedutil: Use a fixed reference frequency
Message-ID: <20231110091702.z3phucnffoe44kxy@vireshk-i7>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
 <20231109101438.1139696-4-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231109101438.1139696-4-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_011708_439025_C692CA0B 
X-CRM114-Status: GOOD (  12.46  )
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

On 09-11-23, 11:14, Vincent Guittot wrote:
> cpuinfo.max_freq can change at runtime because of boost as an example. This
> implies that the value could be different than the one that has been
> used when computing the capacity of a CPU.
> 
> The new arch_scale_freq_ref() returns a fixed and coherent reference
> frequency that can be used when computing a frequency based on utilization.
> 
> Use this arch_scale_freq_ref() when available and fallback to
> policy otherwise.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> Tested-by: Lukasz Luba <lukasz.luba@arm.com>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> ---
>  kernel/sched/cpufreq_schedutil.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
