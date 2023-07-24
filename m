Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD78C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DieKd0OyHNtPk5DXq3yE43DTH3sO2lKL+EwiDgP2F68=; b=tuHfsn0FqzMyks
	8nLI8GUkzT3cSytYLW9wj5B1+8EXcQuVPPfKCykZdN+hz82sjtHReJnf7qb77VQcO0tFjXITi0JEh
	QdKwBw6uWuHlK076Mmtj1uzO5Ka6FsNQNMJ8+CV+p5RJyDOJCOYgkkGEdbbTotAjFOTy7eJmv7jeH
	k3KeC4S63xJiXNtYrqfTNE45dkpI1JOd1y03dQpcmiOfTNIXKjAKWEH+YrKoUeRxiI6UY7BfPj3J8
	dYYoXvu/6QuhrpZ6Xb/OtcXlFE3unpru6uWdJPYPjEQfbBPX+eGDYYHleA6anxWFKjUceVqoE75lh
	3lDbyh337gNaFTJ1of0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNv1g-004K7Q-2W;
	Mon, 24 Jul 2023 12:51:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNv0O-004Ivw-0Z;
	Mon, 24 Jul 2023 12:49:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93BCA6115A;
	Mon, 24 Jul 2023 12:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E35C433C9;
	Mon, 24 Jul 2023 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202979;
	bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UOuiRDkBusphHSxvKkLrOi4hb6QDNJiEeqdsk+bAiNRlkVULSMR4LyXqN6lh8jEqU
	 6aY+o5iGUOA6CFekoyYKLuLpmCp+ki3We97BjjOgf1TovklVWs1IesDN2/4ZJCIFfS
	 IKWq2s7SUCup5jqqhGVztCdgWGCi6H6vhnbavEeaeBK1/JuRYjJ9aPnPZUR/omR95F
	 rxly5mAwX/l/+1i7EX1ua9A7x1W/LZ+n23XWxRezK9rDiN3SJ1xWbA9wJnBHy88E8Y
	 vSfU0G78J8CFivTLw4aU6EPd8y37uIJOGTm2UJNJVqYpVChDBEi/Xr+hdmloQtpFzg
	 l5nGgTUqt5dhw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:46:12 +0100
Subject: [PATCH v2 25/35] arm64: Add Kconfig for Guarded Control Stack
 (GCS)
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-25-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H5XnWdFwxjuGxEH72kUlpbP8cfBTQj97MLlaTYR448U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKnQmQDKgw1sV73XajzPOr/VVN8eYW4BuRVpTBw
 6U/CDZaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5ypwAKCRAk1otyXVSH0BjjB/
 4zmlP2LuDl/tCz3VO/DUeOVn6ZcSaI/xa1REDMlzha0SDGdV+QTgnOm9wNwq8WieSsejDlPhxDuvki
 paM4LrVSh1c5aAtMHMQ/HGCdvkCO5DgZgBqp71Vmbl6yz4Vi/gj0UfNJDOA3FLp9ww3m7Qe5H3UTpY
 SJsdjSeveABSRymkrBiBwjX6uOxi1DtrtMVpatbk1zkkjp5TTaBE35yRGdsgVgA8ODTsqZP5OKTSN3
 4HIlACNi9tjNEGYf4wzBTSKJAaxhrT3jJQH6jMsMwwyXhVvlMx9/aQLLuBXlSZcSRJyqVsR/kzRIxf
 +bE7Fh1YOi9lG6dI2er5/PlgVCBoni
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054940_339775_A1D4FD7C 
X-CRM114-Status: GOOD (  13.16  )
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
