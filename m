Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09B3CCFA00
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bejo6zTjwpR5zPUW1TYNaWxtePsE4gBB6I9EKou4cGM=; b=KQaIHoF2M3WK3o
	71PY6en5iTMbZQohk5BK2J3/yypTJg/qLniDvQgLViBQ3eMs41+DkvZOMbgDtOoSx1fn0doJUU+ny
	ZHphNCV76C3rrnNHhOSnNUSCbl04NK9Dn7HERLuG0Wc7EsKDOWv/0ayPOjvkpxSMzZdAF++aZyzrm
	uUJEeCNiMFzhEn/S03g4jWqDiLvDDficR86grtdp1dUk8Bxl2t8+xkb7kyHhj4kKhRpLhlU9JTUgc
	wnklvGvsVbbTuCuOrKmsCTv0cJqAyEMyeER2rIL6qSx3rtlfUIyGTusdw4n5K4/PJClM5FtqFoXC9
	Wf7r6+GRjb+FyV1EIoJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDli-00000007t2E-0oOw;
	Sat, 01 Nov 2025 15:43:54 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFDlg-00000007t1C-2cu3
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 15:43:53 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b55517e74e3so3073665a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 01 Nov 2025 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762011832; x=1762616632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cNRcLxuGh85qOUhHhakMZrIP7xVwXKqva0C/jWYbVA=;
        b=DEhDhOGfxvXIGIVefvPwthhblLDgunKiMkU6munNYw1cI3kC43EcMgbS/U+kta3hmI
         PvELMOzCF7HwvgHV4dxIXAiGSfhNIKNX/2u3qwg4eX/eZxgCNSNmu2/1qtVdXsCNegVm
         VuB5gjBM9vabHWaA50ncQqJV6f4FRlsJJNXmZnKlwXAgOwe1Wr/tYfqqoyayYdEiNEbk
         EXXLFARcxcmze0Dt9WLaIkRXXoaFkimwPYW9WrD+dztLsZvMYgT1Yaf+gUfotY6mqLH5
         xEcTPBaZA8kKWLFxSvsXLkGsrSkYjzVIoSpXZInAYjHpK2BTBibxho2jtVW1vPK1tYSA
         rvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762011832; x=1762616632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cNRcLxuGh85qOUhHhakMZrIP7xVwXKqva0C/jWYbVA=;
        b=flkRAc5Lr9xJXiGRXyX3sl8MDJrwpgZY40EADoiRKqCMZQqiXjh5cncRr+aIUj/Sqm
         8kLTr7boR0Yk/CgaJJW4Mhxm4TaMXIenyFVBuGFO3QY4sT04hED5Jme/V0fbMLIRcl4A
         ZYnX5nBi4RcUHRY1FGO0J0yFrowNM85Tkg7cXfpnas7iljZfQLyVMYSVTwo/zhB/EbOc
         WEQMJpwQm1RKF9xD/5pjfdNC9HeQ8uZxNVpb5P/YY9wdaUGwE08Hy3eZIreXlibIQlzi
         KLCq6Hnuiz+cH0F8fKys3oxhBGU2TB6xzKSbpa34t+WESO5ncl5zlK8pxM6aNUHt6aR6
         Koug==
X-Forwarded-Encrypted: i=1; AJvYcCVlMJhT/BqrZV1a4OBcBMeybVqgLKEJYSnznMf27UPvj09m42VpjX0nNzFgvT7q/25gqaF6TPSZ985F1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnjwHbw19AQ86wGwECW9iSlVuzqfmsHlzISXVyoJkEX4SC2sEa
	xcs3WQKr9+Q9MMOH7yQpOa450WdnmiW7X2RrlUval+gVqHEcMnWmOjBQ2cCy9pjuR0A=
