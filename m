Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAF7606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hewtjEKH;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pIdIpCNx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=VK7zPGZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oKhGeUdzphsZmFZeXDpSjkyr02QO0VFF+QfJYxLP31c=; b=hewtjEKHJ29Zh1ERvdtUZqSk9q
	RTgWXbHRbfCWdfFhY5ahW7Ie/cghLv+yogeQ3Mjq6uP8cjJBjW1f8PLJFxePmwD0L7Vxyn0dAfrha
	DdyCEYYRUqXtP0VnaKtiDA7jVvD9DEwSEIWMr02/uuk32g3jo0hyw9STfsnzs4Nk+MNX2ParQJ4Th
	i2n3F7WJ6fBMEmLcS/SAzIUHlBHf7/UB1BXx9rYzp7EM0qDF6eMTzqpcEN1sRymkXznAsTzK3lqWw
	oLNq+gcu1f/yeYXi1Gpyr4tBmzdbyXXigOKnwmx7hHAfZy0f2HGpp3zyFbZVzUWtBQJNlI6cLLnfi
	4TrLSY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGj-0000000E6DG-3TrU;
	Thu, 22 Oct 2026 12:51:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGi-0000000E6BJ-26fp
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Oct 2026 12:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=; b=pIdIpCNxhngR0sp4XQe1e5cY7v
	tkqxyyNgi9R/jO0iR67LMY66t53i4imtF3O9VzXTX2ky/H1INX/FlULbds/s8HozkP0lHtJPK7blu
	6+u1Cl93tzubh++AQh3cc4+IWa07CfjQpBQf4974fW98N9OK9VPRzp2LE9xkrU3EwTwls6FUgiKnO
	I84f27J8KTPwj6AmEIKp9EItmjuJCtuS2aLTDd5K9c0tzi/Txsoe6Xop1OMP95yCntl8oX6pOL3sy
	ZG8ya91V6R4zvOQ2YSvRLxbYhGKgopH+ZtTR05OImSg6zfCR4g244Io1j5LJV2bg0S5eTAkqJe6f1
	iuIi/OZA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsGe-000000077Nm-02v8
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 12:51:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so21097755e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 05:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792673491; cv=none;
        d=google.com; s=arc-20260327;
        b=JB/Q76KBbHrBlLSrXYLjG9iQfAz+0NnJsZVaoVk4CZIpMqWrh8tzsWsog6IOAXlHJm
         WCKlTy/2CHX9X35eTlwmJPvfeZmD3BSwIFpw98M3V8lcPQxhCjhsuhHBUBY4NhAX78kD
         XfhpJO3rrHwpHTLZvTmA0QqmJ5s4bqvdWVFk3dS/TiiuW2VsxaoE0beW5Xx2UgNovkmb
         Wj8NvgV8Hmb2DKCR8Oy+yiZwr3p9h0kAfUmZgUL6Kjyc88s/WHqfJnp5d6vx62n3/i3g
         h8Gq+tVXEpY2WAK2GPmpyXHsKa5l+d1/wfDlD8dTangSeJIrzc9StkwdVi93CZqo/ron
         Oryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=;
        fh=BzrP09DengfUfd5uEN7zNVqJusVCokpM2WqLw6gFOCs=;
        b=PeItwE3lM31ckNaD47RWmy1Pgq/FCvxScwtXODcdSMSVhuA60lkefiygjHYuLSGFQW
         e4gdD3VgPaYE0wM6+1Z//00AIfX+EuDjyQWjZ3MlQCu7v5+Hav4jtBzC2/mybzVas1H7
         87ZBcx8Z1uexUFgJhEuIYq8e1kkZ8+4a0ZjiV45XkSFbBfpOymfDrPYeDoBYnYfFv6hq
         CJ/AkapkUdcHWxTHH3tPpA09AqPP0KX1ZgKfx5THPX5yEX003egrtepLNMqepI8gDM1C
         jNecr4dQw3w/TYv3RS1j8KPI2J0GwNd1Rf+v+UxpXbILnbgMghQLdI7nSmcIGqX9aK3I
         PdsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792673491; x=1793278291; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=;
        b=VK7zPGZcMs2qvORD9ax2WsidWPTFpM2i6g8uJ/FvpX5VrcMDe+yDvJpKLTvlG9yj2Q
         SW+zs+XQawug4CCsg+9pPKi853RZuSUxvSbRX1VPJXx6kUhvi8InTsr2onUWA0gVv4X3
         H0QOrqLk10b9BX6xV3TYr0othyjDjprqt28xsdhSSY0nkhWeVWVbAbRJawp3goVx9F3T
         qFFgXbZ6FTibVK++XdWNLRG4w/dfQb/WPNORDpN88CTDT0AtWpxNtR/rZ94qAkex0Syc
         xZF0w7ucw0XTkfYR+LvKYrXy9QgIwRqmvr9HtGeCo+975NFjQk0X1B65qeihqaZ/nu3m
         dqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792673491; x=1793278291;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lkhWzDFxqaEySec5iIKN1ckUu+fpCVqgL2+r7zgE9p0=;
        b=ycawF+EESOCHjhH1Yoq6Sh3y1G2beuy37Doo7aDwo85XZAgwb8BRXP4VUFFvXFu+xV
         Fam3dwialSqLp9QOKCbKd0h17CHK42EqQL0pAlwDUe+ymvvj1PrJ+s4jUtOzvlXCqsbK
         mq/7cz88osRKfXMD9AA33f8QfvcmThIHpYGEBdRwcPYiff4dDLeg7zmgl/LdgzLPGJS7
         CLFn71WIdAi2OtuFP3Q7Gs2/kb6e4rf80gXYKItx+nKFiME1BJPRWCxp2MEQhu1zRXhH
         R9rSg79v8IgXZU9SjP0lyO1d42N/BESXidYHQkt/HibaFT9R1srot0Dd/yAScI/OR5j5
         kKqw==
