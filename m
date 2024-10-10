Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7B7D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 22:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NRpCwQ37hwv4iVTTa5kooGUJM7bH9iwLl4FRi7YOwY=; b=zIYdPHbW/Od83v
	btMmgITd8JDzkHJHedCi/iK1z19bak364RPgWiMypaOtWlvFpY7m5t8/1kGjr5JJ6bAvpdteVuHT3
	/dwXJOHRP2cTDXX27uKEALtbgCRegkKKoGhV90E8drNWhHVbr8ao1GDfSI2w68ekF/9BdQ1dCozmj
	20IHPGPAi2Z0RclY5jUXkvokbbAbE4R3juCem8GbpiCx7YT6O79uiaY058uyrO8j+QgUrL74Lla6t
	FhiI2GYm4jfjddyA2ViSrtj5CWNpawIl2Ih5GuXBHLzmdqIJRmIccjT5LRKfme8ibow4qpbIsUzmy
	sP9Y8GrslxDnomJK86iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1SV-0000000EVyX-1QYe;
	Thu, 10 Oct 2024 22:16:35 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsv-0000000Drlw-0ia9
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:38 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ea07766e09so1070446a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584856; x=1729189656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04eHUk6AClz9cRMQcjlWjE46ZR1uXceY2ogFB00LGDM=;
        b=alq1Gi8IKHXoRenVXYXecNt3KC/lj7CRLd4Ivpw77cRV2hhaqmorMgi3dwBXJZi2Z3
         +oSIHdym3Kp6z1HFNs3xH8wtQWXWauU8ROxoDYovdX651koTj7r/xxKLyCYmTJRKZ2Q7
         SZ6WMuDGYO+bEyQTNVfOCYgEzHS+3cAAeAuzf6XXFt3BezmXoMSk1NB74uRtHh2g67pb
         m2KGWKyP5u4SgLIVf5Unq6dz72HfCgCIZ6QIcRV/fMvo9IuyY/oxw9iWwhx0/1tvNyg4
         NQoXsHYuYADad7JGxE3yi6t0dOyKX2LqcGYeBRRgvvWIXq3TkwikALhUOeoR75a/tGED
         uyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584856; x=1729189656;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=04eHUk6AClz9cRMQcjlWjE46ZR1uXceY2ogFB00LGDM=;
        b=cZPtGXYhZY1RT4CZ8EzYbhOASqIfPNEJAMGovMsk+2Q3T8X+/nAn5UGTud6Wquev5V
         hHqbGjldSueKn902keaUNQpIWHrUBr6cfMRobiiFEKNifXt/k0WJMZip76SnCmvw7qi5
         /sQaCl8D2+pNA+JH5jHcEus2MOoinjeF2neMqO0G+pBJkSnIklyQigzCGmMsuoXHnieA
         S6plj1hQ5U3aWH/fab2xy0pFkyJchfw9e+6SzG/czrsI+cH/rqmH+UYJ5LnjJFFhdvLD
         DvjuztQPQO8XZbBRB09NqSn++i46OktgIekgpqZnPD0+WWy/i8lwz/rkw1msfv79uZxT
         2LRA==
X-Forwarded-Encrypted: i=1; AJvYcCULxR/h/fadtts/nDOJousGL9gXbLplGxze23MhrVQ71mXhNsw5qvC1mitXS83PICLHNF1KUrGAh0KN2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKJexfdffXvd2JirHzEQMmtEYTRtethiZkR5LETni5MfEVlE5M
	WR4CJZMG+iPNCiv1gj8+uVIfJnfiU7uA73gZtueYp2n1+mxnspPm0ekzHHbiUgiKLKzRHH2BQzX
	ZGw==
X-Google-Smtp-Source: AGHT+IHGiwNd3UbnZUzPre1tk98dNYoM10q7gFGG4lq0PldsJuDm1rxMHI+g8Yc3UsVnmkzWnOurUMFmqIQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:903:41c4:b0:20c:8f78:67c9 with SMTP id
 d9443c01a7336-20c8f786946mr26385ad.5.1728584855618; Thu, 10 Oct 2024 11:27:35
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:19 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-78-seanjc@google.com>
Subject: [PATCH v13 77/85] KVM: arm64: Use __gfn_to_page() when copying MTE
 tags to/from userspace
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
X-CRM114-CacheID: sfid-20241010_112737_306723_62F8600E 
X-CRM114-Status: GOOD (  10.54  )
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

