Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CBED2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQ8DHeflOylF45oiu9ZHJAwAS/KUwYy+XkcIDC57qnA=; b=pt5Ud8GZY2pPhy
	JyPIy+M6F8Vq3f4YXBfn+1kE2T9JEOHD5DjOPuZ0lUGNgHsxtshOa8s+WGe+KuaAQ83E8DzefvV0J
	lWjc6eKVkeXZ+sYS4kzSpWo/urC4ivltxndryYZjFAH8xSaA3SEliWfXcr/ADPBov51BO+fQjTo17
	l83fFAorVxsjmPaVu3jsrXjUcPio4F3XJ0cDp77TqQbEdKo6S4fex4+eblN7IN1vMi6GeAU853SSV
	OiOdX/5BdZMsIeaW6yfE8Yyr1lCxBH0JeD11RSzyg+Am19usCorTy/6bMaAx+05/FOpAtT1J5i5jo
	I4IaKR3xSqioFdtpCjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0WM-0000000ENYx-2MVw;
	Thu, 10 Oct 2024 21:16:30 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrM-0000000DqUA-2Hya
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:02 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7163489149fso1214841a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584759; x=1729189559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VITkHk6wYCk30qmAXnWfpQxFdItqbxje0xl/TrLgm28=;
        b=DDGV/BA9cByk02/tA4Cb/+AgaPSPEwimwcElwsHI1jiRIZELRkjDSYk3e7ZNGCv0X6
         Xi76UfOwi0uHKt2IJK3aT1JjYxjdtbyaBwyAnFT3U3gn/rBV0L9eCzkzxmRa04PKCjLe
         ArtEmn/ENFhUYin/BrtkhAGwGmHDMtR6KKmWPoh91MCyGM2EwU8EoTsRgoFMiTVWqisT
         3pgL2ELhDC4PmAeoYGgmfJl21pGh+O/G6/I+7+8SOGtDtuMlcFEKqLEi0Hi7fzSGVvFB
         ySrMi7ysavXcWJMDfUQY4qfyFR54JIxt96ot/kZsE2L9OD6Z1BG2yOcBh05vKntTesz9
         ibPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584759; x=1729189559;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VITkHk6wYCk30qmAXnWfpQxFdItqbxje0xl/TrLgm28=;
        b=QSKjwpOQAXNDEmfWtG/nshIqA5NRUHbEH1IareW+0oLsoIcmupUz0WyFEwa8byhrCn
         orG98rmHjQQkF1YR020+FMixFJj1a5JPOCZormO3cBEjVXEh5HPhy90/ZZ+3F1JKwyGz
         SRVeYFqnVsPt9HcuUFb7LDgfRlL1NHAQYSAwSWh7Z3yz569NkAC3rgCO0tZinLpj5rUi
         8P2EJzs7DqDS94KNd23qONVzEXrTQ5pJdn9gyGrSnohoLDjIRGUH8Iwa6SQ0iBFYSExh
         g/QchLuDbzPJHJe+IrZX8ionovfNL2fIM0vZMVdZtCEHXnNM58d5C39CcJbd6mBFi2S8
         1Zeg==
X-Forwarded-Encrypted: i=1; AJvYcCU2vL64rECyobXzCBN4YFXK62qBYTAmw0jBPKaPIiLy8MgwKJDF0liEA4zv4MLSs2UzFO+7KaZla8l3YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl6iKFst4xEG5GRmTHMA4QhntEhsXzUllgtyi2SxoCkI2c2trw
	vhOTQZMLAWcY8bVCaz07vCLVT2wTQZenLwXmQolF5jyK6IzJYt5O42gdWuPuIDumEVzlzPW6YlR
	RKg==
X-Google-Smtp-Source: AGHT+IEekecUM0XVWoBmNjTczqp1a2/ixTMw1fOAmBrSm/Dp9XgHLEkyd54mJG+SlDPSB0szYk/zKOq5dxU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a65:678f:0:b0:7e9:f98c:e9f7 with SMTP id
 41be03b00d2f7-7ea5359ed14mr32a12.10.1728584759044; Thu, 10 Oct 2024 11:25:59
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:34 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-33-seanjc@google.com>
Subject: [PATCH v13 32/85] KVM: nVMX: Mark vmcs12's APIC access page dirty
 when unmapping
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
X-CRM114-CacheID: sfid-20241010_112600_692670_87095319 
X-CRM114-Status: GOOD (  11.27  )
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

