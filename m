Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFCCC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SdWyvlOSSpgxyfqeX/Y2Lq4MgyIXzfUah396sxpdoY=; b=hPco4THSYebha1
	zsbdLjqRMQKW+ZZbEqbyTC1koGG6bBODJ2MvE+MgZPWByHHLtHq0JhjL/8PveFYTRKH2DddfthDYg
	bwgJ4iFYL4cPAmradivCyXprI+8dE/HQowzAgS/dAqAq3GXM+8e5hFxbGZnGIKASMcUKrckZsafdi
	Q9P7DGB8i9/Baycr3DiIMcO/hZ3HPh761x4Ykf8NzmwzTMViEC/1fgZf7FM01kKjh/Dl5Nuu1bDXb
	1h4TegM4FTwEXg8iEnwaY5WCC6d+obJPtd+Um77u5G59R7BeMw8h5U/IbXIY1NEYM97PfAXctudk7
	grPwtBrjix7lIXzKfNJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmW-002j1H-13; Mon, 28 Nov 2022 16:14:56 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmP-002ivJ-3O
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:14:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 4so10647132pli.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G5jJwuL5a/PRNCMiCmBEuKFRdtzizPv7c8U41zNCGg=;
        b=lrhiGfsIfOZZ6ZSUfqLx0rHc7pIdz7RcfT9qTrum1U7zEbSdCBeuIAffCX9Zp8ALzF
         QijgFUXavVRujVGmYAnKR1lA7+nl0rsXn93dezLwx1IfkYQzPwSBifIe80oHP5YPSNfc
         knJREFODU6y9oD6lGpxSJe1Z11OJ6f2uhBT+lDLN5hl+0oVV4AfxOOWa3kwft1/6s6lx
         aTDoavz9I3OMPVZ9lBIUtc5Ojne1pFtIbwfL9S3hme8LFnTWMBEPkv0ZxJO9IERhQXKD
         LrpdyEUC76y9Wc7Qr2xmmRCricyYcugnKM711T3L0zNHCOD60LH6Nf7/CUcYy2YCLjPs
         1heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7G5jJwuL5a/PRNCMiCmBEuKFRdtzizPv7c8U41zNCGg=;
        b=Vkp9ko5wCg8o8T+ZqnFEFQN4jmCFEH4Jcdn502OLkMiqrMhPZudg9eVQsOJWha/Bxa
         8tFu2rekm9OB/RlDsjusNrx0es25SE5F+1ml+PpIxlYZaRev58iiZxeYMWDrcYtPGy7I
         jYtheLfPcZEBVcvcQgn78kIXcp8ctPkno3ZfQ44adBhzq463XneWunP1J56Zquzu5j7M
         F1EBQYuk3rlx5pNncIdkfuPIBMCxVRE4u+PUATuCtqeEuul2vXDSpBc+fU3QO5/4QnL2
         4mfFwEXsE56P/d7WHZstdwTDkZkKECySPnY9LD0P889tNkVFRQ46nSzlAv6IzPlO5Lw3
         3Exg==
X-Gm-Message-State: ANoB5pn+y+CYHGlrEPncbBHN3CxQeGjcqmJ+Q1B3YtiNB1cg8XmTbjYQ
	ZiI4cAWO6DLFXeGqEQQ5tDp4aA==
X-Google-Smtp-Source: AA0mqf4SMYv7flwkn7gbi28fGz5UIiTwFY/3HWCe4s9O1TbUPNOiBEY7kreAHjSDAfxZZdMvCv4byA==
X-Received: by 2002:a17:902:9307:b0:189:9284:2140 with SMTP id bc7-20020a170902930700b0018992842140mr2574760plb.111.1669652087098;
        Mon, 28 Nov 2022 08:14:47 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:14:46 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/9] RISC-V: KVM: Remove redundant includes of asm/csr.h
Date: Mon, 28 Nov 2022 21:44:18 +0530
Message-Id: <20221128161424.608889-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081449_163249_54FF7660 
X-CRM114-Status: UNSURE (   7.59  )
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

We should include asm/csr.h only where required so let us remove
redundant includes of this header.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 -
 arch/riscv/kvm/vcpu_sbi_base.c    | 1 -
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 1 -
 arch/riscv/kvm/vcpu_sbi_replace.c | 1 -
 arch/riscv/kvm/vcpu_sbi_v01.c     | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index dbbf43d52623..6502f9099965 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -13,7 +13,6 @@
 #include <linux/kvm.h>
 #include <linux/kvm_types.h>
 #include <linux/spinlock.h>
-#include <asm/csr.h>
 #include <asm/hwcap.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 22b9126e2872..0c806f61c629 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -10,7 +10,6 @@
 #include <linux/err.h>
 #include <linux/kvm_host.h>
 #include <linux/version.h>
-#include <asm/csr.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
 
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 239dec0a628a..2e915cafd551 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -9,7 +9,6 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
 
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 4c034d8a606a..03a0198389f0 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -9,7 +9,6 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 8a91a14e7139..489f225ee66d 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -9,7 +9,6 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
-#include <asm/csr.h>
 #include <asm/sbi.h>
 #include <asm/kvm_vcpu_timer.h>
 #include <asm/kvm_vcpu_sbi.h>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
