Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF212C87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZQ1niqQOS9p2u9j+EIkNV6OHRb7fywsW5FPOAdp8Bk=; b=JBUAVRY3MKKadz
	SrJPmKRhma4z67+STDDGzqnZbFW0LdG3Vw3+I/Hi8IeZAccz6t+CGiFg/IEtZv3cvcbPYXwWlwR2H
	TxFeREhPwCgznIpNBt3FBr094JqTgi9EcRYXVR9m1JI0liiYQPMlPTiBrZE9wMKOEuYKVi16ScM8G
	4mZEbqgAme+Vxy/vEUCARanrw/fjiq6JFqTNjSZkXgCTh8uS3j+8Ol7/jm5MqZibpSxD7+9JakeEK
	YhD4zyNSHKo/sjTerfxxROG15sFbsyWScjIuseuJrlNMdT5jtcbp/WPFoFNws/dJgSBvJ3i4i9KSY
	VRWj7hTEL+E8UBYT/V5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjre-0000000GlUw-0JWX;
	Tue, 29 Jul 2025 12:55:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugjoc-0000000GlAF-0tC6
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 12:52:23 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-555163cd09aso4727287e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 05:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753793540; x=1754398340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWjHC+OGnvv/XJLYvpyn4u4ZP15ZxkznDvUzFCsHKC8=;
        b=S8gOc8K+knolvb0q5Gd6VNixO2jqxRVhQYqOekx1wj118gS81FDK/EUehprHVVLyJQ
         5W3BdLO9zZzu3GUdbwJj5tNmuAUu8lybZlmwrAVkwxU9VRIF/of/PSm5TTQqvNKq+ccW
         8PrtE/oAn14uNdggzL5Hk3sMt4l7Br7lcG2yKFf1JSSFQ31srv2G7LoIGgBaxSeaeN5C
         k4np+yRfOMNgQXoZrBGPATh02sC2d03xjZ7sgcEe9Qhb3vMmk2/hhZILHWqBxlCOAnZ6
         tSRWLcHXq/tZAEgMjJnRcDKg351yHACV7idVIqmh7QpmpI89yzjmpULL0HjwRsP+CeHO
         rPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753793540; x=1754398340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWjHC+OGnvv/XJLYvpyn4u4ZP15ZxkznDvUzFCsHKC8=;
        b=wAxDfnktOWEeCp1ZiOnHGG2V6vyVQUkC+mpRXEsaqKORAPhbF3HBKjbxTSKpzHjMa/
         2Z4G7Zo90DzeCsMH6lSJ4bCRx4RKqt4wSkYPS6JqY25ZRIEqLPV4jXMLhguVAPH9eR3f
         hGpt7PFlSb+o7vx32iNCK3sIKOeNRJePajtHx3gxJTRB9D3eosdMyoW106tp8R5377DK
         afey1wjT8BNXmagV5HcIGqv15j0Qlqr/YN+PqYz/3Gg+cdTCO2/4MddMnunWiyE3DIcG
         cjBQ94iK5qYDrVU+CpMF7phj4WYVRoIwJKDbGL1ZP6xPAzQfDEzv2tyhDYDIV0ew/Qwc
         /eOw==
X-Forwarded-Encrypted: i=1; AJvYcCUncPPso2bpaFVITYMKKYTqbL3nlqS7Gpwc4hgKDj3kp7xkRBQ5uKRlBr4zr8i/LWB33UysWJkULkg1rA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2KutpOMk9rZbt4s+qOUZybrVj4NkiPINlMXb65Er/KzzRxW+3
	qX2jYXDSvXZ7/1UTVEz5wgbhrjEH8Efcnh1zW2WmVlyC5YnDeEV7lNcFJkabRQc327XBt3YkUr5
	TIM7RBSKxlUIR7GBBamlKu5RjEwqMoTGTZskcfqNmdg==
X-Gm-Gg: ASbGncvD5q5eqBLFNfm1bbHszj0xWdhfnYLxuR1a+WkHjXGtNLzxN1df0q/zRK+yYiU
	BZWtLELoi9AhXecSmkWF+kmthozO+XdNn7FLRtHyKQ9fGpsnqTiW1oIwCbmSPgl2uJvpxpL1i7a
	AGnUTGg7vs0jJcRydWXD9gfLNRt6jkgiohwoq9saTIGs1r8LL4NaJoFwxnp+c5SKxBxRHHpDa5y
	EKyN8no
