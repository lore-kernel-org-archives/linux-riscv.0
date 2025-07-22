Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F073C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 15:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1d6zYEvgH9723mDMVM4pImUb09YrAWHgTj0+StowtLE=; b=0claHRkhHQHfsm
	wxZvEJ0ZmOPRbu9XgOOZGu/zIg1x1grn2UudRetDpFwOkPiOmLZ1VPlJJprzvYvs2ww4IjDDeKd4i
	05dixI18VB9sSo2+53QSNyN92xkiIkDVVYzQCl2PdGVXXG57Cyysdu9rWy6Znw7P318c385SzkNrZ
	J2pnx/WkRzs1vH+mD2bJDj2oJbPi/zsLAyLCzF1imwvds91FxesX8Vf1cwRtoOov1oQCW7c/sfVE5
	kiy/EJV4P5CvCaiLPjqYJzLusjCGUY++sn5asLJfZc1vuq4S0hchqtsSI8GYkSSk2bn8p+1BrILew
	CIDavlNvuZnmGXBJ8nNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueEtX-00000002ryp-1IAB;
	Tue, 22 Jul 2025 15:27:07 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDgN-00000002e3u-2Y61;
	Tue, 22 Jul 2025 14:09:28 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32f2947ab0cso44727001fa.2;
        Tue, 22 Jul 2025 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753193365; x=1753798165; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z72Y4lywtzmWJK50j4gaS5KcylDNvYHYQchCkK6Shzo=;
        b=IMXVwYIYrkwdyu2y47D5t2AxLuWJQfcOr/4bLb7pnRYfN/cyA/VwqfOYqr9Dm6gfF/
         fghd56bHfKaWmLM52LCwpjjCPIYXqZ12np0awmCLsWZohthEojkfP/o1jMqUZNrrV73Z
         XPaeQVbfkcVDUTa7xP4WUWbWua2LoW7o8glluCbevpnmT96QkczNzfiIYJLY5tKJVm/D
         C45EriTAsvjBUEQA5tZe6VhYFpmGICvt+CtZdsxQ50IGjZEwt5AWO/FsNBQ8NnrJ461l
         V/OlgL406Q1W4lrWKp2lnxvT8xDg/EtY4J5jVzEkapAFWBmBFuIN0zv1QKAIsvQ40RIh
         /Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753193365; x=1753798165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z72Y4lywtzmWJK50j4gaS5KcylDNvYHYQchCkK6Shzo=;
        b=qFc7n6P8gZFr6BkmR56GdPQ5LsO5fBdVSIiJbd+50E1BZt4qRSn+3pU7lUhALVyb0D
         begTHzKr6fRB1qDwUxGh1TyuyF6TX4fxbdphI+cR3kv3ywjeXNbygjr9P8EEc351Rdi/
         jePFjUcfm43k+zv9jrAnA6fHAOTSyjZua0iik3vfwrtG9U/FzfYRYArC0oOrgJJyEUFL
         ITKqRlCBCKgr5dbII3pmpWz70GJFlADlLDSgdtsBAOPpkKvsmilEjcTOE0SHElyLpptM
         alohc4SfgxesYQ6Mh3IUjPEU7zLCrExhy9Hvke/PudH8KjH6bW7+3XmUsv20ykDzebuy
         DB3g==
X-Forwarded-Encrypted: i=1; AJvYcCVDZfZBH6heBYN3n0wBbRHOIcVuofFSgOTgQL212XBzPCeyzSTiQ8nVmgk9JY+t8BXhKXFWUyVwvi4=@lists.infradead.org, AJvYcCX3dlLXdXS8JGAMxjJ4iJhUnTClTKSPrrL0mBV8olo7SM74ctbfVrv560w/uYXWE2BJcA1+QRjbOGyzzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqGmOM9M/lBXcCRYthnUC0wCLkzTATeMQah2BNZnYzFy2jKyzp
	dc0jiTGtE0dUeu0lvFJXsrOulWRi/Qavc47ICoqvJngC7OvysCMAaGrPHjqVUUa4y/nyaENc+6R
	34lyXnTpDO5U25/3wfQuI7klnpaUsvQE=
