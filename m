Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D602E85388
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFxEM2koAdvBkubtsuTbr2QKHpGxnZ3ylMEDgsPXy2Q=; b=MQ0JknlHnVfBAJ
	tBTu5iUSYYnglf84/9e7GYeUcGc844nX2IOjxbRGpst4tCKn/Dg7YnJc+/jg+vs3QaHfPGR0rbsxg
	Nnouo0+CnXJ2KT/dUas9kzlmZR5wHjgJ0IydyrMVbPM9rkymUohvkjOq4XxnysBoVQThVEB3yDPW1
	uaBzUQsUySFvzZPb/3MdlvaRxMCui2HjK/O8NVQTvxTJI0Hpm313gnexOiRLhkgQ1UuG7rDgl7i18
	ERzifXdiol4r2h7+PG36tF2FgxbUzH4QlQ6bqDDjMdp/V0jL6vYwNwlSSuaS/O8Dkf4BkXuCf8upb
	0kDytaTXoLynWOv3mZtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i1m-00000002Nax-0cYD;
	Fri, 03 Apr 2026 17:09:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8i1j-00000002Na1-3we2
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 17:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77B3441B16;
	Fri,  3 Apr 2026 17:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F404EC4CEF7;
	Fri,  3 Apr 2026 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775236187;
	bh=7BysyeoPsS8ca/VpPMnK1QB4H2GEjIeNLaP0waNJ9uU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xpz7XpdkQdQDu+vMe0Vky0bJDWY5Fi6ZQiWi7At12fFBMjDTmXxMQlwGtGsR2dLpK
	 K7jL6gbTQrHP/7JstTtXq5c001ABJjWEUegg/MbyZZgvqyLywZ84qvI34rqO6UtBai
	 s/OpYtC/HXaHvMMOGKPE3YZZKpsB1J/Km+pRSWQ0=
Date: Fri, 3 Apr 2026 10:09:46 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, David Laight
 <david.laight.linux@gmail.com>, Kees Cook <kees@kernel.org>,
 "Darrick J . Wong" <djwong@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 0/6] lib and lib/cmdline enhancements
Message-Id: <20260403100946.de777cb981de664f28089d99@linux-foundation.org>
In-Reply-To: <20260403103338.1122415-1-dmantipov@yandex.ru>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_100948_019995_A1825DE0 
X-CRM114-Status: GOOD (  12.79  )
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

On Fri,  3 Apr 2026 13:33:32 +0300 Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Adjust '_parse_integer_limit()' and 'memparse()' to not ignore overflows,
> extend string to 64-bit integer conversion tests, add KUnit-based test
> for 'memparse()', fix kernel-doc glitches found in lib/cmdline.c and
> adjust riscv32 linker script to export symbols needed for EFI stub.

Thanks, Dmitry.

I've updated mm.git's mm-nonmm-unstable with this version.  I'll aim to
upstream this series during the upcoming merge window.

Here's how the v9 series altered mm.git:

 arch/riscv/kernel/image-vars.h |    9 +++++++++
 1 file changed, 9 insertions(+)

--- a/arch/riscv/kernel/image-vars.h~b
+++ a/arch/riscv/kernel/image-vars.h
@@ -32,6 +32,15 @@ __efistub___init_text_end	= __init_text_
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
_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
