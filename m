Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0E8C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpMwRNlDX2jg/0hjIP0RSB+u2A1rkzs/eW2LtIxfF00=; b=LXmcVC0p7vQ3GI
	bhFPz6/fRCAPnfgcw4SUB23XemFtKk2LTjpFXDlVDhy7KILPsB/e5HUSGEGcvo6eosq8i4o7yXhOx
	ZMfD0mocaorZ4rHS2XeEd72zC3ocmAKlCt/lEaqX++jBANVHUESdP9BLJH/zSUqiVBAXR+u2xD/lG
	CNU8zfkeT8SwF+KfHEU1zBid/w8feRNd0VFjC3frYwT4KgoI2GNO0MbwT5q1Vw93b7OjZz18WD47a
	qXllw2Y/FTvfqpnvvyF5edESVVvvirlZrEMYs4UdZBy1h/gGwSpQRBlFa4TsTw2c7gZrfBMIOO6m2
	d93lmI13bxApoiVVOtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVPw-00000005Je9-0VKx;
	Thu, 01 Aug 2024 13:00:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVNN-00000005Htm-4Bc8;
	Thu, 01 Aug 2024 12:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4BDFECE19B6;
	Thu,  1 Aug 2024 12:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB533C4AF09;
	Thu,  1 Aug 2024 12:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517067;
	bh=3RZmbStJwVSGoP/qDNBFqPg5B/6FQNSgda/JKhBv7x0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nM/gS+qrFmEXsCA6RF2Xqdp3hb1CAKq9WGlHmbcwRTXnqJw63mJKa4Kb0O2iVyBX2
	 g+uUNVNRjO5ozwRIafO9FQN/TC2c9YJ54Kgb20htooXIcwdQdv0/WQvAb0B6YZiqwN
	 V6Efuiql/CuGLVlN6wj5nbtZXYGIkaf7IyVu8aI2utkfhPBKvajQTPqGg1P5vk0rze
	 7MtTS4W1GnMoYc32N3Xl9mhD+/J57V+Rw0T3h5K0wrwT6eDPfmMWS/Bp6EviouyVku
	 iYaaz+B9BVSeAENv0L1FLziwTmgtD7qWVp75kIlknntKSABmRyBsTOhcAkjitVxC2d
	 oX1/sMdKfEtZQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:31 +0100
Subject: [PATCH v10 04/40] arm64: Document boot requirements for Guarded
 Control Stacks
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-4-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1946; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3RZmbStJwVSGoP/qDNBFqPg5B/6FQNSgda/JKhBv7x0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YJBO3yLLrkfe904+TZtJB1T9HeB08OFT8n6HhY
 M3NNmXKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGCQAKCRAk1otyXVSH0B+qB/
 43pou9Y4TC/1pa0XTbag+sHQNoVFkuUIA8FSfx1e87YJGvqHTeNRK4JKwnIPZS8ZFD//FeU6sWUSfW
 yxOSuNd5EuCHGVVWwisTo696Z3sw6XMWW7d8fhRPIuFFtqtA6kpgUUm5VnWhlwsUMJLlyEvhPCLH9M
 W1uyrDqwl2iSR5m0UsF7EGNk5xhw5KPc8sOnTXdUsLVKW+omEqyEmUym6r/iwkWJKgT/pfEyZjPiOb
 09Gkvy+2Bqy0iqZTzyLHdRiLMdV98L/zhHvVf6T0+hXGkl8wPotyUaXqIQUnOZ/tgnOUYdr26cwP2w
 XhAdMoByrIqOboCZuztVTcCPMQnZS1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055750_398124_3029181D 
X-CRM114-Status: GOOD (  11.12  )
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

FEAT_GCS introduces a number of new system registers, we require that
access to these registers is not trapped when we identify that the feature
is detected.  Since if GCS is enabled any function call instruction will
be checked we also require that the feature be specifically disabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/arch/arm64/booting.rst | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index b57776a68f15..f5b8e4bb9653 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -411,6 +411,36 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGRWR_EL2.nPIRE0_EL1 (bit 57) must be initialised to 0b1.
 
+ - For CPUs with Guarded Control Stacks (FEAT_GCS):
+
+  - If EL3 is present:
+
+    - SCR_EL3.GCSEn (bit 39) must be initialised to 0b1.
+
+  - If EL2 is present:
+
+    - GCSCR_EL2 must be initialised to 0.
+
+ - If the kernel is entered at EL1 and EL2 is present:
+
+    - GCSCR_EL1 must be initialised to 0.
+
+    - GCSCRE0_EL1 must be initialised to 0.
+
+    - HFGITR_EL2.nGCSEPP (bit 59) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSSTR_EL1 (bit 58) must be initialised to 0b1.
+
+    - HFGITR_EL2.nGCSPUSHM_EL1 (bit 57) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGRTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL1 (bit 53) must be initialised to 0b1.
+
+    - HFGWTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
+
 The requirements described above for CPU mode, caches, MMUs, architected
 timers, coherency and system registers apply to all CPUs.  All CPUs must
 enter the kernel in the same exception level.  Where the values documented

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
