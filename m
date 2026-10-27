Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F7F606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ze3g2+N+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daT/R+uz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k95Wzj3j1GdsTImJZpb46VzXwMJzeTATmd4jHRpAN9s=; b=Ze3g2+N+Qo+KGsQ1Cv5I6TJQP6
	XJLF+vKgVrALxsR71tw+909fCINw5S7HNThc+IlyshzqkBWAXY5kkgiKyJZ0mcLT3rzKJXWORX0lz
	7ihmI3tgmHneKq2ceI3fGa+WfVbSjddK018grwa4B7LPxEBng79eJMVxnLCgPtXOq5+bDaPdD6IfJ
	E6hZP0a9avp3XIHHeQcCXwKYfisAxLIhLfIKCM0T3eG3DtVERSRxTcvnThLRNLGFNIh+yDMvTdpb4
	lbRR42ZhuKACdKc+UQM4UVDK2T3qOOTSsgGHIqEZ03/arTiBMWE/Oi46UNP8gG/nD55zkf2fzhTOJ
	jIMUuoLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcm4-000000044Bj-2QIt;
	Tue, 27 Oct 2026 08:43:16 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcm2-000000044B9-3831
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 08:43:16 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ea0efd636dso30997885ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Oct 2026 01:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793090594; x=1793695394; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=daT/R+uzsk4eyAgB889WNaUj17+Fs88WMGO2MSiQXisadBa9+IDtMxXAUOIZF6fTGN
         XN+CLiWtbiGN89Fb7LmX3rGqxjcuzglWFfRRqawkTPM5sT81BI8B8AzemSwHLvHQF1Mx
         ijBwp2vcFIeIxOUoz0n5WnTbrbmlNmkljt6G+i81eOUDCLl+Owx4EQNUJQ0Idh+MLloi
         N0cXazIbaWjqTx6anklXIMps0ZJec9t/GmgSbkiE2XMHCyP00GOwFpb2xZIfPXyel2OR
         75b9dxB/ZeSPluM2PIDq8xv9GMSl9fIMUz/TsMhFQPKjrA807ajY/4QtaMGaun9N8GEK
         bpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090594; x=1793695394;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3mTGo6FRBU+gYpImJ1+JuKUhlGLGeu1U4jVbw/Cy/I=;
        b=tOXvPVTqzLmqY/2q5FSf7yw0F9TE0AhS8+0jC+VMCN58EEyJrk67+RoeYTIKkFxKZc
         pjgxcyRV9eKSwafzJRUkZzjQY4QBPf+G+4l38GfWdcW/tmHH6e0Xoej0zs+2a9b8uOsG
         /pYOQAxEx9aP1Rwt945fzuFvS8WI7eE0PtVMOAASJxTrbdr4qIJab36rzFK+5TRtxEGj
         Y5j1u1QIPgEOn3tKsua/QiqTnHbKkf81ppmG09MTMeaFw/O48TWGqkggmkznieCdf79k
         duvD4r25WQfHiis68Xkpro45p47bUpowpqMxUvV+fqGFac7rbaw26aVj3xSFqKceYjsh
         qP5A==
X-Forwarded-Encrypted: i=1; AKwUvBzDzVPOtUHou2AoNKx/yyZqKRGFUr/9GrnrEjKZl/VBHIjMes5ZmHd4j3eooQbipKBdXzdMCA8p3x4Mfg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIoBeE+I5qpNGY5n3jJoLTXIETMF9UwuEXJmUIOpmvx717z3N/M
	ygdOuPke2HD3EA0Ov8vDWmJ6skpz2+JqPDZ0fXKCPok6XPznOk45AtA2
X-Gm-Gg: AYBFou3M9mPrOs1JOVdogvqLZKkueyvO+Yzmc/CvJu1J6GB2C2aM4WHl98iuPfWTiI4
	2AFQOKU8j1pfWvANIe+2g3FxK9xarflD/aSSnks5J0modAz95fyxRU2mRFa8yHagzg5MAl1FqxU
	Fqz0bJA/rMv/1VtKIZ8ik83CyG+QGM9bR+8L/0FdotTdmkU0HYR4a19oh7KBuiCl7uuATyzdYVl
	sOIZv6vhz0sn6Ypdi3h7OOtlNssOZ0ec6r5WeXEXwRGEYtLjtN12qrMtHJ0YKv8ixsb2mFZ/WnJ
	kqtg30TmuU4/q4HObHdxqm1N6idR3ZcP+fTMchb0l5+tA6dcJnPtwp1ytwda2EsTvtBgA9CtSBE
	zniaxtv4yJBZuAF0u7MOPnoJ8bjz6KXrW7O6DWKlStDueQN4Y1U8FvrcFLBRxd+bh6nzs/nwSfA
	kZP0XkDMF2pXGydK/J3vxAJ3Bjfjs4Yp6nMuJZ4YAabMJevmwSTQU01Q+C9aYEn9Ja9E69vAdLg
	bEkATeK0IAKrgd12JIaF86GW1DtnGveIZJP22wu1btcxuI/dzIsCpkshBiFOCiu1fZLHIS4jcPq
	CyX7QwoLWDNnQDwjhmzkLTEZ1fGZ
X-Received: by 2002:a17:902:f68c:b0:2ea:cb4f:fd3 with SMTP id d9443c01a7336-2eacb4f10a9mr43735615ad.4.1793090593725;
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c3d17csm5901625ad.53.2026.10.27.01.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:43:13 -0700 (PDT)
Date: Tue, 27 Oct 2026 16:42:26 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Frank Li <Frank.Li@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Niklas Cassel <cassel@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Randolph Lin <randolph@andestech.com>, Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
	Alex Elder <elder@riscstar.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Vidya Sagar <vidyas@nvidia.com>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <auBj4o6t_RyT3wfk@inochi.infowork>
References: <20260929083755.458238-2-inochiama@gmail.com>
 <20261019164108.GA2177470@bhelgaas>
 <athuYJjPMkrecGm3@inochi.infowork>
 <atiB7-u5bxJbf-1q@ashevche-desk.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atiB7-u5bxJbf-1q@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014314_789621_A35BDE62 
X-CRM114-Status: GOOD (  22.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 12:12:15PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 21, 2026 at 03:51:20PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 19, 2026 at 11:41:08AM -0500, Bjorn Helgaas wrote:
> > > On Tue, Sep 29, 2026 at 04:37:47PM +0800, Inochi Amaoto wrote:
> 
> ...
> 
> > > > +struct k1_pcie_device_data {
> > > > +	const struct dw_pcie_host_ops *host_ops;
> > > > +	const struct dw_pcie_ops *ops;
> > > > +	int (*parse_port)(struct k1_pcie *k1);
> > > > +};
> > > 
> > > Does the "const" here add anything useful?  This patch suggests maybe
> > > not:
> > > 
> > >   https://lore.kernel.org/all/20260911233541.1650895-2-james.quinlan@broadcom.com/
> > 
> > I am not sure whether the compiler can make use it.
> > And I have not seen any explaination for why no reason
> > for that. It is good to have a clarification.
> 
> These const make no sense. First of all, the third one is missing it.
> And I have no idea what would be the proper syntax to add a such. But
> adding a such make it clear that there no sense to have them. Either
> you make the const the whole data type instance on the user level or
> don't do it at all.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Good, I will remove it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
