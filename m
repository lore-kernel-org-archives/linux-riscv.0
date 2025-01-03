Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EF6E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qJChpW6oLTcPzJkKUAigCv0fh0p9YlahI1QRjHkymuM=; b=vTEtNzG6juG7mu
	OmNm687GFcY+gA6IqJMQtFmWz+gdcB+GSj3qq5f9NNgjhLSBIGI1D0Rpcr0Vc51w52rKmCOpbB2Tt
	iAo4VbmmN/aQq8pu3Pg5LlMdIF//pU98uHDOOVkEe9T72tRMt6JCTMfMINyupzaUTwEXnV7DAq4wy
	4BaFSDkkGt3/KtJdoTGuFBGDuKqkIBzKntm3c9qrPaKtD7l/O8jRiTYp4N6g3BUFEezkW0/7SUbFK
	2s/IJE/C4ohOPCoQcC1uaJHavp/Ec0yc50QX0wz9/zc5pQSXlLh/aM7NAO4dbkK8593Sjvg6zfuyI
	ZazPB10Rz01sHJ+0xOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTk80-0000000DN64-0yDK;
	Fri, 03 Jan 2025 16:02:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTk7x-0000000DN5M-0llf
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 16:02:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso75185755e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735920139; x=1736524939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HhnXhiBJBFC7C+Aawkh2Vz/9safPS+mJzsnuCa4fu70=;
        b=ZTB+YA1ee5Xrdbn9w/cv0n9lemAMHjWjOKxTTdfjDWw2DZz9J+S+T2oU4dWkxidZs+
         LpfzTHrWcTpfN3v2C/gn04BiSB57sK8wQgBABYCoIO+4OBZG/FJaGrpI05T1NN5cCeu7
         O959JihPFULqF0TaBiSN6Aqa2NOyvdIcMcj/2F5oGP4ZTNq+dM6Ch3OdpEMDN4RXnKvV
         a0ZlDQNNpbnnaaUB1hn9MNXavTPbluVs+1fgC5O1EJIFFGzRoOijcRJcW26rLHLaMK97
         UN+ul5GpDr/a3+Mw2GJFv5UkaNZJU30aTvKC9vfAN+rOwwhDEvcQUGCCfhXVcN0UbSXB
         lkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735920139; x=1736524939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhnXhiBJBFC7C+Aawkh2Vz/9safPS+mJzsnuCa4fu70=;
        b=OlGAv84dxUJIcElc0PuG93xizEmgbEDNO1X+W15znkVp5wXk2Zwil2SPoD47utu+7e
         o4imslGOuFX8FB5cgoXUIW2KYZP/HDdXqrvm1VFmmPY1zAQunZdOCojl+A9T9hUA3UIj
         dQuXScVZIYZ3x0rWGGgb8d/yorN4+7wW0znItxe7WJgl6/RsNw7E2aeAonIEQIVTsSBz
         WbdANbr8y3TaALzW2SF/nFAhCrF/CPYCu2HP+6ExMrtiUJ7DFrIHi8HJuPb/wp7epeN8
         DapfUeh3zzMSc/gCPnCEDNTA4XPQf0e7BGUn/bDdTQ/S7lWilIrg1rAyBHjPi7d8WOTM
         A42w==
X-Forwarded-Encrypted: i=1; AJvYcCWl05w1vvec0zX8ocaX/2bEIGRZgKySnbBFGh+8YIIJOgxj/QJ3MIoWuquyeve0Y7MAYr/CjwERoqYMsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrJ4B6hlflZ5Ru6FrjaefWZv9EvjJo2sxT/hp4/o7tqdNR6ZJs
	N1/q8dat7E111pTI2rxaOxutEJKODZLl9jQZIWRDC65yknYujm97hCoWlT7kDSU=
X-Gm-Gg: ASbGnctzRvKN86cEO/o2eLDmMH0IMNIBBzF9LTs1EE1vhPs2mMP2tXoF5nB/P4cDu+J
	cXg6/PzP5NxJuz9tv6B6udDbNqwr9A7IVWcB77NbcE0hLvCBTfLty/YUqYk6HKcaJlRpEb64G9C
	M29pGCSBZw7703EyAuD0FeH5lvc/E+6z2Ig1IlFsL2KjLFcgkIsxWYIlYC3DAA5Dyqfg4vePzPj
	ZxgKZXn24YvyO05eY/nkE1Yh/OJX451ugmWBwYosahfJim33HvvN8ijOA==
X-Google-Smtp-Source: AGHT+IGiH4f+iFtbqTHqAIn7gziVnGP9IrLLBkdeE5qloAxEpQ4ctpaVRx832Uo/qr0BTEO5Y13l5A==
X-Received: by 2002:a7b:c7cd:0:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-4365c51e2a3mr433112145e9.0.1735920139460;
        Fri, 03 Jan 2025 08:02:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm486312685e9.1.2025.01.03.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:02:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] riscv: misaligned: disable pagefault before accessing user memory
