Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A9CC61DA3
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lf515a3fiE++a1/1voVrG7sPAdyMF+30035hGV8bPY4=; b=gA99kib2vfVE9u
	0mTYcVABp6IjvyXS5wm2DyVplcIADhLMO2IS0JlAUzCnfwGMiuAlXLu4FwWbabsoVn6YNE8IjBuLt
	jH99vaRsZi1Ult8pALp4yrGJEnjncK0bwrbpid7PGnLf/FUxF47wkE1I1FRRRa0WRrKa8fy12GG5c
	3qxOWatM5H0csvV9rPxledfduX47NrlsRENJrP82SCDlocwxPHawJBTVn2tDux890vyoLIM3/tGxL
	j0ARja4Uzzee7YMElcydIfCBirl/PHOz3ULdpXi4XpWFRF4RK/Xl+HSPlI9248qc/UGMskkdlVn3a
	2ZLRYNTjqwRaklQ33Jew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXLb-002Qm1-5x; Fri, 24 Feb 2023 12:38:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXLY-002Qis-6S
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 12:38:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so328274pjp.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 04:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7qH17OyGyM47GPzRwHNiOgr9TsgAnfi2ZEjhVFPdcg=;
        b=Mt68vRPDJBeoMxtMNOChw+A7exoz18+aUvT6JRwUTf7K6bXqvpMUHqiEycS//qFsU3
         HVdWLFrDh4zfTrJzhPu2zMFHFEunSFyBhQV0tGwm6ZEledQKfno2fjmw9IYGXTyIjVRl
         1Nm+zeM2tTD7pSA9lu3lTGMI/d0QVyfgoWpNFbINA93+xvMoUd/Fr7IjSV8s2fxuXsZJ
         Tjm0hW77pG/PzMT/AubtH3oi+nwOcYi3d7K3WO6T9YEpBRxLlbYtPPcMEZgxoCyM/r14
         WUWMf+wcebBgEmu8T37SAyyYhXWLxLMj668fZH+HRXchJEwKLXSaKdrFeM1lA0ZmPGTP
         XWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7qH17OyGyM47GPzRwHNiOgr9TsgAnfi2ZEjhVFPdcg=;
        b=tibxQHQS3OOWaX8YPOdEdA595oA94/rbRvbWWI/r+UdXpj5bBR/09DA6X7TQcXek02
         OKQXs0txMYOxH/1Lga7cW6F6ZYi1H1nZEkPLiM/waAg5D4TojmNLqVH+VG8DOIrhPNWi
         OBA8cNr/c2cjBHCXl4PQPsvw/1VwNeKz5qwMCe+AIuMsnX0dDLEHQfiGpy6QY0UvOpR8
         YwjLX84jvs/qL8mGe0RQO3hz5YphVvyBdvjWI7xaNMZqh0GD3UuTd+8D4KCxWygazfgY
         eH1WisA+efecXbZRGWTQUj9Q+JXjc5L/hH6bs3MEmD3KHf/dJmyV7phKwaXg73fmKnDZ
         tYPw==
X-Gm-Message-State: AO0yUKVDC20ggHhs3BjU0eD2fdgLYZeIsbUIw4AfbZRQjwjsK7I9tbfc
	1VKNnkcJ+IZDJX3EyddM2W1zxA==
X-Google-Smtp-Source: AK7set9/IK46oIHdAjUgWq+wlPNf5E+YpHOahLJ9kH52yTNvgxOt21mZCyPmEi1etMRXaG2aNV/qhw==
X-Received: by 2002:a17:90b:3a87:b0:233:c301:32b0 with SMTP id om7-20020a17090b3a8700b00233c30132b0mr17950540pjb.10.1677242321176;
        Fri, 24 Feb 2023 04:38:41 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902744800b0019a593e45f1sm9363605plt.261.2023.02.24.04.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:38:40 -0800 (PST)
Date: Fri, 24 Feb 2023 18:08:32 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 20/21] MAINTAINERS: Add entry for drivers/acpi/riscv
Message-ID: <Y/ivyGVW/v6Nf5Nh@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-21-sunilvl@ventanamicro.com>
 <20230220201432.5lz7rvwqhfxa4fno@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230220201432.5lz7rvwqhfxa4fno@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043844_272836_9D8CD757 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, Feb 20, 2023 at 09:14:32PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:42PM +0530, Sunil V L wrote:
> > ACPI defines few RISC-V specific tables which need
> > parsing code added in drivers/acpi/riscv. Add maintainer
> > entries for this newly created folder.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 39ff1a717625..d47212194457 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -450,6 +450,13 @@ S:	Orphan
> >  F:	drivers/platform/x86/wmi.c
> >  F:	include/uapi/linux/wmi.h
> >  
> > +ACPI FOR RISC-V (ACPI/riscv)
> > +M:	Sunil V L <sunilvl@ventanamicro.com>
> > +L:	linux-acpi@vger.kernel.org
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
> > +F:	drivers/acpi/riscv
> 
> This section should go under the "ACPI FOR ARM64 (ACPI/arm64)"
> section to be in alphabetical order and also in a more logical
> place. Also, shouldn't this section include
> arch/riscv/kernel/acpi.c and potentially other arch/riscv/ files?
> I see arm64 doesn't, but maybe it should too.
> 
Okay. Let me update.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
