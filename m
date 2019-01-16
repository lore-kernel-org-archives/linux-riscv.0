Return-Path: <SRS0=8WcR=PY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E27C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 09:22:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FD32082F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 09:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZsxnzNG4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YcJGeMgy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2FD32082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LMfaz14BrqwV7FwmG64jHjUaQ4hlliPpHPzpJFUS4Q=; b=ZsxnzNG417/Q/A
	nm7U4sfwTbKwq0HtX+7HHpjBiewIHrY0SGR9B5cY0X9KxtsoSGA1XhNuNsbn/5DtSHX4wB2WNS1Hc
	kfUmIGPJ3p4PxO2VV3zFTN9BBu/g/GvDrNt3Nov2qEJR8grbL1zC7P75CBPkJTeUGTM910i81j33o
	8XnTGwfHYCIgZbNXDqnl5UdhWZOd37DtwJ+bs/ODQ6MnmkGOv9Fz8xVjKJw5NoM8s2iPvFwgDnFCz
	cQhACybZWYtnwZfct81G/t1Viw0uBpsa2ANdagLuapXYiwgGGMTuzNfeiD+K63lXSbfsWRUQ02HGt
	W3a3cqUVKNx1tYPOjs6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjhOn-0006ds-G1; Wed, 16 Jan 2019 09:22:13 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjhOk-0006dL-Pb
 for linux-riscv@lists.infradead.org; Wed, 16 Jan 2019 09:22:12 +0000
Received: by mail-lj1-x244.google.com with SMTP id s5-v6so4774491ljd.12
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jan 2019 01:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dIWRftyT8CqF38UDX+izuWLKuJcEJZYvAAotx/d6iZA=;
 b=YcJGeMgypIJdNln8H3bZCv5lDf9Fjup2vcdrOoiHJly2JU+bp1bj5sXBnwXI1kdhh9
 FGWNeBJ0Df3eYc3hED8KV4cDPe/bGRRyFc5F/Pl8grFwPH+0eGUGpC+9MM7ooUgzGj1P
 dm7uAmjj62+AlS5xzbHnM26N0iPP0lrWoVh8yWZglzgtfiF6W7XYby+qjyaonWvBmmZU
 0hCjhg45DiDIBsYzLEsIGy4GJXE2jgC9hThmvNjEZX4n4Fi9oBM3SLPjZ+VxM9F+tKBm
 Zmw5KY4KREpLWZO9gHiZUytUg0xYTXOw0X6lbEluKCNPpr96m6Czqctv6YL1T6fsrZPi
 bC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dIWRftyT8CqF38UDX+izuWLKuJcEJZYvAAotx/d6iZA=;
 b=WfcH6amdZVHYnko7dThAHO3POMYxsjf3dKQ70Q2cnQ2P0gIbciVENO9Pakefvlgg6i
 MTafHD7vCrE5DCRLyDRW14pATvj7oViGRWZeLCh81M2USriNdHtKZTXUHTEyo+LHF5FE
 Kz6MwNhU39OVYaAGN+1MXy7xYRV/PNUseecUfN79r3WLOMs2ToVElPrmRj0ymtPM+S+d
 jFoo0eo8o4TDNNebxUa7RhiGqXuP4fT5q/xwzxKTisGxEXmnBC37ZooLRwFxRzImlTJt
 C9xmIJqmY5sZHnfVFYoAjOvtyrysr/KbxkS8mcnVkLLFzoFyjYdXTr7bM3eqgy2ShSYx
 +Otg==
X-Gm-Message-State: AJcUukcbsgxKlWxry7c301couQ1DKQh2sSgaTBDD43YFU+FTXW0r1Nom
 ICOLUdWFoT0/QjARdrmStiMgGPhmN7SvToHnKdsNSA==
X-Google-Smtp-Source: ALg8bN4d8kFmxVEeFLFHrGaY96LCZJwIIesbaEKAMAme5TKExewN0aJpuLDEof97tH+dpKePqMoE8B6O3LxO2Ji7gSI=
X-Received: by 2002:a2e:1603:: with SMTP id w3-v6mr5882456ljd.33.1547630527947; 
 Wed, 16 Jan 2019 01:22:07 -0800 (PST)
MIME-Version: 1.0
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-2-git-send-email-yash.shah@sifive.com>
 <20190115201149.ghddnf27s5kqephc@pengutronix.de>
