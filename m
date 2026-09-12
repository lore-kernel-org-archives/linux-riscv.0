Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A62C88E56
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TJvyA2HpOGQRf6EjHwFC+DPVUhHCt7x3KOFciHPOSTs=; b=C01dalJPqPSe5j
	SHYBa80hlFAc27Tph0FLvYD+ihvwGH3Y2LiYFI/zSsYCc7qs/6nz/m0Ov2xni9rsUQ54FJWnzQHD5
	YOu3FIxUAaao8AOpo450sisPyQpjEmJRnlP+odYrlk914grwLl9aGsLDOYK4LY/DgKCVsGdMzKhtm
	vyqGNpduW5r2jUdaEKXoJrtOc14p8D8BkJkCJWyQHXu0ZadHv6LkioHM2trW+YpAIk0yBZyMMXHkH
	e1NLMTtE1Lw+8kIw0LLvVU8Zb8ESJONRHMZuX0dBcOX6BZuVCeAU5KCndmu5cqBsD+c2Y+2mRZDY/
	owjARBx0nXuyjZ7hWImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hhr-00000000dDu-0mn7;
	Sat, 12 Sep 2026 06:59:23 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Hho-00000000dD9-1wRQ
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 06:59:21 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2419124a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 23:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196359; x=1789801159; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPtC1KNwT+749TftCz7aP1Y3qEPtVYfk7lU7EbxfQRo=;
        b=TivApUs74NqYFtCfdaPmLwZ19mD6RD2vahkyc163CaQrnf+1gs8/c3RNgQHqEDOC34
         DJ463vnFQWxJyg2WA4kKpELeQfq/SxBTiGyZv1wqnZaG4Ql9f30IDNMvBkwyL8plVn0F
         IAXIfpA+JHFCThgaiOh4aFpbiIIBd4sawTNA3ySG/8TmTl6gyZ300LfhE25qW7NNt8G7
         C3VRHwK4kTu7IgpTTLvaMvKwEKbx90P6ZHuEO9NPD3HdIlLb0QKQNjvaM4emnqcNGNMc
         6a+DdAIHl/6iX+Fvg7XjY5iHGkz7V/BjDZ1Hep5WN6tc/nRc2sl1KWz1LdGSzYpF1cx2
         sohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196359; x=1789801159;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPtC1KNwT+749TftCz7aP1Y3qEPtVYfk7lU7EbxfQRo=;
        b=Zk/NsFrg4qfQ7d8xl5/7EjSwKafOGwWb64Gbo3iFuPfwJEt8v604XUwkVCJiFddmcR
         XXyyaIweuD0BmbBCL4nYY8oQVLS63QXbC88ktAiE+mUdwlRDElFE8ZNzfpNkg4UWBS0m
         LXhSt7P61VxElk8i+4Us2eeoOO7k6ilc8TDFEQr/1SzSgg8pXRnC796uZSKI780eYiiP
         bgWlqw7xSrZnnvi+ySz5nqILynz1X7twX9UF0DG4rNZSZ1yyyS/63XfwM+1wdIoDfw33
         zQ83C1qDd1Y8W9c+lHvo9JZVz/sS3VAchhqfJaBI97edHEv+g9UiFkfJ4oM3tlCXedup
         vPig==
X-Forwarded-Encrypted: i=1; AKwUvBxjCaDsBIFX6ta208LoLXyAJhFbS1qxoiBC1mtFU2/ve3fuXpQPNiFhBXshgFkJJ84cDHaO89NaXQB+eQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kS6E39xVkAADUXFc+FRCrtOXVcjLQHpz2d4BzTWzIri+0BFB35
	a1sOrp0wqAOnzi2uIC02U84Ji441bCrjLwc8370No6iAHee9H6zk8NnT
X-Gm-Gg: AYBFou0c8dU7AF+s4Zqkc6XWCsfvfaKAnB/+xPzvetF8E0OCflnb/0Wrr/HBYoWKiwn
	N7PpLkIKm0wkTisif5VhrtkCbwEQr7cc2G/STmnsx3inwvw12OicLfd2+0/O8zB30eXUGTVgGi5
	iMkqminXo95nYcbBO1gLsgYpEBGJ51cObrwXu956xckCnAfRu70RD/mFsabLyCkXgejAVHdJh+9
	s9N3C+7z4b65NHib7gp5R97uJTV4gA6wisRsznHjHPxuN2DxbQBqyHgTsZq3V7ZWSRDRD51ZFE1
	/qylOIKukVdDTmS9aKYT+84HjMimTkcZZ3FRPbSfIL5W+vkVqqOy/tjqVc5cwvj78FwgLUkECrr
	GhY9G5DBfvkjdQ9izYP8QOA/o/7W6dfeo8vQXrLVOObOQ4i40CJ2cghgpzFeYAtTc7O34hbg4dH
	+pfb8Uxv4Ti9Cm6YUt+uA22whSCMs6FoNEFo0cmCcU39bL+8cFtn4+dafi5OHmqIpVGWCu5uYcq
	RDICasBSCwgfO8y2SxjD0bqLL9d+wt/KEpEKUlDVQ41Gg==
