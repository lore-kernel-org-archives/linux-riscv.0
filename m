Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4594C02188
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zuw3Q/rNi/IquLgU94Z1zSkToasWiuURNZ23nnIWTGI=; b=RbSZeJtKQzcE+L
	fyq+RKbE5HfLjCXTI73rOkkdiU8WYPq+NM+64DhmBRW1ukhWUQ3ife9pEP6BgrPceumPbhnJQJVXq
	r6jHTHLVABpxZRPapSRXJ6OxZBupN82lhjIzfzSY6Yvitnk1TtpTwZokap4nIQyLOykSLlIYa/xDn
	qoCWYYYj//Gr9nun3vv4AtsNYEtC/VKZDX4mhk/K3s5U5b3uS71aUZ8RUTVeLYrIt8v9Bn52YDSTm
	DxjuUAbptUj7GxQctFDkFI31WfJB8wM9Oijv+Rz1aoC92cwnJ1oCCJpVjNXodiABwv7Y5eK8nfCRI
	JZEeIOpNclLWgBIvI6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0W-0000000GJmu-1lvf;
	Thu, 16 Jan 2025 23:10:36 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0T-0000000GJhw-1TAa
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:10:34 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3862d161947so834996f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 15:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737069032; x=1737673832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQjN+UKbroqD83qO2UjBTcTlF8+/q2QiSosN0QwUoU4=;
        b=bIu3WPxBSmExmwGYeuXp7i7vCmTxHQSaf6qIPYozzAjmc8VZ0g6/b+H++/fcm+d69z
         1hfqm3dwMklzDHniseYoMYDEN6n7nP9Hl9aY8OssOanNMi0Betbz6m9Y8YnTYJKTTA+I
         ZL6On8xpW0IxCRd+ZGpEpLo4v5Wv5AKZhBvsuUSb5skDvlU1jlNZ/NM4385YKrHh/gE9
         GN/3yUtaJWk3QJJnLT0k9GxGzV3eBu2YxWQkquG44Xj1q4Rof0xrHolx40EF7gASTZmS
         xTb8dek3CGqdeGntrOY2lFnfWEofKUdocN8VIkPg1h+tfJXykjbDSTqD0HIk9XR4Siuy
         2w/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069032; x=1737673832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQjN+UKbroqD83qO2UjBTcTlF8+/q2QiSosN0QwUoU4=;
        b=iTBzzsqr3kPTVkqoGi+rCm1qcXfM97egWxXQiJ0hVvaowA4KJWutv0MGNk34siFk9E
         krjlLPH81/zDMNU3OnUngSQHFf1FfnHfoSJz+aIjoPxF5KPMd+ZfLceg/2FzY58r33YD
         WW5yEZK3REX+gmqfco4n8DVRwg2O+F4VODtIvv9+vNJ8Kp8VzuTrNQhoHOjVMBoxLtL4
         cejjGjr69oZs53llgvHkj7AjaZ6xfY8au/P8J0jbpYSG+eLzHosT1jH4zEhByngy734/
         7ylj6AVtY1LpNoIrDB1e0GcowEu+cydO5VxFBop9qT4SCV9vWe+aqVwHiEmIQxXRpOMP
         6gqg==
X-Forwarded-Encrypted: i=1; AJvYcCUap2L5U0ue4exUz+Zm3t/996G0nsWfhGwDIjUDuYkeqkjqbt/zm3GZzrQytAHl3qB0op0yCA5550XNUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIQVxseL4izbO8uYmj+/v9wpoRQRbrfFaZU3iYeqNCkJiHbPyG
	05DV6vqoCwtXLcAgrqwESWQjgmtufj9+3adhmVqxK5GDpB9KDIu+N1B45HLhhVw=
X-Gm-Gg: ASbGncvz2E2aqLTbgYDxSXA5Q6YBHwebcJZXzZ1T4V2DUdloJnFxoPp3A8GwR7KIxXp
	CHnl5eBhzKuqgVcnI8LsC2YTPPMlvlqHS6FCeIHoggCE3ls96oeqvETMc/192BZQC/90TIXBHVv
	uz9ul1B7GZ0i7+7TjCkZhWTV6HWuLNNPgJK/ZUfLB+kXCNo+wCJ5ITTWsMkGH4VspUJMjFaTS/9
	oByI9yfm/KxOCv2xmtJq3nwOn33L+KV9F84wF7SO8d5DhZw1QNMLk/Mtxmn8dVe7ZwLUNCPH3BO
	99WbpU7hbzaKDLVz
X-Google-Smtp-Source: AGHT+IE8w0tW/wpQVyEgF5mM+IUwGM3ccJfDjyTPUx2Pdbu8PB/1j71pGZjZsCD/2FEHJdYpAfi9sw==
X-Received: by 2002:a05:6000:1a87:b0:385:fc32:1ec6 with SMTP id ffacd0b85a97d-38bf57bb947mr268961f8f.50.1737069031710;
        Thu, 16 Jan 2025 15:10:31 -0800 (PST)
Received: from rkanwal-XPS-15-9520.uk.rivosinc.com ([2a02:c7c:75ac:6300:b3f2:3a24:1767:7db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b337sm974991f8f.59.2025.01.16.15.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:10:31 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	vincent.chen@sifive.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 4/7] dt-bindings: riscv: add Sxctr ISA extension description
Date: Thu, 16 Jan 2025 23:09:52 +0000
Message-Id: <20250116230955.867152-5-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116230955.867152-1-rkanwal@rivosinc.com>
References: <20250116230955.867152-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151033_389194_85B45D13 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

Add the S[m|s]ctr ISA extension description.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 848354e3048f..8322503f0773 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -167,6 +167,13 @@ properties:
 	    extension allows other ISA extension to use indirect CSR access
 	    mechanism in M-mode.
 
+        - const: smctr
+          description: |
+            The standard Smctr supervisor-level extension for the machine mode
+            to enable recording limited branch history in a register-accessible
+            internal core storage. Smctr depend on both the implementation of
+            S-mode and the Sscsrind extension.
+
 	- const: sscsrind
           description: |
             The standard Sscsrind supervisor-level extension extends the
@@ -193,6 +200,13 @@ properties:
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: ssctr
+          description: |
+            The standard Ssctr supervisor-level extension enables recording of
+            limited branch history in a register-accessible internal core
+            storage. Ssctr depend on both the implementation of S-mode and the
+            Sscsrind extension.
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
