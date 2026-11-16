Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4686F606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qDdM/hL8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ajWynsXv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=ljqtEsgeoxL2H+KJDiClDRgVHkSiKFOnPZxQCu0DyKE=; b=qDdM/hL888YMjMAaciyd10WTCR
	Xk6zEG3ykWz1ZRqrimB4prDQDv7MBLlzNi2lD1duNg9vgrfoKKbNz8bOUUxtHKAuNl6Goym8nnXWY
	uIY1a+WKFOVCDgAAcmSgIzq2UKvvdiFZBqtPVCOBeBuBpSkMViSoTnEpue0QVNX6nZDNoQoTp0C5a
	nzdYlZTF1EC1MNi0aB/e9OmgqnPR8wWbLSW22zotJuz786DR4YITz3S1tk5KpSpzVXkxR1iSRskki
	dK9LhCE8FCRNjw50YWqBekfUR2eozK5TznuC9ntaykoE5khlY4k1kV3vpyPC33E9uDbahAsWCd8Gr
	rO5Dr6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfz-00000002pH7-0YmJ;
	Mon, 16 Nov 2026 14:27:19 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfu-00000002pDC-1fad
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:17 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4903fc8537aso2347358f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839232; x=1795444032; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqHB2bqFPRhr2sa2L1nGYaDpYxg62blVD/y+oKNndDs=;
        b=ajWynsXv8H0uSu+xI58s2N85D0T2UVauPTImOvkw6qOpNJLkz+MP9cIRt+1nGEH/Ow
         SYIOmuUowBsOFHzI2ZpjvEGe+smc2QU36YbUvZOObppnzlp7Wq6YAQiTwns+CU3zXK7A
         dN4b71td8nHz6FDx7o2UGcl1u/SpJHFQJCWmBfGdudZm3zW7ZTvLyiikQ3tyTE+uWdO6
         +N7cw++mM+/xzw7/nK4LDYRW5rsKDm8dndOGLt4Q1zvK74cjhqDK+KhajqcwjtjolbVp
         /Bt/n9GARZ5o8Q4rd/Ox1ldhTBEKeT94/k2OXHuBOaMt0z6g9v7op/txJQaBYSY7Kr8E
         ngHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839232; x=1795444032;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqHB2bqFPRhr2sa2L1nGYaDpYxg62blVD/y+oKNndDs=;
        b=bC6CGajKajrudBw8xWrhxtIRR9aii5WwMfxUAgKzI9EDRD7TaLOuVqPb4wC4g4hbao
         5CwVDSlIuCfIYa23s5fEfQSlNCmeo3yXVfizsb0y+FqgGikB/L4QHHNRG5zFnphBinwl
         xJaMiH/73da+PZuA6c84Ae8dYiFLATJ8/qWbrzxX/d+ryQ3snTXDyZIA6TKjaPgZotun
         Q8yPKcFBB4EPfdvBpwc+iTxCFJP6GSfWBhvJ3j5aPxCqM/CYAaoM/VQ7zGTR5tCYGfWJ
         X7eIzuzPZOTkiHEXB3YIoRSs1MZKPoPUk08N56m7gR9zwv3y8yQtEMLnTNzhLMYArho4
         2ELg==
X-Forwarded-Encrypted: i=1; AL+hErH3PdCSTi4oLrhuLS1ofighHZmJtkeZKPV3pEEX+CYxoos7jlJZZH6KTeBwncXQ5za2sNrqmijCVxPqoA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+tuDB6TEnKfu9Sx+4NDMNkx+eSAlrQYQQnNMSvib3F5Ay0iQiV
	cMZ8wjNE98SoxzGU5K945UZf4pmYT3Wk3JXshu82le8Ss5tdM0w1at9EkN5DkKhxvlA9N8oiZQ=
	=
