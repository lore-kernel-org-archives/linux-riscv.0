Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D340C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RT+yJ4d/8i7t/krAOCFphdHpu8aslXB2cy3zg3o85hg=; b=4wmn7ugQAuT6gc
	tcNbEwnyUtj8K1KaWl0u/0vpgaCZhjN4uq1xJkdjp0SB+oyCZEGGApZwkfrt8n4M2ku6XFJOaUvw2
	SGWgMWnRIsuB7O7y/rKfKnrWMadBWBBi3rSOqOfOjsU2361/7vkWnBVJpNnLeDklI7Ad8aJAW4JzQ
	g82cg0OuZFXyKgr93cQLxnbj9ByEsJlgKfe810mcQSBt+ICMCUeaxGh8JD7uo/2azbcDcA6ejLuPB
	1gcdZZGWP8SBvmtfv4BYtKKcd06m+ks7E1KWenQoO1Io3KAwIioPlHMssEdxTaf+avocaARpU3fPq
	aHRNZ5xfnmsBDPvmmP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38wh-0000000Ctkq-35tI;
	Fri, 11 Apr 2025 07:37:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38we-0000000CtkS-2gum
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:37:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22438c356c8so19402435ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744357019; x=1744961819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUyg6ML9LhixzC9L8kPFXh5mzqTZMszHME6+Lb2OjTs=;
        b=uqqogEbidmyrfxfS0/XKrwuHhHbEdgyqDlEF1PlSp9YFUNQVxNnxKytMtNsT3uQpKl
         6R2QVTK3GJ5Ob8YkMe5WUs2hTxkLRLwM4Dx+zhg3iNIKEL7a5f4pB5Sf5sXusSpSwLRW
         t+JeNw52gUzk+XIH3FJZGW0C7zFhHEyVM23kKeZ3g7B0EiV8czezHb0b5K1xG3YBfajJ
         Z8aC5UK575vh8OWeyjy3sLYzMrVnLDwDKzerMZKil97EQkfKPdtSrm9w7oiNoGQyZzNL
         bbYGB+14fJpWq4McW++JgZDJC53pjR+WGicSx7IDNbYpnWhVJMErUN/nixQerHynjtWq
         6/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744357019; x=1744961819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUyg6ML9LhixzC9L8kPFXh5mzqTZMszHME6+Lb2OjTs=;
        b=ReIJ2IYYoCRmW/G1ILPexhpldbBrfdP/E+nlkSXvCajMIYkOxFjC2zXFRctjHwxswB
         XJt58+ucs4WuqY6nnjfNy8y+aiL2hAi4ifZ5LXENCXdJomxmQkwDYNsgXBhB1syw/9IB
         oKtq06moebrfaDzb52yur6Q+c/7AH78mX3V7ZUS5heml1t/e7CzvxZCNK+ljWmXGe9LK
         xkCIYuPTrBMFSWNrSqlCDGecdQsm/VJCpE38dzvPKwz7v3/ckij9E9zrF8x54VxybUU8
         i/lSogvS80rpJXcLL7uZXBqmBsyu8dMb8Ve84UJGCoR0EW/thLuNOjvUWVdinVXu8M+5
         dCwA==
X-Gm-Message-State: AOJu0YxqktDCPA1ji1BNiYmkq/iEeHistDKn9bScyUIQMKnfa8FYFw/3
	fwptYM2WQ0JRbc89dVc042sCUfbIz2C+KhgcsgeGcN5aNnYlhITGF5AlPMJU6lo=
