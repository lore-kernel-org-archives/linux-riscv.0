Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFFAC47077
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 03:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66yEyZxIRVo/mNnhq8jkYVa8nYImS4tzbpFPefgXyoE=; b=x5idsQmiG9LUlp
	WVHqY34bqDtebhHbKZg1KK3CwCM7bQwGqrnW23Jc5zJt7aiuKXsmVj4IRmtHOfjYes6jO+T41Nifj
	99chPQdYHUNUOs3QX4UMIXca511SQ8G2EWPXvIJzOKSDANSBz6kwjFH1JPvgUz/WaRC6bueBgR/0+
	qIQqVLyRbOd6SvAAf/YMVtFnmyGJD5QH2Dn3nQAZHliOVIbiK4UhmNyJP2Ef6i7Zt68ZBGLp29SO4
	dgrzc9jtdroIk/jzH04EuN3Zrhf1oaZppnngfwYgTGaNicBvzMGgpIp0I+jeSZxDfRwZGXu3n+6OY
	G4uCz54SPx00ybD98xOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPwZ0-00EJjQ-0v;
	Wed, 17 Jan 2024 03:26:02 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPwYw-00EJiR-1q
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 03:26:00 +0000
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-59505514213so4692870eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 19:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705461894; x=1706066694; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrR0tHpidkGB05XRXnhTobUQZ0agqDLMMD3A5T7XObQ=;
        b=MoL0EnXk5IBc13a56WCjEDvZTbO0bySUtMs6fYmiA+kb/hG/bu4o9eNkJFlzwOMVpH
         vuu6EtGST3VWZa9rKteDxB0P0hnlKBLVqbBx3GpTF5l0vzHnV6NyEJC6xngDMQIXHRu8
         ImAOQebLE11H9h5LQ/H1GB+nEQrIEcKjGHO8z4MvWQqtvRIJgg1Qr2YtePcJzxNZ0oFR
         ayVjSy/mNkbJjxT7fFIDEJaYgJhJVRsyDLXHk6DE5kI0nM9JfTCnOnmxx+SgeG+oHrtI
         oItBpBTiSazhfIINeFU2issyQ7wjQf3vN5wEAjJ/YtF2ditDIQpmb78yjsUA4qX0l3t6
         v7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705461894; x=1706066694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrR0tHpidkGB05XRXnhTobUQZ0agqDLMMD3A5T7XObQ=;
        b=h5tDas4izbnqXDV8AXauwEXgcBXP5GE/jCB89OAIls1LX2twiiapv4QlsDZXeUHG9S
         oR1lUZumhx+tWfKqCWnD2x3QtL2cesurAzGPnArgZpYBtqtUVZ0dNN6UDaQmx7qx00sJ
         ieAoYcZUO1oIuN+FF2+YLHzz0hl/XzweSAvhtHMB+4Med9MUsxLaggqIjaWHGclWk2cv
         9JS6Q5uNffXXv+RcJ/dbGNPUhOhhKQPhBYRwG02cngK5qCb1vWYW2NdBFfANJk9I8/C7
         SGycqf2eQ2oZJMM9pJxcTwxjCL27bRB1mkYSTxxRWDRlfMPGJjlvSMpiC7SoRlr4d7/L
         TqTA==
X-Gm-Message-State: AOJu0YwpTxP1q93lFxMFt3aiHpRCfjRqbm2VLuyJP0qA5vMpTTeSsesP
	0GH5/ILas5csBB1WhwQo1mMP9Pwwri3POwLk+OE5UiwOEiJ6Vp9XPr0qGdBdjM1j5xv3Br6vOGC
	Xmvenh5eyPalh8EjU3pZFGXEzc5U=
X-Google-Smtp-Source: AGHT+IHe61Kn+9uVBZYc7hWtmFOSFgviXZksDl/J4M/jJGlzviJV374++J1MEUvTailaIMHtaCZo+nTHk0X5WxMaD/o=
X-Received: by 2002:a05:6820:2a15:b0:599:27c8:d7f9 with SMTP id
 dr21-20020a0568202a1500b0059927c8d7f9mr76965oob.8.1705461893991; Tue, 16 Jan
 2024 19:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com> <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org> <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org> <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
 <f99da95d-a6ab-4646-8ad8-8245e275639e@linaro.org>
In-Reply-To: <f99da95d-a6ab-4646-8ad8-8245e275639e@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 17 Jan 2024 11:24:43 +0800
Message-ID: <CAJRtX8Qxvpf_CTJG41U6JC3_qLL9raFxX3LD0LoPNhve=MDyFA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_192558_612356_9FF1C818 
X-CRM114-Status: GOOD (  41.08  )
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

