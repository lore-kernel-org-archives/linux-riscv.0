Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B81C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Yk78yINQTQfZ0nOUY8H3yTpcprpTYF9PalIXF1I9TU=; b=bJjVep0I+r/aJ2
	W3HjnWpchr8SLZm93Rmmyv7lTrqf6m8zsJpu59J4y6ttBJTfEBgi3WqhrJhT5x9mQmibpDnzL1NFz
	HYKCYQMixE8U7Z64W7VVG7A4+N8wAwoVt0B/iyx961GeaCQtZ6KQvrFFB1GfFX6eoty8xc/zK8JIk
	LRT9S1yg2E/xv+vjXrXaImXppNtaN5nFdTuoHmpVkDQbe8wvHm+IKAoDUm+aX33S49vngs8qcEDei
	hiToPM1gtmagkTHZMtgBxqbhQ4Q7E/Oym75qTVSZSSru4intKNZhzy//zaAQb5xrkb7mHPFjqp1TY
	0K6CsRspmxxlC1TUCF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npa20-00HBvr-6f; Fri, 13 May 2022 18:28:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npa1x-00HBvV-37
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 18:28:50 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso11574746pjw.0
 for <linux-riscv@lists.infradead.org>; Fri, 13 May 2022 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=WGeEFtW+qWgYEib1uWcOLgCq1srN8mGZzrkA8bVtVI0=;
 b=euMyw1414NTr9pLTQrkN6Zjje/sgQu2q+FLX5y3yqSiJBSB8mqg09y8M/riUklzywO
 Tn3VPSCO75DJ1sioNxyr1or8x7VCj5nL+8OFV19Yk6QMcZts162WLujL9QPIP0KTexoh
 3Ld6d1fRiJ7vYY8kQwxkwRK87HhzLv84KbVJubni3UN/ZIBYFeohvEdGda1dTeuwr+Jl
 ynI4TOnNbnOimkqDVoA2Ikp+uxuxorFkDrknm62k36/0rF6FEGjGRXPXqFWJM5x1ZJC3
 4WaDP9F+iFCZNT5AoT9IMZ5kpItRV6+Dq1Xc9StWc0vB3xzpqpJwn2uvfqNhZTGyl01y
 DOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WGeEFtW+qWgYEib1uWcOLgCq1srN8mGZzrkA8bVtVI0=;
 b=NmFLJHwyfiQewBXx8AdOvtx6zuvh9vdxRpn87E9LIxplsqAveakh7pvv0Oy2iPJugZ
 qp1syhgcAi4N3ZGXNij7gMAmrt6jfJ/KBbqrXULYIG+fMjdHwlaVHZcLW+xJjJNGl8wr
 grELQbttozSG6vVFn+28bRALkMACAN8OS7eMkG9+FnyjsP3sydQI4tQ1L8j0GcbE7omg
 oyBJ3qnlGwtimxuKj9TRyHxiGorwH+dBSLuCPZrPcg7fF/+EfF8jfOStTPxZrGfDOrc7
 b+B5q1vEvv9qvMObrF+ZK7/u8zxfXKlO7H2zDogfAJjvpkm5vPboLpo556tVR0EmvA+a
 uKRA==
X-Gm-Message-State: AOAM533S7WibNixb5BYIubuBXRSZpIOON3k7XlmF86gSAuVkY5y8qaAq
 oMR8hJFO2kfg4NuP5Rmnciw8GMkYrGzlEg==
X-Google-Smtp-Source: ABdhPJy/G2FpW1sRNV1Sq94oQXe/w2hGlTDKasT3hfq8Vc4fKaqMyaLjil8Y765FzXGsOI/mV8+qoQ==
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9375 with SMTP id
 u10-20020a170903124a00b00154c7a49375mr6066093plh.0.1652466527058; 
 Fri, 13 May 2022 11:28:47 -0700 (PDT)
Received: from [0.0.0.0] ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id
 y124-20020a62ce82000000b0050dc76281f9sm2080709pfg.211.2022.05.13.11.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 11:28:46 -0700 (PDT)
