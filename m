Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB004FA3742
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WPgE69BaCRMatzcWDz8X3k6tMGWHVDyPrsRbpIjZ3/Y=; b=B3+pvW9FKq8iCk
	kF6/WlV9V9/cc8thnWZ6YngMebLh12l7yWl/4zwXFK8C8PvJKDyFbxOSamMASqfferTmI6qSfW2y9
	GT7E3ZSY1Z2MSaW8btU7AXGGqZVIeVlE/XxFeYQ4l9WLr5asiexrtFvXNe3GJXrCvOnQn6BZn6gmK
	7PBopNGhXafUScvBF1qiTiVJlsvWFvYNmULJ9eRrxhk2lrJA4yFtzWoPVOj5YQJqxGKdgS75e2J/T
	6Z1nm2uy3ht93f3TPHGA3PL8mg6qv71BCYlmSzx0Eke/OXIlpxCfxK+72tZK15nMDS2qM+97mBGzO
	FviSLBqEocOUFf1sd4NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2YB-00DJSX-2N; Thu, 27 Oct 2022 13:03:59 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2X6-00DIzs-AR
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:02:54 +0000
Received: by mail-wr1-x42f.google.com with SMTP id a14so2055205wru.5
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFH+k2XJwNT2gzLn3EXgmSO3k0pJzhXRptCQnTky+8M=;
        b=b8lCvhAHxaMTre1xi3FNf+j7XrHsPfm+y+fxSiCPx+atq2dyq/VJkBHEMg220o6vpH
         1Uq5lYKECbGLi3ePdEXgeJHTpR9BxsSvZplL/4Ry+aQ5r5LzsLs9fj5DvQlRxVpOyIbe
         hA8S8mc2FhZVXgq36h7X9/DpBYC7kyY/dy1eQfB82Tvf0KaGKi2xdztzB+2G9NN48gnc
         mUlQZbWePzgv1TBwopFUppmzYolYso2jrcnUyEpo6K+Fh3cpfi3hHbBTzBvgXsYb5a2W
         fNw9R+1o6E7I2vlIe+mDXXK50M23z54ezRvmA7Gg8nlIMKA9zAQAtkk2dobgpcXGlWuj
         MULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFH+k2XJwNT2gzLn3EXgmSO3k0pJzhXRptCQnTky+8M=;
        b=41+dPgbLBXRkcYPr3Zke3VBp5kzNCb+7FGc5lixEGZnxdyjF2tTZcY+QVvBc20cxE8
         N6WxNxw6jMiOOzczBGd5+qFW3iPtBz6Ces2aDPWZFZDxiOp9YeYybT2rWWiAJhsKjRGW
         kshNPaRz3ZOzDOjwsMatkee4lbZk/Sctpt+6eeXqixT4ijfU1Mh6zyzScAaCdEaVbCSc
         PTGTLI95vUd10jqgrrzQnH3OCAlx4boXGCxnQQt82yXstlo6hXA5P0Q7xLf8pdab0GgX
         +MV9ovfaBwcmmN+DcIahRhj+kiRqBP4aMJmZvhdjDuoDZAbbqjqVf3UJEoCrFOevZPqk
         BEPg==
X-Gm-Message-State: ACrzQf0e/0LGT26ONyNThSJ3OwaybqxoxzHcdb2wXHkvcbvbi+KRTJgV
	5y7Ixu5m638X61B4drXImx13JevFiDYx6A==
X-Google-Smtp-Source: AMsMyM4sDb16lgxVffusJpM5Z8Z4tB1B7JHYwwq+psv4MrsZC7oSbn16LvJ+QKd6e2q6TUgRw6gGPg==
X-Received: by 2002:a05:6000:18ac:b0:232:c7c1:314f with SMTP id b12-20020a05600018ac00b00232c7c1314fmr30553131wri.109.1666875768954;
        Thu, 27 Oct 2022 06:02:48 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c501100b003b4fdbb6319sm3222651wmr.21.2022.10.27.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:02:48 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 0/9] RISC-V: Apply Zicboz to clear_page and memset
Date: Thu, 27 Oct 2022 15:02:38 +0200
Message-Id: <20221027130247.31634-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060252_411893_26E76A21 
X-CRM114-Status: GOOD (  18.97  )
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

