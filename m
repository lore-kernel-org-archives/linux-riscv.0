Return-Path: <SRS0=lGgd=WN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644ABC3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 10:34:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311522086C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2019 10:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQsOzN83";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaU5j73X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311522086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zg+JC1QcvPLEVmFCLNaz2hQHGbDDa6KH2NkzsPaw4sw=; b=bQsOzN83r8japk
	7OVhV5zjWT+GvoKXgGfUrBQSSn+O7Pa0W9caNVPM1E04hf5piRcfEjt1yFXbfaU8I1EhitgXqS0la
	tBOdmhr93kNUB74qiBpjzlNZ8KOlDfIy3XT+cxZ3UAbfxO+0X/9zeNGh6M4NKM0Fo0ZPyrVMZDOld
	2B+vBas1/1JhYBkg4/BjV5nbHhXzfAFDjXrvpuGD7U4SnjW9CGPgTZrAamlEkgWLrsceZo7wgfLDp
	TFmR+Lgi/JzC0x1GkwYPrziZgJ8Lyb4Xn2KpGNSMzfyxPGrEpa5W4flOQ2ZK0j+tl6d84Q0pBXTAO
	5BRsKkd4DloVv5FboVUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyw2g-0004GH-3G; Sat, 17 Aug 2019 10:34:38 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyw2C-00044w-2m; Sat, 17 Aug 2019 10:34:09 +0000
Received: by mail-wm1-x343.google.com with SMTP id g67so6023118wme.1;
 Sat, 17 Aug 2019 03:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=39YvwnXSLPYPPS8HyY6xQ0pEYqQsaSVOcIZxY6QaSy0=;
 b=HaU5j73Xl18SPfWIKR/l5s1id63iaB7lpk2eLE9Cv93RaSr0QygCeb8VtdrjK/DFoH
 BzanBzeDzwH/CfWIayA254C8bK/pzQhAr1B+Cx1TRlWNSkT4XCzZLK+D58uxuJj/Z6c8
 1+jn+z+dU7Ewi0li9IwJ7jmFgqXABsf3p+TxQXzA7fHIgWlPmx739auC7j/bqLC+8NoU
 C3XDYz8eetWLerWT9nDLSd3eyiPofE72zfZEgyCEmcNmd7KEx0oxertXb8lLCukZQpFv
 6wFercfLlPzs2ZP2Iysl6A4A+S9cPkEPkEAEiZMttS1pDBUiq7OyBBL/XEMk2UGfKSWg
 tAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=39YvwnXSLPYPPS8HyY6xQ0pEYqQsaSVOcIZxY6QaSy0=;
 b=q3yKc+hIhVMyfqrYr+CGNCCBqEUbiubZTi+XTypqrhTtXyeybVirp0Jn8lnBWCJBzq
 QMc+zVbsXbJpkWZM3O8jWJHklbyJT78c5ewbwqjBtSpYmM6/CqYEiOY8x8HDFdIPEcgt
 XQIid6s/BXQ8zMy9SQVV4y0IbC78avwKMCSZZotaxwVi6KOZ8WkHRgArI99IxTZ8EKFH
 oYWL/n4LT9eHgB27/yihM/QdxWy5ge95lVX7kH1yTEBp9AT8Hdg/tv0endBQ8XZ162Rr
 rdXfzPeOxWtO0/p41i7dnke/qHxKDz184u8Y+yUxOMZXEnDF5jcFL9QC8wTdOXR43W6G
 Cu4w==
X-Gm-Message-State: APjAAAU2/7iAXZCALd9CRxiDWOVHdkFoWwx9MBq/0s4+gxElEiVWqcfo
 MNLJL/3x/GkDo1TB2A/8msA=
X-Google-Smtp-Source: APXvYqx+skxBDSiX8lI2gwUVvrx6yD5s1jqeJ+6VF/JmtojW+ENXyX4cQUxihmaZEwvtXGQA8HaHqg==
X-Received: by 2002:a1c:b342:: with SMTP id c63mr11130163wmf.84.1566038046300; 
 Sat, 17 Aug 2019 03:34:06 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id 4sm14396946wro.78.2019.08.17.03.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Aug 2019 03:34:05 -0700 (PDT)
Date: Sat, 17 Aug 2019 12:34:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/26] x86: clean up ioremap
Message-ID: <20190817103402.GA7602@gmail.com>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190817073253.27819-13-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_033408_151043_72E6345F 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


* Christoph Hellwig <hch@lst.de> wrote:

> Use ioremap as the main implemented function, and defined
> ioremap_nocache to it as a deprecated alias.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/x86/include/asm/io.h | 8 ++------
>  arch/x86/mm/ioremap.c     | 8 ++++----
>  arch/x86/mm/pageattr.c    | 4 ++--
>  3 files changed, 8 insertions(+), 12 deletions(-)

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
