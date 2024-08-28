Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36E3C7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIgIOqnQOe0Y1VbuqN2CC6AUmzTdn4w2t4B8vLVuuL0=; b=4uFAAXYxMrGyhe
	FHSHE6tlQYJ2aA/u/ab7HXh5kRFErIgSgPJzf9WX9NIpvWRdNU39SpClncA01HpCzLtYu18C/2VyZ
	a5ouBYlcTccgzArg3yHc1nbuxo8Iom8FZQrChJ7HdbWR/wEoFnyK9cQ8hKC/W2ijOTuZpclEOShkQ
	+zTX92Zvgi5HrTblWM1SE1LF2zFjcmBxVgU2bXwxhgIzGBL6VR3+aHKqN0xYZL+jBOWUKLvIsXjBw
	PKojNQjEcwYCnKizt9K4LMjeORW+qpg0DAAvtf5EpRxroDMUhkG5JzKzPLv+uYO3qu6c5PMTsof7Y
	/NWP1sSF4IMGp1Aw8Ksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSDJ-0000000HPMv-0JrK;
	Wed, 28 Aug 2024 23:36:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS6c-0000000HM5I-0rIC;
	Wed, 28 Aug 2024 23:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C8E9A4376E;
	Wed, 28 Aug 2024 23:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 509A0C4CEC5;
	Wed, 28 Aug 2024 23:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887777;
	bh=0WRESyvBFvhlHiGA4Y8lOQoOddezzHHj49JAXCWn5As=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TQCBLNOTt4uPoil78DH70AOWVpIT6LIQ5JGnF8pCl9Kwb2+T2aoH8vA75dLA88j4y
	 KzL26gabHDxytCwlUFatG6fR1Zvr5uTqt2pShr3pPCTMn33PxgrgHv/pPqIxtTLFnQ
	 Ey1twIbnnj5qLHrSSrYYGfsUjFldPiC+SUfCZAAFNmNW+3Xa3o4eriYNIwXnPNhtWI
	 1ohkI3dobfcvnJLKqjUPXbtK1H5vOU58SMjFghxknNoLATb+4juyD5w/c/Ag8Wp2Ci
	 OtqF9pP5xADxmHSkNwnT2wu9pMyM7UgrrXlopqBfP7xPJ5s52DOIQb4ZQoKDa55z6X
	 6aqd4cZGM2Mdg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:25 +0100
Subject: [PATCH v12 09/39] arm64/gcs: Provide put_user_gcs()
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-9-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0WRESyvBFvhlHiGA4Y8lOQoOddezzHHj49JAXCWn5As=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7J/KST71VyjmixMxH0mLOiq0X9OEBGYvS8Br+Qk
 rapbHhCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yfwAKCRAk1otyXVSH0IEyB/
 9dPMuvqOeex4MLAMJJV3WaYG8PgSfjupmm2EgWeN3PodFZUAH1v2ObWF8R8GWSN47b867WTbPrnUK2
 E/z43W2Ch+wVpTSLr0+bF7FvoXBo0Zw+4qi29psoG61NIvksaICvPytuz4veHug8g84QxMfdgBrQJB
 waIKJHxR3e1CluOtD4ERbimgFq6MquNG+8P0BrwkJc8CIWY4jiqKIf2vNmE2qBHtCKZ2jw8/yPZqzU
 UMi4CggPBy3S2pqqaubqBzuXEUqXzrbZc2hnNo2XHtn6LVzbBO0JtSHb03LM2SRFNANo/InJvS0Net
 +SJZZSugc6TOvTjh1Xb/ZHbpGii1jW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_162938_407650_350F1786 
X-CRM114-Status: GOOD (  11.14  )
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

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/uaccess.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 6aba10e38d1c..ecdd47cf1d01 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -522,6 +522,24 @@ static inline int gcssttr(unsigned long __user *addr, unsigned long val)
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
