Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D212E6689E
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHE4ZnYegFRUUXDEsj+gNsOFqk70hK97A7tU0ahy1wk=; b=ABTSiUgD5nGvnl
	ZlZgYU+iHDHMEX9EaFDSxpJfa4JO8tU8fr9Z9L5/Hw/6yYHVHFm8NwprqEtB4yH8A4A9Gh85MYtX9
	sD+vfSPRkRJnzWudDWmMRWjxYYcyWrDwnFvnkFJI68xkh08UiY/8xfiZEpU2n6qakkZ8RNpXVaf1b
	qpwO1HucBRquofXU8pqEuoqFLFlwKXB9PaEkYZV0ZW+kbKejwu+gdzgqpdps75SrWzwMmvl+ia/cS
	bp109MxloKEmmzdZPjn5Vj0QzjlNth6zfD/LhBpoLJTv93dU+NYJbsGj4cxW+OQM7DIDh0R9IGGCN
	229xp0jktHlbaDfEdErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWss4-0000000BRAK-2Ct4;
	Sat, 20 Dec 2025 09:03:28 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWss2-0000000BR9N-0dJR
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 09:03:27 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-93f63d46f34so891176241.2
        for <linux-riscv@lists.infradead.org>; Sat, 20 Dec 2025 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766221405; x=1766826205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Va3aH01h9VzCu+jjyIlDqz4JQd4jmsrCBD/p8egZk2U=;
        b=PnM1LCYo5m84ORMF0iXU5zjOZfN+aPhugxutWRwoESLsPqt1vXpzcSx1OpsfS4cVtB
         aCcGtsYuvAEyHL0fCxzWszbRdzxGey88Qoj8GCFqintY38FigOTJw9nyUj4/WPfUwm5n
         5C1dERO/ohAqg3Z6Fsrmbkl/dMPdqika2n6wcWsB21vOTButs4tB9XjHdhmisLL3lhDH
         XJ9ejqk/qFpeFKn7He7heqQKEjU5SO2DKDKhlXaeLqamBsiYIg+oN7HbuHykUI6t5wPW
         PjrylVYANcKaibodDHEFUQHOcn+wIPZoWerP7qFkqfam4sqyJMUpBJJNOiD26xPK7V8T
         VZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766221405; x=1766826205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Va3aH01h9VzCu+jjyIlDqz4JQd4jmsrCBD/p8egZk2U=;
        b=N7FzEzSZD2s6BHyIae/HcTqGCudlWCxMbPes5cHPMeHyvUpin0NHmhXcdh830NoXWV
         Fw+Airn4rD/FoHt+/59xhQtndC7/xyW7BByKCbLgzEQOBrjgOCSOFK05yg3/B1M4J9++
         x6wczFfem4QRzbucsRjjvQRT69zUnBNQICreRdUOB+JPOJHmb8jeSGSS311SJ3ak4/cf
         48YIfBgGmOp/+JSUPXHUCWhcDERk34bHGnA2JoHByYeaEAuQtF9Omxh4V3G5tOD8VVSw
         OUAPfUcvVGM8zJN2SHzVpJpwMAV23AL4xyXiegRH32emKn6bTBE48XqRL2V7kIvzEpzB
         Jgaw==
X-Forwarded-Encrypted: i=1; AJvYcCWUhmS8JGYEYfskwYZKTI2SyfvCMtKSC896AkOv1tHTiyrZIpcAuCcvnxiakJQ1saU98owpx0mOyGZBKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkCXgZphSe1rQykQWh6ie62BrjVEEvbGaOTT6RhHUUYKqiKfeU
	y86mHvKlCttICdnK0jmAgROz7QV4xDs7+aGLw/YupJbhfcuKqopOqCmhYdx3pDMeJ6YC4tTXAUY
	+zjTIvifaov7J2TWKzg9fRFXrwyxBd7/9T/feWmO2sQ==
X-Gm-Gg: AY/fxX7voUMS6k8AAEaOGgPTZsHwIAE3FWvPGjuv9HT8cTsEZfn7EowZ2ylk6WVKr6/
	yIUVOYJNqN5NezP5zqdmW3tZUPJYR7ME2gFMQyr6TlarXx9TypK/8yJfzSbQW5YyaH6TBXDZ1uI
	BFYJcJfPYmBXxL9J1tYmEWuyN6Krlj9NqAISF2h/90mY5VVdgBlQHDt/97VZhtFzznZxc5i/pbC
	WokkLya5SP8B9A7Q9CUsZVlJsobnp3NyydF8G2HmIFczlvC6FxojeE2P2dmsfZ8ObmX2KdKQtpB
	aA==
