Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F75C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQw4sGOymtpZMltkFBYQMYSzX25ao73OPjqFFSAvPI0=; b=rw94EwCZV2S32E
	uWSqC/I6lwIVBKhJdIjwFvcsq6FiLjqm1Gfl/4mvqA3UjXyFVsitE7n+eVJn7CC0MSg3rJ0FskWwZ
	UUd5aIQnaDTM2l7e+P0X99Cq8sEPE8Ccd1Nc9bjC6/RcBXx+Q4qqcRryVdiDNB7EXiAhNXmAb9wON
	QA2Y4kcGhaG3OtLbyIQKajG5pEaoe5GSoum15sLfPHHxTTBdH3sQxn4aEAXHAde7jtUe52qM/yL97
	P+k8Prve8yLzHOosrMAKLfzLherBIjkVM6PC2YgAGmfof6cUrTuUJeyYeCqWSukvXMaTC6wvI21ib
	KTafB86yKpO3QmuqbkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwL74-0034w5-1o;
	Tue, 09 May 2023 11:02:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwL72-0034vR-1i;
	Tue, 09 May 2023 11:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JF1V+c3UL+N9ld1zX5rd8Mu0N4lob7gKoBwZz1mVIMw=; b=aql03NPFGAMO5Kl80coujejdq3
	VXWbx83fXzAKkdlxYwSALK8eVIvquLc6Ikp1W0vcqSV2KZFsK0+H7qSrgqzM5hHqyQaI6c6dtK5Bo
	uua/mR63aSWOGyFaB0ob+GKwxTQPCDfzgAhA8c/Y3JJbxMLyT0F0HwllrurWg1mR1JDZsedVWxS9j
	FAK3tthBDoVdkkdMJDLY3MllM6CGIfUH146sLI/18R1vwH5QDSoPiTiUXSiyb2KYPpHMa/vs9cEhb
	BfS09qrwDutlOjjfAgyNrNhgddilyXlvHpPbGL7Qr4vOvio7lk2WWrZ7JrQu/SxY7BUXwYFCQ9zlK
	wcsdOk9g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pwL6v-0066iJ-0M;
	Tue, 09 May 2023 11:02:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2422B300451;
	Tue,  9 May 2023 13:02:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 057BF201DB6CD; Tue,  9 May 2023 13:02:24 +0200 (CEST)
Date: Tue, 9 May 2023 13:02:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
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
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [patch v3 14/36] [patch V2 14/38] cpu/hotplug: Rework sparse_irq
 locking in bringup_cpu()
Message-ID: <20230509110223.GY83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.013044883@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508185218.013044883@linutronix.de>
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

On Mon, May 08, 2023 at 09:43:49PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> There is no harm to hold sparse_irq lock until the upcoming CPU completes
> in cpuhp_online_idle(). This allows to remove cpu_online() synchronization
> from architecture code.

Uuuuuhh.. damn. Can you at the very least ammend the comment near
irq_lock_sparse() to mention these extra duties?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