X-Forwarded-Encrypted: i=1; AKwUvBzqN794FkCZCrzMjAy4rBCDCAuSTi5HCPGJhXiltlwQp13Ua1PeApF8YQv4Biwe7OkVH3attVe9ZGzoAA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLkYdorbGvT39LILw/XiI/T3ExmSjThb4mADYqB/TImAJ2kBUa9
	uErKPGxfIv4xftWJwqyljHKinjVYmad09tm15JGc9x9Yuhnc38iKLk2t+Yi+ywYAXg5TJdFLbKe
	CmKj8mYV76EEOFbO8sgRS9WWz4zjx7nIvZmKrwChBYw==
X-Gm-Gg: AYBFou2+P84aSxAooJMVX/q4TYhWsX0swOPF4g/mo2gv1252c632IdVJoCl+Is/h4X0
	/MRkL6FfV00wprlk5fFBYoiMnF9dCFfC4cjtptBw0w6cXYK8a2xQuyZ+XcPgLqEvso+t26KzQsg
	ahzyy1HEPKvZmdbIgQ/uqQhL/BGvS3TCsqe/oiwBtohiGjINh2y8wddNcuiMtAbHmk1eMYSYEbX
	+pupYcXUVV2fQxHB1rAYTiTcTwqNT32xwml3l2uh/hQfKhL0HFhJE8Nou3ytYZRKxhg3+MDQ/1W
	Bf1LlsJSRBdIpEs+08H0Qk/BJ4IUr2TSNoVQykVSFXKHT9nTcK2koLaLydLIGVnDQIXaqm9UETW
	D919S8RG2O3uDG1QqhH4IseeUx8OGD+FzGvSPPoWQuV1nwfOlLC1+CQLktdJGzIM37N+53IxiM5
	rzEJIr7Ff6f7z0Us337huXajAKz+oyr//9WfSdeLYcqz6fjl2wWJO14OI=
X-Received: by 2002:a05:600c:3513:b0:4a1:cedc:ab49 with SMTP id
 5b1f17b1804b1-4a1fdd1e97emr110310385e9.31.1792673491312; Thu, 22 Oct 2026
 05:51:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 18:21:19 +0530
