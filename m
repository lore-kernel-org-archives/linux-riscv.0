Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D53D6ACE5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 15:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16EHSly3WjYjiKr9voi+cyfRSYFd0fLchq+cmFkaaUQ=; b=Rj3/u/SSLM5Vpf
	f+b7onro8Xbxz+l3ZEfQ7pKp9oUBdVL72TTLdON2JJx2XoavLOyit9kVjFcU+pYpHNUiO6YssE2PK
	41pzGSruw1RGh/E45dHMpgB5j+/BDIDqzOnYFPKsx2q/uK9qlDb6QQ2XPcmkVZ0+x0BVcPUs7XXKE
	vyBygrVZ8F5VYMmmr5u8RHOoLMGMW8m+gmlNAggpE1gPQVzJTGNHrd7bnsjJVtSgyyVEmOJCo5JjY
	bFQ6eZeJR7A86wSuGrGcc5BSQm0N8LUeEpO1AXICEdPqM2XXvIHTWYXeoHpzY/PnEHQZBLgqoxsx2
	dYkGkfGRyxGZGRlV8ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJq5-0000000DUO6-2h6p;
	Wed, 27 Nov 2024 15:20:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJq2-0000000DUMu-3o9q
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 15:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B36805C5928;
	Wed, 27 Nov 2024 15:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC883C4CECC;
	Wed, 27 Nov 2024 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732720821;
	bh=2A6lYm4lcxMAozaqa5wnqv2VAnVxMtFpR7XNjikNDzM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=L0VPnin/Q6ee95IxoYpSIaAStH7ztVhReKJYeWIjKDWjBces7sQwYGQ+kng2GSIkx
	 RXN6Z+DNbHCDFPgjYdJvrvzALfNVioq92+lEdCP5Wu7ZPNNShh7/lYFb9Am4LOL0W5
	 Z9lkU/saWYTOTjKwfprtGxQkJOMzp6AEi34eabj8eFD8LS06zEeBlAtL4ZbrV0ey1u
	 0JE4TWv9ZnQ1eG+aPr4/1tdJBqILcd/qik8rYFZa0lQwDv/Z/1yuAWnYFV0uX0vIU1
	 +FFVQdKITqmcSK800EcSSKMJKIhIgWvP2Y5wxMmbdELhpmdgv69DeD26iUpmYJaM5Q
	 1JQnt3Ga4wHVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC0DD3809A00;
	Wed, 27 Nov 2024 15:20:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: Remove unnecessary include from compat.h
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173272083479.1118426.4000843629538344289.git-patchwork-notify@kernel.org>
Date: Wed, 27 Nov 2024 15:20:34 +0000
References: <20241126143250.29708-1-palmer@rivosinc.com>
In-Reply-To: <20241126143250.29708-1-palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_072023_037347_DD28552F 
X-CRM114-Status: UNSURE (   8.37  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZm9yLW5l
eHQpCmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFR1ZSwgMjYg
Tm92IDIwMjQgMDY6MzI6NTAgLTA4MDAgeW91IHdyb3RlOgo+IFdpdGhvdXQgdGhpcyBJIGdldCBh
IGJ1bmNoIG9mIGJ1aWxkIGVycm9ycyBsaWtlCj4gCj4gICAgIEluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuL2luY2x1ZGUvbGludXgvc2NoZWQvdGFza19zdGFjay5oOjEyLAo+ICAgICAgICAgICAgICAg
ICAgICAgIGZyb20gLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oOjEyLAo+ICAgICAg
ICAgICAgICAgICAgICAgIGZyb20gLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaDox
MTUsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvcGd0YWJsZS5o
OjYsCj4gICAgICAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvbW0uaDozMCwK
PiAgICAgICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRz
LmM6ODoKPiAgICAgLi9pbmNsdWRlL2xpbnV4L2thc2FuLmg6NTA6Mzc6IGVycm9yOiDigJhNQVhf
UFRSU19QRVJfUFRF4oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pOyBkaWQg
eW91IG1lYW4g4oCYUFRSU19QRVJfUFRF4oCZPwo+ICAgICAgICA1MCB8IGV4dGVybiBwdGVfdCBr
YXNhbl9lYXJseV9zaGFkb3dfcHRlW01BWF9QVFJTX1BFUl9QVEUgKyBQVEVfSFdUQUJMRV9QVFJT
XTsKPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgUFRSU19QRVJfUFRFCj4gICAgIC4vaW5jbHVkZS9saW51eC9rYXNhbi5oOjUxOjg6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhwbWRfdOKAmTsgZGlkIHlvdSBtZWFuIOKAmHBnZF90
4oCZPwo+ICAgICAgICA1MSB8IGV4dGVybiBwbWRfdCBrYXNhbl9lYXJseV9zaGFkb3dfcG1kW01B
WF9QVFJTX1BFUl9QTURdOwo+ICAgICAgICAgICB8ICAgICAgICBefn5+fgo+ICAgICAgICAgICB8
ICAgICAgICBwZ2RfdAo+ICAgICAuL2luY2x1ZGUvbGludXgva2FzYW4uaDo1MTozNzogZXJyb3I6
IOKAmE1BWF9QVFJTX1BFUl9QTUTigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlv
bik7IGRpZCB5b3UgbWVhbiDigJhQVFJTX1BFUl9QR0TigJk/Cj4gICAgICAgIDUxIHwgZXh0ZXJu
IHBtZF90IGthc2FuX2Vhcmx5X3NoYWRvd19wbWRbTUFYX1BUUlNfUEVSX1BNRF07Cj4gICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fgo+ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBUUlNf
UEVSX1BHRAo+ICAgICAuL2luY2x1ZGUvbGludXgva2FzYW4uaDo1Mjo4OiBlcnJvcjogdW5rbm93
biB0eXBlIG5hbWUg4oCYcHVkX3TigJk7IGRpZCB5b3UgbWVhbiDigJhwZ2RfdOKAmT8KPiAgICAg
ICAgNTIgfCBleHRlcm4gcHVkX3Qga2FzYW5fZWFybHlfc2hhZG93X3B1ZFtNQVhfUFRSU19QRVJf
UFVEXTsKPiAgICAgICAgICAgfCAgICAgICAgXn5+fn4KPiAgICAgICAgICAgfCAgICAgICAgcGdk
X3QKPiAgICAgLi9pbmNsdWRlL2xpbnV4L2thc2FuLmg6NTI6Mzc6IGVycm9yOiDigJhNQVhfUFRS
U19QRVJfUFVE4oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rpb24pOyBkaWQgeW91
IG1lYW4g4oCYUFRSU19QRVJfUEdE4oCZPwo+ICAgICAgICA1MiB8IGV4dGVybiBwdWRfdCBrYXNh
bl9lYXJseV9zaGFkb3dfcHVkW01BWF9QVFJTX1BFUl9QVURdOwo+ICAgICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQVFJTX1BFUl9QR0QKPiAg
ICAgLi9pbmNsdWRlL2xpbnV4L2thc2FuLmg6NTM6ODogZXJyb3I6IHVua25vd24gdHlwZSBuYW1l
IOKAmHA0ZF904oCZOyBkaWQgeW91IG1lYW4g4oCYcGdkX3TigJk/Cj4gICAgICAgIDUzIHwgZXh0
ZXJuIHA0ZF90IGthc2FuX2Vhcmx5X3NoYWRvd19wNGRbTUFYX1BUUlNfUEVSX1A0RF07Cj4gICAg
ICAgICAgIHwgICAgICAgIF5+fn5+Cj4gICAgICAgICAgIHwgICAgICAgIHBnZF90Cj4gICAgIC4v
aW5jbHVkZS9saW51eC9rYXNhbi5oOjUzOjM3OiBlcnJvcjog4oCYTUFYX1BUUlNfUEVSX1A0ROKA
mSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmFBU
UlNfUEVSX1BHROKAmT8KPiAgICAgICAgNTMgfCBleHRlcm4gcDRkX3Qga2FzYW5fZWFybHlfc2hh
ZG93X3A0ZFtNQVhfUFRSU19QRVJfUDREXTsKPiAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+Cj4gICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUFRSU19QRVJfUEdECj4gCj4gWy4uLl0KCkhl
cmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFJJU0MtVjogUmVtb3ZlIHVubmVjZXNz
YXJ5IGluY2x1ZGUgZnJvbSBjb21wYXQuaAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNj
di9jLzhkNGYxZTA1ZmY4MgoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRv
b3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29y
ay9wd2JvdC5odG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
