Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258DDD24456
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 22:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsgjRju6y33J6xi13KgbkeyQw0CD37A6KEF+3fDIaSM=; b=XkT2UeyvHMydmE
	WNapBYbSmYbgJ/BWaLhrezRJvxltevOT9efpHh6FdHQTBCZGFV5tboFb012737qOtb+FE1q8jnYDz
	Q0y1hudkVcA71MY3MT+MnRnco4OOys8hWSgYziPNmWhpBKOfApzJI5dJoxiniUK3BBYmgNGxBCZzl
	MzjI56/AVGg1PgestHrZyieWeY1rAEDPzFmPIXZjaJvv0kwiHfrhuah4lz9G+p6Vc6Jys2nZ6gPhO
	UPmZhdST8u0EavlXBb6YsMDQre6u5NhAJc7Sv3XTLqrXGfSg8htF3H8Srxi3B+JtslhMNwC/azxZ1
	dOLP+PuWHi8edKey/cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1SP-0000000EVuD-094Z;
	Thu, 10 Oct 2024 22:16:29 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrC-0000000DqLt-1ut7
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:52 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e00a395b1so1476156b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584749; x=1729189549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txhtY6exXDaGFQAWYGvmt09bjeoYz319F03IR2k/C3M=;
        b=QOiWlENQw1uIbr6nUNrqjMhma3ERcOVij9+O8o2BjPvO4mrYl4XsAmuLiusexGR8og
         wjRSA7WvE5P8YAxpwHCCocnQY3fc2JIYkO+hhKk6wpWzFsfI8BAMyortVof5wkh28VS0
         Qt6uIQVR43FVlVhGrf1uAMsyy/6cvsQrPWf167zPqypNnCLXzoYxB2jdJWRtBimBpcWt
         uoYysw3iFUs8BsYcyGBmeWFo8/VrIQKNDreM/iOY/RkbKvOAdmKLBqSp17mNc5/WUjiD
         njASJ7YlaTL5HOieVnKQztyEjeiufrz2c0OKSD/CKjo1u2aS16zJOMO10Q+JaDo62pQq
         63gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584749; x=1729189549;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=txhtY6exXDaGFQAWYGvmt09bjeoYz319F03IR2k/C3M=;
        b=j6Nd4G5j/bGKjtT8n6x6+uqDn19xW8e+2uvChL7Ncl+l7QZWFSkCCMczoWxJ5U6ZND
         qnzFUto29p8xenXAF+MaubivBfK/nicD2tKbnJ6IHciBpbJYwAYnpPhYEMPyqJMciDQI
         S13O7uqpCzIbHoTncS7E2YwwFJMONfniHF48Ng/Ot3kXjl9YLxBDGn47KQ9aK6YylSHn
         rHdWHTFdzYS2crQokiMBT6aSTrIJgQZ79q5RIphWhEx97a9JQriX7LEdixpBX/VflfI+
         4F6UPbGK3MIDMZKSPLqctO8AzAPy92NeXCXaBMfpRfymjRml4qbslxaM2WlR451qdJpY
         QdxA==
X-Forwarded-Encrypted: i=1; AJvYcCUOMLd6TgzOWlkiV8qiGMNSgZkFP9aDGKf64hw0MJQ4m24GKPV80MxzuSdgfdQXOwcNeNk1/XrLQBH2Og==@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+DZnJmmZ9lZlcP1QjVpB6rgqkSHF/RWOwJ/h+S1WI7FG58zK
	FUMFq8bBE9zUZIE1aUlvkzPuVZW0vMrMxopOWyCod9Ep7IILhCOu1GK0iHvAfkpMvk8sNCeBivT
	uJA==
X-Google-Smtp-Source: AGHT+IE/uLa8aldzd4vJMnq+De69DiThAuVt+3q8zF6rqxlBj2/ZKo7+FHCoJyy45GpCD4mZjJfGV3U05Tk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d8a:b0:71d:f1f9:b982 with SMTP id
 d2e1a72fcca58-71e1dc00b9cmr38199b3a.6.1728584749206; Thu, 10 Oct 2024
 11:25:49 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:29 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-28-seanjc@google.com>
Subject: [PATCH v13 27/85] KVM: Provide refcounted page as output field in
 struct kvm_follow_pfn
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
X-CRM114-CacheID: sfid-20241010_112550_735001_45D015E9 
X-CRM114-Status: GOOD (  22.69  )
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

