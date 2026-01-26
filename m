Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F40D13C0F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 13:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmReP1Zs6LrnD2JlkQsapQQfWCLS9EggjT6OwmK8wP0=; b=hpbRuPYMjz8jUc
	mKYx8kOSh/YG8K9OIIAO5CZ3NLrsKoz1Co1+aFOjDe+rTTw8YKA2AXc+gYv/kxZJyC5SF9yoj6ODl
	qUhuf7sXEhydi9ajO9ctBZ3k/edJEl3kmScahGeh2XUWXKbbxv1ttrFVNQZQNgGoonS2fA8zBhhGt
	Cr8jqJZgM/BH3/5nRUQmi95+IeLwdO6mKOlG+STx2bQooc6zNSD/996xTToYTv3kT8Y7QT6zkCxy7
	L+189u02lgFcZBAobe8sU7Wy8k3cd0Wwg33fcwy4wW3RSzcdfH1WXHWtUALG2yEbCv8xK1q8pNp5j
	2o3XsqGfa6Wxx/26f0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMn8-0000000CdGs-1CnH;
	Mon, 26 Jan 2026 13:38:06 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkMn6-0000000CdGA-1zAN
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 13:38:05 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-662cb4bef90so1174982eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 05:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769434683; cv=none;
        d=google.com; s=arc-20240605;
        b=ETYE+sesIpG0tGMMAq6eGg4LTa5JT6xbA/VChYgH+cdMD7c9eYcrYjujqncTq5040u
         GwMazeZfm+3LkHdLrD2n6J97FltiCkvKZqtbq+4dGzn6RIk/J8ySNPPqvZCizlJQcZVM
         8Xczcp6OjoUuLRKREque6ZKP1TxfNBEE+wn5IFcyF6WoAYFy3v8LdyIjgT23qF/HvOAS
         VLawAHptwtxkYUMnoMmwsgQe1TX8my3kWX09ygfBjjiBmnl8Yf/p0Y6Fqt8cpABY7ffp
         m2C1RlfG4oUClcax2/849Lva4m1mJbY4zrgGHWJYEZ9FSuWB5mV6aAKDfET81fISdH7u
         NYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=96Z1qB+0/8HWcxvjUdd3tF4AdTtqAyIJQA/+cb2JhLI=;
        fh=X98qoI0rsphZkaK5hWVXji/liAiOMBz3q+9ujpJR1Mw=;
        b=dkM2HzG3KWwDst/BZ+U9z/8VqrrdK3eVqQfypfX11Z96q22wfVYvk1+U3eeynNTD+A
         vt/nKjUYOOcKAuDc5bgC3gEJroBM0hUOh/rcIB/44MxgLtk+Qk5d/BpfAbHCfbgyV1ek
         LqPuWa/ParO8mEZLwtHOANKEY3OCvCed9I0ZJsoAueZ7pH5o5czx9GZD1vcy6J4Sc/8k
         6xUvbdferC5OxCX8BRHnLTopgT5CGNIQc8Y3EG5RWq5YTT0G3ZkjUFPEb7wHXV9sUtCM
         RYvXlX00Sk90IHJDq2q7YUsYc74Udw2BAIMDzJisibneu4V/QicsYIm6wNvkr5BXINtI
         c5Eg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769434683; x=1770039483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96Z1qB+0/8HWcxvjUdd3tF4AdTtqAyIJQA/+cb2JhLI=;
        b=U1b6/bxD1jhLhpfimNvP5RXTFXK9niNGLkFrRKojqLUrkFamUZJ3OKKODuJUSkDCTZ
         PXytnR3mDD3qvUc7Sp9LmBKdUAn0tohuuWUGgKBwr5p7D6mKrZlgC7NczV+IOJhFFRwa
         RO2Sk8fD2JcWFqXmIRMX2wBLXKyO4MVTb0OIof3ZzQzcrfSBHWeokPxh8GD/XGG7jlqW
         eub+9P2d5v9luh9yl45ymbM+XUgEHkf/MfEwWziKEPshh02qgkFBNEGjZiL9MpCEGRD4
         tRKhFaUpUZ5YHp57i0f/QH8IGHcI5G6jHp4XW1musLC+DBzQMuuG9Gwxki4i36iQap3k
         CyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769434683; x=1770039483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96Z1qB+0/8HWcxvjUdd3tF4AdTtqAyIJQA/+cb2JhLI=;
        b=jTSsTow+SOkWwOpbZHC/xEQBXcj0yuDwcs5iN017sHDXsS4fvS6lgBFgHSGNRadG10
         6fPZQ1rkMU5vS4pOXwuLxNaJ8NSeIB86YAL1s9IiFMr1clCnKWose6IFUQmBZ5xvpLJB
         FWDL3vIxS88kAwKW/eBxxUDLd5pvhqXfxCa8DRLqy1ZnRQsJFtvagHWreIQ29Ewmelp9
         DsJLsh2NpJfBQJjEjJjw831m4gKLS/tjvQdPRX4JxbTCR4BKGmM2Li17iSjd5meKGL3j
         ZzngqaZcrzYpyhlAGkS0AhRtbupM9ILiAshtfaTIWbVUAwsbik7vaE4qB5jV9kYOyPz5
         awQg==