Date: Fri,  3 Jan 2025 17:02:12 +0100
Message-ID: <20250103160214.657508-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_080221_490234_C11B2C54 
X-CRM114-Status: GOOD (  13.13  )
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
YWZlLgoKRml4ZXM6IGI2ODZlY2RlYWNmNiAoInJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmljdCB1
c2VyIGFjY2VzcyB0byBrZXJuZWwgbWVtb3J5IikKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jCmluZGV4IDdjYzEwOGFlZDc0ZS4uNzVhMDhlZDIwMDcwIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0zNTUsNyArMzU1LDcgQEAgc3RhdGljIGludCBo
YW5kbGVfc2NhbGFyX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKIHsKIAl1
bmlvbiByZWdfZGF0YSB2YWw7CiAJdW5zaWduZWQgbG9uZyBlcGMgPSByZWdzLT5lcGM7Ci0JdW5z
aWduZWQgbG9uZyBpbnNuOworCXVuc2lnbmVkIGxvbmcgaW5zbiwgY29weV9sZW47CiAJdW5zaWdu
ZWQgbG9uZyBhZGRyID0gcmVncy0+YmFkYWRkcjsKIAlpbnQgZnAgPSAwLCBzaGlmdCA9IDAsIGxl
biA9IDA7CiAKQEAgLTQ0MSw3ICs0NDEsMTYgQEAgc3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21p
c2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAogCXZhbC5kYXRhX3U2NCA9IDA7
CiAJaWYgKHVzZXJfbW9kZShyZWdzKSkgewotCQlpZiAoY29weV9mcm9tX3VzZXIoJnZhbCwgKHU4
IF9fdXNlciAqKWFkZHIsIGxlbikpCisJCS8qCisJCSAqIFdlIGNhbiBub3Qgc2xlZXAgaW4gZXhj
ZXB0aW9uIGNvbnRleHQuIERpc2FibGUgcGFnZWZhdWx0IHRvCisJCSAqIGF2b2lkIGEgcG90ZW50
aWFsIHNsZWVwIHdoaWxlIGFjY2Vzc2luZyB1c2VyIG1lbW9yeS4gU2lkZQorCQkgKiBlZmZlY3Qg
aXMgdGhhdCBpZiBpdCB3b3VsZCBoYXZlIHNsZWVwLCB0aGVuIHRoZSBjb3B5IHdpbGwKKwkJICog
ZmFpbC4KKwkJICovCisJCXBhZ2VmYXVsdF9kaXNhYmxlKCk7CisJCWNvcHlfbGVuID0gY29weV9m
cm9tX3VzZXIoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbik7CisJCXBhZ2VmYXVsdF9lbmFi
bGUoKTsKKwkJaWYgKGNvcHlfbGVuKQogCQkJcmV0dXJuIC0xOwogCX0gZWxzZSB7CiAJCW1lbWNw
eSgmdmFsLCAodTggKilhZGRyLCBsZW4pOwpAQCAtNDYzLDcgKzQ3Miw3IEBAIHN0YXRpYyBpbnQg
aGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogewog
CXVuaW9uIHJlZ19kYXRhIHZhbDsKIAl1bnNpZ25lZCBsb25nIGVwYyA9IHJlZ3MtPmVwYzsKLQl1
bnNpZ25lZCBsb25nIGluc247CisJdW5zaWduZWQgbG9uZyBpbnNuLCBjb3B5X2xlbjsKIAl1bnNp
Z25lZCBsb25nIGFkZHIgPSByZWdzLT5iYWRhZGRyOwogCWludCBsZW4gPSAwLCBmcCA9IDA7CiAK
QEAgLTUzOSw3ICs1NDgsMTYgQEAgc3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRf
c3RvcmUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAogCWlm
ICh1c2VyX21vZGUocmVncykpIHsKLQkJaWYgKGNvcHlfdG9fdXNlcigodTggX191c2VyICopYWRk
ciwgJnZhbCwgbGVuKSkKKwkJLyoKKwkJICogV2UgY2FuIG5vdCBzbGVlcCBpbiBleGNlcHRpb24g
Y29udGV4dC4gRGlzYWJsZSBwYWdlZmF1bHQgdG8KKwkJICogYXZvaWQgYSBwb3RlbnRpYWwgc2xl
ZXAgd2hpbGUgYWNjZXNzaW5nIHVzZXIgbWVtb3J5LiBTaWRlCisJCSAqIGVmZmVjdCBpcyB0aGF0
IGlmIGl0IHdvdWxkIGhhdmUgc2xlZXAsIHRoZW4gdGhlIGNvcHkgd2lsbAorCQkgKiBmYWlsLgor
CQkgKi8KKwkJcGFnZWZhdWx0X2Rpc2FibGUoKTsKKwkJY29weV9sZW4gPSBjb3B5X3RvX3VzZXIo
KHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbik7CisJCXBhZ2VmYXVsdF9lbmFibGUoKTsKKwkJ
aWYgKGNvcHlfbGVuKQogCQkJcmV0dXJuIC0xOwogCX0gZWxzZSB7CiAJCW1lbWNweSgodTggKilh
ZGRyLCAmdmFsLCBsZW4pOwotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
