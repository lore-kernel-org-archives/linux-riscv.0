Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D71AC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 08:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ZQERprJkuxB7dnDIOQJ5DAyKVW4Pm89dYrOL0m4Ia0=; b=qujAKhzPLbY7lT
	60k2VW/kyZoZORbJvLxEdopSw95D7wjS9aEPd/YgVkD0ezG3/UpAU+m2inInBsyxcS+ex6GSE1oPv
	u71HXWS48sIq41lLc/zgSxxff3Va/eD3swD/PIqvZ3CFMlV2A+yCSWitRsb5Tvv7KxfGA0Ac6WiqZ
	52iigxlvkS+8sFMwpLvzSAPWbpJ64NZia1rnl7AnEnCiOI1IVwTg9AhllAhfGbkslroyMdUGys2Pb
	8wKZzB3aQIG/n8Zx/L97SoYDAzxARJyEoYPLHQF2NPbQ0ekNheaoKfuuvgdiQLJLc3TPj1J8J40+R
	Uu6UosFKghvxAmqTD6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKFZ-00000009MkZ-2ePS;
	Wed, 13 Mar 2024 08:46:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKFU-00000009Mjd-3sXC
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 08:46:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33e9115d501so1163405f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710319567; x=1710924367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xl9/EZGLKxGGHgqxXQrNVV9/fXW9fCPtZn84F/TZCWo=;
        b=TZ0/l8IGwpWNEcAiLiqZmQxjWh/58BlQ3ke4fcQzupKidhLy6THgXx6jOm711eo8AL
         00saf+IYYH0x17c4lF10QVjnIjoiU8k5UafhCSke1xIa1Z4MgmaogJa4wAI38rk2sJzC
         2qmSNP/god2QpD3bLAnMwBAMLi79Ppea7q3zlYEHAl3fVTM7V4BTo9dY/48urCmLwvum
         i//9dMMRJpf6EmjGBtlZgXROhOMvzXUAxGmkP7vRfdj9HNzjf3DeoM77ODOkE2gp7jwm
         4XJ2xObdcrKCv2QX0vcNeW6KKqr8B14XLwltVe3P8jPb3LkICsEgTZC82NbcjOPX5IKw
         C4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710319567; x=1710924367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl9/EZGLKxGGHgqxXQrNVV9/fXW9fCPtZn84F/TZCWo=;
        b=pMS3ZWxr0LHjD0/5JVQINSWPPfWOFpVvZFrt1aMwnJ+K+Yl5UpDg7vNTZMJesNjysE
         QyjIeBe7l3WVDdpLtpDGyxfw60J5mDkRtEFBfQbSeqkk+voGv2cH8Fr+NlCQAZgYWf1J
         dx5YYqROWEd8JJu/OtY/jHcXR+UhyVxHlqhJCuVddWw7iMeIYxZMen5AizpP12/AcEol
         Oht0qHeqduW6godq254N5PQTlgtTsJ0HQ28vwycPQW6jn7Bpt+GKPF4x8pU2pVA6t8NP
         XSOmko7bbXWkLEB15ApTjXlSFvSsyo819nYRYbLbOkEdJ+L2AtnUvdSgpDrJ484E71WK
         hCcA==
X-Forwarded-Encrypted: i=1; AJvYcCX0XhmLGM2SjhS2G+mA78vzezVwSoT2HYmQzHIPlfJ+F4sWDiX3sV3EVf7ZoXzxRkaT1KN2rI9OLZD/YxY2ycVKvc7HxyutDCPGhUrWX69t
X-Gm-Message-State: AOJu0YxX9ZmRGE7ndnclhAi7nZDWR5XRBPwLfuW6TzgqnQgornOHfFi/
	/0fbveKGiPDjvMmBQmhFUXOU5pqhulX4RflTvJcAt2jCSqwlGiGGASVLjc57Tjc=
