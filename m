Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A21C02180
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qWNntZSzv9bYUrHnatU64Ms09H/WnRoIoDo/o3ad/Gc=; b=Eeqw7Yx2lWomV5
	DHOzbnzDf89Gm/4NP76Dmu+2SjTAJuOjkM9g/ujW3fsMyrKyTCCoOJWoGyixjVF99DzZdiejxyW2Y
	HebAkYtJv8VPXFP1jvjL5Vgaczkj4TozMaGVZMbH/nlwAKzjoJvcAJrMWbFbSE41cgt+pz7qbKgce
	fFDJcw6Kqc0I0UxWcriBS0ROam6gYC3x6Qk7kTdZ16AAWm506Az+BsHYX8Q+syffSsjwVqr30z12R
	98+HSiv+lfdvrS5CmI/4l0SyhIsWs91fvfxdvUzfHmWGP8VEV7dHU4y5ZZKh6+7cBopOnJ2fIpg/2
	V20bHXs5y39e2U/x1LYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLO5-00000005Oi0-3W9V;
	Mon, 13 Jan 2025 14:25:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLMm-00000005OXz-2a9f
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 14:24:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43622267b2eso46397205e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 06:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736778270; x=1737383070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U6Zgp09z8lzuttgM51PWASr/v2Wid6qJyqxiEWy6j0I=;
        b=lTuzZOAKLCnWEDqz46zkTswm6pR0Axn8jQTzfjfeZ5IN5ocorYMnDYyYf3xSnPeINy
         KC2LVbvc7JfecQkcMELWcPQhtmQ9Xs8WACtEbVR8uJh4TeIOS2BtY2/LAgmc7jp3RvWA
         tNWj4hT2mmI7s2N32Xz1YJs2JMOXR/CiGeTZSS+7DXd3sRRvMJL+9DYIH2+IQQ6cnj7I
         wE9FY09Rw2ODJcl/wAomk/Y3G09QBeGeVhUoRC+NdqO6Ygu01wD7W6MexWMm1+8lCAYp
         5+xAty66eKb7GqZNT6JAbwbdLxqOMmc7ZYmGg1g8ubqHaagwp0ZSFIUZ98CAsOtK5+lR
         ZJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778270; x=1737383070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6Zgp09z8lzuttgM51PWASr/v2Wid6qJyqxiEWy6j0I=;
        b=Tbc+WjdADAODwYZvBlBBBHamQ3nnstOKdGjiEQToQRMWwZ0SWWJwJGLuWpTI4Tx4Dg
         XArSZ+0wmIeyzWeFmgAbqahWNQERyYS2sXY6RnChuoklkDzu/cBTH/GaUcIh8P+SSKkl
         SwolrTjw03Rtv6e+cxAINH2YbIgJkq1bMFgSwl/I4Yoq97L406yTm78ZDa1HFrkyeX9W
         xmfleqlqo7kNcrJUafIHooTW/iRQqgryBnNWy+UrCxS6eag/ihodzKfC2X+PpDZn/q1F
         h8yin8j9ABuKJdruOaUkKGPeedodFOpTvEswhkvd3ZJXrmPXl3Sut2913u4qz4txP3Y/
         mRBg==
X-Forwarded-Encrypted: i=1; AJvYcCW+Ep/5wNn+7KBAHhPYxnCAp+sFJtsgXZul6YywM4IZsI5mLdDpJ6Ey+h2vv96mXVhcolkKqW1D65YpfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh3BsTvXhp1dyqd1bB8T+3dg+yfL5OL5NlZiuv26KusXqtwjPk
	Jl0vO0cUdnKHr5O9Ic1/vFKmdqF104pxw0eg/c6k918pejOUGME0TuynnVZPCXw=
