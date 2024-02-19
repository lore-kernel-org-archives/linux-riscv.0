Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CFCC48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdScvtD9PfxrbqXqh6hQn70K6RvQfUmnMrcbwBHVtUI=; b=TdKnl739ftL6WX
	MS+FYvieBjNqgGrHFQwFbK3dsz1GcDc+YLmkCjJsefHz911W8N+3m5wQQwFKxK4d7mSk7KF2lxfgc
	nNRlfWcC5MyZjRlvj6NWCirTwFvxi0A0NYGuNJkolDJepeJnZPAgItTqA6OiZGOiGB0kwzrl1nQhj
	SOGpSo8c4SSPO4Y1SQAqip42f90AHbYm0DaaDNT33ZQLzYWydJ/Md2u2M4fEjGcv9pe6gw0a7tQ3A
	dP3JfCXLo7UucPiAsmuq0Lbv3JsVdJQa2gwANO1k0/WUSoKy7WZZ9RgQxCAQmVS16YxmbkkltHHmu
	+RPK0U7wyk8bPF5ZR3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Nb-0000000AYwu-2mId;
	Mon, 19 Feb 2024 13:08:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3NV-0000000AYsm-0pky
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 13:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F14F5CE0EC2;
	Mon, 19 Feb 2024 13:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3A1C433F1;
	Mon, 19 Feb 2024 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708348090;
	bh=RRgvDsXt1cJqdXB/Y2xfMBbMeZt3lZcBBNJH1BLI4L4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u5WqmQUvtkhiHOmStFgwdjLqk5Q98mfjxnBSzC+xG1NAMzaPsmu9P8BDhd1clo25C
	 atEarJG0BA0H9gfq2KBn5CERDpgEKgeapgSxMBB7kPDEVYWx4g2kClToxqNEeft5we
	 aStIAerRdTGy4izEAQoUiVNoh9XHtKHfncmnHJEM3rOl1ycTSXa/2QZiti4rBqRUx/
	 Z2slxJE0Av5i2Az+Y+3e/+gACUyCXtdGIcoXeff7usyk/Kl26pBQ2C9FVmIXiRnQGk
	 MD7GDpAKvQ6Uiq2wbskKzDwlj+QSkjbDeDyrE1O/3HdClGRC3xV4eoXVU1vnI6HGy8
	 WDoLZocaq1Ywg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 7/7] riscv: Remove extra variable in patch_text_nosync()
In-Reply-To: <20240212025529.1971876-8-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-8-samuel.holland@sifive.com>
Date: Mon, 19 Feb 2024 14:08:07 +0100
Message-ID: <87o7cceh54.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_050813_563837_4CBD744A 
X-CRM114-Status: UNSURE (   4.07  )
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

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gVGhp
cyBjYXN0IGlzIHN1cGVyZmx1b3VzLCBhbmQgaXMgaW5jb3JyZWN0IGFueXdheSBpZiBjb21wcmVz
c2VkCj4gaW5zdHJ1Y3Rpb25zIG1heSBiZSBwcmVzZW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2Ft
dWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpSZXZpZXdlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
