Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBF1C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPDY+apA0xV6yjz6zEhVXGhwleUfMwMMl8YH4qQbW5U=; b=Y40ZIpe44PPlOc
	S7c0tw7hAT/lFdwVSNuLKBjTD1wzC1F7Pso4ilc+Wkh32rukyUyeRlPX0tRuV0WSVy/8OwyXRtxCW
	G+wzBGC4BQ9HQaqZAW2YrGMLYpgyLVgKqsrpy1K//jSWm8+A4UvkJTUjL6cgWP/rVVu0uGlYlLU+8
	XLfbVLZb6eTVEUyauJWxirjgmhEhEuswO6gu69tKVysQwWJkXSJWPCYYV9k5eDMMOmqviBS2mDb1y
	iJQfaDznl8JzFvmd5fP8G8UdcPYWZUHFyYKC8c3nf4Adtq6g5azgOzt/O2cx5x9yO7Q/Xv6EroryH
	Z77ARhBMojToZquDsOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFIr-002GEZ-22;
	Thu, 21 Dec 2023 09:25:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFIj-002G9m-01;
	Thu, 21 Dec 2023 09:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E2C68B81F61;
	Thu, 21 Dec 2023 09:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC26C433C7;
	Thu, 21 Dec 2023 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703150706;
	bh=AYGf91U8T/JqQeT9S7bNrsfYGOsBnl13+m+5Z2NMRpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e+a1SPK9XQk98t/2P89QLYkpRHBpJS7KY21oexMqyE4ufnNnH1jA60n99byaXUQrG
	 Whze4kMbMPwcMYcyZxxZthpvZeB86k4WI2aoo5qTNeHpb0hiPYhTvStJ316yvjfq6j
	 dtlS3klVPy7VJSds3XBKmkSvuP/7RE7bHXFEPyxIYjUUoiWjQ+MzJJ2PQGgJxFGnDy
	 JglUtTKXGsfwyIxsYSBqcJHYZBf1neH1h3xIwVrp65z5zJTs3+eRYQTEdLTc+zL4H0
	 Oh8HDT/FEIfnZbhUeAp76Mhb5ygZSOHs3myvlqSoNxw9Mv3cIVXXSMpG/TFhnfbsqA
	 MM/3QxvCERuTg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1rGFIc-005wSL-VG;
	Thu, 21 Dec 2023 09:25:03 +0000
Date: Thu, 21 Dec 2023 09:25:02 +0000
Message-ID: <86plyzaowh.wl-maz@kernel.org>
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
In-Reply-To: <CAJve8o=nTsAwwgSib4vOLXjOWSMV2+J+BFsUZ57OdAK7eW8q8A@mail.gmail.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
	<0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
	<8734vy832j.wl-maz@kernel.org>
	<CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
	<f98879dc24f948f7a8a7b5374a32bc04@kernel.org>
	<CAJve8ona7g=LxW1YeRB_FqGodF973H=A3b2m8054gmzK=Z7_ww@mail.gmail.com>
	<87zfy5t1qt.wl-maz@kernel.org>
	<CAJve8o=nTsAwwgSib4vOLXjOWSMV2+J+BFsUZ57OdAK7eW8q8A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: xiaobo55x@gmail.com, haibo1.xu@intel.com, ajones@ventanamicro.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, pbonzini@redhat.com, shuah@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, anup@brainfault.org, atishp@atishpatra.org, guoren@kernel.org, mchitale@ventanamicro.com, greentime.hu@sifive.com, waylingii@gmail.com, conor.dooley@microchip.com, heiko@sntech.de, minda.chen@starfivetech.com, samuel@sholland.org, jszhang@kernel.org, seanjc@google.com, peterx@redhat.com, likexu@tencent.com, vipinsh@google.com, maciej.wieczor-retman@intel.com, aaronlewis@google.com, thuth@redhat.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012509_358181_38FB5F4A 
X-CRM114-Status: GOOD (  32.28  )
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

