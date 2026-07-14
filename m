Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27967C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rIomA8R6d01UK6qCprqmoocaF+z7scxX+5VHXuib20=; b=2LutA3jPcOlUVx
	Xs+zyNIJll5IO/FNVVwUABq0dBGPrQ4Iwn7tDU26HmBf78fJcugkyI89RQoS5fdf3LLhSxa9Pru02
	4pncxfdB5c3XpEfO4LOkEbSJ4gYHDjyVr3IRjGY2lprAK3F9Mzm5LX7T0WADPznwp39jqdRmmsxNL
	oljzc1LQUUBwCpZX9aktBprWQuDUl+0IGdbgGNWs6+si0jqivoEzdRHsHO7VmRTqqoB5b5w89k+D9
	Q4DtQlKbGQynZilMPKy1wUq0LKka0Sqb8Q9BM9qummMgAXr3dGIhjB3PYgKD2UhwMCCkN4k0ynn1t
	eSUIqDuoSfvzgrXUs7Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdIU-0000000CCEQ-3ug8;
	Tue, 14 Jul 2026 13:35:42 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdIQ-0000000CCCL-0oU5
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=rKivqYdmsvZ909y+u8OqNv89Hj7sxQxcLyRiTIC8+WY=; b=XyKn/yqDfuL2vfpcfJb20lskwx
	PkP//ivq5LDNCqYz5w9mgFsqmfJC+jWfG1d7H3yfB4VQXIHbgFBiQhi2F8VvHcxBHjtnc6De1qSCY
	nqNK3GmG8NoSMBFzFy65dIqXyrCxlOmjPCj8KE7QDgsPsTVoBx/U20extH+dp0jv7X3nqO/ORSgg5
	pbq+JxUaALW1cEvVzkpBbPw1YqGZIWje6GVFR+8mlgylIQRm4lvGuD7oGEetCgWTwKT2OBl02et7C
	FLlwvF0AcQPZqxQOjegeHDD9dXJZPtI3URaRwqvAJ9ptY8glLzdf2wvfjatWGEog7vSw6VTarLBq9
	kMfhbPHg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wjdID-0000000056D-08KY;
	Tue, 14 Jul 2026 15:35:25 +0200
Date: Tue, 14 Jul 2026 15:35:24 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Paul Walmsley <pjw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jim Shu <jim.shu@sifive.com>, Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] arch/riscv: vdso: remove CFI landing pad from
 rt_sigreturn
Message-ID: <alY7HFcSYkXh97Vy@aurel32.net>
Mail-Followup-To: Paul Walmsley <pjw@kernel.org>,
	Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jim Shu <jim.shu@sifive.com>, Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
References: <20260623204058.498120-1-aurelien@aurel32.net>
 <fd0c06ce-f842-95cc-c517-7e6fb2c5b2c5@kernel.org>
 <CACPK8XcJZzynnofpLHsPAD6Lbbjf9=soj+nFhU3ey=3yT2056w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8XcJZzynnofpLHsPAD6Lbbjf9=soj+nFhU3ey=3yT2056w@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063538_240454_F332AAC3 
X-CRM114-Status: GOOD (  22.26  )
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

Hi Paul,

On 2026-06-29 17:08, Joel Stanley wrote:
> On Fri, 26 Jun 2026 at 03:33, Paul Walmsley <pjw@kernel.org> wrote:
> >
> > Hi Joel,
> >
> > On Tue, 23 Jun 2026, Aurelien Jarno wrote:
> >
> > > When CONFIG_RISCV_USER_CFI is enabled, the CFI version of the vDSO, has
> > > a CFI landing pad instruction at the start of __vdso_rt_sigreturn. This
> > > breaks libgcc's unwinding code which matches on the first two
> > > instructions. Other unwinders that rely on similar instruction matching
> > > may also be affected.
> > >
> > > Since __vdso_rt_sigreturn is reached as part of signal-return handling
> > > rather than via an indirect call/jump from userspace, it does not need a
> > > CFI landing pad. Remove it and restore the instruction sequence expected
> > > by existing unwinding code.
> > >
> > > This matches what was done on arm64 in commit 9a964285572b ("arm64:
> > > vdso: Don't prefix sigreturn trampoline with a BTI C instruction") for a
> > > similar issue.
> > >
> > > Fixes: 37f57bd3faea ("arch/riscv: compile vdso with landing pad and shadow stack note")
> > > Co-authored-by: Joel Stanley <joel@jms.id.au>
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> >
> > I'd like to take this one.   But since you're listed as the co-author, I
> > probably need your Signed-off-by: as well.  Care to reply with it?
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks Aurelien for working with me on this one. I saw CFI was
> disabled in the debian kernel config and wondered why (failing glibc
> backtrace tests with CFI enabled), and we got to the bottom of it.
> 
> This one should go to stable IMO.

Now that Joel answered with a Signed-off-by, would it be possible to get 
this merged for 7.2?

Thanks
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
