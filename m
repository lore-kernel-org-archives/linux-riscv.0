Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9712C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciSeUaKAkIKFqxeqeg3XyHVTMcTddRxoKRUA3DiNO5I=; b=0D/2tGaH4kD900
	3t8+49GmxzUHy6ZzRXHPFy6+I8j14u5MqXMMe/+w99PqQhu9PvFz/+hLV+9A4w0GDKm9BTWdw0F9b
	MSERBFzsfYz78yazvhRvzZx4IKoTEI9KbFiiXG3LQio+A1BLjLX/4xL+jlGf8OJFLIuouRR/9cE1d
	pE9bUgirV0/cq1qRAAMOtuD8sUE3Z4WEgtNB8ym1fCfx+hFBxKAwtkJ4UvFQwZnlxtEJLQyDcay5t
	oZ6sxFzOGwO5th/0YALljoBTC0GCOhdTL1fR1wZc/pGqzbsr5sM9GsnqE/9lSbQCThRQKI+ICZXK3
	G9O/dj4EyygcK2suj0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJDd-00000000nQ8-3GqR;
	Tue, 23 Apr 2024 16:42:09 +0000
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:404::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJDC-00000000nAT-0OXx
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 16:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=ce+ZqFlarA8IAt5zfwbr2hxRLFQAtI7f0O/GFL7QRfQ=;
	b=Tw8FQkWzueJByde49pf2Etw1JNd+9Cs/a8VSdP4sAjZamDT998lpGJ8OUSXZPgdnq9YK80Ld79By0
	 E1ZePxzkIVPPM3w68Ti2ki86ZQSTo/Qengh+ox/5EsZdMfGxT/LtyRbZzNkl+eBPCbtoD00qByBVfh
	 QlogVQorbOUCuNhfuDWjsPIOEK757mimusKghDsKCrDlzJS1s6Psw/PaVE8r407gkh53FMLrF7D1dO
	 uDYiPtxot3rmREDV43Zw4JTzOwK/+pqOJcBE6+tKyTzcGurjSzSuf0Roh28MmUDSp64HXkjpWwAEu0
	 fCub6cvUfUdVz3Rx5TFyQR6t2+r0Tlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=ce+ZqFlarA8IAt5zfwbr2hxRLFQAtI7f0O/GFL7QRfQ=;
	b=MCt7cKScu1j54dhTCuf6RoKzDR6Pxv4AhcExl3aouinnY7Cygl2lgVcGjoVORGMB/icOvVzGnLV0S
	 zdG43KuBQ==
X-HalOne-ID: 4e317c2c-0190-11ef-8c96-edf132814434
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 4e317c2c-0190-11ef-8c96-edf132814434;
	Tue, 23 Apr 2024 16:41:22 +0000 (UTC)
Date: Tue, 23 Apr 2024 18:41:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 04/15] sparc: simplify module_alloc()
Message-ID: <20240423164117.GA897977@ravnborg.org>
References: <20240422094436.3625171-1-rppt@kernel.org>
 <20240422094436.3625171-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240422094436.3625171-5-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_094142_437407_AB87E916 
X-CRM114-Status: GOOD (  11.16  )
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

Hi Mike,
On Mon, Apr 22, 2024 at 12:44:25PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Define MODULES_VADDR and MODULES_END as VMALLOC_START and VMALLOC_END
> for 32-bit and reduce module_alloc() to
> 
> 	__vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, ...)
> 
> as with the new defines the allocations becames identical for both 32
> and 64 bits.
> 
> While on it, drop unsed include of <linux/jump_label.h>
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Looks good.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
