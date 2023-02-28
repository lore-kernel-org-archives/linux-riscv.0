Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDE3C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 21:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCPQCCRAhcHn56/QA0fiIQb0bc9WxOoLw+lFXGMq6Pc=; b=hYENdlC0/Xexck
	yegYm/MyHOk/1FA8APefOYQ8OUlXIUZi2sk9T7BxnYJYI5EO6Lbi4jRsvriYVn2TQBG5zpQiIFpor
	rGKq2yUr0ZL+YF+efgqFWvQ94sg78zvvLyKkhgfI6i4XfURqdO9TnHgJnOpphihfAgsYuTfB64UwU
	uVI0CxcJ9hCmai0CE7ngPpNQ5kykG7hbWu7neNnnlvMzzhz2fsW97w2Qr405BcHkdTPusRe1hkahF
	XCns5lH7o07DRt+PTQ/j/12DOeITu6kkGU1KkFkvWtPrz1LY3Atk+g3jU6Ge28AitV9fiZ9/h2yLv
	C0iIgcg/VLiUTyp6LF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7Mb-00EK0F-6C; Tue, 28 Feb 2023 21:18:21 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7MX-00EJzQ-Mf
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 21:18:18 +0000
Received: by mail-io1-xd34.google.com with SMTP id e17so4609094iot.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 13:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677619096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x1vMB7yuhGQSQ+SsgqXy3yOLSbd0QsV4ntLv3i1EUGM=;
        b=TVdgxJZ6Xy/pwKMpYAIwZwQoH316e2Ekn3P5//4uD9Q7legts5NY3IfxvF2BjfsS1a
         gWpxyG8tDsc8taB4jJpNRtKyoiU5FsK7Fuy8gYWqpJO8oL+pmJoKWp3680AXIouDE2x1
         XZ5p+H3tJHDzbiW+sp/16wl1Z52IaV6+jP6A3L1hSrRXgEA80Zzy6lqXUUjiM7VPWbWA
         1rIYelerzWCsDXQyWrGZ0qev6/ieTFKkh24NDKjWcPDcVuJY6n6s4rZXM9jKIDIylm2x
         dt0ZgM/mVP2HmG7heHaj21jtkEpkEOooMCwtUuShDdtaeBlkZMJzqmOpWBAK0tUEP7cr
         G3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677619096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1vMB7yuhGQSQ+SsgqXy3yOLSbd0QsV4ntLv3i1EUGM=;
        b=5C10CQHCALsL5QPFDiRlbxFFtLmDGdjaQZIALeKqsmBNIuntcpQDo65iTIQnIAgWhc
         2yt8stqgnYqzjnruYTrGhwIZzoIxxl1mW7WMAFHb+AFg7P4t4Ru72nAUJYG4phVGFEiL
         o4VCR91mJjABet17EBgUH0vsEsfg772O8FNe1i6DCjyxypm9pttEox8/kkM7D04ZbFrH
         +g0oghKn6YZeCLrCy9Q0QaId7vRDNGVPWWRZ/A5Pl7ImR8zSCQ+/AJ7DXFoskWH4ha9M
         oZEu4Z8DIBVamOgQofgy+nHRPDIHzNuOijdBjX4B5QX53gA2QhHaKqyRBoRghKghkUhn
         ONbQ==
X-Gm-Message-State: AO0yUKWYxfaYfXoXrmkpEBpOIr48FOkNEbM8RdOjS4MP2bYGgOP0fy+u
	A8RulfVn53SuGPvoQkhqjvg=
X-Google-Smtp-Source: AK7set8Z8L4+xpkMIuRHWdDXBQkknltJ5BHmOcXtQWGZXL0SUcrBU0mjR/MF+JaEIteIln3xrxtfzQ==
X-Received: by 2002:a05:6602:22c5:b0:74c:8b1c:239c with SMTP id e5-20020a05660222c500b0074c8b1c239cmr2590186ioe.10.1677619095827;
        Tue, 28 Feb 2023 13:18:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l5-20020a6b7b05000000b0073f8a470bacsm3403917iop.16.2023.02.28.13.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 13:18:15 -0800 (PST)
Message-ID: <010e1a24-83dc-8ef7-5c6e-6ab06d669f8a@roeck-us.net>
Date: Tue, 28 Feb 2023 13:18:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] riscv, lib: Fix Zbb strncmp
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230228184211.1585641-1-bjorn@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230228184211.1585641-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_131817_757607_7BCC7A11 
X-CRM114-Status: GOOD (  18.18  )
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

