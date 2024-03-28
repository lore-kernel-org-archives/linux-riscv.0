Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7731C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 13:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECgXGegKw5SZffqdYt0k99FSYM2Oh4C18y7hqHTceEM=; b=GZk6izTVcLu10F
	3TM2QeYFBUyHNiP5f44o1BLDgjIuSg5vv/rGUvZNEloihPNU3SNfFs1fu/AAVI4eTs88yfa0M9FVw
	xpVmKnaZ+09LItCgUxB/Zx94Kr7x976B7DsVxB54Jfs3M/VkWDCsoe4VgglYEyWp4hIo4AG4fLhoG
	qAViFw3IL59PQKn7qEC0A1cyn8J8emInIvAvNB0M71yZiaG9ABkUhzoPvi76yHYdHUo7vysvdUpZa
	+NFGzs/3UwkyaKJupNZRM/Zxp+kfQ/f4JI5Ig+IUszcqWJOKfW2Y5wXpXCVebKpSvwloSXGKKxZWO
	7EURh3GNpaVvmdVgZJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppwe-0000000E85V-1ndl;
	Thu, 28 Mar 2024 13:37:28 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppwY-0000000E83p-3hix
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 13:37:25 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dc742543119so993850276.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711633042; x=1712237842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=;
        b=gySmsIfYYmjPkwnZmpywOR5qkNG6dXXk86umdqucCPkI/wUfZ4ui8I5RgnG0XqJgKI
         yBOX/RZZdtl6Fg/4UZ2LXzZDHqFry0+ZOb5u/uUKeoZMxWCnBtjO/nKS0wskjag5fP1R
         s3F6kRt6Hn/YttHWlyPsCphuco5nhDP7R8av/0QNq5om5PhpyLGpJnqcfH05HsNXwt7O
         ij/QTLClqi6kwu4yQ3gb882hsHvtz1/mMjI1I6ZXlQQrTqgzKdqbVuv2PTgeQSnHDDnk
         6fal0tsgqLz10KPdemz3jzdiNVMUpFU7ne3taPoVSBA/dHtdLpLM14lFEeafoj7oUgb5
         Ws5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711633042; x=1712237842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhptj9/Vq4Rm0PoGzxaGiCJqIgDUZwkAbXDvc9ksjDI=;
        b=aqYoYev6jWTDXYj5ElgLhqzqA13KUmaeG4uMF/TTiEFOFoD7fP+pV8RK3z2dPU5GKP
         G2/vqiGoXoQmXEEp2vJyJ8W38VSEqovB1AsamJOlIddSL2tQF2B9oGTclzgT+bw/eLMI
         NWTHBquRZlvg3a8sv9Xqak4kJ5sN9JM782K9VLrWvfwYPPrssDhAWGKGTpLQ33gSdl+Z
         Runcwzs6vrUmER9sXusynqGGM++3CI1KSLdCaLoSGU+jBbtfwUVovZeUWEU5MPQsXJIP
         Y2QLNLiWmkj+ILh4WcSN09p3E0oKjH8veZ/3w7i10QosTGCMAJ9lA+/TrMXRdUefpvQC
         i/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrm8o+cWteEpuTMP8Yomae4bKeCGwnSFnlG1DnfNI2od2SE9525zLpG0ny5rc4NhTwxDFSfqAyG26elDH6dmusYpO69vSLAwywBAj4Isq9
X-Gm-Message-State: AOJu0YwKV6QfWNX3Lqh3n3LauGfd6NiUa1dm7o3t1HNA8lxg8Qlor+nm
	tKnssSpEsiZFo0Lk1zgNftatRlIauW0+4iV6qPv0LUS2gET2nJ++sw9tPktpI+Vh0YXgyNZJ36z
	gZfzrq8Ap2zrhG3aLfOgoo6mUPema3BeDq8aMuw==
