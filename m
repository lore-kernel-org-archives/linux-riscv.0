Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12942C83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 18:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SqxnR6IyEewOHwDXY3aNlztNO/ujs8bPK84Xds2UOaU=; b=vfyByDWm1KIF/r
	wZFFK5NKhBXMlXUR2H3vJiTCo+Zw0ubibSqhtwvTBGi5XKQJ/VBu88xhsg97ELL6cGaSaeflIqre0
	c5nYwl/UeNCfXcCq7W4SN1WeIxgwgMh6pg+o5dxYFjq7221kukLhOgSnKp/9WHb5UinKJh1Rir+OX
	OhLRFXk5nSFUcpKRh1bevm/MA5nQcLOhBionTI95M7Sikk77guedc+qgKSi/upLAeCSmkn6pVX+vU
	ogncNtZ6AzlnBw8BmafouSs2QybpMgGhxWVY29Khsqxsk0W0zfreGfOTiGmDmShlG+uQHPFlBHsoG
	7HPy2XNu4I0pmeJEY6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufjBx-0000000BiTj-2PRB;
	Sat, 26 Jul 2025 18:00:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufjBu-0000000BiT7-1n5Z
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 18:00:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-451d6ade159so22360725e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 11:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753552812; x=1754157612; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
        b=cMZ5ZxZZAfNUrGmvKbuWjUVXLhwrSw9OQgZnEwmG2oUQzM/InYIugeYN1HIIBEKKia
         69JzthwTVY/pEju3wfeOrSE5wb4q7XJXbdhDeUM3UgHIyi9vzhUeyBIrxF00pq/f0IQi
         BxW/Gph99lCfKys65YaOtks9dIC0ft5Ln6C2bxMtG5wh1l6/e3VFzn70njxJx8HnxX78
         t4+Jj75dVGLzaLzhTwkLTlQxf2q8IvR+KseSCu3npy2WUwf091ZglH2vcHWUUfbhyTHz
         qPoxCHq0tePQivisBCZH7sUzr3GSiZXfkArYNw1E7yFKEOFSCjk2KcSRyPri8/K6d/Uo
         ZDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753552812; x=1754157612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvcRHhXuYyD4nYec3hWl6gxmG7DKCLk6OOfx+dctTQc=;
        b=ETnEzJSWpT5itARjged6e7N0+r7u/nUTFgupJhz9gG3zpE5VQf58apKMuCE/BRALEg
         CZGeNtLlqr9bb8fVn+vfBsAZ8g97NMLwsZuKVNXAkoMQg2OIQFIyqSFfeqBk334yu4+5
         bHHlvMHaBrGVDVw8IEYgrgPyKodNyO4mwq/ogZsHorqcSy8+B8N0NkWu4j+VnK0WMHB/
         XjKujHk5t5l1TQxHW06hf6Bad4GswmYWHPryCLzPraUrgGjEDxcy+Ph3JmA+/DwEC9/n
         zrfI2v66YPDES9e9VtLJ2EKE3coe8zVsZlYWD5wfPKEbN/vRHDDBzF5CUBmDklRptJDL
         YoQg==
X-Forwarded-Encrypted: i=1; AJvYcCWg7xlrNT70dA1M2SGy37wyURlR9dbA3MmsrQtdhJtyUsZ26xn+iW3g0t+egcaAvsH2/AwDzJPQVAg2RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiQedd+izjxDkyH778ukoOnNXeyHd5IeCKNC5PkdaAXx7i+pMF
	tKMcLoryyIraaAysbAn9ovdNyomH8aUq6Af98VbNpVENOCCsls9znpB1yjtfL9LT6mM=
X-Gm-Gg: ASbGncvglq5WZhZOc8t6OM9d2wdgDku/9UVYeB+QWY8E8HXqJgaG0Sd7QFZyK9vqccz
	ycbO9m4asS8SB7YSd2ubhJ1yLwJ26TqGWKdhqhmo3+VAPAsi0DcbhPDTJH2fYUAdpv+4GTWQLRF
	jJorrs8kArlH/tHnFmP60L4XtGGbWYrnEwaqwt+ZlcYUCuKZU991iV9p7KWl71z0zQNfDgUdO1e
	CfsnH+W04qdzGOeDuBOBiJTKAnKZRWTrPErxuIEN83R9+DcJgOVdZ3h9f3SF79earoVORDlwl7Q
	sWWQLePsE6cAJH1mkrmNLPk2T4Wkhf3eW/p+2+9b3bcpr2+1py/LjS1e1cvevBhjdVMUGR7af/M
	gy7aqkqAZhrq3o27yTaK6SfJlb+Dt6HB+Y5BWaygcNcQFj7f5/Ot8Bu9e8nyHAkr/WAMzRkXuSa
	cdB0JHblj4oo4a
