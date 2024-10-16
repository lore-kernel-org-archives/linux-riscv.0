Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFD9D2A53C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 18:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjxdPi/O9br4RNrWMhRbRV1YIdsiRwDG7ZWSghn0Vn4=; b=YhpfwEwILBh13k
	4svmMStCDcc9yvvSbDqs6gptgQeFVOL9rhHsraUNCoCtlpupAwn2eVrCEgPj3jQjUKukljI1spsuP
	xV0xh2lSz0oxsxqrA3Z5Y3sjpAf7fJLYLvLxTQ2SQ1kvM5yLcdMfFnf8Eil+ih5pMfcHq3LmF/Csh
	O2dAot1/faVDrRVqSArJrvXMYDWCZhOOpSdyfsQn1sDuNmfhg33Gfw6ndFALp2o6DHxqHmeMvyRCn
	ThIjqqdjEQSMpkw6dG+SaAc0e1z43ubFks39b7LGupMAuEsnMhIo0Or+DgU0lsj1RUQW8bCaxHqA7
	wuJY0Eyy24Tq+kfVKgfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t18RS-0000000Cdnz-3zuA;
	Wed, 16 Oct 2024 18:08:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t18RP-0000000CdnW-2qYf
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 18:08:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cdb889222so945595ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729102090; x=1729706890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Do5NZzoXtrPkRCkHPB7RbxDjXCyCXzT+J3lpLdQhsU=;
        b=TKZ4/bAxyU48UoSHe1I6anIl+Kzyrkq/kLpUfRhDYusMhl34D/JkuVyelmlhBt7JR+
         p0mhRzAV/aNyBhdQQeUw/zvYdSd8RaItazOuX2kGyx2lwI4Y1fLhGKd+f/WIRbKe/okq
         QUosiaIwjzZFw/MdfbDadr1xnoduxqoDbWvK1XJhFUas8Ifpg9vGAvJj1YFHbolxb88H
         2teMG29TrVN3mo44MwJ8pnm6dfgt5+4L4X9es1yR3zVwSKt53Jh0SnWskwud6flwPJ6R
         5mQZo94gmSfh8F088Nxtd0G3fdLCXAzhLD772xip1bdd0QGFqYxtFSoO8PkJzY6rAKA+
         spig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102090; x=1729706890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Do5NZzoXtrPkRCkHPB7RbxDjXCyCXzT+J3lpLdQhsU=;
        b=wP3JRl5K9lES5/89R+edfGJm9CWu8v0e0ov1jI87NGRbNVh2PG5JPUDf87VOF/WtFU
         jpeOB/rqHtvPmpOHJgYMCy8ToAvPrWkF1OpB7g6bmTfJCLNUskZumg3R6wpesCaPh0YT
         6geh4hrMQOAuCcES/pmDSfAc3CK/IPBZSuqRycuTAR+lzjlrAumiRLU3lwfvrKgTqnaE
         fS/VUhjMOX8brxG8cHNbCfgsCfAXxlWsQjB5RYusWy1DznuinqYdrl6Ct+kMOj7wzyyF
         CRF2UoilixtOSwluqbJwTBKKqlEU4Iz3wu1YR+j3nNsa4xkFxlPQbqlw/Qi0IegrTb+s
         6zBg==
X-Forwarded-Encrypted: i=1; AJvYcCV1K+SQvHL6Tc+J1pE2zfMNfZPRg9oa2KTMYhpK5Koobj6kUg+Xr4bW4rhmemH128neldSEV0yd3aYpyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw/X8a+ePCWFpDrPYBQjoL5OXkSfY0bGAuxNAafH7fKgc4evNc
	RDyXTYMAdTCQj222pN+b0rWDwOVOaHAEXSxbGFfkLlAaadzdwMws9lIIfufrINA=
X-Google-Smtp-Source: AGHT+IHk7EqhzNNVg4OZzagkiI9u/M85Rdln26E/pLQmb1Zz13C4O48RJDEyeV5O9x9KbH9fTQkQcg==
X-Received: by 2002:a17:903:41c5:b0:20c:c482:1d66 with SMTP id d9443c01a7336-20cc4821f85mr213342205ad.35.1729102090025;
        Wed, 16 Oct 2024 11:08:10 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d18036714sm31306885ad.152.2024.10.16.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:08:09 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:08:08 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Introduce support for T-head TH1520 Mailbox
Message-ID: <ZxABCCJcoTmxiRXB@x1>
References: <CGME20241014123409eucas1p2a3a3f085c0630073326ca299a870f3ee@eucas1p2.samsung.com>
 <20241014123314.1231517-1-m.wilczynski@samsung.com>
 <Zw1jdl64f5l8N+Km@x1>
 <431e98cd-6c53-4478-86a6-e532be4ed58e@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <431e98cd-6c53-4478-86a6-e532be4ed58e@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_110811_750446_1644A7A4 
X-CRM114-Status: GOOD (  29.65  )
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

On Wed, Oct 16, 2024 at 12:03:05AM +0200, Michal Wilczynski wrote:
> 
> 
> On 10/14/24 20:31, Drew Fustini wrote:
> > On Mon, Oct 14, 2024 at 02:33:11PM +0200, Michal Wilczynski wrote:
> >> The T-head TH1520 SoC supports a hardware mailbox that enables two cores
> >> within the SoC to communicate and coordinate [1]. One example of such
> >> coordination would be cooperation with the T-Head E902 core, which is
> >> responsible for power, clock, and resource management. For example, in
> >> the specific case of the BXM-4-64 GPU, it needs to be powered on by the
> >> E902 core, and the kernel running on the E910 needs to 'ask' the
> >> firmware running on the E902 core to enable power to the GPU island.
> >> Given recent advancements in work on the upstream GPU driver [2], there
> >> is an emerging need to get this code in the mainline kernel.
> >>
> >> Link: https://protect2.fireeye.com/v1/url?k=2021d256-7fbdfb7c-20205919-000babe598f7-ca654d1a9bc866ac&q=1&e=11e97355-e6e9-4aac-a996-cc475156b3c8&u=https%3A%2F%2Fopenbeagle.org%2Fbeaglev-ahead%2Fbeaglev-ahead%2F-%2Fblob%2Fmain%2Fdocs%2FTH1520%2520System%2520User%2520Manual.pdf [1]
> >> Link: https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/1 [2]
> >>
> >> Thanks, Krzysztof and Rob, for your review! Since this series is gaining
> >> some interest, I've dropped the RFC prefix with the v3 update.
> > 
> > I've applied this series and booted okay. I see the driver loaded:
> > 
> >  /sys/devices/platform/soc/ffffc38000.mailbox/driver points to
> >  /sys/bus/platform/drivers/th1520-mbox
> > 
> > How do you test that the communication with the E902 is working
> > correctly?
> 
> Thank you for your interest. To test this, I've prepared a diff that
> includes the missing drivers utilizing the mailbox and enabled the GPU
> node in the device tree to use the drm/imagination driver.
> 
> I've observed that when the power was turned off through the E902 core
> using the mailbox, the drm/imagination driver would hang in
> pvr_load_gpu_id() while attempting to read its BVNC from the register.
> However, when the GPU was turned on via the mailbox, the BVNC could be
> read correctly. Still, the firmware fails to boot due to some missing
> programming in the drm/imagination driver, which is currently being
> worked on. I've briefly explained this in the first commit of this
> series.
> 
> If you'd like to try this yourself, I'd be happy to push these setups to
> a GitHub repository and provide you with a link, so you can see the
> setup in action.

I think that would be helpful for myself and others to be able to see
the interaction.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
