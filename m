Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7ABC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 13:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kzfXo0Qblju/Kjen41sB3EeFTVstBYsSakFvNVOCKQQ=; b=dtr6JWxrICyJLb
	s0/KFwXn8jQ6El4abSJWQsKgJQOKMww3HDHEV34BvZP+OHpECszaJXMOujIo/WiMU9B4tjD/WveOJ
	xD+6w3I5iW0fNl+rVVWvuWOTW1Ca3+Cf+9oMkzL/DS+h0paa46hPol09bAqWlfur2r8QlR+0NsAGw
	6Arb7epznsB1+IcAQwM8O7wQQceOrGeFM82HiQpm5J23+QDbwbmrtktdMNlOHLTO+ItyGGOrT7FVt
	NzVEvFFXzgb9RNOHfGi/+fmi3DF4n3CuK3dqijxUkxaCZhPUEm4DgBZDHCEaiCdLRJcNhx80lvHIh
	Tg7o/uIk8hJjwZg+nWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsD5-00APlo-0x;
	Wed, 06 Dec 2023 13:45:07 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAsD1-00APkC-2W
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 13:45:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c1e8458b9so909795e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 05:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701870299; x=1702475099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eyzTJBorqo0srDT9PjO1S/0u5d8jIirct/7xXW8mDxs=;
        b=HOm9xoNAFnl3sRX8BtD8vOVbWKKfwSzK2ME20IJRK102ZugkJ2Xv28DF/GIYP81YCd
         vvvyrXkuGJb1TNkikcU9ZGfg+pAhxncUm/kmSlUKhhJRW0ukyA9Ifp5qPYbG5ftnh5/6
         fG91fj+nrr3wG84VqnuBhNZs/6Eme5yHMXaBDgjxvFTZcDHVdNLnze1GIiJ1DEy/U8Kq
         gnxYrHk6CqLVRIcmCB7j42m1nxYKmkWvXQQZUsYPO3PNdN/S84FAKtLXnXRJASjxw7T3
         E+NPcrAZWcoFfBJwvR8KWShcWxaadfV8PgkMLlHatpROO9jPMleP4EvCTjxGVZjvDiA9
         d4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870299; x=1702475099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eyzTJBorqo0srDT9PjO1S/0u5d8jIirct/7xXW8mDxs=;
        b=XRWLK5i030N5jvj3pR2RjBjepkcX2jxdwCWxw33KODi9yaoic9z68hBBrnmBz4hj9L
         XrsNbRPmht1/oZoK6pJ+WTn8nvYfd92cCxlYB8e2zD8N17OOFL94//leaahE/4h8jzVK
         qzcLRTbkBR2FIX+cyRxl354X8w0SJ39oV1GSIP+q8pWofbYf3XTVhCNNGXVqDtOpQx8W
         ihfqev69bJ09iK0i87BJ7tRcJsq3ULI39tBmE4q9qk6ZOMJoqq5bGMtUIx3XOeDXz4ok
         2J5K4iTQiejvu22gMWuD7RrspREFiYJz+S3PUsnWUiAAvC99Lb98VQT/QS4+p+N7PUb2
         g+8A==
X-Gm-Message-State: AOJu0YzMx3zq++A6SjX0iO0EZaTS8VWoTFudbmqOYfAvke5cquyDDCzL
	9uPgSrNeHy5BHCs2JyTIVKkkdw==
X-Google-Smtp-Source: AGHT+IF1KsY78QMc/kA7AJTCm+aEKTPTbbi49+F+g/SfZbZDdgaSvKaIMpIVWDt3w2IDJ8fli+6xJA==
X-Received: by 2002:a05:600c:1387:b0:40c:b81:c640 with SMTP id u7-20020a05600c138700b0040c0b81c640mr1410826wmf.0.1701870299133;
        Wed, 06 Dec 2023 05:44:59 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:68da:101e:d3e4:630b])
        by smtp.gmail.com with ESMTPSA id hg10-20020a05600c538a00b0040b398f0585sm22258222wmb.9.2023.12.06.05.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:44:58 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2] selftests: sud_test: return correct emulated syscall value on RISC-V
