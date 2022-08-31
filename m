Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF75ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8A+ae8U6S8aXGn1FoGSrBMPsvWqePdFyiLKSORF91c=; b=NdGnlzlDqpted/
	pZIHbh9I+x6yhc2TanoyDQZssDHWRfCqPnajAYWXt/idhsR4A33tUnTFsiAlm2zba5hzP9pvPHuJO
	0xnITXaGrlYbmyRGk7EyvhsGZEOqP82FAGvUVwmHnm3cDv4fORKx0axmdGeLNW1S7OxUN9OTxBKvF
	IOT5SQTsTC4U5ZsnCGGBx5zgVnlcNqe0Xqqg1q6odS0/kOzy8m0ETy4HYwwR1cpOVgyewBUvqwNLt
	nIIQgOPQGsnLb28ZSmYZfRccyrJnrgVUDJ0ytdEccR2Fcpxwss3+JB2R7mCA+5boLEGYVZBS4uG4j
	SmzMHDDK7uogUIGnxtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTQ3i-0074rc-Km; Wed, 31 Aug 2022 15:55:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTQ3f-0074oq-1T
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 15:55:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so8250646wmb.4
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 08:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ukcegM/g94feWr92Y7b3EhVRfS5FixGTxdqnrp8f9Ro=;
        b=IoLBxyp/6PXQqlTRyar1lJsw8q/ujTBLewblnaj5stSn4mp6Ir+ny3b0PD89hMJnJt
         XNq3HtBLjfW3MaDjeHOOUNwlb1AI4UNtf9uosGt08Ji+ZPm+XGiEFeYRA0l9MqCQGzo+
         3A3ZVUmYFe6K9ApSEY7ga8W2wn9GKNeoPgJsnFT/h0WEXxxCT8nTVj0+KSFbStHfLXQe
         OS0G/rv4k0Rz5jkTmh1DcV6N9ZzBBGJCbXZpBaHSzgLhW/LnxJysulV9DgpndgA7yj2i
         5UiCinh9KdRlr5A7EaRpH/4n6qRIc14OGsp4vJ7xB9hvLlfSLT2DUK4iitiG20RF3gzi
         2OXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ukcegM/g94feWr92Y7b3EhVRfS5FixGTxdqnrp8f9Ro=;
        b=rBZ6v7zY6VqTeyyHBE3W20BgkMynhiY0geZqzesalaSDoqBs/3D+gvr9buL1NaGMlT
         Vh1BgtJXtqywC//DHyIcUYTJQjqjUcJOlwwu2TaLfXixyfAH37Ca+72xaOKYVJgnKoSt
         V/aZEe0Je0p2kJfPQH4K3d/0S3XKWTIYk9H6z6hbtCftItEqQluJrBuaYQqeYdpLk98A
         8UjKJNf+iVr0M6U8eK5k43L++4u29OaQXVZM8mqSIz4o5xUIrKwfdeDJ5wNG9qFtUttS
         mX+errUveLxTGXCeF/ZO2l4ConMIEJGMF0rDjucxJsV5V+9PY8sVeMDWcrdxzI42SmZC
         vreQ==
X-Gm-Message-State: ACgBeo2t3xJgnwtKbriaMskAXwDPkyucOqT/QFyJTP4Qn2xbAGBBF8I3
	dSKw648DzEPGaAIOKRn6DYmP7g==
X-Google-Smtp-Source: AA6agR727wHiMJ6ECV6k7IH8j7RwzJKOVsEMLTFLTdkF3uTBJuF9c8MfL2fYoBM2r+DDkwFFrNT1Nw==
X-Received: by 2002:a1c:a383:0:b0:3a5:af21:1ef0 with SMTP id m125-20020a1ca383000000b003a5af211ef0mr2382771wme.123.1661961311721;
        Wed, 31 Aug 2022 08:55:11 -0700 (PDT)
Received: from [10.35.5.6] ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d456b000000b0021f15514e7fsm14708953wrc.0.2022.08.31.08.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 08:55:11 -0700 (PDT)
Message-ID: <e9132264-bec6-0f39-ff42-d8b6e95b2492@sifive.com>
Date: Wed, 31 Aug 2022 16:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] soc: sifive: ccache: reduce printing on init
Content-Language: en-GB
To: Zong Li <zongbox@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Conor.Dooley@microchip.com, zong.li@sifive.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220829062202.3287-1-zong.li@sifive.com>
 <20220830082620.1680602-1-ben.dooks@sifive.com>
 <fdec1b72-27f3-96e6-5e19-d54ded4aea68@microchip.com>
 <cefcf96f-5bcc-d134-fbe5-d1169313b6f3@codethink.co.uk>
 <CA+ZOyajWRUFppg26O1XHfRuJHWB3jk-=-i=FBV9XYgHgshuwQA@mail.gmail.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <CA+ZOyajWRUFppg26O1XHfRuJHWB3jk-=-i=FBV9XYgHgshuwQA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_085515_139568_52E4A74A 
X-CRM114-Status: GOOD (  18.29  )
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

