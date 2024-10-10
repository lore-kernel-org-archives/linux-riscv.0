Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A8ECFC5F4
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLl5gvCeE6DiguNlZycGz1P26kPvsUu3bEXe1ovJdmk=; b=Q0Nwmu4zFl7M49
	vobq1+dFhsli+IHvFv+dTOqAJe12Y9OUpfbH+PdAgCKV2tdw0n79uDdeIVNk3AERBik7Hvc5xjh/E
	jiEFXTFkgBdcSONWBjQ5jRqQw3zvxfEwMM6VNV1/vxikgYJ2MCHjwgcjkJ++nETRqg/SqnTMqQIuJ
	ieB3B/c1F/aSg5Gu9/cmkGG2ZVChnEiriQFoYccindRBxaYnL35Krw0eE/sh0URLvmne2XxvrqFVD
	uS6T35v1dfP9b1tQDt82fEQFcYwip8fJV49fLMBUDiPWNLZVs0CFHFX0Vdc/Y9NzHpvxM16kDHMr0
	hCqyuM6BfVnA8lzeqNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyKn-0000000E0Wc-2gO9;
	Thu, 10 Oct 2024 18:56:25 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrE-0000000DqNT-2Sz0
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:54 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-778702b9f8fso1039964a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584751; x=1729189551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MotdKZcknVHCSnrsAh1XZemF3Qz2FYV2KdHfEEknv98=;
        b=jtLSLBcVgcASnTqlQ1eKxrFJR2feDfmay3NURsIC0axb8C2ARvmHmzCliBGAueotr+
         B5XpHud2uLNFerpPsDj3hQwC9F0YTpa1737w8LQD0y5y7LzFTJWgDzF8hgHAoeB98c9h
         Ori7lZA+YjrLO+Qvs/uyhUsL+FZdPkU+W0JGTGPrJpQDbrwxwoqqJKLrmYcuj3o8IGb9
         kg0swTwVKHW8C2cNgOAq8B0ThHBwdCGytcaZqR7NBsDqfTCj3rwXpBwNRbOpdEi/OhiP
         Gt1beXFBomlvF6zLw3cKb7dJ4CZuwDOsEzDBVH9U+wi6w0FOeGSWx7Vqbfa8yS3y3aJZ
         XbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584751; x=1729189551;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MotdKZcknVHCSnrsAh1XZemF3Qz2FYV2KdHfEEknv98=;
        b=ZCF/+5ntGRA7HOp3mkfTKj1EgFkedoj3/H6plIzMEo4QtNJ2jOCkn7SCcopd0eZ0JA
         AZzqcb3gvpNt7SGzeAK2hRW86SQmVwUhyFPw42m9Hdy5M1aSHwj2ns9WtJiYt+5sPuT4
         I4bY6LJkEIPlfshGl9ZIUBTZAN0svC68MHciV7Ux0i9YrCt4mnyqGMzifiGSHYAFmSMK
         AFiaHYO7XvtL4/gg6sFf5lfasYKYUooSSfuy0u57z517taN/eg/yMjiU84K+ededDdY6
         UlAWKuTIfGDA585b23LCVSX8CE8ruS4sotDiGsSz6us/68EksvpREFzDZqU/ZgkeZl8Q
         JfMA==
X-Forwarded-Encrypted: i=1; AJvYcCVyqSoyvf9fPHRiF4f/Wd4z+mkM3OrmZnXBxLEG2OTVRn1ApZhCj8p8uQvxzC2r0b0tVCqt0Wm4KFcfsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3ldmn/AjajYD0xbmk4BuPyWs+TBBIysH+7/x/LljcqC4lqsGO
	lwZ8eJMgAxYb0s+4St9qXs8zfV0TUXVQlkijraE0sruGTuNN/JM3t662cDwXO8KmmzLYPuz23Sy
	Fsw==
