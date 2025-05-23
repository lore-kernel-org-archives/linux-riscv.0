Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BA0C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0I+M9+7ee1Ea8PMQmmwF8p3WOc72RGdNIRNXxqFrnCc=; b=xwMBifIFHScV7r
	gBgI7des5ZPzDJ6J4+jceNW8hhgE2HoDE7Qe2BcUSYOEaB8ftthAc3D9/HDoRu6EquWuvb1mKEkzA
	iQwFhpYdtQUlLig87u0Ue1cBuAkeLTftZvGvSowHaXyqvEihh7/LZFgeMOiSPWbgTIzAlxF2H/vKt
	vu/cm+yh1TQMY4C2ja8LETryS5090U8RDSruBDLnGwO8Cro9qMqSNWhszKkBCBDuMMUGaLinSpyCV
	B9Z+i3PSnUl+wHE5akAF5rOt3s447ZCG/qh83Dyml0qqK+KCDFQmEhGDIJygGw3ObMXmbBsq0bTuZ
	HoW6h5uPzEWVF07b/BAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQUr-00000003hOE-2lQf;
	Fri, 23 May 2025 11:23:29 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPX8-00000003Zah-3SRX
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:21:49 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so617568b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995706; x=1748600506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhYYFU/0gd4i6u7YSldc/A6P4zLJhDJyiOeiCd5c27I=;
        b=mSYRaNpL/c1iWSw5XSKptRmV5ZQmorOtbfbfPfdwU0YdzJzUM9o+y8ypJowOdSD5E9
         u0rerD5hr0tBz3hQNfHqchqbsBAGuomDwgl/sRvGs2kSLIWGZDRriNPJ12A6jSRaj8xb
         RcU2jZLjHe/7aX9uknraSXLX1eBptQUkXbdenjGLf/WO2AtA89umFTKYEOvr2X1RtofZ
         RjNykuOInWA6NxaZbi898eqZpVfAD1V7yY0ndaapTYRxnsx9YIPouIRlnej1FdH8XI+N
         OnU8E8sMpZXyY9jZyJkeJE4HrUmynhtOunIMpbugWn1yrB9YsSQaXmCJeol38dZlskCu
         1nMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995706; x=1748600506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhYYFU/0gd4i6u7YSldc/A6P4zLJhDJyiOeiCd5c27I=;
        b=jVKyNprm4AmVKDBYW3QfOtT0nBvOJ4I55B7VQLL420nrYxRk4vM5dOJfCZgaQp1Va7
         DkBtgYT5f+lyRjYJZ39sUqBENKpqknhSjF9nDh4Y+XFJtqvxf3sp7ieTqVFTSKg9OTVy
         phAX7hCM1nc+N9EJcQowM64gU32g/mH8ZVcgDBhQaB9cVu3KiGnTU3c3/Zo1CQuzN78z
         A/xCQfsZbJtGtlputDI/pY99S6iKaoUq2AAuSp+pNMeP/r5qF3HWUSHit/8/DGLCyaPE
         JQdEJ8imySJG2PXpGdMQgJyCVCu3YSBAt3YyAK74Vla/a2lrhuqUnCYWV7aZdzuWjoKf
         yRvw==
X-Forwarded-Encrypted: i=1; AJvYcCXYsuJUv409Q054I9Q4QZuVvSNlWIg3gw/WGSdCnNXir9BwGo6JfXi4fKNLFPc+1QiT/QzpQhp4d6p6vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH751DrP0hiASEAOUmp8JOEzd8mV98scg/ISOv3iR3UPshYXFi
	9YBj4D1NRr526Ccy3T8p0S/2WgJDjKFRtsyaBm7UE5sRmcZVINvXcNmMMC5og1SAvt8=
