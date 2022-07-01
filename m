Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A479C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 04:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtGlfkMbqgl/L3/1cxea1yMO3uIgEvLRExleFiXW+Kw=; b=v4ujt+3QPb9DR8
	r2nQDSDBpEiDc44LRblJQf1b1OinJs1I3bBuza/u/RcWL+4+P9Txw9E20az9p9PVaDmOHKLkjmTlt
	jv6ci0Iwz4hbJVdS7rWFSvOetZmtTTYiXA80TDjvkhBHIo60kxW1Dx99V3fG9lloY3D15yR9vCGcr
	hRhna7W+qwOxIHZDtXKmr2NIp07df3/P/RbkIEiqSEb1VIsC9h6y61fiaWi094uyOQoxunrU8k/OC
	T6IwwEFqbTSoCNzarNRMiWesPUl3WU9FoOSbUvAgrmSRUGWPpp4qgbLiGea2JwKTiPFVojusI6fbJ
	1YriwAmEXswuVNlafHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o78UW-002s5c-UH; Fri, 01 Jul 2022 04:42:52 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o78UU-002s2f-Ju
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 04:42:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 68so1333134pgb.10
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 21:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=msPYOhdZk/dTzF+121o/hCul9kH1y8Q/KJ2JfWUsMoQ=;
        b=H4cFUUvuKp70J+2j3dwqFw2Zr+SRi1eXI3M5JZQUixFvIFWeg4sE7PZ7Adsx+ahZqf
         rD+tzBZaU20KlAaR0+v4T+bppvcz/197swomxyCeOz5uLQxXVM6Aooiae7mJGRKBW+jh
         7wlvkooy8Wn8YmCT0gBVogPUN0ZZAZuK8LWBxaZQumE9AQdm+08mJqq0THSIcxgLUZRf
         pyX2O9SvoZJX67BKFRnOe3NpQAOyFT/wX7fHSBB8dq89bzGs1HOt9faOKp+YRajH0gBC
         ojGAgBYSuN699Ewe7uHnulwQTsG61nFWn57ycaZBXnBSD/eiPPtGZBfuijm5SorD1urW
         xuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=msPYOhdZk/dTzF+121o/hCul9kH1y8Q/KJ2JfWUsMoQ=;
        b=frujYl/hpksCrfBiflgHEoitSGJHSn2b7CnCbZcLZi6Vyak0txuuShrri7TPprLMRm
         9Ndn7mW4rNpYQmWwErmCW2lLP0FAoj/xUffdH+30p2if1i7pnwcJszUv+PdmiT06yjQX
         nRTok5FPxJwtu6UVDieuZadW+A3+X+fftu1tH1vYtfCic4bbdqoSAV5WCTSKVnIuOiJe
         zlIdzvqfD/LGQmgLEyX/NTLWYT4XiumQP6Ny0h7zfXz7mpyetQmFeGazAYO9fZ8D/V2Q
         RB2+nO0c8GQ0JZVx2G0s2l8MZeVvc1hEccu1Fa2nG/KXVoFcOdPCJrIL0Hv8BH0n1+j4
         eFbg==
X-Gm-Message-State: AJIora8bX7MQ3/7Z28415RjGqrSAJCaEBlqA44beBn6D1HXJJ3/rxA/a
	y0k8ah3kzJ6hE+TP12dSviM=
X-Google-Smtp-Source: AGRyM1sxM8hl7EVM47OJpTc4SHAcFzfUmT1sBwRvGQ8XkOrtkdS0PL+wwJv/UMqFPgUfchZaEWCn+A==
X-Received: by 2002:a62:542:0:b0:525:a313:fe28 with SMTP id 63-20020a620542000000b00525a313fe28mr19431059pff.73.1656650567140;
        Thu, 30 Jun 2022 21:42:47 -0700 (PDT)