T24gMi8yOC8yMyAxMDo0MiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gVGhlIFpiYiBvcHRpbWl6ZWQgc3RybmNtcCBo
YXMgdHdvIHBhcnRzOyBhIGZhc3QgcGF0aCB0aGF0IGRvZXMgWExFTi84Qgo+IHBlciBpdGVyYXRp
b24sIGFuZCBhIHNsb3cgdGhhdCBkb2VzIG9uZSBieXRlIHBlciBpdGVyYXRpb24uCj4gCj4gVGhl
IGlkZWEgaXMgdG8gY29tcGFyZSBhbGlnbmVkIFhMRU4gY2h1bmtzIGZvciBtb3N0IG9mIHN0cmlu
Z3MsIGFuZCBkbwo+IHRoZSByZW1haW5kZXIgdGFpbCBpbiB0aGUgc2xvdyBwYXRoLgo+IAo+IFRo
ZSBaYmIgc3RybmNtcCBoYXMgdHdvIGlzc3VlcyBpbiB0aGUgZmFzdCBwYXRoOgo+IAo+IEluY29y
cmVjdCByZW1haW5kZXIgaGFuZGxpbmcgKHdyb25nIGNvbXBhcmUpOiBBc3N1bWUgdGhhdCB0aGUg
c3RyaW5nCj4gbGVuZ3RoIGlzIDkuIE9uIDY0YiBzeXN0ZW1zLCB0aGUgZmFzdCBwYXRoIHNob3Vs
ZCBkbyBvbmUgaXRlcmF0aW9uLAo+IGFuZCBvbmUgaXRlcmF0aW9uIGluIHRoZSBzbG93IHBhdGgu
IEluc3RlYWQsIGJvdGggd2VyZSBkb25lIGluIHRoZQo+IGZhc3QgcGF0aCwgd2hpY2ggbGVhZCB0
byBpbmNvcnJlY3QgcmVzdWx0cy4gQW4gZXhhbXBsZToKPiAKPiAgICBzdHJuY21wKCIvZGV2L3Zk
YSIsICIvZGV2LyIsIDUpOwo+IAo+IENvcnJlY3QgYnkgY2hhbmdpbmcgImJndCIgdG8gImJnZSIu
Cj4gCj4gTWlzc2luZyBOVUxMIGNoZWNrcyBpbiB0aGUgc2Vjb25kIHN0cmluZzogVGhpcyBjb3Vs
ZCBsZWFkIHRvIGluY29ycmVjdAo+IHJlc3VsdHMgZm9yOgo+IAo+ICAgIHN0cm5jbXAoIi9kZXYv
dmRhIiwgIi9kZXYvdmRhXDAiLCA4KTsKPiAKPiBDb3JyZWN0IGJ5IGFkZGluZyBhbiBhZGRpdGlv
bmFsIGNoZWNrLgo+IAo+IEZpeGVzOiBiNmZjZGIxOTFlMzYgKCJSSVNDLVY6IGFkZCB6YmIgc3Vw
cG9ydCB0byBzdHJpbmcgZnVuY3Rpb25zIikKPiBTdWdnZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVy
IDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4KPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+CgpUZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4KCj4gLS0tCj4gICBhcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMgfCA0ICsrKy0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvc3RybmNtcC5TIGIvYXJjaC9yaXNjdi9saWIvc3Ry
bmNtcC5TCj4gaW5kZXggZWU0OTU5NTA3NWJlLi5lZmQzZjMxNTBhNTQgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9saWIvc3RybmNtcC5TCj4gKysrIGIvYXJjaC9yaXNjdi9saWIvc3RybmNtcC5T
Cj4gQEAgLTc4LDExICs3OCwxMyBAQCBzdHJuY21wX3piYjoKPiAgIAkvKiBNYWluIGxvb3AgZm9y
IGFsaWduZWQgc3RyaW5nLiAgKi8KPiAgIAkucDJhbGlnbiAzCj4gICAxOgo+IC0JYmd0CWEwLCB0
NiwgM2YKPiArCWJnZQlhMCwgdDYsIDNmCj4gICAJUkVHX0wJdDAsIDAoYTApCj4gICAJUkVHX0wJ
dDEsIDAoYTEpCj4gICAJb3JjLmIJdDMsIHQwCj4gICAJYm5lCXQzLCB0NSwgMmYKPiArCW9yYy5i
CXQzLCB0MQo+ICsJYm5lCXQzLCB0NSwgMmYKPiAgIAlhZGRpCWEwLCBhMCwgU1pSRUcKPiAgIAlh
ZGRpCWExLCBhMSwgU1pSRUcKPiAgIAliZXEJdDAsIHQxLCAxYgo+IAo+IGJhc2UtY29tbWl0OiBl
YjliZTgzMTBjNThjMTY2ZjlmYWUzYjcxYzBhZDlkNjc0MWI0ODk3CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
