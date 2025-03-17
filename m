Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07970C35FFB
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWyN2HA9Zz/Oi6kWmpTIPB2zuBmS30gp46WURUnSLOs=; b=VvGm01aLnT8L4b
	TpZLV6INmFNdDFP04WqPDV7IYp0oULrhDhUmlPXHgMt6I/oNBwGOA06T53Ko5exZLeKuwn+4uVy9U
	jGkNKL8dIBgitKEgsdv4dZ9epz5sl6cWacUOM13PvFvkES0XrYaFdDXbDriHgn8TsUuX+4YIblkpv
	p1gdQXs1r8Pvk+xaN/9ghTUYrxttCy6RjezKT6XATFj0YXKq3o9p2bUoS/KYbyegA1Z70atXgB3Qk
	C7ddLsc3tRmuDi19g2N3kGFrCRdqwHxNWfL4gX2xGN8AvqGHllcs5JErRHc3CuojAlcwkuSlfESJB
	tRXHa6zIMYUrRknQiOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1X-00000003V9E-1bLy;
	Mon, 17 Mar 2025 17:13:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwp-00000003TVQ-2h4d
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-399676b7c41so700970f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231298; x=1742836098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=SwwEtTnbCbMEGIJPQwBjpMhLWv0Hwjkh0lMoESGqXETRUUx3c77nNq+Cpl//OFdltj
         NzC1QpUbXNlmexPK6ps+04iJaN2twYUO9VF2PfbC7H1QWWG7Q5zDCCGCp84s1cqm3CH8
         TDsOc3cnuBrXZIMjpfvLseTPI//b3VI9ZlKBz/eEapEef7Ww1TRq60H9Kbgv38VF8Khl
         Z6zTVpcVpzF/xk2Q3YPkN/Qld+ZijLWa976999GIDfWlK5PvCfwdfKn0V7vPivp6Qw1X
         THn5FfNkVAPHPXjPjaW1fknfBpPtaqqcQrYozred0lnBU+vQDZswsOj2TOC0YHwJrfCg
         IN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231298; x=1742836098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9Vwlc46bZsQyt2QxW9m2l1M9vTOam7Mm6HyDDfLEZk=;
        b=wgjGZPUy1Sjs5C0lzPL+pBZzFOPp7IrLtA727n1iMI5jsbQny3k8sOJ8Ewe26bE2BA
         Jk0d2tRE0KMtxrxvLR6yKw5hvvtUHMcZET6SGSgf+rTdqfwlRIm/ylh6acmhWlR98iXN
         nXsZOGWJoKHmDtFjFkibmwXmVZapbou3C7T1AURehYdhoQ6cUQ4r4nx6vXNSsE3NY8tg
         CVZOqaM4fF5A3Kx1XN0A315DOWkRev+J6qGwJWoRSOoWEosArpCT1JuONNUoRH/5LJ2o
         UAWKb1JYzD6NyNYhO5DJ/z/Cj/YVGpkRasTEN8tNSKmCTNd6T0YZqo+6uYhQ/8pRGcu5
         auFw==
X-Forwarded-Encrypted: i=1; AJvYcCXc23w3vENmrHtm2yZL01uBJxjHeYVFoi7cvOFJChHnHa2UvBL9KRMLhkFDBUZRhRcvHb33WtV6b+gDvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeM8lBqMQB6QShZfQN2fxC8tJdyedwRlVzEvts/Hd7nICvpiaQ
	H4EJ/cqLe8Uq9lHCnAZh6M5aRA25npI1hrxSfl+jKjJqKAmusN6H4sySo3iIrQ0=
X-Gm-Gg: ASbGncsjOhXmaXnshAUGB/y9CCzw7lukBw4BkDaGwdW6tjvIDJIYGN2F91snpCUOil+
	QDkcuwJL5QirDcRUqLS3gsowp4gWsx/+T/c1rNatktxEHAewEYpyoIiUWez1jYifCG4kHFr8SiD
	KJ52VnsvgMLBaNo2HYXD5DwqITXyfP54Cai9k/118ztkKo97BO0ovEegw8JiwAQAY0tVds73Lpk
	Wu3tNEBPYnpoKApPdWUxJG+BI6Y8yvdXSi5lZtNwG9viAC1BDlMMAfprDPDmzW25oZrMyClaYZ3
	Q8yfyCiH/SkI20ZhXI3VAW3J71KXDtIYkElHcCIQPYC6+A==
X-Google-Smtp-Source: AGHT+IGA2Rdk6jf2tb4X7esu4pon4fXkJaTK84F8Y0BwgA61Xp90vVw97TtNBjS5pxzMobEPki6sdQ==
X-Received: by 2002:a05:6000:1f8e:b0:391:253b:4046 with SMTP id ffacd0b85a97d-3971d51f3f8mr14939898f8f.16.1742231298143;
        Mon, 17 Mar 2025 10:08:18 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:17 -0700 (PDT)
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
Subject: [PATCH v4 10/18] riscv: misaligned: factorize trap handling
Date: Mon, 17 Mar 2025 18:06:16 +0100
Message-ID: <20250317170625.1142870-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100819_682323_98B5F89A 
X-CRM114-Status: UNSURE (   9.87  )
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

