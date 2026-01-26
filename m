Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62472C88E42
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 04:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0axOd9ZTLpAAAs20pysEdRUD+iw8grzz9TGzLQIASAI=; b=SN6+MeIEn1DiuN
	Ag4PvP+UivmgucxZ51Aglu49/pvzf4Gxl1tYOeLCVfEXSATvj5JQdfjIk0aOogutKeSb5aiupvTZE
	h9y4+ceienA/cXRQzYdOxeWTcAx4KuAFxyu/2evf9nlHhFW0832k4lSf2Nop2ye4NQ7Q05QUKK07z
	GusTJMhU9enNy4bHIwp2rmB4Xjvp38+3kC6IBS8BVpb7WRNHdNoImxDXL9DOHCojI9K33jpXmC7Ty
	wfG2UZnEETaH9GIkC1JbUArYqUowqukuT+ogjbs4byDdAvxuB0PhpKqUnFn4w6L9MDS1U3sFOZU+O
	9tGU3E8Ywzn+4VYC4t0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE7C-0000000BsgG-3qbs;
	Mon, 26 Jan 2026 04:22:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkE79-0000000Bse8-2fMH
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 04:22:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a7aa9efc55so29657445ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jan 2026 20:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769401331; x=1770006131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXMmWr4x1kiDa10LjI5HvINcv2KnVZhp4gqQTuAdZ/M=;
        b=Tc6yYugo1FPpwlnYHwHj+VS9Y3+7GFcIm5pB9wjUPsAImIheWcBpUcUSYLuwfC3ZMM
         oIUXriEqYFdeBnrhPTDFKhMfUotmUemOHUXk03mlXeoXBe2Yu6c2H0bRzVeBcm61GV8F
         O/5mlEpCWTh2LDwrdx6ga2UV2xOCm5it2eiXE0jDqnKplRVMZojtyefKNLwOfG9ZwRKB
         M1h4/k/ZMWyDuH6GU0hzVHCuI3Dvl3E39s0akekBkUzUvfnGmknyL3cDKNLh/6pzKQHi
         0xOaBpi3D44+t9ZamctXLcQ6+8r3uWx6NUYJFrxdMKtuci97DZj3MPVVFTQOxYUhL3v3
         qgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769401331; x=1770006131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXMmWr4x1kiDa10LjI5HvINcv2KnVZhp4gqQTuAdZ/M=;
        b=A7/VddeIfU4h5wCBzLsMS5V4q5UyPf3gUctivLkQeYxwHfbxycMCULoGQjKh0qscA2
         BMnMjWm++T7vrkslpAmpbJtO+z9NYwILSiof4IMZ6lYkgRC55D7pDhV1wUiQjEAJ9I38
         fwnbJg5rNmcYsz4EJPM9uXY/4g/34GoLqYt1XJ9yT1HlkXC+MY++4TpUeQTgkhWe/TFU
         ab03Y03CjXgBUBaatvZGDuz0YP2gUzS663ejgVOVxZt+QqKF5ZJYNtt+nOVhqPuYtyEU
         BcQEGsu9M3A6g3ELzYZlccZb40q4Rw6qCyGQkYATX8Tc4/LBd2Zv7LzUFmzHiMHV8Xdf
         VKBg==
X-Forwarded-Encrypted: i=1; AJvYcCUD6toMBRWZOJR2z2a5Eciiy3SpuwWRNTjiX169vv/dzadp87jXBTb4HrQD+Z/bpLj1ejt7gEd8/OoxqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHpJl5PGeKKDhIIpSynu1RqkJZjGYwP5FjkdnwPaDrVterCaqA
	uCgckWWAJWH02Qcsk+YY1/vC/VXT2mmTCL/VTA0M370QCJhTB34YzXB1
