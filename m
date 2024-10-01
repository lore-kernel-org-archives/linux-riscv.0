Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9949DCF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOKiV9rtjgMraw+wxYWmVh+YfGuftZJIzWl/dRxbFgA=; b=1VDYAQVRv+BmKW
	T8chrJjnGe7QIHB8fkz2M9OYX3yfeiPwfPvPRZwLJjI1PiFGaHC1UsG8dWe9pY/3wO7gw9FUztDpH
	In+Z2bbVriE+MgkNtpR5QFU6FkggGvxwhCY5KCn+BX7vq8U4lhfQ9OlrX02LtQVemFFevVpYHKHHJ
	q72gth6D49Y+OOszWcPk00GB+w83vRsuaIRygKN99VGX+MtD6V/wjN/dXu41Vf0URxkvvfDGjPEz+
	RdyrMBzMxNwk4gEslNhCd9eNe2ipXeyL0+01kjyTnsSDZ9t81tYDr68Byla/XO+CN4rbtdiiy/Den
	YuGTUhqjoySn6CoDoz1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svluP-00000004Haw-46fU;
	Tue, 01 Oct 2024 23:03:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlqv-00000004G42-2CiJ;
	Tue, 01 Oct 2024 23:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A7E65C5547;
	Tue,  1 Oct 2024 23:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FADC4CECD;
	Tue,  1 Oct 2024 23:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823620;
	bh=E+STpDluPni1qqn1pN34uc0md3Dbr7p50mwxPtfPVv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l96NGn7TPurtYSYyEpu0VnZYlAC2GuD2+RbdqPXib+mqQAeBSqqkmnezOKTnlqVjr
	 HDbSwGS+mgTjMLa07JGqmUfBnR0ypexjQGKJaNBgwajGZwKwRsxdv0AKZ0xRiwe56F
	 Ao8ZG+9U5OS5Ve6nVTGHYWROxrqGeMoeMc71uZS0QrY0VZUEYy5W2+NhFjwXiCtCim
	 +Nct63DmkECUz2AZK7Oiyx9s45YrUR/vEgDrJPLoW4fLqNroyzIth5HIga6UfMOvMe
	 sAugk1xN/dOaAabMo8cz3b3m2WGmTmp5NFmB0lKgERg/V11rLMz3zxPeL1oHAHXyVs
	 XDfHSOswPd4sQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:41 +0100
Subject: [PATCH v13 02/40] mm: Define VM_HIGH_ARCH_6
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-2-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=broonie@kernel.org;
 h=from:subject:message-id; bh=E+STpDluPni1qqn1pN34uc0md3Dbr7p50mwxPtfPVv4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7FqkbqHSry4P1gTmihgOrWZBFx7sDukTznRbrU
 2uCRGoCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+xQAKCRAk1otyXVSH0F4rB/
 9amfpCTqeJr4oMpmSRZ4U6Ditl6XVFokj/OXg+LAKqsq6EhoA3N+8gdc/aS5cnW13+1ac1jZeWXWrg
 hp3oVPQPuVmteub5aFl3SQzh/BKX8YHEq56dKgJA1udA1tiAkKjASjDqBpIkUH0AFjU0kv0u4Xh+ND
 dJfTfnKT0IzpOCcfSpCSGhidKn7KUnuBFjPPmw40/aRUZF069RKTCk0USiZqlY1TSUbe33MhAVt3hr
 nZ3RYPMnOpZs00/ydAeSFTD1hwI9QE9t6Ah0uenxM/o06Cd1v9n2mS9NMPMdLJpFbndB0W4fQmIG0E
 3CMqg/lvoOg4PUH/jEwsL0eXZfDCF9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160021_729820_E376A851 
X-CRM114-Status: GOOD (  11.00  )
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

The addition of protection keys means that on arm64 we now use all of the
currently defined VM_HIGH_ARCH_x bits. In order to allow us to allocate a
new flag for GCS pages define VM_HIGH_ARCH_6.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/linux/mm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ecf63d2b0582..182bad0c55df 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -329,12 +329,14 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
 #define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
 #define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
 #define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
+#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
 #endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