X-Gm-Gg: ASbGncs00zZa7rNXxpYRsEJ1o0pIQf5mc/rkK1GkcEJT59uALa28Lbk0pTOtqDEEDlF
	twYcegwXpBfmafvXCFfkrClFr0RlxuJaWVnLDxrTuSaaEG8LZoAHnb37cU6iB8Q3nunb6K9WYHP
	Y8JnuVUty2f8JX2jTMG/56oyfDblyFi8kS5ccenn1E3K9uI1+4agQb7FVOeVwgJzAvuA3v4UMXr
	U5yDlUvGGEh8pAT4+T7XBQYLqds1LoezZ/EgyGPUybxJSemHBjsRFhLvdjvXYZUe7aP9bHKXRKj
X-Google-Smtp-Source: AGHT+IGMa2ldUEkMiuq4eErSnbpALm4uDp90FJrdLywqcG2hGCMQ9lmvAIoLp9JhfgfEIFI4LBCwjA==
X-Received: by 2002:a05:600c:4586:b0:434:edcf:7461 with SMTP id 5b1f17b1804b1-436e26f135bmr207312645e9.30.1736778270319;
        Mon, 13 Jan 2025 06:24:30 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3382:ef90:1d6c:a0ef:bd2f:4ccd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436dd11ddfdsm133376335e9.1.2025.01.13.06.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:24:29 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v4] riscv: Call secondary mmu notifier when flushing the tlb
Date: Mon, 13 Jan 2025 15:24:24 +0100
Message-Id: <20250113142424.30487-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_062432_919043_D1D5DEA4 
X-CRM114-Status: GOOD (  12.49  )
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

