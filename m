Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA21C28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 12:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10iysyM/Nkc+LaSqH1ubW8YLEvXOP0vS/IYKFjjcO6E=; b=JzgQfW5EZcv2ml
	RXUs1+gnBvprVjVfmI5X4C9y19Oy43etaH5oFP6X0PEPtx4F4WctKA78INnPnHMZN6VKnTY1xiveq
	UNFNgxs/gLz2S6KXuJBot4OQMduAe9fJKryiEFTORMhn7akMhfX1PrxerkWkxt62CSu+v0W8PUzhB
	203HlBmAOUXifw1ahbYcQ1ihK+oLxQzk/nWba3HPHE1Z/XSMG4Vkf21ZT/Wl/hbl4NpLf9K/bMTxc
	QJjF5NYRoJvPaM88KqJKMoZ+ihY3kPIM8HMsozYEaIz4VbNh7Uz0L7Rm0+7AAthSet8mr6qjwtcx+
	ZCxRPCYKr/MQ4JSgfr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9Bl-0000000DLer-2d6F;
	Fri, 28 Mar 2025 12:51:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9Bi-0000000DLeS-3Qpd
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 12:51:56 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2254e0b4b79so56187815ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743166314; x=1743771114; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qe32V1AOUoNid6dXG/LxqLElZalfwawJFPaFc8U87DU=;
        b=hqVfAWUMHt4g7tR94G3YkpshGuogCOAW3O7htTEaPxGN6t+JMy3+B1AKWfdp5yy5Po
         RFnY+J4YAfxL6bgutHpnMmNTcOJiU1NeDNqMvR5G5pDIroHsrY21I3VS//aZi4yKXD0u
         ZWIElWjhKyO7K6b322W0mQrbqk6zOCsOV6w04mPjcM254Re7rpsIdurMjr3dIyF3WZD4
         HSXYpG6WWs0vkF5wcfjjIxqD5smonZjFcjnTjsaBHR65VLaWID0u0eAy/9Sg+IHJPye9
         XIvMwB9ea5q1KH/PHgNFnlZ3vguESCHgPkzFuztESXX1Wa54g3tKsuLhY0ansWuOwl37
         KhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166314; x=1743771114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe32V1AOUoNid6dXG/LxqLElZalfwawJFPaFc8U87DU=;
        b=ZrgLS8Qomt2MzJEXHDOnGhg6AcFsVCYiqliQNRnS9U+XvIavrZwC8BD6tGXMeFwkSq
         TVDiHczp+16xcQgeE3Hr+meLiJCf2Fv/UcNt/oxz8APyqcSjhMzL0xHk/Z7q5pZeLS8L
         rg0nkkhAKtNtZYv+fXlEwLTdiIwULuBUkV8ZbAEK2CEMuNmrAkqmMC0ds+A6DGGqjvfB
         ECacEjBGg/bRE2ImhF7DsqFY81dHTNzdj6rIIp5PntEd47kjRIsYHPxQPO5qxgzHmyXu
         Ojy7jZw5yNDfDU4gToJKov/+9v+2hRzfjlP0WBgT2V4xw6Xtr+So/I1EFUoXHzNzBwQx
         Je3A==
X-Forwarded-Encrypted: i=1; AJvYcCUVhbfFcpQfxtxl9F7R+8p4C9DATl9tMesKS5bqS7Y4fXOXN2CBz2AT1VYFAixdZmYbKhify9texm4pEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy52ksrluq1DBHKCXQuBKbQaW2qiv1jmYrtKYEUP5e5XCbCT8U/
	ZADCUiHyVcpk1ixWdVdJlzMV8sY4No80Ah4JTh6JIRNVZ2kNuUy6YrJpXFNBWKg=
X-Gm-Gg: ASbGncsiqsipxI1KbW2rOfOit1vst/v93mWs1Mi6E0asTCahciyU4Q7znoNgspiIR0q
	oHzh7nNw25ENQYH6TUO43SdSrmnTZdByyQ4oSzu9j1GoZUFqMKnDiNmMU0qxhRc4LL8So99WMs5
	m2MtZY4qK6GuM2UOrsMNQAr+s1YFnkl2Go7Iu2XIQMI00Kps+q0/FRa8USGCWD1Fa+WaoELTzQC
	KiVXjvXwyciewTBElZw/VyZgb2EqNgnFPfUIlRT+ffOYZwmhlC1vuGheSEQtkcXqKOfZoW7E7dl
	/nxcjm00rWcHM9fzQW3CcnbJuiW0Pt74+Cik8j1j5hJid0fRP/TSLzC1yJ+4KWzQLJZapL2hO4a
	/ZMH9rdVZ+dSmkw==
X-Google-Smtp-Source: AGHT+IHVvBzZimSyhVPNOYC9F8CUUttEixWwVyBeDUvKgk8rv9Nlh214Sm121OpyaZmCMCs+bFFzFg==
X-Received: by 2002:a05:6a00:4f89:b0:737:6fdf:bb69 with SMTP id d2e1a72fcca58-73960e4674dmr8779512b3a.13.1743166313575;
        Fri, 28 Mar 2025 05:51:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e222f4sm1620649b3a.41.2025.03.28.05.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 05:51:52 -0700 (PDT)
Message-ID: <7352dfbf-51e0-47b0-81e2-264f30989bf1@rivosinc.com>
Date: Fri, 28 Mar 2025 13:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Make sure toolchain supports zba before using zba
 instructions
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20250328115422.253670-1-alexghiti@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250328115422.253670-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_055154_857587_6CA8B15D 
X-CRM114-Status: GOOD (  16.94  )
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

