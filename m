Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE347C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9seJ2bp1cCQmekHZojcpGyxqm4Z+0R6idZABy3YjBg=; b=2o1xBbI2xDRHJl
	BDAuZsAUy0qbHv32VCjwO9ypACvktVOoImRSUgkbbfh/xw0iT03boBxGEh6r5LDMeHQr29KJZMP8E
	zxjkfAX/FpkWTAryHQe2YAgwhA41g2eiIg/Q8gKzXm43ehgUuh35a3WFRnx+6qkmz1LbCu4s5uR5p
	qMNWtJVC42t4m0b8tB/NbbjNWZtWuC7PGis0xSmL8/ePb4D4uiormva0uGr4SWY7u5bybhTTP8edc
	WfzdpMGJFPl8VFPh4HdXtq7oXAlrEJcyOPFgSUv/vlhxd7zqmwzppIZ3d+3FNSk5lkJ8FUOGYzg4j
	nJi5ZBkQ2a/yB5d6pN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdg7-0000000AVou-30ki;
	Thu, 13 Mar 2025 08:12:31 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdff-0000000AVlr-3ldZ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 08:12:05 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso1142573a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1741853523; x=1742458323; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hMyv34pTISRCo09Nm4ZPlxjDBtcm83XdK8rjSQH8Ng8=;
        b=uekXvTNHQoHsra4Taw8DQ9is7umeTvZIT6RVwzT5OwvS1MRbM9wF4XE3scOhw3dcEB
         r/Ytq3KBqRhEATA6F3umLVMX91kSe7wQvqdbebQoWGdIr/Jy8qL8YFb896yR++WOrcxr
         TF5BZxWb5CXGKxn91iEX4t0lAvDAR2F86EXAxCrwVRp9zqCIRB9AwspW0EfmHhYtDxEz
         8t+5vVOIrWUmxAfXkrtTfup9ylg5c7Y7uOLRXixaamELAgMuaqXE58gWzsAw/mTZzvOq
         kVVADEctE2br0sZ8P1iywKfmZO9by30SvQaiiznv+YA8FAeh/VPTUi6rDysLk6wrzRLd
         B4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853523; x=1742458323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMyv34pTISRCo09Nm4ZPlxjDBtcm83XdK8rjSQH8Ng8=;
        b=SqB36yaOFU1APoAiEqwz7K4t7TWCbdC0kxYy9igvJ1JoBjGKlu+f/vR9MJ732lLfHk
         fQ69f4oX78DPKJekBfnCYj/st0xFZLFJ/Jfsw5WIAZkS6HOHIlIx2QdxN6bT+wu7CjqY
         RHqPRkO8UCG/VHYfx/Z0rBnEVLFvX/eXY3PTOGz2NgNPVIV70h983xMftKzkjnSCom3E
         2zQNbkLRKGYb/CAzLQYffnCESUQ3AqiSiwaezQsz9Oz66LzUzJ4jRTaAIuBfe0dGn1Ze
         jA5qkMdABEf8lieVCYItztbRL/9xoUyRNJfLRjDYTP30Bg9wByyLdsu9591fYFLKSt7c
         Mq8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrBYw3W7UMb1hoY1fnTzMJyVjMHkMkcLJLIjKc3KMcR+g848xNJ55V9ur7zhn5tUL1ReuTUkKGPu7cxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvM6DeAm+8RxYFjYXsSkuoeNoNGiiuFVQRlSVHBe0XwcrU2M75
	2MNFxzzJpbxvg7m1FwgUUgwL0dVe1d1aA2f2NzvKDWICphA/hXPq6K+A2HTdioFNSCTMZKNt2Pl
	3
X-Gm-Gg: ASbGncuva8zo82cZUgouBgogzID91x0+OeS4/EDVUs2DVyiMlD81HrvBp8xjWNxeEfO
	rZFYTyrGrtqL7t/bUE6NTjG278cFbNxKHDHRXoO4LAbQ9AxuGmMXjMqq+KhCakbrkIoGoVIwMOB
	PiYbvU54T2oD7VPu1BH+bCnayCJtnriY6rCMW27icRu7S3widGKzuerfyo/EkDh7Tp41bCOMixU
	s4TzHrSIlDEeHSDmlVjhvV+P9icBjUhnEHQ6BxyK3gVneWdxMbd2eedbPRQenTM7q8xlf9f+59f
	FKT1lhqwT8RmUISptoLffKyxTQ==
X-Google-Smtp-Source: AGHT+IHfykXuKqP+IUtV7YBcmaO3errhm+D+UcJTQxE3sDBqJ8q7MdfshOawA55kfif74OzDGiSbMQ==
X-Received: by 2002:a17:90b:4c4a:b0:2ff:7ad4:77b1 with SMTP id 98e67ed59e1d1-2ff7ce4f260mr37122057a91.2.1741853523011;
        Thu, 13 Mar 2025 01:12:03 -0700 (PDT)
