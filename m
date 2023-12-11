Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA956C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWqgzOQQkVFETzSlPFDgfK34+0tgmjRfROv3fX4lWO8=; b=kT3cN8gM0/ipUJ
	+melnFMjilt6+wYRVY50Xf9I/xOW0bylFfoofbAwuO4ADYvU5w5ThXg48NLs1jfmejm5oIac3rr3z
	sB5qARZqbIhcdx82ghsI4eQkU8tTut+fi62V5cYkbYqKALozC2uJVbkKOgW8RqYVtCOzfJWH3POte
	nWDqjarxZ+MxZmT3EGTk8lqvLDnz2Dcdzfm1KHn6j33yK3dqdsAVXlyYX0swq0iwe6UL9CZd+LkPC
	C0HuWAWjaJtkhmS/TxRm2EMuMclnaajFVeteTtPSTfmV+oyqWTQE0Tupf8/ZTZo5fKfirrt+M/fuZ
	3xT5ZouSsOG+355WQrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkI7-006RYf-32;
	Mon, 11 Dec 2023 17:42:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCkI3-006RVC-2g
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:42:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6860BCE122C
	for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 17:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F18C4339A
	for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702316515;
	bh=8vM15B5r9GNLZ5/wggwUsDIktWh+Yq5/KSnQ542rzvk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UWFa33Wd4t2HkTUGAkTpn+A6NzBeeFc4fe9rcDJoCyhhQRNVUM/eSa+M2fkK8Yqu7
	 DIBP1GZc5DTx6AOfluEFI/vtXyutWzwp3kymkpvN5GSA2/OfvxcSN3UVll+gFpunK+
	 FNNkqI6239iRikxnHd6wFmPmUljKgFzoP1+xDDkvAt0O0JhdH1mkOHft6hlkecxmhS
	 AFsoFRhkNhoEFkgxtHP/6ieTW0hXv2oBVClt/Z/025aCrBBLARIz69tKtRjjMiZ9RF
	 72ChJGfP2B04IErZzCK7Z9kvnBv0VUzW4D7H/RtVowNXmNjWDAUbL56+Tf/8aVfVTw
	 E5ewHTum5mSHw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso6213144e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 09:41:55 -0800 (PST)
X-Gm-Message-State: AOJu0YyCGwW912xNIqtKjQwsuvM+EcRndZ19Xiw7Vz1/JXC4CClZiB7x
	MVYEWU62u///u/m+jFvn+31oL2bFXl/ZlEptJQ==
X-Google-Smtp-Source: AGHT+IGxQnoA+/JEx+duCxFB5wBYjC/Jw3X65IDZroxZABhYROnfRkji/JxBD23zzR7v3xP1TnCWppY+JbqUshsuMGk=
X-Received: by 2002:ac2:52ab:0:b0:50b:e109:bed1 with SMTP id
 r11-20020ac252ab000000b0050be109bed1mr2055001lfm.112.1702316513477; Mon, 11
 Dec 2023 09:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20231208094209.1910934-1-william.qiu@starfivetech.com> <20231208094209.1910934-3-william.qiu@starfivetech.com>
In-Reply-To: <20231208094209.1910934-3-william.qiu@starfivetech.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Dec 2023 11:41:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK8fsAocOu3OBdz1kzNiApf1J0Uc0spn8gfdJaVnomFHQ@mail.gmail.com>
Message-ID: <CAL_JsqK8fsAocOu3OBdz1kzNiApf1J0Uc0spn8gfdJaVnomFHQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] pwm: opencores: Add PWM driver support
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_094200_256557_F6C6550E 
X-CRM114-Status: GOOD (  20.17  )
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

