Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354DEC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lk/UY6WFvFwUnGu7twt/774xxUBIOMlKW049Ct01MlM=; b=nnaJQ+4hsZnN6G
	f5RpqYwwiQo4E6GTLBOhpp7zjl5f+HSSSsvicVwV1FZjhBRgQI1GymSkeGWa/XUmbmtFjmXGQ7uC1
	qgvnmSmYILG0j3cSamR2gk1444Q+qKFPwmzqOzi54bHAGfD+mN7Ofd4lKLWbxMw8FIIdJ4sYjKGg2
	CdDVFt7Yc0DplwDJje0MAsunk6Q2dCbULtfLZ+w36mB8KuZv8xvRN9ifr0pjbTtMOn69FKE9iSZwo
	p7gAv2atM/AoO8Fq6K7cAu/IluTUfWmrvjqwAFutwQZLADYamJb76zrOBWXW3xm5XYfAeFUR9uxX9
	fFx5laEGgwhetbubPPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkg-00198p-0G;
	Tue, 07 Nov 2023 10:56:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkb-00196k-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-408434ce195so10593135e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354563; x=1699959363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA6TaO+YV3P6uG5ehiL6SbNfsZ4OUqVSTDbxUXfxm5E=;
        b=xsdIZj7OwJ4BAbv/sYCYAaq++DX5IZuktPJ+tpIT1GHbUIpMyQhApvKIpIrtMfFUqK
         E+HO8YZEszIjG3qGdB2AmFMW6xsRG1+O1OY9QSwoNHXLQ8bpXWPUv+rnktQ7YopclrH2
         X67SVi7PZ/lUQVngwuo/5L+BrwRbNFa/m1nhywbFUMH8hoLYIiesCVhzOwYHD7CjbzVN
         7cUWAoKJD/R8fWZKt+jHzWIenQG9kLK7ehfQh6nCzmKRafDi5bWXQb7lo42gZEVNAisf
         /2hFsDjhIbZu1wQu/lrPxTYqeNVqV1C1mXGDww2PyHC8S5Hwpa3uLAMs6KofHW41fUCX
         VUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354563; x=1699959363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA6TaO+YV3P6uG5ehiL6SbNfsZ4OUqVSTDbxUXfxm5E=;
        b=c+k6mNGUUMz63TEXOyEG8ZFt/m77tBK7zAawPdi+A1jx4qNfGUgdOHILM2COt7n4Mz
         EsbiwvDuK7X1krhR4EiDNOARuB4tpsjG9gKJHIHaW562nJyPr9Jnon5CnQL7hTDTIrRQ
         qVe74LjYtw9lBDICQD4QjLLl/7FgCzAh7QDihW+mekdL9bNFfxiLmwk7RMFee9bcVSBW
         4AuUifagDt3kYTTowa+rnNJFnK8r/T8JcQJuKBK7AfZ5mL7VCh7qdzACWHnWx1YG862M
         Y+p1H+6UND7U2GLHDkCPKD6nXLUuSl/TPwIDdwe4OJ76JYN61vbtqiv3oqRylZEx7xvo
         hwkA==
X-Gm-Message-State: AOJu0YzjqTWFrC2iz3Co0soff4AljTtf5b2nCNt0K8EeipR4Kab5oSin
	GEZD8c/cM/Y49uxZ5uiQWgVI7gWLBFB5Oq3VVA0gPQ==
X-Google-Smtp-Source: AGHT+IEDB5qlOk6FgrKsa3qj9SE6v/Kfu6peNUysoGxbasqez5sPqF/BIOxq9sfcbgB58kS3oj4koA==
X-Received: by 2002:a05:600c:3b93:b0:405:3cc1:e115 with SMTP id n19-20020a05600c3b9300b004053cc1e115mr25948840wms.3.1699354562728;
        Tue, 07 Nov 2023 02:56:02 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:01 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 02/20] riscv: hwprobe: export missing Zbc ISA extension
Date: Tue,  7 Nov 2023 11:55:38 +0100
Message-ID: <20231107105556.517187-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025605_830739_0744ABA7 
X-CRM114-Status: GOOD (  11.71  )
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

V2hpbGUgSVNBIHN0cmluZyBwYXJzaW5nIGhhcyBiZWVuIGFkZGVkLCBaYmMgd2FzIG5vdCBleHBv
cnQgdGhyb3VnaApod3Byb2JlIGludGVyZmFjZS4gRXhwb3J0IGFuZCBkb2N1bWVudCB0aGlzIGV4
dGVuc2lvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMyArKysK
IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAxICsKIGFyY2gvcmlzY3Yv
a2VybmVsL3N5c19yaXNjdi5jICAgICAgICAgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGE1Mjk5NmIy
MmY3NS4uZWNjMDMwN2MxMDdlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBA
IC03Nyw2ICs3Nyw5IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkJTYDogVGhlIFpicyBleHRlbnNpb24gaXMgc3VwcG9y
dGVkLCBhcyBkZWZpbmVkCiAgICAgICAgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIEJpdC1NYW5pcHVs
YXRpb24gSVNBIGV4dGVuc2lvbnMuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRf
WkJDYCBUaGUgWmJjIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzIGRlZmluZWQKKyAgICAgICBp
biB2ZXJzaW9uIDEuMCBvZiB0aGUgQml0LU1hbmlwdWxhdGlvbiBJU0EgZXh0ZW5zaW9ucy4KKwog
KiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQg
Y29udGFpbnMgcGVyZm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNl
dCBvZiBwcm9jZXNzb3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRl
eCBkNDNlMzA2Y2UyZjkuLmRjZWY1YzMzYzAwOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
aHdwcm9iZS5oCkBAIC0yOSw2ICsyOSw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZp
bmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCQQkJKDEgPDwgMykKICNkZWZpbmUJCVJJU0NWX0hXUFJP
QkVfRVhUX1pCQgkJKDEgPDwgNCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCUwkJKDEg
PDwgNSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCQwkJKDEgPDwgNikKICNkZWZpbmUg
UklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlT
QUxJR05FRF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfRU1VTEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19y
aXNjdi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKaW5kZXggNDlhYTRlODI3OTdj
Li4zODJjZDcxMTI5YzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCkBAIC0xNjIsNiArMTYyLDcgQEAg
c3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwK
IAkJQ0hFQ0tfSVNBX0VYVChaQkEpOwogCQlDSEVDS19JU0FfRVhUKFpCQik7CiAJCUNIRUNLX0lT
QV9FWFQoWkJTKTsKKwkJQ0hFQ0tfSVNBX0VYVChaQkMpOwogI3VuZGVmIENIRUNLX0lTQV9FWFQK
IAl9CiAKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