X-Gm-Gg: ASbGnctfb0cg795Z5qZIcl6Yg+9mXGIH4GbEc13dCU46m0N9PiTOeIe75z24VEmevWN
	7SC9HpQH4Ca6oyEE2MsBpixXjFLN7QufPEwINMSe5C63iWZRq+QxY03ftYMogi7RJ7YfF1r1Uqt
	1GSYzcuF4Nk4A/lvTLnHyp/dlzVUz8RGL3csLxpMXIbkT4w/ZsT2CdQblVD2nseh2F65VgwRP18
	n4EyHKV3Jafy8Js8aIxT5dHoK78PqFyZPGapl3+KxsbxLB04pB6fzg3OjOf9ZHflN8o8EHRpoMP
	CeIr6Ia8NRXxKsvWUPREkUygTb/TJrkNbXrgd9htvdKKsRrfEEQyRzRbFnuztmickarTHaW5Zai
	bAYdCQ7jJGzmO0Z9dEFdO7QUoaQXQfYfQnYJToniPT2hixpVfRwgWSrbWvjSLnMsJEap2988an9
	4wO0tzKcgnKr0a/PYCixwZ9Av1ML/MrYU=
X-Google-Smtp-Source: AGHT+IE9dgmddcRbzfRQuPturLe2P+J6B0ktYW7UkJ98oGijMhfJoMmqTs3LZbQLk6Eea6Hsg8gvAw==
X-Received: by 2002:a17:902:d505:b0:290:c0ed:de42 with SMTP id d9443c01a7336-2951a4dfc4fmr100179015ad.36.1762011831758;
        Sat, 01 Nov 2025 08:43:51 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bd2fesm59990105ad.105.2025.11.01.08.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 08:43:51 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH v2 06/12] rvtrace: Add function to copy into perf AUX buffer
Date: Sat,  1 Nov 2025 21:12:39 +0530
Message-ID: <20251101154245.162492-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101154245.162492-1-apatel@ventanamicro.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_084352_677662_2B181187 
X-CRM114-Status: GOOD (  14.83  )
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

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add rvtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c | 22 ++++++++++++++++++++++
 include/linux/rvtrace.h                  | 21 +++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 35bd77d6880a..b955e5f3b048 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -675,6 +675,28 @@ int rvtrace_path_stop(struct rvtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(rvtrace_path_stop);
 
+int rvtrace_path_copyto_auxbuf(struct rvtrace_path *path,
+			       struct rvtrace_perf_auxbuf *buf,
+			       size_t *bytes_copied)
+{
+	const struct rvtrace_driver *rtdrv;
+	struct rvtrace_component *comp;
+	struct rvtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		if (!rtdrv->copyto_auxbuf)
+			continue;
+
+		*bytes_copied = rtdrv->copyto_auxbuf(comp, buf);
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(rvtrace_path_copyto_auxbuf);
+
 struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
 					 struct rvtrace_component *sink,
 					 enum rvtrace_component_mode mode)
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index e2842e8728d4..cecf6c153ca6 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -277,9 +277,28 @@ void rvtrace_destroy_path(struct rvtrace_path *path);
 int rvtrace_path_start(struct rvtrace_path *path);
 int rvtrace_path_stop(struct rvtrace_path *path);
 
+/**
+ * struct rvtrace_perf_auxbuf - Representation of the perf AUX buffer
+ * @length:   size of the AUX buffer
+ * @nr_pages: number of pages of the AUX buffer
+ * @base:     start address of AUX buffer
+ * @pos:      position in the AUX buffer to commit traced data
+ */
+struct rvtrace_perf_auxbuf {
+	size_t length;
+	int nr_pages;
+	void *base;
+	long pos;
+};
+
+int rvtrace_path_copyto_auxbuf(struct rvtrace_path *path,
+			       struct rvtrace_perf_auxbuf *buf,
+			       size_t *bytes_copied);
+
 /**
  * struct rvtrace_driver - Representation of a RISC-V trace driver
  * id_table: Table to match components handled by the driver
+ * copyto_auxbuf:Callback to copy data into perf AUX buffer
  * start:        Callback to start tracing
  * stop:         Callback to stop tracing
  * probe:        Driver probe() function
@@ -290,6 +309,8 @@ int rvtrace_path_stop(struct rvtrace_path *path);
  */
 struct rvtrace_driver {
 	const struct rvtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct rvtrace_component *comp,
+						 struct rvtrace_perf_auxbuf *buf);
 	int			(*start)(struct rvtrace_component *comp);
 	int			(*stop)(struct rvtrace_component *comp);
 	int			(*probe)(struct rvtrace_component *comp);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
