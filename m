Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A765EC87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JlNp6QTeBzhCxQv0Ma/CevfePtQC0j369lVU8Fg9xOo=; b=OO3WbhcGW7kF0a
	XC05i2xBlOTRN3z+ui7cO8UnQRg+Ikofbs2Dh1Qnf8WwseO7szwNyjWhmc8A0Qn0jr36Hx9j8uovy
	3InUf+MevGu9fHllUk2CcSxLS2phhJjh/7SbINhyF/HxRBrvUjQ6RvndFAZoSPqWQwefWS6U46ipb
	70kmhMNa4g1DDpF38sI8rPOkhZoOdOwqdpidMIRek9qfKjl5h6ZVYZr2hQwao9ApE7weGUEbw1mb4
	ZQbQ2F2Fd3bCOJz4dURvWlxaumYpGfP+Kqo/e160hqxe6EhailO32nKFcVQwbadyKWHPructgbnIK
	pA4hVSKKB4B2y1c6UJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvmr-0000000HZQQ-1SoX;
	Thu, 07 Aug 2025 08:15:45 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvmE-0000000HZOs-3M8j
	for linux-riscv@lists.infradead.org;
	Thu, 07 Aug 2025 08:15:07 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id DBCB94EB3C; Thu,  7 Aug 2025 10:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1754554366; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=O6WVUX6clVVxs0xv5nn+IjcyURMyWLQOOJvTXFqJyAJ1NIbapPxSuuYOyVx+bFzNW
	 GJZ2zYdpWfk0+mRcuDUqZp2hmkhmLlv04hjQMMMrWEBtPsay+VFfRvvek3NmBjSmoH
	 FqPwOMmEZmxk+rRZUGw4+bHIz1fNG6dIs+kZTU2MloUvUkQO8cb9+vdx2TanpYU7yl
	 bQN5+wn288yZWQRjVLdm+MO6WjSMtZL3E2jf/1P9jgTXpIsU0GISR+Vcz+XxJPgkV0
	 z2f82UMdzGl0iBqA98iPQ6jP16uleAu1NBYvbkn6T6+1I2ik+Fjjg8rDxZLRh5jcVj
	 D7/ivZ9XX+Ssw==
Received: by mail.fintara.pl for <linux-riscv@lists.infradead.org>; Thu,  7 Aug 2025 08:10:35 GMT
Message-ID: <20250807084500-0.1.b5.33zgu.0.l98kp3anb7@fintara.pl>
Date: Thu,  7 Aug 2025 08:10:35 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_011506_984412_F11C5C70 
X-CRM114-Status: UNSURE (  -0.21  )
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
