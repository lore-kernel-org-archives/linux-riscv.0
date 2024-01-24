Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D3C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkPP43OjA/s5M6bxOCdQ0lTzKu12pAaaj4LACk+sozc=; b=pCr3ixDSoGC3mi
	ieFouhS6FrhBfB2oDEwZKYbbW++iZ2TmjWqfSsvZczB/H1k/xY8zXwn9NDPRA1tsWXNbtuOUF9tPA
	PQfu/Q5aVRydnT6HRrh80wON8+so0dUvvMsDfUCxav3HVgokmtHBc/yhahCO/xmEMofBO40SLer0X
	5cWXdfWJDqTvHMOjSkALnr9Xr1wva/HHpBhtPRHfqX9XAQj+qn0MIjuQWS0eUo3qTHyS6b+gCuH8b
	Kt4OPBYeJE5PupFQc+o+QGf1XPfFHVGxIec/qW2pkDbsoG5YIgYvU0Df0gJYsNGPzi1Lk+VzidSUS
	WMN66YR+pO93VbHJFjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSdHi-003SrN-0J;
	Wed, 24 Jan 2024 13:27:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSdHf-003Sqr-08
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 13:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0C1761D3C;
	Wed, 24 Jan 2024 13:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556DFC433F1;
	Wed, 24 Jan 2024 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706102833;
	bh=6jxmAp1zkUQtEI+XN8+qv6JLl9dLMF3pdNtDq7xTVTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r8kmOHRpDdQ0+7Usk1dq7lVDkUk4I2aTI/cODDRFAkd1CtELpHpQg9iuvxLNTwM6X
	 /STzbqXSZkxsVPIrWOBYoEZxqwcG4g6gWpfswvzP1b+Xh4JjUk/dOxGho+dR01YUDP
	 uZFtzvjkpR0GT0pahRVGnIjjzanBSudyCXPR6Bmc3sAh6qFoXHLEt4RSytXG8evwqk
	 hTs4K1UUWrLhV/eHQmw8B7lYA94lrVTV8PfbpjBZtwExt5ceo0gIXDp6giOAGjvLhl
	 9AxDlMqKcJFyYftUHG5s4ld2dr9JIHRffNM/NZMW7NyBuRmZiZjSWXR8yFbDLwajsS
	 uikS05a/QZOxw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>, Christoph =?utf-8?Q?M=C3=BCllner?=
 <christoph.muellner@vrull.eu>, linux-riscv@lists.infradead.org, LIU Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Andrew Jones <ajones@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: qemu riscv, thead c906, Linux boot regression
In-Reply-To: <20240124-sliceable-atom-c87a10922d4b@spud>
References: <874jf2rj4g.fsf@all.your.base.are.belong.to.us>
 <20240124-sliceable-atom-c87a10922d4b@spud>
