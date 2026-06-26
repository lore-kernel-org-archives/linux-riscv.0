Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E598ACD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 05:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WkXR+hsF1esje2RzOkkoGO0+SvOqPODGYNPr4d8BteY=; b=Liz2PZ93qaKE4P
	qddSfO418pYUDRUzY4edBFcLyPH29GSZPSq0idwY6jNRb6rZKIGca5jnLZKwOHd8nxsrcf7B0x0md
	JaeiTYbK4t24Jfv51dnG/D7bIdk+yhDmdJg9rb2ecRWBtmsOzYTus0rZUbOlAgigc1ZA5o30xDes4
	b4JzDEn8urwdiJ3wqHif9Lb/VVvcwnvyYayg6ndROBY9sfSIrWGfdxanDOsabnHQATzoGkqobFiVs
	kYKoP3OYgaaYapL0zlbk3S61CYj/05HQc94Tr6U/yHZdskdLt1bvssLuAUqZ2LENTWXeETjcyRi5N
	/6O1lNxqKlPt7mJjkJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczJb-0000000AXA6-1VDN;
	Fri, 26 Jun 2026 05:41:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczJZ-0000000AX9C-0mns
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 05:41:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c74383c93cso6389085ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jun 2026 22:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782452480; x=1783057280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCn8lKg7NgEt+UxeSdKd7uOIi/uWFv3vSqBPrzK4a4k=;
        b=r6/LXVCClKRkqITa0y2Q+PkL24dWset0DN5X3ffdK+Dh4+0ks0onERRdbUHaLJsbu5
         Uc+Fx265P9zYRY+6VMekq9cqG+bYvdlNcwlQmQBFftIEXWKxgOXjb8y8JrZLRNWHx8si
         RlmKCUl5Yky4gfibQovDHZ3StNVbDijvEC3yq/gQ7NlXTsoKEg8V38uz6QsSTiO47Ds2
         iUtX+xTfjZar4jjVXSezSY3HkKLqmdptOKwNuAejyo3h3SlO74WsADBmxdAxxfBg8vOF
         iyKHYzQVJrsIfFTxDiCEKZgkU1z+hzyXyZZ+DiF+GJOhEpAMXDyOYcPAaNLdQdewZz3K
         4k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452480; x=1783057280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCn8lKg7NgEt+UxeSdKd7uOIi/uWFv3vSqBPrzK4a4k=;
        b=kL/nLtuWtpkICg+iA72npVsMb94T6XgiKFXxm65g17hlRk/N7bzQ36EIGo3sFdn9cO
         0dWwWtOew1XNpg3na9HCrHE0M+MItfqBHxuR719vXUltS0KMxrmgp9OJ/l3e+vj7iv3l
         hp82SuZy9lCasIA480/ytV4+nHOP0aBSHE5UEn3QlGh7VHaw0XHPNDGBVFQnbp6MvzoQ
         4t7uEDqz52c3z0IY4WUrnKlgx9AWUQ/XV1tGBWbnSD8do9Nkx7W2rALI4UpGfnFHhQJl
         Pi4wVRHZu9cEcvWPuY9DurWZrAAoTSREixaHi9I5ntzU418FbV9P84qvS1uzHnEhdj1F
         A2AQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPDYUDU8VnuIQ9i2O5cxxRDLsvDU+GehcUwHloVpIMe622oOCF0lUbQEm7PjkNj8geeCCVIH0lthzrLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNKkQKuoGyVCuuMMWj0Ulo/kzuaYDPoOBrKpJ/BwXGj0Z13cDE
	tx5vogT7m/anbB+6zipU8nI0l74+LChETr3HEK42BF44GFiXbnCZjKtr
X-Gm-Gg: AfdE7cktHY5lIsl9ErknxkpNIciS/3qtHdEQqZ00S+9zXg4boELIXZzxjkx3MJKBkM/
	YxY7PmvbRjdkj8SeBCwgwaGTvmFzbR456KNgt5Th52o2b7t0kGcT65H6kQIZhz7MrMr6g3moqNH
	5o/qmL94b4tyYy7obtDZ8lnFa0gpvVTxgJjyrB9mU65puyEUPJrs16EP7iMK0BGU8FQMk882BG4
	QkG7VBV+cA6zxShzRGiS5M1iaXUTKJ7k95sWjyR2IYQO0Z5LYQlWIZes8bspZViaaLBXePofXIk
	gHRCAIZj4ziA53LJ/8J763a9UJ5C1R/s7KFXy6Ay5z1THAScQvvpQILTQxGHkPXDYFfMgzzFOIz
	sWVoAZQmdXGU90rs8PxyPH1KbYDFwhQIoy+ystw84uA3AFtidQUtvnjIfyAwInegFWaF5dXGlMJ
	O4JENhgHChr74zLL3bzpFfi6/QAnVjWovuC35YVL2mY8i7u/fyYy5MpvKTxACyHFg=
X-Received: by 2002:a17:902:f552:b0:2c7:ef3b:e18d with SMTP id d9443c01a7336-2c7fc7366fbmr52715135ad.28.1782452479842;
        Thu, 25 Jun 2026 22:41:19 -0700 (PDT)
Received: from pop-os.. (118-163-201-11.hinet-ip.hinet.net. [118.163.201.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b27f4sm32974865ad.53.2026.06.25.22.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:41:19 -0700 (PDT)
From: Shengwen Cheng <shengwen1997.tw@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Shengwen Cheng <shengwen1997.tw@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: riscv: PMU: Bound counter mask scan to BITS_PER_LONG
Date: Fri, 26 Jun 2026 13:40:51 +0800
Message-ID: <20260626054051.3360865-1-shengwen1997.tw@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_224121_233268_F00C7A7B 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

The PMU SBI handler passes the guest argument registers directly to the
PMU start/stop helpers:

kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2, ...)
kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, ...)

which map to:

unsigned long ctr_base
unsigned long ctr_mask
unsigned long flags

Thus cp->a1 is a single unsigned long ctr_mask, not a bitmap array sized
for RISCV_MAX_COUNTERS.

On RV32, RISCV_MAX_COUNTERS is 64 while BITS_PER_LONG is 32.  Using
for_each_set_bit() with RISCV_MAX_COUNTERS can therefore make
find_next_bit() access bits beyond the storage of ctr_mask on RV32.

Limit the scan to BITS_PER_LONG.  The requested counter range is already
validated by kvm_pmu_validate_counter_mask(), so this preserves RV64
behavior and avoids an out-of-bounds bitmap read on RV32.

Signed-off-by: Shengwen Cheng <shengwen1997.tw@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bb46dcbfb..2025b6649 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -586,7 +586,7 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 	}
 	/* Start the counters that have been configured and requested by the guest */
-	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+	for_each_set_bit(i, &ctr_mask, BITS_PER_LONG) {
 		pmc_index = array_index_nospec(i + ctr_base,
 					       RISCV_KVM_MAX_COUNTERS);
 		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
@@ -658,7 +658,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	}
 
 	/* Stop the counters that have been configured and requested by the guest */
-	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+	for_each_set_bit(i, &ctr_mask, BITS_PER_LONG) {
 		pmc_index = array_index_nospec(i + ctr_base,
 					       RISCV_KVM_MAX_COUNTERS);
 		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
