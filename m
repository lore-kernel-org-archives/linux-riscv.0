Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049E9E7719A
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jan 2025 00:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=41pUeZ5/6RtOLEtsGINqDDYdZRpuDfeoQ2a1EiQdNlY=; b=CsgeV9j4BYyIJ+
	1ntRkT9WWHY63YIIVCKjl1xedoLk1AMqTrZfCkw6ccRwQ9pGnobymNy0WyITJ4Br86kJRgg/L57NS
	Erwqpx/9nWn9shCJ5FUGZ0pE/H2LwSsogadNf8y4waOx85K0pBqY47OH29Z0Sm/wPnHMXSq2IRR+X
	P86BEqGrQRrABqyUTvSRrbcBkjJlhGqphfsESZVnTqiJ0oq2zoabY+cWZS19xpeLaekbr/36zVkkG
	HrXwgL2Wl5zezG46i0hXP9E6DX2NZ0oiksWhYsiHB/zDMRG24pnFU4ZVxNDeJTZ9CIBhsxMFEOGir
	TMOTXK9E3R3yDmrcyarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWmGt-00000001o4L-0nbg;
	Sun, 12 Jan 2025 00:56:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWmGq-00000001o3h-0y9o;
	Sun, 12 Jan 2025 00:56:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso34386015e9.1;
        Sat, 11 Jan 2025 16:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736643362; x=1737248162; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ksY3pTe5FhYmC9XNvS9bCw4xuSS2jCyI26cxeF8DOk0=;
        b=PIh4uDd9ow8J5Yk2gNbW8lPQXbnJmLv9obhknwzk7GyZ+TbvBvF7MdV3sTqY7WRExz
         U9CX8MVBrjHDATbl7pyhs48bvC98mNbMko6RnPHHFV+lhoY8t2H7w/9Nn8Tufm4NKLpo
         zy5g98wO5hlAOzZBLHH6/rUcRHWkP6W0ghd6/NnZSC06JAKkashnCGHLQeNMLZyVbOIu
         Mj3nAZ2GB0imKteues4hIzJbODGVe0qoaomjyuHV7pDdDjzA05Yhqi9pM2mjbraydq6U
         H25xU4eGZQJPCzen2vPDS0/aXJdwFII7e16Sykq9234b6CFwze+z8rESgXESroNtu2gs
         ZyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736643362; x=1737248162;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksY3pTe5FhYmC9XNvS9bCw4xuSS2jCyI26cxeF8DOk0=;
        b=gDsJ8XkfTTBl2jeRDIu9hehjX+UTJvPQA0MpKwTAjoHYnPJ+iM3eoUY/VDgEG3kT5l
         PyW6XVNVkzj+HAb8NhnR6V1jd1E11uThdv0V9UdzaEQdXUv0oXzQiS5Pya6HldWSNtPs
         rCagF453bm92Ng7cnhBqPA3rmgQ5aCkhjXMYPSxn/gbtGMgs4UcFzzMmcQaxdGZI0unc
         cyYrBpKBqHrBdxC9Xlo+oO/sdlaON2QcqbFM4wJ/7SdgXDkZFlKhoW59dL45OQZRnHmc
         kLM33iGpo9c/LFlPZfDo3/2ZbdkJOChcB737a8BHy2qDemBVWCX5C8Z/Ns7FGPkIpr6Y
         6h7w==
X-Forwarded-Encrypted: i=1; AJvYcCV7jPjd/Rnu3OBfhl3jV76B3aewEkZBevMYJXAkvRKawvkSaQ/e7n5VUZtRmU+mnT3wbouMlr+N9n94UwrFeWUU@lists.infradead.org, AJvYcCXxFGiD3QacMCk2R5N3FCxlfM1SNe+zEusl7oPizBd6rjSX0xsZcuB1GKeuQ1MxT7ixCMRlGIyhmO4/fhw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfJ6OmcUtVVLrFKont1bst5rDY1aMZ+Vj9ZSeLNeTkqPfsW5DG
	c7Lmb3wjx+bVJBbQtfKWXM3fqU6BxzJad3LlHC1KPJ+nmOqZfbE6
X-Gm-Gg: ASbGncuALXZUAKZkGxIVt2F1b5HKBlqwi4P9aj8GA8M0mmGDwq0THofVfiqYGPBIvge
	CAnyCZCxupnaCgB+5xJPqaV/gOen2NB0kgWeUxcx47xbypIYn52jT4r/0FwpRUeJ8Jg3ewysj2E
	SIe3At6QyLqYZLYYih+vmqkJ8ZIcoMwZk9CoO4ZoBecREMU78IPWn+yfNvexCCcJZThZmYmII/i
	6f6TWThI+opIVwcfHBsJsr7+C+NzXlEdRJA+RXxCScHKYZaQbFHWtCsGRa5KkNJL+s1EQ48hHoh
