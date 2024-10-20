Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB324D3C92F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vO8fR09j0CuiMv4k7pwt5kTpEEiw59yrvV4kvLVRvu8=; b=OFgLu+/QV7vky4
	ojlzgwX3vVbc04ul2CqWa5j6Yt6kC5QcbaiI3cF5pwtSFmV0hlldI+bvZ7gmwEG/ugKr0eAi3PoYj
	+nundXYncQ5QdJAYd1/O86M64YUHCTq/WnXrJCm0zExltqCE/iFHlNAiDDLLcJd6Hp3YIQ3HvmtLB
	1i4mLfEWjRDkqjyqLJYduA0PPR/wgV2mLFm9L7iSeyBqQlPOyRtrNmTR6tm4nMs/XH1EEQbwvhfGk
	EBE9OAXKULj4+YjaGnCZJtzDuY+b4lKLDClMvAZKliI0vLuIcIwBPHBwmYbqNUoxXeIavA4GDxBTX
	MvQaIqytITuZBfsfIXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu3-00000005Mfo-0lhB;
	Sun, 20 Oct 2024 19:47:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2btz-00000005MdZ-0rPV
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:47:48 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e56750bb0dso1461824a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453666; x=1730058466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8r3hycJZuUwFSSkivtdNHwET+4m1ywMgYdIz6RDPHA=;
        b=VTwRYq9PRVso7ljAzCugZQW7+xNSketJlhfuStMasiBetAgaN313NmO/xPnq/WocuC
         neg83caK3JRKFhS9WJv6ydBilqukJiiqsQm1BOfygAtVFKsCJz99vInJB8vh0GzBqpKq
         QueNUsKr30aw9Fokjano4mZiOFduWvZnUZAjU5Y8Dc3jBme2f6tx61aADXM8qNHlhrZi
         htlHoT/CR6IA/gvswpjzM8YnYDLYoss0e2JkrBLqlgJNCyj0bzezwzGCm8HOYjlZWnjy
         R3NJP3kt/KZ01jJPthB3YU62zTHVupRdsyAsEw2W+LrJfQXMzbp85ykYYTJOL2A4ODdB
         XTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453666; x=1730058466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8r3hycJZuUwFSSkivtdNHwET+4m1ywMgYdIz6RDPHA=;
        b=JloS63BUXEMJnXh8G+T70wdh/ncMtKkMeLdKyNSbaKIshXXHs/3BBbvcgYy+9U5cvI
         YOuQtBN1wkLCbNBe1H5HB+5QLyksUNoGdfdpEQSgB+Ot0hHDo5deA0rtevxCmzm27YDn
         79YxuU03moWB49DUbpZffqPZZqngKfkeR1QLna75g6wtq/XBfpvYiloq3KWD2bq43V0A
         GI61b6TBWIpHvkhFJ3/kTrG1YaxMG+Bn0KMz+rAtZF+EcTOgY4eSIm0I6tm+uMNgwANY
         TcUAT5X6G1QanR+3jcJxKz+/9FHFR0Ln+IXyJ2Ek56R9EViSAvcImsGakJx7AB3Q/nSN
         38+A==
X-Forwarded-Encrypted: i=1; AJvYcCXrkAvDBMx+EihtHZuHJ0IJJOTqXkrWlvqHDsuhbQ3bYcnf/2VcqrSMferQvMNuNchDI3C+CM2+1g9aNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzppJ1EMWt62CmbhUhfT+95G8GLjU1AM4gOf3Be4YWDrkp2aI1v
	QTh0V/PzExZbkGixwStC6OtwEo7q05185fbg4kIUwSPj+ZuYkf5gMguxkCNzNAS6BrMca0XLJvE
	mwCqa4w==
X-Google-Smtp-Source: AGHT+IFyn/+eyWYLXWNY3Vno/OCeNQB3Y8TPoxaOdFGwMyaqKIUSGpcQDYXeZGWcpxBme0KP3op6hw==
X-Received: by 2002:a17:90a:b781:b0:2e2:f044:caaa with SMTP id 98e67ed59e1d1-2e5619f8409mr10947652a91.37.1729453666060;
        Sun, 20 Oct 2024 12:47:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 01/13] RISC-V: KVM: Order the object files alphabetically
Date: Mon, 21 Oct 2024 01:17:22 +0530
Message-ID: <20241020194734.58686-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124747_445184_7E983198 
X-CRM114-Status: UNSURE (   7.67  )
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

Order the object files alphabetically in the Makefile so that
it is very predictable inserting new object files in the future.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/Makefile | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c2cacfbc06a0..c1eac0d093de 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -9,27 +9,29 @@ include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
 
+# Ordered alphabetically
+kvm-y += aia.o
+kvm-y += aia_aplic.o
+kvm-y += aia_device.o
+kvm-y += aia_imsic.o
 kvm-y += main.o
-kvm-y += vm.o
-kvm-y += vmid.o
-kvm-y += tlb.o
 kvm-y += mmu.o
+kvm-y += tlb.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
-kvm-y += vcpu_vector.o
 kvm-y += vcpu_insn.o
 kvm-y += vcpu_onereg.o
-kvm-y += vcpu_switch.o
+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
 kvm-y += vcpu_sbi.o
-kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
 kvm-y += vcpu_sbi_base.o
-kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
+kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o
+kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_sta.o
+kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
+kvm-y += vcpu_switch.o
 kvm-y += vcpu_timer.o
-kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
-kvm-y += aia.o
-kvm-y += aia_device.o
-kvm-y += aia_aplic.o
-kvm-y += aia_imsic.o
+kvm-y += vcpu_vector.o
+kvm-y += vm.o
+kvm-y += vmid.o
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