Message-ID: <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com>
Date: Sat, 14 May 2022 02:28:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, nathan@kernel.org, llvm@lists.linux.dev,
 Fangrui Song <maskray@google.com>
References: <20220512205545.992288-1-twd2.me@gmail.com>
 <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
From: twd2 <twd2.me@gmail.com>
In-Reply-To: <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_112849_174831_D8660E5D 
X-CRM114-Status: GOOD (  27.05  )
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

5ZyoIDIwMjIvNS8xMyA1OjM0LCBOaWNrIERlc2F1bG5pZXJzIOWGmemBkzoKPiBPbiBUaHUsIE1h
eSAxMiwgMjAyMiBhdCAxOjU2IFBNIFdlbmRlIFRhbiA8dHdkMi5tZUBnbWFpbC5jb20+IHdyb3Rl
Ogo+PiBBbGxvdyBMVE8gdG8gYmUgc2VsZWN0ZWQgZm9yIFJJU0MtViwgb25seSB3aGVuIExMRCA+
PSAxNCwgc2luY2UgdGhlcmUgaXMgYW4KPj4gaXNzdWUgWzFdIGluIHByaW9yIExMRCB2ZXJzaW9u
cyB0aGF0IHByZXZlbnRzIExMRCB0byBnZW5lcmF0ZSBwcm9wZXIKPj4gbWFjaGluZSBjb2RlIGZv
ciBSSVNDLVYgd2hlbiB3cml0aW5nIGBub3Bgcy4KPj4KPj4gSSBoYXZlIHRlc3RlZCBlbmFibGlu
ZyBMVE8gZm9yIGBkZWZjb25maWdgLiBUaGUgTExEIHRvb2sgfjJtMjFzIGFuZCB+M0dpQgo+PiBv
biBvdXIgSW50ZWwgWGVvbiBHb2xkIDYxNDAgc2VydmVyIGFuZCBwcm9kdWNlZCBhbiAxOE1pQiBJ
bWFnZS4gVGhlIGltYWdlCj4+IGNhbiBib290IHRvIHNoZWxsIHVzaW5nIGFuIGFyY2hyaXNjdiBy
b290ZnMgb24gUUVNVS4KPj4KPj4gSSBoYXZlIGFsc28gdGVzdGVkIGl0IGZvciBgYWxseWVzY29u
ZmlnYCB3aXRob3V0IENPTVBJTEVfVEVTVCwgRlRSQUNFLAo+PiBLQVNBTiwgYW5kIEdDT1YuIFRo
ZSBMTEQgdG9vayB+N2gwM20gYW5kIH4zMzVHaUIgb24gdGhlIHNlcnZlciwKPiBIYWhhISBUaGF0
J3Mgb2ssIGFsbHllc2NvbmZpZyBpcyBub3QgZXhwZWN0ZWQgdG8gYm9vdCBmb3IgYW55Cj4gYXJj
aGl0ZWN0dXJlcyBBRkFJSy4gRm9yIENJLCB3ZSBzaW1wbHkgdmVyaWZ5IHdlIGNhbiBidWlsZCB0
aGVtOyB3ZQo+IGJvb3QgdGVzdCBldmVyeXRoaW5nIGJ1dCBhbGx5ZXNjb25maWcgYW5kIGFsbG1v
ZGNvbmZpZyAoYW5kCj4gYXJjaGl0ZWN0dXJlcyB3aGljaCBkb24ndCB5ZXQgaGF2ZSBxZW11IHBv
cnRzKS4gIEl0IGhlbHBzIGRldGVjdCB3aGVuCj4gYXNzZW1ibGVyIHNvdXJjZXMgZG9uJ3QgdXNl
IGVub3VnaCBlbmNvZGluZyBzcGFjZSB3aGVuIHJlZmVyZW5jZWQKPiBleHRlcm5hbCBzeW1ib2xz
IGFyZSB0b28gZmFyIGF3YXkgZm9yIGxhcmdlciBpbWFnZXMsIElNRS4KPgo+IFRoYXQncyBhIGxv
bmcgdGltZTsgZmlyc3QgdGltZSBJJ3ZlIHNlZW4gYSBudW1iZXIgZnJvbSBzb21lb25lIHRyeWlu
Zwo+IHRvIExUTyBhbGx5ZXNjb25maWchCj4KPj4gc3VjY2Vzc2Z1bGx5IHByb2R1Y2luZyBhIDEu
N0dpQiBJbWFnZS4gVW5mb3J0dW5hdGVseSwgd2UgY2Fubm90IGJvb3QgdGhpcwo+PiBpbWFnZSBi
ZWNhdXNlIHRoZSBgY3JlYXRlX2tlcm5lbF9wYWdlX3RhYmxlKClgIC0+IGBhbGxvY19wbWRfZWFy
bHkoKWAgLT4KPj4gYEJVR19PTigpYCBsb2dpYyBsaW1pdHMgdGhlIGltYWdlIHRvIGJlIDwgMUdp
Qi4gTWF5YmUgd2UgY2FuIGZpeCBpdCBpbiBhCj4+IHNlcGFyYXRlIHBhdGNoIGZ1cnRoZXIuCj4+
Cj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzUwNTA1
LCByZXNvbHZlZCBieSBMTFZNCj4+ICAgICBjb21taXQgZTYzNDU1ZDVlMGU1ICgiW01DXSBVc2Ug
bG9jYWwgTUNTdWJ0YXJnZXRJbmZvIGluIHdyaXRlTm9wcyIpCj4gU28gbG9va2luZyBhdCB0aGF0
IGNoYW5nZSwgaXQgZG9lc24ndCBsb29rIGxpa2UgaXQgdG91Y2hlcyBMTEQgYXQgYWxsLgo+IFRv
IG1lIGl0IHRvdWNoZXMgYm90aCB0aGUgYXNzZW1ibGVyIGFuZCB0aGUgb2JqZWN0IHN0cmVhbWVy
LCB3aGljaCBpcwo+IHVzZWQgYnkgdGhlIGNvbXBpbGVyIChhbmQgYXNzZW1ibGVyKSB0byBzdHJl
YW0gaW5zdHJ1Y3Rpb25zIGRpcmVjdGx5Cj4gaW50byBhbiBvYmplY3QgZmlsZSAod2l0aG91dCB0
aGUgbmVlZCBmb3IgYW4gZXh0ZXJuYWwgYXNzZW1ibGVyKS4KPgo+IFRoYXQgbWFrZXMgbWUgdGhp
bmsgdGhhdAo+IENMQU5HX1ZFUlNJT04gPj0gMTQwMDAwCj4gd291bGQgYmUgbW9yZSBhcHByb3By
aWF0ZSB0aGFuCj4gTExEX1ZFUlNJT04gPj0gMTQwMDAwCj4KPiBXRFlUPwoKCkl0IHNlZW1zIHRo
YXQgd2hlbiBMVE8gaXMgZW5hYmxlZCwgdGhlIGNvbXBpbGVyIChjbGFuZykgb25seSBnZW5lcmF0
ZXMgYml0Y29kZSwgYW5kIExMRCBjb2xsZWN0cyBhbGwgdGhlIGJpdGNvZGUsIGRvZXMgTFRPLCBh
bmQgZ2VuZXJhdGVzIG1hY2hpbmUgY29kZSAoYXNzZW1ibHkpIGFuZCBFTEYgb2JqZWN0IGZpbGVz
PyBBY3R1YWxseSwgdGhlIGVycm9yIG1lc3NhZ2UgaW4gIzUwNTA1IHdhcyBvcmlnaW5hbGx5IHJl
cG9ydGVkIGJ5IExMRC4gU28gSSdkIGxpa2UgdG8gY2hlY2sgTExEX1ZFUlNJT04gaGVyZS4KCgo+
Cj4gQWxzbywgSSdtIGN1cmlvdXMgaWYgdGhlIExMVk0gcGF0Y2ggeW91IGhhZCBtZSBjb21taXQg
Zm9yIHlvdSByZWNlbnRseQo+IGlzIGF0IGFsbCByZWxhdGVkIG9yIG5lY2Vzc2FyeSBmb3IgdGhp
cz8gSWYgc28sIHRoZW4gdGhlIHZlcnNpb24gY2hlY2sKPiBzaG91bGQgcHJvYmFibHkgYmUgYWdh
aW5zdCBjbGFuZy0xNSwgbm90IGNsYW5nLTE0Lgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xs
dm0tcHJvamVjdC9jb21taXQvNmJhYWFkNzQwYTVhYmI0YmZjZmYwMjJhODExNGFiYjRlZWE2NmEy
ZAoKCkFoYSwgdGhhdCBwYXRjaCBpcyBmb3IgZW5hYmxpbmcgTFRPIGZvciBhbGx5ZXNjb25maWcg
KGVzcGVjaWFsbHksIHdpdGggeGZzIGFuZCBvdmVybGF5ZnMpLiBJIHRoaW5rIHRoYXQgcGF0Y2gg
aXMgbm90IG1hbmRhdG9yeSBmb3IgZW5hYmxpbmcgTFRPIGZvciBSSVNDLVYuCgoKPiBBbnl3YXlz
LCBJIGp1c3QgZGlkIGEgYnVpbGQrYm9vdCAoaW4gcWVtdSkgdGVzdCBvZiBkZWZjb25maWcrdGhp
bmx0bwo+IGFuZCBkZWZjb25maWcrbHRvLiBMR1RNCj4KPiBUZXN0ZWQtYnk6IE5pY2sgRGVzYXVs
bmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPgoKClRoYW5rcywKV2VuZGUKCgo+PiBUZXN0
ZWQtYnk6IFdlbmRlIFRhbiA8dHdkMi5tZUBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFdl
bmRlIFRhbiA8dHdkMi5tZUBnbWFpbC5jb20+Cj4+IC0tLQo+PiB2MjoKPj4gLSBTb21lIHRleHR1
YWwgY2hhbmdlcyBzdWdnZXN0ZWQgYnkgTmljay4KPj4gLSBEcm9wIHRoZSBjaGFuZ2VzIHRvIGBh
cmNoL3Jpc2N2L01ha2VmaWxlYCwgc2luY2UgdGhlIExMVk0gaXNzdWUgaXMgZmlsZWQKPj4gICBh
bmQgcmVzb2x2ZWQuCj4+IC0gRHJvcCB0aGUgdW5uZWNlc3NhcnkgY2hhbmdlcyB0byBgYXJjaC9y
aXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZWAuCj4+Cj4+IHYxOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDIxMDcxOTIwNTIwOC4xMDIzMjIxLTEtdHdkMi5tZUBnbWFpbC5j
b20vCj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgNCArKysrCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25m
aWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggMDBmZDljNTQ4ZjI2Li5jNTVmNmI5NWU1
YWYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2
L0tjb25maWcKPj4gQEAgLTM4LDYgKzM4LDEwIEBAIGNvbmZpZyBSSVNDVgo+PiAgICAgICAgIHNl
bGVjdCBBUkNIX1NVUFBPUlRTX0FUT01JQ19STVcKPj4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQ
T1JUU19ERUJVR19QQUdFQUxMT0MgaWYgTU1VCj4+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9S
VFNfSFVHRVRMQkZTIGlmIE1NVQo+PiArICAgICAgICMgTExEID49IDE0Ogo+PiArICAgICAgICMg
LSBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzUwNTA1Cj4+ICsg
ICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HIGlmIExMRF9WRVJTSU9OID49IDE0
MDAwMAo+PiArICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0xUT19DTEFOR19USElOIGlmIExM
RF9WRVJTSU9OID49IDE0MDAwMAo+PiAgICAgICAgIHNlbGVjdCBBUkNIX1VTRV9NRU1URVNUCj4+
ICAgICAgICAgc2VsZWN0IEFSQ0hfV0FOVF9ERUZBVUxUX1RPUERPV05fTU1BUF9MQVlPVVQgaWYg
TU1VCj4+ICAgICAgICAgc2VsZWN0IEFSQ0hfV0FOVF9GUkFNRV9QT0lOVEVSUwo+PiAtLQo+PiAy
LjI1LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
