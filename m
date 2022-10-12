Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD8C43219
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 08:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9MLz6/pmxBMH/cU9wP2Re/e2WCwCWNCV400OXUsqIvs=; b=OZk5Ej4Rl6M/2v
	OaIMiQY26N5T7jt9qaecRdwq4K0P4bIEfoLwgPq5+Sm/Kmqs7o9tIBjBMhpi67vw9wZLkyE1KvCx7
	7k5+X+6ekGTgt4Yl749GxkyOvZ6e02nL/0kNTc3SlSsYDZ/rNtT3LC08bxwlomgGOZludmjoAhAwU
	hF6vDkFNt51Z8azYCGNWo93YKVW1XANGL3NEV29UXzqJU77TZKZDKbbVTNtr0iIOiG3sIEu2m+kz0
	08ecOfcpUUx6gifZ/K2RDgeTKT1wosbD0gxoDQqy8n02dVR9Rt8SqYDBtxrkRQ6VEGtRL9ZdqU4pn
	C4BV0OJFif7bff0bMCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiX7j-007LLI-96; Wed, 12 Oct 2022 08:29:55 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiX7h-007LKc-8K
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 08:29:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id nb11so36473404ejc.5
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3SHj2Fb76Fovm6HDfGtTx6DbQVGg9mgHqRHBMfoAHK8=;
        b=IbLtQIYb/GAt2wP/f+c78c9HTErL9EwM4EZGcTZukvPE16gaweDJFacFzRdudVgV4H
         fc8B5CtXe5kjG3EA+kJIvnbRqZfgsb9wWwBpcCExqfB8ZuT6bgoqEVxaeU/peINRlzZv
         vjzrw3hRNtAXPoQ39x2A2WI4Bu2VErzvU/dCPFip+PKW7wLQ7YmkPGkkXvJbgt1K0A39
         BBW6zxsiZiTPubkKfEX6Lh+5stpKSZiB6Kb5TusQ9n1p/aM5uGQBQ+SAZV9CmQsP2gMr
         TE68STD4d3kXPOFzw0oFUAwfDUG4kim8c/1FSWlj4/dZIvMWmpi0FgOnQ+xerZGqK82V
         5W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SHj2Fb76Fovm6HDfGtTx6DbQVGg9mgHqRHBMfoAHK8=;
        b=jGcaXtNQKGxNojoTYfRGfEvQjzeMFuOSHXglk336NY0U4hGB2MkSkMelsOOa1MEcPL
         NmxR/P+zPyozYVKhf1ejGlcnxP+sJntmiIRaiXyVA+huqjWvkkhSJA8mT0xPIL3FdLta
         mAXBfTfEOzJI6sGdd17fn9+RxE+SoYNUD3EEQPj3KTNwM8UthjlMiYD9jkZBSfTKc+JQ
         bQCeiq2ZRjmjevKFPfJGXHKOtKolAQjWe1Iae8DCF68Ew0nPRlqtKvGETS5/qVV/eaqF
         QIB6sUHDTQUV5C6I5PYQ3BNIffN0lMaovZXOX2N9WVeN/DmRQZ+qeIe5LPNIcdgs2adJ
         sm2Q==
X-Gm-Message-State: ACrzQf0rUalQcXeZMwXniLDEk5QXMggEgImZDrBfK8Rcdp+9qBsCwoev
	E/4nqB9Hr8A8dzOF53M7YYrXQtNjPZDTlw==
X-Google-Smtp-Source: AMsMyM5EykqRulQ3gG5bEmbILwZWtKL7NT+e20G3tO34y/FV2IhTVNnY0/akQSMPZgHQjnj/m3MS/Q==
X-Received: by 2002:a17:906:5d11:b0:78d:a41c:6a2d with SMTP id g17-20020a1709065d1100b0078da41c6a2dmr13192661ejt.215.1665563390318;
        Wed, 12 Oct 2022 01:29:50 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id l27-20020a056402345b00b00457160c3c77sm10663429edc.20.2022.10.12.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 01:29:50 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH v2] RISC-V: Fix /proc/cpuinfo cpumask warning
Date: Wed, 12 Oct 2022 10:29:49 +0200
Message-Id: <20221012082949.1801222-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_012953_320218_A1C8192D 
X-CRM114-Status: GOOD (  10.97  )
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

Commit 78e5a3399421 ("cpumask: fix checking valid cpu range") has
started issuing warnings[*] when cpu indices equal to nr_cpu_ids - 1
are passed to cpumask_next* functions. seq_read_iter() and cpuinfo's
start and next seq operations implement a pattern like

  n = cpumask_next(n - 1, mask);
  show(n);
  while (1) {
      ++n;
      n = cpumask_next(n - 1, mask);
      if (n >= nr_cpu_ids)
          break;
      show(n);
  }

which will issue the warning when reading /proc/cpuinfo. Ensure no
warning is generated by validating the cpu index before calling
cpumask_next().

[*] Warnings will only appear with DEBUG_PER_CPU_MAPS enabled.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Cc: Yury Norov <yury.norov@gmail.com>
---
v2:
  - Got comments on the x86 equivalent patch and made the same
    changes to this one
    - Added all the information I should have in the first place
      to the commit message [Boris]
    - Changed style of fix [Boris]


 arch/riscv/kernel/cpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 4aa8cd749441..63138b880b92 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -166,6 +166,9 @@ static void print_mmu(struct seq_file *f)
 
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
+	if (*pos >= nr_cpu_ids)
+		return NULL;
+
 	*pos = cpumask_next(*pos - 1, cpu_online_mask);
 	if ((*pos) < nr_cpu_ids)
 		return (void *)(uintptr_t)(1 + *pos);
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
