Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6267DEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ExU7gyMDJQTlWST6RCgLQ4m+N4ndrcb7QqJo3UMFpE=; b=hkuTfWFPPHzPgb
	zjGaWonBBKpcSeqqX17Aq1rq6LY2LdTHKx6D4+8Go1z7IQA+8G4Sg50gMKgN8bydwnA0jv4IqhBEz
	cLX875VsgCSW63/pGSewVFVJ+JhiaXJ2ciVMUASh54auRyY+HxH1X9O2rF8FC/pJ9P0U4Hio5llZG
	tB/uyZvuWRXmVN8TGG02ahLiYXGRFxYWnatviAtUpx7itEYfBfFHV8BQnpqbTlvpPFev/F3pxYjmy
	5CiSJnUTqxrImZgtlNRc0vDucaRiOURjHN98mXN+KOVAvHASvr2VVZ1eRLNTqTcGRB5tHkyxmIfRr
	CHBioYkmoP3yeukeCQKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrcl-00BqZ8-0e;
	Mon, 10 Jul 2023 14:12:23 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIrch-00BqXY-2o
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 14:12:21 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-577637de4beso59063457b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688998337; x=1691590337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RYEluLb4R6qDJqCu/Fobryc+g47o+Wn7YP9UuzqITQ=;
        b=LiQyu2iTu/7ty+kRi4JxovHIC4La9quauTaVui4l7lUmVWeV2h1DILx4wlhlu1j9If
         lAkwP8gVhm+zete8+hAqlY6X60x+O27Cg78TiRH+TDU6fh3LX6BaFWZtnKZE6Vsw8KMF
         gSXeFdeGb5cZ5aZICwJIdBle9j7O77RHXzYKVkE8plJKUVZHBLiulA8CLoRNiI3QF+BW
         yDtvpiPDmUjAMFl/biQ+AZugY6Y5pJZJvTu4QRHujwkPM689M3TDhS7Dr+z+8B/uTVQu
         ezU3/yZtTkkK1/AtvaS/gqBGMr+7Y313GvsidGZOBuuvkfUQr7cH0KfexZu3Y1uTaClh
         bYHA==
X-Gm-Message-State: ABy/qLYoGb2ElxzElR1aBleunGO409SbZMs/8cDs+wImKpZbTKfz9SNu
	pjAqRdZ2XjUjYWMObH4j0dYCD7vsKLv9aQ==
X-Google-Smtp-Source: APBJJlH/sQiNdEHmFZnrYHUMfHwYs52gSSlKErjrNRM5t0nZIV8oEUtgN4R+6gF4dVGgz+dWC/v8mQ==
X-Received: by 2002:a0d:d6c2:0:b0:56d:4b45:f9e1 with SMTP id y185-20020a0dd6c2000000b0056d4b45f9e1mr7987387ywd.3.1688998336745;
        Mon, 10 Jul 2023 07:12:16 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id d126-20020a0df484000000b005705cbba0bcsm3068365ywf.98.2023.07.10.07.12.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jul 2023 07:12:16 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-c7a5600d04dso2627958276.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 07:12:16 -0700 (PDT)
X-Received: by 2002:a25:d312:0:b0:c6b:73df:7350 with SMTP id
 e18-20020a25d312000000b00c6b73df7350mr9120556ybf.34.1688998336300; Mon, 10
 Jul 2023 07:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230630120433.49529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230630120433.49529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2023 16:12:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKavD1JLTMRhF6grRchd9pwDd3oupPPCRDw1Can3nb=w@mail.gmail.com>
