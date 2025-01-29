Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40551C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFgdP1Hdh0cpoSb+GioWimaJMJROW4PXf6ua5Yv+VMM=; b=3rUlA8TIbUvZBx
	//j5jkKilPuODiUk/v9rAMBPHzINeZm5OFOPlzbtXn6lJ57c0DLDagXgknM33OFLbWH0mH6EDcU5/
	+cFHSmuMsDMrCKPEW8Fga4zT/bmfBBd4utFNpP4AWb/58Ur1uwAWzOOegXKGqXmY/1oGvms6fVZAw
	9ZcS3S1mtVuTtJ0Dx5hr5hn0y93xyKr7UUsacaPwNctPgx1A5e7y1+TNnLY2VSpHSGE0Iy9PSTdYE
	3BuEuyByiDIpPkcCFXIYnjc2SP86NMhQ6A8xJMaSvsiuCbT7efPv5bBQsRBlQD4WfCwpIyLsMXBnV
	4rwnhO1gt9r32lO4tlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBjc-00000007TAf-1QLZ;
	Wed, 29 Jan 2025 17:20:16 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBjZ-00000007T8v-45Uw
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 17:20:15 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 19CA11F365;
	Wed, 29 Jan 2025 17:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738171212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8PVjeOTkMBSAcHcY2G8sb0Gayt/prH91RL5Rc6LjVwc=;
	b=tdcLNM04Cqj+90LwHPVXU9pD7aEcIG0dz44MyQoHcPJ1RHkL7YdkQe4sJrCEP5w7EOw6iV
	SjKu9vm7rTmQ0lomV3p/o0Z1sS0rCn84O7m2vRQxISNeeOAkZELuSz4d9ao9W7b+ihn10W
	HBr34EZ9mxmW26uPhIwenHhiw+sXbX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738171212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8PVjeOTkMBSAcHcY2G8sb0Gayt/prH91RL5Rc6LjVwc=;
	b=7NcLMcMH+mw0wonQIjB2h7Ygzbns9AdLEGyOVYKp/gC3mPlgG1PGA6H9bIgtW00RfCNo6u
	tEDcdyzHDLR3/8AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738171212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8PVjeOTkMBSAcHcY2G8sb0Gayt/prH91RL5Rc6LjVwc=;
	b=tdcLNM04Cqj+90LwHPVXU9pD7aEcIG0dz44MyQoHcPJ1RHkL7YdkQe4sJrCEP5w7EOw6iV
	SjKu9vm7rTmQ0lomV3p/o0Z1sS0rCn84O7m2vRQxISNeeOAkZELuSz4d9ao9W7b+ihn10W
	HBr34EZ9mxmW26uPhIwenHhiw+sXbX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738171212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8PVjeOTkMBSAcHcY2G8sb0Gayt/prH91RL5Rc6LjVwc=;
	b=7NcLMcMH+mw0wonQIjB2h7Ygzbns9AdLEGyOVYKp/gC3mPlgG1PGA6H9bIgtW00RfCNo6u
	tEDcdyzHDLR3/8AQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 05E514AAD7B; Wed, 29 Jan 2025 18:20:12 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,  linux-fsdevel@vger.kernel.org
Subject: Re: Multigrain timestamps do not work on RISC-V
In-Reply-To: <mvmv7ty3pd8.fsf@suse.de> (Andreas Schwab's message of "Wed, 29
	Jan 2025 11:07:15 +0100")
References: <mvmv7ty3pd8.fsf@suse.de>
Date: Wed, 29 Jan 2025 18:20:11 +0100
Message-ID: <mvmikpx4jw4.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_THREE(0.00)[3]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_092014_155541_591C88EC 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

On Jan 29 2025, Andreas Schwab wrote:

> My guess would be that something in inode_set_ctime_current is going
> wrong.

The bug is in the arch_cmpxchg macros in <asm/cmpxchg.h>, they mishandle
atomic exchange of u32 values:

    # fs/inode.c:2802: 	if (cns == now.tv_nsec && inode->i_ctime_sec == now.tv_sec) {
    #NO_APP
            ld	a5,-96(s0)		# _33, now.tv_nsec
    # fs/inode.c:2802: 	if (cns == now.tv_nsec && inode->i_ctime_sec == now.tv_sec) {
            slli	a4,s2,32	#, _49, cns
            srli	a4,a4,32	#, _49, _49
    # fs/inode.c:2802: 	if (cns == now.tv_nsec && inode->i_ctime_sec == now.tv_sec) {
            beq	a4,a5,.L1248	#, _49, _33,
    .L1205:
            addi	a3,s1,120	#, __ai_ptr, inode
    .L1221:
    # fs/inode.c:2809: 	if (try_cmpxchg(&inode->i_ctime_nsec, &cur, now.tv_nsec)) {
    #APP
    # 2809 "fs/inode.c" 1
            0:	lr.w a2, 0(a3)	# __ret, *__ai_ptr_20
            bne  a2, a4, 1f	# __ret, _49

Here the unsigned extended value of cur (a4) is compared with the sign
extended value of inode->i_ctime_nsec (a2).  They cannot match if cur
has I_CTIME_QUERIED set (the sign bit).  The lr/sc loop is exited before
the store conditional is executed.

            sc.w.rl a1, a5, 0(a3)	# __rc, _33, *__ai_ptr_20
            bnez a1, 0b	# __rc
            fence rw,rw
    1:

    # 0 "" 2
    #NO_APP
            sext.w	a5,a2	# __ret, __ret

A redundant sign extension of the current contents of inode->i_ctime_nsec.

    # fs/inode.c:2809: 	if (try_cmpxchg(&inode->i_ctime_nsec, &cur, now.tv_nsec)) {
            bne	a5,s2,.L1211	#, __ret, cns,

Here the sign extended value of inode->i_ctime_nsec (a5) is compared
with the sign extended expected value (s2).  They match, and try_cmpxchg
returns true, but the store never happend.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
