Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4580C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 16:41:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5D061216
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 16:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF5D061216
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:
	Mime-Version:Message-Id:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=d2AjzfeneSEWv5NsLk/H4Be2fPZLvkpWN+J8iHSTQtU=; b=1n9
	3TmlR3OSnr0mOxztJg4e/tgbw+39UYbK+4oqqW8ig5C2Evabf6m1kZmR22RS+6j6j1yX6pZ8AlzZm
	2+WWvAvyUmOynwHMVXC0UTEOMhb4eKSeNToZJwaIlaZZMjIjfDQlnK1zwViir6J6uHQFYh/JXSIgv
	34ubTSvxRJOGwCPZfBoDynrOcdnn0TPhY0KyonPGIZm8M5vladOPIC8eIEjRpjx6I3VywX1qQu4z4
	XaRWKg8bYXUvDAU/YXa6k+3bWHwclbldVL8FcdwUHjNNIWL8hRIf5aKR29BTlAvRL5vaiXZ9ggIs5
	+4VmSAsRlbZQ9MlSc2F/BpFpuTXNfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mifnl-009Von-Qo; Thu, 04 Nov 2021 16:41:21 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mifni-009VlS-Ti
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 16:41:20 +0000
Received: by mail-pg1-x549.google.com with SMTP id
 v63-20020a632f42000000b002cc65837088so4158869pgv.1
 for <linux-riscv@lists.infradead.org>; Thu, 04 Nov 2021 09:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=B/Zu1r2lWoaGRs4vZ4DYzM83YZYEZ7XIPjfjvmaVSuQ=;
 b=ki3AaxqFOvGvvbJJZVr35PCVsFHsUCxZqbsEF1iDWMjKZKRWHNVpZlaeyll1xDRuqZ
 Fe9NsSq5NdIlDhb0JLDZfyM4lzNAJm+sMyKu7XG3OZnwhCX0lDAr0jFvnCTVlBd7Rlcf
 91yoEX88+q6nDsjG+XcTr8pjIQnVgIspEYZF36luc29Bya+BC7bNTBu763VhyOSfxu1/
 ZjYG+aZ9p9yMtavbux/GVKKU3aGIISPuiv5jHwBtGmAL06kN/HT7OfW5saTVeBTigG3Q
 3Ld0kCq2NzU5RRSSR7+xT2EDJ1GsS8+HpmW85Q3Hm2ukUg6jrEEJgklHclpTDmpPrHOL
 OSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=B/Zu1r2lWoaGRs4vZ4DYzM83YZYEZ7XIPjfjvmaVSuQ=;
 b=C6ooyNF/3lnPTId8uMAvVgYP+arFlwAMPak23xm4QjEpsgQQgZaaDiQ18yYqPZpmQ4
 NAqoczPEOJxfacpU1YRzJ6oL+mHd0vwx98yTLQLHeZFgPl/gSAoJX/tqZRrbntjD8bie
 L+LIIrXiO9oBUrXpeMv1msdgt1QKZNRIvjgUXyCf+XG2lZkDYqig0+QOirD/BxSTQXWp
 a/kYSG1m3qNiPOVMZOC65x7MQBIxMhGyOxvvoAr/Y+jY19kcfWwP8NTXueIdDPSneTlK
 451bEPvrnFpNat01G99j6Hf4Vf8cTFcNJW9PMal1zlrJLRG1lAtH5Y9IUcMMaav8fDhV
 Ttow==
X-Gm-Message-State: AOAM531L9O0ua7xdL/cABGRvpJXQ5HRp+oC9QLI21AwMoyoYQVv2lZup
 0x4WPnR5iXAh0lfL3Ike6Pkd2y+SwaE=
X-Google-Smtp-Source: ABdhPJyhpgJIbP/ZAmnJDHk9Tyo9aV2ayAs3W7Wg+/tcco9KaG6KLs6a+BwMRjVfrIktXi2iqzXjnoCxBEk=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a62:1bcc:0:b0:480:fcb7:76a9 with
 SMTP id
 b195-20020a621bcc000000b00480fcb776a9mr34631165pfb.22.1636044075227; Thu, 04
 Nov 2021 09:41:15 -0700 (PDT)
Date: Thu,  4 Nov 2021 16:41:05 +0000
Message-Id: <20211104164107.1291793-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH 0/2] KVM: RISC-V: MMU bug fix and cleanup
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_094118_970224_2389F272 
X-CRM114-Status: UNSURE (   6.85  )
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

Bug fix and a cleanup for things I noticed by inspection when working on
the scalable memslots series.  Regarding the fix, unless there's a magic
unmapping hiding in the corners of the MMU, RISC-V completely fails to
handle memslot DELETE or MOVE.

Compile tested only.

Sean Christopherson (2):
  KVM: RISC-V: Unmap stage2 mapping when deleting/moving a memslot
  KVM: RISC-V: Use common KVM implementation of MMU memory caches

 arch/riscv/include/asm/kvm_host.h  | 10 +----
 arch/riscv/include/asm/kvm_types.h |  2 +-
 arch/riscv/kvm/mmu.c               | 70 ++++++++----------------------
 arch/riscv/kvm/vcpu.c              |  5 ++-
 4 files changed, 22 insertions(+), 65 deletions(-)

-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
