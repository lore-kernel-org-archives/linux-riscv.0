Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A60C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V56bM6VWU9qpcwztCZ+/9hP50yHvSnXzpRJlC7MgMq4=; b=sT6SYAil22tWwZ
	eJFNhO5/qcyonByZjBqg7lDrIp1xowUbzSooBd35Gus2wpGpj7GB4WygCIhf+B5rHol+Q2qvXaS2K
	Qy2lihF8fshQFkeOceqqxyanST+/3w/Qm4i7EBrXmXZrHUa44B1OV3YVrJN5CUibqVtSNlosHzgdj
	z0vEWZ/eUhw7wR2ApAvkhhbmB22Ut5uKbTRJlUlNkBjfySF4iEKjxrgILeWC5wrNqlG8X2SvbmKjo
	MAQxwCrtzyL0h+y76VzcfhCiPFvIV3OmsLCjU5HkRxzpT8Pw0jdYVvYMMreuKckbFxeVRFOMammu4
	puYQIMStzoizInAwyalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ij1-00000002Scr-06LG;
	Wed, 15 May 2024 17:47:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Iiy-00000002Sbh-47c7
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 17:47:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ee12baa01cso59433225ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715795246; x=1716400046; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rNQBK45Jbj2jrow2+tGAdK6aG6vUrJlKW5RKoJXeXKU=;
        b=c70yfX3wVe0k/eyRdONBq3IKc+IB9SuLcIyc28QwPvIsPC9fR5ANpeBNL428R28Hlk
         2f3UTvIkvyFN+SH37fSFNpV3iEYzV0oaKMvMzq5L4mNWkgEcFe8SKEO/DRcy9BS459bw
         p9UnPAM+lafIpDF4oioqzE5VzLIQX1ZFYc8VJpNrp69mrKLoo5Cpir4PTGLdsL3tIJNv
         m7jTJYU0fJY9OLyrq74Z7rbGpuHTwKRr35pEOSS4Eo0kLL9IHkuPItZmsftG0gFCbGrr
         I8eVFfLCvuvQfYOGTXIkk+mfTM2dlY+BRBcx6StKrK4CB88G6PIN6lixfyFC7wobv6uu
         4Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715795246; x=1716400046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNQBK45Jbj2jrow2+tGAdK6aG6vUrJlKW5RKoJXeXKU=;
        b=Il03r4uEzNgiQH0TQ9op40J7fpbI3FTHN+FLxaOZPXp2svyh/5eQUsPYKWgt7N2hrX
         0K8RPUdtIDhISSPRhMXisLSBmsNCFdnlPELgA7AtqzT+IR5BHply9UD7rybfSvT7OMxZ
         F6ZT39WKt5LxpW5NFfror6d067EW/M2VVOOus1e/dxaakdarntJ5BIoPmZGOXW06bK9t
         Ph/3fgncR4xxtZK5KRv8y9k8BphifLzxHqsynCcXxp2opKSGbTYEE9JBYUE2GDBYxfYx
         1i2WrGTcehDauQC/0S45RbSL5j15CzaAo4SggIBeXK89LFHBDquFNeTbwlt+y5diJ+8R
         8hgg==
X-Gm-Message-State: AOJu0Yx66cffEGqfFtLPWGCyXIVxRCTKLD6SXVJlZIgthbHLJUYm2YuC
	C4oCYAt/22Qtmc+fdvgykPaG8Xfhd1P6Q59km0avBQKQciOeYF2UF4JGID3bZoo=
X-Google-Smtp-Source: AGHT+IEJY38pGt2rAu92x314kl37SMl9wTF+lCux/msdi4krymsAu3gF+nWVkviFEyHAKHoShTZ2hQ==
X-Received: by 2002:a17:902:784e:b0:1eb:3daf:ebaf with SMTP id d9443c01a7336-1ef4404a932mr148259035ad.57.1715795246056;
        Wed, 15 May 2024 10:47:26 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:144c:7973:ee0f:85cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30caesm121246705ad.160.2024.05.15.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 10:47:25 -0700 (PDT)
