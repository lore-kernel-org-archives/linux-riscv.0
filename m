Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457F2E75448
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 11:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LV2cTyY8wCL2HBXM5ouhfQ8SdW8sMs+2/M32b3mBU8M=; b=jKmKWqiyTlwCi6
	Kl9+Fxkg7na3qvh+j6MXuGLF5ra0pyT88YGkHG2weT/re+fQ0Xmn0DOqwCjbqVpRBJZhxlFdeTWlg
	b5pcKgn5TMpoc8m61V2CF3OKPbkFRM8lZvS07EBX+Fm4vXZ/ukRfdmO6CKgne1+JWT1tcpev5VV9k
	pCfjMOsey/4SS/b5gNsj2BwYsTgLIxOXcNBrHs4hIvD/UbtgNVScfBKjbkPkTvoc2ubxsBeMfzvNf
	azMfTPUMN/8AEi2m+ge27HSQdwaXHfrniVeC05xQk2bMMrbGUiMu8mIB9SsI/W74njlqet1cmAiq/
	CEJ1e5H1R04P4EbcQ+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMma-0000000Gj2G-14JJ;
	Wed, 24 Dec 2025 11:11:56 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMmY-0000000Gj1s-1kvG
	for linux-riscv@lists.infradead.org;
	Wed, 24 Dec 2025 11:11:55 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-29f1bc40b35so98340165ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Dec 2025 03:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766574713; x=1767179513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PyhY4JFyeZrUE9GYnkYmguvAHDwBCLBE233vFWLE6U=;
        b=DFXCFV1eGKhHepn/yKxBwcnX2+xWVWCMIlcELtA1l3Adc8T9UnKqqJI5PX4bjGWBEg
         Q/K0Q/lJsKI3Des75A360npc+mJyLOmpu7zSwfD5zKX8nfRvZ4ID8JXUVN7+LS8Zr8GY
         fyTjQpcrIi0fy7PVWrO3dGDqTE/0hBYsKQ01LPIBU6Ep1/+pyFDuT29yDz4ue61LZ6EE
         Zzy8JeaWN2CGX0C9WMEvKkpW7sIsQ0btOUWrYl4YmiyZaR7YPm6HGw58rL3HgiG5vju7
         1rXhPS3XwBH8LkcaVpsMnkySAGuBCODNwbK8dwrioKpntcpgOphMSbiQbk7bDeXgDNv6
         LO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574713; x=1767179513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PyhY4JFyeZrUE9GYnkYmguvAHDwBCLBE233vFWLE6U=;
        b=htnl6rjTiXLGrvb58N9S/tzlYFEQ9Lx+yFDNlfNxLRgac1CMjQX1j8QIF49Zot2dc8
         eqOm16RL2gb/xY1yc22f6R0cg+C44hmlu2S84/X2idLEi87bjoNKZKowyVe5qGiGUe35
         tBuwjChuaeY6HIbRhgh7AZSYjVCQ+kAli+768WQd4Hzz62TTM/E8P840ZKPVIVtrCTJJ
         Is35v19uG5RHY7PBtSpmNs0I0Os+X9CnMUzbLglU9rQAxAMcu655XygCWLUbzscb0crs
         af1EE0Ehf8mnxadQt6ehBuR+1NfnbaJ+FR5mnjKx6iLY9qt6GV9xd/JYX3jmMz/SKZ9k
         0xXg==
X-Forwarded-Encrypted: i=1; AJvYcCVbp17s+4KW7UP1KtT0ZdKP9N5sSmqRbdP6obHYxF17sR4Pu5emnS0TnGmvy3C+S8C1Koz/RTiFxln54Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqAdYan5HfjzD76bCu+LpWmNtCbBIpqkWpoW+ZESRK9r7qFMEc
	9rPQqWbLO2kCcy9KGqg+xw9IHBR7PMl7nUr+1dTx2vXvCGuuLkIyZyOd3W9Rvcsq
X-Gm-Gg: AY/fxX5IYRkgbN3y5UFfZiPeDaUOQuoxkmGqR5q5eb+SAMkPWvbhHgAR4/xxpDbHbd/
	fG+/PP/Pl/Qs/DRgha+gwD+bjz5D5t9N0V/MuJWDyahXMDZLAr47uT0nvtrXZu7bCz0jCg/y5gJ
	0pR+PmxkawJGMJTrvP83ewiUIu9vknKTQtlNxlPHkthDbPK+HlHBoWMdKUsuoMqBK0IFnTSjxEg
	F/0IMYBLMb/VLcJGXNYMmFE6ArTVLcon7hPakXlNvirQTxzGq6NYRQLsZIEYY7R2DSGJderpV4n
	bR77OUDjVEjz9qiqOPvrYdJJgQCM3sk9wU3D2c4S+ggaBPE0Okk08HK0rvrUgaAVE5yIXShYtW+
	pLpz1/+3fFSua4uv3hN7XIEPIOLg+lemSIFPe2LXb6MP19AH/NeugbBywYBYGMYnPXmDjDTMtPN
	355FWHOyHDSKIyTFF8bNj0KNzlwxrhqg8TaCyT
