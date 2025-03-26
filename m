Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0A9C36008
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 19:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1e3vVzmYW0jP5Bb1LOIX/ZMoTNPCSCFPn1GvOHCykc=; b=VahyaRkH36yij9
	eu5SZG6Xnq/0Hh+SsBOZdA9w7/Pto2X97N3ylGUHGLSEbbFkKytfXg1BeicGvKxzpLZCeG0msmSxM
	yEUIdu15yU2mnEJ4cqUuImkTiQSbq4c/wPM26F/bF4yfzhysJfW7TJybIVcFKwqCc3keeLg3qRJZ+
	+6Rbzz2bNocMTeKwUJ+/r0XPb/WCkRwVk6bQrNBt1teLcd49h7e5tMsFD1evkP9kBV/4ZAKqrztEG
	PAnK2QgGVtvBc9gDGhJD67Yo/PGu5ycKcD7T7AtAGPh3klSOMLmyhoIaebw1NkHS1JJLWq5rOAxm3
	SneC1s1IjEsIhiPGvPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWqT-00000009VB4-3OaJ;
	Wed, 26 Mar 2025 19:55:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txWqR-00000009VAW-1Gya
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 19:55:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A612FA4172D;
	Wed, 26 Mar 2025 19:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4E3C4CEE2;
	Wed, 26 Mar 2025 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743018922;
	bh=nFrsPsXGyg7m+ZZ6UQ4BRIYIgHOwnQskzRMAesy+Du0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=doJ1WddbUcYChQOFokGgl3KdzGDlzBfhe6fkJbReCCmt6xhxinm/FoT9DQGNAhaYZ
	 7UcEjps/yH0faors5yXpHFdxXIU/ZANQ9ZLEq+qgLrCtJD0YMWWZlXMKvsDnHLBKZq
	 /eCAhQhWle9NPpVUYlWiiV5Km3Qr2vGLnZSQkWWnwk9zZDFFjymgfJeGYH11akq20e
	 XWf/3DeU2vNMMR8RZpMeBnK34VSwTnx9zgNzBhajnKmiVaiU+Lw+xEgKpLLSL/iF+E
	 vEQfLv5S1RiXxYT3Rd+IqKeNuMHEgTT5cZoW3apsv+R7vTdTxnB2d9HS/tMeX92//M
	 x0dM56g/0E5PA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Yao Zi <ziyao@disroot.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>,
 Ying Sun <sunying@isrc.iscas.ac.cn>, Arnd Bergmann <arnd@arndb.de>, Yao Zi
 <ziyao@disroot.org>, Kent Overstreet <kent.overstreet@linux.dev>, Li
 Zhengyu <lizhengyu3@huawei.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/kexec_file: Fix comment in purgatory relocator
In-Reply-To: <20250326073450.57648-2-ziyao@disroot.org>
References: <20250326073450.57648-2-ziyao@disroot.org>
Date: Wed, 26 Mar 2025 20:55:19 +0100
Message-ID: <87tt7fk1nc.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_125523_404085_80E25201 
X-CRM114-Status: UNSURE (   5.73  )
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

WWFvIFppIDx6aXlhb0BkaXNyb290Lm9yZz4gd3JpdGVzOgoKPiBBcHBhcmVudGx5IHNlY19iYXNl
IGRvZXNuJ3QgbWVhbiByZWxvY2F0ZWQgc3ltYm9sIHZhbHVlLCB3aGljaCBzZWVtcyBhCj4gY29w
eS1wYXN0aW5nIGVycm9yIGluIHRoZSBjb21tZW50LiBBc3NpZ25lZCB3aXRoIHRoZSBhZGRyZXNz
IG9mIHNlY3Rpb24KPiBpbmRleGVkIGJ5IHN5bS0+c3Rfc2huZHgsIGl0IHNob3VsZCByZXByZXNl
bnQgYmFzZSBhZGRyZXNzIG9mIHRoZQo+IHJlbGV2YW50IHNlY3Rpb24uIExldCdzIGZpeCB0aGUg
Y29tbWVudCB0byBhdm9pZCBwb3NzaWJsZSBjb25mdXNpb24uCj4KPiBGaXhlczogODM4YjNlMjg0
ODhmICgiUklTQy1WOiBMb2FkIHB1cmdhdG9yeSBpbiBrZXhlY19maWxlIikKPiBTaWduZWQtb2Zm
LWJ5OiBZYW8gWmkgPHppeWFvQGRpc3Jvb3Qub3JnPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