X-Forwarded-Encrypted: i=1; AJvYcCVBkB1nNKM2od7uqq4PQzLXFw3EeNnDyT2IOhDp7Cv8Vu5B1X3BVOzMZOs9zkVYhRAU41lnNbylLc0L1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZgK8jlZ9C3ZuiEIGNcuTjmOk1JenePUSnx0yOqnqVYOjMap7w
	qLaFzdTfJ2s5lmOnvU4N3b1a7gn06rGPfZD9T0eJHjc6jwumKupjjJQfFFqqfcydlvC1k23/sRZ
	fenfYfJWtKwr+ecaj3WmvDhyfbGGgSKkZE0mTT5w7kw==
X-Gm-Gg: AZuq6aIIHEdkU4ZYf+cT05kYk3pQ4kTI/Gg9OfPinST2MPfDvqwl6ZcgE6thOnws16A
	pFmmNQsRt8WiLvJQ/xDgkE1bB5mfVmV1HR/ckMcLuGpa7GvDx29DWHzwfI5D8HU9jCcEB19lNSN
	spmbXFRDlMoo2kzCsoXHzg0QXFGAt3SAb0Xbj8XedDFbVrkAyhqYXZVuhWF9K9Q/TicYbmCTmuy
	rhRsODR/+jLVUxbVQcnBVdoJKuM4kZn2MFejdmeImXDDSizdaaI7lDGUzGsMokjvL6SocOJ2+8m
	nq6899/PYpZ5KlSIWxtUIDLC3EEflWbAajWqtQiK5iqyhEhpdMrPAzIftG6HBRhTIle9
X-Received: by 2002:a05:6820:290d:b0:659:9a49:8f84 with SMTP id
 006d021491bc7-662e046ea71mr2158364eaf.73.1769434683283; Mon, 26 Jan 2026
 05:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20260104133457.57742-1-luxu.kernel@bytedance.com>
 <CAAhSdy0krY4ou9TpGV=SKUKPNwgweB58QetUajb3HE5Jfy_RbA@mail.gmail.com> <CAPYmKFsAcik3YjO19K1aoGHeqaq9qsx-JeHjoqLLAXp9-t-pKg@mail.gmail.com>
In-Reply-To: <CAPYmKFsAcik3YjO19K1aoGHeqaq9qsx-JeHjoqLLAXp9-t-pKg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jan 2026 19:07:52 +0530
X-Gm-Features: AZwV_QiWDQAHwP8r7oo-R1yw79afIMzBCOPPal9VnywBIszKSCNUlvHToHzr7Ps
Message-ID: <CAAhSdy0YGdKjdzROdyE6gG=LCvHd7nQbWuW4a+thB5vr47QuSQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5] irqchip/riscv-imsic: Adjust the number
 of available guest irq files
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_053804_535480_B0BD7AF6 
X-CRM114-Status: GOOD (  34.03  )
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

