Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D358C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fE38vDLe045ts+PlTdNisKPrggGv5a31C/Om1C0ysvw=; b=I+4T7f7jbYcttw
	yqmZshL/TC3CLVlvKpPx9y47W9Oo9fQS+TtuQ/iwFzWCeQx8XMVHI6swlfpYRGX01zkePBBlRsyeL
	4BRpH1vRmb6znAglH2M/49Ay8TJZCh5UdXBSlsJJrWxDh2kLNe5CE3yUdvqn5OcbHDF+qwWKWXkXz
	w0Z4jg2grfw1MDgEvBq59xigJ4L5DqeoaederP+N+SQ3Yf/i7Or4Eiwl+MfxM7bIlqFDN7jSMZIKZ
	jGVdP9yqw+wVMG9uu2Fqm3uab/ri/P077x3giyYoIjT1Sa9UonxaLFoji+tVcwWxFEP+TVkLmz742
	SWeDWXE5TIvBnsCPrcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx5U-00007u-0z;
	Wed, 20 Dec 2023 13:58:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx5N-00Hb5U-1J;
	Wed, 20 Dec 2023 13:58:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F391CE1CDE;
	Wed, 20 Dec 2023 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51FAAC433C8;
	Wed, 20 Dec 2023 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703080686;
	bh=FX4VAPxyEVKvbbJffi2oi0T7IYc01Fhx2zd5wWkz3wc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NwM8+cbYhkZDjaSPH54gM/FtSQx6WK56VcCUrgaSheWX7L6662Q9fpHMey/F+cXZg
	 LtFvlGYJcQXNjGKH3q6PORLqW8xfTVeMW+qmdar9AMN+2hdBfaCbaiH4Dd2wDHodsP
	 6FXgC3IFwnVC0v9tZgGSNbk0asM4KrATuC53simrWj1wtcSYwZ7eMZWO41nOb3MUa2
	 1H0UHtmiEvgTJW85oLccXjlzIY0tGG0UBoOT5XJVBoWPiUHiiuKIzK2kohUG0eyu0w
	 hZNhih9om2p+wdoGzMhF251x4XXMoN20Z9/D3usDXePXY2dt3r/kXxyFTMy6Hgqdl+
	 a3TCwLcOZfNkg==
Received: from [104.132.45.104] (helo=wait-a-minute.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rFx5H-005hDm-0g;
	Wed, 20 Dec 2023 13:58:03 +0000
Date: Wed, 20 Dec 2023 13:58:02 +0000
Message-ID: <87zfy5t1qt.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>,
	ajones@ventanamicro.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	wchen <waylingii@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Minda Chen <minda.chen@starfivetech.com>,
	Samuel Holland <samuel@sholland.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Peter Xu <peterx@redhat.com>,
	Like Xu <likexu@tencent.com>,
	Vipin Sharma <vipinsh@google.com>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Aaron Lewis <aaronlewis@google.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 11/11] KVM: selftests: Enable tunning of err_margin_us in arch timer test
In-Reply-To: <CAJve8ona7g=LxW1YeRB_FqGodF973H=A3b2m8054gmzK=Z7_ww@mail.gmail.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
	<0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
	<8734vy832j.wl-maz@kernel.org>
	<CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
	<f98879dc24f948f7a8a7b5374a32bc04@kernel.org>
	<CAJve8ona7g=LxW1YeRB_FqGodF973H=A3b2m8054gmzK=Z7_ww@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 104.132.45.104
X-SA-Exim-Rcpt-To: xiaobo55x@gmail.com, haibo1.xu@intel.com, ajones@ventanamicro.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, pbonzini@redhat.com, shuah@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, anup@brainfault.org, atishp@atishpatra.org, guoren@kernel.org, mchitale@ventanamicro.com, greentime.hu@sifive.com, waylingii@gmail.com, conor.dooley@microchip.com, heiko@sntech.de, minda.chen@starfivetech.com, samuel@sholland.org, jszhang@kernel.org, seanjc@google.com, peterx@redhat.com, likexu@tencent.com, vipinsh@google.com, maciej.wieczor-retman@intel.com, aaronlewis@google.com, thuth@redhat.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_055809_931708_0EDF80DD 
X-CRM114-Status: GOOD (  27.02  )
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

