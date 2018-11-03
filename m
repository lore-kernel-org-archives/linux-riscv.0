Return-Path: <SRS0=MzJO=NO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B94FC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 04:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5662081D
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  3 Nov 2018 04:01:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K2LsjwpS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="jrGY5nHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5662081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5tA6+FD8nuShk+VB1EuicrDNYQ9nwD7asizrEE5MkM=; b=K2LsjwpSAd82Nh
	pl4982HQXddHjHczBAaf/b40P6lqxxDxbBNcaRsmPof0NmaI8pxHXqomA+HdPFI0EuNUi19kSFhoA
	Krtxm0HdLpWv2HMD68fP5X+0RZW8fEmK0NqYA8S7dueyMcLdpUEvBS59ttuFDQxuogXc77KVoCQWb
	vJGHgl3DIvhY37dYpXvJiRdwGb17wn3nw4+xXJLFkZHAO+5n/+go0j/gUueMPj9eu9ccngP9gKM33
	4B1Zq0Y3aPZvpXQmbACw+JSmknssegGTjhHT/8Wx+NtIKAdcyUAIvIHutWsnxIAllwfRUxlD4U+d8
	kMx8A7OE22e7Yl/KFRCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIn7U-0006IB-Fd; Sat, 03 Nov 2018 04:01:08 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIn7N-00065X-VH
 for linux-riscv@lists.infradead.org; Sat, 03 Nov 2018 04:01:07 +0000
Received: by mail-pg1-x543.google.com with SMTP id 32-v6so1806197pgu.2
 for <linux-riscv@lists.infradead.org>; Fri, 02 Nov 2018 21:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5HkIf26O8EXe1py4I/eqZ1OjBmokbTLMF6ur7yoT6bA=;
 b=jrGY5nHXhhy3bkMSfMNLEHiciHloHxFKJ4aKR9IYI3sMm4SLNqyCuZkxA1Ou2fv5Eb
 LcgIqDLqRcuJQYRuuB6UAcFJ7ufl/3CYO1JXJIb4o1fmCxpYb6V2z23vry7jhOX1HOwS
 BcJfpo/bXQrK4mzzOg5dJYw8ZFSef/P3g+8jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5HkIf26O8EXe1py4I/eqZ1OjBmokbTLMF6ur7yoT6bA=;
 b=j1rqTMJYgmcsQZkW0w2gprbHb5o3TiupNWyDQYqMubnSQzWRGBD9hQqZ18puFaf6YL
 hJnqeiCF4z3r5lQHUXcs49HJblLRcO54kOkFuHAo7Th8ix1ABJDE21wIRDZMLBx0OVwH
 xq+MAmMYhI8wcYGSyFWLg6gIqnY32gMR2VWJPWonJ0ynaobSvHy8nHOnKZsvba7n9bFJ
 ScEirjdxjQuGtebjuCVxjCWs60unbDnHFW1h3XU7ryeBPYrGX6n1+2vNdy8oTqZs+F0M
 /1QSrtuiLBWuaFDF73mwCa/ZRvbYJ9Rj7HQa0MenWIvlsjXbsT0iFLwJMPLfdhzS+3ov
 VDBg==
X-Gm-Message-State: AGRZ1gLRZc4EADBSism6m8ymthKU0BYtduqFU3AhrUWo6kZOVNbsxfnA
 IsyAeRDzfRnnqk4k4PevAwzrMg==
X-Google-Smtp-Source: AJdET5fu2OzYfiTyZl33qiii7V2shb8ruxRKcR+KaDeH4D4fynaZZ4zUx7EMsJk+RfMx/9zdh6SdFA==
X-Received: by 2002:a62:6f43:: with SMTP id
 k64-v6mr13745084pfc.87.1541217656208; 
 Fri, 02 Nov 2018 21:00:56 -0700 (PDT)
Received: from joelaf.mtv.corp.google.com
 ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id x36-v6sm35836232pgl.43.2018.11.02.21.00.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Nov 2018 21:00:55 -0700 (PDT)
From: Joel Fernandes <joel@joelfernandes.org>
X-Google-Original-From: Joel Fernandes <joelaf@google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next 3/3] mm: select HAVE_MOVE_PMD in x86 for faster mremap
Date: Fri,  2 Nov 2018 21:00:41 -0700
Message-Id: <20181103040041.7085-4-joelaf@google.com>
X-Mailer: git-send-email 2.19.1.930.g4563a0d9d0-goog
In-Reply-To: <20181103040041.7085-1-joelaf@google.com>
References: <20181103040041.7085-1-joelaf@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_210102_270599_BA7BEC13 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org, lokeshgidra@google.com,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, kvmarm@lists.cs.columbia.edu,
 dancol@google.com, Yoshinori Sato <ysato@users.sourceforge.jp>,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, anton.ivanov@kot-begemot.co.uk,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, linux-parisc@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, pantin@google.com, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 Ley Foon Tan <lftan@altera.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181103040041.v6zifWyXhROG53RnzLrep2IEnnciYp4N6pTy1hUomTw@z>

From: "Joel Fernandes (Google)" <joel@joelfernandes.org>

Moving page-tables at the PMD-level on x86 is known to be safe. Enable
this option so that we can do fast mremap when possible.

Suggested-by: Kirill A. Shutemov <kirill@shutemov.name>
Acked-by: Kirill A. Shutemov <kirill@shutemov.name>
Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index ba7e3464ee92..48aef01a0bd1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -173,6 +173,7 @@ config X86
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_MIXED_BREAKPOINTS_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
+	select HAVE_MOVE_PMD
 	select HAVE_NMI
 	select HAVE_OPROFILE
 	select HAVE_OPTPROBES
-- 
2.19.1.930.g4563a0d9d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
