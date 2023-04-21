Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EBAC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQYYAB8qdqxfV/sUnJ3N/stU0yQLeijLXUlz49EUGSY=; b=iJES8BUNFEmJLL
	Gzhk9WU+oiV/Q7dTf6lZtRQB2/5V/LwgGDE6SUbqZFu+wlFAjd/RZz54h2w495lQK81DAeweLzWXW
	aoFJ+uLXRsL28VBbOOH9t2FCytVInRclfFUvyDUnp7fnwLe5l3uMGJ+tVq23dkLvmTPTfWG7xvy0S
	XJX3HlpL/qiYGBn7G7UIWpsVW0A8YNyvQwd257cr1Rhyg/Vi0m9h5QzHeNW27x8I5AAUJfFPuP/kz
	tkVGlcoxlw+52Sd0h+IBl6VhmEhNGTmaF5yXziBe3+sK3JvBHF2H5UiHBFWWvQhAXGYNTh7rtuhto
	dOZCv6X4oa5ibbEabLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pptkC-00BOpD-2n;
	Fri, 21 Apr 2023 16:36:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pptk8-00BOmy-1I;
	Fri, 21 Apr 2023 16:36:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682094973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMzOR95vay5pg0WrO+uJUGs+TLmecn0h01ht4y+YBW4=;
	b=o/TkSlykoJbZmwaCartOT04EgN5C+kODI7gZukI9DsIFy2Dgj3RH1WuWvwMvvYXkyiHIQk
	oxshpYHuRgHC8o/JYqoEGQ0sMgPeCIrVwZGLDjjKa0oD47tebLMPcc0kwKmrYNmhibL69p
	CuPI7WXBesGu+IQZaD33O9Vh8aqxpxbvEKmf8Inm6RIaaj7YSGPtkcXqQaDLBztSRLFiTD
	jAl7P2Gr2fqg2KdBtxFZJUc3m5xmd9qgJZ7OLjPxBmIrUzXSJ1uWPWJLXceKreW9vWpPl+
	SmWK7o2t1K1ok1OKIOZ0yX0u1SEvxXShW0sf3Kg6kxQp0c93gSDpceB1rVFESQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682094973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMzOR95vay5pg0WrO+uJUGs+TLmecn0h01ht4y+YBW4=;
	b=44dX9VJX+TMEmkgFv0MNfddpnQu4SMuQ4SBx4WdfdKvH1kS+zbYESmYQqIpwSH+YghznlV
	s1xiQKd/rkmpEKCg==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Sean Christopherson <seanjc@google.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom Lendacky
 <thomas.lendacky@amd.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <87sfcu2wup.ffs@tglx>
References: <87r0sh4m7a.ffs@tglx>
 <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de> <87a5z443g2.ffs@tglx>
 <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com> <871qkf3qek.ffs@tglx>
 <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com> <87y1mm3iqz.ffs@tglx>
 <ZEFRhXua6Jxvit1R@google.com> <87v8hq35sk.ffs@tglx>
 <56e59a4d-a47f-4bfe-7db5-5f921062ad69@molgen.mpg.de> <87sfcu2wup.ffs@tglx>
Date: Fri, 21 Apr 2023 18:36:12 +0200
Message-ID: <87bkjh2nwj.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_093616_582207_BB0D4FB8 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 20 2023 at 21:10, Thomas Gleixner wrote:
> On Thu, Apr 20 2023 at 18:47, Paul Menzel wrote:
>> Am 20.04.23 um 17:57 schrieb Thomas Gleixner:
>> I quickly applied it on top of your branch, but I am getting:
>
> As I said it was untested. I was traveling and did not have access to a
> machine to even build it completely. Fixed up and tested version below.

I've updated

  git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug

for your conveniance.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