QWRkIGt2bV9mb2xsb3dfcGZuLnJlZmNvdW50ZWRfcGFnZSBhcyBhbiBvdXRwdXQgZm9yIHRoZSAi
dG8gcGZuIiBBUElzIHRvCiJyZXR1cm4iIHRoZSBzdHJ1Y3QgcGFnZSB0aGF0IGlzIGFzc29jaWF0
ZWQgd2l0aCB0aGUgcmV0dXJuZWQgcGZuIChpZiBLVk0KYWNxdWlyZWQgYSByZWZlcmVuY2UgdG8g
dGhlIHBhZ2UpLiAgVGhpcyB3aWxsIGV2ZW50dWFsbHkgYWxsb3cgcmVtb3ZpbmcKS1ZNJ3MgaGFj
a3kga3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UoKSBjb2RlLCB3aGljaCBpcyBlcnJvciBwcm9u
ZSBhbmQKY2FuJ3QgZGV0ZWN0IHBmbnMgdGhhdCBhcmUgdmFsaWQsIGJ1dCBhcmVuJ3QgKGN1cnJl
bnRseSkgcmVmY291bnRlZC4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29v
Z2xlLmNvbT4KLS0tCiB2aXJ0L2t2bS9rdm1fbWFpbi5jIHwgOTkgKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB2aXJ0L2t2bS9rdm1fbW0uaCAgIHwgIDkgKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5k
ZXggZDNlNDhmY2M0ZmIwLi5lMjlmNzhlZDZmNDggMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9t
YWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtMjc0Niw2ICsyNzQ2LDQ2IEBAIHVu
c2lnbmVkIGxvbmcga3ZtX3ZjcHVfZ2ZuX3RvX2h2YV9wcm90KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgZ2ZuX3QgZ2ZuLCBib29sICp3CiAJcmV0dXJuIGdmbl90b19odmFfbWVtc2xvdF9wcm90KHNs
b3QsIGdmbiwgd3JpdGFibGUpOwogfQogCitzdGF0aWMga3ZtX3Bmbl90IGt2bV9yZXNvbHZlX3Bm
bihzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCwgc3RydWN0IHBhZ2UgKnBhZ2UsCisJCQkJIHN0
cnVjdCBmb2xsb3dfcGZubWFwX2FyZ3MgKm1hcCwgYm9vbCB3cml0YWJsZSkKK3sKKwlrdm1fcGZu
X3QgcGZuOworCisJV0FSTl9PTl9PTkNFKCEhcGFnZSA9PSAhIW1hcCk7CisKKwlpZiAoa2ZwLT5t
YXBfd3JpdGFibGUpCisJCSprZnAtPm1hcF93cml0YWJsZSA9IHdyaXRhYmxlOworCisJLyoKKwkg
KiBGSVhNRTogUmVtb3ZlIHRoaXMgb25jZSBLVk0gbm8gbG9uZ2VyIGJsaW5kbHkgY2FsbHMgcHV0
X3BhZ2UoKSBvbgorCSAqCSAgZXZlcnkgcGZuIHRoYXQgcG9pbnRzIGF0IGEgc3RydWN0IHBhZ2Uu
CisJICoKKwkgKiBHZXQgYSByZWZlcmVuY2UgZm9yIGZvbGxvd19wdGUoKSBwZm5zIGlmIHRoZXkg
aGFwcGVuIHRvIHBvaW50IGF0IGEKKwkgKiBzdHJ1Y3QgcGFnZSwgYXMgS1ZNIHdpbGwgdWx0aW1h
dGVseSBjYWxsIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbigpIG9uCisJICogdGhlIHJldHVybmVkIHBm
biwgaS5lLiBLVk0gZXhwZWN0cyB0byBoYXZlIGEgcmVmZXJlbmNlLgorCSAqCisJICogQ2VydGFp
biBJTyBvciBQRk5NQVAgbWFwcGluZ3MgY2FuIGJlIGJhY2tlZCB3aXRoIHZhbGlkIHN0cnVjdCBw
YWdlcywKKwkgKiBidXQgYmUgYWxsb2NhdGVkIHdpdGhvdXQgcmVmY291bnRpbmcsIGUuZy4gdGFp
bCBwYWdlcyBvZgorCSAqIG5vbi1jb21wb3VuZCBoaWdoZXIgb3JkZXIgYWxsb2NhdGlvbnMuICBH
cmFiYmluZyBhbmQgcHV0dGluZyBhCisJICogcmVmZXJlbmNlIHRvIHN1Y2ggcGFnZXMgd291bGQg
Y2F1c2UgS1ZNIHRvIHByZW1hdHVyZWx5IGZyZWUgYSBwYWdlCisJICogaXQgZG9lc24ndCBvd24g
KEtWTSBnZXRzIGFuZCBwdXRzIHRoZSBvbmUgYW5kIG9ubHkgcmVmZXJlbmNlKS4KKwkgKiBEb24n
dCBhbGxvdyB0aG9zZSBwYWdlcyB1bnRpbCB0aGUgRklYTUUgaXMgcmVzb2x2ZWQuCisJICovCisJ
aWYgKG1hcCkgeworCQlwZm4gPSBtYXAtPnBmbjsKKwkJcGFnZSA9IGt2bV9wZm5fdG9fcmVmY291
bnRlZF9wYWdlKHBmbik7CisJCWlmIChwYWdlICYmICFnZXRfcGFnZV91bmxlc3NfemVybyhwYWdl
KSkKKwkJCXJldHVybiBLVk1fUEZOX0VSUl9GQVVMVDsKKwl9IGVsc2UgeworCQlwZm4gPSBwYWdl
X3RvX3BmbihwYWdlKTsKKwl9CisKKwlpZiAoa2ZwLT5yZWZjb3VudGVkX3BhZ2UpCisJCSprZnAt
PnJlZmNvdW50ZWRfcGFnZSA9IHBhZ2U7CisKKwlyZXR1cm4gcGZuOworfQorCiAvKgogICogVGhl
IGZhc3QgcGF0aCB0byBnZXQgdGhlIHdyaXRhYmxlIHBmbiB3aGljaCB3aWxsIGJlIHN0b3JlZCBp
biBAcGZuLAogICogdHJ1ZSBpbmRpY2F0ZXMgc3VjY2Vzcywgb3RoZXJ3aXNlIGZhbHNlIGlzIHJl
dHVybmVkLgpAQCAtMjc2Myw5ICsyODAzLDcgQEAgc3RhdGljIGJvb2wgaHZhX3RvX3Bmbl9mYXN0
KHN0cnVjdCBrdm1fZm9sbG93X3BmbiAqa2ZwLCBrdm1fcGZuX3QgKnBmbikKIAkJcmV0dXJuIGZh
bHNlOwogCiAJaWYgKGdldF91c2VyX3BhZ2VfZmFzdF9vbmx5KGtmcC0+aHZhLCBGT0xMX1dSSVRF
LCAmcGFnZSkpIHsKLQkJKnBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2UpOwotCQlpZiAoa2ZwLT5tYXBf
d3JpdGFibGUpCi0JCQkqa2ZwLT5tYXBfd3JpdGFibGUgPSB0cnVlOworCQkqcGZuID0ga3ZtX3Jl
c29sdmVfcGZuKGtmcCwgcGFnZSwgTlVMTCwgdHJ1ZSk7CiAJCXJldHVybiB0cnVlOwogCX0KIApA
QCAtMjc5NywyMyArMjgzNSwxNSBAQCBzdGF0aWMgaW50IGh2YV90b19wZm5fc2xvdyhzdHJ1Y3Qg
a3ZtX2ZvbGxvd19wZm4gKmtmcCwga3ZtX3Bmbl90ICpwZm4pCiAJaWYgKG5wYWdlcyAhPSAxKQog
CQlyZXR1cm4gbnBhZ2VzOwogCi0JaWYgKCFrZnAtPm1hcF93cml0YWJsZSkKLQkJZ290byBvdXQ7
Ci0KLQlpZiAoa2ZwLT5mbGFncyAmIEZPTExfV1JJVEUpIHsKLQkJKmtmcC0+bWFwX3dyaXRhYmxl
ID0gdHJ1ZTsKLQkJZ290byBvdXQ7Ci0JfQotCiAJLyogbWFwIHJlYWQgZmF1bHQgYXMgd3JpdGFi
bGUgaWYgcG9zc2libGUgKi8KLQlpZiAoZ2V0X3VzZXJfcGFnZV9mYXN0X29ubHkoa2ZwLT5odmEs
IEZPTExfV1JJVEUsICZ3cGFnZSkpIHsKLQkJKmtmcC0+bWFwX3dyaXRhYmxlID0gdHJ1ZTsKKwlp
ZiAoIShmbGFncyAmIEZPTExfV1JJVEUpICYmIGtmcC0+bWFwX3dyaXRhYmxlICYmCisJICAgIGdl
dF91c2VyX3BhZ2VfZmFzdF9vbmx5KGtmcC0+aHZhLCBGT0xMX1dSSVRFLCAmd3BhZ2UpKSB7CiAJ
CXB1dF9wYWdlKHBhZ2UpOwogCQlwYWdlID0gd3BhZ2U7CisJCWZsYWdzIHw9IEZPTExfV1JJVEU7
CiAJfQogCi1vdXQ6Ci0JKnBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2UpOworCSpwZm4gPSBrdm1fcmVz
b2x2ZV9wZm4oa2ZwLCBwYWdlLCBOVUxMLCBmbGFncyAmIEZPTExfV1JJVEUpOwogCXJldHVybiBu
cGFnZXM7CiB9CiAKQEAgLTI4MjgsMjIgKzI4NTgsMTEgQEAgc3RhdGljIGJvb2wgdm1hX2lzX3Zh
bGlkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBib29sIHdyaXRlX2ZhdWx0KQogCXJldHVy
biB0cnVlOwogfQogCi1zdGF0aWMgaW50IGt2bV90cnlfZ2V0X3Bmbihrdm1fcGZuX3QgcGZuKQot
ewotCXN0cnVjdCBwYWdlICpwYWdlID0ga3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UocGZuKTsK
LQotCWlmICghcGFnZSkKLQkJcmV0dXJuIDE7Ci0KLQlyZXR1cm4gZ2V0X3BhZ2VfdW5sZXNzX3pl
cm8ocGFnZSk7Ci19Ci0KIHN0YXRpYyBpbnQgaHZhX3RvX3Bmbl9yZW1hcHBlZChzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSwKIAkJCSAgICAgICBzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCwg
a3ZtX3Bmbl90ICpwX3BmbikKIHsKIAlzdHJ1Y3QgZm9sbG93X3Bmbm1hcF9hcmdzIGFyZ3MgPSB7
IC52bWEgPSB2bWEsIC5hZGRyZXNzID0ga2ZwLT5odmEgfTsKIAlib29sIHdyaXRlX2ZhdWx0ID0g
a2ZwLT5mbGFncyAmIEZPTExfV1JJVEU7Ci0Ja3ZtX3Bmbl90IHBmbjsKIAlpbnQgcjsKIAogCXIg
PSBmb2xsb3dfcGZubWFwX3N0YXJ0KCZhcmdzKTsKQEAgLTI4NjcsMzcgKzI4ODYsMTMgQEAgc3Rh
dGljIGludCBodmFfdG9fcGZuX3JlbWFwcGVkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAog
CX0KIAogCWlmICh3cml0ZV9mYXVsdCAmJiAhYXJncy53cml0YWJsZSkgewotCQlwZm4gPSBLVk1f
UEZOX0VSUl9ST19GQVVMVDsKKwkJKnBfcGZuID0gS1ZNX1BGTl9FUlJfUk9fRkFVTFQ7CiAJCWdv
dG8gb3V0OwogCX0KIAotCWlmIChrZnAtPm1hcF93cml0YWJsZSkKLQkJKmtmcC0+bWFwX3dyaXRh
YmxlID0gYXJncy53cml0YWJsZTsKLQlwZm4gPSBhcmdzLnBmbjsKLQotCS8qCi0JICogR2V0IGEg
cmVmZXJlbmNlIGhlcmUgYmVjYXVzZSBjYWxsZXJzIG9mICpodmFfdG9fcGZuKiBhbmQKLQkgKiAq
Z2ZuX3RvX3BmbiogdWx0aW1hdGVseSBjYWxsIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbiBvbiB0aGUK
LQkgKiByZXR1cm5lZCBwZm4uICBUaGlzIGlzIG9ubHkgbmVlZGVkIGlmIHRoZSBWTUEgaGFzIFZN
X01JWEVETUFQCi0JICogc2V0LCBidXQgdGhlIGt2bV90cnlfZ2V0X3Bmbi9rdm1fcmVsZWFzZV9w
Zm5fY2xlYW4gcGFpciB3aWxsCi0JICogc2ltcGx5IGRvIG5vdGhpbmcgZm9yIHJlc2VydmVkIHBm
bnMuCi0JICoKLQkgKiBXaG9ldmVyIGNhbGxlZCByZW1hcF9wZm5fcmFuZ2UgaXMgYWxzbyBnb2lu
ZyB0byBjYWxsIGUuZy4KLQkgKiB1bm1hcF9tYXBwaW5nX3JhbmdlIGJlZm9yZSB0aGUgdW5kZXJs
eWluZyBwYWdlcyBhcmUgZnJlZWQsCi0JICogY2F1c2luZyBhIGNhbGwgdG8gb3VyIE1NVSBub3Rp
Zmllci4KLQkgKgotCSAqIENlcnRhaW4gSU8gb3IgUEZOTUFQIG1hcHBpbmdzIGNhbiBiZSBiYWNr
ZWQgd2l0aCB2YWxpZAotCSAqIHN0cnVjdCBwYWdlcywgYnV0IGJlIGFsbG9jYXRlZCB3aXRob3V0
IHJlZmNvdW50aW5nIGUuZy4sCi0JICogdGFpbCBwYWdlcyBvZiBub24tY29tcG91bmQgaGlnaGVy
IG9yZGVyIGFsbG9jYXRpb25zLCB3aGljaAotCSAqIHdvdWxkIHRoZW4gdW5kZXJmbG93IHRoZSBy
ZWZjb3VudCB3aGVuIHRoZSBjYWxsZXIgZG9lcyB0aGUKLQkgKiByZXF1aXJlZCBwdXRfcGFnZS4g
RG9uJ3QgYWxsb3cgdGhvc2UgcGFnZXMgaGVyZS4KLQkgKi8KLQlpZiAoIWt2bV90cnlfZ2V0X3Bm
bihwZm4pKQotCQlyID0gLUVGQVVMVDsKKwkqcF9wZm4gPSBrdm1fcmVzb2x2ZV9wZm4oa2ZwLCBO
VUxMLCAmYXJncywgYXJncy53cml0YWJsZSk7CiBvdXQ6CiAJZm9sbG93X3Bmbm1hcF9lbmQoJmFy
Z3MpOwotCSpwX3BmbiA9IHBmbjsKLQogCXJldHVybiByOwogfQogCmRpZmYgLS1naXQgYS92aXJ0
L2t2bS9rdm1fbW0uaCBiL3ZpcnQva3ZtL2t2bV9tbS5oCmluZGV4IGQ1YTIxNTk1OGYwNi4uZDNh
YzFiYThiYTY2IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbW0uaAorKysgYi92aXJ0L2t2bS9r
dm1fbW0uaApAQCAtMzUsNiArMzUsMTUgQEAgc3RydWN0IGt2bV9mb2xsb3dfcGZuIHsKIAkgKiBT
ZXQgdG8gdHJ1ZSBpZiBhIHdyaXRhYmxlIG1hcHBpbmcgd2FzIG9idGFpbmVkLgogCSAqLwogCWJv
b2wgKm1hcF93cml0YWJsZTsKKworCS8qCisJICogT3B0aW9uYWwgb3V0cHV0LiAgU2V0IHRvIGEg
dmFsaWQgInN0cnVjdCBwYWdlIiBpZiB0aGUgcmV0dXJuZWQgcGZuCisJICogaXMgZm9yIGEgcmVm
Y291bnRlZCBvciBwaW5uZWQgc3RydWN0IHBhZ2UsIE5VTEwgaWYgdGhlIHJldHVybmVkIHBmbgor
CSAqIGhhcyBubyBzdHJ1Y3QgcGFnZSBvciBpZiB0aGUgc3RydWN0IHBhZ2UgaXMgbm90IGJlaW5n
IHJlZmNvdW50ZWQKKwkgKiAoZS5nLiB0YWlsIHBhZ2VzIG9mIG5vbi1jb21wb3VuZCBoaWdoZXIg
b3JkZXIgYWxsb2NhdGlvbnMgZnJvbQorCSAqIElPL1BGTk1BUCBtYXBwaW5ncykuCisJICovCisJ
c3RydWN0IHBhZ2UgKipyZWZjb3VudGVkX3BhZ2U7CiB9OwogCiBrdm1fcGZuX3QgaHZhX3RvX3Bm
bihzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCk7Ci0tIAoyLjQ3LjAucmMxLjI4OC5nMDYyOThk
MTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
