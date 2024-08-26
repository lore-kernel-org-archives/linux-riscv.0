Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5B8C5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 07:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSD9ctA9RVEt3l+yXl1P/OnTZjCKmGthog6buTo0hSo=; b=u6Tnkf+GIfWNG2
	DcvGDLd84DQG3mXglOTGn7h49Bzx5tClED4nokjFfEdxJafeIFHSx9ydlns1XizEBLtxCEPuU1fLq
	+/Eg273ZT51r8Mc3+YU2kJlYAf4//SxkayYNJdx6RRkrRwnLuKFcybaaThgrtyeFxMTmZesn2+o9f
	WnarQIywkjyycmtgc8NwpiMWyzFZCKQFEU0WHGq79VWXt1/hDA5WYRQR7a/UxfO7p1IwBbQe0HeYJ
	7jCKffN8n34T4YVMO5rXVEvU8OwHryPISawD3Bi4++ru3Kk8/1EgI4TPr7KaCf3Cl2VRaOWBok0XB
	ORVcKpNmocUCjiMm3sGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siU4Y-00000006FCP-3j0U;
	Mon, 26 Aug 2024 07:23:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siTwI-00000006Dzh-3t2a;
	Mon, 26 Aug 2024 07:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D2DF6A41382;
	Mon, 26 Aug 2024 07:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D350BC8CDC4;
	Mon, 26 Aug 2024 07:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724656497;
	bh=5BefvIr/PUt8DwHXKIJx2BOdAE6F9zDv394OpNPF09Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wmetVni3AbNIihEBPks0uvPVPpkKIqa1TSUhn3Ken93TpqWKBKSYzaFWsv4ID2bW0
	 XShVTZWSVqKIWmVysFjorOt9ICVHSrhJyhDzxKAkvE7q2szVWXdgtd26nz0/e8h+NS
	 IjwEUCVMSFrQyUiphvXB/eAVexAsiqKeysUHwmKc=
Date: Mon, 26 Aug 2024 09:14:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v2 0/5] usb drivers use devm_clk_get_enabled() helpers
Message-ID: <2024082621-mortuary-gazing-20b5@gregkh>
References: <20240826070244.1835-1-liulei.rjpt@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240826070244.1835-1-liulei.rjpt@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_001459_060909_0819E134 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 26, 2024 at 03:02:38PM +0800, Lei Liu wrote:
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids calls to clk_disable_unprepare().

Your email threading is broken for some reason :(

Please fix up and send a v3 series.

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
