Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D25CCF9FE
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F+GQ8SmcOtT8+UBsVZLGne5BfFtlRL0/twNhSv2A4dw=; b=PLINcCCJOOMhbE
	lB7YleNUjq1JkWpU9Zsw1BXF6XP6vps1mWU5Pqwn8mSu14G9xDU3nTBXbxLckvdCsH2p31ZeyF2ml
	UqvPR/lJRdqOw4wCzCC0jyzw+cR+1EfrRDpAcok2E9l15I3sWofEim+k41VsjWjdLKUdUP6XIqfBc
	P9cNIZKoYiwPPc09vqlhLVtDnUenE+1yOFc4830MDkrS9hG8MTphZO9ZnAlDSE9mVyB1wV399VBOH
	Y6bCB6GxAYPm8lYViPlfUx2hsX8tdphxa4EK0ofniLW/bVc2W/qlIB8FwmpMeDYFkLyyD9i3PArUm
	IxaAOy1kki36JeFLHSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo3V-00000009IeI-1m4r;
	Mon, 03 Nov 2025 06:28:41 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo3T-00000009IdQ-04tk
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 06:28:40 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-b98a619f020so1194969a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 02 Nov 2025 22:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762151318; x=1762756118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzWLA6lM7306PSkRpZwBsCJQbgLVcWr7Jb7jPn8ULYQ=;
        b=lprfn7tYTh2GbhHilzO9O7ui+jrSL8wzdY/GYO1rd12fJ0dwUr/62CskHPn8hKSSyr
         UWwNgaZJa1IPy+v2cm1zx+E9N/dqGeJ1uMac3+/D7rnPv5gIbzei1BseS1qVzeG9W2U9
         RIGLJ6XyDejJc/d8zzu1t6+dcn8yhLESvko8hwt8PpVnm220AfjoFPFmY+o+MQOGYn0p
         8OZGocGijSkvFUEkBv7l+Jsp1UfpQidzvKTrGhETVP6Egj7aSsClb8OufsMF/rg2bMie
         F3YHwRAc1Hd5zvC0oKvlTYGJDVCoHoKtROKYVWNJ6dQd5LGg/Z5sMglGoUnkyaLYMdpz
         CtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762151318; x=1762756118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzWLA6lM7306PSkRpZwBsCJQbgLVcWr7Jb7jPn8ULYQ=;
        b=aGWqEYJYzhZvBQe40VG2lPGwOpPsXd79duJiifS856t8batLzHMEfoI0ikyJx69Por
         jb4Z93sTY7wupiK63FDtJzUn7SAKIWodTZonPRMatm6OuEIKocwHYI1oYnFXapU0vgQQ
         d25MhO+14cguRjJe3AyRORivVddrJvhMHeYWecVg8PxU3dIJpTUL4hhBlU8yMTlHN2eh
         +sxyw5YB7Bc/0VYOm7vRBl3ARcRObMZGD9q0AD83Y0tMX9w3mdXZP1Z5kNZMCszddgCA
         vhSHQNspHOxV3k1aeKkpyL7z1GrfKUCiZGOqUjhjShxx28WYZa03dVKynoan/knsbBbU
         u7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV0Q9R1iUn016Udau5wcp4J5p3Oka+TqzEoFpveVwKzCkPfOuAm5FSpcYOihMqIva2ZTP8CxhCrk5+rmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyND6pdiYndOabooDJ8G9JqeXqBUnUn5JzBxVMgfZXetexG1YeY
	fone04RNCt14HFdC+HY5etijKP3NL0dNF8QJaIO9HGsl7ei4S09jaJ/3
X-Gm-Gg: ASbGncv31S1xnZ98efhKgl6io3C5Mp6R6vi/M3uK6EAQSi6yNs5w+vNfDhKWC5Ri6P/
	FTM1IQ554Gdqx1bM0pmObS5KppyGxZUwZbHGSkw43w3qFHsm4wzyon6boB3waLHBVszeIqYOA0X
	+h46T3TQjqW5GK9oh0vzfnAGM7VShPe9fu6tClBsNNnR6DDRjWX9+nBhdkN+JqnLPCPKVV+f3QK
	4H2BHvMB1DXqkGcDnVQt/0ukTVjFNZkpL1WTsh8Ga3L8UItP526mpbJifyLWKGcKllLwWqd+pcx
	6ZrnLSggdHP9jCM4tdj6soYH1pMiwvvUD8TWcamRjk5rTmSA20hKeiHaIfaCQRpT+svtsqWsEp2
	CaD6OUb7GGBHxGhA5DEiDPZMmv1wvDGnypWkCItkPjvw5e0RQVfJ6A3wjGZpnWnLnZ4DOpQ8cDg
	XPCqj/XSUzrrfHT6mty4LQ
