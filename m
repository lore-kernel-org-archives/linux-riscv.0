Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A747C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBU3nvOX1GktQhEGkArBkeisyVisyzXieNhpAiYcdzs=; b=Y4RYSvTTPyHyXh
	3FK0lItcegp5aGHv3/wmFH5u1mF1dcN1CdCNldqEN+x6/yGq4wmBXgAa7xWAaxXfknWmz6gzFwtZP
	iIpsyMQdjzUWjE+tCUA67oDtAG7XX+Tza/zvNfuewZ6m6Hz1l3r7udYB9QZl1g952oSqZZBdIja0V
	cbzEGYRNt0j9DGQf2m1ZptOwFmaqA+XDt2Fvp+Nwo4cKuX7CBo+n/pT3RpinfJRbyxp7besJHNfKH
	LdSb3dIupEbi164NM3jeWi2gcF/okawedT2lo/VpDo6SArKDTkqUinz9orPGWnnfqbfTj/LsF7FWq
	UB48nbDTNDrcfNqo5akw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyciV-000tqT-6m; Fri, 25 Nov 2022 17:42:23 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyciS-000toh-Be
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 17:42:22 +0000
Received: by mail-oi1-x229.google.com with SMTP id s206so5109235oie.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 09:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyT0YeF2ulXDK602uziKxc/l+CM8LHeYCrbWw7mis2U=;
        b=WGmGqzudCARRlmbNNwCGDia9DWdQvWrYO2PAooLKy0LDKcoQ7tvnXVnDhMyGlrjdrT
         Xw+zwS5vqxm3IgXgO+H3Ee35ucZGPoDiqepnx9ZSldsUIPDrvRf65UMkR1PJuGMxMhH1
         5dw34s/uxb0ij4nydUs3udV+O1gpie89mGHhH0qvUfb7XjwHO1iCkEtDuO0i8tbOd7NV
         Opot7Ny4CM1KZgk+u+PJ1VY3Mx4YtdKExOL9PN1rhQ0xGvUmwhk8tbjzR8Np4NPGBx8A
         EjJsVUxca6gKGQUv4G31CLyifiAz2yBy8T9vtZs49YKnqsNDkFkTZMW3uEdWDAUWQJOm
         LFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyT0YeF2ulXDK602uziKxc/l+CM8LHeYCrbWw7mis2U=;
        b=VeHREk16pChv5UwQxLz4oEk4H2q1zek5QU48+kR3/xFVgtuspnkWYDr7fWPAp8/w80
         cc+jsyfR+h3x1ERhxi9XaLtLNhSDexH4nBs1Zaks88u2izccy3cXZ0N2DyHetAR9FbeL
         1m/kcqKR17GtX1rk4HG4jmer3Tt7qq0tZi+NQKkMI2W+fMRd5dXVmhwg+h+togjFNhx9
         n57ld1hb5oWr6FHpJdPXwEoIstl1mRVJ4OpZoSnKFrpai3+YGsfOOAv8isFIQa4Ewjxr
         v96TNYEgpeOMteBKTwNNWsCCnqBID9HyQBz2OJtruMzxATV/MogpROp+oh4l39xwFFza
         0IyQ==
X-Gm-Message-State: ANoB5pnfq53NMg4BerUxBLlQt/G9zFxeifwlZV7PAgz1BExJEz4Lfq4p
	f9j4wq3tLD/8jltZGDLwqT65XWcwFaL4Lkr9G/jZeA==
X-Google-Smtp-Source: AA0mqf5zLVjcMuQFGCdmlsGJNFRkvFu6rTA6OAKEfT10zqoHbrsDsZgXu00cfwh1r5w7mnLMCB6pYG1uYaEp4m1vzlo=
X-Received: by 2002:aca:f307:0:b0:354:3e50:f66c with SMTP id
 r7-20020acaf307000000b003543e50f66cmr9215260oih.112.1669398138294; Fri, 25
 Nov 2022 09:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud> <3259590.VLH7GnMWUR@phil> <20221125074933.2xuyaeuk5kmi5miw@kamzik>
 <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com>
 <20221125152821.ytipefad7oxv733t@kamzik> <CAEg0e7g132REPxisSFJZorXbSqzb4q1Tj7FC8G9pDMymt0qZuw@mail.gmail.com>
 <Y4Dv0Vfz6AAg/X19@spud> <CAEg0e7h-m6oMYd+W2=89t4iPLKLz6TsLzKzUmAq1vuOTeawsUQ@mail.gmail.com>
 <Y4D3M6469WUX/Df7@spud>
In-Reply-To: <Y4D3M6469WUX/Df7@spud>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 25 Nov 2022 18:42:06 +0100
Message-ID: <CAEg0e7jZbAkXxmAh=n_=2BeeaqzOXudFY_JxOouTHEE1OOkw_Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, 
	emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_094220_417442_8BC13386 
X-CRM114-Status: GOOD (  20.44  )
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

