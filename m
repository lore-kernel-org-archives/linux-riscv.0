Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EB6FCC9AF
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 02:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjJvY8AnVUIQ/GhKWsOAuGHkxlsqUIx4Qn1Vk16377Y=; b=sAeyIUNUcNJlg2
	AIRA8BITLy9ismwkEh7pu8yyzK3UPe/9RCijiZgUE/FEvtBwjFRQpN5IG7ccsB0d0HArrwWitsTba
	Fdj6S33YM+gSrQL4putRWxBC0X5OSK5q+TCmGmeF/2vybrAbldZr0A+fFLZe6aKiiR53UGPvci7IO
	ERK6dK0iRW2+8COFcEyMR3qOvk1xurRj/NYBZ7MulX8tqOB5n4TK1U7EcJ+XtdRk2DGWx1CJCoz65
	WJu2WYZOBPwLFB+19mH6Qz1FCNq8NXc2qOLJ/3Ice1x19yLC82VbKV3Bpsg6XV0h6C66X9m8wdOSb
	YCs2I6hFtckhxuQhqgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn5y-00000008aNO-2iP1;
	Tue, 10 Mar 2026 02:45:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzn5w-00000008aM4-2unN
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 02:45:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0200340981
	for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 02:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB25EC2BCB4
	for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 02:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110715;
	bh=AiuSbGc4gyF+r0NsVvYBegnqTPdAIt4V0L/szs51RLs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=OYQ4GzGrjp8DJFWsl2mM6ocePlwxv12ixt2gG1IoJH8dIMcy2K9jYlYp0xrXUr1hj
	 vdJ1Hmp0SjmxQ+VCPPiqJlGt8YHvrtJ6IjbgXtVQ4LMZbCg9LwXbL8lu4+PBO7sjsL
	 4s38j0P9Pc/iUqjSuchyjIAcNbjA/RLX+hPcWwe8rEaxzhE3zj7CNgU19ws9MZxPyz
	 jVvlhgVmpbBARm+YBqB5I7YjjmX/kwY2NwSC8hyTJgVaSFIJVMQTWw9r0B2mnIUaZ+
	 dgdQe+dNt9cNuRA9+q+H8NVNiXnbOpLUOvVf27C6ZPPIJpRz4lQ5Rxab9sF8pu86xC
	 ckfjVXnxFH4qg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a2544b52bso71084201fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 19:45:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3ruCa5ENKGb61EW50ct2dNrqUdB+FnsuDt2M8FaL9uddcN8bBCYCyeNv4zRs4W0kh+YGrtR4HQWqxSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFNMcQSYdvUryS+Jcx3fW5xh/RwYQ6NosodavFWJEfAKWgtQUK
	dpi318jmfRcJrOtNMOR5c3h4G8f5pLR0e3NRm9dU9XYgfhtYpqgq/p0oig3IljX0C/vfZnvEtwY
	2mv0fFxPxpTpbpJcZyxX7k43/ZJWrlj0=
X-Received: by 2002:a05:651c:1104:b0:385:c21f:37e1 with SMTP id
 38308e7fff4ca-38a40b6a2d2mr40186201fa.15.1773110714064; Mon, 09 Mar 2026
 19:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260309190842.927634-1-vladimir.oltean@nxp.com> <20260309190842.927634-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260309190842.927634-18-vladimir.oltean@nxp.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 10:45:01 +0800
X-Gmail-Original-Message-ID: <CAGb2v65surpnqrmv4tbH4TSrx6SaTpdbsQtCsNqwse5xwdb8fA@mail.gmail.com>
X-Gm-Features: AaiRm535EaFxYtCAjq5FIkHiBmgOxc7_e434rO98DZfg5NrM7RTttw3IOCzqW1Y
Message-ID: <CAGb2v65surpnqrmv4tbH4TSrx6SaTpdbsQtCsNqwse5xwdb8fA@mail.gmail.com>
Subject: Re: [PATCH v3 phy-next 17/24] media: sunxi: a83-mips-csi2: include
 PHY provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_194516_771333_CEA64090 
