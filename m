Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2C5C636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whG77X5aKWHaNTQftbeKKO0wdqCoZype10YOoLDoYss=; b=GPXP+fbcsOZ7vH
	U1ZoGmJp2gWjzP2BdJpRMTc7czs198gUaAyPi6ylUETkP/GZi7bNJ5HtSIZ5xKt+Jovx/aWMgDsj/
	bSF1fYFxKPcm6boUma5ZMoSh449DuZUVbjghhl+m8aAxTOqHVXzjs/oXjood0Q76lCInMGA6vOVo9
	ofThLizZhnm2G7K9Szf5VwOliEIVrsd0KSBxDq4lfRLZYYuJ4a/VRYHe2z1mppTdchtf16gxvqBPW
	Bkl9szxA353vxeU8LvWIUlRIFDG7BA/T4moc0TBignHt3OebRxdIKzgQh5/hUSTYhre1u2KcqihzC
	oYX4SnlVUzY0vO5DIjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNNGn-00DwnP-Ui; Thu, 02 Feb 2023 00:16:05 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNMHs-00DrKm-Ob
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 23:13:14 +0000
Received: by mail-pj1-x1031.google.com with SMTP id ha3-20020a17090af3c300b00230222051a6so149313pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPkrRraxSxPO8Bas1c93CWcZiwYxt6lnwNFP5o7eW+0=;
        b=GDjRVrlMr6DII4aIgdnPYMJ41hWW5uh72aFtABpePmoexFkHPHvcA/3dfDQAMWzoo8
         OPiap6WUXigqdbr/QtNfCF0eN6nzgZDx/l1VlPRWMFRjBo8sOwqp5MkZAd6RaUnpj0UJ
         JVu0nq2lkaGj+yVQR8LACwjzqaL8koEXohUSTYpwqTI54GSaIWVaeJp73qWyybkxjvhC
         NyvKhAlZwgqKDEov8r5C65xjF9YhGzKxvlL37uWjR5JKo0U4WrmCX3e5Rno8wn0dSxiM
         aK1SGbzvyzZv3k8+6BPMo7aJnrtNisqjOerXpTjd52qu8NQblBu0CN7xwO0Rgt+gwuc8
         6cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPkrRraxSxPO8Bas1c93CWcZiwYxt6lnwNFP5o7eW+0=;
        b=UTeZc6RTQFBUhhDxiIUH/t8mqSDtOzniAErH8RuvaZhyBSgUlkZAAEabGeXZ7yQGVL
         qdKATJseYFToNdSCHJevdHNjvYRFwJ1KiCtjMg5/QhCwpX81almnRpk5LjtYVxbL5TEv
         8EZAuKMJorzRemzv31Ij5GJ23GWs0izp+lhJ37ofSWqsJ1S+guF30bnW4DUqnO0fJ2JB
         Abht6U5q8SiDNmznKKy8EoaVjrBX91zI2cR/POOJCJBaGdZOeMEs/lWVqAz1t5jsTvW3
         8edyW+xwe5KN87CEQIGMXHXtLVAF8VgmGcGbJFvgkKMIF4pR5XLwsQiOHCdevPdykrpu
         zmAg==
X-Gm-Message-State: AO0yUKVMRAToxMhBdX0G1DCcdoUsxe7vwwcpKRKbxDx3XSnwYLV2lRAB
	wFefs0IAal4LmFLf+/aJFIfKdg==
X-Google-Smtp-Source: AK7set/j7/SK7FHXfvxWEEeu+5cvX72ttD9RDrBgPJ0RWp+yvVFZgAlWnrRL+B+Q10v76F+KGFhiOw==
X-Received: by 2002:a17:90a:1955:b0:22b:fcb6:c7cc with SMTP id 21-20020a17090a195500b0022bfcb6c7ccmr4186306pjh.29.1675293174658;
        Wed, 01 Feb 2023 15:12:54 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:12:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 02/14] perf: RISC-V: Improve privilege mode filtering for perf
Date: Wed,  1 Feb 2023 15:12:38 -0800
Message-Id: <20230201231250.3806412-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_151308_872808_191C00FE 
X-CRM114-Status: GOOD (  15.33  )
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

Currently, the host driver doesn't have any method to identify if the
requested perf event is from kvm or bare metal. As KVM runs in HS
mode, there are no separate hypervisor privilege mode to distinguish
between the attributes for guest/host.

Improve the privilege mode filtering by using the event specific
config1 field.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c   | 27 ++++++++++++++++++++++-----
 include/linux/perf/riscv_pmu.h |  2 ++
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 6b53adc..71174fa 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -301,6 +301,27 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr)
 }
 EXPORT_SYMBOL_GPL(riscv_pmu_get_hpm_info);
 
+static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
+{
+	unsigned long cflags = 0;
+	bool guest_events = false;
+
+	if (event->attr.config1 & RISCV_PMU_CONFIG1_GUEST_EVENTS)
+		guest_events = true;
+	if (event->attr.exclude_kernel)
+		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
+	if (event->attr.exclude_user)
+		cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
+	if (guest_events && event->attr.exclude_hv)
+		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
+	if (event->attr.exclude_host)
+		cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
+	if (event->attr.exclude_guest)
+		cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
+
+	return cflags;
+}
+
 static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 {
 	struct hw_perf_event *hwc = &event->hw;
@@ -311,11 +332,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
 	uint64_t cbase = 0;
 	unsigned long cflags = 0;
 
-	if (event->attr.exclude_kernel)
-		cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
-	if (event->attr.exclude_user)
-		cflags |= SBI_PMU_CFG_FLAG_SET_UINH;
-
+	cflags = pmu_sbi_get_filter_flags(event);
 	/* retrieve the available counter index */
 #if defined(CONFIG_32BIT)
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_CFG_MATCH, cbase,
diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index a1c3f77..43fc892 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -26,6 +26,8 @@
 
 #define RISCV_PMU_STOP_FLAG_RESET 1
 
+#define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
+
 struct cpu_hw_events {
 	/* currently enabled events */
 	int			n_events;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
