Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF5606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=akaAG1Mn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OsrcwvAJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=Eq/kTeUDQ1s7gvOhv8qxCVd5KB3Va9AgnKoWJl+Cnxk=; b=akaAG1MnJQkI2FybQ9l7OUrzfn
	cFkT0Xep4mjZwBukCbrIvM9elavypW5KCIgKJI4oGYEdbwJXEWLPmH7BrZ3UaOvlwUhgV3QvWuhKs
	6DQBpgOc2/AirD0VPMX1Os0/hm7U6F5R3Rkp/liUZIdlg9425/OhNd9W+HAA4CMI04cAQ1iaIRjq6
	t4SagFq21gXyeKOpRY1/vpcSue1lJ3T29/UnXL5nwl6OoSJE26t/51BjqJ6ZTYiwiPfszwxjkGW5X
	xzuon/lH8gKJ3smQ++Romw9EkXckeFR4rHBYUEMYcSI9KbLQ6nasUmh045VEdZiiB/JROqlSIvnYL
	IlKBP7oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI1-00000009t8N-1olT;
	Wed, 18 Nov 2026 18:21:49 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkHy-00000009t6E-1S5w
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:48 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a4654add56so10875545e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026103; x=1795630903; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltwMOlHQb7KXQHw1z5VBs+MReZmVIy0Qa1qSs/vHRAk=;
        b=OsrcwvAJcW0gNj/k3CgEiH9uvTjBWqL7+lnOuuinqanoIqSCQZ9JJKERHHyMOfeYn+
         w1dtQ9AKEDRzMt0yumsRl8J3LQxyJ/MBqTox4dlYy6GSttm6j0psJ5BxxxcpxwkeQL2N
         dc0ASJOgZqkmPn1o1IyzQfooq1q31JocCjODIErHgS79+syW4TQC9IOH90CgbRIX3E2s
         3j7TQhptWvn2tZZo2ZHL13u5qv8Se99N8/SmDYMwuRfSJf0dWJkrROa1sv8+8bj9ixqV
         dBR07OppzqbpG1zcYaeT/h3gX2reBnlk2nWTBYQD5NfLjkq4GtHlFGZDnQ/ZiMbfIZQZ
         tSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026103; x=1795630903;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltwMOlHQb7KXQHw1z5VBs+MReZmVIy0Qa1qSs/vHRAk=;
        b=TKemtt3lLnZqZgZJfgnZrD6z1Zyafg0Abbl8c/hnlcXfDrqc2q3F/2r6b3Pqo8U/j5
         WRAumHPY0Yk1rYmlevT5Wg0+tv5Wwe7wmtyg13ilOi3N1ZvTeduPdGctTDHgXggPX5ad
         9aSqlLY+LITy/YqKaRwe9CrlIoTuQg88izGZRbIpW5iWR+uVOZhEE5vHLX4KgTUA72mZ
         76GJIAvB/gmVDVnNRpNv1+vPzFdIu45iHRo7V+SpeVrbhmlt5ulGbsfe6p9P/NYaUvXJ
         +BgSGklcMCxTbjbEa7MpuH6vaecUnOVbCTvgYhEw9gKkGroMGgrcwgpNkQXwtMMVfiQl
         PXwQ==
X-Forwarded-Encrypted: i=1; AL+hErGtjlQlJMkJdxZg4y2Aiorxp6ET89HTGUTCPJnJJERh/evrQmsWTkPwUc6lP3TcTeg+lQcOOjggwplmdQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/FC7l4GfnqolTb0vRGvlQOMmFscKPvkSRkak0wqI1z0gsC2qnx
	Wrf89x2sl3m1Uq0S+8XTlZlMRM5iWhSJjXNKO07qO/F3qa62nicAgw2MVwdUXbbSDTuSFFw3Wg=
	=
