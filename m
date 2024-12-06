Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AD4E77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxE619OvxaFLSbMI4/JbCbqWFnybGFcJH60kaGjijiY=; b=WAwrFOHso6qiI5
	OndwLBmTwBo5yVLCYDFhO2yBVknzmmStCq/AfiS4E/UErxWLlo+ueQR/MRdIkXF3c3aHcB5e3flpl
	2hJB5er9x4reLU0jpE+QIMHDKX+Bk3whO5a0kJMdFFzIuouGOJS3cNpBmAIm5n+ILefebdm1zvdjD
	2CmCgzcXBCNDxrUMMvMrY5QNIOGCnPtImLr3ysekUBRIZz1W4yhykVY4Whioeq2rIX6I5fnYJbSrI
	wh9m9GFpiOp5jgm1Cw8+zcYc/XKh8hrr4l2S5Mq8p/9gpK+byL+jQiTPfi3ocRewLo8WzspyUm+4R
	Ijekg+G8qGOpwjqPMKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTs2-00000000xHF-3Xsd;
	Fri, 06 Dec 2024 08:39:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTrz-00000000xGe-3fAo
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 08:39:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69C395C4C2E;
	Fri,  6 Dec 2024 08:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADA5C4CED1;
	Fri,  6 Dec 2024 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733474366;
	bh=IG0P5Es82HkdWekjNgM95k8o0xWoTGSEHqiHERM+RmQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EUpjGa34wpQRVGU4ztNhbAfwSEaPX+pHiUAW1W2tKjoZldksIl4hEwxF1iz13QShs
	 NBW7Gt99m0rHp8mOI1cqhhsUzck9pOinr/cqv7PWrQY438tXj7WiQXrPrBObp8ZD2K
	 X4jO20ME+DbXqk8IMJTqnVDXV/UquCL7vRU4DxPr3DOh0ap5QwW2IxXDmSzinXQnB2
	 NhL6HWASxtPZOG73WrzYRLsOW9oAklZ0WCHp7G7bDUcA+7bLMBRotIhdIqCheeKQsS
	 oD4pWSlOk3h4spx/mLEdtgy9v0j9GTRmxelvQ17hhW1otA7w22EuLp9PfWcf0uoe6i
	 ELtCvmbnMiTmg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Evgenii Shatokhin <e.shatokhin@yadro.com>, Andy Chiu <andybnac@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor
 <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, Bill Wendling
 <morbo@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, bjorn@rivosinc.com, puranjay12@gmail.com,
 alexghiti@rivosinc.com, yongxuan.wang@sifive.com, greentime.hu@sifive.com,
 nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
 eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
 samuel.holland@sifive.com
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt
 improvements
In-Reply-To: <990b942d-fe91-4bda-a38e-1eb47f2f6086@yadro.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
 <990b942d-fe91-4bda-a38e-1eb47f2f6086@yadro.com>
Date: Fri, 06 Dec 2024 09:39:23 +0100
Message-ID: <87a5d9gq84.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_003927_952722_7BE4B7BF 
X-CRM114-Status: UNSURE (   7.71  )
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

