Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89302EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 18:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6EF3Ze8S1Dxz2iPy6bAQ6B+rgFr6fbeaVYMoepX9/Q=; b=Vnqhgk1oWFADSU
	cBrmJnpZb8WR9h252KVXm4hVlvsOJrth8yCpsmcGIU0yKJEh5npmo0qckn5Dnf85MXJKQCtSyY9r+
	JRaFBfIjm3+nHzGABrwHJKdZeAWvegcINeG8bh0lMcNw9Ll9YPern1uKTaaQAs/jqPB7FJeH+OxVl
	IyvZeEW7UOalknSYNFr6CtKlfPXCoQkUuu0kGyeqwIyVpv1LkDC4TwVVnGmgwHXa0VuHSWIW50X2+
	hVmD2ybda5fKiwKRokEgLPGASWfPXyycnKX0mtCCiY4eHZhVbYHUuz6WLq6Uofq4gfgUfQuFOjBBk
	9I8lrAJN7ykiVg+Ww78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJl4-009D1x-1Z;
	Mon, 19 Jun 2023 18:37:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBJl1-009D1I-1t
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 18:37:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A42D260DED;
	Mon, 19 Jun 2023 18:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F74C433C8;
	Mon, 19 Jun 2023 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687199862;
	bh=Yalih614eQIT2LuqurxvqNQgfm75eETDrMwevpyl0UE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XQ8GhO8y34/Yn6JTxmMUdGASYskNEj115WMiWYpNhq38vHYb/sWohl7ews43D9bCy
	 pSRFGu12g2vDoN9/nC0uOfkkyKd43iWd/HWJIJx0Zmv/y3z72SvczW68yUFALq2xta
	 g8iNihfQ3bZUqBRL/OKztam1VKW+3M+2QtTaZJNlW3UaKtvrSYdovuOKdEvCVMEJpi
	 2VYkAAj/e05sArJy6sMz7pArjHCqpRzznrscEpZNJ99oun8spE5vYbkppiZLIHHusb
	 Lef48YTqVcbhAJieL3hcojJlCfgWV/7XEcq3U+lBGefgWLKZ0BNfp8gdIkaU2gX4D9
	 X92sMGwiu1zYA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 remi@remlab.net
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2] RISC-V: Document that V registers are clobbered on
 syscalls
In-Reply-To: <20230619180411.12946-1-palmer@rivosinc.com>
References: <20230619180411.12946-1-palmer@rivosinc.com>
Date: Mon, 19 Jun 2023 20:37:38 +0200
Message-ID: <871qi7l2ml.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_113743_669946_07D99221 
X-CRM114-Status: GOOD (  15.15  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyaXRlczoKCj4gVGhpcyBpcyBp
bmNsdWRlZCBpbiB0aGUgSVNBIG1hbnVhbCwgYnV0IGl0J3MgcHJldHR5IGNvbW1vbiBmb3IgYml0
cyBvZgo+IHRoZSBJU0EgbWFudWFsIHRoYXQgYXJlIGFjdHVhbGx5IEFCSSB0byBjaGFuZ2UuICBT
byBsZXQncyBkb2N1bWVudCBpdAo+IGV4cGxpY2l0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYx
IDwyMDIzMDYxNDE2MzUzNC4xODY2OC0xLXBhbG1lckByaXZvc2luYy5jb20+Ogo+Cj4gKiBSZW1v
dmUgdGhlIGNvZGUgY2hhbmdlLCBqdXN0IHVwZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbi4gIFdlIG1p
Z2h0IHN0aWxsCj4gICB3YW50IHRvIGRvIHNvbWV0aGluZyBpbiB0aGUgY29kZSwgYnV0IHRoYXQn
cyBzdGlsbCB1bmRlciBkaXNjdXNzaW9uIHNvCj4gICBsZXQncyBnZXQgdGhlIGRvY3Mgc29ydGVk
IG91dCBmb3Igbm93Lgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL3Jpc2N2L3ZlY3Rvci5yc3QgfCA2
ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0b3IucnN0IGIvRG9jdW1lbnRhdGlvbi9yaXNjdi92
ZWN0b3IucnN0Cj4gaW5kZXggNDhmMTg5ZDc5ZTQxLi45NmYwZmVkZWNlNzMgMTAwNjQ0Cj4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9yaXNjdi92ZWN0b3IucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9y
aXNjdi92ZWN0b3IucnN0Cj4gQEAgLTEzMCwzICsxMzAsOSBAQCBwcm9jZXNzZXMgaW4gZm9ybSBv
ZiBzeXNjdGwga25vYjoKPiAgCj4gICAgICBNb2RpZnlpbmcgdGhlIHN5c3RlbSBkZWZhdWx0IGVu
YWJsZW1lbnQgc3RhdHVzIGRvZXMgbm90IGFmZmVjdCB0aGUgZW5hYmxlbWVudAo+ICAgICAgc3Rh
dHVzIG9mIGFueSBleGlzdGluZyBwcm9jZXNzIG9mIHRocmVhZCB0aGF0IGRvIG5vdCBtYWtlIGFu
IGV4ZWN2ZSgpIGNhbGwuCj4gKwo+ICszLiAgVmVjdG9yIFJlZ2lzdGVyIFN0YXRlIEFjcm9zcyBT
eXN0ZW0gQ2FsbHMKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gKwo+ICtBcyBpbmRpY2F0ZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFYgZXh0ZW5zaW9u
LCB2ZWN0b3IgcmVnaXN0ZXJzIGFyZSBjbG9iYmVyZWQKPiArYnkgc3lzdGVtIGNhbGxzLgoKTWF5
YmUgYWRkIGEgcmVmZXJlbmNlIHRvIHRoZSBzcGVjIFsxXT8KClJlZ2FyZGxlc3MgaWYgdGhhdCBp
cyBhZGRlZCwgb3Igbm90OgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi12LXNwZWMvYmxvYi9t
YXN0ZXIvY2FsbGluZy1jb252ZW50aW9uLmFkb2MKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