X-CRM114-Status: GOOD (  19.38  )
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMzoxMOKAr0FNIFZsYWRpbWlyIE9sdGVhbiA8dmxhZGlt
aXIub2x0ZWFuQG54cC5jb20+IHdyb3RlOgo+Cj4gVGhlIGludHJvZHVjdGlvbiBjb21taXQgNTc2
ZDE5NmM1MjJiICgibWVkaWE6IHN1bnhpOiBBZGQgc3VwcG9ydCBmb3IgdGhlCj4gQTgzVCBNSVBJ
IENTSS0yIGNvbnRyb2xsZXIiKSBzYXlzOgo+Cj4gICAgIFRoaXMgaW1wbGVtZW50YXRpb24gc3Bs
aXRzIHRoZSBwcm90b2NvbCBhbmQgRC1QSFkgcmVnaXN0ZXJzIGFuZAo+ICAgICB1c2VzIHRoZSBQ
SFkgZnJhbWV3b3JrIGludGVybmFsbHkuIFRoZSBELVBIWSBpcyBub3QgcmVnaXN0ZXJlZCBhcyBh
Cj4gICAgIHN0YW5kYWxvbmUgUEhZIGRyaXZlciBzaW5jZSBpdCBjYW5ub3QgYmUgdXNlZCB3aXRo
IGFueSBvdGhlcgo+ICAgICBjb250cm9sbGVyLgo+Cj4gSG93ZXZlciwgdGhpcyBkb2VzIG5vdCBt
YXR0ZXIsIGFuZCBpcyBub3QgdGhlIG9ubHkgaW5zdGFuY2Ugb2YgdGlnaHQgUEhZCj4gcHJvdmlk
ZXIgPC0+IGNvbnN1bWVyIHBhaXJpbmcuIEFjY29yZGluZyB0byBWaW5vZCBLb3VsLCBoYXZpbmcg
UEhZCj4gcHJvdmlkZXIgZHJpdmVycyBvdXRzaWRlIG9mIGRyaXZlcnMvcGh5LyBpcyBkaXNjb3Vy
YWdlZCwgYWx0aG91Z2ggaXQKPiB3b3VsZCBiZSBkaWZmaWN1bHQgZm9yIG1lIHRvIGFkZHJlc3Mg
YSBwcm9wZXIgbW92ZW1lbnQgaGVyZS4KPgo+IFNvIGp1c3QgaW5jbHVkZSB0aGUgcHJpdmF0ZSBw
cm92aWRlciBBUEkgaGVhZGVyIGZyb20gZHJpdmVycy9waHkvIGFuZAo+IGxlYXZlIGEgRklYTUUg
aW4gcGxhY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRlYW4gPHZsYWRpbWlyLm9s
dGVhbkBueHAuY29tPgoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0BrZXJuZWwub3JnPgoK
PiAtLS0KPiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+Cj4g
Q2M6IENoZW4tWXUgVHNhaSA8d2Vuc0BrZXJuZWwub3JnPgo+IENjOiBKZXJuZWogU2tyYWJlYyA8
amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgo+IENjOiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNo
b2xsYW5kLm9yZz4KPgo+IHYxLT52Mzogbm9uZQo+IC0tLQo+ICAuLi4vbWVkaWEvcGxhdGZvcm0v
c3VueGkvc3VuOGktYTgzdC1taXBpLWNzaTIvc3VuOGlfYTgzdF9kcGh5LmMgfCAyICstCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3VueGkvc3VuOGktYTgzdC1taXBpLWNzaTIvc3Vu
OGlfYTgzdF9kcGh5LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N1bnhpL3N1bjhpLWE4M3Qt
bWlwaS1jc2kyL3N1bjhpX2E4M3RfZHBoeS5jCj4gaW5kZXggMjRiYmNjODUwMTNkLi4xMTQzZmVl
YjRmY2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdW54aS9zdW44aS1h
ODN0LW1pcGktY3NpMi9zdW44aV9hODN0X2RwaHkuYwo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vc3VueGkvc3VuOGktYTgzdC1taXBpLWNzaTIvc3VuOGlfYTgzdF9kcGh5LmMKPiBAQCAt
NCw5ICs0LDkgQEAKPiAgICogQXV0aG9yOiBQYXVsIEtvY2lhbGtvd3NraSA8cGF1bC5rb2NpYWxr
b3dza2lAYm9vdGxpbi5jb20+Cj4gICAqLwo+Cj4gLSNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPgo+ICsjaW5jbHVkZSAiLi4vLi4vLi4vLi4v
cGh5L3BoeS1wcm92aWRlci5oIiAvKiBGSVhNRSAqLwo+ICAjaW5jbHVkZSAic3VuOGlfYTgzdF9k
cGh5LmgiCj4gICNpbmNsdWRlICJzdW44aV9hODN0X21pcGlfY3NpMi5oIgo+Cj4gLS0KPiAyLjQz
LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
