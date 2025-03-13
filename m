Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC28C28B2E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNLUP7sVAyRR4P5LnSOk3C7ABKXNDVzq+jxXYXwHocw=; b=hysGYc+wF0H/Se
	FgpnYke7XBKevoOl88a1xo2JQGfA+7g4eF3Xu01n40y8sFjVIJARIBoyTwtBQmqpwU3OYXAr6E9mD
	8Xfy93d748tMmP+nyGxyW7ToMUmaJvxLiUGkQpafFXjsflSfiEhJBVfbG9u/IoQYqhVuaeI1tpXxW
	l+FVEbrcH6J+EBHMRQMP+9tzdoXt7cy7MRDeKLUDGwuijsOdqMihWg/PGxa9dmTX5mAdU0O/D2iTu
	QmEXm7OJurHmX0mTRlVaNc3xYuKNS1p+BuORhObggcjrmOBTMkHV6nYU3vPJZx+KR6t5Y6Qp+exrT
	x8BHbXjf8EfgcPsmSt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdQy-0000000ATkZ-3UFB;
	Thu, 13 Mar 2025 07:56:52 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdQw-0000000ATjL-02Ps
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 07:56:51 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso1228994a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1741852609; x=1742457409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=38L2hz1chNfviXDy2tP0Lz340mHS97KT0hvfgoNEhj0=;
        b=AtF/TxSQBR33ouKm0MLoUQ1FkJ5fUgOXa+rexgralosaIjNInGk3/QcXqgvG8hHCUS
         X2BkPzs7bbR8gNZ0VWGY7WF1cLc21DoQOf0q5io1FZTQuAZg9ccBtjeP7AlGdf8M/0dd
         AC4J7NKpet/nkJ21+OIVePQkwixcP3u1mVp595OWSrn+VL+aK/5/ItkVc9SERuRXQhW+
         2RVaFkcoBb5BYiQ6wFUAdYQZjmjZ003ooO+yqXoz4FVTRvXnr7eLvdw4YzQyCbI1nUfl
         Eod62cj5q5mtOy9+hFKiV4uBkwJu9nGuHBm33GvwvHIEwU9YRpZfau7f0aSZp/oYCB+S
         ZryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741852609; x=1742457409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38L2hz1chNfviXDy2tP0Lz340mHS97KT0hvfgoNEhj0=;
        b=XG3V8V/2uGw6Wzf1bbfq9LQEcmdnTpJOzg+4Y92LSzXkwMczuvQ4eVa8Kf9TqEVqXQ
         Azc/CIdy9lg3WKz6W64fOOwxKNnuV0wd0RLOuNRz104yzv7xmJFG3c9fOPz0pzKO+aO7
         1oMNYWkKZcmljvK6zL4tsMFt21dBZny+448a5O8vim9ebRW7w+SylPw1hX1HMxkviYBo
         m5gmyQgDCm66S8PTC1jVU3nClpFq5AhdrRq+ASRFrhI7hn/UW3QNApJieZlu7//jf9Ql
         kYmFybx+8YCdwmq5ZHp0GcyDikek0bfmock5u3h/DGkEDr6Kj4L7XsHKnbSQZQKKrat6
         Tkew==
X-Forwarded-Encrypted: i=1; AJvYcCVabOFB507DeoBE++x5XUBrhhOVM6qYpa8GH3xmIuo1dOBnta6RfAiIhs9nZ27voh9arbrrFzIpmSgJdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHIMsGzfwGJlaSi+VAHU1SvYroBuICU5Fk/FS18ugT1kZKQLFb
	rTcMEWP/my48IhZTJvTsgAEofkJqrOHfBTTiuph/nthLfNLu26Hdxa3pS34CJiY=
X-Gm-Gg: ASbGncsKS33c60RCW1UUg0CsI1dbQEL0aKR8ZUrUNkLS0DREmQTraQSMOA/1A8p9rDI
	QzfoYRi8isR3Mz4PDJhKOuNK0C7Kzni6D5d17AaoaStNpPWdj/MSSiSfprmhYukBzBUDNTKjDEE
	e0QcBMWkSV5o+M1IloMYzPjfBZ6COXVln6ZC8hPE0KJImvwgWsAWLhz/+RAVxZd5E9RyQ9UOLDM
	MED46hHuLPEn4wigbq60ddyXgw9jsW6bZAfp7I8d4d7owefLMhZbc7OnC9EUnIHZfE3FWlwaKab
	hHUNQiF6lUvr70SdXBlwzdYpXw==
