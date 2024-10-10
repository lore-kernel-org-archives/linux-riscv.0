Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AA0D2445F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dW+Fh8FAoNei6ky5ikVWn0yswrmuSqK7sgohu7H5ROw=; b=jykd/8ISz/djVG
	InzZ7LxBbT5jIPvfa6g0eGXzHO/DU+UchFh2XlbN74qf4+A4oOl9FXfwmrFGvaxeRwBB3XcsmQYWU
	GbB7Eqjeq2PjYVzYJFPiUz72pS8Rd/zoowlew+oqMmYkzMozogdW1GRVwClDlxIMZbmvNx+lM82Ix
	nKmnaygEC6y/IsVDDKBgDXdRHhhb4zwI0gIO22rJ31xGX0evaqHCi+hbtkVvh4k3CNTkh6F9hfHB2
	A15CaQTgv6olIF5kSMBSK/pD2Rmf7pe3BjGP17xngXmhHVJd2NPPoXSmu0Lj+j7N1KkhZAbMghjvy
	VHW2dtKnzgkiMCk63Dbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2d0-0000000Ef4t-0f1L;
	Thu, 10 Oct 2024 23:31:30 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrh-0000000Dqko-0FBc
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:22 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e026caf8bso1466238b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584780; x=1729189580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DwvYXI8CmE5CO0Ycvk+EgdgF52vTMi74FFh8TONwA8=;
        b=4QzPzbH+y3h+qIy3AOczqs89mCTm26A8Xmw0N0dOgewGXg9A6oNEwweMsZb+ojs0A+
         /oaXqPla6lblPPbLsCeAkMWE0ipPJUeX7/BMJCeUmSAFOBCsBqR9tEnyG6dtvMhnmUoa
         icT7EjStSrVntpraIZTjudeYgVzDZgDSb8Ozn3GE9fd2lwS76/qNcWlYT5VV3157N2U3
         boorlU+iazI5EA8U+PS7+8dAzQPprqHAb+bDJ23cP+mz4Fe98+JO8wzksaoGlcC6sRxS
         GoaOsto/Zr0ovDqlpn2iqeKujfmzR03yyd8aPIXxNhya6wLqUx9xXzeU/hX0itI/QzVu
         Is8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584780; x=1729189580;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DwvYXI8CmE5CO0Ycvk+EgdgF52vTMi74FFh8TONwA8=;
        b=a4hQ8heLfDq8ElEvHefSYuedvWWh/5wQp0och4xeWa/JN/hLq4I04BOkD5CbPfpvev
         +2jnYDCxzV0yysd2GayPonB+xiIA5ZATui9mjCH5hDFsGsHDjNXLepZ0o7Li+Lf7Cc/B
         OxZ6l4q89PfwveIVEBJDB//UIJWGIyrZA8LPUkwda6f1sKv1aq3lAjsWyTCo3LO7SbfA
         VlEypaVVBzmr7OpgSN3f7nvvJD9bFHxn0cInb6T1oa3MiAdjp93Ht2topFEAZeZgTKeX
         xzoB0OFLyygy9XgrNKhFvE/uRjQtSrAIb4aKaxtbQ1/3dtHaupA35Y5kRjpzInllyV4t
         1YBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/imTQpYySRpBBo0fkHvdSXXLS/r74MlKfgj7TdO2EY9GJN+mSTBHO2sY1kMpkqpXGA/3NBOVX81wgPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1yo2hLPfSv9J9rOd8YS3qDAardAqZgOS2XfyLWk6Gj2EdbFzn
	hgkbRBeG0HEd2xfBaqMISkDqq+ak3KJcO48VScCJyOw0hYim0mI8D5ZMdpQEPLxQFFp5+7TAQZK
	Ngg==
X-Google-Smtp-Source: AGHT+IG3pPvsekcqYnotExeZVZUXEYlJLq+6e3a1eutYJX4gtVKcKQbhJKMNrxmpaRIGMBxtyW/kZ/ByL14=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:91a3:b0:71d:fb06:e79b with SMTP id
 d2e1a72fcca58-71e37c53abamr28b3a.0.1728584779496; Thu, 10 Oct 2024 11:26:19
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:44 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-43-seanjc@google.com>
Subject: [PATCH v13 42/85] KVM: Move declarations of memslot accessors up in kvm_host.h
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
X-CRM114-CacheID: sfid-20241010_112621_190530_612F6579 
X-CRM114-Status: UNSURE (   8.26  )
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

