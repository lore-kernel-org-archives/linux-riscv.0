Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534A7D25046
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwyVjgYXJlxf2txdWJ+a9rlgBn/VvXCt9ofJ5mjr4Eg=; b=22o3VQvB0kwfQ4
	tyECE/qZJnGsZY1KgQMmXxLs73AMlkBBsftMSSOXhqf+G8tmocWgn3noiMskMB29U9WDMwjBc5VlV
	xdcT3un8esC6wkNjRM92DFH96EQLvrjEBT2wAJaBpIKeoHmTOJO8AJpCxcPduL/n4teKqaHDQ5Vxe
	v3uKBlPvyXGoXEUTSoqeEoLNs+CwpKRuD0ifztSZ8cGBnBc479KBqReqQgfCZ2BdTc813Q8EExpIi
	wdkXNIY9XReFvY/Dym7swCllYq/kbxYnWl/meiU5YdEiz06rIoD2zFoM/oH82ZbGPlot3TzPM1jsN
	zIoV2Hh8Yrakcmm9JCSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD4A-00000004xj4-3VT9;
	Mon, 12 Jan 2026 08:14:22 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD48-00000004xif-13uP
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 08:14:21 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-78fb6c7874cso66934257b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 00:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768205659; x=1768810459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdHYyTf8yNUB9PUhTyJBW4AOfvFKsuolfjygPMMLYzM=;
        b=wdv5jNJ/ieh2+YlomDVoV56Rr/3KdV37bX7KR420MwSeCH6EmHZ4nzF9fmZAtjy6Tf
         rk498nCfAnSKgGhJMeqbjuXpw8yM468l8RLKdZu5aUK/nKsi/5WXH2ncM8tayaUwvSrh
         NWkicRjpzv62M6AkEp9LOKtux594zGfoELq96+icp5vpCFnyEjRcPubCgw1M2UVF16n9
         xwmXz+WOh8sVSmiUk2qOiuQaAQ4gQizj1CFA/IUKg0aW1mbq/MuY5CjvoNJZJn5v7w1J
         OqHm1DYoQs6r0i0OrUGP7nFNNamjOB+J3I8+MljpjgsZhYc6AfieVnf2sHVvQrMQXsxf
         6ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205659; x=1768810459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdHYyTf8yNUB9PUhTyJBW4AOfvFKsuolfjygPMMLYzM=;
        b=XNJEJ3MUOWwgYJa2z30XUU8ioHxU7rzjMBjl0Fc4U5yepF1Y+unAxcs15A94AoTDoJ
         1INM33WACr5hGypy0IQRk1sn1d2qOFurvtPaHsl+EVZXXiynVn5h3LAPa8xVgQn55zmK
         XNghpS83DNvi4b8Fi4GkHKNOBVeqx3p22+eT2F0TojalAd/fREixOFRlehC5R9lCafQr
         +L+FSM5Ncm1MrUNvvmWydjFJdnrI+EV2I2VmOByDA1mBAMbZf0q1eDc2mR7Dg/9rkDz0
         rJec20LDd/SeiA96GJ+ixLh2mJL9SpmZMTlJ1Old/0ZeKixPeQR8IBC/1Fui+iO/n6CB
         bO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTjdpSwpbknO9l4jcrpcOgbcxLxS+puIEqQ8LzuPYwWS/19DZlGBiywu5ReCuqIwHuFGWiFOIMbaXNZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxABJoztYSEgTyhj2RDSXO+ovnHRtVIaix1SDxUHfKJO8+RSJoG
	LOO0wt36XaXP2xt2hgRVcI5NrYh30S33TQkKFIEE2ymFWrQ8fyBidFOB3ojiawJAxCj86wr4IsN
	vyU8nEao+Sj5e44X4dxFLVMV1Tc7eDJFWgBIxOfrwTQ==
