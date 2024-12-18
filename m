Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F21E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 08:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=XHIo7cjx/8Tomv
	XU5ALn8ouo7MzvtVp+1q8IkdTYthMi11gXHxAHglbkktmUuxNCMVLcJ0FjFR1nqwd7adeCkrM0WO1
	mu3mGjYg5+YTyvrf3jfEQgCteX5awICjlrm/GeWe3VcEV5bJ7Xav/DXlYslJ/6EfL26TyPNrI5/ta
	Z+q/NNaBXMHn3j5f882cZ7eODLQpj+pdf1s5ySfZQ8jhamFuRsAt0xDEKLT7mGQgWpehk6BDGlMbC
	wxoVvWG7hroR0uPnHnp7hDiEYO3bNGKLmTvdCUeE4j/0GuoibYILDza0hVSqmTWVDTZ/B33r1s/Xx
	fq6h6LuKdRkkZbBcoqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpjk-0000000FyPA-2Am0;
	Wed, 18 Dec 2024 08:48:56 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpiY-0000000FyAJ-2NeN
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 08:47:43 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 1718324FD2; Wed, 18 Dec 2024 09:46:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1734511661;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=HcWXdz7dVBMu+3jJitzyfYWp5UqwHcuHdfA7i9zAVsczQTBiKeiGYfnywI8x5DbZJ
	 gCGXy5IhofCFQHOp4UdeYf18bFGR5YX8y9LunsBTY6pm2HmmOx4WERi/QFc+q9Cbot
	 mRWJ4BKDJnqCO4ty7E3AIpi8dXQufc/fl4me2DfaCizZRqIsDWUD1oJeT3myEv+M8F
	 C9YXEHecMKnUk1qah3g3rqgNm+jeoiwD093HgMyPmG6ksQ7BKxAHNe941DthN1pAEH
	 SD99STW8yYkbpv9eQnFU1zpuzn4fBBV4qmlqQw1gT4CyxtHx2Xv8w6JvINNRqQE8wx
	 pBTMlw/xxforg==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 08:46:07 GMT
Message-ID: <20241218084500-0.1.ff.20t00.0.4p1fdyrmu5@completesolutions.pl>
Date: Wed, 18 Dec 2024 08:46:07 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_004742_740964_7321BAE7 
X-CRM114-Status: UNSURE (   0.93  )
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
