Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F18D2445D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALzKC+A6D1n7k+pmdsoUauQFjVVfrRt+6Hrs89CnFQ8=; b=jJpwE3N4AeXzdW
	dV2ZrHcGZWpRffO4F+Pcsk9nrTmnfIXz36S7aZfySeLAyMfTcPn7iG33Lrc0365wbS8vybBcEt8N2
	pQ/NW/WN/p9lYkzOhxJ2MyycIKS8cXe5rgk3tTgDjTGHFum79C1A53+sJt5xhNfHA2ZBcci+eqF3V
	/AyzXCnebJPbeS6X/JzM3Qqyirxx52T2G8yknj7mS2AyM9KyV3+iVUyTfKYMvMtv6ABFy5MLXdezd
	lMAzPZrWJyp50VZpN4rXlr41MOEb2AB27lIHS2kCJ3I7wMKCmSm1K9zUFXV49i4ETYjaxPTaPdh/Z
	g0+xtkZ64OLxOwJCzbDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2d3-0000000Ef6x-28rv;
	Thu, 10 Oct 2024 23:31:33 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsz-0000000Drpp-2b4s
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:43 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e30fe2a9feso16561857b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584860; x=1729189660; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1MnEbvSXNK1DBYHKiiPeGTlNBdM3PqCgrnaMRmX38Y=;
        b=i5UNoI6Kh250+uksVmaSRP/cHhMpWg5vufAjEq5qaf4KW2tpEbQBEnUAxe8WtIPzVD
         RJtBDpF/jSRcHx7V05sRWdvewtg7NDONoenoJgCZkES3b9pZIwJplK/ea4WgKsJKtwN5
         vMqotF/eVBLeHPF6N8JBMZWeQP/i8pY0rcsG2bjOsA3Ak+wU161wXH9k9YYRw5nCULcN
         Q2W/gCFxPgQdHaPAphdCHemVDWrBZIyWZIh98QKAKROgiWi1Q9z6KLI7U/yyFI2iRCjS
         6yq/rY9hUeyZBGeU+ENe+RD5wX0ilZR4YZoGuleOjUADwYxAX1LH7/JJjIHIfRbA8QTS
         JeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584860; x=1729189660;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q1MnEbvSXNK1DBYHKiiPeGTlNBdM3PqCgrnaMRmX38Y=;
        b=EvJETgYB/QL4O9zn07lG9B5AWsEjg7q24E5yyOKOafs0ofGQIIP686ctUycZbuqPWK
         jjGn6uxtaGV8n1sv2rIbp+tEa3f/Sdid/Ai96kF+zVpYrxXYGhS4J2QodukUHY7jo3Je
         ifC6aP9hGuIBwQLf8xn4c0IAH4CT1NUQM+9KZBmBmTozdPlaxamQWSgSVnZhTPcbgKmi
         y9TV5k51ToJbKxnV2FrYzSncZ8OpJMmfBSUMPgKx2E/Rv6+0KhY3IF9QAsmkXWi+OxuR
         EXy+vad4KNNbWM3S1GmTDPw0QskQFH7GpQRf9UKPZHpMnF3nAF1PmJqh0YC9d91tA2w5
         PH6w==
X-Forwarded-Encrypted: i=1; AJvYcCVibQtN0KPQgMnLA5/GwDl0RaI6+0u2s3uteP3qj5QsVE0TdVgn3WDPfEcHcWGz93uvkAI8JCh2oAM3sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPwnvUsQhnP1YNrii5AnPUYfgnYhkmMjRfjZRcQgylFIAXjFZr
	gfJ96Y7QUlNaNVfTbcCL5V7Q0AHOml6vO8KOh4QvA1Qu55GZBaqlx7fpdxkDK/9dMmjrqwCJY/i
	VAg==
X-Google-Smtp-Source: AGHT+IGvHgo281GUU728l2kpqfRNdoQ8M4AtWxtMdwK+Sbd/Nmo7aGxeBXrCmxWS+HWzNnhFIgaVqhxkocM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:f20e:0:b0:e11:5da7:337 with SMTP id
 3f1490d57ef6-e28fe3505c2mr129032276.3.1728584859805; Thu, 10 Oct 2024
 11:27:39 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:21 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-80-seanjc@google.com>
Subject: [PATCH v13 79/85] KVM: Drop gfn_to_pfn() APIs now that all users are gone
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
X-CRM114-CacheID: sfid-20241010_112741_733603_60689322 
X-CRM114-Status: UNSURE (   7.66  )
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

