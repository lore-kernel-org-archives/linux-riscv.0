Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BD1C25B4F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 08:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=TOreukF7qLaqGD
	N1FnuBi7tOw3QmdPtlC5n9j0UBPBQKfoglJs8Vo1cON0K2rp0PuAMwxtZuWyWVKa+kn3n4W3HwYd9
	gzyEdiP4NoFdmznoz0pd4hTP+CBxu7qNgoYEY1jZY7kHijnbm3D/X4DuR/sK4lEcaP0cyigBjiZhq
	JCXDrNnN/Tmg8CGEnm4EkeENgI7Dq4cnE7p753H9k6XdWc7zVL6ATiROmjAH1nQN7tGUNEAbp5Xnm
	V0e7VYp7ab+dOKsuduZS2+2gYrwP5JeU1ttUNPZ4ff2kja73d30odvIRiQNJRj1TiB7pTI9srdU1g
	X5YvBPKZyz9W0zqtxPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MAu-00000001vlD-0p7e;
	Mon, 29 Apr 2024 08:15:48 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MAp-00000001vkI-3pzR
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 08:15:46 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id D0BC82550A; Mon, 29 Apr 2024 10:15:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1714378538;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=a0Bj2Fb5U/9vH6Ksck4V6IYY6s7VeojQJ567yeJS83rOh/GxMU/ZbUOMR9fUUprZr
	 B9Nso3mKqATKrog7p/yN/svERUGTWDVvLKGSNPrQznkso0yScOahLBSJuc4zVBK1c0
	 6OM7N89Wym5vJWQCfDtiPmm++Kz8ywQjUK83tOTZx6ra2T2QvLkZq4onjtxYO8BzI9
	 a9xKIsthFnQEajIyxZ9+W8300kYn0W9h6JldNK+n3yY5Y2JRsTk+Z/CbfHVRGC0+WN
	 uX9Um5HIrDRzItB9sEPebq5T58r0OqQw6xRR4uJd0e+yBIyzxwp+vIoBkt0ija+kBR
	 EeYx0E2LZcWPw==
Received: by mail.explorepulse.pl for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:15:14 GMT
Message-ID: <20240429084500-0.1.aw.nbhb.0.0cv0r90lz2@explorepulse.pl>
Date: Mon, 29 Apr 2024 08:15:14 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_011544_772567_5669774D 
X-CRM114-Status: UNSURE (   0.02  )
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
