Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7996CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tvDpvkLshCH29H2kid0KKEcnvt/02/P0hHWeAdsivA=; b=beS6tXgMBcy2vi
	ApQC+e76M17NISVxniQey5ak7BRC8kQB1UVRc15WA/HSH0026u7tQictrZNI2lm+5X0Tch2KP8UzH
	LIB7rYTLADd5K9Mc4wPq+47xECcu9dKBlMK1zuux/VgrSD53DXkYDwqz8SMhd5TwZbgWZ/0CxUrRS
	xbKPVsaywy6/YYd/0G8EYJMNX1lAXSC3f+CEJ4ErqbAuQFx3erWhQg6DbvgX/CtLuyheyXJF4vIs8
	RgySf1ZY9HJPgyLyJBaGw2c+J8D/T1tB25pNZra4eaqxYGiOae9bCtBlxfEJihBgbkNNIgNGm/x54
	AORiKv+acgBV1fzTpmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVlC-000JAy-17;
	Thu, 19 Oct 2023 16:20:34 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtVl9-000JA6-02
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 16:20:32 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso90808681fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697732427; x=1698337227; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qrm2o2CouYl5YLE22rhN3Rv3HCs9/q81TyWZQXS7LNY=;
        b=KuzXyMfVDvUS0lQWfpymv280qrwKNbTYordSjtLCG5YGuOLMMYXB8sATD8/Aa/MUto
         7H3aIwHqfT7fll1Up1Z2Hk9s8Hw1QpEYB+UPVEpDDIhebSv4dPgdeRyYZAhjcI8vWwk+
         vK/n11xOijiU1R9ceaEa2d1xohbGLa/zz3cYY9UNngLq762Elt9VxrFeD9mkOp9UlHGQ
         cU8Jdw4S0+MSvtRw5AeozvkxZxoBQVDYB3penkcXxDVQBEQbVPlHk/1T5jscMIkYD0bh
         JeikRLeFpfQMCu3vECGG5fM1dd1R2Wraznv36/itFpV+ygF/MLVyMoCMihZzH5aT/RPF
         UvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697732427; x=1698337227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qrm2o2CouYl5YLE22rhN3Rv3HCs9/q81TyWZQXS7LNY=;
        b=Ed/embWOyULMMUJv/hTPvso7qFCKDO6BicsPAR+YYT2PcCSoGgUW6Szay2dWqR+Yh2
         /333zQ9qatQNcUCRI8Ft/047skb9OgbqLj71ShSSqQjmOEkE7VivVLJGyYQz/Rq753io
         rGQBSTtay4lFltj8jRFwyLUbMm2Un8mGSTwlW6NQtLHqj2dyGJgFd17UhdwbYHgTtpsY
         gqSeNHuHQyuFQ5kYsxixpWfyDDzQ9aQBUUN0EJHS/9lAucP4jnngaa+Soiw5tYpNBvJC
         8tDE/iy4FeYNj9u+k3/RJtdILbOPtnwdQp762KNvWu/tLwbCKReEWt+yHQfaRpZz4Sc3
         dTAg==
X-Gm-Message-State: AOJu0Yw8un7Ky63Fdz8TXDiaSmtw2XcDlZgOMpdlgCMEJJO+YBwHZObP
	3nNDeAXoL/g+gS3eLopl7zIQi0PifybBvc3q9zkD3w==
X-Google-Smtp-Source: AGHT+IFeGNG5q6szxOX/FPqL0Y3ufmTudG0k4yvHQ1DfND20U12w+mTgZpBmFwRnmFqy/K+L4mODOLYtPEbzy6qWDHo=
X-Received: by 2002:a2e:9d0c:0:b0:2bc:b557:cee9 with SMTP id
 t12-20020a2e9d0c000000b002bcb557cee9mr1761152lji.43.1697732426653; Thu, 19
 Oct 2023 09:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-6-cleger@rivosinc.com>
 <DA8B4610-D514-4733-B875-C247FFCCC7AA@sifive.com> <af785f0f-9de7-4548-9cdb-f392cde1cc2b@rivosinc.com>
 <CALs-HstEBt-ntCcETa9YwS6On3nGyoEc2p7R-gaBLG9+aFJL5w@mail.gmail.com>
 <7626f978-e9ea-4f8f-b814-aeac02bd3712@rivosinc.com> <20231019-nuclear-vista-ef3e0b9bef71@spud>
