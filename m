Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7FED2444D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDYXAdS3XYiprcTc97f/OScbt0M0P0wPG4OeYtKRENE=; b=QY3CPqvkQW8hXo
	46IrZnoY7H/F6va7ZhnqYQgB9EBTQ35n7H9wUlFZ1fUd4AsGK9We7Em9HilLdgaTGTBUsBn1OVfNe
	wmjaT36yCWVGOGJv2tvTQ+61ZDjQBthJDatpqzwNT5l4z3RmkV7tVxq3I0HXzyFVAbX5ul7ZgKELE
	FyiaJXB+AcjSHdBaiyuU/DpAxZsdmvr9N2tD6yl9HU+V61StMCrmvMkosymU3VoTN+epDIWbrBkdc
	hv3WOeVQvqKUnVseYDERYgw1T+lfwTn8iLABW7K1AfGlR6xf+M0DF1oPbE2Dl4/5bTZkxWriDSrAB
	TK4z/3u99bg+sly/RGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzoh-0000000EGlq-2vOJ;
	Thu, 10 Oct 2024 20:31:23 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxri-0000000Dqm2-3iyL
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:25 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e29b4f8837so18944097b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584782; x=1729189582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHy2j9VNwFKd5G/Ubc3O4QkXvNoIm5ox3M6XZ4oswcY=;
        b=PxBQb6V+W9jxog8EtEIgeGjMXgX3DoQlH9csUz21WWACHY5TzBY6Zb0NYKAEDEvhCL
         EEORQUDWODB5Zlh+y65IhXmZaI61GUcrVHjyExWDVVnYWImh+IDn5v6Rn0iYUtOApd27
         lRgtb7DyZK3i73ZvBLazXX+S80VsUBJVrvIewB0whu96yv3ay3gWL2sKc8xdagcNXSsC
         B5F89XVKv1Hf4taRgzl222K8qjxQHiSGWVj8Yi577akb5HVrn6V1Cuc+beMKFlqGzfAA
         9iXv89Gftqp9NkxCMeqn6A/sH+3xcYVnYTU5K9D7AKyhHG0S1pgbqIsLN4HiKAti+VlZ
         OOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584782; x=1729189582;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHy2j9VNwFKd5G/Ubc3O4QkXvNoIm5ox3M6XZ4oswcY=;
        b=poffuGcsPYZxmNUvbyvci8g0KjIuC7WQXIN5Am+4NoBkQ7o5TkA8lZvq1iUWd6KsKa
         AkYev799cRraqz+QUn3pDmZS+OnXZ+2XUBUDQp3LMHoDlJm/GTju7A7i+AjYUb7hhHUz
         Di+PyvaG3+rKPq7BO7lwS36go2WJTbd/8nOQUSCbvs4KNLV/+VXT2CPreZ3eGOrc8PLL
         YVcvdrA4+q3RxIX1y2N5QEoGBoVJzoIEXsmgykK02HzNZOXaQU8w9EI+iwmfj1FVdqaq
         PvC/z4YSB/3qWhbJB68hBcUC/zqQfwUWejdENZaauv85NsQD/hqfqvGIkPd6Piyosydo
         Lrgw==
X-Forwarded-Encrypted: i=1; AJvYcCXIYmvylauDmBNepFzoqoqrkO8sicZI2f9Rd60Cs9Ol2zye8T/bXxYkseGZf5VZ0KKgIgerxC6Wgluksg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj/5yXRQ1usfLhXo50vKXVAQ1ovy9g7YOe+rFzltVyqJNOIPS6
	I7JGImpCjdEsjP5byhZeuRB5YmyAE7CH1zSk7+x+kfObHekgaGMmoC70lRaKD9FnK/Nwu4O84g+
	GAw==
X-Google-Smtp-Source: AGHT+IEBXjEpYcXfPYRm3Nf4G9ZN1ucR55aqjscHr2p9QPsSrcRZYI0185ucK64AXquh+1QVcruWQv+kNDM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:5605:b0:6be:523:af53 with SMTP id
 00721157ae682-6e32f2f4e28mr919077b3.3.1728584781575; Thu, 10 Oct 2024
 11:26:21 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:45 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-44-seanjc@google.com>
Subject: [PATCH v13 43/85] KVM: Add kvm_faultin_pfn() to specifically service
 guest page faults
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
X-CRM114-CacheID: sfid-20241010_112623_267989_DFFF55F7 
X-CRM114-Status: GOOD (  11.95  )
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

