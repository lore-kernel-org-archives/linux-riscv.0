Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06A8C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7TgqSRgULhN4lVxE9NTON9oHokVe4ESo+dt6LtgK6Q=; b=U73jZGZye0QIOE
	ko/zZMNgD7/PMdS6jiasCxPHxIzV474gzwjDsXBu95/kxB42zihfKeyM9Y5uXP5xmTqsfkHXiUrVE
	BSmTjARyYBCiWB5BWnpViBVNUfwiCBwKc7SQ9cDkPYu99cgoZFLAqtMft6jxKexEIJOVwDxeqG1Mj
	9idu4T7GQRqnD8Ct7r+AQCsA/vS9oqKowJVKCtiw+zHENUzNSv3SpG0DWQCKBJwu56KTGTamWCkIb
	UUmZIgEG/ZeFH4+RZI8eyfTiuEWsVsZ9v+omVh5rTPZ0awROIjiEh5xr/dLfQdu2gER5QKyIZ/wb5
	s55mgz8XHxj0qgPOBiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZmB-002tmh-LN; Fri, 24 Feb 2023 15:14:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZjl-002sgN-MS
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:11:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id az36so2035570wmb.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kPCVl0QlfALZDlMpbAkmLwutUFq3j5xbJedN6gd80NA=;
        b=KdSot8AYvTiOiRCBNWn1ICTSXNUa286AnwHWfzBTVoapo8rDPOVtsiFy2aDHLUBIe0
         E33BAZHJGV8T8PKtmKozLzMl/TtAi3GWoynQGoFMdaxBdXoGBtPC4oTbULpI9+ArPSZn
         SHAq9LHae/hH+42Gc5kP7uDW70XcCzklxooPl/yNm2WkCQoOB5M2kn+4qeVi14K9E9iR
         qDB4pPHqKgkkqAfNRa2pdsD3M8Zg8ZYDZteFBGGzc0PEELD4PrrC3VS267kilKHz3XWN
         VBpn1AEeNJlUqMKisfyhEhnWM+Xw+O4On9SegnqvQMW+VZbJYTxTrqYXrluhoB1ILSxo
         STlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPCVl0QlfALZDlMpbAkmLwutUFq3j5xbJedN6gd80NA=;
        b=u1B/aXGtplykFlzrlTgymkf3jmQGRgAPxqIfy7kVdShkmFlZHzoTUDVlO5Is/ZM7kJ
         vdCO8QstZloj6Po5vJhrR2MoYLWV80Gano6CZVnRmgO+OFa+Gyvgtndl34P5GrVScJpD
         YpOrD7oy2rHPjde8p8FISuu3IGTIQZ7i048SCfHxZhKcI2r8yDQlUjLDT0qkEnYhfbXy
         V3gQKdK5XBT4zY/LMuXG/2RiC01+4owWHUCCcape8CgF58N/oajaxhVPKP/WQJx09sHb
         HjidXaJZtbKT1VkmD/HquflQs2RpSImxhevbsTYntULMCf6sw53o800JzhMQO0Ss+up2
         fKag==
X-Gm-Message-State: AO0yUKUhx6pX6NXVkDAEZ0o1GmIymYbAnLLcunR2EmI5eVQVM4Gzwhz9
	ArA402oFJA+hp0Qj6xJbYS/gdA==
X-Google-Smtp-Source: AK7set/0a69ASdEuHX4mdKctjhgtqi3LPakn5reJ3fhn0MwVk1TzGvIblpwaOBT/QtZRajxgovADhg==
X-Received: by 2002:a05:600c:4da4:b0:3ea:c100:f18d with SMTP id v36-20020a05600c4da400b003eac100f18dmr4187559wmp.9.1677251509959;
        Fri, 24 Feb 2023 07:11:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b003dd1bd0b915sm3186026wmb.22.2023.02.24.07.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:11:49 -0800 (PST)
Date: Fri, 24 Feb 2023 16:11:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Fixup clear_page export when using Zicboz
Message-ID: <20230224151148.5lj7pdmu3nlxsqux@orel>
References: <20230221190916.572454-7-ajones@ventanamicro.com>
 <20230224135844.619054-1-ben.dooks@codethink.co.uk>
 <52014360-7160-82ac-7f7a-26f55ee3b684@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52014360-7160-82ac-7f7a-26f55ee3b684@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_071153_781202_F8DBA40C 
X-CRM114-Status: GOOD (  20.11  )
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

On Fri, Feb 24, 2023 at 02:44:17PM +0000, Sudip Mukherjee wrote:
> 
> 
> On 24/02/2023 1:58 pm, Ben Dooks wrote:
> > When the clear_page() via Zicboz is enabled, the module build
> > fails as clear_page() is not marked as a ksym entry. Fix this
> > by changing the asm code to use <asm-generic/export.h> to add
> > the correct export.
> > 
> > Also remove the weak clear_page() as there's nothing else in
> > the build defining this symbol, so just make it the entry when
> > the Zicboz is enabled.
> > 
> > Fixes modpost errors such as this:
> > ERROR: modpost: "clear_page" [drivers/gpu/drm/ttm/ttm.ko] undefined!
> > 
> > Reported-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> >  arch/riscv/lib/clear_page.S | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> > index 7c7fa45b5ab5..4ed5fef52d80 100644
> > --- a/arch/riscv/lib/clear_page.S
> > +++ b/arch/riscv/lib/clear_page.S
> > @@ -6,6 +6,7 @@
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> >  #include <asm/alternative-macros.h>
> > +#include <asm-generic/export.h>
> >  #include <asm/hwcap.h>
> >  #include <asm/insn-def.h>
> >  #include <asm/page.h>
> > @@ -17,7 +18,7 @@
> >  
> >  /* void clear_page(void *page) */
> >  ENTRY(__clear_page)
> 
> Shouldn't this be removed also? Am I missing something?

Yes, it should be dropped, I've done so while squashing.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
