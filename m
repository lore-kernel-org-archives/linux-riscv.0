Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C01C07C79
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhZG+X1m/xT3fV3wxBo/yNrUgHsEMisv0loVYZ8KvQk=; b=MqeB5BkQG7BMdq
	2VSHctsVRpHlU3IiUFhnwCIV/CD2va1fWGoJkcK75IdwuuI7pOaJrG/aqteDSyepKo0z22ldXpkk9
	HYJn4VVbbu0g9C2f4aXe0V5TdKYlZQC4k8ad0ZXfhHrDw5jTrUcdVK2kdp1gABag+6Ulwoz7FgCuu
	3UB3+TALbPeelu+BjVa8Iv2YbRR+cWv2KVCXCpkOzuK0+DLZti3qoZMLP05LIaz9z8KfJmYnzP32Q
	GzN1y3YzWZ5cGITkWUGJwV8KxIgYaQrkTAJcFSRZ97aHsVnwRei4xtlK1m2sIVsd91ju5HTKaNhpr
	khXpamRWcOfB+GN0rFhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxyN-00000007JPA-1MHS;
	Fri, 19 Apr 2024 23:48:51 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxg-00000007IlD-1gQF
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:12 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so18678485ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570485; x=1714175285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=LsQxTWozYOSvxTuQMKnu5EgdRtjj/Fv0C2BhPyrrBiScxYmNvg6IN3evU4AmqIhXYS
         OJD9D+RiRFIRj9Z5ZtACrjfJMTDZsZkfoHEuuOBmSXBK1fgQXN9T96+xcay1zF6ZQtr+
         O03RJHV1cabSYLnmw1RtmoDl0Zt+LraQfwT8DQJ3WOqk+4486B9nXxrnV3wBIpemF50D
         k2RxN31ZffQ2DcDaKYbrW7dFaExk3TX2So8rHNmh5O/0sGTX16O5PbCQHNbnmV9o/RfV
         dTmsw9qG8iLR9+QbUVJ6maGZ2OYtcnMXN63ualazujvGkFfgWXSunBL7s9J4KRYWKtCL
         6g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570485; x=1714175285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLadZMY/1E+aj61iqE390ie32fUnJXqsMN5cFXtebck=;
        b=ZB/5L9AIO5GeLwTBY39xcq5h8B6LCvl3VFwzGuiVXsxNuiPW467puVwR1t/tNHFdWL
         1ivmrW7tdSZg4uTsAd5T7e5vA08WiuKIdY6GhXui3siyBCGwYRfhE62thZsqPtBezbTE
         eRu3ICmjprtEwW9pe3BbANtG6d7cA1pVr2S/D22JlPR7I+vqjwmxj9nUJT5qoJaaMJBY
         +aHvWElAla68owzB6pqLSXV5qk3pbYB8lb1d/hBWu5vaosYwHOLcdTx8Cns1xkBnUXXs
         MhcYeTpIIVLJrXjnNEaELC973TepSXostvgqZRafzyMPW6PMIWqCZfjXLWrqiljV4tsr
         6H0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9YpEfds62Dnc4qkuAQBDmFLgbH2UK53frBfUHMn0h3mOgJ3U9XoO5vFlTvzvK2L5eKfleKhNICjknvl77xUgIuH2bl5JpNvfNXh+8JwXi
X-Gm-Message-State: AOJu0YwemxC9mGDNpvJVgl8gg5YeRCgAciz9b+lxlMBfkSmkg1EG0NGy
	CclMdd+ClcfhMD0DSyPl+WuoA4gopyhNOeDJEwPcHWBzBGnU3nHkXsHH78vdS34=
X-Google-Smtp-Source: AGHT+IEvBph6MwRCbI7XrCelJMnCCSQbSD7j1tJCROcKUOJKQW1V7Ng3imAkSqKF24OFdFi/RyQiKw==
X-Received: by 2002:a17:902:f544:b0:1e3:f622:f21a with SMTP id h4-20020a170902f54400b001e3f622f21amr10308080plf.24.1713570484830;
        Fri, 19 Apr 2024 16:48:04 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	samuel.holland@sifive.com,
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
Subject: [PATCH v8 11/24] RISC-V: KVM: No need to update the counter value during reset
Date: Sat, 20 Apr 2024 08:17:27 -0700
Message-Id: <20240420151741.962500-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164808_616149_9BB8FDD0 
X-CRM114-Status: GOOD (  12.37  )
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
