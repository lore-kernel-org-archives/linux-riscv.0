Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F8BF417E7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPnTaYRf0JDNp0qb8nOdHed3iRGuQxKuxcD5dBxMWYw=; b=bnOkhEUArHi1Ry
	+L625nC26a7Bmhbi6iR34EJ+EaZEsFv3iEsHDwk9wJ3X2wGMsOYk1a/sNVyGJMwNAdMS5U9hDF5+t
	/JLyoYkwx4u9K2s6KswTW148IN7PB7TUjgGS3jl2m0RuPGmHMWoGd1H3UZWHRigNw7WkbNAovFZKd
	T3dZy3s15y1pQ6uHK2xQiUZIOznXo1u/8rmtH2PmY4sdCi+vdJVLI0Cmwa1jiOuEMxwUh5e153tYs
	e/dszI/uCsD0C63fCh2FDj/j2V5W4wAvdKLPLDwicLbGyiNKZdcAWtqc8/HN564ckhkSlg3s3mx8+
	ry+u1JiBu1nYR5+sduNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbms-00000007V8L-3o8Z;
	Mon, 09 Mar 2026 14:40:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbmq-00000007V7V-2PrF
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 14:40:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EE7561A242D;
	Mon,  9 Mar 2026 14:40:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B54A35FFB8;
	Mon,  9 Mar 2026 14:40:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94C0E10369A23;
	Mon,  9 Mar 2026 15:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773067244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FqR2Vf73E1rrlwJbWu2sN21UEE0uaLooT5FPq/LZAkA=;
	b=H62rarWVpi5qkt3UAOU3ilclviHgZF2tV/mlvwf/9+uyesxlKargmR/aGxAF39xDzuAj4H
	jiluDZc5k4ymXKeR0/oH+RZTQ7so+gxEOMhWqCjepbG2VrbCaeFQa5bf2uznCHuNiD+2ri
	jD8UiRSBKNNnHwSBgy22tfUYAmKsR3nxwjle89U/NZvJNwYIGdcVZDYf9aagy+vNDlNRnI
	Xa4a0shtfLRrfr2MIqpFWwcvY75QdJRWHqSTNTavcPrbhbbNsnekFcYIO3AG2qpoU9dzf5
	axTnbnXvlvPHBvb8qtob5jZmwATa/l2xbwvyllRzUnNCu4557vqY0Z44Mxnfqg==
Mime-Version: 1.0
Date: Mon, 09 Mar 2026 15:40:31 +0100
Message-Id: <DGYBVL751W64.WJ1HHFYH74M6@bootlin.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Drew Fustini" <fustini@kernel.org>, "Guo
 Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 6/8] riscv: dts: thead: add DPU and HDMI device tree
 nodes
X-Mailer: aerc 0.20.1
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-7-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260129023922.1527729-7-zhengxingda@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_074048_752055_D070CB25 
X-CRM114-Status: UNSURE (   5.48  )
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
Cc: devicetree@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, Han
 Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Michal Wilczynski <m.wilczynski@samsung.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu Jan 29, 2026 at 3:39 AM CET, Icenowy Zheng wrote:
> From: Icenowy Zheng <uwu@icenowy.me>
>
> T-Head TH1520 SoC contains a Verisilicon DC8200 display controller
> (called DPU in manual) and a Synopsys DesignWare HDMI TX controller.
>
> Add device tree nodes to them.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Tested-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