X-Gm-Gg: ASbGnctoLehJGmY4g1i0R3/iV5dib7+B2QzXHoXJJWbqVOG/Dcbb41BzmFBGbLafYH4
	D07BJP7COCwcUAEl42a9co7sVOlId34YznoOqGxy1/k6JVFDz/7x6XApk2ZnxeVcM7rAeIk/XaU
	N74EsqqvRa0Z8PLw7EtZTUAcbMqNi8JhNHaPg0vhX4YM5b/8eXyXxVKlEmDfF4WyXBINSMQMJpT
	EyjVxAIqIchzD4FyqGmrBg8EjR9/UFuuJAyU92Kz87S2BcSq5Ox4BcdWbd5oGDPNIbZJgdlhQyV
	1DpMuEBL07YPp90e+p1L4YrcrtauoX1sD7WbLye0fDKFPIAgoD4r
X-Google-Smtp-Source: AGHT+IEW5zIvgGrf4J2JPU+RfVPEVNYeolq5lDuRr8EIG1ZwFlPwY4rwwgkEvYtvbmxBwdf6M7Mlkg==
X-Received: by 2002:a05:6a21:a342:b0:201:8a06:6e3b with SMTP id adf61e73a8af0-21877a7d9a8mr5649742637.9.1747995705993;
        Fri, 23 May 2025 03:21:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:45 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 06/14] riscv: misaligned: request misaligned exception from SBI
Date: Fri, 23 May 2025 12:19:23 +0200
Message-ID: <20250523101932.1594077-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032146_863687_A13C9BE0 
X-CRM114-Status: GOOD (  17.47  )
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