RXZnZW5paSBTaGF0b2toaW4gPGUuc2hhdG9raGluQHlhZHJvLmNvbT4gd3JpdGVzOgoKPiBPbiAw
My4xMi4yMDI0IDE1OjE4LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiBBbmR5IQo+PiAKPj4gImF0
b21pYyIgc3BlbGxpbmcgaW4gdGhlIFN1YmplY3QgbGluZS4KPj4gCj4+IEFuZHkgQ2hpdSA8YW5k
eWJuYWNAZ21haWwuY29tPiB3cml0ZXM6Cj4+IAo+Pj4gQ2hhbmdlcyBpbiB2MzoKPj4+IC0gQWRk
IGEgZml4IHRhZyBmb3IgcGF0Y2ggMQo+Pj4gLSBBZGQgYSBkYXRhIGZlbmNlIGJlZm9yZSBzZW5k
aW5nIG91dCByZW1vdGUgZmVuY2UuaSAoNikKPj4+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjQwNjI4LWRldi1hbmR5Yy1keW4tZnRyYWNlLXY0LXYyLTAtMWU1
ZjRjYjFmMDQ5QHNpZml2ZS5jb20vCj4+IAo+PiBIbW0sIHRoZSBmaXhlcyB0YWcgd2FzIG5vdCBp
bmNsdWRlZC4KPj4gCj4+IEFsc28sIHRoZXJlIHdhcyBhIGxvdCBvZiBjb21tZW50cyBmcm9tIHYy
IHRoYXQgd2FzIG5vdCBhZGRyZXNzZWQ6Cj4+IAo+PiAgICogTWlub3Igc3BlbGxpbmcgbml0cwo+
PiAgICogQnJlYWtpbmcgRElSRUNUX0NBTEwsIGFuZCBpbmNsdWRlIFB1cmFuamF5J3MgQ0FMTF9P
UFMgd29yayBpbiB0aGUKPj4gICAgIHNhbWUgc2VyaWVzIGZvciBESVJFQ1RfQ0FMTCwgdG8gYXZv
aWQgYnJlYWthZ2UuCj4KPiBZZXMsIEZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyBpcyBjdXJyZW50
bHkgYnJva2VuLiBJZiBJIHRyeSB0byBpbnNtb2QgCj4gc2FtcGxlcy9mdHJhY2UvZnRyYWNlLWRp
cmVjdC5rbywgaXQgcmVwb3J0cyBhIGZhaWx1cmU6Cj4KPgo+IFsgIDE3OS41MzE0NzJdIC0tLS0t
LS0tLS0tLVsgZnRyYWNlIGJ1ZyBdLS0tLS0tLS0tLS0tCj4gWyAgMTc5LjUzMTc2MV0gZnRyYWNl
IGZhaWxlZCB0byBtb2RpZnkKPiBbICAxNzkuNTMxNzg2XSBbPGZmZmZmZmZmODAwNWY5YWM+XSB3
YWtlX3VwX3Byb2Nlc3MrMHgwLzB4MjQKPiBbICAxNzkuNTMyNTc3XSAgYWN0dWFsOiAgIDk3OmUy
OmZhOmZmOjEzOjAwOjAwOjAwCj4gWyAgMTc5LjUzMzIxMV0gU2V0dGluZyBmdHJhY2UgY2FsbCBz
aXRlIHRvIGNhbGwgZnRyYWNlIGZ1bmN0aW9uCj4gWyAgMTc5LjUzNDQwOV0gZnRyYWNlIHJlY29y
ZCBmbGFnczogOTk5ODAwMDEKPiBbICAxNzkuNTM0NjkyXSAgKDEpICAgICB0cmFtcDogZnRyYWNl
X2NhbGxlcisweDAvMHgzNCAKPiAoY2FsbF9kaXJlY3RfZnVuY3MrMHgwLzB4MTQpCj4gWyAgMTc5
LjUzNDY5Ml0gIGV4cGVjdGVkIHRyYW1wOiBmZmZmZmZmZjAxYjBkMDAwCj4gLi4uCgpBbmQganVz
dCBhIHJlZ3VsYXIgVWJ1bnR1IDI0LjEwIHdpbGwgZmFpbCB3aXRoIGFsbCBzdWJzeXN0ZW1zIHVz
aW5nIEJQRgp0cmFtcG9saW5lLCBlLmcuCiAtLS0tLS0tLS0tLS1bIGZ0cmFjZSBidWcgXS0tLS0t
LS0tLS0tLQogZnRyYWNlIGZhaWxlZCB0byBtb2RpZnkKIFs8ZmZmZmZmZmY4MDI1MGQ5OD5dIGJw
Zl9sc21fZmlsZV9vcGVuKzB4MC8weDFjCgpDQUxMX09QUyB3aXRoIGRlZmluaXRlbHkgYSBtdXN0
IGZvciB0aGlzIHNlcmllcy4KCgpCasO2cm4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
