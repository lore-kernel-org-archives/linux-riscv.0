Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139C5EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcT8eLXfvXThI16z6AZ8wZwcarwwOmCwZ1bMmDkEHXg=; b=Q1ERQAisa5AZ8v
	4WFKoMjjHMct5FhQ2Z59IpUTArLZMJiGWNNCryZo0tbV0t+QEDImwhhl9uoGXh4IFdcmTDXZkSI9r
	YOduw6QiZle40f1VlJ3m6V2sjhqI0mkz5Uu6SbKLYnidUiv1HMFNaoIMEVEWxWAHJhMpNRmPWUV3e
	ZgRuUHTCntRReSwXGF6S9BfAsAqTP8EDEBTmnipxIxMyCHtluEy79oiR2n4JU5unN8lab8Z/Fg1+3
	0UfgMzw0AuaLaEtq+Xap7DH2SSIcGq/yxobL82gh7H5aaV/ycEXLYi4+d41dFamMoiWXp7qeVaGd3
	eOTgpr6b3nZThNYTYXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFny-001kbO-0E;
	Fri, 16 Jun 2023 20:12:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFnu-001kaI-27
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 20:12:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D820A6318C;
	Fri, 16 Jun 2023 20:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9553C433C8;
	Fri, 16 Jun 2023 20:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686946337;
	bh=hmHVUko7jcqnGzf4MkY0qNHXNmXoqeSjOuW6CIiZcqg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=me58k+cKihW1Fv0MiQ/OJeqE2OgCqCKD+zdJAaPE/md18N8r0xr9ddJ7qwWBFl6vu
	 fgRjmezGQPJNPYsuMhbAdjDBetMMP0xYODHasWxVGqwBCW9MJ/w9ybqPB+lxFdKcC/
	 jZdcaiQUj+IS5MPEkXEW9hsiwkJUjmRZAKHAwboUiVtzKNJu7tRXcUNLbzB2GvOE3J
	 pCpmPfvJTkQWvztGSgGpt0ED4rHujPZDDdqbV1ifVh3jfjWKUzHfJUqzotoUtM8GqR
	 nNzCwlA7A247m7OCgD3Lw51PVjoa45jGjioJjD5rt2bd5itRQDz23UuS1UfaH5cRv/
	 ZMU4Uk4WDnKZg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <20230614163534.18668-1-palmer@rivosinc.com>
References: <20230614163534.18668-1-palmer@rivosinc.com>
Date: Fri, 16 Jun 2023 22:12:14 +0200
Message-ID: <87sfar2mld.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_131218_735194_8E37F638 
X-CRM114-Status: GOOD (  15.62  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyaXRlczoKCj4gVGhlIFYgcmVn
aXN0ZXJzIGFyZSBjbG9iYmVyZWQgYnkgc3RhbmRhcmQgQUJJIGZ1bmN0aW9ucywgc28gdXNlcnNw
YWNlCj4gcHJvYmFibHkgZG9lc24ndCBoYXZlIGFueXRoaW5nIHVzZWZ1bCBpbiB0aGVtIGJ5IHRo
ZSB0aW1lIHdlIGdldCB0byB0aGUKPiBrZXJuZWwuICBTbyBsZXQncyBqdXN0IGRvY3VtZW50IHRo
YXQgdGhleSdyZSBjbG9iYmVyZWQgYnkgc3lzY2FsbHMgYW5kCj4gcHJvYWN0aXZlbHkgY2xvYmJl
ciB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2lu
Yy5jb20+Cj4gLS0tCj4gSUlSQyB3ZSdkIHRhbGtlZCBhYm91dCBkb2luZyB0aGlzLCBidXQgSSBk
aWRuJ3Qgc2VlIGFueXRoaW5nIGluIHRoZQo+IGRvY3MuICBJIGZpZ3VyZSBpdCdzIGJldHRlciB0
byBqdXN0IHByb2FjdGl2ZWx5IGNsb2JiZXIgdGhlIHJlZ2lzdGVycyBvbgo+IHN5c2NhbGxzLCBh
cyB0aGF0IHdheSB1c2Vyc3BhY2UgY2FuJ3QgZW5kIHVwIGFjY2lkZW50YWxseSBkZXBlbmRpbmcg
b24KPiB0aGVtLgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL3Jpc2N2L3ZlY3Rvci5yc3QgfCA1ICsr
KysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgICAgICB8IDIgKysKPiAgMiBmaWxlcyBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jp
c2N2L3ZlY3Rvci5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZlY3Rvci5yc3QKPiBpbmRleCA0
OGYxODlkNzllNDEuLmE0ZGZhOTU0MjE1YiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3Jp
c2N2L3ZlY3Rvci5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZlY3Rvci5yc3QKPiBA
QCAtMTMwLDMgKzEzMCw4IEBAIHByb2Nlc3NlcyBpbiBmb3JtIG9mIHN5c2N0bCBrbm9iOgo+ICAK
PiAgICAgIE1vZGlmeWluZyB0aGUgc3lzdGVtIGRlZmF1bHQgZW5hYmxlbWVudCBzdGF0dXMgZG9l
cyBub3QgYWZmZWN0IHRoZSBlbmFibGVtZW50Cj4gICAgICBzdGF0dXMgb2YgYW55IGV4aXN0aW5n
IHByb2Nlc3Mgb2YgdGhyZWFkIHRoYXQgZG8gbm90IG1ha2UgYW4gZXhlY3ZlKCkgY2FsbC4KPiAr
Cj4gKzMuICBWZWN0b3IgUmVnaXN0ZXIgU3RhdGUgQWNyb3NzIFN5c3RlbSBDYWxscwo+ICstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArCj4gK1ZlY3RvciBy
ZWdpc3RlcnMgYXJlIGNsb2JiZXJlZCBieSBzeXN0ZW0gY2FsbHMuCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5k
ZXggMDVmZmRjZDE0MjRlLi5iYjk5YTYzNzliMzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMjk1
LDYgKzI5NSw4IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9f
dHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAJCXJlZ3MtPmVwYyArPSA0Owo+
ICAJCXJlZ3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKPiAgCj4gKwkJcmlzY3Zfdl92c3RhdGVfb2Zm
KHJlZ3MpOwo+ICsKCk5vdCBvZmYsIHJpZ2h0PyBJc24ndCBpdCBfX3Jpc2N2X3ZfdnN0YXRlX2Ns
ZWFuKCkgdGhhdCB5b3UnZCBsaWtlIHRvCmNhbGw/IFNvbWV0aGluZyBsaWtlOgoKc3RhdGljIHZv
aWQgdnN0YXRlX2Rpc2NhcmQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCnsKICAgICAgIGlmICgocmVn
cy0+c3RhdHVzICYgU1JfVlMpID09IFNSX1ZTX0RJUlRZKQogICAgICAgICAgICAgICBfX3Jpc2N2
X3ZfdnN0YXRlX2NsZWFuKHJlZ3MpOwp9CgpDb21wbGVtZW50ZWQgYnkgYSAhViBjb25maWcgdmFy
aWFudC4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
