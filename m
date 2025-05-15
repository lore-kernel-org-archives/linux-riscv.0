Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89182C3ABC9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDRniO2oAWbj5/faNBQ5RwFYdw/wktnxiDLN24/Mf3s=; b=dds8ry49PnRoCB
	oa3PM3gVhF4TMKM719fHPh8Nmh35pp0PDImtzmmjMDLEI33+7boQIV7YJKH7WJV5FClIWUu/j1mH0
	Ep5Bt093Kw8gUKD//IWhQUGNa8U/Jw8wAmlIeAshnsjoXKmjl5a/YsRGqaj+K70d1L77GBJ4moaST
	HnnyUVwClvBXHX51XHnKuuwj6yIZkf7PPMJ1A5VD210xHhxmESb1lmMp7n6RVH9+1y0MmungqBynU
	mNct7rRmTQNLZw8yjFQhIWq4zz22GDFkH/iRP35SV5hNeLA4SDiFqI+id2k+RrRzDgYbS88/9LZER
	xPEND3fEBi54iqbgWmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyQ-0000000HY4e-0RQF;
	Thu, 15 May 2025 08:29:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTso-0000000HVr8-0SKc
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:24:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf257158fso4377075e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297441; x=1747902241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HRRvwQZR7OY0o40CF4iX42SSRrEHUJjKFBagu/MDOQ=;
        b=tM9kGNf23Olg97SpHZVZD3vie8m3raNe4o55ABXYMu8qaumX0qJV7Qjpd09tPqOApo
         vkncWKNJrJ98CbS4TT1oufq6nxbBwzIbTjr8F3+XT4hiMs4BdY2yUkWnj4Kl3k7kkPkc
         dQxFBif5L30q7f+GFTc7BueqUmGvso62ijkiFK+AIT1lhnJPnS/L81HRF4Wgyn60jV7h
         0nhiuuFEemoyntVZ8PSyMXtDZ925GMPe00jhnz5jHkgrluim0bi4SKl3Inae9TODP1Ft
         SyiMEHOCocXN+OrrnnoilSTgQYROuwXIOuX5RZus/axQF1bkZJBIva0sGVPijrjk4mZI
         8luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297441; x=1747902241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HRRvwQZR7OY0o40CF4iX42SSRrEHUJjKFBagu/MDOQ=;
        b=gRTThOOEqFknlPULMAD0LKwHh3Qq0W0GZyxL8oBnX2cjJ6gsQj7iy8jsWkLmpPPCzR
         iDLDgc1UiJIWk3+ElRI2YkxiDFmqzYe/41+Z4Cpj5nOWg5NoTNe59UOeZwot7UJ5rL3y
         pk4xjO5uF1mPC+khi0Fty90lXEP05kHLDUQKF1/uAOcrBPH6cvzmcBDlLL3EcQ8und/V
         tOUHGZP4MJd/ewlcL9Gq9gA2vXslw+v8f37QLWJNI3EmW/ypgEzinibE/1vLuTGrZamu
         Z8vSX4kccdwRKW17fQcZ4GYRo8XNKuJSOX3DhcNbjvE3PUz1SMuKCu0HtDUBICOLcH8p
         WT2w==
X-Forwarded-Encrypted: i=1; AJvYcCUs7TCjLMj89ix2KpotXuptm8tsC9lv9QuA0+XxFlRJfVqAaKAiepqqUdOmAGt88JKitHvDRB4aKccbXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBuRs/PRcBGzsmkmT+yNsceTWILloVQ7MEqRQkPIVPem56fE5u
	UG2xw62aSN+aJJOJ81WfQ4Fuf/9AYkts35gg5UzI2paEoAzZG1xLnUkhjXR8pX4=
X-Gm-Gg: ASbGnctZ6Bt+Rl55s2smvKU1JKGfdHBe7Zk7sJBo+H4I7/4qSXJ5mSKqwWfckS73wUT
	EjBANbN5lVsleDCHBuMxRHmezq6ghLnRuc/Crc7Wl5N9uQjBK4HbKQ89oN45NzGyEhSEDw8rFgW
	9fKOb69+YdgGnFWgtr8brpZaCgN9qrmEpZatZhaTgXYBRKDZDY3xnS9stJSCQQgWUn0ox34ygD/
	ypDRLWi5dpeapVoh2C7s1gjMQf3tzXiTsUb6l4RuJLP0IEek2mOksJXaFkJiRVnA2DdXUNMtKf0
	Ww8XsMaysMJAC567EZyJWLQCGakK8uSlD4/O9ximTiQcsJOp0ixi4VcyYQxwWA==
