Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDDDC54E41
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QGNVF66cIW10cl3dnWbjx1H9zOQBTv9oHIKvOEEHgbA=; b=AGUnJ517jxrfqN
	MZ/L3XHLjLm2GiUwiESS3AOtQVfOtHFHwdvEcCjDhgb6HIQyJjQCQUE8fnNIs1HbR9xYDFsi9kLrZ
	0bGVVMkRQwkTo2ph56UvzkMVoCCK5rIgBKeUmr1BbWhp6CF+L1HG3FELpEg+sMzlkoheDSxmXXEgd
	e0Uzzg63Uymleba0SqcmH8p/iWafprlemtP9U2Oh7qMhiJj9wpW7JESycKXEQSZllmdgst3FGdm0m
	o0oJ4klF23prp8kJgpXW7GcoeG9X/6URmdzXTGwOJeihi/uTkHhoWwv87FH7v+smdlwQk5hauoBiy
	O+F3+yFDzKjCcRxSRW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhZ5-0000000Dtnq-2FUE;
	Thu, 29 Feb 2024 14:39:15 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhZ1-0000000Dtg2-24V0
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 14:39:14 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 41TEcnbb003040
	for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 16:38:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1709217524; x=1711809524;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2AP36O4Q237gvx6XJTGzq6ubQkJU6MDVVUBj66241MQ=;
	b=SDLN/OI2xDX4iAwWgKj4Qy1whzd5dUHAigjwL/yaMJVTK0vEBn/+3OssC8LzZ2rU
	o+KFcUjY8rYNOccxgDvN0fVVrECnAtANXnRXHlg/VOAPFM9EOoEeFdZD5PsjbbPE
	I60NQyHDAOQ9v9u8SecCVQ2hHiStR+g4/BszaPmMQBvN2B0NoDNSC8uoF7cW6SKC
	yJ1x2spyL68Pg9tFTnLz6kRR55hEzETkC9e7pJ24Z5FfHSz2gWtmf613bD0pdHRo
	Jvg0Hx/IGoKSE+G7BFgFXNjgD2gHmnH5G3kWgB10KPt2tlJPSC7wyJ0Xo9XAvbp/
	cKZSRbs5QtKU/Dmqz7NJlw==;
X-AuditID: 8b5b014d-a17eb70000002178-e1-65e096f4feaf
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 67.EC.08568.4F690E56; Thu, 29 Feb 2024 16:38:44 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: dvlachos at ics.forth.gr
From: Dimitris Vlachos <dvlachos@ics.forth.gr>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        palmer@dabbelt.com, alexghiti@rivosinc.com, paul.walmsley@sifive.com
Cc: clameter@sgi.com, akpm@linux-foundation.org, rppt@kernel.org,
        arnd@arndb.de, mick@ics.forth.gr, csd4492@csd.uoc.gr,
        maraz@ics.forth.gr
Subject: [PATCH -fixes] riscv: Sparse-Memory/vmemmap out-of-bounds fix
Date: Thu, 29 Feb 2024 16:38:33 +0200
Message-Id: <20240229143833.107724-1-dvlachos@ics.forth.gr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsXSHT1dWffLtAepBnt3iVvMWb+GzeJx43FG
	i7+TjrFbrG9cx26x5mmIxeVdc9gstn1uYbOY0f+f1aL53Tl2i5eXe5gt2mbxWxxZv53Jgcfj
	969JjB6fLv9i8Xjz8iWLx8NNl5g8Nq3qZPM4MeM3i8fmJfUeN2ZFeNy9/pLJ41LzdXaPz5vk
	ArijuGxSUnMyy1KL9O0SuDK+ntvEWHCEq2LNwQVMDYw/OLoYOTkkBEwk3l4/zghiCwkcYZQ4
	MdcXIm4rsXfBcSYQm01AT2L9/D3sXYxcHCICExglfr0/zAziMAvMYZS48aqbHaRKWMBN4vO5
	D2CTWARUJVrutrOB2LwC1hKNN/YBNXAATZWXWPxAAiIsKHFy5hMWkDCzgLrE+nlCIGFmoIrm
	rbOZJzDyzkJSNQuhahaSqgWMzKsYBRLLjPUyk4v10vKLSjL00os2MYKDntF3B+PtzW/1DjEy
	cTAeYpTgYFYS4ZURvJsqxJuSWFmVWpQfX1Sak1p8iFGag0VJnPeE7YJkIYH0xJLU7NTUgtQi
	mCwTB6dUA9NREy2jmIOZ7dyqp4Ii1Fia7Or5bnxoq/v0oG7z3dasqYdYyhqV/65sbpdWvcoU
	1F6//K3aixcxf/y+vRR29bzD+4VpRofJjVvGymnSDUzrfP4Ve7AkKJbF3a1dbR/h385W/Eyq
	2+GoRCX/j2fMbS4S+U+60+9Lmx9wn2CVWMFRd55XRW9Pc1ES7+FniZnx+9n0jl1at7iNf/l7
	ZZtdyVJ8b4Ji2+VVzjVMd9E5uivO+Yj2pCgmjg/NOyY+bIrNn7GpqFl/i1pr28U+ia2hLq7f
	eff8fWZ8c3n87+UvPupa7JksM/XHrv+1j7bkiZqr2sYIxX+8ofve9UBV2a6lpwQcLp2qbxFa
	HlKj97lKiaU4I9FQi7moOBEAp+Zj+OkCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_063912_019432_05AE876B 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