X-Gm-Gg: ASbGncuPRjlP/CQKdetzGjGpeV/LnEFPvIL+fQIK4jtOKz8R76FlsUnVX3wmuhS3sb8
	x+hFaoo5njB1By8kkQd+Er43nDX2pfCy7eGNv66b6isPkgke2MsaFjmI1vWEwZIf1FyCP42pSTj
	TsoyQOAyRbB10AiNrTHEZZDYA0WAxgYeTbkMBX/L9amxai0H+auuxV+/UYdaLmHw8dkyF06KIwT
	PckA3kGKeUg3V2P+ZcZdcltZ6d0dx7t3qBoTlxJZ9wOn6HVxrJPk5+AUQ+Ol63o/D73UZUsrol9
	8Ae+Hi+CgR0QFVcOnFUxhjeBjNLd0e2uC6IewEKa36aRIxYVzFs313m43JRzjufezEeqiI/lzgG
	LMKH2c7PFJQ==
X-Google-Smtp-Source: AGHT+IEd40nfp4iwGxv5MLZynxdnkq4ombov6BmiQiZEKqPac8tr3ttbIGoc6Dd0qawCy4dcOKZdGg==
X-Received: by 2002:a17:903:3c6c:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22bea4a3453mr25307265ad.9.1744357019038;
        Fri, 11 Apr 2025 00:36:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62b96sm43068365ad.13.2025.04.11.00.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 00:36:58 -0700 (PDT)
Message-ID: <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
Date: Fri, 11 Apr 2025 09:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: Nylon Chen <nylon.chen@sifive.com>, linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 charlie@rivosinc.com, jesse@rivosinc.com, evan@rivosinc.com,
 zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, zong.li@sifive.com
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250411073850.3699180-3-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_003700_946828_1EE6D781 
X-CRM114-Status: GOOD (  14.89  )
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