X-Google-Smtp-Source: AGHT+IEl4xkkhRV/6rqGgqq8GhxlIIH1Zsk+aKdZ8qLIk9sfmfbfHiVPZ4lcOrwQMJaY11G/EM+wbA==
X-Received: by 2002:a05:600c:3f0f:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-442f9714e8amr13194375e9.33.1747297440668;
        Thu, 15 May 2025 01:24:00 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:59 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v7 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
Date: Thu, 15 May 2025 10:22:15 +0200
Message-ID: <20250515082217.433227-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012402_147499_29B9AA05 
X-CRM114-Status: GOOD (  11.96  )
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

U0JJX0ZXRlRfTUlTQUxJR05FRF9ERUxFRyBuZWVkcyBoZWRlbGVnIHRvIGJlIG1vZGlmaWVkIHRv
IGRlbGVnYXRlCm1pc2FsaWduZWQgbG9hZC9zdG9yZSBleGNlcHRpb25zLiBTYXZlIGFuZCByZXN0
b3JlIGl0IGR1cmluZyBDUFUKbG9hZC9wdXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBEZWVwYWsgR3VwdGEgPGRlYnVn
QHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIHwgNDEgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKaW5kZXggYjBmNjZjN2JmMDEwLi42NzcwYzA0M2Ji
Y2IgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYworKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKQEAgLTE0LDYgKzE0LDggQEAKICNpbmNsdWRlIDxh
c20va3ZtX3ZjcHVfc2JpLmg+CiAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+CiAK
KyNkZWZpbmUgTUlTX0RFTEVHIChCSVRfVUxMKEVYQ19MT0FEX01JU0FMSUdORUQpIHwgQklUX1VM
TChFWENfU1RPUkVfTUlTQUxJR05FRCkpCisKIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSB7
CiAJLyoqCiAJICogQGlkOiBGZWF0dXJlIElECkBAIC02OCw3ICs3MCw0NiBAQCBzdGF0aWMgYm9v
bCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgZmVh
dHVyZSkKIAlyZXR1cm4gZmFsc2U7CiB9CiAKK3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9taXNh
bGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwly
ZXR1cm4gbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUoKTsKK30KKworc3RhdGljIGxvbmcg
a3ZtX3NiaV9md2Z0X3NldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAorCQkJCQlzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKKwkJCQkJdW5zaWdu
ZWQgbG9uZyB2YWx1ZSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfY29uZmlnICpjZmcgPSAmdmNwdS0+
YXJjaC5jZmc7CisKKwlpZiAodmFsdWUgPT0gMSkgeworCQljZmctPmhlZGVsZWcgfD0gTUlTX0RF
TEVHOworCQljc3Jfc2V0KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOworCX0gZWxzZSBpZiAodmFs
dWUgPT0gMCkgeworCQljZmctPmhlZGVsZWcgJj0gfk1JU19ERUxFRzsKKwkJY3NyX2NsZWFyKENT
Ul9IRURFTEVHLCBNSVNfREVMRUcpOworCX0gZWxzZSB7CisJCXJldHVybiBTQklfRVJSX0lOVkFM
SURfUEFSQU07CisJfQorCisJcmV0dXJuIFNCSV9TVUNDRVNTOworfQorCitzdGF0aWMgbG9uZyBr
dm1fc2JpX2Z3ZnRfZ2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCisJCQkJCXN0cnVjdCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAorCQkJCQl1bnNpZ25l
ZCBsb25nICp2YWx1ZSkKK3sKKwkqdmFsdWUgPSAoY3NyX3JlYWQoQ1NSX0hFREVMRUcpICYgTUlT
X0RFTEVHKSA9PSBNSVNfREVMRUc7CisKKwlyZXR1cm4gU0JJX1NVQ0NFU1M7Cit9CisKIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKKwl7CisJ
CS5pZCA9IFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHLAorCQkuc3VwcG9ydGVkID0ga3Zt
X3NiaV9md2Z0X21pc2FsaWduZWRfZGVsZWdhdGlvbl9zdXBwb3J0ZWQsCisJCS5zZXQgPSBrdm1f
c2JpX2Z3ZnRfc2V0X21pc2FsaWduZWRfZGVsZWdhdGlvbiwKKwkJLmdldCA9IGt2bV9zYmlfZndm
dF9nZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAorCX0sCiB9OwogCiBzdGF0aWMgc3RydWN0IGt2
bV9zYmlfZndmdF9jb25maWcgKgotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
