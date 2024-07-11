Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C3AC3DA45
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0nwgDx/umF2dioNYKMpUnZPPhjwWYl5PwiGc8hrGaiU=; b=h6m+gc8nEq8wuq
	2ulCypIBcJmxdEPQ2yG9fuZjopyvQX9eSUzEcAExPpYCSSgWTanqibYGzzFIp6bSir8qModBUtDPd
	/2K3yEykz8Pe+cUHjxfjcs38lQxO+idhrbJEXgUmMBZ1DxJCWSQPTD0ZKJ52oHN8ofxJShYOtRtWP
	kr20rD6+QEViz78JqhuujwEAO7OUYsu607MGQP7aOcUIORzKprdQVQ2Ba4Zvsk0emGH0j9Mkp3W8N
	8AfM/j0cESTCvH5fwuZkycqEEMfW3EeCIy6/Peg16HXAme1lBc4TuBHC5HepSwQV3GyIusdAXNukZ
	wnQLVDeK+N9sq3lCgfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwY7-0000000EfMp-304R;
	Thu, 11 Jul 2024 16:21:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRwY3-0000000EfKh-1jFI
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 16:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B332FCE188D;
	Thu, 11 Jul 2024 16:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1425C116B1;
	Thu, 11 Jul 2024 16:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720714892;
	bh=chc1J+KbJgvpNMoeeFyiUqQE98oI304IfhWeTRol57c=;
	h=From:To:Cc:Subject:Date:From;
	b=EOGyp/v0iiEJWVdanyIPDk/IIln4inKUS2BOLkHUo0FYdEiSZGzXxo85SYuWCiucv
	 HZ18yhCOU5nFcS8xdSFbJhY4omblJGyUAZJyUuRmO/6bhJULfyrvpd9zBBAQ+y75Gw
	 hePbPq1lDMpFGC/MM04ODj/lwXh6ga6N5EbWYFpHq2GfUJetg+P5ZqoYwgB9Zyvytu
	 ObgROYNYkD7To2n9uyYp2cQUKSbRR8v41hb2lA94mx/7lT4z8rOCV8fowahPBw5VLx
	 kkOthF825SRh4EOl7qr6zkzVgOLk8wolqsC9n+/PVmeEihIPbBdLL+mwE7WFOKxTzw
	 SCSYVMK1xIsEw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] serial: 8250: move mmp|pxa uart earlycon code and add xscale earlycon
Date: Fri, 12 Jul 2024 00:07:18 +0800
Message-ID: <20240711160720.3488-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_092135_643245_9813A9F9 
X-CRM114-Status: UNSURE (   8.00  )
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

There are two other drivers that bind to "mrvl,mmp-uart": the 8250_of
and the 8250_pxa. The previous one is generic and the latter is binded
to ARCH_PXA || ARCH_MMP. Now we may have pxa programming compatible
HW to support, making use of the generic 8250_of seems a good idea.
However, there's no earlycon support if we go with this solution. So
move the mmp|pxa-uart earlycon code to core 8250_early.c.

patch2 adds xscale earlycon support too, only build test since
I have no xscale machine any more.

Since v1:
  - split the patch into two as suggested by Greg

Jisheng Zhang (2):
  serial: 8250: move mmp|pxa uart earlycon code
  serial: 8250_early: add xscale earlycon support

 drivers/tty/serial/8250/8250_early.c | 11 +++++++++++
 drivers/tty/serial/8250/8250_pxa.c   | 16 ----------------
 2 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
