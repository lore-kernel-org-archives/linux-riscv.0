Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320E5C04FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhZG+X1m/xT3fV3wxBo/yNrUgHsEMisv0loVYZ8KvQk=; b=wpgS5YEqwG40Sd
	dnTlVNY7dlDD6ryG7W35bpU1e4P0YvclrtEXzhtfcyXF1oEQCAaoomKgLvYHnKuucY/Z/4mUCbLf5
	K6djnTJrrVE2NuoGcMdYfmP2T+sc6o+2N8S5iVCesgddWOG449wWxQxlZCT3Mw+wRfL6SBGKJLgnW
	mQXIzS713yxAOclh6uLNeBTj/qCUN3HTHfWFBBX4n/bZE8u//efxzaOGcfZKtf7MLmgDWcz5PGjrP
	Q5l9jnXcUmgdXyo5mbhdUAwCdWa9TUdD0re2I7OazxP1riaXrqomeeK+s2k7caOj2kNNG0SPN62Dg
	G9dg7Y/EcHb4LPLDorpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnoG-0000000DMv0-3jTN;
	Tue, 16 Apr 2024 18:45:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnn-0000000DMT6-1EPc
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=; b=aQmFawJzFJESD+gDlcXQiVZu7p
	fyyM/LIcS9ELBrmFqENJdGJSNlxjIWIZhrqs+Bdj3OUsLb5JXqWM7GgY1WJLwefAScbNepWcwRwPJ
	0Qf28gAoT6rAYm7gDgrl8xzTsAk1q0hC2ze8Gq8DiFHGQzfQdTyY42ZC0vRzRxrUSM8iPX4rx+pWz
	+xmLFX0CEhQBecdBnu9VvnesqDwdiXsJABnUqhO+oRh4HoSDiMWZ88c9W1Ske2lgVE8GkXHik8Sw7
	gmY/N8Rao0gp2Pz5n49s8tosxm1LvCQLGc5GztMnDmWAugH8dc/11bPs56uAf7LLn9LFdBhoED8xA
	3FeqnOQQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnj-00000001ABD-1h02
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:06 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2a7e19c43faso1867057a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293097; x=1713897897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=VPgx2xkI+Jwt2NXSNCPjKKY64L+9E0/u/MkpYbfxBVPTIVufI4vG8YoCnlYU/A4Myl
         i6FfvMMeuPV1w02azWtsSRDEWfM3YjjD37e06FEoeVmI/pHdpYpFhyCDYLbi38cnWwA6
         3xAl3S6gjV23SXl+UeWd3YtBpIdnfmNGUEgyaeo9VIDlvHhWe8ZRqTWQ11dpQ08aybeR
         5Aj8IN6Hv7JEpz3uNeoI+snMGUn6kNePQq1G2qeHe/UsYc8sJyitN1H4P+tG5osUySh4
         jhVbpcMpnB6CtU6vTPhTR2QV/DLbF3GxffofEwi/74hcMYBiflKKZisrIjFL6UacXDTy
         IYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293097; x=1713897897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=CP+Lu6h70k2c45v0IuTaJZTbyYt13nY/Xqal3WkvUPJEKzb/kdDr6qEIHrHNNzPF/7
         8kjdp5PCoYPS50GXxdjybSxfQnKO+MIXcuYx5eacUjSn07K3Zewhsy6fdhwBNfUMsBXT
         1AhTpzGYCxVlFPjRC/6vD+ToXSS7F92feDxO3RNGX5qHXRgbfJZrJoivFix5I96H2i+A
         BQEQ6uzV4tQLOXK4gCvLzdNOD6JucuGkyAI+7ReyT3upKK3wVqQ7/hx32gQOAZY5q6a+
         PBMIP01mOIiiTPHmRqtz/QIK9uZaBCE9BNQfIkS2s2U54VbfGjmffNOtT4VfsZrpw2xN
         EUWg==
X-Forwarded-Encrypted: i=1; AJvYcCXIWNKQxbjebOYtPCG96pADIf4MHwIpRoe8/AFDwbNPA6h/elTlJSeFBi+efD37puOLc5qCaqa9JqSx9kt0dLXIDEpoJrt6AHmjhFBGMZf0
X-Gm-Message-State: AOJu0YwQ/DKNmlwOiN3xKR4csDu3FyoEdl2ddYOTSuv/BrrrtJqrSH6k
	SP6/YAJkQt6ppS4blqBydOx2msZSByoOHMz6Dhgzkt2TvFUdUMz3iFQr+/XIoFk=
X-Google-Smtp-Source: AGHT+IFO7WHFR9Rl28v65gUEiDT2PQZV3q/4Cya2K/e1Lz1G/MiHbevY0IrWH/uczf0ujzNAu6TxBA==
X-Received: by 2002:a17:90a:130c:b0:2a6:f414:4e0b with SMTP id h12-20020a17090a130c00b002a6f4144e0bmr9113440pja.41.1713293097058;
        Tue, 16 Apr 2024 11:44:57 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:56 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
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
Subject: [PATCH v7 11/24] RISC-V: KVM: No need to update the counter value during reset
Date: Tue, 16 Apr 2024 11:44:08 -0700
Message-Id: <20240416184421.3693802-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194503_482832_6B827134 
X-CRM114-Status: GOOD (  11.16  )
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
