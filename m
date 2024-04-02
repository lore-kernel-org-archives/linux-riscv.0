Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B66BCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7nyls0Hnk44gKBp35QPk/fuDj27NZxeLuqlCwQ0E3Q=; b=4C0xxMV2Ozkw34
	MLMaZhwWi8Fdpa/DE1GT4NboSVmkWSv+XuTsYoTmmvUww1NmDso2drwnCl2N3Sg4laN81Y9GwaHz/
	YruMWPDE6MalOLrXmZ8meEYmqEcM2v2sHQCoKoG12OG4Zdip+UPlvFs6kBDMt51vCUexEcW/WhB02
	cU8yQYOHZV3cm8REstxyiH5BxnuT1jo6HWIda92UigluvnEJvURPUTcJRIdayGo8dl+OKhUgFx6Ad
	g1220OeOPs+EsVAbiUcVE7npV54mFuktOFxC/Sh1jlH6QZoyU7Cah9jlu0Fl282T0qk3RIrFtgpSd
	IsRIWCOy/RQEIZV4ph8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdCp-0000000B2ft-06Ua;
	Tue, 02 Apr 2024 12:25:35 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdCj-0000000B2cp-1n2y
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 12:25:33 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-61495e769bdso19093457b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712060727; x=1712665527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYDEIQksW8zQ45WbeyUEVn5ldQ4luRyFOVVyheFSkHo=;
        b=z6urLKOivvOt8R73V0DdXKcZdzAGLMJ8HWiGB3gbTIKvuM0NcdypDBeFtjn9Kc2N3U
         LB/MF3Vx671XWNJTP5mGlT+kuDhJkLhreC0wSyGkGNkv12cVzstOcga4Ax1k3aQ+RCrW
         RmuirjfkFUOLaijwJV3PqEbY9XUTF1ZaaIdseAer9rkAW6Ecwe+0ubT9e/Xy37QIgpcp
         SznwplqTWi/7dRdwf1hjvHaNa3j5/wf2Ef1Hp3e98zWos2QWl9hAeI2t9wl2Ceb/F9hT
         Xt0j4sSSKZ/62qKGpIGQ+ffvvlPgqkYDC5SeFvuLo4CLCF3ok1TXufKPP+9KnEMeDpJo
         uAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712060727; x=1712665527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYDEIQksW8zQ45WbeyUEVn5ldQ4luRyFOVVyheFSkHo=;
        b=C+WbDM8aztbPPTcmCl+s+O7nxfx/AvqcHHxFUN7KZBM/4AyuWpBrijZUCq130Xx0Lm
         zep4M+bjgzrCGmHLFPqSDXcPFNT62ICwML78Zqtcx01gdqikdRPrxeGw1VKzB54jAI76
         U3OVNd7GiQ7PJlUdN1IcIYSoy2493lH5E5zEIf370CLa1QRBVnG4YNYg+OxM7vR9y1Jq
         ilmLzDicAFlOwtVG0RFkmo3T0N0eyw4LQHkza+FLRTk4AuyAdGD7FdTT5j03DiY6iWME
         02c0veVhv0o/Pi0IA5PxmSri66XmVxffK4fhjpSlZjQDH90fbV5Cl/MM3ZlgoY0ehcsa
         LdTA==
X-Forwarded-Encrypted: i=1; AJvYcCX3/gn5K5A3coIIHH7S9/mIWd8+HQIygyDBCz1horEd3fVol9lUjOyu94lofl5UCTVJnlkOQqCI+YAvwO/V639EnBvyQ3lNu+7KjnI8n7mx
X-Gm-Message-State: AOJu0Yxp6yUU6a82I7a5H+LIT2xcOggx+l7FNTz6ZtOzfFdrzkzx8GUh
	mtbfZ4NQE/b8GbR3uQ+zDuauPdaQAviymo6fbt3e925McvCjF9JgC8wlsR6+ACLWbDinOsX/E6i
	EMuTzPIiIUwMuXTmVcY2nckOm27OsRLLE7b7vnw==
X-Google-Smtp-Source: AGHT+IFUrSspS0uEXi4Mtdf0lWq2f6Bt6/664idaePnQ5n7gs/Aofr4lkRbBJPYECBaOux5ZgxpPBc0T/C/GsKmHDRA=
X-Received: by 2002:a5b:104:0:b0:dcc:ec02:38b0 with SMTP id
 4-20020a5b0104000000b00dccec0238b0mr8733778ybx.64.1712060727251; Tue, 02 Apr
 2024 05:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com> <20240327160314.9982-3-apais@linux.microsoft.com>
