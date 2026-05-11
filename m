Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50F6CD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8uVayDOZAH1vm84P3NFlHYZ+Eybg2w0fMm6QR68ZIU=; b=16vO/S3S79vyW2
	aZPfAwNv9sKgn/2uEjp48p8+dquUsaFh0l6xbD8G5AJXtxYsHI2rvx55sGwUXrsNtIGMEFxQ1cwuj
	uJ+ewlwL+3FjGq3RUkMokNPvmur+qQ1BxDstf3rx62isRYOGaY9Bp+XudyB8UojgRMn6mU6FA2QXC
	5uwEx04BJ3jLH+d5hdxwVexM/bBXEInFGHYc31NzwFzIgmxBW8Gld9cr/4BLIhpFBypBIoA3SmwGV
	/6eX7lBTSbD3n9m5iOyXoii4aQ0xgOeM0nOn707c2rovmnCiDdxbzpUprpO7CjgN1ywAyqi9ncGpc
	WNmqPlKf876ta4Oe0WCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTJD-0000000EAkc-38G3;
	Mon, 11 May 2026 16:16:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTJB-0000000EAkC-3zqJ;
	Mon, 11 May 2026 16:16:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B95F6001A;
	Mon, 11 May 2026 16:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485C4C2BCB0;
	Mon, 11 May 2026 16:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516201;
	bh=MBOI9aAaaQxap7YtP4rFWDvHXH6+TogyxE6drrzlMKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lH7U+xwZxOu2BpLT6iEUyrnFpWS+dHZv8yuPpaptxgwqUQs9FlGEzxT4Lm2WfC70M
	 8CrthR4209aNjTMQAsJpXw5WJE6XILUnZ1bXd5YKsgAg2jjIwq5Hwob0XU+QMqRAYE
	 JWEALSSif3ssy32v6rTxwr1BDqcsba8h7CxVaWniAI6F/ynHvehEFVTYpsZ+eQ/uIu
	 bmMt7DjYlx7RnlwvJQHxbQ6rR58zC5vgFRT40WjapQWfrCKkOPkcAelJl2tKDzeXWI
	 AuV2sI32FExcFEPTkPlvc2YUkD7C7U0I7dbUb7gvJto07iMZMntu9gga/etR8NWpkj
	 eLUx6V4a3u6ow==
Date: Mon, 11 May 2026 21:46:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 05/12] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <agIA5XDzgA_GWvsc@vaman>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-6-zhengxingda@iscas.ac.cn>
 <agA3URhGA1u6R7LD@vaman>
 <244b01b015ffd8e859ff30101d7743ff1c0fd899.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <244b01b015ffd8e859ff30101d7743ff1c0fd899.camel@icenowy.me>
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

T24gMTAtMDUtMjYsIDE3OjE3LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+IOWcqCAyMDI2LTA1LTEw
5pel55qEIDEzOjE0ICswNTMw77yMVmlub2QgS291bOWGmemBk++8mgo+ID4gT24gMDctMDUtMjYs
IDE2OjE3LCBJY2Vub3d5IFpoZW5nIHdyb3RlOgoKCj4gPiBXaHkgZG8gbmVlZCB0aGVzZSB0ZXN0
IHJlZ2lzdGVycywgdGhleSBzZWVtIHVudXNlZD8KPiAKPiBUaGUgcmVnaXN0ZXIgbGlzdCBpcyBj
b3BpZWQgZnJvbSB0aGUgU29DIG1hbnVhbCwgYWx0aG91Z2ggbW9zdCBvZiB0aGVtCj4gYXJlIHVu
dXNlZC4KPiAKPiBTaG91bGQgSSByZW1vdmUgYWxsIHVudXNlZCByZWdpc3RlcnMsIGFzIHRoZSBt
YW51YWwgaXMgcHVibGljbHkKPiBhdmFpbGFibGU/Cgp5ZXMgcGxlYXNlCgotLSAKflZpbm9kCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
