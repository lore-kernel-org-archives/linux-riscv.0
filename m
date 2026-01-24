Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA22AD778BF
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jan 2026 02:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=InSd8I1Lc+1C97LUl7SRWD4io4p30WHhidNpRrfQLSk=; b=pc5JapAb+DEOjQ
	ja1E3ZVp0xGeoHcv/n6jF9i2xVZMUyzM8RL/c8cKbSIRGlkRO+MbZein0QffVHi3rAnJd/5nd6Xpo
	D9heOrb+RqQM2At+7dvZ5p6YReJE5Kam1QGOcGYH4i3e2qolMcNtt78T47xQfmbbQJP6wqPqoE3Xb
	Zr79cQIgsgJx7pGVmRXi5JKUpKo8BjpVWdrtq31KBHNmlJ1TTKpboXpsok5cslFL5XpSd/EhT0Kwq
	qFWmm+BkNW3am2JQY56F2ymUgJovVyMVYG6lrd0MGYgGkuxX50zQ+9PSsJaGLD5zbabXyfvWSrMej
	hf6l8HG5tIXPUZetRV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjTGj-00000009n4A-1d0X;
	Sat, 24 Jan 2026 02:20:57 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjTGg-00000009n34-49G7
	for linux-riscv@lists.infradead.org;
	Sat, 24 Jan 2026 02:20:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c634bb5bd8eso536551a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jan 2026 18:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769221254; x=1769826054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8kRNbAvCBcU6i7e683KXYAQzk2DTUU7+Egyrm6jhp8=;
        b=fI5X4YS2IqMvaE3WAcoqJMHNFjj1WCUlHMPENDrgnzoSZFl0CbCYNigvErgYmbs0Fd
         dizcMq438k4A6E/+u7K7GD3OfAzX8gpOmpE8Maxa/f3NOy9iXyf/ekvfVA1y0ECtZBdI
         oJ8ApyPmcn6pwtAAdlf6LbGjo/nRiRYRVAZe+goEJ4IFDXEYyEeQilnJTh+OnisDKY0w
         sHqpre/IMqFx66gOIy1blhSzh92M3/xVYCQ2TiwAgwh5oxg9b7vhASz2YSbPGmo++ELE
         8VgdER7ab+4a1KY7RrsupsJ18tSTq3kZaIvCgYVErNli63lJs9rrZE+QGKUqcKlELzK1
         cNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769221254; x=1769826054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8kRNbAvCBcU6i7e683KXYAQzk2DTUU7+Egyrm6jhp8=;
        b=pFVh+wp3MS0y4zbUynWPAYYzjt5cQypEMySX7ltUKgU88nIbuykBTq1dzgrn6u0Qmb
         ITV1v1Tgm9dc47cmvMpfnTtjueBc5ciptkeD9Ff2jk5/mjkYoxySxUDv8vfUCdRRdLlM
         3U3zcOur+c7/Xz0O+ViG4zapSS+FBbmk4RnD+NWR6ZdeM/2MpLVPyo07l3TwKz7mXWWC
         kb4rRzCfIcsibe9/frk9nsBA65a4I4IBd9S+Qp3isq7EQB2c0uQRkANJ4d/EDRYOlmrL
         TBk/KLeBc6B/7gRSrsVW3Qc555fdpGl2xdL1vdI4jU9mzmTRNKgUzAiS0goz4iXhFzIj
         RLcg==
X-Forwarded-Encrypted: i=1; AJvYcCUa5wmtES4zoO8/ybphbg2acH7UXcuu5NHPNDhuFJZ3F4o2/JiRvKxojtmkmkAqGyVx/v6sXSWqkVb/iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUEC/FQF2SDsHZ4p5EUoJku4D8icHH45a5dDNT3kAVhT1zAPAP
	Ak5jkvVJjVKEOK6CmmRSqUQ1E3C3UkTjwleokWkQOjpFtM2Wz5Ci0Q1T
X-Gm-Gg: AZuq6aLygsD1Og6krh/JMVgEoENdUcz4g+7rwxSsQ6ZnctdYCoB0UuvR/QwMoy74UEK
	0CBwHYW5MPr1Pof0QFuQip/vAvxY2ELyjxhUnnoDe0pBJ7iigzFlrOvLo6/XrN+WRM93zBxy9Nh
	gxCbHTQpB9MX4T0GTInZ6CPzz96M54Cj+4iNa7qzWbqzNNniwkOyeZIpJcUjpIg8LLNdpc0UWsB
	FHedgyqAuSRozik67OOefPSf+ih2lhCjlSDNnnXnJruOTFF/7akNcCxSEK9iNPxHg9GRbbxKfhG
	eKGmsxJHrWO81Kox9AKve6PcUr86ASk7hRYMskORoVrWv+3PEDaJvH2NhmLQWxEQXEi6oIhhuVY
	gK1q8OB7jMgmj6Dq8W4++EprzBahOQWxQnSBif+zF0t446SeLBkWKg0X0DSI1CbtRacNfrq+tVG
	jaHXtOwhnK5mWKEYOUSe7MrwcANeKIQCczpYg9evEb
X-Received: by 2002:a17:903:98d:b0:2a0:d05c:7dde with SMTP id d9443c01a7336-2a7fe73fac6mr41209565ad.44.1769221253788;
        Fri, 23 Jan 2026 18:20:53 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd781sm30926135ad.24.2026.01.23.18.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 18:20:53 -0800 (PST)
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
Subject: [PATCH] RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg
Date: Sat, 24 Jan 2026 02:20:42 +0000
Message-Id: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_182055_028453_EF774EAD 
X-CRM114-Status: GOOD (  16.68  )
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

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
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
