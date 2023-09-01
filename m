Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546CDCA0FE9
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkfHFPYcjqoco7f8FJw/yukkt5kF0mSnyRa0qUj8i0I=; b=IIBhLVhhnXxf4+
	KmjWWT+j2wqnCheI1OEzohDkxIXDFAh4OcTE2GsvzvYCRLCdWkvAN/TXFQORbkyb/DP7Fs8wEDVjf
	tLZIfn1RUTWgxU8ie4wMf7Utgq7xg2LsFaA9zs5WmsRB0xnJMsU94oWsm6NKS+36rpLW9G5Yz+zyC
	yIyC7XPNQdAoo3v4MOYzoiLN1oiijJI8GpqZJVCv8jOQDHIhfv2Jeys8f0KS7QYJhjG23Qm9NaNlM
	mYF91thN2Z50+0/oltLDGqUYcLwJ+5ZCDqtjRQRMCz2OCGIJ/l7xC3/8+g9tKpu++a+6SC3te9Ayc
	nIsp5IA+vBvAbPtBSubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3oB-00HXMu-0V;
	Fri, 01 Sep 2023 13:03:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc3o6-00HXI0-0Y
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 13:03:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fee8af9cb9so19567845e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693573403; x=1694178203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5aYZdSdgznaVi+JliScjcxNZSCQD8Th20BQ7P8lBSs=;
        b=Ch0A21/wQesZxla0Xmw1qB6nBqJ7daDxF7R02Ue9pbhOBLPcxevVG1AkM1sIWgqhY8
         YbK2IEfPYtS4hncA2HKvaJ7ukWRsMT3WKlcQRNYA0k17ymE348kg/SXCEhMlmtp/6DZt
         n/r+UtOk6KE3OvAhc7xVQkd5NrkwD/tehBE7XvAzs3EuyrEAXs0I7TQjiUNeKHcCB8Ba
         cJ9rSnMJeIlhWzya5DqRWvS4ZTF/lUbK+sIIovMKrZbMdPXqQoNpW7ZYpktOjwDgUm3O
         2YN5nwGO735PSpxsL0PK7flYeFqquyxlh5tMdjqq0JaahwcR+1jpQYx4uHKJYn1Aigw9
         7vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693573403; x=1694178203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5aYZdSdgznaVi+JliScjcxNZSCQD8Th20BQ7P8lBSs=;
        b=GE5CralCbUwrfgrGmM1F76X7ciAlbH76HEb7zCfd6l8xmvs8XPFbnIIRcIFYJ80ocv
         tPLAmDgx5PXX29sti5A6Nxb+w9ebrccjcHPvY9OmHNHgg4rrwPKBq5chFr+HME5YR2/R
         uLsjz7kAc5/a09C9I0xPzzY0zG4d9I6ScpoPORuxKeq8Dcfi0yVXVESFVibLjupUTERN
         d2W3QLbVtSlo9ax7MrmYEvDFvojDHqo4sDMoe7wkOEljAkHpZzsHU+YTRmouDaDVyKr8
         XQ0kpicJH7nMQPjdFUEQiF8pXiHWRT0ZBAGm9EVsY4DtnLx5lVWWQR1o9BjwtDP9bnrJ
         Wt+A==
X-Gm-Message-State: AOJu0YxYLfSRFniy1mox2P+PKTb+De9E9BXeGqlNuY+XPohKT0w8Ip/R
	jYW9bS/sNf91Cklnabf7A2Nzgw==
X-Google-Smtp-Source: AGHT+IHWuDsPZBVeKEf+XTy2vPIdFmCGwE/gsGA3pylPfmUXuPXSa8EeuGjxUHsZSClfbNuuKWlS8Q==
X-Received: by 2002:adf:e544:0:b0:31d:db92:31ae with SMTP id z4-20020adfe544000000b0031ddb9231aemr1715345wrm.44.1693573403268;
        Fri, 01 Sep 2023 06:03:23 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:e9bd:add1:d9ac:7b3e])
        by smtp.gmail.com with ESMTPSA id i14-20020adfdece000000b003142e438e8csm5167452wrn.26.2023.09.01.06.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 06:03:22 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH 4/4] energy_model: use a fixed reference frequency
Date: Fri,  1 Sep 2023 15:03:12 +0200
Message-Id: <20230901130312.247719-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901130312.247719-1-vincent.guittot@linaro.org>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_060326_238851_A84F2AF6 
X-CRM114-Status: GOOD (  13.18  )
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

a new arch_scale_freq_ref() is available to return a fixed and coherent
frequency reference that can be used when computing the CPU's frequency
for an level of utilization. Use this function when available or fallback
to the last performance domain item otherwise.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 include/linux/energy_model.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index b9caa01dfac4..7ee07be6928e 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -204,6 +204,20 @@ struct em_perf_state *em_pd_get_efficient_state(struct em_perf_domain *pd,
 	return ps;
 }
 
+#ifdef arch_scale_freq_ref
+static __always_inline
+unsigned long  arch_scale_freq_ref_em(int cpu, struct em_perf_domain *pd)
+{
+	return arch_scale_freq_ref(cpu);
+}
+#else
+static __always_inline
+unsigned long  arch_scale_freq_ref_em(int cpu, struct em_perf_domain *pd)
+{
+	return pd->table[pd->nr_perf_states - 1].frequency;
+}
+#endif
+
 /**
  * em_cpu_energy() - Estimates the energy consumed by the CPUs of a
  *		performance domain
@@ -224,7 +238,7 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util,
 				unsigned long allowed_cpu_cap)
 {
-	unsigned long freq, scale_cpu;
+	unsigned long freq, ref_freq, scale_cpu;
 	struct em_perf_state *ps;
 	int cpu;
 
@@ -241,11 +255,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 	 */
 	cpu = cpumask_first(to_cpumask(pd->cpus));
 	scale_cpu = arch_scale_cpu_capacity(cpu);
-	ps = &pd->table[pd->nr_perf_states - 1];
+	ref_freq = arch_scale_freq_ref_em(cpu, pd);
 
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