X-Gm-Gg: ASbGnctkyzzDDC2TJ6nU51aukkk7lHAQpKhy0wOr/hW9+Cuh4AiyGFBjjyaNVW+hj3o
	SJHgt68IxWEEu3lXD+07sDn1+HTxNxUrDalzwXEUp4wCJ91DbLiCKXsAIhcp0NQRzuvh811z7Dl
	21NR5aLVD6/RT0J450EpAv12vMLbuH9ym3wd1V5H2N2WjKDJGMLZ0IQWx8ZE927wLWV6pj1P1+x
	OcYzmA=
X-Google-Smtp-Source: AGHT+IHxVK00NMC1GHSpVq/sT2EfSuq7omX6wX24xSvgGhrc9yg0F8isqB5neLuF1et0yPorDOiVEfN1u9rtptu/xSU=
X-Received: by 2002:a05:651c:4110:b0:32a:885b:d0f with SMTP id
 38308e7fff4ca-3308f5e2852mr36383791fa.24.1753193364861; Tue, 22 Jul 2025
 07:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <20250717142732.292822-8-snovitoll@gmail.com>
 <c8b0be89-6c89-46ed-87c3-8905b6ccbbeb@gmail.com>
In-Reply-To: <c8b0be89-6c89-46ed-87c3-8905b6ccbbeb@gmail.com>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Tue, 22 Jul 2025 19:09:07 +0500
X-Gm-Features: Ac12FXxpDsEYsUfFuRK9xdlLStcuqGTW4Nrf9JrgjFdTiyEs4CW8gE7SGsQYdo4
Message-ID: <CACzwLxgjKz-bc1w4SvGu-EeoMvK9Dh=2WpB-A_zC-u7H38QqVg@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] kasan/loongarch: select ARCH_DEFER_KASAN and
 call kasan_init_generic
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_070927_649473_E47231C3 
X-CRM114-Status: GOOD (  12.75  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgNDowMOKAr0FNIEFuZHJleSBSeWFiaW5pbiA8cnlhYmlu
aW4uYS5hQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gNy8xNy8yNSA0OjI3IFBNLCBTYWJ5
cnpoYW4gVGFzYm9sYXRvdiB3cm90ZToKPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNo
L2luY2x1ZGUvYXNtL2thc2FuLmggYi9hcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9rYXNhbi5o
Cj4gPiBpbmRleCA2MmYxMzlhOWM4Ny4uMGU1MGU1YjVlMDUgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L2xvb25nYXJjaC9pbmNsdWRlL2FzbS9rYXNhbi5oCj4gPiArKysgYi9hcmNoL2xvb25nYXJjaC9p
bmNsdWRlL2FzbS9rYXNhbi5oCj4gPiBAQCAtNjYsNyArNjYsNiBAQAo+ID4gICNkZWZpbmUgWEtQ
UkFOR0VfV0NfU0hBRE9XX09GRlNFVCAgICAoS0FTQU5fU0hBRE9XX1NUQVJUICsgWEtQUkFOR0Vf
V0NfS0FTQU5fT0ZGU0VUKQo+ID4gICNkZWZpbmUgWEtWUkFOR0VfVkNfU0hBRE9XX09GRlNFVCAg
ICAoS0FTQU5fU0hBRE9XX1NUQVJUICsgWEtWUkFOR0VfVkNfS0FTQU5fT0ZGU0VUKQo+ID4KPiA+
IC1leHRlcm4gYm9vbCBrYXNhbl9lYXJseV9zdGFnZTsKPiA+ICBleHRlcm4gdW5zaWduZWQgY2hh
ciBrYXNhbl9lYXJseV9zaGFkb3dfcGFnZVtQQUdFX1NJWkVdOwo+ID4KPiA+ICAjZGVmaW5lIGth
c2FuX21lbV90b19zaGFkb3cga2FzYW5fbWVtX3RvX3NoYWRvdwo+ID4gQEAgLTc1LDEyICs3NCw2
IEBAIHZvaWQgKmthc2FuX21lbV90b19zaGFkb3coY29uc3Qgdm9pZCAqYWRkcik7Cj4gPiAgI2Rl
ZmluZSBrYXNhbl9zaGFkb3dfdG9fbWVtIGthc2FuX3NoYWRvd190b19tZW0KPiA+ICBjb25zdCB2
b2lkICprYXNhbl9zaGFkb3dfdG9fbWVtKGNvbnN0IHZvaWQgKnNoYWRvd19hZGRyKTsKPiA+Cj4g
PiAtI2RlZmluZSBrYXNhbl9hcmNoX2lzX3JlYWR5IGthc2FuX2FyY2hfaXNfcmVhZHkKPiA+IC1z
dGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wga2FzYW5fYXJjaF9pc19yZWFkeSh2b2lkKQo+ID4g
LXsKPiA+IC0gICAgIHJldHVybiAha2FzYW5fZWFybHlfc3RhZ2U7Cj4gPiAtfQo+ID4gLQo+ID4g
ICNkZWZpbmUgYWRkcl9oYXNfbWV0YWRhdGEgYWRkcl9oYXNfbWV0YWRhdGEKPiA+ICBzdGF0aWMg
X19hbHdheXNfaW5saW5lIGJvb2wgYWRkcl9oYXNfbWV0YWRhdGEoY29uc3Qgdm9pZCAqYWRkcikK
PiA+ICB7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvbW0va2FzYW5faW5pdC5jIGIv
YXJjaC9sb29uZ2FyY2gvbW0va2FzYW5faW5pdC5jCj4gPiBpbmRleCBkMjY4MTI3MmQ4Zi4uY2Y4
MzE1ZjkxMTkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9tbS9rYXNhbl9pbml0LmMK
PiA+ICsrKyBiL2FyY2gvbG9vbmdhcmNoL21tL2thc2FuX2luaXQuYwo+ID4gQEAgLTQwLDExICs0
MCw5IEBAIHN0YXRpYyBwZ2RfdCBrYXNhbl9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX2luaXRkYXRh
IF9fYWxpZ25lZChQQUdFX1NJWkUpOwo+ID4gICNkZWZpbmUgX19wdGVfbm9uZShlYXJseSwgcHRl
KSAoZWFybHkgPyBwdGVfbm9uZShwdGUpIDogXAo+ID4gICgocHRlX3ZhbChwdGUpICYgX1BGTl9N
QVNLKSA9PSAodW5zaWduZWQgbG9uZylfX3BhKGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlKSkpCj4g
Pgo+ID4gLWJvb2wga2FzYW5fZWFybHlfc3RhZ2UgPSB0cnVlOwo+ID4gLQo+ID4gIHZvaWQgKmth
c2FuX21lbV90b19zaGFkb3coY29uc3Qgdm9pZCAqYWRkcikKPiA+ICB7Cj4gPiAtICAgICBpZiAo
IWthc2FuX2FyY2hfaXNfcmVhZHkoKSkgewo+ID4gKyAgICAgaWYgKCFrYXNhbl9lbmFibGVkKCkp
IHsKPgo+IFRoaXMgZG9lc24ndCBtYWtlIHNlbnNlLCAha2FzYW5fZW5hYmxlZCgpIGlzIGNvbXBp
bGUtdGltZSBjaGVjayB3aGljaCBpcyBhbHdheXMgZmFsc2UgaGVyZS4KCkkgc2hvdWxkJ3ZlIHVz
ZWQgYCFrYXNhbl9zaGFkb3dfaW5pdGlhbGl6ZWQoKWAgY2hlY2sgaGVyZSB3aGljaCBwcm92aWRl
cwp0aGUgbmVlZGVkIHJ1bnRpbWUgYmVoYXZpb3IgdGhhdCBrYXNhbl9lYXJseV9zdGFnZSB1c2Vk
IHRvIHByb3ZpZGUuCldpbGwgZG8gaW4gdjQuIFRoYW5rcyEKCj4KPiA+ICAgICAgICAgICAgICAg
cmV0dXJuICh2b2lkICopKGthc2FuX2Vhcmx5X3NoYWRvd19wYWdlKTsKPiA+ICAgICAgIH0gZWxz
ZSB7Cj4gPiAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFkZHIgPSAodW5zaWduZWQgbG9u
ZylhZGRyOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
