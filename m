Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DFCF3092A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeOhxwlWm8X8s0bMR1PdtS7tU8x1OvcrRsuZDjHbZuc=; b=DI9KNE20dxeLOh
	4pyL6/DZmTotGI5rtUy41LpoR18TJaSGgXPq9ZJh35qMFXWCXXbqpz8TDC2cv2tr8av+K8hq56JkL
	Qvm8x9RYQVD5hLEkZRgyDjK32qOXYbbjiazBtYoUOF9zA4CyxjjQNnNCl7jMzhz7XMnmWYRiAWABg
	weSC3m2uxXHkSMU5XWBmcO6HkdvnMCW8tD4kabXAHSz0D9wdE0wUd0A1woapceto1vDR7Oij9lnp1
	Q8vwiN1VQp9oVOy4aAI88sLfBc4Pai14e+cyX87vM5XVWSAUfaC4FET3XC7AXwDTZuabLnBflTsGz
	B64jYz91eQfeQnL9BGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XJ-00000001UpZ-3GDz;
	Thu, 05 Mar 2026 10:02:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XG-00000001UiM-2TsC
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=; b=VqrQ+vEETWVjwsmTqMOoM0R/05
	0++YbyPv/Peg/tnmVj/skMvrv4MJDKI1yuQ0w+r8c97bdIaO6MkH0fFRoU02CnccFGhlulegymU6m
	x7hE2tA82SXF5V+o0d7Ckowi8Vah1rGMxOW+LyhV9GSDUjpOHcbj7KalmOZCj+mJPR1R3TKcaVd/a
	8tBZHJAd6sGmo2tJZykMuI85OtWA6MckQTlPEupE+AOPQY6I+5n2OeHmgkQNdw8rjTpDL2tpgoLrV
	yDkXBxqOHnxvTpgwE7kq2vkyQZ8p21fAVxCgDxJZeAYQpvJ6prMH/8Y1L89A7FpIxFmItaiIAV3Qz
	eGFDzv6g==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XB-00000006QKf-4BzD
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48371bb515eso116816435e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 02:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772704940; x=1773309740; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=UHBNqox5xeZikJqSm8QmS4wtXg1G38GZ+PnBAuzXRfRytdhe5a9idPZRkDlMQMFIPm
         Z+tywU4A9mo1vQlCT7EHhr0lXuE+DxX3kO56uXUZjmrVyPAWLDPHkWhqM7tlbZkFfZBK
         Fcy9V9t+/+hJoBaNgY7crLL/e6jiDBQ6vdTmpm5tDvJWWJqflC0cJ/p33VTpjUzZVE8q
         syoPYCwmCMZNQS2uY9hRwhnnC0tg0XJNy7hlpgIHVLVUp6gU0yoZsJiY797OpZU9PcUW
         5ZsD0ZypA/wKnI8Sb6fvAX6XKifNWe8lJGh2+fbgXMTOKtdklOTZLC7wDnPWvicmb+Cq
         oTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704940; x=1773309740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=Btylqaj7MZ1DwQyzPj9a4NYRD9HnKNnkjvsEfaHuOnR8+CdP4YMw/qQpbMLacdOhyD
         AvxMNJmLRqkidvU+8WRSbfkuSfcnrlzx1uAA0siI8I1+zfMISH188o86UF7tbF2kAJDy
         UFy872M4yEjLBplwCk88BZMhdH0fY5P+RCH95gE20Yuj8EGpDb62LaYLOzZeBCwFSr+Y
         v+KT2zZ+Rrnf+pL0kiXodmDdfsZxRycr+RtpkPHaAklNKG6LdL8srNtSsxZUEQZBZpmq
         WpxLmOwMSNE+/CG5EOAEOKXwj6bGTx2LaY30/Oid6/QQ+MHl/2D8atZkDjyXkFxGOUay
         VVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhEYKjHXX8v8zOxrX6PG3EyNR1mKC+22CYf7AL8td0WHepiCf5FRWnwz2E1jcfzj5H38TKqboIjgXL5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNoeJSGYPkR4Q16yjc/S2R0w343VmtEJHx+5HAhwS2am2H9M+b
	UlItwG+MdcX2oygFenZ7SOLuArmk85cglNaDBMJ0+2DpYfaDw1kzJmCjuXYPfneGBQA=
