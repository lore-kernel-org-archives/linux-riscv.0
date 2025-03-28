Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EA6C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 08:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JXPfJW74Gq3pjaFCWdNmkkUmFvuWPngyLj4Jcj2DN8=; b=ppPDCWdhdNk5wX
	BAGWEOtNv1vQ8f7hgsBjAAnyaGbBFsKjlUyKpSnidBLlihYBVYL9faQ9RJxxVPg9wNrUg2yqNUTq0
	ZdqEnIZJ93W0TgIVSuKMAEjZXuF0oU3X2YPN9e/Yk2nGqy195oUJ8aFEQnbiZuvvXH5UkRIb/ZTG/
	5sA535H2j+kz0wyzVNXdIV0JDLHpvBmPKefJMUmujhFDMA5sWqSEmY+nJ+DGjRK2V+xwgoLCBdZYX
	L4p1L1+6dPyFQuOOQ370KWYzAhqC0Ulg6gYXhBGuAT6Vc+ZPHNR0DkibEjCaUs4zav6rua4VMaHFV
	v1btSCeEH9RJLcQUu05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4xU-0000000CtwP-2ymP;
	Fri, 28 Mar 2025 08:20:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4wG-0000000Ctja-27bk
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 08:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80FEF614B4;
	Fri, 28 Mar 2025 08:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302D3C4CEE4;
	Fri, 28 Mar 2025 08:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743149977;
	bh=ejPr9pydniJZd8kDVyQTUzYUxPFrRYV5sFNPkeJTiSk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IyteNLF0WLlCEYh0nyKyfigx0sMxtu3wyYcIL8v33GtyjOBzQzZeTPLmNAtQM0RQD
	 lMZ9pmi6MImTauzezTfR+Lybyl8Vu4WmAyG+u2TV/30Mj5DtiDg5p4aDrye5dspFG7
	 7H9IdArCWSPu2XZE3qBCfLwxkBVY7itlBq4NS5JRlIOf09oZldhKQdI58XKZALgcjV
	 VG8zovf5SMpcUWZOHrxyeBDhRkuQM3ygtG0lBnJZ+EuKUhozFS2sl4mkwd2ngwqyUi
	 E/aYY5aCJc/S65fp/+IRET7zhNz5lXp5886Xoz+hIFniDvBF8JXtOadWOHOUbuHfey
	 Xhu9CsCPqqRlQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre
 Ghiti <alex@ghiti.fr>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Charlie
 Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] scripts: Introduce ARCH_WANTS_RELA_DYN to avoid
 stripping .rela.dyn section
In-Reply-To: <20250328075536.238782-1-alexghiti@rivosinc.com>
References: <20250328075536.238782-1-alexghiti@rivosinc.com>
Date: Fri, 28 Mar 2025 09:19:34 +0100
Message-ID: <877c49tvmx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IHJpc2N2
IHVzZXMgdGhlIC5yZWxhLmR5biBzZWN0aW9uIHRvIHJlbG9jYXRlIHRoZSBrZXJuZWwgYXQgcnVu
dGltZSBidXQKPiB0aGF0IHNlY3Rpb24gaXMgc3RyaXBwZWQgZnJvbSB2bWxpbnV4LiBUaGF0IHBy
ZXZlbnRzIGtleGVjIHRvCj4gc3VjY2Vzc2Z1bGx5IGxvYWQgdm1saW51eCBzaW5jZSBpdCBkb2Vz
IG5vdCBjb250YWluIHRoZSByZWxvY2F0aW9ucyBpbmZvCj4gbmVlZGVkLgo+Cj4gRml4IHRoaXMg
YnkgaW50cm9kdWNpbmcgYSBuZXcgY29uZmlnIEFSQ0hfV0FOVFNfUkVMQV9EWU4gdGhhdCBwcmV2
ZW50cwo+IC5yZWxhLmR5biB0byBiZSBzdHJpcHBlZC4KPgo+IEZpeGVzOiA3MWQ4MTViZjVkZmQg
KCJrYnVpbGQ6IFN0cmlwIHJ1bnRpbWUgY29uc3QgUkVMQSBzZWN0aW9ucyBjb3JyZWN0bHkiKQo+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
ClRoYW5rcywgQWxleCEgVGhpcyBmaXggbWFrZXMgaXQgcG9zc2libGUgdG8ga2V4ZWMgaW50byBS
SVNDLVYgdm1saW51eCB3LwpDT05GSUdfUkVMT0NBVEFCTEUuCgpUZXN0ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQHJpdm9zaW5jLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
