Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C48AE7C4D4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+k4vTKcX+iohEJ9z8yQOQJ9xDchSgLVR53MRS6SO/j8=; b=AmIoxLtqRszuGd
	One8DqIaQUk4ncV7rQSNt853+Ij82gjbiH7DgYBzFsqR3t6VdK3lO2mgO+XYqtsZDyPnUvHsoPL7M
	xuEUH/HEtMWmuNC//iIyGh+9GT6Xe/sbpX1rgzVXjWSGr04fc1SfFvIev2+snCDo19D0LSc0rtz0J
	6UFxxqEdJgdDkB7Z949avg2WOFC20lc1oPl0MOSiSvrfJ6Iq6M2X14KFrXINgpwpFth96JzNNjjiB
	kVr9MxvcEEuSMaRZIfZd5kDBLRmYDIYfGAse046bKAZR59TBsWmSTpJd+jV2F+itw6btdu93xKhtB
	5z8xW+9BdxCHLt2fYclA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a6-000Jdp-0I;
	Wed, 04 Oct 2023 15:14:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a2-000JZj-1X
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:14:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so4850795e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696432469; x=1697037269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcEUkxfHErwG8tq/zMZua9Au/w+pS7+db1U/fyhODns=;
        b=nV2OypXdOwsOi5CJ9ClocDXwkPZIPSBkauQNz1F/8tYOOHW4th79CVvvfMsDdsTpZY
         edvl+WrUwqU4QA33PAycmXGYSqnn30pyKD5YCtdw5gd2DL/N2sXuNfwfC7fQm5faUE4k
         TRTpfsEx0wnWKEIFAx9qxOYgHxaRPQ16m+YS7qRyHsMxnIe0LSa6yHnspSw4tz+WfkEC
         Q2G5RO+vfmhgOGloBOfqFpCEROOE8w1lmpe3fVC2koWNZlDDg/ntlCWiiQazk/rby9I9
         ++vnPXbk9Iew0fzvk+6O11My3NhK3gVPXBBsKw/fA3fPfeDF6VGWpqDvVxHmkofD+ImE
         1PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432469; x=1697037269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcEUkxfHErwG8tq/zMZua9Au/w+pS7+db1U/fyhODns=;
        b=G65jph2DHI8kR318buZIka1ZfbqbBJ1aLy8q67JIbzWDQXbiaLuiJdsezuta5O0n3T
         /HhNgA2mY07lUZlIFMO/4N0aNXioI8InDhMhnuZRqob6H9rC8gqqcQyHG6nOwvBd4gZh
         /T5vUPnxtZEMY8W8fDKSpgms0R09g9lAWVPdUmgiRgMf8x7Vt3ZRN/G6jGql2ekzycND
         a+PvLOFacyWgq5D9vpoAng3X8k4aS6OSGzW4zaZlGjvIc9P34j6y1N1bnzvYQSy7hNuf
         b0PwFX9v00mHr6Rja4afn/bnyqh0Z3U1tXOZ0fzy/TVPUTn61nn9SryzsNj6aAjnV01s
         6cXQ==
X-Gm-Message-State: AOJu0YzzWWNvhOVtEg5eeV3mNoCBC15cNTXzhTGF/4cpgjmZB1jo70St
	faqgdbVZJ/XsVSgWbFXKcGdc0Q==
X-Google-Smtp-Source: AGHT+IHFWUl+0+sO6traUtAHPwk77+gDj/OtZoEyAvGn4ZMrYs4/3PFND9HQ+2oEvAhOhQjndgqGJA==
X-Received: by 2002:a05:600c:1d18:b0:404:72f9:d59a with SMTP id l24-20020a05600c1d1800b0040472f9d59amr2613227wms.0.1696432468784;
        Wed, 04 Oct 2023 08:14:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b00402f7b50517sm1768764wmd.40.2023.10.04.08.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:14:28 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 5/8] riscv: add support for sysctl unaligned_enabled control
Date: Wed,  4 Oct 2023 17:14:02 +0200
Message-ID: <20231004151405.521596-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004151405.521596-1-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_081430_515586_78CE16CE 
X-CRM114-Status: GOOD (  10.38  )
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

VGhpcyBzeXNjdGwgdHVuaW5nIG9wdGlvbiBhbGxvd3MgdGhlIHVzZXIgdG8gZGlzYWJsZSBtaXNh
bGlnbmVkIGFjY2VzcwpoYW5kbGluZyBnbG9iYWxseSBvbiB0aGUgc3lzdGVtLiBUaGlzIHdpbGwg
YWxzbyBiZSB1c2VkIGJ5IG1pc2FsaWduZWQKZGV0ZWN0aW9uIGNvZGUgdG8gdGVtcG9yYXJpbHkg
ZGlzYWJsZSBtaXNhbGlnbmVkIGFjY2VzcyBoYW5kbGluZy4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgICAgICAgICAgfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWdu
ZWQuYyB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXgg
NmUxNjczNThhODk3Li4xMzEzZjgzYmIwY2IgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZp
ZworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTYzOCw2ICs2MzgsNyBAQCBjb25maWcgVEhS
RUFEX1NJWkVfT1JERVIKIAogY29uZmlnIFJJU0NWX01JU0FMSUdORUQKIAlib29sICJTdXBwb3J0
IG1pc2FsaWduZWQgbG9hZC9zdG9yZSB0cmFwcyBmb3Iga2VybmVsIGFuZCB1c2Vyc3BhY2UiCisJ
c2VsZWN0IFNZU0NUTF9BUkNIX1VOQUxJR05fQUxMT1cKIAlkZWZhdWx0IHkKIAloZWxwCiAJICBT
YXkgWSBoZXJlIGlmIHlvdSB3YW50IHRoZSBrZXJuZWwgdG8gZW1iZWQgc3VwcG9ydCBmb3IgbWlz
YWxpZ25lZApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IDA0MWZkMmRiZDk1
NS4uYjVmYjFmZjA3OGUzIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0z
OTYsNiArMzk2LDkgQEAgdW5pb24gcmVnX2RhdGEgewogCXU2NCBkYXRhX3U2NDsKIH07CiAKKy8q
IHN5c2N0bCBob29rcyAqLworaW50IHVuYWxpZ25lZF9lbmFibGVkIF9fcmVhZF9tb3N0bHkgPSAx
OwkvKiBFbmFibGVkIGJ5IGRlZmF1bHQgKi8KKwogaW50IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQo
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CiAJdW5pb24gcmVnX2RhdGEgdmFsOwpAQCAtNDA2LDYg
KzQwOSw5IEBAIGludCBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdz
KQogCiAJcGVyZl9zd19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJl
Z3MsIGFkZHIpOwogCisJaWYgKCF1bmFsaWduZWRfZW5hYmxlZCkKKwkJcmV0dXJuIC0xOworCiAJ
aWYgKGdldF9pbnNuKHJlZ3MsIGVwYywgJmluc24pKQogCQlyZXR1cm4gLTE7CiAKQEAgLTUwMiw2
ICs1MDgsOSBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCiAKIAlwZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwg
cmVncywgYWRkcik7CiAKKwlpZiAoIXVuYWxpZ25lZF9lbmFibGVkKQorCQlyZXR1cm4gLTE7CisK
IAlpZiAoZ2V0X2luc24ocmVncywgZXBjLCAmaW5zbikpCiAJCXJldHVybiAtMTsKIAotLSAKMi40
Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