T2Zmc2V0IHZtZW1tYXAgc28gdGhhdCB0aGUgZmlyc3QgcGFnZSBvZiB2bWVtbWFwIHdpbGwgYmUg
bWFwcGVkCnRvIHRoZSBmaXJzdCBwYWdlIG9mIHBoeXNpY2FsIG1lbW9yeSBpbiBvcmRlciB0byBl
bnN1cmUgdGhhdAp2bWVtbWFw4oCZcyBib3VuZHMgd2lsbCBiZSByZXNwZWN0ZWQgZHVyaW5nCnBm
bl90b19wYWdlKCkvcGFnZV90b19wZm4oKSBvcGVyYXRpb25zLgpUaGUgY29udmVyc2lvbiBtYWNy
b3Mgd2lsbCBwcm9kdWNlIGNvcnJlY3QgU1YzOS80OC81NyBhZGRyZXNzZXMKZm9yIGV2ZXJ5IHBv
c3NpYmxlL3ZhbGlkIERSQU1fQkFTRSBpbnNpZGUgdGhlIHBoeXNpY2FsIG1lbW9yeSBsaW1pdHMu
CgpUaGlzIGlzIHRoZSBsaW5rIHRvIHRoZSByZWxldmFudCBjb252ZXJzYXRpb24gYW5kIGJ1ZyBy
ZXBvcnQuCkxpbmsgOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMjAy
MTM1MDMwLjQyMjY1LTEtY3NkNDQ5MkBjc2QudW9jLmdyCgpDby1kZXZlbG9wZWQtYnk6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogRGltaXRy
aXMgVmxhY2hvcyA8ZHZsYWNob3NAaWNzLmZvcnRoLmdyPgpSZXBvcnRlZC1ieTogRGltaXRyaXMg
VmxhY2hvcyA8ZHZsYWNob3NAaWNzLmZvcnRoLmdyPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAppbmRleCAwYzk0MjYwYjUuLjg3NWM5
YTA3OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKQEAgLTg0LDcgKzg0LDcgQEAKICAqIERl
ZmluZSB2bWVtbWFwIGZvciBwZm5fdG9fcGFnZSAmIHBhZ2VfdG9fcGZuIGNhbGxzLiBOZWVkZWQg
aWYga2VybmVsCiAgKiBpcyBjb25maWd1cmVkIHdpdGggQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQ
IGVuYWJsZWQuCiAgKi8KLSNkZWZpbmUgdm1lbW1hcAkJKChzdHJ1Y3QgcGFnZSAqKVZNRU1NQVBf
U1RBUlQpCisjZGVmaW5lIHZtZW1tYXAJCSgoc3RydWN0IHBhZ2UgKilWTUVNTUFQX1NUQVJUIC0g
KHBoeXNfcmFtX2Jhc2UgPj4gUEFHRV9TSElGVCkpCiAKICNkZWZpbmUgUENJX0lPX1NJWkUgICAg
ICBTWl8xNk0KICNkZWZpbmUgUENJX0lPX0VORCAgICAgICBWTUVNTUFQX1NUQVJUCi0tIAoyLjM5
LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
