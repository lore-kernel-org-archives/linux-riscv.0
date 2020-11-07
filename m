Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8FFC2D0A3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 00:54:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4876206E3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 00:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OlheSKNl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="Gm+gGA0z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4876206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U+ULyHufvXyMwkmh8mnrsOuPJn8dMOyhBf8Wj46Ij4o=; b=OlheSKNlwmByua09SYinwcN6h
	KxBqgXHm073bzgA0Nggnocjk5xVJLMIMa51k2dI1nPRMI37I187MmFycNB1XvztxJcCrVABdUBXG7
	4p3fdmetZAQT7RXVdW3k+RCXYN7o2oJXI0fKfky4bamSvGPcHdVEBwr5e6zudzggW/HApoit020Bn
	cFjCQWjTxDNgSatUq7ot8vu1L8YqM05nIPCWXOLhjtc0zvt1ql29gJePMJ+KFQA3JZu15PfOT6Qhc
	PuNNUIeW/aYLP0H70pTzx6qNBf4jEXjCXtBGWrxjFgpMeN9r6PzA+1oFdeo9WzDO4r9fRxZS/09dO
	jgaAeDC0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbCUL-0001W6-G5; Sat, 07 Nov 2020 00:53:53 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbCUH-0001VG-8T
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 00:53:51 +0000
Received: by mail-io1-xd44.google.com with SMTP id r12so3337726iot.4
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 16:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htvs7lR/1BI8D0Mzc+TXEsKixscjGZpRTsGr1YNtxI4=;
 b=Gm+gGA0zABCYmnzgAZbqB8LmrvQ24MZCZCeuofocA24Z9DinusB4T1r6s3QuIsHnq/
 BDgTerVHPvQuevB4yFhOhYW29XoCPLIvMjMF66TkV6n1x1WAtyJgsMXb/N5zpnI9faJa
 FIOqUay2ys7nfNVAmyM7TMxQWX7Rcmmu7ZLY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htvs7lR/1BI8D0Mzc+TXEsKixscjGZpRTsGr1YNtxI4=;
 b=uXP4sijSZ6tBKP4YOQ9dfgnqEnldFwKc8SmAjkfDJZ0XZhYYORk8K3eiy+PPcEP08P
 XZcDNM/tlC1qG6qo8G0/EoTgpOrhe9MtDkcoDhd47yZiKHB1/i3HrVP1Mgp1mrE2Nj03
 LVwJsSJwDaVU6ArjGOplJ/iZP7sTMSD3E2zvI8ly8lQNwhLAL8QwPISUEwcHx4aPBKuZ
 9iCzydi4afG2soDJwaQDrw11OvMp7eauQIXs8+R11pNcBrJ3JiPMGZuaAeKicCHlr3+d
 2zVzmLwz9ylr0xZDEAiKP3oKkD+spzIPjAaoZ7Dwgb8EAOy3kbklSDzt6DskqtQjnRpk
 Ogkg==
X-Gm-Message-State: AOAM5331L1IUuH8vJ2rA+15qAE76lhYgiwPS01ZkQC+CAsmDmQO8iwzK
 rba6fTcAFn8ZZFmzEshKA3aHX2wVT4JN9WbtXux7
X-Google-Smtp-Source: ABdhPJyTo+S+mQWAmRQ8EDSKdeh04ebDM4c/nGCflyQ+HMbV7hMgiFw6U1U5Deqk5cCMRheBFpX7520CFYInwaVMtLw=
X-Received: by 2002:a5d:9842:: with SMTP id p2mr3570190ios.113.1604710425638; 
 Fri, 06 Nov 2020 16:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20201006001752.248564-1-atish.patra@wdc.com>
 <20201006001752.248564-3-atish.patra@wdc.com>
 <20201106171403.GK29329@gaia>
 <CAOnJCUJo795yX_7am0hdB_JFio3_ZBRHioHNcydhqEouCUynUg@mail.gmail.com>
 <20201106190847.GA23792@gaia>
In-Reply-To: <20201106190847.GA23792@gaia>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 6 Nov 2020 16:53:33 -0800
Message-ID: <CAOnJCUJ-vi=1w8HzsPP-adcV58jZC4NM-mvHD09QVkd9iJrwOA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64, numa: Change the numa init functions name
 to be generic
To: Catalin Marinas <catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_195349_441500_7539A31C 
X-CRM114-Status: GOOD (  27.29  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 David Hildenbrand <david@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 Jia He <justin.he@arm.com>, Anup Patel <anup@brainfault.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 11:08 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Fri, Nov 06, 2020 at 09:33:14AM -0800, Atish Patra wrote:
> > On Fri, Nov 6, 2020 at 9:14 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > On Mon, Oct 05, 2020 at 05:17:49PM -0700, Atish Patra wrote:
> > > > diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
> > > > index 7ff800045434..96502ff92af5 100644
> > > > --- a/arch/arm64/kernel/acpi_numa.c
> > > > +++ b/arch/arm64/kernel/acpi_numa.c
> > > > @@ -117,16 +117,3 @@ void __init acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa)
> > > >
> > > >       node_set(node, numa_nodes_parsed);
> > > >  }
> > > > -
> > > > -int __init arm64_acpi_numa_init(void)
> > > > -{
> > > > -     int ret;
> > > > -
> > > > -     ret = acpi_numa_init();
> > > > -     if (ret) {
> > > > -             pr_info("Failed to initialise from firmware\n");
> > > > -             return ret;
> > > > -     }
> > > > -
> > > > -     return srat_disabled() ? -EINVAL : 0;
> > > > -}
> > >
> > > I think it's better if arm64_acpi_numa_init() and arm64_numa_init()
> > > remained in the arm64 code. It's not really much code to be shared.
> >
> > RISC-V will probably support ACPI one day. The idea is to not to do
> > exercise again in future.
> > Moreover, there will be arch_numa_init which will be used by RISC-V
> > and there will be arm64_numa_init
> > used by arm64. However, if you feel strongly about it, I am happy to
> > move back those two functions to arm64.
>
> I don't have a strong view on this, only if there's a risk at some point
> of the implementations diverging (e.g. quirks). We can revisit it if
> that happens.
>

Sure. I seriously hope we don't have to deal with arch specific quirks
in future.

> It may be worth swapping patches 1 and 2 so that you don't have an
> arm64_* function in the core code after the first patch (more of a
> nitpick). Either way, feel free to add my ack on both patches:
>

Sure. I will swap 1 & 2 and resend the series.

> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks.

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
