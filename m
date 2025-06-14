Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02CBC71136
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 02:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKiIM+TnkXwT/16TqzDMvz7r9+P98epuiXcKag65pm0=; b=l9RsMN/BtlY1lM
	nVNRKqvAIYGcl8YHDx+fm7DtznP3VHdfNGINeDwM/gBwWSBGZGxR21mCHWyQds9n7/7wCojGenXCK
	sGGe7vpULLx0dVpRSCWFftZr+LxQltJIBJ/zh9JbjVMr+zQSsThrKZeXmVW4MAAA6HLWSmMWN9uZk
	aFoTvW4NGHwz9rHRYPigYNEGqNkr3kV1BOJWlj3jg5vUvSWqB+CvZ9LYhTb7OcQ3nKpVk+5bvmoel
	es1GbLjGQCphitcG/DYCfJSz2SJpp2ubSyQWhlzUwyBU6OctPsX0gO/5XwdkOesJ6FPa1or+Pl1BG
	OTfL1qqSWAznzbPt8RbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQH1x-00000000aaA-2Wt4;
	Sat, 14 Jun 2025 02:54:05 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQH1u-00000000aZm-1gn2
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 02:54:03 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-70f862dbeaeso27846367b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 19:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749869641; x=1750474441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31krmauOoYJOnjYbVjbtfjUBqSgAaFlcEYULl0apEAg=;
        b=pXc+XP6rXAnbUuJ0b1GYU439pqSJo37QswSZfoOmsNl+2a6AyJ1iC51GgWN1vtslho
         SDv4EnIOLRYReDA7r0YxrRByHcqFKr7xL7gpLlBvxJ+puz+txYGP3dqwQetg+pG3LQqi
         GvCNAtSbxgZJP6gIwtn11ENOdHs8ZWpReaaeRUJFcB+cKAnArGsD5O2Pm79IYN32Sdb0
         bztI5eBL0OamSAixAbEQKKgTJjFCnDLtaOUJ/3L7icT2N6oIzm1NkmF2xeHOYRdv/d7U
         CFoouwoak1PMOyPWOAi5gtJrpfavqr0s7mR2K37BFZ4v8uy5zLHZeqPm30KklBClPom/
         h2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749869641; x=1750474441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31krmauOoYJOnjYbVjbtfjUBqSgAaFlcEYULl0apEAg=;
        b=nsjXVlnRpqoBzV+V6aT0DQZPbqbeH3jVhOspa/RpGl0qkC4Xqx8dhZNNgRs58VWMbD
         bZXDof9DQeaapNGLJdUoq5ick8py7xNAxpFgnZIwtZM7x8WNRayE1KALOnvH61kRSq4Y
         sjx3Ub+yPQxi3P28RvcCAK6egOZBVa1Ca8clvKUm0LKKOVdujYbZHTgAXViV6r227lSh
         EGm11ipuR8qjLj6pQirHDv5X356OvGN8ZCuf842YgzG9Jsd2wKYr7nJhzhJbVBveUVfW
         DC9LCiuNiOfuborKk3om7WtteNlhE1BufS2SIOZcoVLj1qANlVQW9Vv1mgmt79hcLXQf
         1MFw==
X-Forwarded-Encrypted: i=1; AJvYcCWOeaRCF3yHx+4JHbpKKC+b+z9UmhNRgSYp7XVSc3+x8sOULF154FVe0sn7MUeCuULafRxWrPNW1PAkHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgQ0NB3K42xRa9wk35/Ryv4pw+ZAHWdALYoJeWgQ5A6Du3Ept7
	Iq+GHgsABgWwIVarHaNm2YJUeCLYiA7g3uy7RTX15l4eJPCuw4b3IEgwgXULxH94TIUCaNzsqcz
	x61QI6aV7UxkA4uchTC+KLaelWoHwIXhK6pmK81J1sw==
X-Gm-Gg: ASbGncsEk/LGbHnMnV9G2c/pjKZ7n4hw4yVtQH8t5dQr4ImD3cYmcd5Gg/vbRH/qge3
	y4Vp8x3ILh4s3fiw9/XJvHyd48QEnGd208TLxUS5vQGv6X4gAjfY5TDVDM2MCvB356SWGJL2RBI
	Fqt8lQChURK71+rrFOYBRhc0je9Y+duzFeEcZe0sLtDLnm
X-Google-Smtp-Source: AGHT+IHcwod9d585wIy9espWy9CTasZig0QiZOdlUQMf/BDe2eeDnXq8w+5El8L8W1GrR0B+DqxTxKI2/p3Xm8YnRRM=
X-Received: by 2002:a05:690c:7448:b0:70d:ff2a:d686 with SMTP id
 00721157ae682-71175440983mr25217457b3.28.1749869640812; Fri, 13 Jun 2025
 19:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250611125723.181711-1-guodong@riscstar.com> <20250611125723.181711-6-guodong@riscstar.com>
 <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
