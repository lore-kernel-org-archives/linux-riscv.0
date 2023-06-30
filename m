Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6679BEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeCGd1k1twcW4QAq9BwwgIINPD25BSFsiz/jcY2wsQc=; b=1jIudGdJbGmXrv
	uHETH6RQNsFKkWv+ALhv6ql2z+NKcv+4hPDrYkkfQhTMM3+5S70w1g+Lg89Xmf2k62EfKlvCmpmfs
	zIwHxF/w5UfF+W9vJCF5LWkXoeWRgfnBK5dCqOHbeyCBzy4Ov7HH7Zx4J5XIXsKNjkWwQjyGYrH0i
	AZapVqEI0IuPj+uCJwuJL99r1j3+A8Fkf5ElcefbQTrgHV6Bz4acyzklArr9KbDbsQ7eAGhXQkHSv
	vw+w9PNQYFvS42shTAvriZU2IQpfINzR6TNfVHHr/3X+5nqdeVb5fANyNjbMXFXLUhP1KbqF0IbRI
	4Lhr9IT1G5oXPht+sCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9fr-003D3l-2C;
	Fri, 30 Jun 2023 08:40:15 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9fj-003Cqh-2k
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:40:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fafe87c6fbso2536196e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114391; x=1690706391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOVYMufG9/FqBaKJMl/ssTpZw9h9Tbb5FABAwd0Y76o=;
        b=EBbwFVdpIP6AbRzaCcRxUMVywY4aT8TXXYQBzuXycm69Am66X12dUUj6ysptXYgNIr
         kGTOqS2hMSiKkr9t8z64Utml0NDzDblWb9Ih06lJFn88rRYmLS/ZPqlg6vNJLf55epe+
         mfrndHAolhwfEvfAkLITFEqkTzZdBDYfiD5T/qT4GIQHOmdzObxuWC0UwwP9TFrFmFpM
         bOPDk4nWuDmSYim/muDHyo6QJDgHMVwWgX305aJ7W6a9SKOfVaW1r9NQOFu5pEKK5lfc
         w7NUfhwrRVI6RlDSQw5InTNym6I+xWKhvZhPrW4P4cphlohLHplbvosEpLUxq3VL/KAk
         2BsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114391; x=1690706391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOVYMufG9/FqBaKJMl/ssTpZw9h9Tbb5FABAwd0Y76o=;
        b=Rx4BvXYvwBWuC2Im8hIgyx8X3ZgYAXXjLNU3Q/FLSR/h4/uAtCl199+IAHsMKJPBLs
         Kqhd6siSzPlPtqJjqaP6PdLya4XzFyjBagqVNIO4i2HXC3q7i7xcRymHNayj1H2x47Y3
         iO9rM09QF3UodDS27wnvx3DhdYnnJYLZjtjw3XoOAs4z69v08MgiRAU+u0M0lnltjUTo
         6Ei0A2LXGzteW2VsMHuIbsZWblj42sqE5qMf3f2Ha5Y0JkEi4dOyL2RgfnFdOq5r91/P
         iMoDPfCXlrVgMtdItg7q2sG08T/fju+EOcq8MsXXCI59Stp7ZMEqYLwnlDdMJc69LDZa
         XvQg==
X-Gm-Message-State: ABy/qLZVoiBASEVWBRJ7QIKufPEYnRo+VT6/uhf7Q9JLwt+ObaPZqOuK
	wQkCx0VULGxNxyGOsx57ptNPIg==
X-Google-Smtp-Source: APBJJlGNGYeNhgyNFQCIWRKRLA0RLNxSwiPewnnuJneE3RkbWYcI3Hv4y5MnEIudbxWchriJpKLCFg==
X-Received: by 2002:a05:6512:31d4:b0:4f8:5f32:b1da with SMTP id j20-20020a05651231d400b004f85f32b1damr2010376lfe.24.1688114390713;
        Fri, 30 Jun 2023 01:39:50 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l6-20020adff486000000b00313fd294d6csm9704615wro.7.2023.06.30.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:39:50 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 08/10] Documentation: admin-guide: Add riscv sysctl_perf_user_access
Date: Fri, 30 Jun 2023 10:30:11 +0200
Message-Id: <20230630083013.102334-9-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_014007_907189_A5FD67EB 
X-CRM114-Status: GOOD (  11.70  )
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

riscv now uses this sysctl so document its usage for this architecture.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 26 +++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index d85d90f5d000..c376692b372b 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -941,16 +941,34 @@ enabled, otherwise writing to this file will return ``-EBUSY``.
 The default value is 8.
 
 
-perf_user_access (arm64 only)
-=================================
+perf_user_access (arm64 and riscv only)
+=======================================
+
+Controls user space access for reading perf event counters.
 
-Controls user space access for reading perf event counters. When set to 1,
-user space can read performance monitor counter registers directly.
+arm64
+=====
 
 The default value is 0 (access disabled).
+When set to 1, user space can read performance monitor counter registers
+directly.
 
 See Documentation/arm64/perf.rst for more information.
 
+riscv
+=====
+
+When set to 0, user access is disabled.
+
+When set to 1, user space can read performance monitor counter registers
+directly only through perf, any direct access without perf intervention will
+trigger an illegal instruction.
+
+The default value is 2, which enables legacy mode (user space has direct
+access to cycle and insret CSRs only). Note that this legacy value
+is deprecated and will be removed once all userspace applications are fixed.
+
+Note that the time CSR is for now always accessible to all modes.
 
 pid_max
 =======
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