X-Received: by 2002:a17:90b:2d82:b0:39d:6c95:7e4 with SMTP id 98e67ed59e1d1-39d77d205f7mr15936166a91.31.1789196359477;
        Fri, 11 Sep 2026 23:59:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm10777777c88.8.2026.09.11.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:59:19 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	mkchauras@gmail.com,
	ynorov@nvidia.com,
	ecourtney@nvidia.com,
	joelagnelf@nvidia.com,
	fujita.tomonori@gmail.com,
	linkmauve@linkmauve.fr,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH v4 0/2] powerpc: Add ARCH_WARN_ASM and KUnit tests for Rust WARN() support
Date: Sat, 12 Sep 2026 12:29:00 +0530
Message-ID: <20260912065902.24017-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_235920_509000_8AC92C7A 
X-CRM114-Status: GOOD (  11.99  )
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

powerpc currently has no ARCH_WARN_ASM or ARCH_WARN_REACHABLE definitions,
which causes Rust kernel builds on powerpc to fail with a macro expansion
error when the generic Rust WARN() infrastructure tries to call
ARCH_WARN_ASM() through generated_arch_warn_asm.rs.S. Every other
architecture that supports Rust (x86, arm64, s390, riscv) already provides
these definitions. This series brings powerpc into line.

Patch 1 refactors _EMIT_BUG_ENTRY in arch/powerpc/include/asm/bug.h.
The old macro was a positional-operand template that hardcoded the 1b
label reference and embedded .org/.previous directives, making it
impossible to compose as a free string outside an asm operand context.
The refactored version takes explicit (label, file, line, flags) arguments
via string concatenation; .org/.previous are moved to each call site so
BUG_ENTRY() can continue to pass sizeof(struct bug_entry) as an asm
operand while ARCH_WARN_ASM supplies its own size string. With
_EMIT_BUG_ENTRY composable as a plain string, adding ARCH_WARN_ASM and
ARCH_WARN_REACHABLE is then straightforward.

Patch 2 adds five KUnit tests under CONFIG_RUST_BUG_POWERPC_KUNIT_TEST
(depends on PPC && GENERIC_BUG, covering both ppc32 and ppc64) that
verify the __bug_table entry emitted by ARCH_WARN_ASM is correctly
formed. find_bug() is called with the exact virtual address of the twi
instruction, captured at link time via a .dc.a relocation in a
global_asm! block. .dc.a emits a pointer-width word (4 bytes on ppc32,
8 bytes on ppc64); BUG_KUNIT_TRAP_ADDR is declared as usize on the Rust
side so the same test code is correct on both. The five tests check that
the entry is found, carries BUGFLAG_WARNING, records the right source
file and a non-zero line number, and that the trap address lies in
kernel text.

Changelog:
V3 -> V4:
 - Fix Label with appending b at end 
 - Add KUnit test patch.
 - Tested on ppc64le pseries:
   pass:5 fail:0 skip:0.
 - Tested on ppc32 QEMU mac99 G4:
   pass:5 fail:0 skip:0.
 - Tested on ppc64le QEMU pseries:
   pass:5 fail:0 skip:0.
V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com

V2 -> V3:
 - Add label argument in _EMIT_BUG_ENTRY
V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com

V1 -> V2:
- commit message now has error, fixes tag and closes tag
V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com



Mukesh Kumar Chaurasiya (IBM) (2):
  powerpc/bug: Add ARCH_WARN_ASM and refactor _EMIT_BUG_ENTRY for Rust
    support
  rust: kernel: Add KUnit tests for powerpc ARCH_WARN_ASM bug table
    emission

 arch/powerpc/include/asm/bug.h |  36 ++++---
 rust/kernel/Kconfig.test       |  13 +++
 rust/kernel/bug.rs             | 171 +++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+), 16 deletions(-)

-- 
2.55.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
