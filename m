Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A6C369D4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYiRAOF+k94LsCPylFYOlY2xdbJ6PalIyqEUBsz5EQU=; b=2k2M8pqpS8FuGY
	UuoOdLCLOIwsZzaYmTSpKKYx3nEItFcC4oAh6sKUhoLEGiHcRXuK3Tda/1oVy3hVxToHlGcQZt9xG
	Cx9mycwx2yTYZk21AjDND1fX82SZ3zU5WXtvNeL5ve+/5dtYKka9dWnCEWd1B9fVo7E/qvd+CBRo+
	e3HwSXohlEDvqO2dKFHFdJX3n2IQ3fRfKUxba8TOrpGsxCrI2H3FFEda4zknbqHbaQWfISBHFlBF9
	Go7sbKKixHWKy54aWb67yBYDF+DfJzi8hzbT/C3TdjnaqqSEIPXKLf0iX62Rujn8CFYrC+MKvPRUu
	31GASaJx7nE0GMOPNyrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTR-0000000Cz4J-0eLh;
	Thu, 17 Apr 2025 12:36:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIG-0000000CvV1-0CKX
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2295d78b433so7451055ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892675; x=1745497475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=fBqL45jNz58LsTjvCt0EVqHylmVcV6NOlFR6FHkxLKIAh90goAhPA1kFWw5lP9vcBC
         zIo8e+XwIglIoo/iIA5B0n0gMbcI1JyNy2ndaxU7ucXJIZFZTW4+sHG3gpYID+HvHFZ4
         GC4AFk3FRExfvQiv13/i3wI6oOPfoMYnzEBSrWzDg4YL9NdrLNVDaOjlrHdB/MTbiCs5
         SVBoDQRjltijE1Aty2JZODcuKtG6Tvc314TBMAYR4n7HNC6ZPHRO9NSR4XbM2lOIaE9/
         zXTegC4xg8lb3yUg6JQIQACkpGjKRdNzlvagZ8UVo5D/YnxNqJy8TFR3rp8ugmOpUb3G
         xnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892675; x=1745497475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkvRtqiwpGFu2F2LneoosRxgLPIUe40LOw9HI4KIxXc=;
        b=fynJ4c7MdVR9pewtO+KtI89lUH5SQzQ4nLW94nr5OBnZ9Dr21kP6CAoyDldAPQRn+T
         jtUN/t7AjzNlnFxBRm+n33zQ8facS0ZJOrCbPz1NprkHMAeilQlb4fF6poLdNY2BltIn
         CJDDCkQvlesc3uG4V/+vn7nOCekO306SZJO4fgqSvDgzIiG/MkezIaMZ/mXAWhoExLlj
         hNFizA47mDp9irjnoprGDZr409A62PkUrU5VWTOAZna943vL6VqVUKPeE0hns6OVpZJg
         B0zdhxLsKJHKJkykDGaVJ9Ofi45APHROZb7BQZjKD6etQtk1hx3hNLnb1V5RALVYlt2o
         3fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnQVKaG82yI9qGBdbrUloXahD7OOO/f8/ybsKA2Y9ll483nbqO8EC2FyqmKbRfyzDOR8k+F2LhaZsOaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKMsiL/mHPqGbmb6HYfIlQy15CGvv+d8tcHw/uLl4ckrJdhotU
	9cclOu0bktg7Ehk41p+WZeZr4Aq2C20HkqQaa+RxilSWTy5lVx+XxkFXb2rmQTE=
X-Gm-Gg: ASbGncscmpXY9DlzIUw964ZvMGmP8+EQxu/McKWRgZhPlLY/B8pGbqQnuyjUutGAHkU
	gQWcRTWnyz+5zzhQ3vlwSOVrlPp3Mqq43fbOHuJozAyTa7Od9PJR2eL4P9hFrPjSEWvc3Vt4Hk5
	srCDDqZ711JuilLzyC+UCzX1w5lideRp9tS/Wfa0M0nEdQXJWueTNslqq5yK/P0n53fbmVBopwB
	M2SiLyRKsVBtZ5No0Bvdvu/SWJrwbThb5fWtJEtBv7az87DcNl2eRvQ1KLI05FmaXeIJWpO5sPH
	Lpf9Ju4FUpHZgVb5J69rxnQHajXVAEKo36MBc6JGFA==
