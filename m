Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D4DC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hyTpju/nnUS/DmiEf83/G7pnb9Fb55NyKWDhsatQPg=; b=ldfFck4dasffAa
	YSsQaMjylJ+/r6lletuO5i46xBM6AGpG1FF5Z6B8JyjW9p5fyM/oZ8RGgboNMJ46++sXBxFwWqsPi
	h+n/VOnpYyzv/8fYII2VHa+gzUPkwDC7pKH9pNwym7cM/DFRFtKntRoGESrTEZzLqKwby5rg1c9VQ
	pIdwAnUKgVTQRv0pdLLVLX2mj4jn5q/+k0/UoLUG9RCjRkUeyeyOuNgc6R/CWEfRT9vKBO4VeUEgX
	qjsOYxy/YejE9y8gYItESvdbIiDzOX7eNvCdnAvWF4j+DV8hBdwrwjKd8zKMwsjOFlWW5vVUUyhNk
	s3o16AIBvDdLkwY86FVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR8Y-00000002DQr-2Xzl;
	Thu, 18 Apr 2024 12:45:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7e-00000002CeG-1GNc
	for linux-riscv@bombadil.infradead.org;
	Thu, 18 Apr 2024 12:44:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=; b=NwHav7QhXtBOFGkNkCAtRRWIYw
	2QjUTlwasgcmMyMHrpSg7wvOJGKo0rTm4F/M/TP/YY74Eb7/VRtLeKGrV2VZITQarBi2wqEVdoYNa
	OWMp+R8vAgLJLc+YdeV5gINHTJV76rGReBGmVX8l8GJPnkRlaOr7hckITV2jItidKltt8X4r1XCfT
	fH+/8gwGYRN6CQ26rmtCFlr5kDqyHq0RDy1Md8PotGtykQeKhhoD7lOslypA/Tc2TuVfWgrpgJjtL
	K6i3Y3uJBBd+MnAGAGE0AVXlHj5fU4LTg6Q84mkP9wXiS0/swoKQWTfHH2A22y/mmPhzw1O9HlzY4
	mLxijDaw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7Y-0000000Bzrd-1Sz1
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-347c6d6fc02so116320f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444246; x=1714049046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=XUjeQCkwJVsSV6+XotCLWQw0aqwJplmmbSvvbOt59vu3bstz+/Nriet7B0i6c9P/BC
         e7xfzvorIeFtMlaRfK6uNJUZJMeAuyzuWOIP5DCzGT3pJzE4oLtD4ryzAzW14pZ8ssnf
         LVdSYARwF7sdWalyVm5tcv/W7XG6uD9VMeOXz/QhevdameuS5PmtA2WIW+TIvMNTjTce
         Pxgq+jbrs8iVh4Ufcu9w1B4J3jjlmEUlJI2AfKLzYmfKNN0mvE1CSwVG/+DWourjRaW0
         JyQwUov+aY3b8PQY4kreA2gGFEo9ouWbcj5IpBKLhL8yHp/JeZszeLK1Y49QDemhVTaH
         PKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444246; x=1714049046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdCfPjm06PN8DLWdVlWU7iGB8QhHqS8f5T3HQCXkkpY=;
        b=cvmbtY4SOd2Lk6d/03LqFqxDXyA+rlNbdKznN1C4x/vNySzGA+Ou7l7n913yZE1mys
         LzyCM99B+jgxz9sLoJ5F9yPVY53gHHoy1EIdmv3GANmd2lxkRvGduNrxPhJ/LuI68POX
         2bExRrm19g8CpLutguaI929GecqhrWpPrWh7nvhB9C10ZNBhkSuCnadFBDAhQLoGjiJs
         eUZSlsPkzA07Cv1Nib/W/1MbxTpw+AJqjf6Ef5ZrRMZOsFMh7WM2QgR0zNo3pB6jwkRc
         Bdf5nIN/MZ0mQYXKpEQSLDNa5Fv3CvuOiA0b6mpD7epOeftiJuEEhVJXz018eHF0r40G
         ZtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr86ATF0qJQyunS+Rxe+UTQ0KjEuhrX0FQNyDTPdS9Ad8Vgsm06FjjgNBMDEe1TxQ0NfLt4cnXop0ioRRujebobTBX8pz0UM56qcC1wGsQ
X-Gm-Message-State: AOJu0YyfDiRLBSXvB9+IXX5ID5G6OO5iElvziKJ6UO6mFHj/o2rm93tr
	1X1voyFkp1lBwKt0toIilitDE4Go24zjOy4i3EYShSC+AB4VwlZa1B5h6TOOZRw=
X-Google-Smtp-Source: AGHT+IGMuL1VEcAVu36oqMeDfSFjQ3yk2Wj7i500rFn3wK2To4nptMyU7omA9B2isyVdkpsEUDxcgg==
X-Received: by 2002:a05:600c:1ca2:b0:418:2a57:3806 with SMTP id k34-20020a05600c1ca200b004182a573806mr1932349wms.0.1713444246501;
        Thu, 18 Apr 2024 05:44:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:05 -0700 (PDT)
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
Subject: [PATCH v2 10/12] riscv: hwprobe: export Zcmop ISA extension
Date: Thu, 18 Apr 2024 14:42:33 +0200
Message-ID: <20240418124300.1387978-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_134408_688542_4BDEB9C5 
X-CRM114-Status: GOOD (  11.08  )
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
