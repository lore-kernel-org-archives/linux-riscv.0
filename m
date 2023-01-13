Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9244DC6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 19:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJR4fyBTjghVHA118KwlFL/HzH+QeMPNH6fb33jGUnY=; b=BRa08CuCY0dAoB
	ShAf4/URhyPhMm4dhPnj6L3YHASI34LLAKz+i6a20864nEH8vcA3KZCeXm66FD2qwmkv/ebkYTplD
	iWiOyeGRmlAWCYNXayqj4Pp7LB4uRf+HTdqqXm8ngDF2GnHMCCZ07atYlFxKNMe5ZnGKp8qvYyTW+
	4zmqOPJyyZD7AZDNhPqQ337yOQd5nkUu2Qtx3UXJpNfMgHCLc24HjoI6JX0IKHiSm4GMwnukOwn8k
	6TmEAkACv4xt8LodFt5IibvTGRI1ZvWdpXeKQC9URcPatjLjomdNOiMT+qAykpYIE83wNsuyDLmDZ
	bt2OJbfvbvEVzEUpyzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGQ21-004GHP-Af; Fri, 13 Jan 2023 19:48:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGQ1y-004GGk-PA
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 19:48:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32B06B821CB;
	Fri, 13 Jan 2023 19:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57596C433D2;
	Fri, 13 Jan 2023 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673639279;
	bh=MxrRhT/WYvWGZu5rhwM+fbTk91iiJ1dhq93LmwQbfg4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SceHxS8W8zx1CKDpGsM/n/Lm9XgsaOVoTerzlAlDYQNxr/GDpPPKcrcWINDF0PzJu
	 NzSVqaZu/xHg/ZNvfOkmKvNtAlF636MegwQXV8v8QUH+z7faZ0T+7aIZrdlpOZmZop
	 Z1hdcBJSFqnNoY2UTl8SwSD8pmglUYDoEJxsQ1hT67rbsPh3DHdz0OrgkETIynCrHP
	 V2Vr+UvAeGJoF7HOb0h2IS/zoWP3tcZt1Vt6C9BevQgJu0wZgbB7TYpfo+7uiOW5VD
	 pV4FtBClu/RjQP8VaAJea4ESij6Kwp/UjyVyRXn0JdM4wirRtxX1fIgQL7jTbk+PRq
	 3D2XbN6SXBaqQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: Add "Code:" to RISC-V splats
In-Reply-To: <87h6wutoxh.fsf@igel.home>
References: <20230113144552.138081-1-bjorn@kernel.org>
 <20230113144552.138081-2-bjorn@kernel.org> <87h6wutoxh.fsf@igel.home>
Date: Fri, 13 Jan 2023 20:47:56 +0100
Message-ID: <87wn5qxllf.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_114802_976645_B09D57F3 
X-CRM114-Status: UNSURE (   6.69  )
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

QW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBsaW51eC1tNjhrLm9yZz4gd3JpdGVzOgoKPj4gQWRkICJD
b2RlOiIgb3V0cHV0IHRvIFJJU0MtViBzcGxhdHMuIE1pbWljIHg4Ni02NCdzIGJ5dGUtZm9yLWJ5
dGUKPj4gZHVtcHMuCj4KPiBSSVNDLVYgaW5zbnMgYXJlIG9yZ2FuaXNlZCBpbiAxNi1iaXQgcGFy
Y2VscywgaXQgcHJvYmFibHkgbWFrZSBzZW5zZSB0bwo+IHByZXNlbnQgdGhlbSB0aGF0IHdheS4K
Ckdvb2QgcG9pbnQhIEknbGwgc3BpbiBhIHYyLgoKClRoYW5rcyBmb3IgaGF2aW5nIGEgbG9vaywK
QmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
