Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74320C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 05:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9sO2NKBkMrGxaGlWP5l7GqXAiBds3QGSSs3xyV1UaU=; b=07YM47j8An1CNZ
	C0C38vHVzokM3hB7iNskfSgujtu+Pq4eUlx1N8uH09kwyr2G63AHA/URI+gFRwi4lE/tg9ght/UkZ
	SgdpMBhJmsYuu3ehdqbQr7oiujAB8EcT40vgt2fYyiA/fnsn2W+ea2a3PF/3mZ8tOZfl6u7cwwC+E
	FBXPBFQQmEfwLnOWhu2B7TCadhOmcHX644j5Dth/W+VTTRoEo9ziOc6tCf2PSfQEnziFQbf2rMSlo
	zSE2/uIPXfBhayfQV/EF0KjTfoXdQb4Z0x8V5MMJtPSITRDSMLusPwworsq76oQNb41Ggfwg1tqGB
	ufDT9zc65zkuVIpcWlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtCp-0000000E6IH-0h71;
	Wed, 03 Apr 2024 05:30:39 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtCl-0000000E6Fx-44do
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 05:30:37 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6151e2d037dso17200947b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 22:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122234; x=1712727034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjRwXgIYbHI7/EpaeeNofMhLW0PpQjYXqswpkTDILa4=;
        b=HQxmfd78DsRwFC26Wp6ZwNFYxVmH+jf1JMlVh4Rvd2TMgJxtV3WnIVus5V4pFxEhAC
         +j0ke+2xX5pGo9F5IdfngcyTsnqjasC361kaA4/c2VMQN7XP3U9qrNRd8R7iBJ/tZ9iY
         617Z7lfzPB2RfOQV+EcsJmM9C2oX6cKIxfa77MjKowXpZ9Pi0ogkVnZII8kbncy24c+g
         k7pMJtz699RtiLh2ySuHNUvdpyztNehrnn3GXm5DQbqatznOJL551HCIv6rpf9/HNa9G
         GREiFXyCR1EPb7p9gHOD3IHHSh+YVOl0/a2xTqzrXsxLfDM9I6c65TsRRzytt4EoA/EV
         hh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122234; x=1712727034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjRwXgIYbHI7/EpaeeNofMhLW0PpQjYXqswpkTDILa4=;
        b=V6U2Vmagg9da+VYGrDGShRM/rIKZf99xZ2QhvzU7AuafRiccmXQP0GtMST+/EBxobm
         HEGf9E93oMluQjFE8VNnVqwk/KdyLFqiJIetwxALphllqcixUznxaU1riKbD7/b+MK7r
         UJ2SkmNqMaHdEpw3vjCoUAh0HX+suEgfUD362QV2xFjVq8P8JgMw0sncnmlUDcfP6BQ0
         EKYzbZRZqiAPsrVE3dZWfJhVgFBDsXDbMemZG8H6WH0Lx7jFWAjOle0jbWKXrzkzPT8o
         FT4qt/cjBc8oClZbqFrReq/pN/pgPKjBRY5zNTDEhjmLb2fRvvTfpTW4qsHSfm73To7i
         u6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXw+q17o2rsSHjIUdTs3bdXbjLC1DH8sSDeo3CsVuyQJSENrpcGogn0vqXa75rws+vx82EEUQ6llXTIW+XEWJlh1KQtZm/q2levSPUbmyjJ
X-Gm-Message-State: AOJu0YzduQ5/A8JcAxXMzdThhaFBinJ46uRIvuxWeK19z+WfpMlLCV60
	Rpy95jINrGeTjHEejCgiM44siGsmF9Nx2+s9UGQkU6tN12Qgjl2YCF9A5IEj6HJxXuP9xwARIta
	7ShjiYhdw3BgU8GZU7wlnCgdKf3h6Wq8Ux8WB
X-Google-Smtp-Source: AGHT+IHl066AzoRG0Gr5vc7GBxoJormNnixyz6sWIm+hB6NrOtXc39rqcc9VFrh3aZ6js3Cc4KaQDJiExFMSumaxlsk=
X-Received: by 2002:a05:6902:82:b0:dcc:140a:a71f with SMTP id
 h2-20020a056902008200b00dcc140aa71fmr12187579ybs.60.1712122234350; Tue, 02
 Apr 2024 22:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
 <20240402075142.196265-3-wangkefeng.wang@huawei.com> <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
