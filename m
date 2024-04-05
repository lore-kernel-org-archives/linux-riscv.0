Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA3ACD1284
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpiI7tUqKTYwTGxwAEhSGH/3xetBgrpArbDtUZhC1Uo=; b=DpPZAgKKWat3md
	jykiPHOr4BsseUCNQWxMs9Sxj5dEl1km6P/tcDpjHZlXYMweWZQx/+fLiJ9ueMUf4ebjDwXXEgu4R
	T21D0rhlZvUyE0LPBQGaSqy+m1AiZ8ANqzIzhQY9PtT7mAKx6+86WzhzAyswee1ECi8QmuHhFyXBU
	FfxYXCwP+x3lS5JXa5lA2G+dUay/dzAIvE/r6zo2FdBJkOViF/R7DWklrUZ0kUyecuvMYndJuvREB
	zb/B6vkKcX8EEuXKqo4h8AhRjVjzjyr1umymCF7ILymZP97dOUMiQgHCysFJY7wTvI6ts75MjLxiH
	7wwhcLRFktO0dpqbOgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnYH-00000008H4U-1MuJ;
	Fri, 05 Apr 2024 17:40:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsnYE-00000008H3n-30g1
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 17:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD6A9CE2542;
	Fri,  5 Apr 2024 17:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E43E1C433C7;
	Fri,  5 Apr 2024 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712338828;
	bh=UvNDKM0UOnNcyat9LauY+9hj47mP0EeGvw/4ADSk8wU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sdZuNBr8rl1qODzgpBJXziDwJzT2lzXtfPUUnGVvsHkhiB+kbM+r/Zo3hbcLyFaHU
	 MYywkK4hw+adZYTH9CmbVLYe2NlR6jzCLAAiYpqpOz4sBEAXxlYChQhke/EIA5caMA
	 +XhSrLppLH0PIl60QK7TL0Bgm7h3HjTtqR3MBZJ6zpmCazLG9ZRf1TcgEIdjOs+RFt
	 v6eSOVGFGuuyy3pdU4Qfd16rZ+J3l2cY6gBibL41UX1czeyVkIzIVovqyO/WyU7fO5
	 QPUYsbfmDwvyYsKIC2t8jqvcSveffcfKwxWCI6Keiji7TqbHbdeoeEtaXwd3cigqwk
	 v7o2T+kUcPhGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6E75C395F6;
	Fri,  5 Apr 2024 17:40:27 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf] MAINTAINERS: bpf: Add Lehui and Puranjay as riscv64
 reviewers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171233882787.27871.641568432293387927.git-patchwork-notify@kernel.org>
Date: Fri, 05 Apr 2024 17:40:27 +0000
References: <20240405123352.2852393-1-bjorn@kernel.org>
In-Reply-To: <20240405123352.2852393-1-bjorn@kernel.org>
To: =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@ci.codeaurora.org
Cc: ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
 bpf@vger.kernel.org, netdev@vger.kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, bjorn@rivosinc.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_104031_124751_2A81DB0F 
X-CRM114-Status: UNSURE (   7.23  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIGJwZi9icGYuZ2l0IChtYXN0ZXIpCmJ5
IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0QGtlcm5lbC5vcmc+OgoKT24gRnJpLCAgNSBBcHIgMjAy
NCAxNDozMzo1MSArMDIwMCB5b3Ugd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5A
cml2b3NpbmMuY29tPgo+IAo+IExlaHVpIGFuZCBQdXJhbmpheSBoYXZlIGJlZW4gYWN0aXZlIFJJ
U0MtViA2NC1iaXQgQlBGIEpJVAo+IGNvbnRyaWJ1dG9ycy9yZXZpZXdlcnMgZm9yIGEgbG9uZyB0
aW1lIQo+IAo+IExldCdzIG1ha2UgaXQgbW9yZSBvZmZpY2lhbCBieSBhZGRpbmcgdGhlbSBhcyBy
ZXZpZXdlcnMgaW4KPiBNQUlOVEFJTkVSUy4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFy
eSB3aXRoIGxpbmtzOgogIC0gW2JwZl0gTUFJTlRBSU5FUlM6IGJwZjogQWRkIExlaHVpIGFuZCBQ
dXJhbmpheSBhcyByaXNjdjY0IHJldmlld2VycwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9i
cGYvYnBmL2MvNzZjZDMzODk5NDc3CgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRl
ZXQtZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0
Y2h3b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