X-Google-Smtp-Source: AGHT+IFwoPNkZRHRLCRUuOqGDF2uiHAGyCvd3q8quDmBUyk1f/F/4WvIpLrbGYXfNhaC6uEF0f4feg==
X-Received: by 2002:a17:903:2447:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22c35916f13mr99932925ad.25.1744892675059;
        Thu, 17 Apr 2025 05:24:35 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:34 -0700 (PDT)
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
Subject: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 17 Apr 2025 14:19:51 +0200
Message-ID: <20250417122337.547969-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052436_088584_C8401A4F 
X-CRM114-Status: GOOD (  13.11  )
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
Z2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysr
KysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMKaW5kZXggMzc5OTgxYzJiYjIxLi43YjA2MjE4OWIxODQgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5j
CkBAIC0yOTksNiArMjk5LDggQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQs
IGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGlj
IGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOworCiAvKioKICAqIHNiaV9md2Z0X3NldCgpIC0gU2V0
IGEgZmVhdHVyZSBvbiB0aGUgbG9jYWwgaGFydAogICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIElE
IHRvIGJlIHNldApAQCAtMzA5LDcgKzMxMSwxNSBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92
MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAogICovCiBpbnQgc2Jp
X2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25n
IGZsYWdzKQogewotCXJldHVybiAtRU9QTk9UU1VQUDsKKwlzdHJ1Y3Qgc2JpcmV0IHJldDsKKwor
CWlmICghc2JpX2Z3ZnRfc3VwcG9ydGVkKQorCQlyZXR1cm4gLUVPUE5PVFNVUFA7CisKKwlyZXQg
PSBzYmlfZWNhbGwoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZXRlRfU0VULAorCQkJZmVhdHVyZSwg
dmFsdWUsIGZsYWdzLCAwLCAwLCAwKTsKKworCXJldHVybiBzYmlfZXJyX21hcF9saW51eF9lcnJu
byhyZXQuZXJyb3IpOwogfQogCiBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKQEAgLTM0OCw2ICszNTgs
OSBAQCBpbnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNr
LCB1MzIgZmVhdHVyZSwKIAkJLmVycm9yID0gQVRPTUlDX0lOSVQoMCksCiAJfTsKIAorCWlmICgh
c2JpX2Z3ZnRfc3VwcG9ydGVkKQorCQlyZXR1cm4gLUVPUE5PVFNVUFA7CisKIAlpZiAoZmVhdHVy
ZSAmIFNCSV9GV0ZUX0dMT0JBTF9GRUFUVVJFX0JJVCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAg
LTY3OSw2ICs2OTIsMTEgQEAgdm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkKIAkJCXByX2luZm8o
IlNCSSBEQkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9h
dmFpbGFibGUgPSB0cnVlOwogCQl9CisJCWlmICgoc2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtf
dmVyc2lvbigzLCAwKSkgJiYKKwkJICAgIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfRldG
VCkgPiAwKSkgeworCQkJcHJfaW5mbygiU0JJIEZXRlQgZXh0ZW5zaW9uIGRldGVjdGVkXG4iKTsK
KwkJCXNiaV9md2Z0X3N1cHBvcnRlZCA9IHRydWU7CisJCX0KIAl9IGVsc2UgewogCQlfX3NiaV9z
ZXRfdGltZXIgPSBfX3NiaV9zZXRfdGltZXJfdjAxOwogCQlfX3NiaV9zZW5kX2lwaQk9IF9fc2Jp
X3NlbmRfaXBpX3YwMTsKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
