Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215B6EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 21:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWlc51L0YTU0PQLr07NobYPhXu75enJULMbo4uuwIPw=; b=hKGuSekLTSVlFL
	Ar8PfoR1rPA7Tf8qgc0ZIwJpaNEYkqpU/92GRHgR3fHflUOldrCDNoo3rCx0ShDd+NJSLWGABKT/u
	R5lpMoyasNtomlXtizWgd4X5vhd8NuDyxaUTmWj8WM+w0gUGKxgKnBqtYmGv/WjI5DRgxUCxGHkfM
	oNDXZSwnlyJaPfKENRMj74FqOAHQSA/jHHsxwY5138c8vjloLn5xcea/AkwOjIj2a9FpVVTgcvb6H
	/TjfcmEIzmvG2dnUvFifF59IjVC1JBtKV9Gd9TKXbDnL5pvKZ1Bss6a+GSWOp8IcMLz/4cb9cQORc
	QUkKEbTFlRrfV6Sg2KtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9hc-00FsmI-12;
	Sun, 16 Jul 2023 21:54:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9gS-00Frkp-1R;
	Sun, 16 Jul 2023 21:53:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBE0360EBC;
	Sun, 16 Jul 2023 21:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC2FC43142;
	Sun, 16 Jul 2023 21:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544419;
	bh=BppDdcqjtJzUfuzafP5lgvHCeya4NknqM0BAXJ7ap7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N6Pc2CDP2Fb/CWuUDjX3L2i0ZPs0IpSy9dO8henIB7I6mnpUje22Hdq7vEkPoDu4g
	 xlUhGW7pGAfAaNvDt/AWVxPC9oVQigNpTWBFs3yT8OmZrnurbVB6ZSH47hJ8kJHGps
	 /CKIzVsFqEyOneTsq1XBiXSubk3NPS/GJ53et7TS5RCXk8P8JPg9TJv7ADl3cE+jMR
	 2Lv7yqFwLn763rYXqdfJmftd7l7TfWFXs77BEpS4ZRGT1pc7HfxAL+znSFso1IKx1B
	 OWq8cE8ajUxaBeQT9T5L2qJfdtU3Rk+8gE/R1JgbzSnLYpvSNL/Kk+RDrNFzSoSKjD
	 hOnLbmzUYvqMw==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:51:04 +0100
Subject: [PATCH 08/35] arm64/gcs: Provide copy_to_user_gcs()
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-8-bf567f93bba6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BppDdcqjtJzUfuzafP5lgvHCeya4NknqM0BAXJ7ap7w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktGaVbZOcNR1zm48d/PDpByZZT+P9TDlC/pnz5eN6
 pCwzjnmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmlQAKCRAk1otyXVSH0NbvB/
 wMIKD7ugV+VGhtSx4GuImqrZE4Tt0v3p8oBLZxXnjjkk1AYFsZ51ITwpSRYveuCeKhGKo5TdlPUqq5
 TGV7QEaKfNACSPh5SL7WiaECcFcN2MFP4z0THUL92xm6KgWL8A5oYlnHOIbNrYSp5p+HKE5VzgWCLS
 Bel51HElY2q2sRqHhDjGaBnNawBEB+529JBmGA4cJrZWRzpq1QDAAlDitHTbFgXJqkPHlYS0HrDocs
 7p5w7QGKS/6G7JCZKBJOh6NXwMc697BG+KkqF9GoRnNKL5uLZxWkUHt86kkP+CXzx2r70LhZbSffyb
 gkXMfL//6nmpK2o0vvxfDTXp2gd7H/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145340_682310_8AB241F5 
X-CRM114-Status: GOOD (  16.28  )
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
rather than a normal STTR. Provide a copy_to_user_gcs() which does this.
Since it is not possible to store anything other than a 64 bit value the
interface is presented in terms of 64 bit values, using unsigned long
rather than u64 due to sparse.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/uaccess.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 22e10e79f56a..24aa804e95a7 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -445,6 +445,26 @@ static inline int gcssttr(unsigned long __user *addr, unsigned long val)
 	return err;
 }
 
+static inline int copy_to_user_gcs(unsigned long __user *addr,
+				   unsigned long *val,
+				   int count)
+{
+	int ret = -EFAULT;
+	int i;
+
+	if (access_ok((char __user *)addr, count * sizeof(u64))) {
+		uaccess_ttbr0_enable();
+		for (i = 0; i < count; i++) {
+			ret = gcssttr(addr++, *val++);
+			if (ret != 0)
+				break;
+		}
+		uaccess_ttbr0_disable();
+	}
+
+	return ret;
+}
+
 #endif /* CONFIG_ARM64_GCS */
 
 #endif /* __ASM_UACCESS_H */

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
