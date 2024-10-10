Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B414D2444F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LljG5y5OtePdz6zv/Y9FrxpXXIp4krs/rdLlRD98ww=; b=Wa3Z8EI/NOKuBw
	3tERcKwT+o88p2QTfiO4UQ6ejRljtzekPL++ExWjjj2OsWi9avouaX6bv6Gf+doZA5ZTgvKPgC4yP
	F6ogmb/JlTINxTJamRJM2UCWEpa2cYGGzxcaF5NGWDCCTi6yjFuFQsSPCcXiwS2WMfEM8Umlq++eu
	g/rxrtblfO7B8KZkPXdVl3B0BLNISeXtuOKjOGm5Eaa/Dx7WTd/32QLorvnUHEIycgXp1A/LMkPfH
	50nIvlf9rKhL5uAZI9PpZ3V1wgEP+7paVTgSWVwhn9rsoOuRctmd1MqFaAUJwrRNrfQWgnxcoK6di
	Je6FqhNEr08jv3t1ZK6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1SS-0000000EVvs-0rDP;
	Thu, 10 Oct 2024 22:16:32 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxss-0000000DrkA-41Nx
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:36 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e28b624bfcso20418157b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584854; x=1729189654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=aLG1ERGsB5NvGh5NeKe3MCWim49sfOkO/B4LSwLQ0B6zMt1Z4zcHaGKAQHVba9OrFU
         QUTVJ4caJJgKcEln7aMvhzkYAClxH4agKnVmAQUlEtIcIbWcMEx6nPQMfPsnIsjywymV
         H6URPqrZmddDnbO3fB+DaERHSqNHQzuWZ0yDyezoaY8+rRHdLQ4Ga8EmDXO1zEkwK9s3
         g+YEQ2EL99QEKhplKwek9Qwbsoh5C+rUXoK63HH2nyy1uU/moUakBBPGG28zmfGGFcjz
         h/DZDDZHkaZcqSHfipSgnfEpXCOx/kjd+vWOiVgJh82gxS0bYE1WVYdtDM+oPtbZzxJT
         x46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584854; x=1729189654;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQZoDf0NIFdWK0Ory3IxzF5D2dmoMJWboRGGHV/nWyI=;
        b=S1ziD+oKTBa32EJevU/76io/bxT+g3l0oxZLZWbTD8kzFOXRaXgI/uYlQzEZ31qVp8
         218/cUetURG1ffDplE3dHuFeDrW/Dw7UIoq6eNzo8WMiNyEpRIaTPbI9x7drZowjTqnc
         AGy7uT0PsLg1rxfq0nzG2zCre96w5A+DHCEiM2k44WduxPU+FrmuJHVQ28ho9u4oFjmA
         Atmql6ZvGoI7wrnCgJq0XAuENiDAiDzA/URnCPbxQVhELp5tx48rnv2Kc17CcdIbiLoM
         axILFMmJ2Q5vp99g6vsymYVkq1rQnbAfPgSgnPvfTAbqd4yCYFTeR7z1hhGeU+hLkBcg
         /P2g==
X-Forwarded-Encrypted: i=1; AJvYcCUEdrcI2JULXn2Tla3zzRS6jNvdzipWeo0IpeIotFE6LzseF1Llmb+nLGKsTsjpB3g2hbap2OQ7oYxFyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTDJQgp03sXTcjoO+eqRK2TGV7CswJT9psJzV3XZAhPunFk4SV
	DrSXn0pb8qex5S7XFBsnYxkhaNBEaNA0yWB2u8nGhqZrreRhS6YBBwkSNaV7VnvoSs4aDQumKdL
	Z1w==
X-Google-Smtp-Source: AGHT+IGkMjnJcd2oWHVLgC5xfQJb4mHLQjnUvb6XgW9ZV8VH9lzrMuhcRfl3e0TBTVqXdJBO9V/Z2ttoh2Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4091:b0:64a:e220:bfb5 with SMTP id
 00721157ae682-6e32213fbacmr192077b3.1.1728584853563; Thu, 10 Oct 2024
 11:27:33 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:18 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-77-seanjc@google.com>
