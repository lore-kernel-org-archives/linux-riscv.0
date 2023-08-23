Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3E5EE4993
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14s7e+/idOTocjZEivcO3+ItkRSLdUv94RMO2LtHf7U=; b=VejEuOKEbTTiwA
	ZlwzAi7V8Jg2jcFKVBHUj68tG/m4dB0c6uhEbRGoCsVtbvY5S/HfASJU71F0W7Dw2mrS/b4pRH32a
	5/cQyn09SJj/dafpDPybt24x8Okq1Ak+ZY/GCLtftKOdY0M3pSn1CTEXB7I9jpUDDy7/2xW1A5xH6
	JdW2BGjho75R0fpQx2f7dUK6e7mN4wXQ74mDqvZ65SPrcJjatuCIBadOqMO5RNWWe7V8+UtNYSjsi
	WOpnIrg0jYteVrSdVQtNbUau5Mho/kYTqc1Yd/NT4vLEzBRMrshjma8+Nvz6ZdYaBbU2am5N7sF0k
	t3Iue+9jlcr3YleAJ6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjYm-00Hb7p-33;
	Wed, 23 Aug 2023 08:49:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYjYk-00Hb7F-2J
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 08:49:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1DE6460ECC;
	Wed, 23 Aug 2023 08:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D592AC433C8;
	Wed, 23 Aug 2023 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692780589;
	bh=+eMghjkLxbUewcYWSKbRAkX0vlBIDr6r3dCdT6cTBSQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DAEAmEH2fxHFQIX6DdyiHMxRmy501avm1T7yaZzviZvOgJJyVWEEY882POObrHCDT
	 kcPoaXPXqsK/zdyuWvrI6EgdOOZt8pUYHXNESvonsZzC+gThRPXhpnN5u8EBxZ8eOa
	 +j4Xl0j3G3swRWx8uZrVPyH+CEckjQ8K9zSOHwOHrfgnioRlLSSzikt9tABxRDYnsr
	 7XUVsje1RzwV/O49IYm4I2CVp07iAbiZaRS5246+I88qrXzSbYyHlHGZ6pdJDtm0Lh
	 yzPwmv6VQkB1bbV9LtkkwRpg279wrSDzxBTG+W/hRfW4rMiYXI7WsG9s+HRzrH0Q1E
	 5q1A7K37vjG9Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, Guo Ren
 <guoren@kernel.org>, Drew Fustini <dfustini@baylibre.com>,
 linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] riscv: Require FRAME_POINTER for some configurations
In-Reply-To: <20230823082845.354839-1-bjorn@kernel.org>
References: <20230823082845.354839-1-bjorn@kernel.org>
Date: Wed, 23 Aug 2023 10:49:46 +0200
Message-ID: <87cyzep2hh.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_014950_803883_F98A683D 
X-CRM114-Status: UNSURE (   4.23  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBTb21lIFYgY29uZmlndXJhdGlvbnMgaW1w
bGljaXRseSB0dXJuIG9uICctZm5vLW9taXQtZnJhbWUtcG9pbnRlcicsCgpzL1YvUklTQy1WLwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
