Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD48C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 12:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lDkhYNqcRKTKnjiyCmIHK+5hO2uX9PKOgz6xdQR9vvA=; b=qdoDAU54ax/+Pl
	2YiLj9JCrYo/JPmZHPiE/exbY8vyDEv6edPPMtwKcKArtv31dHsCWgvSqIMVtZI51qIGLIeVoimMj
	2wqUO/Qnu0atei2A2Nl+dfcdoXqkkmkiboBwh49TIlV/FIXvJ+7/pkOzs5QLrjKaBIH2STr8nH/7J
	Lb/VVIABejYk7IQu8lYClp4mOuqtEwcuuIidJ0Yi+nH228T04lrwxHe3TV6r99uvuW/5qUG4VjCIW
	uWoO2J6Ovrx3o33C1len3SaYCLRHzuRWkBdQrrBtZkpkN7ugk/td/OQzkIIEkony1g+CA0c3gwAw3
	PPMlVCuF2x10bP7EpGeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr7k-00000003nS7-25vk;
	Tue, 13 Aug 2024 12:59:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr7i-00000003nRO-14Tk
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 12:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 535C9616A0;
	Tue, 13 Aug 2024 12:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602EFC4AF0B;
	Tue, 13 Aug 2024 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723553977;
	bh=FBnPKp/Sfb0dMuen8B5ZicK/kINmYY9a4pZ7ojCdmUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pg57j4bHDYZnvfDOpaB+yXdwGdeZYEXBLkiU5UIR3WYMyq5UsWNp8ej62eEm3RwOT
	 4fCQr96XJ20UquGkBggvppDZgNEL6lfGVLNTkFFFln/ZurL8WvJwjcyFPCXmLVyA4z
	 whibcX/j58SvV7z8mBHeEGukxGDtbVTBFqxTNxLWW4rmtTbl+g7xbut8TWpv+FW6Zn
	 3jYMKITa5TDAYYIyQDtk9pEyfDnMswDEw4GRm68j4opLh73LVVTFouuteMmnf3JPKZ
	 Nk0jX/ORLyfpq4v7npU3hd8yn7LrDI4Jvi/znzIov/upnHhmUyo/Q9wyezsO1eI7i+
	 MbB6LF+seiY0g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Zong Li
 <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH v2 3/6] riscv: ftrace: prepare ftrace for atomic code
 patching
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-3-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
 <20240628-dev-andyc-dyn-ftrace-v4-v2-3-1e5f4cb1f049@sifive.com>
Date: Tue, 13 Aug 2024 14:59:33 +0200
Message-ID: <87wmkk8toq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_055938_381566_A2C96729 
X-CRM114-Status: GOOD (  10.63  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBXZSB1c2UgYW4gQVVJ
UEMrSkFMUiBwYWlyIHRvIGp1bXAgaW50byBhIGZ0cmFjZSB0cmFtcG9saW5lLiBTaW5jZQo+IGlu
c3RydWN0aW9uIGZldGNoIGNhbiBicmVhayBkb3duIHRvIDQgYnl0ZSBhdCBhIHRpbWUsIGl0IGlz
IGltcG9zc2libGUKPiB0byB1cGRhdGUgdHdvIGluc3RydWN0aW9ucyB3aXRob3V0IGEgcmFjZS4g
SW4gb3JkZXIgdG8gbWl0aWdhdGUgaXQsIHdlCj4gaW5pdGlhbGl6ZSB0aGUgcGF0Y2hhYmxlIGVu
dHJ5IHRvIEFVSVBDICsgTk9QNC4gVGhlbiwgdGhlIHJ1bi10aW1lIGNvZGUKPiBwYXRjaGluZyBj
YW4gY2hhbmdlIE5PUDQgdG8gSkFMUiB0byBlYWJsZS9kaXNhYmxlIGZ0cmNhZSBmcm9tIGEKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmFibGUgICAgICAgIGZ0cmFjZQoK
PiBmdW5jdGlvbi4gVGhpcyBsaW1pdHMgdGhlIHJlYWNoIG9mIGVhY2ggZnRyYWNlIGVudHJ5IHRv
ICstMktCIGRpc3BsYWNpbmcKPiBmcm9tIGZ0cmFjZV9jYWxsZXIuCj4KPiBTdGFydGluZyBmcm9t
IHRoZSB0cmFtcG9saW5lLCB3ZSBhZGQgYSBsZXZlbCBvZiBpbmRpcmVjdGlvbiBmb3IgaXQgdG8K
PiByZWFjaCBmdHJhY2UgY2FsbGVyIHRhcmdldC4gTm93LCBpdCBsb2FkcyB0aGUgdGFyZ2V0IGFk
ZHJlc3MgZnJvbSBhCj4gbWVtb3J5IGxvY2F0aW9uLCB0aGVuIHBlcmZvcm0gdGhlIGp1bXAuIFRo
aXMgZW5hYmxlIHRoZSBrZXJuZWwgdG8gdXBkYXRlCj4gdGhlIHRhcmdldCBhdG9taWNhbGx5LgoK
VGhlICstMksgbGltaXQgaXMgZm9yIGRpcmVjdCBjYWxscywgcmlnaHQ/CgouLi5hbmQgdGhpcyBJ
IHdvdWxkIHNheSBicmVha3MgRElSRUNUX0NBTExTICh3aGljaCBzaG91bGQgYmUgaW1wbGVtZW50
ZWQKdXNpbmcgY2FsbF9vcHMgbGF0ZXIpPwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
