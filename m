Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F555C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 21:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=brR6udKCdzH0x5DNg+JwiaQcoKg2ZDY7WFdObe0JSvU=; b=kR5abIR+155/IO
	1XxKO9Jua5Ax2038l27qWJfdRfvsCTSFKol0VvJqXTuYKNuO2cM0092VuP1ZIH7UrujkaOkKDAgTU
	aIHF8+jiO6lBevLP9P1hOjfzmY6zxGWr5aWN2eRkuiT3VJnjpeqT0BDzPD38uVL4v0XAd8q4aN8Ou
	FySSUWHVkfRWse/CU/OaZK0KMgh+8zkeOKJnwS0UnUIbzZAOJG1Ndxp39TTwClKKzvfn7VzO6Z3tv
	3f0ENIe4FZGEY3R8GXh+b6P/9TM9COnTAflhIcKNBkJYDj9KDDaYvZmch5kd31gtM2c7YxY+Sg+wt
	SkVoNlk/yZvMi0+JkRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HXw-00Goqh-10;
	Mon, 05 Jun 2023 21:15:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HXt-00Gops-1g
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 21:15:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 10039629ED;
	Mon,  5 Jun 2023 21:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE844C433D2;
	Mon,  5 Jun 2023 21:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685999720;
	bh=WpgQiMJgnt6HBcNQNIb/5Xa2UnrztLQBfn1ZUDQLobI=;
	h=From:Date:Subject:To:Cc:From;
	b=OGbUcy8KpJRebsXetgYi9snsvx0EUtJyXpxRM2HAsn0xfwrkOv76KEPjcUIQIf7VN
	 jXZpmuP+Y+MUdft1KftTa0XRRv45DH9itbYVEgxqhyuAt7ZVXg5wKTS9jZuNI6w3Vn
	 VTx67iJpp2NdCwpcDPESGusAw9UuJGeVCFSqjmFxBm+FKARvs/GCxWRNeQ1xPxcLQL
	 C4sGthQsGiGBBwiEoyacAbT8JRh0kSGId3Z3jZrV34QsJ/88ittkXEvEaviffrH2mD
	 jDzaWf3AxnlSOzVJSxqumz16JhPPeXSKEv28SNTx856g6xNS+Mg79shDntPN82p0s0
	 7AaAeQRZ1vw5w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 05 Jun 2023 14:15:08 -0700
Subject: [PATCH 6.3] riscv: vmlinux.lds.S: Explicitly handle '.got' section
MIME-Version: 1.0
Message-Id: <20230605-6-3-riscv-got-orphan-warning-llvm-17-v1-1-72c4f11e020f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFtQfmQC/yVO3Q6CIBR+lXauO6Vo6nqV1hwg4lkIDIzanO8e2
 uX3/60QVSAV4X5aIahEkZzNoDyfQE7caoU0ZAysYFXRFDdssMJAUSbUbkEXfHbhhwdLVqMxaca
 yxU7WohAtYx3jkKsEjwpF4FZOe5mory/xJjPg7JJCafJQPxquIy4O/1IvvT+oPe+DGul73HxAc
 6nguW0/1XED9LsAAAA=
To: gregkh@linuxfoundation.org, sashal@kernel.org, palmer@dabbelt.com, 
 conor@kernel.org
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 ndesaulniers@google.com, trix@redhat.com, stable@vger.kernel.org, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875; i=nathan@kernel.org;
 h=from:subject:message-id; bh=WpgQiMJgnt6HBcNQNIb/5Xa2UnrztLQBfn1ZUDQLobI=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCl1Ael//Pbt0ClzWZLUfrM5KVHtae8Hx4yT9pMTOv97d
 xXM9XzZUcrCIMbBICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACYy6zrDP92NC6ZkOu7zMTiz
 4VDiIs859RZbpd2P7lSVunjq3MOrouUM/wx0gxTzpec8E7z//3CT5Z6pEhYd9yMf5F0RnhX181x
 IJjsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_141521_640911_B03D18A4 
X-CRM114-Status: GOOD (  11.11  )
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

This patch is for linux-6.3.y only, it has no direct mainline
equivalent.

LLVM 17 will now use the GOT for extern weak symbols when using the
medany model, which causes a linker orphan section warning on
linux-6.3.y:

  ld.lld: warning: <internal>:(.got) is being placed in '.got'

This is not an issue in mainline because handling of the .got section
was added by commit 39b33072941f ("riscv: Introduce CONFIG_RELOCATABLE")
and further extended by commit 26e7aacb83df ("riscv: Allow to downgrade
paging mode from the command line") in 6.4-rc1. Neither of these changes
are suitable for stable, so add explicit handling of the .got section in
a standalone change to align 6.3 and mainline, which addresses the
warning.

This is only an issue for 6.3 because commit f4b71bff8d85 ("riscv:
select ARCH_WANT_LD_ORPHAN_WARN for !XIP_KERNEL") landed in 6.3-rc1, so
earlier releases will not see this warning because it will not be
enabled.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1865
Link: https://github.com/llvm/llvm-project/commit/a178ba9fbd0a27057dc2fa4cb53c76caa013caac
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 53a8ad65b255..db56c38f0e19 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -129,6 +129,8 @@ SECTIONS
 		*(.sdata*)
 	}
 
+	.got : { *(.got*) }
+
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);

---
base-commit: abfd9cf1c3d4d143a889b76af835078897e46c55
change-id: 20230605-6-3-riscv-got-orphan-warning-llvm-17-8c4b0b72282a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
