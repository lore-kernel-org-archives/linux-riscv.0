Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8706C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euhDLFwBXC3b4/85FIC23yFqPG4BMZ8W2D1g0Y9sqdE=; b=1RxjKq5Ju9GasK
	djrF7o2+9gkiZ4IDbQvv1eur6znqZE0Vc5LYcVLUfDjUuQkEtA+iYtsQPYoWt6QWbnSqEYiKbbabw
	8F0Z5Cm72dt/rWgvica799hJ8Qde2yfB/JfDF3PcwteF+Nmu8psqB6yUZ8FMstD48DdHE4+TGajyS
	n1rQc0kayTsS2cC75su0B+lcLWwOc3+2Q3lvtUVr1KqbtW8hJrVzvgVElI4/SRRkS0jM98Ly6qTea
	9XlO3dtCRGNW16m0Y38bO9Z6a0hR2WTwAeJBRxCcStxDabEEn/atVqLqnzln/J7sxh7CyXiuq/J+L
	quFqch1qxajdlMR9Xd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1raK-00000001gVp-1Phq;
	Mon, 07 Apr 2025 18:52:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1quU-00000001TYr-3Eug
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:09:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22580c9ee0aso50094845ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049366; x=1744654166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Z0y0TK+N2j7unfdHAGWrmjHTParwUExlSa0jHt4G78=;
        b=A//nWHAeMxPgjNuK/GiH/MmMbOptUPI5yGkN1naDh60YMQP0y/dKDMZG/XE1gt32oB
         IONv5miFdCPoA8DD+tduSZaN1N3HiTeqXH+Zknim7D7v1hQCJ+Ikc2F5yPjo/z7hFcGW
         Xyvna5odYnOMc4GW39ENdG7ZlMq2tG3n5u90Hq92IQlh540cv4QWteoI6NSx4O/eeCiX
         oPt5YRAF5VgrUp6tvbt75a+regxPIaDTGiEERxEbceqqhqODcADxVUvokcVPDdLH8xug
         VT0v8U3duFUynubtKfl+VPV3SIwRIz8xxco+hPJ5KhNEHRsAWErpm1Aqa4+bwA4pdnlC
         JRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049366; x=1744654166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z0y0TK+N2j7unfdHAGWrmjHTParwUExlSa0jHt4G78=;
        b=hC4WXz30tN9KsKrJ2VwRJH12cKOoRAHrkrLV+5PavxNIvl6ML6BQNgyTDosJRycnWK
         6L8Pm3qB90x7d4+vMeeT7dTJquLSct0ljd/qLj+f9USdJXshYl/9RTuPngI2Cy31x8Ro
         vDK9jAKaXtY2n+dv1dCkVREhvzZb2r9aVbA0gR1reX9lAQSRQT06LCDT0Dpi8PW2ybxm
         OEGoeBsDegk/ZaI2uf4HwKHgk3A/tyNwOL/QHR+lcqBTeZPuUQ76RHU2/5ngqhgewujY
         pmyJMyk52noyuEThr4Fae2kD1uszmdXjFUvlhcVJp6fe+dC+BiRFce2OLIIxU5T1M4DZ
         bvtA==
X-Gm-Message-State: AOJu0YyYOXAnAijax19zIhi2+J64j9PkFxVjj7dJrUKQVHSdduzrQ9WB
	xGlz3J3626+9CK0T8qlcHFrDLucMqHgac9RiM5pLWUENrAqOfqPlWJeUhRPy
X-Gm-Gg: ASbGncvYvJcnqEJkDGhiUXlXP+AncFl7oSgq09wsn5Zjrn3aMCB7R7CQNrPBYdSKmdh
	qYvPCqd9lydI3GJ9+sjzB5EPokawHOyfbmFUSshGYF3YW7HXzdmjQZAj3ZGYUvXKCtufkFFnBh+
	Hh9SYZID3jSwm/NaAzSJM8tXSMP6NTw5LQlDd22UFjkFzvdx2eqAPBaGMC2OSNyYhU662uWbzDl
	i7PJW2sT0lYMcj269MhyvBPJ2ZA1zUPl3FEsVwOK0Vn3kcUZEtkPlBoVh84cumJarQjPWOcWyfV
	+e5TVzHPsx2tvv4aZIJN90SJK2j2ofxdvU88rvWbK/FEeV9wjQO+4+EHKYfJ3KyFxeHnneMtPRj
	pWbLrF4x+HbRb6kds7uV6Igp/gZnuUSDcxQ==
X-Google-Smtp-Source: AGHT+IFgrdURIj5aGIW42rvqFSz+4B3fV+3dwcYfHSLwCG5BImXtPG/2PWupoaefl6dEzTqBihbAPA==
X-Received: by 2002:a17:90b:2d4c:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-306a615be9fmr15006956a91.19.1744049365882;
        Mon, 07 Apr 2025 11:09:25 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.09.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:09:25 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 08/12] riscv: add a data fence for CMODX in the kernel mode
Date: Tue,  8 Apr 2025 02:08:32 +0800
Message-Id: <20250407180838.42877-8-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20250407180838.42877-1-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110926_811673_5EB55615 
X-CRM114-Status: GOOD (  14.73  )
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

