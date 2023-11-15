Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E1C47071
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 02:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqYFfUOfOznVGgnIuyv0HV7LgZTzZcSm1bC6vH4izuk=; b=mlO4bXpINERxAZ
	AQVYDxhnMHoqaXrjVaB/CplCoZRTJu7ndUitCVs2PIb5S7rIQ/3xbWps3wXJL/D8IC/lr2iqyuzy2
	5inW0HuTHhf8j+mvPHrOZ+h+ffZZnbEw1XmoKHrC7j7/C9aMVNk9gMlto8TrWQxtMY0fbWbNSvH8l
	jRpbYotL4Es4EpAo6ZBcNgUpXySUxV9azHpYfieJRoO0DpxT51b71s7Vo+ZgAYjcfAvef8L4UpjvD
	gVONju495VtVyogpdkriPrL28BMb8N8a44KtQZ3gGir96AkrixMLGSyqyEW5p/5tdB1tlQLkaGoJw
	E1irkPqos1VO4wUEqnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r35R7-00HEEt-22;
	Wed, 15 Nov 2023 02:15:25 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r35R4-00HEEQ-18
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 02:15:23 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-41b7fd8f458so38528581cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 18:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700014520; x=1700619320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1MSmTa/SaXp0ffMwVKsyznCoe5iJDVnuE9ssYFwaKy0=;
        b=cquezarQ3+WDWcRc+GM2XmDPRT+QpKH0NTz2VwA45seoRbwt0J6iC9Lkb56WD+C+JB
         ZAqFyMrCw6elKamXWInb12GGXH8ME75YITwe06GQ04a/4RLTfFxM9VzN3uclqRHk+awb
         ZXaSpizemjkeFiVdzZfEcIUi6HCRcjKbFf8VIgFBZ2HX5DVCA8TqRmO5rw0+n/F92/4q
         Mb2K8iFMRLUc11F2uIkelDEpG/hRn7uM2OVgALuoCYj3Y3tOuOoWQkxivhEat4KISW9L
         lGOa79NqVEgeHXP7U6zI0LsDDwBP31OIZt0m+crklkLTlZ5Kp98XBmrMsn/LjFmPHisC
         IBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700014520; x=1700619320;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1MSmTa/SaXp0ffMwVKsyznCoe5iJDVnuE9ssYFwaKy0=;
        b=OUh8yhi8Eh2BiD2wxLQSbi/+qdnFXcGCRJD39l3P1ZMJNud7QsdO47k84AqjEJTlXv
         CRLZFq+48bJ5qUzgEwBx7oO/1fhPfoUY/1jDrNVTy3hUfklF5dWJHqU8ki75nMtR2vUw
         rZXtlFo7ZetFNZ0uKi04uAKQskwInIHaCBp+/GE++TvlcFwUPRKKPXGDtZOkdd2UIH4k
         +8FroAIhl+jI+fvPo+It7ejK81WgkiTx7A2ZmJwMM14titPh3S8w1ns5IkDvUXKA7tbN
         wYqGEKLXxpKJcv92rKvKLWOgO0aXPT+cf8RenRywImqXKLig1VNGntsgnQ4WOYtD/oPb
         EO4Q==
X-Gm-Message-State: AOJu0Yz+T0mAYv55F3tMuBIp9ZZnG3gA4tX/4mPnEqd8EvdZGvSurket
	bY5HS/WVlP+uL3Nrpz+BNprGkg==
X-Google-Smtp-Source: AGHT+IEFSDLxFpKfNFc8ycvrsyoEzsbrXROUde3bhQvq7qYNrIR46TUGX+gKo8UDgoBxVdyI0rfrtA==
X-Received: by 2002:ad4:4689:0:b0:66f:b009:fc3b with SMTP id pl9-20020ad44689000000b0066fb009fc3bmr4296026qvb.5.1700014520268;
        Tue, 14 Nov 2023 18:15:20 -0800 (PST)
Received: from [192.168.142.156] ([50.235.11.61])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cf0cb000000b0065d1380dd17sm148577qvl.61.2023.11.14.18.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 18:15:19 -0800 (PST)
Message-ID: <68220eb6-8a20-42d4-83e5-d0d45b2f1404@sifive.com>
Date: Tue, 14 Nov 2023 21:15:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
Content-Language: en-US
To: Chen Wang <unicorn_wang@outlook.com>, Conor Dooley <conor@kernel.org>,
 Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>
 <20231114-grumble-capably-d8f7a8eb6a8d@squawk>
 <PN3P287MB032447BC501261D47E8E3124FEB1A@PN3P287MB0324.INDP287.PROD.OUTLOOK.COM>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <PN3P287MB032447BC501261D47E8E3124FEB1A@PN3P287MB0324.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_181522_424967_CB1EF2A8 
