Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EBFC4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 22:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gT8sJ2rD/vLOk80ueY9mKdbH3E1GE5N6zkgtTxMXIaM=; b=mfpuLhlfq1xF23
	9S6oWG2OX4/X8/sOISrl8KG1sHz3D2QMcXynqGSZ/oqp8AHn7WUwmDsyn+d7DKNORK+0jYGgGeuJO
	tx+Gcze/gFrFLeUeuq3mA++bqbZKVdEHtZG+bIswI1JVORNLuvequGpkmdXOjMNqE6Uyu1233S+Dp
	ttlTAg+kTlMCu1wDP3LuV9rK3MFx8LNef0bO1W4/Qo4LSPsX58ObJgE7SoC99QT+uoqIinXS9qWqU
	xrx67u4/zc1yhYY1qgERu6zvk2bjoA145qkisfXt0KPMdmGIXek10bDjcC0mmW/HruSWR2mWuCx9K
	U0OBivHcU45IiWk2QrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUWt-00000000jDT-3Gmp;
	Thu, 16 Jul 2026 22:26:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUWs-00000000jD9-1Qqx
	for linux-riscv@bombadil.infradead.org;
	Thu, 16 Jul 2026 22:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UWloTcZIy9sIdRlodwyddcufvKR4RH37/mjop1hr3+I=; b=i4e9MaXYKtAPSt2LjawBSAZCDf
	NuTYamU/qkkx9z4RiCSdo+nanIOt8ZoShPO0Xn5PcyEv5JztfpD6kqq9u70AMmoxgcSsrBy2LQbGN
	KWIO3t3MZanN7tRPvBEhflv1wyLbZNk8GzmZCETio/j8UJbvSmmqcRq/03gW7ACXvsncxwrsDc+Jl
	bB2jwtMXehlrYhhklQmVUAeyQMKn+0eARBZDgAaZ99VFPqtcvallPN3oOXbvmszGUi86XL700V6ZP
	/sdQQLIlm0mRYPSeH5jOJ/X2O6E9GDQ/XS1SPHJ8ikeFvhtG3yQ3fYm3i0MYpL5TDIHtfUHaS+/Zc
	uARVdZdA==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkUWY-0000000EOAj-0fgi
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 22:26:04 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2401132a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 15:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784240743; x=1784845543; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWloTcZIy9sIdRlodwyddcufvKR4RH37/mjop1hr3+I=;
        b=XE+mAsrjJnE2tzTlOpZ5bq8ovvXWkgUM47GrVUWbBEgBeGR5LBdcSFue0urjjawwVI
         9UUSiPRdYRlyUEv1fhEo6jOZmOPxThnDh5w/sOItCLrV5QwH4uKwNJg6Q2ikASDVrHiN
         O6+fl03glnvuo2ffUGcDeazW0jMJmyX0/OBYG6wfsGYo1FEM+/rdJ7fM7ccrsmXl2ROM
         ydDO9D+rh9/93HzYgAtOn0tNE5gF1v11GclJFuc7NU7RFCnNXtn3mTI/I2Ue1S4WPBmc
         s4aoMkJZ6HCisHOL8qFe6/uh4fUz16U567guUgSspvncMB7gQ728b9/6jlsjZdk0vwGn
         IF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240743; x=1784845543;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UWloTcZIy9sIdRlodwyddcufvKR4RH37/mjop1hr3+I=;
        b=E0VQj//9HkxcFabJRlKIwP26P2khuzMShhjaTHWy5zK5y/V3QXmE7UlC/CPS4S2yyj
         VVwtQevSs83DpHyNOmNwe2C9sldEXussbDjbC/gZCVRyzk6V2gAE8CFFVsO2/B/btExa
         68QSr275m1oPZnkT9v8V0g1lNiq1nQ4vA+3ulUYx9UJdvb2Fk+atnuiQeHTpunQ3DChu
         SXxPsaRTZQvRgVFBFOgmShPCOYoRZeV1SQ7AyW2RqPxlNXLFrmR2bDSQez6xK5ajQBZ2
         udbzAqQliGmCnhNUYmlXE39kA9guJjE+b5yU7fLIvSJD3pJyIZ3dU5vn8+lZhPaaoacu
         T0BA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqvfn5wBD0Li2mNNZr0+j/lrf9wmilgJEami+ZZjx7mxSxJmLbjNEtEgMPpLEJIcR5iFdjRC34j5SH1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLVW9rZPjsPMK+Kh7Z83QsaxQfgK4upDmk/uSqMfiHNU/oozhT
	X/WPmKYtdrat2Z/Dq9GK7Oft4O90s2ZAb4wQJezp/a2K0ndVGcAIJ4AH