T24gV2VkLCBKYW4gMTcsIDIwMjQgYXQgMTI6NTjigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gMTYvMDEvMjAyNCAx
NzoyOSwgSmluZ2JhbyBRaXUgd3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAxNywgMjAyNCBhdCAxMjow
M+KAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPiA+IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFy
by5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTYvMDEvMjAyNCAxNjo1MSwgSmluZ2JhbyBRaXUg
d3JvdGU6Cj4gPj4+Pj4gQ1YxODAwIGlzIGEgUklTQ1YgYmFzZWQgU09DIHRoYXQgaW5jbHVkZXMg
YW4gUlRDIG1vZHVsZS4gVGhlIFJUQwo+ID4+Pj4+IG1vZHVsZSBoYXMgYW4gT1NDIG9zY2lsbGF0
b3IKPiA+Pj4+Cj4gPj4+Pgo+ID4+Pj4gSSBhbSBub3QgZ29pbmcgdG8gcmVhZCBwYWdlcyBvZiBk
ZXNjcmlwdGlvbi4gUGxlYXNlIHdyaXRlIGNvbmNpc2UgcmVwbGllcy4KPiA+Pj4KPiA+Pj4gVGhh
bmtzLCBXaGF0IEkgbWVhbiBpcyB0aGF0IHRoaXMgaGFyZHdhcmUgaW5jbHVkZXMgdHdvIGZ1bmN0
aW9ucywgUlRDCj4gPj4+IGFuZCBQT1IuIEhvdyBzaG91bGQgSSBkZXNjcmliZSB0aGVpciByZWxh
dGlvbnNoaXA/Cj4gPj4KPiA+PiBZb3VyIFBPUiBkb2VzIG5vdCBuZWVkIHRvIHRha2UgYW55IHJl
c291cmNlcywgc28gbm8gbmVlZCB0byBkZXNjcmliZSBhbnkKPiA+PiByZWxhdGlvbnNoaXAuCj4g
Pj4KPiA+PiAuLi4KPiA+Pgo+ID4+Pj4+IFlvdXIgc3VnZ2VzdGlvbiBpcywgZmlyc3RseSwgdGhl
IHBvciBzdWJtb2R1bGUgZG9lcyBub3QgaGF2ZSBhbnkKPiA+Pj4+PiByZXNvdXJjZXMsIHNvIGl0
IHNob3VsZCBiZSBkZWxldGVkLgo+ID4+Pj4KPiA+Pj4+IFNvIHdoZXJlIGRpZCB5b3UgZGVsZXRl
IGl0PyBJIHN0aWxsIHNlZSBpdCBpbiB0aGlzIHBhdGNoLgo+ID4+Pgo+ID4+PiBTaG91bGQgSSBj
b21wbGV0ZWx5IGRlbGV0ZSBoaW0/IEhvdyBjYW4gYSBwb3IgZHJpdmVyIG9idGFpbiBkZXZpY2Ug
aW5mb3JtYXRpb24/Cj4gPj4KPiA+PiBEZWxldGUgY29tcGxldGVseS4KPiA+Pgo+ID4+IERldmlj
ZSBpbmZvcm1hdGlvbj8gV2hhdCBpcyB0aGlzPyBXZSBhbHJlYWR5IGFncmVlZCB5b3UgZG9uJ3Qg
aGF2ZSBhbnkKPiA+PiByZXNvdXJjZXMgZm9yIFBPUi4KPiA+Pgo+ID4+IC4uLi4KPiA+Pgo+ID4+
Pj4gRGV2aWNlIGlzIG9ubHkgb25lIHRoaW5nLCBub3QgdHdvLgo+ID4+Pj4KPiA+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgIHJlZyA9IDwweDUwMjUwMDAgMHgyMDAwPjsKPiA+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gPj4+
Pj4gICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm9zYz47Cj4gPj4+Pj4gfTsKPiA+Pj4+
PiBIb3dldmVyLCBpbiByZWFsaXR5LCB0aGUgUE9SIHN1Ym1vZHVsZSBkb2VzIG5vdCB1c2UgSVJR
IGFuZCBDTEsuCj4gPj4+Pj4gUGxlYXNlIGRvIG5vdCBoZXNpdGF0ZSB0byB0ZWFjaC4gVGhhbmtz
Lgo+ID4+Pj4KPiA+Pj4+IEkgZXhwZWN0IG9uZSBkZXZpY2Ugbm9kZS4gSG93IG1hbnkgZHJpdmVy
cyB5b3UgaGF2ZSBkb2VzIG5vdCBtYXR0ZXI6IHlvdQo+ID4+Pj4gY2FuIGluc3RhbnRpYXRlIDEw
MCBMaW51eCBkZXZpY2VzIGluIDEwMCBMaW51eCBkZXZpY2UgZHJpdmVycy4KPiA+Pj4KPiA+Pj4g
SSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uIEEgZGV2aWNlIG5vZGUgY29ycmVzcG9uZHMgdG8g
bXVsdGlwbGUgZHJpdmVycy4KPiA+Pj4gU2hvdWxkIEkgY29tcGxldGVseSBkZWxldGUgdGhlIFBP
UiBkZXZpY2UgdHJlZSBub2RlIGFuZCBhZGQgaXQgd2hlbgo+ID4+PiBzdWJtaXR0aW5nIHRoZSBQ
T1IgZHJpdmVyPwo+ID4+Cj4gPj4gPyBJIHdyb3RlIGl0IGluIHByZXZpb3VzIG1lc3NhZ2VzIGFu
ZCB0d2ljZSBpbiB0aGlzIHRocmVhZC4gQ29tcGxldGVseQo+ID4+IGRlbGV0ZS4gWW91IGRvIG5v
dCBhZGQgaXQgYmFjayEgQmVjYXVzZSBpZiB5b3UgZXZlciBpbnRlbmRlZCB0byBhZGQgaXQKPiA+
PiBiYWNrLCBpdCBzaG91bGQgYmUgYWRkZWQgc2luY2UgYmVnaW5uaW5nLiBJIGRvbid0IHVuZGVy
c3RhbmQgd2hhdAo+ID4+IHN1Ym1pdHRpbmcgbGF0ZXIgd291bGQgc29sdmUuCj4gPj4KPiA+Pj4g
SWYgdGhhdCdzIHRoZSBjYXNlLCBob3cgY2FuIEkgZXhwbGFpbiB0aGF0IHRoZSBydGMgZGV2aWNl
IHRyZWUgbm9kZQo+ID4+PiB1c2VzIHRoZSBzeXNjb24gdGFnPwo+ID4+PiBIb3cgY2FuIEkgZGVz
Y3JpYmUgYSBQT1IgZGV2aWNlIGluIERUUz8gUE9SIGlzIGEgc3VibW9kdWxlIG9mIFJUQywgYW5k
Cj4gPj4+IGl0IGFsc28gaGFzIGNvcnJlc3BvbmRpbmcgZHJpdmVycy4KPiA+Pgo+ID4+IEkgc2Fp
ZCwgdGhlcmUgaXMgbm8gbmVlZCBmb3IgUE9SIGluIERUUywgYmVjYXVzZSB5b3UgaGF2ZSBub3Ro
aW5nIHRoZXJlLgo+ID4+IFdoeSBkbyB5b3UgaW5zaXN0IG9uIHB1dHRpbmcgaXQgb24gRFRTPwo+
ID4+Cj4gPj4+IEl0J3MganVzdCB0aGF0IGhpcyByZXNvdXJjZXMgYXJlIG9ubHkgc2hhcmVkIHdp
dGggUlRDJ3MgUmVnLgo+ID4+Cj4gPj4gV2hhdCByZXNvdXJjZXM/IFJlZz8gVGhhdCdzIG5vdCBh
IHNlcGFyYXRlIHJlc291cmNlLgo+Cj4gSSBtZWFudCwgc2VwYXJhdGUgZnJvbSB0aGUgUlRDLiBJ
IGhhZCBpbXByZXNzaW9uIHRoYXQgSU8gc3BhY2UgaXMgc2hhcmVkCj4gb3IgbWl4ZWQgd2l0aCBS
VEM/IElmIGl0IGlzIHNlcGFyYXRlLCB3aHkgaXQgd2Fzbid0IGxpc3RlZD8KPgo+ID4KPiA+IEkn
bSB2ZXJ5IHNvcnJ5IGFib3V0IHRoaXMuCj4gPiBCdXQgSSBmb3VuZCBhIGJpbmRpbmcgZmlsZSB0
aGF0IG9ubHkgY29udGFpbnMgUmVnIGFuZCBDb21wYXRpYmxlLgo+ID4KPiA+IHJ0Y0A4MDkyMDAw
MCB7Cj4gPiBjb21wYXRpYmxlID0gImNpcnJ1cyxlcDkzMDEtcnRjIjsKPiA+IHJlZyA9IDwweDgw
OTIwMDAwIDB4MTAwPjsKPiA+IH07Cj4gPgo+ID4gTGluazogRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3J0Yy9jaXJydXMsZXA5MzAxLXJ0Yy55YW1sCj4KPiBBbmQ/Cj4KPiA+Cj4g
Pj4KPiA+PiBUbyBzdW1tYXJpemU6IERyb3AgUE9SIGZyb20gRFRTIGFuZCBuZXZlciBicmluZyBp
dCBiYWNrLCB1bmxlc3MgeW91IGNvbWUKPiA+PiB3aXRoIHNvbWUgZGlmZmVyZW50IGFyZ3VtZW50
cywgd2hpY2ggeW91IGRpZCBub3Qgc2F5IGFscmVhZHkuCj4gPj4KPiA+Cj4gPiBZb3UgYXJlIHJp
Z2h0LCBpZiB0aGVyZSBpcyBubyBwb3IgZGV2aWNlIHRyZWUgbm9kZSwgaG93IGNhbiB0aGUgcG9y
Cj4gPiBkcml2ZXIgb2J0YWluIHRoZSBSZWc/Cj4KPiBUaGUgc2FtZSBhcyBjdXJyZW50bHkuIERv
ZXMgeW91ciBQT1Igbm9kZSBoYXMgcmVnPyBObywgc28gYWNjb3JkaW5nIHRvCj4geW91ciBsb2dp
YyBpdCBjYW5ub3Qgb2J0YWluIGFkZHJlc3Mgc3BhY2UuCj4KPiBDaGlsZHJlbiBMaW51eCBkZXZp
Y2VzIHNoYXJlIHJlZ21hcCB3aXRoIHBhcmVudCBkZXZpY2UuCj4KClRoYW5rcywgUG93ZXItT24t
UmVzZXQvUE9SIGRyaXZlciByZXF1aXJlcyBSZWcgdG8gY29tcGxldGUgaXRzIGZ1bmN0aW9ucy4K
VGhlIGNvbXBhdGlibGUgb2YgUE9SIGlzIHJlcXVpcmVkIGluIERUUyB0byBsb2FkIHRoZSBjb3Jy
ZXNwb25kaW5nIGRyaXZlci4KVGhlIFBPUiBkcml2ZXIgd2FzIG5vdCBzdWJtaXR0ZWQgaW4gdGhl
IHBhdGNoLiBIb3dldmVyLCB0aGlzIHBhdGNoIHJlcXVpcmVzCnRoZSBhZGRpdGlvbiBvZiBSVEMg
aW4gRFRTLiBDb25zaWRlcmluZyB0aGUgZnV0dXJlIGFkZGl0aW9uIG9mIFBPUgpkcml2ZXIsIEkg
YWRkZWQgYSBQT1Igbm9kZS4KSSdtIG5vdCBzdXJlIHdoeSB0aGUgUE9SIG5vZGUgbmVlZHMgdG8g
YmUgZGVsZXRlZCwganVzdCBiZWNhdXNlIGl0Cm9ubHkgaGFzIHRoZSBjb21wYXRpYmxlIGF0dHJp
YnV0ZT8KT3IgbWF5YmUgaXQncyBiZWNhdXNlIEkgZGlkbid0IHN1Ym1pdCB0aGUgUE9SIGRyaXZl
ciwgc28gSSBuZWVkIHRvCmRlbGV0ZSB0aGUgUE9SIG5vZGUuCkkgZm91bmQgYW4gZXhhbXBsZS4K
CnN0OiB0aW1lckBmZmZmZmQwMCB7CiAgICBjb21wYXRpYmxlID0gImF0bWVsLGF0OTFybTkyMDAt
c3QiLCAic3lzY29uIiwgInNpbXBsZS1tZmQiOwogICAgcmVnID0gPDB4ZmZmZmZkMDAgMHgxMDA+
OwogICAgaW50ZXJydXB0cyA9IDwxIElSUV9UWVBFX0xFVkVMX0hJR0ggNz47CiAgICBjbG9ja3Mg
PSA8JnNsb3dfeHRhbD47CiAgICB3YXRjaGRvZyB7CiAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWws
YXQ5MXJtOTIwMC13ZHQiOwogICAgfTsKfTsKCkxpbms6YXJjaC9hcm0vYm9vdC9kdHMvbWljcm9j
aGlwL2F0OTFybTkyMDAuZHRzaToxMTQKCkxpa2UgdGhpcywgd2hlbiB0aGUgcG9yIGRyaXZlciBp
bnNtb2QgaXMgYWN0aXZhdGVkLCB0aGUgcG9yIGRyaXZlciBjYW4Kb2J0YWluIHRoZSByZWdzIG9m
IHRoZSBwYXJlbnQgZGV2aWNlLgpUaGFuayB5b3UgYWdhaW4uCgpCZXN0IHJlZ2FyZHMsCkppbmdi
YW8gUWl1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