RHJvcCBnZm5fdG9fcGZuKCkgYW5kIGFsbCBpdHMgdmFyaWFudHMgbm93IHRoYXQgYWxsIHVzZXJz
IGFyZSBnb25lLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpUZXN0ZWQtYnk6IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBD
aHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oIHwgMTEgLS0tLS0tLS0KIHZpcnQva3ZtL2t2bV9tYWluLmMgICAgICB8IDU5IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNzAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IGFmOTI4YjU5YjJhYi4uNGExZWFhNDBhMjE1IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9r
dm1faG9zdC5oCkBAIC0xMjc0LDE0ICsxMjc0LDYgQEAgc3RhdGljIGlubGluZSBrdm1fcGZuX3Qg
a3ZtX2ZhdWx0aW5fcGZuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ2ZuX3QgZ2ZuLAogCQkJCSB3
cml0ZSA/IEZPTExfV1JJVEUgOiAwLCB3cml0YWJsZSwgcmVmY291bnRlZF9wYWdlKTsKIH0KIAot
a3ZtX3Bmbl90IGdmbl90b19wZm4oc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOwota3ZtX3Bm
bl90IGdmbl90b19wZm5fcHJvdChzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgYm9vbCB3cml0
ZV9mYXVsdCwKLQkJICAgICAgYm9vbCAqd3JpdGFibGUpOwota3ZtX3Bmbl90IGdmbl90b19wZm5f
bWVtc2xvdChjb25zdCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4pOwot
a3ZtX3Bmbl90IF9fZ2ZuX3RvX3Bmbl9tZW1zbG90KGNvbnN0IHN0cnVjdCBrdm1fbWVtb3J5X3Ns
b3QgKnNsb3QsIGdmbl90IGdmbiwKLQkJCSAgICAgICBib29sIGludGVycnVwdGlibGUsIGJvb2wg
bm9fd2FpdCwKLQkJCSAgICAgICBib29sIHdyaXRlX2ZhdWx0LCBib29sICp3cml0YWJsZSk7Ci0K
IHZvaWQga3ZtX3JlbGVhc2VfcGZuX2NsZWFuKGt2bV9wZm5fdCBwZm4pOwogdm9pZCBrdm1fcmVs
ZWFzZV9wZm5fZGlydHkoa3ZtX3Bmbl90IHBmbik7CiB2b2lkIGt2bV9zZXRfcGZuX2RpcnR5KGt2
bV9wZm5fdCBwZm4pOwpAQCAtMTM1Niw5ICsxMzQ4LDYgQEAgdW5zaWduZWQgbG9uZyBrdm1faG9z
dF9wYWdlX3NpemUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4pOwogdm9pZCBtYXJr
X3BhZ2VfZGlydHlfaW5fc2xvdChzdHJ1Y3Qga3ZtICprdm0sIGNvbnN0IHN0cnVjdCBrdm1fbWVt
b3J5X3Nsb3QgKm1lbXNsb3QsIGdmbl90IGdmbik7CiB2b2lkIG1hcmtfcGFnZV9kaXJ0eShzdHJ1
Y3Qga3ZtICprdm0sIGdmbl90IGdmbik7CiAKLQota3ZtX3Bmbl90IGt2bV92Y3B1X2dmbl90b19w
Zm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4pOwotCiBpbnQgX19rdm1fdmNwdV9t
YXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBncGEsIHN0cnVjdCBrdm1faG9zdF9tYXAg
Km1hcCwKIAkJICAgYm9vbCB3cml0YWJsZSk7CiB2b2lkIGt2bV92Y3B1X3VubWFwKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ob3N0X21hcCAqbWFwKTsKZGlmZiAtLWdpdCBhL3Zp
cnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDhmOGIyY2QwMTE4
OS4uYjJjOGQ0Mjk0NDJkIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3Zp
cnQva3ZtL2t2bV9tYWluLmMKQEAgLTMwMzksNjUgKzMwMzksNiBAQCBzdGF0aWMga3ZtX3Bmbl90
IGt2bV9mb2xsb3dfcGZuKHN0cnVjdCBrdm1fZm9sbG93X3BmbiAqa2ZwKQogCXJldHVybiBodmFf
dG9fcGZuKGtmcCk7CiB9CiAKLWt2bV9wZm5fdCBfX2dmbl90b19wZm5fbWVtc2xvdChjb25zdCBz
dHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4sCi0JCQkgICAgICAgYm9vbCBp
bnRlcnJ1cHRpYmxlLCBib29sIG5vX3dhaXQsCi0JCQkgICAgICAgYm9vbCB3cml0ZV9mYXVsdCwg
Ym9vbCAqd3JpdGFibGUpCi17Ci0Jc3RydWN0IGt2bV9mb2xsb3dfcGZuIGtmcCA9IHsKLQkJLnNs
b3QgPSBzbG90LAotCQkuZ2ZuID0gZ2ZuLAotCQkubWFwX3dyaXRhYmxlID0gd3JpdGFibGUsCi0J
fTsKLQotCWlmICh3cml0ZV9mYXVsdCkKLQkJa2ZwLmZsYWdzIHw9IEZPTExfV1JJVEU7Ci0JaWYg
KG5vX3dhaXQpCi0JCWtmcC5mbGFncyB8PSBGT0xMX05PV0FJVDsKLQlpZiAoaW50ZXJydXB0aWJs
ZSkKLQkJa2ZwLmZsYWdzIHw9IEZPTExfSU5URVJSVVBUSUJMRTsKLQotCXJldHVybiBrdm1fZm9s
bG93X3Bmbigma2ZwKTsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKF9fZ2ZuX3RvX3Bmbl9tZW1zbG90
KTsKLQota3ZtX3Bmbl90IGdmbl90b19wZm5fcHJvdChzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdm
biwgYm9vbCB3cml0ZV9mYXVsdCwKLQkJICAgICAgYm9vbCAqd3JpdGFibGUpCi17Ci0Jc3RydWN0
IGt2bV9mb2xsb3dfcGZuIGtmcCA9IHsKLQkJLnNsb3QgPSBnZm5fdG9fbWVtc2xvdChrdm0sIGdm
biksCi0JCS5nZm4gPSBnZm4sCi0JCS5mbGFncyA9IHdyaXRlX2ZhdWx0ID8gRk9MTF9XUklURSA6
IDAsCi0JCS5tYXBfd3JpdGFibGUgPSB3cml0YWJsZSwKLQl9OwotCi0JcmV0dXJuIGt2bV9mb2xs
b3dfcGZuKCZrZnApOwotfQotRVhQT1JUX1NZTUJPTF9HUEwoZ2ZuX3RvX3Bmbl9wcm90KTsKLQot
a3ZtX3Bmbl90IGdmbl90b19wZm5fbWVtc2xvdChjb25zdCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90
ICpzbG90LCBnZm5fdCBnZm4pCi17Ci0Jc3RydWN0IGt2bV9mb2xsb3dfcGZuIGtmcCA9IHsKLQkJ
LnNsb3QgPSBzbG90LAotCQkuZ2ZuID0gZ2ZuLAotCQkuZmxhZ3MgPSBGT0xMX1dSSVRFLAotCX07
Ci0KLQlyZXR1cm4ga3ZtX2ZvbGxvd19wZm4oJmtmcCk7Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChn
Zm5fdG9fcGZuX21lbXNsb3QpOwotCi1rdm1fcGZuX3QgZ2ZuX3RvX3BmbihzdHJ1Y3Qga3ZtICpr
dm0sIGdmbl90IGdmbikKLXsKLQlyZXR1cm4gZ2ZuX3RvX3Bmbl9tZW1zbG90KGdmbl90b19tZW1z
bG90KGt2bSwgZ2ZuKSwgZ2ZuKTsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKGdmbl90b19wZm4pOwot
Ci1rdm1fcGZuX3Qga3ZtX3ZjcHVfZ2ZuX3RvX3BmbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdm
bl90IGdmbikKLXsKLQlyZXR1cm4gZ2ZuX3RvX3Bmbl9tZW1zbG90KGt2bV92Y3B1X2dmbl90b19t
ZW1zbG90KHZjcHUsIGdmbiksIGdmbik7Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChrdm1fdmNwdV9n
Zm5fdG9fcGZuKTsKLQoga3ZtX3Bmbl90IF9fa3ZtX2ZhdWx0aW5fcGZuKGNvbnN0IHN0cnVjdCBr
dm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbiwKIAkJCSAgICB1bnNpZ25lZCBpbnQgZm9s
bCwgYm9vbCAqd3JpdGFibGUsCiAJCQkgICAgc3RydWN0IHBhZ2UgKipyZWZjb3VudGVkX3BhZ2Up
Ci0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
