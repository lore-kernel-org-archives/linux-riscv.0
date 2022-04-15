Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA905C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 00:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PQWEdxcW3YEd8phkAS/L1+mEQc4q1vA6ZfLZLiEHq4E=; b=C9T
	zRislurQE7z1fPT8YxRZgNfmJO3WAvALemsG24+syCuiuuxfpkJ3esgFahBSIJwwO3gwrmUocHHj4
	uNpCemS1arIb5D5q6/r2mhXEkiv30wuhnPR9PfBVFipYO06YUUjBiU+R/s5CnNJ42QB/jKOTa4RAM
	rV9UeTOyHTCPVm947aUcazYNlwDv/ITUWiR/Jy66fkQ5pI8WKsAgM6uL2yVtj1Fl99JwG5UDKvMHO
	05SYDvwH+OnuBZMiObo8VHrF/1z+IGBZcQ4CgZTXr3A3FuVfr6ZF/GME4cwZcNTa2p9VzL+fiyNt+
	xYnjIW/QIKVQY3hEfsSAbSv4G0V7kTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfA40-007tuk-0i; Fri, 15 Apr 2022 00:43:52 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfA3x-007ttK-3F
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 00:43:50 +0000
Received: by mail-pg1-x54a.google.com with SMTP id
 t3-20020a656083000000b0039cf337edd6so3467934pgu.18
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 17:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=7OMi2RIEzFlzmxnmlN9xX+Hiuvy0euETloS8ByI5IaE=;
 b=MeCa2hpH2EDOFAv86dWfFxEDhUCoVgtYtspWsZspfLv8qId3NORSe7rf03wn86oylz
 +XJ0GcdqQRybf6xncuTBeePmfFN4InpFQ41P9BSR3Syo01zZHvGZ9zQr4T4EE1WEIloe
 reG4s0K2VYD7FLIjoouyOUE3otCfnre0GNbLyJfTBPWb2DV4bee0Kn/uLaXDFLxrNX/x
 UbZV6ELm90R1ITrDKiVMDDPojI8aJ036Iusf7S6xFX02aeLgG7OCHcrKOwsYwLbInWX3
 PegPDslVaW429FO+Y+K2OsH/9FIvKxrhlxBKuaQed7QGbk7x/m+I+YhWAP5nEspT3bi9
 F2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=7OMi2RIEzFlzmxnmlN9xX+Hiuvy0euETloS8ByI5IaE=;
 b=A1EhgWuVBM3m5wR6DTLRUCNomvLFaCKzCZm0HVa5Va3Ky0a8fwB9MNHRu6hRNF/PI5
 yN251Djh/pLoWnLhgYlrVPk3QRkR6vezENsE4K85ZR7rTG57ZpMjKQmRjWm5fbgfSKXz
 RcFbE00rOojOfnSbu1mT/ZTn6QTF7qPkEXEjGwSF6OO/VMjbBeOcuz0jj0D0bSdrvBKc
 Qs4d9c2hVxKKjB7V7ZedDa3vSqjGdq3skRMmciEUfUW/ctRF+sveYVJ67a9F9QvoUWHM
 7gtjYJTYkzD1IW+qd+Ksd9FsArDjvhjlRzvC1gU6wpxwo/uxQitvGAiKLmI2x6LQPLkx
 /rXw==
X-Gm-Message-State: AOAM532e+XXGtaINH+TiWs7uvigdragDN84be7Rl+UybIMyB2POW2Wqp
 2AF2M3op1tFDP9U6qI4T2g/6JfoZyAM=
X-Google-Smtp-Source: ABdhPJx6JOuyqIVZMdQQ1Mawo8G7YZO4giLYHAwOTFBDw/d0CTLHvznAoZ7hbCtCNcCnHHDws4949mgI1FE=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1490:b0:4fb:1544:bc60
 with SMTP id
 v16-20020a056a00149000b004fb1544bc60mr17317476pfu.73.1649983426720; Thu, 14
 Apr 2022 17:43:46 -0700 (PDT)
Date: Fri, 15 Apr 2022 00:43:40 +0000
Message-Id: <20220415004343.2203171-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH 0/3] KVM: x86 SRCU bug fix and SRCU hardening
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, 
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, 
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_174349_174296_6E466E8F 
X-CRM114-Status: UNSURE (   7.26  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fix an x86 bug where KVM overwrites vcpu->srcu_idx and can leak an SRCU
lock due to unlocking the wrong index, ultimately causing a hang if/when
KVM attempts to synchronize.

Switch RISC-V to the generic vcpu->srcu_idx, for reasons unknown it has
its own copy and ignores the generic one.

Add helpers with rudimentary detection of illegal vcpu->srcu_idx usage,
the x86 bug would have been incredibly painful to debug had I not known
what to look for (found by a selftest with very specific behavior...
that we recently modified with respect to SRCU).

Non-x86 changes are compile tested only.

Sean Christopherson (3):
  KVM: x86: Don't re-acquire SRCU lock in complete_emulated_io()
  KVM: RISC-V: Use kvm_vcpu.srcu_idx, drop RISC-V's unnecessary copy
  KVM: Add helpers to wrap vcpu->srcu_idx and yell if it's abused

 arch/powerpc/kvm/book3s_64_mmu_radix.c |  9 ++++---
 arch/powerpc/kvm/book3s_hv_nested.c    | 16 ++++++------
 arch/powerpc/kvm/book3s_rtas.c         |  4 +--
 arch/powerpc/kvm/powerpc.c             |  4 +--
 arch/riscv/include/asm/kvm_host.h      |  3 ---
 arch/riscv/kvm/vcpu.c                  | 16 ++++++------
 arch/riscv/kvm/vcpu_exit.c             |  4 +--
 arch/s390/kvm/interrupt.c              |  4 +--
 arch/s390/kvm/kvm-s390.c               |  8 +++---
 arch/s390/kvm/vsie.c                   |  4 +--
 arch/x86/kvm/x86.c                     | 35 +++++++++++---------------
 include/linux/kvm_host.h               | 24 +++++++++++++++++-
 12 files changed, 72 insertions(+), 59 deletions(-)


base-commit: 150866cd0ec871c765181d145aa0912628289c8a
-- 
2.36.0.rc0.470.gd361397f0d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
