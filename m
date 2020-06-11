Return-Path: <SRS0=r3k3=7Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54BCC433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2020 18:34:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E82320829
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2020 18:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RfA+NNex";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="o9hdq+lD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E82320829
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	From:Subject:Mime-Version:Message-Id:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COXpdfYzdd6T2PLhteaDM1tUQElcqbQJ6tIcGD3EDRg=; b=RfA+NNexIEZiWB6IC5127XBBtD
	ESetbe1GwOZ8Nset8zOxihTtXm8k9487w+1vejqRsz3rbezEm/eT1THp/aHil0/u2INVsBqPiIeni
	JZ4imClN/zp1RuDlP+T2L/gjqDJmn/3ZxpP+JcDnSTkYfL5UJBcu10CYfW8bbWqs9Hg7/rxc8Y+HP
	2CpyRS1wtJVWrMYQK/lrVNspH6uyt9sbFjj6U0iNj5BgUx61VxqDbxZ13Vj+FjBmRGsgoL6kcjzdu
	Ga78hyoFf7+5EV7oow30U9Fd+EbUsdXUll3fzEH7YECTNyGa2eG4oME3oATbf9Hs9fJqX9BeMBHhn
	oSc+8Kyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjS25-0005Oo-3m; Thu, 11 Jun 2020 18:34:33 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjS23-0005OO-AO
 for linux-riscv@lists.infradead.org; Thu, 11 Jun 2020 18:34:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id k186so7458675ybc.19
 for <linux-riscv@lists.infradead.org>; Thu, 11 Jun 2020 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=COXpdfYzdd6T2PLhteaDM1tUQElcqbQJ6tIcGD3EDRg=;
 b=o9hdq+lDTGdQ7pL6eS2ne+STn2zEfYAr6Sd9feD0gHCYpOzUsbmVOKpoiBtQP4hRhP
 0vd+WlglqyfcLJ9dwxfzJSViO0X4kGcUGdetOJVW7F8FeiZ3juWzPuV4sYw8rkN4ZUFy
 ylPg5u3vQGVe4MIfSCCWw6tJHtuBZQwPWcIIZrmAC2kmzRmTpimzaiVMSBkDHqWhdaOb
 ltCNz/98+IdgtXrP5J6B/vhq33ooa+nN/IByEuPkV65mBCzcpLEHo9u945AUVWVPhjSJ
 vXHubQ1UlbdcVVpDy6aFT+gAJEiM3RnQ/3xkqa7FelQYD7aZpbTIWafK9jGSDpUUzR1q
 HAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=COXpdfYzdd6T2PLhteaDM1tUQElcqbQJ6tIcGD3EDRg=;
 b=aYKixxIZUEnkvjZYTZVytZvrS9VgUuNe/FYI9xO30ZV1ubIWL7qXavKOxKt0QB3n63
 iI7oYVl2X0lH450I4cpk61tIYq3/mKYsHUcjD3m+qORo+/0bP56C4/SXQrwiyj8H/UXG
 UX+L7/q5vIwg0wFOF3CvwJctv2qS4Y/YPUjDQgD7mZECTBSLwjhcvMu1msL8DbSZKvG+
 nZ2Otv4Dd1PbBgHcCvBeTx9w9QEFrvdTOykpVOEDBjmGW1gqiZCHwZ3BjY+LADc0MuYV
 H23NzrFji+p0moqDN53Exye+MgLvXGYpnDSZccwEwEeQNeA/mh8NtBGBLeV9u9Twjrq8
 S59w==
X-Gm-Message-State: AOAM531l7TGWUgtm/qaMD4ZDmJPE8LBKuuDs0cb+46eVCXBhU2pku59O
 kNqn9qu/S2qh4fgrxvt6uBU1zU4VPg==
X-Google-Smtp-Source: ABdhPJycnzJzYBE1uCXDWobHSfMgy7yeM2Oc8KQ/6LbE+KEXMBUsHdFKo8h/UNp7B8daeNUFZH40Nkv7kQ==
X-Received: by 2002:a25:3103:: with SMTP id x3mr17950241ybx.36.1591900468187; 
 Thu, 11 Jun 2020 11:34:28 -0700 (PDT)
Date: Thu, 11 Jun 2020 18:32:35 +0000
Message-Id: <20200611183235.37508-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH] riscv/atomic: Fix sign extension for RV64I
From: Nathan Huckleberry <nhuck@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_113431_375734_E54BF703 
X-CRM114-Status: UNSURE (   7.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: clang-built-linux@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nathan Huckleberry <nhuck@google.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The argument passed to cmpxchg is not guaranteed to be sign
extended, but lr.w sign extends on RV64I. This makes cmpxchg
fail on clang built kernels when __old is negative.

To fix this, we just cast __old to long which sign extends on
RV64I. With this fix, clang built RISC-V kernels now boot.

Link: https://github.com/ClangBuiltLinux/linux/issues/867
Cc: clang-built-linux@googlegroups.com
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 arch/riscv/include/asm/cmpxchg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index d969bab4a26b..262e5bbb2776 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -179,7 +179,7 @@
 			"	bnez %1, 0b\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
@@ -224,7 +224,7 @@
 			RISCV_ACQUIRE_BARRIER				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
@@ -270,7 +270,7 @@
 			"	bnez %1, 0b\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
@@ -316,7 +316,7 @@
 			"	fence rw, rw\n"				\
 			"1:\n"						\
 			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
+			: "rJ" ((long)__old), "rJ" (__new)		\
 			: "memory");					\
 		break;							\
 	case 8:								\
-- 
2.27.0.278.ge193c7cf3a9-goog


