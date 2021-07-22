Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDD1C6377B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 02:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1530F610CC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 02:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1530F610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pzj2zD3k0TmW/sWN/qItUBCFCEM+5XvctMA2VD41ayk=; b=x8ejLqf2azf/ty
	R78NdExn0UqB63JVFk1MTdQXwf2xrHGUjzUmV+5k4IoxonNWGUbHJKDLiYa6mh76aJx9U3BnpkYyd
	o5jY77DW9I03wLr8s085bHDGKgClfflnKTrQ5O/GwNGX9XQ2vxxIK3BoDUs7ZGVDCzn0LdCpcFyDM
	Io1tnD/ombjlLMBGaXpzy4hlQR4fx81Fs6hnLPUic5vRpLrFfmdt04Z92erI+dRGHP192w1nme1Jz
	WvPIwajQxxSn/hLkr2a1BWp+HnqX1A9iCg2EkUbyo1Ho99hwzFGwTPNoLHczLAYvfX12zI2zpExv6
	qwUQa3SOFI3f4dkwd1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6OLU-0000SH-JL; Thu, 22 Jul 2021 02:21:56 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6OLS-0000Ru-1m
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 02:21:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so2088343pjm.4
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 19:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iNrbAh6Po9wFj76o5e4R4TYVxotYJ3/5ovASWumV3Ec=;
 b=ZztpOSl92e4uWypwMcwyn/rQTEIz4B/3JIraJg/ycSOfiVdYmdrh2frPtqrbrKNlvv
 eL+Tq+XGPvix3jxLvZRaXwa4uDvWYoWZwE5+ISEGEBVBq0BCDN9vmcu2P+hkyk4YFy0W
 BtvqLNSfjKdDk8jnyCPP2EXKIWuboNVIsVEJKvsf9tctxiy2Uzx0fy9matcBA8hd89Xi
 ipDKn+Qp3KZv9y9mV4BmmHEkINdkoUJ2mIth43sX6sgsg56LTa93+6cgeo1Lcomq7xM2
 kOn9p+1It6whL4xy8cnGKMRmfxvMZ6GpcGDJKtFKphlMuCDTDilpBj2FGPXMtmndg7vZ
 nsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iNrbAh6Po9wFj76o5e4R4TYVxotYJ3/5ovASWumV3Ec=;
 b=SnzVNlQM4FlQnEeHbnDSAuihTaJVrrlHQ9OVC8Iqpx5uRY8eO10rCj7AzznnlrUd/w
 vcO/LLqT4ilt2/dIXksLxQPv+mGtUJHGLBFSK7xSf6wl2yhFn+bUFfNqQe8o55Q8Y/l3
 V8PgDLNAXLCPo0HWuaXgdKSbwSzOfk4e+BMsxead8BW8t1GCGntHfH0mlqMTNtG+KcpB
 By3Pkgwo/hoCEWUsO8gJMckojl3Eke1PQ/JDDvORl5Fe0yKLND6WT0gnOv9uGbSbOpFe
 UvkanYgC4i9ZX+KHpqZxDkRbKzN8KCkgcWgUU0YRIWAiRdnzJpwX52iRU78Tlr+wAVaV
 5xFg==
X-Gm-Message-State: AOAM531ztv4Amc/DOy7xWy1nLtlkjOHd3/itKAnCbJy8lW2jyzBNkro+
 JNJKByd5OQ2txAclzMrAy0ltICu0/msM6ZJMF0m47w==
X-Google-Smtp-Source: ABdhPJzG1Mo8lgrg/fhUU3wPdFa+LXzHmK56BXinruSNpK54fSQvZmVUBlmPxGtP4MdHs6MRmIZZYw7P95AgchRzr9k=
X-Received: by 2002:a17:90a:4501:: with SMTP id
 u1mr38445580pjg.37.1626920510472; 
 Wed, 21 Jul 2021 19:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <1626838752-7013-1-git-send-email-vincent.chen@sifive.com>
 <YPe3XuYfxBkbDzHf@infradead.org>
In-Reply-To: <YPe3XuYfxBkbDzHf@infradead.org>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 22 Jul 2021 10:21:39 +0800
Message-ID: <CABvJ_xiGZ29LQ+YFnraJbTSBihKi7t7VSDF0+AXcFQzA34VvtA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI is
 enabled
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_192154_197052_A8E93D50 
X-CRM114-Status: GOOD (  23.71  )
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

On Wed, Jul 21, 2021 at 1:57 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, Jul 21, 2021 at 11:39:12AM +0800, Vincent Chen wrote:
> > The CONFIG_PCI_MSI is used to allow device drivers to enable MSI. The MSI
> > enables a device to generate an interrupt using an inbound Memory Write
> > on its PCI bus instead of asserting a device IRQ pin. The whole mechanism
> > needs support from the PCI controller or generic interrupt controller and
> > the corresponding software driver.
> >
> > The RISC-V Kconfig file actively selects the PCI_MSI  if users enable
> > CONFIG_PCI. However, the RISC-V specification does not require every RISC-V
> > platform shall have MSI support. In other words, Kconfig enables CONFIG_PCI
> > to allow PCI devices to use MSI, but due to lack of MSI support, the kernel
> > may not have any function to deal with the MSI from PCI devices. When this
> > case happens, it leads to the following warning message displayed in
> > booting a v5.10~v5.12 kernel.
>
> So make sure the runtime detection works fine.  An x86 kernel with
> CONFIG_PCI_MSI also works on non-MSI systems.
>
> NAK to this patch.

Thanks for your information. I think this will be a good reference to
solve this warning message for the v5.10~v5.12 riscv kernel. However,
the current RISC-V does not specify that each platform must have a
controller to support PCI_MSI. Even there is no a ratified
specification to provide an interrupt controller to support MSI. In
this circumstance, removing the CONFIG_PCI_MSI selection from the
Kconfig file seems to more close to the RISC-V platform setting. I
guess that is why most architectures, such as ARM and x86, do not add
"select PCI_MSI if PCI" to their Kconfig file. Therefore, I prefer to
remove the "select PCI_MSI if PCI" from the Kconfig file. Please
correct me if I have misunderstands.

Thank you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
