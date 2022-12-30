Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E94C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Dec 2022 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=tDpTlTx4xKvELS/N7SFB7LIQ7acuL30KjKURdR6aEV0=; b=bVI5FlClsI7lxi
	S7NoyAtXNTx2T6JYQTQGWTIwWSImLPcsJ17kprXLs7NRYg0C+rXC2Oq/tmXGLOJ0USKqJLZtcAqhQ
	saqAevWT4sKc3ET01WzmvWP+6EkA96J/yswQzaMoa+HHwm5Yu8L/aL6K4sINy5hZzyrkIwTvtkI/R
	l7UDABZ/PCsbLgsbAINEggW61T46Ne5o1wFLeCiT/QTkrggEiHhVsGWn75nviQv0wJ1Gi1AAHn0K6
	xghYt7H+N9YT9x2rI1aox6L0eb5ThKjV9ApfrAE7rTmMOQrfgZt2IHbpBAlOZ/qvhflK2/iRMUp2U
	ToFNPM/kbSFFLJk1njkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBLQn-00Cs1T-0W; Fri, 30 Dec 2022 19:52:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBLQk-00CrzD-48
	for linux-riscv@lists.infradead.org; Fri, 30 Dec 2022 19:52:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B5FDC61375;
	Fri, 30 Dec 2022 19:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0DAC433EF;
	Fri, 30 Dec 2022 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672429953;
	bh=8d81TX58YH1G9J+afWPRLe8LwaJbseEEbaaCSWCyhUw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FZ0aRG52Zqkc4eP+mgUb3RQa0QaxbxWEYHFibI5hIv5age03Zz3UpWas9exd+utXz
	 kNzq8BucpbMEaK/dg702NKqxaQzm1QTziVsCHQTG7PQxa/PLLHGTu75l6lBaCNLQUV
	 v9Diu3UOp4hMot/Z9fDReK6oAj4Rw0H7J1g4YWaPqh+l+Lg4TdarkySNmU9vSqYzUa
	 K9FJGRJJBGM9M0fXIzHPCOrUlLHXfuPUtRVBgYciTrPb004ekbalKO5gpbFZPT2wzK
	 q8FEHdlASbSJf4oZE0eeGo5ihklt75WwECj6dYMj7zhL/P7gomo5vWdzdAy7EP7w6r
	 0LoQnp4mMD3pw==
Date: Fri, 30 Dec 2022 13:52:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: daire.mcnamara@microchip.com, conor.dooley@microchip.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 8/9] PCI: microchip: Partition inbound address
 translation
Message-ID: <20221230195231.GA704036@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202212221347.puj3IN6d-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_115238_227789_E930B6FB 
X-CRM114-Status: GOOD (  10.72  )
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

On Thu, Dec 22, 2022 at 01:30:03PM +0800, kernel test robot wrote:
> ...
> All warnings (new ones prefixed by >>):
> 
>    drivers/pci/controller/pcie-microchip-host.c:896:32: warning: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
>            devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
>                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I know this particular warning wasn't added by *this* series, but of
600+ instances of devm_add_action_or_reset(), only 4 have similar cast
ugliness like this.  I think most others define a trivial stub that
takes a void * and passes it on to the underlying function that
expects a more specific type.  That's kind of ugly too, but arguably
a little less so.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
