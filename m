Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE53FE77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 16:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ROCYFI+EwMp7JovoXuYxnyFeuvwSWtxFxWUjW+qyyQ=; b=J4nW+KbWjUTkQA
	WJ63MxqhNBY8hPsbVUM6++D/bsg0+mkEPx1mH//Fle7tRz0dgOB2PyKNCZq7VVvU1WuwO0JUdo3Ov
	t/hlojs7IdHfc6tMTWbEwDECP4XBrG3Jsu4qpwAGnYCDphHcjKHsYWGOXKXlegqyd6SLlHXNt0rNk
	/YuvsA1w3QXDxDlBaZoD1FKRW2huuyBo9GhO+xjirxjr1f0vqM5BQkjLD+YN9XE8ya6nDbYm+tVY9
	/ov+7RWr+n4EpVfLoUmTln3+odahTKvNlNQyxybDX0DfEfAkRbkOY521i+7E6+YBCmnSW1Nbgl/z3
	6fRdMDLibq/yRj95Z7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbNR-00000002CiQ-3i5d;
	Fri, 06 Dec 2024 16:40:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEV-00000002AJ7-2gCl
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434a1639637so23527335e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Dec 2024 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733502670; x=1734107470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rih2z+q1Taz5W9gbG28kyjqjg/d4/wnIMKspBHeQrDw=;
        b=Vwfq/vCxL3GP+gxRj2MjDxASPYPxR0utpfve16xptAetsKp8kp5BmcssysbHJt4J1C
         7OzgJFzFJiKSIaEqWU40WMN9KOUoLM6/8HSxFsnoPrBcHoXNhfuZNI2Io6/1xDwiVHsp
         H7NOlx5RPupOT3lc8CJXNHIFQWHsaULEsfVxz7FnScvaRHdjt9KaBTbVPvdlP1vbC0MI
         wouDC2JTD88oJazZ9vEXPG5atM30aoh9dWG33W44lOqZgL5ctC0JdXvdZYLVxb/5w/9e
         R5RngJRNhQ8URXk7+XyHH/R7G0IrmTMqIN1/yN9gMmOPYvQNDDjjTSYZ/1+PC3ZAni5P
         oDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502670; x=1734107470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rih2z+q1Taz5W9gbG28kyjqjg/d4/wnIMKspBHeQrDw=;
        b=HHXFO2L1WWw0CSKoJvLGGociO3XxtCUXuxEhm07hEmW1lqR6mY/oECts8lBHZG/0E5
         8ngoiKHmDw+mHvZVDOwz/V+E8JCPHjTniWuZqauEY5SwLbd+4+AFVYPPjXPFY9Ox0WIL
         SOqmCSe0q9zKBs24FLZSNHOR4yxPHMPfpy+QzHAraUBzJEZpKUJzagdMa6K6EifA5u4h
         oGw+md8yYwOdJfq1A0eN/B7lk8W3sfita05L5JlxMD3aHpOPvFWBld5Npj5bkQ2qZcRy
         uZVnEokKGlkSE+jU1xH+nP42jhSNs9OI0yxFOVEjooY8hoYqeO/C0RWqLEN/qiVDUOjY
         QPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8BMPIrwIhHeR78lMvGXr08AN2Px5DTacFOq8birprtQSRHX7iefX0I+JqbGSrLWaojy6mu+MfgxBA7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUfRxpC/QOMKRw7xtjUGvPjmTMHKBFWLxxO/g1dFddtGM3Ih5y
	r0Q7fuBbGeocJwwt8MmpA779K3HXc4fAgoy/0+em/t/Nn5gkq8+Yh9qdktOmg6o=
X-Gm-Gg: ASbGncuxhgrpxqZZCiZPR1ywdRZriIr66wBu43IoVi4JXJ5P+bXM78WvWaGQJQIIrvS
	lBhxl3VdzVg4q9t6lmi95DVWU73UO+6/WBDrgxKJeOrMAcWD842lDnz2MTLCX9YEVBhFTm/J94L
	buFod6CXKsvkl1kEirUksc5rM2QO8XGGkIr10u3vAeFGkAzuovwnnnhl36pCETMkfw6jQrQtLAu
	xUnKceDqOw/+2BPgHmWj/Wx8FMQvidoGXFDfnc7XJjgiy7KKl0=
X-Google-Smtp-Source: AGHT+IFZNS/vLYTFlhcpAiQaF2L19OGIDhrILZwk3DfUtSNiJLmw56KxCqGdAEFEOkAw7CQrELObyw==
X-Received: by 2002:a5d:64c3:0:b0:385:f7d2:7e29 with SMTP id ffacd0b85a97d-3862b35d19fmr3174954f8f.15.1733502669549;
        Fri, 06 Dec 2024 08:31:09 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862f02f5c3sm1151942f8f.65.2024.12.06.08.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:08 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH v3 1/4] riscv: add SBI SSE extension definitions
