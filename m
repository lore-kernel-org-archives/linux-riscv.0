Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAB8EE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIOvg9YHWuIfyVUlCB8wP5CQ0o+VzrsTNVHU5LhWzWM=; b=PLYKS3fXUu8Q6q
	f8H/NB3Bbb2qRqmgbuv8QZjUCGcjLL7TSr2UQB9Y2VdyQJchxp0vq16eXANyPMA7VQ/cM8K0GNqAW
	yt/YJQ1Z4mqVIbpuFD+fJ3Xvq1k+m+W2bEXkIwjQQsI8gRbBaP5CPh1H44YCRFpL1prTpQv285i0v
	cHrG7u5xez6SUSt1mwYvt1DHVnauWNhYubZf/subeE8GD4l7332jyvQYO0AxI89Kwt8uff+XLRVGq
	V54r1Heef5bB11OfWaESDTyv8w3AeRMl8dmvG7/rp25TkyhJyc2OuWujQbGNSZhM7RPUc0hPjvRSA
	YSytfKWQxDsDxV/dpMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbcU-0075BI-1u;
	Thu, 14 Sep 2023 01:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaZ-0073Ka-2s
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JU2E1RY5jYghlRVsn3OuL2a/W8MVmnBu3lS2NKbXZTA=; b=MfnTyeTRO2etyc4uKEGc9d3oJp
	PnuIMBKxam1C2CEsF4iUwYlyfD10dTZLw3rcl8U2q4M5fZsjyfgx6qQoGnhxXpgIcUhOlwbSyLEmi
	8ckidrHyb5atnHXi9JLZkTYqZXP3NcrInqVnBbG4gW+eiasxx0uzIVMsE2iXc81M9HNVpgRQPoOHc
	KQJW09ff0Md9bCe2crJUlvYNHAEewQDncbsrtjSCUBR1NgBwqPTFEMi3KTyjIOuPHblT2cgzyixLM
	+s84VNUIbcO62yQqr7YzzggjXx6j1etw/J+vaazHsqCy3zrYxa/Z8tZ3HFFcU6MNdiFjrG3QLYISw
	PbOdF0YA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaT-007TZk-0d
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:14 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c31359832dso3885215ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656568; x=1695261368; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JU2E1RY5jYghlRVsn3OuL2a/W8MVmnBu3lS2NKbXZTA=;
        b=NF0gtD0WZyQyUAqFjxQ36f5UzXffEEg3aDCcmP89ad9Vn78H5YjQmLTNoni3TkqbcS
         2M0GRbiKGX9saNqrWkeJ+6/fyNh9Y1+vCcVLisK2LXiAe8RiBwbtwiHS4quWrFocoHH1
         h0KqdLEUnDea0dpLX1HXO79zJZmYKBIl/P0JYtX+a7/VFqxubDeuYB2zRFIpxPC+WKSQ
         4JR/XPZtvlCFtj8umvuPRrneTYVW3oUwZ/A2O0NFJPCN6l8oTPJBgfdRoru70unK6TX3
         85jIDFgoMoShCnGq7uriQG0H/IZBiNYM1QQ4XUPXTf+bIRUDejZAa4OlDIyJ+poQtQwy
         l2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656568; x=1695261368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JU2E1RY5jYghlRVsn3OuL2a/W8MVmnBu3lS2NKbXZTA=;
        b=gdzXUmTE+UYoFVRPKCCoCFynVrzLfiZ5vT04kAjFxTK89Oc4J31rC3P+K3HOSvL7gb
         3Z5TSD22qAxnHluvNNQS2wyo6Mn9UX54QNEG2ft+k0Nmx1DZykoxiR+0hacL9Jl0ZBfa
         jJA0h6UX9PAeCE/pvlbdfdLeLUe3XETLkmtyHQkQkH0LNrT7j5GmMKryGvCkTSGA2sow
         y1IUraU2QsZ3zM/nDYK0ZP1kZEvvHkfbxySj+s2qTWg2TAqq4lVfbfmnQ3DWDVvl63RL
         NEkkl1WRpy+e2jQ9N0aNbNbrpJseRZSKyT4IG8/I2uUdCBdtXr9WjEBeUrPvfHB33NjY
         X/UA==
X-Gm-Message-State: AOJu0YyT1DjebJJFtsUMLKEPnDp+T69epEgrcVL3rRuAMtnYc+1uDJmW
	Vqq8uIzGyW1zYETY8WDO+DSz9AdWEK8=
X-Google-Smtp-Source: AGHT+IHMQPQ3k0d/UtHxD4b9hamrYXMHgCSNyIGKdggb9SAJfpQFP9N68H8VlXpWCI6NE2xrZ7HMeRXjSd4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:da8e:b0:1c0:e87e:52b9 with SMTP id
 j14-20020a170902da8e00b001c0e87e52b9mr204006plx.12.1694656567699; Wed, 13 Sep
 2023 18:56:07 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:14 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-17-seanjc@google.com>
Subject: [RFC PATCH v12 16/33] KVM: x86: "Reset" vcpu->run->exit_reason early
 in KVM_RUN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025611_030011_E15F7723 
X-CRM114-Status: GOOD (  11.83  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize run->exit_reason to KVM_EXIT_UNKNOWN early in KVM_RUN to reduce
the probability of exiting to userspace with a stale run->exit_reason that
*appears* to be valid.

To support fd-based guest memory (guest memory without a corresponding
userspace virtual address), KVM will exit to userspace for various memory
related errors, which userspace *may* be able to resolve, instead of using
e.g. BUS_MCEERR_AR.  And in the more distant future, KVM will also likely
utilize the same functionality to let userspace "intercept" and handle
memory faults when the userspace mapping is missing, i.e. when fast gup()
fails.

Because many of KVM's internal APIs related to guest memory use '0' to
indicate "success, continue on" and not "exit to userspace", reporting
memory faults/errors to userspace will set run->exit_reason and
corresponding fields in the run structure fields in conjunction with a
a non-zero, negative return code, e.g. -EFAULT or -EHWPOISON.  And because
KVM already returns  -EFAULT in many paths, there's a relatively high
probability that KVM could return -EFAULT without setting run->exit_reason,
in which case reporting KVM_EXIT_UNKNOWN is much better than reporting
whatever exit reason happened to be in the run structure.

Note, KVM must wait until after run->immediate_exit is serviced to
sanitize run->exit_reason as KVM's ABI is that run->exit_reason is
preserved across KVM_RUN when run->immediate_exit is true.

Link: https://lore.kernel.org/all/20230908222905.1321305-1-amoorthy@google.com
Link: https://lore.kernel.org/all/ZFFbwOXZ5uI%2Fgdaf@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8356907079e1..8d21b7b09bb5 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10951,6 +10951,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 {
 	int r;
 
+	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
 	vcpu->arch.l1tf_flush_l1d = true;
 
 	for (;;) {
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
