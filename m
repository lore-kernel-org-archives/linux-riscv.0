Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BB0C87FCA
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 12:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3+FO9juRksSBOfsEW2ACdlUiJT6dMnHMlw8Ix/RSn4=; b=EFIq1agpIVNhjd
	Hy4wYZHVmvP3o4+rhQYTVIty5RgaiHN36VMffRMQQieVRWrzjUmvS6ftK+cddIs/4h59NXzgrF0yt
	MZiL7eoMKzEGZduUc7evHiM98sq2d9iyIJnrXYoEv5wCE69gF0DIs8uouwb0hwSjBv2Ew1VgQocGo
	tq1NcAOBqSK/mAep30IU7gSeJ52Cn865ikl211i1OLvSAD3rrm0aoiVztxpnJ6B7fY+oRKkNiWPOS
	t+oFo0/19GhCPxnuAow5z+O7oXbfhC9zlpBzHaiVNgFgznMouIyNXc5+DtLDO4d819HBTd2eInTcq
	i+f1KUySUkqS4ym4NJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufeUM-0000000BT0x-0k2E;
	Sat, 26 Jul 2025 12:58:58 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufeTL-0000000BSwk-20pG
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 12:57:58 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so31109656d6.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 05:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1753534672; x=1754139472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33vHvGUYy2jUaJ1MFRxvGoPpdjPDXIobpjBWzBoYSe0=;
        b=LzL8SmecXKdROoYWnhGIhP7B3vtE3TnB6kRjT6BH/T1mc6PJ4FPjVWo1L4D6gx+iRT
         nA5S4oNU6cHKS8PUVYC+74Ir364gdGtTzRMiqlwDSpf1rMBiNdfqQysGICALsgR/CZQ+
         67thb+N4NRrIzEgM1QbgegcYh1e3B8N3tD54Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753534672; x=1754139472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33vHvGUYy2jUaJ1MFRxvGoPpdjPDXIobpjBWzBoYSe0=;
        b=VfMD21P0+lVCXC0iPK9Ks+p+47l6Ej2J+LAhBhTE6MPYyFkwD+UBTlmOxyGz4yFmIx
         t7JB6vqcFtaR8Q0zRAGvaR+dUMbxhOXoIgqbKh+czou9OPrT8vTxI24fuT6Pn+692LyR
         COpwo2sT7If9jAAwM2twI+IJiHVdV92Sv+lC3ism3wiIUthHne7R6fx64AE3FtCJHfZ8
         JOx/RmfNhNb8UsEVDkcnZO44ypOp40kytEruzejfSgwR+r36dqhJi/C0i3AttX+FZm0h
         iLe7C6jEJyul+hmrD/5myROIbsQrCDjWgusv0kc870ClYaFAswZv0ANDKeBrEG7re7ke
         LIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqHFmpuIYGFYoTvP2KxrkudojSTe2+PZu64DkJvX23Fyv+bZmqos3endOIrzfjIZMwnYeMR1LztltlgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0xF8ZsEgudczCFd/iDe84nSkjzDQS1hiMJBRogENFaSlnVSZm
	a3nL0eSoRRDuWZjDF9iLu6wY+dxe0G6mmk2Kdff65XkAozyddqg1RCup4LWg1Lzn1Q==
X-Gm-Gg: ASbGncv+tJWkaGTZhfqkYM96qtvAzIjCnKcYKSIV+0yNt9I6+8N6cWL7RpASf7WDh9c
	6uM/knbfbEOrezk/ek2pFJccVWGyNGU+qAi1WA7RvgV9RfCRCN3b42Pk8RrQM7xgOlZvKSStEjw
	mkWDtQcZZBg5xiFIdsN4f2L9XCRJb7LDeBediwx95PNRTzROsWuTWc6uBYii46U3BPozsLf9G8T
	LX+eFeP5XiKB7rjGv55MaNhcVm/fvL5EJ4Ko3/KZ6laUN86aPAs4C5QUZX/nfz4NSiEK2WBR88/
	aSs9IHIYnIu9phZdF90KA7Gv4RUeurP6k2n7Wz6L3UZJvaT/y/PhCgl5iHGdLwxsXiTw0PC3mIG
	aqWXQaSNj7RGGP7bRQ9J0nOrKnKSYBonZJyWmXLaHapRh9tjMq3ZQ9AN3s85H6Rs+ng==
X-Google-Smtp-Source: AGHT+IGb5AjxoFosxgBP3Pc/RtOYVIrHr0x3CfJjhlmHSPGuq16MvnncfHDH4Nbi3Zz1t72hhHOhFA==
X-Received: by 2002:a05:6214:268a:b0:704:8db8:d3cd with SMTP id 6a1803df08f44-707204e8855mr68135236d6.8.1753534672381;
        Sat, 26 Jul 2025 05:57:52 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-70729ad99d0sm10716946d6.46.2025.07.26.05.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 05:57:51 -0700 (PDT)
Message-ID: <d968eb77-50f2-4d28-a57a-112c87dff8bf@ieee.org>
Date: Sat, 26 Jul 2025 07:57:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, sboyd@kernel.org,
 dlan@gentoo.org
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250723132504.66273-1-hendrik.hamerlinck@hammernet.be>
 <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ed5fcfec-6330-46e8-a302-5cf1d8b3a9ce@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_055756_357105_662092BC 
