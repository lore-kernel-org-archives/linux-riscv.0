Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF57BC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 22:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvSXX8yr+L6c+icBoOuY6Wj7Z9Zw9DliA3dGnvidRi0=; b=SPrsdzkpZUVm3m
	lE0pO+rSPmOGVNrZx5e8KJc6f4+ND0rtWiaitBNvqVB9XQD/pRC5oHtTJmNr6vQ5VXA2W/q/tSchF
	/EDRf7fAr/lGeyTr8dQVoQj92J/zbbbnUNIJvRChn4T+YB+tNgVTNAeCJDAzVSVY1PwE1TQ5UbWk/
	Grof+03P902PC+t52fVTrAQsVXf+Ncd2zn4GKoSAA0tJJYv5BLmVMP/FT8yxYOUY6ahYJXZnjo/XQ
	33QKgqcy9/japUcjlZD8P1ZIEfYZ2CUq32AXpV1CbFqEjNjmtTZh6HawuP5f3dWYzQ9/+kivf9zyN
	7Qja18jBBYqFd/NYSEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8JM-000qhx-03;
	Mon, 07 Aug 2023 22:02:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT8JE-000qbB-2W;
	Mon, 07 Aug 2023 22:02:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FA48622A1;
	Mon,  7 Aug 2023 22:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B665AC433CB;
	Mon,  7 Aug 2023 22:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691445759;
	bh=aGB9MytFbopKILsUP0kPuxTbIpt9GJuR7uXvXLP6vLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B7+8io7JEg/LIWoZNhiKlYaOzexSqBArV056/ScJvMpxGs2kYB4Okzkzol5kScHYE
	 55HMmJFzcyF8LtgXCBJKWR7eLCptLh/oMa3OwoCIW/lmiSswqdleH9vkIljQqqI1NG
	 HLehvcCG393fnl1siFCS/s7UzNZzDQUk8j/IEVppVkDJ+oI6SfDcO/ioLRso4uqmWd
	 0nFYrpM45VWM6oql/4rbBGH9Bwejm80beYj84++Sz29XVXXPZ08K9bNizQdES4ri9s
	 TnarJsT6SfHg4wd1fb/cH2kV7WdxLpv3PjSjRekkZcxhPwSttByrH0KzubjmRIB62N
	 obTS3NSXeRxEw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 07 Aug 2023 23:00:16 +0100
Subject: [PATCH v4 11/36] arm64/mm: Map pages for guarded control stack
MIME-Version: 1.0
Message-Id: <20230807-arm64-gcs-v4-11-68cfa37f9069@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aGB9MytFbopKILsUP0kPuxTbIpt9GJuR7uXvXLP6vLo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk0WmgYE5sTjIW0s7MSSUHBmNdoL8mADFajoHMlxxa
 sLCcTiKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZNFpoAAKCRAk1otyXVSH0CQmB/
 4hCrLHpUMmcfdaL24W2A5mDkcuuBM88bAHrKma9GqNW27peedUqdX7QojJVVcc8Pti+JDlRJQlF6eA
 QZEKYM3bKTE3mosdO+93NlHTPGn7gi26Pt1S42K8kRxwwm3mJo1gL/HQE1ao9d0KZg9o9LHWjR9UsG
 hAoZdZeodWYeIhnbOvuyIXIfGKTlRPnEOtzr//cVzV6vxPF3kggLcSNXBGXhBYJxComChKV/1oWfxG
 tHKcsX37YMulc8njZNNNcc7c79OcVYO4TFDHmUNkosm8ee1zIH4H+rIteZ0Pyhx3nAnQLUDe23kVjg
 n0K3NwP/ZpHSz6lX1gqzfW1nyN7hWy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_150241_821221_5BCFB2CA 
X-CRM114-Status: GOOD (  13.46  )
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

Map pages flagged as being part of a GCS as such rather than using the
full set of generic VM flags.

This is done using a conditional rather than extending the size of
protection_map since that would make for a very sparse array.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/mmap.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 8f5b7ce857ed..8f40198cd44e 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -79,8 +79,18 @@ arch_initcall(adjust_protection_map);
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pteval_t prot = pgprot_val(protection_map[vm_flags &
+	pteval_t prot;
+
+	/* If this is a GCS then only interpret VM_WRITE. */
+	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
+		if (vm_flags & VM_WRITE)
+			prot = _PAGE_GCS;
+		else
+			prot = _PAGE_GCS_RO;
+	} else {
+		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
+	}
 
 	if (vm_flags & VM_ARM64_BTI)
 		prot |= PTE_GP;

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