UklTQy1WIHNwZWMgZXhwbGljaXRseSBjYWxscyBvdXQgdGhhdCBhIGxvY2FsIGZlbmNlLmkgaXMg
bm90IGVub3VnaCBmb3IKdGhlIGNvZGUgbW9kaWZpY2F0aW9uIHRvIGJlIHZpc2JsZSBmcm9tIGEg
cmVtb3RlIGhhcnQuIEluIGZhY3QsIGl0CnN0YXRlczoKClRvIG1ha2UgYSBzdG9yZSB0byBpbnN0
cnVjdGlvbiBtZW1vcnkgdmlzaWJsZSB0byBhbGwgUklTQy1WIGhhcnRzLCB0aGUKd3JpdGluZyBo
YXJ0IGFsc28gaGFzIHRvIGV4ZWN1dGUgYSBkYXRhIEZFTkNFIGJlZm9yZSByZXF1ZXN0aW5nIHRo
YXQgYWxsCnJlbW90ZSBSSVNDLVYgaGFydHMgZXhlY3V0ZSBhIEZFTkNFLkkuCgpBbHRob3VnaCBj
dXJyZW50IHJpc2N2IGRyaXZlcnMgZm9yIElQSSB1c2Ugb3JkZXJlZCBNTUlPIHdoZW4gc2VuZGlu
ZyBJUElzCmluIG9yZGVyIHRvIHN5bmNocm9uaXplIHRoZSBhY3Rpb24gYmV0d2VlbiBwcmV2aW91
cyBjc2Qgd3JpdGVzLCByaXNjdgpkb2VzIG5vdCByZXN0cmljdCBpdHNlbGYgdG8gYW55IHBhcnRp
Y3VsYXIgZmxhdm9yIG9mIElQSS4gQW55IGRyaXZlciBvcgpmaXJtd2FyZSBpbXBsZW1lbnRhdGlv
biB0aGF0IGRvZXMgbm90IG9yZGVyIGRhdGEgd3JpdGVzIGJlZm9yZSB0aGUgSVBJCm1heSBwb3Nl
IGEgcmlzayBmb3IgY29kZS1tb2RpZnlpbmcgcmFjZS4KClRodXMsIGFkZCBhIGZlbmNlIGhlcmUg
dG8gb3JkZXIgZGF0YSB3cml0ZXMgYmVmb3JlIG1ha2luZyB0aGUgSVBJLgoKU2lnbmVkLW9mZi1i
eTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2Vsb2cgdjQ6CiAtIEV4cGxhaW4gbW9y
ZSBpbiBjb21taXQgbXNnIGFuZCBhZGQgQmrDtnJuJ3MgUi1iCi0tLQogYXJjaC9yaXNjdi9tbS9j
YWNoZWZsdXNoLmMgfCAxNSArKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jYWNo
ZWZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwppbmRleCBiODE2NzI3Mjk4ODcu
LmIyZTRiODE3NjNmOCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKKysr
IGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKQEAgLTI0LDcgKzI0LDIwIEBAIHZvaWQgZmx1
c2hfaWNhY2hlX2FsbCh2b2lkKQogCiAJaWYgKG51bV9vbmxpbmVfY3B1cygpIDwgMikKIAkJcmV0
dXJuOwotCWVsc2UgaWYgKHJpc2N2X3VzZV9zYmlfZm9yX3JmZW5jZSgpKQorCisJLyoKKwkgKiBN
YWtlIHN1cmUgYWxsIHByZXZpb3VzIHdyaXRlcyB0byB0aGUgRCQgYXJlIG9yZGVyZWQgYmVmb3Jl
IG1ha2luZworCSAqIHRoZSBJUEkuIFRoZSBSSVNDLVYgc3BlYyBzdGF0ZXMgdGhhdCBhIGhhcnQg
bXVzdCBleGVjdXRlIGEgZGF0YSBmZW5jZQorCSAqIGJlZm9yZSB0cmlnZ2VyaW5nIGEgcmVtb3Rl
IGZlbmNlLmkgaW4gb3JkZXIgdG8gbWFrZSB0aGUgbW9kaWZpY2F0aW9uCisJICogdmlzYWJsZSBm
b3IgcmVtb3RlIGhhcnRzLgorCSAqCisJICogSVBJcyBvbiBSSVNDLVYgYXJlIHRyaWdnZXJlZCBi
eSBNTUlPIHdyaXRlcyB0byBlaXRoZXIgQ0xJTlQgb3IKKwkgKiBTLUlNU0lDLCBzbyB0aGUgZmVu
Y2UgZW5zdXJlcyBwcmV2aW91cyBkYXRhIHdyaXRlcyAiaGFwcGVuIGJlZm9yZSIKKwkgKiB0aGUg
TU1JTy4KKwkgKi8KKwlSSVNDVl9GRU5DRSh3LCBvKTsKKworCWlmIChyaXNjdl91c2Vfc2JpX2Zv
cl9yZmVuY2UoKSkKIAkJc2JpX3JlbW90ZV9mZW5jZV9pKE5VTEwpOwogCWVsc2UKIAkJb25fZWFj
aF9jcHUoaXBpX3JlbW90ZV9mZW5jZV9pLCBOVUxMLCAxKTsKLS0gCjIuMzkuMyAoQXBwbGUgR2l0
LTE0NSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
