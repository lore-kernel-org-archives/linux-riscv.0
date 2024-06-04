Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A143DC27C54
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWciAhU+GYv+EBf9ChiL8xuImgEczE8cvuoa/6InCyw=; b=QwYXUiAqO9JDk5
	23HG0xzUF5hEKSlurtdZOtjc+lE5+YmgkOG94jt6WM+6qnF0oFYp5JX2OzT/keJWt2il2wtiHqvDo
	p6RAhQGTrzzMabL3+iTuzrBxEg4g/QHEuhkqE4xbJS5AhgJa6UqnLN1iNUDiCW/VsBe0hLKjDbvdT
	Qq6nFHgXPmAb1bHts/idpxFGb81VXklJKnghF6gVtXqsxf71BVv/MvTCHUTL78RSExyxnePW5a00I
	i16I+MGtrjkhpemd4MokIYlz/XBBsIJBldnO4ZLfIoDRFEXzYn1DX8rM2mxxn2M3QntoqmRcc83YI
	4towQTJQiQ75v1tcsXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETa1-00000002MJq-0hqI;
	Tue, 04 Jun 2024 12:47:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZy-00000002MH5-005n
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:47:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f63b38e0b7so955775ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505273; x=1718110073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/zDxQ1wNU0fShOzqJmwZ3vgRBHHUpydDqOkR2GCFDo=;
        b=hBtD7Mps6y82cd1+VJR4O0aoUsBmZGnnXIqyKCSvZSPW9CehYqAHd1Np7tK/JOtxhi
         hFnmUsZZnjcqGAZwp0tvoa71WGawm4idKwI6jd1CZRea/2lFvuXmbSlS+s00LlCFVl1l
         8TbGIwlOGCTEKm2heHDEICHywisErcFtKtlpBcmMH5PWv+C5G/dDtthNdRW4LmDe478/
         aUxTjyIMM9LZkyMdVikrUUN6CLM9BG0WeUsbqrPxHEcl3PB/j3N47x/iw0nRjZVfSCQ8
         4cLdELCKVyy+qxZYwvXchc598lbUxLU6zpCpYFZrhVHk5Njjw2r3FRu0jSt3kQWmDVLJ
         O6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505273; x=1718110073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/zDxQ1wNU0fShOzqJmwZ3vgRBHHUpydDqOkR2GCFDo=;
        b=Ioa2QWjNTCDwDinAY5KtMOAxYNTpk7VjpztNA84RKmJO46HfNoTrT/l669VCbq5UOF
         JXKJypOCDjmTfq5ppwAYmbJEi2jDXMwVfhXDvG/UfHCeaa30GAWWbql9ZSphVwSZGDjO
         zeAGlIUwJcs13EapruAH83QYdwpxyZwfGOYQTBsi0mHSGJETJ7IlE0rnKzIaD5AHZUyz
         LEls2sTMxj2POwfu12eO6oeavZ26LknrcsmSRTJ2oWfAKqayYVMGBqV1RbgqOGRjqu4U
         QBNM2Zi/T8V+aIizZoixkcbgTnmbbNrJ2YJQpwDGPjaZeM84cchQ3lMrwhNK45KWCh3c
         lGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBNVzFytOCKjAAu8h3oXwutVd6itLwGjfnkYbGP2iKUS2IMuin2MyUDP0PU9x1llLaMnGuw6VeO3sYg72S0ue4+KdFHg+8q5IuFtl+twmG
X-Gm-Message-State: AOJu0YwCg5mpWh/dMJ16MK7eDsz5kGMaz9c4PAYU23YegRD+19qVGIuZ
	CIwe6QagQUpPLoHPk6juv3GD/9HfvCpZ35XuR2W4a8mRxjCB7vz8P2pkFlAZ8lE=
X-Google-Smtp-Source: AGHT+IHL5IgKhDmX6Kc3c3T4qmZjDYR+RyEsuG7i3u6/l8X2M2rVeZab4G99cMOKYRyDxecIvsMepQ==
X-Received: by 2002:a17:902:f68b:b0:1f6:39cc:46cb with SMTP id d9443c01a7336-1f639cc52ccmr132738995ad.5.1717505273278;
        Tue, 04 Jun 2024 05:47:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Tue,  4 Jun 2024 14:45:41 +0200