Subject: [PATCH v13 76/85] KVM: Add support for read-only usage of gfn_to_page()
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
X-CRM114-CacheID: sfid-20241010_112735_109685_FE26BD8C 
X-CRM114-Status: GOOD (  14.01  )
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

UmV3b3JrIGdmbl90b19wYWdlKCkgdG8gc3VwcG9ydCByZWFkLW9ubHkgYWNjZXNzZXMgc28gdGhh
dCBpdCBjYW4gYmUgdXNlZApieSBhcm02NCB0byBnZXQgTVRFIHRhZ3Mgb3V0IG9mIGd1ZXN0IG1l
bW9yeS4KCk9wcG9ydHVuaXN0aWNhbGx5IHJld3JpdGUgdGhlIGNvbW1lbnQgdG8gYmUgZXZlbiBt
b3JlIHN0ZXJuIGFib3V0IHVzaW5nCmdmbl90b19wYWdlKCksIGFzIHRoZXJlIGFyZSB2ZXJ5IGZl
dyBzY2VuYXJpb3Mgd2hlcmUgcmVxdWlyaW5nIGEgc3RydWN0CnBhZ2UgaXMgYWN0dWFsbHkgdGhl
IHJpZ2h0IHRoaW5nIHRvIGRvICh0aG91Z2ggdGhlcmUgYXJlIHN1Y2ggc2NlbmFyaW9zKS4KQWRk
IGEgRklYTUUgdG8gY2FsbCBvdXQgdGhhdCBLVk0gcHJvYmFibHkgc2hvdWxkIGJlIHBpbm5pbmcg
cGFnZXMsIG5vdApqdXN0IGdldHRpbmcgcGFnZXMuCgpUZXN0ZWQtYnk6IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNv
biA8c2VhbmpjQGdvb2dsZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwgIDcg
KysrKysrLQogdmlydC9rdm0va3ZtX21haW4uYyAgICAgIHwgMTUgKysrKysrKystLS0tLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5o
CmluZGV4IDlmNzY4MmVjZTRhMS4uYWY5MjhiNTliMmFiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L2t2bV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC0xMjEzLDcg
KzEyMTMsMTIgQEAgdm9pZCBrdm1fYXJjaF9mbHVzaF9zaGFkb3dfbWVtc2xvdChzdHJ1Y3Qga3Zt
ICprdm0sCiBpbnQga3ZtX3ByZWZldGNoX3BhZ2VzKHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNs
b3QsIGdmbl90IGdmbiwKIAkJICAgICAgIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCBucl9wYWdl
cyk7CiAKLXN0cnVjdCBwYWdlICpnZm5fdG9fcGFnZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdm
bik7CitzdHJ1Y3QgcGFnZSAqX19nZm5fdG9fcGFnZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdm
biwgYm9vbCB3cml0ZSk7CitzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICpnZm5fdG9fcGFnZShz
dHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbikKK3sKKwlyZXR1cm4gX19nZm5fdG9fcGFnZShrdm0s
IGdmbiwgdHJ1ZSk7Cit9CisKIHVuc2lnbmVkIGxvbmcgZ2ZuX3RvX2h2YShzdHJ1Y3Qga3ZtICpr
dm0sIGdmbl90IGdmbik7CiB1bnNpZ25lZCBsb25nIGdmbl90b19odmFfcHJvdChzdHJ1Y3Qga3Zt
ICprdm0sIGdmbl90IGdmbiwgYm9vbCAqd3JpdGFibGUpOwogdW5zaWduZWQgbG9uZyBnZm5fdG9f
aHZhX21lbXNsb3Qoc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwgZ2ZuX3QgZ2ZuKTsKZGlm
ZiAtLWdpdCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4
IDE3ODIyNDJhNDgwMC4uOGY4YjJjZDAxMTg5IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFp
bi5jCisrKyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTMxMzgsMjUgKzMxMzgsMjYgQEAgaW50
IGt2bV9wcmVmZXRjaF9wYWdlcyhzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCBnZm5fdCBn
Zm4sCiBFWFBPUlRfU1lNQk9MX0dQTChrdm1fcHJlZmV0Y2hfcGFnZXMpOwogCiAvKgotICogRG8g
bm90IHVzZSB0aGlzIGhlbHBlciB1bmxlc3MgeW91IGFyZSBhYnNvbHV0ZWx5IGNlcnRhaW4gdGhl
IGdmbiBfbXVzdF8gYmUKLSAqIGJhY2tlZCBieSAnc3RydWN0IHBhZ2UnLiAgQSB2YWxpZCBleGFt
cGxlIGlzIGlmIHRoZSBiYWNraW5nIG1lbXNsb3QgaXMKLSAqIGNvbnRyb2xsZWQgYnkgS1ZNLiAg
Tm90ZSwgaWYgdGhlIHJldHVybmVkIHBhZ2UgaXMgdmFsaWQsIGl0J3MgcmVmY291bnQgaGFzCi0g
KiBiZWVuIGVsZXZhdGVkIGJ5IGdmbl90b19wZm4oKS4KKyAqIERvbid0IHVzZSB0aGlzIEFQSSB1
bmxlc3MgeW91IGFyZSBhYnNvbHV0ZWx5LCBwb3NpdGl2ZWx5IGNlcnRhaW4gdGhhdCBLVk0KKyAq
IG5lZWRzIHRvIGdldCBhIHN0cnVjdCBwYWdlLCBlLmcuIHRvIHBpbiB0aGUgcGFnZSBmb3IgZmly
bXdhcmUgRE1BLgorICoKKyAqIEZJWE1FOiBVc2VycyBvZiB0aGlzIEFQSSBsaWtlbHkgbmVlZCB0
byBGT0xMX1BJTiB0aGUgcGFnZSwgbm90IGp1c3QgZWxldmF0ZQorICoJICBpdHMgcmVmY291bnQu
CiAgKi8KLXN0cnVjdCBwYWdlICpnZm5fdG9fcGFnZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdm
bikKK3N0cnVjdCBwYWdlICpfX2dmbl90b19wYWdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2Zu
LCBib29sIHdyaXRlKQogewogCXN0cnVjdCBwYWdlICpyZWZjb3VudGVkX3BhZ2UgPSBOVUxMOwog
CXN0cnVjdCBrdm1fZm9sbG93X3BmbiBrZnAgPSB7CiAJCS5zbG90ID0gZ2ZuX3RvX21lbXNsb3Qo
a3ZtLCBnZm4pLAogCQkuZ2ZuID0gZ2ZuLAotCQkuZmxhZ3MgPSBGT0xMX1dSSVRFLAorCQkuZmxh
Z3MgPSB3cml0ZSA/IEZPTExfV1JJVEUgOiAwLAogCQkucmVmY291bnRlZF9wYWdlID0gJnJlZmNv
dW50ZWRfcGFnZSwKIAl9OwogCiAJKHZvaWQpa3ZtX2ZvbGxvd19wZm4oJmtmcCk7CiAJcmV0dXJu
IHJlZmNvdW50ZWRfcGFnZTsKIH0KLUVYUE9SVF9TWU1CT0xfR1BMKGdmbl90b19wYWdlKTsKK0VY
UE9SVF9TWU1CT0xfR1BMKF9fZ2ZuX3RvX3BhZ2UpOwogCiBpbnQgX19rdm1fdmNwdV9tYXAoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sIHN0cnVjdCBrdm1faG9zdF9tYXAgKm1hcCwK
IAkJICAgYm9vbCB3cml0YWJsZSkKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
