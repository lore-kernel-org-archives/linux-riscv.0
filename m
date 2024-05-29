Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE496C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxhImqNVH7TSHkFS2WFlEZKcD7kNDEgYgaIP2vDjpg4=; b=Nm4hPrH2psun2F
	uKfVpIuimfVws7eDu2X7PWVATgxpw7/ILd33JkhYwGPNk1jmCMebk3V3rG1BhYStRz8S3mLbX15g6
	c1kGXcUzC0psqSWlp770PvN02FBV0VVDwBNPrB3fypHPMBc4LZkwvTMyNSnictSHJ07KYkcX5D4sV
	MSkzkp8GWVrXOyZdtu6+gK7MIxV/rr/Iwg3hzIUjmt1bKxe+km/KQFQIQaxKGiA2867mYyOxiZazB
	nN8SSvrDN1tLhnKLa5AQUqOXpK0sWRKg5PIEWioGEem5x2oIaThE0BOhuXlc8V6B+PNgAv2l+XWOD
	oyFVc30HV9TmtXT0pTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCGMV-00000003mG0-1O3c;
	Wed, 29 May 2024 10:16:51 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCGMQ-00000003mD1-49J2
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 10:16:49 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52449b7aa2bso2239000e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716977805; x=1717582605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaPEJ9XT+XQdecfVTDIRiBCYJgWPcXhInCwaGbIaH5Q=;
        b=HmdH4tPlr+lGKQJR8W1RmsxQtj02Gf5Ef5imS0gWzBG8N4thjo3yOJ6O1VVO0Ta2va
         iRZitU3BanWAM1EMzInG91WYStTyW63tIoehDVusNnEiR7C4khHlhYQqil8rFWdThz1Q
         DPNaQxBQJdQ0H+RvSk4RZnLR8c1Gf56AuEa+QoS3BCbRsaQ6Pv6sEipkeHFzE04FHHp2
         T7VuvOBJlmqv/oWre59LllDE1nZieLzYXdbYqAwYmbap8Lxp6mQPoQNz6UEgo2UNgY9K
         42lMKsCu8eYhCIkEOmf5ny4CqffAhn9WkRjRz9U4Ph43cGxomPrseaKV1hUCtUPW0BXA
         RcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977805; x=1717582605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaPEJ9XT+XQdecfVTDIRiBCYJgWPcXhInCwaGbIaH5Q=;
        b=j71nD2Fs9neTGWBLbwRmEO0lUwh8nOvd4LiIVkrWlpcGs1fzBw/80iR2zOvnjWG5O2
         wC80ikyNLOwZpgMnTxXMkY6xJMw2W1ou6xK+P0pkVzpvo0CcqlAnc2QEEDxQI8v5xqiN
         lBkbyURCGM2Bqkd3k1UbfCUralQyqLMOBz8hk6j185otVtGev1LJWz0qxV4x0Nn00cZF
         KJemOfATCpa0sDdw/ftlc72augYNfLF9x748Ic9O6KqwyHih4Cp9rWPWRKTfLHg4dsSo
         pXpXvB20XHADkYj/pzOmK5h7wfOsWd2c6xQJE4auL7dzk5z1lXrKv0t1zGaVaW5RBs2i
         8XGg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ208uLF9RXdQAHZLyuuJji94FkY2CA5PYxIgGnP5W0Ivubc4LjsmDzheEVIb5D6lG8boPFvzvBFUr9OdgWnc9C5SCoBaCxVKvetQKaB5Q
X-Gm-Message-State: AOJu0Yw1AefJjVSuyzRTie0D0rsHUKtUa1buKJN9wtFQwd67n9vc8LKE
	dVRsJmJanv10sJKIMZfTQ5/fO2YHqPYxITVdM/5tizQ5j/tdUrBiCp/xDbK4SLezvbcUKRZdP7U
	QVPma67OiWkV5ZR1pnScvKbYO39jGGoU4lHk7GA==
