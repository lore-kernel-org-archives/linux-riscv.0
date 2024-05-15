Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D59C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlBH8lYUuWhjRmOgs5i4998bJ+D7b28vNt/HDceo1FQ=; b=A53KUnzmlmsMb7
	WCGzvEcNfYLKwKynBEE79N/rcbiNEDhlKC39FFe/kZcKKxBaeHK7DrS5LNPipJsxJW40fYCwyOs8i
	xQlmlM2jUWzQu1dCYNJS8lXEVxsdMhfrX0Z0IIcPfpyPPWpKCGh018AfE4iyC8szMofLMRYw8ww2A
	XhimdDuyhs4rLDPxsJFMR/gIkww81oMRgsCS3JCl8A4tpvk4lRaslmgz5zMYaIZWDCfFdDYDLBqaR
	hed7J7MQGTfE/U3kU9giCAmy4Hi3lwVk2hCyI/HlcXfhusV/MvCvicLNVlRddg32OVcrM8fNU/Gag
	jnXxo2RToGfVwG8MJlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7JHq-00000002Xic-1u3i;
	Wed, 15 May 2024 18:23:34 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7JHm-00000002Xht-3Il6
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 18:23:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6f44dd41a5cso7089811b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715797409; x=1716402209; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MR0I30sTNIW+eDNsgz3nyy/bRqLqCcJui9fOIARkXNk=;
        b=Lmh3O4g0/DWNeLrS1jsQdVT7mnv6Bs7jf7XSxKIOr3SR9xdyff0n3HIZ17nGW3I3CX
         0SmzpJ2uRDLrYiyaMWzzr+y+xa7XP8VUTT+8lWVBdtZyr9IM67nZcLdq9GBAmOcbqsqH
         tfWrguhWA/5/m4xrEFMg5B5MFZrB46cLGBNjHTG1QmjmQMReb+BysjJbytMxcTdsHgtr
         WvxmHLKOAwUctUq2FLH/KuM7ye44Bura0FJdJZmXXTmznUuMZtnvb35g2DiFO7+/2zfP
         i0JRAYZKryT1/cj/XmC3oLIavZOK606Qdy4FT6oLYgkNuMrlDhQ0YvP0HXmoGGtB4jIW
         NGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715797409; x=1716402209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MR0I30sTNIW+eDNsgz3nyy/bRqLqCcJui9fOIARkXNk=;
        b=mmURb2cNb+wgpihZYFH/giqBPV1NLgOPID45zpX9eP0hUrTJ5KIMSlrQHDrEZHMkDD
         1UDryx7gsqYTDMpUGmeffDqKFLKv1EOT5L4v4bXaBYbhzSr9q6JfZK2Dg7omx02uaa1s
         6loQbo8t2xeTV8Y5jwHSai+qmHZS7S9tm6Tgb8EaCRyCCRHliXJ2nYQWZEJ1/cv8UkMg
         wIIKj7Fi287x73xj8EP+V//ZWMdgZmv1MKkBz/HrGmeUG9yPFs0JcjfhbwbBro+KrHxM
         AJWGVb8O89ay/GtrUS+coKK5beFtoMCLz/TC7vWOHtxmScLPZ1Cjs22rK3xSY7LUH857
         dqIw==
X-Gm-Message-State: AOJu0Yw4i8ptnZpz92m2CTjtxAFnQOJo0658ogBAFBretA5wLguBoW+w
	iUGiGE4iMplV9kdaxMMiVmguQ5MziThkva3/WU/r8LmSILajs4lW/5OC3RgljYc=
X-Google-Smtp-Source: AGHT+IH1Vnb/5u89cfgII3+fkua+2Ia+xPgavA+YViAzaYji4M7S54b9nq0WWxyPQOClFvQf2czdTw==
X-Received: by 2002:a05:6a00:3ccd:b0:6ea:e2d8:468 with SMTP id d2e1a72fcca58-6f4e0347b34mr18903324b3a.26.1715797409553;
        Wed, 15 May 2024 11:23:29 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:144c:7973:ee0f:85cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a85f3fsm11373879b3a.82.2024.05.15.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 11:23:28 -0700 (PDT)
Date: Wed, 15 May 2024 11:23:26 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: fix Andes errata build issues
Message-ID: <ZkT9nieh0Pa3NQQ3@ghost>
References: <20240515-comic-sketch-3b40e6676f55@spud>
 <ZkTnlEnoFFrQdXi2@ghost>
 <20240515-slander-stranger-683758537aee@spud>
 <ZkTuc4fxXcS/g7hC@ghost>
 <20240515-bootie-patriarch-769c0ebff4b1@spud>
 <ZkT1K/c9hWsfOwWf@ghost>
 <39FEF902-2495-42A2-B279-C9FC95828F00@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39FEF902-2495-42A2-B279-C9FC95828F00@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_112331_554481_D5201C69 
