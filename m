Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4AFC369D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amIlo3oowrJSwGPhBdy4VEEAYfuKyjYd9HPooj1iBR8=; b=LC9AOaWaHolNS9
	6Q/FIPoNaP5bozKsI06vS3qziANCOVc34446oR2BnJGxyMiRvQ/WPE7sxcgkkfNLhhI9UU3emp8AS
	YiJTDkuWat0EMGReNFlZqhTGygzXtfvoQwJVmy99GNOFM6no+RRKcg+wCo++ByMPAI7c/EUUOLcsP
	lKp2U22w5Dt5TGTrufUXmaKFNnWBDNoh2Ti+IHFloYyIh9z1Oel64Wo5KIMouzjvAO81vSf6S4OL4
	J8RWfMREErNR58NDZ+1G+cAlNkktrYTf0PPZ5WwL3DHJAN1mqwBfSjURQgJmihH/SsdKSAM9Ugcv1
	LCA5KImUxGtVIGY3ms2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTO-0000000Cz1E-4B66;
	Thu, 17 Apr 2025 12:36:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OHy-0000000CvMg-2RNX
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:24:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-225df540edcso19426795ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892658; x=1745497458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=TpQqG7jKcaTKPvg/7FFRr+TBmlVrq9B/c9HugQScC6HXVNZ91aKgVptNIff46R8B43
         P0wiYmwIKOP+jdKAEcz4hFk2aVdSmeiVxwJdv4nV8J1Qz7jI/YZL2wgvbgYw+x1x8l9e
         TFVb/ivTwJKSZGFBQgUs4Cf1auXdwhNbiwIpSDGYgJE+q5igT5AqXDkS6gdEO5TKI9Px
         n+2FJBMXBOLrmsPR7te9l2cgvxzXV4KygdeZP0tXqpISEs0xowKRi8EZYHU299OPPKzm
         1ingNali6TjWrNcY+3l6rkiRA/Pm3EF/63dbSS6M4WDp/O8/+8VDh+Amd6955jK1eqdV
         WaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892658; x=1745497458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=ANilHHHetLd08MgfRuwWMQbYcNRAxCetB2QP2m4J9M9RyQoDrMnRxajj3+cohUtPrZ
         NMepyiilqSFlgshJ6d//oGyctsAFnXkABIn8MdpJ7a6O7MHxMzwdYbZ59MnJnjZKsIqW
         fjYymiGuWY6afQ7Ubytstk+S9AZXeGu5U/DwzDcAB1go8iE4PWW6gxDxeF6SrFt3imQ8
         8BI4djsEMhst4ZaTMgvhkIm2tVkToXqg6HYKSfilQX49rf5avKL/aobHlUk7MznC16I3
         H+PNOAEEF07w3nvQFhRMVJ1FURd3pbeuYKI/umhdO02NxG52W2pEQA6Q9gwKVfkwD86I
         M+sg==
X-Forwarded-Encrypted: i=1; AJvYcCXClJ/pPf78jaWvIwpF3GZ1l9tqwoMmd01udYub1C4NYCeZYFurKsz8qDFd+xsLwX/QXCU1FJE/vLYxFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR6i7lYJP042kRquQxBaW4piu83PnI9Fwm4gBXQ8Zd3Qqvs/S7
	ZSaZ8v46u0D9oL+VMo6xsJ+uBTmRCgdwnZTVQ+URcj/8xWVfnmgSHiBexMMeyAQ=
X-Gm-Gg: ASbGncu5iPo72dNbNER6X2aDXjTgREghs38SgCdnV7flNIlJeaYuyvkSGZRUfUGE022
	UYQ5MvkFBV7WpKbE9/Wv8ltl6AIDzu7G62yEUuxp/nhUIu/3ttFIrycbyo0yRBoblHOPeSe7epd
	dWf8FLzmiXjm1rBIZecNufGkrt6KYY8G/aL0ZTGDztXihgeRCxpviolKeLIE+sz9+iYOVg2Tidq
	pPZgdnVDZUIDFb9rmtWroqqgl4WzyajS/0RKZpOI06T4TDtdMkSnG6g19srQhbD4PFFifWpAR6w
	yH6JiDra8tzJYSYpBR8wLymvb6iGGJGJxvpu8DXq1A==
X-Google-Smtp-Source: AGHT+IE0XjCz5TtIm1U/KycHsULkn93MfV8ZJ4DCUOeKjh64BtT2X4MD7ZC1hijUVKkaUKvQHFj5ag==
X-Received: by 2002:a17:902:f642:b0:215:9eac:1857 with SMTP id d9443c01a7336-22c4196f564mr40963855ad.5.1744892657640;
        Thu, 17 Apr 2025 05:24:17 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:16 -0700 (PDT)
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
Subject: [PATCH v5 02/13] riscv: sbi: add new SBI error mappings
Date: Thu, 17 Apr 2025 14:19:49 +0200
Message-ID: <20250417122337.547969-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052418_626222_0A69CCFA 
X-CRM114-Status: UNSURE (   7.39  )
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

QSBmZXcgbmV3IGVycm9ycyBoYXZlIGJlZW4gYWRkZWQgd2l0aCBTQkkgVjMuMCwgbWFwcyB0aGVt
IGFzIGNsb3NlIGFzCnBvc3NpYmxlIHRvIGVycm5vIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaCB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKaW5kZXggYmIwNzdkMGM5MTJmLi43ZWMyNDlmZWE4ODAgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaApAQCAtNTM2LDExICs1MzYsMjEgQEAgc3RhdGljIGlubGluZSBpbnQgc2Jp
X2Vycl9tYXBfbGludXhfZXJybm8oaW50IGVycikKIAljYXNlIFNCSV9TVUNDRVNTOgogCQlyZXR1
cm4gMDsKIAljYXNlIFNCSV9FUlJfREVOSUVEOgorCWNhc2UgU0JJX0VSUl9ERU5JRURfTE9DS0VE
OgogCQlyZXR1cm4gLUVQRVJNOwogCWNhc2UgU0JJX0VSUl9JTlZBTElEX1BBUkFNOgorCWNhc2Ug
U0JJX0VSUl9JTlZBTElEX1NUQVRFOgogCQlyZXR1cm4gLUVJTlZBTDsKKwljYXNlIFNCSV9FUlJf
QkFEX1JBTkdFOgorCQlyZXR1cm4gLUVSQU5HRTsKIAljYXNlIFNCSV9FUlJfSU5WQUxJRF9BRERS
RVNTOgogCQlyZXR1cm4gLUVGQVVMVDsKKwljYXNlIFNCSV9FUlJfTk9fU0hNRU06CisJCXJldHVy
biAtRU5PTUVNOworCWNhc2UgU0JJX0VSUl9USU1FT1VUOgorCQlyZXR1cm4gLUVUSU1FOworCWNh
c2UgU0JJX0VSUl9JTzoKKwkJcmV0dXJuIC1FSU87CiAJY2FzZSBTQklfRVJSX05PVF9TVVBQT1JU
RUQ6CiAJY2FzZSBTQklfRVJSX0ZBSUxVUkU6CiAJZGVmYXVsdDoKLS0gCjIuNDkuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
