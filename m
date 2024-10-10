Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2197CFC5EC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KH3NacRBIN/eDv72HTUiB+a+DPKyBscJoHj0mB25/ko=; b=JXYOEU1Z5YhSJj
	TMddypyW+rAsEZDXEMgp3o3p7AKyltLUR6bIvK8OFeSQLemmADxs8aB0x5UH7KJqsBTRPP886ZI7o
	6XjFk0RdYpYhmXWEK15PofpMCj3EbhrfyoFbq8yXJIYCO9f1TezBamF2XJb72Bb/Iaxc+B4OiwuWO
	MLvbiuUpAxHRd18++kmGC0H5rpu5QpGc7nsrmUX8Bi/DpxtY8dSY82Yzp4tLTtxibZtVjtyoLJ9Xb
	gh9cYZAq0UoL2eDNK99r6Elg76pJamyGVpuLBO6BBbsJwFI8ICQmDyFzM/CSr3nLYJfpQfgG9GgnD
	iSoUYNhC7xCUEJXVcqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy1H-0000000Dvfd-1L95;
	Thu, 10 Oct 2024 18:36:15 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqK-0000000DpeD-2C5F
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:24:58 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3245ed6b8so23817577b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584695; x=1729189495; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=3tpcWmDhC2p5JkkW8aB29EYcT5Tc9T3eDSrIYpr4d6VdBPy/WHXsR4WShFJm6c9Rgp
         IwMeB1Akf45dADb/TeQKAfku3V7l/dzk41yiqET2SfY9fONopnJnvP4hE5Hi/kSiofPx
         7m6lAJganol+7NKovRFL2zZudjYJRd+Ve4FMWnQ8wtVVq2/6aCMfJM9zEq5h12F9kJoc
         EXxzXUN61izp/gYQafC5ezdxs0Hmt2qr6ciEnfI2pE51ck2xY2nfnsRpO0j2R6TmnFtR
         tvKzRl3/fD9ufDJ5YS//pg6k3swCPzJTaPvEKExRNguqGGAS0pSD+9d7EBjVWsvevfaN
         /u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584695; x=1729189495;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8PiI9IzFtQVAZLsCzTZ7ta7WGdR9XnSo4A5BSh1uxRg=;
        b=wght1Cewub1Pmc3cd6iUoVAnxHKRLr2HlSFshgVEUTSeXvHwtdNiUfGbN9xYcqW96W
         W2aUtmVEx02lltdDl9mAlWZeLvpFiTjyK0YP86KCsUsAJ2txox4Cz310ABUTZVWVZuam
         0HR4tejB3d59HKIoEtARczjg5jVPkmHHFCyytPh0uHtLBy44J/fSiVZnmjsLTAE3jIEw
         CU+Yt/XJTUO8NwkJ4pi4IuqSFp4cm14HVo5mG1kTfP3r0ZCJfueL+y/Pg81mDtaKAFpZ
         R8INhtzmBJMBEjATySSS1KmDq8Lq7nmNMv5jLwDiCVUYxrMD/k1keYXyQpmehUoh8asY
         91jw==
X-Forwarded-Encrypted: i=1; AJvYcCX26lZEZoDqmtQNWGh/krWWGPwDytipdMrt7HBgf0YgrAT/J3k6YF2UumJL66anhfDZVaQZkFlXFjCt5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyEHiYzBfA7gmfrhAHHeJJabR4kreKaFbWkGEleBEYPq5f9Qum
	p38f++hblzZpqMIZ9xum4o35L38BdWjydgQU5wRVIW+L7qWsiiUpOtg5x34xE8AamPxFBl+iPbN
	Mfg==
X-Google-Smtp-Source: AGHT+IGz6mODxZTH5agCMYiGZey+8PwFJu50se4JqpXBNG0SwyKrN9TWGGQJqqmZYCdc2Fnc7eka1IGyLLE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a81:ad16:0:b0:6c1:298e:5a7 with SMTP id
 00721157ae682-6e3224662ffmr1632867b3.5.1728584694780; Thu, 10 Oct 2024
 11:24:54 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:05 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-4-seanjc@google.com>
Subject: [PATCH v13 03/85] KVM: Add kvm_release_page_unused() API to put pages
 that KVM never consumes
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
X-CRM114-CacheID: sfid-20241010_112456_733753_33309287 
X-CRM114-Status: UNSURE (   8.44  )
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

QWRkIGFuIEFQSSB0byByZWxlYXNlIGFuIHVudXNlZCBwYWdlLCBpLmUuIHRvIHB1dCBhIHBhZ2Ug
d2l0aG91dCBtYXJraW5nCml0IGFjY2Vzc2VkIG9yIGRpcnR5LiAgVGhlIEFQSSB3aWxsIGJlIHVz
ZWQgd2hlbiBLVk0gZmF1bHRzLWluIGEgcGFnZSBidXQKYmFpbHMgYmVmb3JlIGluc3RhbGxpbmcg
dGhlIGd1ZXN0IG1hcHBpbmcgKGFuZCBvdGhlciBzaW1pbGFyIGZsb3dzKS4KClJldmlld2VkLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClRlc3RlZC1ieTogQWxleCBC
ZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlz
dG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmggfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3Qu
aAppbmRleCBlZTE4NmExZmJhYWQuLmFiNDQ4NWIyYmRkYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtMTIxNiw2
ICsxMjE2LDE1IEBAIHVuc2lnbmVkIGxvbmcgZ2ZuX3RvX2h2YV9wcm90KHN0cnVjdCBrdm0gKmt2
bSwgZ2ZuX3QgZ2ZuLCBib29sICp3cml0YWJsZSk7CiB1bnNpZ25lZCBsb25nIGdmbl90b19odmFf
bWVtc2xvdChzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4pOwogdW5zaWdu
ZWQgbG9uZyBnZm5fdG9faHZhX21lbXNsb3RfcHJvdChzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90LCBnZm5fdCBnZm4sCiAJCQkJICAgICAgYm9vbCAqd3JpdGFibGUpOworCitzdGF0aWMgaW5s
aW5lIHZvaWQga3ZtX3JlbGVhc2VfcGFnZV91bnVzZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCit7CisJ
aWYgKCFwYWdlKQorCQlyZXR1cm47CisKKwlwdXRfcGFnZShwYWdlKTsKK30KKwogdm9pZCBrdm1f
cmVsZWFzZV9wYWdlX2NsZWFuKHN0cnVjdCBwYWdlICpwYWdlKTsKIHZvaWQga3ZtX3JlbGVhc2Vf
cGFnZV9kaXJ0eShzdHJ1Y3QgcGFnZSAqcGFnZSk7CiAKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5
OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
