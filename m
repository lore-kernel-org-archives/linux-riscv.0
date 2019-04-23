Return-Path: <SRS0=K/tH=SZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83991C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 21:23:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FA19218FC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2019 21:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BEr07CXn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="UOF5nYs3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FA19218FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A6f5i6zRnMa9X/f2o+CQnpJ/hvuNC1n86DAs3tCVUpQ=; b=BEr07CXnV7ZEOL
	zZ8gwiyKZLCK9jxJyv5CF2KfwLBKAjU4UASJTaZU1mArlapJArLMo3d3Wjl0cVgOLumdKE6RHnRXE
	oV32p3atUIXvzE/UVzGPAUpZhgECEA5YDpy4MvQACbphPgsj6zmEzWzbeC7bwNbKfVRqjCOJzRiWS
	xie7Qrh61jaU32S0TPiQUNBeZJo8zZ5At1Kuu5YklU3HXQu1t97RjyozcHFMbaLI0W1lbirq8UQo7
	pGpFcEJ1/W6y5HtxRnr5lp5mPHiZNLTDJFpeKyoK+FzAp1rqCVYgMz5nJEB3DSHqvm2ZSYDvy2+lK
	dik1QhTWkHM802jdMVWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ2sZ-0000DK-Gj; Tue, 23 Apr 2019 21:23:03 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ2sW-00008B-Fg
 for linux-riscv@lists.infradead.org; Tue, 23 Apr 2019 21:23:02 +0000
Received: by mail-oi1-x249.google.com with SMTP id r190so6667242oie.13
 for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2019 14:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=8vlVGUDGuhaBum7VBXWJ2Ypo4IITj7wohx6wdq9xz00=;
 b=UOF5nYs3c+dDVnGSN4CYAmHRGzjeARM2Ftbv92tRi+1cryxR95ULqvVMem3a8MWDhM
 lAbL5MTzXH5J722iGevcK84S+PIteceFaLQcvK5Z64QO43JL5RMBKOwy3yl8qsY/HhfA
 8VtD/jiu/MuPBLh2PPRdV1c88Zabuc2/T+pGriu4/3ip6gYaoJB9VWExbMN2plQ24v/+
 l0kiHQppke8xxTwaJq9xDowiaIbUkzifAZyAHp68pEFg73oZchhgvbRvzsNPtJ054iyH
 8zqb35m55epPXw1MVYnuLQ9tJKSEkESss7HhN/1rYuVW7J0jg2lleZUd2CfkRR7ZUBXJ
 g8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=8vlVGUDGuhaBum7VBXWJ2Ypo4IITj7wohx6wdq9xz00=;
 b=hX/xOPuZPmQjEbrY3FNeIGt4MJOWagkMFCALgH+dUGlNsNFPkh0nK4uTIa+gvOdfoF
 dsk1Qt3dDCZ4Pb4+sO6rtTM+P/Rt/fHEjto7KQ52gx8GY5ijikoIxukra7KiT38EtvEq
 bt87gkhKQQNaF1GF5SlGHn/FDpXh34QAHY57SeRWXj8xeB5wabYNMCxIXmdNWf82KB13
 JSHShbINaXsMXETi7RYrLGzCBOwI9wH5M+W1hvDqRSPAEAfMcHqgcgIsNsR4gyC8FXsE
 u58eL2W1dx2p1pQD4Q8qSQsN5+9eIyZ4ktXYSUJOFnb0DijT+iHRnLuoKoaRQ1VIl//T
 yJ0g==
X-Gm-Message-State: APjAAAXRBCEGewYCRI1yrxUXKNDFQOkX0+z75R8bwew4IINuQpw1//fm
 NWh5IkGaNfpt4+DDW5ml3vW+Blz+Cpsf4Ke/MGQ=
X-Google-Smtp-Source: APXvYqwm/kDtfFMUlLMZVLj6lAR+30/LM7ThVuJsH7R3kWki0aPvkQZv88UCVOUQR+wzDdGGEwUhJm9TJJMpSydP/jQ=
X-Received: by 2002:aca:5946:: with SMTP id n67mr3127938oib.48.1556054578217; 
 Tue, 23 Apr 2019 14:22:58 -0700 (PDT)
Date: Tue, 23 Apr 2019 14:22:53 -0700
Message-Id: <20190423212254.9504-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH] riscv: vdso: drop unnecessary cc-ldoption
From: Nick Desaulniers <ndesaulniers@google.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_142300_575119_B2AA5FCA 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-riscv@lists.infradead.org,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Towards the goal of removing cc-ldoption, it seems that --hash-style=
was added to binutils 2.17.50.0.2 in 2006. The minimal required version
of binutils for the kernel according to
Documentation/process/changes.rst is 2.20.

Link: https://gcc.gnu.org/ml/gcc/2007-01/msg01141.html
Cc: clang-built-linux@googlegroups.com
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/riscv/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index fec62b24df89..b07b765f312a 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -36,7 +36,7 @@ $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
 # these symbols in the kernel code rather than hand-coded addresses.
 
 SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
-                            $(call cc-ldoption, -Wl$(comma)--hash-style=both)
+	-Wl,--hash-style=both
 $(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/rt_sigreturn.o FORCE
 	$(call if_changed,vdsold)
 
-- 
2.21.0.593.g511ec345e18-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
