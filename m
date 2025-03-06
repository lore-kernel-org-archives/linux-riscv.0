Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94AAC282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckrl5WzONfBTbOJUPuvVwcfQGsXW6xPkwZqI1p+A/00=; b=oTjPIBvRhq/KHi
	e45vCRmXIQ8bgWOmw5FI1b20O/wifoJmjKdTxvsvPfyzWp1si+vptOA6CADFPpSw0opfuHh/rq8d3
	XAswSx75ioPGbrjUE0LI2s5MwmAWiodfR0yhOKcNt4U5xu8mhG8wEfjJ3IzCgJbhYjnhiBbOpsomA
	4Yzc/HEp4qAS+5cpCCLdT5aNu8d76OpaxzV3RoWpqmS0ZjgTioSSkRAASUCbUCAOO7gUNKSj1GS58
	1KWgwF5PFpln6BFaO7jrou3+Yvs6nX8Klv+0KvEKlMbcWPo/VGWk2Q804EHyZqgOr4ExKX6mcZZ0n
	N3eAs1f47hDehwvjGHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6MZ-0000000AIcT-0F7I;
	Thu, 06 Mar 2025 08:13:51 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6MV-0000000AIan-3I3q
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 08:13:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso1825225e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Mar 2025 00:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741248825; x=1741853625; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLj5XWg7CIE0WfrqZc/tm6IHxyhmUxBPEQxl5xJpjbY=;
        b=SLw+WYPcYyFbo16G8atY5rS/Iu5KWOEVlx9dq3ylfiWZw07HhLHArmhzNGsGgLTI2C
         APjP145ZyeicHOuQtD1cazLjKIh3PgUc2rwHzbTzN/0AkpPr5LOoEe+nTqTI4cT/+Ia0
         fGNZTyAnhPw9KM1lY2i/BOPeX4bqbtAvM9dd1WPaGdffSER9pTVKZnSd/I3UFgiQlxTz
         YwcRzwD8wbXC61Pm/aSvFBCt0G0ZJLrkE1eEEZB5wOiiffmlEWroaVBhf9LtQ8ImDwEL
         sG47tcYTm5LRD3XrwrppLaYZCnfztI5EehoUCe9juwxxAhLc5lpBsb2UPsJyH6p9e0ry
         CTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741248825; x=1741853625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLj5XWg7CIE0WfrqZc/tm6IHxyhmUxBPEQxl5xJpjbY=;
        b=sgo4BVgGKKTVZJBF3OWrP6jrQYjVDHsUEuiJ3kdU2D19DsQqtBBwIJ2bBh8SwEvmEw
         CiGT6l1KttqkdbKBznO3lgQxA3o56fHHZTcoQIlfKzf0PDuMyDi3ZPb2RI0nbJ1V0np/
         wtxSUvSxf/HZ76zdw1McTdoLeE9VN6IDed7r2eiwDo+vKm3KR78rVJX7aBTFCspiMu3F
         85U2FQfmp5O0PkK/yR5rPja+yFx5uj78BwA5PAPTlKdsU4RuPZW31L97x0ETvtOs+qvf
         X9lALMAxf9pM1hVPxqxvPvh/5h1qqM5EeVTGCnOOaz1LKFjT+Pf5Ie5yVa3MIiggLrt/
         6lyw==
X-Gm-Message-State: AOJu0YzRqmjelUgG3A2Oo/ATGGcMUCHbz7p+gqzkwjJS63NjupldJlQi
	IxaOFgLXN8475BEI4sn8sYgxQ1nfQjQAEr8tnP0Obx25asLGtWLA3Vu22sw3BlI=
X-Gm-Gg: ASbGnct4++rzqg0bB75Vv3PzQD9iCOtE3FsckksdIwn4A53Hx7o55DcU+C/2CcotaHP
	wVcC1UTdUT+3BrGDRg1kCw/yf9fQdCrV/M3MRzrug6mYqfPF3PrnCHnDKXL9qV3cltK8A4rdcVP
	0J53JnZrtYANXwAK9Zrqr6ZUywjZXLkL1Rkaz3SCGq0AP2R/t4foEXl/+wJvoVOYLJBbhKT0h5l
	k8QpRJcB5X1goK6pxKJBb6165D850B2OZBdQ9CL8aqZAra/MhESqsNokT0oRQAbuZJol1u3e5rx
	/U7L61K32N0XJCkg6S2wMnHfyVaBpg0pTIOfvTCaRM6BtNrhFTjQURUfYtK3ddbaNXdGmWwQNw=
	=
