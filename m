Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCC6D24447
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2mib9Krnlty0WR2io2FDu1dtHPSSd8KCFg9XVSs6Hw=; b=r78lKikDJnvZIP
	Y6L1MS04FCKXSOQN+7V6lun2IyzOPxnTM6LARbgN8TMnkriM8/LQOs/7fm3oYfOY7ZxGbJ4fXUpmA
	fjDzqNxVuYhVcJyB0V7koy0aqgTBcQNaVEC3MLT5uErsNFDEWvb0nJGxV3ec7QJvVMHgHK4+h/wCg
	wTgQoui1zswvRWHuvfFfrLSacvCRt96Rogt5YrwVS2VF9J5gh6MwxTVBQdaMvMlTPZFSDmkZ3KdLn
	DmpgKmKUclsah8C+lb8aBf3NTLvO/mQau2SASDpjXdj24ip/qLwt9YLvwYKtUF/g7a2wOqzLCd8PW
	bZN50zZ4/jD3ZeCdMEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzFp-0000000ECiz-3PVK;
	Thu, 10 Oct 2024 19:55:21 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxt9-0000000Drwm-1pz6
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:53 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2b049b64aso20338017b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584870; x=1729189670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeNSr3VxopvO4QfIOfKviYSPGRm8vVX1K3YR0sLhejo=;
        b=QrJKmIjvSEAhTIlwVFJOmQ5I7I1VQhdnUVXCZMq3P4JJusmgXnFbWJC6rS25qcKrc9
         PN5Xs1EwDCBnS6Jfegln//omwt2zD+qAgL/jptfn/AmjxhsbXA9WzAJnKDAbX142AR6h
         RNYj2DIR2JEFC5wyhzG4jhM0r+T/Z/aReqH/PvQPn9B40wk+edj62VBTntkLj/5FBB25
         QYk85cbXR2hELgL/DYbNsXGMlrv7GaJaMXWXi7F9kTmNYdUQHst26FT47gHsPnKmbLt7
         75NSePZV/v2zlVeBCcHeWFDP2qwe6gTBBEdY9I3NyXl+0CYfK1SourHBzLUeeikafN8J
         vQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584870; x=1729189670;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BeNSr3VxopvO4QfIOfKviYSPGRm8vVX1K3YR0sLhejo=;
        b=oL3XICJJMFYjPyN8jaH3bvvE0Sze90u3ZuZpdOphcXU5ZhngnyLPEJyxtqQ/nI2NUc
         QicYVD9C5OvdJB7S04Zg2+Zm2fhiyag7QlzfVZ//fEdv/fTte4snHV9zi6zcP5ivaRTI
         8DOOK9qc37SjNdEHlYnRRUecPnm7mpVXIsNL7p4L6TymZmvrXB0cZPZq1sikhmwEnTQI
         OUwS9hp57UNTwNdTfjrydgWkfvGCY2IjufEnYNEkqKdIfLkEiXEGFjiVH9m1w2tgW/qC
         DXeKVXKvQT7kercqX6pNvZg19avJwe6wBbrxh/AoQxnZK+gU1WwyWGy7KUIOCw9P6UVg
         74xg==
X-Forwarded-Encrypted: i=1; AJvYcCWYUejLIXmrmNwC5WnVyKNPq4XJs/b0Qihy91IKWbj4RGgtxzm7t4vd62iKMS1BXhGTrr1uEPz2Gjp1LA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcngQq625FYDOoTSSt0Bc2pib9s78nhQOUfASFFdEZzbIBcDFB
	cgzVeMdTqhqbkpTuTRp4fGUHSZ6uhu8DPCOQKfBxCxd1FyOpKr/oohWBKCYjSa5DLDey4MQp2JG
	SkQ==
X-Google-Smtp-Source: AGHT+IHhmEpfdjhYs/g96WpbaMl3fao5EtfU192MAf3yyGbJNoRiDL4cTPbNYR1fq37SA+x5liddjIzSKiU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2e86:b0:6dd:bcce:7cd4 with SMTP id
 00721157ae682-6e3221404ddmr516647b3.2.1728584870148; Thu, 10 Oct 2024
 11:27:50 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:26 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-85-seanjc@google.com>
Subject: [PATCH v13 84/85] KVM: Drop APIs that manipulate "struct page" via pfns
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
X-CRM114-CacheID: sfid-20241010_112751_595633_081E9FE6 
X-CRM114-Status: UNSURE (   9.36  )
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

