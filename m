Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FCCC072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EYLkrtj1i48Jldrk9gpI56mLGL1cG3FKAI5BYKScjio=; b=KGgdwpqLVIHXTs
	vsMEh0HlDS5qy0Qyjq756iM4O+pwjKYFyDryO1u8rvhML2Y7cCFihJCRALG8GP+C8jabikarSM18Q
	ZhQiOztglJXENG6aZRTts6LzfYxnZ+/QYYMz9WeTemP4wtLATdF4CZphGqLu65pUiX9y6FGXIL4/E
	Uuu9zfqaXJOchLyFoGea9ilAMkdKdH2ZX9b7pl0m8HxDI8QFwLb5wDTm4JnEg6Xd7HLvsdFlI+XsY
	OPYYZE5KHJOQHf3fvnQI/ltkE5Q5rAgyy/tgmG5KosmiW1I+70qeooiLNUMUmcotPWp8aK171Zl/U
	mQWuqeyrSbwQXIW/vJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yQL-006adA-34;
	Fri, 17 Nov 2023 12:58:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yQI-006acp-2B
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 12:58:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22D8761CD7;
	Fri, 17 Nov 2023 12:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B366AC433C7;
	Fri, 17 Nov 2023 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700225893;
	bh=4vLoS7Dg99+l1hsNwr7XqzGIdn2mfLkaWWkevVLZdC0=;
	h=From:To:Cc:Subject:Date:From;
	b=nJsYwnM19NZA3/abngyX+NI6XrCZmiSo3hPPOokeyAhcrpCG3T8hERDKegVlXdxjq
	 Sf6jNUZSvoHRgwFef5s9Hsxg7Gz9PK6e0b3YJZq9DrBT84tQZ6vqBt7qj3SAxFfeaQ
	 5pmyPUw3EheWFYHgOFqmTvgJRRUupjCPIebsaksfRdy2AMx+7mBnaGoQNX1d3WiuaM
	 /5y1omWc2vIa4jEpsx8HFet+iVg7FCRf74N8Ve1yjEZRY+EFwGpG7y8saB1Juv2k9F
	 Y7XTkIDKYgz0uGrKHCxZK27asn6qAfhtlLEA8oBm1BQ7VrRJFeLkuYCyEP3a6zr4qV
	 pfMmdyO9V6wsA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
Date: Fri, 17 Nov 2023 21:58:07 +0900
Message-Id: <20231117125807.1058477-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_045814_756312_91132CF6 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

'make vdso_install' installs debug vdso files to /lib/modules/*/vdso/.

Only for the compat vdso on riscv, the installation destination differs;
compat_vdso.so.dbg is installed to /lib/module/*/compat_vdso/.

To follow the standard install destination and simplify the vdso_install
logic, change the install destination to standard /lib/modules/*/vdso/.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index a74be78678eb..5cbe596345c1 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -146,7 +146,7 @@ endif
 endif
 
 vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
-vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vdso.so
+vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
 
 ifneq ($(CONFIG_XIP_KERNEL),y)
 ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
