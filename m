Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB09C10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 16:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lE1CS05dePgggkevr3WP/ZVgMZOdXm1W50PLCa3gg5E=; b=a/qjf5868LrDCK
	pUoFajoMmOAM/LtkIFYNKJ6kOZ/32/zf7FrM8TOPDB1QaERDrKgQSY4QtKEtheSjj0MpJwfOojVFL
	dSeWTYw1rY2fc6Fn/oyycprcm/LRIwtsfvwndUWtPCXTS6NLxdFYe+HC8WoX5cqgAOI0mYZP842sL
	5tQiyiRhGHixtwl4r76SkJi0ChUHGAUq3ZaU1JMWjMr8ZhC2KT1avct+GJIBgJi28ndX3Ti9fSX+T
	7qmn0gis4gqF1PXwTWSaQQG1z74TmX/ofHa0AGnY9V4zXBKLlkShE1OxPZRDiWrwgjVAIZ+ApQ64d
	MhGfrNoXM5LNpLVtI87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Nes-0000000BxTt-0DHx;
	Tue, 07 May 2024 16:27:14 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Neo-0000000BxRR-3HEV
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 16:27:12 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7928c5cb63fso241046585a.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 09:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1715099224; x=1715704024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E9cKDESKTiP97lhdcYXkoeInlU7bxEYJkwQ3k3Yr+CA=;
        b=eHVuNug+WTHWwATX7ekbt7nrEqfR33D2srANAcq5y/m+9UM+P7c79zmhqdaxgLZvcT
         6XX8NVMAuWeU5H+79iMTA/ctPqekyfAAg+zJeW1MmkmtKRNOkhYgV8HpB64/sKPXqzNY
         Nwm3dsZ6ZYyp42OQWyfTkO/ejty6Gw4h+R2zfmFvimVJtR8fH3cxYgqco0UhfS+7bJ0F
         4J8R71vZLywxhL0trY04U7vQI4NdO7D9x0z1+4u3RrYaJFndRGC5guDck2s/TVXqEWhd
         MgUiTPoqZuuVRSMrwx7xyga0PkmVBV6k4SiXE5XN1aySgzBZljpbwfgaQsiO2igKAOKf
         QB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715099224; x=1715704024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9cKDESKTiP97lhdcYXkoeInlU7bxEYJkwQ3k3Yr+CA=;
        b=QEkGAZAoQvzzSMWtNqjMJbaZfQCjeiVcWF4YCfyp7N8hsT90OZipmbZC5akeSvvxV1
         EzKsl4vjap7noI4//7gdSthYFE7F0qauvgGlbaf7hrjZLOw+I9IFytU9T0FxVKpmCDun
         RuXQgTnPEKtDmES6NxRsZf3MOitO30X+qDz3PkJRNjGqRSVLIVAdEfCYtEA30N2nQJlv
         CYHVSZVSAtvCSctvVTkiw8iKAc9uzKsTwTPO1C1XVKwm/Z90zExF23mFDcP/Sb5wAFcl
         llv8r5VlvaO+vKk0f2WZYolROs+EMbk9QjfYuOJIiwkGWn1rz2SS1nNiVmGna5CID09J
         f87g==
X-Forwarded-Encrypted: i=1; AJvYcCWK1DAP7wBPTPrlVAdneKZBAoJRSnYHpv7lm/2CcYUDOjtpHnz5TnO1RATn/IJ65uasPnNCdQC36URw8u9M8zvWs3jQVyDrlaShhIg7WWkP
X-Gm-Message-State: AOJu0YwJsgszUbVHHuDTLT+d0UiBW+HpZTqLxRY3oAzsbwo8sdSjnNGR
	pyiJdiD+nauj5RF3NX3AyTZNKCIMbFQ8cYc2k5gFbnCdKBckhfUtcFFgLYvO6FQ=
X-Google-Smtp-Source: AGHT+IFHOfTfE3EmH2freuJBBL04oEuzM8UFJjSGZkYvzSYQQYKXpHT2OlnFg74U2ZgMJcQo58TcyQ==
X-Received: by 2002:a05:620a:e85:b0:790:9e84:9b75 with SMTP id af79cd13be357-792b247fbdcmr40793185a.12.1715099223899;
        Tue, 07 May 2024 09:27:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id g15-20020a05620a13cf00b007929f035e9asm1688278qkl.109.2024.05.07.09.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 09:27:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s4Neg-0001SK-Do;
	Tue, 07 May 2024 13:27:02 -0300
Date: Tue, 7 May 2024 13:27:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC RESEND 6/6] iommu/riscv: support nested iommu for
 flushing cache
Message-ID: <20240507162702.GC4718@ziepe.ca>
References: <20240507142600.23844-1-zong.li@sifive.com>
 <20240507142600.23844-7-zong.li@sifive.com>
 <20240507150829.GJ901876@ziepe.ca>
 <CANXhq0rnWUT4ia-cUoTbSyEQUeCcmC9bC7HHru6Se-1K-PZRDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0rnWUT4ia-cUoTbSyEQUeCcmC9bC7HHru6Se-1K-PZRDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_092710_960406_DC30D37F 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On Tue, May 07, 2024 at 11:35:16PM +0800, Zong Li wrote:
> > > +     default:
> > > +             pr_warn("The user command: 0x%x is not supported\n", opcode);
> > > +             return -EOPNOTSUPP;
> >
> > No userspace triggerable warnings.
> 
> I don't complete understand about this. Could I know whether we should
> suppress the message and return the error directly, or if we should
> convert the warning to an error (i.e. pr_err)?

A userspace system call should never print to dmesg. Return an error
code. Put a pr_debug if you really care.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
