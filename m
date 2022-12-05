Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62175C4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 09:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJcK0+OMvo3srDLtuJKn5gdEyZU7+Yi2+Ad4P8bo5cI=; b=VLs7I3/Ft89cH/
	/d6Q0XYF8Mk4ze2AJHuUo+pzfTrNXCHavxu9eWtS+PjuNbg+n+o0wkv/OUpou63sBZI66N024FzTM
	iz9Zy1ml4eNYtbumaPLU1w35acKatHR68mnMzaiOffXd8B9LBP13dBFld7us/qFYhfrqRSLT8KYxM
	+2vFQpNcLr3gEu4qeeN5nx5ENHF68Ilhh7JM21ueHA8p495hO1aoG3M5+FH/cAYNee+RVsjvt/aob
	hxPMmrRO+IkC2YNpldtzv4f1Ks7P3RxbYzDsKOge1OJg9k7oAl0pKQdvZg4/WOgHwWqqzU1n4pide
	5s8zncd+tsxeq87jHNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27cQ-00GvTP-75; Mon, 05 Dec 2022 09:18:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27cM-00GvRe-HL
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 09:18:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9DB6B80D8B;
	Mon,  5 Dec 2022 09:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329F1C433D7;
	Mon,  5 Dec 2022 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670231907;
	bh=De2KVlqjeBbR7VemazKGpJfXUbvbA/TDtgMxqbod7hE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FEQscB+Az2Snk7BVIQ71HFPDRkBV9BNE0hkMcTY8XNkWaLv1Wcqx90DRk4kmUnnzm
	 GWeJG7Q8Lw4HDXQmmXvXCPseb4C0MCssXCFCWfeHHex6G2UgZdSPlrBZe9g1sOVS6W
	 66Oae5Dlqv+sNjGfEq1NAxAt7m0FxT19FiuQ0X+aX47w116VUICF1hJP6pKZHUSQm4
	 fPdL5WUu5ACgYNqvT8p3Uoek4EIj881YpP8Sewk+YdO40SUZB9nyHCgNI0xZ0yQCfN
	 T8QUrA/C9tZ5FqnVI5x2DCp5ilSGdAKGcamlA76dv4If48/ikUsLZb6gZAvl9lHg0q
	 9YEu2G/XO8s8A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V8 10/14] riscv: Typo fixup for addi -> andi in
 comment
In-Reply-To: <20221103075047.1634923-11-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
 <20221103075047.1634923-11-guoren@kernel.org>
Date: Mon, 05 Dec 2022 10:18:25 +0100
Message-ID: <87edte9pjy.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_011830_727377_ECC2FD3C 
X-CRM114-Status: GOOD (  14.16  )
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

guoren@kernel.org writes:

> From: Guo Ren <guoren@linux.alibaba.com>
>
> Correct typo for addi -> andi in comment, although the immediate[11:0]
> are the same.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/kernel/entry.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 9864e784d6a6..03655577e26f 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -138,7 +138,7 @@ ENTRY(ret_from_exception)
>  	REG_L s0, PT_STATUS(sp)
>  
>  #ifdef CONFIG_RISCV_M_MODE
> -	/* the MPP value is too large to be used as an immediate arg for addi */
> +	/* the MPP value is too large to be used as an immediate arg for andi */
>  	li t0, SR_MPP
>  	and s0, s0, t0
>  #else
> -- 
> 2.36.1

This doesn't belong in the series. Please do this as a separate fix,
which a Fixes tag.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
