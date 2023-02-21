Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A13C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 05:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77fJC+4/G6EmpgmDTNwcqwhth/vIjscvlNjQVDLCxXE=; b=RL26qYilEa/wS+
	CUmjHayfa2f9iw1nCiOSI68AI1t2FhcgkXdCbzs9x5QzgnrRuHeTof3lAcwoVpgXibKSyF20zDMLY
	BKEBQULjhg1Yo1snb9Iq4lr63J8pb2fZmyQIKKNGgjSgvy260XOQyEbSR47Ex3bO5EuqV3R05UbKm
	HKCQjcb3liPaYF+CZHiA6bDqmMKYQO7hnkjim4WkZBkQXw3B8CSjZLIMuhg9SN/DLHrDfntGNwKZS
	hSszG5HsMx+JyPRtBO0Vr7JNAm2LqESjUnJtBJLufdWFk+lOk0NQsoBIQ00tQ/Dspzcfk9xZfk9Wk
	tSLFJJttqHPQIrF0vvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pULby-006i0n-Jq; Tue, 21 Feb 2023 05:54:46 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pULbv-006i02-GO
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 05:54:45 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-536c02eea4dso36225547b3.4
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 21:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKGj+xv4pnpjzxheaocCFzGNsSoHlHMPoKqxiA/28oQ=;
        b=Wrcoo/GSnOe5mCzRiZ6/3szvx5wT+s10fqZJCl6ef1q5s58EAtSKXNFdYZVZ5hMdsT
         S55cmjS6se6zJegcFZv6z2w25p9OswIkcQbd14OgUUCycmtT9MPtaIZWRk0We0ca7Vnx
         9h0zVR9Xf7lKY5K61k/A5oiOGsF4bDN0LLm1R+06e8ilN4DTwEKSbYaVAuaS1M25MlRB
         5lccXBWM3XyyFKaT8n3/WwYe24fejhnKy+Q0twGjdpfNQolxo5Strm/k0LPfjP1zifPj
         T34moa9882W6EJ20YpfC3WsoNlQ8Wc/HOI6rn2aYfaT5G2+xAcZALqE+eH6hH10tTLEB
         eoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKGj+xv4pnpjzxheaocCFzGNsSoHlHMPoKqxiA/28oQ=;
        b=DwpeW509wVOWFKmIiYTWB0aqbN/66quvwE/O5Gwp/3dwtvzgKXYRCBuaJhHOvIkCli
         /xf/cZ5zzlh4PmDrAV911oLEuyhDsvYcBB1XTvwQEpyP9Te64B5lXPOSXBjUrCHBoz7K
         VHwGo40fzk2GlFVlIJumySGgAYHHlsY9asKF7B8vMtKRVpc22F649heGWb76Yfx+2ovK
         +AriQsqrYvqlwHx0B0tTmDfLlegYeMyyHQ/4rMqOMDwwdzixzbTNQrsT37f41wvwl6i2
         x+R3yJpnpNtM1y4whsotvlcQc5ZMDyJO3pI/BZpj8vNyhb+ucWriKyLbv7/fH8ZXMggx
         p0Pg==
X-Gm-Message-State: AO0yUKUDvrBIvCcJS3sbJTJE7DWEunfhZe8oXevYBQEXcQ1kmHip7/I3
	3j0/9G+TEBeTTD6oafDTHVAsKzmMCU0QDqi17qn73w==
X-Google-Smtp-Source: AK7set9MzBIUkg55oEqbfr3musYCTrXO/xQ5+x4ZGdYrY0pF1B2s0V7v0kWCjZ/rivtWol15XxWbTjtUWPZ6irbBh6Q=
X-Received: by 2002:a81:b723:0:b0:536:38b4:f50 with SMTP id
 v35-20020a81b723000000b0053638b40f50mr350484ywh.1.1676958880647; Mon, 20 Feb
 2023 21:54:40 -0800 (PST)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
 <20230130101707.pdvabl3na2wpwxqu@pengutronix.de> <CAHh=Yk85NHbm9eUKLm75GUP4gSP5eYFjVabTUXseyB6wHD4D=Q@mail.gmail.com>
