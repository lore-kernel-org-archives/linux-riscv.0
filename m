Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A35C36018
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9v0kmJhoNivuzy5oz0ZtAumI5B63Pk7daDudNiKfOIo=; b=uatnDGldpQEt/M
	iQRXPGPaFZ55AsnfX027lWYlivRmji3NplpmNbwSLSrIr0EUjwWeLjtJH0bjljb2gXdIauYR7Tc9W
	YXU6Xq0UY9vi25SS9MfsH3CP8u1kJCvD88B6/w7EEGyZy2jnJ82GxKcS5ErTanmRinE4JYR+8CNxv
	61T+dq5dJ9oXBILg9YcWPcsQDCvKG+kUx4bdZJV9EghXRn72OftFUsDrX6xGe41wTOYmg+Je+S/2q
	pDYdZpG+gb4qqo+XjMpsBgLE/VqtlKeV4INnZCgiBmyVmxOxzXVSsevdNGGo0x9Ynu3GUQml4cuSJ
	+EyWuUuFMTRwKDKV5Bhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9kN-0000000HEN7-3FRy;
	Mon, 31 Mar 2025 07:39:51 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz9h3-0000000HDin-1PGc
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 07:36:27 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 84D81A3548; Mon, 31 Mar 2025 09:36:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1743406579; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=Pk4pifPpvx+9PvQPQMwr/BJTAIWkjwxerb5YReAq6qTH6Sm91QUrtedmD+sJNOuBE
	 mmrxdvCMuxFnfGK6MLmV2ekoPDU1IOxb2DjkD6z8gk2F5GMOoNnF1fDhnLHy2Kd01s
	 O/m+syqTw2fFQPjXdf0YQgx2l+QsqrmfGRD0YoFxkNY5xj4+sUeqnW75Sbydhtvew6
	 hTZZuVUaDYmtSoEAuk8aaQwn0Ip/IzkEYC6NbzjvyFESrbPh5WenO5xIKGNvGg+b4m
	 8+Xunb8L9eOT7ZJGmu1Q+7VqWYbf9SmQb13CFty83ruwpUUKb9ysdLX7mTwJWuZDHq
	 sVYFu2NtJEsUg==
Received: by mail.novaplan.pl for <linux-riscv@lists.infradead.org>; Mon, 31 Mar 2025 07:35:55 GMT
Message-ID: <20250331084500-0.1.kq.1kdvc.0.g75bspspih@novaplan.pl>
Date: Mon, 31 Mar 2025 07:35:55 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_003626_107371_F61A88DD 
X-CRM114-Status: UNSURE (   0.30  )
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
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
