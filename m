Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C5EE95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWlc51L0YTU0PQLr07NobYPhXu75enJULMbo4uuwIPw=; b=IC2ZXVZ53NENxR
	w6Bp8kIszW2ng+v3XMh32xI46OPksZJw7g5oY8LwdQhFOMW/ZU7odXWRKKH/gNjE4/O2wVG90lLm+
	yLnoH5FfJdmyalsaQNlNtyKhEeV7XFhngV6Ras5QEBRwcYTl3BpbuuXCwtVm8JyfiR2nbFPsckz3T
	sZmvPsfV3yKhO1nmsiRPaPbaXkWmmQIofPRJSO4F6lOcedZzFiCuq6c+a7KkkQychn6SQmoWr9dUz
	w47jBUdBYOx7BI1A1YfkA8ME1KMgv6Uia7vLdyq0ZVlUlHSGYcM+4V8VAIocWFHid7mrXs16O/43o
	Ii2/bBwJTt66fWnkij3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp6v-00AZxn-1r;
	Mon, 09 Oct 2023 12:11:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp6r-00AZsb-0T;
	Mon, 09 Oct 2023 12:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6E232B81135;
	Mon,  9 Oct 2023 12:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8334C433C7;
	Mon,  9 Oct 2023 12:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853499;
	bh=BppDdcqjtJzUfuzafP5lgvHCeya4NknqM0BAXJ7ap7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nRXCf3IP04mxomb59+FPqFvNeFFferKhb4+ll7uI89/W4+e78a9mJLKf6QHmmidyZ
	 7z/5VLjrJo6vvICYH6T3MNNBcCIhgo75AlS8oAhFsH1H5oXIAIVbO2GHLOc9Eql7EU
	 RuYStvvqFpSYuwqfKGoTedCsXt9rmPTpIcWvtooljyquoQ64vzqW8B5Xu4Y9r5G/UA
	 plNxb2NEue4mStms8VLWFaRhrYwe97jxi1zX0PuJQe0xXV6B9IJkAYchVqYB3jLDBd
	 FnewL1JOM+NuyhQP2NYJZGT/0b8pkoa2zX+S21Dg32uCsDkp8n2wdKXEvkGQVMCCsg
	 L0ZVIbqvSMc2Q==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:43 +0100
Subject: [PATCH v6 09/38] arm64/gcs: Provide copy_to_user_gcs()
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-9-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BppDdcqjtJzUfuzafP5lgvHCeya4NknqM0BAXJ7ap7w=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhlTltzOS1pv1T2Ztq80/z91/JcylNk5K+4vYp581J1n+ysaV
 t9R1MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQAT+fyd/Z/uYTmT+1qcLE1xGh8jeb
 hqPLTWviyYlseUlDmfQ9vbuD8gk/Pf1ojqStkZFcHrH2p1lUdbGqcYKC/RsBUN/M64lfmh38OyE3Mr
 EnLz5fQW7Y7fWZa76o6UzRE1HqMlE3ftmxPv+HShlMf7ujvscjo+f28EMz+qyLjo+lnMmW2Hf1PxRM
 1+kw0JjCIbH2lJrN7LpCDYU5O4YsoaGfaQgBU9P7w5r9Y+L89lv7X2k92ETtOEVLf234Esp8UNwgUf
 rpjy6tV++VelIc4+03NYfzsKCYXMmBfmO8H18gE5O3X/jzK6UZsO373dcnPZ0Uczlshf5j62av3F96
 xcV1zy1ynv3fr5hcWvMqn2UsGLAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051141_529297_E660B3F4 
X-CRM114-Status: GOOD (  15.56  )
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
