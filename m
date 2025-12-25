Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EFCE7AD41
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gp/rkPc9Vi6YQ8x/HzxBNxrsBjE7m2k3mbq7paGJi4s=; b=Tnzx91m+FHPvto
	Xu5UHtPjk+EyBRugP+PWGA+ry8TPWOqzLvIYASzM5xj/K3Enuz4cvDe2OyydUwnzIlJzmE4ljbfj1
	R4+XwxzmiNAR2E+4F1FJ6yhpqNQLHdzrHTJWCuUFQy4Y1kWk1/7fRFTy8Ry+DGeAHej8MQHDbxb/N
	kkPnayAo/6Z0eJgbQUynXS9l0vzwLS7QgaIf+JNjfLop4vS1mxRqgIJn57KJdnbaN3qWT7Nos8PMX
	D1O9yuAjII+dammtoeiovD6FigDjGP4C5paZtDm8OaVP0CKL3T06YQs0eklLu5WKbIPNSYSj1PLmv
	ksFAhzxPNgViPw8lwXZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhAE-00000000FKB-2X6U;
	Thu, 25 Dec 2025 08:57:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhAC-00000000FJm-3Xzo;
	Thu, 25 Dec 2025 08:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07B0D60010;
	Thu, 25 Dec 2025 08:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75CCC4CEF1;
	Thu, 25 Dec 2025 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653058;
	bh=JbAlLOSZ4lp2eqLIqN854RLD8F4hVgelu+B0u8PEklQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lnfOTwU4+apIYrQlSwNee5D+OFUc0kyNaJ05pnV9yb/rrNk++IRoErqOxaNYxdZEa
	 Ec47AbiAW7GQrAOPpJxhwUyFk3GwlFQEQRfhgssjeGhSVa6wLU6dwBw60W8FM84mVs
	 yC8zVz72FqK43BBWTQVtMlie6qtYNv26lZmyti6L1jM68UsNjdv8TR7S+FJAVtnMRU
	 J2NQ9Ww5JUohaY9eX0JlF3EXzJL3uDIU6lAvxuwzBAx5Jd67BAjgVB/99gI6165R20
	 zZg33ZqlOpxS9F+fIxawiBJlEPxthN07AQhbDtTL74uRxkodg76ILOdLMuqVRHNRnr
	 qrSppllPQyGpQ==
Date: Thu, 25 Dec 2025 09:57:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com, 
	conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com, 
	davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io, 
	gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org, 
	palmer@dabbelt.com, pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver binding
Message-ID: <20251225-translucent-radical-coot-d3f9ee@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-2-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224135217.25350-2-joaopeixoto@osyx.tech>
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

