Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD9FC54798
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 12:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yh0DnDO7F5e+vfJXdizu29KtPGXr9gTcbvD5U/p4Byk=; b=GNgW2Fi6bgXPAv
	6Nfa3FBWdXgp75hX0tMEwYO1Be1uFBv+PfZI3uDD9I1jmDAvxJGIYH6PKoZch1Nynt4/nKfXIhiKc
	970+rEFwYlmStBkZ6fMXXmmaWF+gGb9YQrg4V7qNEGP96Fdqpu4w3U1BfOlS5hhAYjOKl2AMyG+Kh
	4ZGaUj4Np/t09jrVeov9JOlnNH9S+YIuODzg36/fwD8RH4pRclk3XnjTchAtkKIGwoPqskzZ9xats
	yxxmK2XkILsaQR1t2ImvfHimlo0F2V1spKnxFzxc7GlmT4tGsxkDrKGD7TSYg+LTqmRscZHR9PFAM
	MPvD2IzwwXVHITDr1oVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffHd-0000000DT3R-1aY8;
	Thu, 29 Feb 2024 12:13:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rffHa-0000000DT1g-3dNz
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 12:13:04 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33d0a7f2424so559739f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 04:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709208781; x=1709813581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXXIgfsi20sfR9R1Bl8KEYowaEbmYUeJCudNzsi7ozU=;
        b=SUq016wdRhO40H4TPkAxxaplDgxLu5NLzuJi2eqiELlDuEIcly5uuw94p2kFMS1dmJ
         ID2xuEYH0qVp1icKqchg+naeA2M8B1AQPJca5BaPRkLl9eMzhmruTdJgmDL8w5AVAty3
         4SWgpEicR9lC6R+3IyiebjCnSD3QaSGI/t7en309jL3+MWP2CJ4zeD2M/VKSYevQs19T
         bVnMXoNE+Jvw0+uISY/l496gxqqgu5uFTkF/E9Cu1Cy8F4howEXImxos2N219TwKo/H2
         1WQJG5wHQymg8er2OQZpiu+8D41WSCVNnnS5Zla4RMm5dXqWp2gz1Bs9KsUSeFhASHgd
         9nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208781; x=1709813581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXXIgfsi20sfR9R1Bl8KEYowaEbmYUeJCudNzsi7ozU=;
        b=Xf7Edazjqn25f8wr8YRIIZlwJS+t4DL/y/56zr37OggPwiIluAnpG/piLDhIvpNRUf
         nmxbS6MP/XBJAvbkjYp3MC2Q6KgE+UveMAhGERq7kewofgtOxFo4xSe9SHlGcjOi2+re
         hh+1cUBgPxft4UiaO0OZw2fLTLh/KI1bwKv4iHS7b7TfcMyHo1kAnl8ocdI5lmqxoeDL
         kdy6KCHN0MP36jGtMCJ7YFY95McYUIstZoWJGY3M9+NG41IHROTSvK7XyRWeH7gAEJ7L
         sal874Me/LUhtVuDxfkofmmHqIEqmE/YC6MUtPa1Bu3kPPQhXIZqKbvlQK9/CDgctPTL
         mLYg==
X-Forwarded-Encrypted: i=1; AJvYcCV0n+sktBfSCJ627np4cz7StkXrUrOmQdg9te8QAS96pDFZbCpN/obl/5z7pYcXJ/c2uNYOLNwlVbzR14XAYrun57u5H7ROxvXrj8JVBrZm
X-Gm-Message-State: AOJu0YwcD/H67DrWPHZDICOSvOmul1Pv17PXn9HnqgIIyj9r7vP7IR4R
	YGaIHJ5ddJLsVKtLEQjFvM3NOpkrgk66iIpli4G1s819nRjFwguj7BJLyBJdSRQ=
X-Google-Smtp-Source: AGHT+IFT0YxcYDi/LR7DsMQ2nyJ8fcVSxOS6c8osyWaid2ac8gnJzVJrwYje6jjFdkyZbXRi/WxigQ==
X-Received: by 2002:adf:f3c6:0:b0:33b:62c0:6181 with SMTP id g6-20020adff3c6000000b0033b62c06181mr1262715wrp.42.1709208780842;
        Thu, 29 Feb 2024 04:13:00 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r3-20020adfca83000000b0033d2ae84fafsm1605970wrh.52.2024.02.29.04.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:13:00 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 2/2] riscv: Fix text patching when IPI are used