T24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgNjoxMSBQTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgMDY6MDI6MTJQTSArMDEw
MCwgQ2hyaXN0b3BoIE3DvGxsbmVyIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMjUsIDIwMjIgYXQg
NTozOSBQTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBGcmksIE5vdiAyNSwgMjAyMiBhdCAwNTozNTozOVBNICswMTAwLCBDaHJpc3RvcGggTcO8
bGxuZXIgd3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgNDoyOCBQTSBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gPiA+
IC8qCj4gPiA+ID4gPiAgKiBFYWNoIHN1Yi1saXN0IGlzIHNvcnRlZCBhbHBoYWJldGljYWxseS4K
PiA+ID4gPiA+ICAqLwo+ID4gPiA+ID4gI2RlZmluZSBTX0VYVEVOU0lPTlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAg
ICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiks
ICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBS
SVNDVl9JU0FfRVhUX1NTVEMpLCAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gICAgICAgICBf
X1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFsLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpLCAgICAg
ICAgICAgXAo+ID4gPiA+ID4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdnBibXQsIFJJ
U0NWX0lTQV9FWFRfU1ZQQk1UKSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiAjZGVmaW5lIFppX0VYVEVO
U0lPTlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppY2JvbSwgUklTQ1ZfSVNB
X0VYVF9aSUNCT00pLCAgICAgICAgICAgICBcCj4gPiA+ID4gPiAgICAgICAgIF9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFKSwKPiA+ID4g
PiA+Cj4gPiA+ID4gPiAjZGVmaW5lIFpiX0VYVEVOU0lPTlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiAgICAgICAgIF9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHpiYiwgUklTQ1ZfSVNBX0VYVF9aSUNCT00pLCAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gc3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgaXNh
X2V4dF9hcnJbXSA9IHsKPiA+ID4gPiA+ICAgICAgICAgWmlfRVhURU5TSU9OUwo+ID4gPiA+ID4g
ICAgICAgICBaYl9FWFRFTlNJT05TCj4gPiA+ID4gPiAgICAgICAgIFNfRVhURU5TSU9OUwo+ID4g
PiA+ID4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSgiIiwgUklTQ1ZfSVNBX0VYVF9NQVgp
LAo+ID4gPiA+ID4gfTsKPiA+ID4gPgo+ID4gPiA+IEl0IG1pZ2h0IGJlIHdvcnRoIHRvIGxvb2sg
aG93IEJpbnV0aWxzIGFyZSBncm91cGluZyB0aGVtOgo+ID4gPiA+ICAgaHR0cHM6Ly9zb3VyY2V3
YXJlLm9yZy9naXQvP3A9YmludXRpbHMtZ2RiLmdpdDthPWJsb2I7Zj1iZmQvZWxmeHgtcmlzY3Yu
YyNsMTI2MQo+ID4gPiA+Cj4gPiA+ID4gVGhleSBhbHNvIGdyb3VwIGV4dGVuc2lvbnMgdG9nZXRo
ZXIgYnV0IHVzZSB0aGUgZm9sbG93aW5nIGdyb3VwczoKPiA+ID4gPgo+ID4gPiA+IGNvbnN0IHN0
cnVjdCByaXNjdl9zdXBwb3J0ZWRfZXh0ICpyaXNjdl9hbGxfc3VwcG9ydGVkX2V4dFtdID0KPiA+
ID4gPiB7Cj4gPiA+ID4gICByaXNjdl9zdXBwb3J0ZWRfc3RkX2V4dCwKPiA+ID4gPiAgIHJpc2N2
X3N1cHBvcnRlZF9zdGRfel9leHQsCj4gPiA+ID4gICByaXNjdl9zdXBwb3J0ZWRfc3RkX3NfZXh0
LAo+ID4gPiA+ICAgcmlzY3Zfc3VwcG9ydGVkX3N0ZF96eG1fZXh0LAo+ID4gPiA+ICAgcmlzY3Zf
c3VwcG9ydGVkX3ZlbmRvcl94X2V4dCwKPiA+ID4gPiAgIE5VTEwKPiA+ID4gPiB9Owo+ID4gPgo+
ID4gPiBJIHRoaW5rIGluIHRoaXMgY2FzZSwgRHJldydzIGRpZmZlcmVudGlhdGlvbiBiZXR3ZWVu
IFppICYgWmIgaXMgYW4KPiA+ID4gaW1wcm92ZW1lbnQgOikKPiA+Cj4gPgo+ID4gVGhhdCBtaWdo
dCBiZSB0aGUgY2FzZSwgYnV0IGl0IGFsc28gYnJpbmdzIHVwIHRoZSBmb2xsb3dpbmcgcXVlc3Rp
b25zOgo+ID4gV2hlcmUgdG8gcHV0IFpmKiBleHRlbnNpb25zIChiZXR3ZWVuIFppIGFuZCBaYik/
Cj4KPiBJIGRvbid0IHRoaW5rIHRoYXQgZGlmZmVycyBlaXRoZXIgd2F5Pwo+Cj4gPiBXaGVyZSB0
byBwdXQgWmsqIGFuZCBadiogKGFmdGVyIFpiKik/Cj4KPiBEaXR0bz8KPgo+ID4gQWRkaW5nIGEg
c3ViZ3JvdXAgZm9yIGVhY2ggWntOfSogZXh0ZW5zaW9uIG1pZ2h0IHJlc3VsdCBpbiBtYW55IHNt
YWxsCj4gPiBncm91cHMgd2l0aCBsaXR0bGUgYmVuZWZpdC4KPgo+IElmIGl0IHByZXZlbnRzIGFu
b3RoZXIgb25lIG9mIHRoZXNlIG9yZGVyaW5nIGVwaXNvZGVzLCBJIHRoaW5rIGl0J3MKPiB3b3J0
aCBkb2luZyEgSWYgYSAiZ3JvdXAiIG9ubHkgaGFzIG9uZSBlbGVtZW50IGl0IGNvdWxkIGFsdGVy
bmF0aXZlbHkgYmUKPiBhZGRlZCBkaXJlY3RseSBhbHNvLgoKU291bmRzIGdvb2QgdGhlbi4KCj4K
PiBBbHNvIG5lYXQsIHlvdSBnb3QgeW91ciBtYWlsZXIgc29ydGVkIDopCgpPbmUganVzdCBuZWVk
cyB0byByZW1lbWJlciB0byBjaGVjayB0aGUgIlBsYWluIHRleHQgbW9kZSIgYm94LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