SGkgTnlsb24sCgpJIGFscmVhZHkgaGF2ZSBhIHBlbmRpbmcgZml4IGZvciB0aGF0IGJ1ZyB3aGlj
aCBpcyB0byByZWVuYWJsZQppbnRlcnJ1cHRzIHdoaWxlIGhhbmRsaW5nIG1pc2FsaWduZWQgZmF1
bHRzLiBQbGVhc2Ugc2VlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1
MDMxNzE3MDYyNS4xMTQyODcwLTEyLWNsZWdlckByaXZvc2luYy5jb20vCgpUaGFua3MsCgpDbMOp
bWVudAoKT24gMTEvMDQvMjAyNSAwOTozOCwgTnlsb24gQ2hlbiB3cm90ZToKPiBVc2UgY29weV9m
cm9tX3VzZXJfbm9mYXVsdCgpIGFuZCBjb3B5X3RvX3VzZXJfbm9mYXVsdCgpIGluc3RlYWQgb2YK
PiBjb3B5X2Zyb20vdG9fdXNlciBmdW5jdGlvbnMgaW4gdGhlIG1pc2FsaWduZWQgYWNjZXNzIHRy
YXAgaGFuZGxlcnMuCj4gCj4gVGhlIGZvbGxvd2luZyBidWcgcmVwb3J0IHdhcyBmb3VuZCB3aGVu
IGV4ZWN1dGluZyBtaXNhbGlnbmVkIG1lbW9yeQo+IGFjY2Vzc2VzOgo+IAo+IEJVRzogc2xlZXBp
bmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250ZXh0IGF0IC4vaW5jbHVkZS9saW51
eC91YWNjZXNzLmg6MTYyCj4gaW5fYXRvbWljKCk6IDAsIGlycXNfZGlzYWJsZWQoKTogMSwgbm9u
X2Jsb2NrOiAwLCBwaWQ6IDExNSwgbmFtZTogdHdvCj4gcHJlZW1wdF9jb3VudDogMCwgZXhwZWN0
ZWQ6IDAKPiBDUFU6IDAgVUlEOiAwIFBJRDogMTE1IENvbW06IHR3byBOb3QgdGFpbnRlZCA2LjE0
LjAtcmM1ICMyNAo+IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiBDYWxs
IFRyYWNlOgo+ICBbPGZmZmZmZmZmODAwMTYwZWE+XSBkdW1wX2JhY2t0cmFjZSsweDFjLzB4MjQK
PiAgWzxmZmZmZmZmZjgwMDAyMzA0Pl0gc2hvd19zdGFjaysweDI4LzB4MzQKPiAgWzxmZmZmZmZm
ZjgwMDEwZmFlPl0gZHVtcF9zdGFja19sdmwrMHg0YS8weDY4Cj4gIFs8ZmZmZmZmZmY4MDAxMGZl
MD5dIGR1bXBfc3RhY2srMHgxNC8weDFjCj4gIFs8ZmZmZmZmZmY4MDA0ZTQ0ZT5dIF9fbWlnaHRf
cmVzY2hlZCsweGZhLzB4MTA0Cj4gIFs8ZmZmZmZmZmY4MDA0ZTQ5Nj5dIF9fbWlnaHRfc2xlZXAr
MHgzZS8weDYyCj4gIFs8ZmZmZmZmZmY4MDE5NjNjND5dIF9fbWlnaHRfZmF1bHQrMHgxYy8weDI0
Cj4gIFs8ZmZmZmZmZmY4MDQyNTM1Mj5dIF9jb3B5X2Zyb21fdXNlcisweDI4LzB4YWEKPiAgWzxm
ZmZmZmZmZjgwMDAyOTZjPl0gaGFuZGxlX21pc2FsaWduZWRfc3RvcmUrMHgyMDQvMHgyNTQKPiAg
WzxmZmZmZmZmZjgwOWVhZTgyPl0gZG9fdHJhcF9zdG9yZV9taXNhbGlnbmVkKzB4MjQvMHhlZQo+
ICBbPGZmZmZmZmZmODA5ZjRmMWE+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTQ2LzB4MTUyCj4gCj4g
Rml4ZXM6IGI2ODZlY2RlYWNmNiAoInJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmljdCB1c2VyIGFj
Y2VzcyB0byBrZXJuZWwgbWVtb3J5IikKPiBGaXhlczogNDQxMzgxNTA2YmE3ICgicmlzY3Y6IG1p
c2FsaWduZWQ6IHJlbW92ZSBDT05GSUdfUklTQ1ZfTV9NT0RFIHNwZWNpZmljIGNvZGUiKQo+IAo+
IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMKPiBpbmRleCBkNzI3NWRmYjZiN2UuLjU2M2Y3M2Y4OGZhOCAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBAQCAtNDU1LDcgKzQ1NSw3IEBAIHN0YXRp
YyBpbnQgaGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Cj4gIAo+ICAJdmFsLmRhdGFfdTY0ID0gMDsKPiAgCWlmICh1c2VyX21vZGUocmVncykpIHsKPiAt
CQlpZiAoY29weV9mcm9tX3VzZXIoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbikpCj4gKwkJ
aWYgKGNvcHlfZnJvbV91c2VyX25vZmF1bHQoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbikp
Cj4gIAkJCXJldHVybiAtMTsKPiAgCX0gZWxzZSB7Cj4gIAkJbWVtY3B5KCZ2YWwsICh1OCAqKWFk
ZHIsIGxlbik7Cj4gQEAgLTU1Niw3ICs1NTYsNyBAQCBzdGF0aWMgaW50IGhhbmRsZV9zY2FsYXJf
bWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgCQlyZXR1cm4gLUVPUE5P
VFNVUFA7Cj4gIAo+ICAJaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+IC0JCWlmIChjb3B5X3RvX3Vz
ZXIoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbikpCj4gKwkJaWYgKGNvcHlfdG9fdXNlcl9u
b2ZhdWx0KCh1OCBfX3VzZXIgKilhZGRyLCAmdmFsLCBsZW4pKQo+ICAJCQlyZXR1cm4gLTE7Cj4g
IAl9IGVsc2Ugewo+ICAJCW1lbWNweSgodTggKilhZGRyLCAmdmFsLCBsZW4pOwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
