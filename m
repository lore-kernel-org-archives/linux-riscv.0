Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC42DC61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzhwfRt+vXJKi5NK/V0+9rlpQpi5spkI+xsrFUfwhwM=; b=1nYCU0D4tFbI0J
	aOWT5oKamDFndg14nWs5sTxW9YqOFB1INfnHc1kq4GKbUMNGcekks8/6Om5Nu7dHrgOA8eU4288IN
	RXSa7pYRnkddmDddMmwofjsZ9cz6aG3r2Si4AnuhG06Kd8j1kbU7donnN2SFdPrEWoAzMzRnW4brR
	g/MpGHA6uvAuspmFtQ8RYEfXJYSZCxxvqhY6D0vBE1oKYRzCnW/AebdPHPm8Ert8Uf90ocnMfGS6u
	3Yl0PRgwafUn78jaZ8kmQTCseidEX8+usGwvXvwROrzc3rAzaaujjVLfwf5sIfdo3N/c816Ds5k2h
	Pc4x9qjA6Zlsfx+VHpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jmB-001G3l-0n;
	Wed, 22 Nov 2023 09:44:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jm6-001Fx8-2O;
	Wed, 22 Nov 2023 09:44:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2DFF1B81199;
	Wed, 22 Nov 2023 09:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96852C433C8;
	Wed, 22 Nov 2023 09:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646240;
	bh=vd1vSvagODzOx6kbpI7IvwSkS4eBsjmFRyLwRdBrVrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=skgEBYvx/fAYU83PbKMGhZ+jFRWnelXbJMhtlbDO94lZzbLAQu2e6sHPZRgWHd+sx
	 gtvmAgwjSpvlSEQjQzBmlxxsXWS82g6bxtvPaFkQ8pvd5rEGx1NUa6mmsajYrS2HXJ
	 9SUa7yYSQ4By+Yl/Qgm1N6yHb1EuBPq31sojdUVFxdN/L6m2Rc5/En1jfZfcN6fVd0
	 1Hue8SThE2M1637XnM8B3AjO9hFNOP+uQE1W0maFQM8JCIjJ7WlFtq4sCyHcLk/Da8
	 60C8qJmM22SVHPuFPEY+HS4Qp3f7l5E4nEP4L2Ac7hl6Qa7XDz7Xjm83GZP/ILzYcJ
	 5IDYaXeS3YwZg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:19 +0000
Subject: [PATCH v7 09/39] arm64/gcs: Provide put_user_gcs()
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-9-201c483bd775@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vd1vSvagODzOx6kbpI7IvwSkS4eBsjmFRyLwRdBrVrA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXcz9ntfDGYRfW3xISuNKutZJXpSjiIRaViJ0k
 n4sUnukccCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3M/QAKCRAk1otyXVSH
 0N3bB/44FbabVeFeFQXmXvNQGbQr73EvxPiLmtFhVunzGXVexn0MqHJIPQxDC2ugEGWeKqK+7nz
 mHcpRXkSvzsDxa0SVk2G9hz7TrXNC6LMK87Ap6mUxpUx/sl71tnM08rKVQzi+iw4Ye5ZPtSiDWW
 L5diQOrA4wDNpimxkSurVohp7umfjFe/leUGxJGrezbj+MEWgxqb/endM8PgCOg4sdzQBljGFdX
 WMXW9ZlcwjjEOdBjomF3WAbeNIdpvDJQHFW9t9p9cLOLrxovGepwQ/qOzb7pt0bnZZ/ely3LOX/
 7IrP/ur/Ss2aXoZkMeS2okOUMjg3vSIb9e5S9aaS+RcHJC2B
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014403_097465_C2336986 
X-CRM114-Status: GOOD (  11.02  )
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

In order for EL1 to write to an EL0 GCS it must use the GCSSTTR instruction
rather than a normal STTR. Provide a put_user_gcs() which does this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/uaccess.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 22e10e79f56a..e118c3d772c8 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -445,6 +445,24 @@ static inline int gcssttr(unsigned long __user *addr, unsigned long val)
 	return err;
 }
 
+static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
+				int *err)
+{
+	int ret;
+
+	if (!access_ok((char __user *)addr, sizeof(u64))) {
+		*err = -EFAULT;
+		return;
+	}
+
+	uaccess_ttbr0_enable();
+	ret = gcssttr(addr, val);
+	if (ret != 0)
+		*err = ret;
+	uaccess_ttbr0_disable();
+}
+
+
 #endif /* CONFIG_ARM64_GCS */
 
 #endif /* __ASM_UACCESS_H */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
