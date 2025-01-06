Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BC3E77198
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D8gYm1UR71yrMoa/cg1QHqKtmih1oRuAa8wG7eT7BN8=; b=X+FLeGHnEz9CpR
	d2ql0N4EWHYfzx9MNc4oeLB5WmrcD8tGWjlDDTVms58ut1I1So+kh1wT+i5Jj5hpZCR0jYj+jJZkn
	sRIZF5O8dVyD+YSH9OFwx4A6OjhbKhlSatUw020lUL3W0K+l3GwSXe9bT2lpRgvjrgxpdw7frxiul
	rCkNfd67zSTlC2F2FJFwDDFlP14Ul1GmBjGn+/hpJYt2RQld+uS5guKlUixbDlZP/kna3BuaEmSF8
	oSs8RqeMMEx2d/zGoqWFm2x/VVHqhBQ5sQfaYbPypNcY6RTRZOA+dlXLXtgXYGNObTxPonCKJLa3C
	GSVBDY7EATA08arKPZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqf1-000000024xv-10vx;
	Mon, 06 Jan 2025 17:13:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqbU-000000024XN-1bpK
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 17:09:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2164b662090so185368255ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 09:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736183364; x=1736788164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbce092ZLczhOhH4XTVRQYxBwIS56/FODTEPeJDdcKI=;
        b=Vj55M9qVaLKcKuib7Xn2Kymqp8rO32tC/wcctWcm2aiPv08KaCjRjoh0oxWa+2pXu1
         wbG0h28c1mWBr0Z+GulxQZI8X0gZU5O7K2zGlDluSzTIIOs7sXIbW4MNNbqFh+uQXHhv
         YX3TuDW8S17KjcssG0Ch5PwWgcU8cOtb3AaVeFvml33wyf6jiR8X1Inu8nB8rJWqmLPu
         +ahRiwfiM/fVCToKdXHbyQ7V4PQOtOwH4zsdQ1wwJ6sSMrkEB8Ze4PHxuYmoAGYYTo+H
         TipzgScOU//eqHXLFZpQ7M8QnCKCEPuAy9lqvJwWIIdkrBkok3TexVhntSVSiRcc3Ja5
         yuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736183364; x=1736788164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbce092ZLczhOhH4XTVRQYxBwIS56/FODTEPeJDdcKI=;
        b=GZvTdeLzmPJjJ7css+rYeyCFcTGhxop8l4qsyOJD9usopnCwvWJq10D0RrLpBP7Ix/
         54k/i1BcG0qI12CVrIrVgg0cxNRhjLAAt0pr0C76ZNPgIKBNgpfFFVK5VFzUpRY2+vle
         EiVIXh0a8JnfVxU7preIwTiuGH8xnms8gHYONXIImGOtmEi7zbzzPmVM5r91iPhHGPNH
         PSMg8Ml4vzL/xOzqWQoRvct/tvSKMNaw/q9KUfkIwa3EGEIDnkF8xVRQDqt80lGm2oec
         okyDJ7MozUfVLjxUD/9yu8RLs2UZ1yb6U5DgUTt0SZbboDjcIXedSKusUOVLnuaFC0ve
         GoIg==
X-Forwarded-Encrypted: i=1; AJvYcCXYfcsmCbqEVPk7EFEVyfE32zCSkeoT0DrlbQJRVvU9TX180EQVQ4UlB9imZXEE/jFp0v4cGdoPiqUR6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yziw9nxo7UXfRTnlmgL/83jCLB3Dr9Hy9+G5NmT/3+/M3NvwBS2
	Xfm2ZU4wYXzQWRv3PaaIvV1GXBjiFA1GbpOBHBfTAqA6PpdG3yPHNLpNCOEuGao=
X-Gm-Gg: ASbGncskQUan7matvyZOX3SNi7XKrb6/feFqfVWoRFChslyBeDQEJR8IQHsr6Fn2BAq
	Z+ErantwXClKq9n9+Bkf72WhwgLDm1OCmp2gwBPLk9XQTwHwe2lWyPXcV5vhJznIhD2OCz4zPMD
	odjM2FkFXmLw5cVgqtwVHNM8GjUYVBgEpS+l3JppLpuwjJgNAYWdmL7Q0GsVVKIneYUzBejJh0V
	kUEY/6loNSMz/Yf71Vixzb5MYpfscDSEPoyaGse/b7UJnXrIubgP91HWw==
