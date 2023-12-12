Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D29C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 19:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJnye1P24A0jDJojTJ+rfGdivCdyejntvjUs89+ap6U=; b=YRBne5QXeorlQQ
	1ZMfR0ZG/zxJA/lM4gWLaX43eBtH8gpiED4hByD8O1/8vHQrQL/UPF5brY1qK0K2uTGyLYCEx+lAg
	WiLzbvMGGFaedKNiT94Uk6Ur/hdvGUiw6vX8spbtsG4jItlNL/Ti3WP46KmruA0I5z4TRHOiYbaU4
	pD/covxL+6MxqTVGgiVVGbR+wj/g6OVAsRNCMuGWo14n7cGthBXB0DFxEcIdvU+0hpMXahH2lvyGC
	1DeGz0o9WB828t20bQM5xAan3oQO9DRhLy5IIXjQg1M2CzapZ2tTI+V5i2jWbFGOWYtdPNce2N4Yg
	4Xe9Ai4cOwQ0OOeJV23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8G5-00CZkb-0B;
	Tue, 12 Dec 2023 19:17:33 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8Fx-00CZhC-1d
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 19:17:27 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5e282ec7537so2047617b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 11:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702408642; x=1703013442; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXh6bur6LRnADXulivu2P72dN6ifPaK1xY/cKiFFTNI=;
        b=rbVkdoSRtrK0ZnMMeQFpxD9KkSv7Yd3Se0SitQGemDrZFhqnVzXScNqG0+ABafXtue
         2K16A60aX/Q5E0FQsaJcMHFgz+eTrOwI6LNINENYem5CYYdXm8MArinbENDWrNDv8rON
         0P+bufctERaB3PhEhgAfULqQtP7vWBgg270l8HPC7TEWfCW0cq4dMJRTpjyAs+tUeazf
         04JIf/zu5PElV+FVjVn5nqgiZ54Xe/zCd54S6PyjgLb9GtOiM20lVujyod1VqyaT8IZx
         SlzHthCazNXFsUUZnh0dIt/xUOED7vVWKUH3MuWt7PJAGPOF5mGTS/wFVVimqD0HsEgk
         k9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702408642; x=1703013442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXh6bur6LRnADXulivu2P72dN6ifPaK1xY/cKiFFTNI=;
        b=O2g021AGeA5cEfSi5wqSATZlE0mWHmhG5l33cZhL0JrV55z9/mwb3EoZbe/m+qdNck
         zDFdH/ar+hISqDOI6EFkTUm6I5m1rkzod98BQDMQ0rxXYof5F0CFxqdqzYK7Fd1jA36C
         ypX+iBk/zzZtK9Myw1swuBNYovr30iGRyqsxtayf7SCqCByVO6J/a/+ehi93cDsNCavi
         CIW1+6iPptdJUzzthqNmymcbZS/c68hVrYgp82kvHAWjmFKopAhOFr3wx2cnmoQsRFnH
         xJnJkziy7NrWf5L72u89RSH84JzIebkhrlXdy5MNIHb2tug3Om8aTS9CLJOHrtdxF3h/
         5HjA==
X-Gm-Message-State: AOJu0YwgBzrXAZhF8qqvu3WuZHm9ojIZSygTcTlfsEDQQJf/Ks4k0SOy
	IO9AapTm+ngGPmFZ7oIxtiQMTS9XEA8Lysq5M8iE3g==
X-Google-Smtp-Source: AGHT+IEg7PrE51WetYNV2TXBUh16oGjCgjaHBUbmLH/Y9ejNibFsuQg1ft+g8k/hUJRIzvj4zJlXYzVe6GRAoz3cE6E=
X-Received: by 2002:a25:244b:0:b0:dbc:c4f2:612f with SMTP id
 k72-20020a25244b000000b00dbcc4f2612fmr698912ybk.34.1702408642045; Tue, 12 Dec
 2023 11:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org> <20231122-arm64-gcs-v7-2-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-2-201c483bd775@kernel.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 12 Dec 2023 11:17:11 -0800