T24gVGh1LCAyMSBEZWMgMjAyMyAwMjo1ODo0MCArMDAwMCwKSGFpYm8gWHUgPHhpYW9ibzU1eEBn
bWFpbC5jb20+IHdyb3RlOgo+IAo+IE9uIFdlZCwgRGVjIDIwLCAyMDIzIGF0IDk6NTjigK9QTSBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIDIwIERl
YyAyMDIzIDEzOjUxOjI0ICswMDAwLAo+ID4gSGFpYm8gWHUgPHhpYW9ibzU1eEBnbWFpbC5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIERlYyAyMCwgMjAyMyBhdCA1OjAw4oCvUE0gTWFy
YyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiAyMDIz
LTEyLTIwIDA2OjUwLCBIYWlibyBYdSB3cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgRGVjIDIwLCAy
MDIzIGF0IDI6MjLigK9BTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPiB3cm90ZToKPiA+
ID4gPiA+Pgo+ID4gPiA+ID4+IE9uIFR1ZSwgMTIgRGVjIDIwMjMgMDk6MzE6MjAgKzAwMDAsCj4g
PiA+ID4gPj4gSGFpYm8gWHUgPGhhaWJvMS54dUBpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4+
ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3RpbWVy
X3Rlc3QuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3RpbWVyX3Rlc3Qu
aAo+ID4gPiA+ID4+ID4gaW5kZXggOTY4MjU3Yjg5M2E3Li5iMWQ0MDVlNzE1N2QgMTAwNjQ0Cj4g
PiA+ID4gPj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1l
cl90ZXN0LmgKPiA+ID4gPiA+PiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9p
bmNsdWRlL3RpbWVyX3Rlc3QuaAo+ID4gPiA+ID4+ID4gQEAgLTIyLDYgKzIyLDcgQEAgc3RydWN0
IHRlc3RfYXJncyB7Cj4gPiA+ID4gPj4gPiAgICAgICBpbnQgbnJfaXRlcjsKPiA+ID4gPiA+PiA+
ICAgICAgIGludCB0aW1lcl9wZXJpb2RfbXM7Cj4gPiA+ID4gPj4gPiAgICAgICBpbnQgbWlncmF0
aW9uX2ZyZXFfbXM7Cj4gPiA+ID4gPj4gPiArICAgICBpbnQgdGltZXJfZXJyX21hcmdpbl91czsK
PiA+ID4gPiA+Pgo+ID4gPiA+ID4+IC4uLiBleGNlcHQgdGhhdCB5b3UgYXJlIHN0b3JpbmcgaXQg
YXMgYSBzaWduZWQgdmFsdWUuIFNvbWUgY29uc2lzdGVuY3kKPiA+ID4gPiA+PiB3b3VsZG4ndCBo
dXJ0LCByZWFsbHksIGFuZCB3b3VsZCBhdm9pZCBpc3N1ZXMgd2hlbiBwYXNzaW5nIGxhcmdlCj4g
PiA+ID4gPj4gdmFsdWVzLgo+ID4gPiA+ID4+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gWWVzLCBpdCdz
IG1vcmUgcHJvcGVyIHRvIHVzZSBhbiB1bnNpZ25lZCBpbnQgZm9yIHRoZSBub24tbmVnYXRpdmUg
ZXJyb3IKPiA+ID4gPiA+IG1hcmdpbi4KPiA+ID4gPiA+IFN0b3JpbmcgYXMgc2lnbmVkIGhlcmUg
aXMganVzdCB0byBrZWVwIHRoZSB0eXBlIGNvbnNpc3RlbnQgd2l0aCB0aGF0Cj4gPiA+ID4gPiBv
ZiB0aW1lcl9wZXJpb2RfbXMKPiA+ID4gPiA+IHNpbmNlIHRoZXJlIHdpbGwgYmUgJysnIG9wZXJh
dGlvbiBpbiBvdGhlciBwbGFjZXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMKPiA+ID4gPiA+ICAgICAg
ICAgLyogU2V0dXAgYSB0aW1lb3V0IGZvciB0aGUgaW50ZXJydXB0IHRvIGFycml2ZSAqLwo+ID4g
PiA+ID4gICAgICAgICAgdWRlbGF5KG1zZWNzX3RvX3VzZWNzKHRlc3RfYXJncy50aW1lcl9wZXJp
b2RfbXMpICsKPiA+ID4gPiA+ICAgICAgICAgICAgICB0ZXN0X2FyZ3MudGltZXJfZXJyX21hcmdp
bl91cyk7Cj4gPiA+ID4KPiA+ID4gPiBCdXQgdGhhdCdzIGV4YWN0bHkgd2h5IHVzaW5nIGEgc2ln
bmVkIHF1YW50aXR5IGlzIHdyb25nLgo+ID4gPiA+IFdoYXQgZG9lcyBpdCBtZWFuIHRvIGhhdmUg
YSBodWdlICpuZWdhdGl2ZSogbWFyZ2luPwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEhpIE1hcmMsCj4g
PiA+Cj4gPiA+IEkgYWdyZWUgdGhhdCBuZWdhdGl2ZSB2YWx1ZXMgYXJlIG1lYW5pbmdsZXNzIGZv
ciB0aGUgbWFyZ2luLgo+ID4gPiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCB0aGUgbmVnYXRp
dmUgbWFyZ2luIHNob3VsZCBiZSBmaWx0ZXJlZCBieQo+ID4gPiBhc3NlcnRpb24gaW4gYXRvaV9u
b25fbmVnYXRpdmUoKS4KPiA+Cj4gPiBOby4gUGxlYXNlLgo+ID4KPiA+IGF0b2lfbm9uX25lZ2F0
aXZlKCkgcmV0dXJucyBhIHVpbnQzMl90LCB3aGljaCBpcyB3aGF0IGl0IHNob3VsZCBkby4KPiA+
IFRoZSBidWcgaXMgc3F1YXJlbHkgaW4gdGhlIHVzZSBvZiBhbiAnaW50JyB0byBzdG9yZSBzdWNo
IHZhbHVlLCBhbmQgaXQKPiA+IGlzIHRoZSAqc3RvcmFnZSogdGhhdCB0dXJucyBhIHBvc2l0aXZl
IHZhbHVlIGludG8gYSBuZWdhdGl2ZSBvbmUuCj4gPgo+IAo+IFRoYW5rcyBmb3IgdGhlIGRldGFp
bGVkIGluZm8hCj4gCj4gTWF5IEkgdW5kZXJzdGFuZCB0aGF0IHlvdXIgY29uY2VybiBpcyBtYWlu
bHkgZm9yIGEgcGxhdGZvcm0gd2l0aAo+IDY0Yml0IGludCB0eXBlLCB3aGljaCBtYXkgdHJpZ2dl
ciB0aGUgcG9zaXRpdmUgdG8gbmVnYXRpdmUgY29udmVydD8KCk5vLiBJdCBzcGVjaWZpY2FsbHkg
YXBwbGllcyB0byBhcmNoaXRlY3R1cmVzIHdpdGggYSAzMmJpdCBpbnQgdHlwZSwKd2hpY2ggaXMu
Li4gKkVWRVJZVEhJTkcqLiBIZXJlJ3MgYSBiYXNpYyBleGFtcGxlOgoKPHF1b3RlPgojaW5jbHVk
ZSA8c3RkaW8uaD4KCmludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCnsKCWludCB4ID0g
MVUgPDwgMzE7CgoJcHJpbnRmKCIlZCAoJWQpXG4iLCB4LCBzaXplb2YoeCkpOwoJcmV0dXJuIDA7
Cn0KPC9xdW90ZT4KCndoaWNoIHJldHVybnMgIi0yMTQ3NDgzNjQ4ICg0KSIgb24gYW55IHBsYXRm
b3JtLgoKVGhpcyByZWFsbHkgaXMgYmFzaWMgQywgYW5kIEkgYW0gdmVyeSB3b3JyaWVkIHRoYXQg
eW91IGRvbid0IHNlZSB0aGUKaXNzdWUuIEkgc3Ryb25nbHkgc3VnZ2VzdCB0aGF0IHlvdSBnbyBh
bmQgcmVhZCBhYm91dCB0aGUgQyB0eXBlIHN5c3RlbQpiZWZvcmUgdG91Y2hpbmcgdGhpcyBjb2Rl
LgoKCU0uCgotLSAKV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jlc3MgaXMg
bm90IHBvc3NpYmxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
