Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1041CD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 10:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/U3uTEphoQH1upSbBS363VfClCH85PG0C8uWYh6L4mk=; b=muYGLAYeMvFuUz
	bPjH7whRyEBuNJPWXvMCZf7XwVZc917bPB8/7D7o/5bE0FngEYMX6eZm+LDDe/Y9Kno5SEgPHr6NB
	dPUq8ipFDh7dG8iLo1r8hCbXN9TtOQUYPCuc6wzXJhrF1UFigi2R4rRdGXbkNxGZKEpLsv1UYkPjh
	eEd2/MJ2/IOav29pPHDFZtL5K531PuUrLfLkT0BaOZEZ0Z70XAwlqDzKbGEwORAYLWno7kKxX2GPX
	VyKCNLN1W8ugXdKgRu73Ql8ymTAo6KtTJKI588iBcr6N8/CVMLhZdqNkXN8Dmw9IU0KIvgZzNBBby
	NBEp+QCiSrvc9m9CmzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbBw-0000000AbxD-1FPj;
	Tue, 02 Apr 2024 10:16:32 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrbBo-0000000Abs3-2dZC
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 10:16:28 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so4603362276.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 03:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712052982; x=1712657782; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=A+VVgxwTyigFYrbnbvArexv0VidTAsaPP+o9ISF6YzorMaNwj1mdju5WIyocGAmbGI
         yzg3Ox17sFOo1MfsoGEp/Fe73nEqigIHb9KzuafyTa6VBhP/jcZQ298KzO1RCij+ABs+
         I283nvbcdcnzu+Nx2RiyapHKdcHmj7gN1YHOC9kTE0CctmUCeaSMIFSt01fBONyoTV9U
         eTBir/Mdqwm73EtAZWsjY1EnPTCAevBT/4d8oKBZFe3RRQurZzR3kVLIicY2jQgQEOOk
         sTQ+5/iz8LgxH/w1nxrkpJ65vXt/xGXGFurJ34EbMh8nfsmwUhYnThix5cVNBEUQ5sar
         wdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712052982; x=1712657782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzac7wtIrnnrBvtOLPs8xaD+ikoHcCxqEerEJoMcBFs=;
        b=GseNwVkY+FUqGPkogaZcgNzBSV1ncUJYQxjMrrgisChYtWbj+YACUGz7J/d9gNhw53
         gOTIQvkiWp9u+eiWQplp5vM5KA8Wq1kMX7o+xR/FO3hfKHISA/jwHV/HV/Om01KnmOxx
         TUQK/L4UDU8bea56Z/8hs4P+Nw/Ltkso4hTGAFa3j2XQ9oj+b7r9g1L+7jItoeZjUjr0
         /mwhznwtAsN6cyUFm509WeXjvs8iKCOdT9aHnxjwyR/Pcve/FR2SJkIsz6B+rEvccind
         c+Zftyb4bjCGPzOvNirPXBW+DrvoKneoxZ96FXURYbs+Fl4JUoVImo8QfjVUb5lntDJT
         5CRw==
X-Forwarded-Encrypted: i=1; AJvYcCWN5TT/cHS0DmN/iAKR7deqD8kedZO9Trs2ux7Zv0srwV/Rso4fbgk424Svx881mGzYiFPqTzCLlJXFgcgdxN8l3L6cxN8GMcl+NwAO2HX1
X-Gm-Message-State: AOJu0YzVl72x0QxNuTDwFiD12dmyjF+wM5xk6Pl0NE99xk6+ALlX4Gdo
	OrAS3sAbg58UrdhoJDTzJYYSbGhukNkobGM3aqlNkkPD/91i/6W0QiMyykZOOwW14V5YwY7t3H/
	6zHF0i5F40vge1jTigUKQGDidL8gM1d+4C5Dl+w==
X-Google-Smtp-Source: AGHT+IHzjYx5u+Am4EzQhN6aMsFTdxF/7ehGqP9AXe12JTbN0HclFOy9oE6Q1Tva+ZRKMaaQSSepEoCeBcfLH2AuW+A=
X-Received: by 2002:a25:b191:0:b0:dcd:b034:b504 with SMTP id
 h17-20020a25b191000000b00dcdb034b504mr9487652ybj.27.1712052982018; Tue, 02
 Apr 2024 03:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <CAPDyKFpuKadPQv6+61C2pE4x4FE-DUC5W6WCCPu9Nb2DnDB56g@mail.gmail.com>
 <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
In-Reply-To: <ZgWZDtNU4tCwqyeu@slm.duckdns.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Apr 2024 12:15:45 +0200
Message-ID: <CAPDyKFp5KET0HR+8MwO4cf0O6W2kyFqHoKcVf5jbgBuLuQUcFA@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Tejun Heo <tj@kernel.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, 
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
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
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
X-CRM114-CacheID: sfid-20240402_031624_936173_EA8CD267 
X-CRM114-Status: GOOD (  17.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Mar 2024 at 17:21, Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Thu, Mar 28, 2024 at 01:53:25PM +0100, Ulf Hansson wrote:
> > At this point we have suggested to drivers to switch to use threaded
> > irq handlers (and regular work queues if needed too). That said,
> > what's the benefit of using the BH work queue?
>
> BH workqueues should behave about the same as tasklets which have more
> limited interface and is subtly broken in an expensive-to-fix way (around
> freeing in-flight work item), so the plan is to replace tasklets with BH
> workqueues and remove tasklets from the kernel.

Seems like a good approach!

>
> The [dis]advantages of BH workqueues over threaded IRQs or regular threaded
> workqueues are the same as when you compare them to tasklets. No thread
> switching overhead, so latencies will be a bit tighter. Wheteher that
> actually matters really depends on the use case. Here, the biggest advantage
> is that it's mostly interchangeable with tasklets and can thus be swapped
> easily.

Right, thanks for clarifying!

However, the main question is then - if/when it makes sense to use the
BH workqueue for an mmc host driver. Unless there are some HW
limitations, a threaded irq handler should be sufficient, I think.

That said, moving to threaded irq handlers is a different topic and
doesn't prevent us from moving to BH workqueues as it seems like a
step in the right direction.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
