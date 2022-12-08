Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC59C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Fb1NA39+o0BOJ6kbxOQYYT81MpqvUoF+2SHQ9dHjOa8=; b=46nc3DAwR8qhlWExl+dVC50KAC
	Qy0a23qwXOO6D2k+HohyzxEhAflG6R9Icc+JaEDA66YbC2zS4rHZwM46rjGf4a0RBJhsdn06rrt5C
	P+H5jsnUPNB1vVKPQ3dAAYsNdHZElyoAfC0/+B8A2xseKGUq1ppIkHX9lc6In92XYIuHL0hsHNINM
	rvKEwkQ42RPLBiAxC+2M2FLiZUevnlneJfSwGtUJMgJc7gNHUxET5oIEY3LMnhVCaLUuUPBZ0uS/2
	PeRT2YS0puG/VdpW8XVYPvHedLp+DPvOdjMwDsDUzfDwtS2GY0Ekzz5cuLhNJCDZCyXgsUhpJzHDt
	GrVW1Iaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mvg-00A4rc-8c; Thu, 08 Dec 2022 19:51:36 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Ms7-00A2SK-SR
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:47:57 +0000
Received: by mail-oi1-x249.google.com with SMTP id bd24-20020a056808221800b0035b94fc144aso1080648oib.5
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LgQMdy+BRV6etzCdcak09K9MMPBRYTlG1+oihaFX4ek=;
        b=HTWjIigcZ7WZjOnOg61QHaCTfbHLyHGvpSvV9l8zZQ5K6Grf0VUcQH9XdDcrgQ0qnO
         1QAcwSASOHpForiZANO2+68V5a8rNealSQ0apW5C0hOTyqLw/F+VPLY3asRhXgPKSuVc
         ATHZcBO/0vYL56E/Ir829fUHKApmsLZ4Axd/FvOUVfKwdR9J0BHthDhp0OlK+DWkEs9G
         8DbJlx/DyawOHuuPdY5BhEZwMd2ETb8lHyA5mmcw6iiBiq+/CMkbN4u0OnU/XPiCWYAg
         4c1jbNQi9nK7+jDlMHAK9qxmS0z+lVbXn90csRVgjpeYpmndVSm5rYF7D0TXl9GZ2RVc
         4lEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgQMdy+BRV6etzCdcak09K9MMPBRYTlG1+oihaFX4ek=;
        b=a2kU6kHXbm1N0u8Y98p731r30qFq7qUDhAY0VTI1+G2zssXT1VNuTI2NK/8p+d/68x
         HmZU2h3xXBgBwxjXeDnCfBTob9eTRqWnjtXza8GRDQPiT9SWEQpNE8ya1sDEZucYtmBs
         iPNuqkopVBtKPa9o0S6gttjtDwQ6OA9WHvVBE68jRWPCR6NJZepP3ADtwAowYq9mcKrb
         pIAYUqROeU3FyrYH0X6n5ob5NzlVUFfese259PR40vnHAObsuDQA7chvw6JiT/fZegLk
         N62qHZceeU0TM2bH2AcCd5hi/VKZ9za3WnXm6MwqBKPsXbDAxUNd1jtZvo+tyjv8i0Au
         ylUg==
X-Gm-Message-State: ANoB5pnQdXqoLLug6ML17O3AjSrJGhUyqGvdZ8CcKDSOog09OWHvR44S
	YeIJrjRhjJ+29JWVeaIewcx6jUiisE98tA==
X-Google-Smtp-Source: AA0mqf6s5jpCYuu3sADTa5hiPGsaDUIFXQc5seS/2ekXFn3zxyf2G6r6oJqYRkkShhh/Mij7t3AhSFvHIH2QTg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:11d6:b0:219:ce92:17a1 with SMTP
 id gv22-20020a17090b11d600b00219ce9217a1mr20111973pjb.235.1670528383766; Thu,
 08 Dec 2022 11:39:43 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:42 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-23-dmatlack@google.com>
Subject: [RFC PATCH 22/37] KVM: x86: Select HAVE_TDP_MMU if X86_64
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_114755_948035_EE0D9C37 
X-CRM114-Status: UNSURE (   8.47  )
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

In preparation for moving the TDP MMU implementation into virt/kvm/
guarded behind HAVE_TDP_MMU, ensure that HAVE_TDP_MMU is selected in
X86_64 builds that enable KVM. This matches the existing behavior of the
TDP MMU in x86.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index fbeaa9ddef59..849185d5020d 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -49,6 +49,7 @@ config KVM
 	select SRCU
 	select INTERVAL_TREE
 	select HAVE_KVM_PM_NOTIFIER if PM
+	select HAVE_TDP_MMU if X86_64
 	help
 	  Support hosting fully virtualized guest machines using hardware
 	  virtualization extensions.  You will need a fairly recent
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