X-CRM114-Status: GOOD (  21.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yNi8yNSA0OjE2IEFNLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3JvdGU6Cj4gTGUgMjMvMDcv
MjAyNSDDoCAxNToyNSwgSGVuZHJpayBIYW1lcmxpbmNrIGEgw6ljcml0wqA6Cj4+IFRoZSBmdW5j
dGlvbiBzcGFjZW1pdF9jY3VfcmVzZXRfcmVnaXN0ZXIoKSBhbGxvY2F0ZXMgbWVtb3J5IGZvciBh
bgo+PiBhdXhpbGlhcnkgZGV2aWNlLiBJZiBhdXhpbGlhcnlfZGV2aWNlX2FkZCgpIGZhaWxzLCBp
dCBza2lwcyBjbGVhbnVwIG9mCj4+IHRoZXNlIHJlc291cmNlcywgcmVzdWx0aW5nIGluIGxlYWtz
Lgo+Pgo+PiBGaXggdGhpcyBieSB1c2luZyB0aGUgYXBwcm9wcmlhdGUgZXJyb3IgaGFuZGxpbmcg
cGF0aC4KPj4KPj4gRml4ZXM6IDk4ODU0MzUyMmViZCAoImNsazogc3BhY2VtaXQ6IHNldCB1cCBy
ZXNldCBhdXhpbGlhcnkgZGV2aWNlcyIpCj4+IFNpZ25lZC1vZmYtYnk6IEhlbmRyaWsgSGFtZXJs
aW5jayA8aGVuZHJpay5oYW1lcmxpbmNrQGhhbW1lcm5ldC5iZT4KPj4gUmV2aWV3ZWQtYnk6IFlp
eHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBQ
cm9wZXJseSBwbGFjZSB0aGUgRml4ZXMgdGlwLgo+PiAtLS0KPj4gwqAgZHJpdmVycy9jbGsvc3Bh
Y2VtaXQvY2N1LWsxLmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3BhY2VtaXQv
Y2N1LWsxLmMgYi9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtIAo+PiBrMS5jCj4+IGluZGV4IDY1
ZTZkZTAzMDcxNy4uNWJiODVlMzJjNmNmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9zcGFj
ZW1pdC9jY3UtazEuYwo+PiArKysgYi9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3UtazEuYwo+PiBA
QCAtMTA1OSw3ICsxMDU5LDcgQEAgc3RhdGljIGludCBzcGFjZW1pdF9jY3VfcmVzZXRfcmVnaXN0
ZXIoc3RydWN0IAo+PiBkZXZpY2UgKmRldiwKPj4gwqDCoMKgwqDCoCByZXQgPSBhdXhpbGlhcnlf
ZGV2aWNlX2FkZChhZGV2KTsKPj4gwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBhdXhpbGlhcnlfZGV2aWNlX3VuaW5pdChhZGV2KTsKPj4gLcKgwqDCoMKgwqDCoMKg
IHJldHVybiByZXQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9mcmVlX2F1eF9pZDsKPj4g
wqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIGRldm1fYWRkX2FjdGlvbl9vcl9yZXNl
dChkZXYsIHNwYWNlbWl0X2FkZXZfdW5yZWdpc3RlciwgCj4+IGFkZXYpOwo+IAo+IAo+IEhpLAo+
IAo+IEknbSBub3Qgc3VyZSB0aGlzIGlzIGNvcnJlY3QuCgpJJ20gc3VyZSB0aGlzIHBhdGNoIGlz
IGluY29ycmVjdCwgYW5kIHRoZSBvcmlnaW5hbCBjb2RlIGRpZApub3QgaGF2ZSB0aGUgc3RhdGVk
IHByb2JsZW0uICBUaGFuayB5b3UgZm9yIGNhbGxpbmcgYXR0ZW50aW9uCnRvIHRoaXMgQ2hyaXN0
b3BoZS4KClN0ZXBoZW4sIGNvdWxkIHlvdSBwbGVhc2UgcmV2ZXJ0IHlvdXIgY29tbWl0IG9mIHRo
aXMgcGF0Y2g/CgpUaGFuayB5b3UuCgoJCQkJCS1BbGV4Cgo+IGF1eGlsaWFyeV9kZXZpY2VfdW5p
bml0KCkgd2hpY2ggaXMgY2FsbGVkIGlmIGF1eGlsaWFyeV9kZXZpY2VfYWRkKCkgCj4gZmFpbHMg
c2hvdWxkIGFscmVhZHkgZG8gdGhlIGNsZWFuLXVwLgo+IAo+IFNvIEkgd291bGQgc2F5IHRoYXQg
dGhpcyBwYXRjaCBhZGRzIGEgZG91YmxlLWZyZWUgaXNzdWUgYW5kIHNob3VsZCBub3QgCj4gYmUg
YXBwbGllZC4KPiAKPiBJZiBJJ20gcmlnaHQsIG5vdGUgdGhhdCBTdGVwaGVuIGhhcyBhbHJlYWR5
IGFkZGVkIGEgIkFwcGxpZWQgdG8gY2xrLW5leHQiCj4gCj4gQ0oKPiAKPiAKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