X-Gm-Gg: AfdE7cnuaJaQgEG3SsrKgNjnTOnBaMM3L/ywCKAfhW2ABW/0PUrqMx4VvH8CjRvUArt
	iFGaDeV6/8qdBVJXjKey7fTUuvQfOLBDq1goVZ21L9AzzYFkTThQmj3nSCk/gP8JBJ8pYX0EwTi
	oVP6tlOIEUsfF2xEeBxPhRrlOBPkYtVk7lX+pjvhQ7YdZMn1AqEWvvR8O+Crn4F52jd42kzE35g
	Hl3i12xgglIiOmJN+dz+iRu0GD+stmEm6MY84zpi/UMotxkQvbR5jHmBpwjl9jVPAA0hs2vjWU2
	NWqF1K5dq+SD1pRqbQMF+XfCHqu6UhfLg8JZIY3eFs3dJIK49a6v/Y8Kv3sr2PB5r5lH7guuzpU
	u3yWM99LLMHL0H2/9Yuq6A18SsXlyqTfAQZN/UvxN0Cairj+3n/L+eQ==
X-Received: by 2002:a05:6a20:2446:b0:3c3:9eca:aee0 with SMTP id adf61e73a8af0-3c3a5d428a4mr1081625637.48.1784240743152;
        Thu, 16 Jul 2026 15:25:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd403a7f7sm13722999c88.0.2026.07.16.15.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:25:42 -0700 (PDT)
Date: Fri, 17 Jul 2026 06:24:52 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
Message-ID: <allaAnK4nfRSkacc@inochi.infowork>
References: <20260709040415.977784-1-inochiama@gmail.com>
 <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3>
 <alRmA-X4xbQ9zPFn@inochi.infowork>
 <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_232603_123868_D5770F1C 
