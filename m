Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB017C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez7ZsXCF9Jy3BLG7l0IBs+C7+ZGaSp6GyRn17aWB2cs=; b=t3KyG4YgAhlFyY
	8hVlX6cqg4iLcJXnMMehE5hvFm2I/2MOCn7LO2b43wyCJWt5GT0OgGjQpcX/a1j1JL0yhHP0F5oG5
	6Im3j7Ptg8iuUzmsW5xrL+JlGS0xGZGJyVy5y7mOtuj7KJNoe617LVluWHVlwL1bJ2IFnTL3ajPEu
	AG/im2C+QBa0kqS80sZZTI8wQ7Ex3M8uKd33FMDZS0yq1zGIXXF8q8ssljhsVKRhF2EhuhpaxV9uV
	YCQ+KobIRU4mcuuMeK0fn3vZvWN2fQOIL6yXtlFwWskJPAoyw2kotw0sacoKwEp60TbsF6MNCIX4W
	1MakH7VELOCQx9JXaxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxy5-00000007JA5-0bUD;
	Fri, 19 Apr 2024 23:48:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxb-00000007IjW-3HDv
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e40042c13eso21256625ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570483; x=1714175283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=;
        b=GNYWwoa72yAGZAy/nUmru4ZMq9a0VCLldTlag4YjVzuFYHJX5UiySzkHegsnpxIFpy
         MvU9RyOcUAIFWpZ6l1NIglTJT/evG4GOwXnORsx+8hfU4svQoeAxv3sBm8wpiBb9TQS2
         5m0ztgc+LjANHeX6PO81Lpn1c/t9z1UGTwrlfLiAx5ATbTZJLANu5869pvRdX8TQggw1
         WcAsoqr2tcBuxct510GBdajfI+bTgbxYZK2fC+T0kjGZkuRIK6PsCqHR6LTju0jvh6V1
         kdtgbic8BksZiOCsuxbhhNoWDM8JSDCHQWDjgZgrILEsrVqVm+9CdE0qgZ2bFLh7oeA8
         vr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570483; x=1714175283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=;
        b=F1ubt2w2UMMzvrnv+V6MsH9iDY9wfTt7Z/kDlSppDupA/QUb8Zul8xlco4S5GeiqFp
         lInb9SDlTg6lhSqMFSWq0hyOO8vgKoXqLaVjNKpa1vwJ+GxPq5+QDdN4U6YBwGzpV10d
         kveqlebYoXDyHATODuLXWdyDUAFZcvFHzJp50MZemfA/Bqd3l6yZXy2PEl7cu6VXwVbR
         qkkLnj3M2YDOHRbEMQoxqIDiDJ8nIOrFX1zntN+cutMtHTJ3stOULxhcHmdBhfONfwtW
         uXWYgraNN1f+b6CgXf0zc+ujaOam850dRuH3AlNm/L0w1dh3rWIhjDfmeXcxb51+UYki
         W1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXg4h76lnxO8a8r1Bh3R4wwYMZAaPwB0lWumdEdqvYL3hDudmUam3SN/PePCCkpitfCod+qMnTWG/2vE5qqogUUJAqE300Cx451mcrrpV/2
X-Gm-Message-State: AOJu0YwHXFLfRWkPVtg5ZUcCfCfuxe/Ne+4JcSmANC3ZcbgkeoFJTcYu
	0X0pib0PhzS51wCOpYc36OwDyvjFPkXTIJfMKUa7qiMk6HmoKp3WDf7anj5GyzA=
X-Google-Smtp-Source: AGHT+IFuxivVAucFqLYqwANgIIbEmyPV0tNMGWLxqaH8776sBq/Go9KZec7LTwKbbmPafjRvAwUZ5w==
X-Received: by 2002:a17:903:22ca:b0:1e5:2ba9:a667 with SMTP id y10-20020a17090322ca00b001e52ba9a667mr4212130plg.3.1713570483020;
        Fri, 19 Apr 2024 16:48:03 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:02 -0700 (PDT)
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
Subject: [PATCH v8 10/24] RISC-V: KVM: Fix the initial sample period value
Date: Sat, 20 Apr 2024 08:17:26 -0700
Message-Id: <20240420151741.962500-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164804_142997_1102AA01 
X-CRM114-Status: GOOD (  11.35  )
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

The initial sample period value when counter value is not assigned
should be set to maximum value supported by the counter width.
Otherwise, it may result in spurious interrupts.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 86391a5061dd..cee1b9ca4ec4 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -39,7 +39,7 @@ static u64 kvm_pmu_get_sample_period(struct kvm_pmc *pmc)
 	u64 sample_period;
 
 	if (!pmc->counter_val)
-		sample_period = counter_val_mask + 1;
+		sample_period = counter_val_mask;
 	else
 		sample_period = (-pmc->counter_val) & counter_val_mask;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
