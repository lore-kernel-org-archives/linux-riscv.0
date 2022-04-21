Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B996C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 17:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7XgB6evopsaYoLCSrtuPrO+fsj1kUG04v4DYWQlyA3U=; b=PSsm07hrN9MaSj
	tHCw5AxM0nh5TFol7WoyoaaFuRskvgPF95UiQhgFxNJ/880fr5V2Ww4j1ZoK/68J6Gj1Q/0k9b5QB
	i3fHrfaG8bhpP3enQ3JLOHeAHGez+xPAZvJIpbR3HVVJHj73XZ4FYLumDvFh/qqiNjygp2RvwdLpO
	kAcClesbPoWsCti8RPbfecJimm+uOqo9CS36bY0M8f8QJseV8fJczYNsglv+q2JlBHNyWE2ukJNyp
	P7lr4vEph1IZmaZFHo6+Wwbb83aY+4Y+zfkR6+K79f5jf0c+OwNUBYFjdRziF/rWiF3CQA16CA16C
	OQKk+AYeKQZJDAsrtDqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhaFe-00ENkn-Rf; Thu, 21 Apr 2022 17:05:54 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhaFR-00ENfx-PH
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 17:05:43 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so8279554pjn.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=VAtOPkJ1SY/tzMbGCTKTKv8dG7z23I5mteO8idQRNqw=;
 b=F03wFIkvH5mHwPm9Vdu97iKnCWlemvMdFvOppF2ZHGD8qtffYcRETG3VtVhIj4qvYx
 XWmKJ/KsFbZPc1kUl1FxRWXZr5+5Vn5eHGrysqnfIv3aZFgOr4xeSn3fDvZQG9uLzcMQ
 M/9UffPcFn07CYsjM+L2p5OHf9tHrF5TTki3qW1CH4jL0aF8veH/OpcovTFTbw2NpU3+
 0w3kbZmQ1MT0WHZoHPveAXxJmj6KLpBbvQvXnpN51UYFdvkEMfI1ozg8XM9sEgA33H1f
 KB577+f/yUEmDZQCuJmDNEJ/9zZ3H9cfwN3Q/rDUZlUDARsAPSs1PEcRG2meHbtvi8Pg
 RvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=VAtOPkJ1SY/tzMbGCTKTKv8dG7z23I5mteO8idQRNqw=;
 b=0YrNVeZlPg7NX6KrUGXmYApilPkY6n6DwRrlU6SWQa6tGbkK/Lz4g9402RNg5fTZd9
 AAuA9zJSp5CULZx0hKAbjljzB47C00Y3Cedb03CyiwKROvlreLBEi4Rj37NjdMH8YI+i
 +iBZmyiMpR2kC86sz8KzAAcVDJreCnSGG3T8pnhEkjSgpoGHDdCj0LfoLiDwWYGhPZT2
 xRu/MinTGmrODmCw8HbFvcOrBaLQZ1dlxP9LVQ1p8rhz1UI9+B/mttVdnKpneOqaKSS3
 pYkhOyKcSAb/GbTtdcYrFL4rTnL1viyacbSxC0pk7V8FdOkIh61I45+3dbJOtquFEAbh
 q5Tw==
X-Gm-Message-State: AOAM533SUTttfdMeJRSewQQ07fkWrczTXVbCqo+dacsJPHRvbxgXJV1w
 /XqKEqagR53rP47uv85n3a+Kkg==
X-Google-Smtp-Source: ABdhPJyjqlvEcnOu/+Sk4eVZPHB9SHCOwWZKtrj2V0KbAODClpJDnwpOm1MZqxewG78k6bjgkizydQ==
X-Received: by 2002:a17:90b:384e:b0:1d2:798d:6f42 with SMTP id
 nl14-20020a17090b384e00b001d2798d6f42mr635645pjb.5.1650560740380; 
 Thu, 21 Apr 2022 10:05:40 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 j6-20020a63b606000000b003808b0ea96fsm23186858pgf.66.2022.04.21.10.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 10:05:39 -0700 (PDT)
Subject: [PATCH v1] RISC-V: Only default to spinwait on SBI-0.1 and M-mode
Date: Thu, 21 Apr 2022 10:03:55 -0700
Message-Id: <20220421170354.10555-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, atishp@atishpatra.org, anup@brainfault.org,
 Will Deacon <will@kernel.org>, 
 mark.rutland@arm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux@rivosinc.com,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_100542_096428_0CF15603 
X-CRM114-Status: GOOD (  14.76  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The spinwait boot method has been superseeded by the SBI HSM extension
for some time now, but it still enabled by default.  This causes some
issues on large hart count systems, which will hang if a physical hart
exists that is larger than NR_CPUS.

Users on modern SBI implemenation don't need spinwait, and while it's
probably possible to deal with some of the spinwait issues let's just
restrict the default to systems that are likely to actually use it.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This seems to be the source of many of my new hangs when trying to test
the NR_CPUS=512 support.  It's not really related, just fallout from
testing different setups.
---
 arch/riscv/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..dd5e975abe37 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -359,7 +359,7 @@ config RISCV_SBI_V01
 config RISCV_BOOT_SPINWAIT
 	bool "Spinwait booting method"
 	depends on SMP
-	default y
+	default y if RISCV_SBI_V01 || RISCV_M_MODE
 	help
 	  This enables support for booting Linux via spinwait method. In the
 	  spinwait method, all cores randomly jump to Linux. One of the cores
@@ -370,6 +370,12 @@ config RISCV_BOOT_SPINWAIT
 	  rely on ordered booting via SBI HSM extension which gets chosen
 	  dynamically at runtime if the firmware supports it.
 
+	  Since spinwait is incompatible with sparse hart IDs, it requires
+	  NR_CPUS be large enough to contain the physical hart ID of the first
+	  hart to enter Linux.
+
+	  If unsure what to do here, say N.
+
 config KEXEC
 	bool "Kexec system call"
 	select KEXEC_CORE
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
