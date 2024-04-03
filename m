Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87793C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWnQOdRT3ySCM1eQZFGnxvmDjg8JccnZdtgt+Im9OFg=; b=fD7m0TzqKjjjRR
	A7cjz40DTH31Qpt7FfWr3LSVPOUuwX+WPOcwuUKlPOgkVWde/sS706hooEhNncG04n2cJ4zgcJ4as
	ZZPeJVAY3i2zkkLvcnjhu1XNMkS3Jpuy7gG1bTLKhDhgDQNOO4HFT7/8Px+OnaZyeH81vQk9skhwI
	mTnRaGOrRxjRP5xtTb+OQd6emFez77/+lcImbi+RH3817JYZRCZWZznrjBbIHyqmJE8u17sCIfCxw
	idKoCQWkszK2gn5fTvtYLSVgt970hZHkka6wPGchE9QPeiG0rHbU5rNJCsPuRJORzL2vKelQOaG0r
	7OPwuU5qpxW/kSqqOavQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcz-0000000EitX-10a6;
	Wed, 03 Apr 2024 08:05:49 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcu-0000000EieZ-3bRP
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e0d82d441bso54645185ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131531; x=1712736331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MJsU2/1DVF77yTSQMrmRq+eYVFGn04LSwUVmAHv4W8=;
        b=TIbVwok+meVnUaOnr3UaR9blFEh/RmDidZ3Kq2p5YKyw0R70BI8vCzUKCfwNaGoV/w
         LKpYN8LrvtkQX6q7S91nz7afHfFnrjtuk3p13V+4EKYmNx0E+hK5EJyUGBLCmpPnC4fy
         GCl24h9R4Lm4u+D1Falc3Ss3DrXepftDarg2PdD7Re+W54rks35Ap3Ucljnza5k+Hiu8
         KgoxVjzgGcprvXz+PikVdkE8JnefaMBa/SJ7I+WHwlQLo6zY9hcOMRXr8ieuysc0GQeE
         NxSfgqGc38Y2FTHSf9YML4kKImFL7nV1/ZAVCzpdZugqqARJjFVZQVpFf6qYvbcxkkJm
         iDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131531; x=1712736331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MJsU2/1DVF77yTSQMrmRq+eYVFGn04LSwUVmAHv4W8=;
        b=SOw+1m7KrsTpflNWnKoqQr7AW6A12wS2pYbxXUQo47zgTA6I/ClXFDE+xieci/iLZ4
         PkKnbtJaz+DuZgQKR8tkNgozw2s2qEixEzPFZsuwuXSpCtr7xsrEebJIfWsEbZaZKvUt
         PLXR74rKgPK7pbOYzRIlcnnCoa+OYPvysrLRlb9zva5M6e01XDoF0JDW8gBhcSSJFDrx
         XyyEe/8akrA39D9/GYuCM8BfbLidRhpy9qBvAHriFTOWwJF6eTS4FEv+q+55AznYrdQU
         9dZ5PLorpmymTIu/3dmf0+Tjv4jSy30Fyb50IS19nRJsO0uvqM96Ybpl+56V6ZBYYyVk
         G9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXY6uaHuCEAZYhGDdS6Q/Kvn3sjXTBgBNADD/IMgbDrejHgyFcdElY/h7vrfbo5lWd5rlzUwYh2yOrUD1PhG0FrzdNV5nRoMYGV8YR9E96m
X-Gm-Message-State: AOJu0YyA/KdbNHy5i6CEcIfeE5VLVIiEy3db1Z3wrasW3zkbsFK+Y4Cb
	R8Sl+Vyo2g4jsNQYE+MzAOBMWNOvhz4Qt3qiCt95eWOZmekMc4ASfRn1xKrXmHA=
X-Google-Smtp-Source: AGHT+IE6hcM+iluLyfs2xAMwl4nidxEf2cHLsogRdu+mNxI8DxtzYjnOXL+jL/8fbjTuoDpYxOz/uQ==
X-Received: by 2002:a17:903:244c:b0:1e2:6191:f6ae with SMTP id l12-20020a170903244c00b001e26191f6aemr2389190pls.0.1712131531142;
        Wed, 03 Apr 2024 01:05:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:30 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 09/22] RISC-V: KVM: Rename the SBI_STA_SHMEM_DISABLE to a generic name
Date: Wed,  3 Apr 2024 01:04:38 -0700
Message-Id: <20240403080452.1007601-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010544_915898_50443E2C 
X-CRM114-Status: GOOD (  15.15  )
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
