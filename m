Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0769FCFC5EB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVRFdXZb7oxga7XSL+bjNemAsFT4t2hzS03Y0hFyrHc=; b=q3soJRAeQ7A7jR
	BqLh/BE3q1Uf4jWcwpfKGh3sx7DJfgiX0EWYHjBhTyV2qgNENRsy4K8IYEwNZ/syP2r+M+OZRxTP9
	ccUkmU/Xw6fiGJWy4oU3V/s1sx/abZcGo1FyMP+oaepGWIM+/um6FfLWvU/MUT+4M0G0iiuMFyNwD
	MLMwpErRdbyNiQ7s4FfQH9CTvgCChOiTWECj0c/GwBbDwqdWViL7aLMr/k/g+iGilcM5qmFPtsOR+
	X4qtIZTiIHUdEY8PeRaBy8yXiFZsb8dXVNT0XcDrwEM0iVWbWeOCN6D21uDZUfFONu5QAmq5Zo8Cv
	WSZa1WCPNNkT/S4OwpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy8F-0000000Dxnu-194O;
	Thu, 10 Oct 2024 18:43:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqj-0000000Dpy4-42GE
	for linux-riscv@bombadil.infradead.org;
	Thu, 10 Oct 2024 18:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Reply-To:Sender:Content-ID:Content-Description;
	bh=WDoARMTIexYqUKDMQLAC2OQWFTeknat7PpvqQx990/M=; b=WC5mBfewmhr0oTCmlmNwSCj/Pp
	pyZFqDuD9jdf1OyDYyY6Z+780w+rFPt1b3N6St2vNJy6Xo40msLkaeO0EXEzw2hy7pUSmSAtbFbcn
	hjyMvRQdYxXlrbYo4u93w7sohWmmtcarVfPKc9k6P8/iq1ezmx6/6EsW18ui6lMOw+0wsex7g+rY7
	ORB9rl6uaqhLFjFxYHGp+CeCpakIH5y9O2nNXDlUnukB927Pt5FvlmrGt/kv5ygzT3VgqD+aRUKNZ
	c7Qzsc6v9S3hoMLhyRe4zPTS/zgMsLfZO0IiDygb8bqQuljmk+J7sfJgdBUAHj/9RZAcZykdL7jkn
	6LbSo/Pg==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqg-00000005UVO-3iO5
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:20 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20b6144cc2aso12169005ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584715; x=1729189515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDoARMTIexYqUKDMQLAC2OQWFTeknat7PpvqQx990/M=;
        b=l0w9lnO34VRhpw9k4OCEu+5qWOSo/Odt1wTWLT30hnPFDBw9mjJcx13yjIxqVQ+ozn
         RZRohhTr//PIMU5+d6u0p2Ybm0pluL9Trct+kP4ZdpaBMtyn+vjVDJ4xtjrW3W5rr4J1
         xQqPMgmVruN1GprlW/XdHvx+FDJGuSIERXlP2nBikfRbtTWoVBUOgV9j0JftuApvZJ19
         qVe6ULQk5PLsMp/4wZJBa8kk3LNbuqSLiixvIPjkPnYXNjwzO/ralU4fWg9M65kFhe3i
         Fgza66jUadX1Vy06tXYPpkdLyYki95qkQQQ/etSfZX5Hb2a4gT4fVGxo1ccleuS6iOy4
         dVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584715; x=1729189515;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WDoARMTIexYqUKDMQLAC2OQWFTeknat7PpvqQx990/M=;
        b=Gn3HuUPEw9FgZRXcX2Rh0PWQXBaUVl7f3/hlexMHA2h7J11yeYGMr084hMZyeE+ov4
         CGNJz9ka8Pu5ykbvFQI0gM8lVYiMQLYTlz6wga7o0StS+WusM3ByJHj8ihPnA7oWyBOD
         WHf7FZRIbB9UoW1npggmfSzyQRyEGv1Mw1WOelHq9deZMv2s9OTfySI85sfMa+caE01o
         +qwFXmX8RAK6AMsPZsb6/Or1f0Hwr9GzQ3tfSUM0Z77iLZrBhsvdAP6PvBMoiubAPTrF
         1d4uBPVdrGqtHnVDl14RGQhYniX8F2mMP8KNppuHZpRsHOvLsv5KP0abKGOFHMUjQVCk
         38CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEZyYX3Ltk8PSFn41HI2IAI7t3EaXvzCDmIM91ZGGJ5gFokrqf/d08fALGHYXdBjAGgL2qd1CPcRo6Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB/wGmSnb5HxrlOI9D/SfLnQMY8faaO+b7ET15yLYc9OnkR+UW
	g0L6Lx+uu73L6HzxAh5ohc8P9iTgErZApJK3DOZkAHaiPBzBSrW3vmnXGEE2YxNK/ITN6L5IYXA
	m6g==