X-Google-Smtp-Source: AGHT+IGieiNu6B5gkgyoDggtQ7uHFE1tUXXst+2hCFavgg4oBRkDQVMrd9IkdCDUo5boIWBJw2G0nw==
X-Received: by 2002:a17:902:c407:b0:295:57f6:76b with SMTP id d9443c01a7336-29557f60d3bmr68472355ad.7.1762151317697;
        Sun, 02 Nov 2025 22:28:37 -0800 (PST)
Received: from days-ASUSLaptop.lan ([110.191.181.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699c482sm108155595ad.80.2025.11.02.22.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 22:28:37 -0800 (PST)
From: dayss1224@gmail.com
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Dong Yang <dayss1224@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH] KVM: riscv: Support enabling dirty log gradually in small chunks
Date: Mon,  3 Nov 2025 14:28:25 +0800
Message-Id: <20251103062825.9084-1-dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_222839_068437_A185BA88 
X-CRM114-Status: GOOD (  15.53  )
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

RnJvbTogRG9uZyBZYW5nIDxkYXlzczEyMjRAZ21haWwuY29tPgoKVGhlcmUgaXMgYWxyZWFkeSBz
dXBwb3J0IG9mIGVuYWJsaW5nIGRpcnR5IGxvZyBncmFkdWFsbHkgaW4gc21hbGwgY2h1bmtzCmZv
ciB4ODYgaW4gY29tbWl0IDNjOWJkNDAwNmJmYyAoIktWTTogeDg2OiBlbmFibGUgZGlydHkgbG9n
IGdyYWR1YWxseSBpbgpzbWFsbCBjaHVua3MiKSBhbmQgYzg2MjYyNiAoIktWTTogYXJtNjQ6IFN1
cHBvcnQgZW5hYmxpbmcgZGlydHkgbG9nCmdyYWR1YWxseSBpbiBzbWFsbCBjaHVua3MiKS4gVGhp
cyBhZGRzIHN1cHBvcnQgZm9yIHJpc2N2LgoKeDg2IGFuZCBhcm02NCB3cml0ZXMgcHJvdGVjdCBi
b3RoIGh1Z2UgcGFnZXMgYW5kIG5vcm1hbCBwYWdlcyBub3csIHNvCnJpc2N2IHByb3RlY3QgYWxz
byBwcm90ZWN0cyBib3RoIGh1Z2UgcGFnZXMgYW5kIG5vcm1hbCBwYWdlcy4KCk9uIGEgbmVzdGVk
IHZpcnR1YWxpemF0aW9uIHNldHVwIChSSVNDLVYgS1ZNIHJ1bm5pbmcgaW5zaWRlIGEgUUVNVSBW
TQpvbiBhbiBbSW50ZWzCriBDb3Jl4oSiIGk1LTEyNTAwSF0gaG9zdCksIEkgZGlkIHNvbWUgdGVz
dHMgd2l0aCBhIDJHIExpbnV4ClZNIHVzaW5nIGRpZmZlcmVudCBiYWNraW5nIHBhZ2Ugc2l6ZXMu
IFRoZSB0aW1lIHRha2VuIGZvcgptZW1vcnlfZ2xvYmFsX2RpcnR5X2xvZ19zdGFydCBpbiB0aGUg
TDIgUUVNVSBpcyBsaXN0ZWQgYmVsb3c6CgpQYWdlIFNpemUgICAgICBCZWZvcmUgICAgQWZ0ZXIg
T3B0aW1pemF0aW9uCiAgNEsgICAgICAgICAgICA0NDkwLjIzbXMgICAgICAgICAzMS45NG1zCiAg
Mk0gICAgICAgICAgICAgNDguOTdtcyAgICAgICAgICA0NS40Nm1zCiAgMUcgICAgICAgICAgICAg
MjguNDBtcyAgICAgICAgICAzMC45M21zCgpTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3Vx
dWFuQGlzY2FzLmFjLmNuPgpTaWduZWQtb2ZmLWJ5OiBEb25nIFlhbmcgPGRheXNzMTIyNEBnbWFp
bC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0ICAgIHwgMiArLQogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMyArKysKIGFyY2gvcmlzY3Yva3ZtL21t
dS5jICAgICAgICAgICAgICB8IDUgKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0v
YXBpLnJzdCBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAppbmRleCA1NzA2MWZhMjll
NmEuLjNiNjIxYzNhZTY3YyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGku
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdApAQCAtODAyOCw3ICs4MDI4
LDcgQEAgd2lsbCBiZSBpbml0aWFsaXplZCB0byAxIHdoZW4gY3JlYXRlZC4gIFRoaXMgYWxzbyBp
bXByb3ZlcyBwZXJmb3JtYW5jZSBiZWNhdXNlCiBkaXJ0eSBsb2dnaW5nIGNhbiBiZSBlbmFibGVk
IGdyYWR1YWxseSBpbiBzbWFsbCBjaHVua3Mgb24gdGhlIGZpcnN0IGNhbGwKIHRvIEtWTV9DTEVB
Ul9ESVJUWV9MT0cuICBLVk1fRElSVFlfTE9HX0lOSVRJQUxMWV9TRVQgZGVwZW5kcyBvbgogS1ZN
X0RJUlRZX0xPR19NQU5VQUxfUFJPVEVDVF9FTkFCTEUgKGl0IGlzIGFsc28gb25seSBhdmFpbGFi
bGUgb24KLXg4NiBhbmQgYXJtNjQgZm9yIG5vdykuCit4ODYsIGFybTY0IGFuZCByaXNjdiBmb3Ig
bm93KS4KIAogS1ZNX0NBUF9NQU5VQUxfRElSVFlfTE9HX1BST1RFQ1QyIHdhcyBwcmV2aW91c2x5
IGF2YWlsYWJsZSB1bmRlciB0aGUgbmFtZQogS1ZNX0NBUF9NQU5VQUxfRElSVFlfTE9HX1BST1RF
Q1QsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaGFkIGJ1Z3MgdGhhdCBtYWtlCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmgKaW5kZXggNGQ3OTQ1NzNlM2RiLi44NDhiNjNmODcwMDEgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTU5LDYgKzU5LDkgQEAKIAkJCQkJIEJJVChJUlFfVlNf
VElNRVIpIHwgXAogCQkJCQkgQklUKElSUV9WU19FWFQpKQogCisjZGVmaW5lIEtWTV9ESVJUWV9M
T0dfTUFOVUFMX0NBUFMgICAoS1ZNX0RJUlRZX0xPR19NQU5VQUxfUFJPVEVDVF9FTkFCTEUgfCBc
CisJS1ZNX0RJUlRZX0xPR19JTklUSUFMTFlfU0VUKQorCiBzdHJ1Y3Qga3ZtX3ZtX3N0YXQgewog
CXN0cnVjdCBrdm1fdm1fc3RhdF9nZW5lcmljIGdlbmVyaWM7CiB9OwpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwppbmRleCA1MjVmYjVhMzMw
YzAuLmExOTRlZWUyNTZkOCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKKysrIGIv
YXJjaC9yaXNjdi9rdm0vbW11LmMKQEAgLTE2MSw4ICsxNjEsMTEgQEAgdm9pZCBrdm1fYXJjaF9j
b21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCiAJICogYWxsb2NhdGVkIGRpcnR5
X2JpdG1hcFtdLCBkaXJ0eSBwYWdlcyB3aWxsIGJlIHRyYWNrZWQgd2hpbGUKIAkgKiB0aGUgbWVt
b3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVjdGVkLgogCSAqLwotCWlmIChjaGFuZ2UgIT0gS1ZNX01S
X0RFTEVURSAmJiBuZXctPmZsYWdzICYgS1ZNX01FTV9MT0dfRElSVFlfUEFHRVMpCisJaWYgKGNo
YW5nZSAhPSBLVk1fTVJfREVMRVRFICYmIG5ldy0+ZmxhZ3MgJiBLVk1fTUVNX0xPR19ESVJUWV9Q
QUdFUykgeworCQlpZiAoa3ZtX2RpcnR5X2xvZ19tYW51YWxfcHJvdGVjdF9hbmRfaW5pdF9zZXQo
a3ZtKSkKKwkJCXJldHVybjsKIAkJbW11X3dwX21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsK
Kwl9CiB9CiAKIGludCBrdm1fYXJjaF9wcmVwYXJlX21lbW9yeV9yZWdpb24oc3RydWN0IGt2bSAq
a3ZtLAotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