VXNlIF9fZ2ZuX3RvX3BhZ2UoKSBpbnN0ZWFkIHdoZW4gY29weWluZyBNVEUgdGFncyBiZXR3ZWVu
IGd1ZXN0IGFuZAp1c2Vyc3BhY2UuICBUaGlzIHdpbGwgZXZlbnR1YWxseSBhbGxvdyByZW1vdmlu
ZyBnZm5fdG9fcGZuX3Byb3QoKSwKZ2ZuX3RvX3BmbigpLCBrdm1fcGZuX3RvX3JlZmNvdW50ZWRf
cGFnZSgpLCBhbmQgcmVsYXRlZCBBUElzLgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPgotLS0KIGFyY2gvYXJtNjQva3ZtL2d1ZXN0LmMgfCAyMSArKysrKysr
KystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva3ZtL2d1ZXN0LmMgYi9hcmNoL2FybTY0
L2t2bS9ndWVzdC5jCmluZGV4IDk2MmY5ODU5NzdjMi4uNGNkN2ZmYTc2Nzk0IDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2t2bS9ndWVzdC5jCisrKyBiL2FyY2gvYXJtNjQva3ZtL2d1ZXN0LmMKQEAg
LTEwNTEsMjAgKzEwNTEsMTggQEAgaW50IGt2bV92bV9pb2N0bF9tdGVfY29weV90YWdzKHN0cnVj
dCBrdm0gKmt2bSwKIAl9CiAKIAl3aGlsZSAobGVuZ3RoID4gMCkgewotCQlrdm1fcGZuX3QgcGZu
ID0gZ2ZuX3RvX3Bmbl9wcm90KGt2bSwgZ2ZuLCB3cml0ZSwgTlVMTCk7CisJCXN0cnVjdCBwYWdl
ICpwYWdlID0gX19nZm5fdG9fcGFnZShrdm0sIGdmbiwgd3JpdGUpOwogCQl2b2lkICptYWRkcjsK
IAkJdW5zaWduZWQgbG9uZyBudW1fdGFnczsKLQkJc3RydWN0IHBhZ2UgKnBhZ2U7CiAKLQkJaWYg
KGlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSkgewotCQkJcmV0ID0gLUVGQVVMVDsKLQkJCWdvdG8g
b3V0OwotCQl9Ci0KLQkJcGFnZSA9IHBmbl90b19vbmxpbmVfcGFnZShwZm4pOwogCQlpZiAoIXBh
Z2UpIHsKKwkJCXJldCA9IC1FRkFVTFQ7CisJCQlnb3RvIG91dDsKKwkJfQorCisJCWlmICghcGZu
X3RvX29ubGluZV9wYWdlKHBhZ2VfdG9fcGZuKHBhZ2UpKSkgewogCQkJLyogUmVqZWN0IFpPTkVf
REVWSUNFIG1lbW9yeSAqLwotCQkJa3ZtX3JlbGVhc2VfcGZuX2NsZWFuKHBmbik7CisJCQlrdm1f
cmVsZWFzZV9wYWdlX3VudXNlZChwYWdlKTsKIAkJCXJldCA9IC1FRkFVTFQ7CiAJCQlnb3RvIG91
dDsKIAkJfQpAQCAtMTA3OCw3ICsxMDc2LDcgQEAgaW50IGt2bV92bV9pb2N0bF9tdGVfY29weV90
YWdzKHN0cnVjdCBrdm0gKmt2bSwKIAkJCQkvKiBObyB0YWdzIGluIG1lbW9yeSwgc28gd3JpdGUg
emVyb3MgKi8KIAkJCQludW1fdGFncyA9IE1URV9HUkFOVUxFU19QRVJfUEFHRSAtCiAJCQkJCWNs
ZWFyX3VzZXIodGFncywgTVRFX0dSQU5VTEVTX1BFUl9QQUdFKTsKLQkJCWt2bV9yZWxlYXNlX3Bm
bl9jbGVhbihwZm4pOworCQkJa3ZtX3JlbGVhc2VfcGFnZV9jbGVhbihwYWdlKTsKIAkJfSBlbHNl
IHsKIAkJCS8qCiAJCQkgKiBPbmx5IGxvY2tpbmcgdG8gc2VyaWFsaXNlIHdpdGggYSBjb25jdXJy
ZW50CkBAIC0xMDkzLDggKzEwOTEsNyBAQCBpbnQga3ZtX3ZtX2lvY3RsX210ZV9jb3B5X3RhZ3Mo
c3RydWN0IGt2bSAqa3ZtLAogCQkJaWYgKG51bV90YWdzICE9IE1URV9HUkFOVUxFU19QRVJfUEFH
RSkKIAkJCQltdGVfY2xlYXJfcGFnZV90YWdzKG1hZGRyKTsKIAkJCXNldF9wYWdlX210ZV90YWdn
ZWQocGFnZSk7Ci0KLQkJCWt2bV9yZWxlYXNlX3Bmbl9kaXJ0eShwZm4pOworCQkJa3ZtX3JlbGVh
c2VfcGFnZV9kaXJ0eShwYWdlKTsKIAkJfQogCiAJCWlmIChudW1fdGFncyAhPSBNVEVfR1JBTlVM
RVNfUEVSX1BBR0UpIHsKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