T24gV2VkLCBEZWMgMjQsIDIwMjUgYXQgMDE6NTI6MTNQTSArMDAwMCwgam9hb3BlaXhvdG9Ab3N5
eC50ZWNoIHdyb3RlOgo+IEZyb206IEpvw6NvIFBlaXhvdG8gPGpvYW9wZWl4b3RvQG9zeXgudGVj
aD4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSBEZXZpY2UgVHJlZSBiaW5kaW5nIGZvciB0aGUgQmFv
IElQQyBzaGFyZWQgbWVtb3J5Cj4gZGV2aWNlLCB3aGljaCBwcm92aWRlcyBhIHN0YW5kYXJkaXpl
ZCBkZXNjcmlwdGlvbiBvZiB0aGUgaGFyZHdhcmUKPiBpbnRlcmZhY2UgdXNlZCBmb3IgaW50ZXIt
Vk0gY29tbXVuaWNhdGlvbiBpbiBCYW8tYmFzZWQgc3lzdGVtcy4KPiAKCkFsbCB5b3UgZW1haWxz
IGJvdW5jZWQgYXMgc3BhbSwgc28geW91IG5lZWQgdG9maXggeW91ciBlbWFpbCBzZXR1cC4gSQpm
b3VuZCB0aGlzIG9ubHkgdmlhIGxvcmUuCgo+IFRoZSBiaW5kaW5nIGRvY3VtZW50cyB0aGUgZm9s
bG93aW5nIHByb3BlcnRpZXM6Cj4gCj4gICAtIGNvbXBhdGlibGU6ICJiYW8saXBjc2htZW0iCj4g
ICAtIHJlZzogTWVtb3J5IHJlZ2lvbiBmb3IgdGhlIHNoYXJlZCBtZW1vcnkgZGV2aWNlCj4gICAt
IGlkOiBVbmlxdWUgZGV2aWNlIGlkZW50aWZpZXIKPiAgIC0gcmVhZC1jaGFubmVsOiBbb2Zmc2V0
LCBzaXplXSBmb3IgcmVhZGluZyBmcm9tIHRoZSBzaGFyZWQgbWVtb3J5Cj4gICAtIHdyaXRlLWNo
YW5uZWw6IFtvZmZzZXQsIHNpemVdIGZvciB3cml0aW5nIHRvIHRoZSBzaGFyZWQgbWVtb3J5Cj4g
ICAtIGludGVycnVwdHM6IEludGVycnVwdHMgdXNlZCBieSB0aGUgZGV2aWNlCgpJcnJlbGV2YW50
LiBEcm9wLgoKPiAKPiBUaGlzIGVuYWJsZXMga2VybmVsIGRyaXZlcnMgYW5kIHVzZXJzcGFjZSB0
b29scyB0byBjb3JyZWN0bHkKPiBpbnN0YW50aWF0ZSBhbmQgY29uZmlndXJlIEJhbyBJUEMgc2hh
cmVkIG1lbW9yeSBkZXZpY2VzIGJhc2VkCj4gb24gdGhlIERUIGRlc2NyaXB0aW9uLCBmYWNpbGl0
YXRpbmcgZWZmaWNpZW50IGNvbW11bmljYXRpb24KPiBiZXR3ZWVuIFZNcy4KPiAKCklycmVsZXZh
bnQuIERlc2NyaWJlIGhhcmR3YXJlLgoKPiBTaWduZWQtb2ZmLWJ5OiBKb8OjbyBQZWl4b3RvIDxq
b2FvcGVpeG90b0Bvc3l4LnRlY2g+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Jh
by9pcGNzaG1lbS55YW1sICAgICB8IDk5ICsrKysrKysrKysrKysrKysrKysKPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwgIDIgKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDEwMSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2lwY3NobWVtLnlhbWwKCgpGaWxlbmFtZSBtYXRj
aGluZyBjb21wYXRpYmxlLgo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYmFvL2lwY3NobWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYmFvL2lwY3NobWVtLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uMzk4YWM2MTBjMjlmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9iYW8vaXBjc2htZW0ueWFtbAo+IEBAIC0wLDAg
KzEsOTkgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogImh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL2Jhby9pcGNzaG1lbS55YW1sIyIKPiArJHNjaGVtYTogImh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIyIKPiArCj4gK3RpdGxlOiBCYW8gSVBD
IFNoYXJlZCBNZW1vcnkgRGV2aWNlCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIEpvc8OpIE1h
cnRpbnMgPGpvc2VAb3N5eC50ZWNoPgo+ICsgIC0gRGF2aWQgQ2VyZGVpcmEgPGRhdmlkbWNlcmRl
aXJhQG9zeXgudGVjaD4KPiArICAtIEpvw6NvIFBlaXhvdG8gPGpvYW9wZWl4b3RvQG9zeXgudGVj
aD4KPiArCj4gK2Rlc2NyaXB0aW9uOiB8Cj4gKyAgU2hhcmVkIG1lbW9yeSBiYXNlZCBjb21tdW5p
Y2F0aW9uIGRldmljZSBmb3IgQmFvIGh5cGVydmlzb3IgZ3Vlc3RzLgo+ICsgIEl0IGFsbG93cyB0
aGUga2VybmVsIHRvIGludGVyZmFjZSB3aXRoIGd1ZXN0cyBydW5uaW5nIHVuZGVyCj4gKwl0aGUg
QmFvIGh5cGVydmlzb3IsIHByb3ZpZGluZyBhIGNoYXJhY3RlciBkZXZpY2UgaW50ZXJmYWNlCj4g
Kwlmb3IgZXhjaGFuZ2luZyBkYXRhIHRocm91Z2ggZGVkaWNhdGVkIHNoYXJlZC1tZW1vcnkgcmVn
aW9ucy4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiAi
YmFvLGlwY3NobWVtIgo+ICsKPiArICByZWc6Cj4gKyAgICBkZXNjcmlwdGlvbjogfAo+ICsgICAg
ICBNZW1vcnkgcmVzb3VyY2UgZm9yIHRoZSBzaGFyZWQgbWVtb3J5IGRldmljZS4KPiArICAgIG1h
eEl0ZW1zOiA0Cj4gKyAgICB0eXBlOiBhcnJheQo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIHR5cGU6
IGludGVnZXIKCgpEb24ndCBzZW5kIHVzIExMTSBqdW5rLiBOb3RoaW5nIGhlcmUgaXMgZXZlbiBj
bG9zZSB0byBwcm9wZXIgYmluZGluZ3MsCndoaWNoIG1lYW5zOgoKMS4gWW91IGRpZCBub3Qgd3Jp
dGUgaXQgeW91cnNlbGYsIGJlY2F1c2UgaXQgaXMgaW1wb3NzaWJsZSB0byBjb21lIHdpdGgKc3lu
dGF4IGxpa2UgdGhhdCAoanVzdCBkb2VzIG5vdCBleGlzdCksCgoyLiBEaWQgbm90IGV2ZW4gYm90
aGVyIHRvIHRlc3QgaXQuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
