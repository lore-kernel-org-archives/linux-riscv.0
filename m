Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96E2E7B600
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 12:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mamdUEZ8Cve1jcWcKQX92CMsuoByN8MHm4onOsuYLSw=; b=oMRJRvOZeW4kIe
	w1mF7iUQDLTRkvVMB3tMR7sIogv8KsBEe02S7bbVFcmjFLkGY/iSepjwRHaW8Tru9sn52i4ZzpA4M
	EJ8Xyq6qVDNGhhkgX81LJZ3cnv0kcT3e7sRV0pz4r/c6ksnO1OwKeP07MUcjmEHJ2HTdZEmaopBAS
	AljUdNzVMp03Xp7RjnJ1JVo9K5AMxJF5Dd1ZbymdyJ/fsRrSOTOCGCayUw9effAQ2eqjIXsRhr/T3
	2e4n7EENO5cZ1JrdOgKYEcS5krgEsPpivRfbJeMPJm0c+FDdmT/1oN8ByASSmXYkH2/noyys09fV6
	QaEZu86pSqnMP+bbJUYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0f4-00HYqM-08;
	Wed, 04 Oct 2023 12:07:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo0f0-00HYmo-19
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 12:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AACCFCE1C1A;
	Wed,  4 Oct 2023 12:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE09AC433C9;
	Wed,  4 Oct 2023 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696421244;
	bh=vLvgsGAj3vc8B6/nSYNfFLo6uk+g4NpV7dEmI8AKTYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ffk7vBFT5mbKfpS4JsRj1/srW+OQBeawmaCbwedd64L5PBIXa35ukJio0aGa/79fP
	 XDBl5Dqtggjo+cBwBIOgZTuARLyykM12k507R6ubzMvE42nQ2mkhwyn5J80OENEIO8
	 m3Ag+25W74eAEFvJu1mfdI0GdG/B/l7fx9eOkhl+fRhEy9EzutvfDB7IuH3+cAM2Dp
	 rUGeixzlVrVfIeeL3wZ6TSW0xUq9zLGPiBBeXGSRM+tE98wA3fqllIR+Q+IQHDCZ7A
	 tCqaAqP3sb47Cf8hd462KfH4XTV8ZZxs1LSp6O2MSpCWgVNURx7xWbhuHNyFOqRwej
	 CJSmc1nrCsyhQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	Pu Lehui <pulehui@huawei.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH bpf 2/2] riscv, bpf: Track both a0 (RISC-V ABI) and a5 (BPF) return values
