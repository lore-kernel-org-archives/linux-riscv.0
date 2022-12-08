Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319CBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y5VUWfRSkxiQ/tA7ye1AO6vGGNJMJ7V9zxuN1n3JIVg=; b=F0Q/q7OnCxzdrFFAd/jy6yZ3PD
	FerdCRoJjJcvKLS67ikwR2tXHEgHmJsivfu2l7mR6yzYQ983TGBRL5jQ2aclHf1L0w2n8gHBK3Ep+
	neR+PelCokcW2y1vzZjqTWRa5ukAIrN1iEhzNAxSlS+5XyzhY8Hq0TLQv+rK4VaAXGdwotBJeS53T
	wdtP+1vqO7J1eyur5Xsnm+KsFdYjuuFmSK4euFKB/n4eZkJzjVI7pP/dfOM52xchKGweZ/ks2Y8PZ
	S16LVZ8zb1hZ5TmJpDK2giSIYN7Yruy0dVCIdW3GdRRcB1gZTwJWdo2riT/UiTvHlUt1yD3uSC9HE
	Q7RFzMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MtE-00A3Ci-7E; Thu, 08 Dec 2022 19:49:04 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mqx-00A1PO-KM
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:46:44 +0000
Received: by mail-oi1-x24a.google.com with SMTP id k26-20020a54469a000000b0035ac1417866so1076401oic.18
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zxu59m+BC3IHN6G+DZ7Gfccf72aG4aOXJ0CWcNu+xQ=;
        b=SdJhXds2L90YC8FNHmtWh5Fh9TEgerNWhfkuw8x3d9CBnfm/9eipZjv0gPdpJNH4I0
         S+51SqBNWDjQiWTiQlTyu6PNy4niyZRnQhbIkbzuxQiNibwxH6mkZqPrFqBbyJTrkaSd
         9Mn4ob8QKmJos009LfgYNnOTusdfrKp1xLSuoRmHmtBWBuBrOTTzfiu5JzBu+friunut
         7j3QXKw2PfZd7vhhYsSAGJiGY/32mBAW8UAr3zD1WlpFMVlQcqneZ096cl3TmZsBGjzc
         3x4d21+FAOrJhsugApLkXvPF1NkwgnZMzvQRH+9jPPL4ZLADP+yEglXH2v1r5QVynX/K
         vjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zxu59m+BC3IHN6G+DZ7Gfccf72aG4aOXJ0CWcNu+xQ=;
        b=h4+VrRWEYODmSOgEOFVFBuRdNJMD35CWtCTx3eTvtW1nqzLvmHRkvb91nXQWlH/gGc
         dLuzVLpD9M/0W4eJzBpqzsndcGEUM2Dxrm6i1NnjeWl4Yd0OwWRFbigt36+6fKMNvIfR
         kbB0jwN2OB6yYAFYJMaXOcONtQI28cv4VTe2QNZ7/qgHTajVBthPlvrvOwsMeRoVns8N
         s4qv7wbZKFbWnSHa5pWOG7l+KYWUsyjk3pjS4wr4Df6hR0ZulN8zLtaCSz4FpCk/Et9c
         i1n30XDbLzybZWChBrgNImIP+8QVcMM8MXu76s6qxNpBk7Di+camubQ/WssXOxhJQhDI
         zW8g==
X-Gm-Message-State: ANoB5pkqAofreu8hH36F1JzuRqivYaxiLqRxNL/S89dPKG2mLPig9A/5
	662dRh0O656PAa+5s14eRwLFFbIVzXT1Iw==
X-Google-Smtp-Source: AA0mqf7xeoOaS0AA84SgKnbp6lpiXTBq7xMlUXV6MswQxMERGECN0IbonM/14NtNvPIycx9F8VqJbtOKzbBrCA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:90a:d3d5:b0:218:845f:36a1 with SMTP
 id d21-20020a17090ad3d500b00218845f36a1mr97581242pjw.117.1670528382072; Thu,
 08 Dec 2022 11:39:42 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:41 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-22-dmatlack@google.com>
Subject: [RFC PATCH 21/37] KVM: Introduce CONFIG_HAVE_TDP_MMU
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
X-CRM114-CacheID: sfid-20221208_114643_717492_7C4F2F7E 
X-CRM114-Status: UNSURE (   8.90  )
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

Introduce a new config option to gate support for the common TDP MMU.
This will be used in future commits to avoid compiling the TDP MMU code
and avoid adding fields to common structs (e.g. struct kvm) on
architectures that do not support the TDP MMU yet.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 virt/kvm/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 9fb1ff6f19e5..75d86794d6cf 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -92,3 +92,6 @@ config KVM_XFER_TO_GUEST_WORK
 
 config HAVE_KVM_PM_NOTIFIER
        bool
+
+config HAVE_TDP_MMU
+       bool
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