UmVtb3ZlIGFsbCBrdm1fe3JlbGVhc2Usc2V0fV9wZm5fKigpIEFQSXMgbm93IHRoYXQgYWxsIHVz
ZXJzIGFyZSBnb25lLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCgpSZXZpZXdlZC1i
eTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpUZXN0ZWQtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJp
c3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1faG9z
dC5oIHwgIDUgLS0tLQogdmlydC9rdm0va3ZtX21haW4uYyAgICAgIHwgNTUgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2MCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xp
bnV4L2t2bV9ob3N0LmgKaW5kZXggNGExZWFhNDBhMjE1Li5kMDQ1ZjgzMTBhNDggMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmgKQEAgLTEyNzQsMTEgKzEyNzQsNiBAQCBzdGF0aWMgaW5saW5lIGt2bV9wZm5fdCBrdm1fZmF1
bHRpbl9wZm4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sCiAJCQkJIHdyaXRlID8g
Rk9MTF9XUklURSA6IDAsIHdyaXRhYmxlLCByZWZjb3VudGVkX3BhZ2UpOwogfQogCi12b2lkIGt2
bV9yZWxlYXNlX3Bmbl9jbGVhbihrdm1fcGZuX3QgcGZuKTsKLXZvaWQga3ZtX3JlbGVhc2VfcGZu
X2RpcnR5KGt2bV9wZm5fdCBwZm4pOwotdm9pZCBrdm1fc2V0X3Bmbl9kaXJ0eShrdm1fcGZuX3Qg
cGZuKTsKLXZvaWQga3ZtX3NldF9wZm5fYWNjZXNzZWQoa3ZtX3Bmbl90IHBmbik7Ci0KIGludCBr
dm1fcmVhZF9ndWVzdF9wYWdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLCB2b2lkICpkYXRh
LCBpbnQgb2Zmc2V0LAogCQkJaW50IGxlbik7CiBpbnQga3ZtX3JlYWRfZ3Vlc3Qoc3RydWN0IGt2
bSAqa3ZtLCBncGFfdCBncGEsIHZvaWQgKmRhdGEsIHVuc2lnbmVkIGxvbmcgbGVuKTsKZGlmZiAt
LWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IGE0
ODNkYTk2ZjRiZS4uMzk2Y2ExNGYxOGYzIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5j
CisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTMxNjQsNjEgKzMxNjQsNiBAQCB2b2lkIGt2
bV92Y3B1X3VubWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ob3N0X21hcCAq
bWFwKQogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3ZjcHVfdW5tYXApOwogCi12b2lkIGt2bV9y
ZWxlYXNlX3Bmbl9jbGVhbihrdm1fcGZuX3QgcGZuKQotewotCXN0cnVjdCBwYWdlICpwYWdlOwot
Ci0JaWYgKGlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSkKLQkJcmV0dXJuOwotCi0JcGFnZSA9IGt2
bV9wZm5fdG9fcmVmY291bnRlZF9wYWdlKHBmbik7Ci0JaWYgKCFwYWdlKQotCQlyZXR1cm47Ci0K
LQlrdm1fcmVsZWFzZV9wYWdlX2NsZWFuKHBhZ2UpOwotfQotRVhQT1JUX1NZTUJPTF9HUEwoa3Zt
X3JlbGVhc2VfcGZuX2NsZWFuKTsKLQotdm9pZCBrdm1fcmVsZWFzZV9wZm5fZGlydHkoa3ZtX3Bm
bl90IHBmbikKLXsKLQlzdHJ1Y3QgcGFnZSAqcGFnZTsKLQotCWlmIChpc19lcnJvcl9ub3Nsb3Rf
cGZuKHBmbikpCi0JCXJldHVybjsKLQotCXBhZ2UgPSBrdm1fcGZuX3RvX3JlZmNvdW50ZWRfcGFn
ZShwZm4pOwotCWlmICghcGFnZSkKLQkJcmV0dXJuOwotCi0Ja3ZtX3JlbGVhc2VfcGFnZV9kaXJ0
eShwYWdlKTsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKGt2bV9yZWxlYXNlX3Bmbl9kaXJ0eSk7Ci0K
LS8qCi0gKiBOb3RlLCBjaGVja2luZyBmb3IgYW4gZXJyb3Ivbm9zbG90IHBmbiBpcyB0aGUgY2Fs
bGVyJ3MgcmVzcG9uc2liaWxpdHkgd2hlbgotICogZGlyZWN0bHkgbWFya2luZyBhIHBhZ2UgZGly
dHkvYWNjZXNzZWQuICBVbmxpa2UgdGhlICJyZWxlYXNlIiBoZWxwZXJzLCB0aGUKLSAqICJzZXQi
IGhlbHBlcnMgYXJlIG5vdCB0byBiZSB1c2VkIHdoZW4gdGhlIHBmbiBtaWdodCBwb2ludCBhdCBn
YXJiYWdlLgotICovCi12b2lkIGt2bV9zZXRfcGZuX2RpcnR5KGt2bV9wZm5fdCBwZm4pCi17Ci0J
aWYgKFdBUk5fT04oaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pKSkKLQkJcmV0dXJuOwotCi0JaWYg
KHBmbl92YWxpZChwZm4pKQotCQlrdm1fc2V0X3BhZ2VfZGlydHkocGZuX3RvX3BhZ2UocGZuKSk7
Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChrdm1fc2V0X3Bmbl9kaXJ0eSk7Ci0KLXZvaWQga3ZtX3Nl
dF9wZm5fYWNjZXNzZWQoa3ZtX3Bmbl90IHBmbikKLXsKLQlpZiAoV0FSTl9PTihpc19lcnJvcl9u
b3Nsb3RfcGZuKHBmbikpKQotCQlyZXR1cm47Ci0KLQlpZiAocGZuX3ZhbGlkKHBmbikpCi0JCWt2
bV9zZXRfcGFnZV9hY2Nlc3NlZChwZm5fdG9fcGFnZShwZm4pKTsKLX0KLUVYUE9SVF9TWU1CT0xf
R1BMKGt2bV9zZXRfcGZuX2FjY2Vzc2VkKTsKLQogc3RhdGljIGludCBuZXh0X3NlZ21lbnQodW5z
aWduZWQgbG9uZyBsZW4sIGludCBvZmZzZXQpCiB7CiAJaWYgKGxlbiA+IFBBR0VfU0laRSAtIG9m
ZnNldCkKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
