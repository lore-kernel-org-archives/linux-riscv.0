Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA8C9830B
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jqH//3JQBXJtZMwaofayAXQmVoZyw0RizXAYux9PiQ=; b=3VzgJhHIHVbZZ3
	theRnbhlYZSqLUVJoLl7cUsb2HmiPpRo+gekf9RCKO/VkXmZ3ZbuT/uAm8L3Id2YHc+iPcuTupRCk
	WI9Y4gdFADEvIrpcBKz24PrpepCjKgIYNLa4TUwVSqd+mGXEIFh9F3UH2RawSy/7tfjjLalzJeeUO
	TAZ2cfi/t0+BmVF0AXT1FfdguYqc/bw1izdXGl7RLggB3wE+ecUfDL1nGfK2wMP3xwC2kLFAUfmAO
	TWyNXkQUxZ7OsUBPsd3HCzfbIkNhBAghJ0CLvf+MGmAeCG17DQxeTPv5F2p2UNyZ7MJMU4gobZslW
	Z/1DSUBD9BiAGylcQMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QdG-000000090B8-184q;
	Wed, 23 Sep 2026 17:19:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QdB-0000000909V-3zno;
	Wed, 23 Sep 2026 17:19:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 92D1740358;
	Wed, 23 Sep 2026 17:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617011F000FF;
	Wed, 23 Sep 2026 17:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790183981;
	bh=SRKYqnyNBmtchL3rolqFIvqHHPLl/9DGnfYhpvyiVi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lW5fEQ4On7/kq8ci+4WOZiJbxQ4c1uyXVR/IK/Q8bH8V0tQbq0gTdTb7tvAqGXL4E
	 DrmGlJWxlLST4ATLMs/N5W+0QSwMrz4sEV+D7bNRXxySn/8uFHPbH6xKy9iq1oUL8C
	 O+s2nWqVl2j7FL3hfnok5PimgWGrLqcVBJI8PfSfzXTegoE33b7ZfBY1quDxzGCc6x
	 lSoK/PE4dm199Zm1Leb1h2VLBA9dX/s4mV+ginjELoUjBwtPOzGT092OKnaU0shGH6
	 z3XGphgdwnBeqUFchtDQ86+kLMR3BTjxSJ01cONmgIzaBAlLRpEnazqYbOYaCceHI9
	 rZ+CTMpkXmDHQ==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Wed, 23 Sep 2026 18:17:55 +0100
Subject: [PATCH v4 06/22] kbuild: only emit vmlinux relocations when
 required
MIME-Version: 1.0
Message-Id: <20260923-build-speedup-v4-6-73128809a4a4@kernel.org>
References: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
In-Reply-To: <20260923-build-speedup-v4-0-73128809a4a4@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, 
 linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Nicolas Schier <n.schier@fritz.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549; i=ljs@kernel.org;
 h=from:subject:message-id; bh=6BzAunaFfBZ7gO2YMPYZ/5W5YNHZJ9BTFNzQOzFfBSA=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLK2cF5SkRSoW5Cvc6Wp9+Gp1xsmO6p13Pho9YVZ5cXuJ
 NVawfXzOkpZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRWmdGhpUsYjMKrP8FSl5Y
 KLNLOW3hZrHWvb0quTFiH2N5JprLSTH8j5Xh1l24aymv1Jq21M/rkt433n4XOVnx1K3zv2tObdR
 +zQkA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

A kernel build consists of more than one linking pass on vmlinux.o and
vmlinux, at minimum two, and with CONFIG_KALLSYMS and BTF enabled on x86-64
for example there are 5 such stages.

For architectures that build their own relocation tables (x86, riscv, mips,
s390), vmlinux is linked with the --emit-relocs parameter specified.

However, this is only required on the final vmlinux link.

Symbol tables of trial links preceding it don't need it because they
already check that System.map matches kallsyms symbols on each build.

GNU ld is slow at emitting relocation tables, so this results in a
reduction in build time.

Whole build, 128-thread Threadripper 9980X, best of N runs:

                                         before   after     delta
                                         -------------------------------
  x86 defconfig, touch mm/vma.c, gcc        9.5s     9.1s    -0.42s (-4%)
  x86 defconfig, clean, gcc                30.1s    29.5s    -0.59s (-2%)
  x86 allmodconfig, touch mm/vma.c, gcc    37.2s    35.8s     -1.4s (-4%)

Note that this has little impact on LLVM ld which performs this operation
more efficiently.

Assisted-by: LLM
Reviewed-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 Makefile                | 3 ++-
 scripts/link-vmlinux.sh | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f6745d723f6d..ab3ba78376f7 100644
--- a/Makefile
+++ b/Makefile
@@ -1265,8 +1265,9 @@ ifdef CONFIG_LD_ORPHAN_WARN
 LDFLAGS_vmlinux += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 endif
 
+# --emit-relocs is added by scripts/link-vmlinux.sh, for the final link only.
 ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
-LDFLAGS_vmlinux	+= --emit-relocs --discard-none
+LDFLAGS_vmlinux	+= --discard-none
 endif
 
 # Align the architecture of userspace programs with the kernel
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 970ca10f8fa9..ed5ff97c0667 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -96,6 +96,11 @@ vmlinux_link()
 		ldflags="${ldflags} ${wl}--strip-debug"
 	fi
 
+	# Only the final link actually requires the relocations.
+	if [ "${output}" = "${VMLINUX}" ] && is_enabled CONFIG_ARCH_VMLINUX_NEEDS_RELOCS; then
+		ldflags="${ldflags} ${wl}--emit-relocs"
+	fi
+
 	if [ -n "${generate_map}" ];  then
 		ldflags="${ldflags} ${wl}-Map=vmlinux.map"
 	fi

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