X-Google-Smtp-Source: AGHT+IFfjQRmPA7J1JcMDYWuV7GNTmDNiwa2bTfjh+WvuUJzhBu0MLn6yi9lwFvEz/AIlXAd0TJJkQ==
X-Received: by 2002:a05:6000:1445:b0:385:df6d:6fc7 with SMTP id ffacd0b85a97d-38a8730ce5amr15436211f8f.25.1736643361723;
        Sat, 11 Jan 2025 16:56:01 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38bf78sm8305800f8f.48.2025.01.11.16.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 16:56:01 -0800 (PST)
Message-ID: <19bb108e93bb58eecc6a53d78ff4e75fc380f072.camel@gmail.com>
Subject: [PATCH RFC] arm64: dts: sophgo: Add initial SG2000 SoC device tree
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Sun, 12 Jan 2025 01:55:05 +0100
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_165604_276177_32B2EBF6 
X-CRM114-Status: GOOD (  17.89  )
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

QWRkIGluaXRpYWwgZGV2aWNlIHRyZWUgZm9yIHRoZSBTRzIwMDAgU29DIGJ5IFNPUEhHTyAoZnJv
bSBBUk02NCBQb1YpLgoKLS0tCkRlYXIgQVJNLCBSSVNDViwgRFQgbWFpbnRhaW5lcnMsIEknZCBs
aWtlIHRvIGFzayB5b3VyIG9waW5pb24gb24gdGhlCmJlbG93IHBhdGNoLCB3aGljaCBJIHBsYW4g
YXMgYSBiYXNlIGZvciBBUk02NCBCU1AgZm9yIGR1YWwtYXJjaCAoUklTQ1Ygb3IKQVJNNjQpIEN2
aXRlayBTb0MgU0cyMDAwLiBUaGUgbWFpbiBtb3RpdmF0aW9uIGZvciBBUk02NCBzdXBwb3J0IGlz
IHRoZQpBUkNIIHN1cHBvcnQgaW4gdGhlIHVwc3RyZWFtIGdjYywgd2hpY2ggaXMgbm90IHRoYXQg
bWF0dXJlIGZvciBSSVNDVi4KCkkgYmVsaWV2ZSBpdCdzIHRoZSBmaXJzdCB0aW1lIHdlIGFscmVh
ZHkgaGF2ZSBxdWl0ZSBzb21lIGJhc2UgaW4gdGhlCnRyZWUgZm9yIGEgU29DLCBzbyBpdCB3b3Vs
ZCBiZSBhZHZhbnRhZ2VvdXMgdG8gcmUtdXNlIGl0IGFuZCBub3QKZHVwbGljYXRlIHRoZSBzYW1l
IFNvQyBzdHJ1Y3R1cmVzIGluIHR3byBwbGFjZXMsIGVzcGVjaWFsbHkgaGF2aW5nCmluIG1pbmQg
dGhhdCBDdml0ZWsvU29waGdvIGFyZSBzdGlsbCB3b3JraW5nIG9uIHVwc3RyZWFtaW5nIGFuZCBi
eQpmYXIgbm90IGFsbCBIVyBibG9ja3MgYXJlIHBvcHVsYXRlZCBpbiB0aGUgU29DIERUcy4gVGhl
eSBmb2N1cyBwcmltYXJlbHkKb24gUklTQ1YsIHNvIEFSTTY0IHdvdWxkIGJlIGRyYWdnaW5nIGJl
aGluZCBpbiB0aGlzIGNhc2UgaWYgaXQgd291bGQgYmUKZm9ya2VkLgoKT24gdGhlIG90aGVyIGhh
bmQsIGluY2x1ZGluZyBTb0MgZHRzaSBmcm9tIFJJU0NWIGludG8gQVJNNjQgcG9zZXMKc29tZSB0
ZWNobmljYWwgY2hhbGxlbmdlcyBieSBpdHNlbGYsIG9idmlvdXNseSBDUFUgY29yZXMgaGF2ZSB0
byBiZQpkZWxldGVkLCBzYW1lIGlzIHRydWUgZm9yIGludGVycnVwdCBjb250cm9sbGVyLiBBbmQg
dGhlIGludGVycnVwdApudW1iZXJzIGFyZSBvZiBjb3Vyc2UgZGlmZmVyZW5jZSBmb3IgQVJNIEdJ
Qywgc28gdGhleSBoYXZlIHRvIGJlCm92ZXJ3cml0dGVuLgoKQWx0ZXJuYXRpdmVseSBJIGNhbiBz
cGxpdCBleGlzdGluZyAuZHRzaSBpbmNsdWRlZCBiZWxvdyBpbnRvIHRoZWlyClJJU0NWLXNwZWNp
ZmljIGFuZCBnZW5lcmljIHBhcnRzLCBzbyB0aGF0IGJvdGggQVJNNjQgYW5kIFJJU0NWIHdvdWxk
CmluY2x1ZGUgZ2VuZXJpYyBwYXJ0IGFuZCB0aGVpciBjb3JyZXNwb25kaW5nIEFSQ0gtc3BlY2lm
aWMgcGFydHMKYnJpbmdpbmcgQ1BVIGNvcmVzICsgaW50ZXJydXB0IGNvbnRyb2xsZXIgKyBJUlEg
bnVtYmVycyBmb3IgZWFjaCBhbmQKZXZlcnkgZGV2aWNlIHNlcGFyYXRlbHkuCgpUaGUgYmVsb3cg
ZXhhbXBsZSBpc2FjdHVhbGx5IGJvb3RpbmcgKGJlaW5nIGluY2x1ZGVkIGludG8gYm9hcmQtbGV2
ZWwKRFQpLCBzbyBpdCdzIGEgcmVhbCBleGFtcGxlIEknZCBiZSByZWFkeSB0byBzdWJtaXQgaWYg
dGhlcmUgd2lsbCBiZQpubyBvYmplY3Rpb25zIG9mIHRoZSBjcm9zcy1BUkNIIGluY2x1ZGUgYXBw
cm9hY2ggaW4gZ2VuZXJhbC4KCldoYXQgYXJlIHlvdXIgdGhvdWdodHM/CgrCoGFyY2gvYXJtNjQv
Ym9vdC9kdHMvc29waGdvL3NnMjAwMC5kdHNpIHwgMTY0ICsrKysrKysrKysrKysrKysrKysrKysr
KysKwqAxIGZpbGUgY2hhbmdlZCwgMTY0IGluc2VydGlvbnMoKykKwqBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9hcm02NC9ib290L2R0cy9zb3BoZ28vc2cyMDAwLmR0c2kKCmRpZmYgLS1naXQgYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDAuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvc29waGdvL3NnMjAwMC5kdHNpCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uOTZhZmQzNDJiZGU1Ci0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9zb3BoZ28vc2cyMDAwLmR0c2kKQEAgLTAsMCArMSwxNjQgQEAKKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCisKKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRl
cnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+CisjaW5jbHVkZSAiLi4vLi4vLi4vLi4vcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL2N2MTh4eC5kdHNpIgorI2luY2x1ZGUgIi4uLy4uLy4uLy4uL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9jdjE4MXguZHRzaSIKKworL2RlbGV0ZS1ub2RlLyAmY3B1MDsKKy9k
ZWxldGUtbm9kZS8gJnBsaWM7CisvZGVsZXRlLW5vZGUvICZjbGludDsKKworLyB7CisJY29tcGF0
aWJsZSA9ICJzb3BoZ28sc2cyMDAwIjsKKwlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OworCisJ
bWVtb3J5QDgwMDAwMDAwIHsKKwkJZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKKwkJcmVnID0gPDB4
ODAwMDAwMDAgMHgyMDAwMDAwMD47CS8qIDUxMk1pQiAqLworCX07CisKKwlwbXUgeworCQljb21w
YXRpYmxlID0gImFybSxjb3J0ZXgtYTUzLXBtdSI7CisJCWludGVycnVwdHMgPSA8R0lDX1NQSSAx
MTkgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQnCoMKgwqDCoCA8R0lDX1NQSSAxMjAgSVJRX1RZ
UEVfTEVWRUxfSElHSD47CisJfTsKKworCXRpbWVyIHsKKwkJY29tcGF0aWJsZSA9ICJhcm0sYXJt
djgtdGltZXIiOworCQlpbnRlcnJ1cHRzID0gPEdJQ19QUEkgMTMgKEdJQ19DUFVfTUFTS19TSU1Q
TEUoMikgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwKKwkJCcKgwqDCoMKgIDxHSUNfUFBJIDE0IChH
SUNfQ1BVX01BU0tfU0lNUExFKDIpIHwgSVJRX1RZUEVfTEVWRUxfTE9XKT4sCisJCQnCoMKgwqDC
oCA8R0lDX1BQSSAxMSAoR0lDX0NQVV9NQVNLX1NJTVBMRSgyKSB8IElSUV9UWVBFX0xFVkVMX0xP
Vyk+LAorCQkJwqDCoMKgwqAgPEdJQ19QUEkgMTAgKEdJQ19DUFVfTUFTS19TSU1QTEUoMikgfCBJ
UlFfVFlQRV9MRVZFTF9MT1cpPjsKKwkJYWx3YXlzLW9uOworCQljbG9jay1mcmVxdWVuY3kgPSA8
MjUwMDAwMDA+OworCX07CisKKwlnaWM6IGludGVycnVwdC1jb250cm9sbGVyQDFmMDEwMDAgewor
CQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTE1LWdpYyI7CisJCWludGVycnVwdC1jb250cm9s
bGVyOworCQkjaW50ZXJydXB0LWNlbGxzID0gPDM+OworCQlyZWcgPSA8MHgwMWYwMTAwMCAweDEw
MDA+LAorCQnCoMKgwqDCoMKgIDwweDAxZjAyMDAwIDB4MjAwMD47CisJfTsKKworCXNvYyB7CisJ
CS9kZWxldGUtcHJvcGVydHkvIGludGVycnVwdC1wYXJlbnQ7CisKKwkJcGluY3RybDogcGluY3Ry
bEAzMDAxMDAwIHsKKwkJCWNvbXBhdGlibGUgPSAic29waGdvLHNnMjAwMC1waW5jdHJsIjsKKwkJ
CXJlZyA9IDwweDAzMDAxMDAwIDB4MTAwMD4sCisJCQnCoMKgwqDCoMKgIDwweDA1MDI3MDAwIDB4
MTAwMD47CisJCQlyZWctbmFtZXMgPSAic3lzIiwgInJ0YyI7CisJCX07CisJfTsKK307CisKKyZj
cHVzIHsKKwljcHUwOiBjcHVAMCB7CisJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTMiOwor
CQlkZXZpY2VfdHlwZSA9ICJjcHUiOworCQlyZWcgPSA8MD47CisJCWVuYWJsZS1tZXRob2QgPSAi
cHNjaSI7CisJCW5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyPjsKKwl9OworCisJbDI6IGwyLWNhY2hl
IHsKKwkJY29tcGF0aWJsZSA9ICJjYWNoZSI7CisJfTsKK307CisKKyZjbGsgeworCWNvbXBhdGli
bGUgPSAic29waGdvLHNnMjAwMC1jbGsiOworfTsKKworJnNhcmFkYyB7CisJaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDg0IElSUV9UWVBFX0VER0VfUklTSU5HPjsKK307CisKKyZkbWFjIHsKKwlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMTMgSVJRX1RZUEVfTEVWRUxfSElHSD47Cit9OworCismc3BpMCB7
CisJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM4IElSUV9UWVBFX0xFVkVMX0hJR0g+OworfTsKKwor
JnNwaTEgeworCWludGVycnVwdHMgPSA8R0lDX1NQSSAzOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
K307CisKKyZzcGkyIHsKKwlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDAgSVJRX1RZUEVfTEVWRUxf
SElHSD47Cit9OworCismc3BpMyB7CisJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQxIElSUV9UWVBF
X0xFVkVMX0hJR0g+OworfTsKKworJnVhcnQwIHsKKwlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjgg
SVJRX1RZUEVfTEVWRUxfSElHSD47Cit9OworCismdWFydDEgeworCWludGVycnVwdHMgPSA8R0lD
X1NQSSAyOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKK307CisKKyZ1YXJ0MiB7CisJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDMwIElSUV9UWVBFX0xFVkVMX0hJR0g+OworfTsKKworJnVhcnQzIHsKKwlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMzEgSVJRX1RZUEVfTEVWRUxfSElHSD47Cit9OworCismdWFy
dDQgeworCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKK307
CisKKyZwb3J0YSB7CisJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQ0IElSUV9UWVBFX0xFVkVMX0hJ
R0g+OworfTsKKworJnBvcnRiIHsKKwlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDUgSVJRX1RZUEVf
TEVWRUxfSElHSD47Cit9OworCismcG9ydGMgeworCWludGVycnVwdHMgPSA8R0lDX1NQSSA0NiBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsKK307CisKKyZwb3J0ZCB7CisJaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDQ3IElSUV9UWVBFX0xFVkVMX0hJR0g+OworfTsKKworJmkyYzAgeworCWludGVycnVwdHMg
PSA8R0lDX1NQSSAzMyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKK307CisKKyZpMmMxIHsKKwlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMzQgSVJRX1RZUEVfTEVWRUxfSElHSD47Cit9OworCismaTJjMiB7
CisJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM1IElSUV9UWVBFX0xFVkVMX0hJR0g+OworfTsKKwor
JmkyYzMgeworCWludGVycnVwdHMgPSA8R0lDX1NQSSAzNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
K307CisKKyZpMmM0IHsKKwlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzcgSVJRX1RZUEVfTEVWRUxf
SElHSD47Cit9OworCismZW1tYyB7CisJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE4IElSUV9UWVBF
X0xFVkVMX0hJR0g+OworfTsKKworJnNkaGNpMCB7CisJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIw
IElSUV9UWVBFX0xFVkVMX0hJR0g+OworfTsKKworJnNkaGNpMSB7CisJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDIyIElSUV9UWVBFX0xFVkVMX0hJR0g+OworfTsKCi0tIApBbGV4YW5kZXIgU3ZlcmRs
aW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
