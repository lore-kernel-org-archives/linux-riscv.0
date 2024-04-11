Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E71BCD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez7ZsXCF9Jy3BLG7l0IBs+C7+ZGaSp6GyRn17aWB2cs=; b=v06pZmenH1+2jM
	y6gEeIXOSmIfgWSFqS08WPpdaBD55uasluBjYmY7iRKfc90iZ856CiI6EiPgSBzCXloezrL/ZovHL
	0veqH7J1KgCXTa/bUZqTwePf91WLs3cad1SrMSqRlzJIj+MkEloVB7EiRL+DcfW5c7RCJ3PJELpeS
	42DKe+vE8/9tb7FLAksSf5VQSS+7M2cw0quGKzbLPU0uU2ZwsZNit1n7juxgaGMK1v+B7lZpB1LGB
	xS4YRQfp0+LURJfPor+WalfgcILDrkOqE3bfVexr676Yo9KwobLFAXg/YbrITUCKFlxLzScRcX6RS
	nJ4U0v40iV2X+ME2RSXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui1c-00000009bda-0T4V;
	Thu, 11 Apr 2024 00:10:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0A-00000009aOM-3B1Y
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Apr 2024 00:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=; b=VkPxS45ZWOZ5WzeRnW55HEeKwd
	UsknxkO6ADeLHz40XsL+AoCPiqbDDIlT2oyqb9fSR6lSegeUQkyBtO6bsBlasx7XrnN3KfONPqzv5
	rGyuFOPClN8t9lHUhXfPil60YbKjERrtTFzslPiTCE/xEuaC/yT+jTMfnQp7aSzqzywsIWbgKPvrT
	w9v0e+WoT20AY6IDCIBQ18Ywv5zWbHdcq+zQl7HWIHIr4bLGYStoHQIr7r8wZ7TXn8zR7jCgg9HS/
	xCU7qsR2l/5k+6XjoFvHlKfzDdvox2J6tPuK5Y73XhXUx4QPRp4Ocl3SuvoKDiNiTwiGTJ1etbOgy
	qtIMx+mg==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui00-00000008Jo7-0MpT
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:13 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5dbcfa0eb5dso5381117a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794114; x=1713398914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=;
        b=RQBByj0zMry6Z3+v9nIYIbZtqBratxtdLZYbuK0kW1dV2LKgDWDUTnnXk7qN0+7UHs
         jCilIIIU/Nfek3XpEFjGhBPVrLqLEavlswfbi2f0EsyUJVSxmBfxWpVDvATZB+XzsH6J
         26l3UIPnheU3yrsiorb37alZW/BM9ksHfcUyuUGY4w/7WrlpmNS32hD8qEkFixdPcLTG
         sCrWj94MDc8TD3Jw2BSuYZScw7jivYWJdjta1b3lHtsAS22h5ZajG+a9IWLWw/vLWoBK
         pOyceoDtH2kQlaWA7e6JywCLi4gjtzPulraCtU4Be1naGGXAtTGmzHBPFVN8S13ajwWc
         aaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794114; x=1713398914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3Hu7DESDZEmcgrq2jc0sr2sorL47aa7h3H8SzaxXXM=;
        b=xCwAlongjhtFu7V8YqiL2D7x9TI86XPfR4qDB+FvIvwbgwGBwxeVkbIA0t+WttLPIb
         jtDDXvAsnO9sGoCDNENNMzF2QoKmbxwCzYLJzRa+Wqjx+hCaF7mn38yOyDvI7p5MMYsE
         9i1nPPDVQuu85EUxKaLr3Ky+tDarinaFyvwKrwWbaVC6V9WJ3/jYb+9uQBR17cxNVDb6
         ugMz/+P6fl2Wsm+nBj3gzp4A0aTZ9whI4okVcqhp5mcfGezLcEzItp16IRFt4DneTAI+
         32YdPyHIZZQYOzuG+JR7sjqr+h1DbGprPEEQmdo/KIDEpCQ+IyN3QMz2KYZROW7V4IfJ
         kPow==
X-Forwarded-Encrypted: i=1; AJvYcCUyoBmoAem/aGYO5HiHwIMxunjx2gmuMKbgM/6YL+LOeMvTlMeHltaN8U+OyBbv9yCYSH+12bb61v+bt8c79jdn9g1l50n1hWrBuR6F+ZbS
X-Gm-Message-State: AOJu0Yy2oNrkhjxfUuIUZ+duyaQ0ZI0vCRBCGXo6U+5gK+YXCHII6mWn
	9P18unScAym0/QsAXKJPqsn3MdJ8gRBOILR9Mj4s8IOj7REugkSoHFuxKY//xZE=
X-Google-Smtp-Source: AGHT+IGlZjUnG/cOH6oxCvOCuQrtoKifdSzPlvvNyoKqm+NzGiaKMBomwqkIVAChpjCW/s39Q+Uflg==
X-Received: by 2002:a17:902:8490:b0:1e0:119e:f935 with SMTP id c16-20020a170902849000b001e0119ef935mr3564608plo.15.1712794114043;
        Wed, 10 Apr 2024 17:08:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:33 -0700 (PDT)
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
Subject: [PATCH v6 10/24] RISC-V: KVM: Fix the initial sample period value
Date: Wed, 10 Apr 2024 17:07:38 -0700
Message-Id: <20240411000752.955910-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_010906_583305_BBEA518E 
X-CRM114-Status: GOOD (  11.40  )
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
