Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4736C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeIh27JZGNzAEdL49duZ0LdbHS+Th+7LVg+92kk1D84=; b=3JMor6qngO+rrg
	43jIuz34zjg3SvjEm88cy9vV8FgxRAn8MUv3AfDBz4PT7+7h4GiuzRW7RAwG/xXCaIuRACJbNYjwh
	4bNv/38/JNaLcZMGklsBPm0xaoMcN8Uj9D65IzLTuWWHc+goF+CovWU8XWz5WS69EuKOQAQ/LL4pV
	3UFw3sA/LrXE9yXCiV+eVE64GJy3UyVTeYr0MEhiLQYDSxDYHxF4Owit4GGCY2YckVdsOijqXb2GE
	VezFTVchU/JUN+mO1q+CeOs6oWi+RfX2X3Ohimx2aBKxKgSzz+V95h7ua3YQvMjBTxkdTDb6Fb3dB
	kPiod94QJj53UQ7DXvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnpb-0000000DNw6-0cBG;
	Tue, 16 Apr 2024 18:46:59 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnf-0000000DMM8-3TA2
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:08 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so42403a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293098; x=1713897898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=plcUAT0mEdk8xLS79c04UviK/gVl8LJbrTbQdSZ7on4fFtPV02ABgSMpfAJiMfqRL0
         C3vj/cBIWBgbe2mR/wODvx1fvesJLklg2a2yCYh7acwHtnvxGbCR+jibnM3h0rAKF0Ae
         SuhetJ17o2ghejn94EhWE9fDc6qCMMkVb9IvhLXUg0lb06CPQXTU7F3Z2f8LZUhcITpp
         pqXRV0P6q6J0jZB4odDfV4MDjhFOwp7gkrgBbgEBMcn6enpmA4N8hx/8BKefyFmC94FU
         nP4UilsgGA3mZD2wq5/zASqHXWwdlVnN9Ezx2qETiJ3p6YSJz4J+Mn+DaCHLK3KMaWL+
         WfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293098; x=1713897898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QIyaUvQe1Xat3Gv2wtXts1DoFv5C5UbopqhCGzslRuw=;
        b=nPYL3bFhPc6y1n4Ko2EdZnNXAwjvy7p5WEBHvtJ6JlvAJrawqf/lsjisUznSzORxlh
         Em3HM19GuLQUJjJMdqVSAEXlQc0nvkGXIMMJBsQyoHd2ZsQ9s66MiYv5nNwqQWn/lrsp
         J+qV7bpXVLA8uOTUxWZizIfRWpxQOPZd3Hq18g+9Ddr4VQFWm1nIvNZoB85jyR10K1te
         uCLK5k7vCNVtYyCfospYegXNnyANrYggU7jSmWVMfJTH3Ad711cktRzeK3ypJiZoek8U
         zLwh1POOG5vjgzxqiUb/WV8urYak/4oQm4/9imMI8DsNVMUNbSL6Pi3LrYMBZ+CY6jnx
         I4gg==
X-Forwarded-Encrypted: i=1; AJvYcCXIBd0qoMzRjtGwpCu3HnlCoXag2hoScfbjzUBy+Ux0Df7DaFDTjOkXZi2q+jqqYCCLHi3221W56nj/EyIUzO08Mm1xgIq80gO/kRd5/3+y
X-Gm-Message-State: AOJu0YxKCrWaWmCHrQ8272T1t7SBLZG3hr4thEmz2wEqUh8KcartF/n6
	XWMJBCgaAgujh1ZPkMCUAH2k95PzuUWLc51EBuMyeWmjkuNVY2mQp+fasg31+v0=
X-Google-Smtp-Source: AGHT+IE5BlMcsvz+u+Gj/J8AqEIUfsDQO0SrpH7rjTE2a3GSrJYPJFMfaRQ3pXJt55L3OJ7SLgYUVQ==
X-Received: by 2002:a17:90a:db42:b0:2aa:c389:c9f0 with SMTP id u2-20020a17090adb4200b002aac389c9f0mr2914939pjx.12.1713293098421;
        Tue, 16 Apr 2024 11:44:58 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:58 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v7 12/24] RISC-V: KVM: No need to exit to the user space if perf event failed
Date: Tue, 16 Apr 2024 11:44:09 -0700
Message-Id: <20240416184421.3693802-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114459_957270_B06E5D85 
X-CRM114-Status: GOOD (  16.96  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 14 +++++++++-----
 arch/riscv/kvm/vcpu_sbi_pmu.c |  6 +++---
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index b5159ce4592d..2d9929bbc2c8 100644
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
 
@@ -454,7 +455,8 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
 				     unsigned long eidx, u64 evtdata,
 				     struct kvm_vcpu_sbi_return *retdata)
 {
-	int ctr_idx, ret, sbiret = 0;
+	int ctr_idx, sbiret = 0;
+	long ret;
 	bool is_fevent;
 	unsigned long event_code;
 	u32 etype = kvm_pmu_get_perf_event_type(eidx);
@@ -513,8 +515,10 @@ int kvm_riscv_vcpu_pmu_ctr_cfg_match(struct kvm_vcpu *vcpu, unsigned long ctr_ba
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
index 7eca72df2cbd..e1633606c98b 100644
--- a/arch/riscv/kvm/vcpu_sbi_pmu.c
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -42,9 +42,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #endif
 		/*
 		 * This can fail if perf core framework fails to create an event.
-		 * Forward the error to userspace because it's an error which
-		 * happened within the host kernel. The other option would be
-		 * to convert to an SBI error and forward to the guest.
+		 * No need to forward the error to userspace and exit the guest.
+		 * The operation can continue without profiling. Forward the
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
