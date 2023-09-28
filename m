Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57204CE7AFE
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 06:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiZGZ8Pyb4qVPaI3Mt/XIkBpGEUPjPPTrvuM43iDLtQ=; b=YUKKMFEmAG8zSi
	raDVKs1kVYZLrOqFgslI8GiWjCKrRaGKFwn/q82KtE8GLIHRsWgCGLhqeGWbAB3TkxFzVQUWtTz+0
	QCvf92yVRXE7oUID98CooRTowbV+8qpKyzRBmLGFiz+CktagkM3/ItC8EEihXcn8m5fJGyN9uwdcq
	pzs3MmQRg8veeohe46GTZ3Un65j44ZfSQXZeS/oGmTEdb3Y6f03N6Itab7FgPWBYOHSrW6c8AjTIc
	NKSH8J0NNvX6U6mm70ODditj09pLKCbYEyv3NZ3IfHcmWnXr4Rq0v4o7sXPZrUGQZGcxe3vp6WqGE
	cevWkZZFao/gqEXkvR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGL-002Lf2-0m;
	Thu, 28 Sep 2023 06:12:37 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlkGI-002Le6-11
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 06:12:35 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3512f905f6cso30217315ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 23:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695881553; x=1696486353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=VFPtnwUNbEpSA2H0uu5dtJuW2Pd0oSEUkv4Qy5pBdd4mTtfIyvtI9wA3f1OQNlrGnE
         MxEp4liOh/txO3rRoUXzaIM8v+F322uWfJf4t7q39Dx8ELWnomhpT+Uhv5WaO0cAHqDG
         B43Hptlk4pebZ4c6aNoN6OfnVHqGwARikS+kVw72SDDXFTP7ad7CcJcespNox+qVtmAF
         j2XdAi7HQgRl7vHRABAG78bfeLtI9zaZOWXM+mJlVqc2Ju3ZwwqACVZH40rNz50bku4k
         iujcKVtZ+BTve6SZM2ei1oqFvwMGAWFxqpI+iY0kg+s2nhmt25/h8DWekOUdC7DpnZuD
         cdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695881553; x=1696486353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYhetJOGeGWONv0pBZCT4Mywf3EBvVtv+lOqGOUogJM=;
        b=R0+Tcf2iv/IwpYue1WkPvCX18lJbvSh5ds2Gt5E0xIuh1go3f0EdmbzxARbZutJ65s
         DWR1SPjfR4hdN38y4rctNSaa88Qep728Z+TcD2zNR7uzNNjCRGolCIsHiAAAbsb/hVW5
         jwlVZ+pEfRQ5JyotuoljiRh1DfreVWAsXS9PJORuTFZL8POsC1VBC3lb/Ke5Aa4zX0k4
         9uPr1Lpdde6kgBLNCoqCcqNFctIzhO5BB6WOpEabQsYjZaVILXBkUZuP379BiXqBagJ9
         DysvbQtcvjMhHEO1cMSvKGWxWyUSUxzUwkbZ78PJ0qhmQXrLJj0kvXtasO9uKI1VbUqA
         QC/w==
X-Gm-Message-State: AOJu0YxMfxz9x5hKd+141vKR0PQ6MahGbVJrVr1kgAf0ksFF893IDu4Y
	eezbmCONoWgn39mD1A7f1LioKA==
X-Google-Smtp-Source: AGHT+IHAVpjATHjbTVjN16DaPrQVI+srvJfDxutjkjnncDxheqgApaY+Jepb7zaoJHV9lXFsV/v2qQ==
X-Received: by 2002:a92:c7d1:0:b0:34f:b296:168d with SMTP id g17-20020a92c7d1000000b0034fb296168dmr311802ilk.26.1695881552635;
        Wed, 27 Sep 2023 23:12:32 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id x6-20020a92d306000000b003506f457d70sm4774467ila.63.2023.09.27.23.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:12:32 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v9 01/15] RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
Date: Thu, 28 Sep 2023 11:41:53 +0530
Message-Id: <20230928061207.1841513-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928061207.1841513-1-apatel@ventanamicro.com>
References: <20230928061207.1841513-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_231234_350363_A356C79A 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The riscv_of_processor_hartid() used by riscv_of_parent_hartid() fails
for HARTs disabled in the DT. This results in the following warning
thrown by the RISC-V INTC driver for the E-core on SiFive boards:

[    0.000000] riscv-intc: unable to find hart id for /cpus/cpu@0/interrupt-controller

The riscv_of_parent_hartid() is only expected to read the hartid from
the DT so we should directly call of_get_cpu_hwid() instead of calling
riscv_of_processor_hartid().

Fixes: ad635e723e17 ("riscv: cpu: Add 64bit hartid support on RV64")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c17dacb1141c..157ace8b262c 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -125,13 +125,14 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
  */
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 {
-	int rc;
-
 	for (; node; node = node->parent) {
 		if (of_device_is_compatible(node, "riscv")) {
-			rc = riscv_of_processor_hartid(node, hartid);
-			if (!rc)
-				return 0;
+			*hartid = (unsigned long)of_get_cpu_hwid(node, 0);
+			if (*hartid == ~0UL) {
+				pr_warn("Found CPU without hart ID\n");
+				return -ENODEV;
+			}
+			return 0;
 		}
 	}
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
