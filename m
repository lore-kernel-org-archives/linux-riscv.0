Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF00C4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGucDDzckYHNV7dFTuW01/2jBlmt59eM1SfC42/aCGg=; b=Wg2gjKZ9o49ihg
	RbEOf6IogJK2Hnc5H1trazuoSpJZX4snCMOgBuJ6NstB77sYc8YA0c5nJCLt0XejZztPBs54e2epg
	pOrqdg+/S3Kkn5sjK69/pEIny2/7vYtJZ0Af7IbtcwVIqbHQJFVJHCVfoSX1bO+XvEmgMAk0H3PyF
	N854AzTRCoUzcaW6bgsmg7NfGbhafLRYK2Y7jKQWo01PBVuOL43AWqqnHtVxg4Dv1ItDtRg1LjGr8
	KQXKqSwZx2yN7s01XTVQl/MJSkTBv8Ife1gbwiX64YPmvR1wGO/k/AkllbApUh+F4vJZGdl18dAY6
	r4AvKX0cdJFWbJK0d/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFY2-002ZYN-2M;
	Fri, 12 Jan 2024 11:18:02 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOFXy-002ZV1-1K
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 11:18:00 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28c5af37d3aso1181800a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705058277; x=1705663077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w/9bskBXsRWHhui8ZaSBSUqNBD3kcRzwMs9bhf0U2U=;
        b=FSnvwrGWHxmXaUf9md5ait2UW94x+jJbUrG+Onr/BL4CusZ0aMBK45ze7FE+ocxHfN
         C52ohoMm+3AIHXebZazXRsbt0qhpt32A52FmCd+yMN295SN9yrWLV5qSESy8VIjLEon3
         Xk8U27caU1x2FGldv6EeywCkDtAS23OVHubHD3NNUEvuVikxaFn28L1qfocYUSKMWyFd
         Vq17oh1zW+e6DBdkVN3kP4kklfYYvcI4dn/cKJjrCsaxCoXaClAOb6BQUjVvpGf7W9+0
         nteOYyqQzUiVWYmtlV679ixt3XlL8C6VQpUqQe7PfLJuMfBQ8K7Gyq11EOt04ynMpRIW
         adBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705058277; x=1705663077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w/9bskBXsRWHhui8ZaSBSUqNBD3kcRzwMs9bhf0U2U=;
        b=Q2RENAZqyjw4JU6iC5ztCV5ujvfbpoupDk9sIb/J+fXsj920RCOAQ7Eg3bkLpmWbk5
         W6DiyCyAWUqZC/fu8BnNz1dpl2JyZfdkIbPSGTMJQUygHGjnzioOdi5hwQCclW0Uzfik
         mgSzB6/F9+vlXMBkd+4RmG9QN011OhlmrCV/QRG+oVKsdmlX92g3yG3jfYxwrDW5VZ5Y
         kDtGA6Ymn6DQVjt3SDVCMS2tB9aRuOtiAxZfflWktO9N7PcPfDYQpjKKJyIp9C1RAarc
         ntxGi5JLd7m2MMQBVtX8TQohuHMtakxMcbJMA1M/AyAMeDne6jtA03lJ2u0hj+RVN3tM
         0b7g==
X-Gm-Message-State: AOJu0Yxi/g96r0HQZ4TcE+KG0EN+aB5yoNP6awM+vrYRAmr7NOIapYqk
	6FqVpjD2XefJRsb7t29e/v72WBwB71gcGg==
X-Google-Smtp-Source: AGHT+IE7/kN9i+GiQIVlZVdE2Vic4gF/Ie1ElYGWcAfLnQxdjsUZVPiwKOEkVwRXM2sM2j4JicpVGQ==
X-Received: by 2002:a17:90b:4c43:b0:28d:e5e7:fe43 with SMTP id np3-20020a17090b4c4300b0028de5e7fe43mr1344177pjb.1.1705058277475;
        Fri, 12 Jan 2024 03:17:57 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:a276:8a4e:2aa1:5f09])
        by smtp.gmail.com with ESMTPSA id sd12-20020a17090b514c00b0028cef021d45sm3794179pjb.17.2024.01.12.03.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 03:17:57 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 3/3] perf: RISC-V: add support for SSE event
