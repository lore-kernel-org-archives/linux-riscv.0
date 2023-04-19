Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F065BC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 22:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTzfFdfFo8jW2vBQtPkitP4lPIvk0zR40JmFZNauHjg=; b=haQ2NGiMmGV/Ex
	HGCoUyLam9GFO15sU6LCK1+offxOdtUKhJOGVoJPVphlcVXqOSFH/dYfF73kznLPUHhOOo3T9eYpQ
	9VKSMO85tg5kGdLL3ivBUuQoHzGvw5UO4nSkxTPzQ9RhAgnb+ESJeb+c+FxWpVShyC37IkF1oxXmJ
	8o1BYX8SnDoAOFPNls5H2Z0ywJRLFJEWpeobekt3LzuUqcy+5Nu09A8CBjLTs9VExVkho8p9tA3mn
	LZfNhxh/94KfZttr/2G3oMuRJPNESH0XCMlGrF0sxc4xPk0alMHnTFuiJSdPO3V313Vh1xjeyX+1D
	zcajn7isCVW8CFiPyu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQu-006Wy0-12;
	Wed, 19 Apr 2023 22:37:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGQl-006WXV-0C
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 22:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UvoLTFH11lm+jG4OLKr6/L5S3PiYUonU+A7E1tEIRKo=; b=YKQMBzDjUjPkbmaaLbtU3qwKtK
	760MjI8RqrBi0zzXnUVYBpG9OxyhB4aDBygqnXQQL1VZZmRc44Bbmd7iw7baSnwh/QXE/aqr2BQjw
	hOLCgtpY7loyP9T4ZibSo+KLRClersGrZ7JZ8h6c0xCrN5/MmE+h91L5e1KZicuBq/+OiO1dVHHaH
	JjIWdlSiHmXGmeDmjYrJMYSSVur5zl0STImcWgcaUokcTHAJRmgBk+ASkHaqGCYVgc7b40hiRfFij
	zg2rE2umctxip3uHvLuiOaIRtPQWQIVecq3oWjbhZw1uNfa2+MGTTQ92/bEk8Cb6X7TT8B92FYeIR
	vGujcUQw==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ppG7n-00DeBE-9N
	for linux-riscv@lists.infradead.org; Wed, 19 Apr 2023 22:18:09 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso346415b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942680; x=1684534680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvoLTFH11lm+jG4OLKr6/L5S3PiYUonU+A7E1tEIRKo=;
        b=N4XtdIUPBSqsJPJi86uCyaF35SsvQqKIOljuRP/nM3GeL5PnC+sHwcgW+t5y7DrxbF
         5TpNpwBssHKlVMD0+rR0V581oyy3Tas3sY/32xO2PA8Waej/gLWBYShGPmuxBhpf6re5
         DdBOslqLXNOPSWtzW2KMHDPcIh6b83lTPIBfFraWIh9OIpnFYzRRhBid7+FKOFDAgg76
         TSEZFYh5jipl2xgrex0+4e/qWmzQSgGTsJyLQHLHYVjRsdnpfnSpQ74r0gthMKcWw1bC
         bNIhm8IsywbFNoO4sfJHPMRDxwvnuXKEz2kBcBAbp8YppTYmN0JgS+/GNdHTRqrvAGAB
         SHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942680; x=1684534680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvoLTFH11lm+jG4OLKr6/L5S3PiYUonU+A7E1tEIRKo=;
        b=UZ2fGudJGf4pLKEANlZkUQwZ/fX91fswACQuAAXByFQcoJFM2GnMPeJa/96VVt/Ufa
         zpgjRZ+JAXm+4mhwj7BrV5pC4yuiLEi5RvA9O0t6WpdbOPA03WfkcSU1wVd4kbQ+ZTTw
         hBUu59b77SBDUhcer/EyJyUsq0NhzLBgswJBTcmZJrnV1w5jJ6oc2zmAc9gVa28ncxkA
         Pxlx5GCFzZGkOrO6yrLy/tdbreoL5R0b/Lkemji5YkDGo3bq87IYpmjhCQ+c+RL2N+2A
         gHktahAt3DyQZqXDWs+PuSPUmlVEECrbL/wJIzxxiFivWWL/ujRyDLd1fPm4hqGDAFm0
         xXSg==
X-Gm-Message-State: AAQBX9dHh1B4TOHSme9qKr/QnIwMGBCj4u4QWt/tqNYb89RXCX7rywNE
	FwvJtPAabm7xFhBsrsA2bLZc/Q==
X-Google-Smtp-Source: AKy350Z88ZumXUVLTXNRcg1zbdln/2qU8CAI5Xlijd5PgR7U+e9fUdXEuzGKHFP/DBsSEjOZB75l1A==
X-Received: by 2002:a17:903:2287:b0:1a9:2951:7753 with SMTP id b7-20020a170903228700b001a929517753mr1272548plh.45.1681942680495;
        Wed, 19 Apr 2023 15:18:00 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:00 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 14/48] RISC-V: KVM: Skip dirty logging updates for TVM
Date: Wed, 19 Apr 2023 15:16:42 -0700
Message-Id: <20230419221716.3603068-15-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231803_393718_AFC99B50 
X-CRM114-Status: GOOD (  11.19  )
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

The CoVE doesn't support dirty logging for TVMs yet.
Skip for now.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/mmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 9693897..1d5e4ed 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -457,6 +457,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
+	/* We don't support dirty logging for CoVE guests yet */
+	if (is_cove_vm(kvm))
+		return;
 	/*
 	 * At this point memslot has been committed and there is an
 	 * allocated dirty_bitmap[], dirty pages will be tracked while
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