Message-ID: <20240604124550.3214710-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054754_080639_1C2AC7B8 
X-CRM114-Status: GOOD (  10.92  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RXhwb3J0IFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9i
ZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
UmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQog
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDIwICsrKysrKysrKysrKysr
KysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgIDQgKysrKwog
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8ICA0ICsrKysKIDMgZmlsZXMg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dAppbmRleCA0OGJlMzhlMGI3ODguLmNhZDg0ZjUxNDEyZCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9od3Byb2JlLnJzdApAQCAtMTk2LDYgKzE5NiwyNiBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJl
IGRlZmluZWQ6CiAgICAgICAgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0Eg
bWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0CiAgICAgICAgNTgyMjA2MTRhNWYgKCJaaW1vcCBp
cyByYXRpZmllZC8xLjAiKS4KIAorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQ0Fg
OiBUaGUgWmNhIGV4dGVuc2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZAorICAgICAgIGV4dGVuc2lv
bnMgZm9yIGNvZGUgc2l6ZSByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5
YzFjMAorICAgICAgICgiWmNmIGRvZXNuJ3QgZXhpc3Qgb24gUlY2NCBhcyBpdCBjb250YWlucyBu
byBpbnN0cnVjdGlvbnMiKSBvZgorICAgICAgIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24uCisK
KyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkNCYDogVGhlIFpjYiBleHRlbnNpb24g
cGFydCBvZiBaYyogc3RhbmRhcmQKKyAgICAgICBleHRlbnNpb25zIGZvciBjb2RlIHNpemUgcmVk
dWN0aW9uLCBhcyByYXRpZmllZCBpbiBjb21taXQgOGJlMzQxOWMxYzAKKyAgICAgICAoIlpjZiBk
b2Vzbid0IGV4aXN0IG9uIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YK
KyAgICAgICByaXNjdi1jb2RlLXNpemUtcmVkdWN0aW9uLgorCisgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfRVhUX1pDRGA6IFRoZSBaY2QgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJk
CisgICAgICAgZXh0ZW5zaW9ucyBmb3IgY29kZSBzaXplIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQg
aW4gY29tbWl0IDhiZTM0MTljMWMwCisgICAgICAgKCJaY2YgZG9lc24ndCBleGlzdCBvbiBSVjY0
IGFzIGl0IGNvbnRhaW5zIG5vIGluc3RydWN0aW9ucyIpIG9mCisgICAgICAgcmlzY3YtY29kZS1z
aXplLXJlZHVjdGlvbi4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQ0ZgOiBU
aGUgWmNmIGV4dGVuc2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZAorICAgICAgIGV4dGVuc2lvbnMg
Zm9yIGNvZGUgc2l6ZSByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFj
MAorICAgICAgICgiWmNmIGRvZXNuJ3QgZXhpc3Qgb24gUlY2NCBhcyBpdCBjb250YWlucyBubyBp
bnN0cnVjdGlvbnMiKSBvZgorICAgICAgIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24uCisKICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNv
bnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQg
b2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXgg
NTc1Yjk1NzQ0ODQzLi5mYmEzZDc0MTU0YjEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaApAQCAtNjEsNiArNjEsMTAgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgxVUxMIDw8IDM1KQogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWklISU5UUEFVU0UJKDFVTEwgPDwgMzYpCiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aSU1PUAkJKDFVTEwgPDwgMzcpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
Q0EJCSgxVUxMIDw8IDM4KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNCCQkoMVVMTCA8
PCAzOSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDRAkJKDFVTEwgPDwgNDApCisjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0YJCSgxVUxMIDw8IDQxKQogI2RlZmluZSBSSVNDVl9I
V1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVE
X1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVM
QVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5kZXggZmM2ZjQyMzhmMGIzLi4x
MWRlZjM0NWE0MmQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpAQCAtMTEzLDYgKzExMyw4IEBA
IHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIs
CiAJCUVYVF9LRVkoWklDT05EKTsKIAkJRVhUX0tFWShaSUhJTlRQQVVTRSk7CiAJCUVYVF9LRVko
WklNT1ApOworCQlFWFRfS0VZKFpDQSk7CisJCUVYVF9LRVkoWkNCKTsKIAogCQlpZiAoaGFzX3Zl
Y3RvcigpKSB7CiAJCQlFWFRfS0VZKFpWQkIpOwpAQCAtMTMzLDYgKzEzNSw4IEBAIHN0YXRpYyB2
b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCQlFWFRf
S0VZKFpGSCk7CiAJCQlFWFRfS0VZKFpGSE1JTik7CiAJCQlFWFRfS0VZKFpGQSk7CisJCQlFWFRf
S0VZKFpDRCk7CisJCQlFWFRfS0VZKFpDRik7CiAJCX0KICN1bmRlZiBFWFRfS0VZCiAJfQotLSAK
Mi40NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
