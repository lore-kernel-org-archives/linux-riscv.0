Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB74C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 20:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCI/5aGA82fdK5IQOyBtc1GmwCqbQ6MkzObpdTdRdJA=; b=lz3u8gL/1oKSs/
	XnNxfHM361/wEJ32BYtFLQlTMCwH7KaFpm6SyHxQmbW12rnG4EX+l58ULkdFH6LmCIcyrGAfN8jk3
	kpUH5UaVQn+RbcVFrV0+W2RaCx1gdEeZ7Mc/8I2N3VNm9zNNipFJ9qP9ZZE+hT6KzwYsNQOlhGUeQ
	8Deijv9AWfIPi2AHOlk9KbapdvXpLVkjYmIwgg6ZNop2Aequ9hh1hZiNQugzppdD5VEJdX27SwJyz
	lSUQzpqdlLpsOIiMc1W3Dscw9OVHyVPX342vRuwP7xWscpLKAykP9KogsGr8CdV5oy+PuPk67dqgb
	T8lt7DsYvUhlt9u5+JhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1vPN-00EeFR-2G;
	Wed, 24 May 2023 20:48:33 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1vPK-00EeDn-2J;
	Wed, 24 May 2023 20:48:32 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 564803200B1C;
	Wed, 24 May 2023 16:48:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 24 May 2023 16:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1684961303; x=
	1685047703; bh=GIQrYXVIJfghlyJeZVTwMC4NvSXNZTZ81GeVUDK35vA=; b=t
	V78D8AQWQriaLyjLryKXcRouM18sDnenIWh1Yu+0MLtrKqbfxYSkYAP7Ah45z0C0
	wqrRshdZnP8Fzs3Y74J2dEDBmVYWYkp0Dr1xsrl5u5j90fMLI6BY4GxnFIanI2ra
	ZHoNHyFdoiSeY0hssG0uaEFpYzR9Lz3q64/uyyqR22r9Bp9R7utjmhCAN40FS5yl
	LMsNTY7sC/uKblPAscJfx1OowRzqDWvUUksw9EcLsmJ5dxmskbo1njKOtT/uAEJb
	p8CBABZQSKnGrDpi9R3ukiBCGNRVKr8j1xz53Ydve6A5EMl4OC/qVLH06zs0pCt+
	L7IqaBqFdMvHDowOKkSCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684961303; x=1685047703; bh=GIQrYXVIJfghl
	yJeZVTwMC4NvSXNZTZ81GeVUDK35vA=; b=YXeLdPNcTaSCsiCsBeJv2f5p9SuP4
	8PNIAd5OHvvHh0zi0J6sHQ2iDxJi3KUZPgxTwHgsCiBnsG4iFJMa5e9VSO/9SRsp
	1uf6gxH+qkDhvA2KvyiORL0inPnSLCOCJ7W/hgwUyUdJI1MHVbrXnbq8uhCmMqay
	QCl1ZWzVXrCzb30GT0XC1Wta3d7Y3WxRKULau+sNOAow3o6ZJP+eHzUVYtEPFdUO
	SEJPLcn5mgVKhWahWT0mp2x4brRIS3jKZQ5jeti0GnxZf5j3AV7cUWQLho6bY9Hg
	bJgTAAYblxZs0e6yU12BJKusEGvIJR9TETpkuLHQittJSabdfnNE4zZlw==
X-ME-Sender: <xms:FnhuZDTH2VncK0GAbUd4QSuubawcVJEemEMmfWagwDdFrmymqbynRw>
    <xme:FnhuZEylmO4WOFyEi63qXNPS7KmYBZh0Oi4Ko1ah2WyXbPpIb5vWyfJ0rtnlScPMf
    YwGNKBrFecAJTAStLU>
X-ME-Received: <xmr:FnhuZI0B8fy9Ol2lnVR91k-mp_zuw1fzrmbcod9KqT-pVjgXEb11Z3-99qaxPUeQ45cz-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejhedgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttddttddttddvnecuhfhrohhmpedfmfhi
    rhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrd
    hnrghmvgeqnecuggftrfgrthhtvghrnhephfeigefhtdefhedtfedthefghedutddvueeh
    tedttdehjeeukeejgeeuiedvkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:FnhuZDDD4TIO_TlTLMdLlTBKIBaI4Z9lylnIe3wBeaO4FVJJxTQ0FA>
    <xmx:FnhuZMj_AEyzunCa7U0nUvY822b_W_v3y-MdIwmWBPCWgqMitbF1og>
    <xmx:FnhuZHo0gf_JVrLFUK-EgR8w02dXTQBT2P7OqLOR94f80xY3JTy1xg>
    <xmx:F3huZHB2sQNsFiPjk9M0j2hsG8Xww7Nt8oC4qQnHLKoB8ZE2QQW6hQ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 May 2023 16:48:21 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id 49820109F9F; Wed, 24 May 2023 23:48:18 +0300 (+03)
Date: Wed, 24 May 2023 23:48:18 +0300
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
Message-ID: <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508185218.962208640@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_134830_942243_6CF37555 
X-CRM114-Status: GOOD (  19.53  )
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

On Mon, May 08, 2023 at 09:44:17PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Make the primary thread tracking CPU mask based in preparation for simpler
> handling of parallel bootup.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Michael Kelley <mikelley@microsoft.com>
> 
> 
> ---
>  arch/x86/include/asm/apic.h     |    2 --
>  arch/x86/include/asm/topology.h |   19 +++++++++++++++----
>  arch/x86/kernel/apic/apic.c     |   20 +++++++++-----------
>  arch/x86/kernel/smpboot.c       |   12 +++---------
>  4 files changed, 27 insertions(+), 26 deletions(-)
> ---
> 

...

> @@ -2386,20 +2386,16 @@ bool arch_match_cpu_phys_id(int cpu, u64
>  }
>  
>  #ifdef CONFIG_SMP
> -/**
> - * apic_id_is_primary_thread - Check whether APIC ID belongs to a primary thread
> - * @apicid: APIC ID to check
> - */
> -bool apic_id_is_primary_thread(unsigned int apicid)
> +static void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid)
>  {
> -	u32 mask;
> -
> -	if (smp_num_siblings == 1)
> -		return true;
>  	/* Isolate the SMT bit(s) in the APICID and check for 0 */
> -	mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
> -	return !(apicid & mask);
> +	u32 mask = (1U << (fls(smp_num_siblings) - 1)) - 1;
> +
> +	if (smp_num_siblings == 1 || !(apicid & mask))
> +		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
>  }
> +#else
> +static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
>  #endif
>  
>  /*

This patch causes boot regression on TDX guest. The guest crashes on SMP
bring up.

The change makes use of smp_num_siblings earlier than before: the mask get
constructed in acpi_boot_init() codepath. Later on smp_num_siblings gets
updated in detect_ht().

In my setup with 16 vCPUs, smp_num_siblings is 16 before detect_ht() and
set to 1 in detect_ht().

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