X-Google-Smtp-Source: AGHT+IEau09HIVwcpRCbvl1GNZtzmQg3pyhbh/m+EimYRViL0a86IR+DdkyzvI2SbDOV7stgmF/1RA==
X-Received: by 2002:a17:902:c947:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a2f2737bf4mr163973415ad.37.1766574712955;
        Wed, 24 Dec 2025 03:11:52 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb30sm156154165ad.66.2025.12.24.03.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:11:52 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sanjayembeddedse@gmail.com,
	virendrasinhchauhan1206@gmail.com
Subject: [PATCH] irqchip/riscv-aplic: adapt to syscore API passing context data
Date: Wed, 24 Dec 2025 16:41:46 +0530
Message-Id: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_031154_459730_B4373250 
X-CRM114-Status: GOOD (  13.03  )
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

RnJvbTogU2FuamF5IENoaXRyb2RhIDxzYW5qYXllbWJlZGRlZHNlQGdtYWlsLmNvbT4KCmxpbnV4
LW5leHQgY29tbWl0IGE5N2ZiYzNlZTNlMiAoInN5c2NvcmU6IFBhc3MgY29udGV4dCBkYXRhIHRv
IGNhbGxiYWNrcyIpCmNoYW5nZWQgdGhlIHN5c2NvcmUgQVBJIHRvIHJlZ2lzdGVyIHBlci1pbnN0
YW5jZSBjb250ZXh0IGFsb25nc2lkZSB0aGUKc3lzY29yZSBvcGVyYXRpb25zIGFuZCB0byBwYXNz
IHRoYXQgY29udGV4dCBpbnRvIGNhbGxiYWNrcy4gQXMgYSByZXN1bHQsCmRyaXZlcnMgbXVzdCBu
byBsb25nZXIgcmVseSBvbiBnbG9iYWwgc3RhdGUgb3IgaW1wbGljaXQgZGF0YSBhY2Nlc3MgaW4K
dGhlaXIgc3lzY29yZSBzdXNwZW5kL3Jlc3VtZSBoYW5kbGVycy4KClRoZSBSSVNDLVYgQVBMSUMg
ZHJpdmVyIHN0YXJ0ZWQgcHJlc2VydmluZyBzdGF0ZSBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUsCmJ1
dCBpdHMgc3lzY29yZSB1c2FnZSBzdGlsbCBhc3N1bWVkIHRoZSBvbGQgQVBJLiBCdWlsZGluZyBh
Z2FpbnN0CmxpbnV4LW5leHQgYWZ0ZXIgYTk3ZmJjM2VlM2UyIGZhaWxzIGJlY2F1c2UgdGhlIGNh
bGxiYWNrcyBkb27igJl0IHJlY2VpdmUKdGhlIG5lY2Vzc2FyeSBkcml2ZXIgY29udGV4dC4KClVw
ZGF0ZSBpcnEtcmlzY3YtYXBsaWMgdG8gdGhlIG5ldyBzeXNjb3JlIEFQSToKICAqIHJlZ2lzdGVy
IHN5c2NvcmUgd2l0aCBkcml2ZXItcHJpdmF0ZSBjb250ZXh0LAogICogcGFzcyB0aGUgY29udGV4
dCB0byBzYXZlL3Jlc3RvcmUgaGVscGVycywKICAqIHN0b3AgdXNpbmcgaW1wbGljaXQgZ2xvYmFs
cyBpbiBzeXNjb3JlIHBhdGhzLgoKVGhpcyBmaXhlcyB0aGUgY29tcGlsYXRpb24gZXJyb3IgYW5k
IHJlc3RvcmVzIGNvcnJlY3QgQVBMSUMgc3RhdGUKaGFuZGxpbmcgYWNyb3NzIHN1c3BlbmQvcmVz
dW1lIHdpdGggdGhlIG5ldyBzeXNjb3JlIGludGVyZmFjZS4KCkZpeGVzOiBhOTdmYmMzZWUzZTIg
KCJzeXNjb3JlOiBQYXNzIGNvbnRleHQgZGF0YSB0byBjYWxsYmFja3MiKQpGaXhlczogMWM1NDZi
YjQzMzYxODg0MyAoImlycWNoaXAvcmlzY3YtYXBsaWM6IFByZXNlcnZlIEFQTElDIHN0YXRlcyBh
Y3Jvc3Mgc3VzcGVuZC9yZXN1bWUiKQpTaWduZWQtb2ZmLWJ5OiBTYW5qYXkgQ2hpdHJvZGEgPHNh
bmpheWVtYmVkZGVkc2VAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
YXBsaWMtbWFpbi5jIHwgMTIgKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtYXBsaWMtbWFpbi5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWlu
LmMKaW5kZXggYjc2MDk0MmU1N2Y5Li4xMjgzZDZlNjlmNWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbWFpbi5jCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtYXBsaWMtbWFpbi5jCkBAIC04OSw3ICs4OSw3IEBAIHN0YXRpYyB2b2lkIGFwbGljX3Nh
dmVfc3RhdGVzKHN0cnVjdCBhcGxpY19wcml2ICpwcml2KQogCX0KIH0KIAotc3RhdGljIGludCBh
cGxpY19zeXNjb3JlX3N1c3BlbmQodm9pZCkKK3N0YXRpYyBpbnQgYXBsaWNfc3lzY29yZV9zdXNw
ZW5kKHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IGFwbGljX3ByaXYgKnByaXY7CiAKQEAgLTk5LDcg
Kzk5LDcgQEAgc3RhdGljIGludCBhcGxpY19zeXNjb3JlX3N1c3BlbmQodm9pZCkKIAlyZXR1cm4g
MDsKIH0KIAotc3RhdGljIHZvaWQgYXBsaWNfc3lzY29yZV9yZXN1bWUodm9pZCkKK3N0YXRpYyB2
b2lkIGFwbGljX3N5c2NvcmVfcmVzdW1lKHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IGFwbGljX3By
aXYgKnByaXY7CiAKQEAgLTEwNywxMSArMTA3LDE1IEBAIHN0YXRpYyB2b2lkIGFwbGljX3N5c2Nv
cmVfcmVzdW1lKHZvaWQpCiAJCWFwbGljX3Jlc3RvcmVfc3RhdGVzKHByaXYpOwogfQogCi1zdGF0
aWMgc3RydWN0IHN5c2NvcmVfb3BzIGFwbGljX3N5c2NvcmVfb3BzID0geworc3RhdGljIGNvbnN0
IHN0cnVjdCBzeXNjb3JlX29wcyBhcGxpY19zeXNjb3JlX29wcyA9IHsKIAkuc3VzcGVuZCA9IGFw
bGljX3N5c2NvcmVfc3VzcGVuZCwKIAkucmVzdW1lID0gYXBsaWNfc3lzY29yZV9yZXN1bWUsCiB9
OwogCitzdGF0aWMgc3RydWN0IHN5c2NvcmUgYXBsaWNfc3lzY29yZSA9IHsKKwkub3BzID0gJmFw
bGljX3N5c2NvcmVfb3BzLAorfTsKKwogc3RhdGljIGludCBhcGxpY19wbV9ub3RpZmllcihzdHJ1
Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLCB1bnNpZ25lZCBsb25nIGFjdGlvbiwgdm9pZCAqZGF0YSkK
IHsKIAlzdHJ1Y3QgYXBsaWNfcHJpdiAqcHJpdiA9IGNvbnRhaW5lcl9vZihuYiwgc3RydWN0IGFw
bGljX3ByaXYsIGdlbnBkX25iKTsKQEAgLTM3Miw3ICszNzYsNyBAQCBzdGF0aWMgaW50IGFwbGlj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCWRldl9lcnJfcHJvYmUoZGV2
LCByYywgImZhaWxlZCB0byBzZXR1cCBBUExJQyBpbiAlcyBtb2RlXG4iLAogCQkJICAgICAgbXNp
X21vZGUgPyAiTVNJIiA6ICJkaXJlY3QiKTsKIAllbHNlCi0JCXJlZ2lzdGVyX3N5c2NvcmVfb3Bz
KCZhcGxpY19zeXNjb3JlX29wcyk7CisJCXJlZ2lzdGVyX3N5c2NvcmUoJmFwbGljX3N5c2NvcmUp
OwogCiAjaWZkZWYgQ09ORklHX0FDUEkKIAlpZiAoIWFjcGlfZGlzYWJsZWQpCi0tIAoyLjM0LjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