In-Reply-To: <20231019-nuclear-vista-ef3e0b9bef71@spud>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 19 Oct 2023 09:19:50 -0700
Message-ID: <CALs-HssWZyhnbo=ErH+LEfMi4m04i39Cw3PGXP1WhCFfSP8G=A@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] riscv: add ISA extension parsing for vector
 crypto extensions
To: Conor Dooley <conor@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jerry Shih <jerry.shih@sifive.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_092031_052810_DC0DF763 
X-CRM114-Status: GOOD (  37.74  )
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

T24gVGh1LCBPY3QgMTksIDIwMjMgYXQgODozM+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCAxMTozNTo1OUFNICsw
MjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPgo+ID4KPiA+IE9uIDE4LzEwLzIwMjMgMTk6
MjYsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+IE9uIFdlZCwgT2N0IDE4LCAyMDIzIGF0IDU6NTPi
gK9BTSBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPj4K
PiA+ID4+Cj4gPiA+Pgo+ID4gPj4gT24gMTgvMTAvMjAyMyAwMzo0NSwgSmVycnkgU2hpaCB3cm90
ZToKPiA+ID4+PiBPbiBPY3QgMTcsIDIwMjMsIGF0IDIxOjE0LCBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPj4+PiBAQCAtMjIxLDYgKzI2MSwyMiBAQCBj
b25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiA+ID4+
Pj4gICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3QsIFJJU0NWX0lTQV9FWFRfWktUKSwKPiA+
ID4+Pj4gICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3NlZCwgUklTQ1ZfSVNBX0VYVF9aS1NF
RCksCj4gPiA+Pj4+ICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemtzaCwgUklTQ1ZfSVNBX0VY
VF9aS1NIKSwKPiA+ID4+Pj4gKyAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJiLCBSSVNDVl9J
U0FfRVhUX1pWQkIpLAo+ID4gPj4+PiArICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJ
U0NWX0lTQV9FWFRfWlZCQyksCj4gPiA+Pj4+ICsgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoenZr
YiwgUklTQ1ZfSVNBX0VYVF9aVktCKSwKPiA+ID4+Pgo+ID4gPj4+IFRoZSBgWnZrYmAgaXMgdGhl
IHN1YnNldCBvZiBgWnZiYmBbMV0uIFNvLCB0aGUgYFp2a2JgIHNob3VsZCBiZSBidW5kbGVkIHdp
dGggYFp2YmJgLgo+ID4gPj4KPiA+ID4+IEhpIEplcnJ5LAo+ID4gPj4KPiA+ID4+IFRoYW5rcyBm
b3IgY2F0Y2hpbmcgdGhpcywgSSB0aGluayBzb21lIG90aGVyIGV4dGVuc2lvbnMgd2lsbCBmYWxs
IGluCj4gPiA+PiB0aGlzIGNhdGVnb3J5IGFzIHdlbGwgdGhlbiAoWnZrbmhhL1p2a25oYikuIEkg
d2lsbCB2ZXJpZnkgdGhhdC4KPiA+ID4KPiA+ID4gVGhlIGJ1bmRsaW5nIG1lY2hhbmlzbSB3b3Jr
cyB3ZWxsIHdoZW4gYW4gZXh0ZW5zaW9uIGlzIGEgcHVyZSBsYXNzbwo+ID4gPiBhcm91bmQgb3Ro
ZXIgZXh0ZW5zaW9ucy4gV2UnZCBoYXZlIHRvIHR3ZWFrIHRoYXQgY29kZSBpZiB3ZSB3YW50ZWQg
dG8KPiA+ID4gc3VwcG9ydCBjYXNlcyBsaWtlIHRoaXMsIHdoZXJlIHRoZSBleHRlbnNpb24gaXMg
YSBzdXBlcnNldCBvZiBvdGhlcnMsCj4gPiA+IGJ1dCBhbHNvIGNvbnRhaW5zIGxvb3NlIGNoYW5n
ZSBub3QgcHJlc2VudCBhbnl3aGVyZSBlbHNlIChhbmQKPiA+ID4gdGhlcmVmb3JlIGFsc28gbmVl
ZHMgdG8gc3RhbmQgYXMgYSBzZXBhcmF0ZSBiaXQpLgo+ID4KPiA+IEZvciBadmJiIGFuZCBadmtu
aGIsIEkgdXNlZCB0aGUgZm9sbG93aW5nIGNvZGU6Cj4gPgo+ID4gc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCByaXNjdl96dmJiX2J1bmRsZWRfZXh0c1tdID0gewo+ID4gICAgICAgUklTQ1ZfSVNB
X0VYVF9aVktCLAo+ID4gICAgICAgUklTQ1ZfSVNBX0VYVF9aVkJCCj4gPiB9Owo+ID4KPiA+IHN0
YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3ZfenZrbmhiX2J1bmRsZWRfZXh0c1tdID0gewo+
ID4gICAgICAgUklTQ1ZfSVNBX0VYVF9aVktOSEEsCj4gPiAgICAgICBSSVNDVl9JU0FfRVhUX1pW
S05IQgo+ID4gfTsKPiA+Cj4gPiBXaGljaCBjb3JyZWN0bHkgcmVzdWx0cyBpbiBib3RoIGV4dGVu
c2lvbiAoc3VwZXJzZXQgKyBiYXNlIHNldCkgYmVpbmcKPiA+IGVuYWJsZWQgd2hlbiBvbmx5IG9u
ZSBpcyBzZXQuIElzIHRoZXJlIHNvbWV0aGluZyB0aGF0IEknbSBtaXNzaW5nID8KPiA+Cj4gPiA+
Cj4gPiA+IElNTywgZGVjb21wb3NpbmcgInB1cmUiIGJ1bmRsZXMgbWFrZXMgc2Vuc2Ugc2luY2Ug
b3RoZXJ3aXNlIHVzZXJtb2RlCj4gPiA+IHdvdWxkIGhhdmUgdG8gcXVlcnkgbXVsdGlwbGUgZGlz
dGluY3QgYml0bWFwcyB0aGF0IG1lYW50IHRoZSBzYW1lCj4gPiA+IHRoaW5nIChlZyBjaGVjayB0
aGUgWmsgYml0LCBvciBtYXliZSBjaGVjayB0aGUgWmtuL1prci9aa3QgYml0cywgb3IKPiA+ID4g
bWF5YmUgY2hlY2sgdGhlIFpia2IvWmJrYy4uLiBiaXRzLCBhbmQgdGhleSdyZSBhbGwgZXF1aXZh
bGVudCkuIEJ1dAo+ID4gPiB3aGVuIGFuIGV4dGVuc2lvbiBpcyBhIHN1cGVyc2V0IHRoYXQgYWxz
byBjb250YWlucyBsb29zZSBjaGFuZ2UsIHRoZXJlCj4gPiA+IHJlYWxseSBhcmVuJ3QgdHdvIGVx
dWl2YWxlbnQgYml0bWFza3MsIGVhY2ggYml0IGFkZHMgc29tZXRoaW5nIG5ldy4KPiA+Cj4gPiBB
Z3JlZWQgYnV0IGlmIGEgc3lzdGVtIG9ubHkgcmVwb3J0IFpWQkIgZm9yIGluc3RhbmNlIGFuZCB0
aGUgdXNlciB3YW50cwo+ID4gWlZLQiwgdGhlbiBpdCBpcyBjbGVhciB0aGF0IFpWS0Igc2hvdWxk
IGJlIHJlcG9ydGVkIGFzIHdlbGwgSSBndWVzcy4gU28KPiA+IGluIHRoZSBlbmQsIGl0IHdvcmtz
IG11Y2ggbGlrZSAiYnVuZGxlIiBleHRlbnNpb24sIGp1c3QgdGhhdCB0aGUgYnVuZGxlCj4gPiBp
cyBhY3R1YWxseSBhICJyZWFsIiBJU0EgZXh0ZW5zaW9uIGJ5IGl0c2VsZi4KPiA+Cj4gPiBDbMOp
bWVudAo+ID4KPiA+ID4KPiA+ID4gVGhlcmUncyBhbiBhcmd1bWVudCB0byBiZSBtYWRlIGZvciBz
dGlsbCB0dXJuaW5nIG9uIHRoZSBjb250YWluaW5nCj4gPiA+IGV4dGVuc2lvbnMgdG8gY292ZXIg
Zm9yIHNpbGx5IElTQSBzdHJpbmdzIChlZyBJU0Egc3RyaW5ncyB0aGF0Cj4gPiA+IGFkdmVydGlz
ZSB0aGUgc3VwZXJzZXQgYnV0IGZhaWwgdG8gYWR2ZXJ0aXNlIHRoZSBjb250YWluaW5nCj4gPiA+
IGV4dGVuc2lvbnMpLiBXZSBjYW4gZGVjaWRlIGlmIHdlIHdhbnQgdG8gd29yayB0aGF0IGhhcmQg
dG8gY292ZXIKPiA+ID4gaHlwb3RoZXRpY2FsIGJyb2tlbiBJU0Egc3RyaW5ncyBub3csIG9yIHdh
aXQgdW50aWwgdGhleSBzaG93IHVwLgo+ID4gPiBQZXJzb25hbGx5IEkgd291bGQgd2FpdCB1bnRp
bCBzb21ldGhpbmcgYnJva2VuIHNob3dzIHVwLiBCdXQgb3RoZXJzCj4gPiA+IG1heSBmZWVsIGRp
ZmZlcmVudGx5Lgo+Cj4gSSdtIG5vdCByZWFsbHkgc3VyZSB0aGF0IHRob3NlIGFyZSAic2lsbHki
IElTQSBzdHJpbmdzLiBQZW9wbGUgYXJlIGdvaW5nCj4gdG8gZG8gaXQgdGhhdCB3YXkgYmVjYXVz
ZSBpdCBpcyBtdWNoIGVhc2llciB0aGFuIHNwZWxsaW5nIG91dCA1IGRvemVuCj4gc3ViLWNvbXBv
bmVudHMsIGFuZCBpdCBpcyBwcmV0dHkgaW5ldml0YWJsZSB0aGF0IHN1YnNldHMgd2lsbCBiZQo+
IGludHJvZHVjZWQgaW4gdGhlIGZ1dHVyZSBmb3IgZXh0ZW5zaW9ucyB3ZSBjdXJyZW50bHkgaGF2
ZS4KPgo+IElNTywgaXQncyBwZXJmZWN0bHkgdmFsaWQgdG8gc2F5IHlvdSBoYXZlIHRoZSBzdXBl
cnNldHMgYW5kIG5vdCBzcGVsbAo+IG91dCBhbGwgdGhlIHN1YmNvbXBvbmVudHMuCgpIbSwgb2su
IElmIElTQSBzdHJpbmdzIGFyZSBsaWtlbHkgdG8gYmUgd3JpdHRlbiB0aGF0IHdheSwgdGhlbiBJ
IGFncmVlCmhhdmluZyB0aGUga2VybmVsIGZsaXAgb24gYWxsIHRoZSBjb250YWluZWQgZXh0ZW5z
aW9ucyBpcyBhIGdvb2QgaWRlYS4KV2UgY2FuIHR3ZWFrIHBhdGNoIDIgdG8gc3VwcG9ydCB0aGUg
cGFyc2luZyBvZiBzdHJ1Y3QKcmlzY3ZfaXNhX2V4dF9kYXRhIHdpdGggYm90aCAuaWQgYW5kIC5i
dW5kbGVfc2l6ZSBzZXQgKGluc3RlYWQgb2Ygb25seQpvbmUgb3IgdGhlIG90aGVyIGFzIGl0IGlz
IG5vdykuIExvb2tpbmcgYmFjayBhdCB0aGF0IHBhdGNoLCBpdCBsb29rcwpxdWl0ZSBkb2FibGUu
IEFscmlnaHQhCgotRXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
