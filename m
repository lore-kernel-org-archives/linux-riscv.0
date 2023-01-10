Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B02BC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 09:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6peI7f+iylokLaZB7yvVJcnEIK3E9cVJWmtMpYXdU8=; b=geJvekP3CXe97s
	YudWiyNI1b1u2Eac2+G3/7XzkqRgXJ32Niy04u4q1d6PaaHQy9cvq8jPhijDq3yvLE+J5jIMNITCJ
	9nXwmHBMaW1u2IlUNa24SpWdSi+pXdUdNq9d8YGyFbB2+AuE72ivSGwzYbrv+aZL6Hbp7a4THR7MH
	q3L3qwJo/kqkU9eiOCJTnp4a5yi30LdyC6gIPPgJeDtpceZHmCioHKDwDu1IdT24KkQTo12vDFe/R
	P9AP9IVpL4XJxWhQjgYdRY6z8laEfanEE0XHnxcJZencqwWEb66JltahiKt2uM/B1a7CIZWGQWucO
	DeQeXSCDXGJHoN0T6cQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAcI-00604F-3n; Tue, 10 Jan 2023 09:08:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAcE-00602m-GR
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 09:08:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m7so10982516wrn.10
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 01:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPQWPSxoU9g+tHgANim1El1aIeSrs5lAIlGeJQ/iAUo=;
        b=baYRSU5TlZzYpwDw5/drH/W3znMW4SbvOg52qV2Sc3I6HGnQ5I7xeozyLAW5+7g/1w
         pvzmye02CKflawpFq82kjjkZIakLJ6VGCrh+wmK4eASSHR/9f2K80I5tmxBhWW2Csg2g
         tVhXu5QPfc6B0iPu+o9Az+uQvMvQIXNIJB3aIKP/02zOwCMlRNXXfbRqlbogHHAuRc+E
         NeVNiH/Nm7qQvStnt9C2sxdq5GOpJAiOEBWUkP1mvjKP1Tbohh22QJYv7g2GuMvglWcz
         AJ98jwehQW2fvz+ZdTa2c4MuJ+viE9/34dTaiqZLoGy85O2+rq/8v/cpE6KBl01xytGu
         BoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPQWPSxoU9g+tHgANim1El1aIeSrs5lAIlGeJQ/iAUo=;
        b=n0hR5zfYjpCt8UEFLD5YELJ6CSRCfqn9ahJpbTh7K+WlKh73nUuRj5T5K4rXXD6gkt
         +tpACO07R9wZrM4uv7q99rUV0DpGCFj07+WZf7ygRDkBHkseI/kYwM7frKNZcf7tiskk
         VtRj4p3TOZrkURRadlog7eORtpJ71d0oYTwd01uEqfBxIx3v1aweColTEx1+dlaFszCD
         faBzSJ7KRle9aABaQ5L+TB1HL/MjnIMRym6XOYI0meGhk/KGukgHNRpv+WFFIs6osPRR
         iYRQr+k+H0r6W0TkDgUdomIKWQCQIBjStmZF0FodtPmrQeOKO+F50a8ImD3hSePtrg+a
         SllA==
X-Gm-Message-State: AFqh2krqvzK4R1T1VA3zQYcH9Slt4InnQfVl0FASA+Ha4aRvG9tZj+Xs
	dujq6ASs1sWPY90H3lgsce/el9DGZnvGwxnt
X-Google-Smtp-Source: AMrXdXv/jicjrV3wBiaQqng88Wp6io2VWNESvO+szaZxEwhtwb3SVnTmq/1/MT6KhAFr4tB32vK46Q==
X-Received: by 2002:adf:ec85:0:b0:291:4088:a634 with SMTP id z5-20020adfec85000000b002914088a634mr25299420wrn.40.1673341696365;
        Tue, 10 Jan 2023 01:08:16 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d452f000000b0028f9132e9ddsm10583427wra.39.2023.01.10.01.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:08:15 -0800 (PST)
Date: Tue, 10 Jan 2023 10:08:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: Re: [PATCH v2 3/3] RISC-V: Add arch functions to support
 hibernation/suspend-to-disk
Message-ID: <20230110090815.fskdrmnbaig4yelz@orel>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
 <20230109062407.3235-4-jeeheng.sia@starfivetech.com>
 <20230109193624.iiuguwgimpn7zbyw@orel>
 <6638291f6a3c463994919ba0a875472c@EXMBX066.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6638291f6a3c463994919ba0a875472c@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_010818_565183_C8B21B8C 
X-CRM114-Status: GOOD (  33.08  )
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

On Tue, Jan 10, 2023 at 08:37:01AM +0000, JeeHeng Sia wrote:
> 
> 
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Tuesday, 10 January, 2023 3:36 AM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>;
> > Mason Huo <mason.huo@starfivetech.com>
> > Subject: Re: [PATCH v2 3/3] RISC-V: Add arch functions to support
> > hibernation/suspend-to-disk
> > 
> > On Mon, Jan 09, 2023 at 02:24:07PM +0800, Sia Jee Heng wrote:
> > > Low level Arch functions were created to support hibernation.
> > > swsusp_arch_suspend() relies code from __cpu_suspend_enter() to write
> > > cpu state onto the stack, then calling swsusp_save() to save the memory
> > > image.
> > >
> > > arch_hibernation_header_restore() and arch_hibernation_header_save()
> > > functions are implemented to prevent kernel crash when resume,
> > > the kernel built version is saved into the hibernation image header
> > > to making sure only the same kernel is restore when resume.
> > 
> > Why does it crash with the generic version check?
> The kernel could have different device driver enabled and the device drivers would find itself running in a different address space if restore with different kernel version.

That part I understood, but I was wondering why the generic check which
compares kernel version and more wasn't sufficient. I answered my own
question though. Extra data needs to be stored to the header (hartid,
satp, etc.), so we need an arch-specific hibernation header. However we
*still* need the version for the version check, so some of the generic
check is reproduced in the arch-specific header. Please update the commit
message with this more detailed explanation.

...
> > > +extern int in_suspend;
> > 
> > This declaration could be in arch/riscv/kernel/hibernate.c
> Can't declare it to the .c file because checkpatch will report error if we do so.

Error or warning? It makes more sense to me to be where it needs to be,
but it doesn't matter too much either way.

...
> > > +	/* The below code will restore the hibernated image. */
> > > +	ld	a1, HIBERN_PBE_ADDR(s4)
> > > +	ld	a0, HIBERN_PBE_ORIG(s4)
> > > +
> > > +	lui     a4, 0x1
> > > +	add     a4, a4, a0
> > > +copy:	ld      a5, 0(a1)
> > 
> > copy label should get its own line and how about changing it,
> ok
> > loop, and done to local symbol names, e.g. .Lcopy?
> I think better to use two local symbol names, i.e .Lcopy and .Ldone

Two? You currently have three labels which all serve purposes.

BTW, maybe unrolling the copy loop a bit as arm64 does with its copy_page
macro would be a good idea.

...
> > > +		sleep_cpu = -EINVAL;
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +#ifdef CONFIG_SMP
> > 
> > The #ifdef shouldn't be necessary.
> We need the #ifdef CONFIG_SMP is because the bringup_hibernate_cpu() is defined under the guardian of ifdef CONFIG_SMP.
> One will face compile error if the CONFIG_SMP was disabled for a single cpu testing.

Ah, you're right. It's interesting that arm64 doesn't appear to guard that
call.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
