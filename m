Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E562BC5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2dWP23zIrMvk2jtoDUTzxJhzK3egKBB57Al7sb5AQI=; b=gXe7uxYWsExxK/
	TckM3DCNckJeTiIFydACrVt5l/Z4vh2bQAIFdJzCEdasOzHD5GWfVKIOO13+bRJyihd+9b809FNh9
	DZM+ZIc+ybcrtUVU32yPRYWpqHH+D1PIEhw+EA+jf3YCK2GbQvUma7yyEl+WjHXkggeM3rFjhdxvI
	pMaHggjQ2WxSNsGNAVZlQ2DIWpZo1x03koGV804t4DdyOGnMHfPsxSmokGRue8e0HzK0Nsr52+MGa
	LnsiSDnpFVs48PmWhku/HelFiMecn+ovzdWUZGBfszvMhjs5avSIVt2fu91nODRNHO0YGJCHh9Wql
	3zbr+65Wa8aGZzbHMOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrv3-000000040Nu-1Z0W;
	Tue, 12 Mar 2024 02:31:09 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjruz-000000040N5-33Dh
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 02:31:07 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-690c73735b5so20685326d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 19:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710210663; x=1710815463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5OTy+HMNxO2KNNfosD/+LOKbpZJTKz1P/Ivks1Gea8=;
        b=nEd9kRNKMVRLVdzxedZQRYSBbiip6P3gTP3lw5ARWm1NrXVDPU3O9kwxaT/i5SNSe5
         Wk0ShgXUGKQKuyzgTI1jmw/p54e87OMPJ5DcImtFZv6tzD3TflB6wkpzgag6UfhlTaTE
         NWiH4st7JOZBnGWFZxnS59ayavJGz2wI9ExO2kZeztAf9JT+NFwiTiTko3KuaomxjEOW
         P1Aiol9Cr/HYuLmOs1zyeFHqf7w0UC4Ub3Yrhkh4LDpwT+7ejWjqYn39DaQmhrNwPDIH
         /EJBT4ngvqns9MtUdrGa3Rt0PkznpZUtHohZwJeNF6y652POE5EESLVmJTJUwG7mp0WX
         ibPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710210663; x=1710815463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5OTy+HMNxO2KNNfosD/+LOKbpZJTKz1P/Ivks1Gea8=;
        b=FUsD/NGGvYRc428pm7thxMJZuNSUzdjHWq9+kGXjlDvHVAlxRh1Vsz4x9+c6SxFUqF
         Q2cijW+OgfribkeB4D8VHWptzFNPx/YDmGoQXIZOQZwRJOaY+n6Sx8Vcv3tVzW9itYip
         SDOckV3wxAvs/3ggs1wNn0lwc9f9snOQDHn5gV8T9zOfqaOVFqldTMreZ6iOtmNt1NVN
         T4+rbp2w0dBx3+IgSZicsJA5WHXcVKNTg5CSKX5ojka8gk8Nf/Rc6jGUQAUgK6DJIgBk
         dUKPZswHJItCIG1JzHsBljh7tVE1LPGOTfk1Z1kBuHjeioNWSX/FlsSKoCtwId9ssSl3
         Fqqw==
X-Gm-Message-State: AOJu0Yzg4CsyUMaQtPSAjCORAQ3yW1652EEj/9pP4BqpC3QqmqtDvbXJ
	TVEEipA0V2BkwEVJXMyhxwrr3FujFcP79mNGLhP0xvf5b7QCCgBpXmh5VuG57EE=
X-Google-Smtp-Source: AGHT+IE3jUExO30zal8fm27lYAMbEGlk4X8+tg7va5ZCzdoLMgtsJSDXPNSw5kv5bL+JTt8cVDV4YA==
X-Received: by 2002:ad4:40ca:0:b0:690:7928:87bf with SMTP id x10-20020ad440ca000000b00690792887bfmr8724160qvp.22.1710210663622;
        Mon, 11 Mar 2024 19:31:03 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.176])
        by smtp.gmail.com with ESMTPSA id qh6-20020a0562144c0600b0069049298fccsm3196085qvb.65.2024.03.11.19.31.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:31:03 -0700 (PDT)
