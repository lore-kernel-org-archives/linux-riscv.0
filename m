Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E213C606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 01:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N5L0N1Jl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOeEl9X+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A/mT/OfafnooMZF9eQFZ2JCiWoPlLMlLCwWeXzYA2mQ=; b=N5L0N1JlS66ZM77VLwA1xpP0fX
	0viVGQE4SlnlgB5BgrFO1x/zEJ+gVAblvS8JsTp4dnFWKZekw6a1FVHL7ueke+FZ0r+UVC65O5itp
	YixDO4nP3RoC6MZr38LSUgAj0+aDikLGWxhT5VNGWtm0AlCH+uJZzk2qeZOecrxoaV+5/mleGCQ6g
	FkAGIM7KazQCsxLc91rqgUiQc01Ml7yR8ZKsdgOZ2qSJgC5sORgC9LenNvHcKMw+1pzzgBFC7LN0Z
	ogiUoXBACXLGwhqOl/xnaWUgbfdHfsVg1yagwRySDLt7FJJ4USwmzviSKUri6ChQ17nzUg3zxfTuX
	+Zlz2mIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUcC-00000007SsN-3yLa;
	Wed, 18 Nov 2026 01:37:36 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUcA-00000007SrZ-1Hhf
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 01:37:35 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-381f65e4e4bso854133eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 17:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794965853; x=1795570653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9EREMneO4XizL3Clpv5CY8sfTjFH2UvufjSaKqXPZM=;
        b=kOeEl9X+KBzaJPycJplqRZmSXBFm3P3yTaWpKatq0wKya+GWuGnWDezNj78+csof+4
         /NNki8vlYvIj5hge5PQc7ucg9hgyZLqXSgu/0WjSHAqJctrJv9LcZ5vqH00kLmLRPKVb
         Vrw3+NkwAzJwEXNMXJm1QzHb7J2574bv7OEQ4WQvk6IqpxEH95UASJShN+b9IrFzPpUS
         scLDN4Ftg4n8WFxkc/HNuU49H17GLx2EQ76LHINto79sBouTgK7O2OaJC8L4qCvDAazC
         6Xi1yraWd0IoiV9VGDzQedE/zt48b+k+9zEMTqC8pcHg7a7sqkq3jRxTXjXWgmPW3lbG
         HoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794965853; x=1795570653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9EREMneO4XizL3Clpv5CY8sfTjFH2UvufjSaKqXPZM=;
        b=cisWvZ4Y+EUEUINq/SorKKp9agoBmP/UJNlNJAYvTcELDlyBmZajN0zMSlom9Ci+pC
         eqlheouTvK/qC2m0g++0tYde2Ug/CeegA0l3mz747I90R+O7N94m81sBhWodG4JyfIgk
         RreVCv4+FL74yDhxzjyc/rd5eCACGJTHrIY11ADtWZRqElQVn+2SrOLQRbyDGtg+y2OX
         n74YtsRoAybx3Y4XG8ygJYNu2O2ohaR29Igy+2GD99uTute8DEXDac2CRBbRVoHg8Nkz
         T6FNpD4GmLfPYjbXCeBtOZcYExieFOICDSlEWHSj+CA5cJpmC4kGUtz1OsDog7Z5PYzU
         I8ng==
X-Forwarded-Encrypted: i=1; AL+hErHEjnoej5bFZFWCs3WcCDCvO+aTgtaU62iZmsSpHr+ZjSVX0t+MMg0xe3jZogVuyhe1jNQUvtjxWzImqA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/BGenPo6MuusxrTxJyht/GiH4XDuK/HxLBJ/8cV/ktMpB2KgJO
	js5ucv5IT5/c+Jp/kHSPmStiBDUBoNc/PNcn3gKVXdPCAbkWDjYgoMUp
