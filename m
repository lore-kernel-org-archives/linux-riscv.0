Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0EDEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAvRWm9kDDpZHZmY1REr2WKm7yGTB667rKAVqodjbYY=; b=MnEG0HGn2xmO6j
	bJLFy6FWqd8mqSRxuZjz/TJOeNyAYyYHh4QKSERjB9oK9ZPQP1bwEQhMrswNVp3zKSzHQFu8CNjN0
	4vIbkf9KVT1b+9gtPz5Yw88JmYme1Bt/dU8zYA6+y3712oWBILIJN7wIK/tCfSyXuVQzaKWGm2KTl
	qxLi0gAxRbQ1EGW1Y5zf5qHpcCwkV/57R+DnDeWuKMfovxgG5lT2FQBCfpglzIm/T8n5cgcyp3okT
	v2KqW6gvu3sPUlyuH6Hj04iIxDf4+zdCq1bISOSfxgO4TAG2M4nGC7oXDqyy99cqSed1SYIav3J31
	8gq7CilsqN400Q3Ef+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1VT-0064sY-0A;
	Wed, 19 Jul 2023 07:21:55 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1VQ-0064rR-11
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 07:21:53 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id C4C6D1F8BF;
	Wed, 19 Jul 2023 07:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689751306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hONm7Ls/e2QRNpgmgKsoRqqEthuvFVO93IbQBRvgv9E=;
	b=vON1rA7MNMPoAvcVN8XrUGucsMdIblZ14wP5bnlBdDYDP5NlTVh0nX0NcxwJWhcEVo6Dkd
	TlP79NH4jZ8qUCTadE8zjpMR3spSVY5//fKwBX2U8t6jx+MlI4LK9SGXamfVgIGi+gD1+G
	gnHrE3dPf6qDI9hNL4ofmlwn7ZSkvT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689751306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hONm7Ls/e2QRNpgmgKsoRqqEthuvFVO93IbQBRvgv9E=;
	b=qftf+9G9cWwBYSlw4Umga0Mpci0c8TLY/8CbzPxBiFYzKjqwcAyVYHfPkYL9bfTOkLMq07
	C49uYvWWthH9ohCg==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id DCB532C142;
	Wed, 19 Jul 2023 07:21:43 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id BEAAF4A09FF; Wed, 19 Jul 2023 09:21:43 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Guo Ren
 <guoren@kernel.org>,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,  Conor Dooley
 <conor.dooley@microchip.com>,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Felix Yan <felixonmars@archlinux.org>,
  Ruizhe Pan <c141028@gmail.com>,  Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: Re: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
In-Reply-To: <20230718210037.250665-1-CoelacanthusHex@gmail.com> (Celeste
	Liu's message of "Wed, 19 Jul 2023 04:57:30 +0800")
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
X-Yow: I'm receiving a coded message from EUBIE BLAKE!!
Date: Wed, 19 Jul 2023 09:21:43 +0200
Message-ID: <mvmo7k8cqns.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_002152_505889_3F43D5CB 
X-CRM114-Status: UNSURE (   6.79  )
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

On Jul 19 2023, Celeste Liu wrote:

> @@ -308,7 +312,7 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
>  
>  		if (syscall < NR_syscalls)
>  			syscall_handler(regs, syscall);
> -		else
> +		else if ((long)syscall != -1L)

You can also use syscall != -1UL or even syscall != -1.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
