Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CF6EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 14:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3QBLKLxm1cIEb9kaIoo0YCVf2txXFXmroTWJP8Nd1ys=; b=Ac8fapkoPYCjbN
	SKW44oVeYcRbO4LoIdYycddSrdTxB3A5+6WDfghPMAAJ7eTh3Rtk455WQGpyoWsItp9w3nC+sU5aO
	0NzyKncoAJ7/0LvxuK50x5wX1Si077wzqZmxnh7Gm2ef5uljBoSyz1Mo0fDXwaOL16/LDuNTZkgzC
	i8crTjZwlA2zqHwW4NB9zKK0uGIFpKQriz9A7H/4sjVHp3QIKPonn5u0VyGy+yjnBe6JWf/Xal0UU
	UusV31g58DEP7cPuFHj305NHzRWR3JyXKEYUYMz+RwJ5i+nh1salDWfGbz7OsicAKA3E+ZvdTpm5e
	xF4FuETaMpCb+3TfE3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUG5-00BKbi-0s;
	Thu, 20 Jul 2023 14:03:57 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMUG2-00BKax-1w
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 14:03:55 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1b89d47ffb6so4648565ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689861833; x=1690466633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lbBdDUz6VGX98niIu+BGaqGxsZA67A1XV22QOnIoLPo=;
        b=J/WIA0vAnFMqsMD0cDTzPYrsu3oQvTmexdcY5wVpuL/h7i5K/uWpEk6uPbs1RqbY+y
         jf74qn6EqDQsrNcSmvzDndHJUP8GPxO0+cjDFPvH7en5FOHxCQqw9PGjCOk6IwBF357j
         BM8br2FTCELh3Zvnj0fTywtrCLRQ/mEZB26yN6/62ueXrYaizunykxC975HpT6gLwLXe
         RI5omi1yfryP/U7UwH6sC10ixiszR1kXdLTyfqpdzf6Y32fIi3sM9lB5lJQum3og+3le
         JYNkUh0OAr6/u63s6NB2o/aNSgAXtYkWvM0t4iLVXxIFXJMxTfCM8IbxP+qSe6qOzBgx
         w0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689861833; x=1690466633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbBdDUz6VGX98niIu+BGaqGxsZA67A1XV22QOnIoLPo=;
        b=dSiAYylG8wP0MYxqnl3sXVNXj2kXI+f+RQpZ5u2rG+cPYFPrrywncybRDEhnJCocLJ
         juPPK0JZq3eCWa72n/wok1nwcDv+wMxoqhlhhW8dHGZBkIr9QoNDNSny+cJjpG/CQaqV
         jiuzJFkPPd8mUctEskPPlnRoNlEiITwemXSaEacF3pswOrr7dRcWXqTlCleLLWu6QLB6
         4WwuclYPIyWMq7+SvUmAftiiFoZx96m65DWhqAr+zxAgnLywEpM/sB2LYB83dZWASF0k
         ZUz/LrAE+YqHLDqkC3ttn82j/qOM98eVworNc11JcNsYH3uTfn668mpU5Y/zS+y66iCY
         75Kg==
X-Gm-Message-State: ABy/qLaOWIEd55VQrSrQVWzawnXNVM1rI6+sGVoaFJ2Hbe02UhXYnbJD
	YsE9ggTEuyl/IWppH5z8NhU=
X-Google-Smtp-Source: APBJJlFYniAOxPj+jbipSRdp28xO9A220xt8cX/XWm8kkwoPNSZ8fIMX6wUYeDqQAY52A1uw7cmdcw==
X-Received: by 2002:a17:903:41d2:b0:1b8:ab0d:cd5 with SMTP id u18-20020a17090341d200b001b8ab0d0cd5mr19262956ple.49.1689861832818;
        Thu, 20 Jul 2023 07:03:52 -0700 (PDT)
Received: from localhost ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id jg19-20020a17090326d300b001b9bebb7a9dsm1398531plb.90.2023.07.20.07.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:03:52 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Andreas Schwab <schwab@suse.de>,
	David Laight <David.Laight@ACULAB.COM>,
	Celeste Liu <CoelacanthusHex@gmail.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: [PATCH v4] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Date: Thu, 20 Jul 2023 21:56:29 +0800
Message-ID: <20230720140348.4716-1-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_070354_641911_0B023E1B 
X-CRM114-Status: GOOD (  12.67  )
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

