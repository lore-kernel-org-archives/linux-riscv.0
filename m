Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39FED609D7
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4V73U70hCpkg2CTOFbX+YO0Pd8Z1syNRkgbU5O0770=; b=V6vke+vwynaQ8Q
	xv5+XTak3KUbfo2PLlmcG8+5pknGWaIoZqqqQNvXT+Pyd62Vx0x2o6vqcUBUDixdZw4aWqSqzFHEa
	ulCvkt9dIiE+fWiKYrrMtoZUYLZwLdK4vuD/vK8TGMO/7+6hbC92vPObaIJh1vIu6BQjnD+MaqjYd
	DPKmvsnevPcvz+fJGrWH4tqCWlNa/sE5BcM5uUrPhS94YWzA5MRXZcuYSPEAAQMmyhPY7u7Ncgs0Q
	CTLE8gG1DnYhokfNwdivc2GvznNBKgTa38sojic85Nt0GcAZcUvrJl+bOdHeTSG7pzP38QR1QtXpz
	5FiCKfr9SYSq6IpBHgtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZQH-00000005h3l-3740;
	Tue, 16 Dec 2025 18:05:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZQF-00000005h2u-2Jlu
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 18:05:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47a80d4a065so30817595e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 10:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765908317; x=1766513117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOVTvVNdR1FG9BDCa9ncqVORVzbhxwnhnkEQ2N326Mo=;
        b=TneVKWgW7/IuXE4SKjlnfdYQn1ae83CSlTTy/Jka7SWOAK1SsVpBtWxqBcmn1zC2we
         eA9O0Qf0dtyhj7Gq30YwApsbdKhivRgOI4JigLpKp8XkjZ4ezbWm7L+874xm/v0hN3m+
         yINYJu1WwT9mNyLW5S9y1rUkf2WjSD+hQ4/JOEoaQv69R2nyVwvtmdKEYGm5dqYQ3soh
         LteOttjRpj5MnngKB7WB6hAIgPwG4Px3MynEGaR6VB5c2K58Of00mz9Zzs7Va14rzNWf
         BXKlUCNipxQSPmsHa4XN1py1KjZL0lB4+51OOunnQeEjJoUcRptulGHD8WvUvWnEoKYM
         o8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765908317; x=1766513117;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOVTvVNdR1FG9BDCa9ncqVORVzbhxwnhnkEQ2N326Mo=;
        b=JtkQ/CXuf8Rk1275JIeFPlP7ELLhFWUUhO7TUewcIIjbWksW/HvAoCFWeuO3FsNpON
         7K3IqoHO7oN9uGVzK5nakf+6dve/sp99rEY9CyivDM+XJD2RH42bULgJhhffk5LHlDkI
         5aN/9Owj/wRglp4hcXb7FMhDz1BTkKq0nXD9xwS5+pcnOKtJlY8UrBTphoJ06tId4KXB
         8IylMbXnY/vcuYfZPKfx9bdCjqGNjGXcZDKiauJZpWRodzvhKKqCdGLE2nvQBLdFDnWi
         Ph03lzGTcXF3IijqvI+Odpfv1Fa9ykYGZfVnRfDbvmtatUZGy/Zbka3vEbuM5B0IKE26
         zwSA==
X-Forwarded-Encrypted: i=1; AJvYcCUFBvC11ihvDoAuTqBj9aZROm/wi5D9TnjDAootktL9tVpt8Imv3S/MeTfb1vzrc5s6voJlYi/koMuxbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuq6v86PfDyYGiD9wkEroGiZ0RVoYCfm+CS/y7RkWrczo5TjWj
	UI0E3BEjmgvzAql96qVp8aDGEVCw3ZCN3CwjDT1/S7ozyWG9rNZ95To1
X-Gm-Gg: AY/fxX6plRJtl45nZRO5I088nJmK1A+jkz9zrAtzOx03acUzR8YZLXSkIKdRyMapxgj
	BF/YGjTmWKki0XW/mXztZ2lNwEnI6FirApCnluJjEnVj96C0EcxG31gdjDDHEmVKlQG+QMFvryZ
	vlFJnf08/u2wCEjZx3xebL0D/zUNzzwgpVfCXv3vAwJGVIAkJEx1XBlUU2rNuOKwQMdxcS2ESPA
	E2YyiyDXQpWuTINjImcKu+V6h5okv5lD/9SOnJKzrTduktptZ+D+0tPlrXfOH4RwyATeGB9ElBG
	Ym0DWxsbG8rTreicAU3vIQtpQgbGX1TdD6L8H5TCSPxU+2EQzmtsxt4EdgfQW6EqpWrxMQk3vZ4
	5oOxcPZr94T0l4NA5Z2/4YEf5iMhWikaWJZR7JV2PDmyPqf0B8s7QCuCAASd4ksYszab4tVwP2F
	O11fXTTY7COil7xW26f3igSfi0f1SvTL53cSKe8MwdbSf951+/ARU4
X-Google-Smtp-Source: AGHT+IHcp2kh+mNII7OE1JHRsuXQc+60t2y2lkbG7uOLLemuoRbIqLfM/QxfUUFPTPf2nXNDwVnhkQ==
X-Received: by 2002:a05:600c:4f90:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47a8f905680mr161568895e9.17.1765908317137;
        Tue, 16 Dec 2025 10:05:17 -0800 (PST)
Received: from anton.local (bba-92-98-207-67.alshamil.net.ae. [92.98.207.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1e1ebasm1784605e9.8.2025.12.16.10.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 10:05:16 -0800 (PST)
Date: Tue, 16 Dec 2025 22:05:12 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B
 compatible
Message-ID: <aUGels35MP_BNjRC@anton.local>
Mail-Followup-To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Ze Huang <huangze@whut.edu.cn>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev
References: <20251212020504.915616-1-inochiama@gmail.com>
 <20251212020504.915616-2-inochiama@gmail.com>
 <A0AF03A6-1F0B-462D-A088-3B4DF6BA6292@gmail.com>
 <PN6PR01MB11717B13B2AE78DDD36D2F0BBFEAFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN6PR01MB11717B13B2AE78DDD36D2F0BBFEAFA@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_100519_622765_3F9C199C 
X-CRM114-Status: GOOD (  12.71  )
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

On Sat, Dec 13, 2025 at 08:53:34AM +0400, Chen Wang wrote:
> 
> On 12/13/2025 2:48 AM, Anton Stavinsky wrote:
> > > The DMA controller on CV1800B needs to use the DMA phandle args
> > > as the channel number instead of hardware handshake number, so
> > > add a new compatible for the DMA controller on CV1800B.
> > Thanks a lot,  Inochi. I've tested on my Milk Duo 256M board.
> > Seems to be working with the I2S driver, which I'm working on right now.
> > No issues with DMA interrupts anymore, DMA router used right channel.
> 
> Thank you, Anton. Could you also add a "Tested-by" signature?
I've tested the v2 https://lore.kernel.org/all/aUF4w9sO5lmU9T6v@anton.local/ Hope this will help. 
Thanks for pointing me. 
> 
> Chen.
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
