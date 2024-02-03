Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C383BC4828F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+g1HstmjKPRS83Jcz70VxenlJryW4DZRTujdBnx8V0=; b=RKSGCJ+6efriva
	KX4eCKgpcjiZqe511a1oCzCJRqpUzH69mVebKtJ2EBluRW4apDiDr7n8GwAX+nY4pkQPz1SmI4EEI
	/Sr0TtHIYo2lctNLEjvpHG67o/o/2MuWx4fczUV7PTCOjmlGh0/a7p1525MQNiRtKPE/eE2bHGLOA
	JIdZbP9xQE89Bf8sj57Y9m9xgS26sPBay84i2C95UCYOL4Jm2nnQjU1/Wax5DHXGntCwyFA4DxzBS
	Sb1KDuvznPWTf6vemMXPETDKms9E93WBe5cHUZSOFkWALvB2RKbKTcLSmrjg/M3lPVwiKWfsu5ID5
	8jJDRiYwi3NK8X41LL2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF9w-0000000GIVG-1GhC;
	Sat, 03 Feb 2024 12:30:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF9t-0000000GITc-1Frr;
	Sat, 03 Feb 2024 12:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2AA2FCE1EF7;
	Sat,  3 Feb 2024 12:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CBBC43394;
	Sat,  3 Feb 2024 12:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963405;
	bh=39WiY3pJD/byvb21132HZ1FFf2AaFNt9bxr2VNbG8Fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=shZj4zmbEG51YJXT2HR/hbkSqqeTtDXlNZZf7YSTfM8hx53j8LXpmJZLw3Iv82n8T
	 EmsnjZlBS3Whdw84UibP2OywFky27fJU1kV1ZQZrvMHmo5oo6DDxG7Ve+KACATX2av
	 DyY97pWgxe8gwFmEDtgEyjX1bk3f/dH3s4xHFsuiFE52tVb78u03HcN/O2BbuJHAi7
	 KNMQRWaioIbZCcU/WSDqiLZ81LH+jBUTthLazxEBHx9RWs8ibKA/VQQFMjwhktb/Sh
	 61x79dnbtbMxzrMbLJs9q2PhBw/ScBw5eG6rQTZlugcKruZnKQ6rD0cO+jKGPxrzE1
	 jHMBTdnV+2cdA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:34 +0000
Subject: [PATCH v8 08/38] arm64/gcs: Provide put_user_gcs()
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-8-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
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
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=broonie@kernel.org;
 h=from:subject:message-id; bh=39WiY3pJD/byvb21132HZ1FFf2AaFNt9bxr2VNbG8Fw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDXlOhNa5wqLtdcsL9HXNagaPZlUCqhjcNX1c/m
 OGZhZROJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w1wAKCRAk1otyXVSH0GPoB/
 41N6+udhNIKyfclpuplMcjQpE4Medy7BQP1spdA3c3PSHB2nlB6id9g5c3aaDNbOG37yHJfw2ZoUN8
 sgb3yLFVwhS5JnwHUUpsdwrK7jftwR1SlVArLgVwgyqyz9VuVeZ71IXLIBRhx9kDgK412ZYWfDCUag
 cByQrhbCoyfJSbprcOy7eNXWxpd4+C4do+G2udTLpptHhhxMqt/0zB6iOYBYk7SaIIXok1V3v/bKNx
 lQ5mXxZ9LYnsYVcbi9w8SQzJ4VZGzDcECPlEhUS0e2APKEEdGo2EJJ3bjMgkTEPN9C6B03JU9IPhRE
 A/tP1bU7676ZdvRcI96pstycM97i9L
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043009_726533_B21BDE56 
X-CRM114-Status: GOOD (  10.67  )
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
