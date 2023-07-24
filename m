Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A87C04E69
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1djbn8PwUmDrXJBGstRK/9Sf17iCvrT112q8h38lZg=; b=c/3IqrhrxflqlD
	joIUgbWhaTpw+T5TbRpF93anTvD+DgJxgzm3ysma/bBM/kVXBdDb5fmfypNbK6sNq8y/jESzO9Jl6
	Es9cwjndSv4W8YNksdYxoNMsYwdrhFPsjwZKIArJP46HjqTuJMN2+S9VVKjmyaJb+ctW/qWJgWqcs
	7CLr0mDqKF4QnysjSvhjmU9z4PF81sAZ5onaR39Wz00xd0B3uadBJuAvBSMauwARdpblQ+HzW2D8v
	ty/LNDgShrpuRlSfYjRVxkvwH83P3v7IN+koSur6P3rm5bcAzAHMm/C+dyzjwUClIHRJndRdUetWw
	eQK8OeFxbbgAm1O0Vo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNv28-004KWI-0S;
	Mon, 24 Jul 2023 12:51:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNv0g-004JD4-22;
	Mon, 24 Jul 2023 12:50:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07FEC61154;
	Mon, 24 Jul 2023 12:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DD1C433D9;
	Mon, 24 Jul 2023 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202997;
	bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IUoZTFytVGL4xL7IhIxdg1nWec1xqYOM3rC8hP5r7Ed3fjKC6Epo6KgMdnaCGtZRE
	 /1Ia7SCVFhMN7008WtWRIVVIQewdoaH/kLojOC/4B8CeSMYhg/9WvHvzEdZDrdNhM/
	 ZppJfgvJmeUYCboPphugV+Qc4zfN8d7SrKHz4Pgm039wTNQ83NIiKGqlB6w5BrY+lP
	 SS2KPsG6UsSf4E9abb94zbB5S3eFhHqLBXDRN4l1suiGEkxttzaapRbGn+YCasRGel
	 bGdb5JDjalsMIDleYixTH358UfPeKiW43FfZDzuafowTWjq5JJq1F7TpsimiGwZP2b
	 fbtQWo91n0esg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:46:15 +0100
Subject: [PATCH v2 28/35] kselftest/arm64: Add framework support for GCS to
 signal handling tests
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-28-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKw/Lzy9vRLhQ0v13Z2E1an+ZYJFNFtfGDMR5qc
 2iz7nAKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5ysAAKCRAk1otyXVSH0Dv/B/
 9z12rHapBgNvwTFstRW+LvaYq4zIFOeh7QfQsNxWufo6IybVnbM+Hvd0mXm4AjTv/BSluOomrarAEr
 m3sxqGmEoeUCUnwYUab6uGpkjrUOG0c4Vow9UuK4BDQ8IsGg63BT2nP+T+DQEIBN+MzYp4BF6e9yBS
 sqqcXKNecviuKIdE0tlR3/D6YYzJKwPOqJDLOvrrA6DsmD9JDj/p4NQEjt95ikt6ivRQ70L32KKP0D
 /hduQnIfCgJZ3Z+IR33Z2xIrkZUkqbaUXnvXzYMwAGdpajGCshPQve1wb+BzsV4pXBkDDGv2EFXYLv
 KFvvodUxTwYEQrCmkpjw9Sl04yI9WO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054958_792946_8F63AC3D 
X-CRM114-Status: GOOD (  11.50  )
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

Teach the framework about the GCS signal context, avoiding warnings on
the unknown context.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 7 +++++++
 tools/testing/selftests/arm64/signal/testcases/testcases.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.c b/tools/testing/selftests/arm64/signal/testcases/testcases.c
index 9f580b55b388..1cd124732be4 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -209,6 +209,13 @@ bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err)
 			zt = (struct zt_context *)head;
 			new_flags |= ZT_CTX;
 			break;
+		case GCS_MAGIC:
+			if (flags & GCS_CTX)
+				*err = "Multiple GCS_MAGIC";
+			if (head->size != sizeof(struct gcs_context))
+				*err = "Bad size for gcs_context";
+			new_flags |= GCS_CTX;
+			break;
 		case EXTRA_MAGIC:
 			if (flags & EXTRA_CTX)
 				*err = "Multiple EXTRA_MAGIC";
diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.h b/tools/testing/selftests/arm64/signal/testcases/testcases.h
index a08ab0d6207a..9b2599745c29 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.h
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.h
@@ -19,6 +19,7 @@
 #define ZA_CTX		(1 << 2)
 #define EXTRA_CTX	(1 << 3)
 #define ZT_CTX		(1 << 4)
+#define GCS_CTX		(1 << 5)
 
 #define KSFT_BAD_MAGIC	0xdeadbeef
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
