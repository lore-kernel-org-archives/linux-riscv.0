Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA09C05023
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2D/bSvid8IT98bpjOGTitctul7aCZSyW4vLqfPAuQA=; b=3oBMs1ji9de0Vy
	rBSQ4m7j5ep3IU7A96ef4R/iE/mrZNGIh0lULZ+ScGWTuAiXEf/buX2Rs3xp7na7IXNEqOy4iuiDB
	4pvgJuL/fBrviFih2iVzVzGkevm+llx8bFkWo9VljLM7y5Yv7ik3lrY/x8lP2By8BIcAwWyxGxmWv
	LLuo88p7IvjTm34Yu5FNvrbWDconPTXhJvk0DqyZdoYZ+sBUKWlo7+Umr+y/gs7D7xs861WlMHCGg
	P6RPswpZfv4YEE8kWp0W8OhirE53zGS8uylg7pGFR6MUFruEEbk7CwJRTBisAHwYJ++XB9KpA+Zzz
	bpjo/VlMzfd8u9ZAG9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwokg-0000000Dafv-2OSU;
	Tue, 16 Apr 2024 19:45:58 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnX-0000000DMH4-3n2e
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:44:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2a559928f46so2781698a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293091; x=1713897891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rU9bTQzimBlb4bBeVGV64JD8vBjMh3ZSXWmumJprSMc=;
        b=w834VAd4Aiyxikx3rPLwiwZeB8xN4YqsbiMo8q65rZpATigNYGaR4oCF1rsKygcxCm
         KcA3kG6m5FUt0ema4+qt0pwY9guRtoyWm5DApmUaOQjDxzw7ITfJnPG9/1jka32QO5et
         tm3KgNayMALBUWLuLtNOV02+rRLiFK91l5uZL9RlTX1RRx8d0mGhoa/xQHS4eDxGzl6h
         /ciCtn6xXfuUXB5O4NYj3aEu2Gvr7H+dYhSCYXZt2sZUuDHQeUQ3TSkQo6RkzWVXBmu4
         8f6EYfGrIxme9wxQ5gVkxIvxmQeK4ZnCfRjmdK4iErBrs4fzgHHCrqMLFUaG2hYkEyT2
         GyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293091; x=1713897891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rU9bTQzimBlb4bBeVGV64JD8vBjMh3ZSXWmumJprSMc=;
        b=B1zEqn9Ks9pvIbd+FNdDYNI/BXwZ60So8RQmytGKkNwPUPgXQhAvImF7We2bzKDbjQ
         rLki2CXJ8B0JTJBZ/dXn0roAVIdgE/SPm5kZytzs0relUy/iEzaUG353BP602dkRhzLR
         F7NDEQiUe5d1gEWzH8/uMtK3Z2gSGcQXIEZh8aP5VSUz+gA6MGzymdnMveILC/54oQdD
         OJ6y7OYpIo9pnLfGOfTsexsOYrqvU86Zyt3ATTMb34+rcxpwmb+3eGxUmeAuPe8QjnFq
         Ga8mJrN37F/MtMjykbat++2NWGau723dOBDOdq3epOjxgeGmKikrn32GwHcvf2gSnSGB
         CzDA==
X-Forwarded-Encrypted: i=1; AJvYcCV082MYVXOK5UPQ9J4BWk93o2UG3cQzRmyyeVwxlhysOdPMdRrOQOOci5lmjUFIxg/hYm97QRKZYvIHF11d/UqcG2zdvDG6cbjPXyQjo88j
X-Gm-Message-State: AOJu0YxVtMYWicKp7zWMOuNHS6ZqA0bPbAtxH9AFY2VFRJNf5G4zWWNF
	196MUSWTbyAocFc0zr4eSNhsnmNvRlP8IbamEYvD010I+tnG4ILncxxWz1l33w4=
X-Google-Smtp-Source: AGHT+IFO7gBokex9KDHR7FMDDghsIz2thvCcgFt0g1hVdtn3kLkpEMXY9Ea3s80HyJZdLNzoP7x/LQ==
X-Received: by 2002:a17:90b:46c8:b0:2a2:50ef:ece2 with SMTP id jx8-20020a17090b46c800b002a250efece2mr12099952pjb.17.1713293091321;
        Tue, 16 Apr 2024 11:44:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:50 -0700 (PDT)
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
Subject: [PATCH v7 07/24] RISC-V: Use the minor version mask while computing sbi version
Date: Tue, 16 Apr 2024 11:44:04 -0700
Message-Id: <20240416184421.3693802-8-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_114452_139553_0C8F96A9 
X-CRM114-Status: GOOD (  12.92  )
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

As per the SBI specification, minor version is encoded in the
lower 24 bits only. Make sure that the SBI version is computed
with the appropriate mask.

Currently, there is no minor version in use. Thus, it doesn't
change anything functionality but it is good to be compliant with
the specification.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index f31650b10899..112a0a0d9f46 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -367,8 +367,8 @@ static inline unsigned long sbi_minor_version(void)
 static inline unsigned long sbi_mk_version(unsigned long major,
 					    unsigned long minor)
 {
-	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) <<
-		SBI_SPEC_VERSION_MAJOR_SHIFT) | minor;
+	return ((major & SBI_SPEC_VERSION_MAJOR_MASK) << SBI_SPEC_VERSION_MAJOR_SHIFT)
+		| (minor & SBI_SPEC_VERSION_MINOR_MASK);
 }
 
 int sbi_err_map_linux_errno(int err);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
