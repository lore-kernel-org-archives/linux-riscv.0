Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC33CCFA00
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxIEwqdPBM3ljUOxTX5ucVrA13XJV6oSFKG1xGpaBfM=; b=T3hk7V3c67D6Fu
	28rNaYNsx1y8YOvF7Jejh9qFR72TRwIVB9gv7mTusLyFJ81Cf1X0YYKncAsamalMoQUS4tCYuSsGn
	U/rMUuaosRJ53i969WSFoSU97ycpbLn3ftowJJJR6QCvEVzUEMM8OxMCG8Ups1jQQhmbiyWzMiUgS
	Zt4hLgTfp2jsrpADgsBWZ/CPUPbKYAH0uOUhEgfMCf8NyhpJVghSdWuemgLXz4zIbviO+fiFAcwKt
	jOR5aXAmhpugJ2iV398JnoANmoGcA0x/cIm7vVA2IPzul1G8XwHdTrI6LyLG/bAjthyJnOFJlv3mH
	eVu1AGlFntJ4w4O2FgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlS-00000007sur-2SiR;
	Sat, 01 Nov 2025 15:43:38 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlQ-00000007str-28Rc
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:43:37 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b98eb673297so79230a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011816; x=1762616616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfEP9PIU9MbWencudNocKuygkeJ/OR2b1cy84VkwN7s=;
        b=hXSy8GPrgC06w54ZVifFBqqvpwonnrYi0L+QxJB+bHBFsDil8o8Ac+vhN4rSwrHFdI
         B9j06zY3Zp6GxDIxPdNX4n5aD5c7z65Y4/wNYmiW24Bd6iFjzsV+qNqV1I0d8tmiTOSH
         Hp1lkdJFu6421NIPJ07fCsDRIXDKd55kA9Pt9HTX1fNuUNEaJqjMsNQJ11IXjliBH6Sj
         cPMVo+GwMR+UfSfAsPrZyiXCXeAKTglQzbgTPc1uCG8TTDKfjBdocEvsCeefUpmPrgPX
         CsoRrwVqmAGcaLeuq5lJrTXJ165aCzel7bM3jsXmY0ys4f/B3QS7DgWg9G5cpv/8js59
         w5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011816; x=1762616616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfEP9PIU9MbWencudNocKuygkeJ/OR2b1cy84VkwN7s=;
        b=H0PMunD8u5JPYXu6a1Pfvq2g+3YL469p5H7+gTLo+5JiXUqDl45F2WhCAOoGnR6oo+
         YXhVmkHribTX6rNycx0YgkXwIm9XAa2UUJm9FRI/ioT30iymeRElzWvB2i/ZfhD7OjZf
         xt9LBwsrzjvoR526znHQZOonwFrbMUQSrGXXcimCpj9FVvBKLsKuUJsQu+Mal1hiR+/F
         fUMvso8i1jTLXt7nEanbbOc7zPgLRSXenbJtSE/axx5JBBELfXa9ct+Pgako0C31Djli
         xwHSEkD7RvogtGixtADFKqLPkCt/E4Y4TJ1cNlWgTA42PZs8otzP7LVN3l2i36NKHUgS
         Ef7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN0NbrlKL9DrtCTKW45AyXlkN+8kwURU/TpStamW7ecFcA769oYDp/KMxqtW5xf+nkpGAKoJSfTI2Seg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfC6Lionh+mjZXGSpGEgjf+bolm50nqYVXSyM5TSI4YpMeA8vg
	s3Q7tFS/9eOLlt9T5puNDgwkPBnNHtUM3c6wjS4zrSP/LOBejf6BgJoJESsl3GcSdiE=
X-Gm-Gg: ASbGncsYFLNtS0b93aqGJSJ8oROfUxcom4Z1OzINqs8a8GedHzg0XOImPbwlW5hUwAU
	nWjgdd6jFeR3BwxzmMB/bZ7aHjX9qIxkyONpQ1EGSJTaPMNUILDWmYthtPdrnT4TdULXPGU/L/L
	DLkWj6Yd8sj8rlvdLDQMX6lxaVnV1GGxLGB5KbM8y8Zf2Lg2oQnDWFOvZVoaFMIM1WvJTZNJOUr
	pv70VgN4qfPK65wxEbXgn7v+4np04uCSDbhhwX9IHZP2d937lIx50HyNsyrljpbMmUAczMkZ9BM
	xEgiymLl/czpkFtuk43VdKrVvc7SZJyJTmIJDAX4nNSJ0637w+QfkCFmT/dT2vCj29m0heKFFaE
	1HnwagLb/oB6SmWPy25ua9qg0hxU+CbcubW9hOGoasEoVBVYvqUQ0FTJffLwPRtMRiFTxFW4Rp5
	QsyFYQM66CoS8YgvUbJDWegLzKQEmmNBdhRr2pg3TPCw==
X-Google-Smtp-Source: AGHT+IE3shkEkgNOrmF/SQpIoxDdNl0ITxKDPFu9uZQNBFl+V+HOFkfpCYl/Xzoqo1IWNRiPw24eiA==
X-Received: by 2002:a17:903:2285:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-2951a4bf845mr83133985ad.56.1762011815528;
        Sat, 01 Nov 2025 08:43:35 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 04/12] rvtrace: Add functions to start/stop tracing on a component path
Date: Sat,  1 Nov 2025 21:12:37 +0530
Message-ID: <20251101154245.162492-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084336_559387_7DD9406E 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mayuresh Chitale <mchitale@ventanamicro.com>

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add rvtrace_path_start()
and rvtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c | 44 ++++++++++++++++++++++++
 include/linux/rvtrace.h                  |  6 ++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 7006a4469d62..35bd77d6880a 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -631,6 +631,50 @@ static void rvtrace_release_path_nodes(struct rvtrace_path *path)
 	}
 }
 
+int rvtrace_path_start(struct rvtrace_path *path)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		if (!rtdrv->start)
+			continue;
+
+		ret = rtdrv->start(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_start);
+
+int rvtrace_path_stop(struct rvtrace_path *path)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+	int ret;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		if (!rtdrv->stop)
+			continue;
+
+		ret = rtdrv->stop(comp);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_stop);
+
 struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
 					 struct rvtrace_component *sink,
 					 enum rvtrace_component_mode mode)
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 4b31ab96e721..e2842e8728d4 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -274,10 +274,14 @@ struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
 					 struct rvtrace_component *sink,
 					 enum rvtrace_component_mode mode);
 void rvtrace_destroy_path(struct rvtrace_path *path);
+int rvtrace_path_start(struct rvtrace_path *path);
+int rvtrace_path_stop(struct rvtrace_path *path);
 
 /**
  * struct rvtrace_driver - Representation of a RISC-V trace driver
  * id_table: Table to match components handled by the driver
+ * start:        Callback to start tracing
+ * stop:         Callback to stop tracing
  * probe:        Driver probe() function
  * remove:       Driver remove() function
  * get_trace_id: Get/allocate a trace ID
@@ -286,6 +290,8 @@ void rvtrace_destroy_path(struct rvtrace_path *path);
  */
 struct rvtrace_driver {
 	const struct rvtrace_component_id *id_table;
+	int			(*start)(struct rvtrace_component *comp);
+	int			(*stop)(struct rvtrace_component *comp);
 	int			(*probe)(struct rvtrace_component *comp);
 	void			(*remove)(struct rvtrace_component *comp);
 	int			(*get_trace_id)(struct rvtrace_component *comp,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
