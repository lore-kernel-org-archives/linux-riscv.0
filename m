Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A62C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2lq4hlBM4mCvmLXnZPQdgpr/MgWa+dR9gPK0Ulf85Q=; b=p6FXLlOYXmdJzE
	kDEJt3JRNd36GS6n5qYKAuA/Z02RNuHRYsWmqWDU0n4ILGMRf2aljlivShKEzApucOwvTAloUgm0W
	UM4kh/hr1V41W2ey0kGlEX2FtTYcCnbKC/+HGmgTa50tJUXwclozhshbMh8lVXk58QBBMg1LMBL+Y
	fgHDRXyu6X5TNRDQa4mFWuKgYveC2uAqD/mw82KZa2U0AX2aX9fX0mgTAtCDIpUlKmaQrI0fwYN9f
	166WQ03cTszvvHVSzK9P7oKxMujxD8IhAgjHyyDjkk6s5Fje+7a8Kqjz6vJsBe+mAPXvs2sgzDEB+
	67D10BUM0xa8Ppursv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqQi-00000003H6k-3dyj;
	Fri, 19 Jul 2024 16:26:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqQf-00000003H5W-3f6B
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:25:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a77cb7c106dso225066666b.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721406355; x=1722011155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDMEak0Z3PlfyxZ36W4lvRYrybLwACF3e0c+AWtbgSY=;
        b=ooq+ROubLzGAr8hErmgjYYy8hyS6Yl8KwPwTy3Hf1SblGK9J2nO1cS/sNjlcGk6CAd
         h3slzGCaMQWrF0udB8m0RmV5cLOBU64hkD/clMZYXJdn9cKXG0HumhcIvU34F86baw3e
         l8vl+qfYGDK9UmakDVy7NJIuYM/JeOJ8fIqEB4Iwilq3fhitWbdBVwJpZyYC2AMpHtQB
         31RN/WDomSTTVJPFQHfTMYUoJPYX8XgEngBYW7Dr9KTVfDCXoTfPQHkyscYJFBidWQMD
         4GoOWCsKgOOqvYil1TZ62wHtUsdEZzq81rB7GkVTxLGVinkC9u0bIm3FUMUTtw3c/s7N
         SKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721406355; x=1722011155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDMEak0Z3PlfyxZ36W4lvRYrybLwACF3e0c+AWtbgSY=;
        b=YKNxKkfWa5Zt3jYii40glsW3IriqL3PDqUSMPVDHvfg+USXIK4fKYCLy9IByhTfO3W
         4ybZjC5g6ePUrifQh31KJMU2GgCx+7QhsCI1Thr3GwnrlzoZpVRFgvD54iBuc4T3r273
         ExvoPdmb/jMeSkvmQDrj9f2gn+b+K6/dCcqgSRvWwcOxg0xmRnMFRGZyHp160jCPtFaz
         5zfqVBm2pYjXNlS/XJA+GqrgySoiT76hkyMYYia55Rq8Wbg5qP+g2JGoKdU/infregDM
         qkES0qiX+5F0hhn3bc69tGnlyCXvoz5qOfcg10dw+ue0VRvUGYs2h5uJXu7aBgNi12KD
         VLbA==
X-Forwarded-Encrypted: i=1; AJvYcCWmbqSeNLKzmcOMD/s3RSrLAxpQn2u/Zom4JO6eUO+NPhcVQz1mTPxX/88/3cZieRJ1/pNgP6o1DfdQRILTWbbq6STrjmGMAuF3obLVk43r
X-Gm-Message-State: AOJu0Yw+wd1iHHyZnNWEmLR9CH7wA311S/QoXcutdcg5/N+dTC+GY43V
	XnoAOg8KZLdl7PGxciKl+VB+ZyRxfDSqsMKomzpLOBik6UqvyjwuhqaCAYYYduqwTZIgiZ17bIQ
	gYZInQXyYVxX56xf/ZLN+s+2tc0H7Jne5qQ4fnQ==
