Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F4EC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0AA2064C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E6+2C4dR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="NaiY80cQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB0AA2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imLc96yGXwms30pyaAxMaOjWgPql2aTOEIww2AbPghw=; b=E6+2C4dRL3Unw0
	EDmIC7OcrjQu7eVl9XVJGei8vPIQEgEi5sEUqkIvptGZ0P5IIHRtmXM2m47qF26bWT78QnD3pnYcf
	aAaqFp3IB2twldz3QX0ZDnXSX0+J88ptz2D/gKA22zQeAUug0XOhpLbQ/ouMzicmp4Zs/38CSZoZH
	NaY3kRvWWuSf7nESVjr+6IXSN/So4W9YTCbsby6aFGMQTzzeGFNJzRZPXHCX1NzZFw8GsEKvwW1pt
	st0eL1S+34Wo40f+655b8k1xuNOzkE3KvLLUVzYDTzvZnDskHwAE7bCf6iQmR7iXDDydr6qbltTWK
	TZGQk3TqhGE/oRvPPrEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIGe2-000290-Ve; Thu, 01 Nov 2018 17:20:34 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIGe0-00027X-Gp
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 17:20:34 +0000
Received: by mail-lf1-x142.google.com with SMTP id n18so6408720lfh.6
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 10:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nSai6ptFovwf12HhXChp9SksxZNPqvxDg9dyqxc5eqM=;
 b=NaiY80cQlgfVrO1fqSVryJYTWU2Uk5xgdwq4aHvqHnfXa1YaA2YU0i+wuaF8ErVEU4
 dyz7MsigK3s+D9BisRK1j/VHNABNEK1Oa1hOJxx/YVYBxHcxek11LeKeHgA9+Z8t/MD0
 T+zOXyHP75iEBUMw5wY0I59Vi5x/C6+jWp7QphBKb0xc/2iqjf0/0T343vcQPdntn0cZ
 +nVIpUDZrFha1m/xwjx2MiuuhKSmJBgkEkueBtKOmZKGmmKY8ngn7auVYadnccKSro6/
 DMZZw/tKMw1Ztqohty7y9E0XMwl0MOtvehGgU8RAslhRc6yJtuBTlw8z0cnku01DDNBy
 oy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nSai6ptFovwf12HhXChp9SksxZNPqvxDg9dyqxc5eqM=;
 b=er2DeX9V8Rnm9ZOfuCqjN/ws3cuezFpm75rNcwlxyF3W5SsTyWMiB5n28GGzRDdJJ4
 qPbq/nu4K4hckyMYsCIufPmgNfABd6hbBCD/ios+cRRlMFAVGepdJfNYM3t7OdMZEAUU
 W6rxPBaZ1bltpbSsUejc1V44q/SViCk0rdrr0v/1YSd3Gm5gNz3Z40q/RMBpZfWfjGc4
 CuVEOZOK0ojNeA/bFD0gN7CWQy6PR8SoX6LlLBD3mEalSK4s0WxDzEWXha8UTfsJlNPx
 mjv9UMmCixMI/18YGSBkPhKPfS0uZJHZvAQvRCMUcKEpEfEO9lYn0pNGuI1wfxvl+3Xt
 oErA==
X-Gm-Message-State: AGRZ1gICPSOKJPqR6D/xKzMlXqQ1f4VAP1SNDRVojPHYg1kraxGn3a7o
 /GSd6vKk8aoUSKHIlNU3DNqaiw7aPD4aK8f6JTt/qg==
X-Google-Smtp-Source: AJdET5f2ARpNgZ006YwGjijg/38ijicAbnvk3dZ9yyhsUy17OVtcQEP5T0RYeogKjdfTVhKWHZVppE8snjGwDKlhvBA=
X-Received: by 2002:a19:a28e:: with SMTP id l136mr5279633lfe.87.1541092818819; 
 Thu, 01 Nov 2018 10:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <da34ca57-ea7b-7fb9-bc45-4b315513e43f@deltatee.com>
 <mhng-b2753147-e1db-4a2a-8dfb-710e71a38bed@palmer-si-x1c4>
In-Reply-To: <mhng-b2753147-e1db-4a2a-8dfb-710e71a38bed@palmer-si-x1c4>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 1 Nov 2018 10:20:06 -0700
Message-ID:
 <CAOesGMjOfE8KADq2hDORvVtYw8sa7GbL6MtbiDRRgPbWMiXQCA@mail.gmail.com>
Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_102032_568609_739EA973 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, kbuild test robot <lkp@intel.com>,
 kbuild@lists.01.org, Zong Li <zongbox@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, philip.li@intel.com,
 linux-riscv@lists.infradead.org, Fengguang Wu <fengguang.wu@intel.com>,
 logang@deltatee.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101172006.Ymbu3NXKszimj-2OZ-078a5MqaiieasQ-MPo6s0gEnk@z>

On Thu, Nov 1, 2018 at 9:17 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 01 Nov 2018 08:43:15 PDT (-0700), logang@deltatee.com wrote:
> >
> >
> > On 2018-10-31 8:19 p.m., Li, Philip wrote:
> >>>> I think it would also be very nice to get the existing kbuild test robot
> >>>> to start compile testing a few riscv configs. It already does most of
> >> thanks Logan, the support to riscv and nds32 has been in our TODO list for
> >> a while, but whole team is blocked by other effort. We will focus on this soon
> >> to complete it within 2-3 weeks.
> >
> > Thanks! Glad to hear it.
>
> We should probably at least have builds for rv32imac, rv32imafdc, rv64imac, and
> rv64imafdc.  It's probably also good to test SMP/non-SMP as well as
> medlow/medany, as I doubt those get regularly tested.  If you'd like I can
> write up the configs, just point me to something that describes what I should
> do.

It might make sense to either do a pseudo-arch for riscv32, or maybe a
config snippet to generate these arch-specific configs.

For the ISA options, it's a bit trickier. Ideally we want to build
just one kernel that can boot everywhere, and enable the rest
dynamically ('fd' in particular). Whether the kernel itself is built
with 'c' could be a config option to enable (like THUMB kernel on
32-bit ARM), but in general we probably want to watch out for
explosions of combinations here.

Embedded/low-end users will want a way to disable whatever they don't
need, so there's a balance to be found.

FWIW, the configs I build today are:

if [ -f arch/riscv/Makefile ] ; then
        (grep -v "CONFIG_SMP=y" arch/riscv/configs/defconfig ; echo
"CONFIG_SMP=n") > arch/riscv/configs/nosmp_defconfig
        (grep -v "CONFIG_ARCH_RV32I is not"
arch/riscv/configs/defconfig ; echo "CONFIG_ARCH_RV32I=y") >
arch/riscv/configs/rv32_defconfig
fi

+ tinyconfig, allmodconfig, allnoconfig and in some cases
allyesconfig. allmod and allyes take forever so I'm trying to figure
out what targets to build those for. Maybe linux-next only or
something. So doing allmod+ISA combinations would be quite a time
addition for build turnarounds for me.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