Date: Fri, 12 Jan 2024 12:17:15 +0100
Message-ID: <20240112111720.2975069-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112111720.2975069-1-cleger@rivosinc.com>
References: <20240112111720.2975069-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_031758_448373_25BD6854 
X-CRM114-Status: GOOD (  17.16  )
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

SW4gb3JkZXIgdG8gdXNlIFNTRSB3aXRoaW4gUE1VIGRyaXZlcnMsIHJlZ2lzdGVyIGEgU1NFIGhh
bmRsZXIgZm9yIHRoZQpsb2NhbCBQTVUgZXZlbnQuIFJldXNlIHRoZSBleGlzdGluZyBvdmVybGZs
b3cgSVJRIGhhbmRsZXIgYW5kIHBhc3MKYXBwcm9wcmlhdGUgcHRfcmVncy4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBkcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11X3NiaS5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMKaW5kZXggMTZhY2Q0ZGNkYjk2Li5jODJkN2ZlMDA0YzggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2
X3BtdV9zYmkuYwpAQCAtMTcsNiArMTcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2lycWRvbWFpbi5o
PgogI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgogI2luY2x1ZGUgPGxpbnV4L29mLmg+CisjaW5j
bHVkZSA8bGludXgvcmlzY3Zfc3NlLmg+CiAjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+CiAjaW5j
bHVkZSA8bGludXgvc2NoZWQvY2xvY2suaD4KIApAQCAtNjY4LDEwICs2NjksMTAgQEAgc3RhdGlj
IGlubGluZSB2b2lkIHBtdV9zYmlfc3RhcnRfb3ZlcmZsb3dfbWFzayhzdHJ1Y3QgcmlzY3ZfcG11
ICpwbXUsCiAJfQogfQogCi1zdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxlcihp
bnQgaXJxLCB2b2lkICpkZXYpCitzdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxl
cihzdHJ1Y3QgY3B1X2h3X2V2ZW50cyAqY3B1X2h3X2V2dCwKKwkJCQkgICAgICAgc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsIGJvb2wgZnJvbV9zc2UpCiB7CiAJc3RydWN0IHBlcmZfc2FtcGxlX2RhdGEg
ZGF0YTsKLQlzdHJ1Y3QgcHRfcmVncyAqcmVnczsKIAlzdHJ1Y3QgaHdfcGVyZl9ldmVudCAqaHdf
ZXZ0OwogCXVuaW9uIHNiaV9wbXVfY3RyX2luZm8gKmluZm87CiAJaW50IGxpZHgsIGhpZHgsIGZp
ZHg7CkBAIC02NzksNyArNjgwLDYgQEAgc3RhdGljIGlycXJldHVybl90IHBtdV9zYmlfb3ZmX2hh
bmRsZXIoaW50IGlycSwgdm9pZCAqZGV2KQogCXN0cnVjdCBwZXJmX2V2ZW50ICpldmVudDsKIAl1
bnNpZ25lZCBsb25nIG92ZXJmbG93OwogCXVuc2lnbmVkIGxvbmcgb3ZlcmZsb3dlZF9jdHJzID0g
MDsKLQlzdHJ1Y3QgY3B1X2h3X2V2ZW50cyAqY3B1X2h3X2V2dCA9IGRldjsKIAl1NjQgc3RhcnRf
Y2xvY2sgPSBzY2hlZF9jbG9jaygpOwogCiAJaWYgKFdBUk5fT05fT05DRSghY3B1X2h3X2V2dCkp
CkBAIC02ODgsMTMgKzY4OCwxNSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFu
ZGxlcihpbnQgaXJxLCB2b2lkICpkZXYpCiAJLyogRmlybXdhcmUgY291bnRlciBkb24ndCBzdXBw
b3J0IG92ZXJmbG93IHlldCAqLwogCWZpZHggPSBmaW5kX2ZpcnN0X2JpdChjcHVfaHdfZXZ0LT51
c2VkX2h3X2N0cnMsIFJJU0NWX01BWF9DT1VOVEVSUyk7CiAJaWYgKGZpZHggPT0gUklTQ1ZfTUFY
X0NPVU5URVJTKSB7Ci0JCWNzcl9jbGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11X2lycV9udW0p
KTsKKwkJaWYgKCFmcm9tX3NzZSkKKwkJCWNzcl9jbGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11
X2lycV9udW0pKTsKIAkJcmV0dXJuIElSUV9OT05FOwogCX0KIAogCWV2ZW50ID0gY3B1X2h3X2V2
dC0+ZXZlbnRzW2ZpZHhdOwogCWlmICghZXZlbnQpIHsKLQkJY3NyX2NsZWFyKENTUl9TSVAsIEJJ
VChyaXNjdl9wbXVfaXJxX251bSkpOworCQlpZiAoIWZyb21fc3NlKQorCQkJY3NyX2NsZWFyKENT
Ul9TSVAsIEJJVChyaXNjdl9wbXVfaXJxX251bSkpOwogCQlyZXR1cm4gSVJRX05PTkU7CiAJfQog
CkBAIC03MDYsMTYgKzcwOCwxNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFu
ZGxlcihpbnQgaXJxLCB2b2lkICpkZXYpCiAKIAkvKgogCSAqIE92ZXJmbG93IGludGVycnVwdCBw
ZW5kaW5nIGJpdCBzaG91bGQgb25seSBiZSBjbGVhcmVkIGFmdGVyIHN0b3BwaW5nCi0JICogYWxs
IHRoZSBjb3VudGVycyB0byBhdm9pZCBhbnkgcmFjZSBjb25kaXRpb24uCisJICogYWxsIHRoZSBj
b3VudGVycyB0byBhdm9pZCBhbnkgcmFjZSBjb25kaXRpb24uIFdoZW4gdXNpbmcgU1NFLAorCSAq
IGludGVycnVwdCBpcyBjbGVhcmVkIHdoZW4gc3RvcHBpbmcgY291bnRlcnMuCiAJICovCi0JY3Ny
X2NsZWFyKENTUl9TSVAsIEJJVChyaXNjdl9wbXVfaXJxX251bSkpOworCWlmICghZnJvbV9zc2Up
CisJCWNzcl9jbGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11X2lycV9udW0pKTsKIAogCS8qIE5v
IG92ZXJmbG93IGJpdCBpcyBzZXQgKi8KIAlpZiAoIW92ZXJmbG93KQogCQlyZXR1cm4gSVJRX05P
TkU7CiAKLQlyZWdzID0gZ2V0X2lycV9yZWdzKCk7Ci0KIAlmb3JfZWFjaF9zZXRfYml0KGxpZHgs
IGNwdV9od19ldnQtPnVzZWRfaHdfY3RycywgUklTQ1ZfTUFYX0NPVU5URVJTKSB7CiAJCXN0cnVj
dCBwZXJmX2V2ZW50ICpldmVudCA9IGNwdV9od19ldnQtPmV2ZW50c1tsaWR4XTsKIApAQCAtNzYx
LDYgKzc2MywyMiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11X3NiaV9vdmZfaGFuZGxlcihpbnQg
aXJxLCB2b2lkICpkZXYpCiAJcmV0dXJuIElSUV9IQU5ETEVEOwogfQogCitzdGF0aWMgaXJxcmV0
dXJuX3QgcG11X3NiaV9vdmZfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2KQoreworCXJl
dHVybiBwbXVfc2JpX292Zl9oYW5kbGVyKGRldiwgZ2V0X2lycV9yZWdzKCksIGZhbHNlKTsKK30K
Kworc3RhdGljIGludCBwbXVfc2JpX292Zl9zc2VfaGFuZGxlcih1aW50MzJfdCBldnQsIHZvaWQg
KmFyZywKKwkJCQkgICBzdHJ1Y3QgcHRfcmVncyAqcmVncykKK3sKKwlzdHJ1Y3QgY3B1X2h3X2V2
ZW50cyBfX3BlcmNwdSAqaHdfZXZlbnRzID0gYXJnOworCXN0cnVjdCBjcHVfaHdfZXZlbnRzICpo
d19ldmVudCA9IHJhd19jcHVfcHRyKGh3X2V2ZW50cyk7CisKKwlwbXVfc2JpX292Zl9oYW5kbGVy
KGh3X2V2ZW50LCByZWdzLCB0cnVlKTsKKworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IHBt
dV9zYmlfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCBobGlzdF9ub2RlICpu
b2RlKQogewogCXN0cnVjdCByaXNjdl9wbXUgKnBtdSA9IGhsaXN0X2VudHJ5X3NhZmUobm9kZSwg
c3RydWN0IHJpc2N2X3BtdSwgbm9kZSk7CkBAIC04MDQsOSArODIyLDE3IEBAIHN0YXRpYyBpbnQg
cG11X3NiaV9keWluZ19jcHUodW5zaWduZWQgaW50IGNwdSwgc3RydWN0IGhsaXN0X25vZGUgKm5v
ZGUpCiBzdGF0aWMgaW50IHBtdV9zYmlfc2V0dXBfaXJxcyhzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUs
IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJaW50IHJldDsKKwlzdHJ1Y3Qgc3Nl
X2V2ZW50ICpldnQ7CiAJc3RydWN0IGNwdV9od19ldmVudHMgX19wZXJjcHUgKmh3X2V2ZW50cyA9
IHBtdS0+aHdfZXZlbnRzOwogCXN0cnVjdCBpcnFfZG9tYWluICpkb21haW4gPSBOVUxMOwogCisJ
ZXZ0ID0gc3NlX2V2ZW50X3JlZ2lzdGVyKFNCSV9TU0VfRVZFTlRfTE9DQUxfUE1VLCAwLAorCQkJ
CSBwbXVfc2JpX292Zl9zc2VfaGFuZGxlciwgaHdfZXZlbnRzKTsKKwlpZiAoIUlTX0VSUihldnQp
KSB7CisJCXNzZV9ldmVudF9lbmFibGUoZXZ0KTsKKwkJcmV0dXJuIDA7CisJfQorCiAJaWYgKHJp
c2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFNTQ09GUE1GKSkgewogCQlyaXNjdl9w
bXVfaXJxX251bSA9IFJWX0lSUV9QTVU7CiAJCXJpc2N2X3BtdV91c2VfaXJxID0gdHJ1ZTsKQEAg
LTgzNCw3ICs4NjAsNyBAQCBzdGF0aWMgaW50IHBtdV9zYmlfc2V0dXBfaXJxcyhzdHJ1Y3Qgcmlz
Y3ZfcG11ICpwbXUsIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZQogCQlyZXR1cm4gLUVOT0RF
VjsKIAl9CiAKLQlyZXQgPSByZXF1ZXN0X3BlcmNwdV9pcnEocmlzY3ZfcG11X2lycSwgcG11X3Ni
aV9vdmZfaGFuZGxlciwgInJpc2N2LXBtdSIsIGh3X2V2ZW50cyk7CisJcmV0ID0gcmVxdWVzdF9w
ZXJjcHVfaXJxKHJpc2N2X3BtdV9pcnEsIHBtdV9zYmlfb3ZmX2lycV9oYW5kbGVyLCAicmlzY3Yt
cG11IiwgaHdfZXZlbnRzKTsKIAlpZiAocmV0KSB7CiAJCXByX2VycigicmVnaXN0ZXJpbmcgcGVy
Y3B1IGlycSBmYWlsZWQgWyVkXVxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKLS0gCjIuNDMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