Message-ID: <CAMuHMdXKavD1JLTMRhF6grRchd9pwDd3oupPPCRDw1Can3nb=w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_071219_916943_BFF0BF1E 
X-CRM114-Status: GOOD (  26.53  )
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

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMjowNeKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEN1cnJlbnRs
eSB3ZSBhc3N1bWUgYWxsIHRoZSBwb3J0IHBpbnMgYXJlIHNlcXVlbnRpYWwgaWUgYWx3YXlzIFBY
XzAgdG8KPiBQWF9uIChuPTEuLjcpIGV4aXN0LCBidXQgb24gUlovRml2ZSBTb0Mgd2UgaGF2ZSBh
ZGRpdGlvbmFsIHBpbnMgUDE5XzEgdG8KPiBQMjhfNSB3aGljaCBoYXZlIGhvbGVzIGluIHRoZW0s
IGZvciBleGFtcGxlIG9ubHkgb25lIHBpbiBvbiBwb3J0MTkgaXMKPiBhdmFpbGFibGUgYW5kIHRo
YXQgaXMgUDE5XzEgYW5kIG5vdCBQMTlfMC4KPgo+IFNvIHRvIGhhbmRsZSBzdWNoIGNhc2VzIGlu
Y2x1ZGUgcGlubWFwIGZvciBlYWNoIHBvcnQgd2hpY2ggd291bGQgaW5kaWNhdGUKPiB0aGUgcGlu
IGF2YWlsYWJpbGl0eSBvbiBlYWNoIHBvcnQuIFdpdGggdGhpcyB3ZSBhbHNvIGdldCBhZGRpdGlv
bmFsIHBpbgo+IHZhbGlkYXRpb24sIGZvciBleGFtcGxlIG9uIHRoZSBSWi9HMkwgU09DIFAwIGhh
cyB0d28gcGlucyBQMF8xIGFuZCBQMF8wCj4gYnV0IHdpdGggRFQvU1lTRlMgY291bGQgdXNlIHRo
ZSBQMF8yLVAwXzcuCj4KPiBXaGlsZSBhdCBpdCwgdXBkYXRlIHJ6ZzJsX3ZhbGlkYXRlX2dwaW9f
cGluKCkgdG8gdXNlIHRoZSBwb3J0IHBpbm1hcCB0bwo+IHZhbGlkYXRlIHRoZSBncGlvIHBpbi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3Ry
bC1yemcybC5jIHwgMTY3ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgODYgaW5zZXJ0aW9ucygrKSwgODEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jIGIvZHJpdmVycy9waW5jdHJsL3Jl
bmVzYXMvcGluY3RybC1yemcybC5jCj4gaW5kZXggOTUxMWQ5MjA1NjVlLi5hMGMyZTU4NWU3NjUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jCj4g
KysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jCj4gQEAgLTY3LDEw
ICs2NywxMiBAQAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUElO
X0NGR19GSUxDTEtTRUwpCj4KPiAgLyoKPiAtICogbiBpbmRpY2F0ZXMgbnVtYmVyIG9mIHBpbnMg
aW4gdGhlIHBvcnQsIGEgaXMgdGhlIHJlZ2lzdGVyIGluZGV4Cj4gLSAqIGFuZCBmIGlzIHBpbiBj
b25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gKyAqIG0gaW5kaWNhdGVzIHRo
ZSBiaXRtYXAgb2Ygc3VwcG9ydGVkIHBpbnMsIG4gaW5kaWNhdGVzIG51bWJlcgo+ICsgKiBvZiBw
aW5zIGluIHRoZSBwb3J0LCBhIGlzIHRoZSByZWdpc3RlciBpbmRleCBhbmQgZiBpcyBwaW4KPiAr
ICogY29uZmlndXJhdGlvbiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkLgo+ICAgKi8KPiAtI2RlZmlu
ZSBSWkcyTF9HUElPX1BPUlRfUEFDSyhuLCBhLCBmKSAgKCgobikgPDwgMjgpIHwgKChhKSA8PCAy
MCkgfCAoZikpCj4gKyNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobSwgbiwgYSwgZikgICAg
ICAgKChVTChtKSA8PCAzMikgfCAoVUwobikgPDwgMjgpIHwgKChhKSA8PCAyMCkgfCAoZikpCgpE
byB3ZSBhY3R1YWxseSBuZWVkIDIwIGJpdHMgZm9yIHRoZSAiZiIgZmllbGQ/CkFzIEJpanUgYWxy
ZWFkeSBjb21tZW50ZWQsICJuIiBjYW4gYmUgZGVyaXZlZCBmcm9tICJtIi4KSWYgImYiIGNhbiBi
ZSBzaHJ1bmssIHdlIG1pZ2h0IGZpdCBldmVyeXRoaW5nIGluIDMyIGJpdHMuCgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
