Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8672DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFIE9ZKxWLnVCKo/qbrfHKUnc4tZBOAsK3dgopNMDJw=; b=bV4OxjJP1RzNTD
	ywr8GwP5URk6rRcJEW8vum/59cUpQmHpSeQWokpUI7FhMxxnsBZiQTPGIcZW4Z+RMewyaW5MoiR8r
	jz7iv8Ve/zxs7ce39I6h2qgxW4yi8iiGpZGVoBVZuXzng1rDGSmKRuvfJPHFXmylhORd5yOdLDcL1
	gtbKDPiXvoFmD2E6KuYqg9vWXudd0K+l0pn0zhJJzDOzPxMd0ZMusTzxnXp3f3zpxQvHd7YJ/lkjD
	Ka7I/gYecByArTPp8wMHyFLuzg7NoAKfDjzd1Gp6347T/6f/GwC81WiQbgt6YrGLR5bjDKDmEU4R5
	1pHIkAaIOorkImYtdWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms4yv-005s8v-OQ; Tue, 30 Nov 2021 15:23:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms4dr-005lK2-Rk
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 15:02:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d9so24226315wrw.4
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 07:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tt3rzy7U8jtDDkOr2bs9fpOdOEtwyk7EaYJRM5UbHUM=;
 b=YtrhNfmIJKIvBB5hQT4rkZcNSUkuhiHkssVg4vSjLhGAv4gArvLcH7KCIyD13B71oR
 7XsW7sbLRob+sa6/ydYT/y637VgYkbATtaIzB13BbjxHFFqLCggDMprBYkVd+xJ28uzq
 q8FijndPMSoI3y4fyC0TKf65YCw8iRCfnP75HnWlTQQPoR5ZgYS5gRUI8mbXWsmNikas
 yX8zqrJjfoiYNlFmXtN7C0cErClOsxn7hpoSyQkNlRqSpIfG97GTt5EsS2e0coeFnUtu
 X9gYcTuPJIs+y01E3KHl1nBZnze0L5qBkqE1rvmklVeIzVHyc7EZYUF9CSegGpF3F/vj
 SujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tt3rzy7U8jtDDkOr2bs9fpOdOEtwyk7EaYJRM5UbHUM=;
 b=VRpXLrj6VAqSILHwnQqiw9bdKKactoQVomYJbsvV7nVbEUQXkhbjCkeyWRuRoBQTN6
 vrdQAPBv4KqfD5GqYviD4+5rR6fDwol8PWzRuNli1Hpd3xgi5JPPGkmkypEykaOk2bw9
 X3YUNo9eIYHNkYxkRBakC/oyuz3EJPTai2Rd0W6Sn7m2xfGMN/IQ6/7ykeken+41Jb5n
 rLNbtWVRp+lPVDhhxi7MhlnTyhIhpO+laHBkKF2ixmXVKCBcvoxBahoG6UiZ7eF5kNbc
 jR3sjG5A9UAuN91JP7e9lNUCoCHzWTtz6czrmggSE+MOJ8jexeAIeWcDFcdF03s54zAN
 whnw==
X-Gm-Message-State: AOAM532W/euFX4g25ln5W1efquNjnVjboe1R3gxFRQipdCva+MkUPX8h
 twcxWLnrYF+Bh9KUFMEjnkiF5ykBa23fWSVc/P206w==
X-Google-Smtp-Source: ABdhPJzPtijXN7E4GbyZ8xSeGh+7wpmLdDsqXOAZ5ENfPFxSIVDg6BjfnnRGBSaLa1O64aYfYAIau9hY1/IrEKqETZ8=
X-Received: by 2002:adf:eac8:: with SMTP id o8mr42150427wrn.337.1638284517883; 
 Tue, 30 Nov 2021 07:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20211129014007.286478-1-wefu@redhat.com>
 <1909580.k68io2XIxi@diego>
 <D7F256F9-F31F-4663-AADD-A535E159F87C@jrtc27.com> <2728314.U2HhIfhhqV@diego>
 <C19C85E6-821B-4A87-B764-56CF4D53E7FA@jrtc27.com>
