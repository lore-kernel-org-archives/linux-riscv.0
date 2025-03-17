Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F61C35FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f89PPqFUaTybFeDdfRhnanwn5ZMn3T2hw8F2nXG6hIU=; b=uZh6hgw7wEWzzs
	MgUmTI9zJWhpURw0v+F97cTR9bKXr0i+fSlBsT3cpqgRCJK/6YWN7Mu5FylsaXgFK9lYkshZi6uLN
	RyZdhfCYksXwXm5NUUPVyq55buJbU8Wts42+kzteTd0rAMajptoKFs4Q0U00PbCuLsVAwTzz9g9qC
	r9F+YepP/xOtdtNN3BeIE8ddva29KXkiFN/DMOUrJbKwABYQUYVZ+G//PRNqDKY47aSvuL9vRKnhh
	jF+aVo4b4I/RzThAjysJdtTTdYEz6qi1mAaFyrJ5D6yaSZfB2Q1QpgzbR8wsdVx1ZutKJ5lJMNwkK
	6VvrX3WXe0LZwT5vxA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1O-00000003Uua-12EI;
	Mon, 17 Mar 2025 17:13:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwi-00000003TOY-39Hc
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so14583545e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231291; x=1742836091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnEzy7kWLGCaTTq9cfZB5uZycg5cp6OZgHd6PiXZO0Y=;
        b=ZN0ANShPDFbUMs1yoZL0JOh0AEykczSmWPJ9zckLFmuHoMRrFO1KcYdBfWY7lLWsob
         s4vI8YvKPYk4ZvN90i6DdrEAB9UHv2x9TQ5dRQwYHkDgz7fYk0heT86muDT0yETDzShm
         GdqcUnX+WoCiLCrUZ3CYvCNVtVwIQNXt5TjQYnVZ9noa4/EOgNVJoBZJyw2Kyh+Rx8wm
         WqCuV3DUuToiDTJA72YVSHkzY2KZffq/65OayL6nRNDVR3Z7XNV7roLlQXXL/S6Q89vT
         2K5Tfiy5k2UcpeUUjvcqNIjb5FArLImNDxS8XGFeXk3GbFgrDFaA4ejMQ3PEqGy6blj8
         d0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231291; x=1742836091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnEzy7kWLGCaTTq9cfZB5uZycg5cp6OZgHd6PiXZO0Y=;
        b=etlIwOT4t7MznotZAX6AWz/v98oKc6mkhxNQCW1OWGu5NixaVxO4wJWZrPRp/sdhqF
         qvJvOFqnWmu3z59KMPJ5eHurIsLrO0KF20ptOjq/p4Uk9u3rMBB6Sn1dQOLGvB4Qtado
         LWm3ghrZQnMepIgA2s8pbcQlJVLekFIJLSrq7v0NIuM/32qYxBbz7bqn5E5/LcdB0RVK
         fW08HfvxM4GwBpmegF2c/AeDv/8cHuj93bhF6gm+LGCCValW5YAJSuS8Ebhwq/4LPKAq
         EyOEm2DL8H394wT0QXrf6gDLH9NGJ1KtAPDrycw0w27i+ocBULrFo0M2Jl1kEeROg7I8
         Rt+A==
X-Forwarded-Encrypted: i=1; AJvYcCVd9cDjlJQwHoGWSfKlu7fKd/WizcUBUj8ecbx069CgXVqUlSK+ryuNNZGQr5hEdW3Yaja12P/bMMeICQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjt7GY8dHKDOgPuErpjNrZ8XEP2cZAvk5R/oIw07gbZxodPOz2
	t+dS90+nQ8ZXpuPEeCbgAzjmQ44eVEn0Zj8HWOFNb7JEQSgpPBW8kG60Y5f0DpI=