X-Gm-Gg: AY/fxX4S+3+/o7m57gt0PvXDMtQuCAdBNdGQCXS9Sxjp8nDnGbkDbErELcxh71aYccX
	TioeFR5hRzJOhloW/ES5F5xZCJTOjZOOlXxr2ZQVfD0mqAoaDm6DHD8dGRm7s4x2nncvvS2do40
	FMvqemLHqIreqNvI8xR970nemJH5JTNepVTcMh7d3FhRNGaj+hI7Qu/jYHzWwqzDRHRdznYRvFt
	o4HNVW0PUi+lZUzAmxQ4yCpFMzSQeSYuAb/crmt8/dwljiI4CclPGbWVrEx8kFP7gjxOpDRZpvT
	axrBxFnhA3mpJCvHs6cGEkWeALtJOnE4DzYcTMGoU/RuJ2gV6Oc8zEo=
X-Google-Smtp-Source: AGHT+IGaUMti/es8KDCK9VKF8Pq/ZGqb+Pn4kB7n8HEpQA0mof3jCeBYsxR3EZFKC9/bg55lrEWXaPLSWS2ilkC4UcA=
X-Received: by 2002:a05:690e:13c3:b0:640:d255:2d6f with SMTP id
 956f58d0204a3-64716bda139mr14249893d50.34.1768205658908; Mon, 12 Jan 2026
 00:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com> <aWIi9LFdqSF3c-FP@inochi.infowork>
 <20260110110502-GYB12783@gentoo.org>
In-Reply-To: <20260110110502-GYB12783@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 12 Jan 2026 16:14:06 +0800
X-Gm-Features: AZwV_Qhr0dttuBvrLtxWYoEzTqFnHiF6Qe7y0CQjr_1X00MIdkxaUixcgPpB4IM
Message-ID: <CAH1PCMbh4f1fcZ1sUWGtYoZCH_G1x626rb7YvoNTnKjfm9znXw@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_001420_302323_49A8B151 
X-CRM114-Status: GOOD (  24.25  )
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

