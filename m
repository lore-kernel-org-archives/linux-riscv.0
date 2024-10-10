Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84CAD2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4mU+rJBNREgJ+iSiWEKUn3a18lRER5QyPSy3ptsneA=; b=x/pFPWd05qbumm
	JMRoa60uIqOwBs6WTliBof4TqIVlumoqFrWXjhEpYpDvyAKg9oWYlJ3LVEPY/8XhbavNLOmHfGQ1J
	BAnC9W+aZr+Joy1uAvyMXBYEnti1+UJ3luWUmBGOGUTfj8k9PuSxCY2IVB/FpRn0ijsZQPw/Dgcaj
	TGv9YYhsALqVa6ZZxnEr843rTJe2DRXe740b27Cl7D4g/V+yJneHtoim2jpj8GUMMjTNyEWe3u39r
	e0w3JCMRLHGYgVxX7dbHUaCukwX9zsziS6rR2UVM6+WkZTIYj9jV12s4/Apm7GbCyPSPV3vgYVFTE
	vMTuA4rgRdezIjtax+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2d4-0000000Ef7y-3MrB;
	Thu, 10 Oct 2024 23:31:34 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxt6-0000000DruZ-3DuK
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:50 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2d1860a62so23490327b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584866; x=1729189666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0R/snR1lBsefu+Gd9v26W9gBjpskR/lINZXMlcZUSs=;
        b=oW/VXzAGHJr65LOPS7f+dxkMLtFUFWnBWUdwJwkoJynjNOMQA6FyT/YEbpKkDQB8Y1
         XeIzl5K+t84icDZE9u4ugYhCQHyhHKiuRnoiR2Lm7C1CCatKcksv+5I0FiTm4qTRbBb0
         cvFh3Pt4jkcYCbXegCrQTtJpKleedb6mm9BKTQq01qUz3KYjfrjunAPBGh+J9kARPELz
         TBCYbi38ooUbc2ZMOdoZYQZumPdBuR5OB6mAmUFQ49qCz1YIqoFGVX+FsfjgnF+fQ1da
         U7+/aWlz9istv976pUh+e8rfrPsTAHulSo8C7s5jKqn07pvvsJtIBFi3eS1ZDtNdKBDa
         b4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584866; x=1729189666;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l0R/snR1lBsefu+Gd9v26W9gBjpskR/lINZXMlcZUSs=;
        b=OgdiaI3RWSitKvYVg+3s72k8bd47/njiRlvGyasm+BIGFhhIsySN6H4jHuzfFZU+97
         DsDusZFV/9IPl67JRfx1fZGt1DOZkXhGjIyhvCC+wSquHxJIYc8F+TNlIof71VF3FJew
         3kqVa5qhfy+vd/jHgi3ptMJgXl/dRwTxGWL7pZglSceb9wyypGvtlyvgAB/V9ki5eJfi
         Ue1Ep2eXYNLOHhB+W0tC6ydlZHWpQOq32flw1x6eUrXv068ErnylRma88O4Bpc1rvYYm
         du0oJ3pY3KbbbleHmthkKsMqH7d/AOt/IWF9cu9cK9XtWilfUiPXWJiYmeUtG6kNgohC
         Ab8g==
X-Forwarded-Encrypted: i=1; AJvYcCUeBmAcVBimsRa+KwQC0EgflHLHITugocQXkdEnLpdZaSb07FrJjbUoCSJ588UCMXy6Ej9XRtU40bWwYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxorrpZWAoFa1DLMl2WlRDLFsCkno8f+uSVfar3jlfvpxZf3SCx
	HJ4oHNjPWqwVMNOCwXcfROUTVMOaYspQDl+1TaJL3vggMmjHoUDls3PCbBlYSsSEGoSe4ykDnnX
	CUA==
X-Google-Smtp-Source: AGHT+IE49fRlqLzz+ddXUJ4fW719WQNIEaF+exc+KxAZEodOOT6YKCh59uZdX+xzyPwnVHJ15Mb6QwFZ+jU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:470f:b0:6e3:39e5:f0e8 with SMTP id
 00721157ae682-6e339e5f461mr119227b3.6.1728584866570; Thu, 10 Oct 2024
 11:27:46 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:24 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-83-seanjc@google.com>
