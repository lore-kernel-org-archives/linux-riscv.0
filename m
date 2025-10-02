Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B38BCAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KU5ISRp0Xl6hcPUKmBHJJsu8Tzkq3RCC592xQGhbRbU=; b=i3zd1uv5qeaFTd
	vDtiqaa5M10sEzn364kmuSB03/IL1kOCDNp7NVAy1Q92npTcvHCYkhK2JiabsnnMDSNtTseiydskS
	xHnh44KXgcsrp9b/nzan56mCkH8x079iIn+57qUMLEQgZw4aKDjAWUUULKNjsvWkf+VkrGnQp5tom
	uZ/E4JsqPbGN0WwVG1t7AyUSuRh8AoQnCW7VdSlNc11fqEPF0OuFmC1d9vVCSlc5/wS/rW054W/bq
	tlTeY27msk1TvhEc+/r/2F7sDwVSI3VlUjwnoBOP//d+f2sC6qmlKUT2NWWS+aFh4DZqr0U206iS3
	CAMp6RflbE4NDSftskdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CV0-00000009hOs-3LN0;
	Thu, 02 Oct 2025 06:09:06 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUy-00000009hM7-0ian
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:09:05 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3306b83ebdaso723315a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385343; x=1759990143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ElwK4fIoolTelCOzIEenmHWdT3EJLmrIEE1cSAO83o=;
        b=asQaCb9M6Eo1eK1CScHk0ICeRZd8D42l8cXOPh5aUL+tMZaybJ8x2WOCIb/r+t7/BW
         kxbUdd7UwHOU+bhkYbCKJg7F3niA4CO96+YB58zfnMtPgZGDPrgOrzj6bcoEnfQqg+hm
         5MlCxTlFKifnWswXBdxXGM/aq64mlSiCgfo8JYGR7XRsQwZNz7xhMVUx9ta4fw7/Z6Jw
         r4jgZIyoSSrkbtsq+8/mcFUaJ/hdImBKEFF3Hsu45/qsw/6Zjujcm4QBbD1/CNr5NFOz
         LkcWe4tIExB5Srk47dXr+MZWBjsKHkcW31SwD20e141FA0LUkm3TirFlxiY5QwcW1kE3
         z+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385343; x=1759990143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ElwK4fIoolTelCOzIEenmHWdT3EJLmrIEE1cSAO83o=;
        b=TYly//o6reVSfzWX+MY+4UVxrjistPTjgbVPkeb7h8yEaN10ohRz7Snfp90Kd5GL83
         svJuLLOvDPbA6QCH+IKcQa4XWIIoRkoMLh+aYeQZ0F07Rdryist8I31pu7/6mP0tctV1
         bByXFAsMNcYNxF5In4yyDSvLOogKE4XtX/foe5cA/2Iw7NXQpJWigrrnpDxuxNIecezz
         jY1sBZPKNsD+QtQf7HoGbfmLfILyTO2A1IspKH28hQ6xzfl4SfIdDctx902J9oS6MWT9
         dBc6Y3m20il9v0/kCiTUs27G5WswEp/Zy3K4EcUCsnam4u6b9nNdCqCejtFANsZkXjCa
         hjmg==
X-Forwarded-Encrypted: i=1; AJvYcCXIiV3HQNaI5GBgLIYNn8+hV/UZcK7pUFrkElrKsYRDx4EfEl4RxlnyeqCCpQQZD18Yq4Ziq0kOrV1ICw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLHt6QgnVDJLqB1/8kf60Lw+dXWL+GnFjq+t4MZFOuVBco/f9Y
	FyahPT4pe+OzP1LoqxpImC3Na4z8GyTwkkRcS37uBBjR8mjITOnSoH1wCKmPuhsFXes=
X-Gm-Gg: ASbGncvOyZkPEEAHh/fCa+b/WffcgNF07K7WaS29VZLPrR3qHYgVZixbqSj7B+A8+xu
	x81fZT98cZmNj+hQPcsVJLIqLP8EFa1o/x5sy3A9Jdv8uNG5IYBo/G5X0hHjMhWsuC/Bjrt9amL
	AsozXqt48We92nq37gCd7+efpE+g0gDg8kpqNQe2t3LbkibwayqE6C4/rFiLK68nFkwnhEr5k4x
	UTnnNN8tdNiv26y+/77BNvlwRzQb+homkXD2q5TLyLbrtrX9vlMToEnPdHDs/dC5aDYiKS5nzeW
	3EBG6HIWZpN3wcpI+8QPN1Ce7+u/pdFq6/94lTwEV68LhfC6L6317l6geqpcMa8Cth1Mb5fWDp2
	y+4RXBWTHEIaQ1k70s0Srp0+SmAbedJNA9aO86mldNh6BvSkDudsSdT/dV6rQsmzln8HcDPHiP+
	J2Fyk=
X-Google-Smtp-Source: AGHT+IH/FR32C0/V3WVvZjUC/0GDNM4I0fMXKVVovBTpA8gpuMX7GO08LEuXV0qjTChgIGlM9e6nAw==
X-Received: by 2002:a17:90b:3a91:b0:32e:dd8c:dd18 with SMTP id 98e67ed59e1d1-339a6f07273mr7437233a91.17.1759385343125;
        Wed, 01 Oct 2025 23:09:03 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:09:02 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 06/11] rvtrace: Add function to copy into perf AUX buffer
Date: Thu,  2 Oct 2025 11:37:27 +0530
Message-ID: <20251002060732.100213-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_230904_214942_63B6E878 
X-CRM114-Status: GOOD (  15.25  )
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
index 109be40d4b24..e874899c8b43 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -658,6 +658,28 @@ int rvtrace_path_stop(struct rvtrace_path *path)
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
index e7bd335d388f..17d2fd9234c2 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -276,9 +276,28 @@ void rvtrace_destroy_path(struct rvtrace_path *path);
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
@@ -289,6 +308,8 @@ int rvtrace_path_stop(struct rvtrace_path *path);
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
