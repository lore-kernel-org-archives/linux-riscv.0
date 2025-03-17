Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B96C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBRYyx2hxiBAVdbYxhvgx/gQjVYtt9bIXdebpS/7wOY=; b=NIcVcMgr8/OKA2
	1l5QLDO9i9AWFlbiN7jfG7MM/Y/yr8ChUvRU8/Tt67RRb/fIrqo6Nw7u5xqYcM/uiE7eIderyi2Ni
	YUxDx+gyUjmiX3RoJaQCntN6eTNwn7eAO8LTH4w7UyAyauZwofvOxcf16C3DRgNsSlavav6sAwkCA
	oEpS8rP+Nmtkb0cshKtWwbEiRarVVo6x2qtPiqKjI7ZSaFDFpKZ9jQYXVc2JJNJ9fRTslCA0+AWy0
	ugUK1czdVLHxAUWOkrloD6YKWxFJkTH+0ZT5Mv33l8UEZcrOCJviYE3mHdrQ2fvunApofkJsUMEV6
	yMH6FJxrnRO/GzaOiCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1c-00000003VHb-1Dpr;
	Mon, 17 Mar 2025 17:13:16 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDws-00000003TXI-03JN
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:23 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so16000495e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231300; x=1742836100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8U+T9Diad+CXpLV3u2uHxRVp5OvAkVUCVXAkQQVM7Y=;
        b=XW0E9zCqWLwSsvJdcNhdH2CPJoiOnYBSpPcCNwqDz986FvKht4dCyCwTco2UJdBpY3
         XtSfNBSZ/B7LLQN9LvoIKdXwK0dJDXPeBRhAlowqZ5d+F65+SCDyfuBh3bgLM0lASwqV
         7x4qDro4P9YE5vFXmHwbRWTE5vcmt2RUFDaUCcP11YkqYrSrowWnQAY5WjnXRW9EzaOK
         PtVG7CR5BLIOl/4QlDS2yJLbxtDp4f9As2fRV1c57XeangHkZ5HMzmgWbja5+1XvAary
         OfvtnRPHrzaLh6FKj7mYaBDI8E54jgaHOUvaIIEojUdnGBG0zsHmvee42qLFn5Cnp1a5
         1upQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231300; x=1742836100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8U+T9Diad+CXpLV3u2uHxRVp5OvAkVUCVXAkQQVM7Y=;
        b=ac2rGKs584x4jwgH9T9hDS9ghUykiUhyNWifyWff3Z4A5Ty+95t/GzNcjNm2PJhMsP
         0TaU4ywPt0TpVAfR23GmBQUIbHWiGHZtMSaNw80097xMrK1dwIPmHO+rHRdhEnDqSHyc
         t/lx1zKjyFc2SSZ9Pk4bgttnItmqXK285XiYQ1GCY11FnVQ0H99NC3JlpYNKsiEL+YWc
         dRMn+zObhm0EZ4M+8H0N0SWxtzNohjH4L1KrQyMotlDkAnXQ2HmKGOAjNO8T2hevQ7ty
         mDqYHouEbeY8v5SQC57Cn1Iunj+zRho//seOofxMn2DuSIWBqMNnuNM9OMAsgdZdJSQr
         N6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZSQrle9iIvxeG19c3h1NBTzOsbn2ZF6ne+TeFzoRFghXtsrFNxg26goPUFq4m1WXO9aZTL/R1zBAqYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwShLn+e8RCyvGpyn04vDtFjbWdu1xNn+uEdLdyDNS0dY9yAwlW
	VSAJIU9WlkFX99IAwcvYyodoWzp+YYPK6fkzAzO91EY7S6Lj4Sh6uJI53dxGYPY=
X-Gm-Gg: ASbGncuauv9a0k+QQvT/eWrdKXdTx5aUF90UrdTimXoacy98B94K9QIKRa9Frs9UGv4
	ClYL1mC1id+rl6wTWHUkH4pck3Ex2McIzvqR5BW8Sn8yemL43B8fwLN/MHCnZ5EBsxjrvczqUoe
	SksLwmQ31irogsrr43Vz4xTd76iagvb0WZ+p25nCnzjoHiFFeEst8pWWM9A0rskRh5/nsDdhZUc
	WQJugfbGNNwFEcPjSJJic2jPPWRA1d/EEAO1VjgJIS0AgNthGICl5PGkB1vJeOAScuvNpneMbRg
	9rKayrRqk6UqqJEbEk4rqZtq0ekGlCr6e/U+i00646HkTw==
X-Google-Smtp-Source: AGHT+IFmrC4L2BBEGglHCKwEAqKUy9nE7lsKyuSMTJqBTFYq88vyNhKpBkqIwmbEPtXGJrbb0KbkPQ==
X-Received: by 2002:a05:600c:4ed0:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-43d2a2eca5bmr70290895e9.10.1742231300051;
        Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:19 -0700 (PDT)
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
Subject: [PATCH v4 12/18] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 17 Mar 2025 18:06:18 +0100
Message-ID: <20250317170625.1142870-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100822_063618_7FA294B1 
X-CRM114-Status: GOOD (  11.48  )
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
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jCmluZGV4IDBmYjY2M2FjMjAwZi4uOTA0NjZhMTcxZjU4IDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0yNjksNyArMjY5LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxv
bmcgZ2V0X2YzMl9ycyh1bnNpZ25lZCBsb25nIGluc24sIHU4IGZwX3JlZ19vZmZzZXQsCiAJaW50
IF9fcmV0OwkJCQkJXAogCQkJCQkJCVwKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CQkJCVwKLQkJ
X19yZXQgPSBfX2dldF91c2VyKGluc24sICh0eXBlIF9fdXNlciAqKSBpbnNuX2FkZHIpOyBcCisJ
CV9fcmV0ID0gZ2V0X3VzZXIoaW5zbiwgKHR5cGUgX191c2VyICopIGluc25fYWRkcik7IFwKIAl9
IGVsc2UgewkJCQkJXAogCQlpbnNuID0gKih0eXBlICopaW5zbl9hZGRyOwkJXAogCQlfX3JldCA9
IDA7CQkJCVwKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