VGhpcyBpcyByZXF1aXJlZCB0byBhbGxvdyB0aGUgSU9NTVUgZHJpdmVyIHRvIGNvcnJlY3RseSBm
bHVzaCBpdHMgb3duClRMQi4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KLS0tCgpDaGFuZ2VzIGluIHY0OgotIFJlbW92ZSB1bnVzZWQgdmFyaWFibGVz
IGFzIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90CgpDaGFuZ2VzIGluIHYzOgotIFJlYmFz
ZSBvbiB0b3Agb2YgNi4xMy1yYzMKCkNoYW5nZXMgaW4gdjI6Ci0gUmViYXNlIG9uIHRvcCBvZiA2
LjktcmMxCgogYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIHwgMzcgKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYwppbmRleCA5YjZlODZjZTM4NjcuLmJiNzc2MDdjODdhYSAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCisrKyBiL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYwpAQCAtNCw2ICs0LDcgQEAKICNpbmNsdWRlIDxsaW51eC9zbXAuaD4KICNpbmNs
dWRlIDxsaW51eC9zY2hlZC5oPgogI2luY2x1ZGUgPGxpbnV4L2h1Z2V0bGIuaD4KKyNpbmNsdWRl
IDxsaW51eC9tbXVfbm90aWZpZXIuaD4KICNpbmNsdWRlIDxhc20vc2JpLmg+CiAjaW5jbHVkZSA8
YXNtL21tdV9jb250ZXh0Lmg+CiAKQEAgLTc4LDEwICs3OSwxNyBAQCBzdGF0aWMgdm9pZCBfX2lw
aV9mbHVzaF90bGJfcmFuZ2VfYXNpZCh2b2lkICppbmZvKQogCWxvY2FsX2ZsdXNoX3RsYl9yYW5n
ZV9hc2lkKGQtPnN0YXJ0LCBkLT5zaXplLCBkLT5zdHJpZGUsIGQtPmFzaWQpOwogfQogCi1zdGF0
aWMgdm9pZCBfX2ZsdXNoX3RsYl9yYW5nZShjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY21hc2ssIHVu
c2lnbmVkIGxvbmcgYXNpZCwKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBnZXRfbW1fYXNp
ZChzdHJ1Y3QgbW1fc3RydWN0ICptbSkKK3sKKwlyZXR1cm4gbW0gPyBjbnR4MmFzaWQoYXRvbWlj
X2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpKSA6IEZMVVNIX1RMQl9OT19BU0lEOworfQorCitz
dGF0aWMgdm9pZCBfX2ZsdXNoX3RsYl9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKKwkJCSAg
ICAgIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjbWFzaywKIAkJCSAgICAgIHVuc2lnbmVkIGxvbmcg
c3RhcnQsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKIAkJCSAgICAgIHVuc2lnbmVkIGxvbmcgc3RyaWRl
KQogeworCXVuc2lnbmVkIGxvbmcgYXNpZCA9IGdldF9tbV9hc2lkKG1tKTsKIAl1bnNpZ25lZCBp
bnQgY3B1OwogCiAJaWYgKGNwdW1hc2tfZW1wdHkoY21hc2spKQpAQCAtMTA1LDMwICsxMTMsMjYg
QEAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJfcmFuZ2UoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNt
YXNrLCB1bnNpZ25lZCBsb25nIGFzaWQsCiAJfQogCiAJcHV0X2NwdSgpOwotfQogCi1zdGF0aWMg
aW5saW5lIHVuc2lnbmVkIGxvbmcgZ2V0X21tX2FzaWQoc3RydWN0IG1tX3N0cnVjdCAqbW0pCi17
Ci0JcmV0dXJuIGNudHgyYXNpZChhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkpOwor
CWlmIChtbSkKKwkJbW11X25vdGlmaWVyX2FyY2hfaW52YWxpZGF0ZV9zZWNvbmRhcnlfdGxicyht
bSwgc3RhcnQsIHN0YXJ0ICsgc2l6ZSk7CiB9CiAKIHZvaWQgZmx1c2hfdGxiX21tKHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tKQogewotCV9fZmx1c2hfdGxiX3JhbmdlKG1tX2NwdW1hc2sobW0pLCBnZXRf
bW1fYXNpZChtbSksCi0JCQkgIDAsIEZMVVNIX1RMQl9NQVhfU0laRSwgUEFHRV9TSVpFKTsKKwlf
X2ZsdXNoX3RsYl9yYW5nZShtbSwgbW1fY3B1bWFzayhtbSksIDAsIEZMVVNIX1RMQl9NQVhfU0la
RSwgUEFHRV9TSVpFKTsKIH0KIAogdm9pZCBmbHVzaF90bGJfbW1fcmFuZ2Uoc3RydWN0IG1tX3N0
cnVjdCAqbW0sCiAJCQl1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwKIAkJ
CXVuc2lnbmVkIGludCBwYWdlX3NpemUpCiB7Ci0JX19mbHVzaF90bGJfcmFuZ2UobW1fY3B1bWFz
ayhtbSksIGdldF9tbV9hc2lkKG1tKSwKLQkJCSAgc3RhcnQsIGVuZCAtIHN0YXJ0LCBwYWdlX3Np
emUpOworCV9fZmx1c2hfdGxiX3JhbmdlKG1tLCBtbV9jcHVtYXNrKG1tKSwgc3RhcnQsIGVuZCAt
IHN0YXJ0LCBwYWdlX3NpemUpOwogfQogCiB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIpCiB7Ci0JX19mbHVzaF90bGJfcmFu
Z2UobW1fY3B1bWFzayh2bWEtPnZtX21tKSwgZ2V0X21tX2FzaWQodm1hLT52bV9tbSksCisJX19m
bHVzaF90bGJfcmFuZ2Uodm1hLT52bV9tbSwgbW1fY3B1bWFzayh2bWEtPnZtX21tKSwKIAkJCSAg
YWRkciwgUEFHRV9TSVpFLCBQQUdFX1NJWkUpOwogfQogCkBAIC0xNjEsMTMgKzE2NSwxMyBAQCB2
b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQg
bG9uZyBzdGFydCwKIAkJfQogCX0KIAotCV9fZmx1c2hfdGxiX3JhbmdlKG1tX2NwdW1hc2sodm1h
LT52bV9tbSksIGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pLAorCV9fZmx1c2hfdGxiX3JhbmdlKHZt
YS0+dm1fbW0sIG1tX2NwdW1hc2sodm1hLT52bV9tbSksCiAJCQkgIHN0YXJ0LCBlbmQgLSBzdGFy
dCwgc3RyaWRlX3NpemUpOwogfQogCiB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWdu
ZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpCiB7Ci0JX19mbHVzaF90bGJfcmFuZ2Uo
Y3B1X29ubGluZV9tYXNrLCBGTFVTSF9UTEJfTk9fQVNJRCwKKwlfX2ZsdXNoX3RsYl9yYW5nZShO
VUxMLCBjcHVfb25saW5lX21hc2ssCiAJCQkgIHN0YXJ0LCBlbmQgLSBzdGFydCwgUEFHRV9TSVpF
KTsKIH0KIApAQCAtMTc1LDcgKzE3OSw3IEBAIHZvaWQgZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSh1
bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkKIHZvaWQgZmx1c2hfcG1kX3Rs
Yl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwK
IAkJCXVuc2lnbmVkIGxvbmcgZW5kKQogewotCV9fZmx1c2hfdGxiX3JhbmdlKG1tX2NwdW1hc2so
dm1hLT52bV9tbSksIGdldF9tbV9hc2lkKHZtYS0+dm1fbW0pLAorCV9fZmx1c2hfdGxiX3Jhbmdl
KHZtYS0+dm1fbW0sIG1tX2NwdW1hc2sodm1hLT52bV9tbSksCiAJCQkgIHN0YXJ0LCBlbmQgLSBz
dGFydCwgUE1EX1NJWkUpOwogfQogI2VuZGlmCkBAIC0xODksNyArMTkzLDEwIEBAIHZvaWQgYXJj
aF90bGJiYXRjaF9hZGRfcGVuZGluZyhzdHJ1Y3QgYXJjaF90bGJmbHVzaF91bm1hcF9iYXRjaCAq
YmF0Y2gsCiAJCQkgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAJCQkgICAgICAgdW5zaWdu
ZWQgbG9uZyB1YWRkcikKIHsKKwl1bnNpZ25lZCBsb25nIHN0YXJ0ID0gdWFkZHIgJiBQQUdFX01B
U0s7CisKIAljcHVtYXNrX29yKCZiYXRjaC0+Y3B1bWFzaywgJmJhdGNoLT5jcHVtYXNrLCBtbV9j
cHVtYXNrKG1tKSk7CisJbW11X25vdGlmaWVyX2FyY2hfaW52YWxpZGF0ZV9zZWNvbmRhcnlfdGxi
cyhtbSwgc3RhcnQsIHN0YXJ0ICsgUEFHRV9TSVpFKTsKIH0KIAogdm9pZCBhcmNoX2ZsdXNoX3Rs
Yl9iYXRjaGVkX3BlbmRpbmcoc3RydWN0IG1tX3N0cnVjdCAqbW0pCkBAIC0xOTksNyArMjA2LDcg
QEAgdm9pZCBhcmNoX2ZsdXNoX3RsYl9iYXRjaGVkX3BlbmRpbmcoc3RydWN0IG1tX3N0cnVjdCAq
bW0pCiAKIHZvaWQgYXJjaF90bGJiYXRjaF9mbHVzaChzdHJ1Y3QgYXJjaF90bGJmbHVzaF91bm1h
cF9iYXRjaCAqYmF0Y2gpCiB7Ci0JX19mbHVzaF90bGJfcmFuZ2UoJmJhdGNoLT5jcHVtYXNrLCBG
TFVTSF9UTEJfTk9fQVNJRCwgMCwKLQkJCSAgRkxVU0hfVExCX01BWF9TSVpFLCBQQUdFX1NJWkUp
OworCV9fZmx1c2hfdGxiX3JhbmdlKE5VTEwsICZiYXRjaC0+Y3B1bWFzaywKKwkJCSAgMCwgRkxV
U0hfVExCX01BWF9TSVpFLCBQQUdFX1NJWkUpOwogCWNwdW1hc2tfY2xlYXIoJmJhdGNoLT5jcHVt
YXNrKTsKIH0KLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
