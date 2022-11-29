Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8139EC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 06:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlehLPngBVOr2vtq6rBKnB0n000xt605l5kyWL/CiKo=; b=PmdsVJJ+ptDGaw
	+iK7XVEogrBqpqmcnMY0EN02ssoad8wMBpD8RcKyJKLjX0hTbyixBlX+IUnzeFaBMxCRnUTd47vPG
	LMBwA2+61LJlxNBXwDXLi3S6vF3op8qUr6w16a1yOvbNRzeXAlGhi3JtYQGsbNmr5gf8FvpQjdjtQ
	Dfkxbq3cclKd8T/Ov114eJZAQVBPUL2/vjnGhVvJdzftI6A7llq/mNLqc9XSQfKHLUj9ORnG+b5zx
	UPFo9G+6orxho0v306QjF+KA+akStoF0oyG80MN1cs0Lncw3/wsFgOoOtTF37F5qx/ggSlBusrNMu
	QzTi7AeD7AFCM4zn0lGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuAE-006ehs-Q7; Tue, 29 Nov 2022 06:32:18 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuAC-006ehC-Fc
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 06:32:17 +0000
Received: by mail-wm1-f45.google.com with SMTP id h131-20020a1c2189000000b003d02dd48c45so7658865wmh.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 22:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGouC9aHtzSXLihgGalVY3YwbBFH6yJ0O83fDRF8rsU=;
        b=n7L554GxoXIUXgNqRGWdYH9UkxB6nMCVg7Zb1aE9VAQQZWIhs30a8+sFoEi3zRenV2
         Vt5ZwhXGtwXpEzLdWG+4yuJiYOhP3dpS5xHbFi4jYDY3CLStDZ1ZMqu15wOx5klhvsN2
         aoJGX4SL2oZC5gaxbMDA3OJO2snM/EwfRA3dcrXKiB9oXO8hIWi+n39AVD+hdDTpVD+v
         lMH+vFPZqaiPMW4irdyS5XkEzrbxTdS09xaWV3+Z24ZU6d+cBjHZn32q6g5elOdJFQnb
         xMX2bSGEaye7ty5M06gnQMbidcCLCBaOhsXoy3242TrC1SdQfy+yNwJW2UHoW49W8lUz
         1PLg==
X-Gm-Message-State: ANoB5plDY6wH6AoQUAkkBPyN8XETLsYlsrGCPzdCMYyliwATyLs0FQ34
	93ttpiDHQHHd4q05kxnX7z4=
X-Google-Smtp-Source: AA0mqf5cUNXgY52ua04z8ynuvEJc/3a/cDcljqCZ4LVhYaDNw5WQ9o4CB6eG3RGA4un7Bt6ynmedTQ==
X-Received: by 2002:a05:600c:5408:b0:3d0:1c3f:e3ae with SMTP id he8-20020a05600c540800b003d01c3fe3aemr31016843wmb.27.1669703533886;
        Mon, 28 Nov 2022 22:32:13 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm881201wmq.31.2022.11.28.22.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 22:32:13 -0800 (PST)
Message-ID: <2b020f4c-5c2b-f905-27e9-a3f603a2568a@kernel.org>
Date: Tue, 29 Nov 2022 07:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 2/9] serial: bflb_uart: add Bouffalolab UART Driver
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 linux-serial <linux-serial@vger.kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-3-jszhang@kernel.org>
 <c0406076-04e1-6b81-1bba-ac684516d898@kernel.org> <Y4TD48v84CJcMS+S@xhacker>
 <e1f689d2-d337-5a42-e4c9-91c1d338b42b@linux.intel.com>
 <Y4VCKeeTS2zV1xcZ@xhacker>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <Y4VCKeeTS2zV1xcZ@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_223216_541010_D25CF7FB 
X-CRM114-Status: GOOD (  13.70  )
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

T24gMjkuIDExLiAyMiwgMDoyMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBPbiBNb24sIE5vdiAy
OCwgMjAyMiBhdCAwNjowMToyOFBNICswMjAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToKPj4gT24g
TW9uLCAyOCBOb3YgMjAyMiwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPj4KPj4+IE9uIE1vbiwgTm92
IDI4LCAyMDIyIGF0IDA3OjEwOjQxQU0gKzAxMDAsIEppcmkgU2xhYnkgd3JvdGU6Cj4+Pj4gT24g
MjcuIDExLiAyMiwgMTQ6MjQsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+Pj4+ICtzdGF0aWMgdm9p
ZCBiZmxiX3VhcnRfdHhfY2hhcnMoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCkKPj4+Pgo+Pj4+IEFn
YWluOgo+Pj4+Cj4+Pj4gQXJlIHlvdSB1bmFibGUgdG8gdXNlIHRoZSBUWCBoZWxwZXI/IElmIHNv
Ogo+Pj4KPj4+IFlvdSBrbm93IHNlcmlhbCBzdWJzeXN0ZW0gYmV0dGVyIHRoYW4gbWUsIG1heSBJ
IGFzayBmb3IgbW9yZQo+Pj4gZGV0YWlscz8gRm9yIGV4YW1wbGUsCj4+PiBCZXNpZGVzIHVhcnRf
eG1pdF9hZHZhbmNlKCksIGRvIHlvdSBleHBlY3Qgb3RoZXIgVFggaGVscGVycz8gSWYgeWVzLAo+
Pj4gY2FuIHlvdSBwbGVhc2UgbGlzdCB0aGVtPwo+Pgo+PiBQbGVhc2UgdGFrZSBvbiBsb29rIG9u
IGNvbW1pdCA4Mjc1YjQ4YjI3ODA5NmVkYzFlM2VhNWFhOWNmOTQ2YTEwMDIyZjc5Lgo+PiBUaGUg
Y2hhbmdlcyBmb2xsb3dpbmcgdGhhdCBjb21taXQgY29udmVydCBzb21lIGRyaXZlcnMgdG8gdXNl
IHRoZSB0eAo+PiBoZWxwZXIgc28geW91IGNhbiBsb29rIGludG8gdGhlbSB0byBzZWUgZXhhbXBs
ZXMuCj4gCj4gVGhhbmtzIGEgbG90IGZvciB0aGUgaGludC4gV2lsbCB0aG9zZSB0eCBoZWxwZXJz
KHVhcnRfcG9ydF90eCwKPiB1YXJ0X3BvcnRfdHhfbGltaXRlZCBldGMuKSBiZSBpbiB2Ni4yLXJj
MT8gT3IgSSBuZWVkIHRvIHBhdGNoCj4gYmFzZWQgb24gSmlyaSdzIGRldmVsIGJyYW5jaD8KCkl0
J3MgaW4gdHR5LW5leHQgYW5kIHNvIGluIC1uZXh0LiBZb3Ugc2hvdWxkIGJhc2Ugb24gZWl0aGVy
IG9mIHRob3NlIAphbnl3YXkgOykuIEFuZCB5ZXMsIHRoZSBwbGFuIGlzIHRvIGhhdmUgdGhlbSBp
biB2Ni4yLXJjMS4KCnRoYW5rcywKLS0gCmpzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