Date: Wed, 24 Jan 2024 14:27:10 +0100
Message-ID: <871qa6yi8h.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_052715_155942_16B75961 
X-CRM114-Status: GOOD (  16.55  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIFdlZCwgSmFuIDI0
LCAyMDI0IGF0IDAxOjQ5OjUxUE0gKzAxMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEhpIQo+
PiAKPj4gSSBidW1wZWQgdGhlIFJJU0MtViBMaW51eCBrZXJuZWwgQ0kgdG8gdXNlIHFlbXUgOC4y
LjAsIGFuZCByZWFsaXplZCB0aGF0Cj4+IHRoZWFkIGM5MDYgZGlkbid0IGJvb3QgYW55bW9yZS4g
QmlzZWN0aW9uIHBvaW50cyB0byBjb21taXQgZDZhNDI3ZTJjMGIyCj4+ICgidGFyZ2V0L3Jpc2N2
L2NwdS5jOiByZXN0cmljdCAnbWFyY2hpZCcgdmFsdWUiKQo+PiAKPj4gUmV2ZXJ0aW5nIHRoYXQg
Y29tbWl0LCBvciB0aGUgaGFjayBiZWxvdyBzb2x2ZXMgdGhlIGJvb3QgaXNzdWU6Cj4+IAo+PiAt
LTg8LS0KPj4gZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9jcHUuYyBiL3RhcmdldC9yaXNjdi9j
cHUuYwo+PiBpbmRleCA4Y2JmYzdlNzgxYWQuLmUxODU5NmM4YTU1YSAxMDA2NDQKPj4gLS0tIGEv
dGFyZ2V0L3Jpc2N2L2NwdS5jCj4+ICsrKyBiL3RhcmdldC9yaXNjdi9jcHUuYwo+PiBAQCAtNTA1
LDYgKzUwNSw5IEBAIHN0YXRpYyB2b2lkIHJ2NjRfdGhlYWRfYzkwNl9jcHVfaW5pdChPYmplY3Qg
Km9iaikKPj4gICAgICBjcHUtPmNmZy5leHRfeHRoZWFkc3luYyA9IHRydWU7Cj4+ICAKPj4gICAg
ICBjcHUtPmNmZy5tdmVuZG9yaWQgPSBUSEVBRF9WRU5ET1JfSUQ7Cj4+ICsgICAgY3B1LT5jZmcu
bWFyY2hpZCA9ICgoUUVNVV9WRVJTSU9OX01BSk9SIDw8IDE2KSB8Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAoUUVNVV9WRVJTSU9OX01JTk9SIDw8IDgpICB8Cj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAoUUVNVV9WRVJTSU9OX01JQ1JPKSk7Cj4+ICAjaWZuZGVmIENPTkZJR19VU0VS
X09OTFkKPj4gICAgICBzZXRfc2F0cF9tb2RlX21heF9zdXBwb3J0ZWQoY3B1LCBWTV8xXzEwX1NW
MzkpOwo+PiAgI2VuZGlmCj4+IC0tODwtLQo+PiAKPj4gSSdtIHVuc3VyZSB3aGF0IHRoZSBjb3Jy
ZWN0IHFlbXUgd2F5IG9mIGFkZGluZyBhIGRlZmF1bHQgdmFsdWUgaXMsCj4+IG9yIGlmIGM5MDYg
c2hvdWxkIGhhdmUgYSBwcm9wZXIgbWFyY2hpZC4KPgo+IFRoZSAiY29ycmVjdCIgbWFyY2hpZC9t
aW1waWQgdmFsdWVzIGZvciB0aGUgYzkwNiBhcmUgemVyby4KCk9rISBUaGFua3MgZm9yIGNsZWFy
aW5nIHRoYXQgdXAgZm9yIG1lLgoKPiBJIGhhdmVuJ3QgbG9va2VkIGludG8gdGhlIGNvZGUgYXQg
YWxsLCBzbyBJIGFtICJhc3N1bWluZyIgdGhhdCBpdCBpcwo+IGJlaW5nIHplcm8gaW50aWFsaXNl
ZCBhdCBwcmVzZW50LiBMaW51eCBhcHBsaWVzIHRoZSBlcnJhdGEgZml4dXBzIGZvcgo+IHRoZSBj
OTA2IHdoZW4gYXJjaGlkIGFuZCBpbXBpZCBhcmUgYm90aCB6ZXJvIC0gc28geW91ciBwYXRjaCB3
aWxsIGF2b2lkCj4gdGhlc2UgZml4dXBzIGJlaW5nIGFwcGxpZWQuCgpJJ20gYWxzbyBhc3N1bWlu
ZyAwLCAtLSB3aWxsIGRvdWJsZS1jaGVjay4gSG1tLCB0aGF0IG1lYW5zIHRoYXQgdGhlCipwcmV2
aW91cyogbWFyY2hpZCB3YXMgaW5jb3JyZWN0IChwcmUgZDZhNDI3ZTJjMGIyKS4KCj4gRG8geW91
IHRoaW5rIHRoYXQgcGVyaGFwcyB0aGUgZW11bGF0aW9uIGluIFFFTVUgZG9lcyBub3Qgc3VwcG9y
dCB3aGF0Cj4gdGhlIGtlcm5lbCB1c2VzIG9uY2UgdGhlbiBlcnJhdGEgZml4dXBzIGFyZSBlbmFi
bGVkPwoKRGlkIGEgcXVpY2sgbG9vayBhdCB0aGUgYzkwNiAiaW5fYXNtLGludCIgbG9nczoKCnwg
MHg4MDIwMTA0MDogIDEyMDAwMDczICAgICAgICAgIHNmZW5jZS52bWEgICAgICAgICAgICAgIHpl
cm8semVybwp8IDB4ODAyMDEwNDQ6ICAxODA1MTA3MyAgICAgICAgICBjc3JydyAgICAgICAgICAg
ICAgICAgICB6ZXJvLHNhdHAsYTAKfCAKfCByaXNjdl9jcHVfZG9faW50ZXJydXB0OiBoYXJ0OjAs
IGFzeW5jOjAsIGNhdXNlOjAwMDAwMDAwMDAwMDAwMGMsIGVwYzoweDAwMDAwMDAwODAyMDEwNDgs
IHR2YWw6MHgwMDAwMDAwMDgwMjAxMDQ4LCBkZXNjPWV4ZWNfcGFnZV9mYXVsdAp8IHJpc2N2X2Nw
dV9kb19pbnRlcnJ1cHQ6IGhhcnQ6MCwgYXN5bmM6MCwgY2F1c2U6MDAwMDAwMDAwMDAwMDAwYywg
ZXBjOjB4ZmZmZmZmZmY4MDAwMTA0OCwgdHZhbDoweGZmZmZmZmZmODAwMDEwNDgsIGRlc2M9ZXhl
Y19wYWdlX2ZhdWx0CnwgLi4uY29udCBmb3JldmVyCgpTbyBpdCBsb29rcyBsaWtlIHdlJ3JlIHRy
aXBwaW5nIG92ZXIgdGhlIHBhZ2UgdGFibGVzLCB3aGVuIHdlJ3JlIHR1cm5pbmcKb24gcGFnaW5n
LgoKSG1tLCBtYXliZSBpdCdzIG5vdCBxZW11LCBidXQgdGhlIGM5MDYgdGhhdCBoYXMgYmVlbiBi
cm9rZW4gZm9yIGEgd2hpbGU/CgpJJ2xsIGRpc2FibGUgaXQgdGVtcG9yYXJpbHkgZnJvbSBDSSBh
bnlob3csIGFuZCB3aWxsIGNvbnRpbnVlIGRpZ2dpbmcuCgoKVGhhbmtzIGZvciB0aGUgcG9pbnRl
cnMvY2xhcmlmaWNhdGlvbnMsIENvbm9yIQpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
