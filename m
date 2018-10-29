Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18C9C2BC61
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 12:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 741912082B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 12:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ixTYklQs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B9pFrARK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0o/8jgY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 741912082B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NIufeG+zxhTkAWkYHATqOBvfUvyusc1hui3osqggiFk=; b=ixT
	YklQsyeuDEb0a1TUB5aNh/KrRt2p0Keay4HSbNQ7WLtqnHVZjJwbe1D4x2VHlaGLCIKJc186ethVh
	YY0XyMgNZJuRbGO3bQ6QZYCBS3VqPiBndI6X1ykntqkda0YodEoSJdVX9zc918qzGd7mupr5cMo3l
	o2vFMmExOU4qaHCRgec+DZS2iIp3U+HlR6N7m8RJJOM45x0YWboAxvxiQCi83/wHoHepC3VFCOYY/
	Xx8t/tc9YPn7gShTPFMYR35wICpz56SBElprxcwRMVLgPgqptXokeP3l0Qf+8rdx+aajYrqWh4q+3
	Dd06HdF9pODGksGi/582r9xPotufthg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gH6eD-0004MA-7V; Mon, 29 Oct 2018 12:27:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH6eB-0004Jm-Un
 for linux-riscv@bombadil.infradead.org; Mon, 29 Oct 2018 12:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLEKKbyvwHhkDcroeY9+oVKNgUdmgNgsvBDBfj2Nh14=; b=B9pFrARKgxRHlnLcKZDj4Xpz/
 6OQEY+9R8MSE1sjC04OJY0zsU9aCKq/KNvRPwtrCSDc/iosX2TswgHJGHtEClIerh6giNdiOM8Hbk
 hc+BaZxcI0Mz+IpxwjHH0xBjrYcBTF5RCNdOYwzQTcwWestV6ijOfg8Q4cbUTFjrdvaD2zwxAZ4Na
 W7Y/OKVrRhTXQAUtwho1dEbSjClfej8ARTC1r1LEDF5c8aylmBbSBQn3owvd++zSPpUdIcdNIjxlr
 7sfGrI347CODjfKM/Hj+Mfjop3/aeSoUIgR/bqgHKJkBveux81Xjca2HPmXDasJejuLNe3ViTuLeC
 Z05R5xcpg==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH6SH-0008Ir-2o
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 12:15:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id x12-v6so8409861wrw.8
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=sLEKKbyvwHhkDcroeY9+oVKNgUdmgNgsvBDBfj2Nh14=;
 b=N0o/8jgYOWI/iOHZmz7TUZxMjmYsP2PMVUeH0JWPjiLen7CmTprSCGJeJy+K8bRjnX
 xQTWF9yBSJnU0xikP/Zqx7uYTtmmOSKLdpl66UysxoHgEOM0ScsHHk4gIdnPNTLTja0R
 HQBpdGWvLyif7mIvEPbvJW/fLwKh/JddxX156Qf07ITBPoJ5DtREWCN5g+q6bPg+Hb7z
 eJmFTCnxHdrOzpxeVlUkYhl39XozrSZGJmptTl0PMl0pOd8Q6mKoG9NocBVbIQ3Wm3At
 xg8ELmR68jf5+RDnYVU+wHRcciJdUhPQWPyZD58B2vTDOsB+V0W2EspacblA6FPdJQd2
 pn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sLEKKbyvwHhkDcroeY9+oVKNgUdmgNgsvBDBfj2Nh14=;
 b=px+kurFK+Ydq5qLWvpi9ybRBxpfwBDcJ96Nrw4z8c+UpnMaYsJW8/hmqOEMP3QWyKo
 GaL8wntxkM9JRMQGzstI/bvHp3InJOLscmmbQdJFGrxmU7XGHhT3WtaCkcIu1sTIKBsH
 oPicZ1jGPrn3Mhx0rAzvfFYx/3vsUCdsbf8WQUa06r5g3vvM16F0nnLw5BHZCoNM+rpp
 7Cr38T6upwAxcHkVdU+aOXBdfOrRcnznERbNRgio4Nq0FJXCH5zfbtv+eJ0TFRKo2suP
 52b/LAOqQC5o0nvIhDsOvLqVx8MJi/30JSWwr+i6NylBiTSJEEh83XjE5m+DNudGblxB
 JUWA==
X-Gm-Message-State: AGRZ1gLsFeU6yqtk6/WW/uyKZi4nDtp2WMSysyVqfdSr8RJXvZkyk9g1
 QRYiKwCLVFYNBEA1hJjkQ4BuECyI
X-Google-Smtp-Source: AJdET5c3SMdYrOC0BKrIf8ou6gBd7zGParOGg4pWp92AkXrk1Tc/a5CCuzPuQnv7aR/v7OVCy1wm7g==
X-Received: by 2002:adf:b716:: with SMTP id
 l22-v6mr15551671wre.157.1540815324342; 
 Mon, 29 Oct 2018 05:15:24 -0700 (PDT)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id y19-v6sm27359575wra.60.2018.10.29.05.15.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Oct 2018 05:15:23 -0700 (PDT)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix trace_sys_exit hook
Date: Mon, 29 Oct 2018 13:15:16 +0100
Message-Id: <20181029121516.29574-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.17.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_121537_148729_C173723D 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029121516.EnzPwvNjdMqK54uqqm40k0u_Jk2fqAuEWQMEzS_sduw@z>

Depends on:
http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html

Why we don't have HAVE_SYSCALL_TRACEPOINTS in arch/riscv/Kconfig?

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9f82a7e34c64..9db7d0076375 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -120,6 +120,6 @@ void do_syscall_trace_exit(struct pt_regs *regs)
 
 #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_exit(regs, regs->regs[0]);
+		trace_sys_exit(regs, regs_return_value(regs));
 #endif
 }
-- 
2.17.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