Date: Wed,  4 Oct 2023 14:07:06 +0200
Message-Id: <20231004120706.52848-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004120706.52848-1-bjorn@kernel.org>
References: <20231004120706.52848-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_050726_568934_21DDCE1E 
X-CRM114-Status: GOOD (  11.78  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIFJJU0MtViBCUEYg
dXNlcyBhNSBmb3IgQlBGIHJldHVybiB2YWx1ZXMsIHdoaWNoIGFyZSB6ZXJvLWV4dGVuZGVkLAp3
aGVyZWFzIHRoZSBSSVNDLVYgQUJJIHVzZXMgYTAgd2hpY2ggaXMgc2lnbi1leHRlbmRlZC4gSW4g
b3RoZXIgd29yZHMsCmE1IGFuZCBhMCBjYW4gZGlmZmVyLCBhbmQgYXJlIHVzZWQgaW4gZGlmZmVy
ZW50IGNvbnRleHQuCgpUaGUgQlBGIHRyYW1wb2xpbmUgYXJlIHVzZWQgZm9yIGJvdGggQlBGIHBy
b2dyYW1zLCBhbmQgcmVndWxhciBrZXJuZWwKZnVuY3Rpb25zLgoKTWFrZSBzdXJlIHRoYXQgdGhl
IFJJU0MtViBCUEYgdHJhbXBvbGluZSBzYXZlcywgYW5kIHJlc3RvcmVzIGJvdGggYTAKYW5kIGE1
LgoKRml4ZXM6IDQ5YjVlNzdhZTNlMiAoInJpc2N2LCBicGY6IEFkZCBicGYgdHJhbXBvbGluZSBz
dXBwb3J0IGZvciBSVjY0IikKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAxMyArKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jp
c2N2L25ldC9icGZfaml0X2NvbXA2NC5jCmluZGV4IGRlNGM5OTU3ZDIyMy4uODU4MTY5M2U2MmQz
IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCisrKyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKQEAgLTc1OSw4ICs3NTksMTAgQEAgc3RhdGljIGlu
dCBpbnZva2VfYnBmX3Byb2coc3RydWN0IGJwZl90cmFtcF9saW5rICpsLCBpbnQgYXJnc19vZmYs
IGludCByZXR2YWxfb2YKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JaWYgKHNhdmVfcmV0
KQotCQllbWl0X3NkKFJWX1JFR19GUCwgLXJldHZhbF9vZmYsIHJlZ21hcFtCUEZfUkVHXzBdLCBj
dHgpOworCWlmIChzYXZlX3JldCkgeworCQllbWl0X3NkKFJWX1JFR19GUCwgLXJldHZhbF9vZmYs
IFJWX1JFR19BMCwgY3R4KTsKKwkJZW1pdF9zZChSVl9SRUdfRlAsIC0ocmV0dmFsX29mZiAtIDgp
LCByZWdtYXBbQlBGX1JFR18wXSwgY3R4KTsKKwl9CiAKIAkvKiB1cGRhdGUgYnJhbmNoIHdpdGgg
YmVxeiAqLwogCWlmIChjdHgtPmluc25zKSB7CkBAIC04NTMsNyArODU1LDcgQEAgc3RhdGljIGlu
dCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICpp
bSwKIAogCXNhdmVfcmV0ID0gZmxhZ3MgJiAoQlBGX1RSQU1QX0ZfQ0FMTF9PUklHIHwgQlBGX1RS
QU1QX0ZfUkVUX0ZFTlRSWV9SRVQpOwogCWlmIChzYXZlX3JldCkgewotCQlzdGFja19zaXplICs9
IDg7CisJCXN0YWNrX3NpemUgKz0gMTY7IC8qIFNhdmUgYm90aCBBNSAoQlBGIFIwKSBhbmQgQTAg
Ki8KIAkJcmV0dmFsX29mZiA9IHN0YWNrX3NpemU7CiAJfQogCkBAIC05NTcsNiArOTU5LDcgQEAg
c3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1w
X2ltYWdlICppbSwKIAkJaWYgKHJldCkKIAkJCWdvdG8gb3V0OwogCQllbWl0X3NkKFJWX1JFR19G
UCwgLXJldHZhbF9vZmYsIFJWX1JFR19BMCwgY3R4KTsKKwkJZW1pdF9zZChSVl9SRUdfRlAsIC0o
cmV0dmFsX29mZiAtIDgpLCByZWdtYXBbQlBGX1JFR18wXSwgY3R4KTsKIAkJaW0tPmlwX2FmdGVy
X2NhbGwgPSBjdHgtPmluc25zICsgY3R4LT5uaW5zbnM7CiAJCS8qIDIgbm9wcyByZXNlcnZlZCBm
b3IgYXVpcGMramFsciBwYWlyICovCiAJCWVtaXQocnZfbm9wKCksIGN0eCk7CkBAIC05ODgsOCAr
OTkxLDEwIEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0
IGJwZl90cmFtcF9pbWFnZSAqaW0sCiAJaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfUkVTVE9SRV9S
RUdTKQogCQlyZXN0b3JlX2FyZ3MobnJlZ3MsIGFyZ3Nfb2ZmLCBjdHgpOwogCi0JaWYgKHNhdmVf
cmV0KQorCWlmIChzYXZlX3JldCkgewogCQllbWl0X2xkKFJWX1JFR19BMCwgLXJldHZhbF9vZmYs
IFJWX1JFR19GUCwgY3R4KTsKKwkJZW1pdF9sZChyZWdtYXBbQlBGX1JFR18wXSwgLShyZXR2YWxf
b2ZmIC0gOCksIFJWX1JFR19GUCwgY3R4KTsKKwl9CiAKIAllbWl0X2xkKFJWX1JFR19TMSwgLXNy
ZWdfb2ZmLCBSVl9SRUdfRlAsIGN0eCk7CiAKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
