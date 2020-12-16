Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730FBC4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 01:43:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DA6522D75
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 01:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DA6522D75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=HUF70e3HrBaKTqgBkVu3XqTcOXBxRq8QNKyZF5QUF4o=; b=0j/0AmEMQs04tOZG0nwla28/a
	bBx7QE09qJuWk2Dbm0CKd33308P87J6+dXa4/1lpr9WQO58ehGb/jC0swrBXfML6guCUFExbPUemp
	nJNdDIEOTL/Pr0NeN5LMjU3Y2tvAskqLhb6TZ+nUjUt+r62EfNdddntFpwCDe9BGQuXQOCnU9ipyz
	tVTcPN97uTZrNc2PIYJSVv8BPSBsoWzQ5AAaB8RVZoQNZ46c3hSrMF13mbAJcipA9cdued7DH/sxw
	8118RJrFyWkZsvbsADDCMXIhbobZa2J4QxUzpAZsbuZJevrG+7KfCgdnzsCy8xQrI++ZcH/Y6O3O1
	MUulvcxtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpLqM-00018L-N8; Wed, 16 Dec 2020 01:43:06 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpLqJ-00017b-CV
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 01:43:04 +0000
Received: by mail-pf1-x441.google.com with SMTP id 131so15589598pfb.9
 for <linux-riscv@lists.infradead.org>; Tue, 15 Dec 2020 17:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DGe/kRe3MPa9vd1aCEWGdtZxWk4QoHI77u2B0aTPVnk=;
 b=QuNnQeUg3VuTh7gBLVXdIVgxTypFlOGy6oePrOx2wgkTrttR5ak2rIv7STrsRFoatP
 fjv1prlnss/4pkuopcEJa1cNeW1zThsNa4mGSOMHXhBDRnZQwEr/+7Z5BbYGhxMkl1Qp
 7NEMjOpUCkzq2liC0dhW38IdMnm+WmqmUiM0WVEU10mnaF6MYa3Pm3xhDMSfyK3XUgql
 XnTeaoxOZo3m2wf518FOBMf03pVB/ns4Z1qGHCUE+oyjlUNhogEUlthqZ9QKuoT6ssCx
 HY1NaeRuF8kGFlsZRtVDrPPqbMZHgm+Rh+UbiIe+7zDwGsHMSx05rWiz+uM6g4TRe4St
 4v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DGe/kRe3MPa9vd1aCEWGdtZxWk4QoHI77u2B0aTPVnk=;
 b=VmIHhf/03ke7bArIxv4x2sAyW9NjOx3D9PWVk79w/pv08xI/O5JwUSCUcR6qTMBr41
 Phawf2iJRrk8Ryi4ZP7mFti4AjHF5yQgPt7OfX6WEvkL/HdhJ+uJ+ydmiE9zreAZktw3
 fZA8rEoSrMqs9FfUFDKXjX5S+oWkJ+gsMnLo2Y+2xl+6V7LI1SY8okJP3eR7I4atYFR4
 nz173AxXy2FNuhYh6njqf/NRf744CO6fVoxp4q5FLvxq7sigK4jZA1EJrb4P8KSloWDw
 eiNTaw+13TYLdTtW2dy1PwHtGZJnm7fsLZuGfYm9rgdMLBMjkPv13S3FQkMUyb21cSlk
 DXhQ==
X-Gm-Message-State: AOAM532gu6xufNREjDZTJOc9ZZ716W9OztK+NTYF8ROs7fHE0/FtFg6s
 FeCILG8FD5WPILmCkweFH95AZvHajAjJf4kT
X-Google-Smtp-Source: ABdhPJyD+Cum/1oT2A0wUWaIVXeLrYJ3kkq1S47NQ3+eDX2q876+qo+YidZox/GyTlXMcM5A3tbvNg==
X-Received: by 2002:a63:4950:: with SMTP id y16mr31128740pgk.415.1608082980594; 
 Tue, 15 Dec 2020 17:43:00 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o11sm154817pjs.36.2020.12.15.17.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 17:42:59 -0800 (PST)
Date: Tue, 15 Dec 2020 17:42:59 -0800 (PST)
X-Google-Original-Date: Tue, 15 Dec 2020 17:42:58 PST (-0800)
Subject: Re: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
In-Reply-To: <f47e089de657073d09ee5407af690e8f97bc6e95.camel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-bdf9260d-0bbf-42e5-b32e-c75b870227b9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_204303_552369_C65A6D6A 
X-CRM114-Status: GOOD (  27.19  )
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
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linus.walleij@linaro.org,
 seanga2@gmail.com, linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 p.zabel@pengutronix.de, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 13 Dec 2020 00:06:22 PST (-0800), Damien Le Moal wrote:
> On Sat, 2020-12-12 at 22:04 -0800, Stephen Boyd wrote:
>> Quoting Damien Le Moal (2020-12-10 06:02:51)
>> > 
>> > Finally the last two patches updates the k210 nommu defconfig to include
>> > the newly implemented drivers and provide a new default configuration
>> > file enabling SD card support.
>> > 
>> > A lot of the work on the device tree and on the K210 drivers come from
>> > the work by Sean Anderson for the U-Boot project support of the K210
>> > SoC. Sean also helped with debugging many aspects of this series.
>> > 
>> > A tree with all patches applied is available here:
>> > https://github.com/damien-lemoal/linux, k210-sysctl-v20 branch.
>> > A demonstration of this series used on a SiPeed MAIX Dock
>> > board together with an I2C servo controller can be seen here:
>> > https://damien-lemoal.github.io/linux-robot-arm/#example
>> > 
>> > This tree was used to build userspace busybox environment image that is
>> > then copied onto an SD card formatted with ext2:
>> > https://github.com/damien-lemoal/buildroot
>> > Of note is that running this userspace environment requires a revert of
>> > commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
>> > 5.9 development cycle. Without this revert, execution of the init
>> > process fails. A problem with the riscv port of elf2flt is suspected but
>> > not confirmed. I am now starting to investigate this problem.
>> > 
>> > Reviews and comments are as always much welcome.
>> 
>> What's the merge plan for this series? I'd like to apply the clk patches
>> but they're combined with the sysctl driver so I guess I can't?
> 
> Not sure. Palmer ? What is your plan for this series ? Can you queue the
> riscv/DT pieces for 5.11 ?
> 
> I will post a v9 to address Rob's comment on the sysctl and fpioa drivers
> binding doc, not other with v8 changes beside that.

I guess I got hung up on that bultin DT thing, but I've sort of decided I don't
really care that much (though I guess I didn't decide enough to reply to the
email...).  I don't think it's 5.11 material: we were told to be stricter this
time around because of the timing, and I'm trying to sort out a boot issue
that's manifesting post 5.10+for-next merge so I probably won't have time to
take more stuff.

Also: I'm kind of trying to avoid the whole thing where I take patches that
have a bunch of versions sent either right before or during the merge window,
as it just makes things too hard to keep track of.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
