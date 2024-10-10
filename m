Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C9D24451
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKCBrglvO/zPjXTOB57X7Dsl3NA2TagzlSyp3M756Cw=; b=Jr8bnWHy5g4DX4
	Pm+8pJdtCJvw0KIMhf8DWabTSxQVovtqvb+lPBcpiYl+9a3GEkzTfLcUjuhO4qdbkEJrmMsr1wF0n
	w4pTDKq8SEr0SdBAoCREjT4ARa5cdfRyBynoC6AzvmGyP81CzkPIpTVPoqmc5gP0X/QNL4wBVrnAN
	Si7xfOKHvJvCJ+vCMazWRFODeGuGE7MCw5TwnHX3wey+T6dlhkk7YS3kD5uG5Yb4HUGXMhwWjTugV
	yslATgSt9sAzHSPb9JAQAOR97GzXM8y59SyYB0GayNC73U10fdCgE0pUOs9RkVcIdBlpntN7RHx3o
	JJ6mhptUxOa5d/8MVTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0Hn-0000000ELkx-3ef8;
	Thu, 10 Oct 2024 21:01:27 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrA-0000000DqK4-2tTw
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:50 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e148d4550bso1322254a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584747; x=1729189547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W6JK9yAcorM7mqEFQq2hRBqvFCoz2C4pz3yOEmiGek=;
        b=3ljqXwYT9KU7vL/bvKPf9S0Yn/qBntGvThCT2wzCd8Z12f/66N5sIoVWA14cY3wEXx
         g0HCLPAfoQ28OuiX6nzyAfawBv92qW+HPQQu37BsUa/V7uUuXJiLYMSM601iEwSqsUOf
         /NM7uP351CB79XT86j42gqhFKlgX/vbHgHz5DTqinJBvK+PcdaEbIaL+QrMPgT0FIbtp
         HGVX7X1ioRXdTGYtEGA8WTxtd6LOh1q2++W09WQfgTr1feSdFE+UnwE/XERuI/cMc2G4
         mKN8Qf+/P7jUbv/vuDxwiZEcUlFeFFt/L98/apl6pTYPYAUmkiq5SNEFXz3+LRw5g5bM
         ZyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584747; x=1729189547;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/W6JK9yAcorM7mqEFQq2hRBqvFCoz2C4pz3yOEmiGek=;
        b=NNCVgfLRQRn9jnl1WequyMdRWb5nDoG+fWAoLAB3Xk0WIDsmzF1qqXsgOnAB4/QYJp
         j8dr81zkIfslkKNldAtEO6ZMdinx2QuVNlP59pDySFbyYkIpnCyiJQmBXNFL/ckOcdLT
         JIbExVYpse62Lg9RS4XgJgzEslnqqRhcTM/8owzcckVXbG0DlAtbVZYm4hERGA+Uapn2
         mqx21fUtHDsYYsUZ/Ih8bBlAvfasg7b9bGD+S0fvo0+thQHARhq2MPiIqE9uFHGR1xoM
         swC6HhH78AYeT0kn60H9tMIaxBMC8FU2cUwwu8cNfSkP8pZXlU4kAI0Ywe10O3jeSgZI
         xoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlj4ZOdRALb9ir323yQ1UsvBoJm3X1OO3eBtGMu830TeyU7c0IWxX6dkGmNQgfB7SpT+M4zNRexqnasw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmKe2NOLODxJ5sW9UvLi9gR7eA+FfzmkXmlPk0eIH19ufovdQT
	lCAounqo1+JA58K9XVUAzxXYFhlyaWiDmIROGSKGLDWC+7E9N4O+gHKvs71ML20vtBgBTBsPdll
	+Pw==
X-Google-Smtp-Source: AGHT+IFGWHaFUEsQRxn4rcRWabj8vzxqpLHdNOXqOmiiQlX4dD6MZqF5BpShV2hVfQIOX/PTyNMVtEMSya8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:9a94:b0:2e2:da81:40c1 with SMTP id
 98e67ed59e1d1-2e2f09f2280mr109a91.1.1728584746508; Thu, 10 Oct 2024 11:25:46
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:28 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-27-seanjc@google.com>
Subject: [PATCH v13 26/85] KVM: Use plain "struct page" pointer instead of
 single-entry array
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112548_865888_6F3901E2 
X-CRM114-Status: GOOD (  10.74  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VXNlIGEgc2luZ2xlIHBvaW50ZXIgaW5zdGVhZCBvZiBhIHNpbmdsZS1lbnRyeSBhcnJheSBmb3Ig
dGhlIHN0cnVjdCBwYWdlCnBvaW50ZXIgaW4gaHZhX3RvX3Bmbl9mYXN0KCkuICBVc2luZyBhbiBh
cnJheSBtYWtlcyB0aGUgY29kZSB1bm5lY2Vzc2FyaWx5CmFubm95aW5nIHRvIHJlYWQgYW5kIHVw
ZGF0ZS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKUmV2aWV3ZWQtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUg
PGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJz
b24gPHNlYW5qY0Bnb29nbGUuY29tPgotLS0KIHZpcnQva3ZtL2t2bV9tYWluLmMgfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwppbmRleCA3
YWNiMWE4YWYyZTQuLmQzZTQ4ZmNjNGZiMCAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtX21haW4u
YworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0yNzUyLDcgKzI3NTIsNyBAQCB1bnNpZ25l
ZCBsb25nIGt2bV92Y3B1X2dmbl90b19odmFfcHJvdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdm
bl90IGdmbiwgYm9vbCAqdwogICovCiBzdGF0aWMgYm9vbCBodmFfdG9fcGZuX2Zhc3Qoc3RydWN0
IGt2bV9mb2xsb3dfcGZuICprZnAsIGt2bV9wZm5fdCAqcGZuKQogewotCXN0cnVjdCBwYWdlICpw
YWdlWzFdOworCXN0cnVjdCBwYWdlICpwYWdlOwogCiAJLyoKIAkgKiBGYXN0IHBpbiBhIHdyaXRh
YmxlIHBmbiBvbmx5IGlmIGl0IGlzIGEgd3JpdGUgZmF1bHQgcmVxdWVzdApAQCAtMjc2Miw4ICsy
NzYyLDggQEAgc3RhdGljIGJvb2wgaHZhX3RvX3Bmbl9mYXN0KHN0cnVjdCBrdm1fZm9sbG93X3Bm
biAqa2ZwLCBrdm1fcGZuX3QgKnBmbikKIAlpZiAoISgoa2ZwLT5mbGFncyAmIEZPTExfV1JJVEUp
IHx8IGtmcC0+bWFwX3dyaXRhYmxlKSkKIAkJcmV0dXJuIGZhbHNlOwogCi0JaWYgKGdldF91c2Vy
X3BhZ2VfZmFzdF9vbmx5KGtmcC0+aHZhLCBGT0xMX1dSSVRFLCBwYWdlKSkgewotCQkqcGZuID0g
cGFnZV90b19wZm4ocGFnZVswXSk7CisJaWYgKGdldF91c2VyX3BhZ2VfZmFzdF9vbmx5KGtmcC0+
aHZhLCBGT0xMX1dSSVRFLCAmcGFnZSkpIHsKKwkJKnBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2UpOwog
CQlpZiAoa2ZwLT5tYXBfd3JpdGFibGUpCiAJCQkqa2ZwLT5tYXBfd3JpdGFibGUgPSB0cnVlOwog
CQlyZXR1cm4gdHJ1ZTsKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