X-CRM114-Status: GOOD (  48.02  )
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

On Wed, May 15, 2024 at 07:21:16PM +0100, Conor Dooley wrote:
> 
> 
> On 15 May 2024 18:47:23 IST, Charlie Jenkins <charlie@rivosinc.com> wrote:
> >On Wed, May 15, 2024 at 06:30:36PM +0100, Conor Dooley wrote:
> >> On Wed, May 15, 2024 at 10:18:43AM -0700, Charlie Jenkins wrote:
> >> > On Wed, May 15, 2024 at 05:56:30PM +0100, Conor Dooley wrote:
> >> > > On Wed, May 15, 2024 at 09:49:24AM -0700, Charlie Jenkins wrote:
> >> > > > On Wed, May 15, 2024 at 05:09:34PM +0100, Conor Dooley wrote:
> >> > > > > From: Conor Dooley <conor.dooley@microchip.com>
> >> > > > > 
> >> > > > > Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
> >> > > > > helpers") added includes for the new vendor_extensions.h header in
> >> > > > > the T-Head and SiFive errata handling code but didn't do so for Andes,
> >> > > > > resulting in allmodconfig build issues when commit 589e2fc85850
> >> > > > > ("riscv: Convert xandespmu to use the vendor extension framework")
> >> > > > > added a user of a macro defined there.
> >> > > > > 
> >> > > > > Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extension framework")
> >> > > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> > > 
> >> > > > 
> >> > > > I was going to fix this in my next version but was waiting for the
> >> > > > reviews on the thead stuff. I wasn't anticipating these patches to be
> >> > > > able to jump the queue :)
> >> > > 
> >> > > Yah, the reason for that is I asked him to take the non-vector parts of
> >> > > the series as 6.10 material so that we'd have less stuff movin' around
> >> > > in cpufeatures.c so that Clement's Zc* + validation changes wouldn't run
> >> > > into a bunch of conflicts etc. Same reason that I pushed for getting
> >> > > Andy's vector subset stuff merged today, but that mighta been before you
> >> > > hopped in.
> >> > > 
> >> > > Cheers,
> >> > > Conor.
> >> > 
> >> > Yes I was a couple minutes late to the meeting, whoops.
> >> 
> >> 
> >> It's prob at like 0600 for you, so w/e.
> >> 
> >> > The subset of
> >> > patches that was pulled into for-next is odd to me because there is some
> >> > of the thead enablement code as part of the vendor extension enablement
> >> > so that there was a user for it. Since the subset on Palmer's for-next
> >> > does not have the rest of the thead code there is only a
> >> > half-implementation of the thead code, it allows the kernel to probe for
> >> > xtheadvector but it doesn't probe anywhere.
> >> 
> >> I dunno, I think that reporting that the extension is there constitutes a
> >> user, it's not gonna be dead code. There's plenty of extensions for
> >> which all we do is detect them and nothing more.
> >> 
> >> > In my opinion, a better solution would be for me to get rid of the thead
> >> > code entirely from those patches. So that there is still a user, I can
> >> > replace the thead code with the andes versions.
> >> 
> >> The Andes stuff is in the subset he applied though, so...
> >> > 
> >> > Since Palmer already pulled in those changes maybe it's too late. There
> >> > is not a critical problem here, but it seems like it's bad practice to
> >> > introduce code without a user.
> >> 
> >> ...there is actually a "real" user in xandespmu. I did miss that
> >
> >I meant there is no user of the xtheadvector addition.
> >
> >> "riscv: Extend cpufeature.c to detect vendor extensions" actually
> >> contained the xtheadvector detection though, rather than just the
> >> infrastructure. I think it is probably harmless to have it, but
> >> shouldn't be too hard to quickly drop the thead bits either I suppose
> >> if you're worried about it.
> >
> >And the adding vlenb to the DT patches is unrelated to the subset of the
> >series that was pulled into Palmer's for-next so spinning that off into
> >a different series would be more logical. This is kind of a pointless
> >rabbit hole I am getting into, but when we start splitting up series
> >the code contained in the patches start to diverge from the cover
> >letters that end up in the merge commits.
> 
>  The vlenb stuff is also one of the things that I want, it's useful for the validation stuff that Clement is adding.

It's definitely useful to have and it's ready, I was wondering if it
made more sense for me to send it out as a different series to get it
merged in.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
