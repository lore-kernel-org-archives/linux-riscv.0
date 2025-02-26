Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522E4C18E7C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6uBmNCpjm3kfls+uQ7jIHHV7ZefVpUTeBNy8UC3/Ho=; b=ff1CNL74zac0hP
	/DTUz5KGr67oCy800BCa/Fibcaso2ZdUyxVQepimpIlMcHywgR5JwMZBPUx5bZDoA8FG9S+0CTHV/
	wPu7YAnS762JKQ6pAFnYNlk01AHegFNr8l+4jaGUbtQEWyMFiEU5jVEJI/ioQ4qqKScJKZ/uQy+av
	Cyequ7FwY7DXXs9e5Uo4AbOAKDkgzb9ySJL2cO6ceSHdR83wG+pHcdmbpx47HilXKUWlDhzflY7PV
	9d/cUN100sip1778ZaCLvyM2Jj3zOpCPiO8SsxxczTnyl7TeJ9YfTYEjrueggA11dNV/odw2BmkEg
	4q25M0YUKMRPdL0saVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFt-00000004HVj-3c93;
	Wed, 26 Feb 2025 15:23:25 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFO-00000004GUe-3zqe
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 15:22:56 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-855a5aa9360so505896139f.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2025 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1740583373; x=1741188173; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJcEK4sOf8nkoSH+sJw+bKRznJ9CM5hAQnbFbGBpuK0=;
        b=ljGl4q1KojAF/z+JBSuSjqD18md1K9BehBw40Pxv2PwzIXhtHFpBdpnO9uTVZt2B+K
         7S7IKwQvfy4K1/acp1OD1esm7SlZ2XgieZJpEdE6k5845/64JKUE0+g/85PYPdGcrwGv
         UrwXS1jFI0PqHKDS7SwCcMJfNYkEYEGiZofcmYmDNSt48SYMstBrEliEgQWnwHMuHBef
         fy/4lrTggxCI9tTpbU8nEwbTvDlrsGt2ZH9RAhk8f7VUEBinsXhIx19oH7xbU5mG6Ado
         94Co62H7D0+ZARjldce7x583Q0Dd61V/hU1ajRYbGma6cBcIxsBqATTenRIf2Oahk+p9
         9Vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583373; x=1741188173;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJcEK4sOf8nkoSH+sJw+bKRznJ9CM5hAQnbFbGBpuK0=;
        b=rt1q5FUcRljOL4oAzfwVnq59JUne0T9P+NOhHMfdn/dTW37jT1l75i825ZQL2Un7uW
         j1E66tzJBygCiG1wo/3cA8lXi4Y1wIVn8VCJQ/jXlVGL7IT5FvMrbyElMtGtC+W78u83
         OSaAHV4NwKZ+RQ7D59iR8BC/qzZVHJCsDUWJ0r6aGbHIFB4YllL9QoF30DyKvszgTZ6c
         WQYdJNxaYNzWhHz33qJ+1ekv/DD34tRtEpttfgRQXLBJp6IMn0clF05uAe9BRS6iD7YB
         j7V5v5rqFg09+TxaKRd58YxRCuOJ0D9XcQpvEQBOVLUopfdmS18ZZbvIuNC7DJOsTT6U
         3zxA==
X-Forwarded-Encrypted: i=1; AJvYcCVsSEA1X9IAq3DDh51ZB1k6DZMroV/WH8UxxbZZy6Yj+YGl53jWoldVVkDPdGB5znjltuacgW8dlJ4ceA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyplkqHhbK6RAFaAKK4hMvjEgwmJoJy/KWucdmxZWf43SZpsi3X
	6ZZiD5pjRWL67l263v6EkFOBhWkqTgqczizaVc8E0ex/JHTZbqkc9bsqB/eC8pk=
