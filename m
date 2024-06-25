Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA13C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrEyKKDrDJAXMMt/W1vlvp0ikzDpiS881rv4nk28Ack=; b=YFaQIyudQCF7WB
	oamj5WL/HES5gwasAjwB/7cxH+ImrXkNDj5nPD3RStrqMpMpJ/87kvM0DXG/7bVTlNXQMhAP6Zg/f
	frrXIEVBXY9b04GugqXOBK2usIWR1lMpTBdlCf6c5E/6KWSX5HrRZQSBIY7XVTpNL58+unfjuf79b
	pVe6QNH1COCEnmwteQLo77HoCYc4J8d0dskYuc3TjCRLiQHKLtsirxincteUS3w2/tHI+dvuqD414
	RikKqdkDL/K1r5pg0eZjv3TxO/XJ6x7kjm5P0jYOGUA84Q5yKbg39UpcNJ7rVlIFWl+zxHHCBzhhJ
	A/SFekV9Y2+woCisvOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM8pf-00000003eur-16fe;
	Tue, 25 Jun 2024 16:15:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fv-00000003JnJ-0XbJ;
	Tue, 25 Jun 2024 15:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52A246149C;
	Tue, 25 Jun 2024 15:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75909C32786;
	Tue, 25 Jun 2024 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327698;
	bh=SpxTDPkJgZRI3y2Hq1n9QzpjFWZ3Gxi3l59ZtBf4jLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LCKBRIM7P1X1xpvsS4XEya+CU9QncvalN8/HgV0jOcZrtdPH96iZ79e/FfldlYcyQ
	 KG4D/US9JjKXYl6B32tA/WiIsea5bmSRxlZ8rD+s9jRPHVCl2dfCCaNrSUGkPvyfTj
	 f1I5FPA1gSm4owfH/cYTM//+93y5ac9PdpqIsqUC5aI5zL3mgYULmUS10eqDN02DIq
	 s/+fZZEtRgCN8Yu91NoAulTdaszPk2cIrUC+Vub4cZGRGySZQD7qaEf30fZXBDXLWg
	 apjmyGRWF49cRMCO2zvSf9I8skh6/KYYKTNe/c1B4e8lNgRIB89TjkLsb8q6EKyBRI
	 v632mqX63KxEw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:36 +0100
Subject: [PATCH v9 08/39] arm64/gcs: Provide put_user_gcs()
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-8-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
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
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=SpxTDPkJgZRI3y2Hq1n9QzpjFWZ3Gxi3l59ZtBf4jLI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmett4CKl1cP0GjqsEsHZQn+ZUgv8UOnY1gwbJGEPy
 0nF1gWuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbeAAKCRAk1otyXVSH0GTvB/
 4rzP26uQ2jw9FuRsJAqw1gE2ydgI2bc/iKdMxs34w3uUiteyu1KQntu5r5O6S/pDWsDvBv9DBJSjbX
 C3BsRvj08B3YrbhlpjJ8tIwJrzT0vK8lfVijApbbnDEGHfkQ+ktEFeGlNYYxlpcM0Dua+4CplUqp5v
 URfmO1+u9hbBub4a7rjyBrKim/HyioooMWWoj15ZNBrNVzgiZwuDPsq+EFXJ4OTwDXDflKXC4mpytk
 yRKGcwTpLlL/Y5xmDIsOW81n+j6uhypg+JIlOx/pXvC2LYHCcqFjuGdcEZetVcrga5Km8RdHiVztO4
 fEt0Wr4EPbNTgi0mUCzBzWL4XUs9a/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080141_033896_65E2FFDA 
X-CRM114-Status: GOOD (  11.06  )
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
