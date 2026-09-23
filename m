Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25E6C982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSXTKMLOiKHlHgiRXgNggQX8+dMt0NtVhff7TFZuvE4=; b=qxzbdyGv9AEDWu
	aP8KzkZiOn+c4EMM62BB8dSE/MrlzHaSaTddZvbjlSGY5yhI13PNx7w+WnfJVaJEs/H+56jOVLvai
	sLDT5FC8ZCnSqvXOPzua2VgF2GFmm/ilG9+WPCVu5pfoB/QSBTcTK+Qkf3cbVwyt++Wx8FFmlI410
	SxGRqMMwdOMNi7OwIK72QDV/fT2ObX1cOa5izU2eooG+CYLFZ0L7JIH3AlkLMZIzS6Au5fnpQAFlw
	GCXmQpVTBxj4cW+LPStXlNNYH20VmgW07X+yXOBT6YA7YwVJk6SATnD4IiOPV0SMb3yX4Fp6wSMDd
	SKLD4B281sABZ0KQipCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C7R-00000006skB-11cW;
	Wed, 23 Sep 2026 01:49:57 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C7P-00000006sjn-3E5c
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:49:56 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so189245a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 18:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128195; x=1790732995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=c5yk5Urx6KzegcPVGJQzbPv1d1qH0puLffe16aLAE71JOEG8e7gYVzD0LumGdxGtFd
         hYaeAnwC3bD7QpyFOaL7wKIxUtXe7Qp08U34LOEb0juf8Xi0sBgxteDBjm4zyySTw+zW
         ulDS0UnMV4JhGDNERKBbQZNY5zT2wzBr6GT+SH4PK/RwWQZUW+14/FVLi9WSvGjK0TbA
         OsWW9wnvPHwKclZbl/ILoqKVPJgrmhHiPBDN+lSa5UcZoOYcDURS4chgc11xwmeSLC3j
         Swjhj0idywDGxRt6JBgOKvpCiiU3B9TUBD8Oju6dlTILr/zH/IHpCiexu/7h016s/87B
         M51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128195; x=1790732995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnnWTyMk5d70Hpz57ZOyyh2guKXo+Z5k9pvOlpmwiYo=;
        b=Wi0cZ9HhpIzY2grlQFwFgAa0UD524QIVVBZ9AnY268q23iptmjbZ7fYDbe7yGwcj71
         /UssVPJc4eWSZHGge+5qFBnKEU/cq2O4DdiEHJMWe2BaQ819Y9oPL3e07/PNAFfqnuEO
         ZbKHO59iMtzmIdbrrlbSOQW2vmweL7jglzuO+KTvIrlC/tAu17xZXso3/5rWGokW/Hc6
         uAZrFAYnNMkNnU608B14iEmFlC9vCpDvMrRfzpEdzORwddRKU55SjZU1Y0lyXxrNdzul
         coA5d3Fu98ocN2a5zbUntGsQexptQ342reE1LPuH9L1jpbkGbRlMl30VndeV5dQnFoQZ
         LaCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxlfQuKvh2Yoauca5ViKu852hXUpkaKz6idpX61jKXEjF/qYmfvDW8/X0u1V5fnCqcwpkTho9Kap7FwlA==@lists.infradead.org
X-Gm-Message-State: AFuF++kygGNqJ6+M3X9jT0aIIX9uhwguZ9BRut80yFQbENAuDyEUlHqN
	dIk5QpSRzkCvqNcfSX6VNs4Q8bdsyNenm3HpqinAlddzp3ZW929vhIxA
X-Gm-Gg: AYBFou0uOtnxOoycLhDulCC8gvIH2AmbqJfnwYjHKzyv2/Onp6s+d8A01u77oXjpUIb
	+DJ2ne3bcSJr/Xbob/Lu8mHF4NrxMVo0PMhAuAqk7pxrKx7JYPQ/cQcF46kidKEx/DcHljAqR6+
	sZPtbYD3DBAmkrIoz/D+AGv+Ir1t1BWYiAjxhBW2Gg/5gHgUWfgx0KPMEu0UM6bjCOfuLa1Gpw8
	erhi1/4AyLX+eI26ew09WuEw0QpH4h3678rPvhd9UxiARLWU1SZ/jgk3bgFejBlZ2OXU7ot8I35
	giRx9TiwglnY32MALPbcTCfh3QI6nkdvA6XzZ5HjzynPcWokoO0woJx0PnGP2FDaOAsnUYk8U0M
	aVjOyHjhPZQ1zPPoF9mRbcbvQ4fzeX5sHdIHNZbjgd5YZ3RtFf1k21cWHeTdJHqYA75q447/5ZQ
	CeGCmAQoiSATq8QF1n6keJ+R7nbBno2UovhAek2swmF6zLuXXUAcjRThFLuy6pFeo8Rxpg
X-Received: by 2002:a17:90b:4cc3:b0:39e:6c68:fd91 with SMTP id 98e67ed59e1d1-3a07e61658fmr750266a91.38.1790128194871;
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm1915180a91.4.2026.09.22.18.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:49:54 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:49:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Sherry Sun <sherry.sun@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Bruel <christian.bruel@foss.st.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Alex Elder <elder@riscstar.com>, 
	Xincheng Zhang <zhangxincheng@ultrarisc.com>, Randolph Lin <randolph@andestech.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <arMvZNEUhAQYa--o@inochi.infowork>
References: <20260907112606.465778-1-inochiama@gmail.com>
 <20260907112606.465778-3-inochiama@gmail.com>
 <ap_jh_NAqHnIlZeu@ashevche-desk.local>
 <aqEQnkrPSKB-3fam@inochi.infowork>
 <aqFst9QH9YTFlY3X@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqFst9QH9YTFlY3X@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_184955_812073_D76CCBC2 
X-CRM114-Status: GOOD (  19.19  )
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

On Wed, Sep 09, 2026 at 05:27:03PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 09, 2026 at 04:00:15PM +0800, Inochi Amaoto wrote:
> > On Tue, Sep 08, 2026 at 01:29:27PM +0300, Andy Shevchenko wrote:
> > > On Mon, Sep 07, 2026 at 07:26:01PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> 
> > > > +	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
> > > > +	if (count < 0)
> > > > +		return count;
> > > > +	if (count == 0 || count > data->max_phy_count)
> > > > +		return -EINVAL;
> > > 
> > > Elsewhere we distinguish count == 0 with -ENOENT.
> > 
> > Is there is an example? I think it is suitable for its internal check 
> > to translate -ENOENT to count 0, because no phys property means no
> > phy. For a get helper with optional semantics. I think it is fine
> > to return 0.
> 
> This the brief list of what I roughly grepped with word "count" in the name.
> 
> gpiod_count()
> of_hte_req_count()
> i2c_acpi_resource_count()
> ice_sriov_set_msix_vec_count()
> reset_control_get_count()
> 

As the respond in the phy bulk data patchset, devm_of_phy_bulk_get_all()
should follow the optional semantics. So I think return 0 is a good
choice. Anyway, I have added the zero value check in the driver.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