Subject: [PATCH v13 82/85] KVM: x86/mmu: Don't mark "struct page" accessed
 when zapping SPTEs
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
X-CRM114-CacheID: sfid-20241010_112748_879376_098E52FB 
X-CRM114-Status: GOOD (  13.34  )
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

RG9uJ3QgbWFyayBwYWdlcy9mb2xpb3MgYXMgYWNjZXNzZWQgaW4gdGhlIHByaW1hcnkgTU1VIHdo
ZW4gemFwcGluZyBTUFRFcywKYXMgZG9pbmcgc28gcmVsaWVzIG9uIGt2bV9wZm5fdG9fcmVmY291
bnRlZF9wYWdlKCksIGFuZCBnZW5lcmFsbHkgc3BlYWtpbmcKaXMgdW5uZWNlc3NhcnkgYW5kIHdh
c3RlZnVsLiAgS1ZNIHBhcnRpY2lwYXRlcyBpbiBwYWdlIGFnaW5nIHZpYQptbXVfbm90aWZpZXJz
LCBzbyB0aGVyZSdzIG5vIG5lZWQgdG8gcHVzaCAiYWNjZXNzZWQiIHVwZGF0ZXMgdG8gdGhlCnBy
aW1hcnkgTU1VLgoKQW5kIGlmIEtWTSB6YXBzIGEgU1BUZSBpbiByZXNwb25zZSB0byBhbiBtbXVf
bm90aWZpZXIsIG1hcmtpbmcgaXQgYWNjZXNzZWQKX2FmdGVyXyB0aGUgcHJpbWFyeSBNTVUgaGFz
IGRlY2lkZWQgdG8gemFwIHRoZSBwYWdlIGlzIGxpa2VseSB0byBnbwp1bm5vdGljZWQsIGkuZS4g
b2RkcyBhcmUgZ29vZCB0aGF0LCBpZiB0aGUgcGFnZSBpcyBiZWluZyB6YXBwZWQgZm9yCnJlY2xh
aW0sIHRoZSBwYWdlIHdpbGwgYmUgc3dhcHBlZCBvdXQgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIG9y
IG5vdCBLVk0KbWFya3MgdGhlIHBhZ2UgYWNjZXNzZWQuCgpEcm9wcGluZyB4ODYncyB1c2Ugb2Yg
a3ZtX3NldF9wZm5fYWNjZXNzZWQoKSBhbHNvIHBhdmVzIHRoZSB3YXkgZm9yCnJlbW92aW5nIGt2
bV9wZm5fdG9fcmVmY291bnRlZF9wYWdlKCkgYW5kIGFsbCBpdHMgdXNlcnMuCgpUZXN0ZWQtYnk6
IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogYXJjaC94ODYva3ZtL21t
dS9tbXUuYyAgICAgfCAxNyAtLS0tLS0tLS0tLS0tLS0tLQogYXJjaC94ODYva3ZtL21tdS90ZHBf
bW11LmMgfCAgMyAtLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKaW5k
ZXggNWFjZGFmM2IxMDA3Li41NWVlY2E5MzFlMjMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9t
bXUvbW11LmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwpAQCAtNTU5LDEwICs1NTksOCBA
QCBzdGF0aWMgYm9vbCBtbXVfc3B0ZV91cGRhdGUodTY0ICpzcHRlcCwgdTY0IG5ld19zcHRlKQog
ICovCiBzdGF0aWMgdTY0IG1tdV9zcHRlX2NsZWFyX3RyYWNrX2JpdHMoc3RydWN0IGt2bSAqa3Zt
LCB1NjQgKnNwdGVwKQogewotCWt2bV9wZm5fdCBwZm47CiAJdTY0IG9sZF9zcHRlID0gKnNwdGVw
OwogCWludCBsZXZlbCA9IHNwdGVwX3RvX3NwKHNwdGVwKS0+cm9sZS5sZXZlbDsKLQlzdHJ1Y3Qg
cGFnZSAqcGFnZTsKIAogCWlmICghaXNfc2hhZG93X3ByZXNlbnRfcHRlKG9sZF9zcHRlKSB8fAog
CSAgICAhc3B0ZV9oYXNfdm9sYXRpbGVfYml0cyhvbGRfc3B0ZSkpCkBAIC01NzQsMjEgKzU3Miw2
IEBAIHN0YXRpYyB1NjQgbW11X3NwdGVfY2xlYXJfdHJhY2tfYml0cyhzdHJ1Y3Qga3ZtICprdm0s
IHU2NCAqc3B0ZXApCiAJCXJldHVybiBvbGRfc3B0ZTsKIAogCWt2bV91cGRhdGVfcGFnZV9zdGF0
cyhrdm0sIGxldmVsLCAtMSk7Ci0KLQlwZm4gPSBzcHRlX3RvX3BmbihvbGRfc3B0ZSk7Ci0KLQkv
KgotCSAqIEtWTSBkb2Vzbid0IGhvbGQgYSByZWZlcmVuY2UgdG8gYW55IHBhZ2VzIG1hcHBlZCBp
bnRvIHRoZSBndWVzdCwgYW5kCi0JICogaW5zdGVhZCB1c2VzIHRoZSBtbXVfbm90aWZpZXIgdG8g
ZW5zdXJlIHRoYXQgS1ZNIHVubWFwcyBhbnkgcGFnZXMKLQkgKiBiZWZvcmUgdGhleSBhcmUgcmVj
bGFpbWVkLiAgU2FuaXR5IGNoZWNrIHRoYXQsIGlmIHRoZSBwZm4gaXMgYmFja2VkCi0JICogYnkg
YSByZWZjb3VudGVkIHBhZ2UsIHRoZSByZWZjb3VudCBpcyBlbGV2YXRlZC4KLQkgKi8KLQlwYWdl
ID0ga3ZtX3Bmbl90b19yZWZjb3VudGVkX3BhZ2UocGZuKTsKLQlXQVJOX09OX09OQ0UocGFnZSAm
JiAhcGFnZV9jb3VudChwYWdlKSk7Ci0KLQlpZiAoaXNfYWNjZXNzZWRfc3B0ZShvbGRfc3B0ZSkp
Ci0JCWt2bV9zZXRfcGZuX2FjY2Vzc2VkKHBmbik7Ci0KIAlyZXR1cm4gb2xkX3NwdGU7CiB9CiAK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvdGRwX21tdS5jIGIvYXJjaC94ODYva3ZtL21t
dS90ZHBfbW11LmMKaW5kZXggOGFhMGQ3YTc2MDJiLi45MWNhYTczYTkwNWIgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2t2bS9tbXUvdGRwX21tdS5jCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvdGRwX21t
dS5jCkBAIC04NjEsOSArODYxLDYgQEAgc3RhdGljIGJvb2wgdGRwX21tdV96YXBfbGVhZnMoc3Ry
dWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21tdV9wYWdlICpyb290LAogCiAJCXRkcF9tbXVfaXRl
cl9zZXRfc3B0ZShrdm0sICZpdGVyLCBTSEFET1dfTk9OUFJFU0VOVF9WQUxVRSk7CiAKLQkJaWYg
KGlzX2FjY2Vzc2VkX3NwdGUoaXRlci5vbGRfc3B0ZSkpCi0JCQlrdm1fc2V0X3Bmbl9hY2Nlc3Nl
ZChzcHRlX3RvX3BmbihpdGVyLm9sZF9zcHRlKSk7Ci0KIAkJLyoKIAkJICogWmFwcGluZ3MgU1BU
RXMgaW4gaW52YWxpZCByb290cyBkb2Vzbid0IHJlcXVpcmUgYSBUTEIgZmx1c2gsCiAJCSAqIHNl
ZSBrdm1fdGRwX21tdV96YXBfaW52YWxpZGF0ZWRfcm9vdHMoKSBmb3IgZGV0YWlscy4KLS0gCjIu
NDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
