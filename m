Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B9AC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 22:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o23Je2Hs7L/O2PU3nUA0hVCNaz85Xj+oEg0d9BJdfAI=; b=HjB8XK94GnO8m4HWMiiQrV5JSt
	WBijuu0+7/C6FIlN6p+C5Wrnamoji9PEGUqK2XDVFLM4h2y2WMk7AK4Z3o6HRWXgK0AJThdkGshbg
	K/+LYfbhGGxzkPzaeXQmc4gGWNzc8jxadyEkdaztEhK17EUMBl2E/Xkfe5EFJ7GU9zUTUvr+Y0J7B
	EIwR1mRTnA65B6vzuiF+vzViiN8RryTxOqDDA0jCLZ1GNkEnsBAedzP52jY2uLBO6SdUrmDz559MV
	I4LVLd1UU9p2WPtVotukTrqYdn0vKj3YqsFg1ursY+WKKORWQTgbzSsrXIP4qLzQiX6oy2meT1+MN
	2TyjBB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfTls-0037Ht-1L;
	Thu, 23 Mar 2023 22:51:00 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfTlo-0037Fi-1l
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 22:50:57 +0000
Received: by mail-yb1-xb49.google.com with SMTP id g187-20020a2520c4000000b00b74680a7904so144600ybg.15
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 15:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679611852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=74Bca3+J0Cb4vQ6fen5CaUBDEj5b5vV7i4MEot6v9Ds=;
        b=Xq5j+lIleCd7gJ1dE8R8LdVZd6/Qv8NzcaxjC5hLBOUVeScHYE3rE5TNQ//r7yfN50
         qu7jxQz7fyIymM4WAg9V2y7EeUrZ1wlQRQJj/+oujArw7fB9gKf4fErEtyo/4Mau9H09
         RIH4AJrLkpQXI9YhLhOv3VdiCxQAA5Uwh49ZPWZDzZLUt123n+4iFfw1RAQFr/LIt3xS
         ek6+9IaXVS7narxW8QBsp/0r+ivO8GmJOz2W9RcrZbFS5XUn3WI5+C0r4uBO4v461W3B
         gUARs0ynmRRd//VGT3/J54QxG+U+Aj7Nv98fLTt44VUSX4ROdI9etjSbiMvNw6fgbQSp
         UZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679611852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74Bca3+J0Cb4vQ6fen5CaUBDEj5b5vV7i4MEot6v9Ds=;
        b=jTS1f+WYdCHWWRJWE070FDXEa8IUlhIzEv9C/Yrir7lybuqs8g/raZvSLjbdAr1fyL
         FchsZOUgdAEJTSjcZycjAlXfPPcDYHRdci8NlRo4ufZPUE+5CEXUnc/3187yFJdZWfDS
         5GdnlsqA1AH8V+/xEYkM6GekZ7IO/8etKVB0JPAwxSKuydmQ52DsLj0nqLAZJXNTPBxv
         Pg/PvXZnbXA2Nb5bYT+anu9BvgiZu13/Gfk/x7mu9QGapwmQ4Bx+eL7GW0TIMosK/WUl
         VQSWorcwqdvq/F1CK3nMgsS8sgy60hbF8lzHEegVNgx2kIK4PwgYX3QSRq0LoITY1T1s
         pDAg==
X-Gm-Message-State: AAQBX9eXVDvgXIwpWjd7+hvDVei1u7HZiDK7eLhLJ/vghjabpXeMMdxX
	eYxmVUC1j6zRhPAoPQX37eGqbR+QQPo=
X-Google-Smtp-Source: AKy350ZsIJuSNQoMPlJ5+eoOr2kgPIQRx9B3zNmq76T9BVO+0ZLsWEOoUS4XgvR/h7pV3ogslqbmAO1mcEk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:4426:0:b0:544:5aa0:e212 with SMTP id
 r38-20020a814426000000b005445aa0e212mr87638ywa.6.1679611851706; Thu, 23 Mar
 2023 15:50:51 -0700 (PDT)
Date: Thu, 23 Mar 2023 15:50:28 -0700
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230126184025.2294823-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <167934082066.1939558.14724526021018063522.b4-ty@google.com>
Subject: Re: [PATCH v2 0/7] KVM: Add a common API for range-based TLB invalidation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_155056_584828_B5575BF1 
X-CRM114-Status: GOOD (  10.09  )
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

On Thu, 26 Jan 2023 10:40:18 -0800, David Matlack wrote:
> This series introduces a common API for performing range-based TLB
> invalidation. This is then used to supplant
> kvm_arch_flush_remote_tlbs_memslot() and pave the way for two other
> patch series:
> 
> 1. https://lore.kernel.org/kvm/20230109215347.3119271-1-rananta@google.com/
> 
> [...]

Applied the x86 specific cleanups to kvm-x86 mmu.  They're good changes on their
own, I'm quite confident that this series a whole won't be going into 6.4, and I
suspect/hope that getting these into 6.4 will make David's life easier (there are
more cleanups in the related x86 code that I want to get into 6.4).  David, if
I'm wrong, you'll have plenty of time to think of an appropriate punishment ;-)

[3/7] KVM: x86/mmu: Collapse kvm_flush_remote_tlbs_with_{range,address}() together
      https://github.com/kvm-x86/linux/commit/28e4b4597d65
[4/7] KVM: x86/mmu: Rename kvm_flush_remote_tlbs_with_address()
      https://github.com/kvm-x86/linux/commit/8c63e8c21765
[5/7] KVM: x86/MMU: Use gfn_t in kvm_flush_remote_tlbs_range()
      https://github.com/kvm-x86/linux/commit/9d4655da1a4c

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