Date: Fri,  6 Dec 2024 17:30:57 +0100
Message-ID: <20241206163102.843505-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206163102.843505-1-cleger@rivosinc.com>
References: <20241206163102.843505-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083111_673794_3FA30FE3 
X-CRM114-Status: UNSURE (   9.42  )
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

QWRkIG5lZWRlZCBkZWZpbml0aW9ucyBmb3IgU0JJIFN1cGVydmlzb3IgU29mdHdhcmUgRXZlbnRz
IGV4dGVuc2lvbiBbMV0uClRoaXMgZXh0ZW5zaW9uIGVuYWJsZXMgdGhlIFNCSSB0byBpbmplY3Qg
ZXZlbnRzIGludG8gc3VwZXJ2aXNvciBzb2Z0d2FyZQptdWNoIGxpa2UgQVJNIFNERUkuCgpbMV0g
aHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLXBycy9tZXNzYWdlLzUxNQoKU2lnbmVkLW9m
Zi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmggfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgK
aW5kZXggNmM4MjMxODA2NWNmLi4wMzJkZGUzNTBkNDAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaApAQCAt
MzUsNiArMzUsNyBAQCBlbnVtIHNiaV9leHRfaWQgewogCVNCSV9FWFRfREJDTiA9IDB4NDQ0MjQz
NEUsCiAJU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKIAlTQklfRVhUX05BQ0wgPSAweDRFNDE0MzRD
LAorCVNCSV9FWFRfU1NFID0gMHg1MzUzNDUsCiAKIAkvKiBFeHBlcmltZW50YWxzIGV4dGVuc2lv
bnMgbXVzdCBsaWUgd2l0aGluIHRoaXMgcmFuZ2UgKi8KIAlTQklfRVhUX0VYUEVSSU1FTlRBTF9T
VEFSVCA9IDB4MDgwMDAwMDAsCkBAIC00MDEsNiArNDAyLDYzIEBAIGVudW0gc2JpX2V4dF9uYWNs
X2ZlYXR1cmUgewogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1goX19pKQkJKChfX3Jpc2N2
X3hsZW4gLyA4KSAqIChfX2kpKQogI2RlZmluZSBTQklfTkFDTF9TSE1FTV9TUkVUX1hfTEFTVAkJ
MzEKIAorZW51bSBzYmlfZXh0X3NzZV9maWQgeworCVNCSV9TU0VfRVZFTlRfQVRUUl9SRUFEID0g
MCwKKwlTQklfU1NFX0VWRU5UX0FUVFJfV1JJVEUsCisJU0JJX1NTRV9FVkVOVF9SRUdJU1RFUiwK
KwlTQklfU1NFX0VWRU5UX1VOUkVHSVNURVIsCisJU0JJX1NTRV9FVkVOVF9FTkFCTEUsCisJU0JJ
X1NTRV9FVkVOVF9ESVNBQkxFLAorCVNCSV9TU0VfRVZFTlRfQ09NUExFVEUsCisJU0JJX1NTRV9F
VkVOVF9TSUdOQUwsCisJU0JJX1NTRV9FVkVOVF9IQVJUX1VOTUFTSywKKwlTQklfU1NFX0VWRU5U
X0hBUlRfTUFTSywKK307CisKK2VudW0gc2JpX3NzZV9zdGF0ZSB7CisJU0JJX1NTRV9TVEFURV9V
TlVTRUQgICAgID0gMCwKKwlTQklfU1NFX1NUQVRFX1JFR0lTVEVSRUQgPSAxLAorCVNCSV9TU0Vf
U1RBVEVfRU5BQkxFRCAgICA9IDIsCisJU0JJX1NTRV9TVEFURV9SVU5OSU5HICAgID0gMywKK307
CisKKy8qIFNCSSBTU0UgRXZlbnQgQXR0cmlidXRlcy4gKi8KK2VudW0gc2JpX3NzZV9hdHRyX2lk
IHsKKwlTQklfU1NFX0FUVFJfU1RBVFVTCQk9IDB4MDAwMDAwMDAsCisJU0JJX1NTRV9BVFRSX1BS
SU8JCT0gMHgwMDAwMDAwMSwKKwlTQklfU1NFX0FUVFJfQ09ORklHCQk9IDB4MDAwMDAwMDIsCisJ
U0JJX1NTRV9BVFRSX1BSRUZFUlJFRF9IQVJUCT0gMHgwMDAwMDAwMywKKwlTQklfU1NFX0FUVFJf
RU5UUllfUEMJCT0gMHgwMDAwMDAwNCwKKwlTQklfU1NFX0FUVFJfRU5UUllfQVJHCQk9IDB4MDAw
MDAwMDUsCisJU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX1NFUEMJPSAweDAwMDAwMDA2LAorCVNC
SV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHUwk9IDB4MDAwMDAwMDcsCisJU0JJX1NTRV9BVFRS
X0lOVEVSUlVQVEVEX0E2CT0gMHgwMDAwMDAwOCwKKwlTQklfU1NFX0FUVFJfSU5URVJSVVBURURf
QTcJPSAweDAwMDAwMDA5LAorCisJU0JJX1NTRV9BVFRSX01BWAkJPSAweDAwMDAwMDBBCit9Owor
CisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfU1RBVEVfT0ZGU0VUCTAKKyNkZWZpbmUgU0JJ
X1NTRV9BVFRSX1NUQVRVU19TVEFURV9NQVNLCQkweDMKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX1NU
QVRVU19QRU5ESU5HX09GRlNFVAkyCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9TVEFUVVNfSU5KRUNU
X09GRlNFVAkzCisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0NPTkZJR19PTkVTSE9UCSgxIDw8IDAp
CisKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX1NTVEFUVVNfU1BQCSgx
IDw8IDApCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19TU1RBVFVTX1NQ
SUUJKDEgPDwgMSkKKyNkZWZpbmUgU0JJX1NTRV9BVFRSX0lOVEVSUlVQVEVEX0ZMQUdTX0hTVEFU
VVNfU1BWCSgxIDw8IDIpCisjZGVmaW5lIFNCSV9TU0VfQVRUUl9JTlRFUlJVUFRFRF9GTEFHU19I
U1RBVFVTX1NQVlAJKDEgPDwgMykKKworI2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1JBUwkJ
MHgwMDAwMDAwMAorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTF9SQVMJMHgwMDAwODAwMAor
I2RlZmluZSBTQklfU1NFX0VWRU5UX0xPQ0FMX1BNVQkJMHgwMDAxMDAwMAorI2RlZmluZSBTQklf
U1NFX0VWRU5UX0xPQ0FMX1NPRlRXQVJFCTB4ZmZmZjAwMDAKKyNkZWZpbmUgU0JJX1NTRV9FVkVO
VF9HTE9CQUxfU09GVFdBUkUJMHhmZmZmODAwMAorCisjZGVmaW5lIFNCSV9TU0VfRVZFTlRfUExB
VEZPUk0JCSgxIDw8IDE0KQorI2RlZmluZSBTQklfU1NFX0VWRU5UX0dMT0JBTAkJKDEgPDwgMTUp
CisKIC8qIFNCSSBzcGVjIHZlcnNpb24gZmllbGRzICovCiAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJ
T05fREVGQVVMVAkweDEKICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9NQUpPUl9TSElGVAkyNApA
QCAtNDE4LDYgKzQ3Niw4IEBAIGVudW0gc2JpX2V4dF9uYWNsX2ZlYXR1cmUgewogI2RlZmluZSBT
QklfRVJSX0FMUkVBRFlfU1RBUlRFRCAtNwogI2RlZmluZSBTQklfRVJSX0FMUkVBRFlfU1RPUFBF
RCAtOAogI2RlZmluZSBTQklfRVJSX05PX1NITUVNCS05CisjZGVmaW5lIFNCSV9FUlJfSU5WQUxJ
RF9TVEFURQktMTAKKyNkZWZpbmUgU0JJX0VSUl9CQURfUkFOR0UJLTExCiAKIGV4dGVybiB1bnNp
Z25lZCBsb25nIHNiaV9zcGVjX3ZlcnNpb247CiBzdHJ1Y3Qgc2JpcmV0IHsKQEAgLTUwNCw2ICs1
NjQsOCBAQCBzdGF0aWMgaW5saW5lIGludCBzYmlfZXJyX21hcF9saW51eF9lcnJubyhpbnQgZXJy
KQogCWNhc2UgU0JJX0VSUl9ERU5JRUQ6CiAJCXJldHVybiAtRVBFUk07CiAJY2FzZSBTQklfRVJS
X0lOVkFMSURfUEFSQU06CisJY2FzZSBTQklfRVJSX0JBRF9SQU5HRToKKwljYXNlIFNCSV9FUlJf
SU5WQUxJRF9TVEFURToKIAkJcmV0dXJuIC1FSU5WQUw7CiAJY2FzZSBTQklfRVJSX0lOVkFMSURf
QUREUkVTUzoKIAkJcmV0dXJuIC1FRkFVTFQ7Ci0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