X-Google-Smtp-Source: AGHT+IHUY4CZVBm/XKZtAhXutDUGhNJ1CtZDaw4qM0q1zL+zzKqxOLozbGljgiIr1MNwrItiL0PUzQ==
X-Received: by 2002:a05:6a21:6f87:b0:1e0:c432:32fe with SMTP id adf61e73a8af0-1e5e04a444fmr86089298637.26.1736183363740;
        Mon, 06 Jan 2025 09:09:23 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8163fdsm31602646b3a.6.2025.01.06.09.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 09:09:23 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] riscv: misaligned: disable pagefault before accessing user memory
Date: Mon,  6 Jan 2025 18:09:08 +0100
Message-ID: <20250106170911.1403467-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090924_690434_34A16481 
X-CRM114-Status: GOOD (  15.18  )
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

Q2FsbGluZyBjb3B5X3tmcm9tL3RvfV91c2VyKCkgaW4gaW50ZXJydXB0IGNvbnRleHQgbWlnaHQg
YWN0dWFsbHkgc2xlZXAKYW5kIGRpc3BsYXkgYSBCVUcgbWVzc2FnZToKClsgICAxMC4zNzcwMTld
IEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0IGlu
Y2x1ZGUvbGludXgvdWFjY2Vzcy5oOjE2MgpbICAgMTAuMzc5ODY4XSBpbl9hdG9taWMoKTogMCwg
aXJxc19kaXNhYmxlZCgpOiAxLCBub25fYmxvY2s6IDAsIHBpZDogODgsIG5hbWU6IHNzaC1rZXln
ZW4KWyAgIDEwLjM4MDAwOV0gcHJlZW1wdF9jb3VudDogMCwgZXhwZWN0ZWQ6IDAKWyAgIDEwLjM4
MDMyNF0gQ1BVOiAwIFVJRDogMCBQSUQ6IDg4IENvbW06IHNzaC1rZXlnZW4gTm90IHRhaW50ZWQg
Ni4xMy4wLXJjNS0wMDAxMy1nMzQzNWNkNWYxMzMxLWRpcnR5ICMxOQpbICAgMTAuMzgwNjM5XSBI
YXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpClsgICAxMC4zODA3OThdIENhbGwg
VHJhY2U6ClsgICAxMC4zODExMDhdIFs8ZmZmZmZmZmY4MDAxM2QzMD5dIGR1bXBfYmFja3RyYWNl
KzB4MWMvMHgyNApbICAgMTAuMzgxNjkwXSBbPGZmZmZmZmZmODAwMDIyZDg+XSBzaG93X3N0YWNr
KzB4MjgvMHgzNApbICAgMTAuMzgxODEyXSBbPGZmZmZmZmZmODAwMGVlMWM+XSBkdW1wX3N0YWNr
X2x2bCsweDRhLzB4NjgKWyAgIDEwLjM4MTk1OF0gWzxmZmZmZmZmZjgwMDBlZTRlPl0gZHVtcF9z
dGFjaysweDE0LzB4MWMKWyAgIDEwLjM4MjA0N10gWzxmZmZmZmZmZjgwMDY1ZTBhPl0gX19taWdo
dF9yZXNjaGVkKzB4ZmEvMHgxMDQKWyAgIDEwLjM4MjE3Ml0gWzxmZmZmZmZmZjgwMDY1ZTU2Pl0g
X19taWdodF9zbGVlcCsweDQyLzB4NjYKWyAgIDEwLjM4MjI2N10gWzxmZmZmZmZmZjgwMWIwYzVl
Pl0gX19taWdodF9mYXVsdCsweDFjLzB4MjQKWyAgIDEwLjM4MjM2M10gWzxmZmZmZmZmZjgwNDQx
NWU0Pl0gX2NvcHlfZnJvbV91c2VyKzB4MjgvMHhjMgpbICAgMTAuMzgyNDU5XSBbPGZmZmZmZmZm
ODAwMTUyY2E+XSBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKzB4MWNhLzB4MmZjClsgICAxMC4zODI1
NjVdIFs8ZmZmZmZmZmY4MGEwMzNhMD5dIGRvX3RyYXBfbG9hZF9taXNhbGlnbmVkKzB4MjQvMHhl
ZQpbICAgMTAuMzgyNzE0XSBbPGZmZmZmZmZmODBhMGRjNjY+XSBoYW5kbGVfZXhjZXB0aW9uKzB4
MTQ2LzB4MTUyCgpJbiBvcmRlciB0byBzYWZlbHkgaGFuZGxlIHVzZXIgbWVtb3J5IGFjY2VzcyBm
cm9tIHRoaXMgY29udGV4dCwgZGlzYWJsZQpwYWdlIGZhdWx0IHdoaWxlIGNvcHlpbmcgdXNlciBt
ZW1vcnkuIEFsdGhvdWdoIHRoaXMgbWlnaHQgbGVhZCB0byBjb3B5CmZhaWx1cmUgaW4gc29tZSBj
YXNlcyAob2ZmbGluZWQgcGFnZSksIHRoaXMgaXMgdGhlIGJlc3Qgd2UgY2FuIHRyeSB0byBiZQpz
YWZlLiBXaGlsZSBhdCBpdCwgcmVwbGFjZSBfX2dldF91c2VyIGJ5IGdldF91c2VyKCkgdG8gYWN0
dWFsbHkgY2hlY2sKZm9yIG1lbW9yeSBiZWZvcmUgYWNjZXNzaW5nIGl0IGFuZCBkaXNhYmxlIGZh
dWx0LgoKRml4ZXM6IGI2ODZlY2RlYWNmNiAoInJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmljdCB1
c2VyIGFjY2VzcyB0byBrZXJuZWwgbWVtb3J5IikKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKLS0tCgpWMjoKIC0gQWRkIHBhZ2VmYXVsdCBkaXNh
YmxlL2VuYWJsZSBhcm91bmQgZ2V0X3VzZXIoKQoKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21p
c2FsaWduZWQuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwppbmRleCA3Y2MxMDhhZWQ3NGUuLmQ5YTZlNDRhZTc0NSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtMjY4LDcgKzI2OCw5IEBAIHN0YXRpYyB1bnNp
Z25lZCBsb25nIGdldF9mMzJfcnModW5zaWduZWQgbG9uZyBpbnNuLCB1OCBmcF9yZWdfb2Zmc2V0
LAogCWludCBfX3JldDsJCQkJCVwKIAkJCQkJCQlcCiAJaWYgKHVzZXJfbW9kZShyZWdzKSkgewkJ
CQlcCi0JCV9fcmV0ID0gX19nZXRfdXNlcihpbnNuLCAodHlwZSBfX3VzZXIgKikgaW5zbl9hZGRy
KTsgXAorCQlwYWdlZmF1bHRfZGlzYWJsZSgpOwkJCVwKKwkJX19yZXQgPSBnZXRfdXNlcihpbnNu
LCAodHlwZSBfX3VzZXIgKikgaW5zbl9hZGRyKTsgXAorCQlwYWdlZmF1bHRfZW5hYmxlKCk7CQkJ
XAogCX0gZWxzZSB7CQkJCQlcCiAJCWluc24gPSAqKHR5cGUgKilpbnNuX2FkZHI7CQlcCiAJCV9f
cmV0ID0gMDsJCQkJXApAQCAtMzU1LDcgKzM1Nyw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NjYWxh
cl9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CiAJdW5pb24gcmVnX2Rh
dGEgdmFsOwogCXVuc2lnbmVkIGxvbmcgZXBjID0gcmVncy0+ZXBjOwotCXVuc2lnbmVkIGxvbmcg
aW5zbjsKKwl1bnNpZ25lZCBsb25nIGluc24sIGNvcHlfbGVuOwogCXVuc2lnbmVkIGxvbmcgYWRk
ciA9IHJlZ3MtPmJhZGFkZHI7CiAJaW50IGZwID0gMCwgc2hpZnQgPSAwLCBsZW4gPSAwOwogCkBA
IC00NDEsNyArNDQzLDE2IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xv
YWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAl2YWwuZGF0YV91NjQgPSAwOwogCWlmICh1c2Vy
X21vZGUocmVncykpIHsKLQkJaWYgKGNvcHlfZnJvbV91c2VyKCZ2YWwsICh1OCBfX3VzZXIgKilh
ZGRyLCBsZW4pKQorCQkvKgorCQkgKiBXZSBjYW4gbm90IHNsZWVwIGluIGV4Y2VwdGlvbiBjb250
ZXh0LiBEaXNhYmxlIHBhZ2VmYXVsdCB0bworCQkgKiBhdm9pZCBhIHBvdGVudGlhbCBzbGVlcCB3
aGlsZSBhY2Nlc3NpbmcgdXNlciBtZW1vcnkuIFNpZGUKKwkJICogZWZmZWN0IGlzIHRoYXQgaWYg
aXQgd291bGQgaGF2ZSBzbGVlcCwgdGhlbiB0aGUgY29weSB3aWxsCisJCSAqIGZhaWwuCisJCSAq
LworCQlwYWdlZmF1bHRfZGlzYWJsZSgpOworCQljb3B5X2xlbiA9IGNvcHlfZnJvbV91c2VyKCZ2
YWwsICh1OCBfX3VzZXIgKilhZGRyLCBsZW4pOworCQlwYWdlZmF1bHRfZW5hYmxlKCk7CisJCWlm
IChjb3B5X2xlbikKIAkJCXJldHVybiAtMTsKIAl9IGVsc2UgewogCQltZW1jcHkoJnZhbCwgKHU4
ICopYWRkciwgbGVuKTsKQEAgLTQ2Myw3ICs0NzQsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9zY2Fs
YXJfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAl1bmlvbiByZWdf
ZGF0YSB2YWw7CiAJdW5zaWduZWQgbG9uZyBlcGMgPSByZWdzLT5lcGM7Ci0JdW5zaWduZWQgbG9u
ZyBpbnNuOworCXVuc2lnbmVkIGxvbmcgaW5zbiwgY29weV9sZW47CiAJdW5zaWduZWQgbG9uZyBh
ZGRyID0gcmVncy0+YmFkYWRkcjsKIAlpbnQgbGVuID0gMCwgZnAgPSAwOwogCkBAIC01MzksNyAr
NTUwLDE2IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX3N0b3JlKHN0cnVj
dCBwdF9yZWdzICpyZWdzKQogCQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAKIAlpZiAodXNlcl9tb2Rl
KHJlZ3MpKSB7Ci0JCWlmIChjb3B5X3RvX3VzZXIoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxl
bikpCisJCS8qCisJCSAqIFdlIGNhbiBub3Qgc2xlZXAgaW4gZXhjZXB0aW9uIGNvbnRleHQuIERp
c2FibGUgcGFnZWZhdWx0IHRvCisJCSAqIGF2b2lkIGEgcG90ZW50aWFsIHNsZWVwIHdoaWxlIGFj
Y2Vzc2luZyB1c2VyIG1lbW9yeS4gU2lkZQorCQkgKiBlZmZlY3QgaXMgdGhhdCBpZiBpdCB3b3Vs
ZCBoYXZlIHNsZWVwLCB0aGVuIHRoZSBjb3B5IHdpbGwKKwkJICogZmFpbC4KKwkJICovCisJCXBh
Z2VmYXVsdF9kaXNhYmxlKCk7CisJCWNvcHlfbGVuID0gY29weV90b191c2VyKCh1OCBfX3VzZXIg
KilhZGRyLCAmdmFsLCBsZW4pOworCQlwYWdlZmF1bHRfZW5hYmxlKCk7CisJCWlmIChjb3B5X2xl
bikKIAkJCXJldHVybiAtMTsKIAl9IGVsc2UgewogCQltZW1jcHkoKHU4ICopYWRkciwgJnZhbCwg
bGVuKTsKLS0gCjIuNDcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
