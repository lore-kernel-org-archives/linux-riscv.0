Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD2EC52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTyz2284QS05OuMY6tJ/XnlxC0T2eR2bOwc8Fx085b0=; b=dyPEgiYw1xRtx+
	Bfis/pnBc/opGwHzYZa5VxFNAp3mS6/9C96n2IHxIgCrJfj0TYstMTI39KU2mCmPQcFrpVjtBavQc
	MAqK24fE4o8oyo8r47U88E9t+jIv15cTa3xWMRZ8yIdVvdmzoK1H9TNkKCGMLPksx4YBTkgAJ2/1j
	kTLnkYGrTUB0hH44pjEiFsrzWA89wFEvdGnZph+581ndzW5gfDaPCQkehIpWdZV7XX5ZpaCMHuxji
	2BZuznrlo86hUIBrhLM1hEnFniRv9+U0uD5ucYGM6KyjBD7uK2TLehTgtRHwo0FWK4Hu18dwKJCsp
	UYQQ5huHKS+H07OkqRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9xb-00000006KYQ-2Q1G;
	Wed, 14 Aug 2024 09:06:27 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se9xY-00000006KXu-34rK
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 09:06:26 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-81f921c40f2so266702739f.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723626383; x=1724231183; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6SQXbmHlAnUU8CoNxf84rYVf5mFcg+jyOBse78TzCg=;
        b=MbUw3Od1QMbpExwqGtuv+wuu0f5IY41C5iZHVNoyyJTwUPkRsetDv6Xqki8g+bFOFk
         veoh/+85v846R/Dld22oyAa0ezFrrbDXjsw8GeBzt93dnX17qG8TQXP3Ps8eb1/y0pqr
         dS6JkET3lkkB9oG1DqYHtRZq/SdKUwrmeJEExQhwbfhYboTYKIYl7w9IButJ67q/9kHY
         c+zl4EWNr2f0rnN70vJgUAeZ/5Xf90UX4auZza5G/gKSpsY/C9r6vanVSPXfcDCsUipV
         Oq1e7K5ER/e5TrImBopHLu84M0S4L1nUo2kV6825iO4DjNAdNIDaedsyAwlzEvUhIkZ3
         Wjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723626383; x=1724231183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r6SQXbmHlAnUU8CoNxf84rYVf5mFcg+jyOBse78TzCg=;
        b=OejDHklfmxh1U6Dmd1HM3ZvWBkc9PiSgI2NEhbxtN9qMNr58m8w7A0RUG93GWGt/fk
         tKyDe8YsU7RkWNd7u587petiUBksXw7ED4v9hOMkbGaikINVzEzqAO+sfLN6TtwrVgXM
         72PMln0z2Jvpc0t9FOhXyqGHLBZVmSb5FioBZrCRc0uKXf2tLoGk58xc1MffmvvOlIFE
         0ZI2hPcBHnE+Ln5/OkAnYPZVtHZwS3AB1/HqNNNCncmZsLWFe522W+IBLSYLFl1dFpKc
         DjF9/83L4jzeGPyFK+a0KIQlluhwTUYLADFmN+JRznDbcXXwPdIG6qPEV8M+evtZGbHY
         xg0g==
X-Forwarded-Encrypted: i=1; AJvYcCX6onz/uuftIs0yaiS9rfP2yfHGHhesQeorH0l4u/OOBdPqsa2hrE/emURdK0Zl0hs9OWi6D59+hXPfkEaJVKfFSlg6mBgdL758/JJ4BugA
X-Gm-Message-State: AOJu0YyrMw/EQR5zo95MYjNHOezFXc2Iq59EtzfOYIUB5gecfIhtfPvC
	s+O4EMqdqDK5V0CdRfK+89Lm5mUkvY25BA5/pvw0t34ZjeyWN8meqFgeGqD3xNI=
X-Google-Smtp-Source: AGHT+IEcuNT8XUtX1as+8eGOWzzUUZRDmIGV41Y9+N82sEFGMuSDBVxFjSYrjFZ72fjKLzTbwN40QA==
X-Received: by 2002:a05:6602:14c6:b0:806:560:92b5 with SMTP id ca18e2360f4ac-824dad7c853mr238518039f.11.1723626383064;
        Wed, 14 Aug 2024 02:06:23 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8226720d2a0sm324849939f.2.2024.08.14.02.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 02:06:22 -0700 (PDT)
