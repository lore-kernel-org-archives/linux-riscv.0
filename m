Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD51C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C47820868
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IR+fiJGL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgYR5qqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C47820868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H1HvkWxn8FQw9NrSCfWcql0nGsBR4UkgaqwfLNLBy4w=; b=IR+fiJGL4/CZnh
	Jh2Rjkf7cfwaBJB8sX1GPd44j6JOoQPmINZXbLBYVfTopW5skHypu5p+jiJFdcfJnJ5sKgnLLh+Zp
	mT8DDZ4KDmWPW3JPN/0Q4kTHpuskVj5tQKBsMt5Syc5+wbWTjvZOA5QJGrzK4GmICFTCgPPYL+F3k
	Fjb7DG4CyR9itEiRdIGbafQvfgOMrqugQaGA3nHe/04GTAsT3G+ThzXgx2PRiv8snpuZDTdreO3fI
	41SfRkWTMxPJwMd8+TzDVwS/73l2/Wyns9h/tbdA9crk/rAndlJpwzCItex/mFbop+U6QOI7rAUBw
	GYJSbyLQr+jpRA5b8ZRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvYf-00045w-D0; Thu, 06 Dec 2018 15:27:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvYG-0003KF-3O
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 15:27:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id g67so1460505wmd.2
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 07:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Df89ShnVMJ3g32KsmL3/WIJp0fqIMhGz/JOKXa1E7N0=;
 b=HgYR5qqHYJ88Jw0lrpdCJLyOSbdv9FO4vXWCM8pGwOJUcIajn2CVUH2xH8ILXDlcce
 ZsNpfMKcbpMzlgFdRDfY3kaNuzvCeeSVc6mShCLHyjbfTfMg3tXOFGKViuGLhP1ce5S1
 KE+liupyaMvB2llW58kMia7wN77xeC9B6ma7C0JYFKUZN/eZarIEOzj93DKDutZgKck1
 oKqzq67NCLPItwgTse48gWirDiqjKtC1cukDR/e+JUt+uE4MBDCvwxPuE5VketHWaFRe
 UYy7IL+qte/VmfvxSUW3LtB/jpLnvRIKbDA00CyRTeJMwb4Q5fYkcv+GfHBbw8fAMOgi
 fUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Df89ShnVMJ3g32KsmL3/WIJp0fqIMhGz/JOKXa1E7N0=;
 b=Kk5/CjACp3UxHmEZ9hQWx1mld2G1hja6nOgC6EG+TAp2Wu1lx9NrQFJu6NzkAEQsXv
 f51d6R0dt+9aB0gsGdLOXei7+E7j9bOLCDPfEjLQcppzp+6jPH7Liqkb9OfOkIn/4p+r
 97E0KDuOtDA7S4MW3v3PoLbjLqhhFKaZAjS9VraXyL5s60ivN4U3QsPBDySgbLYz2TJn
 qIjlVQhWdkj959OsY3KBO4wxrEz0fTy6l0SUvvHAtbq7FD1jg406/rHJNl/BmWCMaaFu
 +3sgWxx/m43p8+lelpUXp+3bqxL2gZDoMl4JJsx/UA5p/IP4aQ7Xn6yEkaaC3iYfzkaN
 cjeQ==
X-Gm-Message-State: AA+aEWYQ5RiM57+yimLzNL+6TgEHe79hCn3WADF9IED2pt4S1q0a99+S
 xV5s8+WIP9km15s2DNMjViqRoT1THAk=
X-Google-Smtp-Source: AFSGD/UOAUAGUC4dUY3JpbXxrLhfh0pDjbKlj/Ler+5blQfm/vgD33jlVslq/Htqh+UfOdMg4qhpDg==
X-Received: by 2002:a1c:868a:: with SMTP id i132mr16024907wmd.49.1544110004282; 
 Thu, 06 Dec 2018 07:26:44 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id w6sm529728wme.46.2018.12.06.07.26.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:26:43 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: enable syscalls tracepoints
Date: Thu,  6 Dec 2018 16:26:33 +0100
Message-Id: <20181206152635.1869-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_072657_315196_00E81339 
X-CRM114-Status: UNSURE (   7.28  )
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
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Depends on audit patch:
http://lists.infradead.org/pipermail/linux-riscv/2018-October/001931.html

audit patch is already merged into linux-next.

This simply fixes compilation error in do_syscall_trace_exit() and
enables syscalls tracepoints.

David Abdurachmanov (2):
  riscv: fix trace_sys_exit hook
  riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig

 arch/riscv/Kconfig         | 1 +
 arch/riscv/kernel/ptrace.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
