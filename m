Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC57C8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoC1qrs/zwDGA8lcExszaICsWsIK+JDHrszxgz7xyug=; b=BznWjdN98f7JOc
	lesfwj2+sGOJmLdJeQXWhxYXe+MdAvoJMoWzEIyqBDC/w9MgZQUmMmiGOvOIrNbTBpgexOJCnCYb5
	p2nP7jJbKsIfq3TwGFnNPjbXnOV7QIcsWuT+RWd9dp1gtOgKwwjSPai22fgQOmUmBUw+JdBlhLgrI
	DrSiTKhhKG2J6uPZhQMp/fOWOq4HBIjcV16+qIYEav30CdLosGiT8cLlknSGYjqPNAajG12kTJsv+
	+gqMrvzLizhiVYXwZ1BxMyD1SRL8in1pqzI5rDZwg1gp8r5kxrO+LVWKkHUZX8DMyYYlhKgGbqpcw
	iBV3OtGFO8ZMWc/DP3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYinn-000000026Jc-1FZ9;
	Mon, 07 Jul 2025 10:10:23 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiJN-000000020fd-3q6v
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 09:38:59 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-86cfc1b6dcaso97206339f.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 02:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1751881137; x=1752485937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgZsROmV74i3LKEIf/xZRowc3GM1ebMqOxLJS5yWzYQ=;
        b=jbzLqYh59+keisbp67lT3PkP72bWdi/qwhxaEZU/qeMaWhb7nZ6WGaNZF2cUurCR6z
         Xb4TVFJbDkfy6kKz6QE0qgP4tyoVbtpeE/zSOpXm/WLxizNFveJtBrePAvFSbB4vncXq
         cDdgLzgKN7b/j7N0p25mjwM5P6Fkoy1gGyo2werhmnQCRiX+cXGCdSUntO6x4qRW4XgZ
         IHFeSH1oTbFCCdpYkRyVIwhHakgNuY5FoJwyeYmOnylgh0/q6NQn/41WwcayHBpscGcN
         CFwtynrE31ORG+XBocD6/lJFBhCeYtbvGObeRvukC/xQCMcqZImFVmz/zUAOti489MYX
         1KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881137; x=1752485937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgZsROmV74i3LKEIf/xZRowc3GM1ebMqOxLJS5yWzYQ=;
        b=Fo1nVXOBx5iqVxwNpWpScPtdTA9RkCswtiS1ComPZhFe0Wdh09QF5aosSQyPAXyMEr
         1a8BDqFFCrBtsVp+2BEKBS3Dq91SyWyCzdWq/NUiDwdOScIFBxd0OAfz4gQVoiZgcEwa
         JY0//0KFg0i9EPkq7LirOMW0CapE1O9ihxTAA/l0Na3cSAsUygcDHoOyFby6wJN1UjaU
         nnt3j0ZA792avHNj/rDh6dgRQcNzYvv8zOJ99tiWcd3D7HQTyBl5eVGs3RO1SvrDr88L
         U3h7VI2pqVXTOD0sMcAP1Y8eI7ykEKfD8kqK/QmvDUNHKhpz6dXTrXHg0HsZJWWYWPSM
         2KhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY7r9KY+gaOR/2tH5g28ySN9A92bVReNuxAvRRHAh+NVJ4DHBD/mZnhGcYT+vAVHZRtRJqmdNGL1LJ1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuzMBU+AHvP96ckGF6AWeO8Xz0xit1hkFYDCgtdKJ0dfbtLjk0
	OG/cfZt/XsqOa99HtCqsh9kqG1WhX1PCtZZ5WYrz+jAfzwPv98OsvSLuLiU9mv/0NcSag1tWXC6
	pBA5kfGT8Gyb+wpwK6bDPRntvd+XmHIvp0QN/BM3dRg==
X-Gm-Gg: ASbGncsrwJKL482Bq8FLfaOJMqmf1Jr53z4Q0lhb5Su448nKy1cJ4mZcaD3c6naqhRf
	AbVE4uDYZGrRd43gmHa63d1x4t/iSq1VU49tk/jTc9RBYJBLyDHZOHTzTF1EJsi+1gdVCbUUv99
	4lR98ACYN+dW4Xhwgj+CfXLLSDd3iU1W1NbjySmP3pjdwU