Date: Wed,  6 Dec 2023 14:44:37 +0100
Message-ID: <20231206134438.473166-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_054504_021017_FE0E7D02 
X-CRM114-Status: GOOD (  12.55  )
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

Q3VycmVudGx5LCB0aGUgc3VkX3Rlc3QgZXhwZWN0cyB0aGUgZW11bGF0ZWQgc3lzY2FsbCB0byBy
ZXR1cm4gdGhlCmVtdWxhdGVkIHN5c2NhbGwgbnVtYmVyLiBUaGlzIGFzc3VtcHRpb24gb25seSB3
b3JrcyBvbiBhcmNoaXRlY3R1cmVzCndlcmUgdGhlIHN5c2NhbGwgY2FsbGluZyBjb252ZW50aW9u
IHVzZSB0aGUgc2FtZSByZWdpc3RlciBmb3Igc3lzY2FsbApudW1iZXIvc3lzY2FsbCByZXR1cm4g
dmFsdWUuIFRoaXMgaXMgbm90IHRoZSBjYXNlIGZvciBSSVNDLVYgYW5kIHRodXMKdGhlIHJldHVy
biB2YWx1ZSBtdXN0IGJlIGFsc28gZW11bGF0ZWQgdXNpbmcgdGhlIHByb3ZpZGVkIHVjb250ZXh0
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CkFja2VkLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KCi0tLQoKQ2hhbmdlcyBpbiBW
MjoKIC0gQ2hhbmdlcyBjb21tZW50IHRvIGJlIG1vcmUgZXhwbGljaXQKIC0gVXNlIEE3IHN5c2Nh
bGwgYXJnIHJhdGhlciB0aGFuIGhhcmRjb2RpbmcgTUFHSUNfU1lTQ0FMTF8xCgotLS0KIC4uLi9z
ZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMgICAgIHwgMTQgKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3Qu
YwppbmRleCBiNWQ1OTJkNDA5OWUuLmQ5NzVhNjc2NzMyOSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKQEAg
LTE1OCw2ICsxNTgsMjAgQEAgc3RhdGljIHZvaWQgaGFuZGxlX3NpZ3N5cyhpbnQgc2lnLCBzaWdp
bmZvX3QgKmluZm8sIHZvaWQgKnVjb250ZXh0KQogCiAJLyogSW4gcHJlcGFyYXRpb24gZm9yIHNp
Z3JldHVybi4gKi8KIAlTWVNDQUxMX0RJU1BBVENIX09GRihnbG9iX3NlbCk7CisKKwkvKgorCSAq
IFRoZSB0ZXN0cyBmb3IgYXJndW1lbnQgaGFuZGxpbmcgYXNzdW1lIHRoYXQgYHN5c2NhbGwoeCkg
PT0geGAuIFRoaXMKKwkgKiBpcyBhIE5PUCBvbiB4ODYgYmVjYXVzZSB0aGUgc3lzY2FsbCBudW1i
ZXIgaXMgcGFzc2VkIGluICVyYXgsIHdoaWNoCisJICogaGFwcGVucyB0byBhbHNvIGJlIHRoZSBm
dW5jdGlvbiBBQkkgcmV0dXJuIHJlZ2lzdGVyLiAgT3RoZXIKKwkgKiBhcmNoaXRlY3R1cmVzIG1h
eSBuZWVkIHRvIHN3aXp6bGUgdGhlIGFyZ3VtZW50cyBhcm91bmQuCisJICovCisjaWYgZGVmaW5l
ZChfX3Jpc2N2KQorLyogUkVHX0E3IGlzIG5vdCBkZWZpbmVkIGluIGxpYmMgaGVhZGVycyAqLwor
IyBkZWZpbmUgUkVHX0E3IChSRUdfQTAgKyA3KQorCisJKCh1Y29udGV4dF90ICopdWNvbnRleHQp
LT51Y19tY29udGV4dC5fX2dyZWdzW1JFR19BMF0gPQorCQkJKCh1Y29udGV4dF90ICopdWNvbnRl
eHQpLT51Y19tY29udGV4dC5fX2dyZWdzW1JFR19BN107CisjZW5kaWYKIH0KIAogVEVTVChkaXNw
YXRjaF9hbmRfcmV0dXJuKQotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