X-Gm-Gg: AZuq6aKpjjJIN0PNM5mv4x8V2bgL1N03Ky8huCn0d1EqPXsAUGUxHXGt5Z2wtuhVdJU
	DO5XltDBBj3d3EkRYQ7s1cT/fAvPWANCdYz/JrvKp/mGha9nSLSjxiF5LPPputgRFtPFy1JsdYQ
	zw0a7Snbb3ACxgl9YUsoddF+tmxj6qFtLLOIya+QhTG4+nis8KZJO6d/SkUPzPltHeQhGTEx47m
	LAZqQnkE4c1TMLfpy9W4WEyMQ5LThenyTbyfyHUZJLl0g5ImNbzWnJIVHNivDBUZurk29U/6zKo
	ALQI08u8NK1B/zAi78cJZPQJSBd3mZHfR3jrkXA6rmAd61qStVrs/JKrmSg1hNn5s/YmyXNfKkX
	LmgOW0BYyujBvlGJA5UHjajCReLb95wTTSR+JIZ9dr4Z8Tj2jpPLgUdQ7VTheJ1Sh/eT0Usf7+7
	x45T/fVCIsyuGTO5IXgmLzaGOFNxuTWWEYUiJeuO2W
X-Received: by 2002:a17:902:c949:b0:298:616a:ba93 with SMTP id d9443c01a7336-2a84523fa9fmr27665945ad.9.1769401330672;
        Sun, 25 Jan 2026 20:22:10 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd0c9sm78875965ad.95.2026.01.25.20.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 20:22:10 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v2] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg
Date: Mon, 26 Jan 2026 04:22:01 +0000
Message-Id: <20260126042201.2804148-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_202211_680581_1DDEED84 
X-CRM114-Status: GOOD (  17.77  )
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

The RISC-V SBI Steal-Time Accounting (STA) extension requires the shared
memory physical address to be 64-byte aligned, and the shared memory size
to be at least 64 bytes.

KVM exposes the SBI STA shared memory configuration to userspace via
KVM_SET_ONE_REG. However, the current implementation of
kvm_sbi_ext_sta_set_reg() does not validate the alignment of the configured
shared memory address. As a result, userspace can install a misaligned
shared memory address that violates the SBI specification.

Such an invalid configuration may later reach runtime code paths that
assume a valid and properly aligned shared memory region. In particular,
KVM_RUN can trigger the following WARN_ON in
kvm_riscv_vcpu_record_steal_time():

  WARNING: arch/riscv/kvm/vcpu_sbi_sta.c:49 at
  kvm_riscv_vcpu_record_steal_time

WARN_ON paths are not expected to be reachable during normal runtime
execution, and may result in a kernel panic when panic_on_warn is enabled.

Fix this by validating the shared memory alignment at the
KVM_SET_ONE_REG boundary and rejecting misaligned configurations with
-EINVAL. The validation is performed on a temporary computed address and
only committed to vcpu->arch.sta.shmem once it is known to be valid, 
similar to the existing logic in kvm_sbi_sta_steal_time_set_shmem() and
kvm_sbi_ext_sta_handler().

With this change, invalid userspace state is rejected early and cannot
reach runtime code paths that rely on the SBI specification invariants.

A reproducer triggering the WARN_ON and the complete kernel log are
available at: https://github.com/j1akai/temp/tree/main/20260124

Fixes: f61ce890b1f074 ("RISC-V: KVM: Add support for SBI STA registers")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
V1 -> V2: Added Fixes tag.

 arch/riscv/kvm/vcpu_sbi_sta.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index afa0545c3bcfc..7dfe671c42eaa 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -186,23 +186,25 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 		return -EINVAL;
 	value = *(const unsigned long *)reg_val;
 
+	gpa_t new_shmem = vcpu->arch.sta.shmem;
+
 	switch (reg_num) {
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = value;
-			vcpu->arch.sta.shmem |= hi << 32;
+			new_shmem = value;
+			new_shmem |= hi << 32;
 		} else {
-			vcpu->arch.sta.shmem = value;
+			new_shmem = value;
 		}
 		break;
 	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
 		if (IS_ENABLED(CONFIG_32BIT)) {
 			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
 
-			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
-			vcpu->arch.sta.shmem |= lo;
+			new_shmem = ((gpa_t)value << 32);
+			new_shmem |= lo;
 		} else if (value != 0) {
 			return -EINVAL;
 		}
@@ -210,7 +212,10 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
 	default:
 		return -ENOENT;
 	}
+	if (new_shmem && !IS_ALIGNED(new_shmem, 64))
+		return -EINVAL;
 
+	vcpu->arch.sta.shmem = new_shmem;
 	return 0;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