X-Google-Smtp-Source: AGHT+IGjGHEbsk10nKTaVGgOOQzkHc5Qm9STf87bHGVpMP0DEmjO9lKjEWUgvRJ23UvcJC23rRkiymMtwiTmbVMLRs0=
X-Received: by 2002:a25:b9ca:0:b0:dd1:3cc1:5352 with SMTP id
 y10-20020a25b9ca000000b00dd13cc15352mr2820459ybj.15.1711633040798; Thu, 28
 Mar 2024 06:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
In-Reply-To: <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 14:37:09 +0100
Message-ID: <CACRpkdZ7wAbtTUmmLCef7KnATmfZeAL26Q-gLqnGe3CdZ3+O3A@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
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
	aubin.constans@microchip.com, manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, 
	jh80.chung@samsung.com, oakad@yahoo.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, brucechang@via.com.tw, HaraldWelte@viatech.com, 
	pierre@ossman.eu, duncan.sands@free.fr, stern@rowland.harvard.edu, 
	oneukum@suse.com, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_063723_330387_B00EABE4 
X-CRM114-Status: UNSURE (   9.83  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTo1NOKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKCj4gQXQgdGhpcyBwb2ludCB3ZSBoYXZlIHN1Z2dlc3RlZCB0
byBkcml2ZXJzIHRvIHN3aXRjaCB0byB1c2UgdGhyZWFkZWQKPiBpcnEgaGFuZGxlcnMgKGFuZCBy
ZWd1bGFyIHdvcmsgcXVldWVzIGlmIG5lZWRlZCB0b28pLiBUaGF0IHNhaWQsCj4gd2hhdCdzIHRo
ZSBiZW5lZml0IG9mIHVzaW5nIHRoZSBCSCB3b3JrIHF1ZXVlPwoKQ29udGV4dDoKaHR0cHM6Ly9s
d24ubmV0L0FydGljbGVzLzk2MDA0MS8KIlRhc2tsZXRzLCBpbiBwYXJ0aWN1bGFyLCByZW1haW4g
YmVjYXVzZSB0aGV5IG9mZmVyIGxvd2VyIGxhdGVuY3kgdGhhbgp3b3JrcXVldWVzIHdoaWNoLCBz
aW5jZSB0aGV5IG11c3QgZ28gdGhyb3VnaCB0aGUgQ1BVIHNjaGVkdWxlciwKY2FuIHRha2UgbG9u
Z2VyIHRvIGV4ZWN1dGUgYSBkZWZlcnJlZC13b3JrIGl0ZW0uIgoKVGhlIEJIIFdRIGlzIGNvbnRy
b2xsZWQgYnkgYSBzb2Z0d2FyZSBJUlEgYW5kIHF1aWNrZXIgdGhhbiBhbgpvcmRpbmFyeSB3b3Jr
IGl0ZW0uCgpJIGRvbid0IGtub3cgaWYgdGhpcyBsaXR0bGUgbGF0ZW5jeSBjb3VsZCBhY3R1YWxs
eSBhZmZlY3QgYW55IE1NQwpkZXZpY2UsIEkgZG91YnQgaXQuCgpUaGUgb3RoZXIgYmVuZWZpdCBJ
SVVDIGlzIHRoYXQgaXQgaXMgZWFzeSB0byBtZWNoYW5pY2FsbHkgcmV3cml0ZSB0YXNrbGV0cwp0
byBCSCB3b3JrcXVldWVzIGFuZCBiZSBzdXJlIHRoYXQgaXQgaXMgYXMgZmFzdCBhcyB0aGUgdGFz
a2xldCwgaWYgeW91IHdhbnQKdG8gc3dpdGNoIHRvIHRocmVhZGVkIElSUSBoYW5kbGVycyBvciBw
cm9wZXIgd29yaywgeW91IG5lZWQgdG8gd3JpdGUgYQpsb3Qgb2YgZWxhYm9yYXRlIGNvZGUgYW5k
IHRlc3QgaXQgKHByZWZlcmFibHkgb24gcmVhbCBoYXJkd2FyZSkuCgpZb3VycywKTGludXMgV2Fs
bGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