X-Google-Smtp-Source: AGHT+IE5ezVmJ/Ll3UL9RF2ZSCycTaV8On1GZv4yRfDw6BjYLYByS2PLSa+T54t0GJaDHT8MYXbE3w==
X-Received: by 2002:a05:600c:1c84:b0:413:4299:ecd7 with SMTP id k4-20020a05600c1c8400b004134299ecd7mr2825793wms.0.1710319566968;
        Wed, 13 Mar 2024 01:46:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:1a26:f18f:eb07:b76a])
        by smtp.gmail.com with ESMTPSA id w9-20020a05600c474900b00412706c3ddasm1612743wmo.18.2024.03.13.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:46:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robin Ehn <rehn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Stefan O'Rear" <sorear@fastmail.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v4] riscv: hwprobe: export highest virtual userspace address
Date: Wed, 13 Mar 2024 09:45:33 +0100
Message-ID: <20240313084554.31925-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_014609_219089_52051E22 
X-CRM114-Status: GOOD (  20.30  )
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

U29tZSB1c2Vyc3BhY2UgYXBwbGljYXRpb25zIChPcGVuSkRLIGZvciBpbnN0YW5jZSkgdXNlcyB0
aGUgZnJlZSBNU0JzCmluIHBvaW50ZXJzIHRvIGluc2VydCBhZGRpdGlvbmFsIGluZm9ybWF0aW9u
IGZvciB0aGVpciBvd24gbG9naWMgYW5kCm5lZWQgdG8gZ2V0IHRoaXMgaW5mb3JtYXRpb24gZnJv
bSBzb21ld2hlcmUuIEN1cnJlbnRseSB0aGV5IHJlbHkgb24KcGFyc2luZyAvcHJvYy9jcHVpbmZv
ICJtbXU9c3Z4eCIgc3RyaW5nIHRvIG9idGFpbiB0aGUgY3VycmVudCB2YWx1ZSBvZgp2aXJ0dWFs
IGFkZHJlc3MgdXNhYmxlIGJpdHMgWzFdLiBTaW5jZSB0aGlzIHJlZmxlY3QgdGhlIHJhdyBzdXBw
b3J0ZWQKTU1VIG1vZGUsIGl0IG1pZ2h0IGRpZmZlciBmcm9tIHRoZSBsb2dpY2FsIG9uZSB1c2Vk
IGludGVybmFsbHkgd2hpY2ggaXMKd2h5IGFyY2hfZ2V0X21tYXBfZW5kKCkgaXMgdXNlZC4gRXhw
b3J0aW5nIHRoZSBoaWdoZXN0IG1tYXBhYmxlIGFkZHJlc3MKdGhyb3VnaCBod3Byb2JlIHdpbGwg
YWxsb3cgYSBtb3JlIHN0YWJsZSBpbnRlcmZhY2UgdG8gYmUgdXNlZC4gRm9yIHRoYXQKcHVycG9z
ZSwgYWRkIGEgbmV3IGh3cHJvYmUga2V5IG5hbWVkClJJU0NWX0hXUFJPQkVfS0VZX0hJR0hFU1Rf
VklSVF9BRERSRVNTIHdoaWNoIHdpbGwgZXhwb3J0IHRoZSBoaWdoZXN0CnVzZXJzcGFjZSB2aXJ0
dWFsIGFkZHJlc3MuCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vb3Blbmpkay9qZGsvYmxvYi9t
YXN0ZXIvc3JjL2hvdHNwb3Qvb3NfY3B1L2xpbnV4X3Jpc2N2L3ZtX3ZlcnNpb25fbGludXhfcmlz
Y3YuY3BwI0wxNzEgWzFdClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+CgotLS0KCnY0OgogLSBBZGRlZCBDaGFybGllIFJldmlld2VkLWJ5CiAtIFJlcGxhY2Ug
YSB0YWIgaW5zdGVhZCBvZiBhIHNwYWNlCiAtIFJlc2VuZCB3aXRoIGFjdHVhbCBWNCB0YWcgaW4g
ZnJvbnQgb2YgbWVzc2FnZSB3aGljaCB3YXMgbWlzc2luZwogLSBMaW5rIHRvIHYzOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMzAxMTY0NDA3LjQ3NTk1Ny0xLWNsZWdlckByaXZv
c2luYy5jb20vCgp2MzoKIC0gTm90ZTogSSBkaWQgbm90IGFkZGVkIFN0ZWZhbiBSZXZpZXdlZC1i
eSBzaW5jZSBJIGRpZCBtb3JlCiAgIG1vZGlmaWNhdGlvbnMgdGhhbiBqdXN0IGEgc2ltcGxlIHJl
c3Bpbi4KIC0gSGFuZGxlIENPTkZJR19NTVU9biBhcyB3ZWxsIGFuZCByZW5hbWUgdGhlIGtleSB0
bwogICBSSVNDVl9IV1BST0JFX0tFWV9ISUdIRVNUX1ZJUlRfQUREUkVTUwogLSBBZGQgYSB1c2Vy
X21heF92aXJ0X2FkZHIoKSBtYWNybyB0byBoYW5kbGUgIU1NVSBjb25maWcKIC0gTGluayB0byB2
MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDIyMDExMDk1MC44NzEzMDctMS1j
bGVnZXJAcml2b3NpbmMuY29tLwoKdjI6CiAtIE5vdGU6IHRyaWVkIHN5c2NvbmYgdG8gZXhwb3J0
IGl0IGJ1dCB0aGlzIGlzIG5vdCBiYWNrZWQgYnkgc3lzY2FsbAogICBhbmQgdGh1cyBkb2VzIG5v
dCBhbGxvdyBleHBvcnRpbmcgc3VjaCBpbmZvcm1hdGlvbiBlYXNpbHkuCiAtIFVzZSBhcmNoX2dl
dF9tbWFwX2VuZCgpIGluc3RlYWQgb2YgVkFfQklUUyBzaW5jZSBpdCByZWZsZWN0cyB0aGUKICAg
bWF4aW11bSBsb2dpY2FsIGFkZHJlc3MgdXNlZCBieSB0aGUgcmlzY3YgcG9ydAogLSBDaGFuZ2Ug
aHdwcm9iZSBrZXkgbmFtZSBmcm9tIFJJU0NWX0hXUFJPQkVfS0VZX1ZBX0JJVFMgdG8KICAgUklT
Q1ZfSFdQUk9CRV9LRVlfTUFYX0FERFJFU1MKIC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDI0MDIwMTE0MDMxOS4zNjAwODgtMS1jbGVnZXJAcml2b3NpbmMuY29t
LwotLS0KIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCAzICsrKwogYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggICAgICB8IDIgKy0KIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcHJvY2Vzc29yLmggICAgfCA4ICsrKysrKystCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
ICAgICAgIHwgNCArKysrCiA1IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CmluZGV4IGIyYmNjOWVl
ZDlhYS4uODc1ZDMxMjJiZDY2IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CkBA
IC0yMTAsMyArMjEwLDYgQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogCiAqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRWA6IEFuIHVuc2lnbmVk
IGludCB3aGljaAogICByZXByZXNlbnRzIHRoZSBzaXplIG9mIHRoZSBaaWNib3ogYmxvY2sgaW4g
Ynl0ZXMuCisKKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0hJR0hFU1RfVklSVF9BRERS
RVNTYDogQW4gdW5zaWduZWQgbG9uZyB3aGljaAorICByZXByZXNlbnQgdGhlIGhpZ2hlc3QgdXNl
cnNwYWNlIHZpcnR1YWwgYWRkcmVzcyB1c2FibGUuCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCmlu
ZGV4IDYzMDUwN2RmZjVlYS4uMTUwYTk4NzdiMGFmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3cHJvYmUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUu
aApAQCAtOCw3ICs4LDcgQEAKIAogI2luY2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUuaD4KIAotI2Rl
ZmluZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgNgorI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9L
RVkgNwogCiBzdGF0aWMgaW5saW5lIGJvb2wgcmlzY3ZfaHdwcm9iZV9rZXlfaXNfdmFsaWQoX19z
NjQga2V5KQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKaW5kZXggYTg1MDljYzMxYWIy
Li44YWYxMTgyZjUxODAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaApAQCAtMTQsNyAr
MTQsNyBAQAogCiAjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgogCi0jaWZkZWYgQ09ORklHXzY0QklU
CisjaWYgZGVmaW5lZChDT05GSUdfNjRCSVQpICYmIGRlZmluZWQoQ09ORklHX01NVSkKICNkZWZp
bmUgREVGQVVMVF9NQVBfV0lORE9XCShVTCgxKSA8PCAoTU1BUF9WQV9CSVRTIC0gMSkpCiAjZGVm
aW5lIFNUQUNLX1RPUF9NQVgJCVRBU0tfU0laRQogCkBAIC01OCw2ICs1OCwxMiBAQAogCiAjZGVm
aW5lIFNUQUNLX1RPUAkJREVGQVVMVF9NQVBfV0lORE9XCiAKKyNpZmRlZiBDT05GSUdfTU1VCisj
ZGVmaW5lIHVzZXJfbWF4X3ZpcnRfYWRkcigpIGFyY2hfZ2V0X21tYXBfZW5kKFVMT05HX01BWCwg
MCwgMCkKKyNlbHNlCisjZGVmaW5lIHVzZXJfbWF4X3ZpcnRfYWRkcigpIDAKKyNlbmRpZiAvKiBD
T05GSUdfTU1VICovCisKIC8qCiAgKiBUaGlzIGRlY2lkZXMgd2hlcmUgdGhlIGtlcm5lbCB3aWxs
IHNlYXJjaCBmb3IgYSBmcmVlIGNodW5rIG9mIHZtCiAgKiBzcGFjZSBkdXJpbmcgbW1hcCdzLgpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggOWYyYThlM2ZmMjA0Li4zNjMw
ZTNmMzAzNTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaApAQCAtNjcsNiAr
NjcsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01J
U0FMSUdORURfVU5TVVBQT1JURUQJKDQgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlT
QUxJR05FRF9NQVNLCQkoNyA8PCAwKQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pf
QkxPQ0tfU0laRQk2CisjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0hJR0hFU1RfVklSVF9BRERS
RVNTCTcKIC8qIEluY3JlYXNlIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSB3aGVuIGFkZGluZyBpdGVt
cy4gKi8KIAogLyogRmxhZ3MgKi8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19o
d3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IGE3YzU2YjQx
ZWZkMi4uNTYwZWE0MWE3MTZkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTgsNiArOCw3
IEBACiAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KICNpbmNsdWRlIDxhc20vY3B1ZmVhdHVy
ZS5oPgogI2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+CisjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5o
PgogI2luY2x1ZGUgPGFzbS9zYmkuaD4KICNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+CiAjaW5j
bHVkZSA8YXNtL3VhY2Nlc3MuaD4KQEAgLTIwMiw2ICsyMDMsOSBAQCBzdGF0aWMgdm9pZCBod3By
b2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQlpZiAoaHdwcm9iZV9l
eHQwX2hhcyhjcHVzLCBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT1opKQogCQkJcGFpci0+dmFsdWUg
PSByaXNjdl9jYm96X2Jsb2NrX3NpemU7CiAJCWJyZWFrOworCWNhc2UgUklTQ1ZfSFdQUk9CRV9L
RVlfSElHSEVTVF9WSVJUX0FERFJFU1M6CisJCXBhaXItPnZhbHVlID0gdXNlcl9tYXhfdmlydF9h
ZGRyKCk7CisJCWJyZWFrOwogCiAJLyoKIAkgKiBGb3IgZm9yd2FyZCBjb21wYXRpYmlsaXR5LCB1
bmtub3duIGtleXMgZG9uJ3QgZmFpbCB0aGUgd2hvbGUKLS0gCjIuNDMuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
