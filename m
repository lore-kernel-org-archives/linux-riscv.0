Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F9DC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhZG+X1m/xT3fV3wxBo/yNrUgHsEMisv0loVYZ8KvQk=; b=0/uLwRiiCrTSrS
	MuvXydpRil058q5U3sJ5jgik36fUidHB7cn6/nZAsWX3NzNsVyHlIWiaZa7LG8PAbwPKjYpUC9D47
	UX2mumeTvs5fTSEppORrl+RyeawWo4SL9fViuYUW24o1VDi8Oo4Eqy3+rjs4nzQPM1zX/+MqGfb4I
	xTb+AWnmVTG2b+cfVcS6KzMyheJH6Rq9CeNtHigTZvtafmto7b5LvFzrqCZU0MkVaXbOVl+hWJW5m
	schAF3YqWwmZIBgeCjIaqdxUlgKdm2ImewizsNeJmkTFtc/j2Z6CqbSojySbfdT6ccdXEIYXHLziJ
	4zZlG9A9V98rPHGY0ILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvdA-0000000Ej31-0tme;
	Wed, 03 Apr 2024 08:06:00 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcw-0000000EigB-1cyn
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:48 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5dca1efad59so4381204a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131533; x=1712736333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=v/84nTXuOlbtGb6cTg6yIxvolwTS9ec7zNrknC5EQj2ABaQrkK659DDDfCkvKRbTwc
         WowaJ/q/CfnLV/PkaiKwP+S/XnplCiRXPJQr5JWvm1QEkZ9MYQz7FDU35YCw1YhkqZG/
         aMqIC2l3/uV+tZiJdnt8x2kK3sVPuwCZzf7tJ9YMNFsdVSsYl3WJ3HzlL17QekUWUiYJ
         g555zuAlIUXaELhqR7Hp9Uoawj1FFMybF/w/3OWXXIOj3/uC7u/K6HININ0cpGxJVjpZ
         nancgIqtesEg3x8bF4JZlxrZzlkI1CkVsDBNC4UfkPk+eVPxnjIKmpPVU4wL1RtNDrHG
         eeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131533; x=1712736333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=tpVDCNnD9MVk2JHso3HX5VLCFnFs6QxekajCtJRG7oCTIU3RVUYAaOhOFI4NoHHiVH
         1vR5bmdbnl8s6Uc3Y+e39V916pAXYuNdUYv6xAt0rjXm1EvoJGK7HraD3Bl9PjQ1n2Lw
         l62fzjOqwP+Czd6UHwL1rfsvEJkWHnmhvCr318wVzN257S7mwIxZ46431F7Hl4xTDv0K
         jzc/82/ZfUzkh+a2vMVMUWdWW0m8Ns9eSPUThp7unyquLsik+1NbLbhIbOA/cIznY/Ps
         Az9Xarlz0eC8vjHNOB9tmu7JOPm3nJRoCAPgyV8ZTnXYWP6i5+AVty/Qesw3S/jZSul0
         jNHw==
X-Forwarded-Encrypted: i=1; AJvYcCXC6HFROQiu57EOKxrjLTeisw9S/bnkzcl4u3nMnBdhq0dm+XJ3td9fNlrfLohxl086T7kSuz+OL5R0nOgLI+b6hL2RSJUHi7U2qt4dkZqU
X-Gm-Message-State: AOJu0YwALC9i/tOQZB9pdmIfAX1rH5jvyGJNwlzUfxmb15sKyH9DGpoF
	vGWsj8dn0LGMDPduyL+Y3IfhJ1TaurNfPSxrax16WSAl06OFC0BiPctRdExqXYY=
X-Google-Smtp-Source: AGHT+IHYBgMwEeWVbd4P9PNDRXwi0PIWRTlB15cj+AGKTpxTy9q1IU7RrYP0KIGaFYPVod/3S9sbOg==
X-Received: by 2002:a05:6a21:3294:b0:1a5:6a85:8ce9 with SMTP id yt20-20020a056a21329400b001a56a858ce9mr2619252pzb.12.1712131533285;
        Wed, 03 Apr 2024 01:05:33 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:32 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 10/22] RISC-V: KVM: No need to update the counter value during reset
Date: Wed,  3 Apr 2024 01:04:39 -0700
Message-Id: <20240403080452.1007601-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010546_601992_86A5A287 
X-CRM114-Status: GOOD (  13.12  )
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

The virtual counter value is updated during pmu_ctr_read. There is no need
to update it in reset case. Otherwise, it will be counted twice which is
incorrect.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index cee1b9ca4ec4..b5159ce4592d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -397,7 +397,6 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 {
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	int i, pmc_index, sbiret = 0;
-	u64 enabled, running;
 	struct kvm_pmc *pmc;
 	int fevent_code;
 
@@ -432,12 +431,9 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				sbiret = SBI_ERR_ALREADY_STOPPED;
 			}
 
-			if (flags & SBI_PMU_STOP_FLAG_RESET) {
-				/* Relase the counter if this is a reset request */
-				pmc->counter_val += perf_event_read_value(pmc->perf_event,
-									  &enabled, &running);
+			if (flags & SBI_PMU_STOP_FLAG_RESET)
+				/* Release the counter if this is a reset request */
 				kvm_pmu_release_perf_event(pmc);
-			}
 		} else {
 			sbiret = SBI_ERR_INVALID_PARAM;
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
