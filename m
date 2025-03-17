Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A45C35FFB
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vb7SbCv9WR/TIuIrUmp6gUN3pEPFMvPRGXLbDTBbLi0=; b=dCy+Y+67cs5SBj
	Z/zjKEMUJY8hKqqTHgrL1Sh5Tw15K2pHOeNIYchWIl5rvdz2ZCM7UQqThIdscqVFMIK9gOOPilMOU
	WYSizhdhe3TXTHjsl9f3Vztoi9P+9Qz21WdfTzv3dGyJm1SGqlIbAHoLx+uAgPjIRozY/B2bIBOkI
	Jd8Jbf6+keaq3cPHr2WQIGsAbxh3cmNrYRBYdZn3+PlcNZkUQ2WXQn96VTzebxaXfiR/zV3iK4KNC
	BOMe08Pej0l1mw1WiIExSntjJun9MAccarWvjsV0xWw7P6WR/zMohmsUI/f8KamC/cSkLVIkuNdqn
	aLTkX8KyAdn+FhfBBm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1N-00000003UtZ-0lVH;
	Mon, 17 Mar 2025 17:13:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwh-00000003TNy-2Muk
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso22361105e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231290; x=1742836090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzyfmLdoy3J2d7N3ElT+BcY4glWrhhZZ3MI8rtjNdBk=;
        b=PC8SMDxg/39rRwF1oy1T82SRYA2SGjrhRwlzN1MOTDWf6EhinxEeepattelVs5vRsS
         dBF9AzjVS1EivyFXbQ8QVkKgM/phpL2JX5k3Tk76Us4kBqj7ebyBSAXz3Q9+NLAXEtTK
         jfspf0XDaMHsz4FzzFIG/1d50kic6VbkFAC2717M2C3D3tsKEZwxetGv+A+BmX+2H1Fb
         36fDXAbn79rBcBxy+zni/kmQjJwEvvuQwlSGl2w2yxnOose072tPUhEC7qJZhqhS7i5I
         5k1xS1BkIBoJ1Ja9ItyNqmiQN+WMx4hgDLW/x/lnDMVviBBxQdeJS7P5XnN7K/C+xMeY
         V4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231290; x=1742836090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzyfmLdoy3J2d7N3ElT+BcY4glWrhhZZ3MI8rtjNdBk=;
        b=o8Kg4IgtU/gws1mEZrECUattWePaqQXT6+ysiYq/Tw4Df0JMZYdrsiUl0GgwMp02Xg
         b8ZGl1BI+iyE7TtoLes0oCWP17C8eawSXkd1cMt4tjlU8ioJgvSVa35x3XIPI+AwyC8X
         OQISG6Upb39IuBcejODzJ+0wTH35sYB3kZP29vx84osO+iK8ZUmmx++mseU/dF6adZRb
         pppWobq134kPyMYqhfEAidMQSjGafw5Cif0WgGyOCCAoddltGwPxTs/s4mM1RuOCA9oc
         VmCn1dQtBOCvX9viQudE43yYW/2pHnq9g/Nqqd+0sUZ+mrbHzD02NqP/g/tTUgD3+rRL
         DmkA==
X-Forwarded-Encrypted: i=1; AJvYcCXcT/eb/koFF/8uSXl58NtElZagOy7tkwJftMcvTDaRZWFORv+Np85eB3QaRGKqe1HkLkkdnocKmkIl0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4EMgJn684AbJRWdLoqylvFdp2D76aStY9UmSJ08E8rX8NQgE3
	oJpEu5hyHjiIUb/+erbDxrv9cKg/myPVgomkg2qfXpQoNCfD2HWZdn1Bc5eKD5U=
X-Gm-Gg: ASbGncuB7bsrdVfhPfbO9KO4WcM0YBwKIvSdmLzlhRnxwvQ6JageogOENabfveVcmzv
	QAeCacDKiMoXy7/L2yPAeL3LzV22ef+f/ny579bB1vrg5GBYWsHm4RzsicemXRtkAP/Z+fe1Umt
	zcWXkm2W0GJwZipE9jqRoT05hfuDLxp6+R7wEua/ROWdlRy77jqzcU7Y4euPAg9HEMehRnzgQRX
	DdatoqtlQksaKcLYHLXt2GXMoCRY+5MEJsAwitWObOSlX9Gkztufb0cE3Y2tYGPnf6X4reHVPkg
	WtMpjdjlwbf0mEnkyc4DxQZYyrgWMlmgDFkFJkBzaZCbhA==
