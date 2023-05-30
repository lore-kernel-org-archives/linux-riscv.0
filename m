Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D06C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdRRzWLRjEUppiMs2RYjjau4I5D1n+wUz3WHoZqNbg0=; b=uLScXGgaq6uRt1
	NaYWSuo4Ux/HrtA35+LI1zP0sAf9T5OgEx3tTKalmMVrs1F2B1RJt5SKHCViVMCYAtsEHeK5IS8g6
	iCV0VK0CbSnQT2Lx4Qf7mrIQAOyr4l2+4PiKqvoAU6QeUBst4UENLwvHXAImfhVM8V9NuJbafCnHI
	yQUaAilE3Tp8TEcIBnyzu0geFNpj9Yw7qgC7VZuVXIfduQxdxHPY25NINZh99tjYC1ibiV3pWX4LT
	tARaNw7wJI+Jb3hvu9bLBDTMw8/Aufksut3Ezzu1bS5ok6otsCvDmaUY4wibI/o7Grwvxf0zAGcQU
	9sqyrYOcaPsF4OSleRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xHi-00Dap1-1P;
	Tue, 30 May 2023 11:13:02 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xHf-00Dan0-16;
	Tue, 30 May 2023 11:13:00 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9E5085C010B;
	Tue, 30 May 2023 07:12:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 30 May 2023 07:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1685445173; x=
	1685531573; bh=jzxR1ScglUhfxqqGJjgvOS5NAqJpfFc/FG469x51F+w=; b=z
	Gm7H8q2xAwH65t7g76y5CpNRNA5QhcTT9CVh8xcZZdtfZF7xTv87d7VZCAAC/TEk
	ggEOsQ0d0JIIol5LaBUgMQPQGyyrsBk+MQRBvYZ8pzb0V1hZ+o8+a0kCFt4nMBVi
	DLzwKpOEDjkVtg8s4OlRz2e20pJZ/fwWcSqsVwRSlWLupRb6L8t3scy1jBdt+w58
	H4dOxL5cdxo5A2z1zjta/UDnxuIDN5al4owNBMvK5avlfyNWjfjgnHrYuUWsxjca
	YIUFnkT6n2B1y7mZnyFLTJy4jGY7MofSeCiX3Ash7A71fm447OX0Nrg2/sSqQhHc
	7lxckU497HvK26OalRNAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685445173; x=1685531573; bh=jzxR1ScglUhfx
	qqGJjgvOS5NAqJpfFc/FG469x51F+w=; b=IGCHqhWWcbyh6MB/CW4j9E5nOLkNc
	MB5S7AG5+9Uao8lFbpTrQFWDCxAgeAz50TkB7sSIqfCZe4GJqucU4q2of+fNzkAZ
	ozqucMxrSsKk8D4vwBp0M3nOXWfV55tZ+BwneK280TDjbxLiTaJ04HPIW2zPIAzi
	QzLxwlWrF7USZaAaKKXFYwDt4taOmxnalJUHUqeeb5tBFH5OcyG/0aW3BAk2IrsU
	OTU0Fx6sm6GJ4r1ZrQShU6ReUHcyoxDjL+s0xU4PF/zfeUk6T4mjxgMP+QeS1d22
	+L+cEp2vpyKyphRpU18a5qW3k8RyRCCLLIP2NVTJQFY/VyVoSdg5pTTFA==
X-ME-Sender: <xms:M9p1ZLUzh5h-xIjt6EAne-fkiWy-kfD7ehnMMU_n6uQ0E_sH7qrIXw>
    <xme:M9p1ZDm-11Kzq75g9bzZ4p8Bi8CqYoAD14uu63oHoN1nDRaGTkH9tbS6Rn2eXj1TR
    VcIvL-6SC1XJjuj0OE>
X-ME-Received: <xmr:M9p1ZHaMr9z-1bjaM9Y_FvwiQDZ_vreipQ5XsEQ_ONZ948J3EC_eQlPIq8aNlT8QB7lFHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
    ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
    tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:M9p1ZGU-nMSgIfCHDflrZ16Mmf4jTfAlm-Zv1KLq8HvnripwLe3DCg>
    <xmx:M9p1ZFkT9W3_xU5ax-ZWYNbzzY95_f0M5iBw8JZc7bVNl4xwOKbMPQ>
    <xmx:M9p1ZDfPrYWia5RjOy_0Tv69hBZV6AtJ3i_LBbPY9C8gWBh8gDMEvg>
    <xmx:Ndp1ZImdm_XgLH-WrJ7Wtzk8AriLHd8rHSyyZMbNAkgODwQ0ohRd5A>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 07:12:51 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 3A8FC10CE6B; Tue, 30 May 2023 14:12:48 +0300 (+03)
Date: Tue, 30 May 2023 14:12:48 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,	Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/realmode: Make stack lock work in trampoline_compat()
Message-ID: <20230530111248.lzt77sydi7x3wau7@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <87h6rujdvl.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6rujdvl.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_041259_461961_EF115E87 
X-CRM114-Status: GOOD (  15.82  )
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

On Tue, May 30, 2023 at 12:46:22PM +0200, Thomas Gleixner wrote:
> The stack locking and stack assignment macro LOAD_REALMODE_ESP fails to
> work when invoked from the 64bit trampoline entry point:
> 
> trampoline_start64
>   trampoline_compat
>     LOAD_REALMODE_ESP <- lock
> 
> Accessing tr_lock is only possible from 16bit mode. For the compat entry
> point this needs to be pa_tr_lock so that the required relocation entry is
> generated. Otherwise it locks the non-relocated address which is
> aside of being wrong never cleared in secondary_startup_64() causing all
> but the first CPU to get stuck on the lock.
> 
> Make the macro take an argument lock_pa which defaults to 0 and rename it
> to LOCK_AND_LOAD_REALMODE_ESP to make it clear what this is about.
> 
> Fixes: f6f1ae9128d2 ("x86/smpboot: Implement a bit spinlock to protect the realmode stack")
> Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Tested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
