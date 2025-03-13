Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F18DC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 13:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYJzGqS1DBNBTQEJCnk1369uOOJsmTAllL+feacg6PY=; b=ZHSbCsovSMYjrx
	nlmY+iC6QBhVB7VRbGlxhzFwBCCIXQniBkEn33Dd52zMVcAwM3Se4ZLw5rnssGs/hdHikN5lPeOrc
	nUN1MXhc6f+Zh2QkuvzgG3YFRjreot8TiPNkfWiSFt9zk/zKYCpFkZMzxH1sopT/hBcBcVEMEJbyr
	r9lkGBNYBov9QTj2j0OnvXXaDwuQZA8koJ53gBVSyag2oMz8cP+P/pcU7n+HAtbgjSwh9T/2VUUqo
	NpCT4YQJyL8a2E3lLqrOI+bhwXk0cHWiByThhaBkQiVQoAPpVXH0HKxbyVRO6zCGbnA12sjiZfk0B
	ulq6uGcRwT+Knxk5lEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsitT-0000000BQNH-1Faj;
	Thu, 13 Mar 2025 13:46:39 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsitR-0000000BQMf-2m1Q
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 13:46:38 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6fece18b3c8so8905617b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741873597; x=1742478397; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3pruppk4STwGuRQ4gOsQ41gA9jN4GcpyPa2+9qAli4c=;
        b=RpY5Dn/dp63V2iugvawnTI9TL9yKGuqt6TUQuaAwLpnRb10XAe994ilxMhP3twobaq
         Ay3SCXRaWBLNh8cbpBxFyuvqp4hNN34OXyTd34R5LcNFIKUbp8s7vSbiLzD4qaM2RV+1
         f8VbWidXdKSrAJ4ANlvSAUDmCgjDxsIJjHE6JufzCMw1cxJQf3NqyXYCaz2eS89uKEKR
         pxDFJ0p3XqL2YwOqGoBKYeotl8X2C0O1BUJnliCMTXItJr+yeL8ba7XHSETmXkUiZDnt
         zuOYYw1B4T1ik0o3lNZQtq9yubIeIUnArulN3J5WzifLvr6dW9vpna1daicGGS18phRR
         M9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873597; x=1742478397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pruppk4STwGuRQ4gOsQ41gA9jN4GcpyPa2+9qAli4c=;
        b=eST0mfZybmvLSnO/vMXowUfIU1Viazdys0XEz8ktFWM+4LW+1vcNUBOYVU3/EzxA8N
         W/Lp53O4VL7jC1mqm7PLcfK8s7h04vNgYucr8nJAG0pOcFojhMK3nTa1mOMh3vy0w39f
         IvQMIogfsPXnIFWWLc5Ff/t5EHu97ARrMrA05wV2Cxb1p3YOz4RhWlfqCOd1bTgCmjYT
         JIlPd9uPSF3Uc/GzSwwvzOScD2i9FISvpIuUB4SRkmZjinXUpO5Q26h5ylLylXCQ3iSj
         kP+tJc2mX+MGFrHwWTDf06WhNsoJyEffomZzrtGElJSgWy8LRfEzz9hxGFd2t2fBjRHT
         X6+w==
X-Forwarded-Encrypted: i=1; AJvYcCUaZHCt2ufMlsuhMbn5ASDyPsL+wDB95R5v+OrUKY/nuWETzU669sl0f/ZUQl9K9VNwXuErzVr2r8XgPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD1Kg+ZDom6IMH73TA/mTDvgP5VYTPU9kizRWbiOJ4otdIFOlE
	6KjIoUV+1HJgMWsZ0tU4ptc/BbBeW9qLB4sfj8dQb6b+BheDtd2NSzrXSQJizwgp358Yk8J4iD0
	ElbwrxR/YxnkAtTJfoqfcmnVEGXTK/tW7YtoflA==
X-Gm-Gg: ASbGncvbbBvEQLYvFwZWIJJw3YSfIv7WTugHCVEuzL5ESMnLTbhxqXDlB559s6Afs1M
	OeTT9ToWqTBqPZtgqyI5+SOyrUZOgBxgiizW9mmjg32bVp05dMZ/hp54cps0C/Qm8PqdZXFZJhu
	wnFc3m0EXgthXkIxq+ex+d+C3mm3Q=
X-Google-Smtp-Source: AGHT+IG7vBn4URXM8J2dFID1L7Pg4fVMsep6yAv6gvLGLKB/Q06ncJU71pTeAeJFVFPXcY3eqoO5qEZ7cJRZ/u07cAs=
X-Received: by 2002:a81:fe0a:0:b0:6fe:bf9c:8e7a with SMTP id
 00721157ae682-6febf9c9506mr280796267b3.0.1741873596783; Thu, 13 Mar 2025
 06:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250311172030eucas1p12dda42760f751174e774b8d1a3d3f4cd@eucas1p1.samsung.com>
 <20250311171900.1549916-1-m.wilczynski@samsung.com> <Z9KPvig0dPRO0cX1@x1>
