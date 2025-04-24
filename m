Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6945C369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jud63Bp6tte3J0CPX0mjlTMXkfHPa5Ec/2ZHXYVKiOs=; b=MQpQoVE96k/UnL
	hq6r7MlY3/yeoCdr7cMCKT26pMLzpsA8Qn8I95h73uabZhX4t4PMz6vt03ffwONVVRiJ4qEnyfuzL
	MHBe5pJGj4uUcs328dJHaCtEl3DOJmZoFiKczn1283CySx1Wq+9JjrrolHUG7Ro9M9ycmluJkXCW8
	tHtJ2hKVDRvRQqrvy4H1rtRqyc7h1cSDZauFej+cyG5cE+a2pBrG2hmacCVO3FWQqoHBIfRtdJeok
	oR81AiruZfB+Ic3/3eKqqCtRrxEzlJraFuWD0inOqcaanIXeHoHaCOO3iVZZXI4X+qNQVGQKoFzvI
	Q+wu/lUogtNIShBDyzgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Td-0000000Ev1d-2UiI;
	Thu, 24 Apr 2025 17:35:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Ta-0000000Ev0E-3tEZ
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:35:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22435603572so16293725ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516106; x=1746120906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNDdi3bVRW98tMUmMa3iEbBTwqmvke8nqAL/FJxM67I=;
        b=JMS/iDE3OSJPTGc7Gdgf13oesPjpBsF/GaJVWnZPidlHV0/iJEpAfawJZy1ESqdzqf
         thoqMjysg0E/IatXo0XxEMqC2a7YfkPZPt5xiUNGv+PTHzKum8G7kklB2mA9fT2eAtJ6
         17clEv0KKTfJ2dR3QmDCu4F8YMrjFnaWQQPU1PxyrVv40I29KLNuyUeoukAda28gmazk
         tKv732t3TsRC7cM3ZBAv47dZ/5cS/jIbU1bqBUuXcDHxfUKgYio2HXbcA8A7comCxJUI
         z4Dpf58TWTRfZJxJrOC2QpNRHS9+wSp+a/yjJ7uZlVPT13vJxS8/gduqCpnlFR/27nuq
         EdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516106; x=1746120906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNDdi3bVRW98tMUmMa3iEbBTwqmvke8nqAL/FJxM67I=;
        b=fnsCCUPxdyLUocts7Jilv65jWIsOCTqY5+lFTju7nqMKsGD40VGx6ji/I3DJmuDDP3
         v0YfPbSnQg4uK62IBFdaooqj5Fqq6jhHPzyJ/u8UUJ5XpjhEM+7EgHapgw2lbCZYJSOi
         kIbaaPbxaCqNK6omhvDICtfp/h+xuNDv3CtzzYTuZISsEt0zv1u6bMg5U11ngWFamxET
         21cUivggJbrB9n3v08/EUMUZSaZdbz76e2BSu7g8wkMxHUirOwv2peiw/G4T5do0eVOq
         kwFRq6/JyWVFSVVQyI1HEqzTkkJ136k1z+aFb8E7TXl2q0LZ8d81SPuJwmYljKqlr94Q
         lnEw==
X-Forwarded-Encrypted: i=1; AJvYcCWpczz2gcsN09tE6C7BHoK+Pkhg7qVE7BStMont2y6MTwm4ei/hxEd0pieyFIKGqrjCW6bzYw6eU1smvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsiV7RRwQHlwGMZ9WcOfYS9OaHcSM2xMSsuyQi21eVZ2hmMcPe
	3WcbudQ/r9R69yqOVfG1kpslCr3PvUYUw9r4FPtnX9TagKHhTVw3+nsEFwBK63Q=
X-Gm-Gg: ASbGncspce4rbnl0WGY0TO7PB+9rp7s86gLjidq64axOUZ2KfjnNCx8TbzX/1WXKb4Y
	rVxE7t5mq5PpRH/+l5aREii1k9NZOxiF9zgMYyCsq5KQn+I3IRM5hnX7h0WKu0NfGZ9wYz90L0L
	4UQoq8PfMhoKASsNSBbeyPy6ISqpZplq4RCnwyFgPizyRFRdxBRFIKBlrJwESjw1E+MDmsubDjz
	UAO1EBfXZ2uOrCRrM7dlF2EHBWiVuAPJ2vWbZ2205cm0Ynn1nVqgbpQFrexvgs5Oqjqn9XRIqHs
	MNU5tERwMkgwo7YevQk37xiUdpICmu474F8yk4M/JdIGfAWG7zQN