In-Reply-To: <20190115201149.ghddnf27s5kqephc@pengutronix.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Wed, 16 Jan 2019 14:51:31 +0530
Message-ID: <CAJ2_jOGPpwsn=+OU3QcHtGYJ3MFYh9azdALSeWz3-WPXL9vHnw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_012210_855346_02CCD087 
X-CRM114-Status: GOOD (  20.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMTo0MSBBTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gdGhpcyBpcyB2
MywgcmlnaHQ/IEl0IGlzIGhlbHBmdWwgdG8gcG9pbnQgdGhpcyBvdXQgdG8gZWFzZSByZXZpZXdp
bmcuCgpZZXMsIGl0IGlzIHYzLiBXaWxsIHRha2UgY2FyZSBvZiB0aGlzIGluIHY0LgoKPgo+IE9u
IEZyaSwgSmFuIDExLCAyMDE5IGF0IDAxOjUyOjQzUE0gKzA1MzAsIFlhc2ggU2hhaCB3cm90ZToK
PiA+IERUIGRvY3VtZW50YXRpb24gZm9yIFBXTSBjb250cm9sbGVyIGFkZGVkIHdpdGggdXBkYXRl
ZCBjb21wYXRpYmxlCj4gPiBzdHJpbmcuCj4KPiBOb3Qgc3VyZSB3aGF0IHdhcyB1cGRhdGVkIGhl
cmUuIEJ1dCBhc3N1bWluZyB0aGlzIGlzIGNvbXBhcmVkIHRvIHYyIHRoaXMKPiBpcyBub3QgYSBo
ZWxwZnVsIGluZm8gaW4gdGhlIGNvbW1pdCBsb2cuCgpPaywgd2lsbCByZW1vdmUgdGhlICd1cGRh
dGVkIGNvbXBhdGlibGUgc3RyaW5nJyBwYXJ0LgoKPgo+ID4gU2lnbmVkLW9mZi1ieTogV2VzbGV5
IFcuIFRlcnBzdHJhIDx3ZXNsZXlAc2lmaXZlLmNvbT4KPiA+IFtBdGlzaDogQ29tcGF0aWJsZSBz
dHJpbmcgdXBkYXRlXQo+ID4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QHdkYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYXNoIFNoYWggPHlhc2guc2hhaEBzaWZpdmUu
Y29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1zaWZpdmUu
dHh0ICAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDM3IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tc2lmaXZlLnR4dAo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3B3bS1zaWZpdmUudHh0
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9wd20tc2lmaXZlLnR4dAo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAuLmUwZmMyMmEKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
d20vcHdtLXNpZml2ZS50eHQKPiA+IEBAIC0wLDAgKzEsMzcgQEAKPiA+ICtTaUZpdmUgUFdNIGNv
bnRyb2xsZXIKPiA+ICsKPiA+ICtVbmxpa2UgbW9zdCBvdGhlciBQV00gY29udHJvbGxlcnMsIHRo
ZSBTaUZpdmUgUFdNIGNvbnRyb2xsZXIgY3VycmVudGx5IG9ubHkKPiA+ICtzdXBwb3J0cyBvbmUg
cGVyaW9kIGZvciBhbGwgY2hhbm5lbHMgaW4gdGhlIFBXTS4gVGhpcyBpcyBzZXQgZ2xvYmFsbHkg
aW4gRFRTLgo+ID4gK1RoZSBwZXJpb2QgYWxzbyBoYXMgc2lnbmlmaWNhbnQgcmVzdHJpY3Rpb25z
IG9uIHRoZSB2YWx1ZXMgaXQgY2FuIGFjaGlldmUsCj4gPiArd2hpY2ggdGhlIGRyaXZlciByb3Vu
ZHMgdG8gdGhlIG5lYXJlc3QgYWNoaWV2YWJsZSBmcmVxdWVuY3kuCj4gPiArCj4gPiArUmVxdWly
ZWQgcHJvcGVydGllczoKPiA+ICstIGNvbXBhdGlibGU6IFBsZWFzZSByZWZlciB0byBzaWZpdmUt
YmxvY2tzLWlwLXZlcnNpb25pbmcudHh0Cj4KPiBXaGlsZSB0aGUgZGVzY3JpcHRpb24gd2FzIHRv
byB2ZXJib3NlIGluIHYyLCB0aGlzIGlzIHRvbyBzaG9ydC4gWW91Cj4gc2hvdWxkIGF0IGxlYXN0
IG1lbnRpb24gc29tZXRoaW5nIGxpa2UgInNpZml2ZSxwd21YIiBhbmQKPiAic2lmaXZlLCRjcHVu
YW1lLXB3bSIgKG9yIGhvdyBldmVyIHRoYXQgc2NoZW1lIHdvcmtzKS4KCldpbGwgbWVudGlvbiB0
aGUgYWJvdmUuCgo+Cj4gPiArLSByZWc6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3Ro
IG9mIHRoZSBjb250cm9sbGVyJ3MgcmVnaXN0ZXJzCj4gPiArLSBjbG9ja3M6IFNob3VsZCBjb250
YWluIGEgY2xvY2sgaWRlbnRpZmllciBmb3IgdGhlIFBXTSdzIHBhcmVudCBjbG9jay4KPiA+ICst
ICNwd20tY2VsbHM6IFNob3VsZCBiZSAyLgo+ID4gKyAgVGhlIGZpcnN0IGNlbGwgaXMgdGhlIFBX
TSBjaGFubmVsIG51bWJlcgo+ID4gKyAgVGhlIHNlY29uZCBjZWxsIGlzIHRoZSBQV00gcG9sYXJp
dHkKPgo+IEknZCBkcm9wIHRoZXNlIHR3byBsaW5lcyBhbmQgcmVmZXIgdG8gYmluZGluZ3MvcHdt
L3B3bS50eHQgaW5zdGVhZC4KCldpbGwgYmUgZG9uZS4KCj4KPiA+ICstIHNpZml2ZSxhcHByb3gt
cGVyaW9kLW5zOiB0aGUgZHJpdmVyIHdpbGwgZ2V0IGFzIGNsb3NlIHRvIHRoaXMgcGVyaW9kIGFz
IGl0IGNhbgo+Cj4gQXMgYWxyZWFkeSBzYWlkIGZvciB2MjogSSdkIGRyb3AgImFwcHJveC0iLgoK
U3VyZSwgd2lsbCBiZSBkb25lLgoKPgo+ID4gKy0gaW50ZXJydXB0czogb25lIGludGVycnVwdCBw
ZXIgUFdNIGNoYW5uZWwKPiA+ICsKPiA+ICtQV00gUlRMIHRoYXQgY29ycmVzcG9uZHMgdG8gdGhl
IElQIGJsb2NrIHZlcnNpb24gbnVtYmVycyBjYW4gYmUgZm91bmQKPiA+ICtoZXJlOgo+ID4gKwo+
ID4gK2h0dHBzOi8vZ2l0aHViLmNvbS9zaWZpdmUvc2lmaXZlLWJsb2Nrcy90cmVlL21hc3Rlci9z
cmMvbWFpbi9zY2FsYS9kZXZpY2VzL3B3bQo+ID4gKwo+ID4gK0Z1cnRoZXIgaW5mb3JtYXRpb24g
b24gdGhlIGZvcm1hdCBvZiB0aGUgSVAKPiA+ICtibG9jay1zcGVjaWZpYyB2ZXJzaW9uIG51bWJl
cnMgY2FuIGJlIGZvdW5kIGluCj4gPiArRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NpZml2ZS9zaWZpdmUtYmxvY2tzLWlwLXZlcnNpb25pbmcudHh0Cj4gPiArCj4gPiArRXhhbXBs
ZXM6Cj4gPiArCj4gPiArcHdtOiAgcHdtQDEwMDIwMDAwIHsKPiA+ICsgICAgIGNvbXBhdGlibGUg
PSAic2lmaXZlLGZ1NTQwLWMwMDAtcHdtIiwic2lmaXZlLHB3bTAiOwo+ID4gKyAgICAgcmVnID0g
PDB4MCAweDEwMDIwMDAwIDB4MCAweDEwMDA+Owo+ID4gKyAgICAgY2xvY2tzID0gPCZ0bGNsaz47
Cj4gPiArICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZwbGljPjsKPiA+ICsgICAgIGludGVycnVw
dHMgPSA8NDIgNDMgNDQgNDU+Owo+ID4gKyAgICAgI3B3bS1jZWxscyA9IDwyPjsKPiA+ICsgICAg
IHNpZml2ZSxhcHByb3gtcGVyaW9kLW5zID0gPDEwMDAwMDA+Owo+ID4gK307Cj4gPiAtLQo+ID4g
MS45LjEKPiA+Cj4gPgo+Cj4gLS0KPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExp
bnV4IFNvbHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4LmRl
LyAgfAoKVGhhbmtzIGZvciB0aGUgY29tbWVudHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
