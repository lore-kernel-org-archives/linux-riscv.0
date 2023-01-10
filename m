Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB235C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Q5ugk9PxX3Z0oxHEo/fTwKB1oGSMD/jNjzL36STEjU=; b=Jy3P7t3uTVwxl1
	L+4732DRk161PjcnirUGydod+Cu6QjTKAVrFD+bS9QRFiepK7HCzsa4hEw4v4y2xt8nliGlP2wwbj
	unhsSWZ6XOKs/L5bjULTOn//vYRFapRS7DUIlMT9S6XPhdLT4/ZFX4F3EJPHNiMaFOMELP/oWMHwn
	9+LQoczWfi39NxZbrPp6Pw+QXuUTkmJBEh1f56rXmsQrokkWXp8ABNx98W0ATSvXzyozUkZTCicTl
	ThKIAWPxYPK5YaxU50NmXsPuZqrVqMF2Uqgf7fFV7PSrTUPvaE9ky9dBWtbXbUZNwlC0QIBNFzFih
	S837twIHJKcaHK6SfHbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8yG-005bkX-St; Tue, 10 Jan 2023 07:22:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF8yD-005biv-Mb
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 07:22:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id m3so8088646wmq.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 23:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yzQ3j4TmqF8Cm/sfXHUUAfEUTHBzXvGd1lVdd2sPyA=;
        b=bBcjHXfK5dT9Iu4HkcOAUovMpWYLht1OfdbnlhWDvHZA/+azWYiOpzZFtbpcuH3Jei
         R/uvEC1DxwCZzmJFIqwAdDbC0UY/MGTt6Sj6laZJBsBd7PbO0IBcRVjd5ulk1zSp6BnA
         30xAsWAVt5H9a+j3FSn9KOBqAM6fxAocoxDR3zymeV5welDJue/WhJuAk80n7htsZoWA
         hkpIxlzLknNZ3jP5HsSy3ZU4bQcVpAHF9Ei2xlX8P990kcitL4Q641Magx69Znr7DIK/
         QwphxanaE2Cgzixrga8dtFEloZiUa2I/GA3SM8pbpveI2SIFrwikqvDxTD1O7mPoNI5D
         OeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yzQ3j4TmqF8Cm/sfXHUUAfEUTHBzXvGd1lVdd2sPyA=;
        b=Vo1OQIL73hUkNKV/kERWJMzFU8NO84xRLEQB7VIISDW+nCwUCpIem/9bMO73BEancd
         ZOwIuQD2w6uV/sOX4CeRZ5URzVKMvMcEb5GQPxsHnZyQKYII36E6f5IjQlUWmBBH2RZb
         PuOvH3n6YkcG+wRb4bDbl4jH950SYbp+ZZeFqKdof980BOjWrugTygVFsMY+5TtDtu1V
         ixVC0DhG62Tje19UjOyamj5wNOJ/1sBKlAETQ46o+WkQCB/OwtRnNN5THRKAYgCq1IeX
         V7XY/+73SKXjVW4UMUDMEuewQS7/3YXAB+ubho8YW+ef0E+kNilUAYUaVmysSBOTYSUi
         QXEw==
X-Gm-Message-State: AFqh2kppB8aOLfHiUuWOVuoqiT8KH6MchnojIdVDjf4pKri/F19AkWzt
	eBfBE5w6y1TQXjkmRj7bDoC4SA==
X-Google-Smtp-Source: AMrXdXuNeeP7o90r06Zmki9dKcq5KHqdu3zDOlKt8N7T1bhug9L3jZ7kKeejVOsoBrZ1Tt+kye7CmQ==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id h6-20020a05600c350600b003cf803bd7ccmr51526311wmq.33.1673335368347;
        Mon, 09 Jan 2023 23:22:48 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id hg9-20020a05600c538900b003cfa622a18asm18081219wmb.3.2023.01.09.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 23:22:48 -0800 (PST)
Date: Tue, 10 Jan 2023 08:22:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <20230110072247.xtptnodxjshbfh5s@orel>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-4-jeeheng.sia@starfivetech.com>
 <20230109193624.iiuguwgimpn7zbyw@orel>
 <Y7xu/Oj07F7/e8F1@spud>
 <d03e4bf7832f48d7aabd07dfd13a3e92@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d03e4bf7832f48d7aabd07dfd13a3e92@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_232253_758451_69609176 
X-CRM114-Status: GOOD (  17.32  )
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

On Tue, Jan 10, 2023 at 07:00:38AM +0000, JeeHeng Sia wrote:
> 
> 
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Tuesday, 10 January, 2023 3:46 AM
> > To: Andrew Jones <ajones@ventanamicro.com>
> > Cc: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com;
> > palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-
> > riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
> > <leyfoon.tan@starfivetech.com>; Mason Huo
> > <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH v2 3/3] RISC-V: Add arch functions to support
> > hibernation/suspend-to-disk
> > 
> > On Mon, Jan 09, 2023 at 08:36:24PM +0100, Andrew Jones wrote:
> > > On Mon, Jan 09, 2023 at 02:24:07PM +0800, Sia Jee Heng wrote:
> > 
> > > > To enable hibernation/suspend to disk into RISCV, the below config
> > > > need to be enabled:
> > > > - CONFIG_ARCH_HIBERNATION_HEADER
> > > > - CONFIG_ARCH_HIBERNATION_POSSIBLE
> > > > - CONFIG_ARCH_RV64I
> > > > - CONFIG_64BIT
> > 
> > > What's blocking this for being for both 32-bit and 64-bit?
> > 
> > Just from checking with b4 diff, it's because I told them they broke the
> > rv32 build with their v1 implementation.
> > 
> > I'd rather they fixed whatever the issue was with rv32 than ignored it.
> The main reason is because I don't have a rv32 system to verify the rv32 hibernation.

QEMU?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