When the Zicboz extension is available we can more rapidly zero naturally
aligned Zicboz block sized chunks of memory. As pages are always page
aligned and are larger than any Zicboz block size will be, then
clear_page() appears to be a good candidate for the extension. While cycle
count and energy consumption should also be considered, we can be pretty
certain that implementing clear_page() with the Zicboz extension is a win
by comparing the new dynamic instruction count with its current count[1].
Doing so we see that the new count is less than half the old count (see
patch4's commit message for more details). Another candidate for the
extension is memset(), but, since memset() isn't just used for zeroing
memory and it accepts arbitrarily aligned addresses and arbitrary sizes,
it's not as obvious if adding support for Zicboz will be an overall win.
In order to make a determination, I've done some analysis and wrote my
conclusions in the bullets below.

* When compiling the kernel without CONFIG_RISCV_ISA_ZICBOZ, memset()
  doesn't change, so that's fine.

* The overhead added to memset() when the Zicboz extension isn't present,
  but CONFIG_RISCV_ISA_ZICBOZ is selected, is 3 jumps to known targets,
  which I believe is fine.

* The overhead added to a memset() invocation which is not zeroing memory
  is 7 instructions, where 3 are branches. This seems fine and,
  furthermore, memset() is almost always invoked to zero memory (99% [2]).

* When memset() is invoked to zero memory, the proposed Zicboz extended
  memset() always has a lower dynamic instruction count than the current
  memset() as long as the input address is Zicboz block aligned and the
  length is >= the block size.

* When memset() is invoked to zero memory, the proposed Zicboz extended
  memset() is always worse for unaligned or too small inputs than the
  current memset(), but it's only at most a few dozen instructions worse.
  I think this is probably fine, especially considering the large majority
  of zeroing invocations are 64 bytes or larger and are aligned to a
  power-of-2 boundary, 64-byte or larger (77% [2]).

[1] I ported the functions under test to userspace and linked them with
    a test program. Then, I ran them under gdb with a script[3] which
    counted instructions by single stepping.

[2] I wrote bpftrace scripts[4] to count memset() invocations to see the
    frequency of it being used to zero memory and have block size aligned
    input addresses with block size or larger lengths. The workload was
    just random desktop stuff including streaming video and compiling.
    While I did run this on my x86 notebook, I still expect the data to
    be representative on RISC-V. Note, x86 has clear_page() so the
    memset() data regarding alignment and size weren't over inflated by
    page zeroing invocations. Grepping also shows the large majority of
    memset() calls are to zero memory (93%).

[3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60
[4] https://gist.github.com/jones-drew/1e860692cf6fc0fb2a82a04c9ce720fe

These patches are based on the following pending series

1. "[PATCH v2 0/3] RISC-V: Ensure Zicbom has a valid block size"
   20221024091309.406906-1-ajones@ventanamicro.com

2. "[PATCH 0/8] riscv: improve boot time isa extensions handling"
   20221006070818.3616-1-jszhang@kernel.org
   Also including the additional patch proposed here
   20221013162038.ehseju2neic2xu5z@kamzik

The patches are also available here
https://github.com/jones-drew/linux/commits/riscv/zicboz

To test over QEMU this branch may be used to enable Zicboz
https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicboz

To test running a KVM guest with Zicboz this kvmtool branch may be used
https://github.com/jones-drew/kvmtool/commits/riscv/zicboz

Thanks,
drew

Andrew Jones (9):
  RISC-V: Factor out body of riscv_init_cbom_blocksize loop
  RISC-V: Add Zicboz detection and block size parsing
  RISC-V: insn-def: Define cbo.zero
  RISC-V: Use Zicboz in clear_page when available
  RISC-V: KVM: Provide UAPI for Zicboz block size
  RISC-V: KVM: Expose Zicboz to the guest
  RISC-V: lib: Improve memset assembler formatting
  RISC-V: lib: Use named labels in memset
  RISC-V: Use Zicboz in memset when available

 arch/riscv/Kconfig                  |  13 ++
 arch/riscv/include/asm/cacheflush.h |   3 +-
 arch/riscv/include/asm/hwcap.h      |   1 +
 arch/riscv/include/asm/insn-def.h   |  50 ++++++
 arch/riscv/include/asm/page.h       |   6 +-
 arch/riscv/include/uapi/asm/kvm.h   |   2 +
 arch/riscv/kernel/cpu.c             |   1 +
 arch/riscv/kernel/cpufeature.c      |  10 ++
 arch/riscv/kernel/setup.c           |   2 +-
 arch/riscv/kvm/vcpu.c               |  11 ++
 arch/riscv/lib/Makefile             |   1 +
 arch/riscv/lib/clear_page.S         |  28 ++++
 arch/riscv/lib/memset.S             | 241 +++++++++++++++++++---------
 arch/riscv/mm/cacheflush.c          |  64 +++++---
 14 files changed, 325 insertions(+), 108 deletions(-)
 create mode 100644 arch/riscv/lib/clear_page.S

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