X-Google-Smtp-Source: AGHT+IEizEhonB9j6mrELEVT2fWpqMYrBXgXdwXsHsJznxRDUYEH+hFr9DD372KDSR8Qo+hFwnpfNA==
X-Received: by 2002:a05:600c:198f:b0:43b:c309:da40 with SMTP id 5b1f17b1804b1-43bd294de7dmr48473505e9.4.1741248825382;
        Thu, 06 Mar 2025 00:13:45 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c019557sm1262734f8f.50.2025.03.06.00.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:13:44 -0800 (PST)
Date: Thu, 6 Mar 2025 09:13:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <20250306-3f25ee3d4686442bd215a0fa@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <Z8jU2i5d3e4Dv4vk@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8jU2i5d3e4Dv4vk@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_001347_827471_88988EB4 
X-CRM114-Status: GOOD (  33.17  )
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

On Wed, Mar 05, 2025 at 02:48:58PM -0800, Charlie Jenkins wrote:
> On Tue, Mar 04, 2025 at 01:00:15PM +0100, Andrew Jones wrote:
> > The first six patches of this series are fixes and cleanups of the
> > unaligned access speed probing code. The next patch introduces a
> > kernel command line option that allows the probing to be skipped.
> > This command line option is a different approach than Jesse's [1].
> > [1] takes a cpu-list for a particular speed, supporting heterogeneous
> > platforms. With this approach, the kernel command line should only
> > be used for homogeneous platforms. [1] also only allowed 'fast' and
> > 'slow' to be selected. This parameter also supports 'unsupported',
> > which could be useful for testing code paths gated on that. The final
> > patch adds the documentation.
> 
> Why constrain the command line option to homogeneous platforms?

Based on feedback at the last Plumber's, we've decided not to go out of
our way to support heterogeneous platforms unless they start to
materialize. With that in mind, and the fact that heterogeneous platforms
can use the probing mechanism instead of the command line, then I didn't
think the cpu-list support was worth it yet. Also, we can introduce
support for an optional [,<cpu-list>] attribute later, since the
definition of the parameters would stay the same for when the cpu-list
attribute is absent. Indeed, even if I was to introduce the cpu-list
support now, I would make it optional with the absence of it behaving
as this patch series implements.

Thanks,
drew


> 
> - Charlie
> 
> > 
> > (I'd be happy to split the fixes from the new skip support if we want to
> > discuss the skip support independently, but I want to base on the fixes
> > and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
> > or not at the moment, so I'm just posting together for now in order to
> > be able to check for my patchwork green lights!)
> > 
> > [1] https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
> > 
> > Thanks,
> > drew
> > 
> > ---
> > v3:
> >  - Fix compile when RISCV_PROBE_UNALIGNED_ACCESS is not selected
> > 
> > v2:
> >  - Change to command line option from table
> > 
> > 
> > Andrew Jones (8):
> >   riscv: Annotate unaligned access init functions
> >   riscv: Fix riscv_online_cpu_vec
> >   riscv: Fix check_unaligned_access_all_cpus
> >   riscv: Change check_unaligned_access_speed_all_cpus to void
> >   riscv: Fix set up of cpu hotplug callbacks
> >   riscv: Fix set up of vector cpu hotplug callback
> >   riscv: Add parameter for skipping access speed tests
> >   Documentation/kernel-parameters: Add riscv unaligned speed parameters
> > 
> >  .../admin-guide/kernel-parameters.txt         |  16 ++
> >  arch/riscv/include/asm/cpufeature.h           |   4 +-
> >  arch/riscv/kernel/traps_misaligned.c          |  14 +-
> >  arch/riscv/kernel/unaligned_access_speed.c    | 237 +++++++++++-------
> >  4 files changed, 168 insertions(+), 103 deletions(-)
> > 
> > -- 
> > 2.48.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
