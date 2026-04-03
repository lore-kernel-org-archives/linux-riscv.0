Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5569BE7E36D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qUvYMMcjZBM/rtnIqf3E39MK8S7Y9fa1rK1qxHNI+8=; b=xIbdqFu/bcvg/x
	EKL8TOWm6dGZU7VzJ1bw407TvLV8zCqTpKJJ3gZkm1UCHQyRW1P8V5o6OPivlN1jP/CzIqhlrNhxo
	A5SRG7CpFVAuMG0MEpDJdiYEy//NCN+v5qphB65uXdMBtC2On7x33GPtOwJBgRT6fJwEf/fXmiEiy
	YCAXAyZcdoavgIhlXQNyrNLksmgmSX7e6ZryB6UfdTKQJaW5xCFYGpvL5CeRse2x76UGsckbJFH1e
	WoqcbGAIkN2qjMsjaFbIsTXNgwEUGxN/HOAF0ZKGU6d5Hb+In6Zhjw61EkwAlfvGQQrtepDJmjxP4
	Y7aJ57NR8QugkXW7JCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqh-00000001tdd-3yfW;
	Fri, 03 Apr 2026 10:33:59 +0000
Received: from forward100a.mail.yandex.net ([178.154.239.83])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8bqd-00000001taa-2mOt
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 10:33:57 +0000
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id E3F3CC020D;
	Fri, 03 Apr 2026 13:33:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id eXaKrQ9QICg0-t2eKy0Mk;
	Fri, 03 Apr 2026 13:33:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1775212429; bh=/7MT8XCjlc7FF5IGrcSKtOgIgzFNhDc8+wpVXfTxUXw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=f+wmL+Zn+Nnlp7z587DYK7S1OluJjbML4Yjf3bCpuIxlx87X3+3Rbc1it3q6EBHAx
	 uTCJK6JXhoFlTAWlCqGd9J+ZfPtByo5zbuwuOzPaKXRlvHiFoVkczQhFEtMYt0Ji2u
	 KZW4gtsuDHIoEnng0+t9G7DxUkf2y0fPNH8a4hwU=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v9 6/6] riscv: export symbols needed for riscv32 EFI stub
Date: Fri,  3 Apr 2026 13:33:38 +0300
Message-ID: <20260403103338.1122415-7-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403103338.1122415-1-dmantipov@yandex.ru>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_033355_892117_57B73B2D 
X-CRM114-Status: GOOD (  11.29  )
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

Fix the following link error observed when building EFI-enabled
kernel with CONFIG_EFI_STUB=y and CONFIG_EFI_GENERIC_STUB=y:

riscv32-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
__efistub_cmdline.c:(.init.text+0x1f2): undefined reference to `__efistub___ashldi3'
riscv32-linux-gnu-ld: __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'

Note: compile (gcc 15.2.1 and clang 21.1.8) tested only.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v9: initial version to join the series
---
 arch/riscv/kernel/image-vars.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 3bd9d06a8b8f..888bb1ddf945 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -32,6 +32,15 @@ __efistub___init_text_end	= __init_text_end;
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
 
+#ifdef CONFIG_CC_IS_GCC
+/*
+ * Double-word integer shifts are used by the library code and so EFI stub as
+ * well. Not needed for clang and please let me know if anyone understands why.
+ */
+PROVIDE(__efistub___lshrdi3    = __lshrdi3);
+PROVIDE(__efistub___ashldi3    = __ashldi3);
+#endif /* CONFIG_CC_IS_GCC */
+
 #endif
 
 #endif /* __RISCV_KERNEL_IMAGE_VARS_H */
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