In-Reply-To: <CAHh=Yk85NHbm9eUKLm75GUP4gSP5eYFjVabTUXseyB6wHD4D=Q@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 21 Feb 2023 13:54:29 +0800
Message-ID: <CAHh=Yk-ejA5W=G2Z7L3pVZzUt6DCF+6moJSc4rg0OQWO2fLXZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, 
	emil.renner.berthing@canonical.com, geert+renesas@glider.be, heiko@sntech.de, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_215443_654969_70D78FD8 
X-CRM114-Status: GOOD (  29.88  )
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

SGkgVXdlLAoKTnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPiDmlrwgMjAyM+W5tDLm
nIgz5pelIOmAseS6lCDkuIvljYg0OjA25a+r6YGT77yaCj4KPiBIaSBVd2UsCj4KPiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiDmlrwgMjAyM+W5tDHm
nIgzMOaXpSDpgLHkuIAg5LiL5Y2INjoxN+Wvq+mBk++8mgo+ID4KPiA+IE9uIE1vbiwgSmFuIDMw
LCAyMDIzIGF0IDA1OjMyOjI5UE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiA+IFRoZSBg
ZnJhY2AgdmFyaWFibGUgcmVwcmVzZW50cyB0aGUgcHVsc2UgaW5hY3RpdmUgdGltZSwgYW5kIHRo
ZSByZXN1bHQgb2YKPiA+ID4gdGhpcyBhbGdvcml0aG0gaXMgdGhlIHB1bHNlIGFjdGl2ZSB0aW1l
LiBUaGVyZWZvcmUsIHdlIG11c3QgcmV2ZXJzZSB0aGUKPiA+ID4gcmVzdWx0Lgo+ID4gPgo+ID4g
PiBUaGUgcmVmZXJlbmNlIGlzIFNpRml2ZSBGVTc0MC1DMDAwIE1hbnVhbFswXS4KPiA+ID4KPiA+
ID4gWzBdOiBodHRwczovL3NpZml2ZS5jZG4ucHJpc21pYy5pby9zaWZpdmUvMWE4MmU2MDAtMWY5
My00ZjQxLWIyZDgtODZlZDhiMTZhY2JhX2Z1NzQwLWMwMDAtbWFudWFsLXYxcDYucGRmCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4K
PiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCAxICsKPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gPiA+IGlu
ZGV4IDYyYjZhY2M2MzczZC4uYTVlZGExNjVkMDcxIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJz
L3B3bS9wd20tc2lmaXZlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4g
PiA+IEBAIC0xNTgsNiArMTU4LDcgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX2FwcGx5KHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiA+ID4gICAgICAgZnJh
YyA9IERJVjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4gPiA+ICAg
ICAgIC8qIFRoZSBoYXJkd2FyZSBjYW5ub3QgZ2VuZXJhdGUgYSAxMDAlIGR1dHkgY3ljbGUgKi8K
PiA+ID4gICAgICAgZnJhYyA9IG1pbihmcmFjLCAoMVUgPDwgUFdNX1NJRklWRV9DTVBXSURUSCkg
LSAxKTsKPiA+ID4gKyAgICAgZnJhYyA9ICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJRFRIKSAtIDEg
LSBmcmFjOwo+ID4KPiA+IFRoZSBzYW1lIHByb2JsZW0gZXhpc3RzIGluIHB3bV9zaWZpdmVfZ2V0
X3N0YXRlKCksIGRvZXNuJ3QgaXQ/Cj4gPgo+ID4gQXMgZml4aW5nIHRoaXMgaXMgYW4gaW50ZXJy
dXB0aXZlIGNoYW5nZSBhbnlob3csIHRoaXMgaXMgdGhlIG9wcG9ydHVuaXR5Cj4gPiB0byBhbGln
biB0aGUgZHJpdmVyIHRvIHRoZSBydWxlcyB0ZXN0ZWQgYnkgUFdNX0RFQlVHLgo+ID4KPiA+IFRo
ZSBwcm9ibGVtcyBJIHNlZSBpbiB0aGUgZHJpdmVyIChvbmx5IGNoZWNrZWQgcXVpY2tseSwgc28g
SSBtaWdodCBiZQo+ID4gd3JvbmcpOgo+ID4KPgo+ID4gIC0gc3RhdGUtPnBlcmlvZCAhPSBkZGF0
YS0+YXBwcm94X3BlcmlvZCBpc24ndCBuZWNlc3NhcmlseSBhIHByb2JsZW0uIElmCj4gPiAgICBz
dGF0ZS0+cGVyaW9kID4gZGRhdGEtPnJlYWxfcGVyaW9kIHRoYXQncyBmaW5lIGFuZCB0aGUgZHJp
dmVyIHNob3VsZAo+ID4gICAgY29udGludWUKPiA+Cj4gPiAgLSBmcmFjID0gRElWNjRfVTY0X1JP
VU5EX0NMT1NFU1QobnVtLCBzdGF0ZS0+cGVyaW9kKTsKPiA+ICAgIGlzIHdyb25nIGZvciB0d28g
cmVhc29uczoKPiA+ICAgIGl0IHNob3VsZCByb3VuZCBkb3duIGFuZCB1c2UgdGhlIHJlYWwgcGVy
aW9kLgpJIGhhdmUgc29tZSByZXN1bHRzIGZyb20gbXkgb2JzZXJ2YXRpb25zIHJlZ2FyZGluZyB0
aGUgcXVlc3Rpb25zIHlvdSByYWlzZWQuCgpJIGRvbid0IGtub3cgaWYgd2hhdCB3ZSBhcmUgdGhp
bmtpbmcgaXMgdGhlIHNhbWUgdGhpbmcuCgpJZiBteSBhc3N1bXB0aW9ucyBhcmUgZGlmZmVyZW50
IGZyb20geW91cnMsIHBsZWFzZSBsZXQgbWUga25vdy4gVGhhbmtzLgo+IGFyZSB5b3UgbWVhbiBz
dGF0ZS0+cGVyaW9kIGlzIGEgcmVkdW5kYW5jeSB2YXJpYWJsZSBzbyB3ZSBjYW4gdXNlCj4gZGRh
dGEtPnJlYWxfcGVyaW9kIGRpcmVjdGx5Pwo+Cj4gaXQgc2VlbXMgcmVhc29uYWJsZSwgYnV0IEkg
ZG9uJ3QgZ2V0IHlvdXIgcG9pbnQsIHdoeSBkbyB3ZSBuZWVkIHRvCj4gY2hhbmdlIHRoZSBhbGdv
cml0aG0gdG8gRElWX1JPVU5EX0RPV05fVUxMKCkgYW5kIGNoYW5nZSB0aGUgaWYtZWxzZQo+IGNv
bmRpdGlvbi4KPgo+IGZyYWMgPSBESVZfUk9VTkRfRE9XTl9VTEwobnVtLCBkZGF0YS0+cmVhbF9w
ZXJpb2QpOwo+IGlmIChzdGF0ZS0+cGVyaW9kIDwgZGRhdGEtPmFwcHJveF9wZXJpb2QpIHsKPiAg
ICAgLi4uCj4gfQo+Cj4gPgo+ID4gQmVzdCByZWdhcmRzCj4gPiBVd2UKPiA+Cj4gPiAtLQo+ID4g
UGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgVXdlIEtsZWluZS1L
w7ZuaWcgICAgICAgICAgICB8Cj4gPiBJbmR1c3RyaWFsIExpbnV4IFNvbHV0aW9ucyAgICAgICAg
ICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZS8gfAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