X-Google-Smtp-Source: AGHT+IHjJZyxgMociIgVi8Vl7x9+mX3PDgDpt1PBc1PqiaU7VPQpkPAVPp74stlra4EpXF34ykw4FyuuatuGTMhzLEo=
X-Received: by 2002:a05:6102:2b90:b0:5db:f352:afc0 with SMTP id
 ada2fe7eead31-5eb1a616c83mr1883567137.2.1766221404637; Sat, 20 Dec 2025
 01:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20251220085550.42647-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251220085550.42647-1-luxu.kernel@bytedance.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sat, 20 Dec 2025 17:03:13 +0800
X-Gm-Features: AQt7F2rCaGj3uJSbiOnLM5ag5bh3MR_s2uiS2WHTIUVUbqlnbSA-wtGJO6lSIig
Message-ID: <CAPYmKFvE3ZnsbTFYHe8T2tkF10G08dnEQ5KEdied_6wGjztv7A@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Adjust vs irq files num according to
 MMIO resources
To: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_010326_202616_00190995 
X-CRM114-Status: GOOD (  19.99  )
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

T24gU2F0LCBEZWMgMjAsIDIwMjUgYXQgNDo1NuKAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IER1cmluZyBpbml0aWFsaXphdGlvbiwga2VybmVsIG1hcHMg
dGhlIE1NSU8gcmVzb3VyY2VzIG9mIElNU0lDLCB3aGljaCBpcwo+IHBhcnNlZCBmcm9tIEFDUEkg
b3IgRFRTIGFuZCBtYXkgbm90IHN0cmljdGx5IGNvbnRhaW5zIGFsbCBndWVzdAo+IGludGVycnVw
dCBmaWxlcy4gUGFnZSBmYXVsdCBoYXBwZW5zIHdoZW4gS1ZNIHdyb25nbHkgYWxsb2NhdGVzIGFu
Cj4gdW5tYXBwZWQgZ3Vlc3QgaW50ZXJydXB0IGZpbGUgYW5kIHdyaXRlcyBpdC4KPgo+IFRodXMs
IGR1cmluZyBpbml0aWFsaXphdGlvbiwgd2UgY2FsY3VsYXRlIHRoZSBudW1iZXIgb2YgYXZhaWxh
YmxlIGd1ZXN0Cj4gaW50ZXJydXB0IGZpbGVzIGFjY29yZGluZyB0byBNTUlPIHJlc291cmNlcyBh
bmQgY29uc3RyYWluIHRoZSBudW1iZXIgb2YKPiBndWVzdCBpbnRlcnJ1cHQgZmlsZXMgdGhhdCBj
YW4gYmUgYWxsb2NhdGVkIGJ5IEtWTS4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtl
cm5lbEBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAg
ICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3Rh
dGUuYyB8IDcgKysrKysrLQo+ICBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCAg
ICAgfCAzICsrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMgYi9hcmNoL3Jpc2N2
L2t2bS9haWEuYwo+IGluZGV4IGRhZDMxODE4NTY2MDAuLjdiMWY2YWRjZjIyZDYgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+
IEBAIC02MzAsNyArNjMwLDcgQEAgaW50IGt2bV9yaXNjdl9haWFfaW5pdCh2b2lkKQo+ICAgICAg
ICAgICovCj4gICAgICAgICBpZiAoZ2MpCj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9haWFf
bnJfaGdlaSA9IG1pbigodWxvbmcpa3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKGdjLT5ndWVzdF9pbmRleF9iaXRz
KSAtIDEpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklU
KGdjLT5ucl9ndWVzdF9maWxlcykgLSAxKTsKClR5cG8gaGVyZS4gSSB3aWxsIHJlc2VuZCB0aGlz
IHBhdGNoLgoKPiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2FpYV9u
cl9oZ2VpID0gMDsKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXN0YXRlLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBp
bmRleCBkYzk1YWQ4NTZkODBhLi4xZTk4MmNlMDI0YTQ3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9p
cnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IEBAIC03OTQsNyArNzk0LDcgQEAgc3RhdGljIGludCBf
X2luaXQgaW1zaWNfcGFyc2VfZndub2RlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCj4K
PiAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndu
b2RlLCB2b2lkICpvcGFxdWUpCj4gIHsKPiAtICAgICAgIHUzMiBpLCBqLCBpbmRleCwgbnJfcGFy
ZW50X2lycXMsIG5yX21taW9zLCBucl9oYW5kbGVycyA9IDA7Cj4gKyAgICAgICB1MzIgaSwgaiwg
aW5kZXgsIG5yX3BhcmVudF9pcnFzLCBucl9tbWlvcywgbnJfZ3Vlc3RfZmlsZXMsIG5yX2hhbmRs
ZXJzID0gMDsKPiAgICAgICAgIHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnICpnbG9iYWw7Cj4g
ICAgICAgICBzdHJ1Y3QgaW1zaWNfbG9jYWxfY29uZmlnICpsb2NhbDsKPiAgICAgICAgIHZvaWQg
X19pb21lbSAqKm1taW9zX3ZhID0gTlVMTDsKPiBAQCAtODg4LDYgKzg4OCw3IEBAIGludCBfX2lu
aXQgaW1zaWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9pZCAq
b3BhcXVlKQo+ICAgICAgICAgfQo+Cj4gICAgICAgICAvKiBDb25maWd1cmUgaGFuZGxlcnMgZm9y
IHRhcmdldCBDUFVzICovCj4gKyAgICAgICBnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzID0gQklUKGds
b2JhbC0+Z3Vlc3RfaW5kZXhfYml0cykgLSAxOwo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5y
X3BhcmVudF9pcnFzOyBpKyspIHsKPiAgICAgICAgICAgICAgICAgcmMgPSBpbXNpY19nZXRfcGFy
ZW50X2hhcnRpZChmd25vZGUsIGksICZoYXJ0aWQpOwo+ICAgICAgICAgICAgICAgICBpZiAocmMp
IHsKPiBAQCAtOTI4LDYgKzkyOSwxMCBAQCBpbnQgX19pbml0IGltc2ljX3NldHVwX3N0YXRlKHN0
cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHZvaWQgKm9wYXF1ZSkKPiAgICAgICAgICAgICAg
ICAgbG9jYWwtPm1zaV9wYSA9IG1taW9zW2luZGV4XS5zdGFydCArIHJlbG9mZjsKPiAgICAgICAg
ICAgICAgICAgbG9jYWwtPm1zaV92YSA9IG1taW9zX3ZhW2luZGV4XSArIHJlbG9mZjsKPgo+ICsg
ICAgICAgICAgICAgICBucl9ndWVzdF9maWxlcyA9IChyZXNvdXJjZV9zaXplKCZtbWlvc1tpbmRl
eF0pIC0gcmVsb2ZmKSAvIElNU0lDX01NSU9fUEFHRV9TWiAtIDE7Cj4gKyAgICAgICAgICAgICAg
IGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMgPSBnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzID4gbnJfZ3Vl
c3RfZmlsZXMgPyBucl9ndWVzdF9maWxlcyA6Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzOwo+ICsKPiAgICAgICAgICAgICAg
ICAgbnJfaGFuZGxlcnMrKzsKPiAgICAgICAgIH0KPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCBiL2luY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1p
bXNpYy5oCj4gaW5kZXggNzQ5NDk1MmM1NTE4Ny4uNDNhZWQ1MjM4NTAwOCAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaAo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oCj4gQEAgLTY5LDYgKzY5LDkgQEAgc3RydWN0IGltc2lj
X2dsb2JhbF9jb25maWcgewo+ICAgICAgICAgLyogTnVtYmVyIG9mIGd1ZXN0IGludGVycnVwdCBp
ZGVudGl0aWVzICovCj4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbnJfZ3Vlc3RfaWRzOwo+Cj4gKyAgICAgICAvKiBOdW1iZXIgb2YgZ3Vlc3QgaW50ZXJy
dXB0IGZpbGVzIHBlciBjb3JlICovCj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbnJfZ3Vlc3RfZmlsZXM7Cj4gKwo+ICAgICAgICAgLyogUGVyLUNQVSBJ
TVNJQyBhZGRyZXNzZXMgKi8KPiAgICAgICAgIHN0cnVjdCBpbXNpY19sb2NhbF9jb25maWcgX19w
ZXJjcHUgICAgICAqbG9jYWw7Cj4gIH07Cj4gLS0KPiAyLjIwLjEKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
