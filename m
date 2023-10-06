Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E5BE92FF8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCBpdhF/WAd4ZM5u9MSMim9BOte1d9SX+HDuv2iRQx4=; b=E5BLeCvWSdaB5k
	wdWTZw/LVWpTgyTemvAq9KSm+wVCE12WJt9+zMZhjgX7kcF3hEJOk6gUNes4d8N0JFrx5pu2ieZZo
	nsZ78wSX+xgPFB40NhqF3NSla1c1kuiXXHRjrnqK4yxpAJdqmFvq/yGl0ZxLyWa3iQ0rHigoNbRxR
	a9OPnER6OYOXNMKsMbvCj0QU07SB+jjIQdoGMMH2fYWQwWDQrscFiVGjWV5USVfvEV1eVSyIrynvW
	LzJk6LcyBrRVzSxZ84seaKXBowR1dktr/BTo3wrr2AiPEeCQrnEa2DF8RG0uZoAmqz7825T3kxD6S
	tcOWnRZKtQBca9p6Az9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qog4P-005Gga-01;
	Fri, 06 Oct 2023 08:20:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qog4I-005Gb7-2O
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 08:20:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-323168869daso1785820f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Oct 2023 01:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696580414; x=1697185214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ivd7j2peOIOg94hicEYRZDVodglnkivL/ESOnnASd3k=;
        b=ezXNWtpugNWBC1kezN0hObUg+MvWfLjlGaEXW+izdh+xuwWsrToiNfaHRVtZyYrTc5
         S+8EELs40B7sKC4dxwlN35qNbg8g09M7xiSmHEEh5mp9iBuvX6Og2GFtXm6JJczAewDo
         UGZ+yT6Hxn9I3QTMGxmNuUC1EENPt6J4QBKoDBH/aaEmIOhPx0Ijgw76q+Pnp3fRXe7/
         dVhiBgN4cHStZgVb8lr5K9nxHB4eG8nfn6B6J29Sy4awDPzIONFBjVQNSU84w9ePdD7V
         BQ0TPBI0a8zBYkhS6+G1aQFAVvHwtpqND+qGwaIizH9Iqf1bPz55KXsc8JeewBcmlr9A
         YqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696580414; x=1697185214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ivd7j2peOIOg94hicEYRZDVodglnkivL/ESOnnASd3k=;
        b=IAR781DzWKp4tJQplduHDiY+tXMTL3d1aRs3EkIQvdLUkCAMJ14YGalgxWu6yS2DPD
         4eVM3TTQC3rlmJpdWTkgY6AijKFsZbGpLZ320FwslX3jF8R+FQ74tjqvwvNMjgwGZqso
         Qwspc9WTXc2dG/EFoYkLTqRp6okIVK9WwYlTnvnCXv4rF/drg/R474nrVmL468gWFV4/
         JWvandv2OBKrzlNR0V7Mt90NwFGEXaV5tHsUapqJsSu9ZAuLjTEKJSO25VWJOX5Kk51Y
         wvuuiDF/qwP9WFpUfISJVztFas4ocapmexAWg8E98uuOdQfTB/gvzkY1/Njnh7tMRJo7
         6yrA==
X-Gm-Message-State: AOJu0YyDVRQIyAw6V4nkneMzvOf1E6Jo7ctX8Iu3LbnDl6zCuBI4sBPl
	T9xJDxXOz2rFcvyWcf/MKurx5g==
X-Google-Smtp-Source: AGHT+IE1AMKEMxH95GmDTdEVyZcJ7fiTghuZ3x9XqNTeH47qdaIvZlGAwBqLQVwpunerkI4rs14Rjg==
X-Received: by 2002:a05:6000:10c7:b0:31f:f893:e07f with SMTP id b7-20020a05600010c700b0031ff893e07fmr6654961wrx.12.1696580414155;
        Fri, 06 Oct 2023 01:20:14 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z3-20020adfec83000000b0032327b70ef6sm1066573wrn.70.2023.10.06.01.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 01:20:12 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -fixes] drivers: perf: Fix panic in riscv SBI mmap support
Date: Fri,  6 Oct 2023 10:20:10 +0200
Message-Id: <20231006082010.11963-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_012018_781969_DAEE4500 
X-CRM114-Status: GOOD (  13.44  )
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

The following panic can happen when mmap is called before the pmu add
callback which sets the hardware counter index: this happens for example
with the following command `perf record --no-bpf-event -n kill`.

