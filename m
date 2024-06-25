Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E90C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/n3h+f6LzAjzNiwXi+JhXZSzsHkWmqSXgzGNBwBP1Y=; b=nRNiS7jS8R50al
	/RZGoOxnM+vOISslE4qk/BgybGZzOk0IU6RwfngI3DonBQ8he8nr/wbhugIev2oyF1rDepHafslxW
	//CUplW16IWS9sa0iMOX2xauEOPD7XI1UGuoys1IBwrKx9G1QEjD9D9jvm6dUY9FTk6BT9O+BL4/G
	Egy5YCvFPzr8hd5KHjOEiSs/eYkfIYVoI+GtCczHQ5unS6+CwH5mIn8EaUnMcf54EVptpV/Taq/43
	+OstNV6Q+OP9zNXAL6S0e8nBqNo8ml4lFwzUdApRyMo/UaekY4WZ/dOzJd1OJp1A/Sfvc7tEVMzp8
	5pfK+JBNxm6/J6OWuGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7gL-00000003KA9-0hv4;
	Tue, 25 Jun 2024 15:02:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fh-00000003JbX-3adH;
	Tue, 25 Jun 2024 15:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6708661463;
	Tue, 25 Jun 2024 15:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0C7C4AF0C;
	Tue, 25 Jun 2024 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327684;
	bh=OtVuYnhHZ3Ff9iifqi0z8zMYVHFXjow5mOcREWek5jw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tBApK9CrubSeAIcZz7A44caQcV2AMjXOrBWKOAQ3YTROjS6A3B4P8v4DYUloTh3iu
	 L2JunxfQe6hZaIBlEPk9nSW/4o4pQZmJ/DFcV3ws0UAQ2v71qgRnh8O5ROxwbkVS2u
	 Od4fFEhLHznvAgb0qV5QQr4wYTOrgQxeo8iT/UyiHXH2mwQ2Gv2eBlAo0sUKyHa2/H
	 EpnCO7nOAwCEH3PE/YoT1josQRX1DA+TcpWW/DUzAO+2gk4RVwbzuTXJNrK+uZkuae
	 1NtJZFXhf4RCRNResyygODc36rxxsXvch8b78J0So8bQnWcrBWUvDry124M1g2R/jY
	 7LKsbul7AtnxA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:34 +0100
Subject: [PATCH v9 06/39] arm64/sysreg: Add definitions for architected GCS
 caps
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-6-0f634469b8f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OtVuYnhHZ3Ff9iifqi0z8zMYVHFXjow5mOcREWek5jw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmett2xSPtaVh5MhskCkWC9d+Vs/ZeudvczR6T8fnM
 pi3EiCKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbdgAKCRAk1otyXVSH0A6RB/
 9c9lgKwWs8KNFn8y602zbLtUWWDwRky5DJm0wa9ndVkr99Np3G6Sgp0kjHCrAME1Jhs3loF7ZRybJP
 cE8qjsWIDeZ5xnO1Xyk9fkQnHnEnm+mx6iD3x4MjqpDs+Llqis9IJMXZUXdHhR+S5XUJHaNOUmE9d4
 OVBHUXg7rMVfhK+/LBd9eQgwyt+T37LYbSEJE4mDUJL25MGhqGZ/C7KVwXwFLuAD9Ego1WlN6c1Jux
 E69W8dgNbYY5tptjL9vw8zgrp+QLEHvMwCxgPYkTzlK49PHBow+u8sN1eOjKFNvIYEKwHwcmDTHJWI
 ofycDRnMbkf8lWLsyocl3/o+4LmsPY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080126_259377_FC0809B8 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

The architecture defines a format for guarded control stack caps, used
to mark the top of an unused GCS in order to limit the potential for
exploitation via stack switching. Add definitions associated with these.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index af3b206fa423..325a1daa98ed 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1064,6 +1064,26 @@
 #define POE_RXW		UL(0x7)
 #define POE_MASK	UL(0xf)
 
+/*
+ * Definitions for Guarded Control Stack
+ */
+
+#define GCS_CAP_ADDR_MASK		GENMASK(63, 12)
+#define GCS_CAP_ADDR_SHIFT		12
+#define GCS_CAP_ADDR_WIDTH		52
+#define GCS_CAP_ADDR(x)			FIELD_GET(GCS_CAP_ADDR_MASK, x)
+
+#define GCS_CAP_TOKEN_MASK		GENMASK(11, 0)
+#define GCS_CAP_TOKEN_SHIFT		0
+#define GCS_CAP_TOKEN_WIDTH		12
+#define GCS_CAP_TOKEN(x)		FIELD_GET(GCS_CAP_TOKEN_MASK, x)
+
+#define GCS_CAP_VALID_TOKEN		0x1
+#define GCS_CAP_IN_PROGRESS_TOKEN	0x5
+
+#define GCS_CAP(x)	((((unsigned long)x) & GCS_CAP_ADDR_MASK) | \
+					       GCS_CAP_VALID_TOKEN)
+
 #define ARM64_FEATURE_FIELD_BITS	4
 
 /* Defined for compatibility only, do not add new users. */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
