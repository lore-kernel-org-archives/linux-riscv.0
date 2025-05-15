Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F770C3ABC9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 15:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VM3FBMtV5EkxKrCjLUgNljKjJal9aBmqMVVbwYtKQM=; b=NGf/AQZLlR7BDL
	srej9aO08jQUg2YEbtZMVLjnW4lFyFraSo725EploohJmb28ZGND46tIax06dPsFH/usMXHTxmC0a
	yAzg5FxWyMM08Eq5TEyKfc8O2jOw4A3cXNqKbcrRGkI/gRuQWOPWZzm4RIVk18cm9gI3LAimB7sM6
	xERtUqg0fnnz+wTBFQvVBEQH97t2P4NT/L9vMmC+fJ9xnmqomJhZuk01quc/TlpqiMCCq8k1NQO3n
	s/GN0h4gM7Lv3m8ZPYpS/Cu2pNJhUDyOAZwVpAbTDS/iuAhidsI2tpmHtLleq5W8XVnCYSnH3PGap
	L9PFPB8gxWI6yeY1CTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa3x-00000000yNW-3Zy2;
	Thu, 15 May 2025 14:59:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZxB-00000000wvK-0QGt
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 14:52:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-442ea0f72f4so644365e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747320776; x=1747925576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIZgXNME8r0sE5ooEmr0L318UA8GXpBZxCC2zWvfkBI=;
        b=OVx0LJ9JlYzfSNDvdHRSPEwdDi/KUcsp0ukyYkjnqFU6QNnLr9adK5uh2jQXM2mUpq
         SZbBasbid4nP9SlMZ0IGqO5gdAPKoYw8J/GF4Re/yxz9Sm9tv6HifG4Wf3nfivz8J7sb
         ptN2YGQeSgx4rkkTV1BGAReUOOHQEvbrvss5srhsUmDsb3eR0Z9INMKZil0UNePgPlfA
         /QjbNU2AYp5D9dHHTJXso5qoRMWAJBobGxpSm9mkDID/oLlCauLHfOiQRJ7P4JFY1MC9
         YYCEvl+uBJYqHNjZQWyuZvjjRfRl8R5DhDSoW5R9k1GzK5BW1gzYFMvmjpOY1qw50ibo
         E7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320776; x=1747925576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIZgXNME8r0sE5ooEmr0L318UA8GXpBZxCC2zWvfkBI=;
        b=s/Vi/BjISe7An37thxggf4FRWg+j3IwpoRdd7cv7JmP2Zs7Gay+SrjBtNvuDN+qtJY
         UNzfYkXE0FZV0SpvkBj6Uxd3Kak9e76aibcLqFY5Nn/X29w8dki7S8psOExrxApePZ8W
         ofDNMyAjeob4Sfnq34mzr7ALy9EnIoJXl7ysJ76yabkxBukyxKKqPkK/vh8qADCwOo/i
         +uHlCu1vWO/kfo3t+ZQL3lbIV0wYda40D+L7l/FzFR94usdSgMdOJF905CaKuJQgC1OK
         CJT4Wpu9Thd2DaCpQYb2RAd1BCF+uL/ttWNCOxrJyiIxkc3neUFNHrm0VBQv/MiCKDB2
         vmZw==
X-Forwarded-Encrypted: i=1; AJvYcCVw8SKC3+LFa7pDJARNsIXTug6JHi2AkLHnhojiCOCR4XwtC/QIBUSfmIrrHOt7ytK7+gbZGqRKQVquiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqDG2UswYovnpk4lCcf+sLjcJw7ZYqkD3vSqUh66IyC9OzHO51
	NDXGiTJSTSr9mQgHFn07ng7X/h4f27kqasksPiIZ4YCHRtw/DKMQVJ1MKGfz4IzDehM=
X-Gm-Gg: ASbGnct63QPXpGNaj1MDJEpTRcSte8D5A9nCuhEN98TP4bNdlcHGUnZhp7UMLDmy/Vj
	IRXfzRbbteQgNAjWm2xqWKGXiQ8IkkXuAa4vQOn73xXM6VygcytdXie0GA8yXc0m6OqAf5YL2Hx
	IAjKEK79vQ5iMqr8yFJWg6dih9PpsKm0T+sT4Ha9oW3YxdR69aPa2CGGb7RK1SFO7SWFstDQ4yC
	5XW68czz3JsB5o/wKe++bgl62QsVdZkz7byW1L77os6ZUa8pLLPEcQy5+V6hbeZWQY8AL43QZIq
	bmuQ0bbXfb1iKEFXtAvsi47c0VYdlHwa7x5ADTy6zFd4bVPkTqg9W2DJ
