Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C97CC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8e0ps8P+/CQLuhEby3j+4fIEy+545jJq0VfrMxWYOU=; b=3B2al+8BQlIPol
	Xpx1enIhtorbWqYVmvr+fMTEAK/TORxB8BaRPR0ikeq8XX146MJ0r9ONxpvmXAB9riIPiQlZ2KMq5
	vAEOdyg7EdbGkBc+JBZLuiwbfOhMfnFXlegiQ5OFpKlibvI+LszuUQdRgMGVVzWDzstSEObdp9b6n
	p3AfcrvymJsG2KuyeDEFzcSO3vTDen7eLP6VFNuOcF4E1pepMDysmuZtq3F/n3Bjm/KWiCuTYiOYG
	FP3K46IjuL/3lOZd9EGTzXCd0yIQoZmcKSIJkpCcPSD7oXFeL7GWOSjfij5x33688qQUDJVlhvVFm
	yhHULCg6mSjptTnJ8KiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aP3-002Q0h-0J;
	Mon, 27 Nov 2023 12:07:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aOz-002PzQ-39
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 12:07:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b402c36c4so12642695e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 04:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701086866; x=1701691666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4J3iw+mDAnpqbl7NHPtL5DiMy3KguiKjuipdHc2uOZc=;
        b=ZfwIIhaMDhGR71LO0Pn2uiMq2hm0eeZY1QDC5Au0QnKaNkSOUbG37S2Rh0dIeaP1Hl
         f+jMHfZujrISECB1rxO5dXDNyAQWNELl0VDgSQeMgCukzBWh/qG5a3zSjKEmXMjHApmj
         gcHlLM7KEuHuUebdSgb6SJblDp8aaZCAAdVaEEEQ+SqzQwp0UocOVyL/ORgektORdTsV
         24wsKSyVvOijQv7zk5RFvTu3m1sp0CvJ20nKyGK3g7MogwlBF4+1cAohHdh3KzujcIiZ
         zLFZuKlffJi34fswPIRqPKxZyZaQRhqjSVWY/lLcLYmcFTRZWIBRidtHUbpvenj4spMa
         yi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701086866; x=1701691666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J3iw+mDAnpqbl7NHPtL5DiMy3KguiKjuipdHc2uOZc=;
        b=vJaGPa4n7Sw46Sc3SBMNwU7l3FTpGLDaskROktb89zZfZA3SjCn6tr7wzhmxOMrsfT
         KZ7gO2fMQeVhUA4x0s5AJfbhfEKBelRMJd33efKi9FYdSr9UBeIrBQChGqzxobE//TX5
         rNrdU9kS5lauNmmwp5p1e7p3tmc5wtItz8ODYUNNekNZ6K38wPMmcRPN80LsBYuyhm6g
         UN/sEXtg5PDeJ9ZP0flMBUU76D5xXPXo1b+BNfoRkYihxhEunCwAxRUqiD25l9vrZ3cb
         8xvOduWtHvCsqCjmAxkZWnHplRhdQrPQlNEsoJeAtE1RsgPfSPrVV4VQ5Hfi9ImP5kMN
         TbbQ==
X-Gm-Message-State: AOJu0YyOZnnKgQqPo8S7+SH/iE/7dZd1co1oCQ60zI4ucYst4T8wwsfF
	zXKGEjuKlETxjRLV7yGHDp9Cmg==
X-Google-Smtp-Source: AGHT+IGxrD39Vy/6KxzQ7pWn5uIynsZkyJY+rkOic/MBGSehUb0zQVsyfn0seTcG5DE92lVSjo9HOw==
X-Received: by 2002:a05:600c:4e90:b0:40b:47c5:4f67 with SMTP id f16-20020a05600c4e9000b0040b47c54f67mr1088027wmq.8.1701086866318;
        Mon, 27 Nov 2023 04:07:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c1d0e00b0040b34409d43sm13630664wms.11.2023.11.27.04.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 04:07:45 -0800 (PST)
Date: Mon, 27 Nov 2023 13:07:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	jeeheng.sia@starfivetech.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 0/1] riscv: Introduce system suspend support
Message-ID: <20231127-4d9b134d1686b8cc031faaa3@orel>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231127-salaried-distill-f8e8a860bd76@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127-salaried-distill-f8e8a860bd76@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_040750_018357_269A6075 
X-CRM114-Status: GOOD (  20.16  )
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

On Mon, Nov 27, 2023 at 10:52:52AM +0000, Conor Dooley wrote:
> On Thu, Oct 12, 2023 at 09:21:49AM +0200, Andrew Jones wrote:
> > OpenSBI v1.3 and later supports the SUSP SBI extension which has recently
> > been frozen with the freezing of SBI 2.0. This one patch series adds
> > system suspend support to Linux, which implements "suspend-to-RAM". To
> > use it, build the kernel with CONFIG_SUSPEND, boot on a platform which
> > supports system suspend, and then issue 'echo mem > /sys/power/state'.
> > It's also possible to test this Linux support on a platform without
> > system suspend by using OpenSBI's system suspend test support. To enable
> > test support add
> > 
> >       opensbi-domains {
> >           compatible = "opensbi,domain,config";
> >           system-suspend-test;
> >       };
> > 
> > to the chosen node of the device tree. With the test node present,
> > OpenSBI will wait 5 seconds on a suspend and then kick a resume.
> > 
> > Note: Resume may fail without the fix for probing misaligned access
> > speed[1]. It's best to apply that fix before attempting system suspend.
> > 
> > [1] https://lore.kernel.org/all/20230920193801.3035093-1-evan@rivosinc.com/
> > 
> > Changes for v1:
> >   - Rebase on v6.6-rc1 -- only minor Kconfig change needed
> 
> Would you mind resending this rebased on -rc1 again? It looks as if the
> patchwork CI threw a fit do to differing expectations about function
> signatures for the misaligned access probing.

Thanks for the poke. I need to repost anyway with the improved condition,
checking the SBI version. I'll try to get to this today.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
