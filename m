Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE71C61DA7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUJPNCfmLdFKHYk1v8Ny7fLCmdZ29tAcfiFx/zgg4aA=; b=uGuybcAQbE7cXY
	lVS0rTSbADA1EmZ+LdZhPoJtgxy3BGSWwz8tmntClpnjykWNjFLb+35PFo6gqZbGFVSV9q2gVTOmv
	vERntvzFxfwc/AIYs9zSc0U6ZHn4eEyPZsWnVDOhrhRB4ee8rv7nM0EdjInnm0Vd+Vx4iDDM/oOv6
	SB8qz0+o2GfGX2D0PNxBFlxNMTmq+1INOWDY1NCFACMTgc+j3cX+3tO7lJTiNbpD4e6mXeHCHCC7/
	FDbGgUk/Xsf9zT6d33pX0Y/RKvULP+CkVQ2L5/BwLrI546DTbjhY4kac58axJZMeYpcG/mYLPSOYj
	GeZ99X1CqfgMXGsKNXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jly-001Fos-1x;
	Wed, 22 Nov 2023 09:43:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jlq-001Fgi-2g;
	Wed, 22 Nov 2023 09:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D868161CD1;
	Wed, 22 Nov 2023 09:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F1AC433C9;
	Wed, 22 Nov 2023 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646225;
	bh=AdenxNKaKLfO1zzZHzslCIJebdi1YPs1wuXZd9U1dO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qs5YB6BECnMAmghk+5k7QLjQ4iTf/O6w9uwKHheCTbxYsU4dCielXXbKpJWvVJbOO
	 eHvstQrw3PY/tc2Itmd0DGJ7a9XLXgveUYEreP0NdC2bZwRKN8Csxmok8dA98yK6jJ
	 pc/VhN++Iddv1n65+uxrwhQVBNX4wTnb4RntXV6p1LG9HjaGajgFeuYEg7d8W2vnS6
	 DsVLe11iXrOgM+nfF8hv0a4E3fBTkDuQgmYeEb5x+merErzYBI1UBOYtqum9DhkAEu
	 iz1H6w7wU93+McmzZK2pTguofmFSA0eW8JcDbFbW+BkqVIf9s/MphpA8RcRNk9/QCg
	 +DKBkAjfQe8QQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:17 +0000
Subject: [PATCH v7 07/39] arm64/sysreg: Add definitions for architected GCS
 caps
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-7-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
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
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AdenxNKaKLfO1zzZHzslCIJebdi1YPs1wuXZd9U1dO4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXcz8bmHxgHWCFRqVN8uz2M3iReNk3BZizcael
 fYUhMZ5DoWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3M/AAKCRAk1otyXVSH
 0F7RB/4ql9JuD5+zDZkKa3IqDccJ/whQ1MzEyDazvd5D9iSOO2uFVWKf/mgBe42Co9F7iJXvawY
 fnM4HLJ+2I6Jpps5E2t0pRb5MPSbFPYrmiDpnpwyH+gCNdD/ISBWGGKi19hQLMzotC2usKxe7n/
 ZPPgZlodquDSXAvzd6yBK/QAT+KqARuuUYjttCxdlJOeU0BHNEbhz8/owbin6JfrC1GTlcGGFai
 aASFR2cqBA+/sxYNdN9NjVEQv2zxSBdFJ+zVZ1qt29sVNQq4+UVEYWYK5MXwadGBn1rZoKRfQA/
 I2UNt33vEzbJko8U/aAkwKFHIOuyMBeaY7xivvSZlmH0QBVz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014347_005002_E028DE30 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

The architecture defines a format for guarded control stack caps, used
to mark the top of an unused GCS in order to limit the potential for
exploitation via stack switching. Add definitions associated with these.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 5e65f51c10d2..75a49b41fa93 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1039,6 +1039,26 @@
 
 #define PIRx_ELx_PERM(idx, perm)	((perm) << ((idx) * 4))
 
+/*
+ * Definitions for Guarded Control Stack
+ */
+
+#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
+#define GCS_CAP_ADDR_SHIFT		12
+#define GCS_CAP_ADDR_WIDTH		52
+#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)
+
+#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
+#define GCS_CAP_TOKEN_SHIFT		0
+#define GCS_CAP_TOKEN_WIDTH		12
+#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)
+
+#define GCS_CAP_VALID_TOKEN		0x1
+#define GCS_CAP_IN_PROGRESS_TOKEN	0x5
+
+#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
+					       GCS_CAP_VALID_TOKEN)
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 /* Defined for compatibility only, do not add new users. */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
