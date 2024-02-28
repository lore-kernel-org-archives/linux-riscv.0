Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394A8C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 17:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATZ2EIvlxBC6OpjtVZDQH7JA6Vk/Ly1ggsUifHVoS4I=; b=YWLExWqiemuE7g
	YqOtOQWXKsQTGWQUTUhymGeB9X9lcDGGYZyv0VUSHdISav/mRNysz0Hy7f4M1kq9RpU+e5R8Gfk0b
	EVbJzw8HN9m/Py/8LK+ufC9/zLzMLehsWChq7YGWqokDSQvuRgv/s/u32RXzNEgL35U0OZ5nsYh8w
	nzoojK/9omU8mFIiVfKufBz6ARJVjYcuPmvCfFH00dgJ1jGl1i7IQhFH4XmBTndpi6gc8oEYtZnqW
	tb+hLWJRnTv4sHCVmOQKnZU9Ko81jNTuikr6WvtlQ+oRRXoUNwoYtBuQ/1/83hBfdooXfb9+M3F8s
	OLh3Mn3Po8AUvC8eMSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO82-0000000AN1S-28q0;
	Wed, 28 Feb 2024 17:54:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfO7y-0000000AMyp-2hsS
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 17:54:00 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-412a3371133so76125e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 09:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709142836; x=1709747636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2KLsPuh1XpNjZ2CAToQLQwQXyB2VEROM3hvTLFmqyk=;
        b=XiQxd1WV1jYnTJtxFnt7bcuMJ8YHrp7mA8Mf4wbzgSahlmGnVQA4tgsflddhwFrv2X
         6LRkpPk4VtxaKK7nZ8ZinS7Y1YMz8y1tRqOxGqvWbmn1JczU1oafhdA8myUaFwzgpab6
         aSDjgPwzQ3FsF8uXcOPpJ/05ajYSq99xUdicaiL0k7xQ0A6AsnmENUWl1x/eu8PLag3q
         PrPZbh9ZJic9eDu4k/P+eYnSUHgCZsyU+y2/ThfI9o61khpZsJkINYQnm2vtzYzkfKZt
         9+0sdae2uKlKMBJQX499NpVdIJZOhkYBrD2J8cxD8IC8ZDrodXuYpwOHylxeLz88cchX
         Bm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142836; x=1709747636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2KLsPuh1XpNjZ2CAToQLQwQXyB2VEROM3hvTLFmqyk=;
        b=k0q0kQ52HEzjZ4hUYCrlEY5fkhaNmKag2HTlhUBlo1A+wAxaEjWhCMcr4UEZI81DBv
         PTEguVDeSK0jw7ylPVmFMNMP6L+8p0t8YCS6isBhbPd/hllvpcRmupbKPbRILpgkZZD1
         kkeGW/zukBHGqIipvXZPLGbm9Q0UeBToYKqvUluM70jhnuqCfJaQ5mGma8SkSyK0zpZS
         fdi7cgHC4BZmcRIZxodXnM64wYPmbLWeYqhwoOCUETIo4Yl9BBdV9Yzn1joG5bT63xnu
         oWYqSHPf4pWbNXroofQYgSsDwqkEcAwVUbDP0EtwUmHqHqJlC6WE76dVMaaxv+pE0fDZ
         F1xg==
X-Forwarded-Encrypted: i=1; AJvYcCUQLMqfBkXIlMcRG/i5yTWEJ9iCacvkvkyjssHKKLPQZEi95Z/7/P3d/5D+ZD1C6lHhMy6bM4jExXx5D4nGbYDi7acCtvmesCcDLqvxgIW8
X-Gm-Message-State: AOJu0Yz2THkNPO04OZEG+ONDSg0VKnnDHHW2mPfABuw2kMyzlJ8vLl6T
	U/11DEWB6lHRgbKk1/NBmCjLzP5zoDomi7/vfrCFAoZulYj3ZCbTY5Sp2smBZMU=
X-Google-Smtp-Source: AGHT+IFzsKFwkm6/PUuNhQXzmzQ00xQ91ajZbuZqPe2v3cVZIJEAYjZNYyL+734jbdq5mZCUaY5k7A==
X-Received: by 2002:a05:600c:190a:b0:412:b15c:9769 with SMTP id j10-20020a05600c190a00b00412b15c9769mr174697wmq.25.1709142836667;
        Wed, 28 Feb 2024 09:53:56 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c500c00b00412abfb0ed0sm2880142wmr.0.2024.02.28.09.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 09:53:56 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH 2/2] riscv: Fix text patching when IPI are used
