Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8057AC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 15:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDUb7/GwHtyOErh8lOGTXWNjVbGphgFwZEJDkB85d5w=; b=hst6KqXFlrA6cp
	P46LvWSlNPEhUEZ5hXsJltEWP6xA8f+Rkg2FC5DZmF3BwEDqwQbXsVWiEsThvGV3BN5D8H78UBsrb
	otje1wmBrRaqqHpFO3oX00YD3KXrmvgAVABEQPb+Mml6dgqWeKmcU4auGlIe272O5gxeKtpjsYALS
	Sk4rEWVpemzXk1QNmWKKD3sCxjUjj0npfA86FThVhjP6lDbCEm0w3dyL1dCCyXJX+KYwx8kHHi+WN
	TfuEwJDYfSOIjwhwjjs3fyZZIy0RNjH6eBgJc7ZmJRY3xiXPsasK7DBlBDjk2c8R+F0aBGrBP6MCK
	cQLb9+PMw+TRs5R861KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxR8-00000001qcY-0XAk;
	Wed, 19 Jun 2024 15:41:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJxQx-00000001qVB-2Z55
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 15:41:17 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42181803bf2so4909185e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 08:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718811674; x=1719416474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPY+3E4dBoFlMa6qj3x8QVsLE7eX+roIHLt6ynEnu2U=;
        b=MGy0S+zwTDbP01RGavRb3eKm9pY1ZxLLcaUmkCAPXqAtXes64jZBVjR5p/v0USNRJs
         nXD4R6TAr8OHssMLBtmeMW7ARQFlAl1k6jq3MKPfEulXa568o0iFBq1ttCueCBSI+FPH
         B9hS32KgoXSAbPh6fhMqAoDIej204tMe+tMjyWYNni0LMq94G3SNWpU+6xuihgyryGxy
         CIIzrN9pbfdZPhqNCDgel5fFFXxYicL/hkxhAzFVBk6M9QchE3So3UxURmtLtYYtB+Hx
         DsrwPAnBsF73rCdCtMdadR/a3qcQoEAXsk5KI7HrX2ikCKGQj1DcOU4nndjDrpW4667K
         7Y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718811674; x=1719416474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPY+3E4dBoFlMa6qj3x8QVsLE7eX+roIHLt6ynEnu2U=;
        b=miFk8DnrXQkcsGZBmsqDVXY0oq4SL8M7NkyzWIm0PExwJ0inVlLJ1rhejIXMulN5WL
         9ozxAou8kb1edns5AhnhKi/FClj6Jw5vz9F68SsehbdlPOSIIuD+Y8vMH2nddwTpNEbn
         7BmyoID1mN6DyMCRSFpnAq9eRyysUZMpqTvkuUQMVssayNXXml53/FR3b3wBkhDwza7m
         hbIZeQoJ16WxG1UiImXFH1Jh8XqVDQ7m53sJx4BJINX8ZsdLNLaZpOhdowyD1Y3NytmB
         nJ+RCrJNutxAs8X6AnfceDGcZKkjGQV5o4dsDEFGi0jYbmfl/5NrvafKNDepWgms7f9V
         kVPw==
X-Forwarded-Encrypted: i=1; AJvYcCUfM4gGiTvUWFVJHslpdxrKRK/WQuX+/0XHV8zqj4i9HuDrs5YN8mXdxsHdMq+frS/fc1HZn82eCbUrJCx5BZwXpbkSOd0FWKL3QAgMkuHY
X-Gm-Message-State: AOJu0Yx7jvBY1RzBwABErkeUU/+IqLyKTcRpn/5Gv9ekEIwDTKGGvEgh
	fl8TBdBEKZQOEMMCcz5/fSoDqxvN9jpFeThfAivt0O8xczSaqOGidWWCZIx3Fuk=
