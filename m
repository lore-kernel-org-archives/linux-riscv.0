Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E64DC05027
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hBQSTdmzbr4FKGc0XUSptBB19WWeuxZPDCtmKGIdFXE=; b=swWuXqDBST0P4ptMbsva+MXplg
	jo0dOC8nB2CWImeSsoVzQiqku8ep5gEJ6gxJ/UZzialfFo9RqfOIKxCA1ZtnSYbrJElZNHsvrpazA
	NJEbnuhVKNPaSW+xUITZApz2MEoz7zh6v8OPlfgVz8eY2cVkaxt2srLGO991u8DhMnAu7wfOzw0dG
	drUVwIwS7k7rf7DzrBDYDlzUGqxHvPBCh7WPCwMFn6wydxe1oadIoXrKSHsHQwTDJ+iM7MG3jZDHd
	9bEnlZe68ohZ8YYWpj/j9F3XmtpPb1l73yz0ZQmNfjnoZTqnQXbw7Ym5TiC/+OHDVqU82a71TqRX7
	FZ3nyBwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5cd-0043RM-Bv; Wed, 15 Feb 2023 00:26:07 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5cS-0043Nu-Tw
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 00:25:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 24so11399943pgt.7
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 16:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13xGsV2jjmQG8zQgYM+MlutjbCojfUR9ZAZxMQUAu6A=;
        b=VbDHSuKi2kZRWENSk2pFNf3FMtXUOOe3VDfIEKUiwUU2+nF2+OCaaPOuXdYtNyUpLQ
         9Xd6EO7n+xMbaBqmbVbZrsA/QZ0yVnFFzEFzoEbgloRQvcRU+Ki24BDOV+MfdQ2jBar5
         eiZqKerrZbTyGjo6xBnZQi2ut6PhyieHf/h2xGezwbRP9mthdu/8cMTCBWAzZXPR2gdR
         PiN1UI8bVN+UgiaeNJCUWgfamW6ad7EVUNUwK7ChPOaz9F0R9pHDUsTzhgm5s+peYflE
         7CBDOVmIbnPaWF8jdyyrURj3MGG7bRXnNdgk62B6mB12/0Wng4KDkH5wFr2fI4oR7OxN
         joRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13xGsV2jjmQG8zQgYM+MlutjbCojfUR9ZAZxMQUAu6A=;
        b=V7lau6DtBRrUWemb0u/dBxzpz6ZC5HPLjquYYnjz1572nMaLUEQ18lRQXF0ohIaKCA
         4w2vYe3Z9J1imsesuIVgMznzQxmBUX6vvIFBMV5VqCJQm86NhvZQizTZI0tWQmi9eh4j
         7f57yavQTwltIzfV+j5c3J2DiVd3YbrTD0IKJ1igI72oR06a3SGw8t0wLtL2VcTwAaxY
         j6nUVZO69agv6GXIyPh/26Fs+LD/Ek1OJKiXWVR7CjYhsGMDUZm03A1fapC7LvyLq16Y
         s0z+837HtUzTryeDHZj10R+0qHxaX+OXdxf1wG6AaCu3hgODlmqCAoapMqTM9XcdnHr6
         Ze5A==
X-Gm-Message-State: AO0yUKWiMvmqPG4/+1/Uk7uy0mJW0lExZEokQ5w202vXP50Fv5rn9EiN
	cAUXKorqelKngsMmzD3ENuaVeA==
X-Google-Smtp-Source: AK7set/RfDAmrDwKus+3EwyrpiXyachl6rM8SdJg8/oDC0GOfqqp5AasjoE8kO/Zq+15hhwXvqWA4Q==
X-Received: by 2002:aa7:9581:0:b0:5a8:65e4:aba9 with SMTP id z1-20020aa79581000000b005a865e4aba9mr55940pfj.18.1676420750261;
        Tue, 14 Feb 2023 16:25:50 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id i22-20020aa787d6000000b005998a75dbc5sm10351038pfo.2.2023.02.14.16.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 16:25:49 -0800 (PST)
Date: Tue, 14 Feb 2023 16:25:49 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 16:25:45 PST (-0800)
Subject: Re: [PATCH 4/4] riscv: dts: allwinner: d1: Add video engine node
In-Reply-To: <4767366.GXAFRqVoOG@jernej-laptop>
CC: paul.kocialkowski@bootlin.com, samuel@sholland.org, wens@csie.org,
  mchehab@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, aou@eecs.berkeley.edu,
  Conor Dooley <conor@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, mripard@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jernej.skrabec@gmail.com
Message-ID: <mhng-e29729d8-6f1e-42a5-bff6-852a16626cd4@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_162556_973776_AB3C6EE9 
X-CRM114-Status: GOOD (  24.51  )
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