X-Gm-Gg: ASbGnctLyMm6laZJnywE6UlwbR5WkJ45UPHF2RAC75EqzDFz2WlACMR3k6krYNUjToX
	ce1/cWRyYmuiM9zG1eYlbU/9e2ByS6n4t+H0/J+duq6kiFG1PVECdX9UuWHt/LZn8fZt3le2vWH
	2VDtGqhpSPb03mXf2jxsD+DeiBzg+5OH8neZR5RV3Lyh/zD5m8OfzfKq6dJipHnZIbFxl4BY7Qa
	zENjRmsMK2j6dJbvL1XBWuDlvvgYzocHgQ7k7XRTOSZUZsuNoCYpzNz2ZQeqT02rRIg5JE1rXPu
	Bdb7Vw6zBNI91ZSP1iSOS2NC9DgA1PZry5Ejvq2WtESivoeOvQ==
X-Google-Smtp-Source: AGHT+IH3JGSazN4a7DLB5z3B9JItdUDgi5/0Ituv+SUpjy9S1mPfOmAWS57i2QTwFrEPGyFnUtPTMA==
X-Received: by 2002:a05:6602:1693:b0:855:c476:8b95 with SMTP id ca18e2360f4ac-856203c36b3mr919158839f.12.1740583373401;
        Wed, 26 Feb 2025 07:22:53 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f04753070esm941666173.120.2025.02.26.07.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 07:22:53 -0800 (PST)
Message-ID: <60900b42-298c-4b9f-86cf-af31aa5a02d3@sifive.com>
Date: Wed, 26 Feb 2025 09:22:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] riscv: Relocatable NOMMU kernels
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 akpm@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
 alexghiti@rivosinc.com
References: <mhng-25ab7f97-42b6-40a8-b96d-d387cbf54ad1@palmer-ri-x1c9>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <mhng-25ab7f97-42b6-40a8-b96d-d387cbf54ad1@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_072255_063356_D3CF1598 
X-CRM114-Status: GOOD (  13.24  )
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