T24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgNDozN+KAr1BNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDI2LCAyMDI2IGF0IDY6NTTigK9QTSBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIEph
biA0LCAyMDI2IGF0IDc6MDXigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEN1cnJlbnRseSwgS1ZNIGFzc3VtZXMgdGhlIG1pbmltdW0gb2Yg
aW1wbGVtZW50ZWQgSEdFSUUgYml0cyBhbmQKPiA+ID4gIkJJVChnYy0+Z3Vlc3RfaW5kZXhfYml0
cykgLSAxIiBhcyB0aGUgbnVtYmVyIG9mIGd1ZXN0IGZpbGVzIGF2YWlsYWJsZQo+ID4gPiBhY3Jv
c3MgYWxsIENQVXMuIFRoaXMgd2lsbCBub3Qgd29yayB3aGVuIENQVXMgaGF2ZSBkaWZmZXJlbnQg
bnVtYmVyCj4gPiA+IG9mIGd1ZXN0IGZpbGVzIGJlY2F1c2UgS1ZNIG1heSBpbmNvcnJlY3RseSBh
bGxvY2F0ZSBhIGd1ZXN0IGZpbGUgb24gYQo+ID4gPiBDUFUgd2l0aCBmZXdlciBndWVzdCBmaWxl
cy4KPiA+ID4KPiA+ID4gVG8gYWRkcmVzcyBhYm92ZSwgZHVyaW5nIGluaXRpYWxpemF0aW9uLCBj
YWxjdWxhdGUgdGhlIG51bWJlciBvZgo+ID4gPiBhdmFpbGFibGUgZ3Vlc3QgaW50ZXJydXB0IGZp
bGVzIGFjY29yZGluZyB0byBNTUlPIHJlc291cmNlcyBhbmQKPiA+ID4gY29uc3RyYWluIHRoZSBu
dW1iZXIgb2YgZ3Vlc3QgaW50ZXJydXB0IGZpbGVzIHRoYXQgY2FuIGJlIGFsbG9jYXRlZAo+ID4g
PiBieSBLVk0uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBi
eXRlZGFuY2UuY29tPgo+ID4KPiA+IFBsZWFzZSBjYXJyeSBSZXZpZXdlZC1ieSBhbmQgQWNrZWQt
YnkgdGFncyBvYnRhaW5lZCBpbiBwcmV2aW91cwo+ID4gcmV2aXNpb25zLiBOZXh0IHRpbWUsIEkg
d2lsbCBub3QgdGFrZSB0aGUgcGF0Y2ggaWYgcHJldmlvdXMgdGFncyBhcmUKPiA+IG1pc3Npbmcu
Cj4KPiBTb3JyeSBhYm91dCB0aGF0LiBJIHRob3VnaHQgdGhlIFJldmlld2VkLWJ5IGFuZCBBY2tl
ZC1ieSB0YWdzIGJlbG9uZwo+IHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uIHNvIGRpZG4ndCBjYXJy
eSB0aGVtLgo+Cj4gPgo+ID4gUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMjAuCj4KPiBE
byBJIHN0aWxsIG5lZWQgdG8gcmVzZW5kIHRoZSBwYXRjaCB3aXRoIFJldmlld2VkLWJ5IGFuZCBB
Y2tlZC1ieSB0YWdzPwoKSSBoYXZlIGluY2x1ZGVkIHRoZSB0YWdzIGF0IHRoZSB0aW1lIG9mIHRo
ZSBtZXJnaW5nIHBhdGNoLgoKUmVnYXJkcywKQW51cAoKPgo+IEJlc3QgcmVnYXJkcywKPiBYdSBM
dQo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IEFudXAKPiA+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9y
aXNjdi9rdm0vYWlhLmMgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+ID4gIGRyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyB8IDEyICsrKysrKysrKysrLQo+ID4gPiAg
aW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmggICAgIHwgIDMgKysrCj4gPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YS5jCj4gPiA+IGluZGV4IGRhZDMxODE4NTY2MDAuLmNhYzNjMmI1MWQ3MjQgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2Fp
YS5jCj4gPiA+IEBAIC02MzAsNyArNjMwLDcgQEAgaW50IGt2bV9yaXNjdl9haWFfaW5pdCh2b2lk
KQo+ID4gPiAgICAgICAgICAqLwo+ID4gPiAgICAgICAgIGlmIChnYykKPiA+ID4gICAgICAgICAg
ICAgICAgIGt2bV9yaXNjdl9haWFfbnJfaGdlaSA9IG1pbigodWxvbmcpa3ZtX3Jpc2N2X2FpYV9u
cl9oZ2VpLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJJVChnYy0+Z3Vlc3RfaW5kZXhfYml0cykgLSAxKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBnYy0+bnJfZ3Vlc3RfZmlsZXMpOwo+ID4gPiAgICAg
ICAgIGVsc2UKPiA+ID4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9haWFfbnJfaGdlaSA9IDA7
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2lj
LXN0YXRlLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiA+ID4g
aW5kZXggZGM5NWFkODU2ZDgwYS4uZThmMjBlZmIwMjhiZSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+ID4gPiBAQCAtNzk0LDcgKzc5NCw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IGltc2ljX3BhcnNlX2Z3bm9kZShzdHJ1Y3QgZndub2RlX2hhbmRs
ZSAqZndub2RlLAo+ID4gPgo+ID4gPiAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1
Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gPiA+ICB7Cj4gPiA+IC0g
ICAgICAgdTMyIGksIGosIGluZGV4LCBucl9wYXJlbnRfaXJxcywgbnJfbW1pb3MsIG5yX2hhbmRs
ZXJzID0gMDsKPiA+ID4gKyAgICAgICB1MzIgaSwgaiwgaW5kZXgsIG5yX3BhcmVudF9pcnFzLCBu
cl9tbWlvcywgbnJfZ3Vlc3RfZmlsZXMsIG5yX2hhbmRsZXJzID0gMDsKPiA+ID4gICAgICAgICBz
dHJ1Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyAqZ2xvYmFsOwo+ID4gPiAgICAgICAgIHN0cnVjdCBp
bXNpY19sb2NhbF9jb25maWcgKmxvY2FsOwo+ID4gPiAgICAgICAgIHZvaWQgX19pb21lbSAqKm1t
aW9zX3ZhID0gTlVMTDsKPiA+ID4gQEAgLTg4OCw2ICs4ODgsNyBAQCBpbnQgX19pbml0IGltc2lj
X3NldHVwX3N0YXRlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHZvaWQgKm9wYXF1ZSkK
PiA+ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgICAgLyogQ29uZmlndXJlIGhhbmRsZXJz
IGZvciB0YXJnZXQgQ1BVcyAqLwo+ID4gPiArICAgICAgIGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMg
PSBCSVQoZ2xvYmFsLT5ndWVzdF9pbmRleF9iaXRzKSAtIDE7Cj4gPiA+ICAgICAgICAgZm9yIChp
ID0gMDsgaSA8IG5yX3BhcmVudF9pcnFzOyBpKyspIHsKPiA+ID4gICAgICAgICAgICAgICAgIHJj
ID0gaW1zaWNfZ2V0X3BhcmVudF9oYXJ0aWQoZndub2RlLCBpLCAmaGFydGlkKTsKPiA+ID4gICAg
ICAgICAgICAgICAgIGlmIChyYykgewo+ID4gPiBAQCAtOTI4LDYgKzkyOSwxNSBAQCBpbnQgX19p
bml0IGltc2ljX3NldHVwX3N0YXRlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHZvaWQg
Km9wYXF1ZSkKPiA+ID4gICAgICAgICAgICAgICAgIGxvY2FsLT5tc2lfcGEgPSBtbWlvc1tpbmRl
eF0uc3RhcnQgKyByZWxvZmY7Cj4gPiA+ICAgICAgICAgICAgICAgICBsb2NhbC0+bXNpX3ZhID0g
bW1pb3NfdmFbaW5kZXhdICsgcmVsb2ZmOwo+ID4gPgo+ID4gPiArICAgICAgICAgICAgICAgLyoK
PiA+ID4gKyAgICAgICAgICAgICAgICAqIEtWTSB1c2VzIGdsb2JhbC0+bnJfZ3Vlc3RfZmlsZXMg
dG8gZGV0ZXJtaW5lIHRoZSBhdmFpbGFibGUgZ3Vlc3QKPiA+ID4gKyAgICAgICAgICAgICAgICAq
IGludGVycnVwdCBmaWxlcyBvbiBlYWNoIENQVS4gVGFrZSB0aGUgbWluaW11bSBudW1iZXIgb2Yg
Z3Vlc3QKPiA+ID4gKyAgICAgICAgICAgICAgICAqIGludGVycnVwdCBmaWxlcyBhY3Jvc3MgYWxs
IENQVXMgdG8gYXZvaWQgS1ZNIGluY29ycmVjdGx5IGFsbG9jYXRpbmcKPiA+ID4gKyAgICAgICAg
ICAgICAgICAqIGFuIHVuZXhpc3RlZCBvciB1bm1hcHBlZCBndWVzdCBpbnRlcnJ1cHQgZmlsZSBv
biBzb21lIENQVXMuCj4gPiA+ICsgICAgICAgICAgICAgICAgKi8KPiA+ID4gKyAgICAgICAgICAg
ICAgIG5yX2d1ZXN0X2ZpbGVzID0gKHJlc291cmNlX3NpemUoJm1taW9zW2luZGV4XSkgLSByZWxv
ZmYpIC8gSU1TSUNfTU1JT19QQUdFX1NaIC0gMTsKPiA+ID4gKyAgICAgICAgICAgICAgIGdsb2Jh
bC0+bnJfZ3Vlc3RfZmlsZXMgPSBtaW4oZ2xvYmFsLT5ucl9ndWVzdF9maWxlcywgbnJfZ3Vlc3Rf
ZmlsZXMpOwo+ID4gPiArCj4gPiA+ICAgICAgICAgICAgICAgICBucl9oYW5kbGVycysrOwo+ID4g
PiAgICAgICAgIH0KPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaXJxY2hp
cC9yaXNjdi1pbXNpYy5oIGIvaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiA+
ID4gaW5kZXggNzQ5NDk1MmM1NTE4Ny4uNDNhZWQ1MjM4NTAwOCAxMDA2NDQKPiA+ID4gLS0tIGEv
aW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9s
aW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiA+ID4gQEAgLTY5LDYgKzY5LDkgQEAgc3RydWN0
IGltc2ljX2dsb2JhbF9jb25maWcgewo+ID4gPiAgICAgICAgIC8qIE51bWJlciBvZiBndWVzdCBp
bnRlcnJ1cHQgaWRlbnRpdGllcyAqLwo+ID4gPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBucl9ndWVzdF9pZHM7Cj4gPiA+Cj4gPiA+ICsgICAgICAgLyog
TnVtYmVyIG9mIGd1ZXN0IGludGVycnVwdCBmaWxlcyBwZXIgY29yZSAqLwo+ID4gPiArICAgICAg
IHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucl9ndWVzdF9maWxlczsK
PiA+ID4gKwo+ID4gPiAgICAgICAgIC8qIFBlci1DUFUgSU1TSUMgYWRkcmVzc2VzICovCj4gPiA+
ICAgICAgICAgc3RydWN0IGltc2ljX2xvY2FsX2NvbmZpZyBfX3BlcmNwdSAgICAgICpsb2NhbDsK
PiA+ID4gIH07Cj4gPiA+IC0tCj4gPiA+IDIuMjAuMQo+ID4gPgo+ID4gPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