X-Gm-Gg: AZFdTZdxrOKlijYPYgZ24aj4okiEQsJQgRIWxq1V5OxHT4PgVNFarzBW0obOtwD31n/
	r319bBREVsQ0XAyi/QWdlVFq2h4vcJ0FUY5g5TQm7/f5EE+10Kwetupa3hBxzeZZeE9h2jUdzHV
	l4KTB9zNnNNTVWAbfyrlpyGvqF6K0khQ5+3oSjTMO5hNcvdr1ymHr26YudJhyGJNrkut3rZ/PIQ
	Wk0Eu80jdsg+DJJ88JYuyMV9OOqWwCWBM8dDSPpkU0gngd2/omtUBo9xwICHs7cJ/eJp70f9asE
	PvQs5YVjsPgZ8pd04/PW2xamqJxyeCrkAI1S4DCwKGSq/wP5N7LGHJgMD28BPsRvbTTlHGeMEeJ
	W+ghkXrwuzn3Wt0dFmQpJS4zseHSt53NwABi1c113oPkoyeIy/wYe7hVLtqGpCgtbd8iJXpwiE6
	u0ORhwm+E8di4cMfO+S8sd4z4Bf1z7ev6xydnCPbmznyqMuTplXDTiGWHlKsUKD/4xw/Z9XBb0J
	0hcGNZkgu/lh+YfekGDU7rBeWI7DCIVVbIkhjz9/49coDEsC5Eag7QB6DIOs23fmhbUiPN21U14
	dkv+pb0hN3T2MzXQE+Shw8Dc4jO4s35kuPBUU6x3ucQYazw/ceSdEz0SAeWNtHT4uMAlIzd6JTU
	b+VSnQwexFIB5fuD6J07SxVPskFzIlYriQg==
X-Received: by 2002:a05:693c:88d7:20b0:36e:aa5c:7851 with SMTP id 5a478bee46e88-3828141dd08mr1114681eec.27.1794965852612;
        Tue, 17 Nov 2026 17:37:32 -0800 (PST)
Received: from pop-os.tail4adac7.ts.net ([2601:647:4084:777d:b8c6:5c98:d786:f7f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm2171733eec.18.2026.11.17.17.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:37:31 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org,
	Cong Wang <cwang@multikernel.io>
Subject: [PATCH] riscv: kexec_file: Verify the signature of Image files
Date: Tue, 17 Nov 2026 17:37:29 -0800
Message-ID: <20261118013729.576325-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_173734_345216_1B888C83 
X-CRM114-Status: GOOD (  14.91  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Cong Wang <cwang@multikernel.io>

kexec_file_load() on riscv cannot check that the kernel it is given is
trusted. KEXEC_SIG is not selectable, so a kernel that is locked down
has to refuse kexec_file_load() altogether, and there is no way to
restrict it to kernels signed with a trusted key.

With CONFIG_EFI the riscv Image is a PE file, the same as on arm64, and
can carry an Authenticode signature added by tools such as sbsign.
Verify it with kexec_kernel_verify_pe_sig(), as arm64 does, and let
riscv select KEXEC_SIG, KEXEC_SIG_FORCE and KEXEC_IMAGE_VERIFY_SIG.

KEXEC_IMAGE_VERIFY_SIG is no longer specific to arm64, so drop "(ARM)"
from its prompt.

The ELF loader has no signature format, so a vmlinux is rejected
whenever signature verification is enforced.

Tested on QEMU virt with KEXEC_SIG_FORCE=y and a test certificate in
the built-in trusted keyring:

  signed Image                    loads and boots
  unsigned Image                  -ENODATA
  signed Image, one byte flipped  -EKEYREJECTED
  Image signed by an unknown key  -ENOKEY
  vmlinux                         -EKEYREJECTED

This is needed by multikernel, which loads its kernels with kexec_file,
but nothing here depends on it: it applies to any kexec_file_load() user.

Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 arch/riscv/Kconfig              | 12 ++++++++++++
 arch/riscv/kernel/kexec_image.c |  3 +++
 kernel/Kconfig.kexec            |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e7891a2a89da..f47bca71aa35 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1122,6 +1122,18 @@ config ARCH_SELECTS_KEXEC_FILE
 	select HAVE_IMA_KEXEC if IMA
 	select KEXEC_ELF
 
+config ARCH_SUPPORTS_KEXEC_SIG
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_SIG_FORCE
+	def_bool y
+
+config ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
+
+config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
+	def_bool y
+
 config ARCH_SUPPORTS_KEXEC_PURGATORY
 	def_bool ARCH_SUPPORTS_KEXEC_FILE
 
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 963a25f5b55b..b1cec911adc5 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -93,4 +93,7 @@ static void *image_load(struct kimage *image,
 const struct kexec_file_ops image_kexec_ops = {
 	.probe = image_probe,
 	.load = image_load,
+#ifdef CONFIG_KEXEC_IMAGE_VERIFY_SIG
+	.verify_sig = kexec_kernel_verify_pe_sig,
+#endif
 };
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index a97ed9605602..24c28978f21b 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -69,7 +69,7 @@ config KEXEC_SIG_FORCE
 	  the kexec_file_load() syscall.
 
 config KEXEC_IMAGE_VERIFY_SIG
-	bool "Enable Image signature verification support (ARM)"
+	bool "Enable Image signature verification support"
 	default ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
 	depends on ARCH_SUPPORTS_KEXEC_IMAGE_VERIFY_SIG
 	depends on KEXEC_SIG
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