X-Google-Smtp-Source: AGHT+IHahb+vMbBUybe9JXpaiwYyoag4sz2flsLCX6vY5d7t+wo3V9TaPVQYV32tHeuijXZHqATezWyezMk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:d913:b0:2e2:a810:c3e4 with SMTP id
 98e67ed59e1d1-2e2c81d4d19mr7321a91.4.1728584751203; Thu, 10 Oct 2024 11:25:51
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:30 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-29-seanjc@google.com>
Subject: [PATCH v13 28/85] KVM: Move kvm_{set,release}_page_{clean,dirty}()
 helpers up in kvm_main.c
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
X-CRM114-CacheID: sfid-20241010_112552_672180_0C96E617 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

SG9pc3QgdGhlIGt2bV97c2V0LHJlbGVhc2V9X3BhZ2Vfe2NsZWFuLGRpcnR5fSgpIEFQSXMgZnVy
dGhlciB1cCBpbgprdm1fbWFpbi5jIHNvIHRoYXQgdGhleSBjYW4gYmUgdXNlZCBieSB0aGUga3Zt
X2ZvbGxvd19wZm4gZmFtaWx5IG9mIEFQSXMuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRl
ZC4KClJldmlld2VkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClRl
c3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2Zm
LWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiB2aXJ0L2t2
bS9rdm1fbWFpbi5jIHwgODIgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMK
aW5kZXggZTI5Zjc4ZWQ2ZjQ4Li42Y2RiZDA1MTZkNTggMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2
bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMjc0Niw2ICsyNzQ2LDQ3IEBA
IHVuc2lnbmVkIGxvbmcga3ZtX3ZjcHVfZ2ZuX3RvX2h2YV9wcm90KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgZ2ZuX3QgZ2ZuLCBib29sICp3CiAJcmV0dXJuIGdmbl90b19odmFfbWVtc2xvdF9wcm90
KHNsb3QsIGdmbiwgd3JpdGFibGUpOwogfQogCitzdGF0aWMgYm9vbCBrdm1faXNfYWRfdHJhY2tl
ZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQoreworCS8qCisJICogUGVyIHBhZ2UtZmxhZ3MuaCwg
cGFnZXMgdGFnZ2VkIFBHX3Jlc2VydmVkICJzaG91bGQgaW4gZ2VuZXJhbCBub3QgYmUKKwkgKiB0
b3VjaGVkIChlLmcuIHNldCBkaXJ0eSkgZXhjZXB0IGJ5IGl0cyBvd25lciIuCisJICovCisJcmV0
dXJuICFQYWdlUmVzZXJ2ZWQocGFnZSk7Cit9CisKK3N0YXRpYyB2b2lkIGt2bV9zZXRfcGFnZV9k
aXJ0eShzdHJ1Y3QgcGFnZSAqcGFnZSkKK3sKKwlpZiAoa3ZtX2lzX2FkX3RyYWNrZWRfcGFnZShw
YWdlKSkKKwkJU2V0UGFnZURpcnR5KHBhZ2UpOworfQorCitzdGF0aWMgdm9pZCBrdm1fc2V0X3Bh
Z2VfYWNjZXNzZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCit7CisJaWYgKGt2bV9pc19hZF90cmFja2Vk
X3BhZ2UocGFnZSkpCisJCW1hcmtfcGFnZV9hY2Nlc3NlZChwYWdlKTsKK30KKwordm9pZCBrdm1f
cmVsZWFzZV9wYWdlX2NsZWFuKHN0cnVjdCBwYWdlICpwYWdlKQoreworCWlmICghcGFnZSkKKwkJ
cmV0dXJuOworCisJa3ZtX3NldF9wYWdlX2FjY2Vzc2VkKHBhZ2UpOworCXB1dF9wYWdlKHBhZ2Up
OworfQorRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbik7CisKK3ZvaWQg
a3ZtX3JlbGVhc2VfcGFnZV9kaXJ0eShzdHJ1Y3QgcGFnZSAqcGFnZSkKK3sKKwlpZiAoIXBhZ2Up
CisJCXJldHVybjsKKworCWt2bV9zZXRfcGFnZV9kaXJ0eShwYWdlKTsKKwlrdm1fcmVsZWFzZV9w
YWdlX2NsZWFuKHBhZ2UpOworfQorRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3JlbGVhc2VfcGFnZV9k
aXJ0eSk7CisKIHN0YXRpYyBrdm1fcGZuX3Qga3ZtX3Jlc29sdmVfcGZuKHN0cnVjdCBrdm1fZm9s
bG93X3BmbiAqa2ZwLCBzdHJ1Y3QgcGFnZSAqcGFnZSwKIAkJCQkgc3RydWN0IGZvbGxvd19wZm5t
YXBfYXJncyAqbWFwLCBib29sIHdyaXRhYmxlKQogewpAQCAtMzEwNSwzNyArMzE0Niw2IEBAIHZv
aWQga3ZtX3ZjcHVfdW5tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX2hvc3Rf
bWFwICptYXAsIGJvb2wgZGlydHkpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fdmNwdV91bm1h
cCk7CiAKLXN0YXRpYyBib29sIGt2bV9pc19hZF90cmFja2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UpCi17Ci0JLyoKLQkgKiBQZXIgcGFnZS1mbGFncy5oLCBwYWdlcyB0YWdnZWQgUEdfcmVzZXJ2
ZWQgInNob3VsZCBpbiBnZW5lcmFsIG5vdCBiZQotCSAqIHRvdWNoZWQgKGUuZy4gc2V0IGRpcnR5
KSBleGNlcHQgYnkgaXRzIG93bmVyIi4KLQkgKi8KLQlyZXR1cm4gIVBhZ2VSZXNlcnZlZChwYWdl
KTsKLX0KLQotc3RhdGljIHZvaWQga3ZtX3NldF9wYWdlX2RpcnR5KHN0cnVjdCBwYWdlICpwYWdl
KQotewotCWlmIChrdm1faXNfYWRfdHJhY2tlZF9wYWdlKHBhZ2UpKQotCQlTZXRQYWdlRGlydHko
cGFnZSk7Ci19Ci0KLXN0YXRpYyB2b2lkIGt2bV9zZXRfcGFnZV9hY2Nlc3NlZChzdHJ1Y3QgcGFn
ZSAqcGFnZSkKLXsKLQlpZiAoa3ZtX2lzX2FkX3RyYWNrZWRfcGFnZShwYWdlKSkKLQkJbWFya19w
YWdlX2FjY2Vzc2VkKHBhZ2UpOwotfQotCi12b2lkIGt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4oc3Ry
dWN0IHBhZ2UgKnBhZ2UpCi17Ci0JaWYgKCFwYWdlKQotCQlyZXR1cm47Ci0KLQlrdm1fc2V0X3Bh
Z2VfYWNjZXNzZWQocGFnZSk7Ci0JcHV0X3BhZ2UocGFnZSk7Ci19Ci1FWFBPUlRfU1lNQk9MX0dQ
TChrdm1fcmVsZWFzZV9wYWdlX2NsZWFuKTsKLQogdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4o
a3ZtX3Bmbl90IHBmbikKIHsKIAlzdHJ1Y3QgcGFnZSAqcGFnZTsKQEAgLTMxNTEsMTYgKzMxNjEs
NiBAQCB2b2lkIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbihrdm1fcGZuX3QgcGZuKQogfQogRVhQT1JU
X1NZTUJPTF9HUEwoa3ZtX3JlbGVhc2VfcGZuX2NsZWFuKTsKIAotdm9pZCBrdm1fcmVsZWFzZV9w
YWdlX2RpcnR5KHN0cnVjdCBwYWdlICpwYWdlKQotewotCWlmICghcGFnZSkKLQkJcmV0dXJuOwot
Ci0Ja3ZtX3NldF9wYWdlX2RpcnR5KHBhZ2UpOwotCWt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4ocGFn
ZSk7Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChrdm1fcmVsZWFzZV9wYWdlX2RpcnR5KTsKLQogdm9p
ZCBrdm1fcmVsZWFzZV9wZm5fZGlydHkoa3ZtX3Bmbl90IHBmbikKIHsKIAlzdHJ1Y3QgcGFnZSAq
cGFnZTsKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
