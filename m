Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FB7EE14C3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUumz+nLvBcA7MD+sMGZctPaVJacYLk/iJUWd0rsd4g=; b=IFt4WrVuvcAeLF
	iHSCli9fLetLCQ/5h30cP2boecFHH/AgoOpb35wcGqHIlDcZ/55C/AdcZC7rhzxepeB8BXtwJqiDv
	w0qIT9SGOw3T73Fk6l7Pa0olBvbF/p390mbpoFu3DttldsdotOmvgVwpm3UuFY/HA5etnToPWd3Wq
	icNe/qmAtygtFUppyr3HX/iwKjJmVnVaYFDj+Hp+MZOsna5nCwAk3B7D/Ic7lWzdz2LkYMdMOwju7
	oRRlHPGAP9vUzhLb4Q8/vswxmMMTfZZAOxYX5GxgT13FNZ3dfDZMki8RoPxURXfUAs7bc1y5Owhre
	LhbvLWfPDQq96/GcaDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe0Y9-00Awbc-2E;
	Wed, 06 Sep 2023 21:59:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe0Y6-00AwZu-0j;
	Wed, 06 Sep 2023 21:58:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-317c3ac7339so325125f8f.0;
        Wed, 06 Sep 2023 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694037535; x=1694642335; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUEsUDVRFl9we3IvMz1iDQ5wrm80qIsR/HrhiCU8qwU=;
        b=lSL/1uPdhaIJ8y740T8StDBG0FcDYPTm4rR/6LB/Ug5b0T2T/KZgMBvOSYUsbyD2rp
         Owgv8gNeNEkCyWHVasKFro8IN8jV776OJxVhi6IqqauEv8dvHVrrLSftSzleYnt5Dcoc
         OzUvr0Nh5vHtJLf7GEWORU1SlH4HrBy4IM1kgTMKQVzQeKVn+lZkxzMeQcrDotZBXjQf
         2B8/g/FgoGIUgx+gGgVTgG3SDVh3GCc/lh1QBrsU6lbiql4xeaS8T0OhLhQr9FZ33kYB
         42UpbUWAcn+8c71Gwr5OhIrx83a8/tA4G1bLLXoYoPQI3WXB3ydq6xA0zdlNbu6Qj1cq
         LmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037535; x=1694642335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUEsUDVRFl9we3IvMz1iDQ5wrm80qIsR/HrhiCU8qwU=;
        b=aKK02bS5vSZnYgI/z+dyKAaiGOjUiDB8A6Ds1Zj2aQ7KjcuuFjMiK2pKsR2a64xRtc
         CYR3yzxSnO5RfnXXFn747eKZwNYhTQC3c5t5qy2iBU+rsiDmYG0PGS/BxVcyTt67fPNo
         4ex27Lz2CvwhqnUu2SK91KgcjXbym0ieaMHAft57e6YXyeQewB4cfjoPcFXcfip53IS+
         p5mtZHAkL00Bdlgj+n64+gN0xlSLzC7at82ubaER7Fxr4BzLkpLvlkb0ZlR3Oltw8feG
         dJrIGJ++aktiVmFu3ernC54eMyuluq4nCjSOdc1bo8AbOASTZUidT0u49+0kAv8icw9n
         sbkg==
X-Gm-Message-State: AOJu0YxRT+611y07CRW7nQ6qKVdSSxSkFAWaSCyZ8VwGNxrjNIRMWoov
	x/05yeZacx/3jCo+fLbH+MY=
X-Google-Smtp-Source: AGHT+IG5nMeuL/VoGmcwCLwFLhOfCIhRsiIb9391lHp1yY958vfciaCR4r3uuUZhhDYYQHGkLNQJgQ==
X-Received: by 2002:a5d:604b:0:b0:30e:3da5:46e5 with SMTP id j11-20020a5d604b000000b0030e3da546e5mr3830642wrt.59.1694037535283;
        Wed, 06 Sep 2023 14:58:55 -0700 (PDT)
Received: from gmail.com (1F2EF6A2.nat.pool.telekom.hu. [31.46.246.162])
        by smtp.gmail.com with ESMTPSA id n10-20020adffe0a000000b003140f47224csm21447397wrr.15.2023.09.06.14.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 14:58:50 -0700 (PDT)
Date: Wed, 6 Sep 2023 23:58:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: j.granados@samsung.com, Luis Chamberlain <mcgrof@kernel.org>,
	willy@infradead.org, josh@joshtriplett.org,
	Kees Cook <keescook@chromium.org>,
	Iurii Zaikin <yzaikin@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Guo Ren <guoren@kernel.org>, linux-fsdevel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 3/8] arch/x86: Remove sentinel elem from ctl_table arrays
Message-ID: <ZPj2F4retSgg3vAj@gmail.com>
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
 <20230906-jag-sysctl_remove_empty_elem_arch-v1-3-3935d4854248@samsung.com>
 <d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0d30ad4-7837-b0c4-39f4-3e317e35a41b@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_145858_269073_20680165 
X-CRM114-Status: GOOD (  18.12  )
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


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 9/6/23 03:03, Joel Granados via B4 Relay wrote:
> > This commit comes at the tail end of a greater effort to remove the
> > empty elements at the end of the ctl_table arrays (sentinels) which
> > will reduce the overall build time size of the kernel and run time
> > memory bloat by ~64 bytes per sentinel (further information Link :
> > https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> > 
> > Remove sentinel element from sld_sysctl and itmt_kern_table.
> 
> There's a *LOT* of content to read for a reviewer to figure out what's
> going on here between all the links.  I would have appreciated one more
> sentence here, maybe:
> 
> 	This is now safe because the sysctl registration code
> 	(register_sysctl()) implicitly uses ARRAY_SIZE() in addition
> 	to checking for a sentinel.
> 
> That needs to be more prominent _somewhere_.  Maybe here, or maybe in
> the cover letter, but _somewhere_.
> 
> That said, feel free to add this to the two x86 patches:
> 
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86

Absolutely needs to be in the title as well, something like:

   arch/x86: Remove now superfluous sentinel elem from ctl_table arrays

With that propagated into the whole series:

   Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
