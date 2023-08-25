Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B505DC71133
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LjJ1n9yPFUp/T9mhazF0Jrfs3Oeub6WGsrda18kiTGY=; b=EWWnjiEm9gBxvu
	323anDlWJKJe5BCO2687rmNJzhVXyPcRG+nJU5vs+F0tr7bpATe5pmgLN2DjuuJnJ/3BmTZne1HML
	bBtLSCVAxDyZ1PhYvqjv3aIJFGYTnOjdnyMuUfL5WnPqd0nkntMfdbcI8e+r0cgNzOlRUolA3WH52
	cVVb+5bT7lwlCUB4vbPvErHNP3DXNEW5v5onXT/SxA292OFWnJLDF8MIckRpZzXXpVR678wEyPElB
	ve93BYTFvcKGyDAYbGGEcR3TbuWyJauy4GxWPthV8efzRVb/9LM88fHuf0TEzCdoqXugpXrJ/rasW
	yu/lhMYYMVCrpQKpoWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZQ3Q-004Qce-0W;
	Fri, 25 Aug 2023 06:12:20 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3] helo=gandalf.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZQ3L-004QWz-2R;
	Fri, 25 Aug 2023 06:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692943919;
	bh=Cc2wNrVySgQWB1oZUr5oEwkwqvGvweIc8X/OBtG4+Wg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iXSFfKONhaS61Wio3k/V1b70XjLLTQdt8vrEOUswdKDp7oPYD+2VsdrF14uK01p64
	 XXlT9K+fMxudJ8FOKNRLR6XGVcf35t4ZKkoKMI8rzvIHhKUlVXdEuAhvNneqf/3BKB
	 zxIP+l0zO05GipBAPeUhsSs3ZPmmChBaE4wXoIVUixOzyK7TIexFrSpeC7Sl9v0kGz
	 q8BWc/9IsPu+6fJocKU/6khYcBr1rEVzf06tM/e4KaUSImp+IRv5bY+pH9J7IsQG/j
	 dkA4oO/aRIG2l8rjLjajtdwh4qjdqeh8OAtvDnuqzZ5Yrqcq5mhGzx+uYqjvY3iwzJ
	 sDFScRxVAy46g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RX8jp5yZWz4wxR;
	Fri, 25 Aug 2023 16:11:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
In-Reply-To: <20230824223606.never.762-kees@kernel.org>
References: <20230824223606.never.762-kees@kernel.org>
Date: Fri, 25 Aug 2023 16:11:58 +1000
Message-ID: <87a5ufvefl.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_231216_100881_AF2A97B4 
X-CRM114-Status: GOOD (  16.28  )
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

Kees Cook <keescook@chromium.org> writes:
> Doing a "make help" would show only hard-coded Kconfig targets and
> depended on the archhelp target to include ".config" targets. There was
> nothing showing global kernel/configs/ targets. Solve this by walking
> the wildcard list and include them in the output, using the first comment
> line as the help text.
>
> Update all Kconfig fragments to include help text and adjust archhelp
> targets to avoid redundancy.
>
> Adds the following section to "help" target output:
>
> Configuration fragment targets (for enabling various Kconfig items):
>   debug.config         - Debugging for CI systems and finding regressions
>   kvm_guest.config     - Bootable as a KVM guest
>   nopm.config          - Disable Power Management
>   rust.config          - Enable Rust
>   tiny-base.config     - Minimal options for tiny systems
>   tiny.config          - Smallest possible kernel image
>   x86_debug.config     - Debugging options for tip tree testing
>   xen.config           - Bootable as a Xen guest
>   tiny.config          - x86-specific options for a small kernel image
>   xen.config           - x86-specific options for a Xen virtualization guest

I think we need a way to opt some files out.

It's a bit ugly on powerpc because there are so many fragments:

Configuration fragment targets (for enabling various Kconfig items):
  debug.config         - Debugging for CI systems and finding regressions
  kvm_guest.config     - Bootable as a KVM guest
  nopm.config          - Disable Power Management
  rust.config          - Enable Rust
  tiny-base.config     - Minimal options for tiny systems
  tiny.config          - Smallest possible kernel image
  x86_debug.config     - Debugging options for tip tree testing
  xen.config           - Bootable as a Xen guest
  32-bit.config        - Build a 32-bit image
  64-bit.config        - Build a 64-bit image
  85xx-32bit.config    - Build a 32-bit 85xx image
  85xx-64bit.config    - Build a 64-bit 85xx image
  85xx-hw.config       - Base hardware support for 86xx
  85xx-smp.config      - Enable SMP on 85xx
  86xx-hw.config       - Base hardware support for 86xx
  86xx-smp.config      - Enable SMP on 86xx
  altivec.config       - Enable Altivec support
  be.config            - Enable Big Endian mode
  book3s_32.config     - Base support for Book3s
  corenet_base.config  - Base support for corenet
  debug.config         - Enable PowerPC specific debug options
  disable-werror.config - Disable -Werror
  dpaa.config          - Base suppot for DPPA
  fsl-emb-nonhw.config - Non-hardware options common to 85xx and corenet
  guest.config         - PowerPC specific virtualization guest options
  kvm_guest.config     - Bootable as a KVM guest
  le.config            - Enable Little Endian mode
  mpc85xx_base.config  - Base mpc85xxx support
  mpc86xx_base.config  - Base mpc85xxx support
  ppc64le.config       - Enable ppc64le mode
  security.config      - Common security options for PowerPC builds

And some of those are not intended for use with "make foo.config",
they're used internally for generating our "normal" defconfigs and they
don't necessarily work on their own.

Also I'd like to add more fragments in future, to the point where nearly
all our configs are generated by them.

Can we have some way to differentiate fragments that are intended to be
used with "make foo.config" vs just being used internally to generate
other configs.

The obvious thing would be to use a different suffix, eg. "foo.fragment"
for internal use fragments. That would require changing
merge_into_defconfig and merge_into_defconfig_override to not assume the
.config suffix, and update the users in arm, arm64 and powerpc.

The other option would be to ignore .config files starting with eg. "_".

+       @$(foreach c, $(filter-out $(call configfiles,_*.config),$(call configfiles,*.config)), \
+               printf "  %-20s - %s\\n" \
+                       $(shell basename $(c)) \
+                       "$(subst # ,,$(shell grep -m1 '^# ' $(c)))";)

Not sure which is preferable.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
