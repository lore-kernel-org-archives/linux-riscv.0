Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B14C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koBi5XozgZhxgxed1FgFISrBGEyZloJIdqkmiMynd+E=; b=0TEPujJhnlWb5K
	AbPwey+QGCTAe6HwPJu0vXJLEGxJcKLBINe6AL0Mb4yb1EjgpoOt14xMmL2GwAiqGs8JgUpnEXnME
	W9KVENtuN7MLovyetnal3P6WFBq2L/uDMgEx1KAGatEK6RN/urYygBBOAw9sJ32rNvwF25n0PTcie
	SNXu97jjUMl1wkemgaK9a+OT3DeVY1z/CVgWtSXgCNpGNH3aVjBPEr04ZI0hz0J+SWem2ZM+lgN7G
	GAAPDWKvQhCKRRwW7XJXtFTIB0OtWd+wh+IX/bOKEbeHg3yNHWszERE/1N0qOM1ln1bPcFSP+Mnhl
	maAkTm1n6n/nYutl+3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPlZ-003CAK-0N;
	Mon, 30 Oct 2023 10:45:05 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxPlV-003C9K-1E
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 10:45:02 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 436A421CAD;
	Mon, 30 Oct 2023 10:44:56 +0000 (UTC)
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id CA894A3E05;
	Mon, 30 Oct 2023 10:44:55 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 07E224A0396; Mon, 30 Oct 2023 11:44:56 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: linux-riscv@lists.infradead.org,  palmer@dabbelt.com,
  paul.walmsley@sifive.com,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
In-Reply-To: <20210419005539.22729-6-mick@ics.forth.gr> (Nick Kossifidis's
	message of "Mon, 19 Apr 2021 03:55:39 +0300")
References: <20210419005539.22729-1-mick@ics.forth.gr>
	<20210419005539.22729-6-mick@ics.forth.gr>
X-Yow: Four thousand different MAGNATES, MOGULS & NABOBS are romping in my
 gothic solarium!!
Date: Mon, 30 Oct 2023 11:44:56 +0100
Message-ID: <mvmjzr475jr.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=none;
	spf=softfail (smtp-out1.suse.de: 149.44.160.134 is neither permitted nor denied by domain of schwab@suse.de) smtp.mailfrom=schwab@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [0.49 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(0.20)[suse.de];
	 R_SPF_SOFTFAIL(0.60)[~all:c];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RWL_MAILSPIKE_GOOD(0.00)[149.44.160.134:from];
	 VIOLATED_DIRECT_SPF(3.50)[];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(0.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.00)[17.22%]
X-Rspamd-Queue-Id: 436A421CAD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_034501_585852_FE4BB0C0 
X-CRM114-Status: GOOD (  11.75  )
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

On Apr 19 2021, Nick Kossifidis wrote:

> @@ -605,6 +606,18 @@ static void __init reserve_crashkernel(void)
>  
>  	int ret = 0;
>  
> +	/*
> +	 * Don't reserve a region for a crash kernel on a crash kernel
> +	 * since it doesn't make much sense and we have limited memory
> +	 * resources.
> +	 */
> +#ifdef CONFIG_CRASH_DUMP
> +	if (is_kdump_kernel()) {
> +		pr_info("crashkernel: ignoring reservation request\n");
> +		return;
> +	}
> +#endif
> +

Why is this necessary?  It breaks
https://github.com/openSUSE/kdump/tree/master/calibrate which wants to
run the kernel with both elfcorehdr and crashkernel.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
