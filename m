Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E19C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 03:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=FYfSRp4jItVnEahWpNbDu4M10jY2IGpLFw0rlxDhDgQ=; b=c0Q5Ls3Ex1w6hy7eEXc6is3lPK
	N9hNRpDuSSVywtpHeMrKI3NSWUzbbhsGj0y9vEgKLmqFqq6cWItbEibWBN0jdnKLLaVvRxj5zKnJY
	RuQbQ3YzvrPd+cXjHMe3Q/n0uLPDfPhnmUWg9vsw8Qfajya+q+/2QLdMmfBvE5yG+MfcNR5DIgPO7
	5ydIvGANQTpzvLDyTBt7jko90IYDU8eT46WZ0BVP4QvU7dij/aPygckwowzDnIY9xumZ7tgP9nnge
	/sI1ze0sJQlWOlVIiH96S1t62hle6ac5IGYt2tu7PZokQfQWP/dPZKSx3OiYd4jQQjnnD09xj+Lwo
	u01ZvHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbkx-001GUk-43; Thu, 02 Jun 2022 03:44:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbku-001GPr-Jd
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 03:44:18 +0000
Received: by mail-pj1-x102b.google.com with SMTP id nn3-20020a17090b38c300b001e0e091cf03so5063651pjb.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 20:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=gVoZS2vzK4dR4Y6/3npxg/APivJZF2gUX/to47n1YCM=;
        b=Q44pl4PZC8gOSRYB6J0wGoC2a9zoIQKt3GhYfvNGdyNqMi1D28LpJHDXUCib4gwEjc
         uHYPnsmGF4OQWkOriCKFRuh+wwpork/HmVYvSZFObqIVYFcNme6V2lbNnDyY1RV19Q9a
         XcEsWsXVq7t4LcaDTbJ4gFcJYA6BWSvcldHcjhYeUtGk+/ANknZ4Ah+EDgmfsttlBZ+w
         ewej66JKui+QNQ5xzzWescXdSGIy0d3NgUYmn6eAKA35WkWT4yYojaX6eNAl9XHV5FYQ
         1lNWlrC9Cz8NOlXMlCYO4/t581jvyztxvBvvS61gxRNNdkWeHPCckqsN66LLP4Rxj0fK
         9FIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=gVoZS2vzK4dR4Y6/3npxg/APivJZF2gUX/to47n1YCM=;
        b=vpTsxPbKKdHTT2ADGrW78ppv4GiTjJ+W+1qJRSX62WNtz/gega8XQNr92MQ+XVyp5y
         9CYsZZi6i4YVIp5JrFPdkjTqepKxx3/6nV4uh6R6iF8Zra7Fgdiw+jNIqV5TjXC4Sbo/
         OzOauk4aI9e3FhhLDF4TutcoMNTiXhznZtWXhWVrmS9bUGmfQcpsWmXsD7LWDLeUpcfi
         ZMPMwYzZLBh0oASlVMRz1hKIJEglclwsbRkXcUZSc7nkzcb/oeCeBkqNNrq/GNgW7s7B
         iMaV+RCfRfe9lcsWpIFyRFRw18R+TcVkepNLqZzcq0xZ7D3VPo/8O7LgpYIjdEcqWT2Z
         2iaA==
X-Gm-Message-State: AOAM531H3UiW1Vi1W8hFBr7hwHC/TzEs5FFz7BSw2TXUoWbQBb47MXJr
	TXz47N55xZMiDhQ+wPlWXXn8Lw==
X-Google-Smtp-Source: ABdhPJyEM2/VwvlC2CQzIqSXaE9/L6LNxoxkGMuwk5y4slDj7Ce2IqnUVMNuNFwIjbCt4hFIkjlXTw==
X-Received: by 2002:a17:902:8203:b0:15f:4423:6e9c with SMTP id x3-20020a170902820300b0015f44236e9cmr2747281pln.25.1654141441419;
        Wed, 01 Jun 2022 20:44:01 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id x1-20020a170902820100b001618383483fsm2268587pln.224.2022.06.01.20.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 20:44:00 -0700 (PDT)
Date: Wed, 01 Jun 2022 20:44:00 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 20:43:21 PDT (-0700)
Subject: Re: arch/riscv: SV48 patch series questions
In-Reply-To: <83813d991f96428c95c6d681c16ae852@EXMBX161.cuchost.com>
CC: alexandre.ghiti@canonical.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: leyfoon.tan@starfivetech.com
Message-ID: <mhng-055df44c-3feb-41ae-b8c0-ae3a6489dee1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_204416_684351_740F9E7D 
X-CRM114-Status: GOOD (  18.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 27 May 2022 02:37:34 PDT (-0700), leyfoon.tan@starfivetech.com wrote:
> Hi Palmer
>
> Alex's "Introduce sv48 support without relocatable kernel" patch series in [1] was partially merged to Linux v5.17. But there are 4 patches are not merged (Patch-10 to 13).
>
> May I know what is the plan for these patches? Will them merged to next v5.19 merging window? Or do you expect any changes for these patches or Alex needs resend with rebase to latest kernel version?

I just saw this as I was digging up Alex's old email to reply to, all 
but #13 are now on for-next.

> Note, we would like to use the Patch-13 in this series.

Is your use case a CPU errata?  If so I think we should just go ahead 
and add that errata via the existing errata mechanism.  If you've got 
some other use case, do you mind elaborating?  From that other thread it 
sounds like a command-line argument is the way to go for folks who want 
to turn this off more dynamically, but happy to hear if you've got 
something different in mind.

> Patches not merged:
> [v3,10/13] riscv: Improve virtual kernel memory layout dump
> [v3,11/13] Documentation: riscv: Add sv48 description to VM layout
> [v3,12/13] riscv: Initialize thread pointer before calling C functions
> [v3,13/13] riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
>
> [1]: https://patchwork.kernel.org/project/linux-riscv/cover/20211206104657.433304-1-alexandre.ghiti@canonical.com/
>
> Thanks.
>
> Regards
> Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
