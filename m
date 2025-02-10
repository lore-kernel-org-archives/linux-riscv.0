Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DADC02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 23:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68479llWz/ULtnvqtYiZBF2/0Dbc4coXL1/kwZVM0dk=; b=rRvLUvxDQIJNdB
	cUzFmeN1e6JH5eufwuSnA4Qv5EMnMuRgsY4wlZfLgn6668WueNij0qNbEnJFHTk2OI31pJs97Vh9L
	rp3oOa6mEnbxfktfDqAQOq3B/VQCokke9ozh1TIbyVjJVyMA7xxz6CAM51vOJxZlR3pFbsDjLi5ZM
	6oK1++k3tMv8dtJ07l31HEOKORG34mnc4gFq5nKG6uykYlFWJ+CWCh9DSNxWVpOlgM/BlkZoZrSk5
	fdpqZiO1sa8dlsNHcQfKvbzG6Jz86IqKYekBwmXvPG7pxUGSZ+u+GTgdKCrmujX1WTLYc7Wjo/ewV
	T/ZpOFuPIt3Be8t4bF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdd1-00000001u3n-1ED7;
	Mon, 10 Feb 2025 23:55:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS2-00000001VU6-2uiW
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dNygMxZnETinUIbqht3HdG0xEf8Y/zFmGWQC8EBuXhA=; b=d8bSWsjkMx4HasbwFId/h6NI1Z
	noQtzwo985I13L3ptEGYI3st64uJpPBHAZToFuT1KNiCluNcZQmu9CqNXCpV7oE/nEYvR9rWVU9Wn
	sSC0X7C9o5aZeDDdtdD06LiuhBAPbOUP8mcWSxD7MGuA611DrekjvhgWtsCfvY34puCRqChTdDp9g
	2pRyj6lFLSL2bPOiY4ARn3M8roT9uqkvZz60TacyV2oSpyZ1c8WBwe5ckUOhV4KjWrA4XKEV+HaWz
	ghpZ9lXv2A4lzxB72ntQ1PmxcGefUF6p3+9InqDornfOXAVXHWdlMm0Bhcv5+/byMKZlhKfieZc+6
	u3Swb27Q==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbRp-00000000I9K-1LFT
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:17 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361f664af5so54351495e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223364; x=1739828164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNygMxZnETinUIbqht3HdG0xEf8Y/zFmGWQC8EBuXhA=;
        b=IKzwSNkzflXv1EL7YKqdeNvHbC/w2i9dq0AgSnqg9jV5uS8wK84zd496p6P1/EbZJK
         bhO0j/2V72t7qwlQMGPiLuRxJ3bG5X1VsCyxPgQhP6sgLLrAcPQQy5wNZuoXV4Slf4gi
         1liVDgVMTiVDew61N0PKfTEXwBXwi1RZEGAbH8VE0ZT+hVLg0Oq5itawIr2NAN7gxiAy
         kDQSRYRl5b300OWvmLCLg9ajrJIlw9/+kWunPbYu2z9d//Qzgo8etIa6KOyWWz7WqGQS
         jCeLsZnihuDLQXPWaxqfhjp0YAu4Nj8lFvt7lCH0RNA3Tc3gD0IJHCAwZiaMkUC7GIgE
         BbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223364; x=1739828164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNygMxZnETinUIbqht3HdG0xEf8Y/zFmGWQC8EBuXhA=;
        b=WEY/xqgLdE2YFIdy+Y3DqPEotxKoxxapncoQXs4IsAPCd0A3J+O4M4uXADm5LidkKa
         W0AXhatpivglqBs1szY4TvQ8BecfyPe3ShH/+aSErXv3vxpeVxmvEjYv5uW9YC+MNUPF
         QDreIS6S0mJO1YJj3iGv6h+Tdvs0oCoMBsO0e6vCOjdl4fi9XASBtfMydzIqXHBCLnAQ
         046xMItCjaOU+wCQUk96SkuUSQfwmhtocZI74eepExSouRK5MvnF1zeSMRCi7DNXF/+9
         9nQOiUlZFUx6smY8GbL/yBO1WBSEpv2gtri3EUFeqgE/F/s1jqhvQVU1vcez/jlAN4VK
         ZIDA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ1r7occKejTh0HcIJjlw4rYh+M5Fk0+i0OwRkPWwb66WrfE8jMI12wzcZ7PuBFuWQZVKqUUmhujp/Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1wNv4PifdVtGxws0zqQrG5FWnd+1X7MWqISCweqa4xXJiBdC4
	rZFiYW+kv5/3jgjAbw4OaPpzlL7Tz4MNueebhH4Oa2K0Z0Zk+fPdHb7zc1jrdyc=
