Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A52DEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWGjAk33K9teVzGuS96aJBCI0dCTryvcS6NgQc+h1BU=; b=W6q2Z4OLg9jR3s
	dWEX0shemHBi7DAmQ3mBOmMj3L8cQ08HYtlZg0qyumnsGBOYudoY7aMc+sW5Im8U1EanWT9E6b7wd
	Q/SKLagoslgddQVg7tqWMGiaxgnuOpE6zX+7LCymj9kxZLUstlPcFFhNVFD8BEBgtH1jelhBPofHf
	0i/77KITaFpxw6/1gBwDBrugn+4DdVBrDKIdlcJLovjpt2LNhLNILuXJpFvo+gEVJ72AetBlF2ikC
	R+qVfNArCvI+1Gxnb2kNdSF/hwYYX/ILthP6qmsnTNU5qhzq3YG+VOm4Nz67PdfPPiiLASdhwlWRT
	iypY2AQyoinBkljLqL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9gV-00Frnj-2K;
	Sun, 16 Jul 2023 21:53:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9fr-00FrOV-0u;
	Sun, 16 Jul 2023 21:53:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 73E2260ED2;
	Sun, 16 Jul 2023 21:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852F6C433C7;
	Sun, 16 Jul 2023 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544382;
	bh=rwg+AaLrST64GPi/dleRneXGKtoIqRfwuUuxqMEvRY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UgtraBJIty53nrQbpln20X+ZgVVvVELrRtvAd3QMCrhZZLG55JU40/WRKPzyulIdC
	 rdaTs7g0cGf13IEO6plkV5jWgs4u4tUGQRUFb5f/AeXP5SfGfRw0tYRLfzzgSw4dtG
	 KtwongQnS58FCtWJ0962kRMsMbeN2Qn9fsmL5Kkkot6uH6w79KuboVGwU8n+84WVcY
	 eRR3pYAnAajGivQocVIeEN0cuXoC0qluSb/xC6LqxKAIDzD6bRG2MLIR9U8J/EKH0D
	 IJSZ/fzQSra/qECPc29Ob+7i1aufZgNDfzPrEFxMKKU8nRrIHTidvx8ycUaL8qHEWP
	 IpAj+kjOE1FBQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:50:58 +0100
Subject: [PATCH 02/35] prctl: Add flag for shadow stack writeability and
 push/pop
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-2-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
In-Reply-To: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rwg+AaLrST64GPi/dleRneXGKtoIqRfwuUuxqMEvRY8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktGaQrba4c87fXI/DIs9b8uMvYL0mZkMhwI/2a8dl
 /uECOa+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmkAAKCRAk1otyXVSH0Mz2B/
 0Qse7s2seNh0TDAnfYabaiAlsKHmw1NQH/pAIsYkJNq1lwhtVLDvni0GlFFI5Iy4xaXcvNqYLflNIN
 JB8WxsYfarT9t79wGVEVsXLhN+//YY1W7vIKO7J4qV6OS2zy6xDzLqKUegxjSm1ZzWrLAUmxVvhRTn
 rdAoifqTz2kttVaBZVk3b2vjudnWDDO1+MV/WXlfbytVw59XLti4le9LkQpNUou/8h3n87mJ3aderr
 ghHhsnAWYpe/P3JeZi2bHfg9prLFsn0sN6umDfODDRdURGFtk7VPJR/4qEHIpbPDzgcun6Q0ENfn3D
 fgvdczW1gaU0aCK0NKAnMefJZ1CwOA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145303_414458_8BC53EC3 
X-CRM114-Status: GOOD (  13.73  )
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

On arm64 and x86 the kernel can control if there is write access to the
shadow stack via specific instructions defined for the purpose, useful
for things like userspace threading at the expense of some security.
Add a flag to allow this to be selected when changing the shadow stack
status.

On arm64 the kernel can separately control if userspace is able to pop
and push values directly onto the shadow stack via GCS push and pop
instructions, supporting many scenarios where userspace needs to write
to the stack with less security exposure than full write access.  Add a
flag to allow this to be selected when changing the shadow stack status.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/linux/prctl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 9fdc77fa2bfe..e88d2ddcdb2d 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -321,5 +321,7 @@ struct prctl_mm_map {
 #define PR_SET_SHADOW_STACK_STATUS      72
 # define PR_SHADOW_STACK_LOCK           (1UL << 0)
 # define PR_SHADOW_STACK_ENABLE         (1UL << 1)
+# define PR_SHADOW_STACK_WRITE		(1UL << 2)
+# define PR_SHADOW_STACK_PUSH		(1UL << 3)
 
 #endif /* _LINUX_PRCTL_H */

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
