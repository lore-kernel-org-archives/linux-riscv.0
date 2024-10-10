Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2E9CFC5EC
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxrYeQ29bTb2udoxQtf7r/ekFVNOr4pMlk2GbU44JeY=; b=ow5f3s1RZamOVy
	egXEpKN37EYTJEhw5yrEaokkkvx971bE38jlAUhbp1qU4aaWp4wvQQn0pFyAoiXiV8zbvj+J4J2Q8
	ts4Qk4O8RjGQ/eyyUcTX+8sY4VfBTRQ0D/kePJYu11CNG3JutzWnNRgSX0eHDW++uc0ZZ+qgT7xVv
	LRHHugEC3QcySCsDZmD4cxvEOYENkQUrgHGXwynkPrL6rjthCXrPIpAKheWRgM7ky4iUpcfI0FyMi
	Ff1CG24NTTuxTE2dR8T67P4i/bZmFejw7QSua6U0IFoSu0ZRXLTHtTnMn/4kej7g5uuknhwS0vHbb
	3pfa9JpMJ7ckSU4sWTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syxyF-0000000DuRp-1xT7;
	Thu, 10 Oct 2024 18:33:07 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqH-0000000Dpc4-15jY
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:24:55 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ea0dbb7cc1so2052586a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584691; x=1729189491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om/x5O1cFoCu45xFQlZl7muX4OGvvwFhFfu/OqGssvQ=;
        b=tCsBk8HaNFJgE7k6da8O+927jDUhAdilLbD6Ct0HgJr6ILzIqoH7HqDbdGX3904isM
         mgjRlaLXsMfuyAoxkw1WPhJdK3pB5VO/dxbxxKMIal5c9Z8EWR5FbmnyBwNxrl584hj8
         llhunBIIUNFcrX/3VjyNPRQ3o0OsEX7z8X0VE4Bgz/2ziMssp34F8oGWo+58KaUGxXnp
         GgSspRdccjVn7EAlku3QQ/kf2DmnFRd4xHkQRA0RG2GhInoi/RZeZJ1lmT5zInJExN8C
         nubiDEnlewvl8u2EFKmo4455ddHS15hNF7FMoQlwgmnzw50YNrRY+bHWh95QruI1FQ0a
         A0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584691; x=1729189491;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Om/x5O1cFoCu45xFQlZl7muX4OGvvwFhFfu/OqGssvQ=;
        b=OxXJCLlmnvAYzOTu7matjitzzYr917el1p1y3JoaZ6GIMGkXDHkb7KljEw4PM2vBRw
         GOILxwINZ7ecfk47TqNLcbC94VJJZA1+j8ESWo1Aqfdi7EitkgjnifRlCQfnQRFjOky6
         zWwh6v5VF3ks7P88aA/SrdDkU0MNucjUPnIKphLWslQ0bIsIPLbdnZPQlpHNoeZK76rS
         D0V/qeh0tou8rsFsD/C9rhz/B3aKSjLGzTw9FUzQWSs3tac+HM4+hr1QG8/GHv5eJ2hd
         KGNaKf79VXxs9l1x/X7/gkopgvKGMwZ1vK6m8zfDnwExdX1tRkiY3ZCrFKSdBkythaUP
         jWMA==
X-Forwarded-Encrypted: i=1; AJvYcCU60EdINAEdovJtoaTQzGKSFFwPFoLOy07HUSxs14TDVzHHwFYnjWRsXc4uV+gECwoQSvKv0GpOz8ruaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM09C364RN3mobcVSALkqN9kuUsTLbLhX/kgHMkPgcyVSy+ra5
	ovJ1M1LGOGHHHtkHp5t990iejmAtLkkgEZyYYdwOpAJB5EHELdGIgwtPgjjlMm2mFJQCufyV8sd
	d8g==