X-Gm-Gg: ASbGncuq7j/huJF3uDJVrg8GbQ8qc7CPBOwnHryD94o7T/JAOgEuhurkNRTBOB1agRs
	Fi+Lv2n8V8cOJJ85Kpyr5YB4AsZ03rK8mmsXP0jv4iyuVu9a7ujW5CzHayCxgeOjJ1545OOpWy5
	z+D+jd/gQGiND604T6AfHDEFoM5GBtllP8S3qUdFCqZeh1v7rabfhEPdlpW5HPV1rfOJdVJNj9v
	V60jV7jLQVUNLvROMSJWQ6clk3PFdmm9hAen+QcoosVixWkdjSXWCcU2a04xBMkN3otOez6JORv
	csMBa3NoCUuppg5A
X-Google-Smtp-Source: AGHT+IEAhlsJGIdKtITdkCqcTf1jglZE/SWwXLDChC0QYiT0cR7GNzwUW0cObTxbcQCBuKABIqPOaA==
X-Received: by 2002:a05:600c:1f17:b0:436:e8b4:36e7 with SMTP id 5b1f17b1804b1-43924987efbmr120307725e9.8.1739223364575;
        Mon, 10 Feb 2025 13:36:04 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:03 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 01/15] riscv: add Firmware Feature (FWFT) SBI extensions definitions
Date: Mon, 10 Feb 2025 22:35:34 +0100
Message-ID: <20250210213549.1867704-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213615_270516_A2C72486 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

