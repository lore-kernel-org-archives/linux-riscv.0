Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7157FC88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:Subject:References:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysMAxdhH6n0pqPZqwXxcsy1K+/wY3qqE5dTxoUwEP34=; b=WbQI3qs/zhdPPa
	2H5qak/iN/z9vFTKSNXjXNL3/3TDSyiykloDsJTH/nqdow23cdcc0AuBCAgL/q7dOZwPqvaHnIUeB
	Y8yrkI3drbmTCgloKZ+YNQN2X30r8sQ1nWAtZlh+/vXsvDu/YBjkDKNY7buRtMp+rXFcqAaxLw3ye
	nZdcnW20ZAqNvPYeM3xBHVvdAwNEWOZ7cqMOmjxSASYCdZTQGjYrsvQg/04B1ukiMnIRiZ0ip8mnf
	7pAGZQkCeTIpokIn/vPeXDU2emEorLzhRmXijvncZefpTMQ6PA8qdJtpyqvBUbYw/sygrSk7j49ZH
	5TaBDH1AR0VAcmoERjag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x579z-000000001Vf-289R;
	Fri, 11 Sep 2026 19:43:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x579x-000000001Uy-1W2o;
	Fri, 11 Sep 2026 19:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:Cc:From:Subject:References:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+FAWVHdMZteQR4U3PWSHxXwSw0I30zDv6DHTjcR9Lkg=; b=R87G6gr6lXkxe8i+J+xdxIhYgY
	yH5WHJbKeLpd0VQsDu04U+niy4pXg2zmCxZJ/MWgOLsAy3TSUFXr3dD41FN+ibpLyaS32Y0RvNju9
	Waqw1GJVbG0wuvljYxogYzfHjKY7RH5RPOJ9hbJXd+T4GdMY0h8/kgBc1wpdZt1G9yUZ088Rrgv7P
	ujhjWkcG/YOghgbFMwhMlgUAfxciQsmiqG3G+YkMI6PwR0GXR7Vn3mMGtEYesVusPJg5d1ar41wkv
	OSklBNiqwNfFkIN7ZE89LgwJVa0MKS4unmQlcNmnJZYMm229CVcW9D888TYTmpfvu27N/ChVUw4Lt
	qpXviQRA==;
Received: from mout.web.de ([212.227.15.14])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x579u-00000003xTL-1qKn;
	Fri, 11 Sep 2026 19:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1789155749; x=1789760549; i=markus.elfring@web.de;
	bh=+FAWVHdMZteQR4U3PWSHxXwSw0I30zDv6DHTjcR9Lkg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:References:
	 Subject:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PQdMYdbCmN0/qyAH3uS4sgXYz9PfMR1HKtlYlSygbRYE2R8RdkCGzu/DY4eOjwQt
	 e8mc2WnKiWx3tPvTWDHvAPON4DChOVPBxJdsldd94wFeKl7h+PNHwezzT/Pb571aJ
	 FYbvmedVUWY2DYiXxrJt9IPw+1rhm3kc++nzAnv1MHTMOoIBE5V1LnusTPktcJl52
	 7ChQvYWEJIYFdRluf/NGARsjK+mCeBoUXB+0Cu4CBhfz8vTNS4mqnMz2273Jmo4o4
	 8PMUk8P0SPjKXe3CZAGambctdABSqa6MCBRW0tTfBK3+P3V8Erz6ZD5NRKMG+Jld0
	 vgcS0hXyH4p2k5r+zA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MhWop-1wbGJ40RD1-00kmPU; Fri, 11
 Sep 2026 21:42:29 +0200
Message-ID: <065179ce-d2f7-4510-a7d2-3611876ea97e@web.de>
Date: Fri, 11 Sep 2026 21:42:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
 x86@kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Benno Lossin <lossin@kernel.org>,
 Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt <justinstitt@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nsc@kernel.org>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tamir Duberstein <tamird@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Will Deacon <will@kernel.org>
References: <20260908-build-speedup-v1-8-5dc1ac01672d@kernel.org>
Subject: Re: [PATCH 08/23] kallsyms: reimplement mksysmap in C
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260908-build-speedup-v1-8-5dc1ac01672d@kernel.org>
X-Provags-ID: V03:K1:FecdXqWgFFhV+0cDqP7W+P3idEnr8ljD9GwuOnF7cECdBcJnfiW
 eos39td6ge4UbWbVoCuj7PC+ckq0HAkF9PlpfHzfj09uahB8jBnTowOstFIOPv7Ak2T4ona
 ygx+9LFE/yPPla6Lo/3NLoGBdvTHHekeUl8sEi7KFgE6tMqCPY6Z0uYjPEcmZk9yjPTcvzn
 mF6x5uN2cgH387cG0APvQ==
UI-OutboundReport: notjunk:1;M01:P0:L348JZATQls=;RgNRjJdEHX9FiGaoUmVU4IiTYuz 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_204338_596584_FEE5FE2E 
X-CRM114-Status: UNSURE (   7.61  )
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

PiBta3N5c21hcCBpcyBhIHNlZCBzY3JpcHQgY29uc2lzdGluZyBvZiAzMCBwYXR0ZXJucyB3aGlj
aCBsaW5rLXZtbGludXguc2gKPiB1c2VzIHRvIGdlbmVyYXRlICouc3ltcyBmaWxlcywgYW5kIHdo
aWNoIGthbGxzeW1zIGlzIHRoZW4gY2FsbGVkIGFnYWluc3QgdG8KPiBnZW5lcmF0ZSAqLmthbGxz
eW1zIGZpbGVzLCB3aXRoIHRoZSBmaW5hbCB2bWxpbnV4IGJ1aWxkIHVsdGltYXRlbHkKPiBnZW5l
cmF0aW5nIFN5c3RlbS5tYXAuCuKApgo+IFRoaXMgaXMgdW5uZWNlc3NhcnksIGluc3RlYWQgaGF2
ZSBrYWxsc3ltcyBzaW1wbHkgcmVhZCB0aGUgRUxGIGZpbGUKPiBkaXJlY3RseSBtYWtpbmcgdXNl
IG9mIHRoZSBleGlzdGluZyBlbGYtcGFyc2UgbGlicmFyeSBpbiBzY3JpcHRzLy4K4oCmCgpBcmUg
dGhlcmUgZnVydGhlciBvcHBvcnR1bml0aWVzIGZvciBwYXJhbGxlbCBkYXRhIHByb2Nlc3Npbmcg
Zm9yIGFuIGltcHJvdmVkCnByb2Nlc3NpbmcgcGlwZWxpbmUgaW4gdGhpcyBzb2Z0d2FyZSBhcmVh
PwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
