Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B0DC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P2aVzyiMZix5/P3W+83uiGOFh1t/zZX9tggUW3NoBNo=; b=kL69rOb0vTf3CX
	Lu/TxrpD+qGyDrDWCaCNC4Li9vVy9iDfqOC6BjRYHmBUwR6HO7EsUZvhBgXIxlHaOCYp8nMxOPG2H
	oDwsqBkwtp8B73RKwJfYF6i7DDNeGXU6gTD5F2OsNEuJorMhlXAlUpm89p8g/O5UbVDcFCh2Ku8tY
	NZnM6yRajmp9+E2DU4Zp9x22SlguDDwIdyk+lagmGYz3ouRks4oPp86ezi28b8MDznLm8cMkpjRPC
	gJyHmGKwOqzUMlQbnr3YynKu8AF/9wCDyToQ3Ih7CMdgNpgTDgEI+X+w96Npix6szXAnrh2x/sRlf
	qUXJu1poIg0mBzXvhY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXhF-00000008DbF-2jLf;
	Thu, 01 Feb 2024 14:05:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXhB-00000008DZ2-35V0
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 14:05:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d8b2f392b3so739875ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 06:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706796336; x=1707401136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JiEpcBE0z8Q5t3JWdIgJHWEI2G0S1HPZ9ikeHZvifi4=;
        b=F+IeFLP3I+WacMX7Yl6FM07VUpooxKO+CWbvbkd5CpPAsX41BKKOEVND8CP3xc4yLG
         HZ0KUi20cOLSwsydc1WsYr5sbcPulge61t5nVV3W0cComPCHJFRc/G8lcd5pSohPS+QA
         I3v6A2PQDXDwbDbjD7nOD2rYBaCIWmnsjwmrIa9F0ua5uI0guCHyPb98lRf0N4Px4iu4
         WjuBEtRYZSJu0vTjAZqEP3PHAtGIy1UOh4vXjmjkBBDiRubEtPJLy+T4qPAnq3LUOt7i
         Pkg/ENGbIXzt/d213M6d1suZbtKPv2mx+Hjlhl69A2Qu1e/Ron7TMdj0LYueyfFE+IF1
         R16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706796336; x=1707401136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiEpcBE0z8Q5t3JWdIgJHWEI2G0S1HPZ9ikeHZvifi4=;
        b=kC33Xki2556oxR81FTw6S3fEFarblFJZFy+FHx281XFsJZaDZoGK/Ssa58Ct7xNBk3
         AwTdU8FQr63QFI0c/bJuzLBl+aLJV5AY678uh9ZnQffPD37EgqPfCmxUvzn2W8HsypnV
         lE8h+zCRqEnjRcR7fC/A7IXru6gEzo2+DH5V2LA4NShU/CTNyyby8V8Gj29zIhRIi4vg
         LrolpqZRl8zsn+lI0GrkX+nUq+PrWh7wJBLEl0fj4U7tX/83uW9QkbRnEpMGsXTWfFV7
         ISioG8hRSz6d/3v5Mtv2xjZ/AZIjTWAwKEvpHhWhlYvyfYH/zjo/LpKkU+gnbm0b2iJk
         /mpA==
X-Forwarded-Encrypted: i=0; AJvYcCWD862sZKGeufTdYqBtiY+sOoZipQfRBbsxQHpfpGgA9S0gj7GT68+AS4CAvU31V4Sg8AWYo4SUUzYgLM3V1TsPK8dlUZZgM9dC3IM+dOmZ
X-Gm-Message-State: AOJu0YyOqy6XcVxljaS/SSFtu7TN79NE8MI7cD9aCCHLPZCvnnoafy0c
	Da+4b/CfqMS4y2U1ukZqgOHjVChJR1fzr1VM4LLEoCq3Pa5ZUTBlHS9NVyrqH3Y=
X-Google-Smtp-Source: AGHT+IH8tWdldiYSjIIvCar+NyjyZ+8lWYi2wVCMLRjX2BxVq2M9ONUwvbyZ78JOaLsGgI8+DCI/jQ==
X-Received: by 2002:a17:902:ea08:b0:1d8:d1f5:e5d with SMTP id s8-20020a170902ea0800b001d8d1f50e5dmr2801264plg.0.1706796335668;
        Thu, 01 Feb 2024 06:05:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU25vJ3ilONQ5+/2C4Wo2EpHNVQs3nHC9z6Guhj5ymJAU6kxBvc3F//8Q+scr/hLvk8cIRUNkuurwXW45PCazS3ATmw/SnLm77EZOQ5TLzQaZxwVz9beY1BoTbofuwYSOjNSrYouvlGBRh5WS9oj0ANDmSCutNP3ZHt5m2gCwJHrnuFGlHgQ6bdn6QSPWEnbdFWb8Z4mFT50NQABIOvwob+iHVHb8iq7tM4FZPxfNIUz1GmPKdRDJ5JiWaqnVA+S6yu+q2wH3eQ2GPTLoh4+tFD4tCseVmgacj20XaeMvCa9g==
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:189:f9cd:e10f:7a3f])
        by smtp.gmail.com with ESMTPSA id kb16-20020a170903339000b001d8ec844fe7sm6914308plb.283.2024.02.01.06.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 06:05:35 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robin Ehn <rehn@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: export VA_BITS