Date: Thu, 29 Feb 2024 13:10:56 +0100
Message-Id: <20240229121056.203419-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229121056.203419-1-alexghiti@rivosinc.com>
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_041302_939114_C24320CE 
X-CRM114-Status: GOOD (  18.17  )
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
YWtlIHN1cmUgZXZlcnkgQ1BVIGV4ZWN1dGVzIHRoZSBzdG9wX21hY2hpbmUoKSBwYXRjaGluZwpm
dW5jdGlvbiBhbmQgZW1pdCBhIGxvY2FsIGljYWNoZSBmbHVzaCB0aGVyZS4KCkNvLWRldmVsb3Bl
ZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJlYSBQYXJy
aSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bh
dGNoLmggfCAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYyAgICAgfCA0NCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jICAg
ICAgfCAxNiArKysrKysrKystLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRj
aC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oCmluZGV4IGU4OGI1MmQzOWVhYy4u
OWY1ZDZlMTRjNDA1IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhdGNoLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oCkBAIC02LDYgKzYsNyBAQAogI2lm
bmRlZiBfQVNNX1JJU0NWX1BBVENIX0gKICNkZWZpbmUgX0FTTV9SSVNDVl9QQVRDSF9ICiAKK2lu
dCBwYXRjaF9pbnNuX3dyaXRlKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBs
ZW4pOwogaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc25z
LCBzaXplX3QgbGVuKTsKIGludCBwYXRjaF90ZXh0X3NldF9ub3N5bmModm9pZCAqYWRkciwgdTgg
Yywgc2l6ZV90IGxlbik7CiBpbnQgcGF0Y2hfdGV4dCh2b2lkICphZGRyLCB1MzIgKmluc25zLCBp
bnQgbmluc25zKTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKaW5kZXggZjVhYTI0ZDllMWMxLi40ZjQ5ODdhNmQ4M2Qg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2Z0cmFjZS5jCkBAIC04LDYgKzgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Z0cmFjZS5o
PgogI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KICNpbmNsdWRlIDxsaW51eC9tZW1vcnkuaD4K
KyNpbmNsdWRlIDxsaW51eC9zdG9wX21hY2hpbmUuaD4KICNpbmNsdWRlIDxhc20vY2FjaGVmbHVz
aC5oPgogI2luY2x1ZGUgPGFzbS9wYXRjaC5oPgogCkBAIC03NSw4ICs3Niw3IEBAIHN0YXRpYyBp
bnQgX19mdHJhY2VfbW9kaWZ5X2NhbGwodW5zaWduZWQgbG9uZyBob29rX3BvcywgdW5zaWduZWQg
bG9uZyB0YXJnZXQsCiAJCW1ha2VfY2FsbF90MChob29rX3BvcywgdGFyZ2V0LCBjYWxsKTsKIAog
CS8qIFJlcGxhY2UgdGhlIGF1aXBjLWphbHIgcGFpciBhdCBvbmNlLiBSZXR1cm4gLUVQRVJNIG9u
IHdyaXRlIGVycm9yLiAqLwotCWlmIChwYXRjaF90ZXh0X25vc3luYwotCSAgICAoKHZvaWQgKilo
b29rX3BvcywgZW5hYmxlID8gY2FsbCA6IG5vcHMsIE1DT1VOVF9JTlNOX1NJWkUpKQorCWlmIChw
YXRjaF9pbnNuX3dyaXRlKCh2b2lkICopaG9va19wb3MsIGVuYWJsZSA/IGNhbGwgOiBub3BzLCBN
Q09VTlRfSU5TTl9TSVpFKSkKIAkJcmV0dXJuIC1FUEVSTTsKIAogCXJldHVybiAwOwpAQCAtODgs
NyArODgsNyBAQCBpbnQgZnRyYWNlX21ha2VfY2FsbChzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjLCB1
bnNpZ25lZCBsb25nIGFkZHIpCiAKIAltYWtlX2NhbGxfdDAocmVjLT5pcCwgYWRkciwgY2FsbCk7
CiAKLQlpZiAocGF0Y2hfdGV4dF9ub3N5bmMoKHZvaWQgKilyZWMtPmlwLCBjYWxsLCBNQ09VTlRf
SU5TTl9TSVpFKSkKKwlpZiAocGF0Y2hfaW5zbl93cml0ZSgodm9pZCAqKXJlYy0+aXAsIGNhbGws
IE1DT1VOVF9JTlNOX1NJWkUpKQogCQlyZXR1cm4gLUVQRVJNOwogCiAJcmV0dXJuIDA7CkBAIC05
OSw3ICs5OSw3IEBAIGludCBmdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1vZHVsZSAqbW9kLCBzdHJ1
Y3QgZHluX2Z0cmFjZSAqcmVjLAogewogCXVuc2lnbmVkIGludCBub3BzWzJdID0ge05PUDQsIE5P
UDR9OwogCi0JaWYgKHBhdGNoX3RleHRfbm9zeW5jKCh2b2lkICopcmVjLT5pcCwgbm9wcywgTUNP
VU5UX0lOU05fU0laRSkpCisJaWYgKHBhdGNoX2luc25fd3JpdGUoKHZvaWQgKilyZWMtPmlwLCBu
b3BzLCBNQ09VTlRfSU5TTl9TSVpFKSkKIAkJcmV0dXJuIC1FUEVSTTsKIAogCXJldHVybiAwOwpA
QCAtMTM0LDYgKzEzNCw0MiBAQCBpbnQgZnRyYWNlX3VwZGF0ZV9mdHJhY2VfZnVuYyhmdHJhY2Vf
ZnVuY190IGZ1bmMpCiAKIAlyZXR1cm4gcmV0OwogfQorCitzdHJ1Y3QgZnRyYWNlX21vZGlmeV9w
YXJhbSB7CisJaW50IGNvbW1hbmQ7CisJYXRvbWljX3QgY3B1X2NvdW50OworfTsKKworc3RhdGlj
IGludCBfX2Z0cmFjZV9tb2RpZnlfY29kZSh2b2lkICpkYXRhKQoreworCXN0cnVjdCBmdHJhY2Vf
bW9kaWZ5X3BhcmFtICpwYXJhbSA9IGRhdGE7CisKKwlpZiAoYXRvbWljX2luY19yZXR1cm4oJnBh
cmFtLT5jcHVfY291bnQpID09IG51bV9vbmxpbmVfY3B1cygpKSB7CisJCWZ0cmFjZV9tb2RpZnlf
YWxsX2NvZGUocGFyYW0tPmNvbW1hbmQpOworCQkvKgorCQkgKiBNYWtlIHN1cmUgdGhlIHBhdGNo
aW5nIHN0b3JlIGlzIGVmZmVjdGl2ZSAqYmVmb3JlKiB3ZQorCQkgKiBpbmNyZW1lbnQgdGhlIGNv
dW50ZXIgd2hpY2ggcmVsZWFzZXMgYWxsIHdhaXRpbmcgQ1BVcworCQkgKiBieSB1c2luZyB0aGUg
cmVsZWFzZSB2YXJpYW50IG9mIGF0b21pYyBpbmNyZW1lbnQuIFRoZQorCQkgKiByZWxlYXNlIHBh
aXJzIHdpdGggdGhlIGNhbGwgdG8gbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpCisJCSAqIG9uIHRo
ZSB3YWl0aW5nIENQVS4KKwkJICovCisJCWF0b21pY19pbmNfcmV0dXJuX3JlbGVhc2UoJnBhcmFt
LT5jcHVfY291bnQpOworCX0gZWxzZSB7CisJCXdoaWxlIChhdG9taWNfcmVhZCgmcGFyYW0tPmNw
dV9jb3VudCkgPD0gbnVtX29ubGluZV9jcHVzKCkpCisJCQljcHVfcmVsYXgoKTsKKwl9CisKKwls
b2NhbF9mbHVzaF9pY2FjaGVfYWxsKCk7CisKKwlyZXR1cm4gMDsKK30KKwordm9pZCBhcmNoX2Z0
cmFjZV91cGRhdGVfY29kZShpbnQgY29tbWFuZCkKK3sKKwlzdHJ1Y3QgZnRyYWNlX21vZGlmeV9w
YXJhbSBwYXJhbSA9IHsgY29tbWFuZCwgQVRPTUlDX0lOSVQoMCkgfTsKKworCXN0b3BfbWFjaGlu
ZShfX2Z0cmFjZV9tb2RpZnlfY29kZSwgJnBhcmFtLCBjcHVfb25saW5lX21hc2spOworfQogI2Vu
ZGlmCiAKICNpZmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTCmRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwpp
bmRleCAwYjVjMTZkZmUzZjQuLjlhMWJjZTFhZGY1YSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvcGF0Y2guYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCkBAIC0xODgsNyAr
MTg4LDcgQEAgaW50IHBhdGNoX3RleHRfc2V0X25vc3luYyh2b2lkICphZGRyLCB1OCBjLCBzaXpl
X3QgbGVuKQogfQogTk9LUFJPQkVfU1lNQk9MKHBhdGNoX3RleHRfc2V0X25vc3luYyk7CiAKLXN0
YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBz
aXplX3QgbGVuKQoraW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAq
aW5zbiwgc2l6ZV90IGxlbikKIHsKIAlzaXplX3QgcGF0Y2hlZCA9IDA7CiAJc2l6ZV90IHNpemU7
CkBAIC0yMzIsMTUgKzIzMiwyMyBAQCBzdGF0aWMgaW50IHBhdGNoX3RleHRfY2Iodm9pZCAqZGF0
YSkKIAlpZiAoYXRvbWljX2luY19yZXR1cm4oJnBhdGNoLT5jcHVfY291bnQpID09IG51bV9vbmxp
bmVfY3B1cygpKSB7CiAJCWZvciAoaSA9IDA7IHJldCA9PSAwICYmIGkgPCBwYXRjaC0+bmluc25z
OyBpKyspIHsKIAkJCWxlbiA9IEdFVF9JTlNOX0xFTkdUSChwYXRjaC0+aW5zbnNbaV0pOwotCQkJ
cmV0ID0gcGF0Y2hfdGV4dF9ub3N5bmMocGF0Y2gtPmFkZHIgKyBpICogbGVuLAotCQkJCQkJJnBh
dGNoLT5pbnNuc1tpXSwgbGVuKTsKKwkJCXJldCA9IHBhdGNoX2luc25fd3JpdGUocGF0Y2gtPmFk
ZHIgKyBpICogbGVuLCAmcGF0Y2gtPmluc25zW2ldLCBsZW4pOwogCQl9Ci0JCWF0b21pY19pbmMo
JnBhdGNoLT5jcHVfY291bnQpOworCQkvKgorCQkgKiBNYWtlIHN1cmUgdGhlIHBhdGNoaW5nIHN0
b3JlIGlzIGVmZmVjdGl2ZSAqYmVmb3JlKiB3ZQorCQkgKiBpbmNyZW1lbnQgdGhlIGNvdW50ZXIg
d2hpY2ggcmVsZWFzZXMgYWxsIHdhaXRpbmcgQ1BVcworCQkgKiBieSB1c2luZyB0aGUgcmVsZWFz
ZSB2YXJpYW50IG9mIGF0b21pYyBpbmNyZW1lbnQuIFRoZQorCQkgKiByZWxlYXNlIHBhaXJzIHdp
dGggdGhlIGNhbGwgdG8gbG9jYWxfZmx1c2hfaWNhY2hlX2FsbCgpCisJCSAqIG9uIHRoZSB3YWl0
aW5nIENQVS4KKwkJICovCisJCWF0b21pY19pbmNfcmV0dXJuX3JlbGVhc2UoJnBhdGNoLT5jcHVf
Y291bnQpOwogCX0gZWxzZSB7CiAJCXdoaWxlIChhdG9taWNfcmVhZCgmcGF0Y2gtPmNwdV9jb3Vu
dCkgPD0gbnVtX29ubGluZV9jcHVzKCkpCiAJCQljcHVfcmVsYXgoKTsKIAl9CiAKKwlsb2NhbF9m
bHVzaF9pY2FjaGVfYWxsKCk7CisKIAlyZXR1cm4gcmV0OwogfQogTk9LUFJPQkVfU1lNQk9MKHBh
dGNoX3RleHRfY2IpOwotLSAKMi4zOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
