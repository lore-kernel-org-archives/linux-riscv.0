Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB943C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ou23w5RsjeaxVV4slIqanHDeezLW2bEVNRxwMTAZQuE=; b=FbP8/UewXwIiFe
	1tDMUjrXFhLz5QJkt/dfHJjIdEixQ2pZqREqDpEZAZHHcEZUulGhttPWsEumYOryLEax3sRKRjBLQ
	7KlBt9p0PCrRM9i/mF2ApqDG88c5+TijYMClOpgBSJjXGmkNLqNybcd6iCIEVs5qbYjA8cL0xKsbW
	Ucy5D/UuTdXxNBphf737cohZ4hIPl0gOzfVkhQK8NHzIhZZJXkDNoQZXbCafcvOgNlkrfJnFB53I7
	9OZ0WleSkU57BV2MwG7VP0BoVL9fjZ7OIhkMlT8bclNjSvhIJEo8AIO/rtwLJDa85aVoWVf6+lE5H
	FDidAB4Si0mXp6Fahbdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxy-00000007J4g-1Hdr;
	Fri, 19 Apr 2024 23:48:26 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxZ-00000007Ibh-49c4
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e3ca546d40so22550785ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570475; x=1714175275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkMvEzo278xPIa/MSXztYs2ivQ6wYMeKBg/aNDTTbzU=;
        b=m8f5TY+XR3zv0OluoMEd2RC3qu1j7cKGGKAw3iVoWuTRCWJhZtByiyNapU3VhXbf+j
         ub003fuBEOLQGbtj8nmPhJ/NEEMaIl8jwhEfDP/nizFChfRLBRkptBOQdNwDLsO9/8TJ
         PJB1n1revEC8pHr9wKUr2ZGcg0dIbXZd4QYU0LZwtuPtmONdXxZneN1dKP3b04G/gmdL
         XdgfX2QaOpdm53dR5GKDfBZz2fA9xtnU9KT4QDDVmwvQck/5cfB+oPNM3Z6g8vJ7Rigp
         YUVnQKihOEKMeLg5Zkbg2ys80FOHfXvTgTywcA7WqudAyw8yGNu445dcz5Bmx3V1Scnl
         vk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570475; x=1714175275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkMvEzo278xPIa/MSXztYs2ivQ6wYMeKBg/aNDTTbzU=;
        b=cCG9heKqfpq583erbv+0ki9/jSeyPJDUnvdozCGfd0fZmDArwY67WWRbSWmCSbNvl5
         kHui4RmW5ilGR2aPgKMVm9WDIAK9iCrA+kSgVjhpo19r8NrJpTjkal1+7t5OaQIUr8dN
         WEz2gcsGLJnwQrxrdXojrTICwZ4S7GVzG4KW9hyOMH9K54WcMCjJmWcGDFyLW3TGlaVV
         nCnS40T80v0jhJ8/TTRULw6zFZkVWxXcQZhtdWOwr4J/NjEicpNkTYVslq1sPkB2T3Gw
         sRbEJwjxbXVZH+3pCkgFETKtTGIe/9YJ8p/DcVQtTzuugMHUM4bpmPArVdnoyQ2Mz7sR
         SHXg==
X-Forwarded-Encrypted: i=1; AJvYcCVLQnL+TWfJafsNYjEJPhrGhl7uLVyIZnH5hnPTf7zqjyI2iZLYTVWraShIwBtMFK0aeGYtJMCB+uSC8z6n6nID4slcfYPVb4e6av5MMr1d
X-Gm-Message-State: AOJu0YxjU565/ZhqTW+pElTgPWIPmgPuQG4DOgIU1K1tva3v65WKGnpk
	i9F3jEUI3FlhPnCAiHf3VdzWZjOtbS0Givdk09lV+5VJ0WYnuWp1uR4FmfOyvLw=
X-Google-Smtp-Source: AGHT+IGEcLDoOHIz9L/25Y8tUwRQ1QjkAgk02ekGmfUqzvYD+khJ3Bpko7abF51ab2s/Z4NznTgSOQ==
X-Received: by 2002:a17:903:4294:b0:1e6:1a9b:6d24 with SMTP id ju20-20020a170903429400b001e61a9b6d24mr3578224plb.30.1713570475638;
        Fri, 19 Apr 2024 16:47:55 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:47:55 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v8 06/24] RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic name
Date: Sat, 20 Apr 2024 08:17:22 -0700
Message-Id: <20240420151741.962500-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164802_165296_46560236 
X-CRM114-Status: GOOD (  14.95  )
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