X-Google-Smtp-Source: AGHT+IHuUnkayMnm4m01Hr69szIdeJHEwA007T0e+mW36V5XSzk+1rDhTFTJSpPJE6Nc6E9BssiE9tqnDraG33SbUD4=
X-Received: by 2002:a05:6512:3ba5:b0:553:2a16:2513 with SMTP id
 2adb3069b0e04-55b5f4bf04emr3872961e87.47.1753793539693; Tue, 29 Jul 2025
 05:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
 <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
 <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
 <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
 <DBOIBORLK6YM.7SND5YPEJR60@ventanamicro.com> <a486e649-d2c0-471c-87f2-c7a01dff9ae4@redhat.com>
In-Reply-To: <a486e649-d2c0-471c-87f2-c7a01dff9ae4@redhat.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Jul 2025 18:22:07 +0530
X-Gm-Features: Ac12FXxG38FjWac-eP2Unm7GtAZ_b9c89wpUPy0z_mJTQsoPBm1U1ATUL4DgWdk
Message-ID: <CAK9=C2VaAST1yRoX9yqYqyRaS299iJtTLsvvsZwr2gwBEKfDvw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_055222_250047_849C1961 
X-CRM114-Status: GOOD (  15.20  )
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

T24gVHVlLCBKdWwgMjksIDIwMjUgYXQgNToyOeKAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gNy8yOS8yNSAxMzozNywgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+ID4gU29ycnksIEkgZGlkbid0IHRyeSB0b28gaGFyZCB0byBjb252aW5jZSBvdGhl
cnMgYWZ0ZXIgbm90aWNpbmcgaXQsIGFuZAo+ID4gcGxhbm5lZCB0byBmaXggdGhlIG1vc3Qgc2ln
bmlmaWNhbnQgYnJlYWthZ2UgaW4gbGF0ZXIgcmNzLgo+Cj4gWW91IHNob3VsZG4ndCBoYXZlIHRv
IGNvbnZpbmNlIGFueW9uZSwKPiBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL3Jldmlldy1jaGVja2xp
c3QucnN0IGlzIHByZXR0eSBjbGVhcjogbmV3IHN0YXRlCj4gbXVzdCBpbmNsdWRlIHN1cHBvcnQg
Zm9yIHNhdmUvcmVzdG9yZSwgbmV3IGZlYXR1cmVzIG11c3QgZGVmYXVsdCB0byBvZmYsCj4gYW5k
IHRoZSBmZWF0dXJlIHNob3VsZCBiZSB0ZXN0YWJsZS4KPgo+IFRoZSBmaWxlIHdhcyBqdXN0IHVw
ZGF0ZWQgKGFuZCBub3cgbWFrZXMgZnVydGhlciByZW1hcmtzIGFib3V0IHRlc3RpbmcpLAo+IGJ1
dCB0aGUgc2FtZSB0aGluZ3Mgd2VyZSBiYXNpY2FsbHkgaW4gdGhlIG9sZGVyIHZlcnNpb24uCj4K
PiBTbyB5b3UgbmVlZDoKPgo+IC0gYSBLVk1fRU5BQkxFX0NBUCB0byBlbmFibGUvZGlzYWJsZSBG
V0ZUCgpXZSBkb24ndCBuZWVkIHNlcGFyYXRlIEtWTSBDQVAgZm9yIGV2ZXJ5IFNCSSBleHRlbnNp
b24Kc2luY2Ugd2UgYWxyZWFkeSBoYXZlIHRoZSBTQkkgT05FX1JFRyBpbnRlcmZhY2UgdG8KZW5h
YmxlL2Rpc2FibGUgaW5kaXZpZHVhbCBTQkkgZXh0ZW5zaW9ucy4KCj4KPiAtIGFuIGlvY3RsIHRv
IGdldCB0aGUgbGlzdCBvZiBGV0ZUIGZlYXR1cmVzIChraW5kIG9mIGxpa2UKPiBLVk1fR0VUX01T
Ul9JTkRFWF9MSVNUIG9uIHg4Nj8gIEl0IHNlZW1zIHVubGlrZWx5IHRoYXQgeW91IGdldCBtb3Jl
IHRoYW4KPiA1MCBvciA2MCkKPgo+IC0gYW4gaW9jdGwgdG8gZW5hYmxlL2Rpc2FibGUgRldGVCBp
bmRpdmlkdWFsIGZlYXR1cmVzCj4KPiAtIHRoZSBHRVQvU0VUX09ORV9SRUcgdG8gbWlncmF0ZSB0
aGUgc3RhdGUgZXRjLgo+Cj4gLSBzZWxmdGVzdHMKPgoKVGhlc2UgdGhpbmdzIG5lZWQgdG8gYmUg
YWRkZWQgYW55d2F5IHNpbmNlIHdlIGhhdmUgaXQKZm9yIG90aGVyIFNCSSBleHRlbnNpb25zLgoK
UmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