X-Google-Smtp-Source: AGHT+IHfY3GcuR4+ZNljmMvpKt2IVp/HAZEiPxvyT0vLI0C1yN86ZknX3h+KQ0x99+E9lz8soKAJai4FqnDzq4uijIM=
X-Received: by 2002:a17:906:309a:b0:a6f:51d0:d226 with SMTP id
 a640c23a62f3a-a7a01353a95mr640153366b.66.1721406355238; Fri, 19 Jul 2024
 09:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240718020935.12803-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240718020935.12803-1-cuiyunhui@bytedance.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 19 Jul 2024 18:25:44 +0200
Message-ID: <CAHVXubiYbLs9j=boM7yVg0nRBg3kY9EQiv2R+edLs+B7qJTZug@mail.gmail.com>
Subject: Re: [PATCH] riscv/mm/fault: add show_pte() before die()
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, surenb@google.com, 
	peterx@redhat.com, willy@infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_092557_933529_AEE7F1AA 
X-CRM114-Status: GOOD (  18.62  )
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

SGkgWXVuaHVpLAoKT24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgNDoyMOKAr0FNIFl1bmh1aSBDdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIGtlcm5lbCBkaXNw
bGF5cyAiVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQKPiB2aXJ0dWFs
IGFkZHJlc3MiLCB3ZSB3b3VsZCBsaWtlIHRvIGNvbmZpcm0gdGhlIHN0YXR1cyBvZiB0aGUgdmly
dHVhbAo+IGFkZHJlc3MgaW4gdGhlIHBhZ2UgdGFibGUuIFNvIGFkZCBzaG93X3B0ZSgpIGJlZm9y
ZSBkaWUoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L21tL2ZhdWx0LmMgfCA0NyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9y
aXNjdi9tbS9mYXVsdC5jCj4gaW5kZXggOTBkNGJhMzZkMWQwLi5kZmUzY2UzOGUxNmIgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9mYXVs
dC5jCj4gQEAgLTIyLDYgKzIyLDUyIEBACj4KPiAgI2luY2x1ZGUgIi4uL2tlcm5lbC9oZWFkLmgi
Cj4KPiArc3RhdGljIHZvaWQgc2hvd19wdGUodW5zaWduZWQgbG9uZyBhZGRyKQo+ICt7Cj4gKyAg
ICAgICBwZ2RfdCAqcGdkcCwgcGdkOwo+ICsgICAgICAgcDRkX3QgKnA0ZHAsIHA0ZDsKPiArICAg
ICAgIHB1ZF90ICpwdWRwLCBwdWQ7Cj4gKyAgICAgICBwbWRfdCAqcG1kcCwgcG1kOwo+ICsgICAg
ICAgcHRlX3QgKnB0ZXAsIHB0ZTsKPiArICAgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3Vy
cmVudC0+bW07Cj4gKwo+ICsgICAgICAgaWYgKCFtbSkKPiArICAgICAgICAgICAgICAgbW0gPSAm
aW5pdF9tbTsKPiArICAgICAgIHBnZHAgPSBwZ2Rfb2Zmc2V0KG1tLCBhZGRyKTsKPiArICAgICAg
IHBnZCA9IFJFQURfT05DRSgqcGdkcCk7Cj4gKyAgICAgICBwcl9hbGVydCgiWyUwMTZseF0gcGdk
PSUwMTZseCIsIGFkZHIsIHBnZF92YWwocGdkKSk7Cj4gKyAgICAgICBpZiAocGdkX25vbmUocGdk
KSB8fCBwZ2RfYmFkKHBnZCkpCj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsKPiArICAg
ICAgIHA0ZHAgPSBwNGRfb2Zmc2V0KHBnZHAsIGFkZHIpOwo+ICsgICAgICAgcDRkID0gUkVBRF9P
TkNFKCpwNGRwKTsKPiArICAgICAgIHByX2NvbnQoIiwgcDRkPSUwMTZseCIsIHA0ZF92YWwocDRk
KSk7Cj4gKyAgICAgICBpZiAocDRkX25vbmUocDRkKSB8fCBwNGRfYmFkKHA0ZCkpCj4gKyAgICAg
ICAgICAgICAgIGdvdG8gb3V0Owo+ICsKPiArICAgICAgIHB1ZHAgPSBwdWRfb2Zmc2V0KHA0ZHAs
IGFkZHIpOwo+ICsgICAgICAgcHVkID0gUkVBRF9PTkNFKCpwdWRwKTsKPiArICAgICAgIHByX2Nv
bnQoIiwgcHVkPSUwMTZseCIsIHB1ZF92YWwocHVkKSk7Cj4gKyAgICAgICBpZiAocHVkX25vbmUo
cHVkKSB8fCBwdWRfYmFkKHB1ZCkpCj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsKPiAr
ICAgICAgIHBtZHAgPSBwbWRfb2Zmc2V0KHB1ZHAsIGFkZHIpOwo+ICsgICAgICAgcG1kID0gUkVB
RF9PTkNFKCpwbWRwKTsKPiArICAgICAgIHByX2NvbnQoIiwgcG1kPSUwMTZseCIsIHBtZF92YWwo
cG1kKSk7Cj4gKyAgICAgICBpZiAocG1kX25vbmUocG1kKSB8fCBwbWRfYmFkKHBtZCkpCj4gKyAg
ICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsKPiArICAgICAgIHB0ZXAgPSBwdGVfb2Zmc2V0X21h
cChwbWRwLCBhZGRyKTsKPiArICAgICAgIGlmICghcHRlcCkKPiArICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gKwo+ICsgICAgICAgcHRlID0gUkVBRF9PTkNFKCpwdGVwKTsKCkFsbCB0aGUgUkVB
RF9PTkNFKCkgY2FuIGJlIHJlcGxhY2VkIGJ5IHBYWHBfZ2V0KCkgbWFjcm9zIGRlZmluZWQgaGVy
ZToKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTAvc291cmNlL2luY2x1ZGUv
bGludXgvcGd0YWJsZS5oI0wzMTUKCkFuZCB3ZSBzaG91bGQgc3RvcCBhcyBzb29uIGFzIHdlIGVu
Y291bnRlciBhIGxlYWYgZW50cnkgdXNpbmcgcFhkX2xlYWYoKS4KClRoYW5rcywKCkFsZXgKCj4g
KyAgICAgICBwcl9jb250KCIsIHB0ZT0lMDE2bHgiLCBwdGVfdmFsKHB0ZSkpOwo+ICsgICAgICAg
cHRlX3VubWFwKHB0ZXApOwo+ICtvdXQ6Cj4gKyAgICAgICBwcl9jb250KCJcbiIpOwo+ICt9Cj4g
Kwo+ICBzdGF0aWMgdm9pZCBkaWVfa2VybmVsX2ZhdWx0KGNvbnN0IGNoYXIgKm1zZywgdW5zaWdu
ZWQgbG9uZyBhZGRyLAo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAg
ewo+IEBAIC0zMSw2ICs3Nyw3IEBAIHN0YXRpYyB2b2lkIGRpZV9rZXJuZWxfZmF1bHQoY29uc3Qg
Y2hhciAqbXNnLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAgICAgICAgICAgICAgIGFkZHIpOwo+
Cj4gICAgICAgICBidXN0X3NwaW5sb2NrcygwKTsKPiArICAgICAgIHNob3dfcHRlKGFkZHIpOwo+
ICAgICAgICAgZGllKHJlZ3MsICJPb3BzIik7Cj4gICAgICAgICBtYWtlX3Rhc2tfZGVhZChTSUdL
SUxMKTsKPiAgfQo+IC0tCj4gMi4zOS4yCj4KCk90aGVyd2lzZSwgdGhhdCdzIGEgZ29vZCBpZGVh
IHRvIHByaW50IHRoZSBwYWdlIHRhYmxlIGNvbnRlbnQgb24gZmF1bHQgc286CgpSZXZpZXdlZC1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxl
eAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
