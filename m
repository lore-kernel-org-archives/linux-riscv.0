Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AACC4828D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1L9tMAVCf0zl4ck7HqyMMxDh8W8wu4Bg9EjT/99dFyg=; b=orU1Z4Jo/fcp9u
	XpJepVPXG1S1HlhiVhmA/ODuFtJP/6Cjt8xHiRL0zRoFrmNdHaGz7suGW7FlkDWyBx+bW3qsoAqF3
	gJfj9WNr+c8T/Ainu7dzKeCxddvkv/YoXQbyskDD9jEEbl3elXaOlUlSCJvGVzhI+QbD86e4xdaom
	Tokmq+qc4D+hjf/PLOJYmtx1dhkkleV1WzkjRYSn/+62Cpia76UQn93Xx6/lmwkRTX0O5zDMbnb5J
	o+u01I5FYSLMgLkQ8MwBtyjCH8YONlhDlRU80DpQQrklflZTePay42DzhdOXM33hRZ+MjbbyHBbRC
	tQ8Id77dVG4ivjzQ+t0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFCx-0000000GKws-1OhF;
	Sat, 03 Feb 2024 12:33:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFCT-0000000GKUj-002y;
	Sat, 03 Feb 2024 12:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KfEVhTOvR2NDwccNnzlCGckXv+scQ1CsuWB1eGX+74c=; b=DbDwLIyypxQf95gK67GdQDl3vO
	b5Tg2Cq2s5G2LH/+ybcHFqKVhOFeztnNgVZ1xNi2HxBVSKYVnZB8noN8Rsad0lI0BoDKZzx9VnF7i
	Um6fxnbeTuieLM7G/Jp65cL/+Y0nAcwj/TqxGhhmNbxHxfmBzNxnMcxF2Zmt9bSvH+uOo+rmkYvwS
	VQcXteYukrBNwQwlWiVU25Cpe5cZyLh0UtoMuq316Yqh0gJjeDWKTAn4nfTKrHpOWOPqa3m65b8eg
	ESmZeWGVlu1TYLWToMo0AZX/pFjJjOtV/vJx561TVntc6GbjGofLaHMwZ2EBjePnwZJo52131fIZN
	tzxRT5lw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFCL-0000000AlZ8-0hCY;
	Sat, 03 Feb 2024 12:32:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7963DCE1F0C;
	Sat,  3 Feb 2024 12:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DADC433F1;
	Sat,  3 Feb 2024 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963556;
	bh=RGzSIrmEW7Jf6evuT6565KZp1tpVwBC25PeiKV/XCIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rr0NlCUfUX2j3myBULSLJPalVM826rFJl0vTY3fYPNIAoGjsaWyYKxtBifaNm6sDv
	 R3k3Z+e3/jgWq5+5PInC1Osi52ku2mCr6D9o1aURAOeLt+R2Zkk5U6R2wCML7xz6zk
	 PG81g8AMxl2rVOrJUNnz2N35u5ho9Xg89aJIJj9OoWN9wFUIZ/qvSjm3ZM8I4h9hFC
	 AbMSyA++bvK+sdEPPG3qzzEnAj62MLnGKSS32CcHHeeK/jUMKkKjE6RdyAZ+tvsviN
	 dDdf/wFFm15nQghsG5q3BA7MRI+OHsHHN8xmcmlC7HDsvlRem/d2ChYl+uIz2gqkTZ
	 rhMiIq5b7EusQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:52 +0000
Subject: [PATCH v8 26/38] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-26-c9fec77673ef@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RGzSIrmEW7Jf6evuT6565KZp1tpVwBC25PeiKV/XCIM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDlwn8OBL1okRa937HDPu7LnBF8+tPg3W5TVRmQ
 TyRiYLiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w5QAKCRAk1otyXVSH0GddB/
 94PnXcnxhx9d3Igx3+8wyrY4sdF5KYIjmDuj3squkXqrrZ2tiirA6Q62mQp8vp+ezqY1jRXa4sYuJ6
 S4br3364VBFwZURGrMoqdURAvnmTRIVSNGGYe6TRIoFURRVmXmsSb1Zx9GeUJE+887P2YThSn1hX4u
 UYhHuNxxIuI+/hGpYdkS35l+885fx4nMPUte+GNr+FvdEa6vqVjtRScIfSuKLmDgZ/N4wSajZL/k1q
 rBPuJY2ifU59ibgG/D9dxZieNsgex3LyQf29V2Ibhl6yWuOIeyY9K15eIuhbvVWh0jnwxw8K8dMwt4
 yP307QaPCE4iW0R2nFKNxCYMzLGxW/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_123242_052925_8B38564C 
X-CRM114-Status: GOOD (  11.57  )
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

Provide a Kconfig option allowing the user to select if GCS support is
built into the kernel.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index aa7c1d435139..e0048e4660cf 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2098,6 +2098,26 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	help
+	  Guarded Control Stack (GCS) provides support for a separate
+	  stack with restricted access which contains only return
+	  addresses.  This can be used to harden against some attacks
+	  by comparing return address used by the program with what is
+	  stored in the GCS, and may also be used to efficiently obtain
+	  the call stack for applications such as profiling.
+
+	  The feature is detected at runtime, and will remain disabled
+	  if the system does not implement the feature.
+
+endmenu # "v9.4 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