T24gMzEvMDgvMjAyMiAwNjoyMiwgWm9uZyBMaSB3cm90ZToKPiBCZW4gRG9va3MgPGJlbi5kb29r
c0Bjb2RldGhpbmsuY28udWs+IOaWvCAyMDIy5bm0OOaciDMx5pelIOmAseS4iSDlh4zmmagxOjA0
5a+r6YGT77yaCj4+Cj4+IE9uIDMwLzA4LzIwMjIgMTc6MzAsIENvbm9yLkRvb2xleUBtaWNyb2No
aXAuY29tIHdyb3RlOgo+Pj4gT24gMzAvMDgvMjAyMiAwOToyNiwgQmVuIERvb2tzIHdyb3RlOgo+
Pj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+Pj4+Cj4+Pj4gVGhlIGRyaXZl
ciBwcmludHMgb3V0IDYgbGluZXMgb24gc3RhcnR1cCwgd2hpY2ggY2FuIGVhc2lseSBiZSByZWRj
dWVkCj4+Pj4gdG8gdHdvIGxpbmVzIHdpdGhvdXQgbG9zaW5nIGFueSBpbmZvcm1hdGlvbi4KPj4+
Pgo+Pj4+IE5vdGUsIHRvIG1ha2UgdGhlIHR5cGVzIHdvcmsgYmV0dGVyLCB1aW50NjRfdCBoYXMg
YmVlbiByZXBsYWNlZCB3aXRoCj4+Pj4gVUxMIHRvIG1ha2UgdGhlIHVuc2lnbmVkIGxvbmcgbG9u
ZyBtYXRjaCB0aGUgZm9ybWF0IGluIHRoZSBwcmludAo+Pj4+IHN0YXRlbWVudC4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tzQHNpZml2ZS5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gICAgZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUuYyB8IDI1ICsrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2Mvc2lm
aXZlL3NpZml2ZV9jY2FjaGUuYyBiL2RyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMK
Pj4+PiBpbmRleCA0NmNlMzNkYjdkMzAuLjY1YTEwYTZlZTIxMSAxMDA2NDQKPj4+PiAtLS0gYS9k
cml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2NjYWNoZS5jCj4+Pj4gKysrIGIvZHJpdmVycy9zb2Mv
c2lmaXZlL3NpZml2ZV9jY2FjaGUuYwo+Pj4+IEBAIC03NiwyMCArNzYsMTcgQEAgc3RhdGljIHZv
aWQgc2V0dXBfc2lmaXZlX2RlYnVnKHZvaWQpCj4+Pj4KPj4+PiAgICBzdGF0aWMgdm9pZCBjY2Fj
aGVfY29uZmlnX3JlYWQodm9pZCkKPj4+PiAgICB7Cj4+Pj4gLSAgICAgICB1MzIgcmVndmFsLCB2
YWw7Cj4+Pj4gLQo+Pj4+IC0gICAgICAgcmVndmFsID0gcmVhZGwoY2NhY2hlX2Jhc2UgKyBTSUZJ
VkVfQ0NBQ0hFX0NPTkZJRyk7Cj4+Pj4gLSAgICAgICB2YWwgPSByZWd2YWwgJiAweEZGOwo+Pj4+
IC0gICAgICAgcHJfaW5mbygiQ0NBQ0hFOiBOby4gb2YgQmFua3MgaW4gdGhlIGNhY2hlOiAlZFxu
IiwgdmFsKTsKPj4+PiAtICAgICAgIHZhbCA9IChyZWd2YWwgJiAweEZGMDApID4+IDg7Cj4+Pj4g
LSAgICAgICBwcl9pbmZvKCJDQ0FDSEU6IE5vLiBvZiB3YXlzIHBlciBiYW5rOiAlZFxuIiwgdmFs
KTsKPj4+PiAtICAgICAgIHZhbCA9IChyZWd2YWwgJiAweEZGMDAwMCkgPj4gMTY7Cj4+Pj4gLSAg
ICAgICBwcl9pbmZvKCJDQ0FDSEU6IFNldHMgcGVyIGJhbms6ICVsbHVcbiIsICh1aW50NjRfdCkx
IDw8IHZhbCk7Cj4+Pj4gLSAgICAgICB2YWwgPSAocmVndmFsICYgMHhGRjAwMDAwMCkgPj4gMjQ7
Cj4+Pj4gLSAgICAgICBwcl9pbmZvKCJDQ0FDSEU6IEJ5dGVzIHBlciBjYWNoZSBibG9jazogJWxs
dVxuIiwgKHVpbnQ2NF90KTEgPDwgdmFsKTsKPj4+PiAtCj4+Pj4gLSAgICAgICByZWd2YWwgPSBy
ZWFkbChjY2FjaGVfYmFzZSArIFNJRklWRV9DQ0FDSEVfV0FZRU5BQkxFKTsKPj4+PiAtICAgICAg
IHByX2luZm8oIkNDQUNIRTogSW5kZXggb2YgdGhlIGxhcmdlc3Qgd2F5IGVuYWJsZWQ6ICVkXG4i
LCByZWd2YWwpOwo+Pj4+ICsgICAgICAgdTMyIGNmZzsKPj4+PiArCj4+Pj4gKyAgICAgICBjZmcg
PSByZWFkbChjY2FjaGVfYmFzZSArIFNJRklWRV9DQ0FDSEVfQ09ORklHKTsKPj4+PiArCj4+Pj4g
KyAgICAgICBwcl9pbmZvKCJDQ0FDSEU6ICV1IGJhbmtzLCAldSB3YXlzLCBzZXRzL2Jhbms9JWxs
dSwgYnl0ZXMvYmxvY2s9JWxsdVxuIiwKPj4+PiArICAgICAgICAgICAgICAgKGNmZyAmIDB4ZmYp
LCAoY2ZnID4+IDgpICYgMHhmZiwKPj4+PiArICAgICAgICAgICAgICAgMVVMTCA8PCAoKGNmZyA+
PiAxNikgJiAweGZmKSwKPj4+Cj4+PiBUaGlzIGlzIGp1c3QgQklUX1VMTCgoY2ZnID4+IDE2KSAm
IDB4ZmYpLCBubz8KPj4+IFdvdWxkIGJlIG5pY2UgdG9vIGlmIHRoZXNlIHdlcmUgZGVmaW5lZCwg
c28geW91J2QgaGF2ZSBzb21ldGhpbmcKPj4+IGxpa2UgQklUX1VMTCgoY2ZnID4+IFNFVFNfUEVS
X0JBTktfU0hJRlQpICYgMHhmZikKPj4+Cj4+PiBJIGRvIGxpa2UgdGhlIGNsZWFudXAgb2YgdGhl
IHVpbnQ2NF90ICYgY3V0dGluZyBkb3duIG9uIHRoZSBwcmludHMKPj4+IHRob3VnaCA6KSBBZ2Fp
biwgaXQnZCBiZSBuaWNlIGlmIHlvdSBhbmQgWm9uZyBjb3VsZCBjb2xsYWJvcmF0ZSBvbgo+Pj4g
YSBjb21iaW5lZCB2Mi4KPj4KPj4gSSB0aGluayBldmVuIEJJVF9VTCgpIHdvdWxkIGRvIGhlcmUs
IGlmIHNvbWVvbmUgaXMgZ29pbmcgdG8gbWFrZSBhCj4+IGNhY2hlIGJpZ2dlciB0aGFuIDJHaUIg
d2UnbGwgcHJvYmFibHkgYmUgcXVpdGUgb2xkIGJ5IHRoZW4sIHNvIHYyCj4+IG1pZ2h0IGhhdmUg
dGhlIGxhc3QgdHdvIHZhbHVlcyBkb3duIGFzICVsdS4KPj4KPiAKPiBIaSBCZW4sCj4gVGhhbmtz
IGZvciB5b3VyIHN1Z2dlc3Rpb24sIElmIHlvdSBkb24ndCBtaW5kLCBJIHdpbGwgdGFrZSB0aGlz
IGludG8KPiBteSBWMiBwYXRjaHNldC4KClRoYW5rcy4KCkkgbWF5IHdlbGwgcG9zdCB2MiBvZiB0
aGlzIHRvbW9ycm93IHdpdGggdGhlIEJJVF9VTEwoKSBzdWdnZXN0aW9ucwpmcm9tIENvbm9yLCBv
ciBldmVuIGRvd24gdG8gQklUX1VMKCkgYW5kIHVzZSAlbHUgYXMgbm90ZWQuCgo+IAo+Pj4gVGhh
bmtzLAo+Pj4gQ29ub3IuCj4+Pgo+Pj4+ICsgICAgICAgICAgICAgICAxVUxMIDw8ICgoY2ZnID4+
IDI0KSAmIDB4ZmYpKTsKPj4+PiArCj4+Pj4gKyAgICAgICBjZmcgPSByZWFkbChjY2FjaGVfYmFz
ZSArIFNJRklWRV9DQ0FDSEVfV0FZRU5BQkxFKTsKPj4+PiArICAgICAgIHByX2luZm8oIkNDQUNI
RTogSW5kZXggb2YgdGhlIGxhcmdlc3Qgd2F5IGVuYWJsZWQ6ICVkXG4iLCBjZmcpOwo+Pj4+ICAg
IH0KPj4+Pgo+Pj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHNpZml2ZV9j
Y2FjaGVfaWRzW10gPSB7Cj4+Pj4gLS0KPj4+PiAyLjM1LjEKPj4+Pgo+Pj4KPj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4+Cj4+
Cj4+IC0tCj4+IEJlbiBEb29rcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodHRwOi8v
d3d3LmNvZGV0aGluay5jby51ay8KPj4gU2VuaW9yIEVuZ2luZWVyICAgICAgICAgICAgICAgICAg
ICAgICAgIENvZGV0aGluayAtIFByb3ZpZGluZyBHZW5pdXMKPj4KPj4gaHR0cHM6Ly93d3cuY29k
ZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