In-Reply-To: <20240327160314.9982-3-apais@linux.microsoft.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:25:15 +0200
Message-ID: <CACRpkdaSBGe0EFm1gK-7qPK4e6T2H1dxFXjhJqO2hWCm1-bNdA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org, 
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, 
	peter.ujfalusi@gmail.com, kys@microsoft.com, haiyangz@microsoft.com, 
	wei.liu@kernel.org, decui@microsoft.com, jassisinghbrar@gmail.com, 
	mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_052530_423876_C7038C75 
X-CRM114-Status: GOOD (  11.87  )
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

SGkgQWxsZW4sCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBXZWQsIE1hciAyNywgMjAyNCBh
dCA1OjAz4oCvUE0gQWxsZW4gUGFpcyA8YXBhaXNAbGludXgubWljcm9zb2Z0LmNvbT4gd3JvdGU6
Cgo+IFRoZSBvbmx5IGdlbmVyaWMgaW50ZXJmYWNlIHRvIGV4ZWN1dGUgYXN5bmNocm9ub3VzbHkg
aW4gdGhlIEJIIGNvbnRleHQgaXMKPiB0YXNrbGV0OyBob3dldmVyLCBpdCdzIG1hcmtlZCBkZXBy
ZWNhdGVkIGFuZCBoYXMgc29tZSBkZXNpZ24gZmxhd3MuIFRvCj4gcmVwbGFjZSB0YXNrbGV0cywg
Qkggd29ya3F1ZXVlIHN1cHBvcnQgd2FzIHJlY2VudGx5IGFkZGVkLiBBIEJIIHdvcmtxdWV1ZQo+
IGJlaGF2ZXMgc2ltaWxhcmx5IHRvIHJlZ3VsYXIgd29ya3F1ZXVlcyBleGNlcHQgdGhhdCB0aGUg
cXVldWVkIHdvcmsgaXRlbXMKPiBhcmUgZXhlY3V0ZWQgaW4gdGhlIEJIIGNvbnRleHQuCj4KPiBU
aGlzIHBhdGNoIGNvbnZlcnRzIGRyaXZlcnMvZG1hLyogZnJvbSB0YXNrbGV0IHRvIEJIIHdvcmtx
dWV1ZS4KPgo+IEJhc2VkIG9uIHRoZSB3b3JrIGRvbmUgYnkgVGVqdW4gSGVvIDx0akBrZXJuZWwu
b3JnPgo+IEJyYW5jaDogZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RqL3dxLmdpdCBmb3ItNi4xMAo+Cj4gU2lnbmVkLW9mZi1ieTogQWxsZW4gUGFpcyA8YWxs
ZW4ubGttbEBnbWFpbC5jb20+CiguLi4pCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL3N0ZV9k
bWE0MC5jIGIvZHJpdmVycy9kbWEvc3RlX2RtYTQwLmMKKC4uLikKPiAgICAgICAgIGlmIChkNDBj
LT5wZW5kaW5nX3R4KQo+IC0gICAgICAgICAgICAgICB0YXNrbGV0X3NjaGVkdWxlKCZkNDBjLT50
YXNrbGV0KTsKPiArICAgICAgICAgICAgICAgcXVldWVfd29yayhzeXN0ZW1fYmhfd3EsICZkNDBj
LT53b3JrKTsKCldoeSBpcyAibXkiIGRyaXZlciBub3QgYWxsb3dlZCB0byB1c2Ugc3lzdGVtX2Jo
X2hpZ2hwcmlfd3E/CgpJIGNhbid0IHNlZSB0aGUgcmVhc29uaW5nIGJldHdlZW4gc29tZSBkcml2
ZXJzIHVzaW5nIHN5c3RlbV9iaF93cQphbmQgb3RoZXJzIGJlaW5nIGhpZ2hwcmk/CgpHaXZlbiB0
aGUgRE1BIHVzZWNhc2UgSSB3b3VsZCBleHBlY3QgdGhlbSBhbGwgdG8gYmUgaGlnaCBwcmlvLgoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