Date: Wed, 28 Feb 2024 18:51:49 +0100
Message-Id: <20240228175149.162646-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228175149.162646-1-alexghiti@rivosinc.com>
References: <20240228175149.162646-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_095358_813156_77CD3F97 
X-CRM114-Status: GOOD (  17.75  )
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

Rm9yIG5vdywgd2UgdXNlIHN0b3BfbWFjaGluZSgpIHRvIHBhdGNoIHRoZSB0ZXh0IGFuZCB3aGVu
IHdlIHVzZSBJUElzIGZvcgpyZW1vdGUgaWNhY2hlIGZsdXNoZXMgKHdoaWNoIGlzIGVtaXR0ZWQg
aW4gcGF0Y2hfdGV4dF9ub3N5bmMoKSksIHRoZSBzeXN0ZW0KaGFuZ3MuCgpTbyBpbnN0ZWFkLCBt
YWtlIHN1cmUgZXZlcnkgY3B1IGV4ZWN1dGVzIHRoZSBzdG9wX21hY2hpbmUoKSBwYXRjaGluZwpm
dW5jdGlvbiBhbmQgZW1pdCBhIGxvY2FsIGljYWNoZSBmbHVzaCB0aGVyZS4KCkNvLWRldmVsb3Bl
ZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BhdGNoLmggfCAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyAgICAgfCA0MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRj
aC5jICAgICAgfCAxOCArKysrKysrKystLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0
aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wYXRjaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oCmluZGV4IGU4OGI1
MmQzOWVhYy4uOWY1ZDZlMTRjNDA1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BhdGNoLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oCkBAIC02LDYgKzYs
NyBAQAogI2lmbmRlZiBfQVNNX1JJU0NWX1BBVENIX0gKICNkZWZpbmUgX0FTTV9SSVNDVl9QQVRD
SF9ICiAKK2ludCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24s
IHNpemVfdCBsZW4pOwogaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZv
aWQgKmluc25zLCBzaXplX3QgbGVuKTsKIGludCBwYXRjaF90ZXh0X3NldF9ub3N5bmModm9pZCAq
YWRkciwgdTggYywgc2l6ZV90IGxlbik7CiBpbnQgcGF0Y2hfdGV4dCh2b2lkICphZGRyLCB1MzIg
Kmluc25zLCBpbnQgbmluc25zKTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFj
ZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKaW5kZXggZjVhYTI0ZDllMWMxLi41NjU0
OTY2YzRlN2QgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCkBAIC04LDYgKzgsNyBAQAogI2luY2x1ZGUgPGxpbnV4
L2Z0cmFjZS5oPgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC9t
ZW1vcnkuaD4KKyNpbmNsdWRlIDxsaW51eC9zdG9wX21hY2hpbmUuaD4KICNpbmNsdWRlIDxhc20v
Y2FjaGVmbHVzaC5oPgogI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgogCkBAIC03NSw4ICs3Niw3IEBA
IHN0YXRpYyBpbnQgX19mdHJhY2VfbW9kaWZ5X2NhbGwodW5zaWduZWQgbG9uZyBob29rX3Bvcywg
dW5zaWduZWQgbG9uZyB0YXJnZXQsCiAJCW1ha2VfY2FsbF90MChob29rX3BvcywgdGFyZ2V0LCBj
YWxsKTsKIAogCS8qIFJlcGxhY2UgdGhlIGF1aXBjLWphbHIgcGFpciBhdCBvbmNlLiBSZXR1cm4g
LUVQRVJNIG9uIHdyaXRlIGVycm9yLiAqLwotCWlmIChwYXRjaF90ZXh0X25vc3luYwotCSAgICAo
KHZvaWQgKilob29rX3BvcywgZW5hYmxlID8gY2FsbCA6IG5vcHMsIE1DT1VOVF9JTlNOX1NJWkUp
KQorCWlmIChwYXRjaF9pbnNuX3dyaXRlKCh2b2lkICopaG9va19wb3MsIGVuYWJsZSA/IGNhbGwg
OiBub3BzLCBNQ09VTlRfSU5TTl9TSVpFKSkKIAkJcmV0dXJuIC1FUEVSTTsKIAogCXJldHVybiAw
OwpAQCAtODgsNyArODgsNyBAQCBpbnQgZnRyYWNlX21ha2VfY2FsbChzdHJ1Y3QgZHluX2Z0cmFj
ZSAqcmVjLCB1bnNpZ25lZCBsb25nIGFkZHIpCiAKIAltYWtlX2NhbGxfdDAocmVjLT5pcCwgYWRk
ciwgY2FsbCk7CiAKLQlpZiAocGF0Y2hfdGV4dF9ub3N5bmMoKHZvaWQgKilyZWMtPmlwLCBjYWxs
LCBNQ09VTlRfSU5TTl9TSVpFKSkKKwlpZiAocGF0Y2hfaW5zbl93cml0ZSgodm9pZCAqKXJlYy0+
aXAsIGNhbGwsIE1DT1VOVF9JTlNOX1NJWkUpKQogCQlyZXR1cm4gLUVQRVJNOwogCiAJcmV0dXJu
IDA7CkBAIC05OSw3ICs5OSw3IEBAIGludCBmdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAq
bW9kLCBzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjLAogewogCXVuc2lnbmVkIGludCBub3BzWzJdID0g
e05PUDQsIE5PUDR9OwogCi0JaWYgKHBhdGNoX3RleHRfbm9zeW5jKCh2b2lkICopcmVjLT5pcCwg
bm9wcywgTUNPVU5UX0lOU05fU0laRSkpCisJaWYgKHBhdGNoX2luc25fd3JpdGUoKHZvaWQgKily
ZWMtPmlwLCBub3BzLCBNQ09VTlRfSU5TTl9TSVpFKSkKIAkJcmV0dXJuIC1FUEVSTTsKIAogCXJl
dHVybiAwOwpAQCAtMTM0LDYgKzEzNCw0MCBAQCBpbnQgZnRyYWNlX3VwZGF0ZV9mdHJhY2VfZnVu
YyhmdHJhY2VfZnVuY190IGZ1bmMpCiAKIAlyZXR1cm4gcmV0OwogfQorCitzdHJ1Y3QgZnRyYWNl
X21vZGlmeV9wYXJhbSB7CisJaW50IGNvbW1hbmQ7CisJYXRvbWljX3QgY3B1X2NvdW50OworfTsK
Kworc3RhdGljIGludCBfX2Z0cmFjZV9tb2RpZnlfY29kZSh2b2lkICpkYXRhKQoreworCXN0cnVj
dCBmdHJhY2VfbW9kaWZ5X3BhcmFtICpwYXJhbSA9IGRhdGE7CisKKwlpZiAoYXRvbWljX2luY19y
ZXR1cm4oJnBhcmFtLT5jcHVfY291bnQpID09IG51bV9vbmxpbmVfY3B1cygpKSB7CisJCWZ0cmFj
ZV9tb2RpZnlfYWxsX2NvZGUocGFyYW0tPmNvbW1hbmQpOworCQkvKgorCQkgKiBNYWtlIHN1cmUg
dGhlIHBhdGNoaW5nIHN0b3JlIGlzIGVmZmVjdGl2ZSAqYmVmb3JlKiB3ZQorCQkgKiBpbmNyZW1l
bnQgdGhlIGNvdW50ZXIgd2hpY2ggcmVsZWFzZXMgYWxsIHdhaXRpbmcgY3B1cworCQkgKiBieSB1
c2luZyB0aGUgcmVsZWFzZSB2ZXJzaW9uIG9mIGF0b21pYyBpbmNyZW1lbnQuCisJCSAqLworCQlh
dG9taWNfaW5jX3JldHVybl9yZWxlYXNlKCZwYXJhbS0+Y3B1X2NvdW50KTsKKwl9IGVsc2Ugewor
CQl3aGlsZSAoYXRvbWljX3JlYWQoJnBhcmFtLT5jcHVfY291bnQpIDw9IG51bV9vbmxpbmVfY3B1
cygpKQorCQkJY3B1X3JlbGF4KCk7CisJfQorCisJbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpOwor
CisJcmV0dXJuIDA7Cit9CisKK3ZvaWQgYXJjaF9mdHJhY2VfdXBkYXRlX2NvZGUoaW50IGNvbW1h
bmQpCit7CisJc3RydWN0IGZ0cmFjZV9tb2RpZnlfcGFyYW0gcGFyYW0gPSB7IGNvbW1hbmQsIEFU
T01JQ19JTklUKDApIH07CisKKwlzdG9wX21hY2hpbmUoX19mdHJhY2VfbW9kaWZ5X2NvZGUsICZw
YXJhbSwgY3B1X29ubGluZV9tYXNrKTsKK30KICNlbmRpZgogCiAjaWZkZWYgQ09ORklHX0RZTkFN
SUNfRlRSQUNFX1dJVEhfUkVHUwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2gu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKaW5kZXggMGI1YzE2ZGZlM2Y0Li44MmQ4NTA4
Yzc2NWIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcGF0Y2guYwpAQCAtMTg4LDcgKzE4OCw3IEBAIGludCBwYXRjaF90ZXh0X3Nl
dF9ub3N5bmModm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikKIH0KIE5PS1BST0JFX1NZTUJP
TChwYXRjaF90ZXh0X3NldF9ub3N5bmMpOwogCi1zdGF0aWMgaW50IHBhdGNoX2luc25fd3JpdGUo
dm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKK2ludCBwYXRjaF9pbnNu
X3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCiB7CiAJc2l6
ZV90IHBhdGNoZWQgPSAwOwogCXNpemVfdCBzaXplOwpAQCAtMjExLDExICsyMTEsOSBAQCBOT0tQ
Uk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93cml0ZSk7CiAKIGludCBwYXRjaF90ZXh0X25vc3luYyh2
b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNucywgc2l6ZV90IGxlbikKIHsKLQl1MzIgKnRwID0g
YWRkcjsKIAlpbnQgcmV0OwogCi0JcmV0ID0gcGF0Y2hfaW5zbl93cml0ZSh0cCwgaW5zbnMsIGxl
bik7Ci0KKwlyZXQgPSBwYXRjaF9pbnNuX3dyaXRlKGFkZHIsIGluc25zLCBsZW4pOwogCWlmICgh
cmV0KQogCQlmbHVzaF9pY2FjaGVfcmFuZ2UoKHVpbnRwdHJfdCkgdHAsICh1aW50cHRyX3QpIHRw
ICsgbGVuKTsKIApAQCAtMjMyLDE1ICsyMzAsMjEgQEAgc3RhdGljIGludCBwYXRjaF90ZXh0X2Ni
KHZvaWQgKmRhdGEpCiAJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZwYXRjaC0+Y3B1X2NvdW50KSA9
PSBudW1fb25saW5lX2NwdXMoKSkgewogCQlmb3IgKGkgPSAwOyByZXQgPT0gMCAmJiBpIDwgcGF0
Y2gtPm5pbnNuczsgaSsrKSB7CiAJCQlsZW4gPSBHRVRfSU5TTl9MRU5HVEgocGF0Y2gtPmluc25z
W2ldKTsKLQkJCXJldCA9IHBhdGNoX3RleHRfbm9zeW5jKHBhdGNoLT5hZGRyICsgaSAqIGxlbiwK
LQkJCQkJCSZwYXRjaC0+aW5zbnNbaV0sIGxlbik7CisJCQlyZXQgPSBwYXRjaF9pbnNuX3dyaXRl
KHBhdGNoLT5hZGRyICsgaSAqIGxlbiwgJnBhdGNoLT5pbnNuc1tpXSwgbGVuKTsKIAkJfQotCQlh
dG9taWNfaW5jKCZwYXRjaC0+Y3B1X2NvdW50KTsKKwkJLyoKKwkJICogTWFrZSBzdXJlIHRoZSBw
YXRjaGluZyBzdG9yZSBpcyBlZmZlY3RpdmUgKmJlZm9yZSogd2UKKwkJICogaW5jcmVtZW50IHRo
ZSBjb3VudGVyIHdoaWNoIHJlbGVhc2VzIGFsbCB3YWl0aW5nIGNwdXMKKwkJICogYnkgdXNpbmcg
dGhlIHJlbGVhc2UgdmVyc2lvbiBvZiBhdG9taWMgaW5jcmVtZW50LgorCQkgKi8KKwkJYXRvbWlj
X2luY19yZXR1cm5fcmVsZWFzZSgmcGF0Y2gtPmNwdV9jb3VudCk7CiAJfSBlbHNlIHsKIAkJd2hp
bGUgKGF0b21pY19yZWFkKCZwYXRjaC0+Y3B1X2NvdW50KSA8PSBudW1fb25saW5lX2NwdXMoKSkK
IAkJCWNwdV9yZWxheCgpOwogCX0KIAorCWxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKKwogCXJl
dHVybiByZXQ7CiB9CiBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdGV4dF9jYik7Ci0tIAoyLjM5LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