T24gVGh1LCAwNSBKYW4gMjAyMyAwODoyMTo1OCBQU1QgKC0wODAwKSwgamVybmVqLnNrcmFiZWNA
Z21haWwuY29tIHdyb3RlOgo+IERuZSDEjWV0cnRlaywgMDUuIGphbnVhciAyMDIzIG9iIDE1OjM4
OjM2IENFVCBqZSBTYW11ZWwgSG9sbGFuZCBuYXBpc2FsKGEpOgo+PiBIaSBQYXVsLAo+PiAKPj4g
T24gMS81LzIzIDA0OjExLCBQYXVsIEtvY2lhbGtvd3NraSB3cm90ZToKPj4gPiBPbiBTYXQgMzEg
RGVjIDIyLCAxMDo0NiwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+ID4+IEQxIGNvbnRhaW5zIGEg
dmlkZW8gZW5naW5lIHdoaWNoIGlzIHN1cHBvcnRlZCBieSB0aGUgQ2VkcnVzIGRyaXZlci4KPj4g
PiAKPj4gPiBEb2VzIGl0IHdvcmsgIm91dHNpZGUgdGhlIGJveCIgd2l0aG91dCBwb3dlciBkb21h
aW4gbWFuYWdlbWVudD8KPj4gPiBJZiBub3QsIGl0IG1pZ2h0IGJlIGEgYml0IGNvbmZ1c2luZyB0
byBhZGQgdGhlIG5vZGUgYXQgdGhpcyBwb2ludC4KPj4gCj4+IFllcywgaXQgZG9lcy4gQWxsIG9m
IHRoZSBwb3dlciBkb21haW5zIGFyZSBlbmFibGVkIGJ5IGRlZmF1bHQuIEhvd2V2ZXIsCj4+IGlm
IHRoZSBQUFUgc2VyaWVzIGlzIG1lcmdlZCBmaXJzdCwgSSB3aWxsIHJlc3BpbiB0aGlzIHRvIGlu
Y2x1ZGUgdGhlCj4+IHBvd2VyLWRvbWFpbnMgcHJvcGVydHkgZnJvbSB0aGUgYmVnaW5uaW5nLgo+
Cj4gSSB3b3VsZCByYXRoZXIgc2VlIHRoYXQgbWVyZ2VkIGJlZm9yZSBhbmQgaGF2aW5nIGNvbXBs
ZXRlIG5vZGUgcmlnaHQgYXdheS4KPgo+IEkndmUgYmVlbiBhd2F5LCBidXQgSSdsbCBtZXJnZSBl
dmVyeXRoaW5nIHRoYXQncyByZWFkeSBmb3Igc3VueGkgdHJlZSB1bnRpbCAKPiBlbmQgb2YgdGhl
IHdlZWtlbmQuCgpKdXN0IGNoZWNraW5nIHVwIG9uIHRoaXMgb25lLCBhcyBpdCdzIHN0aWxsIGlu
IHRoZSBSSVNDLVYgcGF0Y2h3b3JrIGJ1dCAKSSBkb24ndCBzZWUgaXQgaW4gbGludXgtbmV4dC4g
IE5vIGJpZyBkZWFsIG9uIG15IGVuZCwgSSBqdXN0IGRvbid0IHdhbnQgCnRvIGJlIGRyb3BwaW5n
IHRoZSBiYWxsIGhlcmUuCgpBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2lu
Yy5jb20+CgpJbiBjYXNlIHlvdSB3ZXJlIHdhaXRpbmcgZm9yIGl0IChpbiB3aGljaCBjYXNlIHNv
cnJ5KS4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gSmVybmVqCj4KPj4gCj4+IFJlZ2FyZHMsCj4+IFNh
bXVlbAo+PiAKPj4gPj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbEBzaG9s
bGFuZC5vcmc+Cj4+ID4+IC0tLQo+PiA+PiAKPj4gPj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxs
d2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kgfCAxMSArKysrKysrKysrKwo+PiA+PiAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPj4gPj4gCj4+ID4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4+ID4+IGIvYXJj
aC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBpbmRleAo+PiA+
PiBkZmYzNjNhM2M5MzQuLjRiZDM3NDI3OTE1NSAxMDA2NDQKPj4gPj4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+PiA+PiArKysgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4+ID4+IEBAIC0z
NCw2ICszNCwxNyBAQCBzb2Mgewo+PiA+PiAKPj4gPj4gIAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47
Cj4+ID4+ICAJCSNzaXplLWNlbGxzID0gPDE+Owo+PiA+PiAKPj4gPj4gKwkJdmU6IHZpZGVvLWNv
ZGVjQDFjMGUwMDAgewo+PiA+PiArCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQx
LXZpZGVvLQo+IGVuZ2luZSI7Cj4+ID4+ICsJCQlyZWcgPSA8MHgxYzBlMDAwIDB4MjAwMD47Cj4+
ID4+ICsJCQlpbnRlcnJ1cHRzID0gPFNPQ19QRVJJUEhFUkFMX0lSUSg2NikgCj4gSVJRX1RZUEVf
TEVWRUxfSElHSD47Cj4+ID4+ICsJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVTX1ZFPiwKPj4gPj4g
KwkJCQkgPCZjY3UgQ0xLX1ZFPiwKPj4gPj4gKwkJCQkgPCZjY3UgQ0xLX01CVVNfVkU+Owo+PiA+
PiArCQkJY2xvY2stbmFtZXMgPSAiYWhiIiwgIm1vZCIsICJyYW0iOwo+PiA+PiArCQkJcmVzZXRz
ID0gPCZjY3UgUlNUX0JVU19WRT47Cj4+ID4+ICsJCX07Cj4+ID4+ICsKPj4gPj4gCj4+ID4+ICAJ
CXBpbzogcGluY3RybEAyMDAwMDAwIHsKPj4gPj4gIAkJCj4+ID4+ICAJCQljb21wYXRpYmxlID0g
ImFsbHdpbm5lcixzdW4yMGktZDEtcGluY3RybCI7Cj4+ID4+ICAJCQlyZWcgPSA8MHgyMDAwMDAw
IDB4ODAwPjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
