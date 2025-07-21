Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAECAC83F25
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 21:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ls1kU9o2YVGosYxcbOUvHxp1W02iB3aLPY+1YHLqMo=; b=S0zhtVexmDzFX2
	l4TlDaEXIN+G2hbTUxW5LpSnEMY4FeS9GWelPqenEUP1UH6FLbs5dgZR5QiegELkViKTxGQBG7eI1
	KhnOXMrKhUaZHXd+8XkQwkJK98jBhDXrghePZ3CI/CE8CS9ZuO/Kg7xyX7Lpjy755QiCjfRSgEGSD
	KSJ9j/VJO1F09ogGeqfMlh+ClEHz+pMI6pN0NCfdm4FH1wtBIyX3vUKTXFQ6C9uxmrTigSp2bP010
	rogTCfZZL5w/to2oipX302sBECR1Ncnp3ccFi45gfTV9YQUVdKk2J6R+tnIYFsTksP68VaFsHiuI6
	Yp4ltflG6AKXBnUoACsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udy3j-00000000jPT-0p9r;
	Mon, 21 Jul 2025 21:28:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udy3g-00000000jP8-2b7s
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 21:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23CAE43F2A;
	Mon, 21 Jul 2025 21:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F59C4CEED;
	Mon, 21 Jul 2025 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753133308;
	bh=Z8+145n3stoZJ1eS9MsnjPvQqiSlyo+W5TQZfHtKrUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PVOh4WwKApPd6X2J5mzxgp8A1Vofa6hw9Z+zz43nWSfXDOjtqhv/CZSMWwa/ZCdle
	 8uHhIs130sO+bjzMOJzk54DYQObGa2jnuuAZebCAEXhInWZS9nhqT/0AwZmoGiN8c2
	 oUt81RyYmIm731on+mES3ZJtZImksoqz2S0GLfs0iJ9xBrg5nYXFGdw2wtZ3Z930Gg
	 hPMOdR+xIB1vlCRlRGwAqoVD2C1Qn1oTtbNdx/4rCeeE0jJLP8hbY6L7OyquJ5EPS7
	 14lz93ETEKwT08+0zVp/ENFWEKNknwbPtVdp2k1+2vLZXFNkiR189jjKc6EXgQaMAL
	 CimI5viN6pofQ==
Date: Mon, 21 Jul 2025 14:28:26 -0700
From: Drew Fustini <fustini@kernel.org>
To: Darius Rad <darius@bluespec.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aH6w+in5tCe42Kvc@x1>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <aH4u_OHqZHZtXjn3@localhost.localdomain>
 <aH6qO3c39gmybwEc@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH6qO3c39gmybwEc@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_142828_681547_9437F219 
X-CRM114-Status: GOOD (  20.22  )
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

On Mon, Jul 21, 2025 at 01:59:39PM -0700, Drew Fustini wrote:
> On Mon, Jul 21, 2025 at 08:13:48AM -0400, Darius Rad wrote:
> > On Fri, Jul 18, 2025 at 08:39:13PM -0700, Drew Fustini wrote:
> > > From: Drew Fustini <dfustini@tenstorrent.com>
> > > 
> > > Clobbering the vector registers can significantly increase system call
> > > latency for some implementations. To mitigate this performance impact, a
> > > policy mechanism is provided to administrators, distro maintainers, and
> > > developers to control vector state discard in the form of a sysctl knob:
> > > 
> > > /proc/sys/abi/riscv_v_vstate_discard
> > > 
> > > Valid values are:
> > > 
> > > 0: Do not discard vector state during syscall
> > > 1: Discard vector state during syscall
> > > 
> > 
> > Is the intention for this this mean "don't guarantee vector state is
> > clobbered" or "preserve vector state"?  I suspect it is the former, but the
> > wording seems unclear.  Additionally, if that's indeed the case, maybe the
> > documentation should more clearly articulate the tradeoff (performance vs.
> > security/robustness).
> 
> Thanks for your comment. I agree it could be worded better and the trade
> off should be explained. I believe the motivation behind clobbering in
> all syscalls was to make sure that userspace does not rely on the vector
> being preserved through a syscall. The goal of this strictness was to
> catch any programs that were misbehaving.
> 
> Thus, it might be better if I described it as:
> 
> 0: Vector state is not strictly clobbered in all syscalls
> 1: Mandatory clobbering of vector state in all syscalls

Darius - sorry, I seem to have failed to put you in the To: field of my
reply.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
