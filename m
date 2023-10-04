Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AD4E7C4D8
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trsq7sprO0GSksypb8iXNNW4eqldlVFuq5xmCuZgY80=; b=fHkJbFvxnFAeDI
	dpuGD/lQcTJxZMSgUR68+0dw0br8sQ1ogwwpbXvXyN9RLtblQiSjU24KHDmLkuc6MvQQk7qp8/TxE
	x/utQfU4D914o9ASxIzmh+kbse/2skXG44O5n5JPNlExHxIcaidvI/iMSbSC2aAS/tGTzq9DfQcr1
	qVVFkuZUMbmLiSBOlu3mg7P0eo8Zy4xsu5FOBkcPWUQGpbzqyw+MsYsFEqCPZ/buBr9UBwey8dECq
	L8nR1Wdp9uHJezhOS5m/kO+6t8AvDYmGkVe71rDH2N/oTVdkTdfSq24+dKrbIOiW2VQFrpavGU6/a
	f0B5YTHMseZIF+LBSZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a9-000Jfr-17;
	Wed, 04 Oct 2023 15:14:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a3-000Jb8-2w
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:14:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405d70d19bcso4000545e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696432470; x=1697037270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hHT3aIZuw8Lkm84JjKEOwJDf1f+gUckXFbeev3RO+4=;
        b=0trz9s3FalC341f7SwUEL8RND11m5LWN0RXfKc7seJY8DZPw5AtcccCb+3gg93Cog+
         obgkHTiXHkyKOtpyUYkfg53tR1QkLuaDoMgKneCIDmsSuIAwhCZcTEKYsDs58RMSlSPY
         t97aShezOyhQfKOr1fgd2h9hzxNHgt6kbO3zhMyFDlKShg4vYEot6tvoXM8kKC6eRxjR
         c5iNAmAbYnt/TVnrP7AEDhkeKsZdbxezwHiTT8WsxgmbPG+Ezhfpf3IWTGEkS/VSzGkf
         pLMU34Ie9HhlwGLiSlU9nsnZfHNuIxOONyR3iovSWLvZuS8X+Hb1iXcVr72oR4nWkhv9
         1cdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432470; x=1697037270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hHT3aIZuw8Lkm84JjKEOwJDf1f+gUckXFbeev3RO+4=;
        b=eM2nRbRa0+QS6BlHdD/0mjngELec5lT5BhfFgHhZ7Ara3d8rO3Qt2lgxTW5gEal9lz
         hxUzdm7OwM1uSef2ZXvxiCEfD7gdfwGKl45xS9znCOTiS5gWeW1ML0W4ixn7PSUGnh4F
         l23rSiuKbKzHhK1q+YbUS7h247yavM9uBhSdWRzZm4UYUv+qMgN9uEtmZuUHTVSwy6+4
         O0+HBiMrq7j/ERjcA3vuTlE1CrBv9ifAMp0N/tCLJcy9THd5BPrngHXHZHGJ91yDXUYh
         m0QAe+Dyl5is911B4VfolqTXfm0Zf9dTZvdAzODoiwhMl4Q+UrisCw+YqWBsieziiyfk
         JdsA==
X-Gm-Message-State: AOJu0Yzr1Q6Dc+x4l4JAe3bZbO6us24s5vdsYVV+of8XOdcGDzh/n2iX
	N5nVjIm/kWVnEyuygFwplBo1gw==
X-Google-Smtp-Source: AGHT+IFuCL5rZpZGHOb8V9eEdhrWiMLhtRej1ZZTIPCC1LRN7LnAQEvfCLQ6zr3FZUky7FDjfHrZTw==
X-Received: by 2002:a05:600c:5192:b0:405:1ba2:4fcf with SMTP id fa18-20020a05600c519200b004051ba24fcfmr2488327wmb.4.1696432470736;
        Wed, 04 Oct 2023 08:14:30 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b00402f7b50517sm1768764wmd.40.2023.10.04.08.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:14:30 -0700 (PDT)
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
Subject: [PATCH v2 7/8] riscv: report misaligned accesses emulation to hwprobe
Date: Wed,  4 Oct 2023 17:14:04 +0200
Message-ID: <20231004151405.521596-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004151405.521596-1-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_081431_958042_6C6B428A 
X-CRM114-Status: GOOD (  18.89  )
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

