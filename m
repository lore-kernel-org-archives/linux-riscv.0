Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB78C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=PkmnKkZAupHMnf
	Id9CxpOxTHVMWj/XDcMQTd6+lDrdQyBQMiGJ9ju+VqqpvASUXGCtAOjrCtnC2Nd6R7guyyoRAMy98
	RkyIayvdnwx0dYhyHW3Qz+ZgyuF+g7l0dQ7YUd1w/e5gbOFkd/q5nAmGmgYnlgYj6tzhKZu6x7atl
	IL3uSKKv34aYn1ZOlDOVYV5T8xeyg3qab79bmqbvmdhkPcDtR82Uk/EbWJpL3wbxbilkJBhXp60no
	BQG+NHhVBSuX1Omu+SQjBGehSrTTbzan1RFeTLhbUFRgYilMJiBhRzzkoG6O8EF3zaAihTcGScw4S
	ZYQVFxwMCeNMdwHUQcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnzV-00000008nVa-0shy;
	Mon, 22 Jul 2024 08:01:53 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVnzR-00000008nSy-2Nj4
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 08:01:51 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id C0E9724A29; Mon, 22 Jul 2024 10:01:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1721635270;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=XyvETitln3dyM/OQUxJanWX2pLmBpz3o0n9t4kmQdsCIjYUQDny8EKgRmFC0jkxm5
	 EJ3YG+p6eVTf97Sesm9OYm9JEyPngFwumwhUG+Kd2nP2yBNSt4EZgW5Yh5vBITL7DT
	 8IV5bDWtJgf7zxwO1muCzM2NObs3ZCfdaJ3Fiv57PD05m52LP2YkNzkLBbdqJQKlHB
	 FVDkJuGeOGzoFf6ESYfVgr4YKa5MQANLEJg7EzYewd7B5ODHrXrfHt/0hZ7CEgf5MR
	 AFKOscappwGqYtpzfdxoMsnzGO09Glc+lshwUbUFNK3Io6ZDBcKAhPCnP22yuBH9+x
	 FG611tbBRxk3A==
Received: by mail.explorepulse.pl for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 08:00:46 GMT
Message-ID: <20240722084501-0.1.ci.xgk1.0.0ej2ppj8pg@explorepulse.pl>
Date: Mon, 22 Jul 2024 08:00:46 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_010150_310063_45A0D8BC 
X-CRM114-Status: UNSURE (   0.35  )
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