X-Google-Smtp-Source: AGHT+IFdLsiMiQR9ssEjYgvfJ+TOiOlvv8h202qp7bAbI4MCMFrC9IRsz+IufRcGyfoerq3Ms7MkoMKw8Uo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:f143:b0:20c:5beb:9c6a with SMTP id
 d9443c01a7336-20c80510505mr43225ad.4.1728584715291; Thu, 10 Oct 2024 11:25:15
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:13 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-12-seanjc@google.com>
Subject: [PATCH v13 11/85] KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
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
X-CRM114-CacheID: sfid-20241010_192518_991859_8E708C61 
X-CRM114-Status: GOOD (  11.39  )
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

UmVuYW1lIGdmbl90b19wYWdlX21hbnlfYXRvbWljKCkgdG8ga3ZtX3ByZWZldGNoX3BhZ2VzKCkg
dG8gdHJ5IGFuZApjb21tdW5pY2F0ZSBpdHMgdHJ1ZSBwdXJwb3NlLCBhcyB0aGUgImF0b21pYyIg
YXNwZWN0IGlzIGVzc2VudGlhbGx5IGEKc2lkZSBlZmZlY3Qgb2YgdGhlIGZhY3QgdGhhdCB4ODYg
dXNlcyB0aGUgQVBJIHdoaWxlIGhvbGRpbmcgbW11X2xvY2suCkUuZy4gZXZlbiBpZiBtbXVfbG9j
ayB3ZXJlbid0IGhlbGQsIEtWTSB3b3VsZG4ndCB3YW50IHRvIGZhdWx0LWluIHBhZ2VzLAphcyB0
aGUgZ29hbCBpcyB0byBvcHBvcnR1bmlzdGljYWxseSBncmFiIHN1cnJvdW5kaW5nIHBhZ2VzIHRo
YXQgaGF2ZQphbHJlYWR5IGJlZW4gYWNjZXNzZWQgYW5kL29yIGRpcnRpZWQgYnkgdGhlIGhvc3Qs
IGFuZCB0byBkbyBzbyBxdWlja2x5LgoKVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVu
bmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5q
Y0Bnb29nbGUuY29tPgotLS0KIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgICAgICAgICB8IDIgKy0K
IGFyY2gveDg2L2t2bS9tbXUvcGFnaW5nX3RtcGwuaCB8IDIgKy0KIGluY2x1ZGUvbGludXgva3Zt
X2hvc3QuaCAgICAgICB8IDQgKystLQogdmlydC9rdm0va3ZtX21haW4uYyAgICAgICAgICAgIHwg
NiArKystLS0KIDQgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMgYi9hcmNoL3g4Ni9rdm0vbW11
L21tdS5jCmluZGV4IDA0MjI4YTdkYTY5YS4uNWZlNDVhYjBlODE4IDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0vbW11L21tdS5jCisrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKQEAgLTI5NTgs
NyArMjk1OCw3IEBAIHN0YXRpYyBpbnQgZGlyZWN0X3B0ZV9wcmVmZXRjaF9tYW55KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSwKIAlpZiAoIXNsb3QpCiAJCXJldHVybiAtMTsKIAotCXJldCA9IGdmbl90
b19wYWdlX21hbnlfYXRvbWljKHNsb3QsIGdmbiwgcGFnZXMsIGVuZCAtIHN0YXJ0KTsKKwlyZXQg
PSBrdm1fcHJlZmV0Y2hfcGFnZXMoc2xvdCwgZ2ZuLCBwYWdlcywgZW5kIC0gc3RhcnQpOwogCWlm
IChyZXQgPD0gMCkKIAkJcmV0dXJuIC0xOwogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11
L3BhZ2luZ190bXBsLmggYi9hcmNoL3g4Ni9rdm0vbW11L3BhZ2luZ190bXBsLmgKaW5kZXggMzZi
MjYwNzI4MGYwLi4xNDNiN2U5ZjI2ZGMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvcGFn
aW5nX3RtcGwuaAorKysgYi9hcmNoL3g4Ni9rdm0vbW11L3BhZ2luZ190bXBsLmgKQEAgLTU0OSw3
ICs1NDksNyBAQCBGTkFNRShwcmVmZXRjaF9ncHRlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0
cnVjdCBrdm1fbW11X3BhZ2UgKnNwLAogCWlmICghc2xvdCkKIAkJcmV0dXJuIGZhbHNlOwogCi0J
aWYgKGdmbl90b19wYWdlX21hbnlfYXRvbWljKHNsb3QsIGdmbiwgJnBhZ2UsIDEpICE9IDEpCisJ
aWYgKGt2bV9wcmVmZXRjaF9wYWdlcyhzbG90LCBnZm4sICZwYWdlLCAxKSAhPSAxKQogCQlyZXR1
cm4gZmFsc2U7CiAKIAltbXVfc2V0X3NwdGUodmNwdSwgc2xvdCwgc3B0ZSwgcHRlX2FjY2Vzcywg
Z2ZuLCBwYWdlX3RvX3BmbihwYWdlKSwgTlVMTCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggYWI0NDg1YjJiZGRj
Li41NmU3Y2RlOGM4YjggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysg
Yi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKQEAgLTEyMDcsOCArMTIwNyw4IEBAIHZvaWQga3Zt
X2FyY2hfZmx1c2hfc2hhZG93X2FsbChzdHJ1Y3Qga3ZtICprdm0pOwogdm9pZCBrdm1fYXJjaF9m
bHVzaF9zaGFkb3dfbWVtc2xvdChzdHJ1Y3Qga3ZtICprdm0sCiAJCQkJICAgc3RydWN0IGt2bV9t
ZW1vcnlfc2xvdCAqc2xvdCk7CiAKLWludCBnZm5fdG9fcGFnZV9tYW55X2F0b21pYyhzdHJ1Y3Qg
a3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBnZm4sCi0JCQkgICAgc3RydWN0IHBhZ2UgKipw
YWdlcywgaW50IG5yX3BhZ2VzKTsKK2ludCBrdm1fcHJlZmV0Y2hfcGFnZXMoc3RydWN0IGt2bV9t
ZW1vcnlfc2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuLAorCQkgICAgICAgc3RydWN0IHBhZ2UgKipwYWdl
cywgaW50IG5yX3BhZ2VzKTsKIAogc3RydWN0IHBhZ2UgKmdmbl90b19wYWdlKHN0cnVjdCBrdm0g
Kmt2bSwgZ2ZuX3QgZ2ZuKTsKIHVuc2lnbmVkIGxvbmcgZ2ZuX3RvX2h2YShzdHJ1Y3Qga3ZtICpr
dm0sIGdmbl90IGdmbik7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9r
dm0va3ZtX21haW4uYwppbmRleCAyMDMyMjkyZGYwYjAuLjk1N2I0YTZjOTI1NCAxMDA2NDQKLS0t
IGEvdmlydC9rdm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0zMDUz
LDggKzMwNTMsOCBAQCBrdm1fcGZuX3Qga3ZtX3ZjcHVfZ2ZuX3RvX3BmbihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIGdmbl90IGdmbikKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2bV92Y3B1X2dmbl90
b19wZm4pOwogCi1pbnQgZ2ZuX3RvX3BhZ2VfbWFueV9hdG9taWMoc3RydWN0IGt2bV9tZW1vcnlf
c2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuLAotCQkJICAgIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCBu
cl9wYWdlcykKK2ludCBrdm1fcHJlZmV0Y2hfcGFnZXMoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
c2xvdCwgZ2ZuX3QgZ2ZuLAorCQkgICAgICAgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IG5yX3Bh
Z2VzKQogewogCXVuc2lnbmVkIGxvbmcgYWRkcjsKIAlnZm5fdCBlbnRyeSA9IDA7CkBAIC0zMDY4
LDcgKzMwNjgsNyBAQCBpbnQgZ2ZuX3RvX3BhZ2VfbWFueV9hdG9taWMoc3RydWN0IGt2bV9tZW1v
cnlfc2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuLAogCiAJcmV0dXJuIGdldF91c2VyX3BhZ2VzX2Zhc3Rf
b25seShhZGRyLCBucl9wYWdlcywgRk9MTF9XUklURSwgcGFnZXMpOwogfQotRVhQT1JUX1NZTUJP
TF9HUEwoZ2ZuX3RvX3BhZ2VfbWFueV9hdG9taWMpOworRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3By
ZWZldGNoX3BhZ2VzKTsKIAogLyoKICAqIERvIG5vdCB1c2UgdGhpcyBoZWxwZXIgdW5sZXNzIHlv
dSBhcmUgYWJzb2x1dGVseSBjZXJ0YWluIHRoZSBnZm4gX211c3RfIGJlCi0tIAoyLjQ3LjAucmMx
LjI4OC5nMDYyOThkMTUyNS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