X-CRM114-Status: GOOD (  34.74  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMTA6MDQ6MDlBTSAtMDUwMCwgQW5pcnVkaCBTcmluaXZh
c2FuIHdyb3RlOgo+IEhpIElub2NoaSwKPiAKPiBPbiBTdW4sIEp1bCAxMiwgMjAyNiBhdCAxMTox
OeKAr1BNIElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIFN1biwgSnVsIDEyLCAyMDI2IGF0IDExOjEzOjA3UE0gLTA1MDAsIEFuaXJ1ZGggU3Jpbml2
YXNhbiB3cm90ZToKPiA+ID4gSGkgSW5vY2hpLAo+ID4gPgo+ID4gPiBPbiBUaHUsIEp1bCAwOSwg
MjAyNiBhdCAxMjowNDoxNFBNICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPiA+IEFk
ZCBhbGwgUENJZSBkZXZpY2Ugbm9kZSBmb3IgU3BhY2VtaXQgSzMuCj4gPiA+ID4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+ID4gPiA+
IC0tLQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLXBpY28taXR4LmR0
cyB8ICAzOCArKysrCj4gPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMtcGlu
Y3RybC5kdHNpIHwgIDMzICsrKysKPiA+ID4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1p
dC9rMy5kdHNpICAgICAgICAgfCAxOTUgKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDI2NiBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4KPiA+ID4gSSBzZWUg
c29tZSB3YXJuaW5ncyBwcmludGVkIGR1cmluZyBwcm9iZQo+ID4gPgo+ID4gPiBbICAgMTAuODQy
OTU1XSByODE2OSAwMDAyOjAxOjAwLjA6IG9mX2lycV9wYXJzZV9wY2k6IGZhaWxlZCB3aXRoIHJj
PS0yMgo+ID4gPgo+ID4gPiBbICAgMTAuOTM3NzU0XSBydHc4OV84ODUyYmUgMDAwNDowMTowMC4w
OiBvZl9pcnFfcGFyc2VfcGNpOiBmYWlsZWQgd2l0aCByYz0tMjIKPiA+ID4KPiA+Cj4gPiBUaGlz
IGlzIGFuIGV4cGVjdGVkIGVycm9yIGJlY2F1c2UgdGhlIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0
IElOVHgKPiA+IGJ1dCB0aGUgaGFyZHdhcmUgY2xhaW1zIGl0IHN1cHBvcnRzLiBTaW5jZSB0aGUg
dmVuZG9yIGRvZXMgbm90IHdhbnQKPiA+IHRvIHN1cHBvcnQgaXQsIHNvIHRoZXJlIGlzIG5vIHdh
eSBmb3IgdGhlIHVwc3RyZWFtZXIgdG8gYWRkIHRoaXMuCj4gCj4gQXJlIHlvdSBzYXlpbmcgdGhh
dCB0aGUgaGFyZHdhcmUgYWR2ZXJ0aXNlcyBzdXBwb3J0IGZvciBJTlR4LCBidXQKPiBzcGFjZW1p
dCBoYXNuJ3QgcHJvdmlkZWQgYSBkcml2ZXIgdGhhdCB1c2VzIGl0Pwo+IAo+IElzIHRoZXJlIGEg
d2F5IHRvIGxldCB0aGUgZHJpdmVyIGtub3cgdG8gbm90IHRyeSBzZXR0aW5nIHVwIGxlZ2FjeQo+
IGludGVycnVwdHMgdGhlbj8gSXQgc2VlbXMgbGlrZSBpdCdzIHRyeWluZyB0byBkbyB0aGF0IG5v
dywgYW5kIGZhaWxpbmcKPiB0byBmaW5kIGludGVycnVwdHMgbm9kZSBpbiB0aGUgRFQuCj4gCgpJ
SVJDIGl0IGlzIGhhcmQgdG8gZG8gdGhpcywgdGhpcyBpcyBtb3JlIGxpa2UgYSBxdWlyayBmb3Ig
dGhlIHNwYWNlbWl0ClBDSWUgY29udHJvbGxlcnMuCgpSZWdhcmRzLApJbm9jaGkKCj4gPgo+ID4g
PiBJIHNlZSB0aGF0IGFsbCB0aGUgMyByYyBub2RlcyBhcmUgbWlzc2luZyBhbiBpbnRlcnJ1cHRz
IG5vZGUgYW5kIGFuCj4gPiA+IGludGVycnVwdCBwYXJlbnQgKHNhcGxpYykuIFRoZSB2ZW5kb3Ig
RFQgc2VlbXMgdG8gaGF2ZSB0aGlzLiBOb3Qgc3VyZSBpZgo+ID4gPiB0aGlzIGlzIHJlbGF0ZWQu
Cj4gPiA+Cj4gPiA+IFRoZSAxMEcgZXRoZXJuZXQgcHJvYmVzIGZpbmUsIGJ1dCB0aGUgd2lmaSBj
YXJkIGZhaWxzIHRvIHByb2JlLiBTZWVtcwo+ID4gPiBsaWtlIHRoZSBjYXJkIGlzIHRyeWluZyB0
byByZXF1ZXN0IDMyIGJpdCBETUEgYWRkcmVzc2VzIGFuZCB3ZSdyZQo+ID4gPiBmYWlsaW5nIGNh
dXNlIHdlIGhhdmUgNjQgYml0IG1lbW9yeSBvbmx5Lgo+ID4gPiBUaGUgdmVuZG9yIGtlcm5lbCBz
ZWVtcyB0byBoYXZlIGEgcGF0Y2ggdG8gZW5hYmxlIDM2IGJpdCBETUEgaW4KPiA+ID4gdGhlIHJ0
dzg5IGRyaXZlci4gVGhhdCdsbCBwcm9iYWJseSBmaXggdGhpcy4KPiA+ID4KPiA+Cj4gPiBUaGlz
IHdhcm5pbmcgaXMgYWxzbyBmb3VuZCBvbiBteSB0ZXN0LCBpdCBpcyBub3QgcmVsYXRlZCB0bwo+
ID4gdGhlIFBDSWUgZHJpdmVyLCBidXQgYSBsYWNrIG9mIHRoZSBSVEwgcGh5IGRyaXZlci4gOigK
PiA+Cj4gPiBZb3UgbWF5IGFsc28gbm90aWNlZCBhIGJhZCBwZXJmb3JtYW5jZSBvbiB0aGlzIDEw
RyBldGhlcm5ldCwKPiA+IGl0IGlzIGNhdXNlZCBieSB0aGUgc2luZ2xlIHF1ZXVlIHVzZWQgYnkg
dGhlIFJUTCBkcml2ZXIuCj4gPiBJSVJDLCBldmVuIDk4MDAgWDNEIGNhbiBub3QgYWNoaWV2ZSB0
aGUgbWF4IHNwZWVkLgo+IAo+IEkgZG9uJ3QgaGF2ZSB0aGUgYWJpbGl0eSB0byB0ZXN0IHRoZSAx
MEcgTklDIHVuZm9ydHVuYXRlbHkgOigKPiAKPiBSZWdhcmRzCj4gQW5pcnVkaCBTcmluaXZhc2Fu
Cj4gCj4gPgo+ID4gUmVnYXJkcywKPiA+IElub2NoaQo+ID4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
