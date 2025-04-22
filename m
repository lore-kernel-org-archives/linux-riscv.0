Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF440C369D7
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXmp8JDH2Z8OQype+Ws0mSsxJR86cMXKMy31HIJ5HQA=; b=zTMDOFyhHGa0L1
	3GXsA/354Unurate+Ld8taO5LeSLl9uIjyBz/o9KIkSodZ3eC+RY63LGgUrHkZBGZYcEo9tXlwLbr
	TvIlrtcp80mrAtRD8rOn06GQpebaGnhcgxpmpA+C99aLI8bItvNgReQfdkkmUn4YCcWsURl1si1JJ
	SemrR3BKrtsvs29bOauCp54iekdFURnSVvdHcvZI2MPK/53BWY9b5Os2HH8BX7FNxkrIKUuDiUFP8
	Cove5i8bk5jlA/Q7kcn/wwYBY6sN1cejBVXKOLFMAAFHG/VC/a59+dqbPiTdCwkokO5/3eX+ie1dt
	UsHB5gXLVsLz+u1FC3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Jac-00000008LjA-2d0F;
	Tue, 22 Apr 2025 19:47:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GPv-00000007tXx-1Jf8
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:24:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-739525d4e12so4490207b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745339055; x=1745943855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1WNhT7IxU5Eh/j55bJL3pNAqccf1l3Drk5qswQXMsw=;
        b=ZM+KBkpV0v7owvuUYXp4x21BQXmH5jeKHsklMbS2Jh/jZcf3E7lQrMiT5grOhaYKRI
         nx0v8IhvasHVgeOAGstCHVrbEyYVlDvWQSi3WH2OmFdHAtG9n0qIUs0Tv65rFjsSak9c
         HUTEZCNVzj77MsaCaLqkGVZI+Q5m7BWfZTjNy2XE7SfextPTib3+xQB2IBH7i6SsRJMK
         d8IRJM5vVRN64ym7pWeAMNLWbY+29k5QlpeQn5dFuojUu+S/ozZIMU4UClrg2vDv4GUb
         AiaXT5MRImnRBRp9DSLRDZ/A3Ljgrh6rWVrqOYJLV90UA9st9aDD0IiGiOeRdHOYrOjy
         R4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745339055; x=1745943855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1WNhT7IxU5Eh/j55bJL3pNAqccf1l3Drk5qswQXMsw=;
        b=daV4XV0foshSzkgL8+3QIROEDuCIkw/1wJ5KhMi1l73Vb3we1yJI55hLVaTcPJmJIO
         GhPBABhAUBWXAseOEnwAAUthwvRfzPK0uVK6uh5+a+nGQr0CJVtl20Y/7p63sLu4opVY
         0QmJ8vqX35ZrpD3NOVDnv8PgfPeT6neS5hrYq4j+90F/vNZqFlvPe8zG092HICTmGAFw
         EmEwVHHh7Df7L8omYkX6ry0DHFeOFMnQGWJO79+GKDYm9l/JToF8ZGUGf9ltQ+4UmczG
         +QXHWJLQLz0mNLu7u/+h2GPjl6kDH9//AJleEP/ZcOOj3MGzpeyYSrmzpCkEr6eZcqMo
         fS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX29Q4nJ+pGRVcAwKITaRCf6d7JwAizcP8oG6ljd7pDFJ177tabuN6bH7c4vcENkxQ6TJyuZOtGeWnnZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/aPfAwklHnjo25vkMTfByBgGmhoDBmEP5w2/R+I8Rka/QrDBE
	CNrOEdZaV80DJ7b2t12VKfbUdpmk9FMldxTImqUzI6+W6Yd8YO22eSlYbxPK36w=
X-Gm-Gg: ASbGncscycHYoYDqqJM0D95y3eyByG4sl8F2+4Qdmjzd3NDm95PakkdybSiIgj2iUW5
	iRJer6trDYMKNZPeBX692L4fyUTTduTd8KlKZiYbaos2m8ySafmr87zFuwa+Epl7qUtvf2box6x
	TgaIGOYUfEoBpBK9A+jt4UMU8rNazq+LvrDWNZBMqC1pDGaeds6yWyy1uKNSrBUaba9iZUuroOc
	kAHn2v3FUMl8BZ7WH0oWANtv10oL3Hu7bHukR12B9I/L9kjQZ34ct7YktV4cd7m1L2/y6+vQGkb
	U4cDQZ7WentZMZWttoCDdrEJAW/hOkWpu3JP41r57ZpoOqTJXyvt
X-Google-Smtp-Source: AGHT+IH4yOfP0IqJKdZ6mYEYPFLQ595Vgf0k+QWsP9/Syy4+PU0hfb7Rc2GCNPIAlZUfc78JP644pQ==
X-Received: by 2002:a05:6a00:3911:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-73dc145740amr23785110b3a.3.1745339054816;
        Tue, 22 Apr 2025 09:24:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e13e1sm8850825b3a.46.2025.04.22.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 09:24:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/5] riscv: misaligned: use get_user() instead of __get_user()
Date: Tue, 22 Apr 2025 18:23:10 +0200
Message-ID: <20250422162324.956065-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162324.956065-1-cleger@rivosinc.com>
References: <20250422162324.956065-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092415_348411_98F3BC87 
X-CRM114-Status: GOOD (  11.85  )
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

Tm93IHRoYXQgd2UgY2FuIHNhZmVseSBoYW5kbGUgdXNlciBtZW1vcnkgYWNjZXNzZXMgd2hpbGUg
aW4gdGhlCm1pc2FsaWduZWQgYWNjZXNzIGhhbmRsZXJzLCB1c2UgZ2V0X3VzZXIoKSBpbnN0ZWFk
IG9mIF9fZ2V0X3VzZXIoKSB0bwpoYXZlIHVzZXIgbWVtb3J5IGFjY2VzcyBjaGVja3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jCmluZGV4IDQzNTRjODdjMDM3Ni4uOTdjNjc0ZDdkMzRmIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHNfbWlzYWxpZ25lZC5jCkBAIC0yNjgsNyArMjY4LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
Z2V0X2YzMl9ycyh1bnNpZ25lZCBsb25nIGluc24sIHU4IGZwX3JlZ19vZmZzZXQsCiAJaW50IF9f
cmV0OwkJCQkJXAogCQkJCQkJCVwKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CQkJCVwKLQkJX19y
ZXQgPSBfX2dldF91c2VyKGluc24sICh0eXBlIF9fdXNlciAqKSBpbnNuX2FkZHIpOyBcCisJCV9f
cmV0ID0gZ2V0X3VzZXIoaW5zbiwgKHR5cGUgX191c2VyICopIGluc25fYWRkcik7IFwKIAl9IGVs
c2UgewkJCQkJXAogCQlpbnNuID0gKih0eXBlICopaW5zbl9hZGRyOwkJXAogCQlfX3JldCA9IDA7
CQkJCVwKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
