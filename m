Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B505C54E66
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I79uVYunL3PVESLwVFjsA7DIoU9U/GZrSpLaT5y4nMc=; b=ajGauPNn5VQ22V
	nU0y3eIdfdtXW/MYxvRZ9OLCtGFiJee01oQC4NsYxF5DC6Nhnp57+aT0L8u3thSg27nhFUIbpN3TU
	+o6Ut5+YGuEuA5UtwaP6kkSWFyEyFPpCtCG+Mmxck6nC9foRdl6b7TV3cD+Mwsp8dZxGSDBxM4k2w
	p2nRThq5KePJkKD6vggLOsKbRf/cWcnuZJ6DDZxxlDw2k2EaUUfLTQk2makxzZpDhBtNYYD1Ff8DG
	uxt3JTwCjc81qNyqVgESaBqP8sesjzyuGE5oDpm2KCK8IB4TLPWCGa7w38mggmmV2vh/LApJZ2FdA
	Xe0b4LXSCFHVlUyQe6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86m-00000007Lg7-1S6O;
	Tue, 12 Mar 2024 19:48:20 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86R-00000007LVy-3VO1
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:48:16 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5a1ca29db62so2795226eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272879; x=1710877679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4XSa/PSXORT4uTdUR+bw2OZtjIlaWQWlwg5OyZv4ig=;
        b=0dNRFKiC2zpCsK4Sc8XxcOOs5twUhglSj87QE8fpQjLZpIBWJ8VCZ1b8t5wK4TwYUf
         VM8M86b0q395xHtgx1n9iGBVLbjdhFqK6bwy0C1LxgZaorxGRloqpAGQcBuWd1pmqHGd
         zqGPmQhQs/aG1t2UsxDiaA1mq212xVvpTQVZ9XIa93bNrDHx6EBmmDOlKr4MU+bdHjcc
         xC0EHbRTvkorEZ4tk4DHx4EtriLBV626fOTIQZ28ORt8CE8UGeqeDHGCCQsiEofr59ea
         +knaf2sfqlHGLhxuv/LiI+VBfpps76AwzbkFvDwd7ISYEGbrrVIsMgixzW2xfrm9UYx3
         KGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272879; x=1710877679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4XSa/PSXORT4uTdUR+bw2OZtjIlaWQWlwg5OyZv4ig=;
        b=b7wJIgiT4MaDVWLYp+nttqeoAHFadj0YuHMoGwSrFEMH89abHrJ/XAvLs80A1A0qkJ
         2TupiHOET8FBcqztWAR+80gbajkNkqK8RcM56MzevmD+D0sJDnmgA5XS4yO68N7SwB0H
         7JkNut5OychzAWgAgZgbZmHS4CQdJe2WK6IQIjUwBG3l4dwnHg4D1XB1gMpYp+RJfTbS
         9mUnt9Uzc63hQdlChhpPzP6DtgbhOcUqhHY6Wmf90nFWJiqzz1BBmCAisBn7606kvBIG
         YEOk7y+g8V/nX/20+3LmzNhe/MOYwUSBolWz0a99CDA6P4W8ZIXLzHG9IaBxUkBso2hm
         lZeQ==
X-Gm-Message-State: AOJu0YzIJ40w/0nb15SO2ii1+uiDIxVg+mnXd6+x3qwlqcayw7Byqnsg
	+q5Z157nZGM3PyhCARmZ0jJvskwxFyhhMFy2dOAJ6Oydnd1TeGHH/SzPplwOuDI=
X-Google-Smtp-Source: AGHT+IE+Yl3rd4VRKQ0Xgn0vLA0/IXGphbXEbzUjbknciDm6FUQ1nMtO8B6Nv0KNcv+QR9Td6lCSWw==
X-Received: by 2002:a05:6359:5f9f:b0:17b:88c2:5c13 with SMTP id lh31-20020a0563595f9f00b0017b88c25c13mr12958442rwc.7.1710272878964;
        Tue, 12 Mar 2024 12:47:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:58 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Mar 2024 12:47:54 -0700
Subject: [PATCH v12 4/4] cpumask: Add assign cpu
MIME-Version: 1.0
Message-Id: <20240312-fencei-v12-4-0f340f004ce7@rivosinc.com>
References: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
In-Reply-To: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=1746;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=BFOeXqJe9VyECGMuWiCNLoTZwBpuu0T2u1Mq+P/cqDo=;
 b=dUaXZnD9VQ8vsLYsKXOkCevPuNYqjQqs4wBvroTCyGKXR0MwtTqi+kVmNS6cpmRfvj+9eBpTV
 UJ9TU9gIUSeDYCpY+ggkBt8sv4yB1OqY2YjqtfD0d/3rv858ooSwNYg
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_124812_658078_EEDDB967 
X-CRM114-Status: UNSURE (   9.82  )
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

Standardize an assign_cpu function for cpumasks.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c |  2 +-
 include/linux/cpumask.h    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 329b95529580..2e16ed19e957 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -234,7 +234,7 @@ int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long scope)
 			stale_cpu = cpumask_test_cpu(smp_processor_id(), mask);
 
 			cpumask_setall(mask);
-			assign_bit(cpumask_check(smp_processor_id()), cpumask_bits(mask), stale_cpu);
+			cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
 			break;
 		default:
 			return -EINVAL;
diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index cfb545841a2c..1b85e09c4ba5 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -492,6 +492,22 @@ static __always_inline void __cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 	__clear_bit(cpumask_check(cpu), cpumask_bits(dstp));
 }
 
+/**
+ * cpumask_assign_cpu - assign a cpu in a cpumask
+ * @cpu: cpu number (< nr_cpu_ids)
+ * @dstp: the cpumask pointer
+ * @bool: the value to assign
+ */
+static __always_inline void cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
+{
+	assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
+}
+
+static __always_inline void __cpumask_assign_cpu(int cpu, struct cpumask *dstp, bool value)
+{
+	__assign_bit(cpumask_check(cpu), cpumask_bits(dstp), value);
+}
+
 /**
  * cpumask_test_cpu - test for a cpu in a cpumask
  * @cpu: cpu number (< nr_cpu_ids)

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