TW92ZSB0aGUgbWVtc2xvdCBsb29rdXAgaGVscGVycyBmdXJ0aGVyIHVwIGluIGt2bV9ob3N0Lmgg
c28gdGhhdCB0aGV5IGNhbgpiZSB1c2VkIGJ5IGlubGluZWQgInRvIHBmbiIgd3JhcHBlcnMuCgpO
byBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxh
bGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29u
IDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCA4ICsr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaAppbmRleCA5MjYzMzc1ZDAzNjIuLjM0NmJmZWYxNGU1YSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAt
MTE2OCw2ICsxMTY4LDEwIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1fbWVtc2xvdF9pdGVyX2lz
X3ZhbGlkKHN0cnVjdCBrdm1fbWVtc2xvdF9pdGVyICppdGVyLCBnZm5fCiAJICAgICBrdm1fbWVt
c2xvdF9pdGVyX2lzX3ZhbGlkKGl0ZXIsIGVuZCk7CQkJXAogCSAgICAga3ZtX21lbXNsb3RfaXRl
cl9uZXh0KGl0ZXIpKQogCitzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpnZm5fdG9fbWVtc2xvdChz
dHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbik7CitzdHJ1Y3Qga3ZtX21lbXNsb3RzICprdm1fdmNw
dV9tZW1zbG90cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqa3ZtX3ZjcHVfZ2ZuX3RvX21lbXNsb3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBn
Zm4pOworCiAvKgogICogS1ZNX1NFVF9VU0VSX01FTU9SWV9SRUdJT04gaW9jdGwgYWxsb3dzIHRo
ZSBmb2xsb3dpbmcgb3BlcmF0aW9uczoKICAqIC0gY3JlYXRlIGEgbmV3IG1lbW9yeSBzbG90CkBA
IC0xMzAzLDE1ICsxMzA3LDEzIEBAIGludCBrdm1fZ2ZuX3RvX2h2YV9jYWNoZV9pbml0KHN0cnVj
dCBrdm0gKmt2bSwgc3RydWN0IGdmbl90b19odmFfY2FjaGUgKmdoYywKIH0pCiAKIGludCBrdm1f
Y2xlYXJfZ3Vlc3Qoc3RydWN0IGt2bSAqa3ZtLCBncGFfdCBncGEsIHVuc2lnbmVkIGxvbmcgbGVu
KTsKLXN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKmdmbl90b19tZW1zbG90KHN0cnVjdCBrdm0gKmt2
bSwgZ2ZuX3QgZ2ZuKTsKIGJvb2wga3ZtX2lzX3Zpc2libGVfZ2ZuKHN0cnVjdCBrdm0gKmt2bSwg
Z2ZuX3QgZ2ZuKTsKIGJvb2wga3ZtX3ZjcHVfaXNfdmlzaWJsZV9nZm4oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBnZm5fdCBnZm4pOwogdW5zaWduZWQgbG9uZyBrdm1faG9zdF9wYWdlX3NpemUoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4pOwogdm9pZCBtYXJrX3BhZ2VfZGlydHlfaW5f
c2xvdChzdHJ1Y3Qga3ZtICprdm0sIGNvbnN0IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNs
b3QsIGdmbl90IGdmbik7CiB2b2lkIG1hcmtfcGFnZV9kaXJ0eShzdHJ1Y3Qga3ZtICprdm0sIGdm
bl90IGdmbik7CiAKLXN0cnVjdCBrdm1fbWVtc2xvdHMgKmt2bV92Y3B1X21lbXNsb3RzKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSk7Ci1zdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICprdm1fdmNwdV9nZm5f
dG9fbWVtc2xvdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90IGdmbik7CisKIGt2bV9wZm5f
dCBrdm1fdmNwdV9nZm5fdG9fcGZuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ2ZuX3QgZ2ZuKTsK
IAogaW50IF9fa3ZtX3ZjcHVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgZ3BhX3QgZ3BhLCBz
dHJ1Y3Qga3ZtX2hvc3RfbWFwICptYXAsCi0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThkMTUyNS1n
b29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
