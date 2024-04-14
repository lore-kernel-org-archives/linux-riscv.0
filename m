Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917C0C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 17:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mMrIZuXxuekXAzP0f0M5D+KyeH1pXdiLdD9eCr7M1fk=; b=oxt3I/yIQ9Z8zA
	hW3IEJOnIDyUesLBjCX/d2hTRo1wMF0gMHLRjCDAMNeS9PoL66HllElL3QppcBWz10XgNgShSx0Dh
	LFRJTrZUANVTfLkNqPc/2aNQCXHZo1L2hfuqhzF1+C/ROi43Ys6ipvQh6fM9iXvVSnmOVipY5SdYD
	jSZWH3HxRd6ECCLgxqRPA6ryuUn7Fjv5P+ptOaeK0Aeho+SBssr/n3gCM1ugZCKGwcmWvsG/ZUYaA
	ICCDCamsHpV2VakdadZ+Vm5gSiMliNc3rf4rh/pZHIzrllAjM4Jydw3TWWCmyJOw+3xOzD8Mb2Z4X
	k1qk28PGrsvLHbtIqRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw3rq-000000061IU-38Yt;
	Sun, 14 Apr 2024 17:42:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw3rn-000000061Ff-3dLw
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 17:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 334A2CE0959;
	Sun, 14 Apr 2024 17:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790A9C072AA;
	Sun, 14 Apr 2024 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713116524;
	bh=8FW+xrlIJHw4Gazro4tzpsbrzXitmG/UKSl2dusUcnM=;
	h=From:To:Cc:Subject:Date:From;
	b=Oh9g1Xmr9/brFwe2Ey7SwaFfQuyI5pFhHnx/glRDIYnuDpG2reshHENaWrJz4cp8+
	 TsaJKekv74BEUxPDHmJ2ri9w8SQZKokuMvxf2y6/nXKdRm93OtMpKDju2OCMOpFMfh
	 r1uGBAxKjP7feV9SoN4drqmxD0uEVuJqg1E0NYXmyixyYTRC0f1qnwUgpB7niqL9Ub
	 jfo+PPQ+rLx/3Km4F8Xdv81gZtjKOZ21vseUoL5MvlDW6f492i9mn5dzyK6wH1rMQm
	 rewJvPGN/xeGOrVKdWescBSbci4Ubns8Teabo2T3QvnpPKrEJg+KxDLVJ0375ogV0P
	 QKFGmz95c3ywA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] kbuild: buildtar: add comments about inconsistent package generation
Date: Mon, 15 Apr 2024 02:41:39 +0900
Message-Id: <20240414174139.3001175-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_104212_438273_3C086662 
X-CRM114-Status: GOOD (  14.87  )
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

scripts/package/buildtar checks some kernel packages, and copies the
first image found. This may potentially produce an inconsistent (and
possibly wrong) package.

For instance, the for-loop for arm64 checks Image.{bz2,gz,lz4,lzma,lzo},
and vmlinuz.efi, then copies the first image found, which might be a
stale image.

When CONFIG_EFI_ZBOOT is enabled in the pristine source tree,
'make ARCH=arm64 tar-pkg' will build and copy vmlinuz.efi. This is the
expected behavior.

If you build the kernel with CONFIG_EFI_ZBOOT, Image.gz will be created,
which will remain in the build directory unless you clean it. Even if
CONFIG_EFI_ZBOOT is turned on later, 'make ARCH=arm64 tar-pkg' will copy
stale Image.gz instead of the latest vmlinuz.efi, as Image.gz takes
precedence over vmlinuz.efi.

In summary, the code "[ -f ... ] && cp" does not consistently produce
the desired outcome.

The other package scripts are deterministic; scripts/package/mkdebian,
for example, chooses a copied kernel image based on CONFIG options.

I removed [ -f ... ] checks from x86, alpha, parisc, and the default
because they have a single kernel image to copy. If it is missing, it
should be an error.

I did not modify the code for mips, arm64, riscv. Instead, I left some
comments. Eventually, someone may fix the code, or at the very least,
it may discourage the copy-pasting of incorrect code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/buildtar | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 72c91a1b832f..ed8d9b496305 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -53,18 +53,24 @@ cp -v -- "${objtree}/vmlinux" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 #
 # Install arch-specific kernel image(s)
 #
+# Note:
+#   mips, arm64, and riscv copy the first image found. This may not produce
+#   the desired outcome because it may pick up a stale file remaining in the
+#   build tree.
+#
 case "${ARCH}" in
 	x86|i386|x86_64)
-		[ -f "${objtree}/arch/x86/boot/bzImage" ] && cp -v -- "${objtree}/arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		cp -v -- "${objtree}/arch/x86/boot/bzImage" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
 	alpha)
-		[ -f "${objtree}/arch/alpha/boot/vmlinux.gz" ] && cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		cp -v -- "${objtree}/arch/alpha/boot/vmlinux.gz" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		;;
 	parisc*)
-		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
+		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
 		[ -f "${objtree}/lifimage" ] && cp -v -- "${objtree}/lifimage" "${tmpdir}/boot/lifimage-${KERNELRELEASE}"
 		;;
 	mips)
+		# Please note the following code may copy a stale file.
 		if [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.bin" ]; then
 			cp -v -- "${objtree}/arch/mips/boot/compressed/vmlinux.bin" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
 		elif [ -f "${objtree}/arch/mips/boot/compressed/vmlinux.ecoff" ]; then
@@ -86,6 +92,7 @@ case "${ARCH}" in
 		fi
 		;;
 	arm64)
+		# Please note the following code may copy a stale file.
 		for i in Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo vmlinuz.efi ; do
 			if [ -f "${objtree}/arch/arm64/boot/${i}" ] ; then
 				cp -v -- "${objtree}/arch/arm64/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
@@ -94,6 +101,7 @@ case "${ARCH}" in
 		done
 		;;
 	riscv)
+		# Please note the following code may copy a stale file.
 		for i in Image.bz2 Image.gz Image; do
 			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
 				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
@@ -102,7 +110,7 @@ case "${ARCH}" in
 		done
 		;;
 	*)
-		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
+		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
 		echo "" >&2
 		echo '** ** **  WARNING  ** ** **' >&2
 		echo "" >&2
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
