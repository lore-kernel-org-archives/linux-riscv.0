Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CEFC8303D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 11:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cM510sFt3OloepgREbb5CNVHjGrOBQqPMH9CvvOrdp4=; b=39b4LjzvKvbs2I
	cPo9Vz8mGpRIQIx5fe3Hc2HgdcYtEqlTE1c8pLoH3ZtpnGwpHRcv8ZK2DX5t+/K4z9va9jPpbCZDU
	g21dMbHy0oYgdikDx3iKItljy5aG2xGbuzeywh+ZEGiOhOwfxkUxRODEIXcb1VLvbsUT3E2NHnggE
	c/w1NNAX8jV/pvNf6TNsznMhZcQpS7LlcbAXfFMPvWFHhZ89D2ccsLCH8y4CmrC872wM9og8OjXLp
	6hTygmIE0xEDwZ+WpVy3MDvXetdDVASVmA0Gn+/2TWnAK2sjJcRrteT/VrdyxgFwMGFCMsC2INDHA
	36Tx3qK7QIfAiSvjTplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeRV-0000000EBHf-3Wxo;
	Fri, 04 Jul 2025 11:18:57 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdRT-0000000E18S-35ct
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 10:14:53 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso906030a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 03:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751624090; x=1752228890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4fTZsufhobrcLHUOAcRJ3Fl2i32zbzHVNr3uBnZDQ4=;
        b=P2WG3TnVcGeIrdbJtab1NHXUWdf8r/TarPVvVleN7Tpj7FT9HpSq5prOtO7vGhcLLx
         QRHrvbvCKVrkJ4wAH1ZZYqvKHdgVwo3sa6EaivzYlSd+b/TVWXigcCUcTFK4EJhsvWx7
         LzWzPU+tHSeVaf3ZJK+GAe9s2D7KN97IxL6ATv03APxnQXdpqjwoIgDo4Ee/9CRsP0pX
         ljngOalqDTQIggxdQr6vWOPy+Y/wPeel8uolbcKTReP1RBzdEDaDDvkkLKgmkdzwgg9M
         Nqekyzotb35j6CsOU9W6E9tpPOmLvlBQ0n8ezXuLDdTJ8NJ9J0DQxLeu7kDF0fmVenxn
         4smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624090; x=1752228890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4fTZsufhobrcLHUOAcRJ3Fl2i32zbzHVNr3uBnZDQ4=;
        b=azwzbcNe9j5dNrn2H7TiF77VnYJKdXe0CZYUqVsHW/9mCZTMK5ncABl3EuXVb7vWI4
         VpOWtiEkgHmunugCznmF52aLfDuyjSnaOn//pyinp29XBnw3P86/BdwTt9u8SufbYHpb
         b1PEs9rNPmtjUHzMesg2ve3DTPJ1TrUcohcXTNVbN17QQ4lexzcd20XPPUIxFqI4e9nJ
         myieqFXbC7620I8imsNVkaFV44hxmrDAnM4ZTBkzzFv2GHTVHtperS2Y7SSMBss7gdHr
         BygpOHNd9WN9VzWyrI38fts89KH3zLC5bgFcsjVWQY6fulLBMdFQ4lNZ5gtXKTNX/YQt
         FEOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWkIKl1wes4NbFmJ/7Shq2o2sUQneJrS/IufufCdgzJ7t0KYObAIe/J2Wa3b6iB1heRaJiFApc5AC3qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyAeTUs8a7B6El0GPUCLOCrQb4QxzPHI5LWU3ZrHx0dszHx+Y61
	WnmnABT92+/XGy25PyUXbTd7TC/IF8mi94AztwJ+JZPOfNW6GVIaWoxDHjQ3JYf2BWd0QW9Kci6
	SAXM+iOhnOFAM8XFuOiuMaFl7re2wximbTeu/HuAQtKHqSdcATRGQJhJ8SA==
X-Gm-Gg: ASbGnctKieO5CAuvhWwC8au9+UQM/fTnh54c1ssfSYrFofsjoih+qQbNuGEThTV9ncj
	XlCQyVg/FgGZqSee08zusBjPs/CEevWPjpSsGK6vDbU92APWjdDWutbqD2d+WftBBMMAbTvV810
	1M3+Vk06UQ3vc6AAi8ZkahDOZ2gFoWvZ9whwv2/C9uRjNwATYjM/FLrnxKNit3dFe6FyC95q90I
	UlW
X-Google-Smtp-Source: AGHT+IFjwg/psNUtt35b9Gmob0BLVqWk1GkmmuqjzaAL0gJFNIEsazYmsIVCo4iVpxvsNBxNzV3/0MwU6x9tzdeiXKA=
X-Received: by 2002:a17:90b:1fc3:b0:313:23ed:6ff with SMTP id
 98e67ed59e1d1-31aadcf4979mr1915406a91.1.1751624090581; Fri, 04 Jul 2025
 03:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-12-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-12-ulf.hansson@linaro.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 4 Jul 2025 15:44:14 +0530
X-Gm-Features: Ac12FXyDa0B0X6sfvOQzisE8yH6dk2kS-j3Pq5vg4WlBzfStBdZqCfBVav2JDDs
Message-ID: <CA+Oz1=ZnwUX2_s0rvY28um8eMDqqWKkJ5KRc+hqgL_7ghQf8Wg@mail.gmail.com>
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
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_031451_766747_7A3B32EF 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCA1OjIw4oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29u
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
PiAtLS0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCA4ICsrKysrKyst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgoKTEdU
TQoKUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cnBhdGhha0B2ZW50YW5hbWljcm8uY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
