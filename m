Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAB7EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 21:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtUIfKuWjKqm2Af5oaOGF2ElJysHiRWmY9CaatDOhmY=; b=C43H6roH3hCtVd
	ckR/6f5qI52ZT3x+rIjC7UIIcgrAC4VnObNz9Cij6xiGwFxBbNhrHanymWS+O7bDME0eJC/mrQQbU
	qCctrJof39pSjtxThbtcUqbLcqgjpXrGIpg8DLH26v75n3EYyeujoZJ5dliLa8LJaXOEx/t17voal
	V6MdSuNtITK0+XgWIyKkw5S2DUl5EdGoPA/iz+pJZaIQK+YvKXFCXKjtdwHkwC83j3Bt1H6EER1DI
	NFFQ9jGA0BDdUqtqCI+p3nKg7vKz3Dwzp9uK/ssCbGxlGaEwmQ/vYLh1RcbU1gWYGWEV7ImQaX0Rt
	8QOruJkbzXDoYUBUU9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9je-00FuP2-2c;
	Sun, 16 Jul 2023 21:56:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9h6-00FsI6-1o;
	Sun, 16 Jul 2023 21:54:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E21F660EC3;
	Sun, 16 Jul 2023 21:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43320C433C7;
	Sun, 16 Jul 2023 21:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544459;
	bh=i1aix1RgS5IjaF2Iu7kd7fJ3f4OLUgmDQiT+LzoziAY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fvPQBMMWH9k8MbsAJ75YhRiyBnh+6Q0GrlLAJ7eGzs7w/uFOuAIcfnqkOSfP20LmG
	 +HgPumkAowZQjPL8Mx5KEm2Yv5Gc5tgCKV40LLyL82A7kicWtzjL0P+hASzf6159YP
	 Iulj1O//Xgu6j54+YX+tXw65hF2ZTIPYzin7QYB+yIz3xLAN2QnYwBtk6NGoCam9e0
	 VLmLA5z9GeTjpDRa7XLfAd2c2gA4W0PQv08qM0pt0l4oOg+b5nfcuyNjpkyP04haqD
	 zShFhq46QEJd+F2JYS0p4zdPuYHLkCkvrGV+azYKpkAztbbL1d5j94+r/xRApDGly3
	 FIUjvEBoKQGCQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:51:10 +0100
Subject: [PATCH 14/35] arm64: Disable traps for GCS usage at EL0 and EL1
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-14-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
In-Reply-To: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=broonie@kernel.org;
 h=from:subject:message-id; bh=i1aix1RgS5IjaF2Iu7kd7fJ3f4OLUgmDQiT+LzoziAY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktGaaEQ2gp7NUvT3HihHDuCJYw1+FmyE2XJwsCAaM
 X+Nw3PaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmmgAKCRAk1otyXVSH0PMHB/
 9Ai5dAPLpndzrBw51n3UEuG8S1soNZTX9cdiHVHYXTcDMPDxp4WDhfARumAWnIENr0mcN8Fwez24jU
 Oc5FnBr/1k7xbpcbeddwJjm9cHainWKSRb0TIr2RfdXm09pcZBnmv/TUs9BsYK4wE3DVFJLTLVZ9AD
 cg9NUvQYl0RGt/C9ND3wBLLeGB0yPHwzuRXybnqPMon0AXinX7JpIPWueGyJU/YfCxM0o5oTcgUils
 asocd22uXfISjsFVqQPkpyEDJPsreaMqFzy0vuZ9Vd0SF3WKnQ7JZdTbYWKv8bZ70S1jBOQuYxdgHX
 4uARjcF8Rx+0EQFIEqKj+e7wjz0CpS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145420_996523_D09FFB21 
X-CRM114-Status: GOOD (  10.99  )
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

There are fine grained traps for GCS usage at EL0 and EL1, disable them
for the host kernel if we detect GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 8e5ffb58f83e..c941b0dc0418 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -186,6 +186,15 @@
 	orr	x0, x0, #HFGxTR_EL2_nPIR_EL1
 	orr	x0, x0, #HFGxTR_EL2_nPIRE0_EL1
 
+	/* GCS depends on PIE so we don't check it if PIE is absent */
+	mrs_s	x1, SYS_ID_AA64PFR1_EL1
+	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
+	cbz	x1, .Lset_fgt_\@
+
+	/* Disable traps of access to GCS registers at EL0 and EL1 */
+	orr	x0, x0, #HFGxTR_EL2_nGCS_EL1_MASK
+	orr	x0, x0, #HFGxTR_EL2_nGCS_EL0_MASK
+
 .Lset_fgt_\@:
 	msr_s	SYS_HFGRTR_EL2, x0
 	msr_s	SYS_HFGWTR_EL2, x0

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