X-Google-Smtp-Source: AGHT+IFjlF4scChU5GhsGTCGWx0HUlFf8bcUPTz9KUoDmhB1jEA3ctAItCfx3gyXfIj95PO9n6qyZGe0pIzFYBeUEgQ=
X-Received: by 2002:a2e:7c08:0:b0:2e3:7f19:7072 with SMTP id
 38308e7fff4ca-2e95b1dc4damr91784301fa.28.1716977804566; Wed, 29 May 2024
 03:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240528164132.2451685-1-maz@kernel.org> <CAK9=C2XNPJP0X=pg5TSrQbsuouDD3jP-gy2Sm4BXNJp0ZiWp+A@mail.gmail.com>
 <86bk4pm8j1.wl-maz@kernel.org>
In-Reply-To: <86bk4pm8j1.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 29 May 2024 15:46:30 +0530
Message-ID: <CAK9=C2XRx==OTPoGW_AHmjq4Th0bv4okwcq6-3L5JYwHwQp97A@mail.gmail.com>
Subject: Re: [PATCH] of: property: Fix fw_devlink handling of interrupt-map
To: Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_031647_079658_D5D30457 
X-CRM114-Status: GOOD (  40.92  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTI6MDPigK9QTSBNYXJjIFp5bmdpZXIgPG1hekBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgMjkgTWF5IDIwMjQgMDY6MTU6NTIgKzAxMDAsCj4g
QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1
ZSwgTWF5IDI4LCAyMDI0IGF0IDEwOjEx4oCvUE0gTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IENvbW1pdCBkOTc2YzZmNGIzMmMgKCJvZjogcHJvcGVydHk6
IEFkZCBmd19kZXZsaW5rIHN1cHBvcnQgZm9yCj4gPiA+IGludGVycnVwdC1tYXAgcHJvcGVydHki
KSB0cmllZCB0byBkbyB3aGF0IGl0IHNheXMgb24gdGhlIHRpbiwKPiA+ID4gYnV0IGZhaWxlZCBv
biBhIGNvdXBsZSBvZiBwb2ludHM6Cj4gPiA+Cj4gPiA+IC0gaXQgY29uZnVzZXMgYnl0ZXMgYW5k
IGNlbGxzLiBOb3QgYSBodWdlIGRlYWwsIGV4Y2VwdCB3aGVuIGl0Cj4gPiA+ICAgY29tZXMgdG8g
cG9pbnRlciBhcml0aG1ldGljCj4gPiA+Cj4gPiA+IC0gaXQgZG9lc24ndCByZWFsbHkgaGFuZGxl
IGFueXRoaW5nIGJ1dCBpbnRlcnJ1cHQtbWFwcyB0aGF0IGhhdmUKPiA+ID4gICB0aGVpciBwYXJl
bnQgI2FkZHJlc3MtY2VsbHMgc2V0IHRvIDAKPiA+ID4KPiA+ID4gVGhlIGNvbWJpbmF0aW9ucyBv
ZiB0aGUgdHdvIGxlYWRzIHRvIHNvbWUgc2VyaW91cyBmdW4gb24gbXkgTTEKPiA+ID4gYm94LCB3
aXRoIHBsZW50eSBvZiBXQVJOLU9OKCkgZmlyaW5nIGFsbCBvdmVyIHRoZSBzaG9wLCBhbmQKPiA+
ID4gYW11c2luZyB2YWx1ZXMgYmVpbmcgZ2VuZXJhdGVkIGZvciBpbnRlcnJ1cHQgc3BlY2lmaWVy
cy4KPiA+ID4KPiA+ID4gQWRkcmVzcyBib3RoIGlzc3VlcyBzbyB0aGF0IEkgY2FuIGJvb3QgbXkg
bWFjaGluZXMgYWdhaW4uCj4gPiA+Cj4gPiA+IEZpeGVzOiBkOTc2YzZmNGIzMmMgKCJvZjogcHJv
cGVydHk6IEFkZCBmd19kZXZsaW5rIHN1cHBvcnQgZm9yIGludGVycnVwdC1tYXAgcHJvcGVydHki
KQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPgo+ID4g
PiBDYzogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+IENjOiBTYXJh
dmFuYSBLYW5uYW4gPHNhcmF2YW5ha0Bnb29nbGUuY29tPgo+ID4gPiBDYzogUm9iIEhlcnJpbmcg
KEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSBmaXggcGF0Y2gg
YnV0IHVuZm9ydHVuYXRlbHkgaXQgYnJlYWtzIGZvciBSSVNDLVYuCj4gPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvb2YvcHJvcGVydHkuYyB8IDE2ICsrKysrKysrKysrKysrLS0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9wcm9wZXJ0eS5jIGIvZHJpdmVycy9vZi9wcm9wZXJ0
eS5jCj4gPiA+IGluZGV4IDFjODNlNjhmODA1Yi4uOWFkZWJjNjNiZWE5IDEwMDY0NAo+ID4gPiAt
LS0gYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+ID4gKysrIGIvZHJpdmVycy9vZi9wcm9wZXJ0
eS5jCj4gPiA+IEBAIC0xMzIyLDcgKzEzMjIsMTMgQEAgc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqcGFyc2VfaW50ZXJydXB0X21hcChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+ID4gPiAgICAg
ICAgIGFkZHJjZWxscyA9IG9mX2J1c19uX2FkZHJfY2VsbHMobnApOwo+ID4gPgo+ID4gPiAgICAg
ICAgIGltYXAgPSBvZl9nZXRfcHJvcGVydHkobnAsICJpbnRlcnJ1cHQtbWFwIiwgJmltYXBsZW4p
Owo+ID4gPiAtICAgICAgIGlmICghaW1hcCB8fCBpbWFwbGVuIDw9IChhZGRyY2VsbHMgKyBpbnRj
ZWxscykpCj4gPiA+ICsgICAgICAgaW1hcGxlbiAvPSBzaXplb2YoKmltYXApOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgLyoKPiA+ID4gKyAgICAgICAgKiBDaGVjayB0aGF0IHdlIGhhdmUgZW5vdWdo
IHJ1bndheSBmb3IgdGhlIGNoaWxkIHVuaXQgaW50ZXJydXB0Cj4gPiA+ICsgICAgICAgICogc3Bl
Y2lmaWVyIGFuZCBhIHBoYW5kbGUuIFRoYXQncyB0aGUgYmFyZSBtaW5pbXVtIHdlIGNhbiBleHBl
Y3QuCj4gPiA+ICsgICAgICAgICovCj4gPiA+ICsgICAgICAgaWYgKCFpbWFwIHx8IGltYXBsZW4g
PD0gKGFkZHJjZWxscyArIGludGNlbGxzICsgMSkpCj4gPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gTlVMTDsKPiA+ID4gICAgICAgICBpbWFwX2VuZCA9IGltYXAgKyBpbWFwbGVuOwo+ID4gPgo+
ID4gPiBAQCAtMTM0Niw4ICsxMzUyLDE0IEBAIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBh
cnNlX2ludGVycnVwdF9tYXAoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+ID4gICAgICAgICAg
ICAgICAgIGlmICghaW5kZXgpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBz
dXBfYXJncy5ucDsKPiA+ID4KPiA+ID4gLSAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHN1cF9h
cmdzLm5wKTsKPiA+ID4gKyAgICAgICAgICAgICAgIC8qCj4gPiA+ICsgICAgICAgICAgICAgICAg
KiBBY2NvdW50IGZvciB0aGUgZnVsbCBwYXJlbnQgdW5pdCBpbnRlcnJ1cHQgc3BlY2lmaWVyCj4g
PiA+ICsgICAgICAgICAgICAgICAgKiAoYWRkcmVzcyBjZWxscywgaW50ZXJydXB0IGNlbGxzLCBh
bmQgcGhhbmRsZSkuCj4gPiA+ICsgICAgICAgICAgICAgICAgKi8KPiA+ID4gKyAgICAgICAgICAg
ICAgIGltYXAgKz0gb2ZfYnVzX25fYWRkcl9jZWxscyhzdXBfYXJncy5ucCk7Cj4gPgo+ID4gVGhp
cyBicmVha3MgZm9yIFJJU0MtViBiZWNhdXNlIHdlIGRvbid0IGhhdmUgIiNhZGRyZXNzLWNlbGxz
Igo+ID4gcHJvcGVydHkgaW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgRFQgbm9kZSBhbmQgb2ZfYnVz
X25fYWRkcl9jZWxscygpCj4gPiByZXRyaWV2ZXMgIiNhZGRyZXNzLWNlbGxzIiBmcm9tIHRoZSBw
YXJlbnQgb2YgaW50ZXJydXB0IGNvbnRyb2xsZXIuCj4KPiBUaGF0J3MgYSBmZWF0dXJlLCBub3Qg
YSBidWcuICNhZGRyZXNzLWNlbGxzLCBBRkFJQ1QsIGFwcGxpZXMgdG8gYWxsCj4gY2hpbGQgbm9k
ZXMgdW50aWwgeW91IHNldCBpdCBvdGhlcndpc2UuCj4KPiA+Cj4gPiBUaGUgb2ZfaXJxX3BhcnNl
X3JhdygpIGxvb2tzIGZvciAiI2FkZHJlc3MtY2VsbHMiIHByb3BlcnR5Cj4gPiBpbiB0aGUgaW50
ZXJydXB0IGNvbnRyb2xsZXIgRFQgbm9kZSBvbmx5IHNvIHdlIHNob3VsZCBkbyBhCj4gPiBzaW1p
bGFyIHRoaW5nIGhlcmUgYXMgd2VsbC4KPgo+IFRoaXMgbG9va3MgbW9yZSBsaWtlIGEgb2ZfaXJx
X3BhcnNlX3JhdygpIGJ1ZyB0aGFuIGFueXRoaW5nIGVsc2UuCgpJZiB3ZSBjaGFuZ2Ugb2ZfaXJx
X3BhcnNlX3JhdygpIHRvIHVzZSBvZl9idXNfbl9hZGRyX2NlbGxzKCkKdGhlbiBpdCB3b3VsZCBz
dGlsbCBicmVhayBmb3IgUklTQy1WLgoKVXNpbmcgb2ZfYnVzX25fYWRkcl9jZWxscygpIG92ZXIg
aGVyZSBmb3JjZXMgaW50ZXJydXB0IGNvbnRyb2xsZXIKRFQgbm9kZXMgdG8gaGF2ZSBhICIjYWRk
cmVzcy1jZWxscyIgRFQgcHJvcGVydHkuIFRoZXJlIGFyZSBtYW55CmludGVycnVwdCBjb250cm9s
bGVyIChlLmcuIFJJU0MtViBQTElDIG9yIFJJU0MtViBBUExJQykgd2hlcmUgdGhlCkRUIGJpbmRp
bmdzIGRvbid0IHJlcXVpcmUgIiNhZGRyZXNzLWNlbGxzIiBEVCBwcm9wZXJ0eSBhbmQgZXhpc3Rp
bmcKRFRTIGZpbGVzIHdpdGggc3VjaCBpbnRlcnJ1cHQgY29udHJvbGxlcnMgZG9uJ3QgaGF2ZSBp
dCBlaXRoZXIuCgpJbiB0aGUgUklTQy1WIHdvcmxkLCB0aGVyZSBoYXZlIGJlZW4gcXVpdGUgYSBm
ZXcgUUVNVSByZWxlYXNlcwp3aGVyZSB0aGUgZ2VuZXJhdGVkIERUIG5vZGUgb2YgdGhlIGludGVy
cnVwdCBjb250cm9sbGVyIGRvZXMgbm90CmhhdmUgdGhlICIjYWRkcmVzcy1jZWxscyIgcHJvcGVy
dHkuIFRoaXMgcGF0Y2ggYnJlYWtzIHRoZSBrZXJuZWwKZm9yIGFsbCBzdWNoIFFFTVUgcmVsZWFz
ZXMuCgpJIHRoaW5rIHdlIHNob3VsZCBhbGlnbiB0aGUgaW1wbGVtZW50YXRpb24gaW4gcGFyc2Vf
aW50ZXJydXB0X21hcCgpCndpdGggb2ZfaXJxX3BhcnNlX3JhdygpIGFuZCB1c2Ugb2ZfcHJvcGVy
dHlfcmVhZF91MzIoKSBpbnN0ZWFkIG9mCm9mX2J1c19uX2FkZHJfY2VsbHMoKS4KClJlZ2FyZHMs
CkFudXAKCj4KPiA+Cj4gPiBUaGUgYmVsb3cgY2hhbmdlIG9uIHRvcCBvZiB0aGlzIHBhdGNoIHdv
cmtlZCBmb3IgbWUuCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYyBi
L2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gaW5kZXggOWFkZWJjNjNiZWE5Li5mNTRkYTI5ODll
YTkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+ICsrKyBiL2RyaXZl
cnMvb2YvcHJvcGVydHkuYwo+ID4gQEAgLTEzMDgsNyArMTMwOCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
ZGV2aWNlX25vZGUKPiA+ICpwYXJzZV9pbnRlcnJ1cHRfbWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsCj4gPiAgewo+ID4gICAgICBjb25zdCBfX2JlMzIgKmltYXAsICppbWFwX2VuZCwgKmFkZHI7
Cj4gPiAgICAgIHN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mgc3VwX2FyZ3M7Cj4gPiAtICAgIHUzMiBh
ZGRyY2VsbHMsIGludGNlbGxzOwo+ID4gKyAgICB1MzIgYWRkcmNlbGxzLCBpbnRjZWxscywgcGFk
ZHJjZWxsczsKPiA+ICAgICAgaW50IGksIGltYXBsZW47Cj4gPgo+ID4gICAgICBpZiAoIUlTX0VO
QUJMRUQoQ09ORklHX09GX0lSUSkpCj4gPiBAQCAtMTM1Niw3ICsxMzU2LDggQEAgc3RhdGljIHN0
cnVjdCBkZXZpY2Vfbm9kZQo+ID4gKnBhcnNlX2ludGVycnVwdF9tYXAoc3RydWN0IGRldmljZV9u
b2RlICpucCwKPiA+ICAgICAgICAgICAqIEFjY291bnQgZm9yIHRoZSBmdWxsIHBhcmVudCB1bml0
IGludGVycnVwdCBzcGVjaWZpZXIKPiA+ICAgICAgICAgICAqIChhZGRyZXNzIGNlbGxzLCBpbnRl
cnJ1cHQgY2VsbHMsIGFuZCBwaGFuZGxlKS4KPiA+ICAgICAgICAgICAqLwo+ID4gLSAgICAgICAg
aW1hcCArPSBvZl9idXNfbl9hZGRyX2NlbGxzKHN1cF9hcmdzLm5wKTsKPiA+ICsgICAgICAgIGlm
ICghb2ZfcHJvcGVydHlfcmVhZF91MzIoc3VwX2FyZ3MubnAsICIjYWRkcmVzcy1jZWxscyIsICZw
YWRkcmNlbGxzKSkKPiA+ICsgICAgICAgICAgICBpbWFwICs9IHBhZGRyY2VsbHM7Cj4KPiBUaGlz
IGxvb2tzIHdyb25nIHRvIG1lIGZvciB0aGUgcmVhc29uIEkgb3V0bGluZWQgYWJvdmU6IHlvdSBu
ZWVkIHRvCj4gbG9vayBmb3IgYSB2YWxpZCAjYWRkcmVzcy1jZWxscyBhbGwgYWxvbmcgdGhlIHBh
cmVudCBjaGFpbiwgbm90IGp1c3QKPiBpbiB0aGUgaW50ZXJydXB0LWNvbnRyb2xsZXIgbm9kZS4K
Pgo+ICAgICAgICAgTS4KPgo+IC0tCj4gV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9ybSwg
cHJvZ3Jlc3MgaXMgbm90IHBvc3NpYmxlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
