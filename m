Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03184CAC5B8
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWYsMc3lGympuPMefXGuP1C9fikbSGD+2FCLNpv9b3w=; b=Q1WI6EKOmpQvzp
	Pax6J5kRTTW30sXfw37FRjCeLFZJ/uhcze8IesUqLHK1dCcljqmf2O3t2UVwSCpBqfG6YyNdk5Huh
	+KRsyiIHq0vbfl1YkwuChwfmVIIWreeUQHgGrCphyzQCJbpTr4y8Ckp9QTo1FMscdMdWbnm6l4M/v
	ZAYu/zWp3zlsgLRLNjgEpFQrDyxTl4pvZWZq7uEOBobx71ZWma2eiIYhiteGm5GWVigzdslpA6Io0
	CcSii956tdPe2v93BW1dUub8oDmoTSwcrkabzDoI8GELqsOoXiCZ090SAywqtYpuSQmTkzRFBoJ/O
	g8i7jl/HrB1prFYmf02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUm-00000009hEB-0eaE;
	Thu, 02 Oct 2025 06:08:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CUk-00000009hCo-1SIK
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:08:51 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-78125ed4052so874398b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385329; x=1759990129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JHjFWe4nSJBuXJLW+4dSgn35y5ppiBpVluUI0Wnqq8=;
        b=G0+48qPGipoXvwuN8t1tbAzHwMINRgKZlhRUi4MfpzOYPu9tmdg7KesYvkZGuMYxCW
         sNi9EK2sTc3z1BbgB2NSO4gxqUt5WO8q7OkYoPrwVH6YO3OJAb9CVpI1InckiVsnkfsk
         3xYI9sidDnOZVy/9nNpQg4eh+XKhQ6gmwOQV1JyiLIa22yt1G0O6OMLbO98brsIgO0jU
         cMTjkfaelxe71xs84CiJMTkn6jSwunZG2MtMbI2KurCSnnWdK0+NmiwnTqZw2GgAEvla
         Xyh+DNKf5lH52ZNetePGoGhvTlNMrduVHyhZsxy603MgUu+c8wEDpgL6NqM+WOMDWRBS
         Kzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385329; x=1759990129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1JHjFWe4nSJBuXJLW+4dSgn35y5ppiBpVluUI0Wnqq8=;
        b=NsIAUPhjfJVx6TLM6KHwUIfI5Fq+LyzBqmdbpK0w4Nbih7m16cIcSmnUE4rw/F60G2
         gT73pRA2i8u/G5p6rCIuE3GJDZlSyiobxb9qbvLk48bMy49didzCeZOxTxOwPtLGGGNy
         w0XeAro8CHVoQcrwR1zaRGxg1XR/pvxEItoRy587fzU/hTiH+RMLkrdzfbp1pteofqml
         tzK6X97yQwoWVYzJ1gIeBvmi6FARqjva710o47YK5Vx3PRdu1t6aCAIWE2VNTtNKn6rx
         damPZ+qHVDspBx0sfV0+0Kp4AP1exLCRbl0zG+y5LL0+EKLebOzHKsDOXxFaJiirBsF8
         6nMg==
X-Forwarded-Encrypted: i=1; AJvYcCWZHIHNaJyvsxnEgy0mdEG/APflk9nxImiyz7p7xpjUUZdy6sM1lZvKj2v+8qUEfLFhUqPwkGMbD3PJHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ09QoLM6A7RJUBERQrKbvQZJPWpOp7YonJB/uQOTGpwPmZVu5
	qEJO9yFVh5PRerv9wdYGxCoA1UG74O3cXCkYIt+ePtFKwLsBbxTuzIxS/uraaii15Yo=
X-Gm-Gg: ASbGnctY20kCiJR21EJBbveQWafEVbmb9sWXjwTMqr/ciT9lIdMt1BfDyEUhMsGSItb
	dBWOxDTgnSu9Do1hlBE5rHt44f75kvvaXFgwC4gYYFebKg1uJC1deobWRn4tt9fEfEMUk3GQWjf
	vHUq8Xo8WOh8r5elJSJHEKKxeAcMYMz1Zz6iv8oXsuid9L6vFDOOquOtSd8+X24sfLcZGl1J1eq
	Aju9FOzp5FD8x6OnJhwVsUrMjUup7hhW7nrl51EhiAj+2wpksgwKTTKeE/BE0NUa4jUQwEmsoh6
	p4iZ3+loO8G4dnzDp360gcP1C93s2tkHhIaOrD+xbAKof+ISYg5cEi5g35sMxz3eS5WMCmfiYj/
	v+xQMrZCJM4VZR3aYCBLdZ5WqRMbTFEp9AtdTvKenQ3+bIa747joxw7EUzcVUc9DXb2tluxHyIi
	KPxfpNXtH65UYsNg==
X-Google-Smtp-Source: AGHT+IEVQ8syUgiiA1nKnyUpyfhQ8Ilp5w1llqzl73BCypyrqi5ezsbXFBblcxqXVmPTbmDs4OeyLQ==
X-Received: by 2002:a05:6a21:683:b0:251:e4b4:7a44 with SMTP id adf61e73a8af0-321df6c2562mr8435299637.41.1759385329448;
        Wed, 01 Oct 2025 23:08:49 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:08:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 04/11] rvtrace: Add functions to start/stop tracing on a component path
Date: Thu,  2 Oct 2025 11:37:25 +0530
Message-ID: <20251002060732.100213-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_230850_385258_78292A9E 
X-CRM114-Status: GOOD (  14.29  )
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
index 7013d50ca569..109be40d4b24 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -614,6 +614,50 @@ static void rvtrace_release_path_nodes(struct rvtrace_path *path)
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
index f2174f463a69..e7bd335d388f 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -273,10 +273,14 @@ struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
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
@@ -285,6 +289,8 @@ void rvtrace_destroy_path(struct rvtrace_path *path);
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
