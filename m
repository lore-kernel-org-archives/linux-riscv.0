Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87049D132A6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nH93ZKd26yBO6DphEbl7067bV1Td/tm7slxNZZr4y6k=; b=okePnd+xbFkTuN
	kvNJJ0PGGAgGZziS8ivGRAdb4UkCzuTO61kUJjjBHPcY80E4vL3qYdRbkQ/94eFThEQNFJRMdW477
	+3yQmYIXMQMeGiedBYimnmHNhg0oiamPCiYQkUpNB7hDhSTt2QSnWuDT5srzl/4jt7HnRS1Z/gunI
	YpdO8i98IS8GICuzD7TxJqGt2VEAxAvN1Ysp5A0+nXWWCCHDaDveP6IkdigLtqrKt1ROAl1Bg1Tvq
	Yw5X60k19IirOXaoGsIit5mLA1DeSdcNvXV03RFAHH787CMaEMLfW0Z7/QrvZ1QXBC9i0s9pDwBzP
	8ylM/3KKrHhn46ux2ZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uHd-0000000DJTl-38tL;
	Mon, 04 Nov 2024 10:26:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uHb-0000000DJS5-03x9
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 10:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FE9A5C5424;
	Mon,  4 Nov 2024 10:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18704C4CECE;
	Mon,  4 Nov 2024 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730715961;
	bh=w+X3jD/IbBDhpvwEqajt/6fE2DKnI3nYbmMUj+IZ69Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XuKkNx6qXQ9V9CwXutF//tCc4NatvFy8vEzvX9YDY13ar6v0JUnrIofYeDQxqHWKK
	 a0dyE1vdibGl9kFLSvs9yObV3k6u3fUeF8jpeKgmymKuqMFlTLFFqlQ6IMWaPdWWo3
	 BK3KM6Nfdx4gBsFOykvNmvpk75ftYTUboiwXOZKB30KgkPJmmjSkSnjq4JZUrCD/oX
	 6H2SDRIVAIFfGS/Rcost0rgGBIvmF0S3NxsrHZUMZQF/ck42BIP+kbjVL+oUrEJ+Ni
	 Cri5GhbO9q2MegEmGPODoR8602yjNs1OIy9DFaGHyJyGp8AqLhtzXgDtZm6ncOd0v6
	 6jsFDxRXaD6GQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: patchwork-bot+netdevbpf@kernel.org,
 =?utf-8?b?QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com,
 bpf@vger.kernel.org, netdev@vger.kernel.org, bjorn@rivosinc.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, charlie@rivosinc.com, Andreas Schwab
 <schwab@suse.de>, Anand Moon <linux.amoon@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
In-Reply-To: <172835823300.66789.3704854116445399222.git-patchwork-notify@kernel.org>
References: <20240927131355.350918-1-bjorn@kernel.org>
 <172835823300.66789.3704854116445399222.git-patchwork-notify@kernel.org>
Date: Mon, 04 Nov 2024 11:25:58 +0100
Message-ID: <87bjyvpa6h.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_022603_119994_BFBE74D4 
X-CRM114-Status: GOOD (  10.09  )
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

cGF0Y2h3b3JrLWJvdCtuZXRkZXZicGZAa2VybmVsLm9yZyB3cml0ZXM6Cgo+IEhlbGxvOgo+Cj4g
VGhpcyBzZXJpZXMgd2FzIGFwcGxpZWQgdG8gYnBmL2JwZi1uZXh0LmdpdCAobWFzdGVyKQo+IGJ5
IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5vcmc+Ogo+Cj4gT24gRnJpLCAyNyBTZXAg
MjAyNCAxNToxMzo1MiArMDIwMCB5b3Ugd3JvdGU6Cj4+IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KPj4gCj4+IGxpYmJwZiBkb2VzIG5vdCBpbmNsdWRlIHRoZSBwZXIt
YXJjaCB0b29scyBpbmNsdWRlIHBhdGgsIGUuZy4KPj4gdG9vbHMvYXJjaC9yaXNjdi9pbmNsdWRl
LiBTb21lIGFyY2hpdGVjdHVyZXMgZGVwZW5kIHRob3NlIGZpbGVzIHRvCj4+IGJ1aWxkIHByb3Bl
cmx5Lgo+PiAKPj4gSW5jbHVkZSB0b29scy9hcmNoLyQoU1VCQVJDSCkvaW5jbHVkZSBpbiB0aGUg
bGliYnBmIGJ1aWxkLgo+PiAKPj4gWy4uLl0KPgo+IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBs
aW5rczoKPiAgIC0gW2JwZi1uZXh0LDEvMl0gbGliYnBmOiBBZGQgbWlzc2luZyBwZXItYXJjaCBp
bmNsdWRlIHBhdGgKPiAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy83
MTBmYmNhODIwYzcKPiAgIC0gW2JwZi1uZXh0LDIvMl0gc2VsZnRlc3RzOiBicGY6IEFkZCBtaXNz
aW5nIHBlci1hcmNoIGluY2x1ZGUgcGF0aAo+ICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Jw
Zi9icGYtbmV4dC9jLzE5MDkwZjAzMDZmMQoKQW5kcmlpLCBJIGp1c3Qgbm90ZWQgdGhhdCB0aGlz
IGxhbmRlZCBpbnRvIGJwZi1uZXh0LCBhbmQgbm90IGJwZgooZml4ZXMpLgoKUklTQy1WIGxpYmJw
Zi9wZXJmIG5lZWRzIHRoaXMgZml4IGluIDYuMTIgdG8gcHJvcGVybHkgYnVpbGQuIFdvdWxkIGl0
IGJlCnBvc3NpYmxlIHRvIGhhdmUgaXQgaW4gdGhlIGJwZiB0cmVlLCBhbmQgaGF2ZSBpdCBsYW5k
IGluIDYuMTItcmM3PwoKQW5kcmVhcyB0aGF0IGhhcyBhIHNpbWlsYXIgZml4IFsxXS4KCgpCasO2
cm4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9tdm01eHE0NGJxaC5m
c2ZAc3VzZS5kZS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
