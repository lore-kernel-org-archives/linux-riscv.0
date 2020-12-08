Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B811EC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:15:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 433C023A6C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 433C023A6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iews4m/vXSIqqkrhG9iaPa7cWeSAQe21FZQymVbjsek=; b=GsICEeIacBhsl4b07sjyx8eRQ
	Y68eOpzMC502jR2jBNz99C7SH46oIgwHTwVnm9C3W+LHWPFIDgz2/rEQhHp6Lx/FmErEKDEUshSTF
	fxjpliXFr2OMTnXb9qe9L7GMeqzBbKE2etuKvP6PyS3q+/mnvDsVBoD1QYhLMIxzHy6OKBXK+vaQi
	s9T1Mp42+NXqo+q+S/H/x2T2kjMvk6YFKOKrnEtOWpf2Q2A1+Byn77ixSVYQ/ZJSyJMq9+EdW40pA
	vJYykArTTdwa3yQ2PIUqRh81qnDTzvYwrp5Cj/KMb6PEMVyfHgp9gb6A7db+psgark5kFYrPHu85a
	FSL1iG3QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXD5-0004hA-DA; Tue, 08 Dec 2020 07:14:55 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXD2-0004el-1q
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:14:52 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2so9160084pfq.5
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 23:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNKLbQTe0EJyIiECa6jG2QS24SEV6zzCe3D1RGbycgk=;
 b=E2prpuFklZfHyH6uGERrJEd5U62cUHD6+jSRpRBvz9wsvtrC20j+4Fn+n7c+9o/lXu
 T5yP4WsFIHwhR58DpHjewsBB8ODHY5YQelCx/8hTqZaxBI0Nj6IUKBTCdxMU3lMIXV40
 UD5N2IdOVVT+6uZgX1HaqgHjfpoz6Y6QAYtMBYEc8UIDMkw9TvApqmqo8+ymwY52vRYn
 t2+RyX2Ynn5+6OQXehL0LYSq1RlE4AgZgnT84IFpzU86kL01Ez6OeTNKOWbE6G1xpyj2
 Kqrb4c1eSUcj+tQBvOTPsup8e2ez/3pF/0KIBktmOFpj7dI6DbyKiP3S23rtBnZAvBvC
 6uOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZNKLbQTe0EJyIiECa6jG2QS24SEV6zzCe3D1RGbycgk=;
 b=gyrcrfn6B3u/G3a4DiHyyN0RZ9Kdqo9WDtUp88HXXN2HSqg3L+CtLywLtecIasHrvF
 ICpWyQ4Ce6n6V9lQj1sKZY+pCl0yB/4mm5e+IFLH2mgrbGkjHu+VFA4iB0Ye/jZCKE2L
 65hlZmM0h6Eps5aymmqFRVFDU34b6EJj/De/AAaR3pY0SATvUMJup2GFHvVrvlLzlSmf
 vSvpDc6sWo5rJWb2ibX6TrCqsGO8YEvUHFRmdF43SIyoCVxf4Ge6vRu0VwtqiVWj/YgA
 6z08SHxYR6y3y/G5QK6NL3mSw8Fe/OxluxWmAR22ztwPdNM0T297lZ3GiwSj/gRWh0+5
 Wyrg==
X-Gm-Message-State: AOAM532QLxC672BxfeOCOdnjZ0ERsnaZhvZgcV6Y4G9PdXQSBjjuto97
 gLOQjOdDYgx4Mc3loBPZ49sHjA==
X-Google-Smtp-Source: ABdhPJwhFnypmLLLO0205xPiuLXlp21n4FMLux8hU9cokIicnjaN5LG5pDAN3RD8U8cS1l0BYvhgew==
X-Received: by 2002:a63:782:: with SMTP id 124mr10202051pgh.187.1607411690374; 
 Mon, 07 Dec 2020 23:14:50 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id gp17sm1801318pjb.0.2020.12.07.23.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:14:49 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v6 4/5] clk: sifive: Fix the wrong bit field shift
Date: Tue,  8 Dec 2020 15:14:31 +0800
Message-Id: <20201208071432.55583-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208071432.55583-1-zong.li@sifive.com>
References: <20201208071432.55583-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_021452_177011_EC6015B0 
X-CRM114-Status: GOOD (  10.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The clk enable bit should be 31 instead of 24.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---
 drivers/clk/sifive/sifive-prci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index 802fc8fb9c09..da7be9103d4d 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -59,7 +59,7 @@
 
 /* DDRPLLCFG1 */
 #define PRCI_DDRPLLCFG1_OFFSET		0x10
-#define PRCI_DDRPLLCFG1_CKE_SHIFT	24
+#define PRCI_DDRPLLCFG1_CKE_SHIFT	31
 #define PRCI_DDRPLLCFG1_CKE_MASK	(0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
 
 /* GEMGXLPLLCFG0 */
@@ -81,7 +81,7 @@
 
 /* GEMGXLPLLCFG1 */
 #define PRCI_GEMGXLPLLCFG1_OFFSET	0x20
-#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	24
+#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	31
 #define PRCI_GEMGXLPLLCFG1_CKE_MASK	(0x1 << PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
 
 /* CORECLKSEL */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
