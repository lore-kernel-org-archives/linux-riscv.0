Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F3C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukMSa0MQYPXtEAnb3RqL0OBBf37hc6LlJX7wB2RlSao=; b=gOZV3mt3WZkb9t
	k2o6pWmmChbaBj3Z0vO4xVA17BYRMKz+l8tWyZTHzNNUvaag0GuFldWzmycgQttbSjZr6SsKQWZgw
	Jx2coxk5yPmu48MIwiA1fmFpPhFLoDnabuygGxW1bqjwC9fDjssXWO5OOslI2jlFyq/0kq4WG6z84
	JHP77t87Rj+EcEw0QoS8+JzqmXi4xyphWxI4dXjw6HklTkJZPTmY5+npSICkIunCpvU7sewlE/XS8
	gWRLXq5/9/7j45QoWYqbP+r8OuZZzYR+7QvK5ha7KwTsxQiyGkOo2DapTBL5t3tG58FNViy3fRNun
	IYd6YBLH1YWqnn93wetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYijB-000000025dP-1ysH;
	Mon, 07 Jul 2025 10:05:37 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiHc-000000020J8-1MxW
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 09:37:10 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3df3ce3ec91so9861345ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1751881027; x=1752485827; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VfweRdHv9ufprfg1Atwss0HvbCxmH7kEC9W20OMaU4=;
        b=EIz52Ym142nL2Joi3Ze+z+hVwzhdZa0zngK2bu5fv+qnD3Un60tdMtnlYkzvW24bLX
         DL6ihoa188WceagjEy2XmNWMzPyfei6FI/K8K9400zgoQz9QU3dqDgh8qZcmMiodOypg
         1mtiqb6rirISRaIl9Gp6RKMGxw5tydmMl+jhaqThbnNjXR8Y6ATaQ1EOvkgN9t4IjlJp
         6Rfc0tFv9xkKUbeZj1ZN/6fMD/4BHHFlfHJ93pHKAtKcaGPnNwgVMwTuywtCjFxLWp6/
         fnbT3lF2TyuVTjf6lW3fmH/nalv1XrvJq2xE8IBYdV/ablrjW4xcebIOBzl1hHvDB/hk
         WA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881027; x=1752485827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VfweRdHv9ufprfg1Atwss0HvbCxmH7kEC9W20OMaU4=;
        b=xRcAg05MSBQ32AxVokH38rrtOU2+o8T2/WBByqfIP5mi9dU1sufXrFKQfEKDuy24NR
         0+pqOAgCmN1QAkXZ0qUZuapgECjBWJiQxEqRUF/BScH6RNj/qHUr5Eq0XUpkWxJN4JmR
         VVrkbOGPOz4S3MYeP/FSV2c9Vp0dtDqYG4JLIuyN9AxmCew4WP4UCsfbNf1ww6bsBWUf
         RXnQfEVAq0HCvfdu2PbN4xqq+XfxnjMzjOwDZgQ7wfFCaLSlYmVPGPT79/5oX5DWVXCi
         IuUYVdBrDVNF1bQSkuCF7lZD1bQ7TltdNTb9o1oJnVxiIi/WMvMeAs++RKDv77FXhOrN
         8f+w==
X-Forwarded-Encrypted: i=1; AJvYcCVV0BESARFYaZNU45ChMlARI3bN9VWBxI7pGc65isxY3R8wxfwlt8SwrpHGCT48xlP1K2l+aHTnrOjj4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0g4OqbWMWzvW9G63haBTzkseo5FQGceUwlusGqTJS5yhpqTGK
	Sy49nLPItfea6aRkTt1xusxsvBN/xb6M7q9aEYYATperzlLfIRXGSdGypDon8dDqh/+kjVCVgoH
	+N6M9HPYJ/saYkPArwbCzjLyro4H+7u0fGsd9qyX/0g==
X-Gm-Gg: ASbGncspuEd+w4k3oZBDyFp++A+rcTPjGn+x+DI67X5+xNHdVHu4TMMsFxeW0Ak1VuD
	hR4vvBlKQUKvyXCMU97ON9Wzo1vOgWpy6kocFVsdPNoj0r941Uut3PcccM0Crq0h9mBNUOnTYDh
	NFfPncZHd/tWhYng+1Szwo2146TBK5ptBVrdR1aEAypmcu
X-Google-Smtp-Source: AGHT+IH+SePIS0aSzniflQp0S8Iw7JaUsbC6szdrpRvO5SkC/AQGSEVL3nboJR1AEhxiDDNFmQa8kIbvcXwwHXpVOK4=
X-Received: by 2002:a05:6e02:380d:b0:3df:2f47:dc21 with SMTP id
 e9e14a558f8ab-3e137204107mr107268135ab.22.1751881026965; Mon, 07 Jul 2025
 02:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-12-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-12-ulf.hansson@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Jul 2025 15:06:55 +0530
