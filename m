Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783CFCD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhZG+X1m/xT3fV3wxBo/yNrUgHsEMisv0loVYZ8KvQk=; b=s46h+nhkoQvd7t
	3r4nobYr75hfjBz2/bNRdpcvVEikYDdTcO4SA1vCBgfTLpdfTcb+yxmD+jBSOBQFZZQV3qCIQRCAk
	4YgJjbOUJKjXAqLmUIg9vUkTXh/rbEe9DhjY5Yo4VIg83TZu0JEyDLD+pYFbmtqPBbdZqrF7QzIba
	BP2W45wRYllK2EvHh5v4sgYldZ7rHjmcjcWtppdKCCRgdy7Qk6eQekgspotM6oJR373KGWud0XLqo
	godHQVxZCeXOLSEGYLbVt6xehKOQdF+8fbzGdiM/7rOaO+Z7SKKBZIMPAZvkJEo3rPfSyoNlJW4us
	Sgrqs6/JBNDvRtHxNtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzt-00000009a6e-30P9;
	Thu, 11 Apr 2024 00:08:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzY-00000009Zm4-3p5f
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:08:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dff837d674so61408645ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794116; x=1713398916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=V7ik27TQHiz6ZVNw2GbI1gIsfnOirFQqe0Imu/4vMno8SbKqeVFk6iaihkebS8hGfL
         xIM88JBHaDUK1AirNeEmlCIraVLRuzHdXPuH+HaOdaNauRbDD7SCqbj3rCLqS3cvrNQl
         wM1XA3mQseN1u5lVB94LSCOSvWR+BxNBoNmmerOoW+sD6FQ4Qj5DEBbMmo9/TeE2ATQk
         jvFrlHIpqkgy6SnoIWeD98JB3Ynzmgh1k57p08ZNT0v399wvtdkWUQREQry1Fcuujudo
         Bn9FKI8UFzoIZsCZ/Y4EDVmeqZ1ih00DdcZ440G0zRKAUf9R5iJIuJqDhgeuNxrwmifm
         LLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794116; x=1713398916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=WEDW433czKqGZbb8WWKpRdl0vGBoNAgoZRMWRI7Z6QXAptfYaNzZ6HSUBTgbjWF3FT
         JvbJOcm8h27GQvJIDJ/+Z3c8p7RAJV+2wtWZxR6ASJg0NYMGOuyJVuWHmjHVDRTw/9/v
         RKDVyWwW1CK0AE3WnyPPhrUMfpohzk1pmgImspuc3QeYHcc4DGwmh2RWg4DuJgYPnZXk
         Uc+gmL7ZUz1AspQYy0h0acvbdlUkfDLBg9SrLN9sVl0m+tNnl8MwrLKyUbkT0ljj4Sav
         GVv0j611W+hzU2GHaZlTUZnrAkx4pYHipmuY7Y+TBMT5MZ7aLeOI6p/lxPsAU50R6nwO
         SgLg==
X-Forwarded-Encrypted: i=1; AJvYcCUifEvdOWvrtkFCzUN3XSKPYOlKCDgUzw9Y54/pYPsvAdohilckkKS25i4De7ZJAKIcdoTMkohpNKouv+nB1xATQtpRPje89FIB3alFrn6O
X-Gm-Message-State: AOJu0Yx7ew06UVWKUY4C5hgOBqNodeZEeMWIBbSjlpcExsm69uCJoZFl
	FrC4tYi7jw4+e9uaW6JRNbxeDfI90H0+ArPqJGo0Ez7qdksedzn0TsDR98o+hXA=
X-Google-Smtp-Source: AGHT+IHzUax2ZWhBgUrf+kjl8kX3eFwG3U4ev74//NPfPvOpyLG8kxL1HYpH/nLS8u5KiTb01/SP5A==
X-Received: by 2002:a17:903:48c:b0:1e4:3f8d:12ca with SMTP id jj12-20020a170903048c00b001e43f8d12camr4120344plb.14.1712794116104;
        Wed, 10 Apr 2024 17:08:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:35 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v6 11/24] RISC-V: KVM: No need to update the counter value during reset
Date: Wed, 10 Apr 2024 17:07:39 -0700
Message-Id: <20240411000752.955910-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170837_670966_8BF25CEE 
X-CRM114-Status: GOOD (  13.05  )
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