SGkgUGFsbWVyLAoKT24gMjAyNS0wMi0xMyA4OjE3IEFNLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToK
PiBPbiBTYXQsIDI2IE9jdCAyMDI0IDEwOjEzOjUyIFBEVCAoLTA3MDApLCBzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tIHdyb3RlOgo+PiBDdXJyZW50bHksIFJJU0MtViBOT01NVSBrZXJuZWxzIGFy
ZSBsaW5rZWQgYXQgQ09ORklHX1BBR0VfT0ZGU0VULCBhbmQKPj4gc2luY2UgdGhleSBhcmUgbm90
IHJlbG9jYXRhYmxlLCBtdXN0IGJlIGxvYWRlZCBhdCB0aGlzIGFkZHJlc3MgYXMgd2VsbC4KPj4g
Q09ORklHX1BBR0VfT0ZGU0VUIGlzIG5vdCBhIHVzZXItdmlzaWJsZSBLY29uZmlnIG9wdGlvbiwg
c28gaXRzIHZhbHVlIGlzCj4+IG5vdCBvYnZpb3VzLCBhbmQgdXNlcnMgbXVzdCBwYXRjaCB0aGUg
a2VybmVsIHNvdXJjZSBpZiB0aGV5IHdhbnQgdG8gbG9hZAo+PiBpdCBhdCBhIGRpZmZlcmVudCBh
ZGRyZXNzLgo+Pgo+PiBNYWtlIE5PTU1VIGtlcm5lbHMgbW9yZSBwb3J0YWJsZSBieSBtYWtpbmcg
dGhlbSByZWxvY2F0YWJsZSBieSBkZWZhdWx0Lgo+PiBUaGlzIGFsbG93cyBhIHNpbmdsZSBrZXJu
ZWwgYmluYXJ5IHRvIHdvcmsgd2hlbiBsb2FkZWQgYXQgYW55IGFkZHJlc3MuCj4+Cj4+Cj4+IFNh
bXVlbCBIb2xsYW5kICg2KToKPj4gwqAgcmlzY3Y6IFJlbW92ZSBkdXBsaWNhdGUgQ09ORklHX1BB
R0VfT0ZGU0VUIGRlZmluaXRpb24KPj4gwqAgcmlzY3Y6IEFsbG93IE5PTU1VIGtlcm5lbHMgdG8g
YWNjZXNzIGFsbCBvZiBSQU0KPj4gwqAgcmlzY3Y6IFN1cHBvcnQgQ09ORklHX1JFTE9DQVRBQkxF
IG9uIE5PTU1VCj4+IMKgIGFzbS1nZW5lcmljOiBBbHdheXMgZGVmaW5lIEVsZl9SZWwgYW5kIEVs
Zl9SZWxhCj4+IMKgIHJpc2N2OiBTdXBwb3J0IENPTkZJR19SRUxPQ0FUQUJMRSBvbiByaXNjdjMy
Cj4+IMKgIHJpc2N2OiBSZW1vdmUgQ09ORklHX1BBR0VfT0ZGU0VUCj4+Cj4+IMKgYXJjaC9yaXNj
di9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwICstLS0KPj4gwqBhcmNo
L3Jpc2N2L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+PiDCoGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5owqDCoMKgIHwgMjcgKysrKy0tLS0tCj4+IMKgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfMKgIDYgKy0KPj4gwqBhcmNoL3Jpc2N2L21t
L2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDk3ICsrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tCj4+IMKgaW5jbHVkZS9hc20tZ2VuZXJpYy9tb2R1bGUuaMKgwqDCoMKgIHzC
oCA4IC0tLQo+PiDCoDYgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRp
b25zKC0pCj4gCj4gSSdtIGdldHRpbmcgc29tZSBidWlsZCBmYWlsdXJlcwo+IAo+IHJpc2N2NjQt
dW5rbm93bi1saW51eC1nbnUtbGQ6IGFyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEubzog
cmVsb2NhdGlvbgo+IFJfUklTQ1ZfSEkyMCBhZ2FpbnN0IGB0bGJfZmx1c2hfYWxsX3RocmVzaG9s
ZCcgY2FuIG5vdCBiZSB1c2VkIHdoZW4gbWFraW5nIGEKPiBzaGFyZWQgb2JqZWN0OyByZWNvbXBp
bGUgd2l0aCAtZlBJQwo+IHJpc2N2NjQtdW5rbm93bi1saW51eC1nbnUtbGQ6IGFyY2gvcmlzY3Yv
ZXJyYXRhL3RoZWFkL2VycmF0YS5vOiByZWxvY2F0aW9uCj4gUl9SSVNDVl9ISTIwIGFnYWluc3Qg
YHJpc2N2X2Nib21fYmxvY2tfc2l6ZScgY2FuIG5vdCBiZSB1c2VkIHdoZW4gbWFraW5nIGEKPiBz
aGFyZWQgb2JqZWN0OyByZWNvbXBpbGUgd2l0aCAtZlBJQwoKV2hhdCB0b29sY2hhaW4gYW5kIGNv
bmZpZyBkbyB5b3Ugc2VlIGZhaWx1cmVzIHdpdGg/IEkgaGF2ZSB0cmllZCBidWlsZGluZyB0aGlz
CnNlcmllcyBvbiB0b3Agb2YgdjYuMTQtcmM0IHdpdGggR0NDIDE0LjIuMSBhbmQKICogZGVmY29u
ZmlnCiAqIGRlZmNvbmZpZyArIE5PTU1VICsgUy1tb2RlCiAqIGRlZmNvbmZpZyArIE5PTU1VICsg
TS1tb2RlCiAqIGRlZmNvbmZpZyArIDMyLWJpdAogKiBkZWZjb25maWcgKyAzMi1iaXQgKyBOT01N
VSArIFMtbW9kZQogKiBkZWZjb25maWcgKyAzMi1iaXQgKyBOT01NVSArIE0tTW9kZQogKiBub21t
dV9rMjEwX2RlZmNvbmZpZwogKiBub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWcKICogbm9tbXVf
dmlydF9kZWZjb25maWcKYW5kIGFsbCBzdWNjZWVkLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
