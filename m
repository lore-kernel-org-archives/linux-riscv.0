Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EE9CDB485
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hgbg8h85fYhjeFtlqbLcxa1DfW5jxwoBNEKw1nNF8wE=; b=CoN9ui8lEs75nE
	p9PKTUY3VaYKyZf8jd7Z8vMGkOpcBrJ8eIpebCU7Zg+1zGZ8P0kWeIqYxwTHn9ehFJHI/QjiIo7yr
	ek9D7NFGxumB46Ad1TPoEl3N+SG23biHhPC44whbqxE+uu5JmPwi8Y8EF/yrgJAuAnXFUVta2IsjH
	60APPnxTjow2TyOq5m+0Qb1Vpz6eyl4J4568uWlT222rmhkPK+tSzRnh/WfbB5abkXZHWN5dEjH2L
	L/yVu6RS0nqQbBkBLACnKdNB0V04poXAVcXee+KgezRO1jOduBERdYAbxAPMqNIVF7l5ju47aJ7Id
	0PFVvtnDRtg8/AoIZHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9N8-00FBEj-1s;
	Wed, 18 Oct 2023 16:26:14 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt9Mo-00FB1d-1x
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 16:25:56 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40572aeb673so65348855e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 09:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697646351; x=1698251151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJGK5igWbxtubSqzoTGM9jKmH8+puDO7RkLEZPwgeRY=;
        b=M+yHlrzgIPR2XHAauDk5Smr4wk+AYAGDy1ZggLiOMTxJsUsgUCSNSRbFlt8WsUaKsd
         eGKzdnygfDHGlkzFHW9CGBmxvs0awUOA/LLSlrIT2fLZjpc7Ay4ncFuALljII96qprDx
         44mx4O7t/rfmZ8ZyHHGp8alSO8UHkUl53v0x2rV3VBT1xQgKQABNQHjQmMGhyciWvXOt
         WTaxCyouPLMiOAN9lkJsL5a2ftXiov9hpeq363LRByLQnhE++b/UA4ler0n6vuxPR12c
         b0FKc8Boe59lWKJVlOQLPhtVNpRW8B67TVSFmMZz+rocdpDw2PAPCDlmTqpIxlk2e9yv
         yZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697646351; x=1698251151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJGK5igWbxtubSqzoTGM9jKmH8+puDO7RkLEZPwgeRY=;
        b=eH3WPYiIvNsRL6C1p1jKHhaDxpwaZUwW/RQw41zWOYe+IAvy4Vu65fTqJfvwoD4Hcf
         e9o7iw51mpMn59wpLdRfY0FNnEJiGYv8h71yp0/UjmDr4Yed/ZVopOZP8Hti656arAIx
         aj2ryfTG1QfGHA1m5sli0N1iQV365hNmMyps8MQFqhLguo4NQzgt9dGtBrl3Avedh9ex
         9305ylKlesAsP6z0LL1zpHT8tF793esnp44MwVbcM6S3XYqyiyEs9jIAlsUw8mQP5BoN
         zSUdgpfrtEsRZU37fbZ8LU6/dI3CRHNlDHgbi3YGYF0gdcCmctkrd5Q37VcEtwqQDX+Z
         RlbA==
X-Gm-Message-State: AOJu0YzyAncogD+A/0PFApC0HvUypfColJgPSiCitCguPIBulQQhe8lV
	jlHRPb41kVa9vYcwbt1iJlX/dg==
X-Google-Smtp-Source: AGHT+IHYlQlllSzGIl49fmmvqkbqBsfX3H+TIccAXRAZTQ4ajZmIPAej3ymW2wvezI36j85ulHfqBg==
X-Received: by 2002:a05:600c:154e:b0:404:757e:c5ba with SMTP id f14-20020a05600c154e00b00404757ec5bamr4337407wmg.26.1697646351671;
        Wed, 18 Oct 2023 09:25:51 -0700 (PDT)
Received: from vingu-book.. ([2a01:e0a:f:6020:fcf4:9d83:8d0d:39aa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c2e4c00b0040648217f4fsm2033503wmf.39.2023.10.18.09.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 09:25:50 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org
Cc: conor.dooley@microchip.com,
	suagrfillet@gmail.com,
	ajones@ventanamicro.com,
	lftan@kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v3 4/6] energy_model: use a fixed reference frequency
Date: Wed, 18 Oct 2023 18:25:38 +0200
Message-Id: <20231018162540.667646-5-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018162540.667646-1-vincent.guittot@linaro.org>
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_092554_674414_5B98D212 
X-CRM114-Status: GOOD (  13.45  )
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