X-Google-Smtp-Source: AGHT+IGy6O2tOnw9TErwlciOBkx2moBTrgZcoot58P13AHHzScWNRRUCcYrPv0m2LluesoiEnXCjmQ==
X-Received: by 2002:a5d:5f4d:0:b0:3a3:55b4:1abb with SMTP id ffacd0b85a97d-3a35c84c356mr10937f8f.12.1747320775665;
        Thu, 15 May 2025 07:52:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:59f5:9ec:79d9:ffc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35573f32bsm1842946f8f.17.2025.05.15.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:52:55 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 2/2] RISC-V: KVM: add KVM_CAP_RISCV_USERSPACE_SBI
Date: Thu, 15 May 2025 16:37:26 +0200
Message-ID: <20250515143723.2450630-6-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_075257_142112_463555C9 
X-CRM114-Status: GOOD (  18.11  )
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

VGhlIG5ldyBjYXBhYmlsaXR5IGFsbG93cyB1c2Vyc3BhY2UgdG8gaW1wbGVtZW50IFNCSSBleHRl
bnNpb25zIHRoYXQgS1ZNCmRvZXMgbm90IGhhbmRsZS4gIFRoaXMgYWxsb3dzIHVzZXJzcGFjZSB0
byBpbXBsZW1lbnQgYW55IFNCSSBlY2FsbCBhcwp1c2Vyc3BhY2UgYWxyZWFkeSBoYXMgdGhlIGFi
aWxpdHkgdG8gZGlzYWJsZSBhY2NlbGVyYXRpb24gb2Ygc2VsZWN0ZWQKU0JJIGV4dGVuc2lvbnMu
CgpUaGlzIGlzIGEgVk0gY2FwYWJpbGl0eSwgYmVjYXVzZSB1c2Vyc3BhY2Ugd2lsbCBtb3N0IGxp
a2VseSB3YW50IHRvIGhhdmUKdGhlIHNhbWUgYmVoYXZpb3IgZm9yIGFsbCBWQ1BVcy4gIFdlIGNh
biBlYXNpbHkgbWFrZSBpdCBib3RoIGEgVkNQVSBhbmQKYSBWTSBjYXBhYmlsaXR5IGlmIHRoZXJl
IGlzIGRlbWFuZCBpbiB0aGUgZnV0dXJlLgoKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZ
IDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Ci0tLQp2MzogbmV3Ci0tLQogRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9hcGkucnN0ICAgIHwgMTEgKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCB8ICAzICsrKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAg
ICAgIHwgMTAgKysrKysrKystLQogYXJjaC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgIHwg
IDUgKysrKysKIGluY2x1ZGUvdWFwaS9saW51eC9rdm0uaCAgICAgICAgICB8ICAxICsKIDUgZmls
ZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3Zt
L2FwaS5yc3QKaW5kZXggZTEwNzY5NGZiNDFmLi5jOWQ2MjdkMTNhNWUgMTAwNjQ0Ci0tLSBhL0Rv
Y3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3Zt
L2FwaS5yc3QKQEAgLTg1MDcsNiArODUwNywxNyBAQCBnaXZlbiBWTS4KIFdoZW4gdGhpcyBjYXBh
YmlsaXR5IGlzIGVuYWJsZWQsIEtWTSByZXNldHMgdGhlIFZDUFUgd2hlbiBzZXR0aW5nCiBNUF9T
VEFURV9JTklUX1JFQ0VJVkVEIHRocm91Z2ggSU9DVEwuICBUaGUgb3JpZ2luYWwgTVBfU1RBVEUg
aXMgcHJlc2VydmVkLgogCis3LjQ0IEtWTV9DQVBfUklTQ1ZfVVNFUlNQQUNFX1NCSQorLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHJpc2N2Cis6VHlw
ZTogVk0KKzpQYXJhbWV0ZXJzOiBOb25lCis6UmV0dXJuczogMCBvbiBzdWNjZXNzLCAtRUlOVkFM
IGlmIGFyZ1swXSBpcyBub3QgemVybworCitXaGVuIHRoaXMgY2FwYWJpbGl0eSBpcyBlbmFibGVk
LCBLVk0gZm9yd2FyZHMgZWNhbGxzIGZyb20gZGlzYWJsZWQgb3IgdW5rbm93bgorU0JJIGV4dGVu
c2lvbnMgdG8gdXNlcnNwYWNlLgorCiA4LiBPdGhlciBjYXBhYmlsaXRpZXMuCiA9PT09PT09PT09
PT09PT09PT09PT09CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCA4NWNmZWJjMzJl
NGMuLjZmMTdjZDkyMzg4OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTIyLDYg
KzEyMiw5IEBAIHN0cnVjdCBrdm1fYXJjaCB7CiAKIAkvKiBLVk1fQ0FQX1JJU0NWX01QX1NUQVRF
X1JFU0VUICovCiAJYm9vbCBtcF9zdGF0ZV9yZXNldDsKKworCS8qIEtWTV9DQVBfUklTQ1ZfVVNF
UlNQQUNFX1NCSSAqLworCWJvb2wgdXNlcnNwYWNlX3NiaTsKIH07CiAKIHN0cnVjdCBrdm1fY3B1
X3RyYXAgewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpLmMKaW5kZXggMzFmZDNjYzk4ZDY2Li42ZDRhNTVkMjc2Y2IgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYwpAQCAtNDcxLDggKzQ3MSwxNCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2VjYWxs
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bikKICNlbmRpZgogCQly
ZXQgPSBzYmlfZXh0LT5oYW5kbGVyKHZjcHUsIHJ1biwgJnNiaV9yZXQpOwogCX0gZWxzZSB7Ci0J
CS8qIFJldHVybiBlcnJvciBmb3IgdW5zdXBwb3J0ZWQgU0JJIGNhbGxzICovCi0JCWNwLT5hMCA9
IFNCSV9FUlJfTk9UX1NVUFBPUlRFRDsKKwkJaWYgKHZjcHUtPmt2bS0+YXJjaC51c2Vyc3BhY2Vf
c2JpKSB7CisJCQluZXh0X3NlcGMgPSBmYWxzZTsKKwkJCXJldCA9IDA7CisJCQlrdm1fcmlzY3Zf
dmNwdV9zYmlfZm9yd2FyZCh2Y3B1LCBydW4pOworCQl9IGVsc2UgeworCQkJLyogUmV0dXJuIGVy
cm9yIGZvciB1bnN1cHBvcnRlZCBTQkkgY2FsbHMgKi8KKwkJCWNwLT5hMCA9IFNCSV9FUlJfTk9U
X1NVUFBPUlRFRDsKKwkJfQogCQlnb3RvIGVjYWxsX2RvbmU7CiAJfQogCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0vdm0uYwppbmRleCBiMjdlYzhmOTY2
OTcuLjBiNjM3OGI4Mzk1NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdm0uYworKysgYi9h
cmNoL3Jpc2N2L2t2bS92bS5jCkBAIC0yMTcsNiArMjE3LDExIEBAIGludCBrdm1fdm1faW9jdGxf
ZW5hYmxlX2NhcChzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1fZW5hYmxlX2NhcCAqY2FwKQog
CQkJcmV0dXJuIC1FSU5WQUw7CiAJCWt2bS0+YXJjaC5tcF9zdGF0ZV9yZXNldCA9IHRydWU7CiAJ
CXJldHVybiAwOworCWNhc2UgS1ZNX0NBUF9SSVNDVl9VU0VSU1BBQ0VfU0JJOgorCQlpZiAoY2Fw
LT5mbGFncykKKwkJCXJldHVybiAtRUlOVkFMOworCQlrdm0tPmFyY2gudXNlcnNwYWNlX3NiaSA9
IHRydWU7CisJCXJldHVybiAwOwogCWRlZmF1bHQ6CiAJCXJldHVybiAtRUlOVkFMOwogCX0KZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaCBiL2luY2x1ZGUvdWFwaS9saW51eC9r
dm0uaAppbmRleCA0NTRiN2Q0YTA0NDguLmY1Nzk2YzViOGRhZSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS91YXBpL2xpbnV4L2t2bS5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm0uaApAQCAtOTMx
LDYgKzkzMSw3IEBAIHN0cnVjdCBrdm1fZW5hYmxlX2NhcCB7CiAjZGVmaW5lIEtWTV9DQVBfWDg2
X0dVRVNUX01PREUgMjM4CiAjZGVmaW5lIEtWTV9DQVBfQVJNX1dSSVRBQkxFX0lNUF9JRF9SRUdT
IDIzOQogI2RlZmluZSBLVk1fQ0FQX1JJU0NWX01QX1NUQVRFX1JFU0VUIDI0MAorI2RlZmluZSBL
Vk1fQ0FQX1JJU0NWX1VTRVJTUEFDRV9TQkkgMjQxCiAKIHN0cnVjdCBrdm1faXJxX3JvdXRpbmdf
aXJxY2hpcCB7CiAJX191MzIgaXJxY2hpcDsKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
