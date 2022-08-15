Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A63C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 12:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgl2lC0A5CF2KQibsc8l2Ud+i7fsZxEPdJc+/KynXC4=; b=n23G7bzTqpdFvL4QvOsJieMfZb
	kt0UHgqZ7c2mtXzIWLzQx5GtWDn9uj4XIm89Oue8HRIbt5uL9UTRb49nPwZN9y8mkRN3tHHY6baF6
	/UGtcvZsBeKt+zLZiSCELZ4O59xSR1oIpCeR18VwR6tsxOJ4pDBdXRhVvlwkfiP0etOZFK9PK8zNa
	/kugJPHZS8z7BL/GUCEZutmgv2fMBr6fP+oE6rTVN5be+HLwSvayjid1opHcON9/Rbu+kNJ7UYV7O
	Reso+9K8t++Fm+4m2dlJsLDSJZ022rjJv2VFif/3jfK0QJ2FYH6Qc2DqC+ceZNCZdGpKu0I5gtOou
	6PV9UyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZ1J-00Fz9c-OU; Mon, 15 Aug 2022 12:16:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZ1E-00Fz5l-Qd
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 12:16:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 11A21CE1071;
	Mon, 15 Aug 2022 12:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B54AC433D6;
	Mon, 15 Aug 2022 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660565782;
	bh=nfbt+cMYBqWgl0fPp91G7ZvYuKe2jGdemUvUTgTKcck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WOZiCy6Nd2UcpBAsjq8fyZyu5zousJCj2105E4SuqFOFlZLsN8TYWrddzmWZAwphg
	 jqVxMEOo/Ip8nIaMjGCCHgDmO/MM4E+fi/kNljYYeZKYsCYX0mF8R162H8aGki0Vn6
	 +4l9ntWb3zP3hoKT3/7bwqvoqyhGo87JcOLLUYDSjgYO8vNuylc8MMbYs8jcOWJzRA
	 cea79+GSP4DRX5pho4OyO6QlflqVOFPjdYs9+13nH5W0k6r9BmYob0MS/pxuXGnBmM
	 YkP211PE6LOWHrA4wQ6fVgdThadC1wCSPobjyQRmETrFx/Cu/yCt2+Kp++gwTfNh+y
	 JneIwD/T61Wow==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1oNZ12-0034zE-5V;
	Mon, 15 Aug 2022 13:16:20 +0100
MIME-Version: 1.0
Date: Mon, 15 Aug 2022 13:16:19 +0100
From: Marc Zyngier <maz@kernel.org>
To: lewis.hanly@microchip.com
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, conor.dooley@microchip.com, daire.mcnamara@microchip.com
Subject: Re: [PATCH v6 0/1] Add Polarfire SoC GPIO support
In-Reply-To: <20220815120834.1562544-1-lewis.hanly@microchip.com>
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <727f07f843a9d06d84c1c28c3b905a4c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lewis.hanly@microchip.com, linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, linus.walleij@linaro.org, brgl@bgdev.pl, linux-kernel@vger.kernel.org, palmer@dabbelt.com, conor.dooley@microchip.com, daire.mcnamara@microchip.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_051633_830749_6DDF4D55 
X-CRM114-Status: GOOD (  13.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-08-15 13:08, lewis.hanly@microchip.com wrote:
> From: Lewis Hanly <lewis.hanly@microchip.com>
> 
> 
> Add a driver to support the Polarfire SoC gpio controller.
> Tested with latest 5.19 kernel.
> 
> MPFS gpio interrupts are connected to IOMUX configured by system
> register GPIO_INTERRUPT_FAB_CR(31:0). Interrupt connection for
> some GPIO's to the PLIC (Platform Level Interrupt Controller) can be
> shared (not directly connected) or direct if connection is available.
> 
> previously upstreamed dt-bindings: gpio: microchip,mpfs-gpio.yaml
> 
> Changes in v6
> Fixed typo causing compile issue with kernel 6.0-rc1

3 versions in just over 5 hours. How about taking a step back
and *wait* for people to review this code? It isn't like this
is going to be merged tomorrow anyway...

The expected rate for new versions of a patch is about once
a week (see Documentation/process/submitting-patches.rst).

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
