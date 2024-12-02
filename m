Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B6BD7833C
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 17:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfAkh6ZOvDse93Udo6z+cAUS0vjaUIku4YBknwd7ADE=; b=R2y7Eq8I/54RI4
	cZbxNHgSPbrWYZfQhWlb2bo1pb7z+5fh1SxV8cOoPe8GDfiAKPEwKXah7z0YZeabZ7uSy8XpVLhGm
	HMzz+P/uJIsrYbWeXis/0+nVqgel0iO6e96sYK+7+iy9SKjHtfIQDoKtvBe7ZdgDmDNt0nKa8He4p
	C0DBPo4NS9B2hD2pksU1Mbu/kFDBpQElK3ScWWN1yrsDCNqrIewRHb7M08AOzYubstLzLjOzYayPF
	EBAS84xNjT51aON/An0nAHOYdORUPKWWO+b6k+MAj9uIm22jaGaDDKQjRXPGU+QeYfxDyzBuenJS2
	AwZ09yW467Xq+xYdQDRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIALJ-000000072PB-3kFP;
	Mon, 02 Dec 2024 17:36:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAGB-000000071K9-0VGT
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Dec 2024 17:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3T2xMSoVmpb/99UKz9kFB5DkmUtg7fyYXXJs2oa83Nw=; b=ORafHeunevAwRyQaTYABFXCGfA
	+6znKhQmNoj+UHYpWvA9MEpgiIXcQ93Eo6ZNok8ER/lSaI0TC0+DysDS39C8Swn4OInQThbkn3lP0
	wOfzzd5l0DjA6C2U6854tl1ickX7B+xl+pPfXCBgUsJ1EF1lhuo/2HiPkV0gdELfaMLnWkaJeJ/Je
	zRN53N4JMyJvGnipyEBnDxidDKeVCcWXdlaFtN1l4YmdTsjY0Y63++ZKCpX5ByjCJaxgBgA3Btew2
	znR9Ii1HBwMde2Nm9blwIQKERn9oGvnE6rNn+jDAo4FRhpgh7Wu+y6USvTJHytoCPvUcCL85svEGc
	xgSrGhgg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAG8-00000002DUp-0bxY
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 17:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD9095C46FB;
	Mon,  2 Dec 2024 17:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256A9C4CED1;
	Mon,  2 Dec 2024 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733160653;
	bh=Rede94agCQbMJwaWVwzB/eR2UxMdvePa/USrN8RjiGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EwnR4XP2Lgspy1YyMEvCMD+AcfuKafGSIQv/FdHEpjgLnMxOeE58Isa7jyZz83DoX
	 1v3mhc/4D2lCOycyOKNUBHZv+rPGicPYzMHNdefKHpRTKSExwyx8k9AgTp+gh6UVUQ
	 qqT1JucUEihjXFCPnKl9V5PLwxVMDIPMlej+/8P1U+LrJpwJPyPwstaAFohgPpCHsR
	 2v1gcf+1SICAWkvjSWZcB4anvvveFFfEVVtn+iLf0SQhwORZCgxgB+3tpo1rr/6sv1
	 nr9Ok702Z8/yV7mEh+tyNOFlEUhb+teli4ncOtzwP1lZzFOWc4iK0wXXYulCDU71AP
	 RQ2J2Xhdr1qTw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org
Cc: ajones@ventanamicro.com, palmer@dabbelt.com, Ben Dooks
 <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2 2/3] riscv: traps: make insn fetch common in unknown
 instruction
In-Reply-To: <20241201102759.221176-3-ben.dooks@codethink.co.uk>
References: <20241201102759.221176-1-ben.dooks@codethink.co.uk>
 <20241201102759.221176-3-ben.dooks@codethink.co.uk>
Date: Mon, 02 Dec 2024 18:30:50 +0100
Message-ID: <87o71u2drp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_173056_559131_EA7E3373 
X-CRM114-Status: GOOD (  15.86  )
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

QmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiB3cml0ZXM6Cgo+IEFkZCB0aGUg
dHJhcHBlZCBpbnN0cnVjdGlvbiAoaW5zbikgYXMgdGhlIHNlY29uZCBhcmd1bWVudCB0bwo+IHJp
c2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIoKSBmcm9tIHRoZSB0cmFwIGhhbmRsZXIgc28gd2hlbiB3
ZQo+IGFkZCBtb3JlIGhhbmRsZXJzIHdlIGNhbiBkbyB0aGUgZmV0Y2ggb2YgdGhlIGluc3RydWN0
aW9uIGp1c3QKPiBvbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NA
Y29kZXRoaW5rLmNvLnVrPgo+IC0tLQo+IC0gZml4ZWQgd29yZGluZyBvZiBwYXRjaCBmcm9tIHJm
Ywo+IHYyOgo+ICAgLSBmaXhlZCB0b2RvIGJ5IGdvaW5nIHRvIGlsbGVnYWwgaW5zdHJ1Y3Rpb24g
ZXJyb3IgaWYgZ2V0X3VzZXIgZmFpbHMKPiAgIC0gYWRkZWQgcG9pbnRlciBwcmludCBmb3IgZmFp
bGVkIHJlYWQKPiAgIC0gZml4ZWQgaXNzdWVzIHdpdGggcmViYXNpbmcgb250byBtYWluIGJyYW5j
aAo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgIDQgKystLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgIHwgMTQgKysrKysrKysrKysrKy0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICB8IDExICstLS0tLS0tLS0tCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdmVjdG9yLmgKPiBpbmRleCBjN2MwMjNhZmJhY2QuLjllYzI0NzNjMWI3MyAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS92ZWN0b3IuaAo+IEBAIC0yMiw3ICsyMiw3IEBACj4gIGV4dGVybiB1bnNpZ25l
ZCBsb25nIHJpc2N2X3ZfdnNpemU7Cj4gIGludCByaXNjdl92X3NldHVwX3ZzaXplKHZvaWQpOwo+
ICBib29sIGluc25faXNfdmVjdG9yKHUzMiBpbnNuX2J1Zik7Cj4gLWJvb2wgcmlzY3Zfdl9maXJz
dF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gK2Jvb2wgcmlzY3Zfdl9maXJz
dF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdTMyIGluc24pOwo+ICB2b2lkIGtl
cm5lbF92ZWN0b3JfYmVnaW4odm9pZCk7Cj4gIHZvaWQga2VybmVsX3ZlY3Rvcl9lbmQodm9pZCk7
Cj4gIHZvaWQgZ2V0X2NwdV92ZWN0b3JfY29udGV4dCh2b2lkKTsKPiBAQCAtMjcwLDcgKzI3MCw3
IEBAIHN0cnVjdCBwdF9yZWdzOwo+ICBzdGF0aWMgaW5saW5lIGludCByaXNjdl92X3NldHVwX3Zz
aXplKHZvaWQpIHsgcmV0dXJuIC1FT1BOT1RTVVBQOyB9Cj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxp
bmUgYm9vbCBoYXNfdmVjdG9yKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4gIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgYm9vbCBpbnNuX2lzX3ZlY3Rvcih1MzIgaW5zbl9idWYpIHsgcmV0dXJuIGZh
bHNlOyB9Cj4gLXN0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X2ZpcnN0X3VzZV9oYW5kbGVyKHN0
cnVjdCBwdF9yZWdzICpyZWdzKSB7IHJldHVybiBmYWxzZTsgfQo+ICtzdGF0aWMgaW5saW5lIGJv
b2wgcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdTMyIGlu
c24pIHsgcmV0dXJuIGZhbHNlOyB9Cj4gIHN0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0
ZV9xdWVyeShzdHJ1Y3QgcHRfcmVncyAqcmVncykgeyByZXR1cm4gZmFsc2U7IH0KPiAgc3RhdGlj
IGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkKHZvaWQpIHsgcmV0
dXJuIGZhbHNlOyB9Cj4gICNkZWZpbmUgcmlzY3Zfdl92c2l6ZSAoMCkKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBp
bmRleCA1MWViZmQyM2UwMDcuLjk2NjIxMzhiYTQ1YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBAIC0x
NzIsMTEgKzE3MiwyMyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lk
IGRvX3RyYXBfaW5zbl9pbGxlZ2FsKHN0cnVjdCBwdF9yZWdzICpyZQo+ICAJYm9vbCBoYW5kbGVk
Owo+ICAKPiAgCWlmICh1c2VyX21vZGUocmVncykpIHsKPiArCQl1MzIgX191c2VyICplcGMgPSAo
dTMyIF9fdXNlciAqKXJlZ3MtPmVwYzsKPiArCQl1MzIgaW5zbiA9ICh1MzIpcmVncy0+YmFkYWRk
cjsKPiArCj4gIAkJaXJxZW50cnlfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncyk7Cj4gIAo+ICAJ
CWxvY2FsX2lycV9lbmFibGUoKTsKPiAgCj4gLQkJaGFuZGxlZCA9IHJpc2N2X3ZfZmlyc3RfdXNl
X2hhbmRsZXIocmVncyk7Cj4gKwkJaWYgKCFpbnNuKSB7Cj4gKwkJCWlmIChfX2dldF91c2VyKGlu
c24sIGVwYykpIHsKPiArCQkJCXByaW50a19yYXRlbGltaXRlZChLRVJOX0VSUiAidHJhcHM6IGZh
aWxlZCB0byByZWFkIGluc3RydWN0aW9uIGF0IHVzZXIgJXB4XG4iLCBlcGMpOwo+ICsJCQkJaGFu
ZGxlZCA9IGZhbHNlOwo+ICsJCQkJaW5zbiA9IDA7Cj4gKwkJCX0KPiArCQl9Cj4gKwo+ICsJCWlm
IChpbnNuKQo+ICsJCQloYW5kbGVkID0gcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihyZWdzLCBp
bnNuKTsKCk1heWJlIGl0J3MganVzdCBtZSwgYnV0IHRoaXMgYWRkaXRpb24gbWFrZXMgaXQgYSBi
aXQgaGFyZCAoaGFyZGVyISkgdG8KcmVhZC4KCk1heWJlIHJlcGxhY2UgdGhlIGNodW5rIHNvbWV0
aGluZyBpbiB0aGUgbGluZXMgb2Y6CgoJaWYgKCFpbnNuICYmIF9fZ2V0X3VzZXIoaW5zbiwgZXBj
KSkKCQlnb3RvIG91dDsKCQoJaGFuZGxlZCA9IHJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIocmVn
cywgaW5zbik7Cm91dDoKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
