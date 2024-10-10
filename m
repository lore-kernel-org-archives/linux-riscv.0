Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F42CFC5F2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZISHIOh7PKZSM010FEmz6WQlRhjPbD0QuQpOZQKtpw=; b=lChnRJ6BWFvMq0
	SURsxtzZxEDJkGwbH8AYKM14tgNR20gaSIYLIi/hHX7z65JsyjdGrcTqP9OswWL7VXIWqXf12P+az
	xfjm6q/dLqsxmUZQ537iTwZYRYI2Z/vUzt89tI1cYKlgXQe7x2qtTWZ9/rChBaMCWB7+QxAzxy8qF
	tgp/VzBposOhCMVE8Igj5n+gtRufoHfg1+JPsnwgOqyzSRPlWqLSer1EPy19jYyBbRELqh6dFhi9F
	YYBB0RqNcOow+nhmrt+DttoFPIS+xnLrxx53Im0tDCcpfNoPXG1v4LnukLo85xvu1ne7Uht1qeDfh
	MGfOzavaqYqjPk2KtN2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyB6-0000000Dyxs-3kTW;
	Thu, 10 Oct 2024 18:46:24 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqu-0000000Dq6T-2SNy
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2e2d3d5fb4eso896236a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584731; x=1729189531; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxFe7qyo4eHIzhTxczhq6OF5aBNVD8CbU/vq6HHGwtQ=;
        b=awdZis4GuboE2s97liIxH2HBWuUUAZFAC1GR5LT8PbnEmXHC9BSez0m6ZP3mLwxKXM
         lQ1MevXxzALb1FlxY1y77fDO1z/yeM3kTyp/oML38Xu6q7A/SmpXpmWj9OE6Ic2oUvpP
         G6PcEUHqZ9s82F1e4DgelmyGmWvUWCcrjUMNuBi8hYHZqkdUNNzyDmqRS5imgnmSEsOe
         Hwlj5C1c37+lD1ZhDMZabp8YATzJcOtF5IR98HGQw71sfkFR7KqlyyliLqBRHmcynxCc
         mZz4ZlNs/pnaJQjzxt1mqttaEDYAWQ4/MDsqxIKf+BKKwPrQIijYa3xjhuw1Sz7YKV2J
         6Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584731; x=1729189531;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxFe7qyo4eHIzhTxczhq6OF5aBNVD8CbU/vq6HHGwtQ=;
        b=ZUr0sc5uah7Urg889IofNDiPZ8dHUaESDnpg6j6F8re7BBRgz79rozFwvKTujOETA6
         buiRnqZrvKWM8Tv3kplqDCLajKbeEx088f5nlJCMSSS++rL5k8LUcDZRqUGditu+QVFL
         601Rbj8oLiFOM88NIgjxl3dtoCCksDWFVdkBB1xpfmDauJZnFLlWMGckiIP3IGX6P2+x
         9+Ki0wYQUB4C5s1QW0Ijdxl5iKunwgTZH2bajS/WAer7jxPA1xwLvwUzVQBoeTu0BLwU
         4VU58uhQu8rSqeq+HiByrxAWtd/aNi1HmP17NCUfzKHiJYoXDl2YUBIoozPDD57QUChk
         YJ9w==
X-Forwarded-Encrypted: i=1; AJvYcCWRvfz/1Gw08LMqH4yZllVqYJKn4YiRARPjUZVttKkmjm3wF+Ib2ktKf3YnteyF3xFd5wAtQgbp8TOisA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyesBbOpOAAc3IWgJv3y9GV11pdG3qtxLgaMd/WH0fDOdPWgZOJ
	381wptrjErWEDfIV7E5NBCXgRndQOcm+loYdxFNz1onSomHbZQBFKBOafrmUWiqVIoO1h0AMx71
	9qQ==
X-Google-Smtp-Source: AGHT+IGFsZ8G+8oqHMXYnd6l/b9oSo3/s957bEBlaeuh+YsQIWv/Tzia2RQhXQw4+rIMPn/3epGKWmgCn2Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:5107:b0:2e2:ca3e:10fe with SMTP id
 98e67ed59e1d1-2e2f0f88a54mr20a91.8.1728584729847; Thu, 10 Oct 2024 11:25:29
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:20 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-19-seanjc@google.com>
Subject: [PATCH v13 18/85] KVM: Drop unused "hva" pointer from __gfn_to_pfn_memslot()
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
X-CRM114-CacheID: sfid-20241010_112532_804653_6AA7290C 
X-CRM114-Status: GOOD (  11.64  )
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