[   99.461486] CPU: 1 PID: 1259 Comm: perf Tainted: G            E      6.6.0-rc4ubuntu-defconfig #2
[   99.461669] Hardware name: riscv-virtio,qemu (DT)
[   99.461748] epc : pmu_sbi_set_scounteren+0x42/0x44
[   99.462337]  ra : smp_call_function_many_cond+0x126/0x5b0
[   99.462369] epc : ffffffff809f9d24 ra : ffffffff800f93e0 sp : ff60000082153aa0
[   99.462407]  gp : ffffffff82395c98 tp : ff6000009a218040 t0 : ff6000009ab3a4f0
[   99.462425]  t1 : 0000000000000004 t2 : 0000000000000100 s0 : ff60000082153ab0
[   99.462459]  s1 : 0000000000000000 a0 : ff60000098869528 a1 : 0000000000000000
[   99.462473]  a2 : 000000000000001f a3 : 0000000000f00000 a4 : fffffffffffffff8
[   99.462488]  a5 : 00000000000000cc a6 : 0000000000000000 a7 : 0000000000735049
[   99.462502]  s2 : 0000000000000001 s3 : ffffffff809f9ce2 s4 : ff60000098869528
[   99.462516]  s5 : 0000000000000002 s6 : 0000000000000004 s7 : 0000000000000001
[   99.462530]  s8 : ff600003fec98bc0 s9 : ffffffff826c5890 s10: ff600003fecfcde0
[   99.462544]  s11: ff600003fec98bc0 t3 : ffffffff819e2558 t4 : ff1c000004623840
[   99.462557]  t5 : 0000000000000901 t6 : ff6000008feeb890
[   99.462570] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[   99.462658] [<ffffffff809f9d24>] pmu_sbi_set_scounteren+0x42/0x44
[   99.462979] Code: 1060 4785 97bb 00d7 8fd9 9073 1067 6422 0141 8082 (9002) 0013
[   99.463335] Kernel BUG [#2]

To circumvent this, try to enable userspace access to the hardware counter
when it is selected in addition to when the event is mapped. And vice-versa
when the event is stopped/unmapped.

Fixes: cc4c07c89aad ("drivers: perf: Implement perf event mmap support in the SBI backend")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/perf/riscv_pmu.c     |  3 ++-
 drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 1f9a35f724f5..0dda70e1ef90 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -23,7 +23,8 @@ static bool riscv_perf_user_access(struct perf_event *event)
 	return ((event->attr.type == PERF_TYPE_HARDWARE) ||
 		(event->attr.type == PERF_TYPE_HW_CACHE) ||
 		(event->attr.type == PERF_TYPE_RAW)) &&
-		!!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT);
+		!!(event->hw.flags & PERF_EVENT_FLAG_USER_READ_CNT) &&
+		(event->hw.idx != -1);
 }
 
 void arch_perf_update_userpage(struct perf_event *event,
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 9a51053b1f99..96c7f670c8f0 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -510,16 +510,18 @@ static void pmu_sbi_set_scounteren(void *arg)
 {
 	struct perf_event *event = (struct perf_event *)arg;
 
-	csr_write(CSR_SCOUNTEREN,
-		  csr_read(CSR_SCOUNTEREN) | (1 << pmu_sbi_csr_index(event)));
+	if (event->hw.idx != -1)
+		csr_write(CSR_SCOUNTEREN,
+			  csr_read(CSR_SCOUNTEREN) | (1 << pmu_sbi_csr_index(event)));
 }
 
 static void pmu_sbi_reset_scounteren(void *arg)
 {
 	struct perf_event *event = (struct perf_event *)arg;
 
-	csr_write(CSR_SCOUNTEREN,
-		  csr_read(CSR_SCOUNTEREN) & ~(1 << pmu_sbi_csr_index(event)));
+	if (event->hw.idx != -1)
+		csr_write(CSR_SCOUNTEREN,
+			  csr_read(CSR_SCOUNTEREN) & ~(1 << pmu_sbi_csr_index(event)));
 }
 
 static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
@@ -541,7 +543,8 @@ static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
 
 	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
 	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
-		pmu_sbi_set_scounteren((void *)event);
+		on_each_cpu_mask(mm_cpumask(event->owner->mm),
+				 pmu_sbi_set_scounteren, (void *)event, 1);
 }
 
 static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
@@ -551,7 +554,8 @@ static void pmu_sbi_ctr_stop(struct perf_event *event, unsigned long flag)
 
 	if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
 	    (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
-		pmu_sbi_reset_scounteren((void *)event);
+		on_each_cpu_mask(mm_cpumask(event->owner->mm),
+				 pmu_sbi_reset_scounteren, (void *)event, 1);
 
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, hwc->idx, 1, flag, 0, 0, 0);
 	if (ret.error && (ret.error != SBI_ERR_ALREADY_STOPPED) &&
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
