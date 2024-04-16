Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12E1C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ou23w5RsjeaxVV4slIqanHDeezLW2bEVNRxwMTAZQuE=; b=DwEA5KE2KEhdKN
	PxLBtkteY3H9uxIJUKzyj+PZWlkWU5nHDTWlvx97uaZKDhQVBFQ5APiipnVrao9xCe3hufao2o4T1
	mKIgGJ2K2BlS+TJBrQa3cYY7h3uiFPXnaYBvdXgEzXWSzdw5CaU9+5N9BtrEZjsSrQtT5j7xE6jcn
	2sMbSMPxxLOxtNazht7cfYBja6MD4qZRyRMnWXHtc5Jmk7tj/NmTnArAJhpfHAUj/GIDws2ecmD/I
	GxCvVX+7vc7hEUR+L1jDjWMQjTHQW/h1ntBY4givwLfcoTpcUGQRtgZsmCwCu+IeoZeQz+WCU/Exm
	HGzp517ossscUgaEjwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwokg-0000000Dafs-19Zk;
	Tue, 16 Apr 2024 19:45:58 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnX-0000000DMGI-0HdQ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:44:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6effe9c852eso2001953b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293090; x=1713897890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkMvEzo278xPIa/MSXztYs2ivQ6wYMeKBg/aNDTTbzU=;
        b=m8YzTdMpq/NNQK6YkX6kM32dQ5kRhjUYreTHO7HdrO7mqr0Wqf2K3JDlBTYMF7EuLg
         RF9DLbtdfsr/K7lnEzboYICAv3IyN87NP94glwoi/oT5u0CGzZafLvAnELxGJSCtbN9d
         N4GrBZnubVnNtWn9msrx/H3DH0fOH72yXCCIyEp0UfZ3SopApBDuIFMtjbRlZR5KmE7Z
         kncbLgLikiMptyWlLheErESf+SLHcqGaQKqsQ6yxzDuPHx6Nl0k76y8yqUtmTk7e6Lrw
         YlHzBeFo5fkd27Wxw4le54PKqyce/SBRAw/sx2QZNSkR2rPMr3iafs9RHRBz3Pb7wZbj
         82pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293090; x=1713897890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkMvEzo278xPIa/MSXztYs2ivQ6wYMeKBg/aNDTTbzU=;
        b=uLDIDo8mhj+vI40sBPoJ6OTnjyEEaVNjA3X/E9jlFXOTLO0MRbjJoZjVGNsTI0fDzW
         VQqiMiHiFaavNiD/2Voj6+ebJMmemdxUBBH2w50GbnkmE3UAPtAXyH5rg5s/hxWTvgQp
         CXT1lVyKUke59RfZxzOvxTis7GjyB7op15fCOYD81yI6BEV3V2pyBvmE/Bi0Ao9WxRIj
         uOT8/fdkk/C0TnFseNT+yhgIvxyEAWy4Zv4ws6BOxlpsZAQiMBpFdK438vHOKXh6m2yz
         etSeLQDBKC4eeCSvE3K6WcXKN//4OsPk9hxd33qQFF4evIwRSNTXKkWKvAfiXNhZr98p
         5ncg==
X-Forwarded-Encrypted: i=1; AJvYcCV+q9QG0lkbOhuolfhI0DTdWkpOS3CN4GLu1wOU7tvE+wf/P6GXVjkArHJMd8zmhWS7FZI3/BkvodESENuLe7ib9T/FGnlvymmUi5/Dzjhf
X-Gm-Message-State: AOJu0Ywy58JeYEUp5xzmGUt9/xSUvnC4vCyQQNqAURBmcUIPq6qs1lGr
	cdPk5DToRsgpvK0brHi0iMiccGn916CsFZk24UF+e5K2w9L1rQ9F4+ELHHmvytA=
X-Google-Smtp-Source: AGHT+IGM/xMcNq2URIBfBDJhi/NG6PhYcgLXKc1qFGAS/Qi1GtucOy269101P8ESZBPlkDMSrXALyQ==
X-Received: by 2002:a05:6a20:6e22:b0:1a3:3c5f:2ebd with SMTP id go34-20020a056a206e2200b001a33c5f2ebdmr10182304pzb.59.1713293089911;
        Tue, 16 Apr 2024 11:44:49 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:49 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v7 06/24] RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic name
Date: Tue, 16 Apr 2024 11:44:03 -0700
Message-Id: <20240416184421.3693802-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114451_151488_DD9E779B 
X-CRM114-Status: GOOD (  15.05  )
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

SBI_STA_SHMEM_DISABLE is a macro to invoke disable shared memory
commands. As this can be invoked from other SBI extension context
as well, rename it to more generic name as SBI_SHMEM_DISABLE.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h  | 2 +-
 arch/riscv/kernel/paravirt.c  | 6 +++---
 arch/riscv/kvm/vcpu_sbi_sta.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 9aada4b9f7b5..f31650b10899 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -277,7 +277,7 @@ struct sbi_sta_struct {
 	u8 pad[47];
 } __packed;
 
-#define SBI_STA_SHMEM_DISABLE		-1
+#define SBI_SHMEM_DISABLE		-1
 
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 0d6225fd3194..fa6b0339a65d 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -62,7 +62,7 @@ static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
 	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
 			lo, hi, flags, 0, 0, 0);
 	if (ret.error) {
-		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
+		if (lo == SBI_SHMEM_DISABLE && hi == SBI_SHMEM_DISABLE)
 			pr_warn("Failed to disable steal-time shmem");
 		else
 			pr_warn("Failed to set steal-time shmem");
@@ -84,8 +84,8 @@ static int pv_time_cpu_online(unsigned int cpu)
 
 static int pv_time_cpu_down_prepare(unsigned int cpu)
 {
-	return sbi_sta_steal_time_set_shmem(SBI_STA_SHMEM_DISABLE,
-					    SBI_STA_SHMEM_DISABLE, 0);
+	return sbi_sta_steal_time_set_shmem(SBI_SHMEM_DISABLE,
+					    SBI_SHMEM_DISABLE, 0);
 }
 
 static u64 pv_time_steal_clock(int cpu)
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index d8cf9ca28c61..5f35427114c1 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -93,8 +93,8 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 	if (flags != 0)
 		return SBI_ERR_INVALID_PARAM;
 
-	if (shmem_phys_lo == SBI_STA_SHMEM_DISABLE &&
-	    shmem_phys_hi == SBI_STA_SHMEM_DISABLE) {
+	if (shmem_phys_lo == SBI_SHMEM_DISABLE &&
+	    shmem_phys_hi == SBI_SHMEM_DISABLE) {
 		vcpu->arch.sta.shmem = INVALID_GPA;
 		return 0;
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