aHdwcm9iZSBwcm92aWRlcyBhIHdheSB0byByZXBvcnQgaWYgbWlzYWxpZ25lZCBhY2Nlc3MgYXJl
IGVtdWxhdGVkLiBJbgpvcmRlciB0byBjb3JyZWN0bHkgcG9wdWxhdGUgdGhhdCBmZWF0dXJlLCB3
ZSBjYW4gY2hlY2sgaWYgaXQgYWN0dWFsbHkKdHJhcHMgd2hlbiBkb2luZyBhIG1pc2FsaWduZWQg
YWNjZXNzLiBUaGlzIGNhbiBiZSBjaGVja2VkIHVzaW5nIGFuCmV4Y2VwdGlvbiB0YWJsZSBlbnRy
eSB3aGljaCB3aWxsIGFjdHVhbGx5IGJlIHVzZWQgd2hlbiBhIG1pc2FsaWduZWQKYWNjZXNzIGlz
IGRvbmUgZnJvbSBrZXJuZWwgbW9kZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1
cmUuaCAgfCAxOCArKysrKysrKysKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAg
ICB8ICA0ICsrCiBhcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgICAgICAgICAgfCAgMiArLQog
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNTYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAppbmRleCBkMDM0NWJkNjU5Yzku
LmU0YWU2YWY1MTg3NiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0
dXJlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKQEAgLTMyLDQg
KzMyLDIyIEBAIGV4dGVybiBzdHJ1Y3QgcmlzY3ZfaXNhaW5mbyBoYXJ0X2lzYVtOUl9DUFVTXTsK
IAogdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzKGludCBjcHUpOwogCisjaWZkZWYgQ09ORklH
X1JJU0NWX01JU0FMSUdORUQKK2Jvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCk7Citi
b29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoaW50IGNwdSk7Cit2b2lkIHVuYWxp
Z25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOworI2Vsc2UKK3N0YXRpYyBpbmxpbmUgYm9vbCB1
bmFsaWduZWRfY3RsX2F2YWlsYWJsZSh2b2lkKQoreworCXJldHVybiBmYWxzZTsKK30KKworc3Rh
dGljIGlubGluZSBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoaW50IGNwdSkK
K3sKKwlyZXR1cm4gZmFsc2U7Cit9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCB1bmFsaWduZWRfZW11
bGF0aW9uX2ZpbmlzaCh2b2lkKSB7fQorI2VuZGlmCisKICNlbmRpZgpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCmluZGV4IDM1NmU1Njc3ZWViMS4uZmJiZGU4MDBiYzIxIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCkBAIC01NjgsNiArNTY4LDkgQEAgdm9pZCBjaGVja191bmFsaWduZWRfYWNjZXNzKGludCBj
cHUpCiAJdm9pZCAqc3JjOwogCWxvbmcgc3BlZWQgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0xPVzsKIAorCWlmIChjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGNwdSkpCisJCXJl
dHVybjsKKwogCXBhZ2UgPSBhbGxvY19wYWdlcyhHRlBfTk9XQUlULCBnZXRfb3JkZXIoTUlTQUxJ
R05FRF9CVUZGRVJfU0laRSkpOwogCWlmICghcGFnZSkgewogCQlwcl93YXJuKCJDYW4ndCBhbGxv
YyBwYWdlcyB0byBtZWFzdXJlIG1lbWNweSBwZXJmb3JtYW5jZSIpOwpAQCAtNjQ4LDYgKzY1MSw3
IEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcyhpbnQgY3B1KQogc3RhdGljIGludCBfX2lu
aXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19ib290X2NwdSh2b2lkKQogewogCWNoZWNrX3VuYWxp
Z25lZF9hY2Nlc3MoMCk7CisJdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2goKTsKIAlyZXR1cm4g
MDsKIH0KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wYm9vdC5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvc21wYm9vdC5jCmluZGV4IDFiOGRhNGU0MGE0ZC4uNWQ5ODU4ZDZhZDI2IDEw
MDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc21wYm9vdC5jCkBAIC0yNDUsOCArMjQ1LDggQEAgYXNtbGlua2FnZSBfX3Zpc2libGUg
dm9pZCBzbXBfY2FsbGluKHZvaWQpCiAJcmlzY3ZfaXBpX2VuYWJsZSgpOwogCiAJbnVtYV9hZGRf
Y3B1KGN1cnJfY3B1aWQpOwotCXNldF9jcHVfb25saW5lKGN1cnJfY3B1aWQsIDEpOwogCWNoZWNr
X3VuYWxpZ25lZF9hY2Nlc3MoY3Vycl9jcHVpZCk7CisJc2V0X2NwdV9vbmxpbmUoY3Vycl9jcHVp
ZCwgMSk7CiAKIAlpZiAoaGFzX3ZlY3RvcigpKSB7CiAJCWlmIChyaXNjdl92X3NldHVwX3ZzaXpl
KCkpCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggYjVmYjFmZjA3OGUzLi5k
OTliOTUwODRiNmMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWdu
ZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTE0LDYg
KzE0LDggQEAKICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+CiAjaW5jbHVkZSA8YXNtL2Nzci5oPgog
I2luY2x1ZGUgPGFzbS9lbnRyeS1jb21tb24uaD4KKyNpbmNsdWRlIDxhc20vaHdwcm9iZS5oPgor
I2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+CiAKICNkZWZpbmUgSU5TTl9NQVRDSF9MQgkJCTB4
MwogI2RlZmluZSBJTlNOX01BU0tfTEIJCQkweDcwN2YKQEAgLTM5Niw2ICszOTgsOCBAQCB1bmlv
biByZWdfZGF0YSB7CiAJdTY0IGRhdGFfdTY0OwogfTsKIAorc3RhdGljIGJvb2wgdW5hbGlnbmVk
X2N0bCBfX3JlYWRfbW9zdGx5OworCiAvKiBzeXNjdGwgaG9va3MgKi8KIGludCB1bmFsaWduZWRf
ZW5hYmxlZCBfX3JlYWRfbW9zdGx5ID0gMTsJLyogRW5hYmxlZCBieSBkZWZhdWx0ICovCiAKQEAg
LTQwOSw2ICs0MTMsOCBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVn
cyAqcmVncykKIAogCXBlcmZfc3dfZXZlbnQoUEVSRl9DT1VOVF9TV19BTElHTk1FTlRfRkFVTFRT
LCAxLCByZWdzLCBhZGRyKTsKIAorCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3Nw
ZWVkKSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRDsKKwogCWlmICghdW5hbGln
bmVkX2VuYWJsZWQpCiAJCXJldHVybiAtMTsKIApAQCAtNTg1LDMgKzU5MSw1MyBAQCBpbnQgaGFu
ZGxlX21pc2FsaWduZWRfc3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAlyZXR1cm4gMDsK
IH0KKworYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGludCBjcHUpCit7CisJ
bG9uZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1
KTsKKwl1bnNpZ25lZCBsb25nIHRtcF92YXIsIHRtcF92YWw7CisJYm9vbCBtaXNhbGlnbmVkX2Vt
dV9kZXRlY3RlZDsKKworCSptYXNfcHRyID0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05P
V047CisKKwlfX2FzbV9fIF9fdm9sYXRpbGVfXyAoCisJCSIgICAgICAgIlJFR19MIiAlW3RtcF0s
IDEoJVtwdHJdKVxuIgorCQk6IFt0bXBdICI9ciIgKHRtcF92YWwpIDogW3B0cl0gInIiICgmdG1w
X3ZhcikgOiAibWVtb3J5Iik7CisKKwltaXNhbGlnbmVkX2VtdV9kZXRlY3RlZCA9ICgqbWFzX3B0
ciA9PSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQpOworCS8qCisJICogSWYgdW5h
bGlnbmVkX2N0bCBpcyBhbHJlYWR5IHNldCwgdGhpcyBtZWFucyB0aGF0IHdlIGRldGVjdGVkIHRo
YXQgYWxsCisJICogQ1BVUyB1c2VzIGVtdWxhdGVkIG1pc2FsaWduZWQgYWNjZXNzIGF0IGJvb3Qg
dGltZS4gSWYgdGhhdCBjaGFuZ2VkCisJICogd2hlbiBob3RwbHVnZ2luZyB0aGUgbmV3IGNwdSwg
dGhpcyBpcyBzb21ldGhpbmcgd2UgZG9uJ3QgaGFuZGxlLgorCSAqLworCWlmICh1bmxpa2VseSh1
bmFsaWduZWRfY3RsICYmICFtaXNhbGlnbmVkX2VtdV9kZXRlY3RlZCkpIHsKKwkJcHJfY3JpdCgi
Q1BVIG1pc2FsaWduZWQgYWNjZXNzZXMgbm9uIGhvbW9nZW5lb3VzIChleHBlY3RlZCBhbGwgZW11
bGF0ZWQpXG4iKTsKKwkJd2hpbGUgKHRydWUpCisJCQljcHVfcmVsYXgoKTsKKwl9CisKKwlyZXR1
cm4gbWlzYWxpZ25lZF9lbXVfZGV0ZWN0ZWQ7Cit9CisKK3ZvaWQgX19pbml0IHVuYWxpZ25lZF9l
bXVsYXRpb25fZmluaXNoKHZvaWQpCit7CisJaW50IGNwdTsKKworCS8qCisJICogV2UgY2FuIG9u
bHkgc3VwcG9ydCBQUl9VTkFMSUdOIGNvbnRyb2xzIGlmIGFsbCBDUFVzIGhhdmUgbWlzYWxpZ25l
ZAorCSAqIGFjY2Vzc2VzIGVtdWxhdGVkIHNpbmNlIHRhc2tzIHJlcXVlc3Rpbmcgc3VjaCBjb250
cm9sIGNhbiBydW4gb24gYW55CisJICogQ1BVLgorCSAqLworCWZvcl9lYWNoX3ByZXNlbnRfY3B1
KGNwdSkgeworCQlpZiAocGVyX2NwdShtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KSAhPQor
CQkJCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQpIHsKKwkJCXJldHVybjsKKwkJ
fQorCX0KKwl1bmFsaWduZWRfY3RsID0gdHJ1ZTsKK30KKworYm9vbCB1bmFsaWduZWRfY3RsX2F2
YWlsYWJsZSh2b2lkKQoreworCXJldHVybiB1bmFsaWduZWRfY3RsOworfQotLSAKMi40Mi4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