X-Google-Smtp-Source: AGHT+IG89v4lIFRhnNqxe9hFvIIxqDvldHGwH//6ib2L4odxYyk8SJA2JGOjXIHuxBeh8ylp7HgA6abaBbM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:eac4:b0:2e2:8f4d:457 with SMTP id
 98e67ed59e1d1-2e2c80b5015mr7266a91.2.1728584689990; Thu, 10 Oct 2024 11:24:49
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:03 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-2-seanjc@google.com>
Subject: [PATCH v13 01/85] KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead return
 NULL to indicate an error
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
X-CRM114-CacheID: sfid-20241010_112453_380243_83DC830D 
X-CRM114-Status: GOOD (  12.25  )
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

UmVtb3ZlIEtWTV9FUlJfUFRSX0JBRF9QQUdFIGFuZCBpbnN0ZWFkIHJldHVybiBOVUxMLCBhcyAi
YmFkIHBhZ2UiIGlzIGp1c3QKYSBsZWZ0b3ZlciBiaXQgb2Ygd2VpcmRuZXNzIGZyb20gZGF5cyBv
ZiBvbGQgd2hlbiBLVk0gc3R1ZmZlZCBhICJiYWQiIHBhZ2UKaW50byB0aGUgZ3Vlc3QgaW5zdGVh
ZCBvZiBhY3R1YWxseSBoYW5kbGluZyBtaXNzaW5nIHBhZ2VzLiAgU2VlIGNvbW1pdApjZWE3YmIy
MTI4MGUgKCJLVk06IE1NVTogTWFrZSBnZm5fdG9fcGFnZSgpIGFsd2F5cyBzYWZlIikuCgpSZXZp
ZXdlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpUZXN0ZWQtYnk6
IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogYXJjaC9wb3dlcnBjL2t2
bS9ib29rM3NfcHIuYyAgICAgICAgICB8ICAyICstCiBhcmNoL3Bvd2VycGMva3ZtL2Jvb2szc194
aXZlX25hdGl2ZS5jIHwgIDIgKy0KIGFyY2gvczM5MC9rdm0vdnNpZS5jICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogYXJjaC94ODYva3ZtL2xhcGljLmMgICAgICAgICAgICAgICAgICB8ICAyICst
CiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgICAgICAgIHwgIDcgLS0tLS0tLQogdmly
dC9rdm0va3ZtX21haW4uYyAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKy0tLS0tLS0tLQog
NiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMva3ZtL2Jvb2szc19wci5jIGIvYXJjaC9wb3dlcnBjL2t2bS9i
b29rM3NfcHIuYwppbmRleCA3YjhhZTUwOTMyOGYuLmQ3NzIxMjk3YjliNiAxMDA2NDQKLS0tIGEv
YXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfcHIuYworKysgYi9hcmNoL3Bvd2VycGMva3ZtL2Jvb2sz
c19wci5jCkBAIC02NDUsNyArNjQ1LDcgQEAgc3RhdGljIHZvaWQga3ZtcHBjX3BhdGNoX2RjYnoo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtcHBjX3B0ZSAqcHRlKQogCWludCBpOwog
CiAJaHBhZ2UgPSBnZm5fdG9fcGFnZSh2Y3B1LT5rdm0sIHB0ZS0+cmFkZHIgPj4gUEFHRV9TSElG
VCk7Ci0JaWYgKGlzX2Vycm9yX3BhZ2UoaHBhZ2UpKQorCWlmICghaHBhZ2UpCiAJCXJldHVybjsK
IAogCWhwYWdlX29mZnNldCA9IHB0ZS0+cmFkZHIgJiB+UEFHRV9NQVNLOwpkaWZmIC0tZ2l0IGEv
YXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfeGl2ZV9uYXRpdmUuYyBiL2FyY2gvcG93ZXJwYy9rdm0v
Ym9vazNzX3hpdmVfbmF0aXZlLmMKaW5kZXggNmUyZWJiZDhhYWFjLi5kOWJmMWJjM2ZmNjEgMTAw
NjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzX3hpdmVfbmF0aXZlLmMKKysrIGIvYXJj
aC9wb3dlcnBjL2t2bS9ib29rM3NfeGl2ZV9uYXRpdmUuYwpAQCAtNjU0LDcgKzY1NCw3IEBAIHN0
YXRpYyBpbnQga3ZtcHBjX3hpdmVfbmF0aXZlX3NldF9xdWV1ZV9jb25maWcoc3RydWN0IGt2bXBw
Y194aXZlICp4aXZlLAogCX0KIAogCXBhZ2UgPSBnZm5fdG9fcGFnZShrdm0sIGdmbik7Ci0JaWYg
KGlzX2Vycm9yX3BhZ2UocGFnZSkpIHsKKwlpZiAoIXBhZ2UpIHsKIAkJc3JjdV9yZWFkX3VubG9j
aygma3ZtLT5zcmN1LCBzcmN1X2lkeCk7CiAJCXByX2VycigiQ291bGRuJ3QgZ2V0IHF1ZXVlIHBh
Z2UgJWxseCFcbiIsIGt2bV9lcS5xYWRkcik7CiAJCXJldHVybiAtRUlOVkFMOwpkaWZmIC0tZ2l0
IGEvYXJjaC9zMzkwL2t2bS92c2llLmMgYi9hcmNoL3MzOTAva3ZtL3ZzaWUuYwppbmRleCA4OWNh
ZmVhNGM0MWYuLjc2M2EwNzBmNTk1NSAxMDA2NDQKLS0tIGEvYXJjaC9zMzkwL2t2bS92c2llLmMK
KysrIGIvYXJjaC9zMzkwL2t2bS92c2llLmMKQEAgLTY2MSw3ICs2NjEsNyBAQCBzdGF0aWMgaW50
IHBpbl9ndWVzdF9wYWdlKHN0cnVjdCBrdm0gKmt2bSwgZ3BhX3QgZ3BhLCBocGFfdCAqaHBhKQog
CXN0cnVjdCBwYWdlICpwYWdlOwogCiAJcGFnZSA9IGdmbl90b19wYWdlKGt2bSwgZ3BhX3RvX2dm
bihncGEpKTsKLQlpZiAoaXNfZXJyb3JfcGFnZShwYWdlKSkKKwlpZiAoIXBhZ2UpCiAJCXJldHVy
biAtRUlOVkFMOwogCSpocGEgPSAoaHBhX3QpcGFnZV90b19waHlzKHBhZ2UpICsgKGdwYSAmIH5Q
QUdFX01BU0spOwogCXJldHVybiAwOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2xhcGljLmMg
Yi9hcmNoL3g4Ni9rdm0vbGFwaWMuYwppbmRleCAyMDk4ZGM2ODkwODguLjIwNTI2ZTRkNmM2MiAx
MDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2xhcGljLmMKKysrIGIvYXJjaC94ODYva3ZtL2xhcGlj
LmMKQEAgLTI2NjQsNyArMjY2NCw3IEBAIGludCBrdm1fYWxsb2NfYXBpY19hY2Nlc3NfcGFnZShz
dHJ1Y3Qga3ZtICprdm0pCiAJfQogCiAJcGFnZSA9IGdmbl90b19wYWdlKGt2bSwgQVBJQ19ERUZB
VUxUX1BIWVNfQkFTRSA+PiBQQUdFX1NISUZUKTsKLQlpZiAoaXNfZXJyb3JfcGFnZShwYWdlKSkg
eworCWlmICghcGFnZSkgewogCQlyZXQgPSAtRUZBVUxUOwogCQlnb3RvIG91dDsKIAl9CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmgKaW5kZXggZGI1NjdkMjZmN2I5Li5lZTE4NmExZmJhYWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKQEAgLTE1Mywx
MyArMTUzLDYgQEAgc3RhdGljIGlubGluZSBib29sIGt2bV9pc19lcnJvcl9ncGEoZ3BhX3QgZ3Bh
KQogCXJldHVybiBncGEgPT0gSU5WQUxJRF9HUEE7CiB9CiAKLSNkZWZpbmUgS1ZNX0VSUl9QVFJf
QkFEX1BBR0UJKEVSUl9QVFIoLUVOT0VOVCkpCi0KLXN0YXRpYyBpbmxpbmUgYm9vbCBpc19lcnJv
cl9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQotewotCXJldHVybiBJU19FUlIocGFnZSk7Ci19Ci0K
ICNkZWZpbmUgS1ZNX1JFUVVFU1RfTUFTSyAgICAgICAgICAgR0VOTUFTSyg3LDApCiAjZGVmaW5l
IEtWTV9SRVFVRVNUX05PX1dBS0VVUCAgICAgIEJJVCg4KQogI2RlZmluZSBLVk1fUkVRVUVTVF9X
QUlUICAgICAgICAgICBCSVQoOSkKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92
aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDA1Y2JiMjU0OGQ5OS4uNGI2NTlhNjQ5ZGZhIDEwMDY0
NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAg
LTMwNzgsMTkgKzMwNzgsMTQgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZ2ZuX3RvX3BhZ2VfbWFueV9h
dG9taWMpOwogICovCiBzdHJ1Y3QgcGFnZSAqZ2ZuX3RvX3BhZ2Uoc3RydWN0IGt2bSAqa3ZtLCBn
Zm5fdCBnZm4pCiB7Ci0Jc3RydWN0IHBhZ2UgKnBhZ2U7CiAJa3ZtX3Bmbl90IHBmbjsKIAogCXBm
biA9IGdmbl90b19wZm4oa3ZtLCBnZm4pOwogCiAJaWYgKGlzX2Vycm9yX25vc2xvdF9wZm4ocGZu
KSkKLQkJcmV0dXJuIEtWTV9FUlJfUFRSX0JBRF9QQUdFOworCQlyZXR1cm4gTlVMTDsKIAotCXBh
Z2UgPSBrdm1fcGZuX3RvX3JlZmNvdW50ZWRfcGFnZShwZm4pOwotCWlmICghcGFnZSkKLQkJcmV0
dXJuIEtWTV9FUlJfUFRSX0JBRF9QQUdFOwotCi0JcmV0dXJuIHBhZ2U7CisJcmV0dXJuIGt2bV9w
Zm5fdG9fcmVmY291bnRlZF9wYWdlKHBmbik7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChnZm5fdG9f
cGFnZSk7CiAKQEAgLTMxODQsNyArMzE3OSw4IEBAIHN0YXRpYyB2b2lkIGt2bV9zZXRfcGFnZV9h
Y2Nlc3NlZChzdHJ1Y3QgcGFnZSAqcGFnZSkKIAogdm9pZCBrdm1fcmVsZWFzZV9wYWdlX2NsZWFu
KHN0cnVjdCBwYWdlICpwYWdlKQogewotCVdBUk5fT04oaXNfZXJyb3JfcGFnZShwYWdlKSk7CisJ
aWYgKFdBUk5fT04oIXBhZ2UpKQorCQlyZXR1cm47CiAKIAlrdm1fc2V0X3BhZ2VfYWNjZXNzZWQo
cGFnZSk7CiAJcHV0X3BhZ2UocGFnZSk7CkBAIC0zMjA4LDcgKzMyMDQsOCBAQCBFWFBPUlRfU1lN
Qk9MX0dQTChrdm1fcmVsZWFzZV9wZm5fY2xlYW4pOwogCiB2b2lkIGt2bV9yZWxlYXNlX3BhZ2Vf
ZGlydHkoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7Ci0JV0FSTl9PTihpc19lcnJvcl9wYWdlKHBhZ2Up
KTsKKwlpZiAoV0FSTl9PTighcGFnZSkpCisJCXJldHVybjsKIAogCWt2bV9zZXRfcGFnZV9kaXJ0
eShwYWdlKTsKIAlrdm1fcmVsZWFzZV9wYWdlX2NsZWFuKHBhZ2UpOwotLSAKMi40Ny4wLnJjMS4y
ODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
