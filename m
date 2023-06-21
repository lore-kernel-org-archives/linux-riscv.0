Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15551EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2HJQDzH31oeOr553UkgEpKTg4Gr+/iqk/d65nFWnLSU=; b=0I8OGGnr/SNCVDQDzxFBUuGVF8
	/0IqNOfjbMUkBhW71n3QAlG5T/i+BAeYUV6mzEOByuGPQFvDN3/sLW9rvqImf2o+b6/0NJjtNMVh7
	gRygxHbZICLH99QCIDzwnVzfJie+aMrknY08fbcqGXK6NVxDq8TY54PgodxNznNZiOpDoWF2yTToS
	uzUnq8Pspc+jxvq9hwUruRt98cLU/Nv3QJ+rnNeS3CHHkFEsiJ9b4OvzqfnJFvKZgRsoWwaL9FYro
	fURGbsKISQI8YFqg0TcKAJLrI9QOAu6BDahrSic9XGj6HomC9K0KyeIT+R00vbwxzqTyYDvxtclIA
	3Dgot7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1z7-00FHlI-2d;
	Wed, 21 Jun 2023 17:51:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yX-00FHAq-2u
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Jun 2023 17:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=txSuZoJcjD5pcccV63ogAXj6R+ImdzOqCpjUFBogFls=; b=JUmE7K8m1q/0LRiAxjjaisRY73
	aiYFVu3UwPw69Mxlq7wCcqqy/kwckC5lpjBB+acP61m15GhzIFUibXC5oipINuXG2zh85NAvD1ctL
	+eLmLA6svIEcPVHk8hskOhivD9nfey3YrqWDURfceB69ps6+5QQIQ4zBpX6wQZ9/ETKSMb2CpXDeh
	yyqsRptS08IKVoKf/L8pfn8oEoxKAuwQ3Zld0tD/4SjA5PjDHYX5qitEwXQs/gLRJ6VEziAtVFmLc
	rSGAVi+pSYMz2PhmJidpCadsG3qhiriKPaSb/JJ8foUzy3JIpReuHosyt9M9BhMDmGM0zGXQTKyIe
	hFZwbPpQ==;
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yU-0001Sk-08
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 17:50:36 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-77d99de0e9bso573091739f.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687369831; x=1689961831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=txSuZoJcjD5pcccV63ogAXj6R+ImdzOqCpjUFBogFls=;
        b=tr43CcP/8i342v5/9Ct1YrQsldyO50OPcRiuSq6sRQko5jigiWaQUhv5W5PI7oLr3p
         sC4wmp8EhlAUZ+KM6y+uwTC1qr1H0WPEZTRKESbsiL9VpbH4vqRV36avGePKj3Nxx7Y8
         1NCjmb6o2QsoVVBbkLqu7Hd7yyeHbyGs10Eaul2ycHCksKhyKsW++ZrSeFsO0m3sGcP9
         IorLAPs+osOx+RwQUutNQUN5JBQDyYVVUHApYkDisryzVRTt5RItCml0Gj7t46jh9yBn
         c1L5nKOs2o/qlzL7Vn1WKPUAr4Q9Cug2flxP+m8kS6WYBpop3Qeyht2U29DIWx6nHfNq
         vDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687369831; x=1689961831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txSuZoJcjD5pcccV63ogAXj6R+ImdzOqCpjUFBogFls=;
        b=A+KelZSfpp12sqOphdleqXU7lu4e1ga5jNFoFTynhuAeOKh4f76mRuqYAGg2SnGJ0P
         Q03h/QnsaxMSYFNqt0AgOG+sKg8YKn+hzogvvn4uLrr2ETP/EAv07Ml/zAX3oaHzSC8v
         KJcv7rvFg4phS6bTFz2nxIwiJtsAQW0MuckcCraIj4wyyvrZi5d7WqDacoIXbwSCAhth
         ywwAdIJFJSEgTFfhuxvxUiSKQWR28k0FrnWEjUscW2aU/8uXpo/wY0dMIvUKbR/nynwq
         f+cfQcw6Q124DZEu2Y48vuL5q6akftlSm7VVd2tfMGVZ4bXHXQXFoJmZUcGcdGR3VgPv
         9i5g==
X-Gm-Message-State: AC+VfDwu4sDDiO/pk6du24uAQ/Wo4QnUzmO4YnQqcoBXVwrGXM3ZSS88
	u1UBcTxGbuVIU2yINEtRxiBzrJDvpUCW
X-Google-Smtp-Source: ACHHUZ68VfUE9LrG5crOF7yNQz1Mp6rxMXDaLofQZc3ceY9MQM5/rteSPwnUZE8mHUTdjrcj+99o5c8geD0l
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a5e:a908:0:b0:77e:4866:5c0c with SMTP id
 c8-20020a5ea908000000b0077e48665c0cmr3257495iod.0.1687369831367; Wed, 21 Jun
 2023 10:50:31 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:50:01 +0000
In-Reply-To: <20230621175002.2832640-1-rananta@google.com>
Mime-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230621175002.2832640-11-rananta@google.com>
Subject: [RESEND PATCH v5 10/11] KVM: arm64: Invalidate the table entries upon
 a range
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_185034_205156_2258AAFB 
X-CRM114-Status: UNSURE (   8.93  )
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

Currently, during the operations such as a hugepage collapse,
KVM would flush the entire VM's context using 'vmalls12e1is'
TLBI operation. Specifically, if the VM is faulting on many
hugepages (say after dirty-logging), it creates a performance
penalty for the guest whose pages have already been faulted
earlier as they would have to refill their TLBs again.

Instead, leverage kvm_tlb_flush_vmid_range() for table entries.
If the system supports it, only the required range will be
flushed. Else, it'll fallback to the previous mechanism.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index df8ac14d9d3d4..50ef7623c54db 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -766,7 +766,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 	 * value (if any).
 	 */
 	if (kvm_pte_table(ctx->old, ctx->level))
-		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+		kvm_tlb_flush_vmid_range(mmu, ctx->addr,
+					kvm_granule_size(ctx->level));
 	else if (kvm_pte_valid(ctx->old))
 		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
 
-- 
2.41.0.162.gfafddb0af9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