X-Google-Smtp-Source: AGHT+IEXtMD53rpT5+I6qBlek794Ca+55Nd9V0KPjs7YD1xcg1pmEqFLjYcNNVWjDAHYDrYaGY3dSQ==
X-Received: by 2002:a05:600c:3c89:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43d1ecd7adfmr118223885e9.21.1742231290211;
        Mon, 17 Mar 2025 10:08:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:09 -0700 (PDT)
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
Subject: [PATCH v4 03/18] riscv: sbi: add FWFT extension interface
Date: Mon, 17 Mar 2025 18:06:09 +0100
Message-ID: <20250317170625.1142870-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100811_626421_1A0E5859 
X-CRM114-Status: GOOD (  13.74  )
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

VGhpcyBTQkkgZXh0ZW5zaW9ucyBlbmFibGVzIHN1cGVydmlzb3IgbW9kZSB0byBjb250cm9sIGZl
YXR1cmUgdGhhdCBhcmUKdW5kZXIgTS1tb2RlIGNvbnRyb2wgKEZvciBpbnN0YW5jZSwgU3ZhZHUg
bWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0cnAKRFRFLCBldGMpLiBBZGQgYW4gaW50ZXJmYWNlIHRv
IHNldCBsb2NhbCBmZWF0dXJlcyBmb3IgYSBzcGVjaWZpYyBjcHUKbWFzayBhcyB3ZWxsIGFzIGZv
ciB0aGUgb25saW5lIGNwdSBtYXNrLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAy
MCArKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDY5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKaW5kZXggZDExZDIyNzE3YjQ5Li4xY2VjZmE4MmMyZTUg
MTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zYmkuaApAQCAtNTAzLDYgKzUwMywyNiBAQCBpbnQgc2JpX3JlbW90ZV9o
ZmVuY2VfdnZtYV9hc2lkKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAkJCQl1bnNp
Z25lZCBsb25nIGFzaWQpOwogbG9uZyBzYmlfcHJvYmVfZXh0ZW5zaW9uKGludCBleHQpOwogCitp
bnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2soY29uc3QgY3B1bWFza190ICptYXNrLCB1MzIg
ZmVhdHVyZSwKKwkJCSAgICAgICB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZs
YWdzKTsKKy8qKgorICogc2JpX2Z3ZnRfbG9jYWxfc2V0KCkgLSBTZXQgYSBmZWF0dXJlIG9uIGFs
bCBvbmxpbmUgY3B1cworICogQGZlYXR1cmU6IFRoZSBmZWF0dXJlIHRvIGJlIHNldAorICogQHZh
bHVlOiBUaGUgZmVhdHVyZSB2YWx1ZSB0byBiZSBzZXQKKyAqIEBmbGFnczogRldGVCBmZWF0dXJl
IHNldCBmbGFncworICoKKyAqIFJldHVybjogMCBvbiBzdWNjZXNzLCBhcHByb3ByaWF0ZSBsaW51
eCBlcnJvciBjb2RlIG90aGVyd2lzZS4KKyAqLworIHN0YXRpYyBpbmxpbmUgaW50IHNiaV9md2Z0
X2xvY2FsX3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwKKwkJCQkgICAgICB1
bnNpZ25lZCBsb25nIGZsYWdzKQorIHsKKwkgcmV0dXJuIHNiaV9md2Z0X2xvY2FsX3NldF9jcHVt
YXNrKGNwdV9vbmxpbmVfbWFzaywgZmVhdHVyZSwgdmFsdWUsCisJCQkJCSAgIGZsYWdzKTsKKyB9
CisKK2ludCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKTsK
K2ludCBzYmlfZndmdF9zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2ln
bmVkIGxvbmcgZmxhZ3MpOworCiAvKiBDaGVjayBpZiBjdXJyZW50IFNCSSBzcGVjaWZpY2F0aW9u
IHZlcnNpb24gaXMgMC4xIG9yIG5vdCAqLwogc3RhdGljIGlubGluZSBpbnQgc2JpX3NwZWNfaXNf
MF8xKHZvaWQpCiB7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3NiaS5jCmluZGV4IDE5ODliOGNhZGUxYi4uZDQxYTU2NDJiZTI0IDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
YmkuYwpAQCAtMjk5LDYgKzI5OSw3NSBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92MDIoaW50
IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNrLAogCXJldHVybiAwOwogfQogCisv
KioKKyAqIHNiaV9md2Z0X2dldCgpIC0gR2V0IGEgZmVhdHVyZSBmb3IgdGhlIGxvY2FsIGhhcnQK
KyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBiZSBzZXQKKyAqIEB2YWx1ZTogV2lsbCBj
b250YWluIHRoZSBmZWF0dXJlIHZhbHVlIG9uIHN1Y2Nlc3MKKyAqCisgKiBSZXR1cm46IDAgb24g
c3VjY2VzcywgYXBwcm9wcmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK2lu
dCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQoreworCXJl
dHVybiAtRU9QTk9UU1VQUDsKK30KKworLyoqCisgKiBzYmlfZndmdF9zZXQoKSAtIFNldCBhIGZl
YXR1cmUgb24gdGhlIGxvY2FsIGhhcnQKKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBi
ZSBzZXQKKyAqIEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0CisgKiBAZmxhZ3M6
IEZXRlQgZmVhdHVyZSBzZXQgZmxhZ3MKKyAqCisgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgYXBw
cm9wcmlhdGUgbGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK2ludCBzYmlfZndmdF9z
ZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3Mp
Cit7CisJcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCitzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKKwl1
MzIgZmVhdHVyZTsKKwl1bnNpZ25lZCBsb25nIHZhbHVlOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7
CisJYXRvbWljX3QgZXJyb3I7Cit9OworCitzdGF0aWMgdm9pZCBjcHVfc2JpX2Z3ZnRfc2V0KHZv
aWQgKmFyZykKK3sKKwlzdHJ1Y3QgZndmdF9zZXRfcmVxICpyZXEgPSBhcmc7CisJaW50IHJldDsK
KworCXJldCA9IHNiaV9md2Z0X3NldChyZXEtPmZlYXR1cmUsIHJlcS0+dmFsdWUsIHJlcS0+Zmxh
Z3MpOworCWlmIChyZXQpCisJCWF0b21pY19zZXQoJnJlcS0+ZXJyb3IsIHJldCk7Cit9CisKKy8q
KgorICogc2JpX2Z3ZnRfbG9jYWxfc2V0KCkgLSBTZXQgYSBmZWF0dXJlIGZvciB0aGUgc3BlY2lm
aWVkIGNwdW1hc2sKKyAqIEBtYXNrOiBDUFUgbWFzayBvZiBjcHVzIHRoYXQgbmVlZCB0aGUgZmVh
dHVyZSB0byBiZSBzZXQKKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBiZSBzZXQKKyAq
IEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0CisgKiBAZmxhZ3M6IEZXRlQgZmVh
dHVyZSBzZXQgZmxhZ3MKKyAqCisgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgYXBwcm9wcmlhdGUg
bGludXggZXJyb3IgY29kZSBvdGhlcndpc2UuCisgKi8KK2ludCBzYmlfZndmdF9sb2NhbF9zZXRf
Y3B1bWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIHUzMiBmZWF0dXJlLAorCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCit7CisJc3RydWN0IGZ3ZnRf
c2V0X3JlcSByZXEgPSB7CisJCS5mZWF0dXJlID0gZmVhdHVyZSwKKwkJLnZhbHVlID0gdmFsdWUs
CisJCS5mbGFncyA9IGZsYWdzLAorCQkuZXJyb3IgPSBBVE9NSUNfSU5JVCgwKSwKKwl9OworCisJ
aWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCisJCXJldHVybiAtRUlO
VkFMOworCisJb25fZWFjaF9jcHVfbWFzayhtYXNrLCBjcHVfc2JpX2Z3ZnRfc2V0LCAmcmVxLCAx
KTsKKworCXJldHVybiBhdG9taWNfcmVhZCgmcmVxLmVycm9yKTsKK30KKwogLyoqCiAgKiBzYmlf
c2V0X3RpbWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4KICAq
IEBzdGltZV92YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZlbnQgc2hv
dWxkIGZpcmUuCi0tIAoyLjQ3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
