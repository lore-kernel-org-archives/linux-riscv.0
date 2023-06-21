Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D258AEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 17:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=++2QXO92MvwnsOgLs7mK9IfRQGVZYrIqlFBSqS2QBBc=; b=hdBNvtg6H5y1FYcj9PSClB430Z
	0h7QdG9GdeyhxN9i06Huspy1dDww9aNQMj+x1nLKDAeONFC3FftyDk3RRh8LimqekCyx+0Xxk3ESx
	oQ8w4SXptHQKc8VgisMhJLW83AEa34ULmbpyujTURAFEsFEymICd8MNTTiJr2DwctwfzEziST//4V
	idNHVLyS3HXLW/YGVVVljDloIu2AkYn38Qkbkn2+c/cTayg0ULuSmURjvVqD6+zLPFJSgB0G/VniA
	hMKlKbl0jzjxv0NtxbrBZnYwUfHV5Lvakx0LHhgLCZLnRH5ee2VALb75JO2mxUzNYSRqax7YGjDXB
	z6uWOHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1z2-00FHfz-1m;
	Wed, 21 Jun 2023 17:51:08 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1yR-00FH5P-1Z
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 17:50:36 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-77e3eaa1343so376629139f.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687369830; x=1689961830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpR1MspLCCKbLGu542rFrU99snL12qe0SU5vnENHbnc=;
        b=obkQNETduI4Wdlr8DqbH6rQDpqF2mUi0lafiiZR1QXrNN2+tKemED10KMGrakG13Nq
         +F9e7JIuRjiRR9EfoJnua+9jPsENy4Tu90Vrn/2nK11OMp8Aj/golURDqyPfJ94Cfrxi
         hdWdLoNiohD/PMMDEG0mtQHMd7A92j4tIxNPh8D/cM9gYPH0WwqnOU4OcPsZKdr9HTOs
         pyGKjpe6+P6Xcb6ByP94N+J+yZmYDJogpjw8kcjVcP5B1YTqtAJdqi8Hp9kutYXKuAUx
         OCxMudA25zodKFZSyAwbz9vLyvHyzcqnxGuKjUldsdPVjyx7x6uGCQbzc3ZzHDMDOM0D
         Kg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687369830; x=1689961830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpR1MspLCCKbLGu542rFrU99snL12qe0SU5vnENHbnc=;
        b=a0uQzJ5KH6Hut6QPNZijU+epsPDyoHGWDhm6g8YlKezWNHoww22NnklHOMLmmDHWJx
         MFAJSaxUHIQx3z7N2mF9hAu41zYRiNBy2bP9cooDG13/wmjaurHdAbZVOlqns6yfN7iO
         0tjrvK+73pl75K2rj4BtVN/8X0EEWu3jN3EZ72YhUo5T2w88C5rmhei7RuT8CLdw3D+g
         ZsWKKwE/IXCO50yhEp+OmHq1WK44qrps8V4T1kTojpaogWPsVG7aUCGg39yUAIMriaFU
         gbxroGbVYfM1Gaj2P4sUbPx+QY/tTzkoSFz0muDVRZ03YdMgadtEDEkD1sgh2bVIQk7g
         BYVA==
X-Gm-Message-State: AC+VfDyAG218m3eMSXkPssK7wmeiwkeSoKd4zw/PJyY3BLIR9M3r86zY
	zDF+SeoAj26X7HxDHSPnDf8qSHavt3Gu
X-Google-Smtp-Source: ACHHUZ6lEejYkvXSZImNPgkcjtxASyr0tUJRYFuyzfo7eVoPr61PQ+mo3lAqnIjMYGuKsT4NfkEe3+3Un922
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6602:152:b0:777:b38d:2333 with SMTP id
 v18-20020a056602015200b00777b38d2333mr5713635iot.3.1687369830330; Wed, 21 Jun
 2023 10:50:30 -0700 (PDT)
Date: Wed, 21 Jun 2023 17:50:00 +0000
In-Reply-To: <20230621175002.2832640-1-rananta@google.com>
Mime-Version: 1.0
References: <20230621175002.2832640-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230621175002.2832640-10-rananta@google.com>
Subject: [RESEND PATCH v5 09/11] KVM: arm64: Flush only the memslot after write-protect
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
X-CRM114-CacheID: sfid-20230621_105031_538544_43B3064D 
X-CRM114-Status: UNSURE (   9.47  )
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

After write-protecting the region, currently KVM invalidates
the entire TLB entries using kvm_flush_remote_tlbs(). Instead,
scope the invalidation only to the targeted memslot. If
supported, the architecture would use the range-based TLBI
instructions to flush the memslot or else fallback to flushing
all of the TLBs.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c3ec2141c3284..94f10e670c100 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -992,7 +992,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
 	write_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end);
 	write_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 /**
-- 
2.41.0.162.gfafddb0af9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
