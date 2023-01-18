Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C3DC32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRP5DZBIpAY0JdmUNJkITM3I06cYKPhgSKQXqiA16tQ=; b=UAZYkJUIsidXPU
	EIboQ+dDP1HHEyjc1Wg6bxTx7h2V85tFO8/ARGEHdrVRLOCsSY6QoZRcJCbQGjFQ829r1cJQwdaYD
	zlF3q3pAUyacTPNPNyf0zLqfycKEL5kjWqOJERNDqvoUyDpGbLzrhjCr+cOLxyU8Q7a1BmTZxZzf3
	Z/mCCO4sJO6adYpemU/JF+2C5SCVCQJy358FIpTSG9cKy0CpFKrBXkLEqPjDPbQ0qFwM+sp2JHcRN
	xaII2ZZvlQQ/cJuBXIZ2LPQ+hpRClRp2PTfYU2hyqc4o+3tGsk6MIJwGvGquyr0OvSwl69ZQ765Px
	3pEzB/itLMqbA6NkhOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI72r-000cxi-Nn; Wed, 18 Jan 2023 11:55:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI72p-000cvv-Hw
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 11:55:57 +0000
Received: by mail-wr1-x431.google.com with SMTP id t5so29260291wrq.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6+Tl5+JlQNt2fK1fgq66OogRh+FpsQS41ZHI2gg39Y=;
        b=BHU8diGOuqxGVMZH4T5oUhIvYWV2uuu5TwbOIzAQm8H/dAn+uE5OKYw9ZBnjwr5XJj
         emJDdUER6XBO0xbMocWTxcxoB8j+JdhbjOFNhbcchPUuMX5mJ7+RApH2RmOG+R+jXtJI
         qi9dSs/TeWP9ni/8Qmpc3plD1M/olgE7eCq3dEyFh4gy0MHkjw4X8cQfmi1aezF65rYf
         BVJE4TVDKDhj+sLovK0uHMQb8Ajo56SMjrXRvjX2/OEAEey6lAy/6axXRlyBNbwYOBFd
         VEnZlaieI8OS4OGyiRwwyk9gz7bZPFwE0NCCezrlXtwdQ/36PLA8tScc7sezvb2cUMal
         /JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6+Tl5+JlQNt2fK1fgq66OogRh+FpsQS41ZHI2gg39Y=;
        b=TwElgEbGG9/+rSH3JyJm3Q1/Thu7hS2s4dh5Zf5M5uMADXjmjFbBjzx+J1FBNP7PBa
         ClpnvECknlhGyxWLESeNuN1D132/6hOYXB1QG0r8U0IHfPnXZnlm9kZtjxfhoyxNqO/v
         6eeJnH2wZqtat/KFZDyC1ARJ8g1kkfvrUz5kBm/W1nSyHKJynUYBCFISX9yh3nOCqqds
         Hcu0yEMA7limkflX+3+VwiSrUUEsI6Sugdlgo5oxf59cFYtr1aPO7aWNYpzOvxiQoAxO
         QKWvCA/yGfHGfqeH5uTF4u4hQBVmCW03vbwRWmIz4CnazE4jLqn4Zhl9tuNcRBIQTkem
         2zIQ==
X-Gm-Message-State: AFqh2kqftHt0sWkIuHPHmn5PprN9NewY8fo7i5L5R0QJnj+Ki9f+0x/H
	rVSBsZ5fC9jKWopcgq4VnCgMQQ==
X-Google-Smtp-Source: AMrXdXvh7G193ctjSKuK6NWpgpR2kMlsvsLQV8UbtLGWk1gPd3KeIGw88yHFbuk4nF4vJAKBsJ6cKg==
X-Received: by 2002:adf:de10:0:b0:2bc:8555:5d19 with SMTP id b16-20020adfde10000000b002bc85555d19mr6333247wrm.12.1674042952921;
        Wed, 18 Jan 2023 03:55:52 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id w8-20020adf8bc8000000b002bdc39849d1sm19117058wra.44.2023.01.18.03.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 03:55:52 -0800 (PST)
Date: Wed, 18 Jan 2023 12:55:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: Re: [RFC PATCH 0/1] riscv: Introduce system suspend support
Message-ID: <20230118115551.4mhyuqgwtn3cobi2@orel>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
 <Y8cikxHHxXPeGKyF@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8cikxHHxXPeGKyF@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_035555_612546_E5F766F6 
X-CRM114-Status: GOOD (  18.00  )
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

On Tue, Jan 17, 2023 at 10:34:59PM +0000, Conor Dooley wrote:
> Hey Drew!
> 
> On Fri, Jan 06, 2023 at 12:32:15PM +0100, Andrew Jones wrote:
> > Booting with an OpenSBI including the RFC series[1] implementing the
> > draft proposal for SBI system suspend[2] we can add system support to
> > Linux. This support implements "suspend-to-RAM", which means when a
> > kernel is built with CONFIG_SUSPEND 'echo mem > /sys/power/state' will
> > initiate a suspension.
> > 
> > This has only been tested on QEMU using the OpenSBI system suspend
> > test. The test just waits 5 seconds and then resumes. To truly use
> > system suspend a platform must have a low-level firmware implementation
> > and provide at least one wake-up event, such as from a wakeup-capable
> > RTC alarm, to resume.
> > 
> > [1] https://github.com/jones-drew/opensbi/commits/susp-rfc
> >     Posting: http://lists.infradead.org/pipermail/opensbi/2023-January/004091.html
> > [2] https://github.com/jones-drew/riscv-sbi-doc/commit/d9e43e9a938fc3eb510e023c3f352462876f7785
> 
> In case you don't get alerts from GH, I left one *tiny* comment on this.
> And I really mean tiny!

Hi Conor,

Yup, I saw the comma suggestion and agree with it. As there are two other
instances of that error description in the spec I'll also send a PR to add
commas to them as well.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