In-Reply-To: <C19C85E6-821B-4A87-B764-56CF4D53E7FA@jrtc27.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 30 Nov 2021 16:01:47 +0100
Message-ID: <CAAeLtUC0Qc6ysf31sh0dkvfJD-JsREZbyFFk=Ko0vQeBRzyjaw@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Wei Fu <wefu@redhat.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, arnd@arndb.de, wens@csie.org,
 maxime@cerno.tech, 
 Dan Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 andrea.mondelli@huawei.com, 
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 jscheid@ventanamicro.com, rtrauben@gmail.com, 
 Anup Patel <anup@brainfault.org>, Rob Herring <robh+dt@kernel.org>, 
 Anup Patel <Anup.Patel@wdc.com>, atishp04@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren <guoren@kernel.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, hch@lst.de, 
 liush@allwinnertech.com, Wei Wu <lazyparser@gmail.com>, drew@beagleboard.org, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_070200_011053_3DFB2949 
X-CRM114-Status: GOOD (  20.81  )
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

V2UgZGlkIHRvdWNoIG9uIHRoaXMgaW4gb3VyIGNvb3JkaW5hdGlvbiBjYWxsIGEgZmV3IHdlZWtz
IGFnbzogdGhlCmdyb3VwaW5nIHVuZGVyIG1tdSBhbmQgdGhlIGJvb2wtZW50cmllcyB3ZXJlIGNo
b3NlbiBiZWNhdXNlIG9mIHRoZWlyCnNpbWlsYXJpdHkgdG8gb3RoZXIgZXh0ZW5zaW9ucyAoaS5l
LiBmb3IgWmJbYWJjc10gdGhlcmUgY291bGQvc2hvdWxkCmJlIGEgYm9vbC1lbnRyeSB1bmRlciBl
YWNoIGNwdS1ub2RlIOKAlCBmb3Igc29tZSBadiogZW50cmllcyBhIHN1Ym5vZGUKbWlnaHQgYmUg
bmVlZGVkIHdpdGggZnVydGhlciBwYXJhbWV0ZXJzKS4KClRoZSBzdHJpbmctYmFzZWQgYXBwcm9h
Y2ggKGFzIGluIHRoZSBvcmlnaW5hbGx5IHByb3Bvc2VkICJtbXUtdHlwZT0iKQp3b3VsZCBsaWtl
IG5vdCBzY2FsZSB3aXRoIHRoZSBwcm9saWZlcmF0aW9uIG9mIHNtYWxsICYgbW9kdWxhcgpleHRl
bnNpb25zLgoKUGhpbGlwcC4KCgpPbiBUdWUsIDMwIE5vdiAyMDIxIGF0IDE0OjU5LCBKZXNzaWNh
IENsYXJrZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMzAgTm92IDIwMjEsIGF0
IDEzOjI3LCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPiA+Cj4gPiBI
aSwKPiA+Cj4gPiBBbSBEaWVuc3RhZywgMzAuIE5vdmVtYmVyIDIwMjEsIDE0OjE3OjQxIENFVCBz
Y2hyaWViIEplc3NpY2EgQ2xhcmtlOgo+ID4+IE9uIDMwIE5vdiAyMDIxLCBhdCAxMjowNywgSGVp
a28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IEFtIE1vbnRh
ZywgMjkuIE5vdmVtYmVyIDIwMjEsIDEzOjA2OjIzIENFVCBzY2hyaWViIEhlaWtvIFN0w7xibmVy
Ogo+ID4+Pj4gQW0gTW9udGFnLCAyOS4gTm92ZW1iZXIgMjAyMSwgMDk6NTQ6MzkgQ0VUIHNjaHJp
ZWIgSGVpbnJpY2ggU2NodWNoYXJkdDoKPiA+Pj4+PiBPbiAxMS8yOS8yMSAwMjo0MCwgd2VmdUBy
ZWRoYXQuY29tIHdyb3RlOgo+ID4+Pj4+PiBGcm9tOiBXZWkgRnUgPHdlZnVAcmVkaGF0LmNvbT4K
PiA+Pj4+Pj4KPiA+Pj4+Pj4gUHJldmlvdXMgcGF0Y2ggaGFzIGFkZGVkIHN2cGJtdCBpbiBhcmNo
L3Jpc2N2IGFuZCBhZGQgInJpc2N2LHN2cG1idCIKPiA+Pj4+Pj4gaW4gdGhlIERUIG1tdSBub2Rl
LiBVcGRhdGUgZHQtYmluZGluZ3MgcmVsYXRlZCBwcm9wZXJ0eSBoZXJlLgo+ID4+Pj4+Pgo+ID4+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBXZWkgRnUgPHdlZnVAcmVkaGF0LmNvbT4KPiA+Pj4+Pj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+Pj4+Pj4gU2lnbmVk
LW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPj4+Pj4+IENjOiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+ID4+Pj4+PiBDYzogUGFsbWVyIERhYmJlbHQgPHBh
bG1lckBkYWJiZWx0LmNvbT4KPiA+Pj4+Pj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+Cj4gPj4+Pj4+IC0tLQo+ID4+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvY3B1cy55YW1sIHwgMTAgKysrKysrKysrKwo+ID4+Pj4+PiAxIGZpbGUgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+ID4+Pj4+Pgo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+Pj4+Pj4gaW5kZXgg
YWE1ZmI2NGQ1N2ViLi45ZmY5Y2JkZDhhODUgMTAwNjQ0Cj4gPj4+Pj4+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+Pj4+Pj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4+Pj4+
PiBAQCAtNjMsNiArNjMsMTYgQEAgcHJvcGVydGllczoKPiA+Pj4+Pj4gICAgICAgLSByaXNjdixz
djQ4Cj4gPj4+Pj4+ICAgICAgIC0gcmlzY3Ysbm9uZQo+ID4+Pj4+Pgo+ID4+Pj4+PiArICBtbXU6
Cj4gPj4+Pj4KPiA+Pj4+PiBTaG91bGRuJ3Qgd2Uga2VlcCB0aGUgaXRlbXMgYmUgaW4gYWxwaGFi
ZXRpYyBvcmRlciwgaS5lLiBtbXUgYmVmb3JlCj4gPj4+Pj4gbW11LXR5cGU/Cj4gPj4+Pj4KPiA+
Pj4+Pj4gKyAgICBkZXNjcmlwdGlvbjoKPiA+Pj4+Pj4gKyAgICAgIERlc2NyaWJlcyB0aGUgQ1BV
J3MgTU1VIFN0YW5kYXJkIEV4dGVuc2lvbnMgc3VwcG9ydC4KPiA+Pj4+Pj4gKyAgICAgIFRoZXNl
IHZhbHVlcyBvcmlnaW5hdGUgZnJvbSB0aGUgUklTQy1WIFByaXZpbGVnZWQKPiA+Pj4+Pj4gKyAg
ICAgIFNwZWNpZmljYXRpb24gZG9jdW1lbnQsIGF2YWlsYWJsZSBmcm9tCj4gPj4+Pj4+ICsgICAg
ICBodHRwczovL3Jpc2N2Lm9yZy9zcGVjaWZpY2F0aW9ucy8KPiA+Pj4+Pj4gKyAgICAkcmVmOiAn
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nJwo+ID4+Pj4+PiArICAgIGVu
dW06Cj4gPj4+Pj4+ICsgICAgICAtIHJpc2N2LHN2cG1idAo+ID4+Pj4+Cj4gPj4+Pj4gVGhlIHBy
aXZpbGVnZWQgc3BlY2lmaWNhdGlvbiBoYXMgbXVsdGlwbGUgTU1VIHJlbGF0ZWQgZXh0ZW5zaW9u
czoKPiA+Pj4+PiBTdm5hcG90LCBTdnBibXQsIFN2aW52YWwuIFNoYWxsIHRoZXkgYWxsIGJlIG1v
ZGVsZWQgaW4gdGhpcyBlbnVtPwo+ID4+Pj4KPiA+Pj4+IEkgcmVtZW1iZXIgaW4gc29tZSBlYXJs
aWVyIHZlcnNpb24gc29tZSB3YXkgYmFjayB0aGVyZSB3YXMgdGhlCj4gPj4+PiBzdWdnZXN0aW9u
IG9mIHVzaW5nIGEgc3ViLW5vZGUgaW5zdGVhZCBhbmQgdGhlbiBhZGRpbmcgYm9vbGVhbgo+ID4+
Pj4gcHJvcGVydGllcyBmb3IgdGhlIHN1cHBvcnRlZCBleHRlbnNpb25zLgo+ID4+Pj4KPiA+Pj4+
IEFrYSBzb21ldGhpbmcgbGlrZQo+ID4+Pj4gICAgbW11IHsKPiA+Pj4+ICAgICAgICAgICAgcmlz
Y3Ysc3ZwYm10Owo+ID4+Pj4gICAgfTsKPiA+Pj4KPiA+Pj4gRm9yIHRoZSByZWNvcmQsIEknbSB0
YWxraW5nIGFib3V0IHRoZSBtYWlsIGZyb20gc2VwdGVtYmVyCj4gPj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBQWVMdFVDaGpqekcrUDh5ZzQ1R0xaTUp5NVVSMks1UlJC
b0xGVlpodE9hWjVwUHRFQUBtYWlsLmdtYWlsLmNvbS8KPiA+Pj4KPiA+Pj4gU28gaGF2aW5nIGEg
c3ViLW5vZGUgd291bGQgbWFrZSBhZGRpbmcgZnV0dXJlIGV4dGVuc2lvbnMKPiA+Pj4gd2F5IG5p
Y2VyLgo+ID4+Cj4gPj4gU3ZwYm10IGlzIGp1c3QgYW4gSVNBIGV4dGVuc2lvbiwgYW5kIHNob3Vs
ZCBiZSB0cmVhdGVkIGxpa2UgYW55IG90aGVyLgo+ID4+IExldOKAmXMgbm90IGludmVudCB0d28g
ZGlmZmVyZW50IHdheXMgb2YgcmVwcmVzZW50aW5nIHRoYXQgaW4gdGhlIGRldmljZQo+ID4+IHRy
ZWUuCj4gPgo+ID4gSGVpbnJpY2ggYXNrZWQgaG93IHRoZSBvdGhlciBleHRlbnNpb25zIHNob3Vs
ZCBiZSBoYW5kbGVkCj4gPiAoU3ZuYXBvdCwgU3ZwYm10LCBTdmludmFsKSwgc28gd2hhdCBkbyB5
b3Ugc3VnZ2VzdCB0byBkbyB3aXRoIHRoZXNlPwo+Cj4gV2hhdGV2ZXIgaXMgZG9uZSBmb3IgWmJb
YWJjc10sIFprKiwgWnYqLCBaaWNibyosIGV0Yy4gVGhlcmUgbWF5IG5vdCBiZQo+IGEgY29uY3Jl
dGUgcGxhbiBmb3IgdGhhdCB5ZXQsIGJ1dCB0aGF0IG1lYW5zIHlvdSBzaG91bGQgc3BlYWsgd2l0
aCB0aGUKPiBwZW9wbGUgaW52b2x2ZWQgd2l0aCBzdWNoIGV4dGVuc2lvbnMgYW5kIGNvbWUgdXAg
d2l0aCBzb21ldGhpbmcKPiBhcHByb3ByaWF0ZSB0b2dldGhlci4KPgo+IEplc3MKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
