Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37955C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 12:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwbNDFarqIORDXzCigELhxkaC+P2dyVhOc3++LE3DOw=; b=RIcmnATUac+h6+
	gxMYFP+ucPcpyPOKbIOf9yWqkdEF9SFQ9x2MQid7sPB1vsgs8htXiDUhfWNCGspNwhJKuuKdlr7v3
	TKvGBJ2vgw22DuCKbxtmo/uSW8Y5XtCuoWuns4KJCb/HCGzZIcOisOm5WU6pal2euyswmSvwL3XW1
	t1Ww9aJ+ys8zbwE/TH5xfeDrVXsBgRWXB1UQU9UUUAxR3d0l6KJs26OqKdGqTOr/Vqg8w9maKSLHD
	eUBUVwJu+/JFN9P8DQPAzHUU1RYj2PoxcWAv7Oxtp/iOZbWk054WX3UCAFKXYbVklbrMa7xydw9au
	cSU2HEXg8uFyiseHpxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o944X-009tvc-DO; Wed, 06 Jul 2022 12:24:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o944T-009ttN-1J
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 12:23:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id t17-20020a1c7711000000b003a0434b0af7so8911425wmi.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 05:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5KHAdDcwX24NbzKDAvafzAtUGJGDqZUpioC/hxvH8ww=;
        b=YOn5npfdMjt1/r8szulBt6rTdFj6qGfwHDuhJY2PuDnjluIUztjJMzr6hgUuSRSBhl
         lkoC44nQXvdC7Q5O1RFglOvfMx1z/nxXl5FDN+Itlf+AgilBSq4fzrmn64lSUDrfj3fC
         O+m11xW8/+KlcN65vAA1xncU4WiEiPmMdOW0RYodCekqGOnjr3sYyyeFeQyQnM67ZWBJ
         Et/mzTE+6h4RHNGKL3pmR0KJ2zg//aTSo54D4iKo5sqRPDHkEGmrvddgQRLXQw4VgE0v
         1npiY7eT2I13//lFrIMivwIc+VTfdJebv6wFllxVKU0YNpeZ0yhfz5beSDGxXTIcpp7W
         4v1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5KHAdDcwX24NbzKDAvafzAtUGJGDqZUpioC/hxvH8ww=;
        b=f5kz6W5aOVwCuoxHA03GBfxpVWms4u2RF/tRCiyKI59XBKkOYQonzmddQnORWIaryv
         GR+VMdq148BAXCOPIt9tmqKeblLmVzUUXJPzv1PoYQO8MGoD9C/xNFxww1nll3Ce/6zi
         equQKlVCpuwPZK59NgsbsQ3mwZM+qCgyOxFEIA2zIQ6uijpOn7V0y81IBFXdPwTqmVm9
         GjPiAkSSRoboLZZU2ToyCrn/FC44YXHtDNx11izOmAHDatfFVpniI5ulgoPC0ruF83h3
         1q208IgVMCroHo7OkxFO5qB+TgHINHzz//QZCyuhL3myaJxIyRRslBtAHYdC5OEghcPK
         DUPg==
X-Gm-Message-State: AJIora+iUS3m5PrMlSkM6oD8Cd+zHOJzJMcY+WQsvqavs9LJMDNi3ASQ
	jP57vkPHR97vPxVVQNcn0bjCwA==
X-Google-Smtp-Source: AGRyM1s8pbcxPA7bUbV0T+xiYTeDMY3a909i6c7eZwEIlshJcOKVCYxEY2JgBSfJM15EErYJF1lrnQ==
X-Received: by 2002:a05:600c:3b1d:b0:3a2:60a1:fe6a with SMTP id m29-20020a05600c3b1d00b003a260a1fe6amr15263688wms.3.1657110233895;
        Wed, 06 Jul 2022 05:23:53 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id i30-20020a1c541e000000b003a032c88877sm21834833wmb.15.2022.07.06.05.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 05:23:53 -0700 (PDT)
Date: Wed, 6 Jul 2022 14:23:48 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, herbert@gondor.apana.org.au,
	heiko@sntech.de, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <YsV+1DQzJ/KFnqBk@Red>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
 <YsP0eekTthD4jWGV@Red>
 <20220705164213.GA14484@lst.de>
 <ec401a51-5895-fce7-1075-a2c964466d2b@codethink.co.uk>
 <20220706115807.GA16222@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220706115807.GA16222@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_052357_354491_6B720823 
X-CRM114-Status: GOOD (  12.12  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le Wed, Jul 06, 2022 at 01:58:07PM +0200, Christoph Hellwig a =E9crit :
> On Wed, Jul 06, 2022 at 10:47:24AM +0100, Ben Dooks wrote:
> > I'm not sure that the dma-mapping code for non-coherent riscv systems
> > did get sorted. I couldn't find any when looking in 5.17.
> =

> Yes, none of that is upstream.  But as supporting it is essential for
> the allwinner SOCs I'm pretty sure Corentin is not actually using an
> upstream kernel anyway.

I use an upstream kernel + some "not yet merged but sent for review" patch =
serie like
"riscv: implement Zicbom-based CMO instructions + the t-head variant"

And good news, I just updated to use the v6 of this serie (just posted toda=
y) and my problem disappear.

Regards

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
