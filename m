Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C614AC4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4l05mh+v3KVdOAZPFOvQEbqQcJhMOPZvS/e6OQaPqr4=; b=CetFDAcqfigYMK
	xaoTI2fp7ZZdy70JPwctPB99YVB/G5yyxdgKgC/HFVZWDoSykSgm4ya28iWQQOJBDC00eatdgS4bZ
	LrdXFaWrMVqQNigEbZSVkMDGJ7LL/cuFv0H+QCrh8tHj2dOoW3ZgYP9oAAPZbuveEBi3BMhRGx5TF
	KdM/zwCywXm0qjv3fCFQH/t9B86tRacMBTp6AXSm7SWoU9rJ0r0DRqM6mUa/QXik7cPTYVMNXynae
	j7833INvrb+VrDPmKRmaNgzPNJHOIJ6WCoei9GLKmMGq5pnnFEuQ8KKkm30yotA8EDGo6SU1DcTzK
	PrGThLhqEiI+PmF/11jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1242-005ttd-0p;
	Thu, 09 Nov 2023 10:15:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r123s-005tif-0g
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 10:14:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4083f613275so4555825e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699524894; x=1700129694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aduCSyHEYIhu+IO52anhhUtjmJcDS68d0TTkBLTxAgE=;
        b=Q81uchxUiJCFZvlx2dWnqRs8Ulr+3Eb8f+14Ef1CyUDKTnjZm7TojX8ToEhRjwlCLH
         HV12SbjezxudA+DVpDj4/sLcObm6uV4VwsbTJfSISmz0eCoZm0aSrf/Sk47zzr/z+c1P
         pvT1aiPBnGzTFAmH0fPDtSACIlflusX87g5jFSJGeXTm0eIHbM5Legz93uVQdF9iir7P
         +fFV3nwugbebws3zhU+Hj5N57sHY6k21jSRRB12tuxTVuhpBz/tXTRn7iDFsHFGjOSq2
         5Wqf8VG4Sq5y+bvjg8MSGxqdCIhluEM0K0ByehfiwE05QsScRCrUSnyoQnldHhVjpmDg
         wkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524894; x=1700129694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aduCSyHEYIhu+IO52anhhUtjmJcDS68d0TTkBLTxAgE=;
        b=Rt+DeDdtpfMe1n02iL3VywyQvhfrzfIo/+yecLID07nAcrej479hr0MN3z4zucICfZ
         XfYKsB8TMZw9f9mJ1gCrph1G254UU/nWoFlgm9j8LAIEt+c9B8bhSCGv41BfT9zd+i17
         2UKeKIzlSHl+XHBVVnuhPh+jcnS0Okfk0ezyYsi19/FtWBZgtgKOgKMkDcPElcEHSFRb
         qxEWed2rIjfFjaN48U6K3RAIoD9Krpd+HewHbYL8ZhcQyq7eEmqilyt0T5F72rdvC1XW
         /0uMyju3KqYBfp4wi39RZftqOsYCFFrDeWLTrb7fKyejaXi7ecW8vPnl3GZVk8NNYKVC
         A7kw==
X-Gm-Message-State: AOJu0YzSk3msbQldBYCTFgidJVfaRvzYBN4bOjvIFDQuZiAG6LcQODxg
	S0WRNKJ135ssTYtJT4EYwu+pCA==
X-Google-Smtp-Source: AGHT+IEYIB6ScZWDEgpcZ/S2cHjVchJEeCFHQxgRNVNplqpr7l/I6Xe67qLyHn6zzj6QW+TyS8tvqg==
X-Received: by 2002:a1c:7516:0:b0:40a:28b1:70f8 with SMTP id o22-20020a1c7516000000b0040a28b170f8mr3876852wmc.21.1699524893988;
        Thu, 09 Nov 2023 02:14:53 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:26e5:c6da:63bc:dd99])
        by smtp.gmail.com with ESMTPSA id m17-20020a05600c4f5100b003fefb94ccc9sm1611816wmq.11.2023.11.09.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:14:53 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	sudeep.holla@arm.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	viresh.kumar@linaro.org,
	lenb@kernel.org,
	robert.moore@intel.com,
	lukasz.luba@arm.com,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	beata.michalska@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v6 4/7] energy_model: Use a fixed reference frequency
Date: Thu,  9 Nov 2023 11:14:35 +0100
Message-Id: <20231109101438.1139696-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109101438.1139696-1-vincent.guittot@linaro.org>
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_021456_264266_1494E62E 
X-CRM114-Status: GOOD (  12.84  )
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

The last item of a performance domain is not always the performance point
that has been used to compute CPU's capacity. This can lead to different
target frequency compared with other part of the system like schedutil and
would result in wrong energy estimation.

A new arch_scale_freq_ref() is available to return a fixed and coherent
frequency reference that can be used when computing the CPU's frequency
for an level of utilization. Use this function to get this reference
frequency.

Energy model is never used without defining arch_scale_freq_ref() but
can be compiled. Define a default arch_scale_freq_ref() returning 0
in such case.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Tested-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index b9caa01dfac4..c19e7effe764 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -224,7 +224,7 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util,
 				unsigned long allowed_cpu_cap)
 {
-	unsigned long freq, scale_cpu;
+	unsigned long freq, ref_freq, scale_cpu;
 	struct em_perf_state *ps;
 	int cpu;
 
@@ -241,11 +241,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 	 */
 	cpu = cpumask_first(to_cpumask(pd->cpus));
 	scale_cpu = arch_scale_cpu_capacity(cpu);
-	ps = &pd->table[pd->nr_perf_states - 1];
+	ref_freq = arch_scale_freq_ref(cpu);
 
 	max_util = map_util_perf(max_util);
 	max_util = min(max_util, allowed_cpu_cap);
-	freq = map_util_freq(max_util, ps->frequency, scale_cpu);
+	freq = map_util_freq(max_util, ref_freq, scale_cpu);
 
 	/*
 	 * Find the lowest performance state of the Energy Model above the
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