In-Reply-To: <CAJuCfpGpKup6AOPY08p35S2S+D4ch5XjEB=FM-n9-kU8dZXS5Q@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:30:23 -0700
Message-ID: <CAJuCfpHkrwPp0X65BuYS2SKAkWPJDMNWYPDO+Jr4SmuxoCEsZg@mail.gmail.com>
Subject: Re: [PATCH 2/7] arm64: mm: accelerate pagefault when VM_FAULT_BADACCESS
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_223036_091835_E17EAF79 
X-CRM114-Status: GOOD (  23.02  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMDoxOeKAr1BNIFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3Vy
ZW5iQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KA
r0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gVGhlIHZtX2ZsYWdzIG9mIHZtYSBhbHJlYWR5IGNoZWNrZWQgdW5kZXIgcGVyLVZNQSBsb2Nr
LCBpZiBpdCBpcyBhCj4gPiBiYWQgYWNjZXNzLCBkaXJlY3RseSBzZXQgZmF1bHQgdG8gVk1fRkFV
TFRfQkFEQUNDRVNTIGFuZCBoYW5kbGUgZXJyb3IsCj4gPiBubyBuZWVkIHRvIGxvY2tfbW1fYW5k
X2ZpbmRfdm1hKCkgYW5kIGNoZWNrIHZtX2ZsYWdzIGFnYWluLCB0aGUgbGF0ZW5jeQo+ID4gdGlt
ZSByZWR1Y2UgMzQlIGluIGxtYmVuY2ggJ2xhdF9zaWcgLVAgMSBwcm90IGxhdF9zaWcnLgo+Cj4g
VGhlIGNoYW5nZSBtYWtlcyBzZW5zZSB0byBtZS4gUGVyLVZNQSBsb2NrIGlzIGVub3VnaCB0byBr
ZWVwCj4gdm1hLT52bV9mbGFncyBzdGFibGUsIHNvIG5vIG5lZWQgdG8gcmV0cnkgd2l0aCBtbWFw
X2xvY2suCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53
YW5nQGh1YXdlaS5jb20+Cj4KPiBSZXZpZXdlZC1ieTogU3VyZW4gQmFnaGRhc2FyeWFuIDxzdXJl
bmJAZ29vZ2xlLmNvbT4KPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02NC9tbS9mYXVsdC5jIHwgNCAr
KystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2ZhdWx0LmMgYi9hcmNoL2FybTY0L21t
L2ZhdWx0LmMKPiA+IGluZGV4IDliYjlmMzk1MzUxYS4uNDA1ZjlhYTgzMWJkIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9hcm02NC9tbS9mYXVsdC5jCj4gPiArKysgYi9hcmNoL2FybTY0L21tL2ZhdWx0
LmMKPiA+IEBAIC01NzIsNyArNTcyLDkgQEAgc3RhdGljIGludCBfX2twcm9iZXMgZG9fcGFnZV9m
YXVsdCh1bnNpZ25lZCBsb25nIGZhciwgdW5zaWduZWQgbG9uZyBlc3IsCj4gPgo+ID4gICAgICAg
ICBpZiAoISh2bWEtPnZtX2ZsYWdzICYgdm1fZmxhZ3MpKSB7Cj4gPiAgICAgICAgICAgICAgICAg
dm1hX2VuZF9yZWFkKHZtYSk7Cj4gPiAtICAgICAgICAgICAgICAgZ290byBsb2NrX21tYXA7Cj4g
PiArICAgICAgICAgICAgICAgZmF1bHQgPSBWTV9GQVVMVF9CQURBQ0NFU1M7Cj4gPiArICAgICAg
ICAgICAgICAgY291bnRfdm1fdm1hX2xvY2tfZXZlbnQoVk1BX0xPQ0tfU1VDQ0VTUyk7Cj4KPiBu
aXQ6IFZNQV9MT0NLX1NVQ0NFU1MgYWNjb3VudGluZyBoZXJlIHNlZW1zIGNvcnJlY3QgdG8gbWUg
YnV0Cj4gdW5yZWxhdGVkIHRvIHRoZSBtYWluIGNoYW5nZS4gRWl0aGVyIHNwbGl0dGluZyBpbnRv
IGEgc2VwYXJhdGUgcGF0Y2gKPiBvciBtZW50aW9uaW5nIHRoaXMgYWRkaXRpb25hbCBmaXh1cCBp
biB0aGUgY2hhbmdlbG9nIHdvdWxkIGJlIGhlbHBmdWwuCgpUaGUgYWJvdmUgbml0IGFwcGxpZXMg
dG8gYWxsIHRoZSBwYXRjaGVzIGFmdGVyIHRoaXMgb25lLCBzbyBJIHdvbid0CmNvbW1lbnQgb24g
ZWFjaCBvbmUgc2VwYXJhdGVseS4gSWYgeW91IGRlY2lkZSB0byBzcGxpdCBvciBhZGp1c3QgdGhl
CmNoYW5nZWxvZyBwbGVhc2UgZG8gdGhhdCBmb3IgZWFjaCBwYXRjaC4KCj4KPiA+ICsgICAgICAg
ICAgICAgICBnb3RvIGRvbmU7Cj4gPiAgICAgICAgIH0KPiA+ICAgICAgICAgZmF1bHQgPSBoYW5k
bGVfbW1fZmF1bHQodm1hLCBhZGRyLCBtbV9mbGFncyB8IEZBVUxUX0ZMQUdfVk1BX0xPQ0ssIHJl
Z3MpOwo+ID4gICAgICAgICBpZiAoIShmYXVsdCAmIChWTV9GQVVMVF9SRVRSWSB8IFZNX0ZBVUxU
X0NPTVBMRVRFRCkpKQo+ID4gLS0KPiA+IDIuMjcuMAo+ID4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
