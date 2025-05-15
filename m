Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1DDC3ABC9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0I+M9+7ee1Ea8PMQmmwF8p3WOc72RGdNIRNXxqFrnCc=; b=RJv5FC72VVTGtV
	eg1mZtkmaFcVDDcA9M+9i0yXXWZRwGVru0ty1d3m8Rzwv7r562xtjq6yw/kfvkmrDCddl9T+3FTAr
	z7gABHqom2lRTuIsifZ5oCJGdrtn0ifwRrUnbaLt/tLlnEvxbcF3xLNKxzN0zNZiZ8hC0s1VrWZ82
	BhxfQflR7kz/5RdaCy4bUBUG5liNRZ3Lo+/XJ74p6RlMy0wceOWb8PXLDdkanQfkqUze0DMkv6k2N
	knS7CJ93EAvS1MBjrXtwwdB1y3SNsquVqCN0CCxS/VPTE0yqPGttlx2IYheqKLbrdN7oFR/KLUwIe
	h1oOF3pldLVa0ijUXMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVRv-00000000FSI-0uxN;
	Thu, 15 May 2025 10:04:23 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUGO-000000002b2-3qtZ
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:48:26 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54fcd7186dfso754026e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747298903; x=1747903703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IhYYFU/0gd4i6u7YSldc/A6P4zLJhDJyiOeiCd5c27I=;
        b=eP54YOqSlsuDAST+FGizJw8qnMcu0GQ78e35qcEhSkEGio+edx47kh4/PGcBMLpVFM
         h+JKwWILsNst72JCRMcwyt3a1Xmcc0ShnY6rYXOdbF14oXt5gaDx+JULIgeB7rGDsgqj
         SYUeBe/ri/ZwTBWIsvG/I13j0fUIa9FMmXBfpVRXNWlT6AipFJhoCAB6Z6YHVYtYiBTe
         WXSz1+irEMoVDS70PDGvyydDNjZPjixCftts3njqIkCdVaZdeDm6Mpdvd8i+7lUQXk9F
         3F1+V0RPv56CSVFtVqgeTEeH2Myeiw9p/lnN10uer290/Q/M+GNNISqYcoHw2YXL02JQ
         BsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298903; x=1747903703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IhYYFU/0gd4i6u7YSldc/A6P4zLJhDJyiOeiCd5c27I=;
        b=n18Kjc1sjjv2kTbFOxkul8XyY82d0IL8hUb9hlYrRBNmH5orTIEhtRUbLv3NXjC9yk
         jQhJco1TNmNryG+yYikXOxunKRnk6Wo82h5Cimq2Jw+VXWv02iygd6D08QYRlISGk3+d
         Kt/Ayb9WBVcswjR2zdTRRgd2FlDhtnxtiQZlomx4RAYvIEx9ozRXsshY34ciglgrWwem
         SzPuhQmCbBFpTiJrx13KHdXRpIvAv/WGYz6rv8U3RiZeB+k3Ln4DX3rmfv8yMLw7foQP
         U2YSq9tAgGD650i64E1Esc19WAfhEvxKRAMPN5p59kp8zTIHAbNVNba4eWH8sLq0Bj4R
         GLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAtUoKzobAxvn2AzYVrAei/htHPwpKzx5pXRVrzd3C8Ma7ENVJMxC5tqyyTQMb67dkXxPTGVxAfMbBHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHzNU+IyEJGat5sibu/r0BRH1dz2f0TfVEmwif/Q1P2feK77WQ
	ZulUjeo7PpRh2EQgTytG+ADcPhUuA3YF9lSag/xukJldfSDQKrdccD7xzLS2lljhfxF8RFMumGD
	O
X-Gm-Gg: ASbGncuFJapGktLXLzIocrVVct28/konPfRuZVs+Ll22Ik2cDcmHHliI5LG4P5oPRjl
	rG1QHxXWTprHGtXlxlN8dZ0T+PIWVoSvq+92HJBok6XeCavxu6poZiWIvY3+0zNh0i5k9+j1Wdy
	crKplkRQV4I83e5SfEPCEyk4+T2ZYb+IGKX/USvRg8I26HWPUuh/6REN9kWHwqesTzuzEDEc03T
	hxIxb8qfEGrQ5jpOSlWGFlxIuNVVBwugFVxFFxhUE0nDkokXhkIrbSEz58F5Zyjx9f494XbhisA
	297FAgGtgJBrAiDLJ2weWhICFRI5f2LXkHQXYoDCmwos8TRwPbU=
X-Google-Smtp-Source: AGHT+IGnVdWt5OD2bKCz++KFVpJxcO50pC03iTHgGj6sIJhut7VYuKCl9xAAlL4aqjVD7tiXjB6LOw==
X-Received: by 2002:a05:600c:c0d2:20b0:442:f482:c421 with SMTP id 5b1f17b1804b1-442f482c78emr24654775e9.22.1747297431669;
        Thu, 15 May 2025 01:23:51 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:50 -0700 (PDT)
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
Subject: [PATCH v7 06/14] riscv: misaligned: request misaligned exception from SBI
Date: Thu, 15 May 2025 10:22:07 +0200
Message-ID: <20250515082217.433227-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_014824_952322_4AB9D1AC 
X-CRM114-Status: GOOD (  17.31  )
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
