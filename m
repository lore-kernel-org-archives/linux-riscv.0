Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4CBC001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 22:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V0tfbTKE6JMNleFsbDXzQ6RsGt29xuUKLXrK27bULns=; b=xAaUaI0uQWLd1WVb5tD1G+ZUgM
	eQCZCKdpzwRsn6DiatR1ay/wlyxoYyDz20Px3EVY5R7mFJEb0ATCbuO7N5II6zGdzY0M4VR782/pd
	skA4QT+hsQsw6ogJU5dIsnYRmsgo/Rpjff6gArhtKrJOMTroae5nhtuMOytPtbbEgxwidJngC6PIr
	8HhKnkcOeBZZmoFtLyMgzHdbzucCoXWIWKmDktWIX36P+ls99zMfSZNNi50Ii3PlAbEJWGra3W+wT
	y70fRpCddmYOiAcNLvUQDocjPSjbPsqr/MMJwoPPFlq9wNSY+orfNvRCQK7iKg2vH9unDELHDdTbe
	8sNMXi+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2Zc-002jED-2R;
	Tue, 15 Aug 2023 22:31:36 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW2ZZ-002jCE-10
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 22:31:34 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-565ece76be4so757676a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692138691; x=1692743491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c05rm68PGHctHfBOW0BB2Jo3SVzvE3TlPm3JKZSv5Mw=;
        b=zSFF7IvUGxfd6gkBF8F4GxNIfCZDaje81HGokT4kVqC0KU5MBZZfnSNOssjA6mgPAN
         cRsGYufjjTrofJ5vumrJHSKBn+aQkdbQm8SJ6Tg7pe3uSFLBt5uqtw3fpFPHIwqCLQwl
         XcScAy71RtNQVglvUX71pW9VDOezt9WeMjdzJpB8j6xCtBMrW64e4RqjVsEAATOLSY+2
         Kc0mkrDGoXj1Uxkmf3RdCa1iiwYYcPfTD1tlmgV7Y1a7fsQcwwVcxfXNnu1VMojtXQVU
         cWzhmvK9BEtXIJT8SQyPj67km+M1Y0mj0c3KYu6zoMpRyt7aoFrrEFWzb2h44tTJG4MZ
         Z3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692138691; x=1692743491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c05rm68PGHctHfBOW0BB2Jo3SVzvE3TlPm3JKZSv5Mw=;
        b=FrvtN1UmmHjISKo908kF1JRaZYs7R28rAbL9HgN3FQGvQ/zBvxQQAt64BtKwa70zIR
         pl59+PKUn1Jsf+3USRO9bT/1cUinET+JXGyvqBFsELGOsJNW4qqfIe4Nny6R3/U/uzEn
         Rrr8vwgXZy1sBBo1O/krKnyr22h23ubaRgDHZkHn9iDUz3ANeQ1qCqk/mPwSFnPYz+Rj
         qEm8d8yJhuBn+KyT/BsijI73hgZ26hGN9MH9gGvBWt+gcWXXZoYTKRUhPgC/U2CWknUx
         drxPALht/1cIf94yiPBLLNhVzMLi6R05APZ+OYYQhXt0vzmYj2uow7lRgtj9idG9h87m
         oJYA==
X-Gm-Message-State: AOJu0Ywu2AFZkgZUtr4T2IIND7Z8v6ltPBdMI8W9YL06wRZSrGAPxnYO
	Y1fvfrTG/aIdokhT1gdh0AQjl69cnVM=
X-Google-Smtp-Source: AGHT+IFdD7miISJ5FT27quR/P7x6Ii7fo9teB2QXXhYX+gchH8nb3ttm0pZzM2e0YrayRrW5/0n1JDm2xpA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3e4c:0:b0:563:dced:3f35 with SMTP id
 l73-20020a633e4c000000b00563dced3f35mr36925pga.4.1692138691431; Tue, 15 Aug
 2023 15:31:31 -0700 (PDT)
Date: Tue, 15 Aug 2023 15:31:29 -0700
In-Reply-To: <20230811045127.3308641-7-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com> <20230811045127.3308641-7-rananta@google.com>
Message-ID: <ZNv8weRKhSeLYWIc@google.com>
Subject: Re: [PATCH v9 06/14] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Jing Zhang <jingzhangos@google.com>, 
	Reiji Watanabe <reijiw@google.com>, Colton Lewis <coltonlewis@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_153133_348921_58598C67 
X-CRM114-Status: GOOD (  14.02  )
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

On Fri, Aug 11, 2023, Raghavendra Rao Ananta wrote:
> From: David Matlack <dmatlack@google.com>
> 
> Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
> "arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
> range-based TLB invalidation where the range is defined by the memslot.
> Now that kvm_flush_remote_tlbs_range() can be called from common code we
> can just use that and drop a bunch of duplicate code from the arch
> directories.
> 
> Note this adds a lockdep assertion for slots_lock being held when
> calling kvm_flush_remote_tlbs_memslot(), which was previously only
> asserted on x86. MIPS has calls to kvm_flush_remote_tlbs_memslot(),
> but they all hold the slots_lock, so the lockdep assertion continues to
> hold true.
> 
> Also drop the CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT ifdef gating
> kvm_flush_remote_tlbs_memslot(), since it is no longer necessary.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Acked-by: Anup Patel <anup@brainfault.org>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
