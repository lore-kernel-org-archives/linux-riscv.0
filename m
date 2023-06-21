Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F898EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZOnry4UPmY/8OXAvB9h4WplBn7dwcriaXPKDCNzcpo=; b=iyaPHeGqHKiU4O
	6pbYIIQgCZf+YqjuUz1tzQXnn6/q73KwML2WzEJkKC2Lfsyp9hK4TWh1hdTgVZdua17rpArNUJTSp
	j1gpF4UTrMkYZZ64NHRGr8hjE7G+TKHAmrfiDycmzKiERMsDHvIN+JAdKyNssP2jYaxDuIsWK7M48
	D3fze+slaHDRryvYTOLxDQNeiw2OGnWZ/Tyz1qcmPQJD/TuORdhJ+R0EcOj2bduQlmWqytOUtlHl7
	Ux25EVVFs1yj0BvqsFAP4E0iU0ssgi91axB0VPOSijQcLfbJMF3OAUyCo9+7lOGT9Du90XhN8AvYu
	l/MpC2UXTNyvuRqEAGGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC12p-00F8sV-1J;
	Wed, 21 Jun 2023 16:50:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC12l-00F8rN-1Y;
	Wed, 21 Jun 2023 16:50:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D3C6615DD;
	Wed, 21 Jun 2023 16:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96030C433C8;
	Wed, 21 Jun 2023 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687366253;
	bh=nRDgHtA8hqej023ToUhLoZFNoVkS+qHIHVfPG/sX2HM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ZyW7hIwOiMuVBWbNLKkUGG4I9ld9sU+55M4ZDtjpb54AQkZkjrW2BAQpUQDsBScUV
	 3PuViCowDv3Bh65idoeIVGTOkyHEoIL1b2dC7j3xNY75mpWFddVIKrc+1BtooEGsEG
	 e/W29ML5aWligBRBGCkUt8zz0q42K8B1DFB8acM9a3AodCf3X2UrAc7M5tj+QzaIJ3
	 BNU9X9pGdKljGOCb/rjllAVrKb5Q0YONOpcuvdetSA7nDoLJjqbTznsYdA3e/pOQr+
	 ICEH22H0gKf07QhrEh2lPU2+jAbQ9m6lwbXYETYMIVq5QZlLXIOlJBhglEsFLf9vur
	 hkWXTdIwRXM4w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 241B6CE3A04; Wed, 21 Jun 2023 09:50:53 -0700 (PDT)
Date: Wed, 21 Jun 2023 09:50:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 05/37] x86/topology: Remove CPU0 hotplug option
Message-ID: <b487a394-0a70-4ec9-ac43-0e8fb14ad110@paulmck-laptop>
References: <20230414225551.858160935@linutronix.de>
 <20230414232309.510911744@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414232309.510911744@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_095055_601924_01EE20C8 
X-CRM114-Status: GOOD (  23.01  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Apr 15, 2023 at 01:44:21AM +0200, Thomas Gleixner wrote:
> This was introduced together with commit e1c467e69040 ("x86, hotplug: Wake
> up CPU0 via NMI instead of INIT, SIPI, SIPI") to eventually support
> physical hotplug of CPU0:
> 
>  "We'll change this code in the future to wake up hard offlined CPU0 if
>   real platform and request are available."
> 
> 11 years later this has not happened and physical hotplug is not officially
> supported. Remove the cruft.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |   14 ---
>  Documentation/core-api/cpu_hotplug.rst          |   13 ---
>  arch/x86/Kconfig                                |   43 ----------
>  arch/x86/include/asm/cpu.h                      |    3 
>  arch/x86/kernel/topology.c                      |   98 ------------------------
>  arch/x86/power/cpu.c                            |   37 ---------
>  6 files changed, 6 insertions(+), 202 deletions(-)

[ . . . ]

> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2294,49 +2294,6 @@ config HOTPLUG_CPU
>  	def_bool y
>  	depends on SMP
>  
> -config BOOTPARAM_HOTPLUG_CPU0

Removing this requires also removing its use in rcutorture.

I have therefore queued the commit below in -rcu, but please feel
free to take it along with the BOOTPARAM_HOTPLUG_CPU0-removal patch.
Just please let me know if you do.

(Yes, I finally got back to testing -next.  Why do you ask?)

							Thanx, Paul

------------------------------------------------------------------------

commit 95588de780c0e81004b72526aa3e3ef5ce054719
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Jun 21 09:44:52 2023 -0700

    rcutorture: Remove obsolete BOOTPARAM_HOTPLUG_CPU0 Kconfig option
    
    Now that the BOOTPARAM_HOTPLUG_CPU0 Kconfig option is in the process of
    being removed, it is time to remove rcutorture's use of it.
    
    Link: https://lore.kernel.org/lkml/20230414232309.510911744@linutronix.de/
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Cc: <x86@kernel.org>

diff --git a/tools/testing/selftests/rcutorture/configs/rcu/TREE01 b/tools/testing/selftests/rcutorture/configs/rcu/TREE01
index 04831ef1f9b5..8ae41d5f81a3 100644
--- a/tools/testing/selftests/rcutorture/configs/rcu/TREE01
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TREE01
@@ -15,4 +15,3 @@ CONFIG_DEBUG_LOCK_ALLOC=n
 CONFIG_RCU_BOOST=n
 CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
 CONFIG_RCU_EXPERT=y
-CONFIG_BOOTPARAM_HOTPLUG_CPU0=y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
