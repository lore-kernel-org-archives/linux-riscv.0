Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A083C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxvnvEY9hUBxRrgqjRkAFd1pc7XLhHQ45Lfm4JPCRgI=; b=NPdZJGLw53TSs6
	9lIAJ11iFQKwyOk2a4F/9LJZAjMUsT5uLmZUzBapAKaCIYoxBf6cWL4+3MYjKy5bCHYQeAvX6rcHw
	oYlcMZ8qJqkZOgDR2ETvU5DoT5rg+A2Rm7NsS45GRWjtXRUQTIwWUxhCnKJffNFW9uH95e4rUNBg6
	cxlcM1558JefUhoHkk2Bhbc6BwV9xZtjVGkWtz+mQD9nBcfXXzfOnc0wGLn84A/fdfO4EaIa8lIT5
	Plge+wi1bvADJlBGwzVFKvs26DmafRAeZlrGVWUjjD0L0t2SS0eVTuG7Kg4sMpjKWhPlABbR/oSWW
	vh0M+68wAemEH/R2l3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWNO-0000000Gnqy-1LU1;
	Tue, 30 Jun 2026 11:11:38 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWNM-0000000Gnq8-0L6x
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 11:11:37 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37d70036426so1965108a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782817895; x=1783422695; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5p9T28h2OslDKUeqoDWHYyojw+H9eXM0OlnWy+86/Ec=;
        b=CYT/8C8WYNMoBT/CbOVkj+E0rECjfDb9AHlG0wPGAI1PMg2MKMtPVqZrtHk4Cz9eXH
         qg8wVLuSabYzCjbLI5P/UDM2j6NAELhvHmpe5D46SxcjVkB6tQTQCM90YUrerAx3eRnw
         jWPX3M0FDQROD7dUvG5uiTOsr5hm1SXUuwh7qs9yvOS/zSCRKWse2a+q7E6yrqLi9aej
         IoIdkMIBbPTvTv7zkJ4YBCLl92Jn6nh0sTwh6QTnYTqpVvRGq6Hjt2JOEXc06hbjd6Ps
         VH2uaUlVZYNFWcfAE4w2jDvhs1PYrh1prAYpJjEOflTULg0dGY05aBV/v49HbvVewxB2
         VR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817895; x=1783422695;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5p9T28h2OslDKUeqoDWHYyojw+H9eXM0OlnWy+86/Ec=;
        b=f2NlCgPTY8DxCYi/6yZvbclQBkPLI4sdlkIZyKoBdsHGodare8dVCG5bNyFIecKkU/
         uD0tgbn3i6A5XHVtOoKxGOYu8G52Kt1L3QVzqhdMMtvrMpuyVAOWmaMGjGWVGuj3rRZA
         q1zSdr2TDdV7C5dffBZ1WXg9jHfN69YAoHEoKKSfq8X6mx433Is3KqmcHt07LH4iN4sv
         8tgduZAzS7Vr+eYwmMx8DNqomh+aRErpO2nLyCp6rddCnUuDgh6zzi/vnZBLcB78Kndu
         S7Evzb4ziMx0o9wDwaVkKIz8QGd1O7qrKBL6vPQagR82wCuuFGgvSTUy1xdzUgt2rSr7
         AWUA==
X-Forwarded-Encrypted: i=1; AHgh+Ron7eHjOLj6sGcfp/v939itL9ROUr0VyxfkG5uejgDkV5TqlLN/k96KAcQtpD7sA+wpBUuQ0F1UtUq4SQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwU/WybCPNqn+RQBr/wNkw2YKuOHK8LYFnW4toXuRXiCoWFV7/M
	mSg0eLV7Bo1yh3HPZ8mevBOeu9qTpNz4OhpKu8m9BL1W3kxFj8h4nsCx+0Xt7k19cms=
X-Gm-Gg: AfdE7clmFn/V2qs3pFnuH0kfuS+8EYNjqGabBAnhyY9DjLZQE+BF3imewjAcJ8PK4pv
	3kQM9DU1xo98xGQoP1jVPg7YJSlN7q8sOCCDu6tdHWUXqvfw+WO2I+2Pk12vfrVYZHrYBVqoM6/
	9uogsOTmDDzr3ZFaUlN37ArjtSdLkYQF6x/7KzQRy9iycptY2sbJxg6TklNFUwOXCFBCzQ6ma7c
	xEP6SsiwwbEiKpk+NA1W7dFR+9zkise6fo/YJJqNMRIY37yPy45qj6W5xDLDHk3yJaYF4QI76xN
	pBiED4exNR3nbNb4W+mqU3TWp7lkLgBgoH5doGHwWgSiXZcjndSrsX5SURpZA+PrMDya5Hg2PBT
	1+8JwBgqxTA3lr2nyyLwiqJEVl/w0ka5/2gJYFI4mi/zVN/zwAmTjdwc5IZfKk0vtx8tcnWfFd+
	MFYJ2XtjAtDgg=
