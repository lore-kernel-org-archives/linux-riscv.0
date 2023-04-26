Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9D3C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQYkr26PCuVlzcomrz93yXriOoAe60ujlHRQqeITFHo=; b=jt4bLi+RX7sZlz
	zw3xFPww1K1GwLRdA9P4t73HyxSR4oZMJNGLIJx7BJNDJf6BqPPBy9WE0uGSeSVCd32LyuO2MbSOw
	Zc7qfyhby0IwFWtSukxJnAyELJc7aPpTo1+ZcXYNKepx+qAVvrnP1h89n/u7jX5D+JaFCnsYMnwsK
	WXxATePoxmzotIckd9qVpJ7ZiQ2lAQzURSr3UhD2K0+6xSeTH/J/0rZUv3knxMicSgO9qcJ7zBXbh
	6NOHbbwtV3cyz/wXzOWQ/epxWdRa58InCjUOKsvhiStGQbesL6xopFE4+GvAUJkedvijRa7z345rR
	pAUzxNrQXMZ46OsJGKFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1praJh-0038tu-1v;
	Wed, 26 Apr 2023 08:15:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1praJe-0038sB-0u;
	Wed, 26 Apr 2023 08:15:55 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682496949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7cSCpTFBU6gtNFDDvX9BBXJHGwRYvRyuVYMZSUvskg=;
	b=puMJndFvZk2DjG2oGhTaaANtFluqIT71fJ8veXKWgaKYEc7ZaIibudafgbLM64wYizw2Y+
	OXOoExk0mzZdwI+qZRCbqqN29gJr4bx9hGMM4FqEkCO4H6WN381K3f/yJnQUdMhiDoudkE
	v7q+YkKqQYiLDFXvBw9Q1TAKdQtU3EOXylf0wOjoPixyD8dhvyM5BYTWe0qo092Dn58dWD
	wK5mQfTO6pClT3oj6wx4w2PqZTUsjxsf5TLo5xJWNv/gc/U3RQVFJKGrWcJS7Q1p/NUtUU
	aUWCZ+sybUxpx87tAuGvu76aAkAfxwkf6VweEiexDbnjkrDzfgfAwBP2nQkz6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682496949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7cSCpTFBU6gtNFDDvX9BBXJHGwRYvRyuVYMZSUvskg=;
	b=4JTA5ZSC1xgsH2IPcOsiykb/g/HrD1bcjGUJcIN8iOa9ku/bVlaHwu78ldM0LGCo2BtXJa
	9xfjqD5Ed8VSHzCw==
To: Mark Rutland <mark.rutland@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 22/37] arm64: smp: Switch to hotplug core state
 synchronization
In-Reply-To: <ZEjZ3pHjQWn4drs8@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de> <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
 <87ttx3zqof.ffs@tglx> <ZEjZ3pHjQWn4drs8@FVFF77S0Q05N>
Date: Wed, 26 Apr 2023 10:15:48 +0200
Message-ID: <87ildjys7f.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_011554_468218_D4E64F5E 
X-CRM114-Status: GOOD (  14.36  )
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

On Wed, Apr 26 2023 at 08:59, Mark Rutland wrote:
> On Tue, Apr 25, 2023 at 09:51:12PM +0200, Thomas Gleixner wrote:
>> If not then it's just yet another way of DoS which is an "acceptable"
>> attack as it only affects availability but not confidentiality.
>
> Sure.
>
> My thinking is that this is an attack against the *integrity* of the guest
> (since the vCPU that gets unpasued may write to memory), and so it's
> potentially more than just a DoS.
>
> I only mention this because I'd like to account for that on arm64, and if other
> architectures also wanted to handle that it might make sense to have some
> common infrastructure to track whether CPUs are potentially still within the
> kernel.

Fair enough.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