Message-ID: <CAKC1njSC5cC_fXnyNAPt=WU6cD-OjLKFxo90oVPmsLJbuWf4nw@mail.gmail.com>
Subject: Re: [PATCH v7 02/39] prctl: arch-agnostic prctl for shadow stack
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_111725_545804_6137C95C 
X-CRM114-Status: GOOD (  28.11  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTo0M+KAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBUaHJlZSBhcmNoaXRlY3R1cmVzICh4ODYsIGFhcmNoNjQsIHJp
c2N2KSBoYXZlIGFubm91bmNlZCBzdXBwb3J0IGZvcgo+IHNoYWRvdyBzdGFja3Mgd2l0aCBmYWly
bHkgc2ltaWxhciBmdW5jdGlvbmFsaXR5LiAgV2hpbGUgeDg2IGlzIHVzaW5nCj4gYXJjaF9wcmN0
bCgpIHRvIGNvbnRyb2wgdGhlIGZ1bmN0aW9uYWxpdHkgbmVpdGhlciBhcm02NCBub3IgcmlzY3Yg
dXNlcwo+IHRoYXQgaW50ZXJmYWNlIHNvIHRoaXMgcGF0Y2ggYWRkcyBhcmNoLWFnbm9zdGljIHBy
Y3RsKCkgc3VwcG9ydCB0bwo+IGdldCBhbmQgc2V0IHN0YXR1cyBvZiBzaGFkb3cgc3RhY2tzIGFu
ZCBsb2NrIHRoZSBjdXJyZW50IGNvbmZpZ3VhdGlvbiB0bwo+IHByZXZlbnQgZnVydGhlciBjaGFu
Z2VzLCB3aXRoIHN1cHBvcnQgZm9yIHR1cm5pbmcgb24gYW5kIG9mZiBpbmRpdmlkdWFsCj4gc3Vi
ZmVhdHVyZXMgc28gYXBwbGljYXRpb25zIGNhbiBsaW1pdCB0aGVpciBleHBvc3VyZSB0byBmZWF0
dXJlcyB0aGF0Cj4gdGhleSBkbyBub3QgbmVlZC4gIFRoZSBmZWF0dXJlcyBhcmU6Cj4KPiAgIC0g
UFJfU0hBRE9XX1NUQUNLX0VOQUJMRTogVHJhY2tpbmcgYW5kIGVuZm9yY2VtZW50IG9mIHNoYWRv
dyBzdGFja3MsCj4gICAgIGluY2x1ZGluZyBhbGxvY2F0aW9uIG9mIGEgc2hhZG93IHN0YWNrIGlm
IG9uZSBpcyBub3QgYWxyZWFkeQo+ICAgICBhbGxvY2F0ZWQuCj4gICAtIFBSX1NIQURPV19TVEFD
S19XUklURTogV3JpdGVzIHRvIHNwZWNpZmljIGFkZHJlc3NlcyBpbiB0aGUgc2hhZG93Cj4gICAg
IHN0YWNrLgo+ICAgLSBQUl9TSEFET1dfU1RBQ0tfUFVTSDogUHVzaCBhZGRpdGlvbmFsIHZhbHVl
cyBvbnRvIHRoZSBzaGFkb3cgc3RhY2suCj4KPiBUaGVzZSBmZWF0dXJlcyBhcmUgZXhwZWN0ZWQg
dG8gYmUgaW5oZXJpdGVkIGJ5IG5ldyB0aHJlYWRzIGFuZCBjbGVhcmVkCj4gb24gZXhlYygpLCB1
bmtub3duIGZlYXR1cmVzIHNob3VsZCBiZSByZWplY3RlZCBmb3IgZW5hYmxlIGJ1dCBhY2NlcHRl
ZAo+IGZvciBsb2NraW5nIChpbiBvcmRlciB0byBhbGxvdyBmb3IgZnV0dXJlIHByb29maW5nKS4K
Pgo+IFRoaXMgaXMgYmFzZWQgb24gYSBwYXRjaCBvcmlnaW5hbGx5IHdyaXR0ZW4gYnkgRGVlcGFr
IEd1cHRhIGJ1dCBtb2RpZmllZAo+IGZhaXJseSBoZWF2aWx5LCBzdXBwb3J0IGZvciBpbmRpcmVj
dCBsYW5kaW5nIHBhZHMgaXMgcmVtb3ZlZCwgYWRkaXRpb25hbAo+IG1vZGVzIGFkZGVkIGFuZCB0
aGUgbG9ja2luZyBpbnRlcmZhY2UgcmV3b3JrZWQuICBUaGUgc2V0IHN0YXR1cyBwcmN0bCgpCj4g
aXMgYWxzbyByZXdvcmtlZCB0byBqdXN0IHNldCBmbGFncywgaWYgc2V0dGluZy9yZWFkaW5nIHRo
ZSBzaGFkb3cgc3RhY2sKPiBwb2ludGVyIGlzIHJlcXVpcmVkIHRoaXMgY291bGQgYmUgYSBzZXBh
cmF0ZSBwcmN0bC4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgfCAgNCArKysrCj4gIGlu
Y2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+ICBr
ZXJuZWwvc3lzLmMgICAgICAgICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDU2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCAxMDQ2MmYz
NTQ2MTQuLjhiMjg0ODNiNGFmYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiAr
KysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBAQCAtNDE0Myw0ICs0MTQzLDggQEAgc3RhdGljIGlu
bGluZSBib29sIHBmbl9pc191bmFjY2VwdGVkX21lbW9yeSh1bnNpZ25lZCBsb25nIHBmbikKPiAg
ICAgICAgIHJldHVybiByYW5nZV9jb250YWluc191bmFjY2VwdGVkX21lbW9yeShwYWRkciwgcGFk
ZHIgKyBQQUdFX1NJWkUpOwo+ICB9Cj4KPiAraW50IGFyY2hfZ2V0X3NoYWRvd19zdGFja19zdGF0
dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0LCB1bnNpZ25lZCBsb25nIF9fdXNlciAqc3RhdHVzKTsK
PiAraW50IGFyY2hfc2V0X3NoYWRvd19zdGFja19zdGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0
LCB1bnNpZ25lZCBsb25nIHN0YXR1cyk7Cj4gK2ludCBhcmNoX2xvY2tfc2hhZG93X3N0YWNrX3N0
YXR1cyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsIHVuc2lnbmVkIGxvbmcgc3RhdHVzKTsKPiArCj4g
ICNlbmRpZiAvKiBfTElOVVhfTU1fSCAqLwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGlu
dXgvcHJjdGwuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oCj4gaW5kZXggMzcwZWQxNGIx
YWUwLi4zYzY2ZWQ4ZjQ2ZDggMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ByY3Rs
LmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaAo+IEBAIC0zMDYsNCArMzA2LDI2
IEBAIHN0cnVjdCBwcmN0bF9tbV9tYXAgewo+ICAjIGRlZmluZSBQUl9SSVNDVl9WX1ZTVEFURV9D
VFJMX05FWFRfTUFTSyAgICAgIDB4Ywo+ICAjIGRlZmluZSBQUl9SSVNDVl9WX1ZTVEFURV9DVFJM
X01BU0sgICAgICAgICAgIDB4MWYKPgo+ICsvKgo+ICsgKiBHZXQgdGhlIGN1cnJlbnQgc2hhZG93
IHN0YWNrIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBjdXJyZW50IHRocmVhZCwKPiArICogdGhpcyB3
aWxsIGJlIHRoZSB2YWx1ZSBjb25maWd1cmVkIHZpYSBQUl9TRVRfU0hBRE9XX1NUQUNLX1NUQVRV
Uy4KPiArICovCj4gKyNkZWZpbmUgUFJfR0VUX1NIQURPV19TVEFDS19TVEFUVVMgICAgICA3MQo+
ICsKPiArLyoKPiArICogU2V0IHRoZSBjdXJyZW50IHNoYWRvdyBzdGFjayBjb25maWd1cmF0aW9u
LiAgRW5hYmxpbmcgdGhlIHNoYWRvdwo+ICsgKiBzdGFjayB3aWxsIGNhdXNlIGEgc2hhZG93IHN0
YWNrIHRvIGJlIGFsbG9jYXRlZCBmb3IgdGhlIHRocmVhZC4KPiArICovCj4gKyNkZWZpbmUgUFJf
U0VUX1NIQURPV19TVEFDS19TVEFUVVMgICAgICA3Mgo+ICsjIGRlZmluZSBQUl9TSEFET1dfU1RB
Q0tfRU5BQkxFICAgICAgICAgKDFVTCA8PCAwKQoKT3RoZXIgYXJjaGl0ZWN0dXJlIG1heSByZXF1
aXJlIGRpc2FibGluZyBzaGFkb3cgc3RhY2sgaWYgZ2xpYmMKdHVuYWJsZXMgaXMgc2V0IHRvIHBl
cm1pc3NpdmUgbW9kZS4KSW4gcGVybWlzc2l2ZSBtb2RlLCBpZiBnbGliYyBlbmNvdW50ZXJzIGBk
bG9wZW5gIG9uIGFuIG9iamVjdCB3aGljaApkb2Vzbid0IHN1cHBvcnQgc2hhZG93IHN0YWNrLApn
bGliYyBzaG91bGQgYmUgYWJsZSB0byBpc3N1ZSBQUl9TSEFET1dfU1RBQ0tfRElTQUJMRS4KCkFy
Y2hpdGVjdHVyZXMgY2FuIGNob29zZSB0byBpbXBsZW1lbnQgb3Igbm90IGJ1dCBJIHRoaW5rIGFy
Y2ggYWdub3N0aWMKY29kZSBzaG91bGQgZW51bWVyYXRlIHRoaXMuCgo+ICsjIGRlZmluZSBQUl9T
SEFET1dfU1RBQ0tfV1JJVEUgICAgICAgICAoMVVMIDw8IDEpCj4gKyMgZGVmaW5lIFBSX1NIQURP
V19TVEFDS19QVVNIICAgICAgICAgICgxVUwgPDwgMikKPiArCj4gKy8qCj4gKyAqIFByZXZlbnQg
ZnVydGhlciBjaGFuZ2VzIHRvIHRoZSBzcGVjaWZpZWQgc2hhZG93IHN0YWNrCj4gKyAqIGNvbmZp
Z3VyYXRpb24uICBBbGwgYml0cyBtYXkgYmUgbG9ja2VkIHZpYSB0aGlzIGNhbGwsIGluY2x1ZGlu
Zwo+ICsgKiB1bmRlZmluZWQgYml0cy4KPiArICovCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
