Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9C7C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 18:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4rr2Kdnf9k/DMyaN2HRzJmdSQr6TPxf/yd+kXAvwpA=; b=Sh7IYhbStXc3/X
	cSy5W5ZQyLTN8lSPjWHycGPYuFgPCVsAuKC/oOCTmYAep5f9YpqwzwQbuAS7XB1Q5UlEwWwch0jAa
	vophghGJ80J3e7jF/wq0CPZDNsgjFUcU0clu+kLpdcamoDpcsTDPi8jgzIy9kJKIh6RZlpuXnIlwK
	K/b9MPK5S6nO5KXHjPtu+jkKbjpaPIa373xnYMFtmXvDretj2aRoxlipQbva7gwvyT8nOHcX2QY0V
	u5eMsc0JpwsOfwEql2aPskUgZU4Np6nDDQrdcHz5T90DiSRtxlZsrnVlvnmZh6JBP+iVF9N5nZvlG
	cfsPm5vnXX/OWvh9NOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otYks-0005ut-5C; Fri, 11 Nov 2022 18:27:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otYkh-0005rV-J4; Fri, 11 Nov 2022 18:27:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E91EACE278D;
	Fri, 11 Nov 2022 18:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43F5C43144;
	Fri, 11 Nov 2022 18:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668191254;
	bh=r2cI09RUXuELqRiuQS5kKQ79PQPgCuGaFw4FvQy4K9w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bn606Xi8F0jx27buuhj9XwSONaHLGZzzcIotUYXv4ZKWBQeeUDyfRoNmj2JFkndd/
	 4GIp4ngPAWf2LF184mjQo29YdjxybzAGlKmAO4UYd8tL6hDLuktD1SfEBXUvoUFaom
	 ltrxbltUqo5iJcClAQG4PnmPmYGhuBiQd3PlxoV8JF6GGnyBonr3LsB8B9jQ+RHbow
	 GorUBHsmsaLEKbMk5A0qMAvES5X7ifMVGSSjygOiqI42xDskcQbZXFBqY1HBZS7/ZZ
	 9j5W4TIP75bvJcf3j37BS1T0Ygffu/VOfPQs006iPYcfjPes/FIHeY1ih8kWlVkmPl
	 K0JJoVRcOFZgA==
Received: by mail-lf1-f41.google.com with SMTP id a29so9474567lfj.9;
        Fri, 11 Nov 2022 10:27:34 -0800 (PST)
X-Gm-Message-State: ANoB5pkTaWX1J4WQvZcn69zgZo0UC2mbKWcqtisUkPpCZwtX3XvqCv/X
	d83IwEfOoc2b/ipbCdL8FEKHA8aFN6d8XoI8ag==
X-Google-Smtp-Source: AA0mqf5AsfopZSW40P5z5SuakKi9gWyzraY7YgC+syc1XRIXJFwAM0ajx5uLiWLRMjx1lWptwFOAR2YFY1YIdK1z7HM=
X-Received: by 2002:a05:6512:b1a:b0:4b0:3e46:2b75 with SMTP id
 w26-20020a0565120b1a00b004b03e462b75mr1111916lfu.368.1668191252668; Fri, 11
 Nov 2022 10:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20221031153954.1163623-1-helgaas@kernel.org>
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Nov 2022 12:27:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKt81KKopsGML7k3mvBqFCQ5VkKx31eCdjntpsHBkTMkw@mail.gmail.com>
Message-ID: <CAL_JsqKt81KKopsGML7k3mvBqFCQ5VkKx31eCdjntpsHBkTMkw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] PCI: Remove unnecessary <linux/of_irq.h> includes
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Tom Joseph <tjoseph@cadence.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Toan Le <toan@os.amperecomputing.com>, Joyce Ooi <joyce.ooi@intel.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-omap@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_102743_844978_FE5B1085 
X-CRM114-Status: GOOD (  10.31  )
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

On Mon, Oct 31, 2022 at 10:40 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.

Note that the same is often true of the other of_*.h headers.

of_device.h and of_platform.h are tricky though as one includes the
other (with a decade old comment to fix). I started down that rabbit
hole once...

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