X-Gm-Features: Ac12FXxpaKMFAHlr5TcRHSgcV-Hs57tR_KopRD8ZRlv3-fvgnPWZ2ytZglu0vVg
Message-ID: <CAAhSdy1V_hGt8CG4CBVTAeYk07Nbd7aT3WtJrgXhnsj7rUpQvg@mail.gmail.com>
Subject: Re: [PATCH v3 11/24] cpuidle: riscv-sbi: Opt-out from genpd's common
 ->sync_state() support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023708_599673_981AD6FE 
X-CRM114-Status: GOOD (  17.67  )
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCA1OjE34oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29u
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIHJpc2N2LXNiaS1kb21haW4gaW1wbGVtZW50cyBp
dHMgb3duIHNwZWNpZmljIC0+c3luY19zdGF0ZSgpIGNhbGxiYWNrLgo+IExldCdzIHNldCB0aGUg
R0VOUERfRkxBR19OT19TWU5DX1NUQVRFIHRvIGluZm9ybSBnZW5wZCBhYm91dCBpdC4KPgo+IE1v
cmVvdmVyLCBsZXQncyBjYWxsIG9mX2dlbnBkX3N5bmNfc3RhdGUoKSB0byBtYWtlIHN1cmUgZ2Vu
cGQgdHJpZXMgdG8KPiBwb3dlciBvZmYgdW51c2VkIFBNIGRvbWFpbnMuCj4KPiBDYzogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IFRlc3RlZC1ieTogSGlhZ28gRGUgRnJhbmNvIDxoaWFnby5mcmFuY29AdG9yYWRl
eC5jb20+ICMgQ29saWJyaSBpTVg4WAo+IFRlc3RlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+ICMgVEkgQU02MkEsWGlsaW54IFp5bnFNUCBaQ1Ux
MDYKPiBTaWduZWQtb2ZmLWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5j
IHwgOCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2Jp
LmMgYi9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+IGluZGV4IDBmZTFlY2U5
ZmJkYy4uODNkNThkMDA4NzJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxl
LXJpc2N2LXNiaS5jCj4gKysrIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMK
PiBAQCAtMzQ3LDExICszNDcsMTYgQEAgc3RhdGljIGludCBzYmlfY3B1aWRsZV9pbml0X2NwdShz
dHJ1Y3QgZGV2aWNlICpkZXYsIGludCBjcHUpCj4KPiAgc3RhdGljIHZvaWQgc2JpX2NwdWlkbGVf
ZG9tYWluX3N5bmNfc3RhdGUoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gKyAgICAgICBzdHJ1
Y3Qgc2JpX3BkX3Byb3ZpZGVyICpwZF9wcm92aWRlcjsKPiArCj4gICAgICAgICAvKgo+ICAgICAg
ICAgICogQWxsIGRldmljZXMgaGF2ZSBub3cgYmVlbiBhdHRhY2hlZC9wcm9iZWQgdG8gdGhlIFBN
IGRvbWFpbgo+ICAgICAgICAgICogdG9wb2xvZ3ksIGhlbmNlIGl0J3MgZmluZSB0byBhbGxvdyBk
b21haW4gc3RhdGVzIHRvIGJlIHBpY2tlZC4KPiAgICAgICAgICAqLwo+ICAgICAgICAgc2JpX2Nw
dWlkbGVfcGRfYWxsb3dfZG9tYWluX3N0YXRlID0gdHJ1ZTsKPiArCj4gKyAgICAgICBsaXN0X2Zv
cl9lYWNoX2VudHJ5KHBkX3Byb3ZpZGVyLCAmc2JpX3BkX3Byb3ZpZGVycywgbGluaykKPiArICAg
ICAgICAgICAgICAgb2ZfZ2VucGRfc3luY19zdGF0ZShwZF9wcm92aWRlci0+bm9kZSk7Cj4gIH0K
Pgo+ICAjaWZkZWYgQ09ORklHX0RUX0lETEVfR0VOUEQKPiBAQCAtMzk2LDcgKzQwMSw4IEBAIHN0
YXRpYyBpbnQgc2JpX3BkX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiAgICAgICAgIGlm
ICghcGRfcHJvdmlkZXIpCj4gICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9wZDsKPgo+IC0gICAg
ICAgcGQtPmZsYWdzIHw9IEdFTlBEX0ZMQUdfSVJRX1NBRkUgfCBHRU5QRF9GTEFHX0NQVV9ET01B
SU47Cj4gKyAgICAgICBwZC0+ZmxhZ3MgfD0gR0VOUERfRkxBR19JUlFfU0FGRSB8IEdFTlBEX0ZM
QUdfQ1BVX0RPTUFJTiB8Cj4gKyAgICAgICAgICAgICAgICAgICAgR0VOUERfRkxBR19OT19TWU5D
X1NUQVRFOwo+Cj4gICAgICAgICAvKiBBbGxvdyBwb3dlciBvZmYgd2hlbiBPU0kgaXMgYXZhaWxh
YmxlLiAqLwo+ICAgICAgICAgaWYgKHNiaV9jcHVpZGxlX3VzZV9vc2kpCj4gLS0KPiAyLjQzLjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
