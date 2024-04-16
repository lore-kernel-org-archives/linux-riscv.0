Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B469C04FF9
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 15:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyBxbq/lMr7Pj4F78b/nV29Vns0OKiV8cDzNqLL7+2g=; b=eYCOfRMmKy35Nw
	KdQ3JUXlonrffXNJM7uX3GRkdINrUqlZ4KtR22eiFKY82oGyv0zOJHtzCiP1Hbg9WlGa4blVy5k78
	b5OLh/QAixU5EU7ZKLKWCosZFKo2n+RmM8hAtI171gbObvFoUUuQ/S9giNJR6OUfK8MBv0YC5VS1n
	EPJWb08BT7Wps3WPxyuG9axTctk5np1QBLTcB4E12ZB+8fAFhsPhX3jPYeWu4rgu9jIHIHrh4mc/+
	W+PEkqQRjuq8YehHZ4A61vnEmkahPxt4NZxin9N591aP6qW4N+0fDlfZS5sdHtf+XtXmDPOyFHTHM
	GbYFS2Wf0iYWFoyZaV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlAl-0000000CsiW-2IDY;
	Tue, 16 Apr 2024 15:56:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwlAe-0000000Csb2-2jDT
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 15:56:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79513CE0F83;
	Tue, 16 Apr 2024 15:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792D7C113CE;
	Tue, 16 Apr 2024 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713282989;
	bh=xj5oIWlYq20UZfWwDIb9TzDyZ90WyaHjoi8dkpzi3hY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PzG0c6gXNNiSNW/OjmEVa1jcml2jIk4toUumXHj1PFWRlW2puT5qUARDvSSBmZTld
	 GCIGfOAW1VrnjTIUNavavaDJSr1Gd6sgvwCnf1q1E4zJyQ0c/2xGB5qkqPuFUmSIP1
	 WV83tvTswwBRItV5wgDOF4QtZpNeolSypSzp89MKMt8qQE86rh4Q29J08tgh8oa8vy
	 8gNUYmIGxZIwan4Vu3AM5C0yy0H+O3SMqtkvl1DpLDRJDWwL9UuARjO2nZ4x38Sxtx
	 RyRhgZY0gKSJaLestj4GkhWJgONsgLu4ePJn4xXcsB8Mbs8Dgr/UxuVimLexjZD4DM
	 NWD56iIML/gfQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcao@linutronix.de>, Mike Rapoport <rppt@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Andreas Dilger
 <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Theodore
 Ts'o <tytso@mit.edu>, Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Anders Roxell <anders.roxell@linaro.org>, Alexandre
 Ghiti <alex@ghiti.fr>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
In-Reply-To: <20240416173030.257f0807@namcao>
References: <20240416-deppen-gasleitung-8098fcfd6bbd@brauner>
 <8734rlo9j7.fsf@all.your.base.are.belong.to.us>
 <Zh6KNglOu8mpTPHE@kernel.org> <20240416171713.7d76fe7d@namcao>
 <20240416173030.257f0807@namcao>
Date: Tue, 16 Apr 2024 17:56:25 +0200
Message-ID: <87v84h2tee.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085633_205702_63B40D86 
X-CRM114-Status: UNSURE (   9.56  )
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

TmFtIENhbyA8bmFtY2FvQGxpbnV0cm9uaXguZGU+IHdyaXRlczoKCj4gRml4ZWQgdmVyc2lvbjoK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4gaW5kZXggZmEzNGNmNTUwMzdiLi5hZjQxOTJiYzUxZDAgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IEBAIC0yNDUs
NiArMjQ1LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiAgCSAq
IGJlIGRvbmUgYXMgc29vbiBhcyB0aGUga2VybmVsIG1hcHBpbmcgYmFzZSBhZGRyZXNzIGlzIGRl
dGVybWluZWQuCj4gIAkgKi8KPiAgCWlmICghSVNfRU5BQkxFRChDT05GSUdfNjRCSVQpKSB7Cj4g
KwkJbWVtYmxvY2tfcmVzZXJ2ZShfX3BhKC1QQUdFX1NJWkUpLCBQQUdFX1NJWkUpOwo+ICAJCW1h
eF9tYXBwZWRfYWRkciA9IF9fcGEofih1bG9uZykwKTsKPiAgCQlpZiAobWF4X21hcHBlZF9hZGRy
ID09IChwaHlzX3JhbV9lbmQgLSAxKSkKPiAgCQkJbWVtYmxvY2tfc2V0X2N1cnJlbnRfbGltaXQo
bWF4X21hcHBlZF9hZGRyIC0gNDA5Nik7CgpOaWNlIQoKQ2FuJ3Qgd2UgZ2V0IHJpZCBvZiB0aGUg
aWYtc3RhdGVtZW50LCBhbmQgbWF4X21hcHBlZF9hZGRyZXNzIGFzIHdlbGw/CgoKQmrDtnJuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
