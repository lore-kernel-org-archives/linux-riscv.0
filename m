Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14D0CFC5EC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4yKJHNdpIuH+avuAxe96G0IpM/S0JvEXt03Qo0zun0=; b=cPhU+5JV7O5prb
	MBr+gCCpOk0L01ebelHNedsHaJR1SJK9yo3k5mDy0tiuIQcI+HHmizUff3wt9IUQN0BNIABGurKg0
	0IlOk4We7oz1flIH+c3jAC9i/WtXxXZVuShDZoVpjMWr4JMfP9/VWnGgbc5L20IbOVmaPpKv2ZJ/f
	84eGGcKLMB2mZAyUrIPP3ZEXXxmlTVBJniyIvJ3x8TdZZaqYtOvEB9mSIIEc/NaUaYw96VVBE1c2N
	vSi1EGlNEfNucisoyO8ZGGuKdnk4Fel27ZyfVMwOj627jFPhAmkkiLcV6tD/hWbiX87qeyLd8jE4r
	6v70ktNPSzYaDytRXnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy8D-0000000Dxls-0NBN;
	Thu, 10 Oct 2024 18:43:25 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqc-0000000Dpru-2XyL
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:18 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-70ac9630e3aso1194440a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584713; x=1729189513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=25I4FmM9q8/zakq/tajBcDwOrvaX/2yJF+noHaaqm7+nhtCEEA/vHiU69MABElw42H
         B0+z7J4m0eAxHcEysEV5vjKCvS07QkxRcPK+VkmZpmuUDp6NfwO3Hvjtsgw809Xkf7cK
         xEWsOB6J1lk8cjv54hI8ebnqvdiE0V8pyzSHiEy5o33n4d83JNM2vXUxpVVLfIIBy2Gk
         vnelAIZWHr1D4pc4Ntp/6Ckp76P4LiMNNaMPcqx8leW2ZC1NVk0dvQPNTg2yv+KCnTwe
         kjkpA8Kzuy4XL/IX5EnjFjgQ3ax4KyRzS75vIqG1SBagCjy18+WtNgYR9ZX90VOYzF7L
         2vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584713; x=1729189513;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=NHy5+s4Xx+HQIM9Vf7/KN7Gd8R0aHV/xy5IsARd+IFAecRu+7TDAN24G974mKRwL8S
         2CjnVYV1LCGV3ErMBhQnQa5H4hOO8GaZxTFxk9opb9B39jdlYrkwv/02I8g1BE7opZQf
         /PzYcprEuWvNGInMD7QjYZeF/+ftwsHTDz8GXOog92vmAT/3awlG/PdNYBxDKZnV9ztg
         kqfv7s8PMG/D4LtS4g/sdWnSvpkn6HBO150ZVJEbu63CJPV0XIu+KRoFYfcFPMN/6kac
         nt0CNaObcMiBWgTwPq2+FlBtytqVx6VqIf1SLkQ6qeHUKDoV5Jnoqlis4XT3co60dNts
         7KmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk9I4AZae99RDbH2/4XoX4BxJ0v7TQuRRLk6BMNAvs2LrLsKFnXyFwWdXToSa/4jIS8FfmnbSKrDNugw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi8yq8bK4sycfSiLHoET+37ZDQgTEzFZMOFfM+cnj4c7xWs0n9
	J6Dtu7GVVwX/3QLen8w58UuWMItntVy+f+TYQ8v0iTEDOkJea7Du7yNva1h2fphcM1P3E3foU9r
	6hg==
X-Google-Smtp-Source: AGHT+IEzZdX7U43FtBqfYwOSCvhQrFRs7MoNj08p1am6l1FbD4QaVhgMc/3KfB78OlyTOzXtpjGPG3KIosU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ea0e:b0:2e2:d843:4880 with SMTP id
 98e67ed59e1d1-2e2f0c82a2fmr30a91.5.1728584713017; Thu, 10 Oct 2024 11:25:13
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:12 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-11-seanjc@google.com>
Subject: [PATCH v13 10/85] KVM: x86/mmu: Use gfn_to_page_many_atomic() when
 prefetching indirect PTEs
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
X-CRM114-CacheID: sfid-20241010_112514_832953_973BADBA 
X-CRM114-Status: UNSURE (   8.86  )
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

