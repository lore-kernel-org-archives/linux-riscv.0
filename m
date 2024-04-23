Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E90BC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hyTpju/nnUS/DmiEf83/G7pnb9Fb55NyKWDhsatQPg=; b=bIHlcAopdIoWt4
	dLxw+hSFrbFoOqLu5kDhPTd5dnYlHMqlOnJlX/RAilQ3Y/OcaIeE7Uu6u6u5k/aGAivBsqiun9dbr
	1nFhcLkj0d02caYnyhAkdaLdD2dAdAIgwtTWzjZ05ul2sQzHKNflYWjzXaxkbhN8OT9/8MwImjLK8
	kvM8y+TH7Yh6Kjm1WVqK3rq0dzHeK036h7qZhq+tWAVkmw5EYqexfDCYgG/IEb6fXzrR31TowGZXL
	nM1bu+j4sIH0cdcNqStDNEqqVQl9SrJmvMHDuHtocBlMbQ37gNnGJNz59gzVLu6ZEGvtRFO0ZLQpO
	BYJqETX62EeDTDP8VlYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVx-0000000HTEL-1dp6;
	Tue, 23 Apr 2024 12:44:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFV2-0000000HSTz-3Sxe
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34801b1bc4aso947619f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876231; x=1714481031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=WPicsT9Ib3viJBRKpQUfHYoOKD30Pcvs6UJVlZxpReNfBVXZD9UIuPNJmQLSeCM/io
         RaFKu6794SpaI8Hh7CJH48ULYnJoVXi3EPaQPKSZmccwWsYfZ1M+VwgDrbhqvqSCCOKF
         2NlMI6P2Wao8iobeol6gT+upHP+w4vl0P8/EZyi5JrUrm0MoN91jBAgLgyL9hMUNkyMc
         lt6hhQZlEdeXvHFC75k7qaFWVSXlSf5Vf5p8KFadkgaQB3q2P7C2e4jv0vV08GUoYCdp
         rEAJ0kVHPivxiFrasnrL/110eQpgYQDtNQXz0qfxY7YcTSOy5UUUXNcJZ03hK1BGN4sg
         Y87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876231; x=1714481031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=lA9nsJc8O8raRuwc8C7ojBW3YAsExc/Qp2+zH6+u9LUhaCoFIEdRkNWlhdv31zi6FH
         Vr6UmotGnmWfeC9Kf4yUNgFVBzeEZLdk2Q95GRpR1Dl7O66XEu23Raf5DeWBt0M3M17T
         imN64JFFW2Q6xe29ncVSnZVlSYcVdw9LRHzXEFGO3E3AUKSqt0JMynSxfikknpNIvBxJ
         89/RqkQ0Ixagh9EMDJn7DXRJ2a5Xu0CR81kAeKurqFAdfQI6ezZ16P24srciMjxPWusW
         jZdi9UHN8bc/mVPmI4nL+x/KvnWL9aR3bOGZ0oLTd5AV2VNLaUVSkgWSKiCJzwfvJeWj
         fMwg==
X-Forwarded-Encrypted: i=1; AJvYcCUS2wFQD6ZWmtwFpQyNm/zPtSLzMthEkR/Z3KTa0hamFrRmZWo7a68MgoXeULM623oVvZ94yDweayb2azVOZNYyLtXjCZi68tUBFAwlofQq
X-Gm-Message-State: AOJu0Yyhf7dl7ZCWqsTdEb/FgqfIUIhh7wkqD9MRaHff2/JuG9xBCZx4
	JZFAQySuXiDcjw6ROG1qWfLcVbyaWSfgQ5eQ8hqwK6UfDhre/vUEtEBwXvDHVJA=
X-Google-Smtp-Source: AGHT+IEwxP4cmnlN65ejt3BUPk7jfIkLB8aRDSbaf6thvUjYkqGY2x1c1seifl/qbhrG1IVOTMxUHw==
X-Received: by 2002:a05:6000:22d:b0:34a:5640:453c with SMTP id l13-20020a056000022d00b0034a5640453cmr7273001wrz.2.1713876231406;
        Tue, 23 Apr 2024 05:43:51 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:50 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH v3 09/11] riscv: hwprobe: export Zcmop ISA extension
Date: Tue, 23 Apr 2024 14:43:23 +0200
Message-ID: <20240423124326.2532796-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054356_147793_8DD631F3 
X-CRM114-Status: GOOD (  11.06  )
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

RXhwb3J0IFpjbW9wIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMg
ICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGJmOTZiNGU4YmEzYi4uZTMxODc2NTlhMDc3IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0yMTIsNiArMjEyLDEwIEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICAoIlpjZiBkb2Vzbid0IGV4aXN0
IG9uIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5zdHJ1Y3Rpb25zIikgb2YKICAgICAgICByaXNj
di1jb2RlLXNpemUtcmVkdWN0aW9uLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pDTU9QYDogVGhlIFpjbW9wIE1heS1CZS1PcGVyYXRpb25zIGV4dGVuc2lvbiBpcworICAgICAg
IHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBm
cm9tIGNvbW1pdAorICAgICAgIGM3MzJhNGYzOWE0ICgiWmNtb3AgaXMgcmF0aWZpZWQvMS4wIiku
CisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0
aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3Rl
ZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
aW5kZXggZGQ0YWQ3N2ZhZjQ5Li5kOTdhYzU0MzY0NDcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaApAQCAtNjQsNiArNjQsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0IJCSgxVUxMIDw8IDM4KQogI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWkNECQkoMVVMTCA8PCAzOSkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pDRgkJKDFVTEwgPDwgNDApCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ01PUAkJ
KDFVTEwgPDwgNDEpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwppbmRleCAyZmZhMGZlNTEwMWUuLjk0NTcyMzFiZDFjMCAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCkBAIC0xMTQsNiArMTE0LDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJRVhUX0tFWShaSU1PUCk7CiAJCUVYVF9L
RVkoWkNBKTsKIAkJRVhUX0tFWShaQ0IpOworCQlFWFRfS0VZKFpDTU9QKTsKIAogCQlpZiAoaGFz
X3ZlY3RvcigpKSB7CiAJCQlFWFRfS0VZKFpWQkIpOwotLSAKMi40My4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
