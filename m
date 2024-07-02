Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24854C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/zPbP+ZN3r08t/h1RM6U3AZ1VUtr4BGofg2NS1Pxic=; b=Q7pSeY7r+/Voa1
	NrkhdRi4n+NDGPHcHwz1rGTpzP3iysFECjv7pa/UgoAN6ER9j7ewAd1nGOkYoqq3/rSkyNiZd8qfz
	d9hGqdW7vr35Wqo4FGydBlYxRDMNqK5R+HRovZur36Ehwj1mULDmJtl6Y6ekFlw00wuaQJm3XMJge
	1sCuuJBKq6IQgmA9M7HiboINXShu/55/8lNMd1FCnvurt3Z53U1TJEpGK5EW7BKQqCr/VG8k7lskN
	DFTs9VUWWJYa49zqzX0mqp0QQhiPW8xAKO+qcZ1gLo9kXERWTRw6U13wtYrgU3ta4pSCBqSRuRdkD
	SH8XzLoFCcr3twyo7lbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOYDz-00000005u1d-2NGC;
	Tue, 02 Jul 2024 07:46:51 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOYDw-00000005u0z-2Psq
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 07:46:50 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id 5E54123D9C; Tue,  2 Jul 2024 09:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1719906403;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=g+qrR0g+bJmUo9/Szp9WkAKNI1sYmUZrPSOlGEMFaqAsQ5Hggci8P0l+GEQyVtBSO
	 FyUriaHgqvLuwzBvMXHHZhUVzhJjr8dOrO891Wv4EZpLHPCk/bPMVyrjIHd1ki/do7
	 +fEl1Gr/VM5SIxCKksWGyaLJDRVdctWyoH+RcWtP+DZOhoyDn+aTTmB0VmdhwEazT7
	 gWUpRKILSpJ6SWIYTiJ+s50nVX4DNLcxleiQPzCjY5aibs3i1+Z1gkBsnfy7puD2eY
	 4m7OnX272hXIeEfpJ0YmgrEMH6gbbxRjnRvQOZxnIJPDDv2M5MtHO/+3+WO1nyseZ8
	 Msf46jmGkekUw==
Received: by mail.explorepulse.pl for <linux-riscv@lists.infradead.org>; Tue,  2 Jul 2024 07:45:34 GMT
Message-ID: <20240702084500-0.1.c4.sgls.0.792gf2n5up@explorepulse.pl>
Date: Tue,  2 Jul 2024 07:45:34 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_004649_379020_64DABE2F 
X-CRM114-Status: UNSURE (   0.65  )
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