X-Google-Smtp-Source: AGHT+IExdVBJ3/gcWBXodBlgc0t0CtGEm8NtDZGsZZGRgntPtjMcoKU8fMdl0fX1ZXY61aguSYRxkA==
X-Received: by 2002:a17:90b:4f8d:b0:2f8:b2c:5ef3 with SMTP id 98e67ed59e1d1-2ff7ce8a02fmr39178985a91.14.1741852608708;
        Thu, 13 Mar 2025 00:56:48 -0700 (PDT)
Received: from x1 ([97.115.231.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30138f89db9sm796672a91.34.2025.03.13.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 00:56:48 -0700 (PDT)
Date: Thu, 13 Mar 2025 00:56:46 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 0/5] TH1520 SoC: Add AON firmware & power-domain
 support
Message-ID: <Z9KPvig0dPRO0cX1@x1>
References: <CGME20250311172030eucas1p12dda42760f751174e774b8d1a3d3f4cd@eucas1p1.samsung.com>
 <20250311171900.1549916-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250311171900.1549916-1-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_005650_337400_0D2AA72E 
X-CRM114-Status: GOOD (  23.38  )
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

On Tue, Mar 11, 2025 at 06:18:55PM +0100, Michal Wilczynski wrote:
> This patch series introduces and documents power management (PM) support and
> the AON firmware driver for the T-Head TH1520 SoC, as used on the LicheePi 4A
> board. While part of a larger effort to enable the Imagination BXM-4-64 GPU
> upstream, these patches can merge independently.
> 
> Bigger series cover letter:
> https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
> 
> This series is versioned to maintain continuity with the bigger patchset it is
> a subseries of. Please find below a changelog for the AON & power-domain:
> 
> v8:
> - add proper cleanup in the th1520_pd_probe()
> - add "suppress_bind_attrs = true", since there is no need to unbound the driver
>   during runtime. This simplifies the code by eliminating the remove function
> 
> v7:
> - add '#include <linux/slab.h", due to kernel robot issue
> 
> v6:
> - split the firmware & power-domain patches into a separate series
> 
> v5:
> - changed the AON driver to be a set of library functions rather than a
>   standalone driver
> 
> v4:
> - added workaround to disable AUDIO power domain to prevent firmware crashes
> 
> v3:
>  - consolidated device tree representation by merging aon and power-domain nodes
>    while maintaining separate drivers internally
>  - power-domain driver is now instantiated from within the aon driver
>  - fixed optional module dependencies in Kconfig
>  - added kernel-doc comments for all exported functions
>  - implemented th1520_aon_remove() to properly clean up mailbox channel
>    resources
> 
> v2:
>  - introduced a new firmware driver to manage power-related operations.
>  - rewrote the power-domain driver to function alongside the firmware driver.
>    These nodes in the device tree lack direct address spaces, despite
>    representing HW blocks. Control is achieved via firmware protocol messages
>    transmitted through a mailbox to the E902 core.
>  - added new dt-bindings for power and firmware nodes.
>  - ran dtbs_check and dt_binding_check to ensure compliance.
> 
> Michal Wilczynski (5):
>   dt-bindings: firmware: thead,th1520: Add support for firmware node
>   firmware: thead: Add AON firmware protocol driver
>   dt-bindings: power: Add TH1520 SoC power domains
>   pmdomain: thead: Add power-domain driver for TH1520
>   riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
> 
>  .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
>  MAINTAINERS                                   |   5 +
>  arch/riscv/Kconfig.socs                       |   1 +
>  drivers/firmware/Kconfig                      |   9 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/thead,th1520-aon.c           | 248 ++++++++++++++++++
>  drivers/pmdomain/Kconfig                      |   1 +
>  drivers/pmdomain/Makefile                     |   1 +
>  drivers/pmdomain/thead/Kconfig                |  12 +
>  drivers/pmdomain/thead/Makefile               |   2 +
>  drivers/pmdomain/thead/th1520-pm-domains.c    | 218 +++++++++++++++
>  .../dt-bindings/power/thead,th1520-power.h    |  19 ++
>  .../linux/firmware/thead/thead,th1520-aon.h   | 200 ++++++++++++++
>  13 files changed, 770 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
>  create mode 100644 drivers/firmware/thead,th1520-aon.c
>  create mode 100644 drivers/pmdomain/thead/Kconfig
>  create mode 100644 drivers/pmdomain/thead/Makefile
>  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
>  create mode 100644 include/dt-bindings/power/thead,th1520-power.h
>  create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h
> 
> -- 
> 2.34.1

For the series:

Acked-by: Drew Fustini <drew@pdp7.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
