Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5630C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 15:22:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307B3206A2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 15:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wVqX3and"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307B3206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J7lDVEPUBBg9O+KSkAnnu+G7VDOTbVM5Y0RGGoF8Js4=; b=wVqX3andqMmeYGXPv111S3Cqo
	IIooW2nV2AfCMT0V5I6Sh3/OoiRcp5Olw5Ctf7pkZ0mrvkIUKXWznPCzC0yRHabBNnmGUyCwdY/Aw
	T36bBB2XIPw8rOxdMvM4A9kRVCbFpMCv4duFKP3gPJtBwbSU/ATPaHmJY7xYEKrszGzReZjFS7wZa
	g54ym0zNO2r8bQFWWcYW7g8JExTbH8S8G6p1b+oz+GUU4wBHWPpWsQdw6a8m1hY6w1kGbEIW06hxD
	GYdzw+ykZnQ/K2Bj35bZIyoun1J34o8SJhQHSflDd1eYnC6TFrTCIzme1gPn/uO+rCborhK1wBJva
	2kU73UJug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICmX-0007Wv-27; Tue, 15 Sep 2020 15:22:09 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICmU-0007W9-Fc
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 15:22:07 +0000
Received: by mail-il1-f193.google.com with SMTP id a8so3399310ilk.1
 for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2020 08:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2dmfNBb0or2XBWPH7M/N/gQr8odxPSG4GRXc89xeEQs=;
 b=kMEnrNIeUOg3awJdcNeuIS5gPMGV1QFIRmcoHqz4lbbABnCLPWtBQBGWLq+OiL71UJ
 3e9bsf5VXqHv+nK8Z5VClJ8Jg/46GsFYAe4sYkm4gJD9xxHyPs5u/i27j004/v0TvT79
 UDrOFpFJaF7bW6lODtTFGtzwiadj+Y6+ROjkZeZMsVWHDMX2AJ0Z4kE+IAyN90ajYzVV
 1gLY09QaolG4pvkc6XpDyzGKpkS2/DBmW5MbyKy4ya3cNvxWqq2xUwvEX0rTKV5ZAsoe
 Ub1QZw0en3iyCXzgr8yzxnrSj2mt5EwSJGy+8Nj8o2onbBHOjBSu/AZxUHkaJ7ITwYjo
 UzTw==
X-Gm-Message-State: AOAM532GtrH7c2qY2s+kOV0sabPnRnlXgSkcY89IR5Hv/wstlyiv1ktW
 x6k7nUV0aOUHuesNzgAvrg==
X-Google-Smtp-Source: ABdhPJzarGxOa8101phpgLhMEl8zzSnfyDc9QvxX1EgyRjavIVLGiApIp7im8HIM665ERMPXyFrw8A==
X-Received: by 2002:a92:9f53:: with SMTP id u80mr16938322ili.42.1600183325322; 
 Tue, 15 Sep 2020 08:22:05 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b8sm7756889ioa.33.2020.09.15.08.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:22:04 -0700 (PDT)
Received: (nullmailer pid 1970179 invoked by uid 1000);
 Tue, 15 Sep 2020 15:22:01 -0000
Date: Tue, 15 Sep 2020 09:22:01 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 0/3] SiFive DDR controller and EDAC support
Message-ID: <20200915152201.GA1940827@bogus>
References: <1599457679-8947-1-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599457679-8947-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_112206_528779_4CB6D8A2 
X-CRM114-Status: GOOD (  10.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, james.morse@arm.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 aou@eecs.berkeley.edu, bp@alien8.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 11:17:56AM +0530, Yash Shah wrote:
> The series add supports for SiFive DDR controller driver. This driver
> is use to manage the Cadence DDR controller present in SiFive SoCs.
> Currently it manages only the EDAC feature of the DDR controller.
> The series also adds Memory controller EDAC support for SiFive platform.
> It register for notifier event from SiFive DDR controller driver.

This is an odd split and notifiers aren't a great interface. Why not 
just combine these? Is there some other DDR controller functionality 
planned for the driver? 

FYI, highbank_mc_edac.c is also a Cadence controller. IIRC, the register 
layout changes for every customer/design.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
