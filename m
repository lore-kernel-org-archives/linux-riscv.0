Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089D8C27C7A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9FIzLCusw8TDU0Z0LpWkdIiKOVG7n7RyS24bu0zEa+A=; b=viZ6WywufVtdxK
	xvq2/S0cn6SczGdRFhHyuZMh9rks8ZT2mjc2SCcK0RUmgR1KhvOK21SX+OHd/xI8/71MA0VrVwWRm
	Saog8NKc4kVb+5jVn3GEDN1Mczug+X7m//Olzb1GCejkcHU7RbP3qQZSblUbetxk8o+UGcBsSqorY
	w/k0erEWHeOhpFxQuGFQ922Xop0dMFjeAr/SjG0InyArdcKuAArzasJ87M6yG9IWzQpx1SDN3qczQ
	NXZGWpaAhLVEUuklBJpsJsIQ+8AB+z6U/KHvYpG+ezsGRIE4z+QnJ2zo35bDzA5wFJ8ZNDeWwLURa
	6xan6k/kyYNpPRPkle5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWcly-006Qww-0D;
	Thu, 17 Aug 2023 13:10:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWclu-006Qv0-1y
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 13:10:44 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317798b359aso6630763f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692277841; x=1692882641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzN7VvOx2pOtfSykr4IQN9EePpmfh/Zdn2JH7WehQ2o=;
        b=IHSO36skH/bMYgiJDH9KcoL19NQpaagMOUWh4c0+dhcp2tFiXiMCCz1gkDv2Iw16OW
         jCE0LqO6DuEScgqeLbF6VMmtPt7MLFUyVcjvpupP/8IPUBB1bTW08SrdPV6gvPKGyDHJ
         z22zUT3HeapF3yjCfiw2drxclyCQFexMi7XbW6Zwog43Xd8881pEwhyRWWLaC9G03Lr6
         l7dz8zHDhGaAHdoL/Q/u0GvGpkxNMEvD0hDZ1bId3LjddXUjGybzaY/HsyOAZzEYK+Vb
         /woi6gVqNQlqPLmDNXedmJfDvMfO56cY4pjZ1bDslEx783lOa3pmexadyJJQfa0E5lRM
         xJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692277841; x=1692882641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzN7VvOx2pOtfSykr4IQN9EePpmfh/Zdn2JH7WehQ2o=;
        b=QN7pe5KrpeXMwmw/xqZKyuJiAsQzohGbdpkTD1lARrbZW7gX1l+T5R34HJAapZbB6x
         f94dXPmzwQA0U0wwpyNINMEe741hUKRGGFY6ytaTb/Gdvg/2D6EdfrGzTgs4U35Op2y0
         edB+aO58l3RoJak04VSKKwdTY2OOjfjPgd+uLdBsj/CAe3A+fP5iUDQSXX5zF1JjZTBo
         O4xp260wiS7hmSMV0bTTI6pdQbgpoSJDjskilLhrgSTBnAZC367MGPhdUBg/lOj6S0Ad
         WGM6uq5vpKB3XzyQr55RWgou2iAylTMZl/4mn4J4FV5j6HPaBlunMGduoyNmtZBUv9Fl
         VhNg==
X-Gm-Message-State: AOJu0YzjzhNQZEbgCfSELjOA5IwVgzfV54HtjqUH2fLwm1HCZTWTtI5e
	lzWiCbLHFaRceZv1JsB588f4osY7f4VBFjYZ+8Kejw==
X-Google-Smtp-Source: AGHT+IFhv2YZNQHMkPrHfKZ67eNLYD+0DLYyhEUdRhXGXP9pubmPKzBPoU6KC9pirkR92BjYQ/tVTC2Oxal1J/cCNhc=
X-Received: by 2002:adf:e78d:0:b0:317:e68f:e1b2 with SMTP id
 n13-20020adfe78d000000b00317e68fe1b2mr3559836wrm.28.1692277840899; Thu, 17
 Aug 2023 06:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230722123850.634544-1-alexghiti@rivosinc.com> <C172F31D25F5ED6E+034cc389-f02c-b681-a989-8592c5dac35e@tinylab.org>