X-Google-Smtp-Source: AGHT+IHEyMK/ITgXlMXOhDLGJETYUb24IsTevTAqgLrmuWFBKFkU3n8nX5A972+nIAwKJBmfBumqAA==
X-Received: by 2002:a5d:5f93:0:b0:35f:2929:846e with SMTP id ffacd0b85a97d-363171e28demr2732165f8f.1.1718811673916;
        Wed, 19 Jun 2024 08:41:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:819d:b9d2:9c2:3b7a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c785sm17392292f8f.34.2024.06.19.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:41:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 3/5] riscv: hwprobe: export Zaamo and Zalrsc extensions
Date: Wed, 19 Jun 2024 17:39:10 +0200
Message-ID: <20240619153913.867263-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_084115_849897_16B313F1 
X-CRM114-Status: GOOD (  11.31  )
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

RXhwb3J0IHRoZSBaYWFtbyBhbmQgWmFscnNjIGV4dGVuc2lvbnMgdG8gdXNlcnNwYWNlIHVzaW5n
IGh3cHJvYmUuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDggKysr
KysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAyICsrCiBhcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgMiArKwogMyBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2
L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4
IDI1ZDc4M2JlMjg3OC4uNjgzNmE3ODlhOWIxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0CkBAIC0yMzUsNiArMjM1LDE0IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5l
ZDoKICAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwg
c3RhcnRpbmcgZnJvbSBjb21taXQKICAgICAgICBjNzMyYTRmMzlhNCAoIlpjbW9wIGlzIHJhdGlm
aWVkLzEuMCIpLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pBQU1PYDogVGhl
IFphYW1vIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHRoZSBp
biB0aGUgUklTQy1WIElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgZTg3NDEyZTYyMWYx
CisgICAgICAgKCJpbnRlZ3JhdGUgWmFhbW8gYW5kIFphbHJzYyB0ZXh0ICgjMTMwNCkiKS4KKwor
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQUxSU0NgOiBUaGUgWmFscnNjIGV4dGVu
c2lvbiBpcyBzdXBwb3J0ZWQgYXMKKyAgICAgICBkZWZpbmVkIGluIHRoZSBpbiB0aGUgUklTQy1W
IElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQgZTg3NDEyZTYyMWYxCisgICAgICAgKCJp
bnRlZ3JhdGUgWmFhbW8gYW5kIFphbHJzYyB0ZXh0ICgjMTMwNCkiKS4KKwogKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVy
Zm9ybWFuY2UKICAgaW5mb3JtYXRpb24gYWJvdXQgdGhlIHNlbGVjdGVkIHNldCBvZiBwcm9jZXNz
b3JzLgogCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAppbmRleCA5MjBmYzZhNTg2
YzkuLjUyY2QxNjFlOWE5NCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCkBA
IC03MSw2ICs3MSw4IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pDRAkJKDFVTEwgPDwgNDUpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9a
Q0YJCSgxVUxMIDw8IDQ2KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkNNT1AJCSgxVUxM
IDw8IDQ3KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFBTU8JCSgxVUxMIDw8IDQ4KQor
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFMUlNDCSgxVUxMIDw8IDQ5KQogI2RlZmluZSBS
SVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNB
TElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05F
RF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKaW5kZXggM2QxYWExM2Ew
YmIyLi5lMDlmMWJjM2FmMTcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3By
b2JlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwpAQCAtMTE2LDYgKzEx
Niw4IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUg
KnBhaXIsCiAJCUVYVF9LRVkoWkNBKTsKIAkJRVhUX0tFWShaQ0IpOwogCQlFWFRfS0VZKFpDTU9Q
KTsKKwkJRVhUX0tFWShaQUFNTyk7CisJCUVYVF9LRVkoWkFMUlNDKTsKIAogCQkvKgogCQkgKiBB
bGwgdGhlIGZvbGxvd2luZyBleHRlbnNpb25zIG11c3QgZGVwZW5kIG9uIHRoZSBrZXJuZWwKLS0g
CjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
