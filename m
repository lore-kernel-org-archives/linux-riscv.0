Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91522E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXsJgbGco1dvxE03XLpv0Y/8Zm4nIiNn+OZ3LctRemw=; b=3cUFZTW6b2cuUs
	MxHa6tKrBzCpCWHzj+9PHwysHQuC8ZGnU67WUwSlOwtFRN+UcoNkhm24BWAB8bxe7U6YAGrloZl5J
	lPgdRw4kJ34IB1zZdShV1PSOlinbc+943sS+nOlE4o0K9dnsRN/Ils87y5e8NVt9en5LTyJPj5grv
	AIedjCZfmQvzWzaspw7GvGp4pHxqgLGa0amhjgKB4lFROEbSp1vWMgTHgiQOLpY/tddwoGxP7rkdy
	fW1MDiz+5umvIIdjawHHwzdhzMPW8cjbNBjATKT/cvulh6KLAZYtv2nRxAxPnZnXtcU5qvTrjWjk3
	Dt9wonTx0RwMJACqBi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncy-00AFfu-1w;
	Mon, 09 Oct 2023 10:36:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpncr-00AFUZ-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 10:36:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-325e9cd483eso4181119f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696847792; x=1697452592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXD0QUw+ffX/G//mljsP8uVRxSPaNtugfzKgqO7nW9U=;
        b=HGlGjXgpMrW7rMvJC8+8Q5q7NDsw9oFl5N5zehVj29dSwJiUwX5I2hgHU/qUS+HqSD
         WGYidIwhsOSk550bwhM3e7+ijk3DnNtOTEwS2lnFkGZeDErGHItIRt1GEFLTuSdUC/Gj
         Sdz+DZi7ExpPcah8lYDc2iz39RxqoVqYa9qM85m0Fh98HLYyrMuWCCISyXTznNVIBWrW
         xRGEOVgIrpwT6pjcCHOajhTuaiQY1VWiEbvxJPT4HgelZ3nKUwxJT/ygbbbR6pSBTdoF
         JofFhyzW03ZloIDgEywK+0dhn+ShMrmq3PCTNezLyEhLBd7rYZ0e2IZJ+GCgSJ4O+YSC
         xKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847792; x=1697452592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXD0QUw+ffX/G//mljsP8uVRxSPaNtugfzKgqO7nW9U=;
        b=XOzu84Hqg45+SBNZ8j7NheLbAe96Ss9j6wJNRKR+mLtV6mU/hPuXLYoNEpKXb6BkaB
         /Kksrv3P5MqI/3Int3L903zhnxkRsycAL55BJOOk7TTHVmF6QFmLMlFN66lvDP98bXrf
         Y0ArJgpISvbXZXwfFfYIP5i1B1HvhcttR/aISUTjqgzP3yv343QBFfcnGtyIIkUO1SJ2
         0gHrNHOmgyrHntd47ygW7wCHCI/t0wL7XqDSfsFN8g7h5+ud3kSj3YaqLsUDSejaor06
         9NUe+f4mG9AglTYLgYxhYqs0dB43auPPh1nAZ93sL289yuDWO2EWZiqvkTvy2p4E3IEO
         NAiw==
X-Gm-Message-State: AOJu0YzEcHdbqFdOUU2paO5HSXZY4FXSU6XytwVjUUKFFxPxb7ABj2vm
	zcd7bDzkIckZKYr3mrBK636TDA==
X-Google-Smtp-Source: AGHT+IHr3aX+9E7V3PEwqGZuQkX9W7nIP+EyPQGbKJ+lRYHFakcvBtj79RtXlZzvZ8DwRc3af55fNw==
X-Received: by 2002:adf:ed10:0:b0:320:933:4524 with SMTP id a16-20020adfed10000000b0032009334524mr13404865wro.2.1696847792183;
        Mon, 09 Oct 2023 03:36:32 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:53f1:24bc:5e47:821d])
        by smtp.gmail.com with ESMTPSA id f16-20020adfdb50000000b0031ff89af0e4sm9226722wrj.99.2023.10.09.03.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 03:36:31 -0700 (PDT)
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
	lukasz.luba@arm.com,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 5/6] energy_model: use a fixed reference frequency
Date: Mon,  9 Oct 2023 12:36:20 +0200
Message-Id: <20231009103621.374412-6-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009103621.374412-1-vincent.guittot@linaro.org>
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033637_221358_BB56182F 
X-CRM114-Status: GOOD (  13.56  )
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
---
 include/linux/energy_model.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index b9caa01dfac4..1b0c8490d4bd 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -204,6 +204,14 @@ struct em_perf_state *em_pd_get_efficient_state(struct em_perf_domain *pd,
 	return ps;
 }
 
+#ifndef arch_scale_freq_ref
+static __always_inline
+unsigned int arch_scale_freq_ref(int cpu)
+{
+	return 0;
+}
+#endif
+
 /**
  * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
  *		performance domain
@@ -224,7 +232,7 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util,
 				unsigned long allowed_cpu_cap)
 {
-	unsigned long freq, scale_cpu;
+	unsigned long freq, ref_freq, scale_cpu;
 	struct em_perf_state *ps;
 	int cpu;
 
@@ -241,11 +249,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
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
