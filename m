Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D290EC04A94
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 22:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DieKd0OyHNtPk5DXq3yE43DTH3sO2lKL+EwiDgP2F68=; b=E9dNE7mFMQ98E6
	xCfwa9eejcVKR2e6NIE4trH++1UqfPbt7fRtQV+yA9voBc6Y1C/2EjzZO1iN3yLgitihDLVeLuo55
	ji3LmjAecG3T8Nl61Sm5KEDL23fhfHs+i9M6LiTYsp4kh/psOuJvksn+fLyVfAfUFIhelSenVGUp7
	3MVJhovDyRznaDnbfdmSQblvcQz+J3k+t/hENG9JKEx/SmgdhcvCHtmUICd5KRdDGXPtj8LHy/Rqt
	YrKTTaAkTcH4sf6wboZ/FuR0OqG5b3drC80p4dHzE2256PzyEztwRgToBCFOhocZRjTApBlsd6tdW
	zlMf+Pg6WVcHI00EBIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8LH-000sr9-2r;
	Mon, 07 Aug 2023 22:04:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8Kf-000sB1-2T;
	Mon, 07 Aug 2023 22:04:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 11DF5622B7;
	Mon,  7 Aug 2023 22:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2521C433A9;
	Mon,  7 Aug 2023 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691445848;
	bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lv9rtr+EAtd7102Xa76cZT5edbG236PmmRMfJ0OVh9XSwdHdiQDhzAodKIm6h6vRL
	 NdeHOOaW3VjKe4x6bFplgcRucirA65snxMgTKHuaMJTLv4B0DDfwkx1sMx2pSK8oO0
	 2aM3m10IQgkgZWX+lvnqMHISitXUCnEYUGloqvw4yCl+r+w1ulXdoB1lZkYddHbmtv
	 q4wt3WLucdMRrSVRnCJv3xHiCrXZzxoLue+HgZiUTOaMubTpynltGWm9V39FVRVUE5
	 7aXA+eCbY/2l7sEIajG4DCK1yU9XH6gMDwdeTqgBTk9LL1f3LWIlsXsKiGB6G9MZo6
	 3gvRa5H7jjZBA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 07 Aug 2023 23:00:30 +0100
Subject: [PATCH v4 25/36] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20230807-arm64-gcs-v4-25-68cfa37f9069@kernel.org>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
In-Reply-To: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk0WmrSl4chwKr3/R3Gfif9Ncd39ArWvtZPbVutDLW
 JCRoW6mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZNFpqwAKCRAk1otyXVSH0NifB/
 kBQS0LE5LNfugxE9C8D8+xMQF/ddJKgmOJR6SlfCJAWbTlPEYUJ2WICFiC5P5ZO7Mu0dMk1v+UlHnk
 9CpuDpHJq6MISRR5/Q5wcBY/wv/canyD6S+BWS4sQGiuaqOtLiSqAPiaVOupwy50mVhdQsVo2WvHNg
 WhgUOF97GkPLzxHTQK/EE3e6694K4HF1KKPETwaR1mKg+cIH1kH3150ck6WmZqVUnKF0QBoes5+WSU
 f3ejEjNWL3ipnUAM0lvk/Oqbz0RiBsbjxunbVG8LubCbWLB+aDglDoTZUO7tXlGyOLIAfhDD7FSa6t
 yF2AdyawCHd1h5vjTc1KFjQp6WZaLh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_150409_920910_9F4E0623 
X-CRM114-Status: GOOD (  12.90  )
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
 arch/arm64/Kconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2511b30d0f6..b5ef1a698770 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2093,6 +2093,25 @@ config ARM64_EPAN
 	  if the cpu does not implement the feature.
 endmenu # "ARMv8.7 architectural features"
 
+menu "v9.4 architectural features"
+
+config ARM64_GCS
+	bool "Enable support for Guarded Control Stack (GCS)"
+	default y
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
