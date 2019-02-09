Return-Path: <SRS0=fNze=QQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD02C282CC
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Feb 2019 18:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0AE2192C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  9 Feb 2019 18:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LnCeBK5+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEBabIWJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0AE2192C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRmg1P+NXkquuRxu+dF1sYW7DKb9Xz6ox1KmgdRyxaU=; b=LnCeBK5+nf7+Vl
	B1fvOo6AqRzscIH7IxtMZQJSvg7LDwmZbAhRS3oMgwGCkM/QGr1mQ8wSaGlHqaKB2qwBkInJRIRr3
	RZAqiWtBlw1P5jsRz6mB13bk36WViQl8TtevI5Cn41FYRJrJzYmWGBfC9EsO6Wbn1R3/i0E+su3PH
	NgJUaTDEYz4jqihWclIQsndHUWrfkCUrb8TGjAXwGIPbgo6vo5u0wkmFJmM7mOL0gCW2XubsvAMLx
	AB1Qiqcaslvk2LodDVrmpxUPVYxs6K6wuF/VBeDmWKqLI+2pPLpDC/xt15iUh7oP2/DnsDR4raoiZ
	Gh5CPHOXbK/Tpy7wegIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsXgS-0007n7-9t; Sat, 09 Feb 2019 18:49:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsXgP-0007lw-4b
 for linux-riscv@lists.infradead.org; Sat, 09 Feb 2019 18:48:58 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2835421916;
 Sat,  9 Feb 2019 18:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549738136;
 bh=L5aTBTHdJvSvYPwm3ppwrkTgBdTkAqvUPPtFrCcc/Ok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEBabIWJ2gQWDoS3+vLO9K9zyVuwvk/Wuocvw/1Z0TokBRgl29XpAN9ArJdGtRmU/
 jVV5KgT4+Zim8cARJw5R+DP0GKWhfhxUOUqn51kRxE6OTYzXhdS+hBcm5rpiZJiaAE
 0hZxEA9PLsSqFw6hXSao9N/F0BJ5+K0QIcPzsbYg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 06/28] riscv: fix trace_sys_exit hook
Date: Sat,  9 Feb 2019 13:48:14 -0500
Message-Id: <20190209184840.126418-6-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190209184840.126418-1-sashal@kernel.org>
References: <20190209184840.126418-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190209_104857_193557_260F4044 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: David Abdurachmanov <david.abdurachmanov@gmail.com>

[ Upstream commit 775800b0f1d7303d4fd8ce0e0d9eca4ff2f338f2 ]

Fix compilation error.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
