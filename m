Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245FAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YJ6VFaXAKtjegHmXxPODu4t01gYcUxRzB2mo3j1/XE=; b=BmlP/0TNxfKa/l
	PS0RR/GByz5wvn+2AQoYQMu9/gWD33FBYtFbZ/f0lzLRy3iXtGig/ejFPkGh1T2MZ57/KCcwV/2rC
	d37d8xhqxIEYHquQhASP/XuEpNGaiQE7FMe7Obr54U1as0ekTIk4qnP28VzFbhHzKY7FMEib6XoXR
	/ScwidmocPx6P3OO3fkVDM+erBATAvpTD74NtNPWGO9EjsPNt0OvHrHRO3UTdNJ0nJbIOJO/jjhQd
	xj+2M6p/esDGm2noWc6cwq3hJfIA3c+p8pbw8q7JCFNwg/4ykndnxg+o7cs8nbjXPJH6OQqRxBLtP
	D+8np3oHDG3mFB8bes6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jki-0019A3-17;
	Tue, 07 Nov 2023 10:56:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkd-00197H-2s
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32f831087c6so1250701f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354565; x=1699959365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2QJAM1NTLzbssZcNNT+NMVix19aOXjDu6owokPhRTA=;
        b=exqZH4voBmVOwWJcO9pnwb68F77ysnxc/fO5JbGH1mD11sdilPY3E7XNmU1+6DPsSA
         egRe79EZMmERf9pR71AfSJ+yY8zOJvk7RdP+gz2IFou97LjtsHmO9vHEPlzzu/mfsX/V
         JgH7Y23dJ255kTYCgciH8ofAuoHAhtjZukiG4ibBcLlSAM55TVFD7TOSCDgMOdroCM2p
         QyozhUH1O3Q+6EYP4us5GZ74Sfn3ZUetn3uoo0F3jaGA4wL4aTwy0d7KlmZHNmOfyIiK
         5BI1h8LB65LZeb5V/Czxx5MPX4Mql1hpnf/1O6NfxMK51B6/ag8OPfGt3oinBKXEVM3a
         nWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354565; x=1699959365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2QJAM1NTLzbssZcNNT+NMVix19aOXjDu6owokPhRTA=;
        b=mAT5NgYRc9JcSzgdpTEiDmJitRrCydVbDeF2HL/C99fptRkWjoN38sC2liECFa2/pS
         50M6oyY9hb4nef3Gqm4kkI2nmeosZRgQV5D4dd00i/rUxGmDMsW5SgsB3dnhz4Tk+7rl
         wpU7hm7cr0pU5M8XUtKOxrBFcr8ecZJIbX9WnckTHAX+/e82oe6CyVG193VK77Wxtv0b
         1FYVA1fn0rFZQXMi1ah/dVkLeXkpsqh5muViqfnvf5QExtjFewSRIXot5beyupmPIp3H
         WXjQo2f7usnm+1k7ucP8Tw8bGTRwyUbV8sK1O+UYD2S/CMniN51lN0hmBAXU0eXoP9Zf
         lqxA==
X-Gm-Message-State: AOJu0YzV5iYdfqisI9H+akcYxwfap6lbndQobVTZvt/3psTVC88EdBou
	4CZK5Vqe60R7fbysnM5ZJLdk9+J3yr15dS3FCBewng==
X-Google-Smtp-Source: AGHT+IEvK4516vk3XLxXezj4Z/70DNzO/HNov8XwzTHQc2CtYhog8FQf/viaaqr3v8HfCYx/WX8PeA==
X-Received: by 2002:a05:600c:418a:b0:3fe:d637:7b25 with SMTP id p10-20020a05600c418a00b003fed6377b25mr25010263wmh.0.1699354565264;
        Tue, 07 Nov 2023 02:56:05 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:04 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 04/20] riscv: hwprobe: add support for scalar crypto ISA extensions
Date: Tue,  7 Nov 2023 11:55:40 +0100
Message-ID: <20231107105556.517187-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025607_929409_EED4F319 
X-CRM114-Status: GOOD (  10.79  )
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

