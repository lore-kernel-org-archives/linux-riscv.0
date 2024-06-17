Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C858DC2BA15
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX6eqdttA++Kpj7ShD2HBoTokVeq++sDBT8t16JCdgE=; b=PVgQ85ognMRjem
	dzuH3a1JnlItPS85I+SFvsTeSjenxfUIPmbmMDSIj4DpKjY9ztj0qvbWZHhzSI2j++JfnQa5Cz1VM
	K5hpY4WVpU6CxeofsaXcLNU16zKzFzn+SHiO8oHt7LpeWK1p1vH0XtP8yAloVHyotSqLa3emeAboL
	ddwN7nlwAfFDY5RYUCOaXMkEQzvDQObp5wNk7qyYM5AT4btsK5oYJYljHLqAk6dO3e9hOPlhSxH+X
	NZtIK0x+hYzV9CLzuAOL4+rTzwb7R1nfUG7vxfcDySamZX0qxmIZ21sKjhnwFNqLJxvmpm0AJrAIS
	MPFAilZbl+kGudfN4oNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDlW-0000000BIaJ-0xir;
	Mon, 17 Jun 2024 14:55:26 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDlT-0000000BIZP-1H8Y
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 14:55:24 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-440609dd118so21266601cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2024 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1718636122; x=1719240922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gljeJeGxAWnVOsW2sid+gU59meZd1BiHrYVsIx/obU=;
        b=SITvfwJ6FlXXhEAgErq8LpHxkfXTv3yRIbpTd8u4Ehh4zpem2Awt/GZpGyJd5GMNR9
         tLNj/kicOlNwgWsrSAKG9KG5pyUmGf44vK6jiugEck8UlzAiNiKdG1yLdSWwaA5EY6PA
         CeNQiHQO6SB2aeSIliv1xddgc0EtcYL5U71g1NHn7ssi+iTNvDuhL3U6B1wx5ZOTMVbS
         sNG/2EHdDP9J5BajTn94YlZrsboKxOOHue43zfZpbig8aE9RlK8vqXmSy1d5XmO1G0Du
         3Pexon6tUPlFHriwnvXhJCjWui6dCCo8a6Db6QguULQ7EW1FXLnIAVAhrnq2tUSbY2Ti
         l4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718636122; x=1719240922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gljeJeGxAWnVOsW2sid+gU59meZd1BiHrYVsIx/obU=;
        b=esZ3gxDC6uK1jKPkxIIXxqf2PQyvI8wDftcVFVjXrkU0l+LiOwtUXjVqwdYx2c5ivv
         EskBdnw620HqKB2NQ55hS8q3+ELAFwISCdOqZlvTtPUOB5kDwT+iCpbVTLr9xNMB0AUQ
         pG/6noBhRWMj4tD8L09s6d4lHuhaoOYC/nrPCtfWbQLEjMkOsrSCtxdQtsnEJ6XOsYlc
         Sda4YUopT5mEXpM2BZxttRFjSlHKmSE9qklW5ZOVsE8NDN55F4wHwc/EquRek/Muyesv
         si7Hi3UcSUORGmtCrToY8CiK5ro5+DIPnBkcHKMYZ4wF0Z/EyLIaXot4aFCTXZaBfOw2
         Ek2w==
X-Forwarded-Encrypted: i=1; AJvYcCWsd1ApJBHyQoDiOcoLfzU2SqPKWWz7PPwZa7BXcBdCenXefrV4bdeQqY3EbaXkEDemT18kLosVt5qm/hOJ7FsadfwZwQKlv1P4X0WTOmLK
X-Gm-Message-State: AOJu0Yzud+99pKXhKf9EjHuZ8xGjuKWES4V05KL5VBA+Tse8pP11VC4T
	Zh0aaGRZOBnY63NNXgJgQIoDRN9d6zyhdDF2oMl0J2JKT1zrxQgDhmkJIX9kVfI=
X-Google-Smtp-Source: AGHT+IF2uoGlG3xSUI65+NQXmHPaCbaCWcT/PreTgaYbScCBfAppudiPPRnsNM5lnQZNDfID8Cr2aw==
X-Received: by 2002:ac8:5e07:0:b0:440:5434:d59e with SMTP id d75a77b69052e-442168aae16mr119117071cf.26.1718636121932;
        Mon, 17 Jun 2024 07:55:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-441ef3d89ddsm46912991cf.15.2024.06.17.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:55:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sJDlR-008oz2-1P;
	Mon, 17 Jun 2024 11:55:21 -0300
Date: Mon, 17 Jun 2024 11:55:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kevin.tian@intel.com,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 01/10] iommu/riscv: add RISC-V IOMMU PMU support
Message-ID: <20240617145521.GE791043@ziepe.ca>
References: <20240614142156.29420-1-zong.li@sifive.com>
 <20240614142156.29420-2-zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240614142156.29420-2-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_075523_403973_B8265E6D 
X-CRM114-Status: UNSURE (   8.50  )
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

On Fri, Jun 14, 2024 at 10:21:47PM +0800, Zong Li wrote:
> This patch implements the RISC-V IOMMU hardware performance monitor, it
> includes the counting ans sampling mode.
> 
> Specification doesn't define the event ID for counting the number of
> clock cycles, there is no associated iohpmevt0. But we need an event for
> counting cycle in perf, reserve the maximum number of event ID for it now.

Why is this part of the nesting series?

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
