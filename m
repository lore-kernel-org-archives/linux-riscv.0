Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A30CA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0qjBlYcaBrfH4z74wefi9u2RZVKtW5kE5UUgPQs7ew=; b=PY4u5gTAz2mGxK
	5sE49s3Vm3a8a3MXmVL+BLrrr4VP85z6Vkn22PPaXpjN92LiBvfAvetMsQTSr75qE2p0HM1wJ1B+t
	1tX5qH1jkdD/Zm2sTAP4yylq752YuYAMJown5N7P9EEdkxJs2ScddfaJFDTc7BctzTAuH/111QnbM
	9fs1pxB1RnM45xDvFc9NYjnW/FwFm+ofpPfFV5IoKEAcUTX6YP7ezNUc2AuJbK8vmsny0mXTxGqQH
	4+EEpoPcs02UrnCTyC3C5LlXRmFMduM4dgitL7hyPNsUTaKCh2sPo5YZbpGHZ5SfaCp7HilnPhwK2
	i4POgiEw0g+PgmLkvj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHA-000000007xi-3ikP;
	Thu, 14 Aug 2025 16:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaJJ-0000000HY5z-0aql
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Aug 2025 15:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Bm60/2Cr4w6uAzbvsdcbKrh6VNvMu+/Ils5A4Kn+0Hk=; b=IfE9G8WDo/rjgAydtYCjuY0qRG
	EmmnCo1x1DUwKoiF3RDMjvDAAaSfy7Rt2NkGsQ/THaHgmdboiRCWLs2VtU4utFLILyeastOtQ2VCo
	wZle8B9wAsrFxDysCY0L4nRjygvwJkH0CU/CnVLKZBWeQMZRcbDF8vBL1mHDfQ/scdpeh7KFxQwS4
	4N8bQ/UXcRy8DMrgLVlD1TaaxizmqwVMIqNEK/yvp1jrVvMUIsByYno7oDNW2Jwa3s6PBxmC8NX09
	i/RXDMLpA221+TSytnMA1kRBHB/cHPI8gu46iDzdcsZEzbSeuCQR/fBBDXBC1fO0gnbMHECBJZAmO
	YTn5lSQg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaJE-0000000GTBm-0u0L
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 15:56:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-244581c3b43so9805505ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 08:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755186966; x=1755791766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm60/2Cr4w6uAzbvsdcbKrh6VNvMu+/Ils5A4Kn+0Hk=;
        b=LVDQh3PH2Jj0fmQEzGFFbGADrHwPWcEsjJjbIIP8hO5dX4cVvBYSW6mlipcPgUXsG/
         SrdyUIqkl8XQMUkCfS0IjP6QFsxQBUJoRKcObY9j6cwBthhzIK95nm8DgYrhdZ9swliH
         oCOuDkNJZOKZWG5j6NYyOeTBFO4vQbSKVjC5SdvlPwE5rsvwBdM4xmul+WVXgW0pAKrP
         /heed9Hsxsfr8dvBwJLu+ep8l2XhUavHDeftpB0ASJtm82Rcqz4KDE2l0FeznesKU/OW
         1QhWSmoHWuZSeJgyp9N9dVUBPtiBG0JBBIatBipIpYWNtfNPbvmyshXSnwJhQN0g0tsh
         y/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755186966; x=1755791766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bm60/2Cr4w6uAzbvsdcbKrh6VNvMu+/Ils5A4Kn+0Hk=;
        b=p9hBxjp2PHxcMxlHJ+qL7g+3LrusAgtHIBttrMmqT5ihY5AZo2poA6jdhLdwAkvmHW
         abJUmaCPYT2tZHmzUxIvNryGz3ZtqmYzmoAgr7mupyAHoALGmNJKVmlGDz8Oc7fo/lNL
         sVuAykyFIhRqucQ4xt3OE5SxxUaSz4szGWGJRlsx3DrCVqOu+nefyDNSrJce4tN9m5ux
         fHa02pLJlXR82rJU2896QNeTAi841srOXX/QRn41CATOpknTVl60pBLzIih/3vU/LJDu
         YsDDdB2jwgJZNzTAZFpgFrFEXd1Df+pP7xWcpWP+u/AUkUJZa7p9A7Hpo3I4kDHySCo4
         ffYA==
X-Forwarded-Encrypted: i=1; AJvYcCW09wbI10/X01bQ8/XEEgJsdfSeICsVVx0lU0Q+qXWfVu3P1W3PpwF1re6Kj58iiBOJ11Pc7LUIbkiUJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVaswmB5pXgsPFLCavZKrPrdRRMFb8/IWyB7hH5z7l+PM+MA8z
	X7J4ZUiad4JH2MOA1p/FfASwUsPIgn/JqgdDRnaY5S6XRgbw1PixEQ9qkQ0lgiwB/lc=
X-Gm-Gg: ASbGncsYTJHF8vcStKCqi7fj+JTPw0PgMld5j8CQoIHwg3WQjtRh1fjWeQYNtc+V2jm
	NKTrUO17Gm/VQIOzPbPGSUzlno1ocHgPk+a3uqNikD6duELMGVX79WYJ3rNQLbOclGXvTcx/3EJ
	OCtPzAKOdehlOBYg+i2R6xHPKW+J87EqtPRZ9+P+nmdxe7VWXPZIV4yNgEzLBnpqpd72PcpXOUM
	8FH+pLliFsg9eP1pvw8MyvVgPelYJzhcJHtHOWfnTYIoLU8kLEYByOMhUZfKersY0HbDqNHvlnF
	kX9c0iOg8DHRs43vl78JyUi+0rvslqi9A0ZFY2hnhXNa+QAjKQF3GyMGOO4K2QuSs3+2u2e49rU
	XQrgfnOBNjXaJrAV0L3yZFd9y2FewGhEYhaLL6uf1JkPToViYLgTVhi0F9AZjOA==
X-Google-Smtp-Source: AGHT+IFZMx0P1JKNMfotkf1h9uD05/LbUJ3nHS+qqEqkenBGx5Rm/Php8OZMQlv5/iu6GkzqmdURRg==
X-Received: by 2002:a17:902:cccb:b0:23f:f065:f2be with SMTP id d9443c01a7336-244586a0e5bmr50715635ad.26.1755186965537;
        Thu, 14 Aug 2025 08:56:05 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3233108e1d9sm2225500a91.29.2025.08.14.08.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 08:56:05 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/6] RISC-V: KVM: Set initial value of hedeleg in kvm_arch_vcpu_create()
Date: Thu, 14 Aug 2025 21:25:43 +0530
Message-ID: <20250814155548.457172-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814155548.457172-1-apatel@ventanamicro.com>
References: <20250814155548.457172-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_165608_391757_07855CA6 
X-CRM114-Status: UNSURE (   9.54  )
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

The hedeleg may be updated by ONE_REG interface before the VCPU
is run at least once hence set the initial value of hedeleg in
kvm_arch_vcpu_create() instead of kvm_riscv_vcpu_setup_config().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e56403f9..86025f68c374 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -133,6 +133,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
+
+	vcpu->arch.cfg.hedeleg = KVM_HEDELEG_DEFAULT;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
 	bitmap_zero(vcpu->arch.isa, RISCV_ISA_EXT_MAX);
 
@@ -570,7 +572,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
 	}
 
-	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