Date: Thu,  1 Feb 2024 15:02:45 +0100
Message-ID: <20240201140319.360088-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_060537_903095_504DB56F 
X-CRM114-Status: GOOD (  15.01  )
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

U29tZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIChPcGVuSkRLIGZvciBpbnN0YW5jZSkgdXNlcyB0
aGUgZnJlZSBiaXRzCmluIHBvaW50ZXJzIHRvIGluc2VydCBhZGRpdGlvbmFsIGluZm9ybWF0aW9u
IGZvciB0aGVpciBvd24gbG9naWMuCkN1cnJlbnRseSB0aGV5IHJlbHkgb24gcGFyc2luZyAvcHJv
Yy9jcHVpbmZvIHRvIG9idGFpbiB0aGUgY3VycmVudCB2YWx1ZQpvZiB2aXJ0dWFsIGFkZHJlc3Mg
dXNlZCBiaXRzIFsxXS4gRXhwb3J0aW5nIFZBX0JJVFMgdGhyb3VnaCBod3Byb2JlIHdpbGwKYWxs
b3cgZm9yIGEgbW9yZSBzdGFibGUgaW50ZXJmYWNlIHRvIGJlIHVzZWQuCgpMaW5rOiBodHRwczov
L2dpdGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9tYXN0ZXIvc3JjL2hvdHNwb3Qvb3NfY3B1L2xp
bnV4X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlzY3YuY3BwI0wxNzEgWzFdClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KCi0tLQogRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2h3cHJvYmUuaCAgICAgIHwgMiArLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICB8IDMg
KysrCiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCBiMmJjYzllZWQ5YWEuLjZmMTk4YzZl
ZDRmMCAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cisr
KyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMjEwLDMgKzIxMCw2
IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKIAogKiA6YzptYWNybzpgUklTQ1Zf
SFdQUk9CRV9LRVlfWklDQk9aX0JMT0NLX1NJWkVgOiBBbiB1bnNpZ25lZCBpbnQgd2hpY2gKICAg
cmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96IGJsb2NrIGluIGJ5dGVzLgorCisqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9WQV9CSVRTYDogQW4gdW5zaWduZWQgbG9uZyB3aGlj
aAorICByZXByZXNlbnQgdGhlIG51bWJlciBvZiBiaXRzIHVzZWQgdG8gc3RvcmUgdmlydHVhbCBh
ZGRyZXNzZXMuCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCmluZGV4IDYzMDUwN2RmZjVlYS4uMTUw
YTk4NzdiMGFmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaApAQCAtOCw3ICs4LDcgQEAKIAog
I2luY2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUuaD4KIAotI2RlZmluZSBSSVNDVl9IV1BST0JFX01B
WF9LRVkgNgorI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgNwogCiBzdGF0aWMgaW5saW5l
IGJvb2wgcmlzY3ZfaHdwcm9iZV9rZXlfaXNfdmFsaWQoX19zNjQga2V5KQogewpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggOWYyYThlM2ZmMjA0Li4yYTUwMDZjZGRiN2Ig
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNjcsNiArNjcsNyBAQCBz
dHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
VU5TVVBQT1JURUQJKDQgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9N
QVNLCQkoNyA8PCAwKQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0la
RQk2CisjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1ZBX0JJVFMJCTcKIC8qIEluY3JlYXNlIFJJ
U0NWX0hXUFJPQkVfTUFYX0tFWSB3aGVuIGFkZGluZyBpdGVtcy4gKi8KIAogLyogRmxhZ3MgKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IGE3YzU2YjQxZWZkMi4uMzI4NDM1ODM2ZTM2IDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCisrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTIwMiw2ICsyMDIsOSBAQCBzdGF0aWMgdm9pZCBo
d3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlpZiAoaHdwcm9i
ZV9leHQwX2hhcyhjcHVzLCBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT1opKQogCQkJcGFpci0+dmFs
dWUgPSByaXNjdl9jYm96X2Jsb2NrX3NpemU7CiAJCWJyZWFrOworCWNhc2UgUklTQ1ZfSFdQUk9C
RV9LRVlfVkFfQklUUzoKKwkJcGFpci0+dmFsdWUgPSBWQV9CSVRTOworCQlicmVhazsKIAogCS8q
CiAJICogRm9yIGZvcndhcmQgY29tcGF0aWJpbGl0eSwgdW5rbm93biBrZXlzIGRvbid0IGZhaWwg
dGhlIHdob2xlCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
