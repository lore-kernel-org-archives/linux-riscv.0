Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ACFC25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDpCRBC+VKh6CLgK34xtWarGL+Rhwklu+xt6aB7RCaw=; b=jeJpqFE0XBkwAp
	io2vmKH93GgvET18J4I1qMI2tvpQRKKueDF+TA88+8w+ET1r5eHfpHz1Z8Om6B/dQLjUes1A5VRLt
	7Q2eOp6mdxgfr+H5E0slMdyrS/j/1RBxC4BXe4EHVwH7jF8ZNbcE72rJog3kkMfHOJ5NUhriDjPp5
	urNFW8X693z28jGCbqV4HO7BTrEghM28QuxmvPFdYYfy4EJM/pbmgI45xm5X6wzjhQL+Fmy4ueKQ+
	m+98Hb6PJhPGUxDJOADMiDujy/nBxnWtIl1tRQQy6USFjWkTvkPBTRJ7y7hWXzlIswx3ueT36rLl+
	YGYreiHNJk3iU6R5/T0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSYB-00H5fH-2m;
	Fri, 27 Oct 2023 19:31:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUB-00GxMR-1Z
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QVHGnajj4HOCkrhgrdEXP5z3IZ3KkliWY6Z9SNVyio0=; b=pUjt7PHubJ4EaA5qMOaopLcHET
	VXPS7U0Ryhxt+Pj1BrLOQiCdu/2MBfawq+wBr+c2pSxg5FoIVD5ntipLOhBiNdjCVHZXS4RqDDvii
	HMvi/auxj9RoQZak+MGqxpoDDqmUaXzKoQmjwaMBuVKwL9txLlUF0RgnbsI68Wrz3fxqEbAzgY0ND
	KQPD1IYuv5TbiT4klmzoraWSkE/PvlYNUe70Q11MBg3RuwWSB5H6EjqbKZ3L+jDnaZvydtFouQ/F1
	FV2N4oqaf8SSe9WI7Nz5Wsg/dsQiJXHWoPkFp6y9NA66/5pWf3g+1rcIH9GbFDYcaSQi6re2doc3M
	McnsMFgA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRU7-000ueG-0s
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:06 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5af9ad9341fso10348437b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430981; x=1699035781; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QVHGnajj4HOCkrhgrdEXP5z3IZ3KkliWY6Z9SNVyio0=;
        b=bD76xPW+5j7Sp1vGHpREWyBtfua1TNCfRXgdr2KBAsyKr/4eL0vI0IvH2fAJnp0GjO
         SktGy4Hr7FFz/k/a8IKanSf+JkKwJfxXf1nmRhQfAgcFFnwrOi+oOBZ8ndIVISfzSTXE
         5FWr+w992Do3q6FqsCaASRfXqMpRr8AyAi8A/13Ti+yYk/vPi+Anog90Vg27IMgH0idX
         MyjCpxtrkwmT/kWsdfQ9xAjoufWqPP4O0yXVAo40yCFInFGSW1OPRY5iDF4T3dn2dnsG
         YXeB7UMDU2/ubby9IN9NswkWNo92IFEniQ8boSnafAjjCDfCjw2jci3aSoOFqoduaQ+F
         9rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430981; x=1699035781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVHGnajj4HOCkrhgrdEXP5z3IZ3KkliWY6Z9SNVyio0=;
        b=e1tWqxIBT/AvqBky4CHy+ceFJbKKvyUPNC0fN3bh+21egZVguiDhuLdQggaTF3Wd2T
         iiAdaIA2DKyVOejjRynIXN6PKNn+wZBcdWToz28OrXBVobeBKM85vcOAtmuahQLIZAbh
         rqg1ylF9pe7HCGUjub3/n+XcKnGbbwIVi4uH5FZRMVDI3uZqqXnPOSI6oA6m8fqPijEq
         +9/5X4KZlKH2N79CV3YWusj0P0ZvIKwJ93YGx5JqEEYc+zNgS0LOrTRgoN1pzFYWyUT+
         Uv+xAe7WNxWIgAyq2YgeUJuDZqydO4qBKvvk4S9Mhsx/MVkm6afIfke7TEQYcLR33jlC
         wAmA==
X-Gm-Message-State: AOJu0YwQAys/xfUaJL2LYeItwNkmpFteK16onPU40IjKVyj1D4xE7jDM
	tmJA9/SHuKYUfVnsC6LG1C3gr9QYyEg=
X-Google-Smtp-Source: AGHT+IGhdcD7DYxvJo53MxSFMcue6wHqMJ/dJKXwjBlyW/fIhxTWfdSD8wIFRBeoqz4UflCFK1Su3DgQ67Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:da0:567d:f819 with SMTP id
 v3-20020a056902108300b00da0567df819mr78702ybu.10.1698430981246; Fri, 27 Oct
 2023 11:23:01 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:00 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-19-seanjc@google.com>
Subject: [PATCH v13 18/35] KVM: x86: "Reset" vcpu->run->exit_reason early in KVM_RUN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192303_695062_FE168D0E 
X-CRM114-Status: GOOD (  11.75  )
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
index ee3cd8c3c0ef..f41dbb1465a0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10963,6 +10963,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 {
 	int r;
 
+	vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
 	vcpu->arch.l1tf_flush_l1d = true;
 
 	for (;;) {
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
