Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2BFF417EA
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGLHZyQr/yd56L8x5zOfoD40REXj9/2sVrlLM59fVGI=; b=4/y9YZzV0hGJEc
	+/ZmQ9hAPZ7ra7BDTqNs7si1nXQYS64ww7SQDuu+GH8tYJo2ZHEPbJpxdo5ic67zIqgDZKevefM//
	BnDKstjdyY/SbJqZ+NLYFiXA25hi4ci5XFZRZ/uNJ6HExQ52CieLD6rkHKaxjPBW/5+JWAJehO9b9
	QZ3eya8h1ZP3YzKd1ax9mdRNtYpXu+lvmnBnKtQH+uKqVTro6vBbQIRmH0T4eoLEoBBJsij3w+BWk
	2ANlADUgtqczx5axhiQO4mggTFaQRXOgBcQYz/Nd8HAe/Qyd6wzwFzs+0MeL5p90WQgis5RDQOYy5
	fi1aw5652ABmu+3dSfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbn2-00000007VBR-0yPA;
	Mon, 09 Mar 2026 14:41:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzbmz-00000007VAJ-2ZpG
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 14:40:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32D101A2C65;
	Mon,  9 Mar 2026 14:40:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 060995FFB8;
	Mon,  9 Mar 2026 14:40:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A83C610369A24;
	Mon,  9 Mar 2026 15:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773067254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8c5cCi3l8yBsiYPBDm8Cpm+DltieQW/xE+9zjyXIubA=;
	b=zxOtfTllx00QExK6GWcIAfXPgsP+oGpwVR8qHyDLebusihjBrQ5ngep1qSpnpIwd4Hw+Yn
	Ere+zoXPNUag1wqm5MSWWCTL4feSvZoi/G5pqSSEIkgvnT6WOJhfP5BCxtx/6g5IkypeJ+
	Z9j8sw/i2dBz8eaT860GiYVJdONFNtMPd+CYxA+utQ2Y09DjwnQDUx+JUrWxh1ibSfdtGk
	Jf74nprK/p0lND/ajA8NKTw9dsorqWOGT+zjtPywAiyMxUl/Cki7NBPsyU6dRs8rveJNz8
	0u3BLmr5hBApPg6ytaWHoII7bFo6hlI0wK4eZ9bonwTpsZ3rywASJMxlPTxxwA==
Mime-Version: 1.0
Date: Mon, 09 Mar 2026 15:40:46 +0100
Message-Id: <DGYBVS9FQJ4Y.14E54QJM9SRAZ@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 7/8] riscv: dts: thead: lichee-pi-4a: enable HDMI
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
X-Mailer: aerc 0.20.1
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-8-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260129023922.1527729-8-zhengxingda@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_074057_785760_C2F7CB3C 
X-CRM114-Status: UNSURE (   6.19  )
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
> Lichee Pi 4A board features a HDMI Type-A connector connected to the
> HDMI TX controller of TH1520 SoC.
>
> Add a device tree node describing the connector, connect it to the HDMI
> controller, and enable everything on this display pipeline.
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