X-Gm-Gg: ASbGnctBLNoJDwvf9QETolyUcfUJdTpN5CkAwsuOH90lj02nzYKD27CWfbMsHb+9F+p
	we87/qz/p+MjfUp/XGl2/kLdYs28NwYOc12sYRN0zdkNl2QvFNa7G/y5Sn1O9YJOJBlo+lUBPGM
	Cvt1p5l6V47OeaqsaBsp5yv0uGQg0WAUduUoBlQxCD2nO15DjEe5hZFJ/GPgZcVogU3sFkBVOhE
	JBa+RYNo+GSpgsNEsNgS6+p9ZBSbb93fkuES0zPZ4nvivjMp70K6DK3aZnuC6ioNaeD8S4bfrGz
	BkbPXYKNinmp6wl88YrOQQBwxUeeMkMr4vyVMB1/U/rhrw==
X-Google-Smtp-Source: AGHT+IEhk9ILCkt1d4miwCrhVE7Pp8SXCLMrmpN073cNBxqpViWwe1YnhF1uSTy7oETuXKPGMPnacQ==
X-Received: by 2002:a05:600c:a53:b0:43d:b33:679c with SMTP id 5b1f17b1804b1-43d390976e7mr2112565e9.14.1742231291216;
        Mon, 17 Mar 2025 10:08:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 04/18] riscv: sbi: add SBI FWFT extension calls
Date: Mon, 17 Mar 2025 18:06:10 +0100
Message-ID: <20250317170625.1142870-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100812_796398_CE2647CB 
X-CRM114-Status: GOOD (  13.50  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDMwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCBkNDFhNTY0MmJlMjQuLjU0ZDljZWI3Yjcy
MyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMKQEAgLTI5OSw2ICsyOTksOCBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92
MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAogCXJldHVybiAwOwog
fQogCitzdGF0aWMgYm9vbCBzYmlfZndmdF9zdXBwb3J0ZWQ7CisKIC8qKgogICogc2JpX2Z3ZnRf
Z2V0KCkgLSBHZXQgYSBmZWF0dXJlIGZvciB0aGUgbG9jYWwgaGFydAogICogQGZlYXR1cmU6IFRo
ZSBmZWF0dXJlIElEIHRvIGJlIHNldApAQCAtMzA4LDcgKzMxMCwxNSBAQCBzdGF0aWMgaW50IF9f
c2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAog
ICovCiBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkK
IHsKLQlyZXR1cm4gLUVPUE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNi
aV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2Vj
YWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX0dFVCwKKwkJCWZlYXR1cmUsIDAsIDAsIDAs
IDAsIDApOworCisJcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcik7CiB9
CiAKIC8qKgpAQCAtMzIxLDcgKzMzMSwxNSBAQCBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJl
LCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVy
ZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4g
LUVPUE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBv
cnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRf
RldGVCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwg
MCk7CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAog
c3RydWN0IGZ3ZnRfc2V0X3JlcSB7CkBAIC0zNjAsNiArMzc4LDkgQEAgaW50IHNiaV9md2Z0X2xv
Y2FsX3NldF9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCiAJCS5l
cnJvciA9IEFUT01JQ19JTklUKDApLAogCX07CiAKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkK
KwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJaWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxf
RkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC02OTEsNiArNzEyLDExIEBAIHZv
aWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJCQlwcl9pbmZvKCJTQkkgREJDTiBleHRlbnNpb24g
ZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVnX2NvbnNvbGVfYXZhaWxhYmxlID0gdHJ1ZTsKIAkJ
fQorCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMywgMCkpICYmCisJ
CSAgICAoc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXRlQpID4gMCkpIHsKKwkJCXByX2lu
Zm8oIlNCSSBGV0ZUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CisJCQlzYmlfZndmdF9zdXBwb3J0
ZWQgPSB0cnVlOworCQl9CiAJfSBlbHNlIHsKIAkJX19zYmlfc2V0X3RpbWVyID0gX19zYmlfc2V0
X3RpbWVyX3YwMTsKIAkJX19zYmlfc2VuZF9pcGkJPSBfX3NiaV9zZW5kX2lwaV92MDE7Ci0tIAoy
LjQ3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