Received: from [0.0.0.0] (jp.bgp.twd2.net. [2a0c:b641:571::1])
        by smtp.gmail.com with ESMTPSA id v187-20020a6261c4000000b005255f5d8f9fsm14583099pfb.112.2022.06.30.21.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 21:42:46 -0700 (PDT)
Message-ID: <f8f35abc-1482-c62c-18be-368252c9ec39@gmail.com>
Date: Fri, 1 Jul 2022 12:42:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, nathan@kernel.org, llvm@lists.linux.dev,
 =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20220512205545.992288-1-twd2.me@gmail.com>
 <CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com>
 <30f9c99e-9bc4-9369-a533-7b454a213403@gmail.com>
 <CAKwvOdnSRA_1wO8bb3tuGCunPjx_pQDi2_0O9yQLbk-TRR3dyA@mail.gmail.com>
 <CAFP8O3J2s1RoUu7JG5AT6kWuvZ6EmEsbtQ7Z5rOFwBQmoJoA3w@mail.gmail.com>
From: twd2 <twd2.me@gmail.com>
In-Reply-To: <CAFP8O3J2s1RoUu7JG5AT6kWuvZ6EmEsbtQ7Z5rOFwBQmoJoA3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_214250_720190_17EA25A8 
X-CRM114-Status: GOOD (  18.98  )
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