SGksIFlpeHVuIGFuZCBJbm9jaGkKCk9uIFNhdCwgSmFuIDEwLCAyMDI2IGF0IDc6MDXigK9QTSBZ
aXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4gd3JvdGU6Cj4KPiBIaSBHdW9kb25nLAo+Cj4gT24g
MTg6MDAgU2F0IDEwIEphbiAgICAgLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gT24gU2F0LCBK
YW4gMTAsIDIwMjYgYXQgMDE6MTg6MjJQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+ID4g
U3BhY2VtaVQgSzMgaXMgZXF1aXBwZWQgd2l0aCA4IFgxMDAgY29yZXMsIHdoaWNoIGFyZSBSVkEy
MyBjb21wbGlhbnQuCj4gPiA+IEFkZCBub2RlcyBvZiB1YXJ0cywgdGltZXIgYW5kIGludGVycnVw
dC1jb250cm9sbGVycy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3Vv
ZG9uZ0ByaXNjc3Rhci5jb20+Cj4gPiA+IC0tLQo+ID4gPiB2NDogRml4IG1pc3NpbmcgYmxhbmsg
c3BhY2UgYWZ0ZXIgY29tbWFzIGluIGNvbXBhdGlibGUgc3RyaW5nLgo+ID4gPiAgICAgQWRkIG0t
bW9kZSBpbXNpYyBhbmQgYXBsaWMgbm9kZS4KPiA+ID4gICAgIFJlb3JkZXIgcHJvcGVydGllcyBp
biBzaW1zaWMsIHNhcGxpYywgbWltc2ljLCBhbmQgbWFwbGljIG5vZGVzCj4gPiA+ICAgICAgdG8g
bWF0Y2ggRFRTIGNvZGluZyBzdHlsZS4KPiA+ID4gdjM6IFJlbW92ZSAic3VwbSIgZnJvbSB0aGUg
cmlzY3YsaXNhLWV4dGVuc2lvbnMgbGlzdC4KPiA+ID4gdjI6IFJlbW92ZSBhbGlhc2VzIGZyb20g
azMuZHRzaSwgdGhleSBzaG91bGQgYmUgaW4gYm9hcmQgRFRTLgo+ID4gPiAgICAgVXBkYXRlZCBy
aXNjdixpc2EtZXh0ZW5zaW9ucyB3aXRoIG5ldyBleHRlbnNpb25zIGZyb20gdGhlIGV4dGVuc2lv
bnMueWFtbC4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sz
LmR0c2kgfCA1OTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA1OTAgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMy5kdHNpCj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uYTgxNWY4NWNmNWE2Cj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpCj4gPiA+IEBAIC0wLDAgKzEs
NTkwIEBACj4gLi4uCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgZC1jYWNoZS1zZXRzID0gPDI1
Nj47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDJfY2Fj
aGUwPjsKPiA+Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgbW11LXR5cGUgPSAicmlzY3Ysc3Yz
OSI7Cj4gPgo+ID4gSSB0aGluayB0aGlzIHNob3VsZCBiZSByaXNjdixzdjQ4PyBJSVJDIEszIHN1
cHBvcnRzIGl0LgoKWW91IGFyZSByaWdodCB0aGF0IHRoZSB1bmRlcmx5aW5nIFgxMDAgSVAgY29y
ZSBpcyBjYXBhYmxlIG9mIHN1cHBvcnRpbmcKYm90aCBTVjM5IGFuZCBTVjQ4LiBIb3dldmVyLCBu
b3QgSzMuCgo+ID4KPiBJIHdvdWxkIHNlY29uZCB0aGUgaWRlYSBoZXJlLCBpZiB0aGUgdW5kZXJs
eWluZyBoYXJkd2FyZSBzdXBwb3J0IHN2NDgsCj4gdGhlcmUgaXMgbm8gcmVhc29uIHdlIHNob3Vs
ZCBsaW1pdCBpdCBpbiBEVFMsIERUIHNob3VsZCByZWZsZWN0IHRoZSBhY3R1YWwKPiBoYXJkd2Fy
ZS4uIGlmIHVzZXIgc3RpbGwgcHJlZmVyIHRvIHVzZSBzdjM5IGZvciBzaW1wbGljaXR5LCBhICJu
bzRsdmwiCj4gY29tbWFuZCBsaW5lIGFyZ3VtZW50IGNhbiBiZSBwYXNzZWQuLiBzZWUKPiAgYXJj
aC9yaXNjdi9tbS9pbml0LmMgKzg2MCAtPiBzZXRfc2F0cF9tb2RlKCkKCkkgaGF2ZSBkb3VibGUt
Y2hlY2tlZCB3aXRoIFNwYWNlbWlULCBhY2NvcmRpbmcgdG8gU3BhY2VtaVQsIHdoaWxlIHRoZSBY
MTAwCmNvcmUgaXRzZWxmIHN1cHBvcnRzIGJvdGggU1YzOSBhbmQgU1Y0OCwgd2hlbiBpdCB3YXMg
aW50ZWdyYXRlZCBpbnRvIHRoZSBLMwpTb0MsIGl0IHdhcyBzcGVjaWZpY2FsbHkgY29uZmlndXJl
ZCB0byBzdXBwb3J0IG9ubHkgU1YzOS4KCkluIHRoaXMgY2FzZSwgdGhlIEszIFNvQydzIE1NVSBp
cyBjb25maWd1cmVkIGZvciBTVjM5IG9ubHksIHNvIG1tdS10eXBlID0KInJpc2N2LHN2MzkiIGlz
IHRoZSBjb3JyZWN0IHJlcHJlc2VudGF0aW9uLgoKQmVzdCByZWdhcmRzLApHdW9kb25nIFh1Cgo+
Cj4gLS0KPiBZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
