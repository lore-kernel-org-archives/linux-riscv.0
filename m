Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF585C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaR1YZwFFBCJ31s9x8l0QjOTdWlXNXoqJyE1cqtCfuA=; b=2kvRDG1pyJveJ/
	t2tjcyKgG+Wp59lZM58krqVJZPL5PbrgWN8w/udqOt6+UfLk389radZiOY0PfaYMpEcJSrx2o/Uib
	4p0+AHdueMQXzeKftyxSb44kwJLn3dAyGyqhtE3+ClPFuSYlxfVvm0HcMu1LE1oMN3K9B1esSx6IX
	p0bezpjesjhSzbr48eWO86BRF/LXOFamCzgr83LfJtNn6KVd37tM0E0aT9UzeSGwFh2qWUF7nJl3N
	2hdZnHNBB0+uPxKFCHuDDf/0BMZhWzF/NayFnttYmcux10rtw1aiHxGitmJJPj6x7ip6eHs+Vh0EY
	2KribRV0ddgiSd/Ajr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxm-000000088LQ-2Rb9;
	Fri, 17 May 2024 14:53:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxW-0000000882S-0Hn1
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:24 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-34cba0d9a3eso26911f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957599; x=1716562399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlgURxZu8fG6RfbwOGV4+VYUtdkFAEEBFMEpVJI3jww=;
        b=QibH2Kd7zf2eqLkAeQ+ZbDuTkfSwM4/kjcF/wZT6Frlu2ma+6M/ECrMsEZeBJIl7PF
         +3hueFJIqc8ysw6gCLpW64hqjUjj7rWIxldYGrqi00dGApNqnW17AhsyTt33gi5lh61h
         1TQp/7eK4kngMMHI2oZk5lK+5MB8DUhw7XjXiLmjGzFLTU3DJCORJzzc9iLOZIEYYD2y
         S7QiTI2uRqncl9NI1O7ZGD1MnN++Qz/ostpQuMb11yaW3d24ku8FkvtyuARGk5IXb0i8
         8rbrOzgTMSLXaqWAsiPHkJAhgdVfy14f8e09G58eiSLyHB0stVd+G/DO5lORaaeaxD/K
         Hgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957599; x=1716562399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlgURxZu8fG6RfbwOGV4+VYUtdkFAEEBFMEpVJI3jww=;
        b=K1epibxv3VP6MfF6JzfChaZdYSYJEgibPhA0bNf3KnJs16/CHcR53G4vKTguiWGXRn
         OMdu8aQT6dkkBlpaR+f5HgYliu77qtbpTDKt7eRr5sLcoWUq0dFNK3+oDSdqrhJZ675t
         kCMj2l+jOZbFGNqGhWgjwZ+WqGYNpc3iWHYciZIVrcZ4pruigg4l/vjg52GhH6kbdAul
         MerPH8EMwaJvZWmp7RR2DJrQaOx7YizCRXV2rt7JdWupCX3qb1h8HKbmbmzn8NJSqZI+
         KHcJYcKP9C21spVYdfDNLBhK1STCkrShMtW6s71LD29Bk1xQq4u3ZxJV74bPy6Qq5oNx
         uiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyxFVaDI7u30xFhg93X76IX97QhD1wi2Om7nznqDigFKi19CFim4qYSsmvMXjA2SMMH0cJ+xH/psY19k5rTUYnmN8ZzrNgn/tEWrg4c2cW
X-Gm-Message-State: AOJu0YwG5GDbNo5gnn8Mp+uWz5E/Nt2sB3scu10aTGF2DK/v7FUMbDCP
	z+9nBxFWsOrALcEJvw2wecYnWfiDP3beUYyhJ1jjytc6Vya4jl9B5QHJouT6v9o=
X-Google-Smtp-Source: AGHT+IF+cFq0XlN1HQdJuEHOqwM1sBxbfnwqtGyG9WotzHLFqO6Kw2Bla6mFarFdrIDutFqb9Mbfrg==
X-Received: by 2002:a05:600c:3b86:b0:41a:c04a:8021 with SMTP id 5b1f17b1804b1-41fea52ed5bmr160325795e9.0.1715957599520;
        Fri, 17 May 2024 07:53:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:19 -0700 (PDT)
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
Subject: [PATCH v5 03/16] riscv: hwprobe: export Zimop ISA extension
Date: Fri, 17 May 2024 16:52:43 +0200
Message-ID: <20240517145302.971019-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075322_138420_F91F3AF2 
X-CRM114-Status: GOOD (  10.19  )
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

RXhwb3J0IFppbW9wIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA0ICsrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMg
ICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IDIwNGNkNDQzM2FmNS4uNDhiZTM4ZTBiNzg4IDEw
MDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC0xOTIsNiArMTkyLDEwIEBAIFRo
ZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5l
ZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQKICAgICAgICBk
OGFiNWM3OGMyMDcgKCJaaWhpbnRwYXVzZSBpcyByYXRpZmllZCIpLgogCisgICogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfRVhUX1pJTU9QYDogVGhlIFppbW9wIE1heS1CZS1PcGVyYXRpb25zIGV4
dGVuc2lvbiBpcworICAgICAgIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNB
IG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdAorICAgICAgIDU4MjIwNjE0YTVmICgiWmltb3Ag
aXMgcmF0aWZpZWQvMS4wIikuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBF
UkZfMGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9u
IGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggMzFjNTcwY2JkMWM1Li4zYjE2YTEyMjA0YjEgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNjAsNiArNjAsNyBAQCBzdHJ1Y3Qg
cmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwg
PDwgMzQpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlRQQVVTRQkoMVVMTCA8PCAzNikKKyNkZWZp
bmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pJTU9QCQkoMVVMTCA8PCAzNykKICNkZWZpbmUgUklTQ1Zf
SFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05F
RF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1V
TEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2Jl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IDk2OWVmM2Q1OWRiZS4u
ZmM2ZjQyMzhmMGIzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTExMiw2ICsxMTIsNyBA
QCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWly
LAogCQlFWFRfS0VZKFpBQ0FTKTsKIAkJRVhUX0tFWShaSUNPTkQpOwogCQlFWFRfS0VZKFpJSElO
VFBBVVNFKTsKKwkJRVhUX0tFWShaSU1PUCk7CiAKIAkJaWYgKGhhc192ZWN0b3IoKSkgewogCQkJ
RVhUX0tFWShaVkJCKTsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