Message-ID: <2d4eac35-26f8-484e-9994-2167f0bbec33@sifive.com>
Date: Mon, 11 Mar 2024 21:31:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/4] riscv: Use Kconfig to set unaligned access speed
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
References: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_193105_844412_B62CCABD 
X-CRM114-Status: GOOD (  19.59  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyNC0wMy0wOCAxMjoyNSBQTSwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+IElmIHRoZSBo
YXJkd2FyZSB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIGlzIGtub3duIGF0IGNvbXBpbGUgdGltZSwg
aXQgaXMKPiBwb3NzaWJsZSB0byBhdm9pZCBydW5uaW5nIHRoZSB1bmFsaWduZWQgYWNjZXNzIHNw
ZWVkIHByb2JlIHRvIHNwZWVkdXAKPiBib290LXRpbWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHY5
Ogo+IC0gQ2xhcmlmeSB3b3JkaW5nIGZvciBSSVNDVl9NSVNBTElHTkVEIEtjb25maWcgb3B0aW9u
Cj4gLSBMaW5rIHRvIHY4OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMzA3LWRpc2Fi
bGVfbWlzYWxpZ25lZF9wcm9iZV9jb25maWctdjgtMC01NWQ2OTZjYjM5OGJAcml2b3NpbmMuY29t
Cj4gCj4gQ2hhbmdlcyBpbiB2ODoKPiAtIE1pbm9yIGNvbW1pdCBtZXNzYWdlIGNoYW5nZXMgKENv
bm9yKQo+IC0gQ2xlYW4gdXAgaHdwcm9iZV9taXNhbGlnbmVkKCkgKENvbm9yKQo+IC0gTGluayB0
byB2NzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDMwNi1kaXNhYmxlX21pc2FsaWdu
ZWRfcHJvYmVfY29uZmlnLXY3LTAtNmM5MDQxOWU3YTk2QHJpdm9zaW5jLmNvbQo+IAo+IENoYW5n
ZXMgaW4gdjc6Cj4gLSBGaXggY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1
cyB0byByZXR1cm4gZmFsc2Ugd2hlbiBhbnkKPiAgIGNwdSBoYXMgZW11bGF0ZWQgYWNjZXNzZXMK
PiAtIEZpeCB3b3JkaW5nIGluIEtjb25maWcgKENvbm9yKQo+IC0gTGluayB0byB2NjogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDMwMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29u
ZmlnLXY2LTAtNjEyZWJkNjlmNDMwQHJpdm9zaW5jLmNvbQo+IAo+IENoYW5nZXMgaW4gdjY6Cj4g
LSBDb25zb2xpZGF0ZSBLY29uZmlnIGludG8gNCBvcHRpb25zIChwcm9iZSwgZW11bGF0ZWQsIHNs
b3csCj4gICBlZmZpY2llbnQpCj4gLSBDaGFuZ2UgdGhlIGJlaGF2aW9yIG9mICJlbXVsYXRlZCIg
dG8gYWxsb3cgaHdwcm9iZSB0byByZXR1cm4gInNsb3ciIGlmCj4gICB1bmFsaWduZWQgYWNjZXNz
ZXMgYXJlIG5vdCBlbXVsYXRlZCBieSB0aGUga2VybmVsCj4gLSBXaXRoIHRoaXMgY29uc29saWRh
dGlvbiwgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCBpcyBhYmxlIHRvIGJlCj4gICBt
b3ZlZCBiYWNrIGludG8gdGhlIG9yaWdpbmFsIGZpbGUgKHRyYXBzX21pc2FsaWduZWQuYykKPiAt
IExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAyMjctZGlzYWJsZV9t
aXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12NS0wLWI2ODUzODQ2ZTI3YUByaXZvc2luYy5jb20KPiAK
PiBDaGFuZ2VzIGluIHY1Ogo+IC0gQ2xhcmlmeSBLY29uZmlnIG9wdGlvbnMgZnJvbSBDb25vcidz
IGZlZWRiYWNrCj4gLSBVc2UgInVuYWxpZ25lZCIgaW5zdGVhZCBvZiAibWlzYWxpZ25lZCIgaW4g
aW50cm9kdWNlZCBmaWxlL2Z1bmN0aW9uLgo+ICAgVGhpcyBpcyBhIGJpdCBoYXJkIHRvIHN0YW5k
YXJkaXplIGJlY2F1c2UgdGhlIHJpc2N2IG1hbnVhbCBzYXlzCj4gICAibWlzYWxpZ25lZCIgYnV0
IHRoZSBleGlzdGluZyBMaW51eCBjb25maWdzIHNheSAidW5hbGlnbmVkIi4KPiAtIExpbmsgdG8g
djQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAyMTYtZGlzYWJsZV9taXNhbGlnbmVk
X3Byb2JlX2NvbmZpZy12NC0wLWRjMDFlNTgxYzBhY0ByaXZvc2luYy5jb20KPiAKPiBDaGFuZ2Vz
IGluIHY0Ogo+IC0gQWRkIGFkZGl0aW9uYWwgS2NvbmZpZyBvcHRpb25zIGZvciB0aGUgb3RoZXIg
dW5hbGlnbmVkIGFjY2VzcyBzcGVlZHMKPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNDAyMDItZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12My0wLWM0
NGY5MWYwM2JiNkByaXZvc2luYy5jb20KPiAKPiBDaGFuZ2VzIGluIHYzOgo+IC0gUmV2ZXJ0IGNo
YW5nZSB0byBjc3VtIChFcmljKQo+IC0gQ2hhbmdlIGlmbmRlZnMgZm9yIGlmZGVmcyAoRXJpYykK
PiAtIENoYW5nZSBjb25maWcgaW4gTWFrZWZpbGUgKEVsbGlvdC9FcmljKQo+IC0gTGluayB0byB2
MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDIwMS1kaXNhYmxlX21pc2FsaWduZWRf
cHJvYmVfY29uZmlnLXYyLTAtNzdjMzY4YmVkN2IyQHJpdm9zaW5jLmNvbQo+IAo+IENoYW5nZXMg
aW4gdjI6Cj4gLSBNb3ZlIGFyb3VuZCBkZWZpbml0aW9ucyB0byByZWR1Y2UgaWZkZWZzIChDbMOp
bWVudCkKPiAtIE1ha2UgUklTQ1ZfTUlTQUxJR05FRCBkZXBlbmQgb24gIUhBVkVfRUZGSUNJRU5U
X1VOQUxJR05FRF9BQ0NFU1MKPiAgIChDbMOpbWVudCkKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMzEtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZp
Zy12MS0wLTk4ZDE1NWU5Y2RhOEByaXZvc2luYy5jb20KPiAKPiAtLS0KPiBDaGFybGllIEplbmtp
bnMgKDQpOgo+ICAgICAgIHJpc2N2OiBsaWI6IEludHJvZHVjZSBoYXNfZmFzdF91bmFsaWduZWRf
YWNjZXNzKCkKPiAgICAgICByaXNjdjogT25seSBjaGVjayBvbmxpbmUgY3B1cyBmb3IgZW11bGF0
ZWQgYWNjZXNzZXMKPiAgICAgICByaXNjdjogRGVjb3VwbGUgZW11bGF0ZWQgdW5hbGlnbmVkIGFj
Y2Vzc2VzIGZyb20gYWNjZXNzIHNwZWVkCj4gICAgICAgcmlzY3Y6IFNldCB1bmFsaWduZWQgYWNj
ZXNzIHNwZWVkIGF0IGNvbXBpbGUgdGltZQo+IAo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNTggKysrKy0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3B1ZmVhdHVyZS5oICAgICAgICB8ICAzMSArKy0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2Vm
aWxlICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgICAgICAgICAgICAgfCAyNTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAgIHwgIDEzICsrCj4gIGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgICAgICB8ICAxNyArLQo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC91bmFsaWduZWRfYWNjZXNzX3NwZWVkLmMgfCAyODIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9saWIvY3N1bS5jICAgICAgICAgICAgICAgICAg
ICAgIHwgICA3ICstCj4gIDggZmlsZXMgY2hhbmdlZCwgMzc0IGluc2VydGlvbnMoKyksIDI5MyBk
ZWxldGlvbnMoLSkKCldpdGggdGhlIGZpeCBmcm9tIFsxXSBhcHBsaWVkOgoKVGVzdGVkLWJ5OiBT
YW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KCmluIGFsbCBmb3VyIGNv
bmZpZ3VyYXRpb25zLgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDI0MDMxMjAyMjAzMC4zMjA3ODktMS1zYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwoKPiAtLS0K
PiBiYXNlLWNvbW1pdDogNjYxMzQ3NmUyMjVlMDkwY2M5YWFkNDliZTdmYTUwNGUyOTBkZDMzZAo+
IGNoYW5nZS1pZDogMjAyNDAxMzEtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy0wNDNh
ZWEzNzVmOTMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
