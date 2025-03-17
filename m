Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEC3C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OzlSLmEDxmTZGGOWjgBQ1lVLRqdyG9JO3abRrCdyvI=; b=UtsNdDJE0FSim2
	Yp/lyqdVnypG2aI3xFjef5nUI1VU1Z2On0tpskPg2pKq/43Wl8msi13n41GzAP0yiUt1blcMsn7IQ
	iVliIDQAs8lSc6LJtOPhEgOs3aflzB1ClsA077WLua8jKbLopgIpsrgMe4PoD/AJElhq/yLYNRUvY
	4BgbxAD8fuvfjT7CujoIhAH4czUYsBLsJCUlTwcKASdip1M5qhaKJNWIeK7ccQW9P415B9zMFkI3J
	sJ8C+6p0GR9Xid1eLQ2yjqvjS0e7SDmcFxocauVz0u+uf8/joDQCEdinFMe7fTF6HIo/+G+UJUHeA
	uO3iIp2XLSAncQzlD+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1a-00000003VDj-0Bkz;
	Mon, 17 Mar 2025 17:13:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwq-00000003TW0-1lUg
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfe574976so14973995e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231299; x=1742836099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=FIMICZKJ8UUIIQ5NAmeV84+1xIiECkOb9RPCS+u+UB0GQ7UzVdyWFdMsaTlGQ6SXds
         942oKskxCKT8UUTsKZv6a0QTp75Z5k+YeKFaubKBc6ZP4gXjv+fu/cwcejRwt+RGLUhD
         tZNfwvylWtatjNvongD3B0Kw8G3HwBocB9+Qu3dRO25OOXWrR7zHq+4fTdKAXeJ5d4Dp
         hWm4M5FI24c/vJCUGtuvVToBoz64ABHJUKz9Ndh2hxPgfXrM0KZIDCcV8bAV0T9d7fKN
         uknyeihFhbdWZBN1WP+G13sEh62tejn/QWAIpqUVZosXKunS7FNUeWaEUVHFTbhLBhJJ
         TrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231299; x=1742836099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTEMNxwWUDdJDHTSWR5BaYosnBDapUg7Ev6g031TeV8=;
        b=pa4fsczunfxSeVWb5znft2gyimq4GogE+k+3trQ9utYINykRK7eF7d8549SZ2gjCB3
         KMzH1FQC2GQYEw65doT3Tj453Qg2zzbEe+SxXSFk70FI9WeWx79ea3W7gNW7kwKCoQCb
         Sfy2/wjyoUgYB5fJlcHfghwF/nvmyWPYnkGRGuCWV4Z6aUtlK44nChDrbGHX7aDDfAks
         AuuH6PyRR59AsnE9HLIQKPzdBh6zf1vPSoPBn2tQ+BXgXZ+K72SL6Qx6fTt3xIpJj6X0
         l4k5vL/PL8oRQHRPnvITvlshRJcew1DUFFZmsRmds1ElOPQtwFfqRlNgv1m+xs2gaIBW
         ynvw==
X-Forwarded-Encrypted: i=1; AJvYcCV4732Q9PITFfu/SlBfhniPnwGPmDGHwDk18ytuH7f14DZqIZC1ckQWM0n5k4XuiybLRnx6RZpdvCDOag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMlRkEXz5sEfjgS5nJ3pFxMo7hGEBDGL0zhAgTI1jfvWtpVV59
	wXQ9uelygJQSb+c2o1s1ufPxqKYDpSN+s4v4zuF4wGyjl/1a8d+mwMlyLPdOm6w=
X-Gm-Gg: ASbGnctVqkyKYTFw9gwNpHBQrUWuV51ZR/ZGGCwr0/jo2y+H+bFWl2I13XloWczc+lK
	kiztbozx7H4rv2yru+zSJgTRrOKschleBrfNkm9P0ceRFiWhQrZIJvrAQEH5MRAsHBVYinhmELu
	H5GhxaTZbwVUJJ1T930yzwTaAV5yhVU+YWZKqDZxMj7ycDt8EvAgFscNzRNecq7B4DlqYihtpsm
	41+PABGjEDESIf8Cq8DTb5fEEOXD/7CSzOCQq1vCfahO4o/+uboXY9AnnB6IywgjjEQISCrIClJ
	1Uoo5wJOHJ/blpj+GrrR2/+9RgnRGn/tlh4kZ6kakLO9ow==
X-Google-Smtp-Source: AGHT+IF/jPZgtuKO9F2UOB0NNJAFXUmhCJVLus67Lul9R3bvXGZReu7Tw2V0Z3eVtQhps9kA5NlJfg==
X-Received: by 2002:a05:600c:4451:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43d1ec8a44cmr134590325e9.17.1742231299101;
        Mon, 17 Mar 2025 10:08:19 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:18 -0700 (PDT)
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
Subject: [PATCH v4 11/18] riscv: misaligned: enable IRQs while handling misaligned accesses
Date: Mon, 17 Mar 2025 18:06:17 +0100
Message-ID: <20250317170625.1142870-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100820_455939_F5179B5D 
X-CRM114-Status: GOOD (  10.03  )
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

V2UgY2FuIHNhZmVseSByZWVuYWJsZSBJUlFzIGlmIHRoZXkgd2VyZSBlbmFibGVkIGluIHRoZSBw
cmV2aW91cwpjb250ZXh0LiBUaGlzIGFsbG93cyB0byBhY2Nlc3MgdXNlciBtZW1vcnkgdGhhdCBj
b3VsZCBwb3RlbnRpYWxseQp0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCmluZGV4IDU1ZDlmMzQ1MDM5OC4uM2VlY2MyYWRkYzQxIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
QEAgLTIwNiw2ICsyMDYsMTEgQEAgZW51bSBtaXNhbGlnbmVkX2FjY2Vzc190eXBlIHsKIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlIHR5cGUpCiB7CiAJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGly
cWVudHJ5X2VudGVyKHJlZ3MpOworCWJvb2wgZW5hYmxlX2lycXMgPSAhcmVnc19pcnFzX2Rpc2Fi
bGVkKHJlZ3MpOworCisJLyogRW5hYmxlIGludGVycnVwdHMgaWYgdGhleSB3ZXJlIGVuYWJsZWQg
aW4gdGhlIGludGVycnVwdGVkIGNvbnRleHQuICovCisJaWYgKGVuYWJsZV9pcnFzKQorCQlsb2Nh
bF9pcnFfZW5hYmxlKCk7CiAKIAlpZiAodHlwZSA9PSAgTUlTQUxJR05FRF9MT0FEKSB7CiAJCWlm
IChoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQpAQCAtMjE3LDYgKzIyMiw5IEBAIHN0YXRp
YyB2b2lkIGRvX3RyYXBfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgZW51bSBtaXNh
bGlnbmVkX2FjY2Vzc190eXBlCiAJCQkJICAgICAgIk9vcHMgLSBzdG9yZSAob3IgQU1PKSBhZGRy
ZXNzIG1pc2FsaWduZWQiKTsKIAl9CiAKKwlpZiAoZW5hYmxlX2lycXMpCisJCWxvY2FsX2lycV9k
aXNhYmxlKCk7CisKIAlpcnFlbnRyeV9leGl0KHJlZ3MsIHN0YXRlKTsKIH0KIAotLSAKMi40Ny4y
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
