Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D861EC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWK4lKil0tXLM2qI9ELJ27SLzhLY4yxYmj8Wg4Y5Ymw=; b=WS9CY+uLKNhvgI
	pUrhyFEaLbN9Du5E2q7xVhoy74cpgDeIUo6j4HMpfC3dzkcvuWzmNo6iWBgU+xI/wEh4FOJ1ygsvP
	vpfZcM8LsnSpRiwWFjal/fcYocsH+073wALYrIbhStVklAAnqSTW5JV9rdmrxOJz73DsaRrONQyiM
	s/Pnylyg3PXVhjLOYO7omKOUhVezpMkkDKQDGmw4SF3LS2eBPNEWg/9ufULITn2i+i6oURkkyrcZq
	6Z60TIVkcFoLi2rs43EOlHN2tTGxM+T4xcwG2nC8Rq9CQOufm6fu9hxeM0Cv5jkuRK2zI795Oq5SS
	1hInIHv7JGXScOUJOXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yyo-000000089Jh-2EzB;
	Fri, 17 May 2024 14:54:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxl-000000088Fv-36Yd
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4200e4b7bcbso328285e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957614; x=1716562414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+iPbn/khpTsPchyu8Yai3JeJ+A6vpdXRb3hYqL1yvk=;
        b=a3cKR7MaVPKvJTnwIp0v16HmUuqxz72PH3UZ/5vGGO5ALeDdThM7TxxGVWQzMFrCrf
         6/6cN/HxbSoZTYbx/Mf40i/bWAgvn2HwSStK9KXLu+FoGPY+9ZYmCyXKkYqcbtn1fEI8
         XgL7b9EYLBeKfvv5kw4RpfPh4+fTUcpIGntWmYYm7dWky3Ctp9015TG1wuA0x0XesU9R
         oQCicEqdGg6soFTYRqk4b+hABLYe1nXE9kswkcaImRjNqhQV0Ao9QUMiRGzJzlHGUiN0
         TKJ4Uc1A/v6iVxKsMIKak+gnIQITFTU9QRapb8smr1wxYwQNtVf4m/18XPLjp8BGQJJ9
         OONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957614; x=1716562414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+iPbn/khpTsPchyu8Yai3JeJ+A6vpdXRb3hYqL1yvk=;
        b=qlg/vq71YQ1gbdhLEkBhjjdx2beo4oSdvt3Oe4N79Ct4C28jEYdjn5S13VZFJfsPHi
         Oa0m2iFbzMz+kqGj7DDMZ5PInD1BLwav+teJtSzaBitW2cdqI9mMcqiLFym+TvQW6xK8
         Nb/ZZ+mXswNxghcl7hPkokJdsAa7Xi80Tyc6MCbhpSKGJ8h3iZk2b3eFeXe1sJB+vnxi
         F6jHxWOafkx/+JzMl9Jy+busNZRQukvarz9AtpkxDuxS45+giys9dutIrju+MFGJmZJG
         LWZhm7IPjsqnOiT9pZ3Uk2760T8/a0ZR1YwBR0UenUg+s74slnqT2wlfTDEBXTdLP/Qn
         AZog==
X-Forwarded-Encrypted: i=1; AJvYcCWnjJGw0HogUM0vV/RU1bBzUBDw3xiw2e4cFM9WRYHeAGpiDdy7iRea9+bsDoiZah+Vhk+ExazPGvmocF33CKxkEZFygbCS24ua9af7fWqx
X-Gm-Message-State: AOJu0YxqWQSNil9GmFmxq7FLVcdkB0d3ogsklEalr804/fijR5uZZKmU
	GE2Ilj9XqBbKPa72oldCVonnw9R4U38S8Vmot6ySAJGOYYIhBlykPpL04+7lots=
X-Google-Smtp-Source: AGHT+IHjUwKmyIg0UAgVmQU28600dC6ckmqz/WfhRm2n8JkhKzwA+sGdKVNHqMrH9cFck9sYzow7Nw==
X-Received: by 2002:a05:600c:3b0a:b0:419:f0a8:9801 with SMTP id 5b1f17b1804b1-41fea539b4cmr186010615e9.0.1715957614634;
        Fri, 17 May 2024 07:53:34 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:33 -0700 (PDT)
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
Subject: [PATCH v5 14/16] riscv: hwprobe: export Zcmop ISA extension
Date: Fri, 17 May 2024 16:52:54 +0200
Message-ID: <20240517145302.971019-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075338_056303_62DD90E2 
X-CRM114-Status: GOOD (  10.62  )
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
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGNhZDg0ZjUxNDEyZC4uOWE3N2I3ZDE0NTM5IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0yMTYsNiArMjE2LDEwIEBAIFRo
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
aW5kZXggNjUyYjIzNzM3MjlmLi4zYTNkNmEyYjRmNDggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaApAQCAtNjUsNiArNjUsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ0IJCSgxVUxMIDw8IDM5KQogI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWkNECQkoMVVMTCA8PCA0MCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
RVhUX1pDRgkJKDFVTEwgPDwgNDEpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ01PUAkJ
KDFVTEwgPDwgNDIpCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVm
aW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYwppbmRleCAxMWRlZjM0NWE0MmQuLjM0Yzk1ZWFmOGNkMSAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCkBAIC0xMTUsNiArMTE1LDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0
MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJRVhUX0tFWShaSU1PUCk7CiAJCUVYVF9L
RVkoWkNBKTsKIAkJRVhUX0tFWShaQ0IpOworCQlFWFRfS0VZKFpDTU9QKTsKIAogCQlpZiAoaGFz
X3ZlY3RvcigpKSB7CiAJCQlFWFRfS0VZKFpWQkIpOwotLSAKMi40My4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