T24gRnJpLCBEZWMgOCwgMjAyMyBhdCAzOjQy4oCvQU0gV2lsbGlhbSBRaXUgPHdpbGxpYW0ucWl1
QHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIGRyaXZlciBmb3IgT3BlbkNvcmVzIFBX
TSBDb250cm9sbGVyLiBBbmQgYWRkIGNvbXBhdGliaWxpdHkgY29kZQo+IHdoaWNoIGJhc2VkIG9u
IFN0YXJGaXZlIFNvQy4KPgo+IENvLWRldmVsb3BlZC1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0
YXJmaXZldGVjaC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJm
aXZldGVjaC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBRaXUgPHdpbGxpYW0ucWl1QHN0
YXJmaXZldGVjaC5jb20+Cj4gLS0tCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICB8ICAgNyAr
Kwo+ICBkcml2ZXJzL3B3bS9LY29uZmlnICAgICAgfCAgMTIgKysKPiAgZHJpdmVycy9wd20vTWFr
ZWZpbGUgICAgIHwgICAxICsKPiAgZHJpdmVycy9wd20vcHdtLW9jb3Jlcy5jIHwgMjI5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDI0
OSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3B3bS9wd20tb2Nv
cmVzLmMKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXgg
Nzg4YmU5YWI1YjczLi43YTExYTIyZGEwOWUgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiAr
KysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xNjIwNCw2ICsxNjIwNCwxMyBAQCBGOiAgICAgRG9jdW1l
bnRhdGlvbi9pMmMvYnVzc2VzL2kyYy1vY29yZXMucnN0Cj4gIEY6ICAgICBkcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW9jb3Jlcy5jCj4gIEY6ICAgICBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEv
aTJjLW9jb3Jlcy5oCj4KPiArT1BFTkNPUkVTIFBXTSBEUklWRVIKPiArTTogICAgIFdpbGxpYW0g
UWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2ZXRlY2guY29tPgo+ICtNOiAgICAgSGFsIEZlbmcgPGhh
bC5mZW5nQHN0YXJmaXZldGVjaC5jb20+Cj4gK1M6ICAgICBTdXBwb3J0ZWQKPiArRjogICAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vb3BlbmNvcmVzLHB3bS55YW1sCj4g
K0Y6ICAgICBkcml2ZXJzL3B3bS9wd20tb2NvcmVzLmMKPiArCj4gIE9QRU5SSVNDIEFSQ0hJVEVD
VFVSRQo+ICBNOiAgICAgSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+ICBNOiAgICAg
U3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZpPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9LY29uZmlnIGIvZHJpdmVycy9wd20vS2NvbmZpZwo+
IGluZGV4IDRiOTU2ZDY2MTc1NS4uZDg3ZTFiYjM1MGJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
cHdtL0tjb25maWcKPiArKysgYi9kcml2ZXJzL3B3bS9LY29uZmlnCj4gQEAgLTQ0NCw2ICs0NDQs
MTggQEAgY29uZmlnIFBXTV9OVFhFQwo+ICAgICAgICAgICBjb250cm9sbGVyIGZvdW5kIGluIGNl
cnRhaW4gZS1ib29rIHJlYWRlcnMgZGVzaWduZWQgYnkgdGhlIG9yaWdpbmFsCj4gICAgICAgICAg
IGRlc2lnbiBtYW51ZmFjdHVyZXIgTmV0cm9uaXguCj4KPiArY29uZmlnIFBXTV9PQ09SRVMKPiAr
ICAgICAgIHRyaXN0YXRlICJPcGVuQ29yZXMgUFdNIHN1cHBvcnQiCj4gKyAgICAgICBkZXBlbmRz
IG9uIEhBU19JT01FTSAmJiBPRgo+ICsgICAgICAgZGVwZW5kcyBvbiBDT01NT05fQ0xLICYmIFJF
U0VUX0NPTlRST0xMRVIKPiArICAgICAgIGRlcGVuZHMgb24gQVJDSF9TVEFSRklWRSB8fCBDT01Q
SUxFX1RFU1QKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgSWYgeW91IHNheSB5ZXMgdG8gdGhp
cyBvcHRpb24sIHN1cHBvcnQgd2lsbCBiZSBpbmNsdWRlZCBmb3IgdGhlCj4gKyAgICAgICAgIE9w
ZW5Db3JlcyBQV00uIEZvciBkZXRhaWxzIHNlZSBodHRwczovL29wZW5jb3Jlcy5vcmcvcHJvamVj
dHMvcHRjLgo+ICsKPiArICAgICAgICAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBhIG1vZHVs
ZSwgY2hvb3NlIE0gaGVyZTogdGhlIG1vZHVsZQo+ICsgICAgICAgICB3aWxsIGJlIGNhbGxlZCBw
d20tb2NvcmVzLgo+ICsKPiAgY29uZmlnIFBXTV9PTUFQX0RNVElNRVIKPiAgICAgICAgIHRyaXN0
YXRlICJPTUFQIER1YWwtTW9kZSBUaW1lciBQV00gc3VwcG9ydCIKPiAgICAgICAgIGRlcGVuZHMg
b24gT0YKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vTWFrZWZpbGUgYi9kcml2ZXJzL3B3bS9N
YWtlZmlsZQo+IGluZGV4IGM1ZWM5ZTE2OGVlNy4uNTE3YzRmNjQzMDU4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvcHdtL01ha2VmaWxlCj4gKysrIGIvZHJpdmVycy9wd20vTWFrZWZpbGUKPiBAQCAt
NDAsNiArNDAsNyBAQCBvYmotJChDT05GSUdfUFdNX01JQ1JPQ0hJUF9DT1JFKSAgICAgICs9IHB3
bS1taWNyb2NoaXAtY29yZS5vCj4gIG9iai0kKENPTkZJR19QV01fTVRLX0RJU1ApICAgICArPSBw
d20tbXRrLWRpc3Aubwo+ICBvYmotJChDT05GSUdfUFdNX01YUykgICAgICAgICAgKz0gcHdtLW14
cy5vCj4gIG9iai0kKENPTkZJR19QV01fTlRYRUMpICAgICAgICAgICAgICAgICs9IHB3bS1udHhl
Yy5vCj4gK29iai0kKENPTkZJR19QV01fT0NPUkVTKSAgICAgICArPSBwd20tb2NvcmVzLm8KPiAg
b2JqLSQoQ09ORklHX1BXTV9PTUFQX0RNVElNRVIpICs9IHB3bS1vbWFwLWRtdGltZXIubwo+ICBv
YmotJChDT05GSUdfUFdNX1BDQTk2ODUpICAgICAgKz0gcHdtLXBjYTk2ODUubwo+ICBvYmotJChD
T05GSUdfUFdNX1BYQSkgICAgICAgICAgKz0gcHdtLXB4YS5vCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcHdtL3B3bS1vY29yZXMuYyBiL2RyaXZlcnMvcHdtL3B3bS1vY29yZXMuYwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi45OTZjYTM4MDU5MDEKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvZHJpdmVycy9wd20vcHdtLW9jb3Jlcy5jCj4gQEAgLTAsMCArMSwyMjkg
QEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArLyoKPiArICogT3Bl
bkNvcmVzIFBXTSBEcml2ZXIKPiArICoKPiArICogaHR0cHM6Ly9vcGVuY29yZXMub3JnL3Byb2pl
Y3RzL3B0Ywo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTgtMjAyMyBTdGFyRml2ZSBUZWNo
bm9sb2d5IENvLiwgTHRkLgo+ICsgKgo+ICsgKiBMaW1pdGF0aW9uczoKPiArICogLSBUaGUgaGFy
ZHdhcmUgb25seSBkbyBpbnZlcnRlZCBwb2xhcml0eS4KPiArICogLSBUaGUgaGFyZHdhcmUgbWlu
aW11bSBwZXJpb2QgLyBkdXR5X2N5Y2xlIGlzICgxIC8gcHdtX2FwYiBjbG9jayBmcmVxdWVuY3kp
IG5zLgo+ICsgKiAtIFRoZSBoYXJkd2FyZSBtYXhpbXVtIHBlcmlvZCAvIGR1dHlfY3ljbGUgaXMg
KFUzMl9NQVggLyBwd21fYXBiIGNsb2NrIGZyZXF1ZW5jeSkgbnMuCj4gKyAqLwo+ICsKPiArI2lu
Y2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiArI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L29mX2RldmljZS5oPgoKWW91IHByb2JhYmx5IGRvbid0IG5lZWQgdGhpcyBoZWFkZXIgYW5k
IHRoZSBpbXBsaWNpdCBpbmNsdWRlcyBpdCBtYWtlcwphcmUgZHJvcHBlZCBub3cgaW4gbGludXgt
bmV4dC4gUGxlYXNlIGNoZWNrIHdoYXQgeW91IGFjdHVhbGx5IG5lZWQgYW5kCm1ha2UgdGhlbSBl
eHBsaWNpdC4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
