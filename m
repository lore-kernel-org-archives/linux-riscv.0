Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5300FEEEC0E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 05:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zy57Rbmn+PrnTjJZzquVTC46aqI3dT7lRSHmmg6fzUA=; b=3zvr85W37dRzx9
	5EFGQEUAPt4p3HxKurQLEP3kQHpjYFFGm8B9qXpp58Ff9evkhM/+mGh8coMUpBNt2XmhrX+VApson
	R0QRiHgnYvlszisnMh+/nknLX2Mz0QXBW0FiRNIdW2Srtr/v7zvtuCKbsFFFRE4gwbVI/HJ7fJMqL
	gAHIUJWyIToPWRchu7nArGCOo8lkqGNdCY9rlS552ws+ILYBDgBdmhXjPJeObKsQ0zllXGGBiqzfM
	W5Czng48q3CEx6IWJCGs6VttyBldfzY6z3TpSDyfYHwwLpOxkTZcBUj6UHn6KpoTZ0Ish12UD7icp
	wx/TZXJpPLrrA74chpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soydB-0000000EwnA-3Vfw;
	Fri, 13 Sep 2024 05:14:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soyd8-0000000Ewmn-3zsv
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 05:14:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so13416355e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 22:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726204441; x=1726809241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97sC7FgCTGAzcHzCh0fwAJYsBr0u+Us2Q3UWUqb1Z7A=;
        b=Y0w0oPZGsQOhANRZeWp6xCXG+O5Btrl4izjlMw33xKwgNd8q7cxorwQVTXR2soNmxw
         cliyPrzPp+5s3TwYMP0bk51Z9kOZ1yVtlTUujxNi+Cam79322JDn/1GYTdI1e4yelwv8
         yZFHtKfiL//ZU99FLcWWnaqlLvuZrUyPz6B7BLJkzWWj3FjUrposblCimlOSNvJ7gxXf
         ZX64wV60+Rg4HNqbnjqBpyE4H4pe2ziPZlcRukAzqC47U+p1ixJGFgPSpbVR7yBSg+wc
         hw7ENu1wXIM1QgpySaPwwVvFdPKdCRkWU20RtMTuO7a5g8v+gXT/Bgw9a0Ppni9Ds5nP
         sNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726204441; x=1726809241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97sC7FgCTGAzcHzCh0fwAJYsBr0u+Us2Q3UWUqb1Z7A=;
        b=Rfo5d+6VYlCKPy1DARADGXx5bMyQHLQ315stlP0PIxCW/8Z8qblV0qGtnV1YPSCDJe
         J+rVqyLgBrpzTOwayicwxu79yRVjDUUPK/9NK+cBjtTrMedlGZPUHVLMjDUSrSm1jCUc
         cEAa99qTzyLsvv6VKuaFq9/r+ZN7T1vQWYuTASiwVPdgPM7k+zpRXa23iijw2KmlXlDk
         i/wU2qXAVqxoejNo4DncarGrOx4LOb+ahRLonmul5RLYhVk5M5bLYLGH5UY34wOhMVPT
         MGro2AtxmzIytrU/wDbS0h4Oy1JCAnzBCibHQA8dSJDXUnwMSU6ICvhxwUEfoeRmNRqq
         FQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFHTqpTVNFC2efF+vNvPqZJlGjUS+0WsWvyz7ExWJel+I6+sCOQVQLbtYUOr2Lz84++jGXPTCJBh/K8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAiGfGmBUuQdiaRPPzsObcDFWL5fJF+dCBAdFu5OG+WykXNwtX
	8UEV53PRG0PmS+cC3ZXUz9xsRlJWTLDGH5tUY0pM5C13z73hc8tX
X-Google-Smtp-Source: AGHT+IGPTeZzgwWJYrCDC9+6ULWhqzz+N66BwcmM+1R3Eh86zl3oXyQ3q54ErbKwTAYcAwPG5dUmYQ==
X-Received: by 2002:a05:600c:46c5:b0:42c:b843:792b with SMTP id 5b1f17b1804b1-42cdb531b96mr40618205e9.2.1726204440453;
        Thu, 12 Sep 2024 22:14:00 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b15c2f4sm11063685e9.24.2024.09.12.22.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 22:13:59 -0700 (PDT)
From: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND PATCH v2] riscv: hwprobe: export Zicntr and Zihpm extensions
Date: Fri, 13 Sep 2024 07:13:24 +0200
Message-ID: <20240913051324.8176-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_221403_016682_157BB610 
X-CRM114-Status: GOOD (  10.50  )
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

