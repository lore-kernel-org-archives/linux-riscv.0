Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B79CC48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ga83hqxlIcUeTWlk8LnrAW7Ynq6kkPjuWH/3r4xLq8g=; b=eCeS+s9PJTmntW
	Kh6NUhbnxfj9p4znoHoHJJMFnIMA7BqtRQi0EzFslfAsYZm73sK2vMrwrTAhNTUXR/WbmKAa5zdV9
	Ovf8Su73MGVNayC75I51udSYAfQLMywcv1o0///wrIRZmLR2bE342oYpx8Bc/VI0x7RHpau1sKGx0
	ZPT1mED8uaanw/5eLycw/t3Uk8Kl7bKTNc7dsEuqRXR1q+CbiHdjSTndiFBxXY5ZGXEWvxrPJel6l
	ccnP4C3oQVMzllcaTMnX4QXbTUb+vxXtifp4R7XJSvSyV1VI8kXErUduLSRF3mpJDImLe5FyD3jmY
	0rSfkdUh3czNXiM4P/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLXx-0000000DjO6-3POF;
	Tue, 20 Feb 2024 08:32:13 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLXu-0000000DjJj-0z1K
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 08:32:12 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id 89D96A2DE4; Tue, 20 Feb 2024 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1708417923;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=AWMjQhxu03aBi49ZosewP6RukvKGCnDjp/zwYJ+QunxgerVlltd8p6tL3b7+pxOWt
	 ggyJxmdXiDpDXQks0h68KMmTUIx25K5oi3dsU5VhOtpTb+bT8Vfc1peEhpoigW4sS0
	 YL6TXhBnz4r6CpqudWK3WgPLuxKcUtt0TZY2GuzNbyoqamXiOe2TMHB81+A0K2HFRs
	 MK3s31spdNhogmUaQWvou/X3Gk5UcAUNMRLDmPU0MZOlDdtrXMAup7zEpVilLwuiKL
	 E1am7XY5A2g4ibi7SMQP4oq26YsIevYZK0rNLPxTksU+fJpGQaLn4E9+i7PFJcFGn1
	 8Am3FCCDb3DPQ==
Received: by mail.createsavvy.pl for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 08:30:57 GMT
Message-ID: <20240220074500-0.1.d9.204dr.0.p2n836zrcp@createsavvy.pl>
Date: Tue, 20 Feb 2024 08:30:57 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_003211_038049_CE0277CB 
X-CRM114-Status: UNSURE (   1.07  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYWtzeW1pbGlhbiBDaXN6ZXdza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
