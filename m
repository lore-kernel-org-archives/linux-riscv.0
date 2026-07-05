Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7830AC43458
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 11:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iaB/DSsl2VRtwKn1bb+G/zMfMnbEkcumgaPLV9eT40=; b=xF4Yrgo36k/eQj
	ITvLs4nMhPujB7sDkQVuD8ubw4qRffrLBoU+wTAzAVXLeHR5neotsYZg6kCHCKXwiz3BL7PG3FTmc
	YxbA4+YMcH2gU9PPaD5c0neaYFTuYM4hE6k3LGjWMuu4cJYN/3t9JOucw3BOOEI6NZc7Pw5X3CHYk
	Nexvgi7FSD4f7gXVZvguHL7YTBFrmYZJowFt6Ua3fXYS54+RFFPBxlusy65BfilRbf0+a7UVoURLT
	Z7gYb+ZjPCOE5YqmvBnoi9A9/eiQfgeYF4GnYe5Ceo3iBuzVPLonJM6u0PDXQPRbU0oXtj5EC8mw/
	CsC+h4xCr823gyFGJBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgKw9-00000009GKp-1p1m;
	Sun, 05 Jul 2026 11:23:01 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgKw7-00000009GKT-1Ktr
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 11:23:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cacb8416a1so14712325ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783250578; x=1783855378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EP+ltuqOMcIt+xpZ8qdpKdZOFHQrgBBgO+zhJMTh/i8=;
        b=f/YfxaLKH/Yi/NFyau987JDLoz6Xe4evlrjzWWdMoKpaShl8YuAaFARirSvN2LBRe4
         sj3HSKeRA4rMCWbF61Lw1sHZVGSCSdzV+NVLoskK72mba2snnHp4IWrMIlygTG5bOdub
         eqp2nJUfDkV8vhtjkyukybQreEdVdkiKwwkxWZWtFJLw/qphZeeqOXl8sufp4Kjpnp3T
         CvfnjpB1muMsAgHbuAqFDpzV/a308G/DDy2I3J7Ox4GoTmTTnonQIV79GFA9iky+VlfZ
         PF0F/42dWxWq/LNMRUwjKEkkquzPke8/v6zy7vNvimiUwongyJPXJP18P3N5QrxizelQ
         6QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783250578; x=1783855378;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EP+ltuqOMcIt+xpZ8qdpKdZOFHQrgBBgO+zhJMTh/i8=;
        b=jdDOgPhx/LtXXp67nh3mfZCcjA7sYkQDgMG2sKKvqI3Resc03lQRdLHIePPb3F95Ji
         AYA3tCM48vwDIilHZQmNdIlrcbb1fr4D91IOD5CksuNVRhgQbm+YS3H79wXvRKiBfz+1
         25TNyx6lzQJ5UhFxmtwf/VdkxO3/6jhQDsD+r7OYL5D942Cuy7MQIrYea59gvSSUFa3w
         blMHJqrPlZg/TTYa8tnk3tvMP0v6ngy2/9d+5OCK7mF0ofKYUmLAPiLN0IdSBwvmMvzt
         ekIEtJFf1hJ9RWf+f445+KfzaIHqLJTkuugy7hoXWKLwq2GsMSKQA5nfa9UfMCX2BeSb
         FCvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFsTlDoWwgIpLrni1oFmGdUcREONkfnU0lhEG/6jJy1KpMqRqFdPUmooygJ8GY6Fb+hbfgGbGcYiIlNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYfaFmZC4knvQ4akGOyqGt0O0ro3JtRSrKfBSPKjbNA3ZJgPTv
	CQkhZTNijVu0jf/xS//J3IKqLzHEXLPFsp9ZSFRFij6t/iR91zqPB7JU
X-Gm-Gg: AfdE7cnFoRJVW2wExP/aK0xTLUgzsE1H2iyyWMykmjNu7lIQVkKVita80CwMSIzi5j0
	FjQJHwm046clLhpU1liKm4UDdGhTO11rYlkx5DMZSYOVMSxSqN1bf0DiVx0YQU65wJspDblX5ms
	/EIsM2ipwMo4Zk19YObAQsAd3iSZNIdCC12GM86eAczlVO6l/sPD0KmS/hmS1vkmtn1YbKKPyXZ
	wO8s8Ug/Xar5Lx54yn/91i2ZUQPhN97jdaOzMRTvjcIXTz9nYWRWwZ3ca/IJ3ZxOnd94LykN0zt
	jXsZCbuW0PZke/8lZmx72j52z5Y17JiHULCfxqhbDTnM+LM4LQLxk+zYKXNxkBj6tmldBC2p1FK
	FTX9vFI1Yd2oLoPi3wosgHVGruxiuSzy9GqLrNSeqL2qqltWuZgpAHYbpCYuT6sr1
X-Received: by 2002:a17:902:ec87:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cbb9eb4b6emr63113945ad.25.1783250578209;
        Sun, 05 Jul 2026 04:22:58 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7893f0fsm32340485ad.75.2026.07.05.04.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:22:57 -0700 (PDT)
Date: Sun, 5 Jul 2026 19:22:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Alex Elder <elder@riscstar.com>, 
	Randolph Lin <randolph@andestech.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
Message-ID: <ako-AA8uHfocQHnP@inochi.infowork>
References: <20260703020003.485436-1-inochiama@gmail.com>
 <20260703020003.485436-6-inochiama@gmail.com>
 <20260705-versed-leech-of-glory-db5cfc@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260705-versed-leech-of-glory-db5cfc@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_042259_387663_B28423F5 
X-CRM114-Status: UNSURE (   9.75  )
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

On Sun, Jul 05, 2026 at 11:37:15AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jul 03, 2026 at 10:00:01AM +0800, Inochi Amaoto wrote:
> >  required:
> >    - clocks
> >    - clock-names
> >    - resets
> >    - reset-names
> > -  - interrupts
> > -  - interrupt-names
> 
> Why?
> 

The K3 uses external MSI controller so it has no interrupt/interrupt-name.
But I do make a mistake here as I forgot to restore the required for the K1
in the allOf check. This will be fixed in the next version.

Regards,
Inochi

> >    - spacemit,apmu
> >  
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