X-Google-Smtp-Source: AGHT+IFKjzUQeQQI7LB5Qa2/KiIun4MBso9sECmrBCp6niwPJVZxqnnGmZUVkWEtGZmc3+SOF9owpQQYDocnGgSsvgQ=
X-Received: by 2002:a05:6e02:2589:b0:3dc:8b57:b76c with SMTP id
 e9e14a558f8ab-3e13ee92f38mr68372945ab.9.1751881136933; Mon, 07 Jul 2025
 02:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-25-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-25-ulf.hansson@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Jul 2025 15:08:45 +0530
X-Gm-Features: Ac12FXxDUsc83NMJbxmZApkih2qJ3f4DnyYJbjNzkyF_HKvftJAST2PYGqAG2oQ
Message-ID: <CAAhSdy06D-7PGbt4jR2rr2D_rJG4CnevHV+LJm-BZ7CxMpECQw@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
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
X-CRM114-CacheID: sfid-20250707_023857_953169_2D487A0D 
X-CRM114-Status: GOOD (  22.95  )
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCA1OjE44oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29u
QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIHJlY2VudCB1cGRhdGVzIHRvIHRoZSBnZW5wZCBj
b3JlLCBjYW4gZW50aXJlbHkgbWFuYWdlIHRoZSBzeW5jX3N0YXRlCj4gc3VwcG9ydCBmb3IgdGhl
IGNwdWlkbGUtcmlzY3Ytc2JpLWRvbWFpbi4gTW9yZSBwcmVjaXNlbHksIGdlbnBkIHByZXZlbnRz
Cj4gb3VyIC0+cG93ZXJfb2ZmKCkgY2FsbGJhY2sgZnJvbSBiZWluZyBpbnZva2VkLCB1bnRpbCBh
bGwgb2Ygb3VyIGNvbnN1bWVycwo+IGFyZSByZWFkeSBmb3IgaXQuCj4KPiBMZXQncyB0aGVyZWZv
cmUgZHJvcCB0aGUgc3luY19zdGF0ZSBzdXBwb3J0IGZvciB0aGUKPiBjcHVpZGxlLXJpc2N2LXNi
aS1kb21haW4gYXMgaXQgaGFzIGJlY29tZSByZWR1bmRhbnQuCj4KPiBDYzogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IFRlc3RlZC1ieTogSGlhZ28gRGUgRnJhbmNvIDxoaWFnby5mcmFuY29AdG9yYWRleC5jb20+
ICMgQ29saWJyaSBpTVg4WAo+IFRlc3RlZC1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQGlkZWFzb25ib2FyZC5jb20+ICMgVEkgQU02MkEsWGlsaW54IFp5bnFNUCBaQ1UxMDYKPiBT
aWduZWQtb2ZmLWJ5OiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMs
CkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jIHwgMjIg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIxIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxl
LXJpc2N2LXNiaS5jIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiBpbmRl
eCA4M2Q1OGQwMDg3MmYuLmEzNjBiYzRkMjBiNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWlk
bGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+ICsrKyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJp
c2N2LXNiaS5jCj4gQEAgLTQ0LDcgKzQ0LDYgQEAgc3RhdGljIERFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHN0cnVjdCBzYmlfY3B1aWRsZV9kYXRhLCBzYmlfY3B1aWRsZV9kYXRhKTsKPiAgc3Rh
dGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzYmlfZG9tYWluX3N0YXRlLCBkb21haW5fc3RhdGUp
Owo+ICBzdGF0aWMgYm9vbCBzYmlfY3B1aWRsZV91c2Vfb3NpOwo+ICBzdGF0aWMgYm9vbCBzYmlf
Y3B1aWRsZV91c2VfY3B1aHA7Cj4gLXN0YXRpYyBib29sIHNiaV9jcHVpZGxlX3BkX2FsbG93X2Rv
bWFpbl9zdGF0ZTsKPgo+ICBzdGF0aWMgaW5saW5lIHZvaWQgc2JpX3NldF9kb21haW5fc3RhdGUo
dTMyIHN0YXRlKQo+ICB7Cj4gQEAgLTM0NSwyMCArMzQ0LDYgQEAgc3RhdGljIGludCBzYmlfY3B1
aWRsZV9pbml0X2NwdShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBjcHUpCj4gICAgICAgICByZXR1
cm4gcmV0Owo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgc2JpX2NwdWlkbGVfZG9tYWluX3N5bmNfc3Rh
dGUoc3RydWN0IGRldmljZSAqZGV2KQo+IC17Cj4gLSAgICAgICBzdHJ1Y3Qgc2JpX3BkX3Byb3Zp
ZGVyICpwZF9wcm92aWRlcjsKPiAtCj4gLSAgICAgICAvKgo+IC0gICAgICAgICogQWxsIGRldmlj
ZXMgaGF2ZSBub3cgYmVlbiBhdHRhY2hlZC9wcm9iZWQgdG8gdGhlIFBNIGRvbWFpbgo+IC0gICAg
ICAgICogdG9wb2xvZ3ksIGhlbmNlIGl0J3MgZmluZSB0byBhbGxvdyBkb21haW4gc3RhdGVzIHRv
IGJlIHBpY2tlZC4KPiAtICAgICAgICAqLwo+IC0gICAgICAgc2JpX2NwdWlkbGVfcGRfYWxsb3df
ZG9tYWluX3N0YXRlID0gdHJ1ZTsKPiAtCj4gLSAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBk
X3Byb3ZpZGVyLCAmc2JpX3BkX3Byb3ZpZGVycywgbGluaykKPiAtICAgICAgICAgICAgICAgb2Zf
Z2VucGRfc3luY19zdGF0ZShwZF9wcm92aWRlci0+bm9kZSk7Cj4gLX0KPiAtCj4gICNpZmRlZiBD
T05GSUdfRFRfSURMRV9HRU5QRAo+Cj4gIHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVfcGRfcG93ZXJf
b2ZmKHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiAqcGQpCj4gQEAgLTM2OSw5ICszNTQsNiBAQCBz
dGF0aWMgaW50IHNiaV9jcHVpZGxlX3BkX3Bvd2VyX29mZihzdHJ1Y3QgZ2VuZXJpY19wbV9kb21h
aW4gKnBkKQo+ICAgICAgICAgaWYgKCFzdGF0ZS0+ZGF0YSkKPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDA7Cj4KPiAtICAgICAgIGlmICghc2JpX2NwdWlkbGVfcGRfYWxsb3dfZG9tYWluX3N0YXRl
KQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+IC0KPiAgICAgICAgIC8qIE9TSSBt
b2RlIGlzIGVuYWJsZWQsIHNldCB0aGUgY29ycmVzcG9uZGluZyBkb21haW4gc3RhdGUuICovCj4g
ICAgICAgICBwZF9zdGF0ZSA9IHN0YXRlLT5kYXRhOwo+ICAgICAgICAgc2JpX3NldF9kb21haW5f
c3RhdGUoKnBkX3N0YXRlKTsKPiBAQCAtNDAxLDggKzM4Myw3IEBAIHN0YXRpYyBpbnQgc2JpX3Bk
X2luaXQoc3RydWN0IGRldmljZV9ub2RlICpucCkKPiAgICAgICAgIGlmICghcGRfcHJvdmlkZXIp
Cj4gICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9wZDsKPgo+IC0gICAgICAgcGQtPmZsYWdzIHw9
IEdFTlBEX0ZMQUdfSVJRX1NBRkUgfCBHRU5QRF9GTEFHX0NQVV9ET01BSU4gfAo+IC0gICAgICAg
ICAgICAgICAgICAgIEdFTlBEX0ZMQUdfTk9fU1lOQ19TVEFURTsKPiArICAgICAgIHBkLT5mbGFn
cyB8PSBHRU5QRF9GTEFHX0lSUV9TQUZFIHwgR0VOUERfRkxBR19DUFVfRE9NQUlOOwo+Cj4gICAg
ICAgICAvKiBBbGxvdyBwb3dlciBvZmYgd2hlbiBPU0kgaXMgYXZhaWxhYmxlLiAqLwo+ICAgICAg
ICAgaWYgKHNiaV9jcHVpZGxlX3VzZV9vc2kpCj4gQEAgLTU3MCw3ICs1NTEsNiBAQCBzdGF0aWMg
c3RydWN0IHBsYXRmb3JtX2RyaXZlciBzYmlfY3B1aWRsZV9kcml2ZXIgPSB7Cj4gICAgICAgICAu
cHJvYmUgPSBzYmlfY3B1aWRsZV9wcm9iZSwKPiAgICAgICAgIC5kcml2ZXIgPSB7Cj4gICAgICAg
ICAgICAgICAgIC5uYW1lID0gInNiaS1jcHVpZGxlIiwKPiAtICAgICAgICAgICAgICAgLnN5bmNf
c3RhdGUgPSBzYmlfY3B1aWRsZV9kb21haW5fc3luY19zdGF0ZSwKPiAgICAgICAgIH0sCj4gIH07
Cj4KPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
