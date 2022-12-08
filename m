Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FA5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yqaQZ3AQ9q+RfY+ktxeqCzPw6N+4pYKvRU8lSmqp3Zc=; b=iVwWHUR/FycrjOfwezpv+SqYJ7
	jv7tVI4vvgfj82aLLK/bFGBOhFDZ53jVdXCwJqgoNpX7C8PRNIRfmiVB6VTauS1HHwvGyiKy8VaE7
	LetnuLkY3sB/n9USK3VbDgFngAe6nR2QHhqBj+Lfud2g5RqfHCdEo0Em8gov8ZsrUIvKmUVZsQg6n
	gba0PWv2zxnQmqqr8mR82oZj58m9T1kMNO7XLcxDHpCR3lkNeXYBjA7yYEK9dcAwaChv8LDbKlasY
	VnscnUOs0WnWteyLXZ2aQherrPESWqUgbfvFznnMcEPxb5rjfPXEAyZvTTR1hwhfit+574fHYpjbJ
	GL3ahVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3N3F-00AAJy-D9; Thu, 08 Dec 2022 19:59:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mz0-00A7bR-BT
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 19:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IGXwNDL4QYyEmLxSnzAicnadmof6UqucM+DSeXyfLbg=; b=Zf8pRnS3rAfYmp1Ad+xSlQneoD
	20dsMqBggMaw4GWZD/dlSnEQmOTPGHTmS5qd/ZJOtPvsdvg7/XRYcn8a0I52YUySdbX9sH0SdN8mV
	Od/yDJ5tOChxk1DwZyFSf+Chb8qGgjm88umbMBZB7FgGgIYe/MfjMTxv3Ppwl1VHkL5E3Cg4cS/Vy
	zjCGGkPeN7Q/y3OwWo7o8i6smF5ePDg2hPu5HaNKWhyC2WPGXXrSWd+jcrAx6qqwahJidOli13L1q
	mcZFXs9k1uMqamW0idACD0YHiblwxFHpR42jF84N/4SFTx5STYqVYq/lG5gPu5tiXhZjVYg78/zIy
	/Y037UBw==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MkX-007G67-J3
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:40:07 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-3fe3bedbb16so24712437b3.15
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IGXwNDL4QYyEmLxSnzAicnadmof6UqucM+DSeXyfLbg=;
        b=e2wlSIbIUNSSfaa5cE8nlhbofFQRnDINdERr5/zptolHxRg/aPkZUAkV/kMjTwqvnL
         VAny0I7JM9mmYwlM19HgFZ4z/Bt+AByLMvJNwn4T4fl0KwFC3zH/PllsEXxvlbxKUkc0
         NdMHxpCwQrIPT0+bestZB+Anm+CNeXCBzxYs+7pB5OowuPNVic/k7alXblYXNWUiyNRn
         3s7YLdEKTaInLDTRes3bQcWtyjH3N9OVLHAzY6Bg1V5A6pocb3CfBR9ECK9NIDh6py2b
         FQXi6i4x7GPqtsNYbTReUTLXYmSwdtvZ+/Ai3ANOoadydeN1zSK+lfHKCn5oiJ5BQfNn
         SJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGXwNDL4QYyEmLxSnzAicnadmof6UqucM+DSeXyfLbg=;
        b=2NYtQ+FWokT1BCvN1Qeio1m9pja6X3Z8HXfOxjA1DWRrhWhP+wZaTwF3wOvYIQSKW1
         bUNRBrYDx//1RnjzXajKmzuH4KUV1wmohwdnnTxMOsmEm1Vv53y6Deqa9zrARoFufejn
         9YdJYWmR2OGhd4dR1amg0D0qb+/0PecZEGOrI6v+gCJpRUEtLa9quIwH8cE/9yNocODc
         QbyA4NVmuR/eldiAeF0ba6I0Aj5ZtQHJY4GtdZ27+zuf5ZzSqEp+AyJi7YWGfs2zxh1f
         mR4QLTPcWG9VbOUIb82MReGTyyfdbeAMdzjw0qKcVVGrKp0cfzrqyIIn/o2bCfdPhUgB
         9WZQ==
X-Gm-Message-State: ANoB5pnsGxL4+xoc7+nlpCR0BVBtcL3RLe51qX8VWJX7fu0SXPzbKSjn
	VQgZnbBx+XH1acG1Tewb0hLNreH852QG9Q==
X-Google-Smtp-Source: AA0mqf7NcSr4AIKU//qVuXa9coH1f9XMOTx1jz8qMU/k8ctWA7f2fWXafNUay3Wq3KgA3j2vNzHhSJ2naqJ0zg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:6309:0:b0:3b0:773b:2b8f with SMTP id
 x9-20020a816309000000b003b0773b2b8fmr1555613ywb.350.1670528395580; Thu, 08
 Dec 2022 11:39:55 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:49 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-30-dmatlack@google.com>
Subject: [RFC PATCH 29/37] KVM: x86/mmu: Collapse kvm_flush_remote_tlbs_with_{range,address}()
 together
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
X-CRM114-CacheID: sfid-20221208_194005_661303_0C3A04A9 
X-CRM114-Status: GOOD (  10.69  )
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

Collapse kvm_flush_remote_tlbs_with_range() and
kvm_flush_remote_tlbs_with_address() into a single function. This
eliminates some lines of code and a useless NULL check on the range
struct.

Opportunistically switch from ENOTSUPP to EOPNOTSUPP to make checkpatch
happy.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f01ee01f3509..b7bbabac9127 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -244,27 +244,20 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-static void kvm_flush_remote_tlbs_with_range(struct kvm *kvm,
-		struct kvm_tlb_range *range)
-{
-	int ret = -ENOTSUPP;
-
-	if (range && kvm_x86_ops.tlb_remote_flush_with_range)
-		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, range);
-
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
-}
-
 void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
 		u64 start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
+	int ret = -EOPNOTSUPP;
 
 	range.start_gfn = start_gfn;
 	range.pages = pages;
 
-	kvm_flush_remote_tlbs_with_range(kvm, &range);
+	if (kvm_x86_ops.tlb_remote_flush_with_range)
+		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, &range);
+
+	if (ret)
+		kvm_flush_remote_tlbs(kvm);
 }
 
 static void mark_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, u64 gfn,
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
