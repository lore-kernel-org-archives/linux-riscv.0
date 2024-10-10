Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91945CFC5F2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5houM4/91BqBg/I9WhJjEW5YAABULlgdtpi5KpWhjuU=; b=VM3AVo4Z3kTPRh
	PC+hewxmRqrEwirf77WC9LZ6P4R+yISZtr++P7vj8qDX2e98AhDKmZmU1nO18mfA7jWYypSC4pHt4
	2Sv/QTz8WhmxEyOg9nosAl7vTWYs5a1wbzBxXOgNMsoSAlIUrFx9azL8ivAayJCkepqAUQcMTTJak
	fHpRe/3dn7yIoNMFkVCLwHbPVU/rEOiEq9C9WhzciwMZ2/jq44C0H3U7lJFt+WBhnWI/aBpxTQccm
	SQewORgjTZUbB4VPdIj+B6wOoKB8I4pIRyrfBPpbxraAA1J5RhP3VpOf8nBAXFN4Iw53HVdoxVhGR
	tnU5F33PLGyiIoscWAuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy9S-0000000Dyc0-1wDW;
	Thu, 10 Oct 2024 18:44:42 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqs-0000000Dq3k-0957
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:32 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20bb491189aso16352695ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584728; x=1729189528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N9i4qcLR1M4w0icoJwy+0qPwifBeFycVmWqg2S4YD0=;
        b=uTLUXAD9ftwOAWUh4FjktczO89FGu52aC2rgPp245/lEj1s72YqNR/aIDgmovpnjTw
         HC3jnAk/7L5Fa0FkPdQPqU2qvNP/FCS9jm5l9QtDKCjIYexrNMlJ6rHK9Qh90mNdQ0gz
         pQWmLtmO5UuB7V2fnKZL8l7u3utIoX9wgdz/yAcJ39cWN1i86vKz12XVoNvrTXzGldva
         +W7MUjeaG2WCz28YEVABAqFpH18qx4ouR3U+t7I7QQtA6vEwM/KTV5fdtXtHIk2RZ3nO
         0lFQqywKjsqrELmkNAOSZ4dPDOMCodBq3cSpkUx60Gsb4fkH4CB5l/Bi/Eiawj8f3uVP
         IPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584728; x=1729189528;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5N9i4qcLR1M4w0icoJwy+0qPwifBeFycVmWqg2S4YD0=;
        b=qOIOZRJWYsW4DPTLRgoiUN9GopYdbY9C78gQq6KDs350utzXFg/fLHZbP0Fw4rixTF
         Ss4auiG5IjBJ0BHgX9PHbRFyQQ25FjjgoiMtcAUCUNahE51GkyxvT+79E4apwFw83j8P
         95Ry9DVRosiqOtkmoHnw8Ta7+wsLViGASZyzZdDEibGQYMb+O5ZQAgSX4uuBSbie0I2Q
         kS93xoYNMxPu60MMUkHOaqlFwXZU6ZcZyKZscvaBA2N7Vj6wSYvQkpsAgk3X27iSd5JY
         E0vPZ8RlA51niHtE+q6QdL8hPE67ardZNo3/J7nuLO4dti5p5sCzEB16aWU7K8sVie5w
         oZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCV01E42VtifZK6H1ttRp/lBXQEidqVqNUmW7+cEpZGzhozJbAMdE0pOAphfnsYwiRuyseIKR0QTZzGmpg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSXUeetlVfBcwUHZ3AMD5dk19ZZVdYlq9Snp3gj5AiUuK0wZZ2
	imQGSAcmjB4/GIQRvuDdWQbeMt45Ed8L7j0RyYCASghyMamLq8KFqsn5O6xvceG0y3nXXgwqVCG
	uoA==
X-Google-Smtp-Source: AGHT+IHx3wOCIkhIacFyS0KkUCfogOtyOnmQIp9NOdA3rn83blMwYV/7exbhoH/uHIfky6alS3vCfOjmfpM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:d502:b0:20b:7ece:3225 with SMTP id
 d9443c01a7336-20c6358fdd3mr1169885ad.0.1728584727745; Thu, 10 Oct 2024
 11:25:27 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:19 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-18-seanjc@google.com>
Subject: [PATCH v13 17/85] KVM: x86/mmu: Drop kvm_page_fault.hva, i.e. don't
 track intermediate hva
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
X-CRM114-CacheID: sfid-20241010_112530_201107_4C97ADFC 
X-CRM114-Status: GOOD (  11.32  )
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