X-Gm-Gg: ATEYQzxR/tgVA3AZmP02DRIHfHKiOgY7BD9g/aHUlvuwcVU1gHEZigTGvzSLZKW9sEd
	KyR7rw/CJiRebgzsQPl4Lctnei8xpqePzUMOjFxme58d71rHBOIYzwLGILCiK09E/zt/5tMxBV4
	iGIPCWf4eNUok6LT1+q7yaPCDmM2AhmXmYZMEkYoHKkgf87Hc5vytsF8Ud2o6Nz+OBI9J0PDcMw
	g36bPsBt6hJSbNDyCevAorTcE8ykPV4g+dWbrJuHMFjJ7NKqTUt+W51XcjNiGTS7/3/t25aihCt
	8oNz1kNDL7i9nBErVYx6wNdYjgpOnToGkr+YjVu7BiGUGvRX+OEcwKiNGlqJJr2d/qhnTu0EIG9
	BCF7/vJfri/AgsMgBSdASv24IP727MxKX38h1K/bBUjjELfQ51MjMhm7mArEncqpway3mJ9Fmzn
	qp0WvhIeHlFeYQgUtGKt3hhD5bl8UE
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4851988f31dmr86977045e9.23.1772704939633;
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Received: from salami.lan ([212.129.84.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fade9fdsm59453655e9.4.2026.03.05.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Message-ID: <030737fd255a49288349f06e8c1217a126ea9081.camel@linaro.org>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where
 missing
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>
Date: Thu, 05 Mar 2026 10:02:16 +0000
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100222_082142_A7BD9DB6 
X-CRM114-Status: UNSURE (   8.11  )
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

T24gV2VkLCAyMDI2LTAzLTA0IGF0IDE5OjU3ICswMjAwLCBWbGFkaW1pciBPbHRlYW4gd3JvdGU6
Cj4gSXQgYXBwZWFycyB0aGF0IHRoZSBwaHktbWFwcGhvbmUtbWRtNjYwMCwgcGh5LXFjb20tc25w
cy1mZW10by12MiwKPiBwaHktcmNhci1nZW4zLXBjaWUsIHI4YTc3OWYwLWV0aGVyLXNlcmRlcyBh
bmQgcGh5LXJvY2tjaGlwLXR5cGVjIGRyaXZlcnMKPiBjYWxsIHJ1bnRpbWUgUE0gb3BlcmF0aW9u
cyB3aXRob3V0IGluY2x1ZGluZyB0aGUgcHJvcGVyIGhlYWRlci4KPiAKPiBUaGlzIHdhcyBwcm92
aWRlZCBieSA8bGludXgvcGh5L3BoeS5oPiBidXQgbm8gZnVuY3Rpb24gZXhwb3J0ZWQgYnkgdGhp
cwo+IGhlYWRlciBkaXJlY3RseSBuZWVkcyBpdC4gU28gd2UgbmVlZCB0byBkcm9wIGl0IGZyb20g
dGhlcmUsIGFuZCBmaXggdXAKPiBkcml2ZXJzIHRoYXQgdXNlZCB0byBkZXBlbmQgb24gdGhhdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRlYW4gPHZsYWRpbWlyLm9sdGVhbkBueHAu
Y29tPgoKPiDCoGRyaXZlcnMvcGh5L3BoeS1nb29nbGUtdXNiLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKCkZvciBHb29nbGU6ClJldmlld2VkLWJ5OiBBbmRyw6kg
RHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
