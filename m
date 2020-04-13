Return-Path: <SRS0=dPMk=55=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003DFC2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2020 16:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC33A2063A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2020 16:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M9wP/cMK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1Z5+kKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC33A2063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fDNE3d6mNUJZ48JEkXp4cIY6H74jiPrBKw5gp9a7Fs8=; b=M9wP/cMK3kZUpgkkcAninUE/qv
	qGNyhJvob6LJ+H1w6eD/1TzeL7eIV+if9fRXRocCtbEUAdfcL7qY1Mn5JVG57VHNMnGUAqGxZKI77
	xHCgdjPVPOCicp2zyw4YUtrO5RSfOuRP/vNzCkhJz5pCY9nxw0YDTOiaMZIeMptVI3wKNmQE1WHZT
	mPUCW0r2XSb/dh/pLdiliCm6lKbaStAWrN3bFnwQWS0tIeWOmf3yYLgLCft91Z0qzpGKady/0cY/V
	pySPwVTG7dLYHYuOOJK9XnOE3UOmqSrNbVo1uLgUdKcOXBx3j8TMs1NuEv2R4sMV0kv9FTgOAIfgi
	13eayYJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO1hR-0001vM-5z; Mon, 13 Apr 2020 16:12:41 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO1hO-0001ua-9X
 for linux-riscv@lists.infradead.org; Mon, 13 Apr 2020 16:12:39 +0000
Received: by mail-pl1-x643.google.com with SMTP id k18so3538127pll.6
 for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2020 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=fDNE3d6mNUJZ48JEkXp4cIY6H74jiPrBKw5gp9a7Fs8=;
 b=I1Z5+kKh4OG4NI0RnJGh4hAXQSmKixqK0/ZtT+V/E1y/JONoKSMxkXDmwXpAfVUz9r
 HCq5fTUca2UWzaCsujqnOn3cHKcVMzGblJQff89Fg7EH3KDqO6DIVF1otfjCeMdQBaD6
 KalcJIn4NMTl2ImQ+5hoV6y+UX3RTtYPk9B0bw6zpyhoI9hA/tkcwcgcw4P0Ga187lUj
 Jg6tkz81l7gS6mPJD2417aQ7CrsgOVbP+drlbhUTMHf/V1EKJVXODgFTGOYR51pYO9z6
 9X7tuOo1wCT4rMAYQZO3Y5NiUPyd6ZADPhOYiTCDYn+4N/Esyx98Z9VllCXYO1QCuFXY
 gIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=fDNE3d6mNUJZ48JEkXp4cIY6H74jiPrBKw5gp9a7Fs8=;
 b=SFUDChyp9PoiTgdgxDf32MxkJnsW51/O6NeStElLWTtxuH2bls+p2UOkn4JdTN4hJw
 GH8jl3S2FWD+PuecKj3UEA36OFkmwWaG/upql3q5gC+X+nAI8135MPkuH6UzmiNl1JyA
 gXb8l6TRFw69s9sRse8nkEV4brfr6E6cAJx9c94nhHOCB+xa/RlyfAqwIOHXflsSiNmx
 pf7ectIqXx6/OSLSH2pGTsUztElBRaPLXB/v2fTENzBaPftXsgiKnAjKGOuvKJYl402O
 mpHfPGlCzlD4wDUEuTdNyso3MCr1TyCL9B9zZrXB1/K3NzYGFzAgFJShCAowSmsDiof3
 L2xg==
X-Gm-Message-State: AGi0Pub6pNEgVTj34+2RjFAWLwEncTDZUEqCo+Rga2iOt9r+CX8EZoZ0
 qTHTTc5zUwEs7hXAqvBUUk6cuVB9
X-Google-Smtp-Source: APiQypIGgX8jar649ulqr3NbnDbLLAjHgdD2FwNMz8+gXeP4m4l0ak10Ae1rKAmbur6uSwcAvJB7kQ==
X-Received: by 2002:a17:90a:8c83:: with SMTP id
 b3mr21876434pjo.141.1586794356873; 
 Mon, 13 Apr 2020 09:12:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u15sm4415133pjm.47.2020.04.13.09.12.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 09:12:36 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] RISC-V: stacktrace: Declare sp_in_global outside ifdef
Date: Mon, 13 Apr 2020 09:12:34 -0700
Message-Id: <20200413161234.78346-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_091238_330656_956FF102 
X-CRM114-Status: UNSURE (   9.14  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

riscv:allnoconfig and riscv:tinyconfig fail to compile.

arch/riscv/kernel/stacktrace.c: In function 'walk_stackframe':
arch/riscv/kernel/stacktrace.c:78:8: error: 'sp_in_global' undeclared

sp_in_global is declared inside CONFIG_FRAME_POINTER but used outside
of it.

Fixes: 52e7c52d2ded ("RISC-V: Stop relying on GCC's register allocator's hueristics")
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
Apologies for the noise if this has already been fixed somewhere.

 arch/riscv/kernel/stacktrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 02087fe539c6..6c854875ac74 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -12,6 +12,8 @@
 #include <linux/stacktrace.h>
 #include <linux/ftrace.h>
 
+register unsigned long sp_in_global __asm__("sp");
+
 #ifdef CONFIG_FRAME_POINTER
 
 struct stackframe {
@@ -19,8 +21,6 @@ struct stackframe {
 	unsigned long ra;
 };
 
-register unsigned long sp_in_global __asm__("sp");
-
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			     bool (*fn)(unsigned long, void *), void *arg)
 {
-- 
2.17.1


