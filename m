Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B63EE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKbGSXLy/76KlFHrIPK0uz1kbE6vufVjKVbgKLgZK5k=; b=BH2FIYQolPqCW7
	MTNGO/G0kGxV6sbn/pXwTY+AAFAXorVdYQmAsyuzfE9SicggLzoIrO7RW/OWox0QsigkJrcDcvKSo
	i5SQCQk8FOmWdDGT/DJKUiRvb9fz5k90GFh61NsiKyhAPIKYYDXufLNn9jk8rnTHzomJT5rECRywA
	e6B7T9+foR/K8rGAk9qPay/CWUBbhJuihgsPHTEzNYWhoESes1d6QcAC++0HA+rtwYxJoI/+2QquB
	dKS4C1NZ7WKCt2wZwXA1wESQeWB4/A9fDDNZdZMq1WHTfeTrjEXUZKh3ALb5+QMqAatTEGUPpk23M
	CDuQqiVZOA2lUV8HpR2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRyW-00G66Q-07;
	Tue, 22 Aug 2023 14:03:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRyO-00G63Q-12;
	Tue, 22 Aug 2023 14:03:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B1EF765764;
	Tue, 22 Aug 2023 14:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9638EC433CC;
	Tue, 22 Aug 2023 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692712987;
	bh=pFAvrTvTUMO0xGKH/cMXrv1R9nlyUOOKoHgSKri2XFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qTm9XTGvcYh+Br8eJUAeGbO/I6+6TObGxYTwfAxErZq7Ntyj+r+ZjZ36mVjjS7fby
	 MGJHkozGMXiQgElJ1L/hdHWK5jS6K1IdwfgG9KFB0cPquHiAoreyGmmIaE94d5auZT
	 rjpYop2VCduatHJPECR0bjHwBO9GubtNMy0N/6iGoLAWZEN1/T1a/pZ56+uoTSGifm
	 wnKHoGJpjPpQVFEbG7W8LrY+Y/HsoFR9s1p6c//axRtaZ4h28qBqfFbSfM57TLqGYm
	 bBjhEAgEE4xe1eR1F9baQN7ZtJmG9EQIaDzevsFHbvH7o4lc5g6GpvtWWOhLpiaI8I
	 5jsTDl5jo/oGQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Aug 2023 14:56:34 +0100
Subject: [PATCH v5 01/37] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20230822-arm64-gcs-v5-1-9ef181dd6324@kernel.org>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
In-Reply-To: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
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
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pFAvrTvTUMO0xGKH/cMXrv1R9nlyUOOKoHgSKri2XFo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk5L/wf8ItiVhhsjU1U1pKaopo/uh7rIWP4I7WMtBO
 inLmxduJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZOS/8AAKCRAk1otyXVSH0AV6B/
 9NgV9lhw6oHPGtixcm5V3lAr7z+o9fWsFcBTBXWxSurUlb0XFjc+t7fDH7SvXhVDsM3caWcvDpNysc
 rUzR8kRdWUsc2c9LvqoaTcUMfW7SZ4LidddLAhjU+PCa1JGQoP92n9jN6TStbJ85YIH9l9KVVshmVZ
 XiPc6ANN4NmBzgKj9JGYlITGz4YnTicnXsOeD1e2p0e45JZx9f0hBIkU/lKRzsyIRzwpsY90K00Qz9
 YGG3gusgb5P00L14xVRHrVAbuNMepnYq7a4rPyLGjenQCUiv8inCi9K4DWKE0JohN+V9sSbORNNply
 wIdHzUINXrAPZmj+TfHarlSM6uY9B7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_070308_444165_9056780F 
X-CRM114-Status: GOOD (  13.12  )
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

Currently arch_validate_flags() is written in a very non-extensible
fashion, returning immediately if MTE is not supported and writing the MTE
check as a direct return. Since we will want to add more checks for GCS
refactor the existing code to be more extensible, no functional change
intended.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/mman.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index 5966ee4a6154..c21849ffdd88 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -52,11 +52,17 @@ static inline bool arch_validate_prot(unsigned long prot,
 
 static inline bool arch_validate_flags(unsigned long vm_flags)
 {
-	if (!system_supports_mte())
-		return true;
+	if (system_supports_mte()) {
+		/*
+		 * only allow VM_MTE if VM_MTE_ALLOWED has been set
+		 * previously
+		 */
+		if ((vm_flags & VM_MTE) && !(vm_flags & VM_MTE_ALLOWED))
+			return false;
+	}
+
+	return true;
 
-	/* only allow VM_MTE if VM_MTE_ALLOWED has been set previously */
-	return !(vm_flags & VM_MTE) || (vm_flags & VM_MTE_ALLOWED);
 }
 #define arch_validate_flags(vm_flags) arch_validate_flags(vm_flags)
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
