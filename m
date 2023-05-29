Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5CAC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 02:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INmPRuUF+jdlAqJH0BfhiviEeAIxC/Mrr6VCUgRbY8A=; b=XkrvxBrneK8HKd
	7WVMXHVvfsRqnRZYhP58gZweWf1baAhRVsgQipbJVMajwB8t0D3FGaf4HlpBclnp/kPpJtVqywZpE
	x/fYwIUVXdv7CSzQbLVz48qSpTLLglwIVpdKGJr9xLtxW0ZOG6NqVGeb2Ooj7SulwURVuqn/qdb8G
	5YAp/mYxu4WshllvxnoG+S1YELce7zDSEl1oz9v5LaKExprYEKCPYScER456tH1Occ6kYLk05ZFG/
	L6lUxYcupHVLV/zPgG8F2OEw9WIk3DOobZy0aICTSKRKWZafHbo9oQ6gOL6HRLziipRPmuroF/+JA
	DJ6IQ9U/U5NWVEqJu7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Snj-008th9-02;
	Mon, 29 May 2023 02:40:03 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Snf-008teK-1C;
	Mon, 29 May 2023 02:40:00 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 68EBC320083A;
	Sun, 28 May 2023 22:39:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 28 May 2023 22:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1685327985; x=
	1685414385; bh=CkLoqHnVGlymW7d8k4EFDgQjQ/Ry/XUh7kKzLI6+vlE=; b=W
	7EccITdMZC0pSl/b1cfDKDyxZJGjSM57ZL2lxSNLgeqB4IerV8LFdI9zEG9Uv3G5
	XelSpBSDuEiMFswqvgC+uqMSU41P+0pHnc0CfVm+/om40YXV8TBgy4FQ3uAnJ0sd
	0leGMjl2uPikmG/RgzzVFUtdTyGqRV9PoTLcM/5fX1Q+VN3mISeO/SGfktGELjZZ
	NdxDajeL23HVze7H5M+ZON2UH8rVcjxVZPc4eeORlBj44HD0strS02gomytli9s7
	PBU0KbXi2fQ1wTum70GIBqTrZdwfVGFyVfYmU4ShoSq7JbcP7lXhTS7MnuWZ/MSP
	q530uy7ak3gazTiZQa03w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685327985; x=1685414385; bh=CkLoqHnVGlymW
	7d8k4EFDgQjQ/Ry/XUh7kKzLI6+vlE=; b=Ym18twRp4YDc99fHB93LquZJ0Z4zp
	embehcemE/kKIw1lZWuqx1KLQozamaAeoJM8goXmgoaZW3VB8Dgu+XxcQIKA7hdr
	ii4iswSCwWVizYzEQhscnjWq5UJr55hgxRG1klgsxQfGEpvQcFkllQ/IlrtZeuNd
	IkgtrkaFdbgTtMVHe/1BaJAZgG5u4VOq3VGMrtOS9mrpBphl1Sv9YkU1wdeQ//ZD
	7Iq1V0iH3LUN1FJ4cnVRQ7ifNB0s2ek3SVY9vbksOnEwoqh4M6UrCmTyI4hRZ4zX
	H05f0ian4GSUghIm00k8vxuIOxyQfYMTfS1T0c/t3HVr9UH3nfIjwNYjw==
X-ME-Sender: <xms:bhB0ZISkSebDoY7ePFrAHMDJbiQqzCSLtGQEC7GihGdfbUW05RzW4w>
    <xme:bhB0ZFzAz6AVefd2szJo-ws8Uh2hNyL_zT_y1XDQB_wTeqEm_eppvzBm55tfHAdwY
    NArb6jCfmWTz_8OPNI>
X-ME-Received: <xmr:bhB0ZF3ndzPOosUupfAXA2uJY_qxBkSmJjfdBatmCRw5_Peevlwyk7NCarF_NFDe7DIgoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekgedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
    ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
    tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:bhB0ZMB8itjXVeTPWF_K8Nmn0VUSqgIS-owqp_lG18bg5bU4EsSh7g>
    <xmx:bhB0ZBhiT1zEB1GcRZ1uvkLgyLjitMFL8pFJUil6ufu20rCWUASJ9g>
    <xmx:bhB0ZIrw9F7S8Wzi-Fm-LbfqbFWndpEyT87JM97uPNmv25HvJJw6bQ>
    <xmx:cRB0ZEAbi-FwJdt75RNpPlGa_l7-Cjrsterd_z2tGu_lje6NiEeMZQ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 May 2023 22:39:42 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id DC398109530; Mon, 29 May 2023 05:39:39 +0300 (+03)
Date: Mon, 29 May 2023 05:39:39 +0300
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
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
Message-ID: <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sfbhlwp9.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_193959_461526_FA4346FF 
X-CRM114-Status: GOOD (  14.15  )
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

On Sat, May 27, 2023 at 03:40:02PM +0200, Thomas Gleixner wrote:
> On Fri, May 26 2023 at 12:14, Thomas Gleixner wrote:
> > On Wed, May 24 2023 at 23:48, Kirill A. Shutemov wrote:
> >> This patch causes boot regression on TDX guest. The guest crashes on SMP
> >> bring up.
> 
> The below should fix that. Sigh...

Okay, this gets me fixes the boot for TDX guest:

Tested-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

But it gets broken again on "x86/smpboot: Implement a bit spinlock to
protect the realmode stack" with

[    0.554079] .... node  #0, CPUs:        #1  #2
[    0.738071] Callback from call_rcu_tasks() invoked.
[   10.562065] CPU2 failed to report alive state
[   10.566337]   #3
[   20.570066] CPU3 failed to report alive state
[   20.574268]   #4
...

Notably CPU1 is missing from "failed to report" list. So CPU1 takes the
lock fine, but seems never unlocks it.

Maybe trampoline_lock(%rip) in head_64.S somehow is not the same as
&tr_lock in trampoline_64.S. I donno.

I haven't find the root cause yet. But bypassing locking in
LOAD_REALMODE_ESP makes the issue go away.

I will look more into it.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
