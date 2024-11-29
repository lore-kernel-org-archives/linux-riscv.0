Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90834D6EBEF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Nov 2024 08:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=bqwROe8NeS8OqG
	SBffRQQeYAwFsTLG9qmupvNRmJ8vYrn0hhnBEXkBewVpc19odHgu60wkYc9NM0r+oZmIdQCMq9aDz
	LqJeg5rCE8gBO3JhVaiZYCoStsjq4YERriT/0XMaR+NwR10KANAP70lmYxHXGuYS/h4fVVld7F8X8
	YrMEK7BZDdwVnIcoR5u4Dz+S4W7gsHKthk1cx+o/SBOjsPYmPmG/icABqSRsBf6j9Wu6KSejV4E8R
	4saxpRiiGKI0C81v2/Hzf8UHfo5retwdDl7/xP2aEiVNuV+BrppMD5pAXk5flh+AyXF+VA02i5qZw
	PWNtwI8IwPcZ4kk5wwag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwoA-0000000HFuN-1j7O;
	Fri, 29 Nov 2024 08:57:02 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGwiC-0000000HEtX-1scR
	for linux-riscv@lists.infradead.org;
	Fri, 29 Nov 2024 08:50:54 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 4418E25ADF; Fri, 29 Nov 2024 09:50:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1732870247;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=nRz4NiVs0pDP4qzQif71gdGXNLnnH//pgLzRz39ffA0Y8abx77HP7e5cRrKdKBiJc
	 JZCtSwdbG8YgwDrJbG6tzrVsUlqP7s96SImvpIX79Ki2HhK7U26wfOKyybTGu9n0aq
	 RQntLy++VdZdM83s0bOxbEzxtGme8vO9UVnAF8Z4mNim/rTEdG4PnRIbxogr6GYgJl
	 HMcw+rXNWItKJuFne/3WAYO+rusnSWMrtSdYAbrQkRM4e+etYtXWJG22qAX5PS6R4R
	 djU6+F+VPKcXgEJf8yywYe9PoekfPhoyjq+iZQflKpN5giMkGFsiOShheFq3PqGlgo
	 XE+vddY0GSYzg==
Received: by mail.completesolutions.pl for <linux-riscv@lists.infradead.org>; Fri, 29 Nov 2024 08:50:45 GMT
Message-ID: <20241129084500-0.1.f2.1v0r7.0.ghf1g7ia4b@completesolutions.pl>
Date: Fri, 29 Nov 2024 08:50:45 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_005053_179523_2DC6DFA6 
X-CRM114-Status: UNSURE (   1.19  )
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