Received: from x1 ([97.115.231.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68883fesm7885555ad.6.2025.03.13.01.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 01:12:02 -0700 (PDT)
Date: Thu, 13 Mar 2025 01:12:00 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, guoren@kernel.org,
	wefu@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/5] TH1520 SoC: Add AON firmware & power-domain
 support
Message-ID: <Z9KTUIix4z7xb/e1@x1>
References: <CGME20250311172030eucas1p12dda42760f751174e774b8d1a3d3f4cd@eucas1p1.samsung.com>
 <20250311171900.1549916-1-m.wilczynski@samsung.com>
 <CAPDyKFqeaq5xVNA=0CpMWSt_78qXJsY6+mpE1CSmLrVMQazAjg@mail.gmail.com>
 <4b45236e-8252-4dd5-b3f7-3595b0924182@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b45236e-8252-4dd5-b3f7-3595b0924182@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_011203_938651_9DD766B0 
X-CRM114-Status: GOOD (  33.19  )
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

On Wed, Mar 12, 2025 at 03:31:04PM +0100, Michal Wilczynski wrote:
> 
> 
> On 3/12/25 14:40, Ulf Hansson wrote:
> > On Tue, 11 Mar 2025 at 18:20, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> This patch series introduces and documents power management (PM) support and
> >> the AON firmware driver for the T-Head TH1520 SoC, as used on the LicheePi 4A
> >> board. While part of a larger effort to enable the Imagination BXM-4-64 GPU
> >> upstream, these patches can merge independently.
> >>
> >> Bigger series cover letter:
> >> https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> >>
> >> This series is versioned to maintain continuity with the bigger patchset it is
> >> a subseries of. Please find below a changelog for the AON & power-domain:
> > 
> > I can pick up patch1 -> patch4 via my pmdomain tree, assuming I can
> > get an ack from some of the thead-SoC maintainers.
> > 
> > Patch5 is probably better to be routed through the SoC maintainers
> > tree, but let me know if you prefer me to take this one too.
> 
> Thanks, I don't have a preference, I'll leave it up to SoC maintainers.
> I haven't included the device tree changes in this mini-series, as then
> the PM & firmware, clock, and reset mini-series might conflict with each
> other in th1520.dtsi file, but SoC maintainers might also find it useful
> to pick this commit [1], along with the patch5.
> 
> [1] - https://lore.kernel.org/all/20250219140239.1378758-20-m.wilczynski@samsung.com/

I applied this series on top of next along with the above dts patch.
The existing functionality of ethernet and emmc continues to work
correctly. I can apply the dts to my for-next tree once this series
lands in next.

root@lpi4amain:/sys/kernel/debug/pm_genpd# cat pm_genpd_summary
domain                          status          children        performance
    /device                         runtime status                  managed by
------------------------------------------------------------------------------
dsp1                            off-0                           0
dsp0                            off-0                           0
gpu                             off-0                           0
venc                            off-0                           0
npu                             off-0                           0
vdec                            off-0                           0


Thanks,
Drew

> 
> > 
> > Kind regards
> > Uffe
> > 
> > 
> >>
> >> v8:
> >> - add proper cleanup in the th1520_pd_probe()
> >> - add "suppress_bind_attrs = true", since there is no need to unbound the driver
> >>   during runtime. This simplifies the code by eliminating the remove function
> >>
> >> v7:
> >> - add '#include <linux/slab.h", due to kernel robot issue
> >>
> >> v6:
> >> - split the firmware & power-domain patches into a separate series
> >>
> >> v5:
> >> - changed the AON driver to be a set of library functions rather than a
> >>   standalone driver
> >>
> >> v4:
> >> - added workaround to disable AUDIO power domain to prevent firmware crashes
> >>
> >> v3:
> >>  - consolidated device tree representation by merging aon and power-domain nodes
> >>    while maintaining separate drivers internally
> >>  - power-domain driver is now instantiated from within the aon driver
> >>  - fixed optional module dependencies in Kconfig
> >>  - added kernel-doc comments for all exported functions
> >>  - implemented th1520_aon_remove() to properly clean up mailbox channel
> >>    resources
> >>
> >> v2:
> >>  - introduced a new firmware driver to manage power-related operations.
> >>  - rewrote the power-domain driver to function alongside the firmware driver.
> >>    These nodes in the device tree lack direct address spaces, despite
> >>    representing HW blocks. Control is achieved via firmware protocol messages
> >>    transmitted through a mailbox to the E902 core.
> >>  - added new dt-bindings for power and firmware nodes.
> >>  - ran dtbs_check and dt_binding_check to ensure compliance.
> >>
> >> Michal Wilczynski (5):
> >>   dt-bindings: firmware: thead,th1520: Add support for firmware node
> >>   firmware: thead: Add AON firmware protocol driver
> >>   dt-bindings: power: Add TH1520 SoC power domains
> >>   pmdomain: thead: Add power-domain driver for TH1520
> >>   riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
> >>
> >>  .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
> >>  MAINTAINERS                                   |   5 +
> >>  arch/riscv/Kconfig.socs                       |   1 +
> >>  drivers/firmware/Kconfig                      |   9 +
> >>  drivers/firmware/Makefile                     |   1 +
> >>  drivers/firmware/thead,th1520-aon.c           | 248 ++++++++++++++++++
> >>  drivers/pmdomain/Kconfig                      |   1 +
> >>  drivers/pmdomain/Makefile                     |   1 +
> >>  drivers/pmdomain/thead/Kconfig                |  12 +
> >>  drivers/pmdomain/thead/Makefile               |   2 +
> >>  drivers/pmdomain/thead/th1520-pm-domains.c    | 218 +++++++++++++++
> >>  .../dt-bindings/power/thead,th1520-power.h    |  19 ++
> >>  .../linux/firmware/thead/thead,th1520-aon.h   | 200 ++++++++++++++
> >>  13 files changed, 770 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >>  create mode 100644 drivers/firmware/thead,th1520-aon.c
> >>  create mode 100644 drivers/pmdomain/thead/Kconfig
> >>  create mode 100644 drivers/pmdomain/thead/Makefile
> >>  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
> >>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
> >>  create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h
> >>
> >> --
> >> 2.34.1
> >>
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
