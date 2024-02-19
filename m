Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BE3C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 15:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=97NPFkVhwj144iubfBjJf3+tCnK3oF/wfmFR5X24CXI=; b=uAy17I/FlBTznc
	ZYPco1Y1A0Sn0RgKFcxajMTRMD96jYzJDtcM10t+aFXUmKUT29wP0apr2qmCHBtKVez2lWS3ecEPG
	vYdahNRw4ZardzWT/GRgi/VBxU1EozBVEdKZQr1XeexxAR03TtIEKOpbth3zTdwxLNEn18Dn2TWG/
	6zoKdvFJ9OTF+j+E+FN1Xm5SlkFGcnQ0nn8xRgG658SuntE4V9xDGTWmBojkrwXcYpoq96/cS6ZW3
	QcifdgXCDOtznQKRUgLfC8+vdp6PsP9HR++1QbWad22SbmDzIVbyFrYo2y1SPgNF6j+EkBj+i3fGM
	McFvsGmNjBqubh8H7wZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc5tS-0000000BCRP-0ZFc;
	Mon, 19 Feb 2024 15:49:22 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc5tP-0000000BCQc-39Xx
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 15:49:21 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e45c698090so146738b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 07:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708357758; x=1708962558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDVX+aQQf3UCj4psWuuhlbCqwqS7vSYaBRqyqThSZrc=;
        b=WrXllruvp5xgDQ70Xdoa0otRHnnsidG344tHrOJUZGkPRIld5tfXcqjxxDKhiFDTDe
         WsbqqE2rcNFjcoDIeHMPNcmXMzR3v4aFjJc4wQE5c0vrQXJaTictsqTbrnpkCMw5Z4VX
         iZHRWikz2gt3icu3+2g4ChVA4bB+WqMRy6cJRfS/pFvrcQy5WaQGdj2wKSHdDU46h6gI
         qU/jnbJuIBKqXlqjW7fgtcOb9z7uh9VdB2ST3Q1qko9IwApfCe6WTrBmv/oXb0t7q1Ik
         KfzrjITIDntpI0VidNBHZJrpMMq65UMX6k+iCsSXlBGw8Hqu9GS9pnFXzbZ1vrEAQ09Z
         dhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708357758; x=1708962558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDVX+aQQf3UCj4psWuuhlbCqwqS7vSYaBRqyqThSZrc=;
        b=mNCuDmnl0YSzktXcawDx2qoc/2kshefGVqq8uTU9gdmPSS/xbDQwfRdzZ66MwJ6xlP
         hfDSg5KAE8fc17n+Zy0YjVpEzpKOSGHeNe3A+GlSffv8YxV0pk3EPGWxiYWDuDWp6Xdq
         LwoAbE6Yu1grn+5kjG4FZWtuOzYOGKAp/RD7pj/1PJFrJiyqa6D8GGe4CSMXwPXtRLZR
         EutMYZV53hVUveH4O1QF3XeC625awM5bWRXpJDogEY+H9MaSIo77sU41u5n1WzhDhVQQ
         aTL5ofjYw08oJFUoxT4HON1opp29ZXaTKAqdq5FZY3a4SIfnlK7dMd7N7bp52HAier4U
         K17g==
X-Forwarded-Encrypted: i=1; AJvYcCVB8QsVqSc9uQQn/F1orgcBHZo416/dyGdHdezOHaP4GTKf6tZTP7ztBvhcaGFVMIvAk+oWNF1v8kSJ9aQjBsYn/rGroEr5R82FqkbpdT0X
X-Gm-Message-State: AOJu0YyyeAZUgv5il8XEF+IvqohfHFiUaRYhP/MhYCiQx/gDYDfkFG3t
	O/tgR8OMYXJSRa2/BczTeYoEI+owKfdy0GdwBQmlU/pKAZye4h8lqDCSi4MWb2w=
X-Google-Smtp-Source: AGHT+IEcyZCHhd6HIFFkqbFH2GwEOuyTsp9nTeseU6jdpsxfQQbNhEYUiWvejav6rxmgpRl71P7gWA==
X-Received: by 2002:a05:6a21:789d:b0:1a0:a6bb:d0d0 with SMTP id bf29-20020a056a21789d00b001a0a6bbd0d0mr3708851pzc.1.1708357758289;
        Mon, 19 Feb 2024 07:49:18 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:8501:8c81:d5c:f8d2])
        by smtp.gmail.com with ESMTPSA id lo10-20020a056a003d0a00b006e0f4a183c8sm4990773pfb.104.2024.02.19.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 07:49:17 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: export Zihintpause ISA extension
Date: Mon, 19 Feb 2024 16:49:04 +0100
Message-ID: <20240219154905.528301-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_074920_054614_BC597D7C 
X-CRM114-Status: GOOD (  10.10  )
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

RXhwb3J0IHRoZSBaaWhpbnRwYXVzZSBJU0EgZXh0ZW5zaW9uIHRocm91Z2ggaHdwcm9iZSB3aGlj
aCBhbGxvd3MgdXNpbmcKInBhdXNlIiBpbnN0cnVjdGlvbnMuIFNvbWUgdXNlcnNwYWNlIGFwcGxp
Y2F0aW9ucyAoT3BlbkpESyBmb3IKaW5zdGFuY2UpIHVzZXMgdGhpcyB0byBoYW5kbGUgc29tZSBs
b2NraW5nIGJhY2stb2ZmLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPgoKLS0tCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3Qg
IHwgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBh
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNj
di9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRl
eCBiMmJjYzllZWQ5YWEuLjAwMTJjODQzMzYxMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdApAQCAtMTg4LDYgKzE4OCwxMCBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmlu
ZWQ6CiAgICAgICAgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hh
bmdlcyByZXF1ZXN0ZWQgYnkgVmVkCiAgICAgICAgZHVyaW5nIHNpZ25vZmYiKQogCisgICogOmM6
bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJSElOVFBBVVNFYDogVGhlIFppaGludHBhdXNlIGV4
dGVuc2lvbiBpcworICAgICAgIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNB
IG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCBjb21taXQKKyAgICAgICBkOGFiNWM3OGMyMDcg
KCJaaWhpbnRwYXVzZSBpcyByYXRpZmllZCIpLgorCiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JF
X0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQogICBp
bmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCiAKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDlmMmE4ZTNmZjIwNC4uMzFjNTcwY2Jk
MWM1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCisr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTU5LDYgKzU5LDcg
QEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlRT
TwkJKDFVTEwgPDwgMzMpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQUNBUwkJKDFVTEwg
PDwgMzQpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUNPTkQJKDFVTEwgPDwgMzUpCisj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aSUhJTlRQQVVTRQkoMVVMTCA8PCAzNikKICNkZWZp
bmUgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FM
SUdORURfRU1VTEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IGE3YzU2
YjQxZWZkMi4uMTAwOGQyNTg4MGUxIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
aHdwcm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTExMSw2
ICsxMTEsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3By
b2JlICpwYWlyLAogCQlFWFRfS0VZKFpUU08pOwogCQlFWFRfS0VZKFpBQ0FTKTsKIAkJRVhUX0tF
WShaSUNPTkQpOworCQlFWFRfS0VZKFpJSElOVFBBVVNFKTsKIAogCQlpZiAoaGFzX3ZlY3Rvcigp
KSB7CiAJCQlFWFRfS0VZKFpWQkIpOwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
