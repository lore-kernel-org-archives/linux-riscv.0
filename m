Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA510C47074
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPt8LAZJ4wcZhF5B/l74GcaoUPP8jKJHYUxWztf22CU=; b=kZnSHUS8B9jWIk
	FYMZ6HIJ/7fe3CHRmp9K0M8x+zc/nLW+OMPQKszbGijzZ1pTWpWzlie9N1UOJVtSRlG/3iQdkH0cw
	p5W9z9I9j/cvJCpJXkw9D1BaqMLFPO/ts+Z8StF+1eoJaa48vwe/pa2Qi04/tg4SKaFxHDXmyM04h
	f/RPDmZ3dmmKbECE5sUU0mQ58OXXUJgcEh6KsT7Ix537uFPlyoVS8eC6FY9uMYmPwxh4VfQKlZx9s
	eNzlYpvyAbgMSHbD1dlETdEhttgZPTJfCpEdDhxpZe+WyNq6QLpTcNpMaX1q7QgyfooOM+ucCdEeC
	y5nZtIEPnAs8YhY+vaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKkL-001bzf-1v;
	Fri, 29 Dec 2023 21:50:25 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk8-001bnZ-26
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:14 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6dbca115636so4333718a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886610; x=1704491410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9sAaI5x/m4qa/IsblGkrHPvGq73TiWdoovLssK6KVs=;
        b=vwQ2qf8ibEHTejlx/zVYw5vR4sjRuVy3nq6jI5Su2SBKkwepqqTJR3J8uUWdJNE96j
         CbE51wqxIj2LMqWYjyzNgxZmqBXCHABZ6J2a1hOtCXYliPAbgVpQKlkyk4QA6Y6uvE/i
         ET+yJ+rHjuuLT05bTK54f8dqrECirpiNarSSP3QU1jDKEd4tY9wKZTGfDuPCCeagJXHT
         9K8RS5xbro96dyl/00bFboHb5r8uq1RjHRulu7iKULq1EgqJlAmDx5MiCWO4JM5qu1sZ
         HToUu2FkwaTnZJSlkDdGvBW1yAPt5pfGP/XuyQzUAHnmnwQdMhjcGOAtTrqs67Q54hRa
         KuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886610; x=1704491410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9sAaI5x/m4qa/IsblGkrHPvGq73TiWdoovLssK6KVs=;
        b=ikq+SpuKoIH/Qcbi4DxWE+Fn2Q3c1zg1lkTmgE3cKK8fE5ykm13CFe3DghaA8A2jFk
         7yJvAXS1//8LZ+68/9zdiPb4AQRRqpF1q0PUANk8vV2d131RvHgjxQUQkH9BXns8bgfY
         oPF+IiBxR/g+CynOyV0vo/y2L8SU306y2qhwWUugsB6O9utnpfx22KJCr2MqNhAN7ZrD
         9XIiFoVL4DKTSks/3jczrAZs8m1z1EUj59/Pl03BeyxqCzYnT+hvtHoXtYvzbuAaW9lM
         lRrfXEzxJkXX1B/ppHMCpMgFjseJPpw73J/kotZvAUUtmbVZq9V5Ny46LTNb0q0dpVfv
         olQw==
X-Gm-Message-State: AOJu0YzRzwTTQtVnBqnsGttIYaVyyvRMfryKDWmrJG3P6KCK/Y4mxIGc
	qt+FCcYKcB9plwuGZlHfNkuWdvfNRk+Mzw==
X-Google-Smtp-Source: AGHT+IFoZdi69fR1RVMQrS5+z2lZ3ANAuSBiic5ImLxKQuR4x/mQOda884boDm8q+SDpYIGvV84mdw==
X-Received: by 2002:a9d:730f:0:b0:6d9:f1b4:c560 with SMTP id e15-20020a9d730f000000b006d9f1b4c560mr9972651otk.67.1703886610630;
        Fri, 29 Dec 2023 13:50:10 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:50:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 07/10] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Fri, 29 Dec 2023 13:49:47 -0800
Message-Id: <20231229214950.4061381-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229214950.4061381-1-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135012_729247_E41177B5 
X-CRM114-Status: GOOD (  16.56  )
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

Currently, we return a linux error code if creating a perf event failed
in kvm. That shouldn't be necessary as guest can continue to operate
without perf profiling or profiling with firmware counters.

Return appropriate SBI error code to indicate that PMU configuration
failed. An error message in kvm already describes the reason for failure.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 14 +++++++++-----
 arch/riscv/kvm/vcpu_sbi_pmu.c |  6 +++---
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 8c44f26e754d..08f561998611 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -229,8 +229,9 @@ static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ct
 	return 0;
 }
 
-static int kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
-				     unsigned long flags, unsigned long eidx, unsigned long evtdata)
+static long kvm_pmu_create_perf_event(struct kvm_pmc *pmc, struct perf_event_attr *attr,
+				      unsigned long flags, unsigned long eidx,
+				      unsigned long evtdata)
 {
 	struct perf_event *event;
 
@@ -455,7 +456,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long eidx, u64 evtdata,
 				     struct kvm_vcpu_sbi_return *retdata)
 {
-	int ctr_idx, ret, sbiret = 0;
+	int ctr_idx, sbiret = 0;
+	long ret;
 	bool is_fevent;
 	unsigned long event_code;
 	u32 etype = kvm_pmu_get_perf_event_type(eidx);
@@ -514,8 +516,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 			kvpmu->fw_event[event_code].started = true;
 	} else {
 		ret = kvm_pmu_create_perf_event(pmc, &attr, flags, eidx, evtdata);
-		if (ret)
-			return ret;
+		if (ret) {
+			sbiret = SBI_ERR_NOT_SUPPORTED;
+			goto out;
+		}
 	}
 
 	set_bit(ctr_idx, kvpmu->pmc_in_use);
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
index 7eca72df2cbd..b70179e9e875 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #endif
 		/*
 		 * This can fail if perf core framework fails to create an event.
-		 * Forward the error to userspace because it's an error which
-		 * happened within the host kernel. The other option would be
-		 * to convert to an SBI error and forward to the guest.
+		 * No need to forward the error to userspace and exit the guest
+		 * operation can continue without profiling. Forward the
+		 * appropriate SBI error to the guest.
 		 */
 		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1,
 						       cp->a2, cp->a3, temp, retdata);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