T24gV2VkLCAyMCBEZWMgMjAyMyAxMzo1MToyNCArMDAwMCwKSGFpYm8gWHUgPHhpYW9ibzU1eEBn
bWFpbC5jb20+IHdyb3RlOgo+IAo+IE9uIFdlZCwgRGVjIDIwLCAyMDIzIGF0IDU6MDDigK9QTSBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiAyMDIzLTEyLTIw
IDA2OjUwLCBIYWlibyBYdSB3cm90ZToKPiA+ID4gT24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMjoy
MuKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPj4KPiA+ID4+
IE9uIFR1ZSwgMTIgRGVjIDIwMjMgMDk6MzE6MjAgKzAwMDAsCj4gPiA+PiBIYWlibyBYdSA8aGFp
Ym8xLnh1QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+PiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1lcl90ZXN0LmggYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1lcl90ZXN0LmgKPiA+ID4+ID4gaW5kZXggOTY4MjU3Yjg5
M2E3Li5iMWQ0MDVlNzE1N2QgMTAwNjQ0Cj4gPiA+PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9pbmNsdWRlL3RpbWVyX3Rlc3QuaAo+ID4gPj4gPiArKysgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1lcl90ZXN0LmgKPiA+ID4+ID4gQEAgLTIyLDYg
KzIyLDcgQEAgc3RydWN0IHRlc3RfYXJncyB7Cj4gPiA+PiA+ICAgICAgIGludCBucl9pdGVyOwo+
ID4gPj4gPiAgICAgICBpbnQgdGltZXJfcGVyaW9kX21zOwo+ID4gPj4gPiAgICAgICBpbnQgbWln
cmF0aW9uX2ZyZXFfbXM7Cj4gPiA+PiA+ICsgICAgIGludCB0aW1lcl9lcnJfbWFyZ2luX3VzOwo+
ID4gPj4KPiA+ID4+IC4uLiBleGNlcHQgdGhhdCB5b3UgYXJlIHN0b3JpbmcgaXQgYXMgYSBzaWdu
ZWQgdmFsdWUuIFNvbWUgY29uc2lzdGVuY3kKPiA+ID4+IHdvdWxkbid0IGh1cnQsIHJlYWxseSwg
YW5kIHdvdWxkIGF2b2lkIGlzc3VlcyB3aGVuIHBhc3NpbmcgbGFyZ2UKPiA+ID4+IHZhbHVlcy4K
PiA+ID4+Cj4gPiA+Cj4gPiA+IFllcywgaXQncyBtb3JlIHByb3BlciB0byB1c2UgYW4gdW5zaWdu
ZWQgaW50IGZvciB0aGUgbm9uLW5lZ2F0aXZlIGVycm9yCj4gPiA+IG1hcmdpbi4KPiA+ID4gU3Rv
cmluZyBhcyBzaWduZWQgaGVyZSBpcyBqdXN0IHRvIGtlZXAgdGhlIHR5cGUgY29uc2lzdGVudCB3
aXRoIHRoYXQKPiA+ID4gb2YgdGltZXJfcGVyaW9kX21zCj4gPiA+IHNpbmNlIHRoZXJlIHdpbGwg
YmUgJysnIG9wZXJhdGlvbiBpbiBvdGhlciBwbGFjZXMuCj4gPiA+Cj4gPiA+ICAgICAgICAgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvYXJjaF90aW1lci5jCj4gPiA+ICAgICAg
ICAgLyogU2V0dXAgYSB0aW1lb3V0IGZvciB0aGUgaW50ZXJydXB0IHRvIGFycml2ZSAqLwo+ID4g
PiAgICAgICAgICB1ZGVsYXkobXNlY3NfdG9fdXNlY3ModGVzdF9hcmdzLnRpbWVyX3BlcmlvZF9t
cykgKwo+ID4gPiAgICAgICAgICAgICAgdGVzdF9hcmdzLnRpbWVyX2Vycl9tYXJnaW5fdXMpOwo+
ID4KPiA+IEJ1dCB0aGF0J3MgZXhhY3RseSB3aHkgdXNpbmcgYSBzaWduZWQgcXVhbnRpdHkgaXMg
d3JvbmcuCj4gPiBXaGF0IGRvZXMgaXQgbWVhbiB0byBoYXZlIGEgaHVnZSAqbmVnYXRpdmUqIG1h
cmdpbj8KPiA+Cj4gCj4gSGkgTWFyYywKPiAKPiBJIGFncmVlIHRoYXQgbmVnYXRpdmUgdmFsdWVz
IGFyZSBtZWFuaW5nbGVzcyBmb3IgdGhlIG1hcmdpbi4KPiBJZiBJIHVuZGVyc3RhbmQgY29ycmVj
dGx5LCB0aGUgbmVnYXRpdmUgbWFyZ2luIHNob3VsZCBiZSBmaWx0ZXJlZCBieQo+IGFzc2VydGlv
biBpbiBhdG9pX25vbl9uZWdhdGl2ZSgpLgoKTm8uIFBsZWFzZS4KCmF0b2lfbm9uX25lZ2F0aXZl
KCkgcmV0dXJucyBhIHVpbnQzMl90LCB3aGljaCBpcyB3aGF0IGl0IHNob3VsZCBkby4KVGhlIGJ1
ZyBpcyBzcXVhcmVseSBpbiB0aGUgdXNlIG9mIGFuICdpbnQnIHRvIHN0b3JlIHN1Y2ggdmFsdWUs
IGFuZCBpdAppcyB0aGUgKnN0b3JhZ2UqIHRoYXQgdHVybnMgYSBwb3NpdGl2ZSB2YWx1ZSBpbnRv
IGEgbmVnYXRpdmUgb25lLgoKCU0uCgotLSAKV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9y
bSwgcHJvZ3Jlc3MgaXMgbm90IHBvc3NpYmxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