X-Google-Smtp-Source: AGHT+IHgoxOdSwMCR3g5IpOqeK6qLMj0uu2JqSy/m/IXPMpoioHfXGrM09vCJDVNOdL1X/GrKu4d3A==
X-Received: by 2002:a17:902:e74b:b0:224:160d:3f54 with SMTP id d9443c01a7336-22dbd469727mr4368305ad.31.1745516106262;
        Thu, 24 Apr 2025 10:35:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:35:05 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Thu, 24 Apr 2025 19:31:57 +0200
Message-ID: <20250424173204.1948385-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103506_964143_7C2099A8 
X-CRM114-Status: GOOD (  11.33  )
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

Q2hlY2tpbmcgZm9yIHRoZSBkZWxlZ2FiaWxpdHkgb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHRy
YXAgaXMgbmVlZGVkCmZvciB0aGUgS1ZNIEZXRlQgZXh0ZW5zaW9uIGltcGxlbWVudGF0aW9uLiBB
ZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlCmRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCB0
cmFwIGV4Y2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggIHwgIDUgKysr
KysKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDE3ICsrKysrKysrKysr
KysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAppbmRleCBkYmU1OTcwZDRmZTYuLjNhODdm
NjEyMDM1YyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgK
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKQEAgLTcyLDEyICs3Miwx
NyBAQCBpbnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQgaW50IGNw
dSk7CiAjaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQpCiB2b2lkIHVu
YWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwogYm9vbCB1bmFsaWduZWRfY3RsX2F2YWls
YWJsZSh2b2lkKTsKK2Jvb2wgbWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUodm9pZCk7CiBE
RUNMQVJFX1BFUl9DUFUobG9uZywgbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpOwogI2Vsc2UKIHN0
YXRpYyBpbmxpbmUgYm9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSh2b2lkKQogewogCXJldHVy
biBmYWxzZTsKIH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxl
Z2F0ZSh2b2lkKQoreworCXJldHVybiBmYWxzZTsKK30KICNlbmRpZgogCiBib29sIF9faW5pdCBj
aGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKTsKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA0MTBiMmUwZTA3NjUuLjFkM2JlOTk5
MjIwZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNzA5LDEwICs3MDks
MTAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWQodW5zaWduZWQgaW50IGNwdSkKIH0KICNlbmRpZgogCi0jaWZkZWYgQ09ORklHX1JJU0NWX1NC
SQotCiBzdGF0aWMgYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZDsKIAorI2lmZGVmIENP
TkZJR19SSVNDVl9TQkkKKwogc3RhdGljIGludCBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0
dXAodW5zaWduZWQgaW50IGNwdSkKIHsKIAlpZiAoc2JpX2Z3ZnRfc2V0KFNCSV9GV0ZUX01JU0FM
SUdORURfRVhDX0RFTEVHLCAxLCAwKSAmJgpAQCAtNzQ4LDYgKzc0OCw3IEBAIHN0YXRpYyBpbnQg
Y3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUgX19hbHdheXNf
dW51c2VkKQogewogCXJldHVybiAwOwogfQorCiAjZW5kaWYKIAogaW50IGNwdV9vbmxpbmVfdW5h
bGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGludCBjcHUpCkBAIC03NjAsMyArNzYxLDE1IEBA
IGludCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQog
CiAJcmV0dXJuIGNwdV9vbmxpbmVfY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChjcHUp
OwogfQorCitib29sIG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKHZvaWQpCit7CisJLyoK
KwkgKiBFaXRoZXIgd2Ugc3VjY2Vzc2Z1bGx5IHJlcXVlc3RlZCBtaXNhbGlnbmVkIHRyYXBzIGRl
bGVnYXRpb24gZm9yIGFsbAorCSAqIENQVVMgb3IgdGhlIFNCSSBkb2VzIG5vdCBpbXBsZW1lbnRl
ZCBGV0ZUIGV4dGVuc2lvbiBidXQgZGVsZWdhdGVkIHRoZQorCSAqIGV4Y2VwdGlvbiBieSBkZWZh
dWx0LgorCSAqLworCXJldHVybiBtaXNhbGlnbmVkX3RyYXBzX2RlbGVnYXRlZCB8fAorCSAgICAg
ICBhbGxfY3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgpOworfQorRVhQT1JU
X1NZTUJPTF9HUEwobWlzYWxpZ25lZF90cmFwc19jYW5fZGVsZWdhdGUpOwotLSAKMi40OS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