V2hlbiB3ZSB0ZXN0IHNlY2NvbXAgd2l0aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMg
d3JvbmcgdmFsdWUuCklmIHdlIGRlbnkgTkVUTElOS19BVURJVCB3aXRoIEVBRk5PU1VQUE9SVCwg
YWZ0ZXIgZjBiZGRmNTA1ODZkLCB3ZSB3aWxsCmdldCBFTk9TWVMgaW5zdGVhZC4gV2UgZ290IHNh
bWUgcmVzdWx0IHdpdGggY29tbWl0IDljMjU5OGQ0MzUxMCAoInJpc2N2OiBlbnRyeToKU2F2ZSBh
MCBwcmlvciBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkiKS4KCkFmdGVyIGFuYWx5c2lu
ZyBjb2RlLCB3ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0gLUVOT1NZUyBzaG91bGQgb25seSBiZSBl
eGVjdXRlZAp3aGVuIHN5c2NhbGwgIT0gLTEgSW4gX19zZWNjb21wX2ZpbHRlciwgd2hlbiBzZWNj
b21wIHJlamVjdGVkIHRoaXMgc3lzY2FsbCB3aXRoCnNwZWNpZmllZCBlcnJubywgdGhleSB3aWxs
IHNldCBhMCB0byByZXR1cm4gbnVtYmVyIGFzIHN5c2NhbGwgQUJJLCBhbmQgdGhlbgpyZXR1cm4g
LTEuIFRoaXMgcmV0dXJuIG51bWJlciBpcyBmaW5hbGx5IHBhc3MgYXMgcmV0dXJuIG51bWJlciBv
ZgpzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlLCBhbmQgdGhlbiBpcyBjb21wYXJlZCB3aXRo
IE5SX3N5c2NhbGxzIGFmdGVyCmNvbnZlcnRlZCB0byB1bG9uZyAoc28gaXQgd2lsbCBiZSBVTE9O
R19NQVgpLiBUaGUgY29uZGl0aW9uCnN5c2NhbGwgPCBOUl9zeXNjYWxscyB3aWxsIGFsd2F5cyBi
ZSBmYWxzZSwgc28gcmVncy0+YTAgPSAtRU5PU1lTIGlzIGFsd2F5cwpleGVjdXRlZC4gSXQgY292
ZXJlZCBhMCBzZXQgYnkgc2VjY29tcCwgc28gd2UgYWx3YXlzIGdldCBFTk9TWVMgd2hlbiBtYXRj
aApzZWNjb21wIFJFVF9FUlJOTyBydWxlLgoKRml4ZXM6IGYwYmRkZjUwNTg2ZCAoInJpc2N2OiBl
bnRyeTogQ29udmVydCB0byBnZW5lcmljIGVudHJ5IikKUmVwb3J0ZWQtYnk6IEZlbGl4IFlhbiA8
ZmVsaXhvbm1hcnNAYXJjaGxpbnV4Lm9yZz4KQ28tZGV2ZWxvcGVkLWJ5OiBSdWl6aGUgUGFuIDxj
MTQxMDI4QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogUnVpemhlIFBhbiA8YzE0MTAyOEBnbWFp
bC5jb20+CkNvLWRldmVsb3BlZC1ieTogU2hpcWkgWmhhbmcgPHNoaXFpQGlzcmMuaXNjYXMuYWMu
Y24+ClNpZ25lZC1vZmYtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3JjLmlzY2FzLmFjLmNuPgpT
aWduZWQtb2ZmLWJ5OiBDZWxlc3RlIExpdSA8Q29lbGFjYW50aHVzSGV4QGdtYWlsLmNvbT4KVGVz
dGVkLWJ5OiBGZWxpeCBZYW4gPGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+ClJldmlld2VkLWJ5
OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClJldmlld2VkLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KLS0tCgp2MyAtPiB2NDogdXNlIGxvbmcgaW5zdGVhZCBvZiB1
bG9uZyB0byByZWR1Y2UgdHlwZSBjYXN0IGFuZCBhdm9pZAogICAgICAgICAgaW1wbGVtZW50YXRp
b24tZGVmaW5lZCBiZWhhdmlvciwgYW5kIG1ha2UgdGhlIGp1ZGdtZW50IG9mIHN5c2NhbGwKICAg
ICAgICAgIGludmFsaWQgbW9yZSBleHBsaWNpdAp2MiAtPiB2MzogdXNlIGlmLXN0YXRlbWVudCBp
bnN0ZWFkIG9mIHNldCBkZWZhdWx0IHZhbHVlLAogICAgICAgICAgY2xhcmlmeSB0aGUgdHlwZSBv
ZiBzeXNjYWxsCnYxIC0+IHYyOiBhZGRlZCBleHBsYW5hdGlvbiBvbiB3aHkgYWx3YXlzIGdvdCBF
Tk9TWVMKCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKaW5kZXggZjkx
MGRmY2NiZjVkMi4uNzI5Zjc5Yzk3ZTJiZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCkBAIC0yOTcsNyArMjk3LDcg
QEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2JyZWFr
KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rp
b24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiB7CiAJaWYgKHVz
ZXJfbW9kZShyZWdzKSkgewotCQl1bG9uZyBzeXNjYWxsID0gcmVncy0+YTc7CisJCWxvbmcgc3lz
Y2FsbCA9IHJlZ3MtPmE3OwogCiAJCXJlZ3MtPmVwYyArPSA0OwogCQlyZWdzLT5vcmlnX2EwID0g
cmVncy0+YTA7CkBAIC0zMDYsOSArMzA2LDkgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFw
X3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAkJ
c3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUocmVncywgc3lzY2FsbCk7CiAK
LQkJaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKKwkJaWYgKHN5c2NhbGwgPj0gMCAmJiBzeXNj
YWxsIDwgTlJfc3lzY2FsbHMpCiAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Ci0J
CWVsc2UKKwkJZWxzZSBpZiAoc3lzY2FsbCAhPSAtMSkKIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsK
IAogCQlzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwotLSAKMi40MS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