In-Reply-To: <C172F31D25F5ED6E+034cc389-f02c-b681-a989-8592c5dac35e@tinylab.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 17 Aug 2023 15:10:30 +0200
Message-ID: <CAHVXubhD2r2OYQKRcBUfA+3h4SdejkUhVDD2Gx6WJ6pqBzSKpw@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] riscv: Introduce KASLR
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	zong.li@sifive.com, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_061042_647780_F14B3904 
X-CRM114-Status: GOOD (  32.63  )
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

SGkgU29uZywKCk9uIFR1ZSwgQXVnIDE1LCAyMDIzIGF0IDE6MjTigK9QTSBTb25nIFNodWFpIDxz
b25nc2h1YWlzaHVhaUB0aW55bGFiLm9yZz4gd3JvdGU6Cj4KPgo+IEhpLCBBbGV4Ogo+Cj4g5Zyo
IDIwMjMvNy8yMiAyMDozOCwgQWxleGFuZHJlIEdoaXRpIOWGmemBkzoKPiA+IFRoZSBmb2xsb3dp
bmcgS0FTTFIgaW1wbGVtZW50YXRpb24gYWxsb3dzIHRvIHJhbmRvbWl6ZSB0aGUga2VybmVsIG1h
cHBpbmc6Cj4gPgo+ID4gLSB2aXJ0dWFsbHk6IHdlIGV4cGVjdCB0aGUgYm9vdGxvYWRlciB0byBw
cm92aWRlIGEgc2VlZCBpbiB0aGUgZGV2aWNlLXRyZWUKPiA+IC0gcGh5c2ljYWxseTogb25seSBp
bXBsZW1lbnRlZCBpbiB0aGUgRUZJIHN0dWIsIGl0IHJlbGllcyBvbiB0aGUgZmlybXdhcmUgdG8K
PiA+ICAgIHByb3ZpZGUgYSBzZWVkIHVzaW5nIEVGSV9STkdfUFJPVE9DT0wuIGFybTY0IGhhcyBh
IHNpbWlsYXIgaW1wbGVtZW50YXRpb24KPiA+ICAgIGhlbmNlIHRoZSBwYXRjaCAzIGZhY3Rvcml6
ZXMgS0FTTFIgcmVsYXRlZCBmdW5jdGlvbnMgZm9yIHJpc2N2IHRvIHRha2UKPiA+ICAgIGFkdmFu
dGFnZS4KPiA+Cj4gPiBUaGUgbmV3IHZpcnR1YWwga2VybmVsIGxvY2F0aW9uIGlzIGxpbWl0ZWQg
YnkgdGhlIGVhcmx5IHBhZ2UgdGFibGUgdGhhdCBvbmx5Cj4gPiBoYXMgb25lIFBVRCBhbmQgd2l0
aCB0aGUgUE1EIGFsaWdubWVudCBjb25zdHJhaW50LCB0aGUga2VybmVsIGNhbiBvbmx5IHRha2UK
PiA+IDwgNTEyIHBvc2l0aW9ucy4KPiA+Cj4KPiBJIGhhdmUgZ29uZSB0aHJvdWdoIHRoZSBjb2Rl
IGFuZCB0ZXN0ZWQgdGhpcyBzZXJpZXMgd2l0aCBSaXNjVlZpcnQgZWRrMi4KPiBBbGwgc2VlbXMg
Z29vZCB0byBtZSwgeW91IGNhbiBhZGQgOgo+Cj4gVGVzdGVkLWJ5OiBTb25nIFNodWFpIDxzb25n
c2h1YWlzaHVhaUB0aW55bGFiLm9yZz4KPgo+IEFuZCBhIGZldyBxdWVzdGlvbnMgYWJvdXQgcGF0
Y2ggMiAoInJpc2N2OiBEdW1wIG91dCBrZXJuZWwgb2Zmc2V0Cj4gaW5mb3JtYXRpb24gb24gcGFu
aWMiKToKPgo+IDEuIFRoZSBkdW1wX2tlcm5lbF9vZmZzZXQoKSBmdW5jdGlvbiB3b3VsZCBvdXRw
dXQgIktlcm5lbCBPZmZzZXQ6IDB4MAo+IGZyb20gMHhmZmZmZmZmZjgwMDAwMDAwIiB3aGVuIGJv
b3Rpbmcgd2l0aCAibm9rYXNsciIgb3B0aW9uLgo+Cj4gSG93IGFib3V0IGRpc2FibGluZyB0aGUg
cmVnaXN0cmF0aW9uIG9mICJrZXJuZWxfb2Zmc2V0X25vdGlmaWVyIiB3aXRoCj4gIm5va2FzbHIi
IG9wdGlvbj8KCkknZCByYXRoZXIga2VlcCBpdCBhcyBpdCBzaG93cyB0aGUgIm5va2FzbHIiIGZs
YWcgd2FzIHRha2VuIGludG8gYWNjb3VudC4KCj4KPiAyLiBJbnNwaXJlZCBieSBwYXRjaCAyLCBJ
IGFkZGVkIHRoZSBDcmFzaCBLQVNMUiBzdXBwb3J0IGJhc2VkIG9uIHRoaXMKPiBzZXJpZXMgWzFd
Lgo+IFNvIGlzIGl0IG5lY2Vzc2FyeSB0byBrZWVwIHRoaXMgcGF0Y2ggaWYgd2UgaGF2ZSBDcmFz
aCBLQVNMUiBzdXBwb3J0PwoKSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIgcXVlc3Rpb24gaGVyZQoK
Pgo+Cj4gWzFdOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwODE1
MTA0ODAwLjcwNTc1My0xLXNvbmdzaHVhaXNodWFpQHRpbnlsYWIub3JnL1QvI3UKPgo+ID4gYmFz
ZS1jb21taXQtdGFnOiB2Ni41LXJjMQo+ID4KPiA+IENoYW5nZXMgaW4gdjY6Cj4gPiAgICAqIEZp
eCByZWludHJvZHVjZWQgYnVpbGQgZmFpbHVyZXMgYnkgY29tcGlsaW5nIGthc2xyLmMgb25seSBm
b3IgYXJtNjQKPiA+ICAgICAgYW5kIHJpc2N2LCBhcyBzdWdnZXN0ZWQgYnkgQXJkCj4gPgo+ID4g
Q2hhbmdlcyBpbiB2NToKPiA+ICAgICogUmVuYW1lZCBlZmktc3R1Yi1rYXNsci5jIGludG8ga2Fz
bHIuYyBhbmQgZml4IGNvbW1pdCBsb2cgb2YgcGF0Y2ggMywKPiA+ICAgICAgYXMgc3VnZ2VzdGVk
IGJ5IEFyZAo+ID4gICAgKiBSZW1vdmVkIHN0dWJzIHNpbmNlIHRoZSBrYXNsciBmdW5jdGlvbnMg
d2VyZSBtb3ZlZCB0byB0aGVpciBvd24gZmlsZQo+ID4gICAgICAoYW5kIHRoZW4gZG9lcyBub3Qg
dHJpZ2dlciBhbnkgYnVpbGQgZmFpbHVyZSBmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGRvCj4gPiAg
ICAgIG5vdCBjYWxsIHRob3NlIGZ1bmN0aW9ucyBzaW5jZSB0aGV5IGFyZSBpbiB0aGVpciBvd24g
Y29tcGlsYXRpb24gdW5pdCkKPiA+Cj4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gICAgKiBGaXggZWZp
X2dldF9raW1nIG1hY3JvIHRoYXQgcmV0dXJuZWQgbm90aGluZwo+ID4gICAgKiBNb3ZlZCBuZXcg
a2FzbHIgZnVuY3Rpb25zIGludG8gdGhlaXIgb3duIGZpbGVzIHRvIGF2b2lkIHpib290IGxpbmsK
PiA+ICAgICAgZmFpbHVyZXMsIGFzIHN1Z2dlc3RlZCBieSBBcmQKPiA+Cj4gPiBDaGFuZ2VzIGlu
IHYzOgo+ID4gICAgKiBSZWJhc2Ugb24gdG9wIG9mIDYuNC1yYzIKPiA+ICAgICogTWFrZSBSQU5E
T01JWkVfQkFTRSBkZXBlbmQgb24gNjRiaXQKPiA+ICAgICogRml4IGVmaV9pY2FjaGVfc3luYyBh
bmQgZWZpX2dldF9raW1nX21pbl9hbGlnbiB3aGljaCB3ZXJlIHVuZGVmaW5lZAo+ID4gICAgICBp
biB4ODYgKGFuZCBjZXJ0YWlubHkgb3RoZXIgYXJjaHMpCj4gPiAgICAqIEFkZCBwYXRjaCA0IHRv
IGZpeCB3YXJuaW5nIG9uIHJ2MzIKPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICAgKiBSZWJh
c2Ugb24gdG9wIG9mIDYuMy1yYzEKPiA+ICAgICogQWRkIGEgcmlzY3YgY2FjaGUgc3luYyBhZnRl
ciBtZW1jcHlpbmcgdGhlIGtlcm5lbAo+ID4gICAgKiBBZGQga2FzbHJfb2Zmc2V0IGltcGxlbWVu
dGF0aW9uIGZvciBLQ09WCj4gPiAgICAqIEFkZCBmb3J3YXJkIGRlY2xhcmF0aW9uIHRvIHF1aWV0
IExMVk0KPiA+Cj4gPiBBbGV4YW5kcmUgR2hpdGkgKDUpOgo+ID4gICAgcmlzY3Y6IEludHJvZHVj
ZSB2aXJ0dWFsIGtlcm5lbCBtYXBwaW5nIEtBU0xSCj4gPiAgICByaXNjdjogRHVtcCBvdXQga2Vy
bmVsIG9mZnNldCBpbmZvcm1hdGlvbiBvbiBwYW5pYwo+ID4gICAgYXJtNjQ6IGxpYnN0dWI6IE1v
dmUgS0FTTFIgaGFuZGxpbmcgZnVuY3Rpb25zIHRvIGthc2xyLmMKPiA+ICAgIGxpYnN0dWI6IEZp
eCBjb21waWxhdGlvbiB3YXJuaW5nIGZvciBydjMyCj4gPiAgICByaXNjdjogbGlic3R1YjogSW1w
bGVtZW50IEtBU0xSIGJ5IHVzaW5nIGdlbmVyaWMgZnVuY3Rpb25zCj4gPgo+ID4gICBhcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL2VmaS5oICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgIGFyY2gvcmlz
Y3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE5ICsrKwo+ID4gICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2VmaS5oICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGFnZS5oICAgICAgICAgICAgIHwgICAzICsKPiA+ICAgYXJjaC9yaXNj
di9rZXJuZWwvaW1hZ2UtdmFycy5oICAgICAgICAgICAgfCAgIDEgKwo+ID4gICBhcmNoL3Jpc2N2
L2tlcm5lbC9waS9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMiArLQo+ID4gICBhcmNoL3Jpc2N2
L2tlcm5lbC9waS9jbWRsaW5lX2Vhcmx5LmMgICAgICB8ICAxMyArKwo+ID4gICBhcmNoL3Jpc2N2
L2tlcm5lbC9waS9mZHRfZWFybHkuYyAgICAgICAgICB8ICAzMCArKysrCj4gPiAgIGFyY2gvcmlz
Y3Yva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICAgIHwgIDI1ICsrKysKPiA+ICAgYXJjaC9y
aXNjdi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgfCAgMzYgKysrKy0KPiA+ICAgZHJp
dmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9NYWtlZmlsZSAgICAgfCAgIDQgKy0KPiA+ICAgZHJp
dmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9hcm02NC1zdHViLmMgfCAxMTcgKystLS0tLS0tLS0t
LS0tLQo+ID4gICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2VmaXN0dWIuaCAgICB8ICAg
OCArKwo+ID4gICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2thc2xyLmMgICAgICB8IDE1
OSArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIGRyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0
dWIvcmlzY3Ytc3R1Yi5jIHwgIDMzICsrLS0tCj4gPiAgIDE1IGZpbGVzIGNoYW5nZWQsIDMyOCBp
bnNlcnRpb25zKCspLCAxMjYgZGVsZXRpb25zKC0pCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2tlcm5lbC9waS9mZHRfZWFybHkuYwo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9rYXNsci5jCj4gPgo+Cj4gLS0KPiBUaGFua3MK
PiBTb25nIFNodWFpCgpUaGFua3MgZm9yIHRlc3RpbmcgdGhpcyBhbmQgeW91ciBzdWdnZXN0aW9u
cyEKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