Message-ID: <8694fc12-dcd0-45d6-acf7-ab44b9e310bc@sifive.com>
Date: Wed, 14 Aug 2024 04:06:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: Omit optimized string routines when using
 KASAN
To: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org
References: <20240801033725.28816-1-samuel.holland@sifive.com>
 <20240801033725.28816-2-samuel.holland@sifive.com>
 <e935d5a3-1754-422c-aa92-08977ab9c929@ghiti.fr>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <e935d5a3-1754-422c-aa92-08977ab9c929@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_020624_796488_61DF2B4A 
X-CRM114-Status: GOOD (  19.62  )
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

SGkgQWxleCwKCk9uIDIwMjQtMDgtMDEgNToyNiBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IEhpIFNhbXVlbCwKPiAKPiBPbiAwMS8wOC8yMDI0IDA1OjM2LCBTYW11ZWwgSG9sbGFuZCB3cm90
ZToKPj4gVGhlIG9wdGltaXplZCBzdHJpbmcgcm91dGluZXMgYXJlIGltcGxlbWVudGVkIGluIGFz
c2VtYmx5LCBzbyB0aGV5IGFyZQo+PiBub3QgaW5zdHJ1bWVudGVkIGZvciB1c2Ugd2l0aCBLQVNB
Ti4gRmFsbCBiYWNrIHRvIHRoZSBDIHZlcnNpb24gb2YgdGhlCj4+IHJvdXRpbmVzIGluIG9yZGVy
IHRvIGltcHJvdmUgS0FTQU4gY292ZXJhZ2UuIFRoaXMgZml4ZXMgdGhlCj4+IGthc2FuX3N0cmlu
Z3MoKSB1bml0IHRlc3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+PiAtLS0KPj4KPj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9zdHJpbmcuaCB8IDIgKysKPj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvcmlzY3Zfa3N5bXMu
YyB8IDMgLS0tCj4+IMKgIGFyY2gvcmlzY3YvbGliL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoCB8
IDIgKysKPj4gwqAgYXJjaC9yaXNjdi9saWIvc3RyY21wLlPCoMKgwqDCoMKgwqDCoMKgIHwgMSAr
Cj4+IMKgIGFyY2gvcmlzY3YvbGliL3N0cmxlbi5TwqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+PiDC
oCBhcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlPCoMKgwqDCoMKgwqDCoCB8IDEgKwo+PiDCoCBhcmNo
L3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZcKgwqAgfCAyICsrCj4+IMKgIDcgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zdHJpbmcuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3Ry
aW5nLmgKPj4gaW5kZXggYTk2YjFmZWEyNGZlLi41YmE3N2Y2MGJmMGIgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RyaW5nLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zdHJpbmcuaAo+PiBAQCAtMTksNiArMTksNyBAQCBleHRlcm4gYXNtbGlua2FnZSB2
b2lkICpfX21lbWNweSh2b2lkICosIGNvbnN0IHZvaWQgKiwgc2l6ZV90KTsKPj4gwqAgZXh0ZXJu
IGFzbWxpbmthZ2Ugdm9pZCAqbWVtbW92ZSh2b2lkICosIGNvbnN0IHZvaWQgKiwgc2l6ZV90KTsK
Pj4gwqAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqX19tZW1tb3ZlKHZvaWQgKiwgY29uc3Qgdm9p
ZCAqLCBzaXplX3QpOwo+PiDCoCArI2lmICEoZGVmaW5lZChDT05GSUdfS0FTQU5fR0VORVJJQykg
fHwgZGVmaW5lZChDT05GSUdfS0FTQU5fU1dfVEFHUykpCj4gCj4gCj4gV2UgZG8gbm90IHN1cHBv
cnQgS0FTQU5fU1dfVEFHUyBzbyB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGlzICNpZmRlZi4KCkkg
anVzdCBzZW50IGFuIFJGQyBpbXBsZW1lbnRhdGlvbiBvZiBLQVNBTl9TV19UQUdTWzFdICh3aGlj
aCB5b3Ugd291bGRuJ3QgaGF2ZQprbm93biBJIHdhcyB3b3JraW5nIG9uIGF0IHRoZSB0aW1lIDop
ICkuIFNpbmNlIHRoZXNlIGNoYW5nZXMgd2lsbCBiZSBuZWVkZWQgZm9yCmJvdGggbW9kZXMsIGl0
IG1hZGUgc2Vuc2UgdG8gbWUgdG8gZ28gYWhlYWQgYW5kIGNvdmVyIGJvdGggYXQgb25jZS4KClJl
Z2FyZHMsClNhbXVlbAoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA4MTQw
ODU2MTguOTY4ODMzLTEtc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbS8KCj4+IMKgICNkZWZpbmUg
X19IQVZFX0FSQ0hfU1RSQ01QCj4+IMKgIGV4dGVybiBhc21saW5rYWdlIGludCBzdHJjbXAoY29u
c3QgY2hhciAqY3MsIGNvbnN0IGNoYXIgKmN0KTsKPj4gwqAgQEAgLTI3LDYgKzI4LDcgQEAgZXh0
ZXJuIGFzbWxpbmthZ2UgX19rZXJuZWxfc2l6ZV90IHN0cmxlbihjb25zdCBjaGFyICopOwo+PiDC
oCDCoCAjZGVmaW5lIF9fSEFWRV9BUkNIX1NUUk5DTVAKPj4gwqAgZXh0ZXJuIGFzbWxpbmthZ2Ug
aW50IHN0cm5jbXAoY29uc3QgY2hhciAqY3MsIGNvbnN0IGNoYXIgKmN0LCBzaXplX3QgY291bnQp
Owo+PiArI2VuZGlmCj4+IMKgIMKgIC8qIEZvciB0aG9zZSBmaWxlcyB3aGljaCBkb24ndCB3YW50
IHRvIGNoZWNrIGJ5IGthc2FuLiAqLwo+PiDCoCAjaWYgZGVmaW5lZChDT05GSUdfS0FTQU4pICYm
ICFkZWZpbmVkKF9fU0FOSVRJWkVfQUREUkVTU19fKQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvcmlzY3Zfa3N5bXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Jpc2N2X2tzeW1zLmMK
Pj4gaW5kZXggYTcyODc5YjQyNDlhLi41YWIxYzdlMWE2ZWQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL3Jpc2N2X2tzeW1zLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcmlz
Y3Zfa3N5bXMuYwo+PiBAQCAtMTIsOSArMTIsNiBAQAo+PiDCoCBFWFBPUlRfU1lNQk9MKG1lbXNl
dCk7Cj4+IMKgIEVYUE9SVF9TWU1CT0wobWVtY3B5KTsKPj4gwqAgRVhQT1JUX1NZTUJPTChtZW1t
b3ZlKTsKPj4gLUVYUE9SVF9TWU1CT0woc3RyY21wKTsKPj4gLUVYUE9SVF9TWU1CT0woc3RybGVu
KTsKPj4gLUVYUE9SVF9TWU1CT0woc3RybmNtcCk7Cj4+IMKgIEVYUE9SVF9TWU1CT0woX19tZW1z
ZXQpOwo+PiDCoCBFWFBPUlRfU1lNQk9MKF9fbWVtY3B5KTsKPj4gwqAgRVhQT1JUX1NZTUJPTChf
X21lbW1vdmUpOwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgYi9hcmNo
L3Jpc2N2L2xpYi9NYWtlZmlsZQo+PiBpbmRleCAyYjM2OWY1MWIwYTUuLjhlZWM2YjY5YTg3NSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9saWIvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9yaXNj
di9saWIvTWFrZWZpbGUKPj4gQEAgLTMsOSArMywxMSBAQCBsaWItecKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKz0gZGVsYXkubwo+PiDCoCBsaWItecKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gbWVt
Y3B5Lm8KPj4gwqAgbGliLXnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IG1lbXNldC5vCj4+IMKg
IGxpYi15wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArPSBtZW1tb3ZlLm8KPj4gK2lmZXEgKCQoQ09O
RklHX0tBU0FOX0dFTkVSSUMpJChDT05GSUdfS0FTQU5fU1dfVEFHUyksKQo+PiDCoCBsaWItecKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gc3RyY21wLm8KPj4gwqAgbGliLXnCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICs9IHN0cmxlbi5vCj4+IMKgIGxpYi15wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAr
PSBzdHJuY21wLm8KPj4gK2VuZGlmCj4+IMKgIGxpYi15wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAr
PSBjc3VtLm8KPj4gwqAgaWZlcSAoJChDT05GSUdfTU1VKSwgeSkKPj4gwqAgbGliLSQoQ09ORklH
X1JJU0NWX0lTQV9WKcKgwqDCoCArPSB1YWNjZXNzX3ZlY3Rvci5vCj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2xpYi9zdHJjbXAuUyBiL2FyY2gvcmlzY3YvbGliL3N0cmNtcC5TCj4+IGluZGV4
IDY4N2IyYmVhNWM0My4uNTQyMzAxYTY3YTJmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2xp
Yi9zdHJjbXAuUwo+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9zdHJjbXAuUwo+PiBAQCAtMTIwLDMg
KzEyMCw0IEBAIHN0cmNtcF96YmI6Cj4+IMKgIC5vcHRpb24gcG9wCj4+IMKgICNlbmRpZgo+PiDC
oCBTWU1fRlVOQ19FTkQoc3RyY21wKQo+PiArRVhQT1JUX1NZTUJPTChzdHJjbXApCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2xpYi9zdHJsZW4uUyBiL2FyY2gvcmlzY3YvbGliL3N0cmxlbi5T
Cj4+IGluZGV4IDhhZTMwNjRlNDVmZi4uOTYyOTgzYjczMjUxIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2xpYi9zdHJsZW4uUwo+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9zdHJsZW4uUwo+PiBA
QCAtMTMxLDMgKzEzMSw0IEBAIHN0cmxlbl96YmI6Cj4+IMKgICNlbmRpZgo+PiDCoCBTWU1fRlVO
Q19FTkQoc3RybGVuKQo+PiDCoCBTWU1fRlVOQ19BTElBUyhfX3BpX3N0cmxlbiwgc3RybGVuKQo+
PiArRVhQT1JUX1NZTUJPTChzdHJsZW4pCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2xpYi9z
dHJuY21wLlMgYi9hcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMKPj4gaW5kZXggYWJhNWIzMTQ4NjIx
Li4wZjM1OWVhMmY1NWIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvbGliL3N0cm5jbXAuUwo+
PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMKPj4gQEAgLTEzNiwzICsxMzYsNCBAQCBz
dHJuY21wX3piYjoKPj4gwqAgLm9wdGlvbiBwb3AKPj4gwqAgI2VuZGlmCj4+IMKgIFNZTV9GVU5D
X0VORChzdHJuY21wKQo+PiArRVhQT1JUX1NZTUJPTChzdHJuY21wKQo+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtl
ZmlsZQo+PiBpbmRleCBmMTE5NDVlZTI0OTAuLmZiOWM5MTdjOWI0NSAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9yaXNjdi9wdXJnYXRv
cnkvTWFrZWZpbGUKPj4gQEAgLTEsNyArMSw5IEBACj4+IMKgICMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKPj4gwqAgwqAgcHVyZ2F0b3J5LXkgOj0gcHVyZ2F0b3J5Lm8gc2hhMjU2
Lm8gZW50cnkubyBzdHJpbmcubyBjdHlwZS5vIG1lbWNweS5vCj4+IG1lbXNldC5vCj4+ICtpZmVx
ICgkKENPTkZJR19LQVNBTl9HRU5FUklDKSQoQ09ORklHX0tBU0FOX1NXX1RBR1MpLCkKPj4gwqAg
cHVyZ2F0b3J5LXkgKz0gc3RyY21wLm8gc3RybGVuLm8gc3RybmNtcC5vCj4+ICtlbmRpZgo+PiDC
oCDCoCB0YXJnZXRzICs9ICQocHVyZ2F0b3J5LXkpCj4+IMKgIFBVUkdBVE9SWV9PQkpTID0gJChh
ZGRwcmVmaXggJChvYmopLywkKHB1cmdhdG9yeS15KSkKPiAKPiAKPiBXaXRoIHRoZSByZW1vdmFs
IG9mIEtBU0FOX1NXX1RBR1MsIHlvdSBjYW4gYWRkOgo+IAo+IFJldmlld2VkLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gCj4gQW5kIHNpbmNlIEkgaGF2ZSB0
aGlzIHRlc3RzdWl0ZSBpbiBteSBDSSwgSSBnYXZlIGl0IGEgdHJ5IGFuZCBpdCB3b3JrcyBzbzoK
PiAKPiBUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
PiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