UmVtb3ZlIGt2bV9wYWdlX2ZhdWx0Lmh2YSBhcyBpdCBpcyBuZXZlciByZWFkLCBvbmx5IHdyaXR0
ZW4uICBUaGlzIHdpbGwKYWxsb3cgcmVtb3ZpbmcgdGhlIEBodmEgcGFyYW0gZnJvbSBfX2dmbl90
b19wZm5fbWVtc2xvdCgpLgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29n
bGUuY29tPgotLS0KIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgICAgICAgICAgfCA1ICsrLS0tCiBh
cmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3Zt
L21tdS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKaW5kZXggZmE4ZjNmYjdjMTRiLi5j
NjcyMjhiNDZiZDUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKKysrIGIvYXJj
aC94ODYva3ZtL21tdS9tbXUuYwpAQCAtMzI5NCw3ICszMjk0LDYgQEAgc3RhdGljIGludCBrdm1f
aGFuZGxlX25vc2xvdF9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJZmF1bHQtPnNsb3Qg
PSBOVUxMOwogCWZhdWx0LT5wZm4gPSBLVk1fUEZOX05PU0xPVDsKIAlmYXVsdC0+bWFwX3dyaXRh
YmxlID0gZmFsc2U7Ci0JZmF1bHQtPmh2YSA9IEtWTV9IVkFfRVJSX0JBRDsKIAogCS8qCiAJICog
SWYgTU1JTyBjYWNoaW5nIGlzIGRpc2FibGVkLCBlbXVsYXRlIGltbWVkaWF0ZWx5IHdpdGhvdXQK
QEAgLTQzNzksNyArNDM3OCw3IEBAIHN0YXRpYyBpbnQgX19rdm1fZmF1bHRpbl9wZm4oc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0CiAKIAlmYXVsdC0+
cGZuID0gX19nZm5fdG9fcGZuX21lbXNsb3QoZmF1bHQtPnNsb3QsIGZhdWx0LT5nZm4sIGZhbHNl
LCB0cnVlLAogCQkJCQkgIGZhdWx0LT53cml0ZSwgJmZhdWx0LT5tYXBfd3JpdGFibGUsCi0JCQkJ
CSAgJmZhdWx0LT5odmEpOworCQkJCQkgIE5VTEwpOwogCiAJLyoKIAkgKiBJZiByZXNvbHZpbmcg
dGhlIHBhZ2UgZmFpbGVkIGJlY2F1c2UgSS9PIGlzIG5lZWRlZCB0byBmYXVsdC1pbiB0aGUKQEAg
LTQ0MDgsNyArNDQwNyw3IEBAIHN0YXRpYyBpbnQgX19rdm1fZmF1bHRpbl9wZm4oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3BhZ2VfZmF1bHQgKmZhdWx0CiAJICovCiAJZmF1bHQt
PnBmbiA9IF9fZ2ZuX3RvX3Bmbl9tZW1zbG90KGZhdWx0LT5zbG90LCBmYXVsdC0+Z2ZuLCB0cnVl
LCB0cnVlLAogCQkJCQkgIGZhdWx0LT53cml0ZSwgJmZhdWx0LT5tYXBfd3JpdGFibGUsCi0JCQkJ
CSAgJmZhdWx0LT5odmEpOworCQkJCQkgIE5VTEwpOwogCXJldHVybiBSRVRfUEZfQ09OVElOVUU7
CiB9CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmggYi9hcmNo
L3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCmluZGV4IDRkYTgzNTQ0YzRlMS4uNjMzYWVkZWMz
YzJlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCisrKyBiL2Fy
Y2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmgKQEAgLTIzOCw3ICsyMzgsNiBAQCBzdHJ1Y3Qg
a3ZtX3BhZ2VfZmF1bHQgewogCS8qIE91dHB1dHMgb2Yga3ZtX2ZhdWx0aW5fcGZuLiAgKi8KIAl1
bnNpZ25lZCBsb25nIG1tdV9zZXE7CiAJa3ZtX3Bmbl90IHBmbjsKLQlodmFfdCBodmE7CiAJYm9v
bCBtYXBfd3JpdGFibGU7CiAKIAkvKgpAQCAtMzEzLDcgKzMxMiw2IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGt2bV9tbXVfZG9fcGFnZV9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdwYV90IGNy
Ml9vcl9ncGEsCiAJCS5pc19wcml2YXRlID0gZXJyICYgUEZFUlJfUFJJVkFURV9BQ0NFU1MsCiAK
IAkJLnBmbiA9IEtWTV9QRk5fRVJSX0ZBVUxULAotCQkuaHZhID0gS1ZNX0hWQV9FUlJfQkFELAog
CX07CiAJaW50IHI7CiAKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
