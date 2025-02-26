Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25271C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rm2Idudu8GzAI9xx3hZ/6wvDWoa24P3TCxwSbBImesw=; b=VcEABi52IN6AfC
	zpXuNtht8cViryRZV/XtNH2NlZnJR8zkNO1Q6GE5GqcTia/0ecHpoG+jWiXkkL6cyG7EUzoa8UJU8
	cxO+ImkTVozy3au0+va60F4laU7HFjFLICdFumsvLxDjOAW8stjubLkDFtFIOnxX13iQI+bVi/naF
	3pXsgrJgmxSSe4ea36szrk/wpOAsu28aGEjME7/wyGv+vKEkT5w7W1p4jFt1RQLdu+q6nDfkgOt4v
	EkQ7XY2r1XH+qSjTeVf3sgAr/q6BcUi+k42WCqa6eiyxJMkYnWO7B0G7/F0/EtYnFKQHRH3AoMH6i
	4RptJxkcgf3M9vX/SlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnO1C-00000005LDv-0INg;
	Wed, 26 Feb 2025 20:28:34 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNxx-00000005KQt-1ZXf
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 20:25:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-221206dbd7eso3170055ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740601512; x=1741206312; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElQVVHGvy1PCJJEf3x7O3Wq4GDtnkpov0IINkskU+dk=;
        b=y1U2GVrloXOUtcxXnO7FFCq/QNm4YpnpFWjEb4jdr8meEyTx1GimBN7icSKKhhSoJb
         oaJvKTGHUisCKL7j76IT7YbPIc9RrY64KFEGCjjGZBtoxw8lW51+rlpriGcFOtl9cqfL
         nZNZc9UYVJwzv0Lwf1LfURRE9dlWMi+WtYuxWjqc5FN2epDK907pTN7U0pkrqUAWYryt
         cx6q0jzTH9Nfb9kHX0BGn8hIr7vzKvYxQ8pROORKVON8yQZ2zrFWp+f3dehRyF4kZGC8
         Y6SoRf71SjF7R8ZCH3hCjXNI5CRCvMf3X17WK0PJPJ7+vAPlmKUv3EGLfswvrgsF1SIw
         n0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740601512; x=1741206312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElQVVHGvy1PCJJEf3x7O3Wq4GDtnkpov0IINkskU+dk=;
        b=LnmiF5FexeshyNn5d6EE6z/gaLSXf0IGVTBk9gpKYi78NJNkru8tSrKDDhRy7ZGDKx
         JBzXqPA4nlNNDPVyFlNRWcSjU5BfIk6yODi/DXxxSmUxQtO85/VkeprU662xx8qt3B99
         ml7wsU10IhQg4PoU2k2ZmLu+x6atKB3Z8FVZkm2aDrf1+bJmKkiCIqpVnxHfMOvGcZfh
         MTF+Nbh8JOjFha2dzOn2LvKMcFgM+98zjE+Sv7NVOYq4LGVr4nqABkDyfBFUP9PH/1/z
         9Nc5LBDJ/DHhFhPqAccR925xJUncwbqCQ5yXqlB2zhp7s3lBQzDPGflngsAkp6zXJgjv
         Z2ww==
X-Forwarded-Encrypted: i=1; AJvYcCV66eEy//pZbyW45tU7Fui+AJF/zljl1BCTzXlDDwuNkA+5jLhO0+g5t8JO4SzBqbyIhBmLjyHsoyzSXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTbch2qNYlZ3N0pHfi3pRR36V93YxgsxhJxCiF0d8gqH14WG+v
	TcPorCEYWt8aF8i1R3gbS++Vsr26olbmyvRaKcZFztP0QZXiA3E0TZvdotW9yoc=
X-Gm-Gg: ASbGncu9IuUFAIVvWmHje6fzh1XqvvuvB2z+FVHPDXuuzGthvgUpa+5sxeKqtCmFwKf
	h3rQE0ZEvkIFUpwNxdo6LgGtUgLvUyODfZv518FYZ38/erAozeHw5jvK42KyqhMzgftlbZMxGTg
	v4fJ0kLXGNNGQkv1G7pt2qvIWRF6ES/wy5a4YIKPEpGjlGvMMUCefmJaEzoDfk7csBCTJ037c8y
	dumKVA0oezFxT96sSkJbk/eaVQuqCilKKHXpGyvNFZXheLo0+2oJAsK0v8kFcrPvnLXuyH2iDBj
	fBH+Db2MEFNR7tGD1iSGXtOc6GerwABn9zBD53c=
X-Google-Smtp-Source: AGHT+IFqbgodjU8bkbuDJlr/kSmLoWQ/SEWprjRdiuzVEUOwMd31NiSuNQgBjPeic2eXnfkR3SMW9w==
X-Received: by 2002:a05:6a00:a1e:b0:732:22e3:7de6 with SMTP id d2e1a72fcca58-7348be4650cmr6595071b3a.17.1740601512524;
        Wed, 26 Feb 2025 12:25:12 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a7f7de2sm4100963b3a.106.2025.02.26.12.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 12:25:12 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 26 Feb 2025 12:25:04 -0800
Subject: [PATCH 2/4] KVM: riscv: selftests: Do not start the counter in the
 overflow handler
MIME-Version: 1.0
Message-Id: <20250226-kvm_pmu_improve-v1-2-74c058c2bf6d@rivosinc.com>
References: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
In-Reply-To: <20250226-kvm_pmu_improve-v1-0-74c058c2bf6d@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_122513_436457_55C051D7 
X-CRM114-Status: GOOD (  10.25  )
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

There is no need to start the counter in the overflow handler as we
intend to trigger precise number of LCOFI interrupts through these
tests. The overflow irq handler has already stopped the counter. As
a result, the stop call from the test function may return already
supported error which is fine as well.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index f45c0ecc902d..284bc80193bd 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -118,8 +118,8 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 
 	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, counter, 1, stop_flags,
 			0, 0, 0);
-	__GUEST_ASSERT(ret.error == 0, "Unable to stop counter %ld error %ld\n",
-			       counter, ret.error);
+	__GUEST_ASSERT(ret.error == 0 || ret.error == SBI_ERR_ALREADY_STOPPED,
+		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
 }
 
 static void guest_illegal_exception_handler(struct ex_regs *regs)
@@ -137,7 +137,6 @@ static void guest_irq_handler(struct ex_regs *regs)
 	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
 	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;
 	unsigned long overflown_mask;
-	unsigned long counter_val = 0;
 
 	/* Validate that we are in the correct irq handler */
 	GUEST_ASSERT_EQ(irq_num, IRQ_PMU_OVF);
@@ -151,10 +150,6 @@ static void guest_irq_handler(struct ex_regs *regs)
 	GUEST_ASSERT(overflown_mask & 0x01);
 
 	WRITE_ONCE(vcpu_shared_irq_count, vcpu_shared_irq_count+1);
-
-	counter_val = READ_ONCE(snapshot_data->ctr_values[0]);
-	/* Now start the counter to mimick the real driver behavior */
-	start_counter(counter_in_use, SBI_PMU_START_FLAG_SET_INIT_VALUE, counter_val);
 }
 
 static unsigned long get_counter_index(unsigned long cbase, unsigned long cmask,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