CgpPbiAyOC8wMy8yMDI1IDEyOjU0LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gT2xkIHRvb2xj
aGFpbiBsaWtlIGdjYyA4LjUuMCBkb2VzIG5vdCBzdXBwb3J0IHpiYSwgc28gd2UgbXVzdCBjaGVj
ayB0aGF0Cj4gdGhlIHRvb2xjaGFpbiBzdXBwb3J0cyB0aGlzIGV4dGVuc2lvbiBiZWZvcmUgdXNp
bmcgaXQgaW4gdGhlIGtlcm5lbC4KPiAKPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVp
bGQtYWxsLzIwMjUwMzI4MTgzNi44cG50SG02SS1sa3BAaW50ZWwuY29tLwo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKysrKysrCj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcnVudGltZS1jb25zdC5oIHwgNSArKystLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IDBkOGRlZjk2
OGE3ZS4uYWU2MzAzZjE1YjI4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsr
KyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC03MzUsNiArNzM1LDE0IEBAIGNvbmZpZyBUT09M
Q0hBSU5fSEFTX1ZFQ1RPUl9DUllQVE8KPiAgCWRlZl9ib29sICQoYXMtaW5zdHIsIC5vcHRpb24g
YXJjaCQoY29tbWEpICt2JChjb21tYSkgK3p2a2IpCj4gIAlkZXBlbmRzIG9uIEFTX0hBU19PUFRJ
T05fQVJDSAo+ICAKPiArY29uZmlnIFRPT0xDSEFJTl9IQVNfWkJBCj4gKwlib29sCj4gKwlkZWZh
dWx0IHkKPiArCWRlcGVuZHMgb24gITY0QklUIHx8ICQoY2Mtb3B0aW9uLC1tYWJpPWxwNjQgLW1h
cmNoPXJ2NjRpbWFfemJhKQo+ICsJZGVwZW5kcyBvbiAhMzJCSVQgfHwgJChjYy1vcHRpb24sLW1h
Ymk9aWxwMzIgLW1hcmNoPXJ2MzJpbWFfemJhKQo+ICsJZGVwZW5kcyBvbiBMTERfVkVSU0lPTiA+
PSAxNTAwMDAgfHwgTERfVkVSU0lPTiA+PSAyMzkwMAo+ICsJZGVwZW5kcyBvbiBBU19IQVNfT1BU
SU9OX0FSQ0gKPiArCj4gIGNvbmZpZyBSSVNDVl9JU0FfWkJBCgpIaSBBbGV4LAoKV2h5IG5vdCBh
ZGQgYSAiZGVwZW5kcyBvbiBUT09MQ0hBSU5fSEFTX1pCQSIgaGVyZSBzbyB5b3UgZG9uJ3QgaGF2
ZSB0bwpjaGVjayBmb3IgdGhhdCBjb25maWcgb3B0aW9uIHdoZW4gdXNpbmcgQ09ORklHX1JJU0NW
X0lTQV9aQkEgPyBUaGlzIGlzCmRvbmUgbGlrZSB0aGF0IGZvciBaQkIgYW5kIFpCQy4KClRoYW5r
cywKCkNsw6ltZW50Cgo+ICAJYm9vbCAiWmJhIGV4dGVuc2lvbiBzdXBwb3J0IGZvciBiaXQgbWFu
aXB1bGF0aW9uIGluc3RydWN0aW9ucyIKPiAgCWRlZmF1bHQgeQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3J1bnRpbWUtY29uc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcnVudGltZS1jb25zdC5oCj4gaW5kZXggZWEyZTQ5YzcxNDljLi5jMDdkMDQ5ZmRkNWQgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9ydW50aW1lLWNvbnN0LmgKPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3J1bnRpbWUtY29uc3QuaAo+IEBAIC03Nyw3ICs3Nyw4
IEBACj4gIAkiLmxvbmcgMWIgLSAuXG5cdCIJCQkJCVwKPiAgCSIucG9wc2VjdGlvbiIJCQkJCQlc
Cj4gIAo+IC0jaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfSVNBX1pCQSkgJiYgZGVmaW5lZChDT05G
SUdfUklTQ1ZfSVNBX1pCS0IpCj4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9JU0FfWkJBKSAm
JiBkZWZpbmVkKENPTkZJR19UT09MQ0hBSU5fSEFTX1pCQSkJXAo+ICsJJiYgZGVmaW5lZChDT05G
SUdfUklTQ1ZfSVNBX1pCS0IpCgoKPiAgI2RlZmluZSBydW50aW1lX2NvbnN0X3B0cihzeW0pCQkJ
CQkJXAo+ICAoewkJCQkJCQkJCVwKPiAgCXR5cGVvZihzeW0pIF9fcmV0LCBfX3RtcDsJCQkJCVwK
PiBAQCAtOTMsNyArOTQsNyBAQAo+ICAJCTogW19fcmV0XSAiPXIiIChfX3JldCksIFtfX3RtcF0g
Ij1yIiAoX190bXApKTsJCVwKPiAgCV9fcmV0OwkJCQkJCQkJXAo+ICB9KQo+IC0jZWxpZiBkZWZp
bmVkKENPTkZJR19SSVNDVl9JU0FfWkJBKQo+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9J
U0FfWkJBKSAmJiBkZWZpbmVkKENPTkZJR19UT09MQ0hBSU5fSEFTX1pCQSkKPiAgI2RlZmluZSBy
dW50aW1lX2NvbnN0X3B0cihzeW0pCQkJCQkJXAo+ICAoewkJCQkJCQkJCVwKPiAgCXR5cGVvZihz
eW0pIF9fcmV0LCBfX3RtcDsJCQkJCVwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