X-Gm-Features: AclHuK8tY4cnQo19_qXz-4M4enDNV7jYzKlMWWGhWHS4NdQgPAJSZrkmDICrIVs
Message-ID: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 7.4
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_135137_219940_DE87CA1E 
X-CRM114-Status: GOOD (  10.27  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Paolo,

I was on vacation last week; hence, I am sending
the KVM RISC-V 7.4 PR a bit late. Apologies for
the inconvenience.

We have the following KVM RISC-V changes for 7.4:
1) Lazy V-extension enablement for KVM selftests
2) Implement KVM_PRE_FAULT_MEMORY ioctl() and enable corresponding KVM selftests
3) Show sepc/scause/stval CSRs in KVM selftests vcpu dump
4) Use a raw lock for IMSIC wakeup state
5) Reject vCPU creation after AIA initialization
6) Updated next branch name in KVM/riscv MAINTAINERS entry
7) Allow Zicclsm, Ziccamoa, Ziccif, Za64rs for KVM guest

In addition to the above, we also have the following fixes
and minor improvements:
1) Avoid redundant interrupt check for pending timers
2) Fix build with vector support disabled
3) Fix IPI delivery for out-of-order vcpu_id
4) Replace imsic switch-case macros with range checks

Please pull.

Regards,
Anup

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-7.4-1

for you to fetch changes up to 633b3931a87438282d6454646ff40c669a6896cb:

  KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs
(2026-10-22 13:01:31 +0530)

----------------------------------------------------------------
KVM/riscv changes for 7.4

- Lazy V-extension enablement for KVM selftests
- Avoid redundant interrupt check for pending timers
- Implement KVM_PRE_FAULT_MEMORY ioctl() and enable corresponding KVM selftests
- Show sepc/scause/stval CSRs in KVM selftests vcpu dump
- Reject vCPU creation after AIA initialization
- Fix build with vector support disabled
- Fix IPI delivery for out-of-order vcpu_id
- Replace imsic switch-case macros with range checks
- Use a raw lock for IMSIC wakeup state
- Reject vCPU creation after AIA initialization
- Updated next branch name in KVM/riscv MAINTAINERS entry
- Allow Zicclsm, Ziccamoa, Ziccif, Za64rs for KVM guest

----------------------------------------------------------------
Andrew Jones (2):
      RISC-V: KVM: Reject vCPU creation after AIA initialization
      RISC-V: KVM: Use a raw lock for IMSIC wakeup state

Heinrich Schuchardt (2):
      RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs in guest
      KVM: riscv: selftest: add Zicclsm, Ziccamoa, Ziccif, Za64rs

Jinyu Tang (4):
      KVM: riscv: Avoid redundant interrupt check for pending timers
      KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
      KVM: selftests: Add RISC-V Sv57 page table indexing
      KVM: selftests: Enable pre_fault_memory_test for RISC-V

Matthias Goergens (1):
      MAINTAINERS: name the kvm-riscv/linux riscv_kvm_next branch

Stefan Butz (1):
      RISC-V: KVM: Don't write MMIO load result to x0

Xiaofeng Yuan (2):
      RISC-V: KVM: Fix IPI delivery for out-of-order vcpu_id
      RISC-V: KVM: Replace imsic switch-case macros with range checks

Yong-Xuan Wang (1):
      KVM: riscv: selftests: Dump sepc/scause/stval on vcpu_arch_dump()

Zhanpeng Zhang (1):
      RISC-V: KVM: Fix build with vector support disabled

jinrui (1):
      KVM: selftests: riscv: Add lazy V extension enablement for guests

 MAINTAINERS                                        |   2 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h           |   6 +-
 arch/riscv/include/uapi/asm/kvm.h                  |   4 +
 arch/riscv/kvm/Kconfig                             |   1 +
 arch/riscv/kvm/aia_imsic.c                         | 149 +++++----------------
 arch/riscv/kvm/gstage.c                            |   6 +-
 arch/riscv/kvm/isa.c                               |   8 ++
 arch/riscv/kvm/mmu.c                               |  42 ++++++
 arch/riscv/kvm/vcpu.c                              |   3 +
 arch/riscv/kvm/vcpu_insn.c                         |   2 +-
 arch/riscv/kvm/vcpu_sbi_replace.c                  |  12 +-
 arch/riscv/kvm/vcpu_timer.c                        |   6 +-
 arch/riscv/kvm/vm.c                                |   1 +
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 .../selftests/kvm/include/riscv/processor.h        |  19 +++
 tools/testing/selftests/kvm/lib/riscv/processor.c  | 109 +++++++++++++--
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |  16 +++
 17 files changed, 246 insertions(+), 141 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
