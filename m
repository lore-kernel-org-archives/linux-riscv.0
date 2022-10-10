Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94516C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiHhPzxbc1rHdmbvGz1/yYx2AuCj5rz646dVY3jJSFw=; b=Or2djgfZJ2W7FK
	5FZRtaDYi0z1v+pRn3Gyvy0CRlqUgpxExJDUEiZ29NKkaYo8xPI8ZYjo92mG3F9vz5M6YeG0OyYrj
	Jy6/+I9ybRlhTIwnYondD/9/jSCT4zsb48Mbnz+U71A4PMhgUxNdU2AUpUbOf8NFQGAtpLOevxmN1
	tYLv3q1hPxUlu/4msJgaPDg5wlAx99aEBKuzQs7bPfD7b7GF4w21EUHGVNR34NHefOSRtHFyeeLUa
	yTDF5WKxKMmYMTOBm7B26WnI6GzPy7a+ttJUs4d2NKM3kaU01hJBCYI5fstimtXTCPFuv5kPOXWXp
	+xBwj4blodL+tPaXw9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqqy-000a1o-Mk; Mon, 10 Oct 2022 11:21:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqqv-000a14-6r
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 11:21:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3FC6B80E10;
	Mon, 10 Oct 2022 11:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95226C433C1;
	Mon, 10 Oct 2022 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665400902;
	bh=ro0D0we0VS0olFs7ho0dNhPCwlhJAKq/pEGQ1pNC2s0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Suj8OMrz1pV+CgPSXrjlpjUtLpFVBHv1y0Z0y7LHEhR1++sNo+9Y6+RuUgBhLJeYE
	 FdSrAM0sk3Ces6Juy4/Du550Hx52dklGlMrkJ8OF+8NqgENati+0wkLgfOeDMMffoj
	 Wzkm1wuxiN5lQajSpyaifHu2G1IA3gv6c3XOrA2KtZYTWXMB05OCgkSo6MeMWVd+S0
	 6UAtpGfAfNuz0+IfTpPPMNigSSo0M9pR56h6/pjZnlLDCs9iS8QLo4ethDG7rEiSMr
	 77rMJtd9zT9w/LxG9uUfA9MMS2296k+1VGMb3J9ZI5OwMyu46Ep0xzbvrpN/WDWKNU
	 7JBVneqVfnQTg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Cc: conor.dooley@microchip.com, samuel@sholland.org, dfustini@baylibre.com
Subject: Re: [PATCH] riscv: enable software resend of irqs
In-Reply-To: <20220729111116.259146-1-conor.dooley@microchip.com>
References: <20220729111116.259146-1-conor.dooley@microchip.com>
Date: Mon, 10 Oct 2022 13:21:38 +0200
Message-ID: <87czaz7wl9.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_042145_433779_FFF48642 
X-CRM114-Status: UNSURE (   6.36  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBUaGUg
UExJQyBzcGVjaWZpY2F0aW9uIGRvZXMgbm90IGRlc2NyaWJlIHRoZSBpbnRlcnJ1cHQgcGVuZGlu
Z3MgYml0cyBhcwo+IHJlYWQtd3JpdGUsIG9ubHkgdGhhdCB0aGV5ICJjYW4gYmUgcmVhZCIuIFRv
IGFsbG93IGZvciByZXRyaWdnZXJpbmcgb2YKPiBpbnRlcnJ1cHRzIChhbmQgdGhlIHVzZSBvZiB0
aGUgaXJxIGRlYnVnZnMgaW50ZXJmYWNlKSBlbmFibGUKPiBIQVJESVJRU19TV19SRVNFTkQgZm9y
IFJJU0MtVi4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1wbGljLXNw
ZWMvYmxvYi9tYXN0ZXIvcmlzY3YtcGxpYy5hZG9jI2ludGVycnVwdC1wZW5kaW5nLWJpdHMKPiBT
aWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoK
V2FraW5nIHVwIGFuIG9sZCB0aHJlYWQuIEZXSVcsCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBl
bCA8Ympvcm5Aa2VybmVsLm9yZz4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