Date: Wed, 15 May 2024 10:47:23 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: fix Andes errata build issues
Message-ID: <ZkT1K/c9hWsfOwWf@ghost>
References: <20240515-comic-sketch-3b40e6676f55@spud>
 <ZkTnlEnoFFrQdXi2@ghost>
 <20240515-slander-stranger-683758537aee@spud>
 <ZkTuc4fxXcS/g7hC@ghost>
 <20240515-bootie-patriarch-769c0ebff4b1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515-bootie-patriarch-769c0ebff4b1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_104733_045968_D72A7B11 
X-CRM114-Status: GOOD (  43.59  )
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

On Wed, May 15, 2024 at 06:30:36PM +0100, Conor Dooley wrote:
> On Wed, May 15, 2024 at 10:18:43AM -0700, Charlie Jenkins wrote:
> > On Wed, May 15, 2024 at 05:56:30PM +0100, Conor Dooley wrote:
> > > On Wed, May 15, 2024 at 09:49:24AM -0700, Charlie Jenkins wrote:
> > > > On Wed, May 15, 2024 at 05:09:34PM +0100, Conor Dooley wrote:
> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > > > 
> > > > > Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
> > > > > helpers") added includes for the new vendor_extensions.h header in
> > > > > the T-Head and SiFive errata handling code but didn't do so for Andes,
> > > > > resulting in allmodconfig build issues when commit 589e2fc85850
> > > > > ("riscv: Convert xandespmu to use the vendor extension framework")
> > > > > added a user of a macro defined there.
> > > > > 
> > > > > Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extension framework")
> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > > 
> > > > I was going to fix this in my next version but was waiting for the
> > > > reviews on the thead stuff. I wasn't anticipating these patches to be
> > > > able to jump the queue :)
> > > 
> > > Yah, the reason for that is I asked him to take the non-vector parts of
> > > the series as 6.10 material so that we'd have less stuff movin' around
> > > in cpufeatures.c so that Clement's Zc* + validation changes wouldn't run
> > > into a bunch of conflicts etc. Same reason that I pushed for getting
> > > Andy's vector subset stuff merged today, but that mighta been before you
> > > hopped in.
> > > 
> > > Cheers,
> > > Conor.
> > 
> > Yes I was a couple minutes late to the meeting, whoops.
> 
> 
> It's prob at like 0600 for you, so w/e.
> 
> > The subset of
> > patches that was pulled into for-next is odd to me because there is some
> > of the thead enablement code as part of the vendor extension enablement
> > so that there was a user for it. Since the subset on Palmer's for-next
> > does not have the rest of the thead code there is only a
> > half-implementation of the thead code, it allows the kernel to probe for
> > xtheadvector but it doesn't probe anywhere.
> 
> I dunno, I think that reporting that the extension is there constitutes a
> user, it's not gonna be dead code. There's plenty of extensions for
> which all we do is detect them and nothing more.
> 
> > In my opinion, a better solution would be for me to get rid of the thead
> > code entirely from those patches. So that there is still a user, I can
> > replace the thead code with the andes versions.
> 
> The Andes stuff is in the subset he applied though, so...
> > 
> > Since Palmer already pulled in those changes maybe it's too late. There
> > is not a critical problem here, but it seems like it's bad practice to
> > introduce code without a user.
> 
> ...there is actually a "real" user in xandespmu. I did miss that

I meant there is no user of the xtheadvector addition.

> "riscv: Extend cpufeature.c to detect vendor extensions" actually
> contained the xtheadvector detection though, rather than just the
> infrastructure. I think it is probably harmless to have it, but
> shouldn't be too hard to quickly drop the thead bits either I suppose
> if you're worried about it.

And the adding vlenb to the DT patches is unrelated to the subset of the
series that was pulled into Palmer's for-next so spinning that off into
a different series would be more logical. This is kind of a pointless
rabbit hole I am getting into, but when we start splitting up series
the code contained in the patches start to diverge from the cover
letters that end up in the merge commits.

- Charlie

> 
> Cheers,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
