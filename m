Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2302AC282D4
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 22:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKzlnGz0pekpSdoUgM/VIHhviaa+RVREgKW8o0t1mqc=; b=WDFg7stGwSQjOm
	NlAM+EweDxLN3cEnK6H+XD8TW2n/xyNygmu3yLeBY/1obadc1JZ3aDqjB2ZuFle3Exrfyaa+Jf7Yp
	gx1YtTYKc+bcczKNE6EpV4MhEtJQh71WNTh4ounfDdavmwdIlAO7N4UWQ8LKls/94ePLjkiIik9c/
	pD58jRDkzH4yhOmwfBUeryVGURDxLJrLNpgXvDXHl8V1kT1E50z9fexPzSVDtOx6ruDqL9N4u4fKM
	SC2CnopNbXnwu6XARlgylPZz7iucbr5QxOjL1clo2HaqusZwBlVA8i7xlMtVCXCo/oQAqGHjfqmcB
	vjgiBkv8nKCua5e8kzCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEf0-00000002W0o-1LjI;
	Mon, 03 Mar 2025 22:53:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEew-00000002Vwl-3ynB
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 22:53:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2234daaf269so67658385ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 14:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741042394; x=1741647194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5xoxucipI3r87CV5kbgeUb/z0QLUAJbC0b2XlScuLU=;
        b=x4m2p6eWFylsRwtv2AF0PxoKI2IIfPsEW4aOD//bRVPmGpt6Bq5Nxj9ZdgZHS5UW6n
         orCbku9DWOs+qVhGD5viAAIH/6SWIICc+4pZx5882J2+4guj3k2nbnqpOj1wDj9gdVLo
         KYi2PzmSjhDUgTLw0SxBeTnSXIETDfLhdqzliWrquqf7zZwitp+KO4vmESq2OB3v08bb
         lRlG+NTFLL4WArUCYjLh0G3s1r/E3dSBsbW4lHkv3fBQlNEbJ1qU7GDAWBv6gbxvDP9e
         u3xZMiIgXBmZWsgy7p9Jr1ulZpkioB+vxwdGjfDrOduGbouphbwV+T91sjjIcA1pwquJ
         AzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741042394; x=1741647194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5xoxucipI3r87CV5kbgeUb/z0QLUAJbC0b2XlScuLU=;
        b=uHa0SVBt+TL3yzIrvbI3j/3HhFf3w0IlrrlhIKwrQiRA0MKv9XCqMXXd9Tik9zOlsi
         6jRIIsS0i2tLpIDoNzLlMDUPDL93JzLMBp77ZKJ9znKAr/LHKgAI2w34oinHbzWsClq1
         oFOb339w9QMChcYIQyud34q6+4Q6Xt5lGtme9ERVGaQlkE0AuY3kuRmcd/lQOptIdtlM
         Kl+92C1alcLdhfpWM3CNdCRJUIKsGWnesiwnG29uGqTGXmNgjnU5ZDbzC3Z1A9jFUOGx
         cgxZ3+Uthw1UJldnpjF4gqw0d0YEWJDjHV9wRiFmTxkQdJ1930Kt3B4F5m+KAfUeVvr9
         5LcA==
X-Forwarded-Encrypted: i=1; AJvYcCX62BNeS808K0aKv8X5rKMptoFp0Ln5W7PNxuYDNQjiVjnyitRFIOKuT09VnuOphGf2I2el6EClSeK62A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBaR4abqLyWORQjKLKCK31567vKY5wEUNpwiXhrn/bmuhYL96U
	mwrHT4hqh4uL9zWSyEl8z3Zm4Ck0K2mM3/pTrIWg2SY4qagFJg+kWrVVIUUbCJU=
X-Gm-Gg: ASbGnctAEsd/dnxqb4MdEgrrn2+f6rFxPgVWETUfq+W0Hu6ZzJuGnPpgLD9f2PMHbiC
	Xo3PMa6Hu8VXDTija9xnE2sLATK3oQJ08PUUwDZQ6mOOvt4FpeLTpvrKpxQ/XCdkfUlmce0AUNZ
	5OZ3S7pnnbErjrwRDD1J4gROQ29AkhBf5laESDQUBISbzpEk2J/kndMSWW1mIX5paAoT0O/APqF
	16aZk9BL7mCbSHiqt/neMMaPmLrrs3gu1JZf1iK++1Jsr6GGHZzTJcSpdL0D+ppCm4nZdo5DN3/
	crs0Q6yHu2wAZ/SfeC6MWkP6MU3NMm5fWH+rDc0/EgxUaW7aQvfPMTYpdg==
X-Google-Smtp-Source: AGHT+IGy8hMH+W8RZy5SJOGyzi1MeiJvJku2zV+j7M0txVehkixRDHS/MmEvMDbU3gziq5b3wIbZEQ==
X-Received: by 2002:a17:903:230c:b0:21f:78f:c178 with SMTP id d9443c01a7336-22368fa5425mr202955235ad.3.1741042394242;
        Mon, 03 Mar 2025 14:53:14 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb4fsm9440601b3a.129.2025.03.03.14.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 14:53:13 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 03 Mar 2025 14:53:07 -0800
Subject: [PATCH v2 2/4] KVM: riscv: selftests: Do not start the counter in
 the overflow handler
MIME-Version: 1.0
Message-Id: <20250303-kvm_pmu_improve-v2-2-41d177e45929@rivosinc.com>
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_145315_014695_112B7266 
X-CRM114-Status: GOOD (  10.31  )
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
stopped error which is fine as well.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