SGkgUGFsbWVyLAoKcGluZz8KClRoYW5rcwpXZW5kZQoK5ZyoIDIwMjIvNS8xNCAzOjMxLCBGxIFu
Zy1ydcOsIFPDsm5nIOWGmemBkzoKPiBPbiBGcmksIE1heSAxMywgMjAyMiBhdCAxMjozMCBQTSBO
aWNrIERlc2F1bG5pZXJzCj4gPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPiB3cm90ZToKPj4gT24g
RnJpLCBNYXkgMTMsIDIwMjIgYXQgMTE6MjggQU0gdHdkMiA8dHdkMi5tZUBnbWFpbC5jb20+IHdy
b3RlOgo+Pj4g5ZyoIDIwMjIvNS8xMyA1OjM0LCBOaWNrIERlc2F1bG5pZXJzIOWGmemBkzoKPj4+
PiBPbiBUaHUsIE1heSAxMiwgMjAyMiBhdCAxOjU2IFBNIFdlbmRlIFRhbiA8dHdkMi5tZUBnbWFp
bC5jb20+IHdyb3RlOgo+Pj4+PiBBbGxvdyBMVE8gdG8gYmUgc2VsZWN0ZWQgZm9yIFJJU0MtViwg
b25seSB3aGVuIExMRCA+PSAxNCwgc2luY2UgdGhlcmUgaXMgYW4KPj4+Pj4gaXNzdWUgWzFdIGlu
IHByaW9yIExMRCB2ZXJzaW9ucyB0aGF0IHByZXZlbnRzIExMRCB0byBnZW5lcmF0ZSBwcm9wZXIK
Pj4+Pj4gbWFjaGluZSBjb2RlIGZvciBSSVNDLVYgd2hlbiB3cml0aW5nIGBub3Bgcy4KPj4+Pj4K
Pj4+Pj4gSSBoYXZlIHRlc3RlZCBlbmFibGluZyBMVE8gZm9yIGBkZWZjb25maWdgLiBUaGUgTExE
IHRvb2sgfjJtMjFzIGFuZCB+M0dpQgo+Pj4+PiBvbiBvdXIgSW50ZWwgWGVvbiBHb2xkIDYxNDAg
c2VydmVyIGFuZCBwcm9kdWNlZCBhbiAxOE1pQiBJbWFnZS4gVGhlIGltYWdlCj4+Pj4+IGNhbiBi
b290IHRvIHNoZWxsIHVzaW5nIGFuIGFyY2hyaXNjdiByb290ZnMgb24gUUVNVS4KPj4+Pj4KPj4+
Pj4gSSBoYXZlIGFsc28gdGVzdGVkIGl0IGZvciBgYWxseWVzY29uZmlnYCB3aXRob3V0IENPTVBJ
TEVfVEVTVCwgRlRSQUNFLAo+Pj4+PiBLQVNBTiwgYW5kIEdDT1YuIFRoZSBMTEQgdG9vayB+N2gw
M20gYW5kIH4zMzVHaUIgb24gdGhlIHNlcnZlciwKPj4+PiBIYWhhISBUaGF0J3Mgb2ssIGFsbHll
c2NvbmZpZyBpcyBub3QgZXhwZWN0ZWQgdG8gYm9vdCBmb3IgYW55Cj4+Pj4gYXJjaGl0ZWN0dXJl
cyBBRkFJSy4gRm9yIENJLCB3ZSBzaW1wbHkgdmVyaWZ5IHdlIGNhbiBidWlsZCB0aGVtOyB3ZQo+
Pj4+IGJvb3QgdGVzdCBldmVyeXRoaW5nIGJ1dCBhbGx5ZXNjb25maWcgYW5kIGFsbG1vZGNvbmZp
ZyAoYW5kCj4+Pj4gYXJjaGl0ZWN0dXJlcyB3aGljaCBkb24ndCB5ZXQgaGF2ZSBxZW11IHBvcnRz
KS4gIEl0IGhlbHBzIGRldGVjdCB3aGVuCj4+Pj4gYXNzZW1ibGVyIHNvdXJjZXMgZG9uJ3QgdXNl
IGVub3VnaCBlbmNvZGluZyBzcGFjZSB3aGVuIHJlZmVyZW5jZWQKPj4+PiBleHRlcm5hbCBzeW1i
b2xzIGFyZSB0b28gZmFyIGF3YXkgZm9yIGxhcmdlciBpbWFnZXMsIElNRS4KPj4+Pgo+Pj4+IFRo
YXQncyBhIGxvbmcgdGltZTsgZmlyc3QgdGltZSBJJ3ZlIHNlZW4gYSBudW1iZXIgZnJvbSBzb21l
b25lIHRyeWluZwo+Pj4+IHRvIExUTyBhbGx5ZXNjb25maWchCj4+Pj4KPj4+Pj4gc3VjY2Vzc2Z1
bGx5IHByb2R1Y2luZyBhIDEuN0dpQiBJbWFnZS4gVW5mb3J0dW5hdGVseSwgd2UgY2Fubm90IGJv
b3QgdGhpcwo+Pj4+PiBpbWFnZSBiZWNhdXNlIHRoZSBgY3JlYXRlX2tlcm5lbF9wYWdlX3RhYmxl
KClgIC0+IGBhbGxvY19wbWRfZWFybHkoKWAgLT4KPj4+Pj4gYEJVR19PTigpYCBsb2dpYyBsaW1p
dHMgdGhlIGltYWdlIHRvIGJlIDwgMUdpQi4gTWF5YmUgd2UgY2FuIGZpeCBpdCBpbiBhCj4+Pj4+
IHNlcGFyYXRlIHBhdGNoIGZ1cnRoZXIuCj4+Pj4+Cj4+Pj4+IFsxXSBodHRwczovL2dpdGh1Yi5j
b20vbGx2bS9sbHZtLXByb2plY3QvaXNzdWVzLzUwNTA1LCByZXNvbHZlZCBieSBMTFZNCj4+Pj4+
ICAgICBjb21taXQgZTYzNDU1ZDVlMGU1ICgiW01DXSBVc2UgbG9jYWwgTUNTdWJ0YXJnZXRJbmZv
IGluIHdyaXRlTm9wcyIpCj4+Pj4gU28gbG9va2luZyBhdCB0aGF0IGNoYW5nZSwgaXQgZG9lc24n
dCBsb29rIGxpa2UgaXQgdG91Y2hlcyBMTEQgYXQgYWxsLgo+Pj4+IFRvIG1lIGl0IHRvdWNoZXMg
Ym90aCB0aGUgYXNzZW1ibGVyIGFuZCB0aGUgb2JqZWN0IHN0cmVhbWVyLCB3aGljaCBpcwo+Pj4+
IHVzZWQgYnkgdGhlIGNvbXBpbGVyIChhbmQgYXNzZW1ibGVyKSB0byBzdHJlYW0gaW5zdHJ1Y3Rp
b25zIGRpcmVjdGx5Cj4+Pj4gaW50byBhbiBvYmplY3QgZmlsZSAod2l0aG91dCB0aGUgbmVlZCBm
b3IgYW4gZXh0ZXJuYWwgYXNzZW1ibGVyKS4KPj4+Pgo+Pj4+IFRoYXQgbWFrZXMgbWUgdGhpbmsg
dGhhdAo+Pj4+IENMQU5HX1ZFUlNJT04gPj0gMTQwMDAwCj4+Pj4gd291bGQgYmUgbW9yZSBhcHBy
b3ByaWF0ZSB0aGFuCj4+Pj4gTExEX1ZFUlNJT04gPj0gMTQwMDAwCj4+Pj4KPj4+PiBXRFlUPwo+
Pj4KPj4+IEl0IHNlZW1zIHRoYXQgd2hlbiBMVE8gaXMgZW5hYmxlZCwgdGhlIGNvbXBpbGVyIChj
bGFuZykgb25seSBnZW5lcmF0ZXMgYml0Y29kZSwgYW5kIExMRCBjb2xsZWN0cyBhbGwgdGhlIGJp
dGNvZGUsIGRvZXMgTFRPLCBhbmQgZ2VuZXJhdGVzIG1hY2hpbmUgY29kZSAoYXNzZW1ibHkpIGFu
ZCBFTEYgb2JqZWN0IGZpbGVzPyBBY3R1YWxseSwgdGhlIGVycm9yIG1lc3NhZ2UgaW4gIzUwNTA1
IHdhcyBvcmlnaW5hbGx5IHJlcG9ydGVkIGJ5IExMRC4gU28gSSdkIGxpa2UgdG8gY2hlY2sgTExE
X1ZFUlNJT04gaGVyZS4KPj4gQWgsIHRoYXQncyByaWdodC4gT2ssIExHVE0uCj4+Cj4+IFJldmll
d2VkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4KPiBSZXZp
ZXdlZC1ieTogRmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+Cj4KPj4+Cj4+Pj4gQWxz
bywgSSdtIGN1cmlvdXMgaWYgdGhlIExMVk0gcGF0Y2ggeW91IGhhZCBtZSBjb21taXQgZm9yIHlv
dSByZWNlbnRseQo+Pj4+IGlzIGF0IGFsbCByZWxhdGVkIG9yIG5lY2Vzc2FyeSBmb3IgdGhpcz8g
SWYgc28sIHRoZW4gdGhlIHZlcnNpb24gY2hlY2sKPj4+PiBzaG91bGQgcHJvYmFibHkgYmUgYWdh
aW5zdCBjbGFuZy0xNSwgbm90IGNsYW5nLTE0Lgo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9sbHZt
L2xsdm0tcHJvamVjdC9jb21taXQvNmJhYWFkNzQwYTVhYmI0YmZjZmYwMjJhODExNGFiYjRlZWE2
NmEyZAo+Pj4KPj4+IEFoYSwgdGhhdCBwYXRjaCBpcyBmb3IgZW5hYmxpbmcgTFRPIGZvciBhbGx5
ZXNjb25maWcgKGVzcGVjaWFsbHksIHdpdGggeGZzIGFuZCBvdmVybGF5ZnMpLiBJIHRoaW5rIHRo
YXQgcGF0Y2ggaXMgbm90IG1hbmRhdG9yeSBmb3IgZW5hYmxpbmcgTFRPIGZvciBSSVNDLVYuCj4+
Pgo+Pj4KPj4+PiBBbnl3YXlzLCBJIGp1c3QgZGlkIGEgYnVpbGQrYm9vdCAoaW4gcWVtdSkgdGVz
dCBvZiBkZWZjb25maWcrdGhpbmx0bwo+Pj4+IGFuZCBkZWZjb25maWcrbHRvLiBMR1RNCj4+Pj4K
Pj4+PiBUZXN0ZWQtYnk6IE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29t
Pgo+Pj4KPj4+IFRoYW5rcywKPj4+IFdlbmRlCj4+Pgo+Pj4KPj4+Pj4gVGVzdGVkLWJ5OiBXZW5k
ZSBUYW4gPHR3ZDIubWVAZ21haWwuY29tPgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZW5kZSBUYW4g
PHR3ZDIubWVAZ21haWwuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gdjI6Cj4+Pj4+IC0gU29tZSB0ZXh0
dWFsIGNoYW5nZXMgc3VnZ2VzdGVkIGJ5IE5pY2suCj4+Pj4+IC0gRHJvcCB0aGUgY2hhbmdlcyB0
byBgYXJjaC9yaXNjdi9NYWtlZmlsZWAsIHNpbmNlIHRoZSBMTFZNIGlzc3VlIGlzIGZpbGVkCj4+
Pj4+ICAgYW5kIHJlc29sdmVkLgo+Pj4+PiAtIERyb3AgdGhlIHVubmVjZXNzYXJ5IGNoYW5nZXMg
dG8gYGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGVgLgo+Pj4+Pgo+Pj4+PiB2MTogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMTA3MTkyMDUyMDguMTAyMzIyMS0x
LXR3ZDIubWVAZ21haWwuY29tLwo+Pj4+PiAtLS0KPj4+Pj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8
IDQgKysrKwo+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+
Pj4+IGluZGV4IDAwZmQ5YzU0OGYyNi4uYzU1ZjZiOTVlNWFmIDEwMDY0NAo+Pj4+PiAtLS0gYS9h
cmNoL3Jpc2N2L0tjb25maWcKPj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+Pj4+IEBA
IC0zOCw2ICszOCwxMCBAQCBjb25maWcgUklTQ1YKPj4+Pj4gICAgICAgICBzZWxlY3QgQVJDSF9T
VVBQT1JUU19BVE9NSUNfUk1XCj4+Pj4+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfREVC
VUdfUEFHRUFMTE9DIGlmIE1NVQo+Pj4+PiAgICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0hV
R0VUTEJGUyBpZiBNTVUKPj4+Pj4gKyAgICAgICAjIExMRCA+PSAxNDoKPj4+Pj4gKyAgICAgICAj
IC0gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L2lzc3Vlcy81MDUwNQo+Pj4+
PiArICAgICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0xUT19DTEFORyBpZiBMTERfVkVSU0lPTiA+
PSAxNDAwMDAKPj4+Pj4gKyAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19MVE9fQ0xBTkdfVEhJ
TiBpZiBMTERfVkVSU0lPTiA+PSAxNDAwMDAKPj4+Pj4gICAgICAgICBzZWxlY3QgQVJDSF9VU0Vf
TUVNVEVTVAo+Pj4+PiAgICAgICAgIHNlbGVjdCBBUkNIX1dBTlRfREVGQVVMVF9UT1BET1dOX01N
QVBfTEFZT1VUIGlmIE1NVQo+Pj4+PiAgICAgICAgIHNlbGVjdCBBUkNIX1dBTlRfRlJBTUVfUE9J
TlRFUlMKPj4+Pj4gLS0KPj4+Pj4gMi4yNS4xCj4+Pj4+Cj4+Cj4+Cj4+IC0tCj4+IFRoYW5rcywK
Pj4gfk5pY2sgRGVzYXVsbmllcnMKPgo+Ci0tIApCZXN0IHdpc2hlcyEKU2luY2VyZWx5LAp0d2Qy
Cmh0dHBzOi8vdHdkMi5tZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
