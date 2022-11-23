Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD16FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyXnGrlQ8d6j3d7W8UxCIsiW/0fGStEk6vjAurQ1LF0=; b=qUBkpWgdjEpDz4
	Ji1gKqGhqaDGE9FSkxRbv+a6WfwJLk2ltoKNBnr4k1UFrIl3DkCLiT/+PaVOxunm1FFFq17SZeRne
	iwnTBOJcLNcAucznBy0GOsR/Vwn7L5FimaLihcmYHJqXwqh2iRf4fBylwpESu+XJ40zFmSVA7Vy3z
	2TiJb1WBaHyDQyfNEOB+66R1ncaxw1rMvkxJNSN95xUPRbbn9AJIP5kvmAjOF37HMs/HgjMsG6LLo
	lsT+G8KBe+bQVhLGLCtqFmX1d5QFVgngcu15+xgDjrT47UFfX9zzUU9HiuWYP+HXLJeLKu2VdgrFF
	ASxgvsXwKgVEtj2aqxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxvvc-00277u-Ou; Wed, 23 Nov 2022 20:01:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxvvX-00276A-I8
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 20:01:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E3B1761EF3;
	Wed, 23 Nov 2022 20:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA3EC433D6;
	Wed, 23 Nov 2022 20:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669233657;
	bh=SMv7mBGrmySfdDPu0Z8LvdKwa3iMqVR3fH69IYs0FVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENbHOwN+5CRk8k1YeGHHM6lui96My9Wil9Rn0SFp3B1g2Igt7FNhOtL1PwgWtcOkS
	 A1SL586WYc1cxdxIibu5vlSGRjjYS71cNZQccrdsjVlRtaDoxdFy6Jxa5aGazcL9pA
	 qXqBZHq3Svqk6l8ITDVNL+ZZ4Kww3PKXrOkYrEbxFBEXeBo4ETFlrgEtnlLgaMTyxl
	 ptyoIHt4p4X++NMxjteDgZDqBIFnLis21u/JnfY9PcMvJpwxV095qMVDBcyQgoD+w3
	 lDzCnapyhPwA1kyA8Gzo8ms40nvpS9QDBi595D9sPoh2bw5rXkihpWGIyUXmbEXVIK
	 WDfp4CYpWjbUA==
Date: Wed, 23 Nov 2022 20:00:51 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de, rostedt@goodmis.org,
	mhiramat@kernel.org, jolsa@redhat.com, bp@suse.de,
	jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V3 3/5] riscv: ftrace: Reduce the detour code size to half
Message-ID: <Y35783GmAtJ+JuGW@spud>
References: <20221123153950.2911981-1-guoren@kernel.org>
 <20221123153950.2911981-4-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221123153950.2911981-4-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_120059_658616_FE85D144 
X-CRM114-Status: GOOD (  10.96  )
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

On Wed, Nov 23, 2022 at 10:39:48AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Use a temporary register to reduce the size of detour code from
> 16 bytes to 8 bytes. The previous implementation is from
> afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of
> MCOUNT").
> 
> Before the patch:
> <func_prolog>:
>  0: REG_S  ra, -SZREG(sp)
>  4: auipc  ra, ?
>  8: jalr   ?(ra)
> 12: REG_L  ra, -SZREG(sp)
>  (func_boddy)
> 
> After the patch:
> <func_prolog>:
>  0: auipc  t0, ?
>  4: jalr   t0, ?(t0)
>  (func_boddy)
> 
> Link: https://lore.kernel.org/linux-riscv/20221122075440.1165172-1-suagrfillet@gmail.com/
> Co-developed-by: Song Shuai <suagrfillet@gmail.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

FYI missing a sign-off from Song Shuai. They were happy with you folding
their patch in during the discussion linked above - so I suppose that is
an accidental omission?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