RHJvcCBAaHZhIGZyb20gX19nZm5fdG9fcGZuX21lbXNsb3QoKSBub3cgdGhhdCBhbGwgY2FsbGVy
cyBwYXNzIE5VTEwuCgpObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KClRlc3RlZC1ieTog
QWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFu
IENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL2FybTY0L2t2bS9t
bXUuYyAgICAgICAgICAgICAgICAgICB8IDIgKy0KIGFyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0
X21tdV9odi5jICAgIHwgMiArLQogYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfNjRfbW11X3JhZGl4
LmMgfCAyICstCiBhcmNoL3g4Ni9rdm0vbW11L21tdS5jICAgICAgICAgICAgICAgICB8IDYgKyst
LS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICAgICAgICB8IDIgKy0KIHZpcnQv
a3ZtL2t2bV9tYWluLmMgICAgICAgICAgICAgICAgICAgIHwgOSArKystLS0tLS0KIDYgZmlsZXMg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2t2bS9tbXUuYyBiL2FyY2gvYXJtNjQva3ZtL21tdS5jCmluZGV4IGE2ZTYyY2M5
MDE1Yy4uZGQyMjE1ODdmY2NhIDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L2t2bS9tbXUuYworKysg
Yi9hcmNoL2FybTY0L2t2bS9tbXUuYwpAQCAtMTU3MCw3ICsxNTcwLDcgQEAgc3RhdGljIGludCB1
c2VyX21lbV9hYm9ydChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHBoeXNfYWRkcl90IGZhdWx0X2lw
YSwKIAltbWFwX3JlYWRfdW5sb2NrKGN1cnJlbnQtPm1tKTsKIAogCXBmbiA9IF9fZ2ZuX3RvX3Bm
bl9tZW1zbG90KG1lbXNsb3QsIGdmbiwgZmFsc2UsIE5VTEwsCi0JCQkJICAgd3JpdGVfZmF1bHQs
ICZ3cml0YWJsZSwgTlVMTCk7CisJCQkJICAgd3JpdGVfZmF1bHQsICZ3cml0YWJsZSk7CiAJaWYg
KHBmbiA9PSBLVk1fUEZOX0VSUl9IV1BPSVNPTikgewogCQlrdm1fc2VuZF9od3BvaXNvbl9zaWdu
YWwoaHZhLCB2bWFfc2hpZnQpOwogCQlyZXR1cm4gMDsKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9rdm0vYm9vazNzXzY0X21tdV9odi5jIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfNjRfbW11
X2h2LmMKaW5kZXggOGNkMDJjYTRiMWI4Li4yZjFkNTg5ODRiNDEgMTAwNjQ0Ci0tLSBhL2FyY2gv
cG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9odi5jCisrKyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9v
azNzXzY0X21tdV9odi5jCkBAIC02MTQsNyArNjE0LDcgQEAgaW50IGt2bXBwY19ib29rM3NfaHZf
cGFnZV9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJfSBlbHNlIHsKIAkJLyogQ2FsbCBL
Vk0gZ2VuZXJpYyBjb2RlIHRvIGRvIHRoZSBzbG93LXBhdGggY2hlY2sgKi8KIAkJcGZuID0gX19n
Zm5fdG9fcGZuX21lbXNsb3QobWVtc2xvdCwgZ2ZuLCBmYWxzZSwgTlVMTCwKLQkJCQkJICAgd3Jp
dGluZywgJndyaXRlX29rLCBOVUxMKTsKKwkJCQkJICAgd3JpdGluZywgJndyaXRlX29rKTsKIAkJ
aWYgKGlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSkKIAkJCXJldHVybiAtRUZBVUxUOwogCQlwYWdl
ID0gTlVMTDsKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9yYWRp
eC5jIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfNjRfbW11X3JhZGl4LmMKaW5kZXggMjZhOTY5
ZTkzNWUzLi44MzA0YjZmOGZlNDUgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNz
XzY0X21tdV9yYWRpeC5jCisrKyBiL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9yYWRp
eC5jCkBAIC04NTMsNyArODUzLDcgQEAgaW50IGt2bXBwY19ib29rM3NfaW5zdGFudGlhdGVfcGFn
ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAKIAkJLyogQ2FsbCBLVk0gZ2VuZXJpYyBjb2RlIHRv
IGRvIHRoZSBzbG93LXBhdGggY2hlY2sgKi8KIAkJcGZuID0gX19nZm5fdG9fcGZuX21lbXNsb3Qo
bWVtc2xvdCwgZ2ZuLCBmYWxzZSwgTlVMTCwKLQkJCQkJICAgd3JpdGluZywgdXBncmFkZV9wLCBO
VUxMKTsKKwkJCQkJICAgd3JpdGluZywgdXBncmFkZV9wKTsKIAkJaWYgKGlzX2Vycm9yX25vc2xv
dF9wZm4ocGZuKSkKIAkJCXJldHVybiAtRUZBVUxUOwogCQlwYWdlID0gTlVMTDsKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCmluZGV4
IGM2NzIyOGI0NmJkNS4uMjhmMmI4NDJkNmNhIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11
L21tdS5jCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKQEAgLTQzNzcsOCArNDM3Nyw3IEBA
IHN0YXRpYyBpbnQgX19rdm1fZmF1bHRpbl9wZm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1
Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0CiAJCXJldHVybiBrdm1fZmF1bHRpbl9wZm5fcHJpdmF0
ZSh2Y3B1LCBmYXVsdCk7CiAKIAlmYXVsdC0+cGZuID0gX19nZm5fdG9fcGZuX21lbXNsb3QoZmF1
bHQtPnNsb3QsIGZhdWx0LT5nZm4sIGZhbHNlLCB0cnVlLAotCQkJCQkgIGZhdWx0LT53cml0ZSwg
JmZhdWx0LT5tYXBfd3JpdGFibGUsCi0JCQkJCSAgTlVMTCk7CisJCQkJCSAgZmF1bHQtPndyaXRl
LCAmZmF1bHQtPm1hcF93cml0YWJsZSk7CiAKIAkvKgogCSAqIElmIHJlc29sdmluZyB0aGUgcGFn
ZSBmYWlsZWQgYmVjYXVzZSBJL08gaXMgbmVlZGVkIHRvIGZhdWx0LWluIHRoZQpAQCAtNDQwNiw4
ICs0NDA1LDcgQEAgc3RhdGljIGludCBfX2t2bV9mYXVsdGluX3BmbihzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHN0cnVjdCBrdm1fcGFnZV9mYXVsdCAqZmF1bHQKIAkgKiBnZXQgYSBwYWdlIGFuZCBh
IGZhdGFsIHNpZ25hbCwgaS5lLiBTSUdLSUxMLCBpcyBwZW5kaW5nLgogCSAqLwogCWZhdWx0LT5w
Zm4gPSBfX2dmbl90b19wZm5fbWVtc2xvdChmYXVsdC0+c2xvdCwgZmF1bHQtPmdmbiwgdHJ1ZSwg
dHJ1ZSwKLQkJCQkJICBmYXVsdC0+d3JpdGUsICZmYXVsdC0+bWFwX3dyaXRhYmxlLAotCQkJCQkg
IE5VTEwpOworCQkJCQkgIGZhdWx0LT53cml0ZSwgJmZhdWx0LT5tYXBfd3JpdGFibGUpOwogCXJl
dHVybiBSRVRfUEZfQ09OVElOVUU7CiB9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3Zt
X2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAppbmRleCAwNzFhMGExZjFjNjAuLmNi
YzdiOWMwNGMxNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCisrKyBiL2lu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaApAQCAtMTIzNSw3ICsxMjM1LDcgQEAga3ZtX3Bmbl90IGdm
bl90b19wZm5fcHJvdChzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgYm9vbCB3cml0ZV9mYXVs
dCwKIGt2bV9wZm5fdCBnZm5fdG9fcGZuX21lbXNsb3QoY29uc3Qgc3RydWN0IGt2bV9tZW1vcnlf
c2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuKTsKIGt2bV9wZm5fdCBfX2dmbl90b19wZm5fbWVtc2xvdChj
b25zdCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4sCiAJCQkgICAgICAg
Ym9vbCBpbnRlcnJ1cHRpYmxlLCBib29sIG5vX3dhaXQsCi0JCQkgICAgICAgYm9vbCB3cml0ZV9m
YXVsdCwgYm9vbCAqd3JpdGFibGUsIGh2YV90ICpodmEpOworCQkJICAgICAgIGJvb2wgd3JpdGVf
ZmF1bHQsIGJvb2wgKndyaXRhYmxlKTsKIAogdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4oa3Zt
X3Bmbl90IHBmbik7CiB2b2lkIGt2bV9yZWxlYXNlX3Bmbl9kaXJ0eShrdm1fcGZuX3QgcGZuKTsK
ZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmlu
ZGV4IGRkNTgzOWFiZWY2Yy4uMTAwNzFmMzFiMmNhIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1f
bWFpbi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTI5NjcsMTMgKzI5NjcsMTAgQEAg
a3ZtX3Bmbl90IGh2YV90b19wZm4odW5zaWduZWQgbG9uZyBhZGRyLCBib29sIGludGVycnVwdGli
bGUsIGJvb2wgbm9fd2FpdCwKIAoga3ZtX3Bmbl90IF9fZ2ZuX3RvX3Bmbl9tZW1zbG90KGNvbnN0
IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsIGdmbl90IGdmbiwKIAkJCSAgICAgICBib29s
IGludGVycnVwdGlibGUsIGJvb2wgbm9fd2FpdCwKLQkJCSAgICAgICBib29sIHdyaXRlX2ZhdWx0
LCBib29sICp3cml0YWJsZSwgaHZhX3QgKmh2YSkKKwkJCSAgICAgICBib29sIHdyaXRlX2ZhdWx0
LCBib29sICp3cml0YWJsZSkKIHsKIAl1bnNpZ25lZCBsb25nIGFkZHIgPSBfX2dmbl90b19odmFf
bWFueShzbG90LCBnZm4sIE5VTEwsIHdyaXRlX2ZhdWx0KTsKIAotCWlmIChodmEpCi0JCSpodmEg
PSBhZGRyOwotCiAJaWYgKGt2bV9pc19lcnJvcl9odmEoYWRkcikpIHsKIAkJaWYgKHdyaXRhYmxl
KQogCQkJKndyaXRhYmxlID0gZmFsc2U7CkBAIC0yOTk2LDEzICsyOTkzLDEzIEBAIGt2bV9wZm5f
dCBnZm5fdG9fcGZuX3Byb3Qoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4sIGJvb2wgd3JpdGVf
ZmF1bHQsCiAJCSAgICAgIGJvb2wgKndyaXRhYmxlKQogewogCXJldHVybiBfX2dmbl90b19wZm5f
bWVtc2xvdChnZm5fdG9fbWVtc2xvdChrdm0sIGdmbiksIGdmbiwgZmFsc2UsIGZhbHNlLAotCQkJ
CSAgICB3cml0ZV9mYXVsdCwgd3JpdGFibGUsIE5VTEwpOworCQkJCSAgICB3cml0ZV9mYXVsdCwg
d3JpdGFibGUpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoZ2ZuX3RvX3Bmbl9wcm90KTsKIAoga3Zt
X3Bmbl90IGdmbl90b19wZm5fbWVtc2xvdChjb25zdCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpz
bG90LCBnZm5fdCBnZm4pCiB7Ci0JcmV0dXJuIF9fZ2ZuX3RvX3Bmbl9tZW1zbG90KHNsb3QsIGdm
biwgZmFsc2UsIGZhbHNlLCB0cnVlLCBOVUxMLCBOVUxMKTsKKwlyZXR1cm4gX19nZm5fdG9fcGZu
X21lbXNsb3Qoc2xvdCwgZ2ZuLCBmYWxzZSwgZmFsc2UsIHRydWUsIE5VTEwpOwogfQogRVhQT1JU
X1NZTUJPTF9HUEwoZ2ZuX3RvX3Bmbl9tZW1zbG90KTsKIAotLSAKMi40Ny4wLnJjMS4yODguZzA2
Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