VGhlIEZpcm13YXJlIEZlYXR1cmVzIGV4dGVuc2lvbiAoRldGVCkgd2FzIGFkZGVkIGFzIHBhcnQg
b2YgdGhlIFNCSSAzLjAKc3BlY2lmaWNhdGlvbi4gQWRkIFNCSSBkZWZpbml0aW9ucyB0byB1c2Ug
dGhpcyBleHRlbnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbT4KVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMzMgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IDNkMjUwODI0MTc4Yi4uZDM3M2I1YzA4MDM5IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vc2JpLmgKQEAgLTM1LDYgKzM1LDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKIAlTQklf
RVhUX0RCQ04gPSAweDQ0NDI0MzRFLAogCVNCSV9FWFRfU1RBID0gMHg1MzU0NDEsCiAJU0JJX0VY
VF9OQUNMID0gMHg0RTQxNDM0QywKKwlTQklfRVhUX0ZXRlQgPSAweDQ2NTc0NjU0LAogCiAJLyog
RXhwZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCiAJ
U0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQgPSAweDA4MDAwMDAwLApAQCAtNDAyLDYgKzQwMywz
MyBAQCBlbnVtIHNiaV9leHRfbmFjbF9mZWF0dXJlIHsKICNkZWZpbmUgU0JJX05BQ0xfU0hNRU1f
U1JFVF9YKF9faSkJCSgoX19yaXNjdl94bGVuIC8gOCkgKiAoX19pKSkKICNkZWZpbmUgU0JJX05B
Q0xfU0hNRU1fU1JFVF9YX0xBU1QJCTMxCiAKKy8qIFNCSSBmdW5jdGlvbiBJRHMgZm9yIEZXIGZl
YXR1cmUgZXh0ZW5zaW9uICovCisjZGVmaW5lIFNCSV9FWFRfRldGVF9TRVQJCTB4MAorI2RlZmlu
ZSBTQklfRVhUX0ZXRlRfR0VUCQkweDEKKworZW51bSBzYmlfZndmdF9mZWF0dXJlX3QgeworCVNC
SV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVHCQk9IDB4MCwKKwlTQklfRldGVF9MQU5ESU5HX1BB
RAkJCT0gMHgxLAorCVNCSV9GV0ZUX1NIQURPV19TVEFDSwkJCT0gMHgyLAorCVNCSV9GV0ZUX0RP
VUJMRV9UUkFQCQkJPSAweDMsCisJU0JJX0ZXRlRfUFRFX0FEX0hXX1VQREFUSU5HCQk9IDB4NCwK
KwlTQklfRldGVF9QT0lOVEVSX01BU0tJTkdfUE1MRU4JCT0gMHg1LAorCVNCSV9GV0ZUX0xPQ0FM
X1JFU0VSVkVEX1NUQVJUCQk9IDB4NiwKKwlTQklfRldGVF9MT0NBTF9SRVNFUlZFRF9FTkQJCT0g
MHgzZmZmZmZmZiwKKwlTQklfRldGVF9MT0NBTF9QTEFURk9STV9TVEFSVAkJPSAweDQwMDAwMDAw
LAorCVNCSV9GV0ZUX0xPQ0FMX1BMQVRGT1JNX0VORAkJPSAweDdmZmZmZmZmLAorCisJU0JJX0ZX
RlRfR0xPQkFMX1JFU0VSVkVEX1NUQVJUCQk9IDB4ODAwMDAwMDAsCisJU0JJX0ZXRlRfR0xPQkFM
X1JFU0VSVkVEX0VORAkJPSAweGJmZmZmZmZmLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9T
VEFSVAkJPSAweGMwMDAwMDAwLAorCVNCSV9GV0ZUX0dMT0JBTF9QTEFURk9STV9FTkQJCT0gMHhm
ZmZmZmZmZiwKK307CisKKyNkZWZpbmUgU0JJX0ZXRlRfUExBVEZPUk1fRkVBVFVSRV9CSVQJCSgx
IDw8IDMwKQorI2RlZmluZSBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQJCSgxIDw8IDMxKQor
CisjZGVmaW5lIFNCSV9GV0ZUX1NFVF9GTEFHX0xPQ0sJCQkoMSA8PCAwKQorCiAvKiBTQkkgc3Bl
YyB2ZXJzaW9uIGZpZWxkcyAqLwogI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQJMHgx
CiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQJMjQKQEAgLTQxOSw2ICs0NDcs
MTEgQEAgZW51bSBzYmlfZXh0X25hY2xfZmVhdHVyZSB7CiAjZGVmaW5lIFNCSV9FUlJfQUxSRUFE
WV9TVEFSVEVEIC03CiAjZGVmaW5lIFNCSV9FUlJfQUxSRUFEWV9TVE9QUEVEIC04CiAjZGVmaW5l
IFNCSV9FUlJfTk9fU0hNRU0JLTkKKyNkZWZpbmUgU0JJX0VSUl9JTlZBTElEX1NUQVRFCS0xMAor
I2RlZmluZSBTQklfRVJSX0JBRF9SQU5HRQktMTEKKyNkZWZpbmUgU0JJX0VSUl9USU1FT1VUCQkt
MTIKKyNkZWZpbmUgU0JJX0VSUl9JTwkJLTEzCisjZGVmaW5lIFNCSV9FUlJfREVOSUVEX0xPQ0tF
RAktMTQKIAogZXh0ZXJuIHVuc2lnbmVkIGxvbmcgc2JpX3NwZWNfdmVyc2lvbjsKIHN0cnVjdCBz
YmlyZXQgewotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