X-Received: by 2002:a17:90b:55c6:b0:37e:608:4b75 with SMTP id 98e67ed59e1d1-38052538a64mr2532163a91.11.1782817894698;
        Tue, 30 Jun 2026 04:11:34 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38052f47a3dsm1541965a91.13.2026.06.30.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:11:34 -0700 (PDT)
Date: Tue, 30 Jun 2026 19:11:26 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, samuel.holland@sifive.com,
	dlan@kernel.org, guodong@riscstar.com, dfustini@oss.tenstorrent.com,
	michal.simek@amd.com, junhui.liu@pigmoral.tech,
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org,
	zhangchunyan@iscas.ac.cn, luxu.kernel@bytedance.com,
	pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com,
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com,
	robin.randhawa@sifive.com, scott@riscstar.com,
	dave.patel@riscstar.com, raymond.mao@riscstar.com
Subject: Re: [RFC PATCH 2/3] dt-bindings: riscv: Add Worlds per-hart
 properties
Message-ID: <akOkXpPi46LBHuIA@plin-1878>
References: <20260619105834.1277302-1-peter.lin@sifive.com>
 <20260619105834.1277302-3-peter.lin@sifive.com>
 <20260622-profanity-herbs-1cc1bcf6206f@spud>
 <aj5m00m4KxRAPAnB@plin-1878>
 <20260626-chitchat-purity-33af51f88380@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260626-chitchat-purity-33af51f88380@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_041136_132626_5DCB6C22 
X-CRM114-Status: GOOD (  32.21  )
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

Hi Conor,

On Fri, Jun 26, 2026 at 03:36:38PM +0100, Conor Dooley wrote:
> On Fri, Jun 26, 2026 at 07:47:31PM +0800, Yu-Chien Peter Lin wrote:
> > Hi Conor,
> > 
> > On Mon, Jun 22, 2026 at 06:12:47PM +0100, Conor Dooley wrote:
> > > On Fri, Jun 19, 2026 at 06:58:33PM +0800, Yu-Chien Peter Lin wrote:
> > > > Add per-hart DT properties for RISC-V Worlds architecture:
> > > > riscv,pmwid, riscv,pmwidlist, and riscv,pmlwidlist. These
> > > > platform-defined values are primarily used by M-mode firmware
> > > > to configure World ID CSRs and restrict WID usage across
> > > > privilege levels.
> > > > 
> > > > Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
> > > > ---
> > > >  .../devicetree/bindings/riscv/cpus.yaml       | 21 +++++
> > > >  .../devicetree/bindings/riscv/worlds.yaml     | 77 +++++++++++++++++++
> > > >  2 files changed, 98 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/riscv/worlds.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > index 5feeb2203050..4b5778b6d3e7 100644
> > > > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > > > @@ -26,6 +26,7 @@ description: |
> > > >  allOf:
> > > >    - $ref: /schemas/cpu.yaml#
> > > >    - $ref: extensions.yaml
> > > > +  - $ref: worlds.yaml
> > > >    - if:
> > > >        not:
> > > >          properties:
> > > > @@ -120,11 +121,31 @@ properties:
> > > >        thead systems where the vector register length is not identical on all harts, or
> > > >        the vlenb CSR is not available.
> > > >  
> > > > +  riscv,pmwid:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    description:
> > > > +      Platform-defined M-mode World ID (WID) assigned to this hart.
> > > > +    minimum: 0
> > > > +    maximum: 63
> > > > +
> > > > +  riscv,pmwidlist:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint64
> > > > +    description:
> > > > +      Platform-defined bitmap of M-mode World IDs (WIDs) that this hart may use.
> > > 
> > > I don't understand what the difference is between this property and the
> > > one before it are.
> > > Is this one meant to be used by m-mode software to then select one which
> > > will appear in riscv,pmwid?
> > 
> > pmwid (single value) is the reset default, while pmwidlist (bitmap)
> > defines the allowed set. The root-of-trust M-mode software may select
> > an allowed value from the pmwidlist and write it to the mwid CSR.
> 
> I don't understand the point of the property then. If it is the reset
> default, just read it out of the register?
> Unless I am missing something, it's useless to s-mode because it may
> not be what m-mode chose and useless to m-mode that has access to
> the csr.

Smwid is optional. In the no-Smwid case:
- M-mode's WID is fixed to pmwid (hardware-defined via fuse/pinstrap/SoC
  registers, exposed to software via riscv,pmwid DT property)
- S/U-mode's WID depends on opensbi-domain configuration [1]:
  - If next-wid is specified: S/U use that WID (via mlwid CSR)
  - If next-wid is absent   : S/U fall back to pmwid (M/S/U in same
    world)

So riscv,pmwid serves two purpose:
1. Source of truth for M-mode's WID when mwid CSR doesn't exist
2. Fallback value for OpenSBI to write to mlwid when domain config is
   absent.

[1] https://lists.infradead.org/pipermail/opensbi/2026-June/010090.html

Best regards,
Peter Lin

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