TWFyayB0aGUgQVBJQyBhY2Nlc3MgcGFnZSBhcyBkaXJ0eSB3aGVuIHVubWFwcGluZyBpdCBmcm9t
IEtWTS4gIFRoZSBmYWN0CnRoYXQgdGhlIHBhZ2UgX3Nob3VsZG4ndF8gYmUgd3JpdHRlbiBkb2Vz
bid0IGd1YXJhbnRlZSB0aGUgcGFnZSBfd29uJ3RfIGJlCndyaXR0ZW4uICBBbmQgd2hpbGUgdGhl
IGNvbnRlbnRzIGFyZSBsaWtlbHkgaXJyZWxldmFudCwgdGhlIHZhbHVlcyBfYXJlXwp2aXNpYmxl
IHRvIHRoZSBndWVzdCwgaS5lLiBkcm9wcGluZyB3cml0ZXMgd291bGQgYmUgdmlzaWJsZSB0byB0
aGUgZ3Vlc3QKKHRob3VnaCBvYnZpb3VzbHkgaGlnaGx5IHVubGlrZWx5IHRvIGJlIHByb2JsZW1h
dGljIGluIHByYWN0aWNlKS4KCk1hcmtpbmcgdGhlIG1hcCBkaXJ0eSB3aWxsIGFsbG93IHNwZWNp
ZnlpbmcgdGhlIHdyaXRlIHZzLiByZWFkLW9ubHkgd2hlbgoqbWFwcGluZyogdGhlIG1lbW9yeSwg
d2hpY2ggaW4gdHVybiB3aWxsIGFsbG93IGNyZWF0aW5nIHJlYWQtb25seSBtYXBzLgoKVGVzdGVk
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgotLS0KIGFyY2gveDg2L2t2
bS92bXgvbmVzdGVkLmMgfCA3ICstLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L25lc3RlZC5j
IGIvYXJjaC94ODYva3ZtL3ZteC9uZXN0ZWQuYwppbmRleCA4MTg2NWRiMThlMTIuLmZmODNiNTZm
ZTJmYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC9uZXN0ZWQuYworKysgYi9hcmNoL3g4
Ni9rdm0vdm14L25lc3RlZC5jCkBAIC0zMTgsMTIgKzMxOCw3IEBAIHN0YXRpYyB2b2lkIG5lc3Rl
ZF9wdXRfdm1jczEyX3BhZ2VzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlzdHJ1Y3QgdmNw
dV92bXggKnZteCA9IHRvX3ZteCh2Y3B1KTsKIAotCS8qCi0JICogVW5waW4gcGh5c2ljYWwgbWVt
b3J5IHdlIHJlZmVycmVkIHRvIGluIHRoZSB2bWNzMDIuICBUaGUgQVBJQyBhY2Nlc3MKLQkgKiBw
YWdlJ3MgYmFja2luZyBwYWdlICh5ZWFoLCBjb25mdXNpbmcpIHNob3VsZG4ndCBhY3R1YWxseSBi
ZSBhY2Nlc3NlZCwKLQkgKiBhbmQgaWYgaXQgaXMgd3JpdHRlbiwgdGhlIGNvbnRlbnRzIGFyZSBp
cnJlbGV2YW50LgotCSAqLwotCWt2bV92Y3B1X3VubWFwKHZjcHUsICZ2bXgtPm5lc3RlZC5hcGlj
X2FjY2Vzc19wYWdlX21hcCwgZmFsc2UpOworCWt2bV92Y3B1X3VubWFwKHZjcHUsICZ2bXgtPm5l
c3RlZC5hcGljX2FjY2Vzc19wYWdlX21hcCwgdHJ1ZSk7CiAJa3ZtX3ZjcHVfdW5tYXAodmNwdSwg
JnZteC0+bmVzdGVkLnZpcnR1YWxfYXBpY19tYXAsIHRydWUpOwogCWt2bV92Y3B1X3VubWFwKHZj
cHUsICZ2bXgtPm5lc3RlZC5waV9kZXNjX21hcCwgdHJ1ZSk7CiAJdm14LT5uZXN0ZWQucGlfZGVz
YyA9IE5VTEw7Ci0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