RXhwb3J0IHRoZSBmb2xsb3dpbmcgc2NhbGFyIGNyeXB0byBleHRlbnNpb25zIHRocm91Z2ggaHdw
cm9iZToKCi0gWmJrYgotIFpia2MKLSBaYmt4Ci0gWmtuZAotIFprbmUKLSBaa25oCi0gWmtzZWQK
LSBaa3NoCi0gWmt0CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZv
c2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0ICB8IDI3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCB8ICA5ICsrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMg
ICAgICAgICB8ICA5ICsrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9j
dW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGVjYzAzMDdjMTA3ZS4uYjAy
MGIyZDM1YTk5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBAIC04MCw2ICs4
MCwzMyBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfRVhUX1pCQ2AgVGhlIFpiYyBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBk
ZWZpbmVkCiAgICAgICAgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIEJpdC1NYW5pcHVsYXRpb24gSVNB
IGV4dGVuc2lvbnMuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkJLQmAgVGhl
IFpia2IgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNp
b24gMS4wIG9mIHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25zLgorCisgICogOmM6bWFj
cm86YFJJU0NWX0hXUFJPQkVfRVhUX1pCS0NgIFRoZSBaYmtjIGV4dGVuc2lvbiBpcyBzdXBwb3J0
ZWQsIGFzCisgICAgICAgZGVmaW5lZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgU2NhbGFyIENyeXB0
byBJU0EgZXh0ZW5zaW9ucy4KKworICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQktY
YCBUaGUgWmJreCBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcworICAgICAgIGRlZmluZWQgaW4g
dmVyc2lvbiAxLjAgb2YgdGhlIFNjYWxhciBDcnlwdG8gSVNBIGV4dGVuc2lvbnMuCisKKyAgKiA6
YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWktORGAgVGhlIFprbmQgZXh0ZW5zaW9uIGlzIHN1
cHBvcnRlZCwgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9mIHRoZSBTY2FsYXIg
Q3J5cHRvIElTQSBleHRlbnNpb25zLgorCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pLTkVgIFRoZSBaa25lIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzCisgICAgICAgZGVmaW5l
ZCBpbiB2ZXJzaW9uIDEuMCBvZiB0aGUgU2NhbGFyIENyeXB0byBJU0EgZXh0ZW5zaW9ucy4KKwor
ICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aS05IYCBUaGUgWmtuaCBleHRlbnNpb24g
aXMgc3VwcG9ydGVkLCBhcworICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFNj
YWxhciBDcnlwdG8gSVNBIGV4dGVuc2lvbnMuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9FWFRfWktTRURgIFRoZSBaa3NlZCBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcworICAgICAg
IGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFNjYWxhciBDcnlwdG8gSVNBIGV4dGVuc2lv
bnMuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWktTSGAgVGhlIFprc2ggZXh0
ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMKKyAgICAgICBkZWZpbmVkIGluIHZlcnNpb24gMS4wIG9m
IHRoZSBTY2FsYXIgQ3J5cHRvIElTQSBleHRlbnNpb25zLgorCisgICogOmM6bWFjcm86YFJJU0NW
X0hXUFJPQkVfRVhUX1pLVGAgVGhlIFprdCBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBkZWZp
bmVkCisgICAgICAgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFNjYWxhciBDcnlwdG8gSVNBIGV4dGVu
c2lvbnMuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0
bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBz
ZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3By
b2JlLmgKaW5kZXggZGNlZjVjMzNjMDA5Li4xMGJmNTQzZGUzY2UgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtMzAsNiArMzAsMTUgQEAgc3RydWN0IHJpc2N2X2h3cHJv
YmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkJCCQkoMSA8PCA0KQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9FWFRfWkJTCQkoMSA8PCA1KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWkJDCQkoMSA8PCA2KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkJLQgkJKDEgPDwg
NykKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pCS0MJCSgxIDw8IDgpCisjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aQktYCQkoMSA8PCA5KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9F
WFRfWktORAkJKDEgPDwgMTApCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aS05FCQkoMSA8
PCAxMSkKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pLTkgJCSgxIDw8IDEyKQorI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWktTRUQJCSgxIDw8IDEzKQorI2RlZmluZQkJUklTQ1ZfSFdQ
Uk9CRV9FWFRfWktTSAkJKDEgPDwgMTQpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aS1QJ
CSgxIDw8IDE1KQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3Yu
YwppbmRleCAzODJjZDcxMTI5YzYuLmJiNDQ1OTI3MDdhNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMK
QEAgLTE2Myw2ICsxNjMsMTUgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3Qg
cmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJQ0hFQ0tfSVNBX0VYVChaQkIpOwogCQlDSEVDS19JU0Ff
RVhUKFpCUyk7CiAJCUNIRUNLX0lTQV9FWFQoWkJDKTsKKwkJQ0hFQ0tfSVNBX0VYVChaQktCKTsK
KwkJQ0hFQ0tfSVNBX0VYVChaQktDKTsKKwkJQ0hFQ0tfSVNBX0VYVChaQktYKTsKKwkJQ0hFQ0tf
SVNBX0VYVChaS05EKTsKKwkJQ0hFQ0tfSVNBX0VYVChaS05FKTsKKwkJQ0hFQ0tfSVNBX0VYVCha
S05IKTsKKwkJQ0hFQ0tfSVNBX0VYVChaS1NFRCk7CisJCUNIRUNLX0lTQV9FWFQoWktTSCk7CisJ
CUNIRUNLX0lTQV9FWFQoWktUKTsKICN1bmRlZiBDSEVDS19JU0FfRVhUCiAJfQogCi0tIAoyLjQy
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