VXNlIGdmbl90b19wYWdlX21hbnlfYXRvbWljKCkgaW5zdGVhZCBvZiBnZm5fdG9fcGZuX21lbXNs
b3RfYXRvbWljKCkgd2hlbgpwcmVmZXRjaGluZyBpbmRpcmVjdCBQVEVzIChkaXJlY3RfcHRlX3By
ZWZldGNoX21hbnkoKSBhbHJlYWR5IHVzZXMgdGhlCiJ0byBwYWdlIiBBUElTKS4gIEZ1bmN0aW9u
YWxseSwgdGhlIHR3byBhcmUgc3VidGx5IGVxdWl2YWxlbnQsIGFzIHRoZSAidG8KcGZuIiBBUEkg
c2hvcnQtY2lyY3VpdHMgaHZhX3RvX3BmbigpIGlmIGh2YV90b19wZm5fZmFzdCgpIGZhaWxzLCBp
LmUuIGlzCmp1c3QgYSB3cmFwcGVyIGZvciBnZXRfdXNlcl9wYWdlX2Zhc3Rfb25seSgpL2dldF91
c2VyX3BhZ2VzX2Zhc3Rfb25seSgpLgoKU3dpdGNoaW5nIHRvIHRoZSAidG8gcGFnZSIgQVBJIHdp
bGwgYWxsb3cgZHJvcHBpbmcgdGhlIEBhdG9taWMgcGFyYW1ldGVyCmZyb20gdGhlIGVudGlyZSBo
dmFfdG9fcGZuKCkgY2FsbGNoYWluLgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgotLS0KIGFyY2gveDg2L2t2bS9tbXUvcGFnaW5nX3RtcGwuaCB8IDkgKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvcGFnaW5nX3RtcGwuaCBiL2FyY2gveDg2L2t2
bS9tbXUvcGFnaW5nX3RtcGwuaAppbmRleCBmYmFhZTA0MDIxOGIuLjM2YjI2MDcyODBmMCAxMDA2
NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9wYWdpbmdfdG1wbC5oCisrKyBiL2FyY2gveDg2L2t2
bS9tbXUvcGFnaW5nX3RtcGwuaApAQCAtNTM1LDggKzUzNSw4IEBAIEZOQU1FKHByZWZldGNoX2dw
dGUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tbXVfcGFnZSAqc3AsCiB7CiAJ
c3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdDsKIAl1bnNpZ25lZCBwdGVfYWNjZXNzOworCXN0
cnVjdCBwYWdlICpwYWdlOwogCWdmbl90IGdmbjsKLQlrdm1fcGZuX3QgcGZuOwogCiAJaWYgKEZO
QU1FKHByZWZldGNoX2ludmFsaWRfZ3B0ZSkodmNwdSwgc3AsIHNwdGUsIGdwdGUpKQogCQlyZXR1
cm4gZmFsc2U7CkBAIC01NDksMTIgKzU0OSwxMSBAQCBGTkFNRShwcmVmZXRjaF9ncHRlKShzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fbW11X3BhZ2UgKnNwLAogCWlmICghc2xvdCkK
IAkJcmV0dXJuIGZhbHNlOwogCi0JcGZuID0gZ2ZuX3RvX3Bmbl9tZW1zbG90X2F0b21pYyhzbG90
LCBnZm4pOwotCWlmIChpc19lcnJvcl9wZm4ocGZuKSkKKwlpZiAoZ2ZuX3RvX3BhZ2VfbWFueV9h
dG9taWMoc2xvdCwgZ2ZuLCAmcGFnZSwgMSkgIT0gMSkKIAkJcmV0dXJuIGZhbHNlOwogCi0JbW11
X3NldF9zcHRlKHZjcHUsIHNsb3QsIHNwdGUsIHB0ZV9hY2Nlc3MsIGdmbiwgcGZuLCBOVUxMKTsK
LQlrdm1fcmVsZWFzZV9wZm5fY2xlYW4ocGZuKTsKKwltbXVfc2V0X3NwdGUodmNwdSwgc2xvdCwg
c3B0ZSwgcHRlX2FjY2VzcywgZ2ZuLCBwYWdlX3RvX3BmbihwYWdlKSwgTlVMTCk7CisJa3ZtX3Jl
bGVhc2VfcGFnZV9jbGVhbihwYWdlKTsKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotLSAKMi40Ny4wLnJj
MS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
