Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DFC606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Aonr4NVn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n3RoJ+Z5JgOw6YMGEEYfgEGC935p39RdLruJseKgcvE=; b=Aonr4NVneMHVmaKhKEqeidXWGT
	Fwj3vozPlHz9BE7xC40E6JUlCJ9Kf65AEROruwV1jLMbGP93T07kjwYGdcSEdmfbhEh3hFuW4lduS
	BMQ6EkvqVN4TkkzHvyEGtlsaJ0q869OTvnNsFVCOQubn9nj0tP0g6Vtz19+WQ3yfHDdg7d9VqAXBG
	d+NUDZubOfPh6zSxnR3xPNgY4nTDpLuT3GhiDsAKqRrK6VwOtDLp+cZHILsoTpLcMEXE/C1uR4ZjX
	EquTdHEeUFb2krgSjdbKGZPylWsmxht7ItJRI8kTS1bQ+eOSH2fo9BsXiSfehr3wdEVYLAN46SPq0
	341GuwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjIk-00000003UZq-1cUK;
	Tue, 10 Nov 2026 10:42:06 +0000
Received: from sym.noone.org ([2a01:4f8:120:4161::3] helo=sym2.noone.org)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjIh-00000003UUl-1GJZ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 10:42:05 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
	id 4jP39w3B5Pz2Ftnl; Tue, 10 Nov 2026 11:41:56 +0100 (CET)
Date: Tue, 10 Nov 2026 11:41:56 +0100
From: Tobias Klauser <tklauser@distanz.ch>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH] riscv: cfi: Bounds check restore token in
 create_rstor_token() before swap
Message-ID: <20261110104155.ie7gs7ahbj4qbxyi@distanz.ch>
References: <20261103132003.24312-1-tklauser@distanz.ch>
 <4ff91002-8a51-4542-8d55-1ff68cd1f684@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ff91002-8a51-4542-8d55-1ff68cd1f684@sifive.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_024203_509885_9DA9A6E1 
X-CRM114-Status: GOOD (  19.94  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-05 at 16:42:25 +0100, Samuel Holland <samuel.holland@sifive.com> wrote:
> On 2026-11-03 7:20 AM, Tobias Klauser wrote:
> > create_rstor_token() computes addr and passes it to amo_user_shstk(),
> > which executes ssamoswap.d on it under __enable_user_access() without
> > ever validating that addr is a legitimate user-space address. The
> > sibling function restore_user_shstk() had the same issue and was fixed
> > by commit df333b72c0e1 ("riscv: cfi: Bounds check restore token before
> > swap").
> > 
> > Fixes: c70772afd5cc ("riscv/mm: Implement map_shadow_stack() syscall")
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >  arch/riscv/kernel/usercfi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
> > index 86141e5bab82..7971a98ca0c3 100644
> > --- a/arch/riscv/kernel/usercfi.c
> > +++ b/arch/riscv/kernel/usercfi.c
> > @@ -158,6 +158,9 @@ static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
> >  	/* On RISC-V we're constructing token to be function of address itself */
> >  	addr = ssp - SHSTK_ENTRY_SIZE;
> >  
> > +	if (!access_ok((unsigned long __user *)addr, SHSTK_ENTRY_SIZE))
> > +		return -EFAULT;
> > +
> 
> Ah, this is necessary because user_shdw_stk is not trusted; in save_user_shstk()
> it is the user ssp CSR value set via TASK_TI_USER_SSP in entry.S. I had missed
> this earlier.
> 
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> 
> Though since it turns out both callers of amo_user_shstk() need this check, it
> could make sense to move it there to deduplicate it.

Thanks, that makes sense. I'll move it to amo_user_shstk in a v2 as suggested.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
