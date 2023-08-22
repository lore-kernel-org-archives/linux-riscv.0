Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D641EE49B0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 14:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcQCwayZmc1SwvhWz/H3tMRbaGXe50tqKS+IZ22UrFg=; b=p8HwuR4xZnTZjP
	Z4l3xIzYgGZD/KJxJqWNalHvryMP30Ee3BQCad3NVsQELbw6WmvwU/SqOEPqRr8h89+sNnvvjie9e
	Yg/3yF+cnaonGkTbJFREoyugb0KZc57451xisbfSomOXhMINUT2vsp+VF+GsQAd/sGUmIoZxhCjYK
	rdSwPsQsyEwdbLac5RhggHeTpn/2E4DWS+XNVdmVKCapLaNoJDOe/g4Z2POllLoCxrQCC+vEYF1bx
	j3MJ5VECUmV0oaBtV2IodKSA+UTAKf1jDfSjfLiyedISRG8DOQbPGPEEGdFXOzHzynxltSb41enHj
	oU7ILQiMIf+6Mj+7N4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRzC-00G6X9-0M;
	Tue, 22 Aug 2023 14:03:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRyv-00G6K9-1l;
	Tue, 22 Aug 2023 14:03:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 001AA65772;
	Tue, 22 Aug 2023 14:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D45C433C9;
	Tue, 22 Aug 2023 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692713020;
	bh=k6DV13RSkbr/e436II0jx5LmEFZf9bksk2EmOe6Nllo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MmfJzI/at4bw9DCmBSmMuMKkWI2tgIZTavr5wz82wQsjtwr7Jt5jpyTX/Y2SFcQFW
	 cQqkm1lkDJL3ZyPAfRt17vTwmyIlgyi1yKrzkp71EYfjh3KTAqqsQf20c+ZpXsWJb+
	 SUUeKOKPs8IQzC+88PTilBvGcRGj9H5MmjeGMRZ3UzVL2bsupFq13Bc6d10mTfwwIC
	 IfE04Rpc8O9FJczByP4+UwG77QTRebifYUe0Tkv3GHq5Lg8DCt/KHS0dZC3bXbNotY
	 7SBBi2E3x2COT0pH8V1YehvEpmIfECZXHGSgkVq9HoPh5Qxwfb+h3wYN84+D590msR
	 oeA3wUJE31uDw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Aug 2023 14:56:39 +0100
Subject: [PATCH v5 06/37] arm64/sysreg: Add definitions for architected GCS
 caps
MIME-Version: 1.0
Message-Id: <20230822-arm64-gcs-v5-6-9ef181dd6324@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k6DV13RSkbr/e436II0jx5LmEFZf9bksk2EmOe6Nllo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk5L/0emVUssYxVMpdvy4Gd5xaJ0NcqmBuGJeaPcsx
 6408fA2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZOS/9AAKCRAk1otyXVSH0Ju7B/
 9yc31MAumewhFe2jlP2O/W+ECI5wcdNXu0y8MHvZXGM8kWN+h2n6gGh3tNwVdexQE2d2mWGrW/TmoS
 V2ca0cbs92ACfcj/N4nIZPVJ2hgoAY1oltXeqMqrfkIQz7BHkUNfiu+Gb9Ewq6o/mnjtmPsNXN2Wpg
 Pfn7Cj12s9ABBTZaiqy6RiV1K2ws+xnlY/kW5jiGAVV6CT10msAZmo9vKNDFKuzTX7GWvE9loyR4p6
 28SwnUPqAsFv+HM5wHZddwmrN6d8d7oQksQO9DVhrKbo1x6AFd8sKvhqE/eE3jttsdeyhvCKzx4Cor
 FuiiAAdLO4oBKTfG6ZfuhEoT0h14Ro
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_070341_671490_9806701E 
X-CRM114-Status: GOOD (  10.72  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index b481935e9314..3d7f9b25b8fb 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -730,6 +730,26 @@
 
 #define PIRx_ELx_PERM(idx, perm)	((perm) << ((idx) * 4))
 
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
