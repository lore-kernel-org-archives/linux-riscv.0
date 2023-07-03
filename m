Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F82EEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjvpE9rNqa7jVd1Roshz83sr8oUjUwe/gngzSPhkhTE=; b=OACdF985F9Pxp+
	KM6KtXIAeD27RsHJ3cTmvj8n5FVGzhowOl/UgbKLkgrzNBzRu068jWxS0fdW6SHxZmcqfnJxG+vGk
	cjXpk+8784A5Dv4G5Oc9ciCAB8UdgZcDSGWcekv1SMcnRykTh/PVX15Mtk/pipzFZIYOdRR/xyBJ6
	68Fx1f93mGODkN2iRqaTr4UQLlY2r+i9/HMrqgfw2BPAEHg4WESDSw8LXFkrV18H4fkS6xisfUcwC
	7zxGDZrwPjc4ZVF5IIRxH4tk3IThXS4JMBxtT6uLXsYyzaKAas5C03crznYnDd1QJ/I9hvlImJNDz
	7OanZBBxKiq9DsxaU/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIyA-00AWgk-2J;
	Mon, 03 Jul 2023 12:47:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIy7-00AWfG-32
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:47:53 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3142a9ff6d8so2596079f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388470; x=1690980470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVY/yta8MPWmg9iGDhd2QZ8qAlvFNnDO2cXvkrgJQ+E=;
        b=QlE2Iqus6AP6Te3dv3Y5Sx4aMQ+r5SKgwVSpZ0lVhlvFOkGw0WYXtGXIyYV13AdXyg
         BF50w/diT8Np6DqNMws/6d/47CDoirkmcKusK6cN3dPFI2VGnUd9hAmyNYSlA4poktO+
         eBlIbLnt08K37EodkyVat6+liUHZWpeoQatiE5O/3ceBUMebG7p6wzso8g68vqx48QeP
         Q50WOmsmdac9sn01EhF2WYiEkGFTwOTVO9QCJi6lJY9lnNqqXeQk/4wQoS1+c5EPLsLm
         ycCf9vXUK/7Q3fhEEM4/FDM3oJBppGTNdLj8CelDbYB3NzmZu/AEwfXT3hZ6/haUCtRa
         EgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388470; x=1690980470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVY/yta8MPWmg9iGDhd2QZ8qAlvFNnDO2cXvkrgJQ+E=;
        b=OqWc+kzuxVNGxRguPQ08JwAHrkPP2JISA1GsZYsLOB8hHtdXFE/Uts9qsFAF5JUCgn
         L1uvavwDcHOxOjDKpRiK06pN39kI8LDynvu8+rzIzrbQpMDzFPl1d0xYBb6cV2uFMH52
         wAOs1KvAcJsCQ/EoAUILM3QQpaipE8i9YAJc+cENycx5pfuLIonvuHFEGeL/m/BM6jbp
         0jbV1wY7H6k6/MxzSLDejd6xNlJMoU5i/ESFbfkLX6yijFlYOt8JDFEZZAUuFL66ey+g
         tEfBNlXbFZUXh1zmsjBzgUIfWVatGdQe/QwdoZu8SPkrKjLxm1BXmqsbHWpk2t1YrjbP
         ETLQ==
X-Gm-Message-State: ABy/qLZ5qWwkKxlqtfBb9U91EDs8x20PJWcri9d/Q6dlhbtzCX/YZ/q4
	sMAfR+c8jGeOHZVzWicrRgpg3g==
X-Google-Smtp-Source: APBJJlGkvS0VBTA5uxFkpZhC1EeXtotxBOQUfL8gsoFO3JwjxcRP9zPFqdv6CO7IZsrTAyG8/+JKUQ==
X-Received: by 2002:a05:6000:124f:b0:314:3746:d44b with SMTP id j15-20020a056000124f00b003143746d44bmr2701847wrx.41.1688388470517;
        Mon, 03 Jul 2023 05:47:50 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v2-20020a5d6782000000b00313f5babb18sm19568022wru.9.2023.07.03.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:47:50 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 01/10] perf: Fix wrong comment about default event_idx
Date: Mon,  3 Jul 2023 14:46:38 +0200
Message-Id: <20230703124647.215952-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_054751_978312_6808AAC0 
X-CRM114-Status: GOOD (  12.30  )
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

Since commit c719f56092ad ("perf: Fix and clean up initialization of
pmu::event_idx"), event_idx default implementation has returned 0, not
idx + 1, so fix the comment that can be misleading.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index d5628a7b5eaa..56fe43b20966 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -442,7 +442,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
