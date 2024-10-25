Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68509D11718
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=pfs/SCff3Zmdri
	ZuLwP01RXrjb3H8Aricgd8Q+nc9MQiHWcewBsS49qWv+x66jgCePykJd2waiKt+XvGRtwZT/UjhNk
	emjxC60UIKRNrmVnjkaNzomEtq5Yuy/MQcyTXcVPLJZBWANdKDDKB/JdXCU7CxLbRKpXRzHzOCD9f
	QoXQhbss3DyPMB/+BlVbkeC+71SdkQ5e6BlOyDhdDfR3CypoyoLXHfgdGM1AmRpHaAV9H9l01gyf+
	I47h4sLb9odiFOcw4c7wUImH0aSuxLPqbHApSJLm1nK2tehxfmHoo0y17D0MfKQxtGyNKo53v88yf
	48TymUDEZcJz6wm+Iljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FY3-00000002xeR-3jg0;
	Fri, 25 Oct 2024 08:19:55 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FY1-00000002xdX-2dnZ
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 08:19:54 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id BE0D326C7B; Fri, 25 Oct 2024 10:16:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1729844237;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=Ah0gDyiTgMxM6CzHxjEUbfbWG6c6Cyc9qIO/1muwiePwZxkLvvdygctn6Bb2c8J8m
	 i/gaP6enGeupWXiNPnqm5dmBEc40N4rntKzMKXvA8sRzfL2q0SYx9TFq75yqv8R4Z5
	 2f/aXXKFkL6pqsj/bFeyM902/jU1dlTLBHasZfJpNNrUOU5tSl5xH4ZPmyO7E2GeXk
	 QvDxOv5WwQlRBfO/So0yCQBuRrU5cjGSgTm4z2LWmNkav0t80pkYDb0qYm/gTGCfw9
	 1MsjLBuGOWa+Xby4ASRGrbnbBIW6d3n8OV75sP3NuP7XnhoDAw3ju9WzMwrZNakrTF
	 wyzIa1eF0L9qw==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 08:15:30 GMT
Message-ID: <20241025084500-0.1.ef.1kxlu.0.27g38h6nn2@completesolutions.pl>
Date: Fri, 25 Oct 2024 08:15:30 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_011953_839263_D8882BA8 
X-CRM114-Status: UNSURE (  -0.02  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