bWlzYWxpZ25lZCBhY2Nlc3NlcyB0cmFwcyBhcmUgbm90IG5taSBhbmQgc2hvdWxkIGJlIHRyZWF0
ZWQgYXMgbm9ybWFsCm9uZSB1c2luZyBpcnFlbnRyeV9lbnRlcigpL2V4aXQoKS4gU2luY2UgYm90
aCBsb2FkL3N0b3JlIGFuZCB1c2VyL2tlcm5lbApzaG91bGQgdXNlIGFsbW9zdCB0aGUgc2FtZSBw
YXRoIGFuZCB0aGF0IHdlIGFyZSBnb2luZyB0byBhZGQgc29tZSBjb2RlCmFyb3VuZCB0aGF0LCBm
YWN0b3JpemUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDQ5ICsrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDhmZjhlOGIzNjUyNC4uNTVk
OWYzNDUwMzk4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTE5OCw0NyArMTk4LDM4IEBAIGFzbWxpbmthZ2Ug
X192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9pbnNuX2lsbGVnYWwoc3RydWN0
IHB0X3JlZ3MgKnJlCiBET19FUlJPUl9JTkZPKGRvX3RyYXBfbG9hZF9mYXVsdCwKIAlTSUdTRUdW
LCBTRUdWX0FDQ0VSUiwgImxvYWQgYWNjZXNzIGZhdWx0Iik7CiAKLWFzbWxpbmthZ2UgX192aXNp
YmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQoc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCitlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUgeworCU1JU0FMSUdORURf
U1RPUkUsCisJTUlTQUxJR05FRF9MT0FELAorfTsKKworc3RhdGljIHZvaWQgZG9fdHJhcF9taXNh
bGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBlbnVtIG1pc2FsaWduZWRfYWNjZXNzX3R5cGUg
dHlwZSkKIHsKLQlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Ci0JCWlycWVudHJ5X2VudGVyX2Zyb21f
dXNlcl9tb2RlKHJlZ3MpOworCWlycWVudHJ5X3N0YXRlX3Qgc3RhdGUgPSBpcnFlbnRyeV9lbnRl
cihyZWdzKTsKIAorCWlmICh0eXBlID09ICBNSVNBTElHTkVEX0xPQUQpIHsKIAkJaWYgKGhhbmRs
ZV9taXNhbGlnbmVkX2xvYWQocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywg
QlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlz
YWxpZ25lZCIpOwotCi0JCWlycWVudHJ5X2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOworCQkJCSAg
ICAgICJPb3BzIC0gbG9hZCBhZGRyZXNzIG1pc2FsaWduZWQiKTsKIAl9IGVsc2UgewotCQlpcnFl
bnRyeV9zdGF0ZV90IHN0YXRlID0gaXJxZW50cnlfbm1pX2VudGVyKHJlZ3MpOwotCi0JCWlmICho
YW5kbGVfbWlzYWxpZ25lZF9sb2FkKHJlZ3MpKQorCQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3Rv
cmUocmVncykpCiAJCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVn
cy0+ZXBjLAotCQkJICAgICAgIk9vcHMgLSBsb2FkIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwotCi0J
CWlycWVudHJ5X25taV9leGl0KHJlZ3MsIHN0YXRlKTsKKwkJCQkgICAgICAiT29wcyAtIHN0b3Jl
IChvciBBTU8pIGFkZHJlc3MgbWlzYWxpZ25lZCIpOwogCX0KKworCWlycWVudHJ5X2V4aXQocmVn
cywgc3RhdGUpOwogfQogCi1hc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lk
IGRvX3RyYXBfc3RvcmVfbWlzYWxpZ25lZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKK2FzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9sb2FkX21pc2FsaWduZWQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7Ci0JaWYgKHVzZXJfbW9kZShyZWdzKSkgewotCQlpcnFl
bnRyeV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKLQotCQlpZiAoaGFuZGxlX21pc2FsaWdu
ZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJlZ3MsIFNJR0JVUywgQlVTX0FEUkFM
TiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9yIEFNTykgYWRkcmVzcyBtaXNhbGln
bmVkIik7Ci0KLQkJaXJxZW50cnlfZXhpdF90b191c2VyX21vZGUocmVncyk7Ci0JfSBlbHNlIHsK
LQkJaXJxZW50cnlfc3RhdGVfdCBzdGF0ZSA9IGlycWVudHJ5X25taV9lbnRlcihyZWdzKTsKLQot
CQlpZiAoaGFuZGxlX21pc2FsaWduZWRfc3RvcmUocmVncykpCi0JCQlkb190cmFwX2Vycm9yKHJl
Z3MsIFNJR0JVUywgQlVTX0FEUkFMTiwgcmVncy0+ZXBjLAotCQkJCSJPb3BzIC0gc3RvcmUgKG9y
IEFNTykgYWRkcmVzcyBtaXNhbGlnbmVkIik7CisJZG9fdHJhcF9taXNhbGlnbmVkKHJlZ3MsIE1J
U0FMSUdORURfTE9BRCk7Cit9CiAKLQkJaXJxZW50cnlfbm1pX2V4aXQocmVncywgc3RhdGUpOwot
CX0KK2FzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9zdG9y
ZV9taXNhbGlnbmVkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQoreworCWRvX3RyYXBfbWlzYWxpZ25l
ZChyZWdzLCBNSVNBTElHTkVEX1NUT1JFKTsKIH0KKwogRE9fRVJST1JfSU5GTyhkb190cmFwX3N0
b3JlX2ZhdWx0LAogCVNJR1NFR1YsIFNFR1ZfQUNDRVJSLCAic3RvcmUgKG9yIEFNTykgYWNjZXNz
IGZhdWx0Iik7CiBET19FUlJPUl9JTkZPKGRvX3RyYXBfZWNhbGxfcywKLS0gCjIuNDcuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
