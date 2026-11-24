Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65850606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m688YUJY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TZIN3QVy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tXYSgKvRkTD1M4hMSH11apHLBFy6m/yt3TCz8Cp2RZo=; b=m688YUJYOvggAmzhB3UQKitHAx
	WNJfg/NAHQJ3xvvY8revCRSJaDULOGY7GPtUTQ28ScJf7yNetR5Zlz1KryXNiE/zoYTmZFAO5MeqU
	5tYzsCt3BEYTu3use+x4HjppMLG4bcX408AsaFhLL1lQ8NjMN5hCxnoKMKt6rodl4uKAeSjuEZy3F
	aNAC1NPHKNRPU+GV76kiaQQW9MpP360JI5C20dH7o9G9SNDTrmZ4Y846/JDpy0+V8anm4FxSKlTaD
	WlYHghI1x6G4FVj8yQGaHS0h/2hQk8C2Xl3V6bysbiTd002fMeTEFCaWgSpKdkc2PlPYZCPGZjwZM
	qzfbwpkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSe-00000005gVI-0OOJ;
	Tue, 24 Nov 2026 06:57:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkSY-00000005gTI-3m5C
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 06:57:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2f0634667aaso13171905ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 22:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503417; x=1796108217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=;
        b=TZIN3QVy8iHjbii9ekUAVMTN+/iER/RGsI1gSzYu6WBT0snppSF96jnGZfh50fTt9d
         /MxFtxUHzXskHjK9NVbnWn3af4GC3S0+UB2k8HP+XZIy41NZ5iGLUiudUZmpdtgw92i3
         boBwk3Pu6LAIC9/79E41hIX4Tb0m4irROLS/px0vGuBATXpA9PMhayAXcTiqme/dPhQQ
         XnOAB76mR8Hr6i5mWbFtLMDP8qN+CFUMj0r+WGMFqhRhY+IHpdyn6xiXRlmLqnme3DES
         sbyRDASJMzgCMOxaxPSywoCvcUthqOUEOVOc2kdznJB0E1fshq77lsob2BlGGSRCGeqh
         Rnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503417; x=1796108217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0p+z8V7ioNXKJBlEmlxyaewpcaFtJJtS6Wmykgz/hUU=;
        b=IKqMfThL15d6gWNf44Xc/WN34wIW6EStDf85GSLREKGHDQaUbpNRHOINHVC8Hz3E0g
         /v+c8zSnc4DyFUw8pdGOLPmjqShWwtygyfs4dJRo2C9L6muy5ri2/G6NXBgPPvvJXCMM
         ga7mYscy4dJ08YO2jrg3O0EzDDjjPLdU/5EtrDLUAEWolOvzISiDZdLdX0wDmJaE/vnm
         gD/KsCGQOzvsPGG2thGGB2MGPNrGe0Tw3RoxUcGfN0ZKQuAlbm4HArLmjwOZp9hwoVrU
         qK9r9ma1im1fJKKxQCplMVcIujpoF4dkfrwwYrhiDo/WMQFWYPNJDDFkr8w2kXxEeY6j
         racg==
X-Forwarded-Encrypted: i=1; AL+hErG6oPTy/leovRC2U0+hyQ17GO8G6eL1w2shxpuy8Dt9Vk3BnUkypJR6qAvBshigYpKqWXQ2aza+lkLQDg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8MtADtlCIUEuBqZby1DO0PXourIRgPha8VpkyR5FPYYAU2CL8V
	ob6ft+T6LG+ySwf1mZ7j5xeNIvCPttn1jIe0SDisvQgO/i+yn935f0+e
X-Gm-Gg: AZFdTZcyQLxSJAQJUTLZAlLOyBvoE/Ihn2Q+V86NwQknJ+B02lB1liLzoxXVErkgl8H
	6s/YtuKSNABsV7EvpM0ARE71E1bDvA/N+j2RWU3YkEeMI0q0hkvySZY/122y87MTsC6meH4UH52
	OuOh5XeVvMfxLHIB6FbBGVrKUCEOvHn9hJl2JtBKtNx4+2S+2cbodlbrOBiBo8qyjhamftlRetp
	B8DN/a+0f3zBffqGydfxyMD2HLmBkG2fbi0XYSMOOXt3VMFRWcm5fMNSZh74yKcP7yLf3bJzKxd
	zTT6vMZU+dmTLA3Sm5CHTUVhE6yansMJh6IQ6mOEH+PSuE30UZt375wn0OgyigXAQCV6lXAGC2+
	UBXqWT6sk3cNn9ciabNL4gjF9v1BN95W5kJ//mVp96cHAtL3HDat2+6uxFSV/cmySD99oTjp+6i
	YIPS9CFi9TEXO0F3xcqK2FJ0jsFDhJvZSMzPyxL2HizKFWY0PY13oLMr0RaG2EdBaAhA237Sm4V
	XvUVZuiteQrEIumCh5qqNKP8X+MjP7WPGrPLc7TXh9DWKMKsceQVKU2PzuD3KU97pcSYXSXX+FP
	u6R3LlEDl94RaVXDWI9FII9Raoq6T/GJ0w==
X-Received: by 2002:a17:90b:5546:b0:3b4:1e3d:ef99 with SMTP id 98e67ed59e1d1-3b41e3df0aamr9878515a91.56.1795503417481;
        Mon, 23 Nov 2026 22:56:57 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm64966685ad.51.2026.11.23.22.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:56:57 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Tue, 24 Nov 2026 14:56:48 +0800
Message-Id: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_225658_945572_7B085BDE 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The shared cmd_lz4 rule in scripts/Makefile.lib passes -l to the lz4
tool, producing the legacy LZ4 format (magic 0x184C2102).  The only
in-kernel lz4 decompressor, lib/decompress_unlz4, understands exactly
this format, and all of its users - the self-extracting images of
arm, mips, parisc, s390 and x86, and the lz4-compressed initramfs -
keep working through the *_with_size variants and plain cmd_lz4.

arm64 and riscv also build Image.lz4 with the plain cmd_lz4, but a
compressed boot image on these two architectures is not decompressed
by the kernel itself - it is handed to the bootloader.  U-Boot, which
implements this via the 'booti' compressed-kernel path (boot/image.c
image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts the standard
LZ4 frame (magic 0x184D2204) and returns -EPROTONOSUPPORT for
anything else.  U-Boot's own host tooling (binman) likewise emits
standard frames.

So the Image.lz4 targets of both architectures currently produce
images that no mainstream bootloader can decompress.  Fix both by
emitting the standard frame through local rules, leaving the shared
cmd_lz4 untouched for the in-kernel users.

Bootloaders that decompress the legacy format do exist in the wild
(mkbootimg on Android offers a separate lz4_legacy option), but
U-Boot and its tooling only ever supported the standard frame.

Testing:
 - Verified that the lz4 invocation used by the new rules emits the
   standard frame magic (04 22 4d 18) and round-trips with the lz4
   CLI, while the old rule emits the legacy magic (02 21 4c 18).
 - No full kernel build environment was available for either arch
   here; the rule changes are mechanical.  Boot testing on real
   hardware, especially on riscv, would be appreciated.

Related: an arm64 'make install' fix that recognises all compressed
image formats is under review at
https://lore.kernel.org/all/20261119041945.3624785-1-leeonion.muyu@gmail.com/

Ping Li (2):
  arm64: boot: emit standard LZ4 frame for Image.lz4
  riscv: boot: emit standard LZ4 frame for Image.lz4

 arch/arm64/boot/Makefile | 9 ++++++++-
 arch/riscv/boot/Makefile | 9 ++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