X-CRM114-Status: GOOD (  16.58  )
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

T24gMjAyMy0xMS0xNCA3OjM0IFBNLCBDaGVuIFdhbmcgd3JvdGU6Cj4gT24gMjAyMy8xMS8xNSAx
OjMxLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIE1vbiwgTm92IDEzLCAyMDIzIGF0IDA5OjIw
OjExUE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4+IEZyb206IENoZW4gV2FuZyA8dW5pY29y
bl93YW5nQG91dGxvb2suY29tPgo+Pj4KPj4+IEFkZCBjbG9jayBnZW5lcmF0b3Igbm9kZSB0byBk
ZXZpY2UgdHJlZSBmb3IgU0cyMDQyLCBhbmQgZW5hYmxlIGNsb2NrIGZvcgo+Pj4gdWFydDAuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+
Cj4+PiAtLS0KPj4+IMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jbG9jay5k
dHNpIHwgNzYgKysrKysrKysrKysrKysrKysrKysKPj4gVGhlcmUncyBubyBuZWVkIHRvIGNyZWF0
ZSBhbiBlbnRpcmVseSBuZXcgZmlsZSBmb3IgdGhpcy4KPiBBZ3JlZSwgSSB3aWxsIG1lcmdlIHRo
aXMgaW50byBzZzIwNDIuZHRzaSBpbiBuZXh0IHJldmlzaW9uLgo+Pgo+Pj4gwqAgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2nCoMKgwqDCoMKgwqAgfCAxMCArKysKPj4+IMKg
IDIgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jbG9jay5kdHNpCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jbG9jay5kdHNp
Cj4+PiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jbG9jay5kdHNpCj4+PiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi42NmQyNzIzZmFiMzUK
Pj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3Nn
MjA0Mi1jbG9jay5kdHNpCj4+PiBAQCAtMCwwICsxLDc2IEBACj4+PiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPj4+ICsvKgo+Pj4gKyAqIENvcHlyaWdodCAo
QykgMjAyMyBTb3BoZ28gVGVjaG5vbG9neSBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+PiAr
ICovCj4+PiArCj4+PiArLyB7Cj4+PiArwqDCoMKgIGNnaTogb3NjaWxsYXRvciB7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4+PiArwqDCoMKgwqDCoMKg
wqAgY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsKPj4+ICvCoMKgwqDCoMKgwqDCoCBjbG9j
ay1vdXRwdXQtbmFtZXMgPSAiY2dpIjsKPj4+ICvCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMg
PSA8MD47Cj4+PiArwqDCoMKgIH07Cj4+IFdoYXQgYWN0dWFsbHkgaXMgdGhpcyBvc2NpbGxhdG9y
Pwo+PiBJcyBpdCBwcm92aWRlZCBieSBhbm90aGVyIGNsb2NrIGNvbnRyb2xsZXIgb24gdGhlIFNv
Qywgb3IgaXMgaXQgcHJvdmlkZWQKPj4gYnkgYW4gb3NjaWxsYXRvciBvbiB0aGUgYm9hcmQ/Cj4g
Cj4gVGhpcyBvc2NpbGxhdG9yIGlzIGFuIGluZGl2aWR1YWwgaWMgY2hpcCBvdXRzaWRlIHRoZSBT
b0Mgb24gdGhlIGJvYXJkLCB0aGF0J3MKPiB3aHkgSSBsaXN0IGl0IG91dHNpZGUgc29jIG5vZGUu
Cj4gCj4gQWN0dWFsbHkgdGhlICJjZ2kiIGlzIGFiYnJldmF0aW9uIGZvciAiQ2xvY2sgR2VuZXJh
dGlvbiBJQyBjaGlwIi4KClNpbmNlIHRoZSBvc2NpbGxhdG9yIGlzIG91dHNpZGUgdGhlIFNvQywg
dGhpcyBub2RlIChvciBhdCBsZWFzdCBpdHMKY2xvY2stZnJlcXVlbmN5IHByb3BlcnR5KSBiZWxv
bmdzIGluIHRoZSBib2FyZCBkZXZpY2V0cmVlLCBub3QgdGhlIFNvQyAuZHRzaS4KU2VlIFsxXS4K
ClJlZ2FyZHMsClNhbXVlbAoKWzFdOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di9iNTQwMTA1Mi1lODAzLTk3ODgtNjRkNi04MmIyNzM3NTMzY2VAbGluYXJvLm9yZy8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