In-Reply-To: <2b17769e-2620-4f22-9ea5-f15d4adcb27b@dram.page>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 14 Jun 2025 10:53:48 +0800
X-Gm-Features: AX0GCFt1J7cK2ONSBYRJxYGgLZ03DM7CsbEBM2NtLfq6P5d7b2_ITgbQ_ARUd5g
Message-ID: <CAH1PCMaC+imcMZCFYtRdmH6ge=dPgnANn_GqVfsGRS=+YhyJCw@mail.gmail.com>
Subject: Re: [PATCH 5/8] riscv: dts: spacemit: Add dma bus and PDMA node for
 K1 SoC
To: Vivian Wang <uwu@dram.page>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	emil.renner.berthing@canonical.com, inochiama@gmail.com, 
	geert+renesas@glider.be, tglx@linutronix.de, hal.feng@starfivetech.com, 
	joel@jms.id.au, duje.mihanovic@skole.hr, Ze Huang <huangze@whut.edu.cn>, 
	elder@riscstar.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_195402_635270_B8973383 
X-CRM114-Status: GOOD (  21.07  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTE6MDfigK9BTSBWaXZpYW4gV2FuZyA8dXd1QGRyYW0u
cGFnZT4gd3JvdGU6Cj4KPiBIaSBHdW9kb25nLAo+Cj4gT24gNi8xMS8yNSAyMDo1NywgR3VvZG9u
ZyBYdSB3cm90ZToKPiA+IDxzbmlwPgo+ID4KPiA+IC0gICAgICAgICAgICAgICAgICAgICBzdGF0
dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyAgICAgICAgICAgICBkbWFfYnVzOiBidXNANCB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkbWEt
cmFuZ2VzID0gPDB4MCAweDAwMDAwMDAwIDB4MCAweDAwMDAwMDAwIDB4MCAweDgwMDAwMDAwPiwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4MSAweDAwMDAwMDAwIDB4
MSAweDgwMDAwMDAwIDB4MyAweDAwMDAwMDAwPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBy
YW5nZXM7Cj4gPiAgICAgICAgICAgICAgIH07Cj4KPiBDYW4gdGhlIGFkZGl0aW9uIG9mIGRtYV9i
dXMgYW5kIG1vdmVtZW50IG9mIG5vZGVzIHVuZGVyIGl0IGJlIGV4dHJhY3RlZAo+IGludG8gYSBz
ZXBhcmF0ZSBwYXRjaCwgYW5kIGlkZWFsbHksIHRha2VuIHVwIGJ5IFlpeHVuIExhbiB3aXRob3V0
IGdvaW5nCj4gdGhyb3VnaCBkbWFlbmdpbmU/IE5vdCBzcGVjaWZpY2FsbHkgImRyYW1fcmFuZ2U0
IiwgYnV0IGFsbCBvZiB0aGVzZQo+IHRyYW5zbGF0aW9ucyBhZmZlY3RzIG1hbnkgZGV2aWNlcyBv
biB0aGUgU29DLCBpbmNsdWRpbmcgZXRoZXJuZXQgYW5kCgpJdCB3YXMgbm90IG15IGludGVudGlv
biB0byBhZGQgYWxsIHRoZSBzZXBhcmF0ZSBtZW1vcnkgbWFwcGluZyBidXNlcyBpbnRvCm9uZSBw
YXRjaC4gSSdkIHByZWZlciB0byBhZGQgdGhlbSB3aGVuIHRoZXJlIGlzIGF0IGxlYXN0IG9uZSB1
c2VyLgpUaGUgazEuZHRzaSBhdCB0aGlzIG1vbWVudCwgYXMgSSBjaGVja2VkLCBoYXMgbm8gcmVh
bCB1c2VyIGJlc2lkZSB0aGUKc28tY2FsbGVkICJkcmFtX3JhbmdlNCIgaW4gZG93bnN0cmVhbSB2
ZW5kb3Iga2VybmVsIChpZS4gZG1hX2J1cyBpbiB0aGlzCnBhdGNoKS4gQW5kIHRoYXQgaXMgd2hh
dCBJIGRpZDogZ3JvdXBpbmcgZGV2aWNlcyB3aGljaCBzaGFyZSB0aGUgc2FtZQpkbWEgYWRkcmVz
cyBtYXBwaW5nIGFzIHBkbWEwIGludG8gb25lIHNpbmdsZSBzZXBhcmF0ZWQgYnVzLgoKVGhlIG90
aGVyIGJ1c2VzLCBldmVuIGlmIEkgYWRkIHRoZW0sIHdvdWxkIGJlIGVtcHR5LgoKV2hhdCB0aGUg
U3BhY2VtaVQgdGVhbSBhZ3JlZWQgdXBvbiBzbyBmYXIsIGlzIHRoZSBuYW1pbmcgb2YgdGhlc2Ug
c2VwYXJhdGVkCmJ1c2VzLiBJIGxpc3RlZCB0aGVtIGhlcmUgZm9yIGZ1dHVyZSByZWZlcmVuY2Ug
cHVycG9zZXMuCgpJZiBuZWVkZWQsIEkgY2FuIHNlbmQgdGhhdCBpbiBhIFJGQyBwYXRjaHNldCwg
b2YgY291cnNlOyBvciBhcyBhIG5vcm1hbApQQVRDSCwgaWYgWWl4dW4gaXMgb2sgd2l0aCB0aGF0
LiBIb3dldmVyLCBwbGVhc2Ugbm90ZSwgdGhhdCB3b3VsZCBtZWFuIG1vcmUKbWVyZ2luZyBkZXBl
bmRlbmNpZXM6IFBETUEgZHRzLCBldGhlcm5ldCBkdHMsIHVzYiBkdHMsIHdpbGwgaGF2ZSB0byBk
ZXBlbmQKb24gdGhpcyBiYXNlICdidXNlcycgUEFUQ0guCgpBZ2FpbiwgSSBwcmVmZXIgd2UgYWRk
IG91ciBvd24gJ2J1cycgd2hlbiB0aGVyZSBpcyBhIG5lZWQuCgorICAgICAgIHNvYyB7CisgICAg
ICAgICAgICAgICBzdG9yYWdlX2J1czogYnVzQDAgeworICAgICAgICAgICAgICAgICAgICAgICAv
KiBVU0IsIFNESCBzdG9yYWdlIGNvbnRyb2xsZXJzICovCisgICAgICAgICAgICAgICAgICAgICAg
IGRtYS1yYW5nZXMgPSA8MHgwIDB4MDAwMDAwMDAgMHgwIDB4MDAwMDAwMDAKMHgwIDB4ODAwMDAw
MDA+OworICAgICAgICAgICAgICAgfTsKKworICAgICAgICAgICAgICAgbXVsdGltZWRpYV9idXM6
IGJ1c0AxIHsKKyAgICAgICAgICAgICAgICAgICAgICAgLyogVlBVLCBHUFUsIERQVSAqLworICAg
ICAgICAgICAgICAgICAgICAgICBkbWEtcmFuZ2VzID0gPDB4MCAweDAwMDAwMDAwIDB4MCAweDAw
MDAwMDAwCjB4MCAweDgwMDAwMDAwPiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDwweDAgMHg4MDAwMDAwMCAweDEgMHgwMDAwMDAwMAoweDMgMHg4MDAwMDAwMD47CisgICAg
ICAgICAgICAgICB9OworCisgICAgICAgICAgICAgICBwY2llX2J1czogYnVzQDIgeworICAgICAg
ICAgICAgICAgICAgICAgICAvKiBQQ0llIGNvbnRyb2xsZXJzICovCisgICAgICAgICAgICAgICAg
ICAgICAgIGRtYS1yYW5nZXMgPSA8MHgwIDB4MDAwMDAwMDAgMHgwIDB4MDAwMDAwMDAKMHgwIDB4
ODAwMDAwMDA+LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4MCAweGI4
MDAwMDAwIDB4MSAweDM4MDAwMDAwCjB4MyAweDQ4MDAwMDAwPjsKKyAgICAgICAgICAgICAgIH07
CisKKyAgICAgICAgICAgICAgIGNhbWVyYV9idXM6IGJ1c0AzIHsKKyAgICAgICAgICAgICAgICAg
ICAgICAgLyogSVNQLCBDU0ksIGltYWdpbmcgZGV2aWNlcyAqLworICAgICAgICAgICAgICAgICAg
ICAgICBkbWEtcmFuZ2VzID0gPDB4MCAweDAwMDAwMDAwIDB4MCAweDAwMDAwMDAwCjB4MCAweDgw
MDAwMDAwPiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwweDAgMHg4MDAw
MDAwMCAweDEgMHgwMDAwMDAwMAoweDEgMHg4MDAwMDAwMD47CisgICAgICAgICAgICAgICB9Owor
CisgICAgICAgICAgICAgICBkbWFfYnVzOiBidXNANCB7CisgICAgICAgICAgICAgICAgICAgICAg
IC8qIERNQSBjb250cm9sbGVyLCBhbmQgdXNlcnMgKi8KKyAgICAgICAgICAgICAgICAgICAgICAg
ZG1hLXJhbmdlcyA9IDwweDAgMHgwMDAwMDAwMCAweDAgMHgwMDAwMDAwMAoweDAgMHg4MDAwMDAw
MD4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHgxIDB4MDAwMDAwMDAg
MHgxIDB4ODAwMDAwMDAKMHgzIDB4MDAwMDAwMDA+OworICAgICAgICAgICAgICAgfTsKKworICAg
ICAgICAgICAgICAgbmV0d29ya19idXM6IGJ1c0A1IHsKKyAgICAgICAgICAgICAgICAgICAgICAg
LyogRXRoZXJuZXQsIENyeXB0bywgSlBVICovCisgICAgICAgICAgICAgICAgICAgICAgIGRtYS1y
YW5nZXMgPSA8MHgwIDB4MDAwMDAwMDAgMHgwIDB4MDAwMDAwMDAKMHgwIDB4ODAwMDAwMDA+LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPDB4MCAweDgwMDAwMDAwIDB4MSAw
eDAwMDAwMDAwCjB4MCAweDgwMDAwMDAwPjsKKyAgICAgICAgICAgICAgIH07CisKKyAgICAgICB9
OyAvKiBzb2MgKi8KCj4gVVNCMy4gU2VlOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwNTI2LWI0LWsxLWR3YzMtdjMtdjQtMi02M2U0ZTUyNWU1Y2JAd2h1dC5lZHUuY24vCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNjEzLW5ldC1rMS1lbWFjLXYxLTAtY2M2
ZjllNTEwNjY3QGlzY2FzLmFjLmNuLwo+Cj4gKEkgaGF2ZW4ndCBwdXQgZXRoezAsMX0gdW5kZXIg
ZG1hX2J1czUgYmVjYXVzZSBpbiA2LjE2LXJjMSB0aGVyZSBpcwo+IG5vbmUsIGJ1dCBpZGVhbGx5
IHdlIHNob3VsZCBmaXggdGhpcy4pCgpTbywgYXMgeW91IGFyZSBzdWJtaXR0aW5nIHRoZSBmaXJz
dCBub2RlKHMpIHVuZGVyIG5ldHdvcmtfYnVzOiBidXNANSwgeW91CnNob3VsZCBoYXZlIHRoaXMg
YWRkZWQgaW50byB5b3VyIHBhdGNoc2V0LCBpbnN0ZWFkIG9mIHNlbmRpbmcgb3V0IHdpdGggbm9u
ZS4KClRoZSBzYW1lIGxvZ2ljIGdvZXMgdG8gVVNCIHRvbywgWmUgSHVhbmcgd2FzIGluIHRoZSBz
YW1lIG9mZmxpbmUgY2FsbCwgYW5kCkkgd291bGQgcHJlZmVyIHRoYXQgd2UgbW92ZSBpbiBhIGNv
b3JkaW5hdGVkIHdheS4KCj4KPiBETUEgYWRkcmVzcyB0cmFuc2xhdGlvbiBkb2VzIG5vdCBkZXBl
bmQgb24gUERNQS4gSXQgd291bGQgYmUgYmVzdCBpZiB3ZQo+IGdldCBhbGwgdGhlIHBvc3NpYmxl
IGRtYS1yYW5nZXMgYnVzZXMgaGFuZGxlZCBpbiBvbmUgcGxhY2UsIGluc3RlYWQgb2YKPiBldmVy
eW9uZSBtb3Zpbmcgbm9kZXMgYXJvdW5kLgoKTm8sIHlvdSBzaG91bGQgZG8gaXQgaW4geW91ciBw
YXRjaHNldCwgd2hlbiB5b3UgYWRkIHRoZSBldGgwIGFuZCBldGgxIG5vZGVzLAp0aGV5IHdpbGwg
YmUgdGhlIGZpcnN0IGluLCBhcyBJIHNhaWQsICJuZXR3b3JrX2J1cyIuIEkgZG9uJ3QgZXhwZWN0
CmFueSAnbW92aW5nIG5vZGVzIGFyb3VuZCcuCgo+Cj4gQFplIEh1YW5nOiBUaGlzIGFmZmVjdHMg
eW91ciAiTUJVUyIgY2hhbmdlcyBhcyB3ZWxsLiBQbGVhc2UgdGFrZSBhIGxvb2ssCj4gdGhhbmtz
Lgo+Cj4gPgo+ID4gICAgICAgICAgICAgICBncGlvOiBncGlvQGQ0MDE5MDAwIHsKPiA+IEBAIC03
OTIsMyArNjkzLDEyNCBAQCBwd20xOTogcHdtQGQ0MDIyYzAwIHsKPiA+ICAgICAgICAgICAgICAg
fTsKPiA+ICAgICAgIH07Cj4gPiAgfTsKPiA+ICsKPiA+ICsmZG1hX2J1cyB7Cj4gPgo+ID4gPHNu
aXA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