QWRkIGEgbmV3IGRlZGljYXRlZCBBUEksIGt2bV9mYXVsdGluX3BmbigpLCBmb3Igc2VydmljaW5n
IGd1ZXN0IHBhZ2UKZmF1bHRzLCBpLmUuIGZvciBnZXR0aW5nIHBhZ2VzL3BmbnMgdGhhdCB3aWxs
IGJlIG1hcHBlZCBpbnRvIHRoZSBndWVzdCB2aWEKYW4gbW11X25vdGlmaWVyLXByb3RlY3RlZCBL
Vk0gTU1VLiAgS2VlcCBzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gYnVyaWVkIGluCmludGVybmFsIGNv
ZGUsIGFzIGhhdmluZyBfX2t2bV9mYXVsdGluX3BmbigpIHRha2UgIm91dCIgcGFyYW1zIGlzIGFj
dHVhbGx5CmNsZWFuZXIgZm9yIHNldmVyYWwgYXJjaGl0ZWN0dXJlcywgZS5nLiBpdCBhbGxvd3Mg
dGhlIGNhbGxlciB0byBoYXZlIGl0cwpvd24gInBhZ2UgZmF1bHQiIHN0cnVjdHVyZSB3aXRob3V0
IGhhdmluZyB0byBtYXJzaGFsIGRhdGEgdG8vZnJvbQprdm1fZm9sbG93X3Bmbi4KCkxvbmcgdGVy
bSwgY29tbW9uIEtWTSB3b3VsZCBpZGVhbGx5IHByb3ZpZGUgYSBrdm1fcGFnZV9mYXVsdCBzdHJ1
Y3R1cmUsIGEKbGEgeDg2J3Mgc3RydWN0IG9mIHRoZSBzYW1lIG5hbWUuICBCdXQgYWxsIGFyY2hp
dGVjdHVyZXMgbmVlZCB0byBiZQpjb252ZXJ0ZWQgdG8gYSBjb21tb24gQVBJIGJlZm9yZSB0aGF0
IGNhbiBoYXBwZW4uCgpUZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5j
b20+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwgMTIgKysrKysrKysrKysrCiB2aXJ0
L2t2bS9rdm1fbWFpbi5jICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2
bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggMzQ2YmZlZjE0ZTVhLi4z
YjlhZmI0MGU5MzUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9p
bmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKQEAgLTEyMzEsNiArMTIzMSwxOCBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQga3ZtX3JlbGVhc2VfcGFnZV91bnVzZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCiB2b2lk
IGt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4oc3RydWN0IHBhZ2UgKnBhZ2UpOwogdm9pZCBrdm1fcmVs
ZWFzZV9wYWdlX2RpcnR5KHN0cnVjdCBwYWdlICpwYWdlKTsKIAora3ZtX3Bmbl90IF9fa3ZtX2Zh
dWx0aW5fcGZuKGNvbnN0IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbiwK
KwkJCSAgICB1bnNpZ25lZCBpbnQgZm9sbCwgYm9vbCAqd3JpdGFibGUsCisJCQkgICAgc3RydWN0
IHBhZ2UgKipyZWZjb3VudGVkX3BhZ2UpOworCitzdGF0aWMgaW5saW5lIGt2bV9wZm5fdCBrdm1f
ZmF1bHRpbl9wZm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sCisJCQkJCWJvb2wg
d3JpdGUsIGJvb2wgKndyaXRhYmxlLAorCQkJCQlzdHJ1Y3QgcGFnZSAqKnJlZmNvdW50ZWRfcGFn
ZSkKK3sKKwlyZXR1cm4gX19rdm1fZmF1bHRpbl9wZm4oa3ZtX3ZjcHVfZ2ZuX3RvX21lbXNsb3Qo
dmNwdSwgZ2ZuKSwgZ2ZuLAorCQkJCSB3cml0ZSA/IEZPTExfV1JJVEUgOiAwLCB3cml0YWJsZSwg
cmVmY291bnRlZF9wYWdlKTsKK30KKwoga3ZtX3Bmbl90IGdmbl90b19wZm4oc3RydWN0IGt2bSAq
a3ZtLCBnZm5fdCBnZm4pOwoga3ZtX3Bmbl90IGdmbl90b19wZm5fcHJvdChzdHJ1Y3Qga3ZtICpr
dm0sIGdmbl90IGdmbiwgYm9vbCB3cml0ZV9mYXVsdCwKIAkJICAgICAgYm9vbCAqd3JpdGFibGUp
OwpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMK
aW5kZXggNmRjYjRmMGVlZDNlLi42OTZkNWU0MjliM2UgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2
bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMzA5OCw2ICszMDk4LDI4IEBA
IGt2bV9wZm5fdCBrdm1fdmNwdV9nZm5fdG9fcGZuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ2Zu
X3QgZ2ZuKQogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3ZjcHVfZ2ZuX3RvX3Bmbik7CiAKK2t2
bV9wZm5fdCBfX2t2bV9mYXVsdGluX3Bmbihjb25zdCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90LCBnZm5fdCBnZm4sCisJCQkgICAgdW5zaWduZWQgaW50IGZvbGwsIGJvb2wgKndyaXRhYmxl
LAorCQkJICAgIHN0cnVjdCBwYWdlICoqcmVmY291bnRlZF9wYWdlKQoreworCXN0cnVjdCBrdm1f
Zm9sbG93X3BmbiBrZnAgPSB7CisJCS5zbG90ID0gc2xvdCwKKwkJLmdmbiA9IGdmbiwKKwkJLmZs
YWdzID0gZm9sbCwKKwkJLm1hcF93cml0YWJsZSA9IHdyaXRhYmxlLAorCQkucmVmY291bnRlZF9w
YWdlID0gcmVmY291bnRlZF9wYWdlLAorCX07CisKKwlpZiAoV0FSTl9PTl9PTkNFKCF3cml0YWJs
ZSB8fCAhcmVmY291bnRlZF9wYWdlKSkKKwkJcmV0dXJuIEtWTV9QRk5fRVJSX0ZBVUxUOworCisJ
KndyaXRhYmxlID0gZmFsc2U7CisJKnJlZmNvdW50ZWRfcGFnZSA9IE5VTEw7CisKKwlyZXR1cm4g
a3ZtX2ZvbGxvd19wZm4oJmtmcCk7Cit9CitFWFBPUlRfU1lNQk9MX0dQTChfX2t2bV9mYXVsdGlu
X3Bmbik7CisKIGludCBrdm1fcHJlZmV0Y2hfcGFnZXMoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
c2xvdCwgZ2ZuX3QgZ2ZuLAogCQkgICAgICAgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IG5yX3Bh
Z2VzKQogewotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