X-Received: from wrws4.prod.google.com ([2002:a5d:69c4:0:b0:48e:a88:307b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b99:b0:4ba:6d8:dfad
 with SMTP id 5b1f17b1804b1-4bb7da1aa22mr67684765e9.14.1795026102835; Wed, 18
 Nov 2026 10:21:42 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:06 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6816; i=ardb@kernel.org;
 h=from:subject; bh=ROU61ckYiXxQPdXaEdC2Y85DXEPZDxapPOtwOwcXvJE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm0n3E/PsF5oJSmaZ7zQ7bb12mbfH3ITECuZlP6fs8
 rqX7G/SUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayt53hf3pgxFmdszM57y/e
 kn9woU3P23jXKe295fNV4zvfrnqxpIzhf36HyiuW8xZpxfw58kdKSiYo7tr7RvHDjatuUjax75Z U8gIA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-21-ardb+git@google.com>
Subject: [PATCH v4 00/19] efi: Expose loaded image properties via info struct
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102146_478469_2CCDEB02 
X-CRM114-Status: GOOD (  21.47  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Clean up the arm64 build script and linker hacks that zboot uses to
obtain properties of the loaded image (which it cannot access directly
via a relative reference like the ordinary EFI stub).

Instead, define a generic struct efi_image_info, and expose its offset
in the loaded image in a similar manner, but without relying on explicit
linker script exports.

Populate the struct with section markers that all architecture use for
loading the kernel image at boot, so that all the linker exports can be
dropped for them.

Changes since v3:
- Populate efi_image_info for ARM correctly
- Fix a pre-existing issue in the ARM allocation logic
- Simplify the prototype of handle_kernel_image()
- Pass image_info pointer down to efi_kaslr_relocate_kernel() and
  simplify the callers
- Align RISC-V's __inittext_end correctly so it can be remapped.
- Add some more acks from Jason

Changes since v2:
- Add some additional fixes for RISC-V, which deviates from other
  architectures wrt its section markers. These patches have been sent
  out separately as well [0] as they will likely be taken through the
  RISC-V tree.
- Pass an efi_image_pointer to efi_stub_common() that points to the
  version inside the loaded image, so that its relative references
  accurately describe vmlinux in memory before boot.
- Avoid weak linkage hacks to derive the kernel entrypoint, and instead,
  always use the entrypoint passed via efi_image_info
- Use efi_image_info for sysfb_display_info so that efifb earlycon works
  much earlier on zboot
- Drop changes related to the previous bullet that are now no longer
  needed
- Add acks from Jason

Changes since v1:
- drop arm64 image header changes
- move efi_image_info out of __efistub_ scope so it can access vmlinux
  symbols directly
- implement in a generic manner for all architectures that support zboot
- address Sashiko comments

[0] https://lore.kernel.org/all/20261111164345.4059964-5-ardb+git@google.com/

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Link: https://lore.kernel.org/all/0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/

Ard Biesheuvel (19):
  efi/zboot: arm64: Add missing barrier after cache maintenance
  riscv: Use _stext not _text to denote the start of kernel code
  riscv: Make _text point to the start of the kernel image
  efi/riscv: Rename __init_text_end to __inittext_end like other archs
  efi/libstub: Avoid _end section marker in library code
  efi/libstub: arm: Size the decompressed kernel allocation precisely
  efi/libstub: Avoid reserve_addr/_size in efi_kaslr_relocate_kernel()
  efi/libstub: Capture loaded image information in struct efi_image_info
  efi/libstub: Pass kernel entrypoint down to efi_enter_kernel()
  efi/libstub: arm: Simplify handle_kernel_image()
  efi/libstub: Drop reserve_addr/_size params from handle_kernel_image()
  efi/libstub: arm64: Use struct efi_image_info to access image
    properties
  efi/libstub: loongarch: Use struct efi_image_info to access image
    properties
  efi/libstub: riscv: Use struct efi_image_info to access image
    properties
  efi/libstub: Make efi_remap_image() return efi_status_t
  efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
  efi/libstub: arm64: Drop zboot code_size hack
  efi: Make config table based primary display handover ARM-only again
  Revert "efi: earlycon: Reprobe after parsing config tables"

 arch/arm/boot/compressed/head.S                      |  3 +-
 arch/arm/include/asm/efi.h                           | 15 +---
 arch/arm/kernel/efi.c                                | 27 ++++++
 arch/arm64/boot/Makefile                             |  3 -
 arch/arm64/include/asm/efi.h                         |  2 -
 arch/arm64/kernel/efi-header.S                       |  2 +
 arch/arm64/kernel/image-vars.h                       | 14 ---
 arch/loongarch/kernel/efi.c                          | 20 +----
 arch/loongarch/kernel/head.S                         |  4 +-
 arch/loongarch/kernel/image-vars.h                   |  6 --
 arch/loongarch/kernel/vmlinux.lds.S                  |  1 -
 arch/riscv/include/asm/efi.h                         |  2 -
 arch/riscv/include/asm/sections.h                    |  2 +-
 arch/riscv/kernel/head.S                             |  1 +
 arch/riscv/kernel/image-vars.h                       |  8 --
 arch/riscv/kernel/setup.c                            |  2 +-
 arch/riscv/kernel/vmlinux.lds.S                      |  6 +-
 drivers/firmware/efi/earlycon.c                      | 16 +---
 drivers/firmware/efi/efi-init.c                      | 24 +-----
 drivers/firmware/efi/efi.c                           |  5 --
 drivers/firmware/efi/libstub/Makefile                |  3 +-
 drivers/firmware/efi/libstub/Makefile.zboot          | 11 ++-
 drivers/firmware/efi/libstub/arm32-stub.c            | 90 +++++++++++++++-----
 drivers/firmware/efi/libstub/arm64-stub.c            | 37 ++------
 drivers/firmware/efi/libstub/arm64.c                 | 23 +----
 drivers/firmware/efi/libstub/efi-stub-entry.c        | 33 +------
 drivers/firmware/efi/libstub/efi-stub-helper.c       | 15 ++--
 drivers/firmware/efi/libstub/efi-stub.c              | 26 ++++--
 drivers/firmware/efi/libstub/efistub.h               | 84 +++++++++++++-----
 drivers/firmware/efi/libstub/fdt.c                   |  5 +-
 drivers/firmware/efi/libstub/image_info.S            | 19 +++++
 drivers/firmware/efi/libstub/kaslr.c                 | 45 +++++-----
 drivers/firmware/efi/libstub/loongarch-stub.c        | 21 ++---
 drivers/firmware/efi/libstub/loongarch-stub.h        |  4 -
 drivers/firmware/efi/libstub/loongarch.c             | 11 +--
 drivers/firmware/efi/libstub/primary_display.c       | 56 ------------
 drivers/firmware/efi/libstub/riscv-stub.c            | 29 +------
 drivers/firmware/efi/libstub/riscv.c                 | 16 +---
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 -
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 -
 drivers/firmware/efi/libstub/zboot.c                 | 28 +++++-
 drivers/firmware/efi/libstub/zboot.lds               |  6 +-
 include/linux/efi.h                                  |  1 -
 43 files changed, 324 insertions(+), 406 deletions(-)
 create mode 100644 drivers/firmware/efi/libstub/image_info.S
 delete mode 100644 drivers/firmware/efi/libstub/loongarch-stub.h
 delete mode 100644 drivers/firmware/efi/libstub/primary_display.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
