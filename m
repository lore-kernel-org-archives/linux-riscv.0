Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11F9C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 19:13:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8009161074
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 19:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8009161074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddVfVBab/RF54c1H1/gQg9/1jHxSyrm/5jUg0Ej+cSM=; b=VGWFMhGL4KUrz2E67sT9NP+EaG
	eCXolEA3QX8ZaBttUqGaiZPbRPnbYzAzRKHXVO5D05y3mcRQuNUyCdVDyzV3DwO4G5xIrFW3vhwEm
	2TzFChJVI3qY1uTG0Ud1105o1RDmCTVP2OrtcBW4pjlitV++wXTlQarO4aNubGN/5kRn+N547Ffbm
	bWCE89Y26XXI7ex9IYQMWSXj8WIGq3ljW+YNpJEMm8wHkqoIlOkGteGfJsjc2GWh6UmwyfWyJUo2A
	+lPOz7DeWOBPVGwdi804UIoJY04MGErfEMUIXijOKIgvR4oNI5RpUbT4Fd3p7+v/tQTkjiFeX6Uwo
	h4td35AA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljo6P-002Src-Kp; Thu, 20 May 2021 19:13:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljo6J-002SqQ-Nv
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 19:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cGw0j3P5SU7zt1q+cDmxpJKsarFcBobz/o56K1XZ/fM=; b=Kak0SDCKMKjeqdEOACofpVuZfx
 MOv3ILtkkqrS28zrCXbD+DaUiW5cqzZpwrCWOJ2RimnVrPNiBcQuAhYNyzhQXyxRiuSehO/XxUihb
 SVGO4+C6LCsxQxrJZcIJ3hpTcH6BdE3/GcO+c07nFMTmJsEtDXwbRwiYI3DFBNSK2ZIgLVhqaplSZ
 +s9ZAieFdhhPQthfp07Hr8U5GAfIO1koHuDpexaZLwwRz8N8B71bWLse8c+66Koa8QcLQIQg/bsgc
 lgbijQm6OOu6JpdYRgEwCfcUeTX4hTf75kM3QTNS2GDWyvm8tKdDQx6fqNfLn+tPVNbWdSG+tIqtE
 X34RDgXQ==;
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljo6G-00GbdG-Ro
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 19:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=cGw0j3P5SU7zt1q+cDmxpJKsarFcBobz/o56K1XZ/fM=; b=oidm6O8Ayml7oqE416ieS3XpCE
 avFo9NlMkK9Epm5NZRONxUOYBI7pPiryGaKg+2nBZpMb0zvQiJ0NzXiarU92UPfADY4O6sQdyWqI8
 phDvt0pJQFFLRM9NynJM0D5/GTX2PyOQUV2M5rc9UvhQY15aChPRXWRkJgl6XW3xYyHU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ljo65-0059qC-Tt; Thu, 20 May 2021 21:12:41 +0200
Date: Thu, 20 May 2021 21:12:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 10/16] i2c: busses: i2c-ocores: Place the expected
 function names into the documentation headers
Message-ID: <YKa0qSttQKoSn/XY@lunn.ch>
References: <20210520190105.3772683-1-lee.jones@linaro.org>
 <20210520190105.3772683-11-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210520190105.3772683-11-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_121252_914447_073DFFE6 
X-CRM114-Status: UNSURE (   6.78  )
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

On Thu, May 20, 2021 at 08:00:59PM +0100, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/i2c/busses/i2c-ocores.c:253: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-ocores.c:267: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-ocores.c:299: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  drivers/i2c/busses/i2c-ocores.c:347: warning: expecting prototype for It handles an IRQ(). Prototype was for ocores_process_polling() instead
> 
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
