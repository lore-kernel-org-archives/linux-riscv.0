Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70545C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 09:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JlNp6QTeBzhCxQv0Ma/CevfePtQC0j369lVU8Fg9xOo=; b=rOlXCQXWtP+Omo
	Mow80YOKdJXdATd4Tu7RI02dNRijo2CKpsIXum+mdpF4EvqG85kUMrIHm1KvU1VS41wBrTkODYqyO
	Brd6Ai4CIR2ep/MYaxn7tGQm0dDVgVOl6Ww9AahSvJYcAsG7lR/VZ/tZZBkfnWFPoSansN5hvhQvY
	yQHZE/tmaHcQk+XI42ZBAz9WyZy0j3IaWlxbmhv6RWVKIF43hkwSzQYANMepc95/gVMOoANSwPo0Y
	u+BdtOnWCbkO/rGouYzNq6YnE3TSyYUK9bNRSt95J7Tt0yG1okk79QgV+dmNNwAWov8Brtxv+p+BK
	YQ5joi7SsiW0LwgwJxRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhqA-00000001vxf-0JMx;
	Mon, 07 Jul 2025 09:08:46 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgx0-00000001oxb-0zyu
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 08:11:48 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id 3B5944B9DF; Mon,  7 Jul 2025 10:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1751875901; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=ls8tJPK1OdGN4Malgz4sgftzjudrM4uW2loyIGtMi9hf9MJycVAkJIs42uLsFLprY
	 nMkX+VYeruThJwbbvVY/+/WEYKbiVCDm7bNMua/+KGOQQ3Zlbj76gwMIK2buRT81KS
	 b7Us5j1n7mk1Lhm5hSoYDWEdBa3y4Z5gdeJcVH9Y/lv5WPVKGfmdpHrn8FHeq3JMDd
	 R9ZMXBwA7eCDKR0GMz1si1q8yIOdla2tBbYRFVxosFSMhX2ISnccgdin9JCHPoW0O5
	 wnUCQThVx4x/JAWPZNH2JVul02D6HIRXReD8AcLQidsCQiWGZW0XTFQZnovi275rwA
	 Dc3hjxj5XEQow==
Received: by mail.fintara.pl for <linux-riscv@lists.infradead.org>; Mon,  7 Jul 2025 08:11:01 GMT
Message-ID: <20250707084500-0.1.ai.2r36s.0.2s2onmkp4w@fintara.pl>
Date: Mon,  7 Jul 2025 08:11:01 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_011146_956012_7F7A604E 
X-CRM114-Status: UNSURE (   0.37  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