X-Received: from wrrz7.prod.google.com ([2002:a5d:44c7:0:b0:499:de0a:f0c0])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4697:b0:492:c53e:2ea8
 with SMTP id ffacd0b85a97d-49c7458620emr17115499f8f.49.1794839231620; Mon, 16
 Nov 2026 06:27:11 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:19 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5815; i=ardb@kernel.org;
 h=from:subject; bh=4h21oJbzpY+BN/Rm4SjBto+DpUA56NZXutkaqN//M8I=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UHfE+Yl3K9tdjnM7qv3X3/Y3o8bm9OVjhrkhc8I7l
 z+Wuva5o5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwk6wQjw8U9/tcXhZy979/0
 Y5/C4daVgblvWiN1bOU0jmzvTFYKiWRkeP3llMaKY5OuXJFo/3ekoKP96aaJnfa3U+tz5Sz25P7 awwcA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-17-ardb+git@google.com>
Subject: [PATCH v3 00/15] efi: Expose loaded image properties via info struct
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062714_462945_A94CED3D 
X-CRM114-Status: GOOD (  19.68  )
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


Ard Biesheuvel (15):
  efi/zboot: arm64: Add missing barrier after cache maintenance
  riscv: Use _stext not _text to denote the start of kernel code
  riscv: Make _text point to the start of the kernel image
  efi/riscv: Rename __init_text_end to __inittext_end like other archs
  efi/libstub: Avoid _end section marker in library code
  efi/libstub: Capture loaded image information in struct efi_image_info
  efi/libstub: Pass kernel entrypoint down to efi_enter_kernel()
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

 arch/arm/boot/compressed/head.S                      |  2 +-
 arch/arm/kernel/efi.c                                | 27 ++++++++
 arch/arm64/boot/Makefile                             |  3 -
 arch/arm64/kernel/efi-header.S                       |  2 +
 arch/arm64/kernel/image-vars.h                       | 14 ----
 arch/loongarch/kernel/efi.c                          | 20 +-----
 arch/loongarch/kernel/head.S                         |  1 +
 arch/loongarch/kernel/image-vars.h                   |  4 --
 arch/riscv/include/asm/sections.h                    |  2 +-
 arch/riscv/kernel/head.S                             |  1 +
 arch/riscv/kernel/image-vars.h                       |  8 ---
 arch/riscv/kernel/setup.c                            |  2 +-
 arch/riscv/kernel/vmlinux.lds.S                      |  6 +-
 drivers/firmware/efi/earlycon.c                      | 16 +----
 drivers/firmware/efi/efi-init.c                      | 24 ++-----
 drivers/firmware/efi/efi.c                           |  5 --
 drivers/firmware/efi/libstub/Makefile                |  3 +-
 drivers/firmware/efi/libstub/Makefile.zboot          | 11 ++-
 drivers/firmware/efi/libstub/arm32-stub.c            | 48 ++++++++++++-
 drivers/firmware/efi/libstub/arm64-stub.c            | 44 ++++++------
 drivers/firmware/efi/libstub/arm64.c                 | 23 ++-----
 drivers/firmware/efi/libstub/efi-stub-entry.c        | 27 ++------
 drivers/firmware/efi/libstub/efi-stub-helper.c       | 15 +++--
 drivers/firmware/efi/libstub/efi-stub.c              | 26 +++++--
 drivers/firmware/efi/libstub/efistub.h               | 71 +++++++++++++++++---
 drivers/firmware/efi/libstub/fdt.c                   |  5 +-
 drivers/firmware/efi/libstub/image_info.S            | 19 ++++++
 drivers/firmware/efi/libstub/kaslr.c                 |  2 +-
 drivers/firmware/efi/libstub/loongarch-stub.c        | 12 +---
 drivers/firmware/efi/libstub/loongarch.c             | 10 +--
 drivers/firmware/efi/libstub/primary_display.c       | 56 ---------------
 drivers/firmware/efi/libstub/riscv-stub.c            | 27 +++-----
 drivers/firmware/efi/libstub/riscv.c                 | 16 +----
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 -
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 -
 drivers/firmware/efi/libstub/zboot.c                 | 28 ++++++--
 drivers/firmware/efi/libstub/zboot.lds               |  6 +-
 include/linux/efi.h                                  |  1 -
 38 files changed, 289 insertions(+), 302 deletions(-)
 create mode 100644 drivers/firmware/efi/libstub/image_info.S
 delete mode 100644 drivers/firmware/efi/libstub/primary_display.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