X-Google-Smtp-Source: AGHT+IEflhfEaAlph6QytLsmeVZzt9JsNjEPC6m2JqYaPbPelQ7eBKZoO5O6AvlWzFTa4x0V7hT1Cw==
X-Received: by 2002:a05:600c:3514:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-4587667a7b4mr43141945e9.33.1753552812037;
        Sat, 26 Jul 2025 11:00:12 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:49d0:43d5:5891:26ac? ([2a02:1807:2a00:3400:49d0:43d5:5891:26ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587ac58045sm37621935e9.22.2025.07.26.11.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 11:00:11 -0700 (PDT)
Message-ID: <a9acf284-d55c-4c8e-9f34-c2feb26a446b@hammernet.be>
Date: Sat, 26 Jul 2025 20:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Alex Elder <elder@ieee.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
 <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
 <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_110014_708387_BCEF395C 
X-CRM114-Status: GOOD (  17.63  )
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

CgpPbiA3LzI2LzI1IDE0OjU3LCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9uIDcvMjYvMjUgNDoxNiBB
TSwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+PiBMZSAyMy8wNy8yMDI1IMOgIDE1OjI1LCBI
ZW5kcmlrIEhhbWVybGluY2sgYSDDqWNyaXTCoDoKPj4+IFRoZSBmdW5jdGlvbiBzcGFjZW1pdF9j
Y3VfcmVzZXRfcmVnaXN0ZXIoKSBhbGxvY2F0ZXMgbWVtb3J5IGZvciBhbgo+Pj4gYXV4aWxpYXJ5
IGRldmljZS4gSWYgYXV4aWxpYXJ5X2RldmljZV9hZGQoKSBmYWlscywgaXQgc2tpcHMgY2xlYW51
cCBvZgo+Pj4gdGhlc2UgcmVzb3VyY2VzLCByZXN1bHRpbmcgaW4gbGVha3MuCj4+Pgo+Pj4gRml4
IHRoaXMgYnkgdXNpbmcgdGhlIGFwcHJvcHJpYXRlIGVycm9yIGhhbmRsaW5nIHBhdGguCj4+Pgo+
Pj4gRml4ZXM6IDk4ODU0MzUyMmViZCAoImNsazogc3BhY2VtaXQ6IHNldCB1cCByZXNldCBhdXhp
bGlhcnkgZGV2aWNlcyIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBIZW5kcmlrIEhhbWVybGluY2sgPGhl
bmRyaWsuaGFtZXJsaW5ja0BoYW1tZXJuZXQuYmU+Cj4+PiBSZXZpZXdlZC1ieTogWWl4dW4gTGFu
IDxkbGFuQGdlbnRvby5vcmc+Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4gdjI6Cj4+PiAtIFByb3Bl
cmx5IHBsYWNlIHRoZSBGaXhlcyB0aXAuCj4+PiAtLS0KPj4+IMKgIGRyaXZlcnMvY2xrL3NwYWNl
bWl0L2NjdS1rMS5jIHwgMiArLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NwYWNlbWl0
L2NjdS1rMS5jIGIvZHJpdmVycy9jbGsvc3BhY2VtaXQvY2N1LSBrMS5jCj4+PiBpbmRleCA2NWU2
ZGUwMzA3MTcuLjViYjg1ZTMyYzZjZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvY2xrL3NwYWNl
bWl0L2NjdS1rMS5jCj4+PiArKysgYi9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEuYwo+Pj4g
QEAgLTEwNTksNyArMTA1OSw3IEBAIHN0YXRpYyBpbnQgc3BhY2VtaXRfY2N1X3Jlc2V0X3JlZ2lz
dGVyKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4+IMKgwqDCoMKgwqAgcmV0ID0gYXV4aWxpYXJ5X2Rl
dmljZV9hZGQoYWRldik7Cj4+PiDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBhdXhpbGlhcnlfZGV2aWNlX3VuaW5pdChhZGV2KTsKPj4+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm4gcmV0Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2ZyZWVfYXV4X2lkOwo+
Pj4gwqDCoMKgwqDCoCB9Cj4+PiDCoMKgwqDCoMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoZGV2LCBzcGFjZW1pdF9hZGV2X3VucmVnaXN0ZXIsIGFkZXYpOwo+Pgo+Pgo+PiBIaSwK
Pj4KPj4gSSdtIG5vdCBzdXJlIHRoaXMgaXMgY29ycmVjdC4KPgo+IEknbSBzdXJlIHRoaXMgcGF0
Y2ggaXMgaW5jb3JyZWN0LCBhbmQgdGhlIG9yaWdpbmFsIGNvZGUgZGlkCj4gbm90IGhhdmUgdGhl
IHN0YXRlZCBwcm9ibGVtLsKgIFRoYW5rIHlvdSBmb3IgY2FsbGluZyBhdHRlbnRpb24KPiB0byB0
aGlzIENocmlzdG9waGUuCj4KPiBTdGVwaGVuLCBjb3VsZCB5b3UgcGxlYXNlIHJldmVydCB5b3Vy
IGNvbW1pdCBvZiB0aGlzIHBhdGNoPwo+Cj4gVGhhbmsgeW91Lgo+Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLUFsZXgKPgpNeSBhcG9sb2dpZXMsIEkgYW0gdGVycmli
bHkgc29ycnkgZm9yIHRoaXMgbWlzdGFrZS4gSSB3YXMgY29udmluY2VkIHRoYXQKdGhpcyB3YXMg
YSBsZWFrIGJ1dCB3YXMgbm90IHRob3JvdWdoIGVub3VnaCBpbiBjaGVja2luZyBpdC4KClRoYW5r
IHlvdSBmb3IgY2F0Y2hpbmcgdGhpcyBpc3N1ZSBpbiB0aW1lLiBJIHdpbGwgbWFrZSBzdXJlIHRv
IGJlIG1vcmUKY2FyZWZ1bCBpbiB0aGUgZnV0dXJlLiBTb3JyeSBmb3IgeW91ciB0cm91YmxlcyBv
biB0aGlzLgoKS2luZCByZWdhcmRzLApIZW5kcmlrCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