RXhwb3J0IFppY250ciBhbmQgWmlocG0gSVNBIGV4dGVuc2lvbnMgdGhyb3VnaCB0aGUgaHdwcm9i
ZSBzeXNjYWxsLgoKU2lnbmVkLW9mZi1ieTogTWlxdWVsIFNhYmF0w6kgU29sw6AgPG1pa2lzYWJh
dGVAZ21haWwuY29tPgpBY2tlZC1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJpdm9zaW5jLmNvbT4K
UmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0t
LQpUaGlzIGlzIGEgcmVzZW5kIGJlY2F1c2UgSSBzZW50IHYyIGFzIGEgcmVwbHkgdG8gdGhlIG9y
aWdpbmFsIHRocmVhZCBhbmQKaXQgbW9zdCBwcm9iYWJseSB3YXMgbG9zdCBieSBtb3N0IHBlb3Bs
ZS4gRm9ydHVuYXRlbHkgQ29ub3IgcGlja2VkIGl0IHVwCmFuZCBnYXZlIGl0IGEgcmV2aWV3LgoK
SSBhbSByZXNlbmRpbmcgdGhpcyBzbyBpdCBjYW4gYmUgcHJvcGVybHkgYXBwbGllZC4gVGhhbmsg
eW91IGZvciB5b3VyIHRpbWUgYW5kCnNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4KCkNoYW5n
ZXMgc2luY2UgdjEgWzFdOiB0aGUgRVhUX0tFWSBpbnN0cnVjdGlvbnMgaGF2ZSBiZWVuIHdyaXR0
ZW4gaW4gb3JkZXIuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
NDA4MTcwNzU2MjkuMjYyMzE4LTEtbWlraXNhYmF0ZUBnbWFpbC5jb20vCgogRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDYgKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oIHwgMiArKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
YyAgICAgICB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCAzZGI2MGEwOTExZGYuLmNmZDI5MjlkMDU2
MiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CisrKyBi
L0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTgzLDYgKzE4Myw5IEBA
IFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBkZWZpbmVkIGluIHRoZSBB
dG9taWMgQ29tcGFyZS1hbmQtU3dhcCAoQ0FTKSBpbnN0cnVjdGlvbnMgbWFudWFsIHN0YXJ0aW5n
CiAgICAgICAgZnJvbSBjb21taXQgNTA1OWUwY2E2NDFjICgidXBkYXRlIHRvIHJhdGlmaWVkIiku
CgorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSUNOVFJgOiBUaGUgWmljbnRyIGV4
dGVuc2lvbiB2ZXJzaW9uIDIuMAorICAgICAgIGlzIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRo
ZSBSSVNDLVYgSVNBIG1hbnVhbC4KKwogICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9a
SUNPTkRgOiBUaGUgWmljb25kIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKICAgICAgICBkZWZp
bmVkIGluIHRoZSBSSVNDLVYgSW50ZWdlciBDb25kaXRpb25hbCAoWmljb25kKSBvcGVyYXRpb25z
IGV4dGVuc2lvbgogICAgICAgIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1pdCA5NWNmMWY5ICgi
QWRkIGNoYW5nZXMgcmVxdWVzdGVkIGJ5IFZlZApAQCAtMTkyLDYgKzE5NSw5IEBAIFRoZSBmb2xs
b3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0
aGUgUklTQy1WIElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQKICAgICAgICBkOGFiNWM3
OGMyMDcgKCJaaWhpbnRwYXVzZSBpcyByYXRpZmllZCIpLgoKKyAgKiA6YzptYWNybzpgUklTQ1Zf
SFdQUk9CRV9FWFRfWklIUE1gOiBUaGUgWmlocG0gZXh0ZW5zaW9uIHZlcnNpb24gMi4wCisgICAg
ICAgaXMgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsLgorCiAg
ICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pWRTMyWGA6IFRoZSBWZWN0b3Igc3ViLWV4
dGVuc2lvbiBadmUzMnggaXMKICAgICBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lvbiAx
LjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCBiNzA2YzhlNDdiMDIuLjA5OGE4MTViM2ZkNCAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBAIC03Miw2ICs3Miw4IEBAIHN0cnVj
dCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pDRgkJKDFVTEwg
PDwgNDYpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQ01PUAkJKDFVTEwgPDwgNDcpCiAj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aQVdSUwkJKDFVTEwgPDwgNDgpCisjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSUNOVFIJKDFVTEwgPDwgNDkpCisjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aSUhQTQkJKDFVTEwgPDwgNTApCiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0NQ
VVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5LTk9XTgkoMCA8
PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVECSgxIDw8IDAp
CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCA4ZDFiNWMzNWQyYTcuLjkxMGI0MWI2YTdhYiAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0xMDcsOSArMTA3LDExIEBAIHN0YXRpYyB2b2lk
IGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVko
WkNCKTsKIAkJRVhUX0tFWShaQ01PUCk7CiAJCUVYVF9LRVkoWklDQk9aKTsKKwkJRVhUX0tFWSha
SUNOVFIpOwogCQlFWFRfS0VZKFpJQ09ORCk7CiAJCUVYVF9LRVkoWklISU5UTlRMKTsKIAkJRVhU
X0tFWShaSUhJTlRQQVVTRSk7CisJCUVYVF9LRVkoWklIUE0pOwogCQlFWFRfS0VZKFpJTU9QKTsK
IAkJRVhUX0tFWShaS05EKTsKIAkJRVhUX0tFWShaS05FKTsKLS0KMi40Ni4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
