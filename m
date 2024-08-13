Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26F7C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 11:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ow78g1n/OVOJ2DIZcrS8RG3ngtt8oT5bKFu4SjDJKk=; b=a5rSC/85sa8IfW
	JawnW3++CZwLmaCajzFzUONAaSyvJJ38mr1Ayw0VCuQF1TUvoJnKReTEz7bukBF6t+ipwkkeoq5ot
	aD8WuY6eQiBtf9YfqwNH/jOUzSJS6gZowKjJnjJ0/GloXaFWD75V+nanLDY5tD30av+y8OyOr8DyQ
	IQKLlRGiypop4lSMoCxSBPAo/kpkLNfaJXnei7dECugzccR09yTLxQr0/gMaSjZURSDxuVTBfAEXQ
	G1snxnc6HeoPFrHV//6K7bGWNkvaUkqGCugu/SZ/E89fKcvT0+/qgKZezQXXTAR19FJJPAjatbeyB
	xWUQchvS43C0cP2oi7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpPI-00000003SVt-1Y4F;
	Tue, 13 Aug 2024 11:09:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdpPF-00000003SVY-2k9X
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 11:09:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2ACB8615F2;
	Tue, 13 Aug 2024 11:09:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D44C4AF0B;
	Tue, 13 Aug 2024 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723547376;
	bh=zkJLZ7VjTb7wgnBp77VJwEmObtRXOZseCR4dITrA6V8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=f/mcHPF+5RYZiEZd9vNqQsJn+Xtz5yWPP7xHyAnJ1Dp4vYPJSUZ4kbLJLH5ZS/FZx
	 27tzilxo/Ue5lnIOjr/Kdo2sPTelDpv55EaYonQZlAhDRr3kEyB1x3Y7fmLXIirTr5
	 sD4sYucSq7NQjDvezvUpG/qLz9FkeKig1ZgUb8EdZ1/Z6oPlSaqM8s7mtek9GmemBz
	 hUQrLX+AeCm0OFr1L3wHzfw/gBzR/wXEcw7vD8UapEog3SeWGKgwNlQbOMb2JqV0gy
	 Yy/jKU9vesvsi1NvFQ7vf3JDXfMaHz5lh49jBzm8qsfRv2634mVuoL/lHskb3gLJIF
	 pKzLERsOB1uMw==
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
 llvm@lists.linux.dev, Evgenii Shatokhin <e.shatokhin@yadro.com>, Andy Chiu
 <andy.chiu@sifive.com>
Subject: Re: [PATCH v2 1/6] riscv: ftrace: support fastcc in Clang for
 WITH_ARGS
In-Reply-To: <20240628-dev-andyc-dyn-ftrace-v4-v2-1-1e5f4cb1f049@sifive.com>
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
 <20240628-dev-andyc-dyn-ftrace-v4-v2-1-1e5f4cb1f049@sifive.com>
Date: Tue, 13 Aug 2024 13:09:33 +0200
Message-ID: <877cckadci.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_040937_758328_AFAD3603 
X-CRM114-Status: UNSURE (   6.94  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBTb21lIGNhbGxlci1z
YXZlZCByZWdpc3RlcnMgd2hpY2ggYXJlIG5vdCBkZWZpbmVkIGFzIGZ1bmN0aW9uIGFyZ3VtZW50
cwo+IGluIHRoZSBBQkkgY2FuIHN0aWxsIGJlIHBhc3NlZCBhcyBhcmd1bWVudHMgd2hlbiB0aGUg
a2VybmVsIGlzIGNvbXBpbGVkCj4gd2l0aCBDbGFuZy4gQXMgYSByZXN1bHQsIHdlIG11c3Qgc2F2
ZSBhbmQgcmVzdG9yZSB0aG9zZSByZWdpc3RlcnMgdG8KPiBwcmV2ZW50IGZ0cmFjZSBmcm9tIGNs
b2JiZXJpbmcgdGhlbS4KPgo+IC0gWzFdOiBodHRwczovL3Jldmlld3MubGx2bS5vcmcvRDY4NTU5
Cj4KPiBSZXBvcnRlZC1ieTogRXZnZW5paSBTaGF0b2toaW4gPGUuc2hhdG9raGluQHlhZHJvLmNv
bT4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzdlN2M3OTE0
LTQ0NWQtNDI2ZC04OWEwLTU5YTkxOTljNDViMUB5YWRyby5jb20vCj4gQWNrZWQtYnk6IE5hdGhh
biBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENo
aXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgoKU2hvdWxkbid0IHRoaXMgYmUgYSBzZXBhcmF0ZSBm
aXg/IFN0aWxsIHJlYWRpbmcgdGhlIGRldGFpbHMsIGJ1dCBpdApzbWVsbHMgbGlrZSBzb21ldGhp
bmcgd2hhdCBzaG91bGQgYmUgZGlzYWJsZWQgd2hlbiBidWlsZGluZyB3LyBMTFZNLCBubz8KCgpC
asO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
