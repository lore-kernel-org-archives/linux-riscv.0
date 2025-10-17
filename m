Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FB7CCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 10:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aP6ruwMqtaLQp75VdpUaCzuZojXR/N3oWlhgmaX+dos=; b=i3PxLcV8vaxfyk
	hIoQa6aXW1wDPC97xwl4NeSRmy5sUR0UKdvsAB7GnYN7ZU77EoZRzrL5tXwoQiU9XoVhQg5qg0CBd
	CxcJeLr5d/PkXwqBLcZY9Yq0Qw7oOmNO34PSWZs0Y7uFG36as5j4+ZH4Rneo/7+y7g5jxCAglruck
	7qpPGqzdZBrwd2M4B9K4+1uvcINvCBYLewXBJFxb7RQxfF8mhR/A59xqtrnnuaBP1PC5+Ilt/eD8R
	4kUNMMTmnzI2pQFpOba2rBdUxbRai2oF5JptTimHsGLgtxpekXHrv34FAQLhrC/pIuZ7Oty22AXtq
	iAgsQOEcwZOX5Mqlw+Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hoj-00000007Xyc-0BDX;
	Fri, 17 Oct 2025 10:36:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hoh-00000007XxH-2aXK;
	Fri, 17 Oct 2025 10:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0hEYjK4XGVjCrvoOJeg0ZEh8+ica9r/qK/NZKGu0EA4=; b=fWi1v8hNQkssTp7wPTCPBDiNCW
	tjfosPU8LE2dZl3bBZZN83/L6douPhSRNHcYuF//L/0kQ6A3xLfHaa9fw9YSKULC9TDbDeBzFd5QT
	o5Y82LuzrMqrLzagAtt7nAxLS5vsJ06A9OcTR+2If2BEi6ybOAste9RRdfttxtW/w32Vs6JeNYEA9
	OfmnYJcY3uH2+LkO4EeXq9GrtctUlvK8lELPMnbD2ITa7k/xEDDTaGg4sB1quZswTO2o5KohK6S8z
	XGmg8eH28de1pujpSKSj+enhHUebEceGs0B++WfyKTTQuwVClbwH0B4LxCPim6iwiepl0M2k279wY
	LdnPU2uA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hoR-00000007TnX-3lDP;
	Fri, 17 Oct 2025 10:36:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E92A630023C; Fri, 17 Oct 2025 12:35:54 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:35:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Subject: Re: [patch V3 12/12] select: Convert to scoped masked user access
Message-ID: <20251017103554.GY4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.570048808@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017093030.570048808@linutronix.de>
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

On Fri, Oct 17, 2025 at 12:09:18PM +0200, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Replace the open coded implementation with the scoped masked user access
> guard.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: linux-fsdevel@vger.kernel.org
> ---
> V3: Adopt to scope changes
> ---
>  fs/select.c |   12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> ---
> --- a/fs/select.c
> +++ b/fs/select.c
> @@ -776,17 +776,13 @@ static inline int get_sigset_argpack(str
>  {
>  	// the path is hot enough for overhead of copy_from_user() to matter
>  	if (from) {
> -		if (can_do_masked_user_access())
> -			from = masked_user_access_begin(from);
> -		else if (!user_read_access_begin(from, sizeof(*from)))
> -			return -EFAULT;
> -		unsafe_get_user(to->p, &from->p, Efault);
> -		unsafe_get_user(to->size, &from->size, Efault);
> -		user_read_access_end();
> +		scoped_masked_user_rw_access(from, Efault) {

Should this not be: scoped_masked_user_read_access() ?

> +			unsafe_get_user(to->p, &from->p, Efault);
> +			unsafe_get_user(to->size, &from->size, Efault);
> +		}
>  	}
>  	return 0;
>  Efault:
> -	user_read_access_end();
>  	return -EFAULT;
>  }
>  
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
