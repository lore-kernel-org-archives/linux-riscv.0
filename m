Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EB3C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XGTcenTq+scuehSub9csWEY9AE9u7ALTJwV8i7H1Ewk=; b=aWbIuT8/miVLDpqSsBikXiOcyv
	/HJRkrfpDimKRD7wBTHO43snmVpHG+WDt0It1lxERJU3BCRPlBBCk9hSykqVil5l1DsmylaAd0SyZ
	kK5OkW/aad6EpY/YG1PM0L7RQRbG8EYd1Obgr6W2xw0hOV999QfrbxQ6S4bzeghWiURTeO0dKYBOy
	79bBxzmhX93abP3Ucpq8K1GOG8Rrbke9j4FN31vlbXDWFTX8ALuXc7vUh6Y5rXVZj3yRVr4oWPg2F
	WpJ6Fevz+nu1DHyqwMY5Hc50oZYF3CWcCVeCfGVLruSz/FQ64WiFNsLrKy5Ru+GealhZ0nz0lo1JW
	A8WJGeHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVdc-008Ld3-0D;
	Thu, 20 Apr 2023 14:51:56 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVdZ-008Lc0-08
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 14:51:54 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-517a659f877so643663a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682002311; x=1684594311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cenhvMgRBJVEyO+DQ1Yk7EeAnoD+Mx3QDGrPvs6dp/U=;
        b=ozdQf66WPw8ShRBluz+LMQljss+d3T0PBYjA3jmNDdv//pVrmGXx6L9uusb7fIhJSL
         LymgWp9X3FbkLAAxceftLeQZn0/6M8JdZmIbsV9oONQVhJAe+e9OODUteXA7bMLvWkmz
         5ayRkEY6NENxUYGlnGZFkZBlmyRHMXNIOgoLHCbFX3aaDwjuintlWNx5LkJKfs2Sd6PE
         Ya8JLH6D3Xz61J6mffVksjDGSWXvO9yhMWIRSY/rzCnaTg7svns1MKliwXodcMA+7eb1
         u30LO7+8+pIMTa1eXTgGdK8wfjlZ/7y7DufflgYGy0ae6b3znNofgHpeyL7dnXNOKs4z
         yrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002311; x=1684594311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cenhvMgRBJVEyO+DQ1Yk7EeAnoD+Mx3QDGrPvs6dp/U=;
        b=OywCVfvoT94MKcx4UOX6FWKNPVX9wXmLEDocu8RVhb7ON1jA+R80/U/MQwUFPIQh9F
         KcjEoUhqyF+qfwb8bG1r5guNYywrLq65ay8Q76d6v0MRR168iMBXxELpuPKuJUiZwtSi
         n4ZrqVE0EtrsUNbOEaFVGPo268/DV/64D1/0S9KS4+nBWEwKXf3f9hrEj5KFoT9Ew5qS
         QdNjAXXmYAmAIy9jKD7d/CHanbI3NkapGQRhGLr1shTsAPjYkS9hL4mr85oIAq5W4dAd
         Q46C2UEFc577QtK+gehjw0Lqcjq4rRGAPXe+XVz9l7ckFnwtJ37GVu80eedaUEF9GxRA
         xTog==
X-Gm-Message-State: AAQBX9cCwNzcdNJ5Tf2BADNOwGLJLvntiQAzFiw/3eB6i1jhHYdHzXlX
	4LPNyrxs90v90ol36gT3ncMOBEr3dH0=
X-Google-Smtp-Source: AKy350YZDYx9Ka0U+LJTenQgM1KG3UW2Yutu07LdZ7q6GZTzBdJRqMrlgBJSIie+uzUyI4FO9iSrYEblhR4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f807:b0:1a6:3a2e:b731 with SMTP id
 ix7-20020a170902f80700b001a63a2eb731mr623230plb.1.1682002311424; Thu, 20 Apr
 2023 07:51:51 -0700 (PDT)
Date: Thu, 20 Apr 2023 07:51:49 -0700
In-Reply-To: <87y1mm3iqz.ffs@tglx>
Mime-Version: 1.0
References: <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com> <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com>
 <871qkf3qek.ffs@tglx> <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com> <87y1mm3iqz.ffs@tglx>
Message-ID: <ZEFRhXua6Jxvit1R@google.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Paul McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Usama Arif <usama.arif@bytedance.com>, 
	"=?iso-8859-1?Q?J=FCrgen_Gro=DF?=" <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_075153_094447_5618DBD9 
X-CRM114-Status: GOOD (  16.28  )
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

On Thu, Apr 20, 2023, Thomas Gleixner wrote:
> On Thu, Apr 20 2023 at 10:23, Andrew Cooper wrote:
> > On 20/04/2023 9:32 am, Thomas Gleixner wrote:
> > > On Wed, Apr 19, 2023, Andrew Cooper wrote:
> > > > This was changed in x2APIC, which made the x2APIC_ID immutable.
>
> >> I'm pondering to simply deny parallel mode if x2APIC is not there.
> >
> > I'm not sure if that will help much.
> 
> Spoilsport.

LOL, well let me pile on then.  x2APIC IDs aren't immutable on AMD hardware.  The
ID is read-only when the CPU is in x2APIC mode, but any changes made to the ID
while the CPU is in xAPIC mode survive the transition to x2APIC.  From the APM:

  A value previously written by software to the 8-bit APIC_ID register (MMIO offset
  30h) is converted by hardware into the appropriate format and reflected into the
  32-bit x2APIC_ID register (MSR 802h).

FWIW, my observations from testing on bare metal are that the xAPIC ID is effectively
read-only (writes are dropped) on Intel CPUs as far back as Haswell, while the above
behavior described in the APM holds true on at least Rome and Milan.

My guess is that Intel's uArch specific behavior of the xAPIC ID being read-only
was introduced when x2APIC came along, but I didn't test farther back than Haswell.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
