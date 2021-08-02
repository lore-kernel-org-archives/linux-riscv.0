Return-Path: <SRS0=JNkM=MZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1BCC4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 05:24:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 452A360F39
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Aug 2021 05:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 452A360F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNwsIuzAeaRh4Jc0q3zG9nM8TdzLOVm7Subuks0HOi4=; b=xCRi0jEEgozj7I
	8eqUD7ZMAGVx/+FosA9gKMU7p1ZYPsr8VWNXky+gS6JgKxzyT0heRsYotqw9cwH9Z8fa3E6o8yABs
	WupqajlcxjcN7y9vTnX+Wu6cR9Iwmwx+JBDUd0Dtoh9ZYEaqwOplJOjWcq8dQZuxqWk26But+dZgY
	IjSpyT/q3nDpe1r1Vm//jT6hscLLAl9T+AmWMo5XrhkNuJjz+RJreRkoPp3yufQAfTeyB9j/Chsdk
	7A2slNdX3nmskzrGZkOofm4o6n18UAVsFiJrm2pjFRZdzUA8jvUImLe+wUkgKhgV4gLqsT4tfpUmg
	IeUWRCpO8Mcc2v+r1NzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAQQS-00F0D4-GM; Mon, 02 Aug 2021 05:23:44 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAQQP-00F0Ca-Pl
 for linux-riscv@lists.infradead.org; Mon, 02 Aug 2021 05:23:43 +0000
Received: by mail-pl1-x62f.google.com with SMTP id z3so17075566plg.8
 for <linux-riscv@lists.infradead.org>; Sun, 01 Aug 2021 22:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANLTzAr4iJJwrVoa/SPgbqszhxQS2iO/MpUknJuyZTY=;
 b=kGTRNSbp+gmFV5AGRD6m1XQUVMAz2bdvHLXndlH/7wlIx5pHKzrEKjFzj8wOGeJUR1
 mKAGFC2lk79nqZjgNVCa6BPmAEtbMHsmShPKTc1+5snfyIkM7WD030iSDHtFxprnxbwK
 Ay627cyBqbkOw6vg/At7lWVqYPTXDZIV1FkDex4GtL5BjCV7Z/+3Zf0U+0sf5rLfF9FL
 Ct8jtSlOIV9uQq2OYTGNGbFNOYfR4nKehaHOV+8sxrnYEublQxOhegWy+PY1Mw2/TVDC
 MS91jIMPM10I9gxgo6SLEC9M9IJVJ1wFGa9XNyWX9RFIDJ5VpBhOsuVfIwRjuowS/y9J
 XhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANLTzAr4iJJwrVoa/SPgbqszhxQS2iO/MpUknJuyZTY=;
 b=Sk5TTuxH45sbmVFDXt/12X1NXoEmJHuxj5C06hPO66yBOdX0RT7Rz9RHP2xe2DKVzU
 I+Nf/bgkmcCTVTXEfWD1LeT/G9YST9ZFRkr7WTw20bsQlZrZ0FdB4I8vAZE0a9UoMV++
 idZnpKpyeC3DQuhxtMQUgWNSwppzjnSRF9ylvtoLvKeSg1IFxJZbA3QpK8Dp0du/pPGo
 Jy8YJFkLp9E6YS4OkyNcAoy726iko5gq1+cQBv1boVenr9HvK8Omr/2xwdL1tZ7fmu7G
 K2zlJ1qFC78y4JIsVUmrWhUZ1nUg4T/0f4Gnf8igiHDdOeB4EAUfmEEs3quogncCyBea
 cnAg==
X-Gm-Message-State: AOAM533SHeKC3opwDc7d9qaz5vyyyc2ZTaiPpnnYZAAZn6m+45x9FXbp
 MLW+fiLPP2MrOVHm1ZedoYcccvKDlVHgbDFA0sJiLA==
X-Google-Smtp-Source: ABdhPJxSAyLwGonipcLqgVe04YpWbIf2yMStsoYDT02u9Cbd6ZwnPn79t+GzcRrh3PKdnVV3Tv5o5OyJbqfGFhw0Klk=
X-Received: by 2002:a17:90b:1d84:: with SMTP id
 pf4mr15472976pjb.166.1627881818587; 
 Sun, 01 Aug 2021 22:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <1626838752-7013-1-git-send-email-vincent.chen@sifive.com>
 <YPe3XuYfxBkbDzHf@infradead.org>
 <CABvJ_xiGZ29LQ+YFnraJbTSBihKi7t7VSDF0+AXcFQzA34VvtA@mail.gmail.com>
In-Reply-To: <CABvJ_xiGZ29LQ+YFnraJbTSBihKi7t7VSDF0+AXcFQzA34VvtA@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 2 Aug 2021 13:23:27 +0800
Message-ID: <CABvJ_xhm=ZVfEpzQxTp7=OUrxxjdcJJmHzdwVcRmLuDqfdEYzg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI is
 enabled
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_222341_946811_C1B50C23 
X-CRM114-Status: GOOD (  28.59  )
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

Just a gentle ping. If there are still problems with this patch,
please let me know. Thank you.



On Thu, Jul 22, 2021 at 10:21 AM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> On Wed, Jul 21, 2021 at 1:57 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Wed, Jul 21, 2021 at 11:39:12AM +0800, Vincent Chen wrote:
> > > The CONFIG_PCI_MSI is used to allow device drivers to enable MSI. The MSI
> > > enables a device to generate an interrupt using an inbound Memory Write
> > > on its PCI bus instead of asserting a device IRQ pin. The whole mechanism
> > > needs support from the PCI controller or generic interrupt controller and
> > > the corresponding software driver.
> > >
> > > The RISC-V Kconfig file actively selects the PCI_MSI  if users enable
> > > CONFIG_PCI. However, the RISC-V specification does not require every RISC-V
> > > platform shall have MSI support. In other words, Kconfig enables CONFIG_PCI
> > > to allow PCI devices to use MSI, but due to lack of MSI support, the kernel
> > > may not have any function to deal with the MSI from PCI devices. When this
> > > case happens, it leads to the following warning message displayed in
> > > booting a v5.10~v5.12 kernel.
> >
> > So make sure the runtime detection works fine.  An x86 kernel with
> > CONFIG_PCI_MSI also works on non-MSI systems.
> >
> > NAK to this patch.
>
> Thanks for your information. I think this will be a good reference to
> solve this warning message for the v5.10~v5.12 riscv kernel. However,
> the current RISC-V does not specify that each platform must have a
> controller to support PCI_MSI. Even there is no a ratified
> specification to provide an interrupt controller to support MSI. In
> this circumstance, removing the CONFIG_PCI_MSI selection from the
> Kconfig file seems to more close to the RISC-V platform setting. I
> guess that is why most architectures, such as ARM and x86, do not add
> "select PCI_MSI if PCI" to their Kconfig file. Therefore, I prefer to
> remove the "select PCI_MSI if PCI" from the Kconfig file. Please
> correct me if I have misunderstands.
>
> Thank you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
