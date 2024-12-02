Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1879D78332
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sECEwQVZwI69QyRU/omsS4xI7I6OrS80q8GRbE2L2yk=; b=Z8sOF7pUa9jvkw
	5/UhTuI/eHoGkZOiqyQpMIX8RuDZaSuH8eRcCmj59A3ELkoVSyk/arLhkyFmd7SmKg/F2A1DZYaMM
	x31/KsHYAKkfy4x92wYB99L0YWgLijUjjq54QHa6q/OkzWxJ6rUWIOy7+HuKovncG0yBoSIbFlJQ6
	uNHNceDoP7dpirV0vkxSt5pXE0HjwqvKPLXzuzO5OtDKd3PcaesqCURD3GxopoZKg4ExgGAKCCdVa
	8OypZBHXtXOQwT+gg1Gh0g3qtO4HNcJ3WCoT4IyPNAGX3Z9mc/bj9D4Z02nPo2KS8mcybWmwna4Tj
	xekjl5FUa1D/DQUqsKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8b7-00000006hfC-3x5f;
	Mon, 02 Dec 2024 15:44:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8b5-00000006heJ-1Ddh
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 15:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92822A40E07;
	Mon,  2 Dec 2024 15:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0547AC4CED1;
	Mon,  2 Dec 2024 15:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154264;
	bh=DyHkmcoK/rPOrpLfO3N9/3ZQGexPIlejeLIDNVhReJo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dOUNGcF+mdb56CEPrlHyw39sLJ6Cpw3nwWs37XYq/5PCKaYPjmRFAKpj3U6FKB9qL
	 ZDraECnj/6CO8AT1hvqhljlFzcSXwo+/r2HbYd3en7lr5Lrcs8vwB2jgVLcBaNGH+W
	 3sIwJ6ex6jiS97vYpH3a+BLXNZjMncZACtVsgaI/uKjzAkuH9GzrBSiGp6zofqafe7
	 yzC3rep21BA4jxNecS1y4iug1WbwCSwjoUGkjCQPhtOV/vi8PXhp0REkXSdFToGYm3
	 MgBjhLvwIAq7I9xcIh0TUkDGhodZMeTojoiqnpM4+ieY+9Az+7a6Pv9s9tzAqVi4BL
	 8d1jUMElH1/IQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <uwu@coelacanthus.name>, Oleg Nesterov <oleg@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
 Andrea Bolognani <abologna@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ron Economos <re@w6rz.net>, Felix Yan
 <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang
 <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, stable@vger.kernel.org, Celeste Liu
 <uwu@coelacanthus.name>
Subject: Re: [PATCH] riscv/ptrace: add new regset to get original a0 register
In-Reply-To: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
References: <20241201-riscv-new-regset-v1-1-c83c58abcc7b@coelacanthus.name>
Date: Mon, 02 Dec 2024 16:44:21 +0100
Message-ID: <87v7w22ip6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074427_453556_B6994D65 
X-CRM114-Status: GOOD (  16.59  )
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

VGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMhCgpDZWxlc3RlIExpdSA8dXd1QGNvZWxhY2FudGh1
cy5uYW1lPiB3cml0ZXM6Cgo+IFRoZSBvcmlnX2EwIGlzIG1pc3NpbmcgaW4gc3RydWN0IHVzZXJf
cmVnc19zdHJ1Y3Qgb2YgcmlzY3YsIGFuZCB0aGVyZSBpcwo+IG5vIHdheSB0byBhZGQgaXQgd2l0
aG91dCBicmVha2luZyBVQVBJLiAoU2VlIExpbmsgdGFnIGJlbG93KQo+Cj4gTGlrZSBOVF9BUk1f
U1lTVEVNX0NBTEwgZG8sIHdlIGFkZCBhIG5ldyByZWdzZXQgbmFtZSBOVF9SSVNDVl9PUklHX0Ew
IHRvCj4gYWNjZXNzIG9yaWdpbmFsIGEwIHJlZ2lzdGVyIGZyb20gdXNlcnNwYWNlIHZpYSBwdHJh
Y2UgQVBJLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzU5NTA1NDY0LWM4
NGEtNDAzZC05NzJmLWQ0YjIwNTVlZWFhY0BnbWFpbC5jb20vCj4gU2lnbmVkLW9mZi1ieTogQ2Vs
ZXN0ZSBMaXUgPHV3dUBjb2VsYWNhbnRodXMubmFtZT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvcHRyYWNlLmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5j
bHVkZS91YXBpL2xpbnV4L2VsZi5oICAgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBpbmRleCBlYTY3ZTlmYjdhNTgzNjgzYjkyMmZl
MmMwMTdlYTYxZjNiYzg0OGRiLi5mYWE0NmRlOTAwMDM3NmViNDQ1YTMyZDQzYTQwMjEwZDdiODQ2
ODQ0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBAQCAtMzEsNiArMzEsNyBAQCBlbnVtIHJpc2N2X3Jl
Z3NldCB7Cj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1NVUE0KPiAgCVJFR1NFVF9UQUdHRURf
QUREUl9DVFJMLAo+ICAjZW5kaWYKPiArCVJFR1NFVF9PUklHX0EwLAo+ICB9Owo+ICAKPiAgc3Rh
dGljIGludCByaXNjdl9ncHJfZ2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+IEBAIC0x
ODQsNiArMTg1LDMwIEBAIHN0YXRpYyBpbnQgdGFnZ2VkX2FkZHJfY3RybF9zZXQoc3RydWN0IHRh
c2tfc3RydWN0ICp0YXJnZXQsCj4gIH0KPiAgI2VuZGlmCj4gIAo+ICtzdGF0aWMgaW50IHJpc2N2
X29yaWdfYTBfZ2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ICsJCQkgICAgIGNvbnN0
IHN0cnVjdCB1c2VyX3JlZ3NldCAqcmVnc2V0LAo+ICsJCQkgICAgIHN0cnVjdCBtZW1idWYgdG8p
CgpVc2UgZnVsbCAxMDAgY2hhcnMhCgo+ICt7Cj4gKwlyZXR1cm4gbWVtYnVmX3N0b3JlKCZ0bywg
dGFza19wdF9yZWdzKHRhcmdldCktPm9yaWdfYTApOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IHJp
c2N2X29yaWdfYTBfc2V0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFyZ2V0LAo+ICsJCQkgICAgIGNv
bnN0IHN0cnVjdCB1c2VyX3JlZ3NldCAqcmVnc2V0LAo+ICsJCQkgICAgIHVuc2lnbmVkIGludCBw
b3MsIHVuc2lnbmVkIGludCBjb3VudCwKPiArCQkJICAgICBjb25zdCB2b2lkICprYnVmLCBjb25z
dCB2b2lkIF9fdXNlciAqdWJ1ZikKCkRpdG8hCgo+ICt7Cj4gKwlpbnQgb3JpZ19hMCA9IHRhc2tf
cHRfcmVncyh0YXJnZXQpLT5vcmlnX2EwOwoKNjRiIHJlZ3Mgb24gUlY2NC4KCj4gKwlpbnQgcmV0
Owo+ICsKPiArCXJldCA9IHVzZXJfcmVnc2V0X2NvcHlpbigmcG9zLCAmY291bnQsICZrYnVmLCAm
dWJ1ZiwgJm9yaWdfYTAsIDAsIC0xKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAr
Cj4gKwl0YXNrX3B0X3JlZ3ModGFyZ2V0KS0+b3JpZ19hMCA9IG9yaWdfYTA7Cj4gKwlyZXR1cm4g
cmV0Owo+ICt9Cj4gKwo+ICsKCk11bHRpcGxlIGJsYW5rcy4KCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgdXNlcl9yZWdzZXQgcmlzY3ZfdXNlcl9yZWdzZXRbXSA9IHsKPiAgCVtSRUdTRVRfWF0gPSB7
Cj4gIAkJLmNvcmVfbm90ZV90eXBlID0gTlRfUFJTVEFUVVMsCj4gQEAgLTIyNCw2ICsyNDksMTQg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2VyX3JlZ3NldCByaXNjdl91c2VyX3JlZ3NldFtdID0g
ewo+ICAJCS5zZXQgPSB0YWdnZWRfYWRkcl9jdHJsX3NldCwKPiAgCX0sCj4gICNlbmRpZgo+ICsJ
W1JFR1NFVF9PUklHX0EwXSA9IHsKPiArCQkuY29yZV9ub3RlX3R5cGUgPSBOVF9SSVNDVl9PUklH
X0EwLAo+ICsJCS5uID0gMSwKPiArCQkuc2l6ZSA9IHNpemVvZihlbGZfZ3JlZ190KSwKPiArCQku
YWxpZ24gPSBzaXplb2YoZWxmX2dyZWdfdCksCgouLi5hbmQgc2l6ZW9mKGVsZl9ncmVnX3QpIGlz
IDY0YiBpbiBSVjY0IC0tIG1pc21hdGNoIGFib3ZlLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
