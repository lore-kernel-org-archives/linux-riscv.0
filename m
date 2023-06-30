Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B69EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjvpE9rNqa7jVd1Roshz83sr8oUjUwe/gngzSPhkhTE=; b=WiKBTwXPS1mvsH
	JrxgSHdaA2f/Z6rYYuBv1RAiV0oXOwLiEdgnzCzHtHUM8ST+9vKF1p4HjydEB15dKJUfLyban82ET
	TisnYuavyQWWPlgHhD05hOMdsXU3QUnCSQIR823gDNQZXsV/ilnd8m27vLVcxaCQBwny6QuV4WQqr
	8PSmyk22raNkjzn9AqB2smeoJ8LwVVUyyvK4+FclBhsX9P3DjWb08kjGf3jeSb41kNkEiKhDuiiWs
	X5kjE4n1vveqLYJ/TBfQTNICEly44wMwgiDdrkUsF4SpF8MBLmrop7u+gHgqlNevcTPZpG9yENLrJ
	28MZoPKEdzmJSbC3JFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9Ya-003BBm-0v;
	Fri, 30 Jun 2023 08:32:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9YX-003BAh-2g
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:32:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbc0981755so14300335e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688113960; x=1690705960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVY/yta8MPWmg9iGDhd2QZ8qAlvFNnDO2cXvkrgJQ+E=;
        b=kl/TPhm6ikHmXXieyToZuU/DsVCjRsYDu5avotvuqaFc6tZ03SeeW4FBKpCi/Mw0WK
         wYwR3smgKyTmD/+jwch8XyufhBtdkF3f7qT76g3QLFIxycHhxqlDuelvEeFLcQBDGwtt
         c99+4W37R5ubiuAV02MC9TfgLz/gSE7K7R4yhEbEZr5+7p6QH5R3OjwwnSQN3sEOn7tW
         RKj4BSD6VxbchcdMJw22xXR3zLMu8PcBAKcXWWpZR1RwCBliqolg8sKRbGtF44CNGBjW
         9CyHSusDkCPt0CnofvgfwI9NFxWhPuDzw6CUyYduupu1PMRz4yXtfiSFdQwWM5irvYAE
         GdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688113960; x=1690705960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVY/yta8MPWmg9iGDhd2QZ8qAlvFNnDO2cXvkrgJQ+E=;
        b=lmL0tiUENVIHXQo1fe0KTdMYRAVZ/Lt23aE4B+4bOd7llk95B1YbsXkcxlpKjvpJoz
         rQ/dCaaHpq78Inrdl5GlaKIG6qZASpn5/q8j8wUw6NM0zU7vydlC6XMRIsFJv0e6HiPn
         qAPXMHW6AhOnD/3Jax9pZyDJtuwNE25Q6bmjIEPa30VcwETGcsPZtLF6G/JFEf1Xl4dU
         J2CLdUKh8RLqmmT0X/1IE7fxoJpZJFS72tetrXSlmTwj9QFq/GFOluIIIefLN1tW61Vt
         fVZ1ZGasuU17sL8jsOofS/8rzr+jb/aXtEo2v2UVGsYjBRtZ/M/yaGVKHYrB/4X0L5D6
         g2sg==
X-Gm-Message-State: AC+VfDwGGA7UeKfcsvb16RIOQuyg+Db6vXR5+yvv3Wp42Jqc3hIJDCIu
	iQQJ9Gr4gg29V1aDCBBbysWnUQ==
X-Google-Smtp-Source: ACHHUZ4sOZab/Xe9VR+3s2W1uRvunuBxqP1Egjt8iE/RBBaYrC98a4RA8h5p4k6wwDyYphRxgmB5tw==
X-Received: by 2002:a1c:7c05:0:b0:3f6:2ae:230e with SMTP id x5-20020a1c7c05000000b003f602ae230emr1443811wmc.3.1688113960321;
        Fri, 30 Jun 2023 01:32:40 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v4-20020a05600c214400b003fa95890484sm13846402wml.20.2023.06.30.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:32:40 -0700 (PDT)
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
Subject: [PATCH v3 01/10] perf: Fix wrong comment about default event_idx
Date: Fri, 30 Jun 2023 10:30:04 +0200
Message-Id: <20230630083013.102334-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013241_868498_0FA59712 
X-CRM114-Status: GOOD (  12.39  )
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