In-Reply-To: <Z9KPvig0dPRO0cX1@x1>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 13 Mar 2025 14:46:01 +0100
X-Gm-Features: AQ5f1Jr2C0RzgSrdaklEVa_RV8h0CZizF651FuL4N37mJLMsiwagGMmTnahMvkg
Message-ID: <CAPDyKFrCFURcTpwZnx4bs71Kw_JrRKLiuDh7954xD2k+rCDN_A@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] TH1520 SoC: Add AON firmware & power-domain support
To: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, 
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_064637_713128_6B56202C 
X-CRM114-Status: GOOD (  25.17  )
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

On Thu, 13 Mar 2025 at 08:56, Drew Fustini <drew@pdp7.com> wrote:
>
> On Tue, Mar 11, 2025 at 06:18:55PM +0100, Michal Wilczynski wrote:
> > This patch series introduces and documents power management (PM) support and
> > the AON firmware driver for the T-Head TH1520 SoC, as used on the LicheePi 4A
> > board. While part of a larger effort to enable the Imagination BXM-4-64 GPU
> > upstream, these patches can merge independently.
> >
> > Bigger series cover letter:
> > https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> >
> > This series is versioned to maintain continuity with the bigger patchset it is
> > a subseries of. Please find below a changelog for the AON & power-domain:
> >
> > v8:
> > - add proper cleanup in the th1520_pd_probe()
> > - add "suppress_bind_attrs = true", since there is no need to unbound the driver
> >   during runtime. This simplifies the code by eliminating the remove function
> >
> > v7:
> > - add '#include <linux/slab.h", due to kernel robot issue
> >
> > v6:
> > - split the firmware & power-domain patches into a separate series
> >
> > v5:
> > - changed the AON driver to be a set of library functions rather than a
> >   standalone driver
> >
> > v4:
> > - added workaround to disable AUDIO power domain to prevent firmware crashes
> >
> > v3:
> >  - consolidated device tree representation by merging aon and power-domain nodes
> >    while maintaining separate drivers internally
> >  - power-domain driver is now instantiated from within the aon driver
> >  - fixed optional module dependencies in Kconfig
> >  - added kernel-doc comments for all exported functions
> >  - implemented th1520_aon_remove() to properly clean up mailbox channel
> >    resources
> >
> > v2:
> >  - introduced a new firmware driver to manage power-related operations.
> >  - rewrote the power-domain driver to function alongside the firmware driver.
> >    These nodes in the device tree lack direct address spaces, despite
> >    representing HW blocks. Control is achieved via firmware protocol messages
> >    transmitted through a mailbox to the E902 core.
> >  - added new dt-bindings for power and firmware nodes.
> >  - ran dtbs_check and dt_binding_check to ensure compliance.
> >
> > Michal Wilczynski (5):
> >   dt-bindings: firmware: thead,th1520: Add support for firmware node
> >   firmware: thead: Add AON firmware protocol driver
> >   dt-bindings: power: Add TH1520 SoC power domains
> >   pmdomain: thead: Add power-domain driver for TH1520
> >   riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
> >
> >  .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
> >  MAINTAINERS                                   |   5 +
> >  arch/riscv/Kconfig.socs                       |   1 +
> >  drivers/firmware/Kconfig                      |   9 +
> >  drivers/firmware/Makefile                     |   1 +
> >  drivers/firmware/thead,th1520-aon.c           | 248 ++++++++++++++++++
> >  drivers/pmdomain/Kconfig                      |   1 +
> >  drivers/pmdomain/Makefile                     |   1 +
> >  drivers/pmdomain/thead/Kconfig                |  12 +
> >  drivers/pmdomain/thead/Makefile               |   2 +
> >  drivers/pmdomain/thead/th1520-pm-domains.c    | 218 +++++++++++++++
> >  .../dt-bindings/power/thead,th1520-power.h    |  19 ++
> >  .../linux/firmware/thead/thead,th1520-aon.h   | 200 ++++++++++++++
> >  13 files changed, 770 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >  create mode 100644 drivers/firmware/thead,th1520-aon.c
> >  create mode 100644 drivers/pmdomain/thead/Kconfig
> >  create mode 100644 drivers/pmdomain/thead/Makefile
> >  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
> >  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
> >  create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h
> >
> > --
> > 2.34.1
>
> For the series:
>
> Acked-by: Drew Fustini <drew@pdp7.com>

Okay, patch 1 -> patch 4 applied for next, thanks!

I am leaving patch5 for now.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
