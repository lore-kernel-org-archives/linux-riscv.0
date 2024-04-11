Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3EDCD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ou23w5RsjeaxVV4slIqanHDeezLW2bEVNRxwMTAZQuE=; b=DqySWwIqdAUpwV
	fO9Vrr3yDZM5SeX4hPKyk/4iGrBRYLfFYCQVO8SRMzWRgUp5DN28HM6NPSH5clRq90NOGNLH4pxTN
	5wae91zecwjCWzjx++c8qnm8gyt42AR2SpVS7xmi8ixPW6Cw6lGb0KEeZKmzFCISVbD+98HanIq0H
	Q99p9WbpmHxJv08l2txRtyACQm5GLqu/UAACZvJIDV3cZ5LBmOGqPEO34UDettBfWL+7bdbka9YvJ
	1IpuXI6AdFAKmmpEgM8j42wnSRsEPHnb5Vt9Fl7vJnHy4H7qyBU8c/uo6GwbKMNFswgd1yHeRPGPx
	RyFwwsa9pUWLyFhf8uag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui1x-00000009bwH-3pMp;
	Thu, 11 Apr 2024 00:11:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui01-00000009aDQ-1gEl
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Apr 2024 00:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CkMvEzo278xPIa/MSXztYs2ivQ6wYMeKBg/aNDTTbzU=; b=bdBjN6H1NtNx51QfrrIfgrKa9R
	+vlGMNIY8NgQnMxitveSA4NiHB7s7/wloZfMOPwy2dFKiv+YTZmVbUCJIa0QgufNc71ATKfCXgkdU
	H+Ww7Se+j9nV8Ga9OrrLdM/mv0mQb1B/M01R3N97F/wwNZgF4rfYj39tck5ne5RHYce/Pm3k6aTyS
	Xj+Wt/iueZ9n8SL27bfknOx33+D9xhc+43fVxFmW70P/Mf0DZVEUrnYZftPR+cZJPp/jqVMEc/dSZ
	yrJeHj0L+g5k+mJXoTxz4nLDsXgUbFud5tJNXZXUzwwBDMKMMzuF3KAxnKg+FqxCJydIaYggfUCEW
	YqskC4hw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzZ-00000008JjW-2hHQ
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e2c725e234so2636255ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794103; x=1713398903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkMvEzo278xPIa/MSXztYs2ivQ6wYMeKBg/aNDTTbzU=;
        b=U3/LKXOiT8poMhyOwc0LYrrFcjqHulZAa+rhomj4GxkifJubK+sGON4ChznJ0FO9pm
         BQYR6rYKF/xIyBfdThtIwIyKPLlKjx5PxU+IL6NwfypMxdbu9TbnVikkHMOV8saUs/FG
         621i5hC+OOjTVQe6GQaB/ng3Ghol/MeJZKZ0RHG2pSx0vNEPDHLBW/hzj9BSBeUDXzBE
         BzkkN8kfncigshDZJ6BlKg8em2sdIiWMiIHpg+sAX95q1wzE70kC0A/2g6pWfxBTTnEP
         MCgAey/490ndt2IlrKdyDv0a+MpdOmxb/3lLx6+Nmx6sNzCKu+qJkG2XWV/nRXgmOLpW
         cuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794103; x=1713398903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkMvEzo278xPIa/MSXztYs2ivQ6wYMeKBg/aNDTTbzU=;
        b=L285qww1y5k3BUg6zbqdFLLSCgO5FxZePGn1SJEzk8J3tdI9jLmXz573XZL+e90DQm
         vZWp+v1P6EbJRzr1d3r7NWpV385EdoB+eHh2WtZ4RhNprNGawnTNybrYQnNqfElxKJ1N
         JiK3OgsfHqlDgxYh+jSyQTaM0EYS4Tq/RaOnXjs80VGbEE5F7DCJFlVAfhEHmd5/UWoN
         /TcE7JDE2HKHBW2QqN3xEGBzwIQc3B2iZ+Qm8IlgCavJaAQ9dUi7+CheHeOdtvS1q8s3
         /PSOvDV8Me4hBLdC2isXcPjcGNs+N8VWpEuxCtAUPfFJF4QKoue0eQwKzDOOU7jictFS
         PWOg==
X-Forwarded-Encrypted: i=1; AJvYcCUhImR4iuS+plcF2w3Cz/21qk75wh5X/q6ztcx+o8KJ83MO2SX0lxjavJcs78IusDmvBUloqg7GQXxTYjWkyHwM1JvoI7It68Gzimy9bmbt
X-Gm-Message-State: AOJu0Ywxg1KNHpe9soKjxTOxh9I2SHHszvPqvFteahMQqI44LPGWYbS4
	C0uK+4JUvK2r0JyteTvZNX2BWAUNAay5Qb//g8FGF0oRrXbFXF+Q/hcRzVTu2Zk=
X-Google-Smtp-Source: AGHT+IGgRaxQYW8bBoO59l6g97lF6DWJlZ8qPVf66iIYAUNC2ixkF2eOsdNbKg8PB+Igg7J274SeEA==
X-Received: by 2002:a17:902:ec8b:b0:1e2:bdef:3971 with SMTP id x11-20020a170902ec8b00b001e2bdef3971mr1459480plg.16.1712794103281;
        Wed, 10 Apr 2024 17:08:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v6 06/24] RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic name
Date: Wed, 10 Apr 2024 17:07:34 -0700
Message-Id: <20240411000752.955910-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_010844_199932_010E9570 
X-CRM114-Status: GOOD (  15.13  )
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