Tm93IHRoYXQgdGhlIGtlcm5lbCBjYW4gaGFuZGxlIG1pc2FsaWduZWQgYWNjZXNzZXMgaW4gUy1t
b2RlLCByZXF1ZXN0Cm1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBkZWxlZ2F0aW9uIGZyb20g
U0JJLiBUaGlzIHVzZXMgdGhlIEZXRlQgU0JJCmV4dGVuc2lvbiBkZWZpbmVkIGluIFNCSSB2ZXJz
aW9uIDMuMC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgIHwgIDMgKy0K
IGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgICAgICB8IDcxICsrKysrKysr
KysrKysrKysrKysrKy0KIGFyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQu
YyB8ICA4ICsrLQogMyBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXggZjU2YjQwOTM2MWZiLi5k
YmU1OTcwZDRmZTYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCkBAIC02Nyw4ICs2
Nyw5IEBAIHZvaWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKTsKIAlfUklTQ1Zf
SVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJfZXh0cywgQVJSQVlfU0laRShfc3ViX2V4dHMp
LCBfdmFsaWRhdGUpCiAKIGJvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0
ZWRfYWxsX2NwdXModm9pZCk7Cit2b2lkIHVuYWxpZ25lZF9hY2Nlc3NfaW5pdCh2b2lkKTsKK2lu
dCBjcHVfb25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KTsKICNp
ZiBkZWZpbmVkKENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCkKLXZvaWQgY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNf
dW51c2VkKTsKIHZvaWQgdW5hbGlnbmVkX2VtdWxhdGlvbl9maW5pc2godm9pZCk7CiBib29sIHVu
YWxpZ25lZF9jdGxfYXZhaWxhYmxlKHZvaWQpOwogREVDTEFSRV9QRVJfQ1BVKGxvbmcsIG1pc2Fs
aWduZWRfYWNjZXNzX3NwZWVkKTsKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRl
eCA3N2M3ODg2NjAyMjMuLjU5MmIxYTI4ZTg5NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1ZGUgPGFzbS9lbnRyeS1jb21tb24uaD4K
ICNpbmNsdWRlIDxhc20vaHdwcm9iZS5oPgogI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cisj
aW5jbHVkZSA8YXNtL3NiaS5oPgogI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KIAogI2RlZmluZSBJ
TlNOX01BVENIX0xCCQkJMHgzCkBAIC02NDYsNyArNjQ3LDcgQEAgYm9vbCBfX2luaXQgY2hlY2tf
dmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIAogc3RhdGlj
IGJvb2wgdW5hbGlnbmVkX2N0bCBfX3JlYWRfbW9zdGx5OwogCi12b2lkIGNoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNl
ZCkKK3N0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKIHsKIAlpbnQgY3B1ID0gc21wX3Byb2Nl
c3Nvcl9pZCgpOwogCWxvbmcgKm1hc19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nl
c3Nfc3BlZWQsIGNwdSk7CkBAIC02NTcsNiArNjU4LDEzIEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2Vk
KQogCV9fYXNtX18gX192b2xhdGlsZV9fICgKIAkJIiAgICAgICAiUkVHX0wiICVbdG1wXSwgMSgl
W3B0cl0pXG4iCiAJCTogW3RtcF0gIj1yIiAodG1wX3ZhbCkgOiBbcHRyXSAiciIgKCZ0bXBfdmFy
KSA6ICJtZW1vcnkiKTsKK30KKworc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfZW11bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKK3sKKwlsb25nICptYXNfcHRyID0g
cGVyX2NwdV9wdHIoJm1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpOworCisJY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZChOVUxMKTsKIAogCS8qCiAJICogSWYgdW5hbGlnbmVkX2N0
bCBpcyBhbHJlYWR5IHNldCwgdGhpcyBtZWFucyB0aGF0IHdlIGRldGVjdGVkIHRoYXQgYWxsCkBA
IC02NjUsOSArNjczLDEwIEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2VkKQogCSAqLwogCWlmICh1bmxp
a2VseSh1bmFsaWduZWRfY3RsICYmICgqbWFzX3B0ciAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfU0NBTEFSX0VNVUxBVEVEKSkpIHsKIAkJcHJfY3JpdCgiQ1BVIG1pc2FsaWduZWQgYWNjZXNz
ZXMgbm9uIGhvbW9nZW5lb3VzIChleHBlY3RlZCBhbGwgZW11bGF0ZWQpXG4iKTsKLQkJd2hpbGUg
KHRydWUpCi0JCQljcHVfcmVsYXgoKTsKKwkJcmV0dXJuIC1FSU5WQUw7CiAJfQorCisJcmV0dXJu
IDA7CiB9CiAKIGJvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxs
X2NwdXModm9pZCkKQEAgLTY5OSw0ICs3MDgsNjAgQEAgYm9vbCBfX2luaXQgY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQogewogCXJldHVybiBmYWxzZTsKIH0K
K3N0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHVu
c2lnbmVkIGludCBjcHUpCit7CisJcmV0dXJuIDA7Cit9CisjZW5kaWYKKworI2lmZGVmIENPTkZJ
R19SSVNDVl9TQkkKKworc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQ7CisK
K3N0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5hbGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBj
cHUpCit7CisJaWYgKHNiaV9md2Z0X3NldChTQklfRldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywg
MSwgMCkgJiYKKwkgICAgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQpIHsKKwkJcHJfY3JpdCgi
TWlzYWxpZ25lZCB0cmFwIGRlbGVnYXRpb24gbm9uIGhvbW9nZW5lb3VzIChleHBlY3RlZCBkZWxl
Z2F0ZWQpIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCXJldHVybiAwOworfQorCit2b2lk
IF9faW5pdCB1bmFsaWduZWRfYWNjZXNzX2luaXQodm9pZCkKK3sKKwlpbnQgcmV0OworCisJcmV0
ID0gc2JpX2Z3ZnRfc2V0X29ubGluZV9jcHVzKFNCSV9GV0ZUX01JU0FMSUdORURfRVhDX0RFTEVH
LCAxLCAwKTsKKwlpZiAocmV0KQorCQlyZXR1cm47CisKKwltaXNhbGlnbmVkX3RyYXBzX2RlbGVn
YXRlZCA9IHRydWU7CisJcHJfaW5mbygiU0JJIG1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBk
ZWxlZ2F0aW9uIG9rXG4iKTsKKwkvKgorCSAqIE5vdGUgdGhhdCB3ZSBkb24ndCBoYXZlIHRvIHRh
a2UgYW55IHNwZWNpZmljIGFjdGlvbiBoZXJlLCBpZgorCSAqIHRoZSBkZWxlZ2F0aW9uIGlzIHN1
Y2Nlc3NmdWwsIHRoZW4KKwkgKiBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKCkgd2ls
bCB2ZXJpZnkgdGhhdCBpbmRlZWQgdGhlCisJICogcGxhdGZvcm0gdHJhcHMgb24gbWlzYWxpZ25l
ZCBhY2Nlc3Nlcy4KKwkgKi8KK30KKyNlbHNlCit2b2lkIF9faW5pdCB1bmFsaWduZWRfYWNjZXNz
X2luaXQodm9pZCkge30KKworc3RhdGljIGludCBjcHVfb25saW5lX3NiaV91bmFsaWduZWRfc2V0
dXAodW5zaWduZWQgaW50IGNwdSBfX2Fsd2F5c191bnVzZWQpCit7CisJcmV0dXJuIDA7Cit9CiAj
ZW5kaWYKKworaW50IGNwdV9vbmxpbmVfdW5hbGlnbmVkX2FjY2Vzc19pbml0KHVuc2lnbmVkIGlu
dCBjcHUpCit7CisJaW50IHJldDsKKworCXJldCA9IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9z
ZXR1cChjcHUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlyZXR1cm4gY3B1X29ubGlu
ZV9jaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGNwdSk7Cit9CmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKaW5kZXggYjhiYTEzODE5ZDA1Li5hZTIwNjg0
MjVmYmMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3VuYWxpZ25lZF9hY2Nlc3Nfc3Bl
ZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMKQEAg
LTIzNiw2ICsyMzYsMTEgQEAgYXJjaF9pbml0Y2FsbF9zeW5jKGxvY2tfYW5kX3NldF91bmFsaWdu
ZWRfYWNjZXNzX3N0YXRpY19icmFuY2gpOwogCiBzdGF0aWMgaW50IHJpc2N2X29ubGluZV9jcHUo
dW5zaWduZWQgaW50IGNwdSkKIHsKKwlpbnQgcmV0ID0gY3B1X29ubGluZV91bmFsaWduZWRfYWNj
ZXNzX2luaXQoY3B1KTsKKworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAkvKiBXZSBhcmUg
YWxyZWFkeSBzZXQgc2luY2UgdGhlIGxhc3QgY2hlY2sgKi8KIAlpZiAocGVyX2NwdShtaXNhbGln
bmVkX2FjY2Vzc19zcGVlZCwgY3B1KSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFS
X1VOS05PV04pIHsKIAkJZ290byBleGl0OwpAQCAtMjQ4LDcgKzI1Myw2IEBAIHN0YXRpYyBpbnQg
cmlzY3Zfb25saW5lX2NwdSh1bnNpZ25lZCBpbnQgY3B1KQogCXsKIAkJc3RhdGljIHN0cnVjdCBw
YWdlICpidWY7CiAKLQkJY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZChOVUxMKTsKIAkJ
YnVmID0gYWxsb2NfcGFnZXMoR0ZQX0tFUk5FTCwgTUlTQUxJR05FRF9CVUZGRVJfT1JERVIpOwog
CQlpZiAoIWJ1ZikgewogCQkJcHJfd2FybigiQWxsb2NhdGlvbiBmYWlsdXJlLCBub3QgbWVhc3Vy
aW5nIG1pc2FsaWduZWQgcGVyZm9ybWFuY2VcbiIpOwpAQCAtNDM5LDYgKzQ0Myw4IEBAIHN0YXRp
YyBpbnQgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfYWxsX2NwdXModm9pZCkKIHsKIAlp
bnQgY3B1OwogCisJdW5hbGlnbmVkX2FjY2Vzc19pbml0KCk7CisKIAlpZiAodW5hbGlnbmVkX3Nj
YWxhcl9zcGVlZF9wYXJhbSAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX1VOS05P
V04pIHsKIAkJcHJfaW5mbygic2NhbGFyIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgc2V0IHRvICcl
cycgKCVsdSkgYnkgY29tbWFuZCBsaW5lXG4iLAogCQkJc3BlZWRfc3RyW3VuYWxpZ25lZF9zY2Fs
YXJfc3BlZWRfcGFyYW1dLCB1bmFsaWduZWRfc2NhbGFyX3NwZWVkX3BhcmFtKTsKLS0gCjIuNDku
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
