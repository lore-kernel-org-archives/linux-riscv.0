Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C16C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+pkID8AytAmKNu+5KCo8Vg92THCsbAFUrcWg3dKw4zM=; b=J574TI2dkpoH17
	xaKaasuUdwzkYHBgDAg5DzMOx4tsrEElXEXOHPv5GR1aar+NZBeYrGUs80llH43Je6BmG6+O72qFB
	4Iitl3lhk4DAF9SzRBKreh34wWoLpOCDJw1WODPxWmS0OjgCWCTgK+N8f60WIqLIj4MhEWDJLmlrF
	cjc1Kc5dVNoGoe3NNI9zOXB1jbzNjLVvaL0yHRLsAc+hVa+4bTe2MJ64LIsiTEen7N6YCgHTpgZ2e
	d4yWKJH7A5mEzyaLshzlQzE7MB/VYvzDonMQ3979xofok9f529tT2E/yNsbE1CsVt0+MdqjknJgQn
	SYmm9HNs+2Phu+QB/O1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVS8-00000005L6A-3HPx;
	Thu, 01 Aug 2024 13:02:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVNn-00000005I9i-2J3f;
	Thu, 01 Aug 2024 12:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D640862890;
	Thu,  1 Aug 2024 12:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4743BC4AF12;
	Thu,  1 Aug 2024 12:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517094;
	bh=9zyM2kDwaHrPoIdC+tOITu/EBfLF+6/APyyopskSW+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MbNqHBPcT9Y5beIJ6gploRPX48lF/ic8+DFzi6qdc6cvt1vT0gJAFXuZWU/kINSbG
	 w01rYdOQQA70NsmuDwunpJubsh8i49z3114zgqs38oC03JE2Bqoc6n80qPrvENvVII
	 81drmw9RC0wAULSAgtpeMwsJVVFhmHjeXiwAARS7LEA7/G0/xLGStM6i1X36yW9kla
	 DOX+sdvAgON5kBgQ4fl7b16mFYaxAlkwxQdWUoOUlKpWlx2i9A9Jh1XksQdoAltZZH
	 gr93pgYFmS5Q3Kyna7upwfm/6x7XCQYA0Sya8gOelUhPJsMBBrgnSlvAZwD8zwzTBc
	 y0OUMFpqw4uNA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:35 +0100
Subject: [PATCH v10 08/40] arm64/gcs: Provide put_user_gcs()
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-8-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9zyM2kDwaHrPoIdC+tOITu/EBfLF+6/APyyopskSW+Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YMRl/JJcB0rkEcqgIQ8gNudAtrXaRRngscnrbl
 bPqr4syJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGDAAKCRAk1otyXVSH0FzhB/
 9vnbFMIfpN3H8ylPPtfhBn++BSFNylLU467N/+QYoDoXnkw48vtuHXvlXdbhmG/pVEekaIYqr4GbWj
 zTbVXnZdpLmf7S0M6QwCO4+jX59+0EOzOzIMR/69gC1VgZ4ZKDB5QA+Rx/l35VUF7O02mso6fO+HG0
 2qbZzy/7tnkXVbPiyYZnF+OYGE+wK4xseNeRUDCnMYSKpPokJkZ1M86zvEhAkA9L9+nCGNYpPWot+T
 3vcDQ8wwL6TUiu6/gDqeVp38IKPlTX3LZXVQecVANGqtSEzyzf+TT/qE0Fq7ArvcD9PXt2GrcIARrn
 lTxU0WZ6Qu9SZe+Heyb4/hIEo5nDr5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055815_773242_034F570D 
X-CRM114-Status: GOOD (  11.54  )
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
